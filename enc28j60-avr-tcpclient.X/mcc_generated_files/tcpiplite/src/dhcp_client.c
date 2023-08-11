/**
 * DHCP v4 client Implementation Source File
 *
 * @file dhcp_client.c
 * 
 * @ingroup dhcp
 * 
 * @brief This file provides the API implementation for the DHCP client.
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

//Included Files
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
#include <limits.h>
#include "../log.h"
#include "../../ethernet/physical_layer_interface.h"
#include "../network.h"
#include "../udpv4.h"
#include "../udpv4_port_handler_table.h"
#include "../ipv4.h"
#include "../arpv4.h"
#include "../dhcp_client.h"
#include "../ip_database.h"
#include "../lfsr.h"

// Macros
#ifdef ENABLE_NETWORK_DEBUG
#define logMsg(msg, msgSeverity, msgLogDest)    logMessage(msg, LOG_DHCP, msgSeverity, msgLogDest)
#else
#define logMsg(msg, msgSeverity, msgLogDest)
#endif
#define DHCP_HEADER_SIZE 240

#if ( DHCP_PACKET_SIZE & 1)
#define ZERO_PAD_DHCP
#define DHCP_REQUEST_LENGTH (DHCP_PACKET_SIZE + 1)
#else
#undef ZERO_PAD_DHCP
#define DHCP_REQUEST_LENGTH DHCP_PACKET_SIZE
#endif

static mac48Address_t ethMAC;

// Enumerations
/**
 * @ingroup dhcp
 * @enum dhcp_type
 * @brief Contains DCHP request types.
 */
typedef enum
{
    DHCP_DISCOVER = 1,
    DHCP_OFFER, DHCP_REQUEST, DHCP_DECLINE, DHCP_ACK, DHCP_NACK, DHCP_RELEASE,
    DHCP_INFORM, DHCP_FORCERENEW, DHCP_LEASEQUERY, DHCP_LEASEUNASSIGNED, DHCP_LEASEUNKNOWN,
    DHCP_LEASEACTIVE, DHCP_BULKLEASEQUERY, DHCP_LEASEQUERYDONE
}dhcp_type;

/**
 * @ingroup dhcp
 * @enum dhcp_rx_client_state
 * @brief Contains the DCHP RX Client state.
 */
typedef enum
{
    SELECTING, REQUESTING, RENEWLEASE, BOUND
}dhcp_rx_client_state;

/**
 * @ingroup dhcp
 * @enum dhcp_timer_client_state
 * @brief Contains the DCHP Timer Client state.
 */
typedef enum
{
    INIT_TIMER, WAITFORTIMER, STARTDISCOVER, STARTREQUEST
}dhcp_timer_client_state;

// Structs
/**
 * @ingroup dhcp
 * @struct dhcp_data_t
 * @brief Contains option data
 */
typedef struct
{
    uint32_t dhcpIPAddress;         /**<DHCP IP address */
    uint32_t subnetMask;            /**<Subnet mask */
    uint32_t routerAddress;         /**<Router address*/
    uint32_t dnsAddress[2];         /**<Captures only two DNS addresses */
    uint32_t ntpAddress[2];         /**<Captures only two DNS addresses */
    uint32_t gatewayAddress;        /**<x ID value */
    uint32_t xidValue;              /**<x ID value */
    uint32_t t1;                    /**<Name as per the RFC, page 35 */
    uint32_t t2;                    /**<Name as per the RFC, page 35  */
    uint32_t dhcpServerIdentifier;  /**<DHCP Server ID */
} dhcp_data_t;

/**
 * @ingroup dhcp
 * @struct dhcp_state_t
 * @brief Contains state data.
 */
typedef struct
{
    dhcp_rx_client_state rxClientState;
    dhcp_timer_client_state tmrClientState;
} dhcp_state_t;

// Variables
dhcp_data_t dhcpData = {0,0,0,{0,0},{0,0},0,0,10,3600,0};
dhcp_state_t dhcpState = {SELECTING,INIT_TIMER};

