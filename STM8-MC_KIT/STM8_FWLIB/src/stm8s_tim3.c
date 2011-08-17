/**
  ******************************************************************************
  * @file stm8s_tim3.c
  * @brief This file contains all the functions for the TIM3 peripheral.
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
#include "stm8s_tim3.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (TIM3_CODE)
#pragma section const {TIM3_CONST}
#pragma section @near [TIM3_URAM]
#pragma section @near {TIM3_IRAM}
#pragma section @tiny [TIM3_UZRAM]
#pragma section @tiny {TIM3_IZRAM}
#endif

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void TI1_Config(u8 TIM3_ICPolarity, u8 TIM3_ICSelection, u8 TIM3_ICFilter);
static void TI2_Config(u8 TIM3_ICPolarity, u8 TIM3_ICSelection, u8 TIM3_ICFilter);
/**
  * @addtogroup TIM3_Public_Functions
  * @{
  */

/**
  * @brief Deinitializes the TIM3 peripheral registers to their default reset values.
  * @param[in] :
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Initialize TIM3 registers to their reset values.
  * @code
  * TIM3_DeInit();
  * @endcode
  */
void TIM3_DeInit(void)
{

  TIM3->CR1 = (u8)TIM3_CR1_RESET_VALUE;
  TIM3->IER = (u8)TIM3_IER_RESET_VALUE;
  TIM3->SR2 = (u8)TIM3_SR2_RESET_VALUE;

  /* Disable channels */
  TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;

  /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
  TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  TIM3->CCMR1 = (u8)TIM3_CCMR1_RESET_VALUE;
  TIM3->CCMR2 = (u8)TIM3_CCMR2_RESET_VALUE;
  TIM3->CNTRH = (u8)TIM3_CNTRH_RESET_VALUE;
  TIM3->CNTRL = (u8)TIM3_CNTRL_RESET_VALUE;
  TIM3->PSCR = (u8)TIM3_PSCR_RESET_VALUE;
  TIM3->ARRH  = (u8)TIM3_ARRH_RESET_VALUE;
  TIM3->ARRL  = (u8)TIM3_ARRL_RESET_VALUE;
  TIM3->CCR1H = (u8)TIM3_CCR1H_RESET_VALUE;
  TIM3->CCR1L = (u8)TIM3_CCR1L_RESET_VALUE;
  TIM3->CCR2H = (u8)TIM3_CCR2H_RESET_VALUE;
  TIM3->CCR2L = (u8)TIM3_CCR2L_RESET_VALUE;
  TIM3->SR1 = (u8)TIM3_SR1_RESET_VALUE;
}


/**
  * @brief Initializes the TIM3 Time Base Unit according to the specified parameters.
  * @param[in]  TIM3_Prescaler specifies the Prescaler from TIM3_Prescaler_TypeDef.
  * @param[in]  TIM3_Period specifies the Period value.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Initialize TIM3 registers according to the specified parameters.
  * @code
  * TIM3_Prescaler_TypeDef My_Prescaler = TIM3_PRESCALER_1;
  * u16 My_Period = 0xFF55;
  * TIM3_TimeBaseInit(My_Prescaler, My_Period);
  * @endcode
  */
void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
                        u16 TIM3_Period)
{
  /* Set the Prescaler value */
  TIM3->PSCR = (u8)(TIM3_Prescaler);
  /* Set the Autoreload value */
  TIM3->ARRH = (u8)(TIM3_Period >> 8);
  TIM3->ARRL = (u8)(TIM3_Period);
}

/**
  * @brief Initializes the TIM3 Channel1 according to the specified parameters.
  * @param[in] TIM3_OCMode specifies the Output Compare mode  from @ref TIM3_OCMode_TypeDef.
  * @param[in] TIM3_OutputState specifies the Output State  from @ref TIM3_OutputState_TypeDef.
  * @param[in] TIM3_Pulse specifies the Pulse width  value.
  * @param[in] TIM3_OCPolarity specifies the Output Compare Polarity  from @ref TIM3_OCPolarity_TypeDef.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Initialize the TIM3 Channel1 according to the specified parameters.
  * @code
  * TIM3_OCMode_TypeDef My_OCMode = TIM3_OCMODE_PWM1;
  * TIM3_OutputState_TypeDef My_OutputState = TIM3_OUTPUTSTATE_ENABLE;
  *  u16 My_Pulse = 0x7FFF;
  *   TIM3_OCPolarity_TypeDef My_OCPolarity = TIM3_OCPOLARITY_HIGH;
  * TIM3_OC1Init( My_OCMode, My_OutputState, My_Pulse,  My_OCPolarity);
  * @endcode
  */
void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
                  TIM3_OutputState_TypeDef TIM3_OutputState,
                  u16 TIM3_Pulse,
                  TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
{
  /* Check the parameters */
  assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
  assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
  assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));

  /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , the Output Polarity */
  TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
  /* Set the Output State &  Set the Output Polarity  */
  TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));

  /* Reset the Output Compare Bits & Set the Output Compare Mode */
  TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);

  /* Set the Pulse value */
  TIM3->CCR1H = (u8)(TIM3_Pulse >> 8);
  TIM3->CCR1L = (u8)(TIM3_Pulse);
}


