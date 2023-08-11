/**
 * Log Console Source File	
 *
 * @file log_console.c
 * 
 * @ingroup tcpiplite
 * 
 * @brief  This file provides the API implementation for sending log messages to the console.
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
#include <stdint.h>
#include "../../system/system.h"
#include "../log.h"
#include "../ip_database.h"

// Log Console Functions
uint8_t logConsole(const char *message, uint8_t priorityVal)
{
    struct tm * SYSLOG_time1;   
    time_t time1;   
    unsigned long ip;
    
    ip = ipdb_getAddress();   
    time1 = time(NULL);
    SYSLOG_time1 = gmtime(&time1); 
        
    printf("<%d>%d %d-%.2d-%.2dT%.2d:%.2d:%.2dZ %d.%d.%d.%d %s %s %s %s[%s]\r\n", priorityVal, SYSLOG_VERSION, SYSLOG_time1->tm_year, SYSLOG_time1->tm_mon, SYSLOG_time1->tm_mday, SYSLOG_time1->tm_hour, SYSLOG_time1->tm_min, SYSLOG_time1->tm_sec, ((char*)&ip)[3],((char*)&ip)[2],((char*)&ip)[1],((char*)&ip)[0], LOG_NILVALUE, LOG_NILVALUE, LOG_NILVALUE, LOG_NILVALUE, message);
    return 1;
}
