/**
  ******************************************************************************
  * @file stm8s_rst.c
  * @brief This file contains all the functions for the RST peripheral.
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

#include "stm8s_rst.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (RST_CODE)
#pragma section const {RST_CONST}
#pragma section @near [RST_URAM]
#pragma section @near {RST_IRAM}
#pragma section @tiny [RST_UZRAM]
#pragma section @tiny {RST_IZRAM}
#endif

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private Constants ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/**
  * @addtogroup RST_Public_Functions
  * @{
  */


/**
  * @brief Checks whether the specified RST flag is set or not.
  * @param[in] RST_Flag : specify the reset flag to check.
  * can be one of the values of @ref RST_Flag_TypeDef.
  * @retval FlagStatus: status of the given RST flag.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Get the EMCF flag status.
  * @code
  * FlagStatus RST_FlagStatus;
  * RST_FlagStatus = RST_GetFlagStatus(RST_FLAG_EMCF);
  * @endcode
  */
FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
{
  /* Check the parameters */
  assert_param(IS_RST_FLAG_OK(RST_Flag));

  /* Get flag status */

  return ((FlagStatus)((u8)RST->SR & (u8)RST_Flag));
}

/**
  * @brief Clears the specified RST flag.
  * @param[in] RST_Flag : specify the reset flag to clear.
  * can be one of the values of @ref RST_Flag_TypeDef.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Clears the SWIMF flag
  * @code
  * RST_ClearFlag(RST_FLAG_SWIMF);
  * @endcode
  */
void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
{
  /* Check the parameters */
  assert_param(IS_RST_FLAG_OK(RST_Flag));

  RST->SR = (u8)RST_Flag;
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