/**
  * @brief Initializes the TIM3 Channel2 according to the specified parameters.
  * @param[in] TIM3_OCMode specifies the Output Compare mode  from @ref TIM3_OCMode_TypeDef.
  * @param[in] TIM3_OutputState specifies the Output State  from @ref TIM3_OutputState_TypeDef.
  * @param[in] TIM3_Pulse specifies the Pulse width  value.
  * @param[in] TIM3_OCPolarity specifies the Output Compare Polarity  from @ref TIM3_OCPolarity_TypeDef.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Initialize the TIM3 Channel2 according to the specified parameters.
  * @code
  * TIM3_OCMode_TypeDef My_OCMode = TIM3_OCMODE_PWM1;
  * TIM3_OutputState_TypeDef My_OutputState = TIM3_OUTPUTSTATE_ENABLE;
  *  u16 My_Pulse = 0x7FFF;
  *   TIM3_OCPolarity_TypeDef My_OCPolarity = TIM3_OCPOLARITY_HIGH;
  * TIM3_OC2Init( My_OCMode, My_OutputState, My_Pulse, My_OCPolarity);
  * @endcode
  */
void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
                  TIM3_OutputState_TypeDef TIM3_OutputState,
                  u16 TIM3_Pulse,
                  TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
{
  /* Check the parameters */
  assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
  assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
  assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));


  /* Disable the Channel 1: Reset the CCE Bit, Set the Output State, the Output Polarity */
  TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
  /* Set the Output State & Set the Output Polarity */
  TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC2P ));


  /* Reset the Output Compare Bits & Set the Output Compare Mode */
  TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);


  /* Set the Pulse value */
  TIM3->CCR2H = (u8)(TIM3_Pulse >> 8);
  TIM3->CCR2L = (u8)(TIM3_Pulse);
}

/**
  * @brief Initializes the TIM3 peripheral according to the specified parameters.
  * @param[in]  TIM3_Channel specifies the Input Capture Channel from @ref TIM3_Channel_TypeDef.
  * @param[in] TIM3_ICPolarity specifies the Input Capture Polarity from @ref TIM3_ICPolarity_TypeDef.
  * @param[in] TIM3_ICSelection specifies the Input Capture Selection from @ref TIM3_ICSelection_TypeDef.
  * @param[in] TIM3_ICPrescaler specifies the Input Capture Prescaler from @ref TIM3_ICPSC_TypeDef.
  * @param[in] TIM3_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * TI1_Config
  * TI2_Config
  * TI3_Config
  * TIM3_SetIC1Prescaler
  * TIM3_SetIC2Prescaler
  * TIM3_SetIC3Prescaler
  * @par Example:
  * Initialize the TIM3 Channel1 according to the specified parameters.
  * @code
  * TIM3_Channel_TypeDef My_Channel =TIM3_CHANNEL_1;
  * TIM3_ICPolarity_TypeDef My_ICPolarity=TIM3_ICPOLARITY_RISING;
  * TIM3_ICSelection_TypeDef My_ICSelection= TIM3_ICSELECTION_DIRECTTI;
  * TIM3_ICPSC_TypeDef My_ICPrescaler=TIM3_ICPSC_DIV1;
  * u8 TIM3_ICFilter= 0x0F;
  * TIM3_ICInit(My_Channel, My_ICPolarity, My_ICSelection, My_ICPrescaler, My_ICFilter);
  * @endcode
  */
void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
                 TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
                 TIM3_ICSelection_TypeDef TIM3_ICSelection,
                 TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
                 u8 TIM3_ICFilter)
{
  /* Check the parameters */
  assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
  assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
  assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
  assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
  assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));

  if (TIM3_Channel != TIM3_CHANNEL_2)
  {
    /* TI1 Configuration */
    TI1_Config(TIM3_ICPolarity,
               TIM3_ICSelection,
               TIM3_ICFilter);

    /* Set the Input Capture Prescaler value */
    TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
  }
  else
  {
    /* TI2 Configuration */
    TI2_Config(TIM3_ICPolarity,
               TIM3_ICSelection,
               TIM3_ICFilter);

    /* Set the Input Capture Prescaler value */
    TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
  }
}
/**
  * @brief Configures the TIM3 peripheral in PWM Input Mode according to the specified parameters.
    * @param[in]  TIM3_Channel specifies the Input Capture Channel from @ref TIM3_Channel_TypeDef.
  * @param[in] TIM3_ICPolarity specifies the Input Capture Polarity from @ref TIM3_ICPolarity_TypeDef.
  * @param[in] TIM3_ICSelection specifies theInput Capture Selection from @ref TIM3_ICSelection_TypeDef.
  * @param[in] TIM3_ICPrescaler specifies the Input Capture Prescaler from @ref TIM3_ICPSC_TypeDef.
  * @param[in] TIM3_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * TI1_Config
  * TI2_Config
  * TIM3_SetIC1Prescaler
  * TIM3_SetIC2Prescaler
  * @par Example:
  * Configure the TIM3 peripheral in PWM Input Mode according to the specified parameters.
  * @code
  * TIM3_Channel_TypeDef My_Channel =TIM3_CHANNEL_1;
  * TIM3_ICPolarity_TypeDef My_ICPolarity=TIM3_ICPOLARITY_RISING;
  * TIM3_ICSelection_TypeDef My_ICSelection= TIM3_ICSELECTION_DIRECTTI;
  * TIM3_ICPSC_TypeDef My_ICPrescaler=TIM3_ICPSC_DIV1;
  * u8 TIM3_ICFilter= 0x0F;
  * TIM3_PWMIConfig(My_Channel, My_ICPolarity, My_ICSelection, My_ICPrescaler, My_ICFilter);
  * @endcode
  */
