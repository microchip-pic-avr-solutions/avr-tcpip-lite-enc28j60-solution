/**
 * TCP Client Demo Application Source File
 *
 * @file tcp_client_demo.c
 *
 * @ingroup tcpclientdemo
 *
 * @brief TCP client demonstration implementation.
 *
 * @version TCP Client Demo Application Version 5.0.0
 */

/*
	© [2023] Microchip Technology Inc. and its subsidiaries

	Subject to your compliance with these terms, you may use Microchip software and any derivatives 
	exclusively with Microchip products. You are responsible for complying with 3rd party license terms 
	applicable to your use of 3rd party software (including open source software) that may accompany 
	Microchip software. SOFTWARE IS “AS IS.” NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR 
	STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-
	INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
	WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR 
	CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED 
	TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE 
	POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY 
	LAW, MICROCHIP’S TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
	EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
	*/

// Included files
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "../../mcc_generated_files/system/system.h"
#include "../../mcc_generated_files/tcpiplite/tcpv4.h"
#include "../../mcc_generated_files/tcpiplite/ipv4.h"
#include "../../mcc_generated_files/tcpiplite/tcpip_config.h"
#include "../../mcc_generated_files/tcpiplite/tcpip_types.h"
#include "../tcp_client_demo.h"

sockaddr_in4_t remoteSocket;

// Functions
void TCP_Client_Initialize()
{
    // Initialize the server IP address with your PC's IP address
    remoteSocket.addr.s_addr = MAKE_IPV4_ADDRESS(10,14,5,127);
    remoteSocket.port = 65534;
}

void TCP_Demo_Client(void)
{
    // Socket for the TCP Client
    static tcpTCB_t portXyzTCB;

    // Create the TX and RX Client's buffers
    static uint8_t rxdataPort65534[50];
    static uint8_t txdataPort65534[80];
    static time_t t_client;
    static time_t socketTimeout;
    uint16_t rx_len;
    socketState_t socketState;
    rx_len = 0;

    socketState = TCP_SocketPoll(&portXyzTCB);

    time(&t_client);

    switch (socketState)
    {
    case NOT_A_SOCKET:
        // Inserting and Initializing the socket
        TCP_SocketInit(&portXyzTCB);

        break;
    case SOCKET_CLOSED:
        // Trying to connect again if the socket is closed
        socketTimeout = t_client + 2; // Trying to connect once at 2 seconds
        TCP_InsertRxBuffer(&portXyzTCB, rxdataPort65534, sizeof(rxdataPort65534));

        // Connect to the Server
        TCP_Connect(&portXyzTCB, &remoteSocket);

        break;
    case SOCKET_IN_PROGRESS:
        // Trying to connect again if the socket is closed
        if (t_client >= socketTimeout)
        {
            TCP_Close(&portXyzTCB);
        }
        break;
    case SOCKET_CONNECTED:
        // Implement an echo client over TCP
        // Check if the previous buffer was sent
        if (TCP_SendDone(&portXyzTCB))
        {
            rx_len = (uint16_t)TCP_GetReceivedData(&portXyzTCB);
            // Handle the incoming data
            if (rx_len > 0)
            {
                // Check for "led x on/off" command
                if (rx_len > 16)
                {
                    rxdataPort65534[16] = 0;
                }
                else
                {
                    rxdataPort65534[rx_len] = 0;
                }

                if (rxdataPort65534[0] == 'l' && rxdataPort65534[1] == 'e' && rxdataPort65534[2] == 'd')
                {
                    if (rxdataPort65534[6] == 'o' && rxdataPort65534[7] == 'n')
                    {
                        if (rxdataPort65534[4] == '0')
                        {
                            LED0_SetHigh();
                        }
                    }
                    else
                    {
                        if (rxdataPort65534[6] == 'o' && rxdataPort65534[7] == 'f' && rxdataPort65534[8] == 'f')
                        {
                            if (rxdataPort65534[4] == '0')
                            {
                                LED0_SetLow();
                            }
                        }
                    }
                }
                // Reuse the RX buffer
                TCP_InsertRxBuffer(&portXyzTCB, rxdataPort65534, sizeof(rxdataPort65534));
            }

            if (t_client >= socketTimeout)
            {
                // Send board status message only once at 2 seconds
                socketTimeout = t_client + 2;
                sprintf(txdataPort65534, "LED0 state: %d\n", LED0_GetValue());
                // Send data back to the source
                TCP_Send(&portXyzTCB, txdataPort65534, strlen(txdataPort65534));
            }
        }
        break;
    case SOCKET_CLOSING:
        TCP_SocketRemove(&portXyzTCB);
        break;
    default:
        break;
    }
}