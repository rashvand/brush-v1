#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stm8s_adc2.h>
#include "mono_lcd.h"
#include "ADCdriverFFT.h"
#include "mono_lcd.h"

#define F_CPU 16000000L //16MHz

#define ADC_BUFFER_SIZE 20  //20 calibration samples
//Joystick buttons to control calibration (on PCB demoboard)
#define JOY_SEL   (!(GPIOD->IDR & GPIO_PIN_7)) //joystick select button 
#define JOY_LEFT  (!(GPIOB->IDR & GPIO_PIN_4)) //joystick left move button 
#define JOY_RIGHT (!(GPIOB->IDR & GPIO_PIN_5)) //joystick right move button 
#define JOY_UP    (!(GPIOB->IDR & GPIO_PIN_6)) //joystick increase value button 
#define JOY_DOWN  (!(GPIOB->IDR & GPIO_PIN_7)) //joystick decrease value button 
//button to finish calibration (KEY button on PCB demoboard)
#define BUTTON_LOW (!(GPIOC->IDR & GPIO_PIN_0))

/***********************************************************************/
//delay routine for various timing
static void delay(unsigned long cycles)
{
  while (cycles--);
}
/***********************************************************************/
//collection of ADC data and also real precise values from external voltmeter
//external data is entered with joystick movement as 0.000 number
static unsigned int ADCCollectDataCalib(unsigned int * ADCBuffer, double * ADCRealValues)
{
  unsigned int i;
  unsigned int multiplier;
  signed int Voltage;
  unsigned char cursorPos;
  unsigned char ArrowChar = '^';
  unsigned char JoyUp,JoyDown,JoyLeft,JoyRight,JoySel;

  //disable ADC interrupts
  ADC2_ITConfig(DISABLE);
  //enable ADC
  ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_12, ADC2_PRESSEL_FCPU_D6, ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL12, DISABLE);
  //clear end of conversion bit
  ADC2_ClearFlag();

  //for joystick control (init)
  //pull-ups on on all used buttons
  GPIOB->CR1 |= 0xF0;
  GPIOD->CR1 |= 0x80;
  Voltage = 0;
  multiplier = 1000;
  cursorPos = 2;
  //print values on LCD display
  LCD_Clear();
  LCD_SetCursorPos(LCD_LINE1, 1);
  LCD_PrintDec4(Voltage);
  LCD_PrintString(LCD_LINE1, DISABLE, ENABLE, "  =Real U");
  LCD_SetCursorPos(LCD_LINE2, cursorPos/2);
  LCD_PrintChar(ArrowChar); 
  
  //set external voltage - measure it with external voltmeter - enter voltmeter
  //value into LCD - measure ADC data - store real and ADC data to buffers
  //finish data collecting by KEY button on PCB board
  for(i=0; i<ADC_BUFFER_SIZE; i++)
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_PrintDec2(i);
    while(JOY_SEL);
    while(!JOY_SEL)
    {
      if(BUTTON_LOW)
        break;
      JoyUp   = JOY_UP;
      JoyDown = JOY_DOWN;
      JoyLeft = JOY_LEFT;
      JoyRight= JOY_RIGHT;
      JoySel  = JOY_SEL;
      if(JoyLeft)//increase multiplier
      {
        if (cursorPos!=2) 
        {
          multiplier *= 10;
          cursorPos  -= 1;
        }        
      }
      if(JoyRight)//decrease multiplier
      {
        if (cursorPos!=5) 
        {
          multiplier /= 10;
          cursorPos  += 1;
        }
      }
      if(JoyRight || JoyLeft)//repaint cursor position
      {
        LCD_PrintString(LCD_LINE2, DISABLE, DISABLE, "      ");//clear cursor
        LCD_SetCursorPos(LCD_LINE2, cursorPos/2);//set cursor position
        if(cursorPos & 1)
          LCD_PrintChar(' ');//print space
        LCD_PrintChar(ArrowChar);//print cursor
        while (JOY_RIGHT || JOY_LEFT);
        delay(1000l);
      }
      if(JoyUp)//increase real value
      {
        Voltage += multiplier;
      }
      if(JoyDown)//decrease real value
      {
        Voltage -= multiplier;
      }
      if(JoyUp || JoyDown)//repaint real value
      {
        LCD_PrintString(LCD_LINE1, DISABLE, DISABLE, "      ");//clear voltage
        if (Voltage<0)
        {
          LCD_SetCursorPos(LCD_LINE1, 1);
          LCD_PrintDec4(-Voltage);
          LCD_SetCursorPos(LCD_LINE1, 0);
          LCD_PrintChar('-');//print sign
        }
        else
        {
          LCD_SetCursorPos(LCD_LINE1, 1);
          LCD_PrintDec4(Voltage);
          LCD_SetCursorPos(LCD_LINE1, 0);
          LCD_PrintChar('+');//print sign
        }
        while (JOY_UP || JOY_DOWN);
        delay(1000l);
      }
      
      //start single conversion
      ADC2_StartConversion();
      while (!ADC2_GetFlagStatus());
      //clear end of conversion bit
      ADC2_ClearFlag();
      //collect ADC value and display it
      LCD_SetCursorPos(LCD_LINE2, 5);//set cursor position
      LCD_PrintDec4(ADC2_GetConversionValue());
    }
    
    //stop collecting if KEY buttom pressed
    if(BUTTON_LOW)
    {
      break;
    }
    //otherwise collect ADC data (+ real data) and store them
    else
    {
      //start single conversion
      ADC2_StartConversion();
      while (!ADC2_GetFlagStatus());
      //clear end of conversion bit
      ADC2_ClearFlag();
      //collect ADC value
      ADCBuffer[i] = ADC2_GetConversionValue();
      //collect real value
      ADCRealValues[i] = (double)Voltage/1000;
    }
  }
  return i;
}//ADCCollectDataCalib
/***********************************************************************/
//returns multiplir factor to simply transfer data to voltage - gain factor (P)
//voltage = P*ADCdata
static double GetMultiplierCalib(unsigned int * ADCBuffer, double * ADCRealValues, unsigned int NumOfData)
{
  unsigned int i;
  unsigned char maxindex;
  unsigned int max;

  //find max value
  max=0;
  maxindex = 0;
  for(i=0; i<NumOfData; i++)
  {
    if (max < ADCBuffer[i])
    {
      max = ADCBuffer[i];
      maxindex = i;
    }
  }
  //calculate conversion factor from ADC data word to voltage
  return (ADCRealValues[maxindex] / ADCBuffer[maxindex]);
}//GetMultiplierCalib
/***********************************************************************/
//performs least quare method to obtain the best linear approximation: y = P.x + Q
static void ADCCalibratePQ(unsigned int * ADCBuffer, double * ADCRealValues, unsigned int NumOfData, double * P, double * Q)
{
  unsigned long SumX, SumX2;
  double SumY, SumXY;

  unsigned int i;

  // Theory:
  // 
  // y = P.x + Q
  //
  //
  //     n.S(x.y) - S(x).S(y)
  // P = --------------------
  //          2           2
  //     n.S(x )  - [S(x)]
  //
  //
  //
  //        S(y) - P.S(x)
  // Q = --------------------
  //             n
  //
  //
  //   where S ...... sum [i= 1..n]

  //init sums
  SumX  = 0;
  SumX2 = 0;
  SumY  = 0;
  SumXY = 0;

  //calculate sums
  for(i=0; i<NumOfData; i++)
  {
    SumX  += ADCBuffer[i];
    SumX2 += (unsigned long)ADCBuffer[i] * (unsigned long)ADCBuffer[i];
    SumY  += ADCRealValues[i];
    SumXY += ADCBuffer[i] * ADCRealValues[i];
  }
  // calculate P
  *P = ((NumOfData * SumXY) - (SumX * SumY)) / ((NumOfData * (unsigned long)SumX2) - ((double)SumX * SumX));
  //calculate Q
  *Q = (SumY - (*P * SumX))/NumOfData;
}//ADCCalibratePQ
/***********************************************************************/
//returns standard deviation
static double GetErrorCalib(unsigned int * ADCBuffer, double * ADCRealValues, unsigned int NumOfData, double P, double Q)
{
  double error, diff;
  unsigned int i;

  // Theory:
  //            ________________
  //           /   2       2
  //         \/(A-B) + (A-B) ...
  // error = ---------------------
  //                 n

  error=0;
  for(i=0; i<NumOfData; i++)
  {
    diff = (P * ADCBuffer[i] + Q) - ADCRealValues[i];
    error += diff * diff;
  }
  error = sqrt(error)/NumOfData;
  return error;
}//GetErrorCalib
/***********************************************************************/
//main routine for ADC (linear) calibration testing
void TestADCCalibration(void)
{
  unsigned int * ADCBuffer;
  double * ADCRealValues;
  double P, Q;
  unsigned int i;
  unsigned int NumOfData;
  volatile double diffOrig;
  volatile double diffCalib;
  unsigned char DEBUG_STRING[30];

  //set external clock (16MHz XTALL required)
  SetCPUClock(0);

  //allocate buffer space
  if ((ADCBuffer = malloc(ADC_BUFFER_SIZE * sizeof(ADCBuffer[0]))) == NULL)
    _asm("trap\n");
  if ((ADCRealValues = malloc(ADC_BUFFER_SIZE * sizeof(ADCRealValues[0]))) == NULL)
    _asm("trap\n");

  //main test
  {
    //collect data
    NumOfData = ADCCollectDataCalib(ADCBuffer, ADCRealValues);
    P= GetMultiplierCalib(ADCBuffer, ADCRealValues, NumOfData);
    diffOrig = GetErrorCalib(ADCBuffer, ADCRealValues, NumOfData, P, 0);

    //calib data
    ADCCalibratePQ(ADCBuffer, ADCRealValues, NumOfData, &P, &Q);
    diffCalib = GetErrorCalib(ADCBuffer, ADCRealValues, NumOfData, P, Q);

    //print errors
    sprintf(DEBUG_STRING, "Orig = %f", diffOrig);
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, DEBUG_STRING);
    sprintf(DEBUG_STRING, "Calib= %f", diffCalib);
    LCD_PrintString(LCD_LINE2, ENABLE, DISABLE, DEBUG_STRING);
    delay(500000l);//to show results
  }
  
  //see real values after ADC calibration - for checking calibration
  LCD_Clear();
  LCD_PrintString(LCD_LINE1, DISABLE, ENABLE, "Real calibrated U");  
  while(!JOY_SEL)
  {
    //start single conversion
    ADC2_StartConversion();
    while (!ADC2_GetFlagStatus());
    //clear end of conversion bit
    ADC2_ClearFlag();
    //collect ADC value and display
    LCD_SetCursorPos(LCD_LINE2, 4);//set cursor position
    LCD_PrintDec4((P*ADC2_GetConversionValue() + Q)*1000);
  }
  
  //unallocate buffer
  free(ADCBuffer);
}//TestADCCalibration