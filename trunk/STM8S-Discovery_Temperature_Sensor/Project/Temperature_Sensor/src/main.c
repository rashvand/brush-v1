/**
/**
  ******************************************************************************
  * @file Temperature_Sensor\src\main.c
  * @brief This file contains the main function for Temperature sensor optimized 
	* example on STM8S-Discovery.
  * @author STMicroelectronics, MCD Application Team
  * @version 1.0
  * @date 3-MAR-2010
  ******************************************************************************
  *
  * THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* General typedef -----------------------------------------------------------*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "hyperterminal.h"
#include "shared_elements.h"

/**
  * @addtogroup Temperature_Sensor_Example
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
	
/* Private define ------------------------------------------------------------*/

/* Temperature sensor modes */
#define IDLE_MODE 0
#define CONFIG_MODE 1
#define READ_MODE 2
#define NORMAL_MODE 3

/* Discovery evalboard I/Os configuration */
#define mskLD1 			((u8)0x01)	
#define mskBUTTON1  ((u8)0x08)
#define mskBUTTON2  ((u8)0x10)
#define mskEXTIsens ((u8)0x02)

/* data EEPROM defines */
#define BASE_ADDR ((u32)0x4000)			 // first data EEPROM byte address 
#define SIZE_OF_BUFFER 4
#define MAX_NO_OF_TEMP_VALS 20 			 /*Max no of temperature values that will be stored in EEPROM*/

/* ADC defines */
#define CHANNEL 2  						       // ADC channel selected
#define CONVERSION_FACTOR 49				 /*ADC data value is multiplied by 5000 to convert it into mV.
																		 It is then divided by 0x3ff(maximum value that can be stored
																		 in 10 bit ADC). To ease the computation, we will use 49 and 
																		 stay precise; 49 is used instead of 4.9 to manipulate integers*/

/* TIM3 define */
#define TIMER_REL_VAL ((u16)0xC350)  /*Auto-reload value to generate a time delay of 50ms, after which
																			overflow interrupt is asserted
																			Calculations:
																				fcpu=16MHz, Presc=16
																				Time Period of counter is 16/(16*10^6) = 1 µs
																				Time duration required = 50ms
																				Therefore auto-reload counter value = 50ms/1µs = C350*/

/* CLK defines */
//#define mskFhsiDiv1	((u8)0x07)
#define HSEfreq ((u32)0xF42400) 		//fHSE = 16 MHz
#define mskHSEstart		((u8)0xB4)
#define mskFhseDiv1	((u8)0xF8)

/* UART2 init defines */
#define BAUD_RATE ((u32)9600)
#define WORDLENGTH_8D ((u8)0x00)
#define STOPBITS_1 ((u8)0x00)
#define UART2_PARITY_NO ((u8)0x00)
#define MODE_TXRX_ENABLE ((u8)0x0C)

/* Private macros ------------------------------------------------------------*/

#define switch_LD1_on			{ GPIOD->ODR &= ~mskLD1; }
#define switch_LD1_off		{ GPIOD->ODR |= mskLD1; }

#define start_TIM3				{ TIM3->CR1 |= TIM3_CR1_CEN; }
#define stop_TIM3					{ TIM3->CR1 &= ~TIM3_CR1_CEN; }

/* Private variables ---------------------------------------------------------*/

/*data EEPROM*/
u32 eeprom_addr = BASE_ADDR;		

/*Counter*/
u16 ctr;

/*Buffers*/
u8 Buff_Out1[SIZE_OF_BUFFER+1];
u8 Buff_In1[SIZE_OF_BUFFER];
u8 Display[SIZE_OF_BUFFER+1];
u8 *buffer;

bool hour_flag;
bool first_display;

/* Variables Declaration to store the counters for 50ms, second, minute, hour */
u8 t_hour;            /* Real time clock HOUR counter. */
u8 t_min;             /* Real time clock MINUTE counter. */
u8 t_sec;             /* Real time clock SECOND counter. */
u8 t_50ms;            /* Real time clock 50 MILLISECOND counter. */

