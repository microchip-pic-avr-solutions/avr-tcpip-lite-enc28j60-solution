/**
 * ENC28J60 Ethernet Driver Header File
 *
 * @file enc28j60.h
 *
 * @defgroup enc28j60 ENC28J60
 *
 * @brief This header file provides the API for the ENC28J60 Ethernet Driver.
 *
 * @version ENC28J60 Ethernet Driver Version 6.0.0
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

#ifndef ENC28J60_H
#define ENC28J60_H

// Macros

#define SFR_BANK0 0x00
#define SFR_BANK1 0x40
#define SFR_BANK2 0x80
#define SFR_BANK3 0xC0
#define SFR_COMMON 0xE0
#define BANK_MASK 0xE0
#define SFR_MASK 0x1F

#define byteSwap16(a) ((((uint16_t)a & (uint16_t)0xFF00) >> 8) | (((uint16_t)a & (uint16_t)0x00FF) << 8))
#define byteReverse32(a) ((((uint32_t)a & (uint32_t)0xff000000) >> 24) | \
						  (((uint32_t)a & (uint32_t)0x00ff0000) >> 8)  | \
						  (((uint32_t)a & (uint32_t)0x0000ff00) << 8)  | \
						  (((uint32_t)a & (uint32_t)0x000000ff) << 24))

#define byteReverse24(a) (((((uint32_t)a & (uint32_t)0x00FF00) >> 8) | (((uint32_t)a & (uint32_t)0x0000FF) << 8)) << 8 | (uint32_t)a >> 0x10)

// Host to Network & Network to Host Macros
#ifndef htons
#define htons(a) byteSwap16(a)
#endif
#ifndef ntohs
#define ntohs(a) byteSwap16(a)
#endif
#ifndef htonl
#define htonl(a) byteReverse32(a)
#endif
#ifndef ntohl
#define ntohl(a) byteReverse32(a)
#endif

#define convert_hton24(a) byteReverse24(a)

// Enums

/**
 * @ingroup enc28j60
 * @enum spi_inst_t
 * @brief SPI instructions.
 */
typedef enum
{
	rcr_inst = 0x00, /**<Read Control Register*/
	rbm_inst = 0x3A, /**<Read Buffer Memory*/
	wcr_inst = 0x40, /**<Write Control Register*/
	wbm_inst = 0x7A, /**<Write Buffer Memory*/
	bfs_inst = 0x80, /**<Bit Field Set*/
	bfc_inst = 0xa0, /**<Bit Field Clear*/
	src_inst = 0xFF	 /**<System Reset Command (Soft Reset) */
} spi_inst_t;

/**
 * @ingroup enc28j60
 * @enum sfr_bank_t
 * @brief SFR banks.
 */
typedef enum
{
	sfr_bank0 = SFR_BANK0,	/**<Bank 0*/
	sfr_bank1 = SFR_BANK1,	/**<Bank 1*/
	sfr_bank2 = SFR_BANK2,	/**<Bank 2*/
	sfr_bank3 = SFR_BANK3,	/**<Bank 3*/
	sfr_common = SFR_COMMON /**<Common Set of Registers (last five locations of each bank)*/
} sfr_bank_t;

/**
 * @ingroup enc28j60
 * @enum enc28j60_registers_t
 * @brief ENC28J60 registers.
 */
