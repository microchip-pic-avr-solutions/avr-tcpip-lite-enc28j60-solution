/**
 * IPv4 Implementation Source File
 *
 * @file ipv4.c
 * 
 * @ingroup ipv4
 * 
 * @brief This file provides the API implementation for IPv4.
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
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include "../network.h"
#include "../ipv4.h"
#include "../arpv4.h"
#include "../udpv4.h"
#include "../udpv4_port_handler_table.h"
#include "../tcpv4.h"
#include "../tcpip_types.h"
#include "../../ethernet/physical_layer_interface.h"
#include "../log.h"
#include "../ip_database.h"


// Macros
#ifdef ENABLE_NETWORK_DEBUG
#define logMsg(msg, msgSeverity, msgLogDest)    logMessage(msg, LOG_KERN, msgSeverity, msgLogDest)  
#else
#define logMsg(msg, msgSeverity, msgLogDest)
#endif


// Variables
ipv4Header_t ipv4Header;

uint32_t remoteIpv4Address;
// External IPV4 Function Prototypes
/**
 * @ingroup ipv4
 * @brief Receives TCP packets
 * @param remoteAddress Address of the remote device
 * @param length Packet length
 * @return None.
 */
extern void TCP_Recv(uint32_t remoteAddress, uint16_t length);

/**
 @ingroup ipv4
 @brief Returns the header length
 @param None.
 @return Length of the header.
 */
static uint8_t getHeaderLen(void);

// Loacl IPV4 functions
void IPV4_Init(void)
{
    ipdb_init();
}

uint16_t IPV4_PseudoHeaderChecksum(uint16_t payloadLen)
{
    ipv4_pseudo_header_t tmp;
    uint8_t *ptrPseudoHeader;
    uint8_t lenPseudoHeader;
    uint32_t cksm = 0;

    tmp.srcIpAddress  = ipv4Header.srcIpAddress;
    tmp.dstIpAddress  = ipv4Header.dstIpAddress;
    tmp.protocol      = ipv4Header.protocol;
    tmp.z             = 0;
    tmp.length        = payloadLen;

    lenPseudoHeader = sizeof(tmp);
    ptrPseudoHeader = (uint8_t *) &tmp;
    
    while(lenPseudoHeader)
    {
        cksm += (lenPseudoHeader & 1) ? (uint32_t)(*ptrPseudoHeader)<<8 : (uint32_t)(*ptrPseudoHeader);
        ptrPseudoHeader++;
        lenPseudoHeader--;
    }

    // Adding back carry from top 16 bits to low 16 bits
    cksm = (cksm & 0x0FFFF) + (cksm>>16);

    return (uint16_t)cksm;
}

static uint8_t getHeaderLen(void)
{
    uint16_t rxptr;
    uint8_t  header_len = 0;
    rxptr = ETH_GetReadPtr();
    header_len = ETH_Read8() & 0x0fu;
    ETH_SetRxByteCount(ETH_GetRxByteCount()+1);
    ETH_SetReadPtr(rxptr);
    return (uint8_t)(header_len<<2) ;
}

error_msg IPV4_Packet(void)
{
    uint16_t cksm = 0;
    uint16_t length = 0;
    uint8_t hdrLen;
    // Calculate the IPv4 checksum
    hdrLen = getHeaderLen();
    cksm = ETH_RxComputeChecksum(hdrLen, 0);
    if (cksm != 0)
    {
        return IPV4_CHECKSUM_FAILS;
    }
    
    ETH_ReadBlock((char *)&ipv4Header, sizeof(ipv4Header_t));
    if(ipv4Header.version != 4)
    {
        return IP_WRONG_VERSION; // Incorrect version number
    }

    ipv4Header.dstIpAddress = ntohl(ipv4Header.dstIpAddress);
    ipv4Header.srcIpAddress = ntohl(ipv4Header.srcIpAddress);

    if(ipv4Header.srcIpAddress == SPECIAL_IPV4_BROADCAST_ADDRESS)
        return DEST_IP_NOT_MATCHED;

    if(ipv4Header.dstIpAddress == ipdb_getAddress() 
        || (ipv4Header.dstIpAddress == IPV4_ZERO_ADDRESS)
        || (ipv4Header.dstIpAddress == SPECIAL_IPV4_BROADCAST_ADDRESS)
        || ((ipdb_getAddress()|CLASS_A_IPV4_REVERSE_BROADCAST_MASK)== ipv4Header.dstIpAddress)
        || ((ipdb_getAddress()|CLASS_B_IPV4_REVERSE_BROADCAST_MASK)== ipv4Header.dstIpAddress)
        || ((ipdb_getAddress()|CLASS_C_IPV4_REVERSE_BROADCAST_MASK)== ipv4Header.dstIpAddress)
        || (ipv4Header.dstIpAddress == ALL_HOST_MULTICAST_ADDRESS))
    {
        ipv4Header.length = ntohs(ipv4Header.length);

        hdrLen = (uint8_t)(ipv4Header.ihl << 2);

        if(ipv4Header.ihl < 5)
            return INCORRECT_IPV4_HLEN;

        if (ipv4Header.ihl > 5)
        {
            // Do not process the IPv4 Options field
            ETH_Dump((uint16_t)(hdrLen - sizeof(ipv4Header_t)));
        }
        
        switch((ipProtocolNumbers)ipv4Header.protocol)
        {
            case UDP_TCPIP:
                // Check the UDP header checksum                
                logMsg("IPv4 RX UDP", LOG_INFO, LOG_DEST_CONSOLE);
                length = ipv4Header.length - hdrLen;
                cksm = IPV4_PseudoHeaderChecksum(length);   // Calculate pseudo header checksum
                cksm = ETH_RxComputeChecksum(length, cksm); // 1's complement of pseudo header checksum + 1's complement of UDP header, data
                UDP_Receive(cksm);
                break;
            case TCP_TCPIP:
                // Accept only uni cast TCP packets
                // Check the TCP header checksum
                logMsg("IPv4 RX TCP", LOG_INFO, LOG_DEST_CONSOLE);
                length = ipv4Header.length - hdrLen;
                cksm = IPV4_PseudoHeaderChecksum(length);
                cksm = ETH_RxComputeChecksum(length, cksm);

                // Accept only packets with valid CRC Header
                if (cksm == 0 && (ipv4Header.dstIpAddress != SPECIAL_IPV4_BROADCAST_ADDRESS) && (ipv4Header.dstIpAddress != IPV4_ZERO_ADDRESS))
                {
                        remoteIpv4Address = ipv4Header.srcIpAddress;
                        TCP_Recv(remoteIpv4Address, length);
                }
                else
                {
                        logMsg("IPv4 RX bad TCP chksm", LOG_DEBUG, LOG_DEST_CONSOLE);
                }
                break;
            default: 
                ETH_Dump(ipv4Header.length);
                break;
        }
        return SUCCESS;
    }
    else
    {
        return DEST_IP_NOT_MATCHED;
    }
}

