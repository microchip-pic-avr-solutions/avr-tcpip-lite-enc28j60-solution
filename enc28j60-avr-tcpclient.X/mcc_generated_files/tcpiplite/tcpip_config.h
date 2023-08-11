/**
 * TCP/IP Stack User Configuration Options Header File
 *
 * @file tcpip_config.h
 * 
 * @ingroup tcpiplite
 * 
 * @brief  This file provides the API implementation for the TCP/IP Stack user configuration options.
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

#ifndef TCPIP_CONFIG_H
#define	TCPIP_CONFIG_H

// Macros
/**
 * @ingroup tcpiplite
 * @def MAKE_IPV4_ADDRESS(a,b,c,d)
 * @brief Build the IPv4 Address
*/
#define MAKE_IPV4_ADDRESS(a,b,c,d) ((uint32_t)(((uint32_t)a << 24) | ((uint32_t)b<<16) | ((uint32_t)c << 8) | (uint32_t)d))

// ARP Protocol Defines
#define ARP_MAP_SIZE 8

// DHCP Protocol Defines
extern const char dhcpName[];

/**
 * @ingroup tcpiplite
 * @def DHCP_NAME_SIZE
 * @brief Required since sizeof is not handled during the preprocessor stage
 */
#define DHCP_NAME_SIZE 18


// IP Protocol Defines
#define IPv4_TTL            64u

// TCP Protocol Defines
/**
 * @ingroup tcpiplite
 * @def TCP_MAX_SEG_SIZE
 * @brief TCP maximum segment size
 */
#define TCP_MAX_SEG_SIZE    1460u
#define TICK_SECOND 1

/**
 * @ingroup tcpiplite
 * @def TCP_START_TIMEOUT_VAL
 * @brief Time-out to retransmit unacked data
 * 
 */
#define TCP_START_TIMEOUT_VAL           ((unsigned long)TICK_SECOND*2)

/**
 * @ingroup tcpiplite
 * @def TCP_MAX_RETRIES
 * @brief Number of retransmission attempts
 */
#define TCP_MAX_RETRIES                 (5u)

/**
 * @ingroup tcpiplite
 * @def TCP_MAX_SYN_RETRIES
 * @brief than all other retries to reduce SYN flood DoS duration
 */
#define TCP_MAX_SYN_RETRIES             (3u)

/**
 * @ingroup tcpiplite
 * @def LOCAL_TCP_PORT_START_NUMBER
 * @brief The lower port number to be used as a local port
 */
#define LOCAL_TCP_PORT_START_NUMBER     (1024u)

/**
 * @ingroup tcpiplite
 * @def LOCAL_TCP_PORT_END_NUMBER
 * @brief The highest port number to be used as a local port
 */
#define LOCAL_TCP_PORT_END_NUMBER       (65535u)

// Neighbor Discovery Protocol Defines

#endif	/* TCPIP_CONFIG_H */
