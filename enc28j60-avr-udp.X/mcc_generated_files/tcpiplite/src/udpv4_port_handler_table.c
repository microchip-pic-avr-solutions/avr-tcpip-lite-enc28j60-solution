/**
 * UDP Port Handler Source File
 *
 * @file udpv4_port_handler_table.c
 * 
 * @ingroup udp
 * 
 * @brief This file provides the API implementation for the UDP v4 protocol.
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
#include "../tcpip_config.h"
#include "../dhcp_client.h"
#include "../udpv4_port_handler_table.h"
#include "../../../app_files/udp_demo.h"

const udp_handler_t UDP_CallBackTable[] = \
{
    {65531, UDP_Demo_Recv},
	{68, DHCP_Handler},    
  	
};

// UDPV4 Port Handler Functions
udp_table_iterator_t udp_table_getIterator(void)
{
    if (sizeof(UDP_CallBackTable) == 0)
        return (udp_table_iterator_t) NULL;
    else
        return (udp_table_iterator_t) UDP_CallBackTable;
}

udp_table_iterator_t udp_table_nextEntry(udp_table_iterator_t i)
{
    i++;
    if(i < UDP_CallBackTable + sizeof(UDP_CallBackTable))
        return (udp_table_iterator_t) i;
    else
        return (udp_table_iterator_t) NULL;
}
