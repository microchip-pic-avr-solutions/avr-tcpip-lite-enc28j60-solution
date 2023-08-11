/**
 * RTCC Implementation Source File
 *
 * @file rtcc.c
 *
 * @ingroup tcpiplite
 *
 * @brief This file provides the API implementation for the RTCC.
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
#include <stdint.h>
#include <stdbool.h>
#include "../rtcc.h"
#include "../../system/system.h"

// Variables
volatile time_t deviceTime;
volatile bool dirtyTime;

volatile uint16_t seconds_counter;

// Local RTCC Function Prototypes

void rtcc_init(void)
{
    deviceTime = 1293861600;
    TCA0_OverflowCallbackRegister(rtcc_handler);
}

void rtcc_handler(void)
{
	deviceTime++;
}

void rtcc_set(time_t *t)
{
	volatile uint8_t sreg_val;
    sreg_val = SREG;
    DISABLE_INTERRUPTS();
    deviceTime = *t;
    SREG = sreg_val;
}

time_t time(time_t *t)
{
    time_t  the_time;

	volatile uint8_t sreg_val;

	sreg_val = SREG;
    DISABLE_INTERRUPTS();
    the_time = deviceTime;
    SREG = sreg_val;
    if(t)
    {
        *t = the_time;
    }

    return (the_time);
}

