/**
 * Transmission Control Protocol (TCP) v4 Header File
 *
 * @file tcpv4.h
 *
 * @defgroup tcp TCP
 *
 * @brief This file provides the API implementation for the Transmission Control Protocol v4 (TCPv4).
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

#ifndef TCPV4_H
#define TCPV4_H

// Included Files
#include <stdbool.h>
#include "tcpip_types.h"

// Macros
#define TCP_FIN_FLAG 0x01U
#define TCP_SYN_FLAG 0x02U
#define TCP_RST_FLAG 0x04U
#define TCP_PSH_FLAG 0x08U
#define TCP_ACK_FLAG 0x10U
#define TCP_URG_FLAG 0x20U
#define TCP_ECE_FLAG 0x40U
#define TCP_CWR_FLAG 0x80U

// Enumeration Definition
/**
 * @ingroup tcp
 * @enum tcp_fsm_states_t
 * @brief TCP Finite State Machine (FSM) states.
 */
typedef enum
{
    CLOSED = 0, /**< Facilitates initialization */
    LISTEN,
    SYN_SENT,
    SYN_RECEIVED,
    ESTABLISHED,
    FIN_WAIT_1,
    FIN_WAIT_2,
    CLOSE_WAIT,
    CLOSING,
    LAST_ACK,
    TIME_WAIT,
} tcp_fsm_states_t;

/**
 * @ingroup tcp
 * @enum tcpEvent_t
 * @brief TCP events.
 */
typedef enum
{
    CLOSE = 0, /**< Facilitates initialization */
    ACTIVE_OPEN,
    PASIVE_OPEN,
    RCV_SYN,
    RCV_ACK,
    RCV_SYNACK,
    RCV_FIN,
    RCV_FINACK,
    RX_PACKET,
    RCV_RST,
    RCV_RSTACK,
    RCV_PSHACK,
    TIMEOUT,
    NOP
} tcpEvent_t;

/**
 * @ingroup tcp
 * @enum socketState_t
 * @brief Socket states to be used in the application.
 */
typedef enum
{
    NOT_A_SOCKET = 0,   /**< This is not a socket */
    SOCKET_CLOSED,      /**< Socket closed */
    SOCKET_IN_PROGRESS, /**< The TCP listens or initiates a connection */
    SOCKET_CONNECTED,   /**< The TCP is in the established state and the user can send/receive data */
    SOCKET_CLOSING      /**< The user initiates the closing procedure for this socket */
} socketState_t;

/**
 * @ingroup tcp
 * @enum tcpSocket_t
 * @brief TCP Socket
 */
typedef struct
{
    uint32_t localIP;
    uint16_t localPort;
    uint32_t remoteIP;
    uint16_t remotePort;
} tcpSocket_t;

/**
 * @ingroup tcp
 * @enum tcpBufferState_t
 * @brief TCP Buffer state.
 */
typedef enum
{
    NO_BUFF = 0,
    RX_BUFF_IN_USE,
    TX_BUFF_IN_USE
} tcpBufferState_t;

/**
 * @ingroup tcp
 * @struct tcpTCB_t
 * @brief Defines TCP Transmission Control Block
 */
typedef struct
{
    uint16_t localPort;             /**< Local Port */
 
    uint32_t destIP; 
    uint16_t destPort; 
 
    uint32_t remoteSeqno; 
    uint32_t remoteAck;             /**< Last ACK packet sent to remote */
 
    uint32_t localSeqno; 
    uint32_t localLastAck;          /**< Last ACK number received */
 
    uint16_t remoteWnd;             /**< Sender window */
    uint16_t localWnd;              /**< Receiver window */
     
    uint16_t mss; 
 
    uint8_t *rxBufferStart; 
    uint8_t *rxBufferPtr;           /**< Pointer to write inside the RX buffer */
    tcpBufferState_t rxBufState; 
 
    uint8_t *txBufferStart; 
    uint8_t *txBufferPtr; 
    uint16_t bytesToSend; 
    tcpBufferState_t txBufState; 
    uint16_t bytesSent; 
    bool payloadSave; 
 
    tcp_fsm_states_t fsmState;      /**< Connection state */
    tcpEvent_t connectionEvent; 
 
    void *nextTCB;                  /**< Downstream list pointer */
    void *prevTCB;                  /**< Upstream list pointer */
 
    uint16_t timeout;               /**< Retransmission time-out in seconds */
    uint16_t timeoutReloadValue; 
    uint8_t timeoutsCount;          /**< Number of retransmissions */
    uint8_t flags;                  /**< Save the flags to be used for time-outs */
 
    socketState_t socketState;      /**< Socket states used in application */
} tcpTCB_t;