void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
                     TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
                     TIM3_ICSelection_TypeDef TIM3_ICSelection,
                     TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
                     u8 TIM3_ICFilter)
{
  u8 icpolarity = (u8)TIM3_ICPOLARITY_RISING;
  u8 icselection = (u8)TIM3_ICSELECTION_DIRECTTI;

  /* Check the parameters */
  assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
  assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
  assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
  assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));

  /* Select the Opposite Input Polarity */
  if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
  {
    icpolarity = (u8)TIM3_ICPOLARITY_FALLING;
  }
  else
  {
    icpolarity = (u8)TIM3_ICPOLARITY_RISING;
  }

  /* Select the Opposite Input */
  if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
  {
    icselection = (u8)TIM3_ICSELECTION_INDIRECTTI;
  }
  else
  {
    icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
  }

  if (TIM3_Channel != TIM3_CHANNEL_2)
  {
    /* TI1 Configuration */
    TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
               TIM3_ICFilter);

    /* Set the Input Capture Prescaler value */
    TIM3_SetIC1Prescaler(TIM3_ICPrescaler);

    /* TI2 Configuration */
    TI2_Config(icpolarity, icselection, TIM3_ICFilter);

    /* Set the Input Capture Prescaler value */
    TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
  }
  else
  {
    /* TI2 Configuration */
    TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
               TIM3_ICFilter);

    /* Set the Input Capture Prescaler value */
    TIM3_SetIC2Prescaler(TIM3_ICPrescaler);

    /* TI1 Configuration */
    TI1_Config(icpolarity, icselection, TIM3_ICFilter);

    /* Set the Input Capture Prescaler value */
    TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
  }
}


/**
  * @brief Enables or disables the TIM3 peripheral.
  * @param[in] NewState new state of the TIM3 peripheral. This parameter can
  * be ENABLE or DISABLE.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the TIM3 peripheral.
  * @code
  * TIM3_Cmd(ENABLE);
  * @endcode
  */
void TIM3_Cmd(FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  /* set or Reset the CEN Bit */
  if (NewState != DISABLE)
  {
    TIM3->CR1 |= TIM3_CR1_CEN;
  }
  else
  {
    TIM3->CR1 &= (u8)(~TIM3_CR1_CEN);
  }
}


/**
  * @brief Enables or disables the specified TIM3 interrupts.
  * @param[in] NewState new state of the TIM3 peripheral.
  * This parameter can be: ENABLE or DISABLE.
  * @param[in] TIM3_IT specifies the TIM3 interrupts sources to be enabled or disabled.
  * This parameter can be any combination of the following values:
  *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
  *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
  *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
  *                       - TIM3_IT_CC3: TIM3 Capture Compare 3 Interrupt source
  * @param[in] NewState new state of the TIM3 peripheral.  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the the TIM3_IT_UPDATE interrupt.
  * @code
  * TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
  * @endcode
  */
void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_TIM3_IT_OK(TIM3_IT));
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the Interrupt sources */
    TIM3->IER |= TIM3_IT;
  }
  else
  {
    /* Disable the Interrupt sources */
    TIM3->IER &= (u8)(~TIM3_IT);
  }
}


/**
  * @brief Enables or Disables the TIM3 Update event.
  * @param[in] NewState new state of the TIM3 peripheral Preload register. This parameter can
  * be ENABLE or DISABLE.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the TIM3 Update event.
  * @code
  * TIM3_UpdateDisableConfig(ENABLE);
  * @endcode
  */
void TIM3_UpdateDisableConfig(FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  /* Set or Reset the UDIS Bit */
  if (NewState != DISABLE)
  {
    TIM3->CR1 |= TIM3_CR1_UDIS;
  }
  else
  {
    TIM3->CR1 &= (u8)(~TIM3_CR1_UDIS);
  }
}

/**
  * @brief Selects the TIM3 Update Request Interrupt source.
  * @param[in] TIM3_UpdateSource specifies the Update source.
  * This parameter can be one of the following values
  *                       - TIM3_UPDATESOURCE_REGULAR
  *                       - TIM3_UPDATESOURCE_GLOBAL
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Select the TIM3 Update Request Interrupt source
  * @code
  * TIM3_UpdateRequestConfig(TIM3_UPDATESOURCE_GLOBAL);
  * @endcode
  */
void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
{
  /* Check the parameters */
  assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));

  /* Set or Reset the URS Bit */
  if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
  {
    TIM3->CR1 |= TIM3_CR1_URS;
  }
  else
  {
    TIM3->CR1 &= (u8)(~TIM3_CR1_URS);
  }
}


/**
  * @brief Selects the TIM3�s One Pulse Mode.
  * @param[in] TIM3_OPMode specifies the OPM Mode to be used.
  * This parameter can be one of the following values
  *                    - TIM3_OPMODE_SINGLE
  *                    - TIM3_OPMODE_REPETITIVE
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Select the TIM3 single One Pulse Mode
  * @code
  * TIM3_SelectOnePulseMode(TIM3_OPMODE_SINGLE);
  * @endcode
  */
