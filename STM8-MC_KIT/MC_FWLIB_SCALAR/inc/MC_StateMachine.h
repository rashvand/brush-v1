/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_StateMachine.c
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Prototypes definition for MC_StateMachine.c
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
#ifndef __MC_STATEMACHINE_H__
#define __MC_STATEMACHINE_H__

typedef enum 
{
	SM_RESET,
	SM_IDLE,
	SM_STARTINIT,
	SM_START,
	SM_RUN,
	SM_STOP,
	SM_WAIT,
	SM_FAULT,
	SM_DEBUG1,
	SM_DEBUG2
} State_t;

void StateMachineExec(void);

#endif /*__MC_STATEMACHINE_H__*/

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
