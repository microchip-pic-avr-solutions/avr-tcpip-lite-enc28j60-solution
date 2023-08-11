#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=app_files/src/tcp_server_demo.c mcc_generated_files/ethernet/src/enc28j60.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/tcpiplite/src/lfsr.c mcc_generated_files/tcpiplite/src/dhcp_client.c mcc_generated_files/tcpiplite/src/tcpv4.c mcc_generated_files/tcpiplite/src/arpv4.c mcc_generated_files/tcpiplite/src/ipv4.c mcc_generated_files/tcpiplite/src/rtcc.c mcc_generated_files/tcpiplite/src/ip_database.c mcc_generated_files/tcpiplite/src/log_syslog.c mcc_generated_files/tcpiplite/src/network.c mcc_generated_files/tcpiplite/src/udpv4.c mcc_generated_files/tcpiplite/src/log.c mcc_generated_files/tcpiplite/src/log_console.c mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/timer/src/delay.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/app_files/src/tcp_server_demo.o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/app_files/src/tcp_server_demo.o.d ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/app_files/src/tcp_server_demo.o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=app_files/src/tcp_server_demo.c mcc_generated_files/ethernet/src/enc28j60.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/tcpiplite/src/lfsr.c mcc_generated_files/tcpiplite/src/dhcp_client.c mcc_generated_files/tcpiplite/src/tcpv4.c mcc_generated_files/tcpiplite/src/arpv4.c mcc_generated_files/tcpiplite/src/ipv4.c mcc_generated_files/tcpiplite/src/rtcc.c mcc_generated_files/tcpiplite/src/ip_database.c mcc_generated_files/tcpiplite/src/log_syslog.c mcc_generated_files/tcpiplite/src/network.c mcc_generated_files/tcpiplite/src/udpv4.c mcc_generated_files/tcpiplite/src/log.c mcc_generated_files/tcpiplite/src/log_console.c mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/timer/src/delay.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=AVR64DD32
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/app_files/src/tcp_server_demo.o: app_files/src/tcp_server_demo.c  .generated_files/flags/default/2ba7e6768b1a6f0a6a10dae24594953a3f85acdc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/app_files/src" 
	@${RM} ${OBJECTDIR}/app_files/src/tcp_server_demo.o.d 
	@${RM} ${OBJECTDIR}/app_files/src/tcp_server_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/app_files/src/tcp_server_demo.o.d" -MT "${OBJECTDIR}/app_files/src/tcp_server_demo.o.d" -MT ${OBJECTDIR}/app_files/src/tcp_server_demo.o -o ${OBJECTDIR}/app_files/src/tcp_server_demo.o app_files/src/tcp_server_demo.c 
	