void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
{
  /* Check the parameters */
  assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));

  /* Set or Reset the OPM Bit */
  if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
  {
    TIM3->CR1 |= TIM3_CR1_OPM;
  }
  else
  {
    TIM3->CR1 &= (u8)(~TIM3_CR1_OPM);
  }

}


/**
  * @brief Configures the TIM3 Prescaler.
  * @param[in] Prescaler specifies the Prescaler Register value
  * This parameter can be one of the following values
  *                       -  TIM3_PRESCALER_1
  *                       -  TIM3_PRESCALER_2
  *                       -  TIM3_PRESCALER_4
  *                       -  TIM3_PRESCALER_8
  *                       -  TIM3_PRESCALER_16
  *                       -  TIM3_PRESCALER_32
  *                       -  TIM3_PRESCALER_64
  *                       -  TIM3_PRESCALER_128
  *                       -  TIM3_PRESCALER_256
  *                       -  TIM3_PRESCALER_512
  *                       -  TIM3_PRESCALER_1024
  *                       -  TIM3_PRESCALER_2048
  *                       -  TIM3_PRESCALER_4096
  *                       -  TIM3_PRESCALER_8192
  *                       -  TIM3_PRESCALER_16384
  *                       -  TIM3_PRESCALER_32768
  * @param[in] TIM3_PSCReloadMode specifies the TIM3 Prescaler Reload mode.
  * This parameter can be one of the following values
  *                       - TIM3_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded
  *                         immediatly.
  *                       - TIM3_PSCRELOADMODE_UPDATE: The Prescaler is loaded at
  *                         the update event.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Configures the TIM3 Prescaler.
  * @code
  * TIM3_PrescalerConfig(TIM3_PRESCALER_1, TIM3_PSCRELOADMODE_UPDATE);
  * @endcode
  */
void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
                          TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
{
  /* Check the parameters */
  assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
  assert_param(IS_TIM3_PRESCALER_OK(Prescaler));

  /* Set the Prescaler value */
  TIM3->PSCR = Prescaler;

  /* Set or reset the UG Bit */
  TIM3->EGR = TIM3_PSCReloadMode;
}

/**
  * @brief Forces the TIM3 Channel1 output waveform to active or inactive level.
  * @param[in] TIM3_ForcedAction specifies the forced Action to be set to the output waveform.
  * This parameter can be one of the following values:
  *                       - TIM3_FORCEDACTION_ACTIVE: Force active level on OC1REF
  *                       - TIM3_FORCEDACTION_INACTIVE: Force inactive level on
  *                         OC1REF.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Force the TIM3 Channel1 output waveform to active or inactive level.
  * @code
  * TIM3_ForcedOC1Config(TIM3_FORCEDACTION_ACTIVE);
  * @endcode
  */
void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
{
  /* Check the parameters */
  assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));

  /* Reset the OCM Bits & Configure the Forced output Mode */
  TIM3->CCMR1 =  (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM))  | (u8)TIM3_ForcedAction);
}

/**
  * @brief Forces the TIM3 Channel2 output waveform to active or inactive level.
  * @param[in] TIM3_ForcedAction specifies the forced Action to be set to the output waveform.
  * This parameter can be one of the following values:
  *                       - TIM3_FORCEDACTION_ACTIVE: Force active level on OC2REF
  *                       - TIM3_FORCEDACTION_INACTIVE: Force inactive level on
  *                         OC2REF.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Force the TIM3 Channel2 output waveform to active or inactive level.
  * @code
  * TIM3_ForcedOC2Config(TIM3_FORCEDACTION_ACTIVE);
  * @endcode
  */
void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
{
  /* Check the parameters */
  assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));

  /* Reset the OCM Bits & Configure the Forced output Mode */
  TIM3->CCMR2 =  (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_ForcedAction);
}


/**
  * @brief Enables or disables TIM3 peripheral Preload register on ARR.
  * @param[in] NewState new state of the TIM3 peripheral Preload register.
  * This parameter can be ENABLE or DISABLE.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable TIM3 peripheral Preload register on ARR.
  * @code
  * TIM3_ARRPreloadConfig(ENABLE);
  * @endcode
  */
void TIM3_ARRPreloadConfig(FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  /* Set or Reset the ARPE Bit */
  if (NewState != DISABLE)
  {
    TIM3->CR1 |= TIM3_CR1_ARPE;
  }
  else
  {
    TIM3->CR1 &= (u8)(~TIM3_CR1_ARPE);
  }
}


/**
  * @brief Enables or disables the TIM3 peripheral Preload Register on CCR1.
  * @param[in] NewState new state of the Capture Compare Preload register.
  * This parameter can be ENABLE or DISABLE.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the TIM3 peripheral Preload Register on CCR1.
  * @code
  * TIM3_OC1PreloadConfig(ENABLE);
  * @endcode
  */
void TIM3_OC1PreloadConfig(FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  /* Set or Reset the OC1PE Bit */
  if (NewState != DISABLE)
  {
    TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
  }
  else
  {
    TIM3->CCMR1 &= (u8)(~TIM3_CCMR_OCxPE);
  }
}


/**
  * @brief Enables or disables the TIM3 peripheral Preload Register on CCR2.
  * @param[in] NewState new state of the Capture Compare Preload register.
  * This parameter can be ENABLE or DISABLE.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the TIM3 peripheral Preload Register on CCR2.
  * @code
  * TIM3_OC2PreloadConfig(ENABLE);
  * @endcode
  */
