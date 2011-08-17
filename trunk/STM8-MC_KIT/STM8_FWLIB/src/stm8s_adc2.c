/**
  ******************************************************************************
  * @file stm8s_adc2.c
  * @brief This file contains all the functions/macros for the ADC2 peripheral.
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
#include "stm8s_adc2.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (ADC2_CODE)
#pragma section const {ADC2_CONST}
#pragma section @near [ADC2_URAM]
#pragma section @near {ADC2_IRAM}
#pragma section @tiny [ADC2_UZRAM]
#pragma section @tiny {ADC2_IZRAM}
#endif

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @addtogroup ADC2_Public_Functions
  * @{
  */

/**
  * @brief Deinitializes the ADC2 peripheral registers to their default reset
  * values.
  * @par Parameters:
  * None
  * @retval None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Initializes ADC2 to its reset values.
  * @code
  * ADC2_DeInit();
  * @endcode
  */
void ADC2_DeInit(void)
{
  ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
}

/**
  * @brief Initializes the ADC2 peripheral according to the specified parameters
  * @param[in] ADC2_ConversionMode: specifies the conversion mode
  * can be one of the values of @ref ADC2_ConvMode_TypeDef.
  * @param[in] ADC2_Channel: specifies the channel to convert
  * can be one of the values of @ref ADC2_Channel_TypeDef.
  * @param[in] ADC2_PrescalerSelection: specifies the ADC2 prescaler
  * can be one of the values of @ref ADC2_PresSel_TypeDef.
  * @param[in] ADC2_ExtTrigger: specifies the external trigger
  * can be one of the values of @ref ADC2_ExtTrig_TypeDef.
  * @param[in] ADC2_ExtTrigState: specifies the external trigger new state
  * can be one of the values of @ref FunctionalState.
  * @param[in] ADC2_Align: specifies the converted data alignement
  * can be one of the values of @ref ADC2_Align_TypeDef.
  * @param[in] ADC2_SchmittTriggerChannel: specifies the schmitt trigger channel
  * can be one of the values of @ref ADC2_SchmittTrigg_TypeDef.
  * @param[in] ADC2_SchmittTriggerState: specifies the schmitt trigger state
  * can be one of the values of @ref FunctionalState.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * - ADC2_ConversionConfig()
  * - ADC2_PrescalerConfig()
  * - ADC2_ExternalTriggerConfig()
  * - ADC2_SchmittTriggerConfig()
  * - ADC2_Cmd()
  * @par Example:
  * Initializes ADC
  * @code
  * ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_2, ADC2_PRESSEL_FCPU_D8, ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_ALL, DISABLE);
  * @endcode
  */
void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTrigState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
{

  /* Check the parameters */
  assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
  assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
  assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
  assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
  assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTrigState))));
  assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
  assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
  assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));

  /*-----------------CR1 & CSR configuration --------------------*/
  /* Configure the conversion mode and the channel to convert
  respectively according to ADC2_ConversionMode & ADC2_Channel values  &  ADC2_Align values */
  ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
  /* Select the prescaler division factor according to ADC2_PrescalerSelection values */
  ADC2_PrescalerConfig(ADC2_PrescalerSelection);

  /*-----------------CR2 configuration --------------------*/
  /* Configure the external trigger state and event respectively
  according to ADC2_ExtTrigStatus, ADC2_ExtTrigger */
  ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTrigState);

  /*------------------TDR configuration ---------------------------*/
  /* Configure the schmitt trigger channel and state respectively
  according to ADC2_SchmittTriggerChannel & ADC2_SchmittTriggerNewState  values */
  ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);

  /* Enable the ADC2 peripheral */
  ADC2->CR1 |= ADC2_CR1_ADON;

}


/**
  * @brief Enables or Disables the ADC2 peripheral.
  * @param[in] NewState: specifies the peripheral enabled or disabled state.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the ADC2 peripheral.
  * @code
  * ADC2_Cmd(ENABLE);
  * @endcode
  */
void ADC2_Cmd(FunctionalState NewState)
{

  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE)
  {
    ADC2->CR1 |= ADC2_CR1_ADON;
  }
  else /* NewState == DISABLE */
  {
    ADC2->CR1 &= (u8)(~ADC2_CR1_ADON);
  }

}

/**
  * @brief Enables or disables the ADC2 interrupt.
  * @param[in] ADC2_ITEnable specifies the name of the interrupt to enable or disable.
  * This parameter can be one of the following values:
  *    - ADC2_IT_AWDITEN : Analog WDG interrupt enable
  *    - ADC2_IT_EOCITEN  : EOC iterrupt enable
  * @param[in] ADC2_ITEnable specifies the state of the interrupt to apply.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the ADC2 End Of Convertion (EOC) Interrupt.
  * @code
  * ADC2_ITConfig(ADC2_IT_EOCITEN, ENABLE);
  * @endcode
  */
