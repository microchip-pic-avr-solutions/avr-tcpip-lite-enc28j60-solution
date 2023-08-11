/**
 * Physical Layer Interface Header File
 *
 * @file physical_layer_interface.h
 *
 * @defgroup ethdriver8bit Ethernet Driver 8-Bit Interface
 *
 * @brief This file includes definitions of public interface for an Ethernet driver.
 * See individual Ethernet drivers for specific implementations of this interface.
 *
 * @version Ethernet Driver 8-Bit Interface Version 6.0.0
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

#ifndef PHYSICAL_LAYER_INTERFACE_H
#define PHYSICAL_LAYER_INTERFACE_H

// Include Headers
#include <stdbool.h>
#include <stdint.h>

// Macros
#ifndef __XC8
#define NOP() __asm__ __volatile__("nop")
#endif
#define ETH_packetReady() ethData.pktReady
#define ETH_linkCheck()   ethData.up
#define ETH_linkChanged() ethData.linkChange

// Structs/Enums/Unions

/**
 * @ingroup ethdriver8bit
 * @enum ethernetDriver_t
 * @brief Ethernet Driver status.
 */
typedef struct
{
    unsigned error : 1;
    unsigned pktReady : 1;
    unsigned up : 1;
    unsigned idle : 1;
    unsigned linkChange : 1;
    unsigned bufferBusy : 1;
    unsigned : 3;
    uint16_t saveRDPT;
    uint16_t saveWRPT;
} ethernetDriver_t;

extern volatile ethernetDriver_t ethData;

/**
 * @ingroup ethdriver8bit
 * @enum txPacket_t
 * @brief Transmission packet.
 */
typedef struct
{
    uint16_t flags;
    uint16_t packetStart;
    uint16_t packetEnd;
    void *prevPacket;
    void *nextPacket;
} txPacket_t;

/**
 * @ingroup ethdriver8bit
 * @enum phy_error_msg
 * @brief PHY status/errors.
 */
typedef enum
{
    PHY_ERROR = 0,
    PHY_SUCCESS,
    PHY_LINK_NOT_FOUND,
    PHY_BUFFER_BUSY,
    PHY_TX_LOGIC_NOT_IDLE,
    PHY_TX_QUEUED,
    PHY_DMA_TIMEOUT,
} phy_error_msg;

/**
 * @ingroup ethdriver8bit
 * @union mac48Address_t
 * @brief MAC Address (48-bits).
 */
typedef union
{
    uint8_t mac_array[6];
    struct
    {
        uint8_t byte1, byte2, byte3, byte4, byte5, byte6;
    } s;
} mac48Address_t;

/**
 * @ingroup ethdriver8bit
 * @union mac64Address_t
 * @brief MAC Address (64-bits).
 */
typedef union
{
    uint8_t mac_array[8];
    struct
    {
        uint8_t byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8;
    } s;
} mac64Address_t;

extern mac48Address_t hostMacAddress;
extern const mac48Address_t broadcastMAC;

// Ethernet Driver APIs

/**
 * @ingroup ethdriver8bit
 * @brief Sets up the Ethernet and starts the execution. Initializes the TX/RX buffer, the MAC and the PHY.
 * @param None.
 * @return None.
 */
void ETH_Init(void);

/**
 * @ingroup ethdriver8bit
 * @brief Manages the MAC events. Can be used for polling or for new events in Interrupt Service Routine (ISR).
 * @param None.
 * @return None.
 */
void ETH_EventHandler(void);

/**
 * @ingroup ethdriver8bit
 * @brief Updates the pointers for the next available RX packets. 
 * Retrieves information about the last received packet and the address of the next ones.
 * @param None.
 * @return None.
 */
void ETH_NextPacketUpdate(void);

/**
 * @ingroup ethdriver8bit
 * @brief Resets the receiver buffer.
 * @param None.
 * @return None.
 */
void ETH_ResetReceiver(void);

/**
 * @ingroup ethdriver8bit
 * @brief Resets the system software.
 * @param None.
 * @return None.
 */
void ETH_SendSystemReset(void);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the MAC address of type mac48Address_t.
 * @param None.
 * @return MAC address.
 */
const mac48Address_t *MAC_getAddress(void);

// Read functions for data

