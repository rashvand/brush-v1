#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stm8s_adc2.h>
#include "ADCdriverFFT.h"
#include "mono_lcd.h"

#define F_CPU 16000000L //16MHz

#define F_FILTER 50     //50Hz  
#define SAMPLES_PER_PERIOD 10 //F_FILTER periods to collect
#define PERIODS 100 //buffer for AD data storage
#define ADC_BUFFER_SIZE (SAMPLES_PER_PERIOD * PERIODS)

/***********************************************************************/
//collecting data from ADC into buffer
void ADCCollectDataFilt(unsigned int * ADCBuffer)
{
    unsigned int i;
    unsigned int divider;
    
    //timer init
    divider = F_CPU / SAMPLES_PER_PERIOD / F_FILTER;
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
    ADC2_Cmd(DISABLE);            //switch off ADC
    TIM1->CR1  &= ~TIM1_CR1_CEN;  //stop timer - trigger
}//ADCCollectData
/***********************************************************************/
/***********************************************************************/
//performs digital filter on collected ADC data
//comb filter on 50Hz
static void Filter50Hz(unsigned int * ADCBuffer)
{
  //DIGITAL FILTER IMPLEMENTATION (comb filter for given frequency): 
  //       [1-z(-N)]
  // H(z)= ---------                    N... samples per period
  //       [1-z(-1)]
  unsigned int i,j;
  unsigned long * ACC;
  unsigned long IntegratorOut;
  

  //allocate accumulator space
  if ((ACC = malloc(SAMPLES_PER_PERIOD * sizeof(ACC[0]))) == NULL)
    _asm("trap\n");
  
  //init ACC to first sample
  for (i=0; i< SAMPLES_PER_PERIOD; i++)
    ACC[i]=ADCBuffer[0];
  IntegratorOut=ADCBuffer[0];
  
  //filtering
  for (i=0; i<ADC_BUFFER_SIZE; i++)
  {
    for(j=SAMPLES_PER_PERIOD-1; j>0 ; j--)
      ACC[j]=ACC[j-1];
    ACC[0]=IntegratorOut;
    IntegratorOut += ADCBuffer[i];    
    
    //write back the filtered signal
    ADCBuffer[i]= (IntegratorOut - ACC[SAMPLES_PER_PERIOD-1])/SAMPLES_PER_PERIOD;
  }
  free(ACC) ;
}//Filter50Hz
/***********************************************************************/
/***********************************************************************/
//returns min and max value difference from buffer
//for 50Hz suppression testing
unsigned int GetMinMaxFilt(unsigned int * Buffer, unsigned int buffersize)
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
//main routine for digital filter testing
void TestADCDigitalFilter50Hz(void)
{
  unsigned int * ADCBuffer;
  unsigned int i;
  volatile unsigned int diffOrig;
  volatile unsigned int diffFilt;
  unsigned char DEBUG_STRING[30];
  
  //set external clock (16MHz XTALL required)
  SetCPUClock(0); 
  
  //allocate buffer space
  if ((ADCBuffer = malloc(ADC_BUFFER_SIZE * sizeof(ADCBuffer[0]))) == NULL)
    _asm("trap\n");
  
  //collect data
  ADCCollectDataFilt(ADCBuffer);
  diffOrig = GetMinMaxFilt(&ADCBuffer[SAMPLES_PER_PERIOD], ADC_BUFFER_SIZE - SAMPLES_PER_PERIOD);
 
  //filter data
  Filter50Hz(ADCBuffer);
  diffFilt = GetMinMaxFilt(&ADCBuffer[SAMPLES_PER_PERIOD], ADC_BUFFER_SIZE - SAMPLES_PER_PERIOD);    
  
  sprintf(DEBUG_STRING, "Orig50Hz= %d", diffOrig);
  LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, DEBUG_STRING);
  sprintf(DEBUG_STRING, "Filt50Hz= %d", diffFilt);
  LCD_PrintString(LCD_LINE2, ENABLE, DISABLE, DEBUG_STRING);
    
  //unallocate buffer
  free(ADCBuffer);
}//TestADCDigitalFilter50Hz
/***********************************************************************/

