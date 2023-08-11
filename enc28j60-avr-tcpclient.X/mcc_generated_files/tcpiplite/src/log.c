/**
 * Message Logging Implementation Source File	
 *
 * @file log.c
 * 
 * @ingroup tcpiplite
 * 
 * @brief  This file provides the API implementation for message logging.
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
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "../rtcc.h"
#include "../log.h"
#include "../log_console.h"
#include "../log_syslog.h"

// Macros
/**
 * @ingroup tcpiplite
 * @def LOG_PRIMASK
 * @brief Mask to extract priority part (internal) 
 */
#define	LOG_PRIMASK	0x07

/**
 * @ingroup tcpiplite
 * @def LOG_PRI(p)
 * @brief Extract priority
 */
#define	LOG_PRI(p)	((p) & LOG_PRIMASK)

/**
 * @ingroup tcpiplite
 * @def LOG_NFACILITIES
 * @brief Current number of facilities
 */
#define LOG_NFACILITIES 24 

/**
 * @ingroup tcpiplite
 * @def LOG_FACMASK
 * @brief Mask to extract facility part
 */
#define LOG_FACMASK    0x03f8

/**
 * @ingroup tcpiplite
 * @def LOG_FAC(p)
 * @brief Facility of priority
 */
#define LOG_FAC(p)              (((p) & LOG_FACMASK) >> 3)
#define	LOG_MAKEPRI(fac, pri)	(((fac) << 3) | (pri))

// Arguments to setlogmask
/**
 * @ingroup tcpiplite
 * @def LOG_MASK(pri)
 * @brief Mask for one priority
 */
#define	LOG_MASK(pri)	(1 << (pri))

/**
 * @ingroup tcpiplite
 * @def LOG_UPTO(pri)
 * @brief All priorities through PRI
 */
#define	LOG_UPTO(pri)	((1 << ((pri)+1)) - 1)
#define LOG_NILVALUE "-"

LOG_SEVERITY limit[LOG_LAST]; // one limit per facility

const logFields_t severityThresholdTable[] = {
    {  LOG_KERN,   LOG_INFO },
    {  LOG_DTLS,   LOG_NOTICE },
    {  LOG_ECC,   LOG_NOTICE },
    {  LOG_DAEMON, LOG_INFO },
    {  LOG_AUTH,   LOG_NOTICE },
    {  LOG_SYSLOG, LOG_NOTICE },
    {  LOG_LPR,    LOG_INFO },
    {  LOG_NEWS,   LOG_NOTICE },
    {  LOG_TFTP,   LOG_INFO },
    {  LOG_UUID,   LOG_NOTICE },
    {  LOG_COAP,   LOG_NOTICE },
    {  LOG_FTP,    LOG_NOTICE },
    {  LOG_NTP,    LOG_INFO },
    {  LOG_HTTP,   LOG_NOTICE },
    {  LOG_SNMP,   LOG_NOTICE },
    {  LOG_RTCC,   LOG_NOTICE },
    {  LOG_CBOR,   LOG_INFO },
    {  LOG_UDP,    LOG_NOTICE },
    {  LOG_TCP,    LOG_NOTICE },
    {  LOG_DHCP,   LOG_INFO },
    {  LOG_DNS,    LOG_NOTICE },
    {  LOG_LLDP,   LOG_INFO },
    {  LOG_LINK,   LOG_NOTICE },
    
    {  LOG_LAST,   LOG_NOTICE }
};
 
// Logging function definitions
void LOG_Init(void)
{
    unsigned long t = (unsigned long)time(0);
    printf("\n\nStarting Syslog at %lu\n",t);
    for(uint8_t x=0;x<LOG_LAST;x++) 
    {
        limit[(uint8_t)severityThresholdTable[x].logFacility] = severityThresholdTable[x].severityThreshold;   
    }
}

void logMessage(const char *message, LOG_FACILITY facility, LOG_SEVERITY severity, uint8_t logDest)
{
    uint8_t priVal;
    
    priVal = (uint8_t)LOG_MAKEPRI(facility, severity);
    
    if((severity <= limit[(uint8_t)severityThresholdTable[(uint8_t)facility].logFacility]) && // only report messages that are more severe than the limit
            (priVal <= 191)) // RFC3164 requires PRIVAL 0-191
    {
        if(LOG_ETHERNET_MASK(logDest) == LOG_DEST_ETHERNET)
        {       
            logSyslog(message, priVal);
        }
        if(LOG_CONSOLE_MASK(logDest) == LOG_DEST_CONSOLE)
        {
            logConsole(message, priVal);
        }
    }
}
