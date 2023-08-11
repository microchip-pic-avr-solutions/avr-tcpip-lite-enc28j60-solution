/**
 * RTCC Header File
 *
 * @file rtcc.h
 * 
 * @ingroup tcpiplite
 * 
 * @brief This file provides the API implementation for the Real-Time Clock/Calendar (RTCC).
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

#ifndef RTCC_H
#define RTCC_H

// Included Files
#include <time.h>
#include <stdint.h>


// Variables
extern volatile bool dirtyTime;

// RTCC Functions
/**
 * @ingroup tcpiplite
 * @brief Initializes the clock calendar driver. 
 * This routine configures the basics of a software-driven RTCC peripheral. 
 * It relies upon a periodic timer event to provide time keeping. 
 * The appropriate timer needs to be selected in the TCP/IP Lite Dependency. 
 * Configure the selected timer to produce a time-out of 1s. Set the callback rate as 1, 
 * if required depending on the device. 
 * @param None.
 * @return None.
 */
void rtcc_init(void);

/**
 * @ingroup tcpiplite
 * @brief Maintains the deviceTime (seconds) using the LCDIF flag/interrupt. 
 * This routine decrements seconds_counter until 0 and then increments deviceTime. 
 * seconds_counter reloads with CLOCK_PER_SEC. It uses the timer selected as the Dependency by the user.
 * @param None.
 * @return None.
 */
void rtcc_handler(void);

/**
 * @ingroup tcpiplite
 * @brief Sets the device time to the passed unix time value and 
 * updates the device time with the passed unix time. 
 * Interrupts are disabled during the copy and restored to the original on exit.
 * @param *t A pointer of type time_t for the current time
 * @return None.
 */
void rtcc_set(time_t *t);

/**
 * @ingroup tcpiplite
 * @brief Returns the current device time. 
 * This routine retrieves the device time as either a return value or 
 * filling in a variable passed by reference. 
 * Interrupts are disabled during the copy and restored to the original on exit. 
 * time.h is a prerequisite for supporting the standard C time libraries 
 * and does not implement time, as it is application dependent. 
 * @param *t A pointer of type time_t for the current time
 * @return Value of the current time.
 */
time_t time(time_t *t);

#endif /* RTCC_H */
