/**
 * UDP Demo Application Header File
 * 
 * @file udp_demo.h
 * 
 * @ingroup udpdemo UDPDEMO
 * 
 * @brief User Datagram Protocol(UDP) demonstration implementation.
 * 
 * @version UDP Demo Application Version 5.0.0
 * 
 */

/*
© [2023] Microchip Technology Inc. and its subsidiaries.

	Subject to your compliance with these terms, you may use Microchip
	software and any derivatives exclusively with Microchip products.
	You are responsible for complying with 3rd party license terms
	applicable to your use of 3rd party software (including open source
	software) that may accompany Microchip software. SOFTWARE IS "AS IS".
	NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
	SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, 
	MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
	WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
	INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
	KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
	MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
	FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S 
	TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
	EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
	THIS SOFTWARE.
*/

#ifndef _UDP_DEMO_H
#define _UDP_DEMO_H

// Included files
#include "../mcc_generated_files/system/system.h"

// Structures
/**
 * @ingroup udpdemo
 * @struct udpDemoRecv_t
 * @brief Defines how the received packet will be interpreted
 */
typedef struct
{
    char command;   /**<First character resolved as a command */
    char action;    /**<Second character resolved as an instruction */
}udpDemoRecv_t;

/**
 * @ingroup udpdemo
 * @struct udpStart_t
 * @brief Contains port and address details for the UDP packets.
 */
typedef struct
{
    uint32_t destinationAddress;    /**<Destination address */
    uint16_t sourcePortNumber;      /**<Source port number */
    uint16_t destinationPortNumber; /**<Destination port number */
}udpStart_t;

/**
 * @ingroup udpdemo
 * @brief UDP Packet Initializations.
 * @param None.
 * @return None.
 */
void UDP_Demo_Initialize(void);

/**
 * @ingroup udpdemo
 * @brief Handles sending of text over UDP as a packet.
 * @param None.
 * @return None.
 */
void UDP_Demo_Send (void);

/**
 * @ingroup udpdemo
 * @brief Runs procedures based on the UDP packets received.
 * @param None.
 * @return None.
 */
void UDP_Demo_Recv(void);

/**
 * @ingroup udpdemo
 * @brief Handles debouncing on button press.
 * @param None.
 * @retval True if button is pressed 
 * @retval False if button is not pressed
 */
bool Button_Press(void);

#endif	//_UDP_DEMO_H