u8 state;

/* Public variables ---------------------------------------------------------*/
u8 no_of_sample_vals;		 					//variable used to keep track of number of temperature samples
																	//used to calculate the average temperature
u16 temp_arr[MAX_NO_SAMPLE_VAL];	//ADC values temporary array

/* Private constants --------------------------------------------------------*/

/*These messages will be displayed on hyperterminal as application proceeds*/
const char buff1[]= {"\n\rTemperature Sensor Application demo using an LM235\n"};
const char buff2[]= {"\n\rPlease enter Min value (-040 to +125)... "}; 
const char buff3[]= {"\n\rPlease enter Max value, greater than Min value, (-040 to +125)... "}; 
const char buff4[]= {"\n\n\r====================\n\rData in EEPROM is...\n\r====================\n"}; 
const char buff5[]= {"\n\rTemperature sensed..."};
const char buff6[]= {"\n\rCritical Temperature Value: "};
const char buff7[]= {"\n\r\n\rWriting temperature value(s) on EEPROM...\n\r"};
const char buff8[]= {"\n\rReading temperature value(s) from EEPROM\n\r"};
const char buff9[]= {"\n\rThis application is designed to work with Integer values only\n"};
const char buff10[]= {"\n\r=====================\n\rEnd of EEPROM reading\n\r=====================\n"}; 

/* Private function prototypes ----------------------------------------------*/

/* Private functions --------------------------------------------------------*/

/**
  * @brief Data Flash unlocking routine
  * @par Parameters: None
  * @retval None
  */
void UnlockDataFlash(void) 
{
	volatile u8 DataUnlocked = 0;
	
	/* Unlock Data memory Keys registers */		
	while( DataUnlocked == 0 )
	{
		FLASH->DUKR=0xAE;
		FLASH->DUKR=0x56;
		
		DataUnlocked = (u8)FLASH->IAPSR;	
		DataUnlocked &= FLASH_IAPSR_DUL;
	}
}

/**
  * @brief Byte Flash writing routine
  * @par Parameters:
  * add: destination adress in flash
	* data_in: data array to be written in flash
  * @retval None
  */
void WriteFlash(u32 add, u8 *data_in) 
{	
	FLASH->CR1 &= (u8)(~FLASH_CR1_FIX);		// Set Standard programming time (max 6.6 ms)

	for(ctr=0; ctr<(u8)SIZE_OF_BUFFER; ctr++)
	{	
		*((PointerAttr u8*)(add+ctr)) = data_in[ctr];
	}
}

/**
  * @brief Byte Flash reading routine
  * @par Parameters:
  * add: destination adress in flash
	* data_out: array updated with read temperature
  * @retval Return value:
	* None
  */
void ReadFlash(u32 add, u8 *data_out) 
{
	u8 ctr2;
	
	for(ctr2=0; ctr2<(u8)SIZE_OF_BUFFER; ctr2++)
	{
		data_out[ctr2] = *((u8*)(add+ctr2));
	}
}

/**
  * @brief UART2 init routine
  * @par Parameters: None
  * @retval: None
  */