typedef enum
{
	J60_ERDPTL = (SFR_BANK0 | 0x00),   /**<Bank 0: Read Pointer Low Byte*/
	J60_ERDPTH = (SFR_BANK0 | 0x01),   /**<Bank 0: Read Pointer High Byte*/
	J60_EWRPTL = (SFR_BANK0 | 0x02),   /**<Bank 0: Write Pointer Low Byte*/
	J60_EWRPTH = (SFR_BANK0 | 0x03),   /**<Bank 0: Write Pointer High Byte*/
	J60_ETXSTL = (SFR_BANK0 | 0x04),   /**<Bank 0: TX Start Low Byte*/
	J60_ETXSTH = (SFR_BANK0 | 0x05),   /**<Bank 0: TX Start High Byte*/
	J60_ETXNDL = (SFR_BANK0 | 0x06),   /**<Bank 0: TX End Low Byte*/
	J60_ETXNDH = (SFR_BANK0 | 0x07),   /**<Bank 0: TX End High Byte*/
	J60_ERXSTL = (SFR_BANK0 | 0x08),   /**<Bank 0: RX Start Low Byte*/
	J60_ERXSTH = (SFR_BANK0 | 0x09),   /**<Bank 0: RX Start High Byte*/
	J60_ERXNDL = (SFR_BANK0 | 0x0A),   /**<Bank 0: RX End Low Byte*/
	J60_ERXNDH = (SFR_BANK0 | 0x0B),   /**<Bank 0: RX End High Byte*/
	J60_ERXRDPTL = (SFR_BANK0 | 0x0C), /**<Bank 0: RX RD Pointer Low Byte*/
	J60_ERXRDPTH = (SFR_BANK0 | 0x0D), /**<Bank 0: RX RD Pointer High Byte*/
	J60_ERXWRPTL = (SFR_BANK0 | 0x0E), /**<Bank 0: RX WR Pointer Low Byte*/
	J60_ERXWRPTH = (SFR_BANK0 | 0x0F), /**<Bank 0: RX WR Pointer High Byte*/
	J60_EDMASTL = (SFR_BANK0 | 0x10),  /**<Bank 0: DMA Start Low Byte*/
	J60_EDMASTH = (SFR_BANK0 | 0x11),  /**<Bank 0: DMA Start High Byte*/
	J60_EDMANDL = (SFR_BANK0 | 0x12),  /**<Bank 0: DMA End Low Byte*/
	J60_EDMANDH = (SFR_BANK0 | 0x13),  /**<Bank 0: DMA End High Byte*/
	J60_EDMADSTL = (SFR_BANK0 | 0x14), /**<Bank 0: DMA Destination Low Byte*/
	J60_EDMADSTH = (SFR_BANK0 | 0x15), /**<Bank 0: DMA Destination High Byte*/
	J60_EDMACSL = (SFR_BANK0 | 0x16),  /**<Bank 0: DMA Checksum Low Byte*/
	J60_EDMACSH = (SFR_BANK0 | 0x17),  /**<Bank 0: DMA Checksum High Byte*/
	RSRV_018 = (SFR_BANK0 | 0x18),	   /**<Bank 0: Reserved*/
	RSRV_019 = (SFR_BANK0 | 0x19),	   /**<Bank 0: Reserved*/
	RSRV_01A = (SFR_BANK0 | 0x1A),	   /**<Bank 0: Reserved*/

	J60_EHT0 = (SFR_BANK1 | 0x00),	   /**<Bank 1: Hash Table Byte 0*/
	J60_EHT1 = (SFR_BANK1 | 0x01),	   /**<Bank 1: Hash Table Byte 1*/
	J60_EHT2 = (SFR_BANK1 | 0x02),	   /**<Bank 1: Hash Table Byte 2*/
	J60_EHT3 = (SFR_BANK1 | 0x03),	   /**<Bank 1: Hash Table Byte 3*/
	J60_EHT4 = (SFR_BANK1 | 0x04),	   /**<Bank 1: Hash Table Byte 4*/
	J60_EHT5 = (SFR_BANK1 | 0x05),	   /**<Bank 1: Hash Table Byte 5*/
	J60_EHT6 = (SFR_BANK1 | 0x06),	   /**<Bank 1: Hash Table Byte 6*/
	J60_EHT7 = (SFR_BANK1 | 0x07),	   /**<Bank 1: Hash Table Byte 7*/
	J60_EPMM0 = (SFR_BANK1 | 0x08),	   /**<Bank 1: Pattern Match Mask Byte 0*/
	J60_EPMM1 = (SFR_BANK1 | 0x09),	   /**<Bank 1: Pattern Match Mask Byte 1*/
	J60_EPMM2 = (SFR_BANK1 | 0x0A),	   /**<Bank 1: Pattern Match Mask Byte 2*/
	J60_EPMM3 = (SFR_BANK1 | 0x0B),	   /**<Bank 1: Pattern Match Mask Byte 3*/
	J60_EPMM4 = (SFR_BANK1 | 0x0C),	   /**<Bank 1: Pattern Match Mask Byte 4*/
	J60_EPMM5 = (SFR_BANK1 | 0x0D),	   /**<Bank 1: Pattern Match Mask Byte 5*/
	J60_EPMM6 = (SFR_BANK1 | 0x0E),	   /**<Bank 1: Pattern Match Mask Byte 6*/
	J60_EPMM7 = (SFR_BANK1 | 0x0F),	   /**<Bank 1: Pattern Match Mask Byte 7*/
	J60_EPMCSL = (SFR_BANK1 | 0x10),   /**<Bank 1: Pattern Match Checksum Low Byte*/
	J60_EPMCSH = (SFR_BANK1 | 0x11),   /**<Bank 1: Pattern Match Checksum High Byte*/
	RSRV_112 = (SFR_BANK1 | 0x12),	   /**<Bank 1: Reserved*/
	RSRV_113 = (SFR_BANK1 | 0x13),	   /**<Bank 1: Reserved*/
	J60_EPMOL = (SFR_BANK1 | 0x14),	   /**<Bank 1: Pattern Match Offset Low Byte*/
	J60_EPMOH = (SFR_BANK1 | 0x15),	   /**<Bank 1: Pattern Match Offset High Byte*/
	RSRV_116 = (SFR_BANK1 | 0x16),	   /**<Bank 1: Reserved*/
	RSRV_117 = (SFR_BANK1 | 0x17),	   /**<Bank 1: Reserved*/
	J60_ERXFCON = (SFR_BANK1 | 0x18),  /**<Bank 1: Ethernet Receive Filter Control Register*/
	J60_EPKTCNT = (SFR_BANK1 | 0x19),  /**<Bank 1: Ethernet Packet Count*/
	RSRV_11A = (SFR_BANK1 | 0x1A),	   /**<Bank 1: Reserved*/

	J60_MACON1 = (SFR_BANK2 | 0x00),   /**<Bank 2: MAC Control Register 1*/
	RSRV_201 = (SFR_BANK2 | 0x01),	   /**<Bank 2: Reserved*/
	J60_MACON3 = (SFR_BANK2 | 0x02),   /**<Bank 2: MAC Control Register 3*/
	J60_MACON4 = (SFR_BANK2 | 0x03),   /**<Bank 2: MAC Control Register 4*/
	J60_MABBIPG = (SFR_BANK2 | 0x04),  /**<Bank 2: Back-to-Back Inter-Packet Gap*/
	RSRV_205 = (SFR_BANK2 | 0x05),	   /**<Bank 2: Reserved*/
	J60_MAIPGL = (SFR_BANK2 | 0x06),   /**<Bank 2: Non-Back-to-Back Inter-Packet Gap Low Byte */
	J60_MAIPGH = (SFR_BANK2 | 0x07),   /**<Bank 2: Non-Back-to-Back Inter-Packet Gap High Byte */
	J60_MACLCON1 = (SFR_BANK2 | 0x08), /**<Bank 2: Retransmission Maximum*/
	J60_MACLCON2 = (SFR_BANK2 | 0x09), /**<Bank 2: Collision Window*/
	J60_MAMXFLL = (SFR_BANK2 | 0x0A),  /**<Bank 2: Maximum Frame Length Low Byte*/
	J60_MAMXFLH = (SFR_BANK2 | 0x0B),  /**<Bank 2: Maximum Frame Length High Byte*/
	RSRV_20C = (SFR_BANK2 | 0x0C),	   /**<Bank 2: Reserved*/
	RSRV_20D = (SFR_BANK2 | 0x0D),	   /**<Bank 2: Reserved*/
	RSRV_20E = (SFR_BANK2 | 0x0E),	   /**<Bank 2: Reserved*/
	RSRV_20F = (SFR_BANK2 | 0x0F),	   /**<Bank 2: Reserved*/
	RSRV_210 = (SFR_BANK2 | 0x10),	   /**<Bank 2: Reserved*/
	RSRV_211 = (SFR_BANK2 | 0x11),	   /**<Bank 2: Reserved*/
	J60_MICMD = (SFR_BANK2 | 0x12),	   /**<Bank 2: MII Command Register*/
	RSRV_213 = (SFR_BANK2 | 0x13),	   /**<Bank 2: Reserved*/
	J60_MIREGADR = (SFR_BANK2 | 0x14), /**<Bank 2: MII Register Address*/
	RSRV_215 = (SFR_BANK2 | 0x15),	   /**<Bank 2: Reserved*/
	J60_MIWRL = (SFR_BANK2 | 0x16),	   /**<Bank 2: MII Write Data Low Byte*/
	J60_MIWRH = (SFR_BANK2 | 0x17),	   /**<Bank 2: MII Write Data High Byte*/
	J60_MIRDL = (SFR_BANK2 | 0x18),	   /**<Bank 2: MII Read Data Low Byte*/
	J60_MIRDH = (SFR_BANK2 | 0x19),	   /**<Bank 2: MII Read Data High Byte*/
	RSRV_21A = (SFR_BANK2 | 0x1A),	   /**<Bank 2: Reserved*/

	J60_MAADR5 = (SFR_BANK3 | 0x00),  /**<Bank 3: MAC Address Byte 5*/
	J60_MAADR6 = (SFR_BANK3 | 0x01),  /**<Bank 3: MAC Address Byte 6*/
	J60_MAADR3 = (SFR_BANK3 | 0x02),  /**<Bank 3: MAC Address Byte 3*/
	J60_MAADR4 = (SFR_BANK3 | 0x03),  /**<Bank 3: MAC Address Byte 4*/
	J60_MAADR1 = (SFR_BANK3 | 0x04),  /**<Bank 3: MAC Address Byte 1*/
	J60_MAADR2 = (SFR_BANK3 | 0x05),  /**<Bank 3: MAC Address Byte 2*/
	J60_EBSTSD = (SFR_BANK3 | 0x06),  /**<Bank 3: Built-in Self-Test Fill Seed*/
	J60_EBSTCON = (SFR_BANK3 | 0x07), /**<Bank 3: Ethernet Self-Test Control Register*/
	J60_EBSTCSL = (SFR_BANK3 | 0x08), /**<Bank 3: Built-in Self-Test Checksum Low Byte*/
	J60_EBSTCSH = (SFR_BANK3 | 0x09), /**<Bank 3: Built-in Self-Test Checksum High Byte*/
	J60_MISTAT = (SFR_BANK3 | 0x0A),  /**<Bank 3: MII Status Register*/
	RSRV_30B = (SFR_BANK3 | 0x0B),	  /**<Bank 3: Reserved*/
	RSRV_30C = (SFR_BANK3 | 0x0C),	  /**<Bank 3: Reserved*/
	RSRV_30D = (SFR_BANK3 | 0x0D),	  /**<Bank 3: Reserved*/
	RSRV_30E = (SFR_BANK3 | 0x0E),	  /**<Bank 3: Reserved*/
	RSRV_30F = (SFR_BANK3 | 0x0F),	  /**<Bank 3: Reserved*/
	RSRV_310 = (SFR_BANK3 | 0x10),	  /**<Bank 3: Reserved*/
	RSRV_311 = (SFR_BANK3 | 0x11),	  /**<Bank 3: Reserved*/
	J60_EREVID = (SFR_BANK3 | 0x12),  /**<Bank 3: Ethernet Revision ID*/
	RSRV_313 = (SFR_BANK3 | 0x13),	  /**<Bank 3: Reserved*/
	RSRV_314 = (SFR_BANK3 | 0x14),	  /**<Bank 3: Reserved*/
	J60_ECOCON = (SFR_BANK3 | 0x15),  /**<Bank 3: Clock Output Control Register*/
	RSRV_316 = (SFR_BANK3 | 0x16),	  /**<Bank 3: Reserved*/
	J60_EFLOCON = (SFR_BANK3 | 0x17), /**<Bank 3: Ethernet Flow Control Register*/
	J60_EPAUSL = (SFR_BANK3 | 0x18),  /**<Bank 3: Pause Timer Value Low Byte*/
	J60_EPAUSH = (SFR_BANK3 | 0x19),  /**<Bank 3: Pause Timer Value High Byte*/
	RSRV_31A = (SFR_BANK3 | 0x1A),	  /**<Bank 3: Reserved*/

	J60_EIE = (SFR_COMMON | 0x1B),	 /**<Common Bank Registers: Ethernet Interrupt Enable Register*/
	J60_EIR = (SFR_COMMON | 0x1C),	 /**<Common Bank Registers: Ethernet Interrupt Request (Flag) Register*/
	J60_ESTAT = (SFR_COMMON | 0x1D), /**<Common Bank Registers: Ethernet Status Register*/
	J60_ECON2 = (SFR_COMMON | 0x1E), /**<Common Bank Registers: Ethernet Control Register 2*/
	J60_ECON1 = (SFR_COMMON | 0x1F)	 /**<Common Bank Registers: Ethernet Control Register 1*/
} enc28j60_registers_t;

