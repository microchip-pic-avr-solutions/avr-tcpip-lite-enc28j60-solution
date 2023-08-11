/**
 * Sending Syslog Source File 
 *
 * @file log_syslog.c
 * 
 * @ingroup tcpiplite
 * 
 * @brief  This file provides the API implementation for sending syslog messages.
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
#include "../tcpip_types.h"
#include "../udpv4.h"
#include "../udpv4_port_handler_table.h"
#include "../ip_database.h"
#include "../log_syslog.h"

// Syslog Functions
error_msg logSyslog(const char *message, uint8_t priorityVal)
{    
    char storage[12];      
    struct tm * SYSLOG_time1;   
    time_t time1;
    error_msg error;
    unsigned long ip;
    
    ip = ipdb_getAddress();    
    time1 = time(NULL);
    error = UDP_Start(0xFFFFFFFF,SOURCEPORT_SYSLOG,DESTPORT_SYSLOG);
    
    if( SUCCESS == error)
    {
        SYSLOG_time1 = gmtime(&time1);
        sprintf(storage,"<%d>%d ",priorityVal, SYSLOG_VERSION);
        UDP_WriteString(storage);
        sprintf(storage,"%d-%.2d-%.2d",SYSLOG_time1->tm_year, SYSLOG_time1->tm_mon, SYSLOG_time1->tm_mday);
        UDP_WriteString(storage);
        sprintf(storage,"T%.2d:%.2d:%.2dZ",SYSLOG_time1->tm_hour, SYSLOG_time1->tm_min, SYSLOG_time1->tm_sec);
        UDP_WriteString(storage);
        sprintf(storage," %d.%d.%d.%d",((char*)&ip)[3],((char*)&ip)[2],((char*)&ip)[1],((char*)&ip)[0]); //Hostnmame      
        UDP_WriteString(storage);
        sprintf(storage," %s", LOG_NILVALUE);   // App-name
        UDP_WriteString(storage);
        sprintf(storage," %s", LOG_NILVALUE);   // Procid
        UDP_WriteString(storage);   
        sprintf(storage," %s", LOG_NILVALUE);   // Msgid
        UDP_WriteString(storage);    
        sprintf(storage," %s[", LOG_NILVALUE);  // Structured data
        UDP_WriteString(storage);        
        UDP_WriteString(message);
        sprintf(storage,"]");                   // Structured data
        UDP_WriteString(storage);    
        UDP_Send();
    }    
    return error;
}