void UART2_Init(void) 
{	
	/* UART2 configured as follow:
			- BaudRate = 9600 baud  
			- Word Length = 8 Bits
			- One Stop Bit
			- Odd parity
			- Receive and transmit enabled
			- UART2 Clock disabled
	*/
	
	u8 BRR2_1, BRR2_2 = 0;
	u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;

	UART2->CR1 |= WORDLENGTH_8D; /* Set the word length bit according to WordLength value */

	UART2->CR3 |= STOPBITS_1;  /* Set the STOP bits number according to StopBits value  */

	UART2->CR1 |= UART2_PARITY_NO;  /* Set the Parity Control bit to Parity value */

	/* Set the UART2 BaudRates in BRR1 and BRR2 registers according to BaudRate value */
	BaudRate_Mantissa    = (HSEfreq / (BAUD_RATE << 4));
	BaudRate_Mantissa100 = ((HSEfreq * 100) / (BAUD_RATE << 4));
	
	/* The fraction and MSB mantissa should be loaded in one step in the BRR2 register*/
	BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /* Set the fraction of UARTDIV  */
	BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);

	UART2->BRR2 = (u8)(BRR2_1 | BRR2_2);
	UART2->BRR1 = (u8)BaudRate_Mantissa;    /* Set the LSB mantissa of UARTDIV  */

	UART2->CR2 |= MODE_TXRX_ENABLE; /* Set the Transmitter Enable and Receiver Enable bits */
	
	UART2->CR3 &= (u8)(~UART2_CR3_CKEN); /* Clear the Clock Enable bit */
}

/**
  * @brief TIM3 init routine
  * @par Parameters: None
  * @retval: None
  */
void TIM3_Init(void) 
{	
	TIM3->PSCR = 4;												// init divider register/16
	TIM3->ARRH = (u8)(TIMER_REL_VAL>>8);	// init ARR
	TIM3->ARRL = (u8)(TIMER_REL_VAL);
	TIM3->CR1 |= TIM3_CR1_URS;						// update on overflow
	TIM3->CR1 |= TIM3_CR1_ARPE;						// enable auto-reload preload, counter will be free-running
	TIM3->IER = TIM3_IER_UIE;							// enable update on overflow interrupt
}

/**
  * @brief Counters update routine
  * @par Parameters: None
  * @retval None
  */
void TRtc_CntUpdate(void)                
{
	t_50ms++;      		        /* 50ms are completed*/
	
	if(t_50ms == 20)	        /* 1 sec is completed */
	{                                               
		no_of_sample_vals = 0;
		state = NORMAL_MODE;
		t_50ms = 0;            /* Clear 50ms counter */
		t_sec++;		           /* Increment second counter */
		
		if(t_sec == 60)        /* 1 min is completed*/
		{
			t_sec = 0;              /* Clear second counter */
			t_min++;                /* Increment minute counter */
			
			if(t_min == 60)     		/* 1 hour is completed */
			{
				hour_flag=TRUE;
				t_min = 0;           /* Clear minute counter */
				t_hour++;            /* Increment hour counter */
				
				if(t_hour == 24)     /* 1 day is completed */
				{
					t_hour = 0;      /* Clear hour counter */
				}
			}
		}
	}		             
}

/**
  * @brief state machine routine
  * @par Parameters: None
  * @retval None
  */