void TIM3_OC2PreloadConfig(FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  /* Set or Reset the OC2PE Bit */
  if (NewState != DISABLE)
  {
    TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
  }
  else
  {
    TIM3->CCMR2 &= (u8)(~TIM3_CCMR_OCxPE);
  }
}

/**
  * @brief Configures the TIM3 event to be generated by software.
  * @param[in] TIM3_EventSource specifies the event source.
  * This parameter can be one of the following values:
  *                       - TIM3_EVENTSOURCE_UPDATE: TIM3 update Event source
  *                       - TIM3_EVENTSOURCE_CC1: TIM3 Capture Compare 1 Event source
  *                       - TIM3_EVENTSOURCE_CC2: TIM3 Capture Compare 2 Event source
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Configure the TIM3 event to be generated by software.
  * @code
  * TIM3_GenerateEvent(TIM3_EVENTSOURCE_UPDATE);
  * @endcode
  */
void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
{
  /* Check the parameters */
  assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));

  /* Set the event sources */
  TIM3->EGR = TIM3_EventSource;
}


/**
  * @brief Configures the TIM3 Channel 1 polarity.
  * @param[in] TIM3_OCPolarity specifies the OC1 Polarity.
  * This parameter can be one of the following values:
  *                       - TIM3_OCPOLARITY_LOW: Output Compare active low
  *                       - TIM3_OCPOLARITY_HIGH: Output Compare active high
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Configure the TIM3 Channel 1 polarity to High.
  * @code
  * TIM3_OC1PolarityConfig(TIM3_OCPOLARITY_HIGH);
  * @endcode
  */
void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
{
  /* Check the parameters */
  assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));

  /* Set or Reset the CC1P Bit */
  if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
  {
    TIM3->CCER1 |= TIM3_CCER1_CC1P;
  }
  else
  {
    TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
  }
}


/**
  * @brief Configures the TIM3 Channel 2 polarity.
  * @param[in] TIM3_OCPolarity specifies the OC2 Polarity.
  * This parameter can be one of the following values:
  *                       - TIM3_OCPOLARITY_LOW: Output Compare active low
  *                       - TIM3_OCPOLARITY_HIGH: Output Compare active high
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Configure the TIM3 Channel 2 polarity to High.
  * @code
  * TIM3_OC2PolarityConfig(TIM3_OCPOLARITY_HIGH);
  * @endcode
  */
void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
{
  /* Check the parameters */
  assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));

  /* Set or Reset the CC2P Bit */
  if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
  {
    TIM3->CCER1 |= TIM3_CCER1_CC2P;
  }
  else
  {
    TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
  }
}


/**
  * @brief Enables or disables the TIM3 Capture Compare Channel x.
  * @param[in] TIM3_Channel specifies the TIM3 Channel.
  * This parameter can be one of the following values:
  *                       - TIM3_CHANNEL_1: TIM3 Channel1
  *                       - TIM3_CHANNEL_2: TIM3 Channel2
  * @param[in] NewState specifies the TIM3 Channel CCxE bit new state.
  * This parameter can be: ENABLE or DISABLE.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the TIM3 Capture Compare Channel 1.
  * @code
  * TIM3_CCxCmd(TIM3_CHANNEL_1, ENABLE);
  * @endcode
  */
void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (TIM3_Channel == TIM3_CHANNEL_1)
  {
    /* Set or Reset the CC1E Bit */
    if (NewState != DISABLE)
    {
      TIM3->CCER1 |= TIM3_CCER1_CC1E;
    }
    else
    {
      TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
    }

  }
  else
  {
    /* Set or Reset the CC2E Bit */
    if (NewState != DISABLE)
    {
      TIM3->CCER1 |= TIM3_CCER1_CC2E;
    }
    else
    {
      TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
    }
  }

}

/**
  * @brief Selects the TIM3 Output Compare Mode. This function disables the
  * selected channel before changing the Output Compare Mode. User has to
  * enable this channel using TIM3_CCxCmd and TIM3_CCxNCmd functions.
  * @param[in] TIM3_Channel specifies the TIM3 Channel.
  * This parameter can be one of the following values:
  *                       - TIM3_CHANNEL_1: TIM3 Channel1
  *                       - TIM3_CHANNEL_2: TIM3 Channel2
  * @param[in] TIM3_OCMode specifies the TIM3 Output Compare Mode.
  * This paramter can be one of the following values:
  *                       - TIM3_OCMODE_TIMING
  *                       - TIM3_OCMODE_ACTIVE
  *                       - TIM3_OCMODE_TOGGLE
  *                       - TIM3_OCMODE_PWM1
  *                       - TIM3_OCMODE_PWM2
  *                       - TIM3_FORCEDACTION_ACTIVE
  *                       - TIM3_FORCEDACTION_INACTIVE
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Selects the TIM3 Output Compare Mode TIM3_OCMODE_TIMING for channel1.
  * @code
  * TIM3_SelectOCxM(TIM3_CHANNEL_1, TIM3_OCMODE_TIMING);
  * @endcode
  */
void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
{
  /* Check the parameters */
  assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
  assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));

  if (TIM3_Channel == TIM3_CHANNEL_1)
  {
    /* Disable the Channel 1: Reset the CCE Bit */
    TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);

    /* Reset the Output Compare Bits & Set the Output Compare Mode */
    TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
  }
  else
  {
    /* Disable the Channel 2: Reset the CCE Bit */
    TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);

    /* Reset the Output Compare Bits & Set the Output Compare Mode */
    TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
  }
}


