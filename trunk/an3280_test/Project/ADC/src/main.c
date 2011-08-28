/**
  ******************************************************************************
  * @file main.c
  * @brief Displaying variable voltage on a bar of LEDs Application example.
  * @author STMicroelectronics - MCD Application Team
  * @version 2.0.0
  * @date 15-MAR-2011
  ******************************************************************************
  *
  * THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"                // file needed only for registers mask 
#include "parameter.h"

#include "stm8s_gpio.h"
#include "stm8s_tim1.h"
#include "stm8s_adc1.h"
#include "stm8s_clk.h"

/**
  * @addtogroup ADC1_Example1
  * @{
  */

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

#define ALL_LEDs ((u8)0x01)				// LEDs mask 

/* Private macro -------------------------------------------------------------*/

#define switch_all_LEDs_off		{ GPIOD->ODR |=  ALL_LEDs; }	//LEDs control : all off
#define switch_all_LEDs_on	  	{ GPIOD->ODR &= ~ALL_LEDs; }    //LEDs control : all on

/* Private variables ---------------------------------------------------------*/
	u8  temp_AD_H;					   // temporary registers for reading ADC result (MSB)
	u8  temp_AD_L;             // temporary registers for reading ADC result (LSB)
	u8	ADInit;						     // flag for ADC initialized
	u8	ADSampRdy;				     // flag for filed of samples ready
	u8  AD_samp;						   // counter of stored samples
	u16 AD_sample[NUMB_SAMP];	 // store samples field 
	u16 AD_avg_value;				   // average of ADC result
	
	u8 peak_memo;					     // variables for peak level detector
	u8 peak_filt;					     // variables for peak level detector*/

/* Private function prototypes -----------------------------------------------*/
/**
  * @brief Count average of samples stored in the u16 field
  * @par Parameters:
  *  *p: pointer to the begin of the field
  * smp: number of samples in the field
  * @retval Average u16 value
  */
u16 u16_average(u16 *p, u8 smp) { 
	u8 i;
	u16 sum;
	
	for(i=0, sum= 0; i < smp; ++i)
		sum+= *p++;		
	return sum / smp;
}
/* -------------------------------------------------------------------------- */
/**
  * @brief Prepare data for four LED bar of signal and peak indicator
  * @par Parameters:
  * val: Level of the mesured signal [0-4]
  * @retval 4 bits (low nibble) of the composite bar graph information
  */
