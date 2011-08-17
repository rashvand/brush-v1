/**
  ********************************************************************************
  * @file stm8s_iwdg.c
  * @brief This file contains all the functions for the IWDG peripheral.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.1
  * @date 09/22/2008
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2008 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s_iwdg.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (IWDG_CODE)
#pragma section const {IWDG_CONST}
#pragma section @near [IWDG_URAM]
#pragma section @near {IWDG_IRAM}
#pragma section @tiny [IWDG_UZRAM]
#pragma section @tiny {IWDG_IZRAM}
#endif

/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/** @addtogroup IWDG_Public_Functions
  * @{
  */

/**
  * @brief Enables or disables write access to Prescaler and Reload registers.
  *
  * @par Full description:
  *  IWDG_WriteAccess: new state of write access to Prescaler and Reload registers.
  *                    This parameter can be one of the following values:
  *                       - IWDG_WriteAccess_Enable: Enable write access to
  *                         Prescaler and Reload registers
  *                       - IWDG_WriteAccess_Disable: Disable write access to
  *                         Prescaler and Reload registers
  * @param[in] IWDG_WriteAccess enable or disable the write access.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function:
  * Enable write access to Prescaler and Reload registers
  * @code
  * IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  * @endcode
  */
void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
{

  /* Check the parameters */
  assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));

  IWDG->KR = (u8)IWDG_WriteAccess; /* Write Access */

}

/**
  * @brief Sets IWDG Prescaler value.
  * @par Full description:
  * IWDG_Prescaler: specifies the IWDG Prescaler value.
  *                    This parameter can be one of the following values:
  *                       - IWDG_Prescaler_4: IWDG prescaler set to 4
  *                       - IWDG_Prescaler_8: IWDG prescaler set to 8
  *                       - IWDG_Prescaler_16: IWDG prescaler set to 16
  *                       - IWDG_Prescaler_32: IWDG prescaler set to 32
  *                       - IWDG_Prescaler_64: IWDG prescaler set to 64
  *                       - IWDG_Prescaler_128: IWDG prescaler set to 128
  *                       - IWDG_Prescaler_256: IWDG prescaler set to 256
  * @param[in] IWDG_Prescaler set the value of the prescaler register.
  * @retval void None
  * @par Required preconditions:
  * Write access enabled
  * @par Called functions:
  * IWDG_WriteAccessCmd
  * @par Example:
  * This example shows how to call the function:
  * @code
  * //IWDG counter clock prescaler = 32
  * IWDG_SetPrescaler(IWDG_Prescaler_32);
  * @endcode
  */
void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
{
  /* Check the parameters */
  assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));

  IWDG->PR = (u8)IWDG_Prescaler;
}

/**
  * @brief Sets IWDG Reload value.
  * @param[in] IWDG_Reload Specifies the IWDG Reload value (from 0x00 to 0xFF)
  * @retval void None
  * @par Required preconditions:
  * Write access enabled
  * @par Called functions:
  * IWDG_WriteAccessCmd
  * @par Examples:
  * This example shows how to call the function:
  * Set counter reload value to 149
  * @code
  * IWDG_SetReload(149);
  * @endcode
  */
void IWDG_SetReload(u8 IWDG_Reload)
{
  IWDG->RLR = IWDG_Reload;
}

/**
  * @brief Reload IWDG counter
  * @par Full description:
  * Reloads IWDG counter with value defined in the reload register
  * (write access to Prescaler and Reload registers disabled).
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * Write access enabled
  * @par Called functions:
  * None
  * @par Examples:
  * This example shows how to call the function:
  * Reload IWDG counter
  * @code
  * IWDG_ReloadCounter();
  * @endcode
  */
void IWDG_ReloadCounter(void)
{
  IWDG->KR = IWDG_KEY_REFRESH;
}

/**
  * @brief Enable IWDG registers access.
  * @par Full description:
  * Enables IWDG (write access to Prescaler and Reload registers disabled).
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * IWDG_WriteAccessCmd
  * @par Examples:
  * This example shows how to call the function:
  * Enable IWDG
  * @code
  * IWDG_Enable();
  * @endcode
  */
void IWDG_Enable(void)
{
  IWDG->KR = IWDG_KEY_ENABLE;
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
