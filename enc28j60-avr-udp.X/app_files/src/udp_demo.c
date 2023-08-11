/**
 * UDP Demo Application Source File
 * 
 * @file udp_demo.c
 * 
 * @ingroup udpdemo
 * 
 * @brief UDP demonstartion implementation.
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

// Included files
#include <stdint.h>
#include "../../mcc_generated_files/tcpiplite/udpv4.h"
#include "../../mcc_generated_files/tcpiplite/tcpip_config.h"
#include "../../mcc_generated_files/system/pins.h"
#include "../udp_demo.h"

// Variables
/**
 * @ingroup udpdemo
 * @brief UDP packet details defined by struct udpStart_t
 */
static udpStart_t udpPacket;

/**
 * @ingroup udpdemo
 * @brief Character array containing the text that will get sent as a UDP packet when the button is pressed.
 * Add your own text if needed.
 * Keep in mind your device limitations when adding long strings.
 */
char text[] = "Hello World";

// Functions
void UDP_Demo_Initialize(void)
{
    // TODO: Initialize the Destination IP address with your PC's IP address and Destination Port
    udpPacket.destinationAddress = MAKE_IPV4_ADDRESS(10,14,5,127);    
    udpPacket.destinationPortNumber = 65531;    
    
    // Port number of the device where this program will run
    udpPacket.sourcePortNumber = 65533;
}

void UDP_Demo_Recv(void)
{
    udpDemoRecv_t udpRecv;
    
   // Reads the UDP data
    UDP_ReadBlock(&udpRecv, sizeof(udpDemoRecv_t));
    
    /**
     * Logic to toggle LEDs based on commands sent from the Demo GUI.
     * If you want to use more LEDs, name them LED1, LED2 and so on.
     * Then uncomment the lines inside the respective switch cases
     */
    if(udpRecv.command == 'C')
    {
        switch(udpRecv.action)
        {
            case '1':
                LED0_Toggle();
                break;
            default:
                break;
        }
    }
}

void UDP_Demo_Send (void)
{
    error_msg ret = ERROR;
   
    // Starts the UDP Packet. Check udpv4.c for implementation.
    ret = UDP_Start(udpPacket.destinationAddress, udpPacket.sourcePortNumber, udpPacket.destinationPortNumber);
      
    if(ret == SUCCESS)
    {
        // Write the character array defined above to the packet that will be sent on UDP
        UDP_WriteString(text);
        // Send UDP Packet
        UDP_Send();
    }        
    
}

bool Button_Press(void)
{   
    static int8_t debounce = 10;
    static unsigned int buttonState = 0;
    static char buttonPressEnabled = 1;

    if(SW0_GetValue() == 0)
    {       
        if(buttonState < debounce)
        {
            buttonState++;
        }
        else if(buttonPressEnabled)
        {
            buttonPressEnabled = 0;
            return true;
        }
    }
    else if(buttonState > 0 )
    {
        buttonState--;
    }
    else
    {
        buttonPressEnabled = 1;
    }
    return false;
}
  