void State_Machine(s16 *min, s16 *max, u8 *no_of_temp_vals, s16 *critical_temp_low, s16 *critical_temp_high) 
{	
	u8 count=0;
	s32 temp_in;	//used to store temperature value
	s16 average;
	s16 min_copy;
	s16 max_copy;
	
	switch (state)
	{
		case CONFIG_MODE: 	//Configuration Mode:
												//Prompts user to enter lower and upper threshold value
				stop_TIM3;			
				
				/* get minimum critical value */
				/*
				SerialPutString(buff2);
				while(!(UART2->SR & UART2_SR_TC)){};
				GetInputString(Buff_In1);
				*/
				/* Convert the temperature entered by user into its decimal equivalent */
				/*
				if (Buff_In1[0] == '-')
				{
					*critical_temp_low = ((Buff_In1[2] - '0') * 10) + (Buff_In1[3] - '0');
					*critical_temp_low *= -1;
				}
				else
					*critical_temp_low = ((Buff_In1[1] - '0') * 100) + ((Buff_In1[2] - '0') * 10) + (Buff_In1[3] - '0');
				*/
				*critical_temp_low = 10;

				/* get maximum critical value */
				/*
				SerialPutString(buff3);
				while(!(UART2->SR & UART2_SR_TC)){};
				GetInputString(Buff_In1);
				*/
				/* Convert the temperature entered by user into its decimal equivalent */
				/*
				if(Buff_In1[0]=='-')
				{
					*critical_temp_high = ((Buff_In1[2] - '0') * 10) + (Buff_In1[3] - '0');
					*critical_temp_high *= -1;
				}
				else
					*critical_temp_high = ((Buff_In1[1] - '0') * 100) + ((Buff_In1[2] - '0') * 10) + (Buff_In1[3] - '0');
				*/
				*critical_temp_high = 100;
				
				TIM3_Init();			//initialize timer 3

				start_TIM3;				//enable timer 3
				
				state = IDLE_MODE;
			
			break;

		case READ_MODE:	//Read stored temperature values from EEPROM and 
										//write to hyperterminal via SCI
				
				stop_TIM3;	
				
				SerialPutString(buff4);
				while(!(UART2->SR & UART2_SR_TC)){};
							
				SerialPutString(buff8);
				while(!(UART2->SR & UART2_SR_TC)){};
		      
				ctr = (u16)BASE_ADDR;

				while(ctr != eeprom_addr)
				{
					ReadFlash(ctr, Display);
					
					Display[4] = '\0';
					
					SerialPutString("\r\n");
					while(!(UART2->SR & UART2_SR_TC)){};
					SerialPutString(Display);
					while(!(UART2->SR & UART2_SR_TC)){};
					
					ctr += SIZE_OF_BUFFER;
				}
					
				SerialPutString(buff10);
				while(!(UART2->SR & UART2_SR_TC)){};
				
				switch_LD1_off;
				
				TIM3_Init();			//initialize timer 3

				start_TIM3;				//enable timer 3
				
				state = IDLE_MODE;
			
			break;

		case NORMAL_MODE: //Normal Mode:
											//Sense temperature and write to EEPROM. If critical value
											//then LED glows; message displayed on hyperterminal if temperature at t=n*1min is critical				
				average = 0;
						
				/*After completion of 1 sec the average of the temperature samples is calculated and
				the first averaged temperature is displayed on hyperterminal .*/

				if (t_50ms == 0) //t_50ms gets 0 value in function TRtc_CntUpdate after every sec approx.
				{
					for(count=0; count < MAX_NO_SAMPLE_VAL; count++)
					{						
						temp_in = temp_arr[count]*CONVERSION_FACTOR;
						
						/*Finally, it is divided by 100 as the zener breakdown 
						voltage changes by 10mV for each degree kelvin change and
						as we used 49 instead of 4.9*/						
						temp_in /= 100;
						
						temp_in -= 273;				//Convert Kelvin temperature to Celcius*/
						average += temp_in;
					}
					
					temp_in = average >> 4; //average over 16 values
							
					if (temp_in < *min)
						*min = temp_in;						
						
					if (temp_in > *max)
						*max = temp_in;
					
					/*If Temperature value beyond threshold then LED toggled*/
					if ((temp_in < *critical_temp_low) || (temp_in > *critical_temp_high))
						switch_LD1_on;
					
					/* Display first averaged temperature */				
					if(first_display)
					{	
						first_display = FALSE;
						
						if ((temp_in < *critical_temp_low) || (temp_in > *critical_temp_high))
						{
							SerialPutString(buff6);
							while(!(UART2->SR & UART2_SR_TC)){};
						}
					
						if(temp_in<0)
						{
							Buff_Out1[0]=(u8)'-';
							temp_in *= -1;
						}
						else
							Buff_Out1[0]=(u8)'+';
						
						/*Store the decimal equivalent of 3digit temperature in Buff_Out1*/
						for(ctr=(SIZE_OF_BUFFER-1); ctr >= 1; --ctr)
						{
							Buff_Out1[ctr]=(u8)(temp_in % 10) + '0';
							temp_in/=10;			
						}
						
						SerialPutString("\r\n");
						while(!(UART2->SR & UART2_SR_TC)){};
						SerialPutString(buffer);
						while(!(UART2->SR & UART2_SR_TC)){};
					}
				}
				
				if(t_sec == 0) //t_sec gets 0 value in function TRtc_CntUpdate after every minute approx.
				{
					/*If Temperature value beyond threshold then display message on hyperterminal*/
					if ((temp_in < *critical_temp_low) || (temp_in > *critical_temp_high))
					{
						SerialPutString(buff6);
						while(!(UART2->SR & UART2_SR_TC)){};
					}
					
					if(temp_in<0)
					{
						Buff_Out1[0] = (u8)'-';
						temp_in *= -1;
					}
					else
						Buff_Out1[0] = (u8)'+';
					
					/*Store the decimal equivalent of 3digit temperature in Buff_Out1*/
					for(ctr=(SIZE_OF_BUFFER-1); ctr >= 1; --ctr)
					{
						Buff_Out1[ctr] = (u8)(temp_in % 10) + '0';
						temp_in /= 10;			
					}
					
					Buff_Out1[4] = '\0';
					
					/*Display actual temperature every minute*/
					SerialPutString("\r\n");
					while(!(UART2->SR & UART2_SR_TC)){};
					SerialPutString(Buff_Out1);
					while(!(UART2->SR & UART2_SR_TC)){};
				}

				/*After completion of 1 hr the min/max temperatures of this hour are recorded in EEPROM*/
				if (hour_flag)
				{
					hour_flag = FALSE;
					
					SerialPutString(buff7);
					while(!(UART2->SR & UART2_SR_TC)){};
				
					/*If number of temperature values stored in EEPROM exceeds the maximum limit,
					reset eeprom_addr to 0x00*/	
					if (*no_of_temp_vals == MAX_NO_OF_TEMP_VALS)
					{
						eeprom_addr = BASE_ADDR;
						*no_of_temp_vals = 0;
					}
					
					if(*min<0)
					{
						Buff_Out1[0] = (u8)'-';
						*min *= -1;
					}
					else
						Buff_Out1[0] = (u8)'+';
					
					/*Store the decimal equivalent of 3digit temperature in Buff_Out1*/
					min_copy = *min;
					for(ctr=(SIZE_OF_BUFFER-1);ctr>=1;--ctr)
					{
						Buff_Out1[ctr] = (u8)(min_copy % 10) + '0';
						min_copy /= 10;			
					}
							
					/*Write temperature value to EEPROM*/
					WriteFlash(eeprom_addr, buffer);
					while( !(FLASH->IAPSR & FLASH_IAPSR_EOP) ){}
					
					eeprom_addr += (u8)SIZE_OF_BUFFER;/*increment memory address variable*/
					*no_of_temp_vals += 1;
							
					/*If number of temperature values stored in EEPROM exceeds the maximum limit,
					reset eeprom_addr to 0x4000*/	
					if (*no_of_temp_vals == MAX_NO_OF_TEMP_VALS)
					{
						eeprom_addr = BASE_ADDR;
						no_of_temp_vals = 0;
					}
							
					if(*max<0)
					{
						Buff_Out1[0] = (u8)'-';
						*max *= -1;
					}
					else
						Buff_Out1[0] = (u8)'+';
					
					/*Store the decimal equivalent of 3digit temperature in Buff_Out1*/
					max_copy = *max;
					for(ctr=(SIZE_OF_BUFFER-1); ctr>=1; --ctr)
					{
						Buff_Out1[ctr]=(u8)(max_copy % 10) + '0';
						max_copy /= 10;			
					}
			
					/*Write temperature value to EEPROM*/
					WriteFlash(eeprom_addr, buffer);
					while( !(FLASH->IAPSR & FLASH_IAPSR_EOP) ){}
					
					eeprom_addr += (u8)SIZE_OF_BUFFER;/*increment memory address variable*/
					*no_of_temp_vals += 1;
							
					*min = 999;/*initialize min, max values for next hour*/
					*max = 0;							
				}
				
				state = IDLE_MODE;							
			break;
					
		default:
			break;
	} //end of switch case
		
	if(ButtonPressed1)				//Check whether Button 1 has been pressed or not
	{
		state = 1;
		ButtonPressed1=FALSE;
	}
	else if(ButtonPressed2)		//Check whether Button 2 has been pressed or not
	{
		state = 2;
		ButtonPressed2=FALSE;
	}
}