/**
 * @ingroup tcp
 * @enum tcp_options_t
 * @brief TCP options.
 */
typedef enum
{
    TCP_EOP = 0u,       /**< length = 0   End of Option List, [RFC793] */
    TCP_NOP = 1u,       /**< length = 0   No-Operation, [RFC793] */
    TCP_MSS = 2u,       /**< length = 4   Maximum Segment Size, [RFC793] */

#ifdef ALL_TCP_HEADER_OPTIONS // These options are not implemented
    TCP_WIN_SCALE = 3,  /**< length = 3   Window Scale, [RFC7323] */
    TCP_SACK = 4,       /**< length = 2   SACK Permitted, [RFC2018] */

    5                   /**< length = N   SACK, [RFC2018] */
    6                   /**< length = 6   Echo (obsoleted by option 8), [RFC1072][RFC6247] */
    7                   /**< length = 6   Echo Reply (obsoleted by option 8), [RFC1072][RFC6247] */
    8                   /**< length = 10  Timestamps, [RFC7323] */
    9                   /**< length = 2   Partial Order Connection Permitted (obsolete), [RFC1693][RFC6247] */
    10                  /**< length = 3   Partial Order Service Profile (obsolete), [RFC1693][RFC6247] */
    11                  /**< length = 0   CC (obsolete), [RFC1644][RFC6247] */
    12                  /**< length = 0   CC.NEW (obsolete), [RFC1644][RFC6247] */
    13                  /**< length = 0   CC.ECHO (obsolete), [RFC1644][RFC6247] */
    14                  /**< length = 3   TCP Alternate Checksum Request (obsolete), [RFC1146][RFC6247] */
    15                  /**< length = N   TCP Alternate Checksum Data (obsolete), [RFC1146][RFC6247] */
    16                  /**< length = 0   Skeeter, [Stev_Knowles] */
    17                  /**< length = 0   Bubba, [Stev_Knowles] */
    18                  /**< length = 3   Trailer Checksum Option, [Subbu_Subramaniam][Monroe_Bridges] */
    19                  /**< length = 18  MD5 Signature Option (obsoleted by option 29), [RFC2385] */
    20                  /**< length = 0   SCPS Capabilities, [Keith_Scott] */
    21                  /**< length = 0   Selective Negative Acknowledgements, [Keith_Scott] */
    22                  /**< length = 0   Record Boundaries, [Keith_Scott] */
    23                  /**< length = 0   Corruption experienced, [Keith_Scott] */
    24                  /**< length = 0   SNAP, [Vladimir_Sukonnik] */
    25                  /**< length = 0   Unassigned (released 2000-12-18), */
    26                  /**< length = 0   TCP Compression Filter, [Steve_Bellovin] */
    27                  /**< length = 8   Quick-Start Response, [RFC4782] */
    28                  /**< length = 4   "User Timeout Option (also, other known unauthorized use) [***][1]", [RFC5482] */
    29                  /**< length = 0   TCP Authentication Option (TCP-AO), [RFC5925] */
    30                  /**< length = N   Multipath TCP (MPTCP), [RFC6824] */
    31                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    32                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    33                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    34-75               /**< length = 0   Reserved, */
    69                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    70                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    71-75               /**< length = 0   Reserved, */
    76                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    77                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    78                  /**< length = 0   Reserved (known unauthorized use without proper IANA assignment) [**], */
    79-252              /**< length = 0   Reserved, */
    253                 /**< length = N   "RFC3692-style Experiment 1 (also improperly used for shipping products) [*]", [RFC4727] */
    254                 /**< length = N   "RFC3692-style Experiment 2 (also improperly used for shipping products) [*]", [RFC4727]" */
#endif
} tcp_options_t;

// TCP Public Interface Functions
/**
 * @ingroup tcp
 * @brief Initializes TCP structures, meaning certain internal TCP stack variables.
 * @param None.
 * @return None.
 */
void TCP_Init(void);