const char dhcpName[] = "AVR64DD32 Ethernet";

// Local DHCP Client Function Prototypes
/**
 * @ingroup dhcp
 * @brief Sends the DHCP DISCOVER request.
 * @param None.
 * @retval True Request sent successfully
 * @retval False Request failed to send
 */
bool sendDHCPDISCOVER(void);

/**
 * @ingroup dhcp
 * @brief Sends the DHCP REQUEST request.
 * @param None.
 * @retval True Request sent successfully
 * @retval False Request failed to send
 */
bool sendDHCPREQUEST(void);

/**
 * @ingroup dhcp
 * @brief Sends DHCP DECLINE request.
 * @param None.
 * @retval True Request sent successfully
 * @retval False Request failed to send
 */
bool sendDHCPDECLINE(void);

/**
 * @ingroup dhcp
 * @brief Sends a DHCP request.
 * @param type Request type enumerated in dhcp_type
 * @retval True Request sent successfully 
 * @retval False Request failed to send
 */
bool sendRequest(dhcp_type type);

// DHCP Client Functions
bool sendDHCPDISCOVER(void)
{
    dhcpData.dhcpIPAddress = ipdb_getAddress();
    dhcpData.xidValue = lfsrWithSeed(ethMAC.mac_array[2]);
    dhcpData.xidValue <<= 8;
    dhcpData.xidValue |= lfsrWithSeed(ethMAC.mac_array[3]);
    dhcpData.xidValue <<= 8;
    dhcpData.xidValue |= lfsrWithSeed(ethMAC.mac_array[4]);
    dhcpData.xidValue <<= 8;
    dhcpData.xidValue |= lfsrWithSeed(ethMAC.mac_array[5]);
    return sendRequest(DHCP_DISCOVER);
}

bool sendDHCPREQUEST(void)
{
    logMsg("requesting", LOG_INFO, (LOG_DEST_CONSOLE|LOG_DEST_ETHERNET));
    return sendRequest(DHCP_REQUEST);
}

bool sendDHCPDECLINE(void)
{
    return sendRequest(DHCP_DECLINE);
}

bool sendRequest(dhcp_type type)
{
    // creating a DHCP request
    error_msg started;

    started = UDP_Start(0xFFFFFFFF,68,67);
    if(started==SUCCESS)
    {
        UDP_Write32(0x01010600);        // OP(0x01), HTYPE(0x01), HLEN(0x06), HOPS(0x00)
        UDP_Write32(dhcpData.xidValue);
        UDP_Write32(0x00008000);        // SECS(0x0000), FLAGS(0x8000) (Broadcast)
        if(type == DHCP_REQUEST)
        {
            UDP_Write32(0);
        }
        else
        {
            UDP_Write32(dhcpData.dhcpIPAddress);   // CIADDR
        }
        UDP_Write32(0);                 // YIADDR
        UDP_Write32(0);                 // SIADDR
        UDP_Write32(0);                 // GIADDR
        UDP_WriteBlock((char *)&hostMacAddress,6); // Hardware Address
        DHCP_WriteZeros(202);           // 0 padding  + 192 bytes of BOOTP padding
        UDP_Write32(0x63825363);        // Vendor Information "Magic Cookie" (RFC1497)
        // Send the options
        // option 12 - DHCP Name
        UDP_Write8(12); UDP_Write8((uint8_t)strlen(dhcpName)); UDP_WriteString(dhcpName);
        // option 42 - NTP server name
        UDP_Write8(42); UDP_Write8(4); UDP_Write32(0);
        // option 53 - Request type
        UDP_Write8(53); UDP_Write8(1); UDP_Write8(type);
        if(type == DHCP_REQUEST)
        {
            // option 50 - requested IP address. If there is a valid IP, it is implemented to re-request.
            UDP_Write8(50);UDP_Write8(4);UDP_Write32(dhcpData.dhcpIPAddress);
            // option 54 
            UDP_Write8(54);UDP_Write8(4);UDP_Write32(dhcpData.dhcpServerIdentifier);
        }
        // option 55
        UDP_Write8(55); UDP_Write8(4); UDP_Write8(1); UDP_Write8(3); UDP_Write8(6); UDP_Write8(15);
        // option 57 - Maximum DHCP Packet
        UDP_Write8(57); UDP_Write8(2); UDP_Write16(512);
        // send option 61 (MAC address)
        UDP_Write8(61); UDP_Write8(7); UDP_Write8(1); UDP_WriteBlock((char *)&hostMacAddress,6);
        UDP_Write8(255); // finished
        
    #ifdef ZERO_PAD_DHCP
        UDP_Write8(0);   // add a byte of padding to make the total length even
    #endif
        UDP_Send();
        return true;
    }
    return false;
}

