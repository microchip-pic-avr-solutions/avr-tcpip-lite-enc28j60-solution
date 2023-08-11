/**
 * DHCPv4 Client Protocol Header File
 *
 * @file dhcp_client.h
 * 
 * @defgroup dhcp DHCP
 * 
 * @brief This file provides the API implementation for the Dynamic Host Configuration Protocol (DHCP) client.
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

#ifndef DHCP_CLIENT_H
#define	DHCP_CLIENT_H

// Included Files
#include "tcpip_types.h"
#include "tcpip_config.h"

// DHCP Client Functions
/**
 @ingroup dhcp
 @brief Initializes the DHCP.
 @param None.
 @return None.
 */
void DHCP_init(void);

/**
 @ingroup dhcp
 @brief Receives and processes the DHCP packet.
 @param length Length of the received DHCP packet
 @return None.
 */
void DHCP_Handler(int16_t length);

/**
 @ingroup dhcp
 @brief Updates the DHCP status at least every one second. 
 @param None.
 @return None.
 */
void DHCP_Manage(void);

/**
 @ingroup dhcp
 @brief Writes zeroes for the number of bytes passed.
 @param length Number of bytes
 @return None.
 */
void DHCP_WriteZeros(uint16_t length);

#endif	/* DHCP_CLIENT_H */
