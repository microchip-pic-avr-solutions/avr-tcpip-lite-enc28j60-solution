/**
 * TCP Server Demo Application Source File
 * 
 * @file tcp_server_demo.c
 * 
 * @ingroup tcpserverdemo
 * 
 * @brief TCP server demonstration implementation.
 * 
 * @version TCP Server Demo Application Version 5.0.0
 */

/*
© [2023] Microchip Technology Inc. and its subsidiaries.

	Subject to your compliance with these terms, you may use Microchip
	software and any derivatives exclusively with Microchip products.
	You are responsible for complying with 3rd party license terms
	applicable to your use of 3rd party software (including open source
	software) that may accompany Microchip software. SOFTWARE IS "AS IS".
	NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
	SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, 
	MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
	WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
	INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
	KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
	MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
	FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S 
	TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
	EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
	THIS SOFTWARE.
*/

// Included files
#include <stdio.h>
#include <string.h>
#include "../../mcc_generated_files/system/system.h"
#include "../../mcc_generated_files/tcpiplite/tcpv4.h"
#include "../../mcc_generated_files/tcpiplite/ipv4.h"
#include "../../mcc_generated_files/tcpiplite/tcpip_config.h"
#include "../tcp_server_demo.h"

// Functions
void TCP_Demo_Echo_Server(void)
{
    // Socket for the TCP Server
    static tcpTCB_t portXTCB;

    // TX and RX Server's buffers
    static uint8_t rxdataPortX[20];
    static uint8_t txdataPortX[20];

    uint16_t rxLen, txLen, i;
    socketState_t socket_state;

    socket_state = TCP_SocketPoll(&portXTCB);

    switch (socket_state)
    {
        case NOT_A_SOCKET:

            // Inserting and Initializing the socket
            TCP_SocketInit(&portXTCB);
            break;

        case SOCKET_CLOSED:

            // Configuring the local port
            TCP_Bind(&portXTCB, 7);
            // Adding receive buffer
            TCP_InsertRxBuffer(&portXTCB, rxdataPortX, sizeof(rxdataPortX));
            // Starting the TCP server: Listen on port
            TCP_Listen(&portXTCB);
            break;

        case SOCKET_CONNECTED:
            // Checking if the buffer was sent, if yes we can send another buffer
            if (TCP_SendDone(&portXTCB))
            {
                // Checking to see if there are any received data
                rxLen = (uint16_t)TCP_GetRxLength(&portXTCB);
                if (rxLen > 0)
                {
                    rxLen = (uint16_t)TCP_GetReceivedData(&portXTCB);
                    // Simulating buffer processing
                    for (i = 0; i < rxLen; i++)
                    {
                        txdataPortX[i] = rxdataPortX[i];
                    }
                    // Reusing the RX buffer
                    TCP_InsertRxBuffer(&portXTCB, rxdataPortX, sizeof(rxdataPortX));
                    txLen = rxLen;
                    // Sending data back to the source
                    TCP_Send(&portXTCB, txdataPortX, txLen);
                }
            }
            break;

        case SOCKET_CLOSING:
            TCP_SocketRemove(&portXTCB);
            break;

        default:
            break;
    }
}