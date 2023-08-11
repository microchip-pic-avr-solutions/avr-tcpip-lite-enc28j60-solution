/**
 * ARP v4 Implementation Source File
 *
 * @file arpv4.c
 * 
 * @ingroup arp
 * 
 * @brief This file provides the API implementation for the Address Resolution Protocol (ARP) v4.
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
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "../tcpip_types.h"
#include "../network.h"
#include "../arpv4.h"
#include "../../ethernet/physical_layer_interface.h"
#include "../ipv4.h"// needed to know my IP address
#include "../tcpip_config.h"
#include "../ip_database.h"

// Macros
#define ARP_REQUEST 1
#define ARP_REPLY 2
#define ARP_NAK 10

// Structs
/**
 * @ingroup arp
 * @struct arpHeader_t
 * @brief Contains the ARP information.
 */
typedef struct
{
    uint16_t htype;         /**<Hardware Type*/
    uint16_t ptype;         /**<Protocol Type*/
    uint8_t  hlen;          /**<Hardware Address Length*/
    uint8_t  plen;          /**<Protocol Address Length*/
    uint16_t oper;          /**<Operation*/
    mac48Address_t  sha;    /**<Sender Hardware Address*/
    uint32_t spa;           /**<Sender Protocol Address*/
    mac48Address_t  tha;    /**<Target Hardware Address*/
    uint32_t tpa;           /**<Target Protocol Address*/
} arpHeader_t;

/**
 * @ingroup arp
 * @struct arpMap_t
 * @brief Contains the ARP database.
 */
typedef struct
{
    mac48Address_t macAddress;  /**<MAC address*/
    uint32_t ipAddress;         /**<IP address*/
    uint16_t protocolType;      /**<Protocol type*/
    uint8_t age;                /**<Replace oldest entry with new data as required.*/
} arpMap_t;

// Variables
mac48Address_t hostMacAddress;

arpMap_t arpMap[ARP_MAP_SIZE]; //Maintains a small database of IP address & MAC addresses

// ARP Functions
void ARPV4_Init(void)
{
    for(uint8_t x= 0 ; x < ARP_MAP_SIZE; x++)
    {
        ((char *)arpMap)[x] = 0;
    }
    ETH_GetMAC((uint8_t*)&hostMacAddress);
}

error_msg ARPV4_Packet(void)
{
    arpHeader_t header;
    arpMap_t *entryPointer;
    bool mergeFlag;
    uint16_t length;
    error_msg ret;

    ret = ERROR;

    length = ETH_ReadBlock((char*)&header,sizeof(arpHeader_t));
    if(length == sizeof(arpHeader_t))
    {
        // Assuming that all hardware & protocols are supported
        mergeFlag = false;
        entryPointer = arpMap;
        // Searching the arp table for a matching ip & protocol
        if (htons(header.htype) != INETADDRESSTYPE_IPV4) return ARP_WRONG_HARDWARE_ADDR_TYPE;
        if (htons(header.ptype) != ETHERTYPE_IPV4) return ARP_WRONG_PROTOCOL_TYPE;
        if (header.hlen != ETHERNET_ADDR_LEN) return ARP_WRONG_HARDWARE_ADDR_LEN;
        if (header.plen != IP_ADDR_LEN) return ARP_WRONG_PROTOCOL_LEN;
        for(uint8_t x=ARP_MAP_SIZE; x > 0; x--)
        {
            if( (ntohl(header.spa) == entryPointer->ipAddress) && (header.ptype == entryPointer->protocolType))
            {
                entryPointer->age = 0; // Reset the age
                entryPointer->macAddress.s = header.sha.s;
                mergeFlag = true;
                break;
            }
            entryPointer++;
        }

        if(ipdb_getAddress() && (ipdb_getAddress() == ntohl(header.tpa)))
        {
            if(!mergeFlag)
            {
                // Find the oldest entry in the table
                entryPointer = arpMap;
                arpMap_t *arpPtr = arpMap;
                for(uint8_t x=ARP_MAP_SIZE; x !=0; x--)
                {
                    if(entryPointer->age < arpPtr->age)
                    {
                        entryPointer = arpPtr;
                    }
                    /* Increment the pointer to get the next element from the array. */
                    arpPtr++;
                }
                // The entry_pointer is now pointing to the oldest entry
                // Replace the entry with the received data
                entryPointer->age = 0;
                entryPointer->macAddress.s = header.sha.s;
                entryPointer->ipAddress = ntohl(header.spa);
                entryPointer->protocolType = header.ptype;
            }
            if(header.oper == ntohs(ARP_REQUEST))
            {
                ret = (error_msg)ETH_WriteStart(&header.sha ,ETHERTYPE_ARP);
                if(ret == SUCCESS)
                {
                    
                    header.tha.s = header.sha.s;
                    memcpy((void*)&header.sha.s, (void*)&hostMacAddress.s, sizeof(mac48Address_t));
                    header.tpa = header.spa;
                    header.spa = htonl(ipdb_getAddress());
                    header.oper = htons(ARP_REPLY);
                    ETH_WriteBlock((char*)&header,sizeof(header));

                    
                    ret = (error_msg)ETH_Send();
                }
            }
        }
        else
        {
            ret = ARP_IP_NOT_MATCHED;
        }
    }
    return ret;
}

void ARPV4_Update(void)
{
    arpMap_t *entryPointer = arpMap;
    for(uint8_t x=0; x < ARP_MAP_SIZE; x++)
    {
        entryPointer->age ++;
        entryPointer ++;
    }
}

error_msg ARPV4_Request(uint32_t destAddress)
{
    error_msg ret;

    ret = ERROR;

    arpHeader_t header;
    header.htype = htons(1);
    header.ptype = htons(0x0800);
    header.hlen = 6;
    header.plen = 4;
    header.oper = htons(ARP_REQUEST);
    memcpy((void*)&header.sha, (void*)&hostMacAddress, sizeof(mac48Address_t));
    header.spa = htonl(ipdb_getAddress());
    header.tpa= htonl(destAddress);
    header.tha.s.byte1 = 0;
    header.tha.s.byte2 = 0;
    header.tha.s.byte3 = 0;
    header.tha.s.byte4 = 0;
    header.tha.s.byte5 = 0;
    header.tha.s.byte6 = 0;

    ret = (error_msg)ETH_WriteStart(&broadcastMAC,ETHERTYPE_ARP);
    if(ret == SUCCESS)
    {
        ETH_WriteBlock((char*)&header,sizeof(arpHeader_t));
        ret = (error_msg)ETH_Send();
        if(ret == SUCCESS)
        {
            return MAC_NOT_FOUND;
        }
    }
    return ret;
}

mac48Address_t* ARPV4_Lookup(uint32_t ip_address)
{
    arpMap_t *entry_pointer = arpMap;
    uint8_t x;
    
    for(x = 0; x < ARP_MAP_SIZE; x++)
    {
        if(entry_pointer->ipAddress == ip_address)
            return &entry_pointer->macAddress;
        entry_pointer ++;
    }
    return 0;
}