${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o: mcc_generated_files/ethernet/src/enc28j60.c  .generated_files/flags/default/891b17e7bd6ed4d99fe803cf92315bcef6f48299 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/ethernet/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o -o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o mcc_generated_files/ethernet/src/enc28j60.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/fb87b3e84a77df49b358a135aa7ea548b66aae35 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/13c87669f45cf8284dc339902c41d607412bd697 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/16ec3c03a96f80235277e6c4270709bc7e70f390 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/6ab6cb81fef63f13ad74a5cecdf0df01aa92cfa2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/8a3126d2a62e94dd7d047f6412f20fcddc6e9e02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/e9e9351a86bf97197894ebf77f16b53c55f3a8d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o: mcc_generated_files/tcpiplite/src/lfsr.c  .generated_files/flags/default/90be9939525ecc86d495c3cb124dd9c1786dbed2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o mcc_generated_files/tcpiplite/src/lfsr.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o: mcc_generated_files/tcpiplite/src/dhcp_client.c  .generated_files/flags/default/904216437ef5ddcecd8b16b10b2c152d2598baf8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o mcc_generated_files/tcpiplite/src/dhcp_client.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o: mcc_generated_files/tcpiplite/src/tcpv4.c  .generated_files/flags/default/f125975e61a9f19c8cdc3d6dbb0c7426f2435e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o mcc_generated_files/tcpiplite/src/tcpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o: mcc_generated_files/tcpiplite/src/arpv4.c  .generated_files/flags/default/efdbf6d9d129f55cc7a9a60e2c167fba0becd917 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o mcc_generated_files/tcpiplite/src/arpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o: mcc_generated_files/tcpiplite/src/ipv4.c  .generated_files/flags/default/33a0008251900b3c0af4060601e1d9379b643b33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o mcc_generated_files/tcpiplite/src/ipv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o: mcc_generated_files/tcpiplite/src/rtcc.c  .generated_files/flags/default/6509471fbaafcf36324b325dde9fa1311dddf882 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o mcc_generated_files/tcpiplite/src/rtcc.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o: mcc_generated_files/tcpiplite/src/ip_database.c  .generated_files/flags/default/68ce0a2da6b41ced018895a4f9944a733e000370 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o mcc_generated_files/tcpiplite/src/ip_database.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o: mcc_generated_files/tcpiplite/src/log_syslog.c  .generated_files/flags/default/eb898ed353f6e7329cd63c93c765f39dfc95c17b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o mcc_generated_files/tcpiplite/src/log_syslog.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o: mcc_generated_files/tcpiplite/src/network.c  .generated_files/flags/default/4fd26b19197a1510d3a0b07258b5f13452603820 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o mcc_generated_files/tcpiplite/src/network.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o: mcc_generated_files/tcpiplite/src/udpv4.c  .generated_files/flags/default/303a6696d8fd52c3a8b65ea81c0bd2ffb649581e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o mcc_generated_files/tcpiplite/src/udpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o: mcc_generated_files/tcpiplite/src/log.c  .generated_files/flags/default/4efced210f07fb0c4c596a820f6aa4ecbce7cd52 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o mcc_generated_files/tcpiplite/src/log.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o: mcc_generated_files/tcpiplite/src/log_console.c  .generated_files/flags/default/2a803f6c59b2da086919285b4887c377632ec6c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o mcc_generated_files/tcpiplite/src/log_console.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o: mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c  .generated_files/flags/default/aed21bd10aee82d0278e79b12c1d74eb19c0759e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/default/33a0bd0cd7502de6a3b6558149c1b3896b432823 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/delay.o: mcc_generated_files/timer/src/delay.c  .generated_files/flags/default/672906a875c1a888a9de664218fd3e669da3ccc7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o mcc_generated_files/timer/src/delay.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/1b92ab598df0f2484dd57c999c39dbe18248e131 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
else
${OBJECTDIR}/app_files/src/tcp_server_demo.o: app_files/src/tcp_server_demo.c  .generated_files/flags/default/abaed1c47d50a6efc4b8895a0056e64a019a8e56 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/app_files/src" 
	@${RM} ${OBJECTDIR}/app_files/src/tcp_server_demo.o.d 
	@${RM} ${OBJECTDIR}/app_files/src/tcp_server_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/app_files/src/tcp_server_demo.o.d" -MT "${OBJECTDIR}/app_files/src/tcp_server_demo.o.d" -MT ${OBJECTDIR}/app_files/src/tcp_server_demo.o -o ${OBJECTDIR}/app_files/src/tcp_server_demo.o app_files/src/tcp_server_demo.c 
	
${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o: mcc_generated_files/ethernet/src/enc28j60.c  .generated_files/flags/default/aeab0bfcef3cc1ee792781fd319f890f6f5e89d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/ethernet/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o -o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o mcc_generated_files/ethernet/src/enc28j60.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/530805ae64f9a5494ca9aae5af3bf7565ec5054f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/63e6cc5d411fb3dae41fdaece70698bc4ca2c7a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/29c522c3d4948296b3bb6ee11d65083347785dc0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/60ac4b0d7087db2c9289b3000f1b788f78cc475b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/e220daa174a831b6551b4650b1a90d3cf799b307 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/9b9dddf9c8abf82112a05059ceac3beff1f3d9d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o: mcc_generated_files/tcpiplite/src/lfsr.c  .generated_files/flags/default/98574479ab93bb2b6a44bd48053583ae5c252e13 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o mcc_generated_files/tcpiplite/src/lfsr.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o: mcc_generated_files/tcpiplite/src/dhcp_client.c  .generated_files/flags/default/f749e122000ec1ddca411dc6205c3993b8d2aa56 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o mcc_generated_files/tcpiplite/src/dhcp_client.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o: mcc_generated_files/tcpiplite/src/tcpv4.c  .generated_files/flags/default/26fdda3cf48ad924a9960cba0de4ef9f242ff230 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/tcpv4.o mcc_generated_files/tcpiplite/src/tcpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o: mcc_generated_files/tcpiplite/src/arpv4.c  .generated_files/flags/default/b54904f5d2f2a7fe115b99b6e1f8ecbc43b0b623 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o mcc_generated_files/tcpiplite/src/arpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o: mcc_generated_files/tcpiplite/src/ipv4.c  .generated_files/flags/default/f62e9c84fb7a830e84c6fb88eda097c912aabe00 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o mcc_generated_files/tcpiplite/src/ipv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o: mcc_generated_files/tcpiplite/src/rtcc.c  .generated_files/flags/default/258f417340548926bb914b41435c5d1611e13baa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o mcc_generated_files/tcpiplite/src/rtcc.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o: mcc_generated_files/tcpiplite/src/ip_database.c  .generated_files/flags/default/e7ecfbed4677674ca41ec81e4686076d11e5b423 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o mcc_generated_files/tcpiplite/src/ip_database.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o: mcc_generated_files/tcpiplite/src/log_syslog.c  .generated_files/flags/default/5e672a4f23cb2af940493e8e2132fcea3ea2f496 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o mcc_generated_files/tcpiplite/src/log_syslog.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o: mcc_generated_files/tcpiplite/src/network.c  .generated_files/flags/default/f6a3addc5e08809f5551efe5e3612d3374f041e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o mcc_generated_files/tcpiplite/src/network.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o: mcc_generated_files/tcpiplite/src/udpv4.c  .generated_files/flags/default/4cbadf562a295e4d690a71a229b904b04f8867c6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o mcc_generated_files/tcpiplite/src/udpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o: mcc_generated_files/tcpiplite/src/log.c  .generated_files/flags/default/5d0b76882c460009be4725690bb4d445c3e27136 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o mcc_generated_files/tcpiplite/src/log.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o: mcc_generated_files/tcpiplite/src/log_console.c  .generated_files/flags/default/f3fa263dcc7f44ac8b4ddd4079096c9d4c995de8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o mcc_generated_files/tcpiplite/src/log_console.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o: mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c  .generated_files/flags/default/591829bb685540d070e14904d77884b344fcf0ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/default/d122a4f83f0b2ab91ce46448a2f63a41beb7a154 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/delay.o: mcc_generated_files/timer/src/delay.c  .generated_files/flags/default/7449c1626d192c626a46dce8dde1b302fd1c46df .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o mcc_generated_files/timer/src/delay.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/2475c429b5fcd74f98f950a31c3f4c3c6164d43b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/33fbccfd11dc4ce528133d835f1054004e201fdb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/6ebd36629e2b289647de3a90c9a2e70181ba4592 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem -Wa,--defsym=__MPLAB_BUILD=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -gdwarf-3 -mconst-data-in-progmem -mno-const-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/enc28j60-avr-tcpserver.X.${IMAGE_TYPE}.hex"
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}
