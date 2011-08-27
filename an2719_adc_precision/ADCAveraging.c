#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stm8s_adc2.h>
#include "ADCdriverFFT.h"
#include "mono_lcd.h"

#define F_CPU 16000000L //16MHz

#define F_SAMPLING 1000     //1kHz sampling
#define AVERAGE_LENGTH 10   //how many samples to average in one set
#define ADC_BUFFER_SIZE (AVERAGE_LENGTH * 20) //20 averaged set of samples


/***********************************************************************/
//collecting data from ADC into buffer
static void ADCCollectDataAvrg(unsigned int * ADCBuffer)
{
    unsigned int i;
    unsigned int divider;
    
    //timer trigger init
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
  
      //clear end of conversion bit
      ADC2_ClearFlag(); 
  
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
//perform averaging on whole collected ADC data (floating average)
void Average(unsigned int * ADCBuffer)
{
  unsigned int i,j;
  unsigned long AverageSum;

  //averaging
  for (i=0; i<(ADC_BUFFER_SIZE-AVERAGE_LENGTH); i++)
  {
    AverageSum = 0;
    //sum set of samples (can be optimized)
    for(j=0; j<AVERAGE_LENGTH; j++)
      AverageSum += ADCBuffer[j+i];
    
    //write back the averaged sample
    ADCBuffer[i]= AverageSum/AVERAGE_LENGTH;
  }
}//Average
/***********************************************************************/
/***********************************************************************/
//get min and max value difference in ADC data buffer (to compare signal stability)
static unsigned int GetMinMaxAvrg(unsigned int * Buffer, unsigned int buffersize)
{
  unsigned int i,min,max;
  
  min=0xFFFF;
  max=0;
  for (i=0; i<buffersize; i++)
  {
    if (Buffer[i]<min)
      min = Buffer[i];
    if (Buffer[i]>max)
      max = Buffer[i];
  }
  return(max-min);
}
/***********************************************************************/
/***********************************************************************/
//main routine for Averaging method testing
void TestADCAveraging(void)
{
  unsigned int * ADCBuffer;
  unsigned int i;
  volatile unsigned int diffOrig;
  volatile unsigned int diffAvrg;
  unsigned char DEBUG_STRING[30];
  
  //set external clock (16MHz XTALL required)
  SetCPUClock(0); 
  
  //allocate buffer space
  if ((ADCBuffer = malloc(ADC_BUFFER_SIZE * sizeof(ADCBuffer[0]))) == NULL)
    _asm("trap\n");
  
  //collect data
  ADCCollectDataAvrg(ADCBuffer);
  diffOrig = GetMinMaxAvrg(ADCBuffer, ADC_BUFFER_SIZE-AVERAGE_LENGTH);
 
  //filter data
  Average(ADCBuffer);
  diffAvrg = GetMinMaxAvrg(ADCBuffer, ADC_BUFFER_SIZE-AVERAGE_LENGTH);
  
  sprintf(DEBUG_STRING, "Original= %d", diffOrig);
  LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, DEBUG_STRING);
  sprintf(DEBUG_STRING, "Average = %d", diffAvrg);
  LCD_PrintString(LCD_LINE2, ENABLE, DISABLE, DEBUG_STRING);

  //unallocate buffer
  free(ADCBuffer);
}//TestADCAveraging
/***********************************************************************/
