#include "stm8s_spi.h"
#include "mono_lcd.h"
#include "ADCAveraging.h"
#include "ADCWhiteNoise.h"
#include "Filter50Hz.h"
#include "FFT.h"
#include "ADCCalibration.h"
#include "ADCdriverFFT.h"

#define KEY_BUTTON_UP (GPIOD->IDR & GPIO_PIN_7)
#define DELAY_BUTTON 500000l

/***********************************************************************/
static void delay(unsigned long cycles)
{
  while (cycles--);
}
/***********************************************************************/
/***********************************************************************/
//initialization of SPI for SPI LCD display usage
static void Init_SPI(void)
{
  SPI_DeInit();
  SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_64, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, ENABLE, 0);
  SPI_Cmd(ENABLE);
}
/***********************************************************************/
/***********************************************************************/
//end of memory definition for linker
extern unsigned char _endmem @0x12ff;
/***********************************************************************/


/************************** MAIN **********************************/
//main project routine
void main(void)
{
  
  Init_SPI();
  LCD_Init();
  LCD_Backlight(ENABLE);
  
  LCD_Clear();
  LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, " AN2719  demo ");  
  LCD_RollString(LCD_LINE2, "              Please connect 16MHz XTALL  and signal source to BNC AIN12 input!", 80);  
  LCD_PrintString(LCD_LINE2, ENABLE, DISABLE, "press Joystick");  
  while(KEY_BUTTON_UP);
  
  //set internal or external frequency
  SetCPUClock(1); //XTALL - must be present 16MHz  
  
  //main program loop
  do
  {  
    //print DEMO information
    LCD_Clear();
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, "Precision demo");  
    LCD_PrintString(LCD_LINE2, ENABLE, DISABLE, "    AN2719    ");  
    delay(DELAY_BUTTON);

    //----------------------------------------------------------
    //"Averaging" test
    LCD_Clear();
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, "Averaging");
    delay(DELAY_BUTTON);
    do
    {  
      TestADCAveraging();
    }
    while(KEY_BUTTON_UP);
  
    //----------------------------------------------------------
    //"White Noise adding" test
    LCD_Clear();
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, "WhiteNoise");
    delay(DELAY_BUTTON);
    do
    {   
      TestADCWhiteNoise();
    }    
    while(KEY_BUTTON_UP);
  
    //----------------------------------------------------------
    //"Digital filter" test (removing 50Hz disturbance)
    LCD_Clear();
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, "Filter50Hz");
    delay(DELAY_BUTTON);
    do
    {  
      TestADCDigitalFilter50Hz();
    }    
    while(KEY_BUTTON_UP);
  
    //----------------------------------------------------------
    //"Fast Fourrier Transformation" test 
    //measuring 3-phase AC signal RMS values: active powers, voltages, currents = 3-phase electricity meter
    LCD_Clear();
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, "FFT 32 points");
    LCD_PrintString(LCD_LINE2, ENABLE, DISABLE, "see debug data");
    delay(DELAY_BUTTON);  
    do
    {  
      //commented due to 16kB free compiler limit (uncomment for full version of compiler)
      TestADCFFT();
    }  
    while(KEY_BUTTON_UP);
  
    //----------------------------------------------------------
    //"Linear calibration" test (gain and offsett ADC calibration)
    //measure real value (by precise external instrument) and ADC value
    //enter real value by joystick buttons (up/down = increase/decrease digit, left/right = move to another digit, select = enter)
    //finish entering = key button
    LCD_Clear();
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, "Calibration");
    delay(DELAY_BUTTON);  
    do
    {  
      TestADCCalibration();  
    }    
    while(KEY_BUTTON_UP);
    
    //----------------------------------------------------------
    //print that demo finished
    LCD_Clear();
    LCD_PrintString(LCD_LINE1, ENABLE, DISABLE, "End of demo");
    delay(DELAY_BUTTON);  
  }  
  while(1);//repeat tests in endless loop
}/*main*/
/************************** MAIN **********************************/
