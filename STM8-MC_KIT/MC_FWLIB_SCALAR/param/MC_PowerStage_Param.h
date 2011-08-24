/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_PowerStage_Param.h
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Power Stage parameters
********************************************************************************
* History:
* mm/dd/yyyy ver. x.y.z
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*
* THIS SOURCE CODE IS PROTECTED BY A LICENSE.
* FOR MORE INFORMATION PLEASE CAREFULLY READ THE LICENSE AGREEMENT FILE LOCATED
* IN THE ROOT DIRECTORY OF THIS FIRMWARE PACKAGE.
*******************************************************************************/

/******************************************************************************/
#ifndef __POWER_STAGE_PARAM_H
#define __POWER_STAGE_PARAM_H

#define RS_M 	10 // mOhm, resistenza in milliohm del current sense
#define AOP 	11 // messo a 11 come indicato nello schematico, guadagno dell'opamp per il current sense

//#define DISSIPATIVE_BRAKE // Uncomment to enable

/*
#define DISSIPATIVE_BRAKE_ACTIVE_HIGH 0
#define DISSIPATIVE_BRAKE_ACTIVE_LOW  1

#define DISSIPATIVE_BRAKE_POL DISSIPATIVE_BRAKE_ACTIVE_HIGH
*/

#define BUS_VOLTAGE_MEASUREMENT  // Comment to set fixed value

#ifndef BUS_VOLTAGE_MEASUREMENT
	#define BUS_VOLTAGE_VALUE 330 //Volts
#endif

#define HEAT_SINK_TEMPERATURE_VALUE 25 //�C

//BLDC drive: comment to drive the lowsides with GPIOs
//						uncomment to drive the lowsides with an advanced timer
//ACIM drive: comment to drive the lowsides with dedicated hardware
//						uncomment to drive the lowsides with an advanced timer
#define PWM_LOWSIDE_OUTPUT_ENABLE

#define BUS_ADC_CONV_RATIO  	0.075 // DC bus voltage partitioning ratio: modificato: R71/(R71+R22)
#define EXPECTED_MCU_VOLTAGE 	3.4  	// modificato come da vcc di BRUSH
#define BUSV_CONVERSION (EXPECTED_MCU_VOLTAGE/BUS_ADC_CONV_RATIO)
#define BUS2PHASECONST 		2.1	//a cosa serve???
#define MAX_BUS_VOLTAGE 	20 	//Volts: modificato
#define MIN_BUS_VOLTAGE 	5 	//Volts: modificato

#define NTC_THRESHOLD_C 	60 // Celsius
#define NTC_HYSTERIS_C 		5 // Celsius

#define TEMP_SENS_ALPHA 	5
#define TEMP_SENS_BETA 		59
#define TEMP_SENS_T0 			25
#define NTC_THRESHOLD (u16) ((TEMP_SENS_ALPHA * (NTC_THRESHOLD_C - TEMP_SENS_T0)) + TEMP_SENS_BETA)
#define NTC_HYSTERIS  (u16) ((TEMP_SENS_ALPHA * (NTC_THRESHOLD_C - NTC_HYSTERIS_C - TEMP_SENS_T0)) + TEMP_SENS_BETA)

#define ACTIVE_HIGH 	1
#define ACTIVE_LOW 		0
#define ACTIVE 				1
#define INACTIVE 			0

#define PWM_U_HIGH_SIDE_POLARITY			ACTIVE_HIGH
#define PWM_U_LOW_SIDE_POLARITY				ACTIVE_HIGH
#define PWM_U_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_U_LOW_SIDE_IDLE_STATE			INACTIVE

#define PWM_V_HIGH_SIDE_POLARITY			ACTIVE_HIGH
#define PWM_V_LOW_SIDE_POLARITY				ACTIVE_HIGH
#define PWM_V_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_V_LOW_SIDE_IDLE_STATE			INACTIVE

#define PWM_W_HIGH_SIDE_POLARITY			ACTIVE_HIGH
#define PWM_W_LOW_SIDE_POLARITY				ACTIVE_HIGH
#define PWM_W_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_W_LOW_SIDE_IDLE_STATE			INACTIVE 

// questo lo tolgo, non usato
// BRK_INPUT settings
// #define BKIN_POLARITY	ACTIVE_LOW

#endif /* __POWER_STAGE_PARAM_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