/**
  * @brief Sets the TIM3 Counter Register value.
  * @param[in] Counter specifies the Counter register new value.
  * This parameter is between 0x0000 and 0xFFFF.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Set the TIM3 Counter Register value to 0xFFEE.
  * @code
  * TIM3_SetCounter(0xFFEE);
  * @endcode
  */
void TIM3_SetCounter(u16 Counter)
{
  /* Set the Counter Register value */
  TIM3->CNTRH = (u8)(Counter >> 8);
  TIM3->CNTRL = (u8)(Counter);

}


/**
  * @brief Sets the TIM3 Autoreload Register value.
  * @param[in] Autoreload specifies the Autoreload register new value.
  * This parameter is between 0x0000 and 0xFFFF.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Set the TIM3 Autoreload Register value to 0xFFEE.
  * @code
  * TIM3_SetAutoreload(0xFFEE);
  * @endcode
  */
void TIM3_SetAutoreload(u16 Autoreload)
{
  /* Set the Autoreload Register value */
  TIM3->ARRH = (u8)(Autoreload >> 8);
  TIM3->ARRL = (u8)(Autoreload);
}


/**
  * @brief Sets the TIM3 Capture Compare1 Register value.
  * @param[in] Compare1 specifies the Capture Compare1 register new value.
  * This parameter is between 0x0000 and 0xFFFF.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Set the TIM3 Capture Compare1 Register value to 0xFFEE.
  * @code
  * TIM3_SetCompare1(0xFFEE);
  * @endcode
  */
void TIM3_SetCompare1(u16 Compare1)
{
  /* Set the Capture Compare1 Register value */
  TIM3->CCR1H = (u8)(Compare1 >> 8);
  TIM3->CCR1L = (u8)(Compare1);
}


/**
  * @brief Sets the TIM3 Capture Compare2 Register value.
  * @param[in] Compare2 specifies the Capture Compare2 register new value.
  * This parameter is between 0x0000 and 0xFFFF.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Set the TIM3 Capture Compare2 Register value to 0xFFEE.
  * @code
  * TIM3_SetCompare2(0xFFEE);
  * @endcode
  */
void TIM3_SetCompare2(u16 Compare2)
{
  /* Set the Capture Compare2 Register value */
  TIM3->CCR2H = (u8)(Compare2 >> 8);
  TIM3->CCR2L = (u8)(Compare2);
}


/**
  * @brief Sets the TIM3 Input Capture 1 prescaler.
  * @param[in] TIM3_IC1Prescaler specifies the Input Capture prescaler new value
  * This parameter can be one of the following values:
  *                       - TIM3_ICPSC_DIV1: no prescaler
  *                       - TIM3_ICPSC_DIV2: capture is done once every 2 events
  *                       - TIM3_ICPSC_DIV4: capture is done once every 4 events
  *                       - TIM3_ICPSC_DIV8: capture is done once every 8 events
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Set the TIM3 Input Capture 1 prescaler to do a capture every 8 events.
  * @code
  * TIM3_SetIC1Prescaler(TIM3_ICPSC_DIV8);
  * @endcode
  */
void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
{
  /* Check the parameters */
  assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));

  /* Reset the IC1PSC Bits & Set the IC1PSC value */
  TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC1Prescaler);
}

/**
  * @brief Sets the TIM3 Input Capture 2 prescaler.
  * @param[in] TIM3_IC2Prescaler specifies the Input Capture prescaler new value
  * This parameter can be one of the following values:
  *                       - TIM3_ICPSC_DIV1: no prescaler
  *                       - TIM3_ICPSC_DIV2: capture is done once every 2 events
  *                       - TIM3_ICPSC_DIV4: capture is done once every 4 events
  *                       - TIM3_ICPSC_DIV8: capture is done once every 8 events
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Set the TIM3 Input Capture 2 prescaler to do a capture every 8 events.
  * @code
  * TIM3_SetIC2Prescaler(TIM3_ICPSC_DIV8);
  * @endcode
  */
void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
{
  /* Check the parameters */
  assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));

  /* Reset the IC1PSC Bits & Set the IC1PSC value */
  TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC2Prescaler);
}
/**
  * @brief Gets the TIM3 Input Capture 1 value.
  * @param[in] :
  * None
  * @retval Capture Compare 1 Register value.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Get the TIM3 Input Capture 1 value.
  * @code
  * u16 Value;
  * Value = TIM3_GetCapture1();
  * @endcode
  */
u16 TIM3_GetCapture1(void)
{
    /* Get the Capture 1 Register value */
   u16 tmpccr1 = 0;
   u8 tmpccr1l=0, tmpccr1h=0;
  
    tmpccr1h = TIM3->CCR1H;
	tmpccr1l = TIM3->CCR1L;

    tmpccr1 = (u16)(tmpccr1l);
    tmpccr1 |= (u16)((u16)tmpccr1h << 8);
    /* Get the Capture 1 Register value */
    return (u16)tmpccr1;
}

/**
  * @brief Gets the TIM3 Input Capture 2 value.
  * @param[in] :
  * None
  * @retval Capture Compare 2 Register value.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Get the TIM3 Input Capture 2 value.
  * @code
  * u16 Value;
  * Value = TIM3_GetCapture2();
  * @endcode
  */
