/**
  ********************************************************************************
  * @file stm8s_wwdg.c
  * @brief This file contains all the functions for the WWDG peripheral.
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
#include "stm8s_wwdg.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (WWDG_CODE)
#pragma section const {WWDG_CONST}
#pragma section @near [WWDG_URAM]
#pragma section @near {WWDG_IRAM}
#pragma section @tiny [WWDG_UZRAM]
#pragma section @tiny {WWDG_IZRAM}
#endif

/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/** @addtogroup WWDG_Public_Functions
  * @{
  */

/**
  * @brief Initialization of the WWDG peripheral.
  *  This function set Window Register = WindowValue,
  *  Control Register according to ControlValue and \b ENABLE \b WDG
  * @par Full description:
  * @param[in] Counter WWDG specifies the counter value
  * @param[in] WindowValue specifies the WWDG Window Register, range is 0x00 to 0x7F.
  * @retval
  * void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function:
  * Enable write access to Prescaler and Reload registers
  * @code
  * WWDG_Init(0xFF, 0x70);
  * @endcode
  */
void WWDG_Init(u8 Counter, u8 WindowValue)
{
  /* Check the parameters */
  assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  WWDG->WR = WWDG_WR_RESET_VALUE;
  WWDG->CR = (u8)(WWDG_CR_WDGA | WWDG_CR_T6 | Counter);
  WWDG->WR = (u8)((u8)(~WWDG_CR_WDGA) & (u8)(WWDG_CR_T6 | WindowValue));
}

/**
  * @brief Refresh of the WWDG peripheral.
  * This function has no effect out of Refresh Window
  * @par Full description:
  * @param[in] Counter WWDG Counter Value
  * @retval
  * void None
  * @par Required preconditions:
  * Required preconditions: \b Counter < \b Window \b Limit \n
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function:
  * @code
  * WWDG_SetCounter(0xFF);
  * @endcode
  */
void WWDG_SetCounter(u8 Counter)
{

  /* Check the parameters */
  assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));

  if ((WWDG->CR & (u8)(~WWDG_CR_WDGA)) < (WWDG->WR))
  {
    WWDG->CR = (u8)(WWDG_CR_WDGA | WWDG_CR_T6 | Counter);
  }

}

/**
  * @brief Read of the WWDG Counter Value.
  * This value could be used to check if WWDG is in the window, where refresh is allowed.
  * @par Full description:
  * None
  * @retval
  * u8 Control Register
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Examples:
  * This example shows how to call the function:
  * @code
  * u8 Watchdog_Value;
  * Watchdog_Value = WWDG_GetCounter();
  * @endcode
  */
u8 WWDG_GetCounter(void)
{
  return(WWDG->CR);
}

/**
  * @brief Generates immediate SW RESET, using the WWDG peripheral.
  * @par Full description:
  * None
  * @retval
  * void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Examples:
  * This example shows how to call the function:
  * @code
  * WWDG_SWReset();
  * @endcode
  */
void WWDG_SWReset(void)
{
  WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
}

/**
  * @brief Sets the WWDG window value.
  * @par Full description:
  * @param[in] WindowValue: specifies the window value to be compared to the downcounter.
  * @retval
  * void None
  * @par Required preconditions:
  * Required preconditions: This parameter value must be \b lower than \b 0x80.\n
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function using the maximum value:
  * @code
  * WWDG_SetWindowValue(0x7F)
  * @endcode
  */
void WWDG_SetWindowValue(u8 WindowValue)
{
  /* Check the parameters */
  assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  WWDG->WR = (u8)((u8)(~WWDG_CR_WDGA) & (u8)(WWDG_CR_T6 | WindowValue));
}
/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
