/**
  ******************************************************************************
  * @file shared_variables.h
  * @brief This file contains all elements used by more than one source file.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0
  * @date 12/04/2010
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */
	
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SHARED_ELEMENTS_H
#define __SHARED_ELEMENTS_H

/* Public define -------------------------------------------------------------*/
#define MAX_NO_SAMPLE_VAL 16 	 /*Max no of temperature samples used to calculate the average temperature*/
//#define TIMER_REL_VAL ((u16)0xC350)

/* Global shared variables ---------------------------------------------------*/
extern bool ButtonPressed1;
extern bool ButtonPressed2;

extern u8 no_of_sample_vals;		 
																 
extern u16 temp_arr[MAX_NO_SAMPLE_VAL];

void TRtc_CntUpdate(void);
void TIM3_Init(void); 

#endif /* __SHARED_ELEMENTS_H */

/**
  * @}
  */

/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
