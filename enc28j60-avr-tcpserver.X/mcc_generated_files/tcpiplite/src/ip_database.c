/**
 * IP Database Implementation Source File
 *
 * @file ip_database.c
 * 
 * @ingroup ipv4
 * 
 * @brief This file provides the API implementation for the IP database.
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
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "../ip_database.h"

// Variables
ip_db_info_t ip_database_info;

// IPDB Functions
void ipdb_init(void)
{
    ip_database_info.ipv4_myAddress = 0;
    ip_database_info.ipv4_subnetMask = 0;
    ip_database_info.ipv4_router = 0;
    for(uint8_t x=0; x < MAX_DNS; x ++)
        ip_database_info.ipv4_dns[x] = 0;
    for(uint8_t x=0; x < MAX_NTP; x++)
        ip_database_info.ipv4_ntpAddress[x] = 0;
    ip_database_info.ipv4_tftpAddress = 0;
}

uint32_t makeStrToIpv4Address(char *str)
{
    uint32_t ip_addr;
    char *pch;    
    uint8_t field = 3;
    pch = strtok(str,".");
    while(pch != NULL)
    {        
       ((uint8_t *)&ip_addr)[field]= (uint8_t)atoi((const char*)pch);
        field--;     
        pch = strtok (NULL,".");
    }
    return ip_addr;
}

char *makeIpv4AddresstoStr(uint32_t addr)
{
    static char ip_str[15];
    
    sprintf(ip_str,"%d.%d.%d.%d",((char*)&addr)[3],((char*)&addr)[2],((char*)&addr)[1],((char*)&addr)[0]);    
    
    return ip_str;
}