/* Public functions ----------------------------------------------------------*/

/**
  * @brief Main entry point.
  * @par Parameters:
  * None
  * @retval void None
  */
void main(void) 
{	
	s16 min_val = 999;
	s16 max_val = 0;
	u8 temp_vals = 0; //variable used to keep track of number of temperature values
									  //stored in EEPROM

	//variables for storing lower and upper bound temperature values	
	s16 crit_temp_low = 0;
	s16 crit_temp_high = 0;
	
	u16 time_out = (u16)0x491;		//clock switching time out
	
	t_50ms = t_sec = t_min = t_hour = 0x00;
	hour_flag = FALSE;
	no_of_sample_vals = 0;
	first_display = TRUE;
	
	state = CONFIG_MODE;		//first prompt the user to input his threshold temperatures
	
	buffer = Buff_Out1; 			//Address of Buff_Out1 stored in pointer buffer
	
	UnlockDataFlash();			// unlock data flash for further writing
	
	//				*** CPU clock source switching and divider init ***
	CLK->SWR = mskHSEstart;
		
	while( !(CLK->SWCR & CLK_SWCR_SWIF) & time_out )
		time_out--; 											// wait for targeted clock to be ready
		
	if(time_out)
		CLK->SWCR|= CLK_SWCR_SWEN;					// new block is ready - make switch
	else
		CLK->SWCR &= ~CLK_SWCR_SWBSY;				// switch back to original clock source
		
	CLK->SWCR &= ~CLK_SWCR_SWIF;					// clear SWIF	
	
	CLK->CKDIVR &= mskFhseDiv1;				// fCPU = fHSE = 16 MHz
	
	// 								*** GPIO INIT ***
	GPIOD->ODR |= mskLD1; 	// LD1 output settings - off
	GPIOD->DDR |= mskLD1;		// outputs
	GPIOD->CR1 |= mskLD1;		// push-pull
	
	/* BUTTONS input settings: Input pull-up w/ interrupt */
	GPIOA->DDR &= (~mskBUTTON1 | ~mskBUTTON2);			
	GPIOA->CR1 |= (mskBUTTON1 | mskBUTTON2); 	
	GPIOA->CR2 |= (mskBUTTON1 | mskBUTTON2);
	
	/* input pin sensibility on falling edges only */
	EXTI->CR1 &= (u8)(~EXTI_CR1_PAIS);
	EXTI->CR1 |= (u8)((u8)(mskEXTIsens) << 2);
	
	//                *** UART2 INIT ***       
	UART2_Init();
	
	// 								*** ADC1 INITIALIZATION ***
	ADC1->CR1 |= (ADC1_CR1_SPSEL & (0x02<<4));		//fADC = 4 Mhz
	ADC1->CSR |= (ADC1_CSR_CH & CHANNEL);					//channel 2
	ADC1->CR2 |= ADC1_CR2_ALIGN;									//right aligment
	
	enableInterrupts();
	
	SerialPutString("\r\n====================== STM8S-Discovery ===================\r\n");
	while(!(UART2->SR & UART2_SR_TC)){};
	SerialPutString(buff1);
	while(!(UART2->SR & UART2_SR_TC)){};
	SerialPutString(buff9);
	while(!(UART2->SR & UART2_SR_TC)){};
	
	// 								*** MAIN LOOP ***	
	while (1) 
	{				
		State_Machine(&min_val, &max_val, &temp_vals,	&crit_temp_low, &crit_temp_high);
	}
}
/**
  * @}
  */

/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