u16 TIM3_GetCapture2(void)
{
    /* Get the Capture 2 Register value */
   u16 tmpccr2 = 0;
   u8 tmpccr2l=0, tmpccr2h=0;
  
    tmpccr2h = TIM3->CCR2H;
	tmpccr2l = TIM3->CCR2L;

    tmpccr2 = (u16)(tmpccr2l);
    tmpccr2 |= (u16)((u16)tmpccr2h << 8);
    /* Get the Capture 2 Register value */
    return (u16)tmpccr2;
}

/**
  * @brief Gets the TIM3 Counter value.
  * @param[in] :
  * None
  * @retval Counter Register value.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Get the TIM3 Counter value.
  * @code
  * u16 Value;
  * Value = TIM3_GetCounter();
  * @endcode
  */
u16 TIM3_GetCounter(void)
{
  /* Get the Counter Register value */
  return (u16)(((u16)TIM3->CNTRH << 8) | (u16)(TIM3->CNTRL));
}


/**
  * @brief Gets the TIM3 Prescaler value.
  * @param[in] :
  * None
  * @retval Prescaler Register configuration value @ref TIM3_Prescaler_TypeDef.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Get the TIM3 Prescaler configurartion value.
  * @code
  * TIM3_Prescaler_TypeDef  Prescaler;
  * Prescaler = TIM3_GetPrescaler();
  * @endcode
  */
TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
{
  /* Get the Prescaler Register value */
  return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
}


/**
  * @brief Checks whether the specified TIM3 flag is set or not.
  * @param[in] TIM3_FLAG specifies the flag to check.
  * This parameter can be one of the following values:
  *                       - TIM3_FLAG_UPDATE: TIM3 update Flag
  *                       - TIM3_FLAG_CC1: TIM3 Capture Compare 1 Flag
  *                       - TIM3_FLAG_CC2: TIM3 Capture Compare 2 Flag
  *                       - TIM3_FLAG_CC1OF: TIM3 Capture Compare 1 over capture Flag
  *                       - TIM3_FLAG_CC2OF: TIM3 Capture Compare 2 over capture Flag
  * @retval FlagStatus The new state of TIM3_FLAG (SET or RESET).
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Check whether the TIM3_FLAG_UPDATE flag is set or not.
  * @code
  * FlagStatus FlagValue;
  * FlagValue = TIM3_GetFlagStatus(TIM3_FLAG_UPDATE);
  * @endcode
  */
FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
{
  FlagStatus bitstatus = RESET;
  u8 tim3_flag_l, tim3_flag_h;

  /* Check the parameters */
  assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));

  tim3_flag_l = (u8)(TIM3_FLAG);
  tim3_flag_h = (u8)(TIM3_FLAG >> 8);

  if (((TIM3->SR1 & tim3_flag_l) | (TIM3->SR2 & tim3_flag_h)) != (u8)RESET )
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return (FlagStatus)bitstatus;
}


/**
  * @brief Clears the TIM3�s pending flags.
  * @param[in] TIM3_FLAG specifies the flag to clear.
  * This parameter can be one of the following values:
  *                       - TIM3_FLAG_UPDATE: TIM3 update Flag
  *                       - TIM3_FLAG_CC1: TIM3 Capture Compare 1 Flag
  *                       - TIM3_FLAG_CC2: TIM3 Capture Compare 2 Flag
  *                       - TIM3_FLAG_CC1OF: TIM3 Capture Compare 1 over capture Flag
  *                       - TIM3_FLAG_CC2OF: TIM3 Capture Compare 2 over capture Flag
  * @retval void None.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Clear the TIM3_FLAG_UPDATE flag.
  * @code
  * TIM3_ClearFlag(TIM3_FLAG_UPDATE);
  * @endcode
  */
void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
{
  /* Check the parameters */
  assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));

  /* Clear the flags (rc_w0) clear this bit by writing 0. Writing �1� has no effect*/
  TIM3->SR1 = (u8)(~((u8)(TIM3_FLAG)));
  TIM3->SR2 = (u8)(~((u8)(TIM3_FLAG >> 8)));
}


/**
  * @brief Checks whether the TIM3 interrupt has occurred or not.
  * @param[in] TIM3_IT specifies the TIM3 interrupt source to check.
  * This parameter can be one of the following values:
  *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
  *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
  *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
  * @retval ITStatus The new state of the TIM3_IT(SET or RESET).
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Check whether the TIM3_IT_UPDATE interrupt has occurred or not.
  * @code
  * ITStatus ITValue;
  * ITValue = TIM3_GetITStatus(TIM3_IT_UPDATE);
  * @endcode
  */

ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
{
  ITStatus bitstatus = RESET;

  u8 TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;

  /* Check the parameters */
  assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));

  TIM3_itStatus = (u8)(TIM3->SR1 & TIM3_IT);

  TIM3_itEnable = (u8)(TIM3->IER & TIM3_IT);

  if ((TIM3_itStatus != (u8)RESET ) && (TIM3_itEnable != (u8)RESET ))
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return (ITStatus)(bitstatus);
}


/**
  * @brief Clears the TIM3's interrupt pending bits.
  * @param[in] TIM3_IT specifies the pending bit to clear.
  * This parameter can be one of the following values:
  *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
  *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
  *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
  * @retval void None.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Clear the TIM3_IT_UPDATE interrupt pending bit.
  * @code
  * TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
  * @endcode
  */
