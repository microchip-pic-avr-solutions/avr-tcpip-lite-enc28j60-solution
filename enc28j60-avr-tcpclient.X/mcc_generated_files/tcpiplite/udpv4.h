/**
 * UDP v4 Protocol Header File
 *
 * @file udpv4.h
 * 
 * @defgroup udp UDP
 * 
 * @brief This file provides the API implementation for UDP v4.
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

#ifndef UDPV4_H
#define	UDPV4_H

// Included Files
#include <stdbool.h>
#include "tcpip_types.h"
#include "../ethernet/physical_layer_interface.h"

// Variables
extern uint16_t destPort;
extern udpHeader_t udpHeader;
extern ipv4Header_t ipv4Header;

// Macros
#define   UDP_ReadBlock(data,length)  ETH_ReadBlock(data,length)
#define   UDP_Read8()                 ETH_Read8()
#define   UDP_Read16()                ETH_Read16()
#define   UDP_Read24()                ETH_Read24()
#define   UDP_Read32()                ETH_Read32()
#define   UDP_Write8(data)            ETH_Write8(data)
#define   UDP_Write16(data)           ETH_Write16(data)
#define   UDP_Write24(data)           ETH_Write24(data)
#define   UDP_Write32(data)           ETH_Write32(data)
#define   UDP_WriteBlock(data,length) ETH_WriteBlock(data,length)
#define   UDP_WriteString(data)       ETH_WriteString(data)
#define   UDP_GetDestPort()           (destPort)
#define   UDP_GetSrcPort()            (udpHeader.dstPort)
#define   UDP_GetDestIP()             (ipv4Header.srcIpAddress)
#define   UDP_GetSrcIP()              (ipv4Header.dstIpAddress)
#define   UDP_DataLength()            ((udpHeader.length) - 8)
#define   UDP_FlushTXPackets()        ETH_TxReset()
#define   UDP_FlushRxdPacket()        ETH_Flush()

// UDP Library Functions
/**
 @ingroup udp
 @brief Starts a UDP packet.
 @param destIP Destination IP address
 @param srcPort Source port
 @param dstPort Destination port
 @return Error status. Refer to the error description in tcpip_types.h.
 */
error_msg UDP_Start(uint32_t destIP, uint16_t srcPort, uint16_t dstPort);

/**
 @ingroup udp
 @brief Sends a UDP packet.
 @param None.
 @return Error status. Refer to the error description in tcpip_types.h.
 */
error_msg UDP_Send(void);

/**
 @ingroup udp
 @brief Catches all UDP packets and dispatches them to the appropriate callback. 
 @param udpcksm UDP Checksum
 @return Error status. Refer to the error description in tcpip_types.h.
 */
error_msg UDP_Receive(uint16_t udpcksm);

#endif	/* UDPV4_H */