/**
 * @ingroup ethdriver8bit
 * @brief Reads a block of data from the RX buffer MAC.
 * @param *buffer
 * @param length
 * @return Read count.
 */
uint16_t ETH_ReadBlock(void *buffer, uint16_t length);

/**
 * @ingroup ethdriver8bit
 * @brief Reads one byte of data from the RX buffer MAC.
 * @param None.
 * @return One byte of data.
 */
uint8_t ETH_Read8(void);

/**
 * @ingroup ethdriver8bit
 * @brief Reads two bytes of data from the RX buffer and returns them in host order.
 * @param None.
 * @return Two bytes of data.
 */
uint16_t ETH_Read16(void);

/**
 * @ingroup ethdriver8bit
 * @brief Reads three bytes of data from the RX buffer and returns them in host order.
 * @param None.
 * @return Three bytes of data.
 */
uint32_t ETH_Read24(void);

/**
 * @ingroup ethdriver8bit
 * @brief Reads four bytes of data from the RX buffer and returns them in host order.
 * @param None.
 * @return Four bytes of data.
 */
uint32_t ETH_Read32(void);

/**
 * @ingroup ethdriver8bit
 * @brief Drops the N bytes from a packet list when the data is lost. Clears a number of bytes (length) from the RX buffer.
 * @param length
 * @return None.
 */
void ETH_Dump(uint16_t length);

/**
 * @ingroup ethdriver8bit
 * @brief Drops the rest of this packet and release the buffer.
 * Clears all bytes from the RX buffer.
 * @param None.
 * @return None.
 */
void ETH_Flush(void);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the available space size in the Ethernet TX buffer.
 * @param None.
 * @return Available space left in the TX buffer.
 */
uint16_t ETH_GetFreeTxBufferSize(void);

/**
 * @ingroup ethdriver8bit
 * @brief Starts a packet if the Ethernet transmitter is idle.
 * @param *dest_mac
 * @param type
 * @retval PHY_SUCCESS Packet started
 * @retval PHY_BUFFER_BUSY Buffer is busy
 * @retval PHY_TX_LOGIC_NOT_IDLE Transmitter is busy
 */
phy_error_msg ETH_WriteStart(const mac48Address_t *dest_mac, uint16_t type);

/**
 * @ingroup ethdriver8bit
 * @brief Writes a string of data into the MAC.
 * @param *string
 * @return None.
 */
uint16_t ETH_WriteString(const char *string);

/**
 * @ingroup ethdriver8bit
 * @brief Writes a block of data into the TX buffer MAC.
 * @param *data
 * @param length
 * @return Length.
 */
uint16_t ETH_WriteBlock(const char *data, uint16_t length);

/**
 * @ingroup ethdriver8bit
 * @brief Writes one byte of data into the TX buffer MAC.
 * @param data
 * @return None.
 */
void ETH_Write8(uint8_t data);

/**
 * @ingroup ethdriver8bit
 * @brief Writes two bytes into the TX buffer MAC in Network order.
 * @param data
 * @return None.
 */
void ETH_Write16(uint16_t data);

/**
 * @ingroup ethdriver8bit
 * @brief Writes three bytes into the TX buffer MAC in Network order.
 * @param data
 * @return None.
 */
void ETH_Write24(uint32_t data);

/**
 * @ingroup ethdriver8bit
 * @brief Writes four bytes into the TX buffer MAC in Network order.
 * @param data
 * @return None.
 */
void ETH_Write32(uint32_t data);

/**
 * @ingroup ethdriver8bit
 * @brief Inserts N data bytes into a specific offset in the TX buffer/packet.
 * @param *data
 * @param len length
 * @param offset
 * @return None.
 */
void ETH_Insert(char *data, uint16_t len, uint16_t offset);

/**
 * @ingroup ethdriver8bit
 * @brief Copies N bytes from the saved read location (RX buffer) into the current TX location (TX buffer) using the DMA set up.
 * This is used for ICMP ECHO to eliminate the need to extract the arbitrary payload.
 * @param len length
 * @retval PHY_SUCCESS
 * @retval PHY_DMA_TIMEOUT
 */
phy_error_msg ETH_Copy(uint16_t len);

