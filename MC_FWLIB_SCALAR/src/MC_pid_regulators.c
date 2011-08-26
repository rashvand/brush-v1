/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_pid_regulators.c
* Author             : IMS Systems Lab
* Date First Issued  : mm/dd/yyy
* Description        : This source file implements a pid regulator
* Software package   : 
********************************************************************************
* History:
* 
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
/* Includes ------------------------------------------------------------------*/

#include "MC_pid_regulators.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private function-----------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

s16 PI_Regulator(s16 hReference, s16 hPresentFeedback, PPID_Struct_t PID_Struct)
{
  s32 wError, wProportional_Term,wIntegral_Term, houtput_32;
  s32 wIntegral_sum_temp; 
    
  // error computation
  wError= (s32)(hReference - hPresentFeedback);
 
  // Proportional term computation
  wProportional_Term = PID_Struct->pPID_Var->hKp_Gain * wError;

  // Integral term computation
  if (PID_Struct->pPID_Var->hKi_Gain == 0)
  {
    PID_Struct->pPID_Var->wIntegral = 0;
  }
  else
  { 
    wIntegral_Term = PID_Struct->pPID_Var->hKi_Gain * wError;
    wIntegral_sum_temp = PID_Struct->pPID_Var->wIntegral + wIntegral_Term;
		
		if (wIntegral_sum_temp > 0)
		{
			if (PID_Struct->pPID_Var->wIntegral < 0)
			{
				if (wIntegral_Term < 0)
				{
					wIntegral_sum_temp = S32_MIN;
				}
			}
		}
		else
		{
			if (PID_Struct->pPID_Var->wIntegral > 0)
			{
				if (wIntegral_Term > 0)
				{
					wIntegral_sum_temp = S32_MAX;
				}
			}
		}		
    
    if (wIntegral_sum_temp > PID_Struct->pPID_Const->wUpper_Limit_Integral)
    {
      PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wUpper_Limit_Integral;
    }
    else if (wIntegral_sum_temp < PID_Struct->pPID_Const->wLower_Limit_Integral)
    { 
      PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wLower_Limit_Integral;
    }
    else
    {
      PID_Struct->pPID_Var->wIntegral = wIntegral_sum_temp;
    }
  }
  
  houtput_32 = (wProportional_Term/PID_Struct->pPID_Const->hKp_Divisor+ 
                PID_Struct->pPID_Var->wIntegral/PID_Struct->pPID_Const->hKi_Divisor);

  if (houtput_32 > PID_Struct->pPID_Const->hUpper_Limit_Output)
  {
    houtput_32 = PID_Struct->pPID_Const->hUpper_Limit_Output;		  			 	
  }
  else if (houtput_32 < PID_Struct->pPID_Const->hLower_Limit_Output)
  {
    houtput_32 = PID_Struct->pPID_Const->hLower_Limit_Output;
  }
  return((s16)(houtput_32)); 		
}

s16 PID_Regulator(s16 hReference, s16 hPresentFeedback, PPID_Struct_t PID_Struct)
{
  s32 wError, wProportional_Term,wIntegral_Term, houtput_32;
  s32 wIntegral_sum_temp; 
  s32 wDifferential_Term;

  // error computation
  wError= (s32)(hReference - hPresentFeedback);
 
  // Proportional term computation
  wProportional_Term = PID_Struct->pPID_Var->hKp_Gain * wError;

  // Integral term computation
  if (PID_Struct->pPID_Var->hKi_Gain == 0)
  {
    PID_Struct->pPID_Var->wIntegral = 0;
  }
  else
  { 
    wIntegral_Term = PID_Struct->pPID_Var->hKi_Gain * wError;
    wIntegral_sum_temp = PID_Struct->pPID_Var->wIntegral + wIntegral_Term;
		
		if (wIntegral_sum_temp > 0)
		{
			if (PID_Struct->pPID_Var->wIntegral < 0)
			{
				if (wIntegral_Term < 0)
				{
					wIntegral_sum_temp = S32_MIN;
				}
			}
		}
		else
		{
			if (PID_Struct->pPID_Var->wIntegral > 0)
			{
				if (wIntegral_Term > 0)
				{
					wIntegral_sum_temp = S32_MAX;
				}
			}
		}		
    
    if (wIntegral_sum_temp > PID_Struct->pPID_Const->wUpper_Limit_Integral)
    {
      PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wUpper_Limit_Integral;
    }
    else if (wIntegral_sum_temp < PID_Struct->pPID_Const->wLower_Limit_Integral)
    { 
      PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wLower_Limit_Integral;
    }
    else
    {
      PID_Struct->pPID_Var->wIntegral = wIntegral_sum_temp;
    }
  }
  // Differential term computation
  {
  s32 wtemp;
  
  wtemp = wError - PID_Struct->pPID_Var->wPreviousError;
  wDifferential_Term = PID_Struct->pPID_Var->hKd_Gain * wtemp;
  PID_Struct->pPID_Var->wPreviousError = wError;    // store value 
  }
	
  houtput_32 = (wProportional_Term/PID_Struct->pPID_Const->hKp_Divisor+ 
                PID_Struct->pPID_Var->wIntegral/PID_Struct->pPID_Const->hKi_Divisor + 
                wDifferential_Term/PID_Struct->pPID_Const->hKd_Divisor); 

  if (houtput_32 > PID_Struct->pPID_Const->hUpper_Limit_Output)
  {
    houtput_32 = PID_Struct->pPID_Const->hUpper_Limit_Output;		  			 	
  }
  else if (houtput_32 < PID_Struct->pPID_Const->hLower_Limit_Output)
  {
    houtput_32 = PID_Struct->pPID_Const->hLower_Limit_Output;
  }
  return((s16)(houtput_32)); 		
}

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
