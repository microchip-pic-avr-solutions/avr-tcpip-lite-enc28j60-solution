/**
 * Network Header File
 *
 * @file network.h
 *
 * @ingroup tcpiplite
 *
 * @brief This file provides the network layer implementation for the Transmission Control Protocol/Internet Protocol (TCP/IP) stack.
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

#ifndef NETWORK_H
#define NETWORK_H

// Included Files
#include <stdint.h>
#include "tcpip_types.h"

// Macros
#define byteSwap16(a) ((((uint16_t)a & (uint16_t)0xFF00) >> 8) | (((uint16_t)a & (uint16_t)0x00FF) << 8))
#define byteReverse32(a) ((((uint32_t)a & (uint32_t)0xff000000) >> 24) | \
                          (((uint32_t)a & (uint32_t)0x00ff0000) >> 8)  | \
                          (((uint32_t)a & (uint32_t)0x0000ff00) << 8)  | \
                          (((uint32_t)a & (uint32_t)0x000000ff) << 24))

#define byteReverse24(a) (((((uint32_t)a & (uint32_t)0x00FF00) >> 8) | (((uint32_t)a & (uint32_t)0x0000FF) << 8)) << 8 | (uint32_t)a >> 0x10)

// Host-to-network and network-to-host macros
#ifndef htons
#define htons(a) byteSwap16(a)
#endif
#ifndef ntohs
#define ntohs(a) byteSwap16(a)
#endif
#ifndef htonl
#define htonl(a) byteReverse32(a)
#endif
#ifndef ntohl
#define ntohl(a) byteReverse32(a)
#endif

#define convert_hton24(a) byteReverse24(a)

// Network Functions
/**
 * @ingroup tcpiplite
 * @brief Initializes the network protocols.
 * @param None.
 * @return None.
 */
void Network_Init(void);

/**
 * @ingroup tcpiplite
 * @brief Reads the packets in the network.
 * @param None.
 * @return None.
 */
void Network_Read(void);

/**
 * @ingroup tcpiplite
 * @brief Handles the packets in the network.
 * @param None.
 * @return None.
 */
void Network_Manage(void);

/**
 * @ingroup tcpiplite
 * @brief Waits for the link by reading the PHY registers.
 * @param None.
 * @return None.
 */
void Network_WaitForLink(void);

/**
 * @ingroup tcpiplite
 * @brief Returns the network start position.
 * @param None.
 * @return Start position.
 */
uint16_t Network_GetStartPosition(void);

/**
 * @ingroup tcpiplite
 * @brief Initializes the timers.
 * @param None.
 * @return None.
 */
void timersInit(void);

#endif /* NETWORK_H */