void ADC2_ITConfig(FunctionalState ADC2_ITEnable)
{

  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(ADC2_ITEnable));

  if (ADC2_ITEnable != DISABLE)
  {
    /* Enable the ADC2 interrupts */
    ADC2->CSR |= (u8)ADC2_CSR_EOCIE;
  }
  else  /*ADC2_ITEnable == DISABLE */
  {
    /* Disable the ADC2 interrupts */
    ADC2->CSR &= (u8)(~ADC2_CSR_EOCIE);
  }

}

/**
  * @brief Configure the ADC2 prescaler division factor.
  * @param[in] ADC2_Prescaler: the selected precaler.
  * It can be one of the values of @ref ADC2_PresSel_TypeDef.
  * @retval void None
  * @par Required preconditions:
  *  None
  * @par Called functions:
  * None
  * @par Example:
  * Configure the prescaler with the value of fadc2 = fcpu/4
  * @code
  * ADC2_PrescalerConfig(ADC2_PRESSEL_FCPU_D4 );
  * @endcode
  */
void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
{

  /* Check the parameter */
  assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));

  /* Clear the SPSEL bits */
  ADC2->CR1 &= (u8)(~ADC2_CR1_SPSEL);
  /* Select the prescaler division factor according to ADC2_PrescalerSelection values */
  ADC2->CR1 |= (u8)(ADC2_Prescaler);

}


/**
  * @brief Enables or disables the ADC2 Schmitt Trigger on a selected channel.
  * @param[in] ADC2_SchmittTriggerChannel specifies the desired Channel.
  * It can be set of the values of @ref ADC2_SchmittTrigg_TypeDef.
  * @param[in] ADC2_SchmittTriggerState specifies Channel new status.
  * can have one of the values of @ref FunctionalState.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enables the schmitt trigger on the channel 8.
  * @code
  * ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL8,ENABLE);
  * @endcode
  */
void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
{

  /* Check the parameters */
  assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
  assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));

  if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
  {
    if (ADC2_SchmittTriggerState != DISABLE)
    {
      ADC2->TDRL &= (u8)0x0;
      ADC2->TDRH &= (u8)0x0;
    }
    else /* ADC2_SchmittState == DISABLE */
    {
      ADC2->TDRL |= (u8)0xFF;
      ADC2->TDRH |= (u8)0xFF;
    }
  }
  else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
  {
    if (ADC2_SchmittTriggerState != DISABLE)
    {
      ADC2->TDRL &= (u8)(~(u8)((u8)0x01 << (u8)ADC2_SchmittTriggerChannel));
    }
    else /* ADC2_SchmittState == DISABLE */
    {
      ADC2->TDRL |= (u8)((u8)0x01 << (u8)ADC2_SchmittTriggerChannel);
    }
  }
  else /* ADC2_SchmittTriggerChannel >= ADC2_SCHMITTTRIG_CHANNEL8 */
  {
    if (ADC2_SchmittTriggerState != DISABLE)
    {
      ADC2->TDRH &= (u8)(~(u8)((u8)0x01 << ((u8)ADC2_SchmittTriggerChannel - (u8)8)));
    }
    else /* ADC2_SchmittState == DISABLE */
    {
      ADC2->TDRH |= (u8)((u8)0x01 << ((u8)ADC2_SchmittTriggerChannel - (u8)8));
    }
  }

}


/**
  * @brief Configure the ADC2 conversion on selected channel.
  * @param[in] ADC2_ConversionMode Specifies the conversion type.
  * It can be set of the values of @ref ADC2_ConvMode_TypeDef
  * @param[in] ADC2_Channel specifies the ADC2 Channel.
  * It can be set of the values of @ref ADC2_Channel_TypeDef
  * @param[in] ADC2_Align specifies the conerted data alignement.
  * It can be set of the values of @ref ADC2_Align_TypeDef
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Configure the ADC2 conversion in continuous mode on channel 2
  * @code
  * ADC2_ConversionConfig(ADC2_CHANNEL_2, ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_ALIGN_RIGHT);
  * @endcode
  */
void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
{

  /* Check the parameters */
  assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
  assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
  assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));

  /* Clear the align bit */
  ADC2->CR2 &= (u8)(~ADC2_CR2_ALIGN);
  /* Configure the data alignment */
  ADC2->CR2 |= (u8)(ADC2_Align);

  if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
  {
    /* Set the continuous coversion mode */
    ADC2->CR1 |= ADC2_CR1_CONT;
  }
  else /* ADC2_ConversionMode == ADC2_CONVERSIONMODE_SINGLE */
  {
    /* Set the single conversion mode */
    ADC2->CR1 &= (u8)(~ADC2_CR1_CONT);
  }

  /* Clear the ADC2 channels */
  ADC2->CSR &= (u8)(~ADC2_CSR_CH);
  /* Select the ADC2 channel */
  ADC2->CSR |= (u8)(ADC2_Channel);

}