u8 signal_and_peak_level(u8 val) {
	u8 signal;
	u8 peak;
	
	switch(val) {
		case 0: peak= 0; signal=  0; break;	//set peak and signal levels
		case 1: peak= 1; signal=  1; break;
		case 2: peak= 2; signal=  3; break;
		case 3: peak= 4; signal=  7; break;
		case 4: peak= 8; signal= 15; break;
		default: peak= signal= 15;
	};
	if(peak_filt == 0) {									// slow fall of peak level indicator 
		if(peak_memo) {
			peak_memo>>= 1;
			peak_filt= PEAK_FILTER;
		};
	}
	else
		--peak_filt;
	if(peak >= peak_memo) {				       // check the highest level value
		peak_memo= peak;					         // and copy it to peak indicator
		peak_filt= PEAK_FILTER;			       // with fall speed refresh
	};
	return (signal | peak_memo);		     // return bar graph information
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief Validation firmware main entry point.
  * @par Parameters:
  * None
  * @retval void None
  */  
void main(void) {
		
		
	#if 0
			u8 leds;
			u16 temp;
					
			// gpio
			
			GPIO_DeInit(GPIOA);
			GPIO_DeInit(GPIOB);
			GPIO_DeInit(GPIOC);
			GPIO_DeInit(GPIOD);
			GPIO_DeInit(GPIOE);
					
			//analgici
			
			GPIO_Init(GPIOB, GPIO_PIN_3, 	GPIO_MODE_IN_FL_NO_IT); 		//ain3
			GPIO_Init(GPIOB, GPIO_PIN_4, 	GPIO_MODE_IN_FL_NO_IT); 		//ain4
			GPIO_Init(GPIOB, GPIO_PIN_5, 	GPIO_MODE_IN_FL_NO_IT); 		//ain5
			GPIO_Init(GPIOB, GPIO_PIN_6, 	GPIO_MODE_IN_FL_NO_IT); 		//ain6
			GPIO_Init(GPIOB, GPIO_PIN_7, 	GPIO_MODE_IN_FL_NO_IT); 		//ain7
			GPIO_Init(GPIOE, GPIO_PIN_7, 	GPIO_MODE_IN_FL_NO_IT);     //ain8
			GPIO_Init(GPIOE, GPIO_PIN_6, 	GPIO_MODE_IN_FL_NO_IT);     //ain9
			
			//debug
			
			GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 1
			GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 2
			GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 3
			GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 4
			
			GPIO_WriteLow(GPIOD, 	GPIO_PIN_7);
			GPIO_WriteHigh(GPIOD, GPIO_PIN_2);
			GPIO_WriteLow(GPIOD, 	GPIO_PIN_0);
			GPIO_WriteHigh(GPIOE, GPIO_PIN_0);

			//pwm low side
			
			GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
			
			GPIO_WriteLow(GPIOB, GPIO_PIN_0);
			GPIO_WriteLow(GPIOB, GPIO_PIN_1);
			GPIO_WriteLow(GPIOB, GPIO_PIN_2);

			//pwm high side
			
			GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
			//GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
			
			GPIO_WriteLow(GPIOC, GPIO_PIN_1);
			GPIO_WriteLow(GPIOC, GPIO_PIN_2);
			//GPIO_WriteLow(GPIOC, GPIO_PIN_3);
			
			//bemf floater
			
			GPIO_Init(GPIOA, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOA, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOA, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST); 
			
			GPIO_WriteHigh(GPIOA, GPIO_PIN_4);
			GPIO_WriteHigh(GPIOA, GPIO_PIN_5);
			GPIO_WriteHigh(GPIOA, GPIO_PIN_6);







			ADC1->CSR = ADC1_CSR_EOCIE | (3 & ADC1_CSR_CH);  	// ADC EOC interrupt enable, channel xxx
			ADC1->CR1 = 4<<4 & ADC1_CR1_SPSEL;			        // master clock/8, single conversion
			ADC1->CR2 = 0; //ADC1_CR2_EXTTRIG; 						// external trigger on timer 1 TRGO, left alignment
			ADC1->CR3 = 0;
			ADC1->TDRH = 0x03;									    // disable Schmitt trigger on AD input xxx
			ADC1->TDRL = 0xFF;                                  	//
		
			// init ADC variables
			AD_samp= 0;						                          // number of stored samples 0
			
			ADInit= TRUE;                                   // ADC initialized 
			ADSampRdy= FALSE;                               // No sample 
			
			ADC1->CR1 |= ADC1_CR1_ADON;					            // ADC on
			temp = 0x8000;
			while (temp--);
		
			enableInterrupts();							                // enable all interrupts 
			
			ADC1->CR1 |= ADC1_CR1_ADON;					            // ADC on
			
			
			
	#else
	
	
	
			//CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
			CLK_HSECmd(ENABLE);
			
			//tim1
			
			TIM1_DeInit();
			TIM1_TimeBaseInit(10000, TIM1_COUNTERMODE_UP, 1, 0); // Configure a 10ms tick 
			TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE); // Generate an interrupt on timer count overflow 
			TIM1_Cmd(ENABLE); // Enable TIM1 
			
			// gpio
			
			GPIO_DeInit(GPIOA);
			GPIO_DeInit(GPIOB);
			GPIO_DeInit(GPIOC);
			GPIO_DeInit(GPIOD);
			GPIO_DeInit(GPIOE);
					
			//analgici
			
			GPIO_Init(GPIOB, GPIO_PIN_3, 	GPIO_MODE_IN_FL_NO_IT); 		//ain3
			GPIO_Init(GPIOB, GPIO_PIN_4, 	GPIO_MODE_IN_FL_NO_IT); 		//ain4
			GPIO_Init(GPIOB, GPIO_PIN_5, 	GPIO_MODE_IN_FL_NO_IT); 		//ain5
			GPIO_Init(GPIOB, GPIO_PIN_6, 	GPIO_MODE_IN_FL_NO_IT); 		//ain6
			GPIO_Init(GPIOB, GPIO_PIN_7, 	GPIO_MODE_IN_FL_NO_IT); 		//ain7
			GPIO_Init(GPIOE, GPIO_PIN_7, 	GPIO_MODE_IN_FL_NO_IT);     //ain8
			GPIO_Init(GPIOE, GPIO_PIN_6, 	GPIO_MODE_IN_FL_NO_IT);     //ain9
			
			//debug
			
			GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 1
			GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 2
			GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 3
			GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 4
			
			GPIO_WriteLow(GPIOD, 	GPIO_PIN_7);
			GPIO_WriteHigh(GPIOD, GPIO_PIN_2);
			GPIO_WriteLow(GPIOD, 	GPIO_PIN_0);
			GPIO_WriteHigh(GPIOE, GPIO_PIN_0);
			
			//pwm low side
			
			GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
			
			GPIO_WriteLow(GPIOB, GPIO_PIN_0);
			GPIO_WriteLow(GPIOB, GPIO_PIN_1);
			GPIO_WriteLow(GPIOB, GPIO_PIN_2);
			
			//pwm high side
			
			GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
			//GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);  // ATTENZIONE, AN3 IN CORTO CON PC3 !!!
			
			GPIO_WriteLow(GPIOC, GPIO_PIN_1);
			GPIO_WriteLow(GPIOC, GPIO_PIN_2);
			//GPIO_WriteLow(GPIOC, GPIO_PIN_3); // ATTENZIONE, AN3 IN CORTO CON PC3 !!!
			
			//bemf floater
			
			GPIO_Init(GPIOA, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOA, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); 
			GPIO_Init(GPIOA, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST); 
			
			GPIO_WriteHigh(GPIOA, GPIO_PIN_4);
			GPIO_WriteHigh(GPIOA, GPIO_PIN_5);
			GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
			
			// ***********
			// *** ADC ***
			// ***********
			
			ADC1_DeInit(); 
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
								ADC1_CHANNEL_3, 
								ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM, 
								DISABLE, 
								ADC1_ALIGN_RIGHT, 
								ADC1_SCHMITTTRIG_CHANNEL3, 
								DISABLE); 
			ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE); // Enable EOC interrupt	
			ADC1_Cmd(ENABLE); // ADON for the first time it just wakes the ADC up
			ADC1_StartConversion();
			
			ADInit= TRUE;                                   // ADC initialized 
			ADSampRdy= FALSE;                               // No sample 
	
			enableInterrupts();							                	
						
	#endif
			
			
	// *** MAIN LOOP ***	
	while (1) {
		if (ADSampRdy) {				                    // field of ADC samples is ready?
			AD_avg_value = u16_average(&AD_sample[0], AD_samp); 	// average of samples
			
			if (AD_avg_value > 100)
			{
				//switch_all_LEDs_off
			}
			else
			{
				//switch_all_LEDs_on
			}
			
			AD_samp = 0;								                         // reinitalize ADC variables
			ADSampRdy = FALSE;
			//ADC1->CR1 |=  ADC1_CR1_ADON;	// Wake-up/trigg the ADC 
			ADC1_StartConversion();
			
			/*
			leds = signal_and_peak_level((u8)((AD_avg_value + 128) / 256)); // setting LED status
			GPIOB->ODR&= leds | (~ALL_LEDs);	// LEDs settings in according to LED status
			GPIOB->ODR|= leds;
			*/
		};
	};
}
/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
