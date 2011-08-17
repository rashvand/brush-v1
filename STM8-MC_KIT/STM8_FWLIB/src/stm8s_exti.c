/**
  ******************************************************************************
  * @file stm8s_exti.c
  * @brief This file contains all the functions for the EXTI peripheral.
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
#include "stm8s_exti.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (EXTI_CODE)
#pragma section const {EXTI_CONST}
#pragma section @near [EXTI_URAM]
#pragma section @near {EXTI_IRAM}
#pragma section @tiny [EXTI_UZRAM]
#pragma section @tiny {EXTI_IZRAM}
#endif

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @addtogroup EXTI_Public_Functions
  * @{
  */

/**
  * @brief Deinitializes the external interrupt control registers to their default reset value.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * EXTI_DeInit();
  * @endcode
*/
void EXTI_DeInit(void)
{
  EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  EXTI->CR2 = EXTI_CR2_RESET_VALUE;
}

/**
  * @brief Set the external interrupt sensitivity of the selected port.
  * @warning
  * - The modification of external interrupt sensitivity is only possible when the interrupts are disabled.
  * - The normal behavior is to disable the interrupts before calling this function, and re-enable them after.
  * @param[in] Port The port number to access.
  * @param[in] SensitivityValue The external interrupt sensitivity value to set.
  * @retval void None
  * @par Required preconditions:
  * Global interrupts must be disabled before calling this function.
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
  * @endcode
  */
void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
{

  /* Check function parameters */
  assert_param(IS_EXTI_PORT_OK(Port));
  assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));

  /* Set external interrupt sensitivity */
  switch (Port)
  {
    case EXTI_PORT_GPIOA:
      EXTI->CR1 &= (u8)(~EXTI_CR1_PAIS);
      EXTI->CR1 |= (u8)(SensitivityValue);
      break;
    case EXTI_PORT_GPIOB:
      EXTI->CR1 &= (u8)(~EXTI_CR1_PBIS);
      EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 2);
      break;
    case EXTI_PORT_GPIOC:
      EXTI->CR1 &= (u8)(~EXTI_CR1_PCIS);
      EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 4);
      break;
    case EXTI_PORT_GPIOD:
      EXTI->CR1 &= (u8)(~EXTI_CR1_PDIS);
      EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 6);
      break;
    case EXTI_PORT_GPIOE:
      EXTI->CR2 &= (u8)(~EXTI_CR2_PEIS);
      EXTI->CR2 |= (u8)(SensitivityValue);
      break;
    default:
      break;
  }
}

/**
  * @brief Set the TLI interrupt sensitivity.
  * @param[in] SensitivityValue The TLI interrupt sensitivity value.
  * @retval void None
  * @par Required preconditions:
  * Global interrupts must be disabled before calling this function.
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_RISE_ONLY);
  * @endcode
  */
void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
{

  /* Check function parameters */
  assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));

  /* Set TLI interrupt sensitivity */
  EXTI->CR2 &= (u8)(~EXTI_CR2_TLIS);
  EXTI->CR2 |= (u8)(SensitivityValue);

}

/**
  * @brief Get the external interrupt sensitivity of the selected port.
  * @param[in] Port The port number to access.
  * @retval EXTI_Sensitivity_TypeDef The external interrupt sensitivity of the selected port.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * EXTI_Sensitivity_TypeDef val;
  * val = EXTI_GetExtIntSensitivity(EXTI_PORT_GPIOA);
  * if (val == EXTI_SENSITIVITY_RISE_ONLY) { ... }
  * @endcode
  */
EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
{

  u8 value = 0;

  /* Check function parameters */
  assert_param(IS_EXTI_PORT_OK(Port));

  switch (Port)
  {
    case EXTI_PORT_GPIOA:
      value = (u8)(EXTI->CR1 & EXTI_CR1_PAIS);
      break;
    case EXTI_PORT_GPIOB:
      value = (u8)((EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      break;
    case EXTI_PORT_GPIOC:
      value = (u8)((EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      break;
    case EXTI_PORT_GPIOD:
      value = (u8)((EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      break;
    case EXTI_PORT_GPIOE:
      value = (u8)(EXTI->CR2 & EXTI_CR2_PEIS);
      break;
    default:
      break;
  }

  return((EXTI_Sensitivity_TypeDef)value);

}

/**
  * @brief Get the TLI interrupt sensitivity.
  * @par Parameters:
  * None
  * @retval EXTI_TLISensitivity_TypeDef The TLI interrupt sensitivity read.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * EXTI_Sensitivity_TypeDef val;
  * val = EXTI_GetTLISensitivity();
  * if (val == EXTI_TLISENSITIVITY_FALL_ONLY) { ... }
  * @endcode
  */
EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
{

  u8 value;

  /* Get TLI interrupt sensitivity */
  value = (u8)(EXTI->CR2 & EXTI_CR2_TLIS);

  return((EXTI_TLISensitivity_TypeDef)value);
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
