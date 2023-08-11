/**
 * Log Syslog Header File
 *
 * @file log_syslog.h
 * 
 * @ingroup tcpiplite
 * 
 * @brief This file provides the API implementation for sending log messages using Ethernet (Syslog RFC 5424).
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
 
#ifndef LOG_SYSLOG_H
#define	LOG_SYSLOG_H

// Included Files
#include <stdint.h>
#include "tcpip_types.h"

// Macros
#define SOURCEPORT_SYSLOG   514
#define DESTPORT_SYSLOG     514

// Syslog Functions
/**
 @ingroup tcpiplite
 @brief Sends a syslog message.
 @param *message
 @param priorityVal Message priority
 @return Status of sending the message. Refer to the error description in tcpip_types.h.
 */
error_msg logSyslog(const char *message, uint8_t priorityVal);

#endif	/* LOG_SYSLOG_H */
