/**
 * IP Database Header File
 *
 * @file ip_database.h
 * 
 * @ingroup ipv4
 * 
 * @brief This file contains IP addresses for different operations.
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

#ifndef IP_DATABASE_H
#define IP_DATABASE_H

// Macros
#define MAX_DNS 2
#define MAX_NTP 2

#define IPV4_ZERO_ADDRESS              0
#define SPECIAL_IPV4_BROADCAST_ADDRESS 0xFFFFFFFF
#define CLASS_A_IPV4_BROADCAST_MASK    0XFF000000
#define CLASS_B_IPV4_BROADCAST_MASK    0xFFFF0000
#define CLASS_C_IPV4_BROADCAST_MASK    0xFFFFFF00
#define ALL_HOST_MULTICAST_ADDRESS     0xE0000001
#define LOCAL_HOST_ADDRESS             0x7F000001

#define CLASS_A_IPV4_REVERSE_BROADCAST_MASK    0x00FFFFFF
#define CLASS_B_IPV4_REVERSE_BROADCAST_MASK    0x0000FFFF
#define CLASS_C_IPV4_REVERSE_BROADCAST_MASK    0X000000FF

/**
 @ingroup ipv4
 @struct ip_db_info_t
 @brief Contains IP information.
 */
typedef struct  {
    uint32_t ipv4_myAddress;            /**< IP address*/
    uint32_t ipv4_dns[MAX_DNS];         /**< Primary & secondary DNS addresses*/
    uint32_t ipv4_subnetMask;           /**< Subnet mask*/
    uint32_t ipv4_router;               /**< Router address*/
    uint32_t ipv4_gateway;              /**< Gateway address*/
    uint32_t ipv4_ntpAddress[MAX_NTP];  /**< NTP addresses*/
    uint32_t ipv4_tftpAddress;          /**< TFTP address*/
} ip_db_info_t;

extern ip_db_info_t ip_database_info;

#define ipdb_getAddress()		(ip_database_info.ipv4_myAddress)
#define ipdb_getDNS(x)          (x < MAX_DNS ? ip_database_info.ipv4_dns[x] : ip_database_info.ipv4_dns[0])
#define ipdb_getSubNetMASK()	(ip_database_info.ipv4_subnetMask)
#define ipdb_getRouter()		(ip_database_info.ipv4_router)
#define ipdb_getNTP(x)			(x < MAX_NTP ? ip_database_info.ipv4_ntpAddress[x] : ip_database_info.ipv4_ntpAddress[0])
#define ipdb_getTFTP() 			(ip_database_info.ipv4_tftpAddress)
#define ipdb_classAbroadcastAddress()  (ip_database_info.ipv4_myAddress|CLASS_A_IPV4_REVERSE_BROADCAST_MASK)
#define ipdb_classBbroadcastAddress()  (ip_database_info.ipv4_myAddress|CLASS_B_IPV4_REVERSE_BROADCAST_MASK)
#define ipdb_classCbroadcastAddress()  (ip_database_info.ipv4_myAddress|CLASS_C_IPV4_REVERSE_BROADCAST_MASK)
#define ipdb_specialbroadcastAddress() SPECIAL_IPV4_BROADCAST_ADDRESS

#define ipdb_setAddress(a)		do{ ip_database_info.ipv4_myAddress = a; } while(0)
#define ipdb_setDNS(x,v)		do{ if(x < MAX_DNS) ip_database_info.ipv4_dns[x] = v; } while(0)
#define ipdb_setSubNetMASK(m)	do{ ip_database_info.ipv4_subnetMask = m; } while(0)
#define ipdb_setRouter(r) 		do{ ip_database_info.ipv4_router = r; } while(0)
#define ipdb_setGateway(g) 		do{ ip_database_info.ipv4_gateway = g; } while(0)
#define ipdb_setNTP(x,n) 		do{ if(x < MAX_NTP) ip_database_info.ipv4_ntpAddress[x] = n; } while(0)
#define ipdb_setTFTP(a) 		do{ ip_database_info.ipv4_tftpAddress = a; } while(0)

// IPDB Functions
/**
 @ingroup ipv4
 @brief Initializes the IP database. 
 @param None.
 @return None.
 */
void ipdb_init(void);

/**
 @ingroup ipv4
 @brief Converts a string into a 32-bit IPv4 address.
 @param *str IPv4 address in a string format
 @return IPv4 address.
 */
uint32_t makeStrToIpv4Address(char *str);

/**
 @ingroup ipv4
 @brief Converts an IPv4 address into a string.
 @param addr 32-bit IPV4 address
 @return IPV4 address in a string format.
 */
char *makeIpv4AddresstoStr(uint32_t addr);

#endif	/* IP_DATABASE_H */
