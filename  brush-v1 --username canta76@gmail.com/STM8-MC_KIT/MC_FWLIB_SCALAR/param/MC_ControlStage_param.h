/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_ControlStage_param.h
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Control stage configuartion
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
#ifndef __MC_CONTROLSTAGE_PARAM_H
#define __MC_CONTROLSTAGE_PARAM_H

#include "MC_stm8s_clk_param.h"

// tolto display e anche joystick
// Configuartion
//#define DISPLAY
//#define JOYSTICK

// usare una delle 2 che segue??
//#define SET_TARGET_SPEED_BY_POTENTIOMETER
#define AUTO_START_UP

// tolto il DAC, serve solo per DEBUG
/*Uncomment to enable DAC functionality feature*/
//#define DAC_FUNCTIONALITY

/*Comment to disable OPTION bite programming*/
#define ENABLE_OPTION_BYTE_PROGRAMMING

// questo ci vuole in quanto il pwm sui low side è sulla PORTB
// nota del manuale:
// This remapping is necessary if the STM8S features less than 80 pins.
#define TIM1_CHxN_REMAP

// BRK settings
//Comment this define statement to disable the emergency input feature
//#define BKIN

// Optional includes
#ifdef DISPLAY
	#include "MC_Display.h"
	#include "MC_dev_display.h"
#endif

#include "MC_stm8s_port_param.h"

// Check configuartion
#if (defined(DAC_FUNCTIONALITY) && defined(DISSIPATIVE_BRAKE))
	#error "Is not possible to set DAC_FUNCTIONALITY togeter with DISSIPATIVE_BRAKE"
#endif

#endif /*__MC_CONTROLSTAGE_PARAM_H*/
/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/