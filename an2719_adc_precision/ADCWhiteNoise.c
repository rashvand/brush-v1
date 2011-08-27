#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stm8s_adc2.h>
#include "ADCdriverFFT.h"
#include "mono_lcd.h"

#define F_CPU 16000000L //16MHz

#define F_SAMPLING 1000   //1kHz sampling
#define F_MODULATION 100  //white noise simulation (100Hz signal)
#define MOD_PERIODS 20    //number of modulation periods
#define ADC_BUFFER_SIZE (F_SAMPLING/F_MODULATION * 20) //buffer for modulation periods


/***********************************************************************/
//collecting data from ADC into buffer
static void ADCCollectDataWhiteNoise(unsigned int * ADCBuffer)
{
    unsigned int i;
    unsigned int divider;
    
    //timer init
    divider = F_CPU / F_SAMPLING;
    CLK -> PCKENR1 |= CLK_PCKENR1_TIM1; //enable clock for timer 1
    TIM1->PSCRH = 0x00;  //prescaller to 0
    TIM1->PSCRL = 0x00;
    TIM1->ARRH  = divider >> 8;  //reload value
    TIM1->ARRL  = divider;
    TIM1->CR2   = 0x20;  //TRGO enable on update event
    TIM1->CR1  |= TIM1_CR1_ARPE; //auto preload enable
    TIM1->EGR  |= TIM1_EGR_UG;   //generate update event

    //disable ADC interrupts
    ADC2_ITConfig(DISABLE);
    //enable ADC    
    ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_12, ADC2_PRESSEL_FCPU_D6, ADC2_EXTTRIG_TIM, ENABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL12, DISABLE);
    //clear end of conversion bit
    ADC2_ClearFlag();
    //start timer - trigger
    TIM1->CR1  |= TIM1_CR1_CEN;  
    
    //sample data
    i=0;
    while (i<ADC_BUFFER_SIZE)
    {
      //wait for EOC
      while (!ADC2_GetFlagStatus());
  
      ADC2_ClearFlag(); //clear end of conversion bit
  
      //collect ADC value
      ADCBuffer [i] = ADC2_GetConversionValue();
      i++;
    }

    //stop data sampling
    ADC2_Cmd(DISABLE);             //switch off ADC
    TIM1->CR1  &= ~TIM1_CR1_CEN;  //stop timer - trigger
}//ADCCollectData
/***********************************************************************/
/***********************************************************************/
//perform averaging on whole collected ADC data 
//white noise into signal must be added externally
static double AverageWhiteNoise(unsigned int * ADCBuffer)
{
  //Averaging implementation to show white noise spreading (white noise must be connected) 
  unsigned int i;
  double AverageSum;

  //averaging
  AverageSum = 0;
  for (i=0; i<(ADC_BUFFER_SIZE); i++)
  {
    //sum set of all samples
    AverageSum += ADCBuffer[i];
  }
  return (AverageSum/ADC_BUFFER_SIZE);
}//AverageWhiteNoise
/***********************************************************************/
/***********************************************************************/
//main routine for white noise adding method testing
void TestADCWhiteNoise(void)
{
  unsigned int * ADCBuffer;
  unsigned int i;
  double WhiteNoiseResult;
  unsigned char DEBUG_STRING[30];
  
  //set external clock (16MHz XTALL required)
  SetCPUClock(0); 
  
  //allocate buffer space
  if ((ADCBuffer = malloc(ADC_BUFFER_SIZE * sizeof(ADCBuffer[0]))) == NULL)
    _asm("trap\n");
  
  //collect data
  ADCCollectDataWhiteNoise(ADCBuffer);
  //filter data from white noise
  WhiteNoiseResult = AverageWhiteNoise(ADCBuffer);
  
  sprintf(DEBUG_STRING, "WhiteNoiseSpreading");
  LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, DEBUG_STRING);
  sprintf(DEBUG_STRING, "V= %5.4f", WhiteNoiseResult);
  LCD_PrintString(LCD_LINE2, ENABLE, DISABLE, DEBUG_STRING);

  //unallocate buffer
  free(ADCBuffer);
}//TestADCWhiteNoise
/***********************************************************************/
