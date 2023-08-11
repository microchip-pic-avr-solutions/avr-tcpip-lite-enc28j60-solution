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
FINAL_IMAGE=${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=app_files/src/udp_demo.c mcc_generated_files/ethernet/src/enc28j60.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/tcpiplite/src/log_syslog.c mcc_generated_files/tcpiplite/src/udpv4.c mcc_generated_files/tcpiplite/src/network.c mcc_generated_files/tcpiplite/src/ipv4.c mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c mcc_generated_files/tcpiplite/src/ip_database.c mcc_generated_files/tcpiplite/src/log.c mcc_generated_files/tcpiplite/src/lfsr.c mcc_generated_files/tcpiplite/src/dhcp_client.c mcc_generated_files/tcpiplite/src/rtcc.c mcc_generated_files/tcpiplite/src/arpv4.c mcc_generated_files/tcpiplite/src/log_console.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/timer/src/delay.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/app_files/src/udp_demo.o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/app_files/src/udp_demo.o.d ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/app_files/src/udp_demo.o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=app_files/src/udp_demo.c mcc_generated_files/ethernet/src/enc28j60.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/tcpiplite/src/log_syslog.c mcc_generated_files/tcpiplite/src/udpv4.c mcc_generated_files/tcpiplite/src/network.c mcc_generated_files/tcpiplite/src/ipv4.c mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c mcc_generated_files/tcpiplite/src/ip_database.c mcc_generated_files/tcpiplite/src/log.c mcc_generated_files/tcpiplite/src/lfsr.c mcc_generated_files/tcpiplite/src/dhcp_client.c mcc_generated_files/tcpiplite/src/rtcc.c mcc_generated_files/tcpiplite/src/arpv4.c mcc_generated_files/tcpiplite/src/log_console.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/timer/src/delay.c main.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=AVR64DD32
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/app_files/src/udp_demo.o: app_files/src/udp_demo.c  .generated_files/flags/default/7156e38b1fadd052c04872921b39fe80c132030d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/app_files/src" 
	@${RM} ${OBJECTDIR}/app_files/src/udp_demo.o.d 
	@${RM} ${OBJECTDIR}/app_files/src/udp_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/app_files/src/udp_demo.o.d" -MT "${OBJECTDIR}/app_files/src/udp_demo.o.d" -MT ${OBJECTDIR}/app_files/src/udp_demo.o -o ${OBJECTDIR}/app_files/src/udp_demo.o app_files/src/udp_demo.c 
	
${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o: mcc_generated_files/ethernet/src/enc28j60.c  .generated_files/flags/default/8b11d880349c9843755eff14e94acbeb5f5cb244 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/ethernet/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o -o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o mcc_generated_files/ethernet/src/enc28j60.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/680b8646d328d9ba85122c4104ef4e47f2fa1616 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/3bde281ccfd5b48638cb30b78844767c0a8a3b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/1d4a02b02bc27a541e4c020683a970f0371b38f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/23748f40953312128610fc059838452fb4c72c7e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/6617222d8dd2e498e348c62aa274ee629218bd16 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/5a334116363f0d5a8aecd9ac212b0b1213ce4104 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o: mcc_generated_files/tcpiplite/src/log_syslog.c  .generated_files/flags/default/b73dd969d14ceefe89f747024f3b7345b78faaa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o mcc_generated_files/tcpiplite/src/log_syslog.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o: mcc_generated_files/tcpiplite/src/udpv4.c  .generated_files/flags/default/9f7a7536d9ffc6b6d6a91f1e910bc96ec51a4445 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o mcc_generated_files/tcpiplite/src/udpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o: mcc_generated_files/tcpiplite/src/network.c  .generated_files/flags/default/2b577aea485b9bb61ba0f55b9b9caaf4fb20f8ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o mcc_generated_files/tcpiplite/src/network.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o: mcc_generated_files/tcpiplite/src/ipv4.c  .generated_files/flags/default/b4def7b1fd9464a2d31cd47dcd3d9fdc4bea1365 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o mcc_generated_files/tcpiplite/src/ipv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o: mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c  .generated_files/flags/default/415bede99fe1d5d424c366c62a2823717276eb67 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o: mcc_generated_files/tcpiplite/src/ip_database.c  .generated_files/flags/default/c1ad1c3d33a3f3c702e4135abc01a0882e828a7f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o mcc_generated_files/tcpiplite/src/ip_database.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o: mcc_generated_files/tcpiplite/src/log.c  .generated_files/flags/default/e52435f36628350b92570d92af43d05136b954b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o mcc_generated_files/tcpiplite/src/log.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o: mcc_generated_files/tcpiplite/src/lfsr.c  .generated_files/flags/default/28ffb093e1fd1ae5fffff24f4bb6ae025314a518 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o mcc_generated_files/tcpiplite/src/lfsr.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o: mcc_generated_files/tcpiplite/src/dhcp_client.c  .generated_files/flags/default/93fe39c6530ba10a3ab05290413093a25e0e5ce6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o mcc_generated_files/tcpiplite/src/dhcp_client.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o: mcc_generated_files/tcpiplite/src/rtcc.c  .generated_files/flags/default/92402ae9b13a624fe6f427d641ed70b5ebc6f80b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o mcc_generated_files/tcpiplite/src/rtcc.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o: mcc_generated_files/tcpiplite/src/arpv4.c  .generated_files/flags/default/9c811d7935c5b04a3d9652fc13e9ce82c0b510b7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o mcc_generated_files/tcpiplite/src/arpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o: mcc_generated_files/tcpiplite/src/log_console.c  .generated_files/flags/default/1020a2b3d07d660adaad9d903fd15769d893125 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o mcc_generated_files/tcpiplite/src/log_console.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/default/588329282f7e447a7fa4e7f3cd1bf2505924720a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/delay.o: mcc_generated_files/timer/src/delay.c  .generated_files/flags/default/396fe33c95767edf988d20997065b81fdbd78f10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o mcc_generated_files/timer/src/delay.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/64b847a3e16139fad9d828828cbe76f669ee23e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
else
${OBJECTDIR}/app_files/src/udp_demo.o: app_files/src/udp_demo.c  .generated_files/flags/default/337f0007cad2e0e2cb5622d5ab8968ffea847f64 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/app_files/src" 
	@${RM} ${OBJECTDIR}/app_files/src/udp_demo.o.d 
	@${RM} ${OBJECTDIR}/app_files/src/udp_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/app_files/src/udp_demo.o.d" -MT "${OBJECTDIR}/app_files/src/udp_demo.o.d" -MT ${OBJECTDIR}/app_files/src/udp_demo.o -o ${OBJECTDIR}/app_files/src/udp_demo.o app_files/src/udp_demo.c 
	
${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o: mcc_generated_files/ethernet/src/enc28j60.c  .generated_files/flags/default/69e4252da341db89f2fec41eae398a319c8d4ec1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/ethernet/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT "${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o.d" -MT ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o -o ${OBJECTDIR}/mcc_generated_files/ethernet/src/enc28j60.o mcc_generated_files/ethernet/src/enc28j60.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/d01b3f1e6e2c52455ed264a2fe8182cdf856af63 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/49e85febdc47695a5e2936997224ade52bbe4b83 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/e130222144927d5460255fb90f7b66c83e1f2683 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/9e6630c9546cfa899c05dac106aea8806a1f8ab5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/f092b2449d4a0307226dc0e60ca02748541b66b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/6c7354990399342c4bf0086aceee27bda5d422d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o: mcc_generated_files/tcpiplite/src/log_syslog.c  .generated_files/flags/default/a7e0887c7d63e352c6f5fd071bde5502efab1de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_syslog.o mcc_generated_files/tcpiplite/src/log_syslog.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o: mcc_generated_files/tcpiplite/src/udpv4.c  .generated_files/flags/default/1d35b4106b59623bc900c0b9f09ddd044cc32599 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4.o mcc_generated_files/tcpiplite/src/udpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o: mcc_generated_files/tcpiplite/src/network.c  .generated_files/flags/default/6192c5e0737354c4dda76d55b1ac4e95361bcdd3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/network.o mcc_generated_files/tcpiplite/src/network.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o: mcc_generated_files/tcpiplite/src/ipv4.c  .generated_files/flags/default/ac848be2f09eba53f37eb2a07360963b8e4e7000 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ipv4.o mcc_generated_files/tcpiplite/src/ipv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o: mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c  .generated_files/flags/default/c6b1b3dfd473aeb4302c90b0cbba51436c41ac18 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.o mcc_generated_files/tcpiplite/src/udpv4_port_handler_table.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o: mcc_generated_files/tcpiplite/src/ip_database.c  .generated_files/flags/default/d25f008fac91671b5348716720c9e65c82348e3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/ip_database.o mcc_generated_files/tcpiplite/src/ip_database.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o: mcc_generated_files/tcpiplite/src/log.c  .generated_files/flags/default/64c45f354346ce0e138f0597ad3500231070fc57 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log.o mcc_generated_files/tcpiplite/src/log.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o: mcc_generated_files/tcpiplite/src/lfsr.c  .generated_files/flags/default/70719dcb4cc2d87f104d48f3bb3b3256762dcff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/lfsr.o mcc_generated_files/tcpiplite/src/lfsr.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o: mcc_generated_files/tcpiplite/src/dhcp_client.c  .generated_files/flags/default/b39ac3175242a76e0802a46f5fb0563e3b690979 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/dhcp_client.o mcc_generated_files/tcpiplite/src/dhcp_client.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o: mcc_generated_files/tcpiplite/src/rtcc.c  .generated_files/flags/default/e5fe842d2ad348991420a892d7cbcbba8c692ecf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/rtcc.o mcc_generated_files/tcpiplite/src/rtcc.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o: mcc_generated_files/tcpiplite/src/arpv4.c  .generated_files/flags/default/ed3242ce46dc2502f45699f92baa0d476604f52e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/arpv4.o mcc_generated_files/tcpiplite/src/arpv4.c 
	
${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o: mcc_generated_files/tcpiplite/src/log_console.c  .generated_files/flags/default/6e069cf6a8eea864c614554db037052307fda169 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tcpiplite/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o -o ${OBJECTDIR}/mcc_generated_files/tcpiplite/src/log_console.o mcc_generated_files/tcpiplite/src/log_console.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/default/b683ff61d96072153ace91f09b254be6cb186768 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c 
	
${OBJECTDIR}/mcc_generated_files/timer/src/delay.o: mcc_generated_files/timer/src/delay.c  .generated_files/flags/default/14f4b0e49b4ca7c46782f644728639947d8a1f10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/delay.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o -o ${OBJECTDIR}/mcc_generated_files/timer/src/delay.o mcc_generated_files/timer/src/delay.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/e6a55c782222aa68b87344e903874557ecb2a6f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/29f848c287b8fc44b11510b7c34334263cdc9890 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  -gdwarf-3 -mno-const-data-in-progmem -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/b23d56cd172986cbfcc97638ec3d2a886a6af367 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  -gdwarf-3 -mno-const-data-in-progmem -Wa,--defsym=__MPLAB_BUILD=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -gdwarf-3 -mno-const-data-in-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -gdwarf-3 -mno-const-data-in-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/enc28j60-avr-udp.X.${IMAGE_TYPE}.hex"
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}