/**
 * @ingroup enc28j60
 * @enum enc28j60_phy_registers_t
 * @brief ENC28J60 PHY registers.
 */
typedef enum
{
	J60_PHCON1 = 0x00,	/**<PHY Control Register 1*/
	J60_PHSTAT1 = 0x01, /**<Physical Layer Status Register 1*/
	J60_PHID1 = 0x02,	/**<PHY Identifier*/
	J60_PHID2 = 0x03,	/**<PHY Identifier, P/N, and Revision*/
	J60_PHCON2 = 0x10,	/**<PHY Control Register 2*/
	J60_PHSTAT2 = 0x11, /**<Physical Layer Status Register 2*/
	J60_PHIE = 0x12,	/**<PHY Interrupt Enable Register*/
	J60_PHIR = 0x13,	/**<PHY Interrupt Request Register*/
	J60_PHLCON = 0x14	/**<PHY Module LED Control Register - displays receive activity*/
} enc28j60_phy_registers_t;

// Select register definitions

/**
 * @ingroup enc28j60
 * @union eir_t
 * @brief ENC28J60 EIR register.
 */
typedef union
{
	char val;
	struct
	{
		unsigned RXERIF : 1; /**<Receive Error Interrupt Flag bit*/
		unsigned TXERIF : 1; /**<Transmit Error Interrupt Flag bit*/
		unsigned : 1;
		unsigned TXIF : 1;	 /**<Transmit Interrupt Flag bit*/
		unsigned LINKIF : 1; /**<Link Change Interrupt Flag bit*/
		unsigned DMAIF : 1;	 /**<DMA Interrupt Flag bit*/
		unsigned PKTIF : 1;	 /**<Receive Packet Pending Interrupt Flag bit*/
		unsigned : 1;
	};
} eir_t;