/**
  * @brief Configure the ADC2 conversion on external trigger event.
  * @par Full description:
  * The selected external trigger evant can be enabled or disabled.
  * @param[in] ADC2_ExtTrigger to select the External trigger event.
  * can have one of the values of @ref ADC2_ExtTrig_TypeDef.
  * @param[in] ADC2_ExtTrigState to enable/disable the selected external trigger
  * can have one of the values of @ref FunctionalState.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Enable the TIM1 TRGO to trigger the conversion.
  * @code
  * ADC2_ExternalTriggerConfig(ADC2_EXTTRIG_TIM, ENABLE);
  * @endcode
  */
void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTrigState)
{

  /* Check the parameters */
  assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
  assert_param(IS_FUNCTIONALSTATE_OK(ADC2_ExtTrigState));

  /* Clear the external trigger selection bits */
  ADC2->CR2 &= (u8)(~ADC2_CR2_EXTSEL);

  if (ADC2_ExtTrigState != DISABLE)
  {
    /* Enable the selected external Trigger */
    ADC2->CR2 |= (u8)(ADC2_CR2_EXTTRIG);
  }
  else /* ADC2_ExtTrigStatus == DISABLE */
  {
    /* Disable the selected external trigger */
    ADC2->CR2 &= (u8)(~ADC2_CR2_EXTTRIG);
  }

  /* Set the slected external trigger */
  ADC2->CR2 |= (u8)(ADC2_ExtTrigger);

}


/**
  * @brief Start ADC2 conversion
  * @par Full description:
  * This function  triggers the start of conversion, after ADC2 configuration.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * Enable the ADC2 peripheral before calling this fuction
  * @par Called functions:
  * None
  * @par Example:
  * Start conversion
  * @code
  * ADC2_StartConversion();
  * @endcode
  */
void ADC2_StartConversion(void)
{
  ADC2->CR1 |= ADC2_CR1_ADON;
}

/**
  * @brief Get one sample of measured signal.
  * @par Parameters:
  * None
  * @retval ConversionValue:  value of the measured signal.
  * @par Required preconditions:
  * ADC2 conversion finished.
  * @par Called functions:
  * None
  * @par Example:
  * Get the converted value of a given signal on a given channel.
  * @code
  * u16 ADC2_ConversionValue;
  * ADC2_ConversionValue = ADC2_GetConversionValue();
  * @endcode
  */
u16 ADC2_GetConversionValue(void)
{

  u16 temph = 0;
  u8 templ = 0;

  if (ADC2->CR2 & ADC2_CR2_ALIGN) /* Right alignment */
  {
    /* Read LSB first */
    templ = ADC2->DRL;
    /* Then read MSB */
    temph = ADC2->DRH;

    temph = (u16)(templ | (u16)(temph << (u8)8));
  }
  else /* Left alignment */
  {
    /* Read MSB firts*/
    temph = ADC2->DRH;
    /* Then read LSB */
    templ = ADC2->DRL;

    temph = (u16)((u16)(templ << (u8)6) | (u16)(temph << (u8)8));
  }

  return ((u16)temph);

}

/**
  * @brief Checks the ADC2 EOC flag status.
  * @par Parameters:
  * None
  * @retval FlagStatus Status of the ADC2 EOC flag.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Get the EOC flag status.
  * @code
  * FlagStatus ADC2_FlagStatus;
  * ADC2_FlagStatus = ADC2_GetFlagStatus();
  * @endcode
  */
FlagStatus ADC2_GetFlagStatus(void)
{
  /* Get EOC  flag status */
  return ((u8)(ADC2->CSR & ADC2_CSR_EOC));

}

/**
  * @brief Clear the ADC2 EOC Flag.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Clears the end of conversion Flag
  * @code
  * ADC2_ClearFlag();
  * @endcode
  */
void ADC2_ClearFlag(void)
{
    ADC2->CSR &= (u8)(~ADC2_CSR_EOC);
}

/**
  * @brief Returns the EOC  pending bit status
 * @par Parameters:
  * None
  * @retval FlagStatus: status of the EOC pending bit.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Get the EOC bit status.
  * @code
  * ITStatus ADC2_ITStatus;
  * ADC2_ITStatus = ADC2_GetITStatus();
  * @endcode
  */
ITStatus ADC2_GetITStatus(void)
{
  return ((u8)(ADC2->CSR & ADC2_CSR_EOC));
}

/**
  * @brief Clear the ADC2 End of Conversion pending bit.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Clears the end of conversion pending bit
  * @code
  * ADC2_ClearITPendingBit();
  * @endcode
  */
void ADC2_ClearITPendingBit(void)
{
    ADC2->CSR &= (u8)(~ADC2_CSR_EOC);
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
