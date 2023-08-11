/**
 * UDP Port Handler Header File
 *
 * @file udpv4_port_handler_table.h
 * 
 * @ingroup udp
 * 
 * @brief This file contains the UDP callback table.
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

#ifndef UDPV4_PORT_HANDLER_TABLE_H
#define	UDPV4_PORT_HANDLER_TABLE_H

// Included Files
#include "tcpip_types.h"

/**
 @ingroup udp
 @struct udp_handler_t
 @brief UDP handler types.
 */
typedef struct
{
    uint16_t portNumber;
    ip_receive_function_ptr callBack;
} udp_handler_t;

typedef const udp_handler_t * udp_table_iterator_t;

// UDPV4 Port Handler Functions
/**
 @ingroup udp
 @brief Returns the UDP table iterator.
 @param None.
 @return Pointer to UDP_CallBackTable.
 */
udp_table_iterator_t udp_table_getIterator(void);

/**
 @ingroup udp
 @brief Returns the UDP table next entry.
 @param i UDP table iteration
 @return Pointer to UDP_CallBackTable.
 */
udp_table_iterator_t udp_table_nextEntry(udp_table_iterator_t i);

#endif	/* UDPV4_PORT_HANDLER_TABLE_H */