void DHCP_init(void)
{
    ETH_GetMAC((uint8_t *) &ethMAC);
}

void DHCP_Manage(void)
{
    static time_t managementTimer = 0;    
    time_t now;
    now = time(0);
    
    if(managementTimer <= now)
    {
        switch(dhcpState.tmrClientState)
        {
            case INIT_TIMER:
                dhcpData.t1 = 4;
                dhcpData.t2 = 2;
                dhcpState.tmrClientState = WAITFORTIMER;
                break;
            case WAITFORTIMER:
                if(!ETH_CheckLinkUp())
                {
                    dhcpData.t1 = 2;
                    dhcpData.t2 = 4;
                }
                if(dhcpData.t1 == 2)
                {
                    ipdb_setAddress(0);              
                    dhcpState.tmrClientState = STARTREQUEST;
                }
                else dhcpData.t1 --;
                if(dhcpData.t2 == 2)
                {
                    dhcpState.tmrClientState = STARTDISCOVER;
                }
                else dhcpData.t2 --;
                break;
            case STARTDISCOVER:
                if(sendDHCPDISCOVER())
                {
                    dhcpData.t2 = 10; // retry in 10 seconds
                    dhcpData.t1 = LONG_MAX;
                    dhcpState.rxClientState = SELECTING;
                    dhcpState.tmrClientState = WAITFORTIMER;                    
                }
                break;
            case STARTREQUEST:
                if(ETH_CheckLinkUp())
                {
                    if(sendDHCPREQUEST())
                    {
                            dhcpData.t1 = 15;
                        if(dhcpState.rxClientState == BOUND )dhcpState.rxClientState = RENEWLEASE;
                        else dhcpState.rxClientState = REQUESTING;
                        dhcpState.tmrClientState = WAITFORTIMER;
                    }
                }
                break;
            default:              
                logMsg("At default case", LOG_WARNING, (LOG_DEST_CONSOLE|LOG_DEST_ETHERNET));
                dhcpState.tmrClientState = INIT_TIMER;
                break;
        }
    }
    managementTimer = now + 1;
}

