/**
  ******************************************************************************
  * @file stm8s_beep.c
  * @brief This file contains all the functions for the BEEP peripheral.
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
#include "stm8s_beep.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (BEEP_CODE)
#pragma section const {BEEP_CONST}
#pragma section @near [BEEP_URAM]
#pragma section @near {BEEP_IRAM}
#pragma section @tiny [BEEP_UZRAM]
#pragma section @tiny {BEEP_IZRAM}
#endif

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @addtogroup BEEP_Public_Functions
  * @{
  */

/**
  * @brief Deinitializes the BEEP peripheral registers to their default reset
  * values.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * BEEP_DeInit();
  * @endcode
  */
void BEEP_DeInit(void)
{
  BEEP->CSR = BEEP_CSR_RESET_VALUE;
}

/**
  * @brief Initializes the BEEP function according to the specified parameters.
  * @param[in] BEEP_Frequency Frequency selection.
  * can be one of the values of @ref BEEP_Frequency_TypeDef.
  * @retval void None
  * @par Required preconditions:
  * The LS RC calibration must be performed before calling this function.
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * BEEP_Init(BEEP_FREQUENCY_1KHZ);
  * @endcode
  */
void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
{

  /* Check parameter */
  assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));

  /* Enable the BEEP peripheral */
  BEEP->CSR |= BEEP_CSR_BEEPEN;

  /* Set a default calibration value if no calibration is done */
  if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
  {
    BEEP->CSR &= (u8)(~BEEP_CSR_BEEPDIV); /* Clear bits */
    BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
  }

  /* Select the output frequency */
  BEEP->CSR &= (u8)(~BEEP_CSR_BEEPSEL);
  BEEP->CSR |= (u8)(BEEP_Frequency);

}

/**
  * @brief Enable or disable the BEEP function.
  * @param[in] NewState Indicates the new state of the BEEP function.
  * @retval void None
  * @par Required preconditions:
  * Initialisation of BEEP and LS RC calibration must be done before.
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * BEEP_Cmd(ENABLE);
  * @endcode
  */
void BEEP_Cmd(FunctionalState NewState)
{
  if (NewState != DISABLE)
  {
    /* Enable the BEEP peripheral */
    BEEP->CSR |= BEEP_CSR_BEEPEN;
  }
  else
  {
    /* Disable the BEEP peripheral */
    BEEP->CSR &= (u8)(~BEEP_CSR_BEEPEN);
  }
}

/**
  * @brief Update CSR register with the measured LSI frequency.
  * @par Note on the APR calculation:
  * A is the integer part of LSIFreqkHz/4 and x the decimal part.
  * x <= A/(1+2A) is equivalent to A >= x(1+2A) and also to 4A >= 4x(1+2A) [F1]
  * but we know that A + x = LSIFreqkHz/4 ==> 4x = LSIFreqkHz-4A
  * so [F1] can be written :
  * 4A >= (LSIFreqkHz-4A)(1+2A)
  * @param[in] LSIFreqHz Low Speed RC frequency measured by timer (in Hz).
  * @retval void None
  * @par Required preconditions:
  * - BEEP must be disabled to avoid unwanted interrupts.
  * - The function TIM3_ComputeLsiClockFreq must be called first.
  * @par Called functions:
  * None
  * @par Example:
  * @code
  * u32 val;
  * // Measure LSI with a Timer frequency of 10MHz
  * val = TIM3_ComputeLsiClockFreq(10000000); // 'val' is in Hz
  * BEEP_LSICalibrationConfig(val);
  * @endcode
  * @par See Also:
  * BEEP_AutoLSICalibration() function
  */
void BEEP_LSICalibrationConfig(u32 LSIFreqHz)
{

  u16 lsifreqkhz;
  u16 A;

  /* Check parameter */
  assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));

  lsifreqkhz = (u16)(LSIFreqHz / 1000); /* Converts value in kHz */

  /* Calculation of BEEPER calibration value */

  BEEP->CSR &= (u8)(~BEEP_CSR_BEEPDIV); /* Clear bits */

  A = (u16)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */

  if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
  {
    BEEP->CSR |= (u8)(A - 2U);
  }
  else
  {
    BEEP->CSR |= (u8)(A - 1U);
  }

  /* Set the AWU MR bit to load the new value to the prescalers */
  AWU->CSR |= AWU_CSR_MR;

}

/**
  * @brief Measure the LSI frequency using TIM3 IC1 and update the calibration registers.
  * @par Parameters:
  * None
  * @retval ErrorStatus Equal SUCCESS if LSI measured by TIM3 out of range
  * @par Required preconditions:
  * It is recommanded to use a timer clock frequency of at least 10MHz in order to obtain
  * a better in the LSI frequency measurement.
  * @par Called functions:
  * - TIM3_ComputeLsiClockFreq
  * - BEEP_LSICalibrationConfig
  * @par Example:
  * @code
  * BEEP_AutoLSICalibration();
  * @endcode
  */
ErrorStatus BEEP_AutoLSICalibration(void)
{
  u32 lsi_freq_hz;
  u32 fmaster;
  ErrorStatus status;

  /* Get master frequency */
  fmaster = CLK_GetClockFreq();

  /* Enable the LSI measurement: LSI clock connected to TIM3 Input Capture 1 */
  AWU->CSR |= AWU_CSR_MSR;

  /* Measure the LSI frequency with TIM3 Input Capture 1 */
  lsi_freq_hz = TIM3_ComputeLsiClockFreq(fmaster);

  /* Disable the LSI measurement: LSI clock disconnected from TIM3 Input Capture 1 */
  AWU->CSR &= (u8)(~AWU_CSR_MSR);

  if ((lsi_freq_hz >= LSI_FREQUENCY_MIN) && (lsi_freq_hz <= LSI_FREQUENCY_MAX))
  {
    /* Update the calibration registers */
    BEEP_LSICalibrationConfig(lsi_freq_hz);
    status = SUCCESS;
  }
  else
  {
    status = ERROR;
  }

  return status;

}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
