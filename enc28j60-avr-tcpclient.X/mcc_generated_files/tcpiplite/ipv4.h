/**
 * IPv4 Protocol Header File
 *
 * @file ipv4.h
 * 
 * @defgroup ipv4 IPV4
 * 
 * @brief This file provides the API implementation for the Internet Protocol v4 (IPv4).
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

#ifndef IPV4_H
#define IPV4_H

// Included Files
#include <stdbool.h>
#include "tcpip_types.h"
#include "../ethernet/physical_layer_interface.h"

// IPV4 Functions
/**
 @ingroup IPv4
 @brief Initializes IPv4.
 @param None.
 @return None.
 */
void IPV4_Init(void);

/**
 @ingroup ipv4
 @brief Receives the IPv4 packet. This function reads the IPv4 header and filters the upper layer protocols.
 @param None.
 @return Error status. Refer to the error description in tcpip_types.h.
 */
error_msg IPV4_Packet(void);

/**
 @ingroup ipv4
 @brief Starts the IPv4 packet. This routine starts the Ethernet packet and writes the IPv4 header. 
 Initially Checksum and Payload length are set to '0'. An error code is returned if there has been 
 an error in accepting, or if something goes wrong. 
 @param dstAddress 32-bit destination Ipv4 address
 @param protocol Protocol number
 @return Error status. Refer to the error description in tcpip_types.h.
 */
error_msg IPv4_Start(uint32_t dstAddress, ipProtocolNumbers protocol);

/**
 @ingroup ipv4
 @brief Computes the pseudo-header checksum for transport layer protocols.
 @param payloadLen Length of the transport layer packet
 @return Checksum.
 */
uint16_t IPV4_PseudoHeaderChecksum(uint16_t payloadLen);

/**
 @ingroup ipv4
 @brief Sends the IPv4 packet. This function inserts the total length of IPv4 packet, computes and adds the Ipv4 header checksum. 
 @param payloadLength Data length of the transport packet
 @retval 1 IP packet was sent successfully
 @retval !1 IP packet was not sent
 */
error_msg IPV4_Send(uint16_t payloadLength);

/**
 @ingroup ipv4
 @brief Returns the length of the IPv4 datagram. 
 @param None.
 @return Length of IPV4 datagram.
 */
uint16_t IPV4_GetDatagramLength(void);

#endif /* IPV4_H */
