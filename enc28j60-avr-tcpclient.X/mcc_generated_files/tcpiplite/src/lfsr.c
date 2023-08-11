/**
 * LFSR Implementation Source File
 *
 * @file lfsr.c
 * 
 * @ingroup tcpiplite
 * 
 * @brief  This file provides the API prototypes for the Linear Feedback Shift Register (LFSR) module.
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
#include "../lfsr.h"

// Macros
#define lfsr_seed  0x40
#define lfsrOutputMask  0x7fu

// Variables
static uint8_t sequenceIndex = 0;
const lfsr_t xorSequences[] = {0x41,0x44,0x47,0x48,0x4E,0x53,0x55,0x5C,0x5F,0x60,0x65,0x69,0x6A,0x72,0x77,0x78,0x7B,0x7E};
lfsr_t xor_mask = 0x41;  // note this comes from the first entry in the sequence list
lfsr_t lfsr_value = lfsr_seed;

// LFSR functions
lfsr_t lfsr_getSequence(void)
{
	return xorSequences[sequenceIndex];
}

int lfsr_getSequenceCount(void)
{
	return sizeof(xorSequences)/sizeof(*xorSequences);
}

void lfsr_reset(void)
{
	lfsr_value = lfsr_seed;
}

void lfsr_setSequence(uint16_t s)
{
	s %= sizeof(xorSequences)/sizeof(*xorSequences);
	xor_mask = xorSequences[s];
}

lfsr_t lfsr(void)
{
	unsigned char lsb = lfsr_value & 1u;
	lfsr_value >>= 1u;
	if (lsb)
		lfsr_value ^= xor_mask;
	return lfsr_value & lfsrOutputMask;
}

lfsr_t lfsrWithSeed(uint8_t lfsrSeed)
{
    lfsr_value = lfsrSeed;  
	unsigned char lsb = lfsr_value & 1u;
	lfsr_value >>= 1;
	if (lsb)
		lfsr_value ^= xor_mask;
	return lfsr_value & lfsrOutputMask;
}
