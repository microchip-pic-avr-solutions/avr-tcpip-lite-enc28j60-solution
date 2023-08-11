/**
 * Log API Header File
 *
 * @file log.h
 *
 * @ingroup tcpiplite
 *
 * @brief This file provides the API implementation for sending log messages.
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

#ifndef LOG_H
#define LOG_H

// Included Files
#include <stdint.h>
#include <stdbool.h>

// Macros
#define LOG_DEST_ETHERNET 	0b00000001
#define LOG_DEST_CONSOLE 	0b00000010
#define LOG_DEST_EEPROM 	0b00000100

#define LOG_ETHERNET_MASK(m) 	(m & LOG_DEST_ETHERNET)
#define LOG_CONSOLE_MASK(m) 	(m & LOG_DEST_CONSOLE)
#define LOG_EEPROM_MASK(m) 		(m & LOG_DEST_EEPROM)

#define SYSLOG_VERSION 1
#define LOG_NILVALUE "-"

/**
 * @ingroup tcpiplite
 * @enum LOG_SEVERITY
 * @brief PRI Priorities severity
 */
typedef enum
{
	LOG_EMERGENCY 	= 0,	/**<System is unusable */
	LOG_ALERTS 		= 1,	/**<Action must be taken immediately */
	LOG_CRITICAL 	= 2,	/**<Critical conditions */
	LOG_ERROR 		= 3,	/**<Error conditions */
	LOG_WARNING 	= 4,	/**<Warning conditions */
	LOG_NOTICE 		= 5,	/**<Normal but signification condition */
	LOG_INFO 		= 6,	/**<Informational messages*/
	LOG_DEBUG 		= 7		/**<Debug-level messages */
} LOG_SEVERITY;

/**
 * @ingroup tcpiplite
 * @enum LOG_FACILITY
 * @brief PRI facility codes
 * These facility codes represent the Connected Lighting Stack.
 * Facility codes MUST be in the range of 0 to 23 inclusive
 */
typedef enum
{
	LOG_KERN,	/**<Kernel messages */
	LOG_DTLS,	/**<DTLS messages */
	LOG_ECC,	/**<ECC system */
	LOG_DAEMON, /**<System daemons */
	LOG_AUTH,	/**<Security/authorization messages */
	LOG_SYSLOG, /**<Messages generated internally by syslogd */
	LOG_LPR,	/**<Line printer subsystem */
	LOG_NEWS,	/**<Network news subsystem */
	LOG_TFTP,	/**<TFTP service */
	LOG_UUID,	/**<UUID service */
	LOG_COAP,	/**<CoAP service */
	LOG_FTP,	/**<FTP daemon */
	LOG_NTP,	/**<NTP subsystem */
	LOG_HTTP,	/**<HTTP Server*/
	LOG_SNMP,	/**<SNMP subsystem */
	LOG_RTCC,	/**<Real-Time Clock Service */
	LOG_CBOR,	/**<CBOR encoding and decoding  */
	LOG_UDP,	/**<UDP system */
	LOG_TCP,	/**<TCP system */
	LOG_DHCP,	/**<DHCP service */
	LOG_DNS,	/**<DNS service */
	LOG_LLDP,	/**<LLDP service */
	LOG_LINK,	/**<URI service  */

	LOG_LAST 	/**<To be kept at the end of the list */
} LOG_FACILITY;

/**
 * @ingroup tcpiplite
 * @struct logFields_t
 * @brief Log fields
 */
typedef struct
{
	LOG_FACILITY logFacility;
	LOG_SEVERITY severityThreshold;
} logFields_t;

extern const char *LOG_Month[];

/**
 * @ingroup tcpiplite
 * @var severityThresholdTable[]
 * @brief Sets the severity threshold for each facility
 */
extern const logFields_t severityThresholdTable[];

// Log function declarations
/**
 * @ingroup tcpiplite
 * @brief Initializes the service to send log messages.
 * Testing for externals property is done in Subversion (SVN).
 * @param None.
 * @return None.
 */
void LOG_Init(void);

/**
 * @ingroup tcpiplite
 * @brief Creates a log message with specified fields.
 * @param *message
 * @param facility Message facility
 * @param severity Message severity
 * @param logDest Message logging destination
 * @return None.
 */
void logMessage(const char *message, LOG_FACILITY facility, LOG_SEVERITY severity, uint8_t logDest);

#endif /* LOG_H */
