/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_stm8s_vtimer.c
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Low level virtual timer implementation module
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

/* Includes ------------------------------------------------------------------*/
#include "stm8s_lib.h"
#include "MC_stm8s_clk_param.h"
#include "MC_vtimer.h"

#define DELTAT_MS 1 // ms

#define ARRVALUE ((DELTAT_MS * STM8_FREQ_MHZ * 1000) / 128) 

void dev_vtimerInit(void)
{
	TIM4_DeInit();
	
	/* Time base configuration */ 
	TIM4_TimeBaseInit(TIM4_PRESCALER_128,ARRVALUE); // Setting for 1ms Delta time
	//ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
	ITC->ISPR6 |= 0xC0;
	ITC->ISPR6 &= 0x7F;
	
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	enableInterrupts();
	
	 /* Enable TIM4 */
	TIM4_Cmd(ENABLE);
}

/**
  * @brief Timer4 Update/Overflow Interruption routine.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  */
@near @interrupt @svlreg void TIM4_UPD_OVF_IRQHandler (void)
{
	/* In order to detect unexpected events during development,
	 it is recommended to set a breakpoint on the following instruction.
	*/
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	vtimer_UpdateHandler();
	return;
}

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
