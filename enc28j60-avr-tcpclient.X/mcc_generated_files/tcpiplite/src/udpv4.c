/**
 * UDP Protocol v4 Source File
 *
 * @file udpv4.c
 * 
 * @ingroup udp
 * 
 * @brief This file provides the API implementation for the User Datagram Protocol version 4 (UDP v4). 
 *
 * @version TCP/IP Lite Driver Version 5.0.0
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

// Included Files
#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>
#include "../ipv4.h"
#include "../udpv4.h"
#include "../udpv4_port_handler_table.h"
#include "../network.h"
#include "../../ethernet/physical_layer_interface.h"
#include "../tcpip_types.h"

// Variables
uint16_t destPort;
udpHeader_t udpHeader;

// UDP Library Functions
error_msg UDP_Start(uint32_t destIP, uint16_t srcPort, uint16_t dstPort)
{
     // Start a UDP Packet to Write UDP Header
    error_msg ret = ERROR;

    // Start IPv4 Packet to Write IPv4 Header
    ret = IPv4_Start(destIP,UDP_TCPIP);
    if(ret == SUCCESS)
    {
        //Start to Count the UDP payload length Bytes
        ETH_ResetByteCount();

        // Write UDP Source Port
        ETH_Write16(srcPort);

        //Write UDP Destination Port
        ETH_Write16(dstPort);

        //Write DataLength; Initially set to '0'
        ETH_Write16(0);

        //Write UDP Checksum; Initially set to '0'
        ETH_Write16(0);

    }
    return ret;
}

error_msg UDP_Send(void)
{
    uint16_t udpLength;
    uint16_t cksm;
    error_msg ret = ERROR;

    udpLength = ETH_GetByteCount();
    udpLength = ntohs(udpLength);
    ETH_Insert((char *)&udpLength, 2, sizeof(ethernetFrame_t) + sizeof(ipv4Header_t) + offsetof(udpHeader_t,length));
    udpLength = htons(udpLength);
    
    // add the UDP header checksum
    cksm = udpLength + UDP_TCPIP;
    cksm = ETH_TxComputeChecksum(sizeof(ethernetFrame_t) + sizeof(ipv4Header_t) - 8, udpLength + 8, cksm);

    // if the computed checksum is "0" set it to 0xFFFF
    if (cksm == 0){
        cksm = 0xffff;
    }
    ETH_Insert((char *)&cksm, 2, sizeof(ethernetFrame_t) + sizeof(ipv4Header_t) + offsetof(udpHeader_t,checksum));

    ret = IPV4_Send(udpLength);

    return ret;
}

error_msg UDP_Receive(uint16_t udpcksm)
{
    error_msg ret = ERROR;
    udp_table_iterator_t  hptr;

    ETH_ReadBlock((char *)&udpHeader,sizeof(udpHeader));

    if((udpHeader.checksum == 0) || (udpcksm == 0))
    {
        udpHeader.dstPort = ntohs(udpHeader.dstPort); // reverse the port number
        destPort = ntohs(udpHeader.srcPort);
        udpHeader.length = ntohs(udpHeader.length);
        ret = PORT_NOT_AVAILABLE;
        // scan the udp port handlers and find a match.
        // call the port handler callback on a match
        hptr = udp_table_getIterator();
        
        while(hptr != NULL)
        {
            if(hptr->portNumber == udpHeader.dstPort)
            {          
                if(udpHeader.length == IPV4_GetDatagramLength())
                {
                    hptr->callBack((int16_t)(udpHeader.length - sizeof(udpHeader)));
                }
                ret = SUCCESS;
                break;
            }
            hptr = udp_table_nextEntry(hptr);
        }
        if(ret== PORT_NOT_AVAILABLE)
        {
        }
    }
    else
    {
        ret = UDP_CHECKSUM_FAILS;
    }
    return ret;
}