/**
 * @ingroup tcp
 * @brief Initializes the TCB and adds it to the list of TCB pointers.
 * The socket needs to be put in the Closed state.
 * The user is responsible to manage memory allocation and release.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @retval -1 The insertion failed
 * @retval 0 The insertion succeeded
 */
error_msg TCP_SocketInit(tcpTCB_t *tcbPtr);

/**
 * @ingroup tcp
 * @brief Removes the socket pointer from the TCP stack, and the list of TCB pointers, respectively.
 * After calling this routine the memory is ready to be used again.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @retval -1 Removing the socket failed
 * @retval 0 Removing the socket succeeded
 */
error_msg TCP_SocketRemove(tcpTCB_t *tcbPtr);

/**
 * @ingroup tcp
 * @brief Provides an interface to read the status of the socket.
 * This routine also checks if the pointer is already in the TCB list.
 * This means that the socket is "in use". If the socket is in the TCB list, the socket status will be returned.
 * @param *socket_ptr Pointer to the socket/TCB structure
 * @return Socket status.
 */
socketState_t TCP_SocketPoll(tcpTCB_t *socket_ptr);

/**
 * @ingroup tcp
 * @brief Assigns a port number to the specified socket.
 * This is used for configuring the local port of a socket.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @param port Port number to be used as a local port
 * @retval True The port initialization succeeded
 * @retval False The port initialization failed
 */
error_msg TCP_Bind(tcpTCB_t *tcbPtr, uint16_t port);

/**
 * @ingroup tcp
 * @brief Listens for connections on a socket. This routine marks the socket as passive,
 * meaning that it will be used to accept incoming connection requests.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @retval True Starting the server succeeded
 * @retval False Starting the server failed
 */
error_msg TCP_Listen(tcpTCB_t *tcbPtr);

/**
 * @ingroup tcp
 * @brief Starts the client for a particular socket.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @param *srvaddr Pointer to the server address
 * @retval True Starting the server succeeded
 * @retval False Starting the server failed
 */
error_msg TCP_Connect(tcpTCB_t *tcbPtr, sockaddr_in4_t *srvaddr);

/**
 * @ingroup tcp
 * @brief Closes the TCP connection.
 * This initiates the closing sequence for the TCP connection.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @retval True The closing sequence was initialized
 * @retval False The closing sequence was not initialized
 */
error_msg TCP_Close(tcpTCB_t *tcbPtr);

/**
 * @ingroup tcp
 * @brief Sends a buffer to a remote machine using a TCP connection.
 * This routine adds the buffer to the socket and the payload is sent as soon as possible.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @param *data Pointer to the data buffer
 * @param dataLen Size of the buffer
 * @retval True Adding the buffer to the socket/TCB succeeded
 * @retval False Adding the buffer to the socket/TCB failed
 */
error_msg TCP_Send(tcpTCB_t *tcbPtr, uint8_t *data, uint16_t dataLen);

/**
 * @ingroup tcp
 * @brief Checks if the TX buffer was sent.
 * This means that the data was received correctly by the remote machine and the TX buffer memory can be reused by the application.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @retval True Buffer transmission succeeded
 * @retval False Buffer transmission failed or was not yet started
 */
error_msg TCP_SendDone(tcpTCB_t *tcbPtr);

/**
 * @ingroup tcp
 * @brief Adds the RX buffer to the socket.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @param *data Pointer to the data buffer
 * @param data_len Size of the buffer
 * @retval True Passing the buffer to the socket succeeded
 * @retval False Passing the buffer to the socket failed
 */
error_msg TCP_InsertRxBuffer(tcpTCB_t *tcbPtr, uint8_t *data, uint16_t data_len);

/**
 * @ingroup tcp
 * @brief Reads the available data from the socket. This routine provides the start address of the received buffer to the user.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @return Number of received bytes in the buffer.
 */
int16_t TCP_GetReceivedData(tcpTCB_t *tcbPtr);

/**
 * @ingroup tcp
 * @brief Checks and returns the number of available bytes received on a socket.
 * @param *tcbPtr Pointer to the socket/TCB structure
 * @return Number of received bytes in the buffer.
 */
int16_t TCP_GetRxLength(tcpTCB_t *tcbPtr);

/**
 * @ingroup tcp
 * @brief Handles the TCP stack time-outs for each available socket. This routine needs to be called periodically.
 * @param None.
 * @return None.
 */
void TCP_Update(void);

#endif /* TCPV4_H */
