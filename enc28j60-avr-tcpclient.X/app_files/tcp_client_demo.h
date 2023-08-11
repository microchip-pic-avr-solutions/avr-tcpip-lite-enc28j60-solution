/**
 * TCP Client Demo Application Header File
 * 
 * @file tcp_client_demo.h
 * 
 * @ingroup tcpclientdemo TCPCLIENTDEMO
 * 
 * @brief Transmission Control Protocol (TCP) Client demonstration implementation.
 * 
 * @version TCP Client Demo Application Version 5.0.0
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
 
#ifndef TCP_CLIENT_DEMO_H
#define TCP_CLIENT_DEMO_H

/**
 * @ingroup tcpclientdemo
 * @brief Implements the TCP Client Demo procedures.
 * @param None.
 * @return None.
 */
void TCP_Demo_Client(void);

/**
 * @ingroup tcpclientdemo
 * @brief Initilaizes the port and addresses for the TCP Client.
 * @param None.
 * @return None.
 */
void TCP_Client_Initialize(void);

#endif