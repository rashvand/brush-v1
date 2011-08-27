//functions for ADC management for FFT analysis
#include <stm8s_lib.h>
#include <stm8s_gpio.h>
#include <stm8s_adc2.h>
#include "globaldefFFT.h"
#include "ADCdriverFFT.h"


PParam ADCpparam;

/***************************************************************************/
//setting of ADC for FFT data collection (timer trigger)
void InitADCTimerTrigger(PParam pparam, unsigned int divider)
{
    unsigned int SchmittTriggers;

    //remember global param
    ADCpparam = pparam;
    ADCpparam->ConvNumber = 0;
    ADCpparam->EndOfAllConversions = 1;
    //timer init
    CLK -> PCKENR1 |= CLK_PCKENR1_TIM1; //enable clock for timer 1
    TIM1->PSCRH = 0x00;  //prescaller to 0
    TIM1->PSCRL = 0x00;
    TIM1->ARRH  = divider >> 8;  //reload value
    TIM1->ARRL  = divider;
    TIM1->CR2   = 0x20;  //TRGO enable on update event
    TIM1->CR1  |= TIM1_CR1_ARPE; //auto preload enable
    TIM1->EGR  |= TIM1_EGR_UG;   //generate update event

    //disable Schmitt triggers on measured channels
    SchmittTriggers = ((unsigned int)1<<(ADCpparam->InputChannelCount)-1) << ADCpparam->StartInputChannel;
    ADC2->TDRL = SchmittTriggers >> 8;
    ADC2->TDRH = SchmittTriggers;

    //enable ADC
    ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_12, ADC2_PRESSEL_FCPU_D6, ADC2_EXTTRIG_TIM, ENABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL12, DISABLE);
    //clear end of conversion bit
    ADC2_ClearFlag();
    //enable ADC interrupts
    ADC2_ITConfig(ENABLE);
    ADCpparam->EndOfAllConversions = 0;
}
/***************************************************************************/
//starting data collection
void ADCStart(void)
{
  enableInterrupts();
  TIM1->CR1  |= TIM1_CR1_CEN;  //start timer - trigger
}
/***************************************************************************/
//interrupt service routine for ADC - data collection for FFT into buffer
@far @interrupt void ADCInterrupt (void)
{
    unsigned char channel;

    ADC2_ClearFlag(); //clear end of conversion bit
    if (ADCpparam->EndOfAllConversions)
      return;

    //collect ADC value
    ADCpparam->AddrADCDataStart[ADCpparam->ConvNumber] = ADC2_GetConversionValue()<<5;
    ADCpparam->ConvNumber++; //increment counter

    // increment ADC channel
    channel = (ADC2->CSR & ADC2_CHANNEL_15);
    if (channel == (ADCpparam->StartInputChannel + ADCpparam->InputChannelCount -1))
      ADC2->CSR = (ADC2->CSR & ~ADC2_CHANNEL_15) | ADCpparam->StartInputChannel;
    else
      ADC2->CSR = (ADC2->CSR & ~ADC2_CHANNEL_15) | (channel+1);

    //test to stop data sampling
    if (ADCpparam->ConvNumber == ADCpparam->NumOfConversions)
    {
      ADC2_Cmd(DISABLE);             //switch off ADC
      TIM1->CR1  &= ~TIM1_CR1_CEN;  //stop timer - trigger
      ADCpparam->EndOfAllConversions = 1; //signalize end of conversions
    }
  return;
}
/***************************************************************************/