/**
 * @ingroup ethdriver8bit
 * @brief Sends the TX packet.
 * Starts the transmission of packet or queues the packet that has been created.
 * @param None.
 * @retval PHY_SUCCESS
 * @retval PHY_BUFFER_BUSY
 * @retval PHY_LINK_NOT_FOUND
 * @retval PHY_TX_QUEUED
 * @retval PHY_TX_LOGIC_NOT_IDLE
 */
phy_error_msg ETH_Send(void);

/**
 * @ingroup ethdriver8bit
 * @brief Calculates the hardware checksum of length bytes starting with the position.
 * @param position
 * @param length
 * @param seed
 * @return Checksum.
 */
uint16_t ETH_TxComputeChecksum(uint16_t position, uint16_t length, uint16_t seed);

/**
 * @ingroup ethdriver8bit
 * @brief Calculates the RX software checksum.
 * @param len length
 * @param seed
 * @return Checksum.
 */
uint16_t ETH_RxComputeChecksum(uint16_t len, uint16_t seed);

/**
 * @ingroup ethdriver8bit
 * @brief Reads the MAC address.
 * @param *macAddr
 * @return None.
 */
void ETH_GetMAC(uint8_t *macAddr);

/**
 * @ingroup ethdriver8bit
 * @brief Sets the MAC address.
 * @param *macAddr
 * @return None.
 */
void ETH_SetMAC(uint8_t *macAddr);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the value of the write pointer.
 * @param None.
 * @return Pointer value.
 */
uint16_t ETH_GetWritePtr(void);

/**
 * @ingroup ethdriver8bit
 * @brief Saves the receive pointer for copy.
 * @param None.
 * @return None.
 */
void ETH_SaveRDPT(void);

/**
 * @ingroup ethdriver8bit
 * @brief Resets the receive pointer to the Init.
 * @param None.
 * @return None.
 */
void ETH_ResetReadPtr(void);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the value of the read pointer.
 * @param None.
 * @return Pointer value.
 */
uint16_t ETH_GetReadPtr(void);

/**
 * @ingroup ethdriver8bit
 * @brief Sets the read pointer to a specific address.
 * @param rdptr Read pointer
 * @return None.
 */
void ETH_SetReadPtr(uint16_t rdptr);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the Status Vector's byte count.
 * @param None.
 * @return Byte count.
 */
uint16_t ETH_GetStatusVectorByteCount(void);

/**
 * @ingroup ethdriver8bit
 * @brief Sets the Status Vector's byte count.
 * @param bc Byte count
 * @return None.
 */
void ETH_SetStatusVectorByteCount(uint16_t bc);

/**
 * @ingroup ethdriver8bit
 * @brief Resets the driver's byte count.
 * @param None.
 * @return None.
 */
void ETH_ResetByteCount(void);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the the driver's byte count.
 * @param None.
 * @return Byte count.
 */
uint16_t ETH_GetByteCount(void);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the saved write pointer.
 * @param None.
 * @return Pointer value.
 */
uint16_t ETH_ReadSavedWRPT(void);

/**
 * @ingroup ethdriver8bit
 * @brief Saves the write pointer for copy.
 * @param None.
 * @return None.
 */
void ETH_SaveWRPT(void);

/**
 * @ingroup ethdriver8bit
 * @brief Sets the receiver's byte count.
 * @param count byte count
 * @return None.
 */
void ETH_SetRxByteCount(uint16_t count);

/**
 * @ingroup ethdriver8bit
 * @brief Returns the receiver's byte count.
 * @param None.
 * @return Byte count.
 */
uint16_t ETH_GetRxByteCount(void);

/**
 * @ingroup ethdriver8bit
 * @brief Checks for the link.
 * @param None.
 * @retval True if the link is present.
 * @retval False if the link is not present.
 */
bool ETH_CheckLinkUp(void);

/**
 * @ingroup ethdriver8bit
 * @brief Resets the transmitter.
 * @param None.
 * @return None.
 */
void ETH_TxReset(void);

/**
 * @ingroup ethdriver8bit
 * @brief Moves back the read pointer.
 * @param offset
 * @return None.
 */
void ETH_MoveBackReadPtr(uint16_t offset);

#endif /* PHYSICAL_LAYER_INTERFACE_H */