void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
{
  /* Check the parameters */
  assert_param(IS_TIM3_IT_OK(TIM3_IT));

  /* Clear the IT pending Bit */
  TIM3->SR1 = (u8)(~TIM3_IT);
}


/**
  * @brief Configure the TI1 as Input.
  * @param[in] TIM3_ICPolarity  The Input Polarity.
  * This parameter can be one of the following values:
  *                       - TIM3_ICPOLARITY_FALLING
  *                       - TIM3_ICPOLARITY_RISING
  * @param[in] TIM3_ICSelection specifies the input to be used.
  * This parameter can be one of the following values:
  *                       - TIM3_ICSELECTION_DIRECTTI: TIM3 Input 1 is selected to
  *                         be connected to IC1.
  *                       - TIM3_ICSELECTION_INDIRECTTI: TIM3 Input 1 is selected to
  *                         be connected to IC2.
  * @param[in] TIM3_ICFilter Specifies the Input Capture Filter.
  * This parameter must be a value between 0x00 and 0x0F.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Configure the TI1 as Input selected to be connected to IC1 with Rising Polarity and 0x0E as Filter value.
  * @code
  * TI1_Config(TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI,0x0E);
  * @endcode
  */
static void TI1_Config(u8 TIM3_ICPolarity,
                       u8 TIM3_ICSelection,
                       u8 TIM3_ICFilter)
{
  /* Disable the Channel 1: Reset the CCE Bit */
  TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);

  /* Select the Input and set the filter */
  TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));

  /* Select the Polarity */
  if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
  {
    TIM3->CCER1 |= TIM3_CCER1_CC1P;
  }
  else
  {
    TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
  }
  /* Set the CCE Bit */
  TIM3->CCER1 |= TIM3_CCER1_CC1E;
}


/**
  * @brief Configure the TI2 as Input.
  * @param[in] TIM3_ICPolarity  The Input Polarity.
  * This parameter can be one of the following values:
  *                       - TIM3_ICPOLARITY_FALLING
  *                       - TIM3_ICPOLARITY_RISING
  * @param[in] TIM3_ICSelection specifies the input to be used.
  * This parameter can be one of the following values:
  *                       - TIM3_ICSELECTION_DIRECTTI: TIM3 Input 2 is selected to
  *                         be connected to IC2.
  *                       - TIM3_ICSELECTION_INDIRECTTI: TIM3 Input 2 is selected to
  *                         be connected to IC1.
  * @param[in] TIM3_ICFilter Specifies the Input Capture Filter.
  * This parameter must be a value between 0x00 and 0x0F.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * * Configure the TI2 as Input selected to be connected to IC2 with Rising Polarity and 0x0E as Filter value.
  * @code
  * TI2_Config(TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI,0x0E);
  * @endcode
  */
static void TI2_Config(u8 TIM3_ICPolarity,
                       u8 TIM3_ICSelection,
                       u8 TIM3_ICFilter)
{
  /* Disable the Channel 2: Reset the CCE Bit */
  TIM3->CCER1 &=  (u8)(~TIM3_CCER1_CC2E);

  /* Select the Input and set the filter */
  TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));


  /* Select the Polarity */
  if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
  {
    TIM3->CCER1 |= TIM3_CCER1_CC2P;
  }
  else
  {
    TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
  }

  /* Set the CCE Bit */
  TIM3->CCER1 |= TIM3_CCER1_CC2E;

}
/**
  * @brief Compute the frequency of the LSI clock expressed in Herz.
  * @param[in] TimerClockFreq  the TIM3 clock frequency expressed in Herz.
  * @retval u32 LSIClockFreq
  * @par Required preconditions:
  *  The timer clock must be a high speed clock: HSI or HSE
  * @par Called functions:
  * TIM3_ICInit
  * TIM3_ITConfig
  * TIM3_Cmd
  * TIM3_ClearFlag
  * @note It is recommended to use the maximum clock frequency, that is 10 MHz, to obtain a more precise result.
  * @par Example:
  * * Configure the TI1 as Input selected to be connected to IC1 with Rising Polarity and 0x0 as Filter value.
  * @code
  * u32 Flsi;
  * Flsi= TIM3_ComputeLsiClockFreq(16000000);
  * @endcode
  */
u32 TIM3_ComputeLsiClockFreq(u32 TimerClockFreq)
{
  u32 LSIClockFreq;
  u16 ICValue1, ICValue2;
  /* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
  TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI, TIM3_ICPSC_DIV8, 0);


  /* Enable CC1 interrupt */
  TIM3_ITConfig(TIM3_IT_CC1, ENABLE);

  /* Enable TIM3 */
  TIM3_Cmd(ENABLE);

  TIM3->SR1 = 0x00;
  TIM3->SR2 = 0x00;

  /* Clear CC1 Flag*/
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue1 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue2 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* Disable IC1 input capture */
  TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
  /* Reset CCMR1 register */
  TIM3->CCMR1 = 0x00;
  /* Disable timer2 */
  TIM3_Cmd(DISABLE);

  /* Compute LSI clock frequency */
  LSIClockFreq = (8 * TimerClockFreq) / (ICValue2 - ICValue1);
  return (u32)LSIClockFreq;
}
/**
  * @}
  */
/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
