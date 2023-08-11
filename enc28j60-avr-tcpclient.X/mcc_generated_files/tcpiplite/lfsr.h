/**
 * lfsr API Header File
 *
 * @file lfsr.h
 * 
 * @ingroup tcpiplite
 * 
 * @brief This file provides the API implementation for the Linear Feedback Shift Register (LFSR).
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

#ifndef LFSR_H
#define LFSR_H

// Included files
#include <stdint.h>

typedef uint8_t lfsr_t;

// LFSR functions
/**
 @ingroup tcpiplite
 @brief Returns the LFSR sequence count.
 @param None.
 @return Sequence count.
 */
int lfsr_getSequenceCount(void);

/**
 @ingroup tcpiplite
 @brief Returns the LFSR sequence.
 @param None.
 @return Sequence.
 */
lfsr_t lfsr_getSequence(void);

/**
 @ingroup tcpiplite
 @brief Resets the LFSR.
 @param None.
 @return None.
 */
void lfsr_reset(void);

/**
 @ingroup tcpiplite
 @brief Sets the LFSR sequence.
 @param s Sequence
 @return None.
 */
void lfsr_setSequence(uint16_t s);

/**
 @ingroup tcpiplite
 @brief Returns the LFSR value.
 @param None.
 @return Value of LFSR.
 */
lfsr_t lfsr(void);

/**
 @ingroup tcpiplite
 @brief Returns the LFSR value with seed.
 @param lfsrSeed LFSR with seed
 @return Value of LFSR with seed.
 */
lfsr_t lfsrWithSeed(uint8_t lfsrSeed);

#endif /* LFSR_H */