error_msg IPv4_Start(uint32_t dstAddress, ipProtocolNumbers protocol)
{
    error_msg ret = ERROR;
    // Get the destination MAC address
    const mac48Address_t *destMacAddress;
    uint32_t targetAddress;

    // Check if there is a valid IP address and if it is different from 127.0.0.1
    if(((ipdb_getAddress() != 0) || (protocol == UDP_TCPIP))
     && (ipdb_getAddress() != 0x7F000001))
    {
        if(((dstAddress == SPECIAL_IPV4_BROADCAST_ADDRESS)
          |((dstAddress | CLASS_A_IPV4_BROADCAST_MASK) == SPECIAL_IPV4_BROADCAST_ADDRESS)
          |((dstAddress | CLASS_B_IPV4_BROADCAST_MASK) == SPECIAL_IPV4_BROADCAST_ADDRESS)
          |((dstAddress | CLASS_C_IPV4_BROADCAST_MASK) == SPECIAL_IPV4_BROADCAST_ADDRESS))==0) // This is NOT a broadcast message
        {
            if( ((dstAddress ^ ipdb_getAddress()) & ipdb_getSubNetMASK()) == 0)
            {
                targetAddress = dstAddress;
            }
            else
            {
                targetAddress = ipdb_getRouter();
            }
            destMacAddress= ARPV4_Lookup(targetAddress);
            if(destMacAddress == 0)
            {
                ret = ARPV4_Request(targetAddress); // Schedule an arp request
                return ret;
            }
        }
        else
        {
            destMacAddress = &broadcastMAC;
        }
        ret = (error_msg)ETH_WriteStart(destMacAddress, ETHERTYPE_IPV4);
        if(ret == SUCCESS)
        {
            ETH_Write16(0x4500);            // VERSION, IHL, DSCP, ECN
            ETH_Write16(0);                 // Total packet length
            ETH_Write32(0xAA554000);        // My IPv4 Magic Number..., FLAGS, Fragment Offset
            ETH_Write8(IPv4_TTL);           // TTL
            ETH_Write8(protocol);           // protocol
            ETH_Write16(0);                 // Checksum will be set to zero and overwritten with correct value
            ETH_Write32(ipdb_getAddress());
            ETH_Write32(dstAddress);

            // Fill the pseudo header for checksum calculation
            ipv4Header.srcIpAddress = ipdb_getAddress();
            ipv4Header.dstIpAddress = dstAddress;
            ipv4Header.protocol = protocol;
        }
    }
    return ret;
}

error_msg IPV4_Send(uint16_t payloadLength)
{
    uint16_t totalLength;
    uint16_t cksm;
    error_msg ret;

    totalLength = 20 + payloadLength;
    totalLength = ntohs(totalLength);

    // Insert IPv4 Total Length
    ETH_Insert((char *)&totalLength, 2, sizeof(ethernetFrame_t) + offsetof(ipv4Header_t, length));

    cksm = ETH_TxComputeChecksum(sizeof(ethernetFrame_t), sizeof(ipv4Header_t), 0);
    // Insert Ipv4 Header Checksum
    ETH_Insert((char *)&cksm, 2, sizeof(ethernetFrame_t) + offsetof(ipv4Header_t, headerCksm));
    ret = (error_msg)ETH_Send();

    return ret;
}

uint16_t IPV4_GetDatagramLength(void)
{
    return ((ipv4Header.length) - sizeof(ipv4Header_t));
}