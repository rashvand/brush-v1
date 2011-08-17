/**
  ******************************************************************************
  * @file stm8s_gpio.c
  * @brief This file contains all the functions for the GPIO peripheral.
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
#include "stm8s_gpio.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (GPIO_CODE)
#pragma section const {GPIO_CONST}
#pragma section @near [GPIO_URAM]
#pragma section @near {GPIO_IRAM}
#pragma section @tiny [GPIO_UZRAM]
#pragma section @tiny {GPIO_IZRAM}
#endif

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @addtogroup GPIO_Public_Functions
  * @{
  */

/**
  * @brief Deinitializes the GPIOx peripheral registers to their default reset
  * values.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @retval void : None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function:
  * @code
  * GPIO_DeInit(GPIOA);
  * GPIO_DeInit(GPIOB);
  * @endcode
  */
void GPIO_DeInit(GPIO_TypeDef* GPIOx)
{
  GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
  GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
  GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
  GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
}

/**
  * @brief Initializes the GPIOx according to the specified parameters.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param[in] GPIO_Pin : This parameter contains the pin number, it can be one or many members
  * of the @ref GPIO_Pin_TypeDef enumeration.
  * @param[in] GPIO_Mode : This parameter can be any of the @Ref GPIO_Mode_TypeDef enumeration.
  * @retval void : None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * GPIO_Init(GPIOC, GPIO_PIN_6 | GPIO_PIN_7,GPIO_MODE_OUT_PP_LOW_FAST);
  * GPIO_Init(GPIOD, GPIO_PIN_6 | GPIO_PIN_7,GPIO_MODE_OUT_PP_LOW_FAST);
  * @endcode
  */

void GPIO_Init(GPIO_TypeDef* GPIOx,
               GPIO_Pin_TypeDef GPIO_Pin,
               GPIO_Mode_TypeDef GPIO_Mode)
{
  /*----------------------*/
  /* Check the parameters */
  /*----------------------*/

  assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
  assert_param(IS_GPIO_PIN_OK(GPIO_Pin));

  /*-----------------------------*/
  /* Input/Output mode selection */
  /*-----------------------------*/

  if ((((u8)(GPIO_Mode)) & (u8)0x80) != (u8)0x00) /* Output mode */
  {
    if ((((u8)(GPIO_Mode)) & (u8)0x10) != (u8)0x00) /* High level */
    {
      GPIOx->ODR |= GPIO_Pin;
    } else /* Low level */
    {
      GPIOx->ODR &= (u8)(~(GPIO_Pin));
    }
    /* Set Output mode */
    GPIOx->DDR |= GPIO_Pin;
  } else /* Input mode */
  {
    /* Set Input mode */
    GPIOx->DDR &= (u8)(~(GPIO_Pin));
  }

  /*------------------------------------------------------------------------*/
  /* Pull-Up/Float (Input) or Push-Pull/Open-Drain (Output) modes selection */
  /*------------------------------------------------------------------------*/

  if ((((u8)(GPIO_Mode)) & (u8)0x40) != (u8)0x00) /* Pull-Up or Push-Pull */
  {
    GPIOx->CR1 |= GPIO_Pin;
  } else /* Float or Open-Drain */
  {
    GPIOx->CR1 &= (u8)(~(GPIO_Pin));
  }

  /*-----------------------------------------------------*/
  /* Interrupt (Input) or Slope (Output) modes selection */
  /*-----------------------------------------------------*/

  if ((((u8)(GPIO_Mode)) & (u8)0x20) != (u8)0x00) /* Interrupt or Slow slope */
  {
    GPIOx->CR2 |= GPIO_Pin;
  } else /* No external interrupt or No slope control */
  {
    GPIOx->CR2 &= (u8)(~(GPIO_Pin));
  }

}

/**
  * @brief Writes data to the specified GPIO data port.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param[in] PortVal : Specifies the value to be written to the port output.
  * data register.
  * @retval void : None
  * @par Required preconditions:
  * The port must be configured in output mode.
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * GPIO_Write(GPIOA, 0x55);
  * @endcode
  */
void GPIO_Write(GPIO_TypeDef* GPIOx, u8 PortVal)
{
  GPIOx->ODR = PortVal;
}

/**
  * @brief Writes high level to the specified GPIO pins.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param[in] PortPins : Specifies the pins to be turned high to the port output.
  * data register.
  * @retval void : None
  * @par Required preconditions:
  * The port must be configured in output mode.
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * GPIO_WriteHigh(GPIOA, (GPIO_PIN_7 | GPIO_PIN_0));
  * @endcode
  */
void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
  GPIOx->ODR |= PortPins;
}

/**
  * @brief Writes low level to the specified GPIO pins.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param[in] PortPins : Specifies the pins to be turned low to the port output.
  * data register.
  * @retval void : None
  * @par Required preconditions:
  * The port must be configured in output mode.
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * GPIO_WriteLow(GPIOA, (GPIO_PIN_7 | GPIO_PIN_0));
  * @endcode
  */
void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
  GPIOx->ODR &= (u8)(~PortPins);
}

/**
  * @brief Writes reverse level to the specified GPIO pins.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param[in] PortPins : Specifies the pins to be reversed to the port output.
  * data register.
  * @retval void : None
  * @par Required preconditions:
  * The port must be configured in output mode.
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * GPIO_WriteReverse(GPIOA, (GPIO_PIN_7 | GPIO_PIN_0));
  * @endcode
  */
void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
  GPIOx->ODR ^= PortPins;
}

/**
  * @brief Reads the specified GPIO output data port.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @retval u8 : GPIO output data port value.
  * @par Required preconditions:
  * The port must be configured in input mode.
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * u8 val;
  * val = GPIO_ReadOutputData(GPIOA);
  * @endcode
  */
u8 GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
{
  return ((u8)GPIOx->ODR);
}

/**
  * @brief Reads the specified GPIO input data port.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @retval u8 : GPIO input data port value.
  * @par Required preconditions:
  * The port must be configured in input mode.
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * u8 val;
  * val = GPIO_ReadInputData(GPIOA);
  * @endcode
  */
u8 GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
{
  return ((u8)GPIOx->IDR);
}

/**
  * @brief Reads the specified GPIO input data pin.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param[in] GPIO_Pin : This parameter contains the pin number, it can be one member
  * of the @ref GPIO_Pin_TypeDef enumeration.
  * @retval BitStatus : GPIO input pin status.
 * This parameter can be any of the @ref BitStatus enumeration.
  * @par Required preconditions:
  * The port must be configured in input mode.
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * BitStatus val;
  * val = GPIO_ReadInputPin(GPIOA, GPIO_PIN_0);
  * @endcode
  */
BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
{
  return ((BitStatus)(GPIOx->IDR & (u8)GPIO_Pin));
}
/**
  * @brief Configures the external pull-up on GPIOx pins.
  * @param[in] GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param[in] GPIO_Pin : This parameter contains the pin number, it can be one or many members
  * of the @ref GPIO_Pin_TypeDef enumeration.
  * @param[in] NewState : The new state of the pull up pin.
 * This parameter can be any of the @ref FunctionalState enumeration.
  * @retval void : None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function:
  * @code
  * GPIO_ExternalPullUpConfig(GPIOA, GPIO_PIN_6 | GPIO_PIN_7,ENABLE);
  * @endcode
  */
void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE) /* External Pull-Up Set*/
  {
    GPIOx->CR1 |= GPIO_Pin;
  } else /* External Pull-Up Reset*/
  {
    GPIOx->CR1 &= (u8)(~(GPIO_Pin));
  }
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