void DHCP_Handler(int16_t length)
{
    // this function gets called by the UDP port handler for port 67
    uint8_t chaddr[16];
    uint8_t messageType = 0;

    bool acceptOffers;
    bool declineOffers;
    bool acceptNACK;
    bool acceptACK;

    uint32_t siaddr;

    logMsg("DHCP Handler", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));

    switch (dhcpState.rxClientState)
    {
        default:
        case SELECTING: // At this point, accept offers and drop the rest.
            logMsg("DHCP SELECTING", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
            acceptOffers = true;
            declineOffers = false;
            acceptNACK = false;
            acceptACK = false;
            break;
        case REQUESTING: // At this point, can accept an ACK or NACK, decline offers and drop the rest.
            logMsg("DHCP REQUESTING", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
            acceptOffers = false;
            declineOffers = true;
            acceptNACK = true;
            acceptACK = true;
            break;
        case RENEWLEASE:
            logMsg("DHCP RENEW LEASE", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
            acceptOffers = false;
            acceptNACK = true; // a bound lease renewal can have a Nack back
            acceptACK = true;  // a bound lease renewal can have an ack back
            break;
        case BOUND: // At this point, drop everything. The timer will  pull the execution out of here.
            logMsg("DHCP BOUND", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
            acceptOffers = false;
            acceptNACK = false;
            acceptACK = false;
            break;
    }

    if (acceptOffers || declineOffers || acceptNACK || acceptACK)
    {
        dhcp_data_t localData = {0, 0, 0, {0, 0}, {0, 0}, 0, 0, 3600, 3600, 0};
        localData.xidValue = dhcpData.xidValue;

        if (length > DHCP_HEADER_SIZE)
        {
                logMsg("DHCP PROCESSING", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                if (0x0201 == UDP_Read16())
                {
                    if (0x06 == UDP_Read8()) // HLEN - is set to 6 because an Ethernet address is 6 Octets long
                    {
                        UDP_Read8();                           // HOPS
                        if (dhcpData.xidValue == UDP_Read32()) // xid check
                        {
                            UDP_Read16();                           // SECS
                            UDP_Read16();                           // FLAGS
                            UDP_Read32();                           // CIADDR
                            localData.dhcpIPAddress = UDP_Read32(); // YIADDR
                            if ((localData.dhcpIPAddress != SPECIAL_IPV4_BROADCAST_ADDRESS) && (localData.dhcpIPAddress != LOCAL_HOST_ADDRESS))
                            {
                                siaddr = UDP_Read32(); // SIADDR
                                if ((siaddr != SPECIAL_IPV4_BROADCAST_ADDRESS) && (siaddr != LOCAL_HOST_ADDRESS))
                                {
                                    UDP_Read32();                                   // GIADDR
                                    UDP_ReadBlock(chaddr, sizeof(chaddr));          // Read chaddr
                                    if (memcmp(chaddr, &hostMacAddress.s, 6) == 0 
                                       || memcmp(chaddr, &broadcastMAC.s, 6) == 0 
                                       || (strlen((char *)chaddr) == 0))            // only compare 6 bytes of MAC address.
                                    {
                                        ETH_Dump(64);  // drop SNAME
                                        ETH_Dump(128); // drop the filename
                                        if (UDP_Read32() == 0x63825363)
                                        {
                                            length -= DHCP_HEADER_SIZE;
                                            while (length > 0)
                                            {
                                                // options are here!!!
                                                uint8_t option, optionLength;
                                                option = UDP_Read8();
                                                optionLength = UDP_Read8();
                                                length -= 2 + optionLength;
                                                switch (option)
                                                {
                                                case 1: // subnet mask
                                                    logMsg("DHCP option 1", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                                    localData.subnetMask = UDP_Read32();
                                                    break;
                                                case 3: // router
                                                    logMsg("DHCP option 3", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                                    localData.routerAddress = UDP_Read32();
                                                    break;
                                                case 6: // DNS List
                                                    {
                                                        uint8_t count = 0;
                                                        logMsg("DHCP option 6", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                                        while (optionLength >= 4)
                                                        {
                                                            uint32_t a = UDP_Read32();
                                                            if (count < 2)
                                                                localData.dnsAddress[count++] = a;

                                                            optionLength -= 4;
                                                        }
                                                    }
                                                    break;
                                                case 42: // NTP server
                                                    {
                                                        uint8_t count = 0;
                                                        logMsg("DHCP option 42", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                                        while (optionLength >= 4)
                                                        {
                                                            uint32_t a = UDP_Read32();
                                                            if (count < 2)
                                                                localData.ntpAddress[count++] = a;

                                                            optionLength -= 4;
                                                        }
                                                    }
                                                    break;
                                                case 51: // lease time
                                                    logMsg("DHCP option 51", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                                    if (optionLength >= 4)
                                                    {
                                                        uint32_t origLeaseTime;

                                                        origLeaseTime = UDP_Read32();
                                                        // localData.t2 = localData.t1 - 100; // 100 seconds faster for requests
                                                        localData.t1 = origLeaseTime >> 1; // be default set to 1/2 the lease length
                                                        localData.t2 = localData.t1;       // be default set to 1/2 the lease length
                                                        origLeaseTime = localData.t1 >> 1;
                                                        localData.t2 += origLeaseTime;
                                                        localData.t2 += origLeaseTime >> 1;

                                                        optionLength -= 4;
                                                    }
                                                    break;
                                                case 54: // DHCP server
                                                    logMsg("DHCP option 54", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                                    localData.dhcpServerIdentifier = UDP_Read32();
                                                    // printf("case54:%u\r\n",localData.dhcpServerIdentifier);
                                                    optionLength -= 4;
                                                    break;
                                                case 53:
                                                    logMsg("DHCP option 53", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                                    messageType = UDP_Read8();
                                                    optionLength -= 1;
                                                    break;
                                                default:
                                                    ETH_Dump(optionLength); // dump any unused bytes
                                                    break;
                                                } // option switch
                                            }     // length loop
                                        }         // Testing Vendor Information "Magic Cookie" (RFC1497)
                                        else
                                        {
                                            logMsg("DHCP failed Magic Cookie check", LOG_WARNING, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                        }
                                    } // MAC address test
                                    else
                                    {
                                        logMsg("DHCP fail MAC address check", LOG_WARNING, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                                        return;
                                    }
                                } // SIADDR test
                                else
                                {
                                    logMsg("DHCP fail SIADDR check", LOG_WARNING, (LOG_DEST_CONSOLE));
                                }
                            } // YIADDR test
                            else
                            {
                                logMsg("DHCP fail YIADDR check", LOG_WARNING, (LOG_DEST_CONSOLE));
                            }
                        } // xid test
                        else
                        {
                            logMsg("DHCP fail XID check", LOG_WARNING, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                        }
                    } // HLEN test
                    else
                    {
                        logMsg("DHCP fail Hardware Length", LOG_WARNING, (LOG_DEST_CONSOLE));
                    }
                } // 201 test
                else
                {
                    logMsg("DHCP fail 201 check", LOG_WARNING, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
                }
        } // Short packet test
        else
        {
                logMsg("DHCP fail short packet check", LOG_WARNING, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
        }
        switch (messageType)
        {
            case DHCP_OFFER:
                    if (acceptOffers)
                    {
                        dhcpData = localData; // capture the data in the offer
                        sendDHCPREQUEST();
                        dhcpState.rxClientState = REQUESTING;
                    }
                    if (declineOffers)
                    {
                        sendDHCPDECLINE();
                    }
                    break;
            case DHCP_ACK:
                    if (acceptACK)
                    {
                        dhcpData.t1 = localData.t1;
                        dhcpData.t2 = localData.t2;
                        ipdb_setAddress(dhcpData.dhcpIPAddress);
                        ipdb_setDNS(0, dhcpData.dnsAddress[0]);
                        ipdb_setDNS(1, dhcpData.dnsAddress[1]);
                        ipdb_setRouter(dhcpData.routerAddress);
                        ipdb_setGateway(dhcpData.gatewayAddress);
                        ipdb_setSubNetMASK(dhcpData.subnetMask);
                        if (dhcpData.ntpAddress[0])
                        {
                            ipdb_setNTP(0, dhcpData.ntpAddress[0]);
                            if (dhcpData.ntpAddress[1])
                                ipdb_setNTP(1, dhcpData.ntpAddress[1]);
                        }
                        dhcpState.rxClientState = BOUND;
                    }
                    break;
            case DHCP_NACK:
                    if (acceptNACK)
                    {
                        dhcpData.t1 = 4;
                        dhcpData.t2 = 2;
                        dhcpState.rxClientState = SELECTING;
                    }
                    break;
            default:
                    break;
        }
    } // accept types test
    else
    {
        logMsg("DHCP fail accept types check", LOG_INFO, (LOG_DEST_CONSOLE | LOG_DEST_ETHERNET));
    }
}

void DHCP_WriteZeros(uint16_t length)
{
    while(length--)
    {
        UDP_Write8(0);
    }
}