/**
 * @ingroup enc28j60
 * @union phstat2_t
 * @brief ENC28J60 PHSTAT2 register.
 */
typedef union
{
	unsigned int val;
	struct
	{
		unsigned : 5;
		unsigned PLRITY : 1;  /**<Polarity Status bit*/
		unsigned : 3;
		unsigned DPXSTAT : 1; /**<PHY Duplex Status bit*/
		unsigned LSTAT : 1;	  /**<PHY Link Status bit (non-latching)*/
		unsigned COLSTAT : 1; /**<PHY Collision Status bit*/
		unsigned RXSTAT : 1;  /**<PHY Receive Status bit*/
		unsigned TXSTAT : 1;  /**<PHY Transmit Status bit*/
		unsigned : 2;
	};
} phstat2_t;

/**
 * @ingroup enc28j60
 * @var Control_Byte
 * @brief ENC28J60 Control Byte
 */
uint8_t Control_Byte;

/**
 * @ingroup enc28j60
 * @union receiveStatusVector_t
 * @brief ENC28J60 receive status vector.
 */
typedef union
{
	uint8_t v[4];
	struct
	{
		uint16_t byteCount;			     /**<Received Byte Count*/
		unsigned long_drop_event : 1;    /**<Long Event/Drop Event*/
		unsigned : 1;
		unsigned excessCarrierEvent : 1; /**<Carrier Event Previously Seen*/
		unsigned : 1;
		unsigned crcError : 1;			 /**<CRC Error*/
		unsigned lengthCheckError : 1;	 /**<Length Check Error*/
		unsigned lengthLongError : 1;	 /**<Length Out of Range*/
		unsigned rxOK : 1;				 /**<Received Ok*/
		unsigned rxMulticast : 1;		 /**<Receive Multicast Packet*/
		unsigned rxBroadcast : 1;		 /**<Receive Broadcast Packet*/
		unsigned dribbleNibble : 1;		 /**<Dribble Nibble*/
		unsigned controlFrame : 1;		 /**<Receive Control Frame*/
		unsigned pauseControlFrame : 1;	 /**<Receive Pause Control Frame*/
		unsigned unknownContrlFrame : 1; /**<Receive Unknown Opcode*/
		unsigned vlanTagPresent : 1;	 /**<Receive VLAN Type Detected*/
		unsigned zero : 1;				 /**<Zero*/
	};
} receiveStatusVector_t;

#endif /* ENC28J60_H */