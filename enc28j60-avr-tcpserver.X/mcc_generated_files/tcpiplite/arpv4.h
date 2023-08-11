/**
 * ARPv4 Protocol Header file
 *
 * @file arpv4.h
 *
 * @defgroup arp ARP
 *
 * @brief This header file provides the API for the ARPv4 protocol.
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

#ifndef ARPV4_H
#define ARPV4_H

// Included Files
#include "../ethernet/physical_layer_interface.h"
#include "tcpip_types.h"
#include "tcpip_config.h"

// ARP Functions
/**
 * @ingroup arp
 * @brief Initializes the ARP table.
 * @param None.
 * @return None.
 */
void ARPV4_Init(void);

/**
 * @ingroup arp
 * @brief Receives all ARP packets on the network and searches the ARP table for an existing ARP entry.
 * If present, it updates the table. If the ARP packet is for the device and its operation is REQUEST,
 * the function replies with the device MAC address.
 * @param None.
 * @retval 1 ARP reply sent successfully
 * @retval !1 ARP reply is not sent or the ARP packet is not destined for the device
 */
error_msg ARPV4_Packet(void);

/**
 * @ingroup arp
 * @brief Updates the ARP table at least every 10s to avoid aging.
 * @param None.
 * @return None.
 */
void ARPV4_Update(void);

/**
 * @ingroup arp
 * @brief Maintains an ARP table which maps hardware address to internet address.
 * @param ipAddress 32-bit destination IPv4 address in host order
 * @return Pointer to the destination MAC address.
 */
mac48Address_t *ARPV4_Lookup(uint32_t ipAddress);

/**
 * @ingroup arp
 * @brief Sends the ARP Request.
 * @param destAddress 32-bit destination IPv4 address
 * @retval 1 ARP request sent successfully
 * @retval !1 ARP request failed to send
 */
error_msg ARPV4_Request(uint32_t destAddress);

#endif /* ARPV4_H */
