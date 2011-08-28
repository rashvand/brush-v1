// State machine handler module

/* Include ******************************************************************/
#include "MC_StateMachine.h"
#include "MC_type.h"
#include "MC_vtimer.h"
//#include "MC_keys.h"
#include "MC_controlstage_param.h"
#include "MC_dev.h"
#include "MC_drive.h"
#include "vdev.h"
#include "MC_Faults.h"

#include "stm8s_gpio.h"
#include "stm8s_tim1.h"
#include "stm8s_adc1.h"
#include "stm8s_clk.h"

/* private typedef **********************************************************/
typedef enum
{
	SM_NO_FAULT,
	SM_RESET_FAULT,
	SM_IDLE_FAULT,
	SM_STARTINIT_FAULT,
	SM_START_FAULT,
	SM_RUN_FAULT,
	SM_STOP_FAULT,
	SM_WAIT_FAULT	
} SM_FaultingState_t;

/*static*/ State_t bState = SM_DEBUG1;
static SM_FaultingState_t FaultingState = SM_NO_FAULT;

extern u16 ADC_Buffer[2];

void next_state(MC_FuncRetVal_t current_ret, 
								State_t next, 
								SM_FaultingState_t fault)
{
	if (devChkHWErr() == FUNCTION_ERROR)
	{
		// stop e vado in fault, c'è stato un problema hw
		if (bState != SM_FAULT) driveStop();
		bState = SM_FAULT;
	}
	else 
	{
		switch (current_ret)
		{
			case FUNCTION_ERROR:
				// mi salvo lo stato e vado in fault
				FaultingState = fault;
				bState = SM_FAULT;
				break;
				
			case FUNCTION_ENDED:
				// vado al nuovo stato
				bState = next;
				break;
				
			default:
			case FUNCTION_RUNNING:
				// rimango in questo stato
				break;
		}
	}	
}

void StateMachineExec(void)
{
	pvdev_device_t pDevice;
	MC_FuncRetVal_t retVal;
	u16 temp;
	
  switch (bState)
  {
		case SM_RESET:
			vtimer_init(); // vtimer init must be called before vdev_init to avoid unexpected beaviours			
			vdev_init();
			pDevice = vdev_get();
			devInit(pDevice);			
			driveInit(pDevice);	
			bState = SM_IDLE;
			FaultingState = SM_NO_FAULT;			
			break;
			
		case SM_IDLE:
			retVal = driveIdle();
			//next_state(retVal, SM_STARTINIT, SM_IDLE_FAULT);
			next_state(retVal, SM_DEBUG1, SM_IDLE_FAULT);
			break;
		
		case SM_DEBUG1:
		
			//CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
			CLK_HSECmd(ENABLE);
			
			//tim1
			
			TIM1_DeInit();
			TIM1_TimeBaseInit(10000, TIM1_COUNTERMODE_UP, 1, 0); /* Configure a 10ms tick */
			TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE); /* Generate an interrupt on timer count overflow */
			TIM1_Cmd(ENABLE); /* Enable TIM1 */			
			
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
			GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
			
			GPIO_WriteLow(GPIOC, GPIO_PIN_1);
			GPIO_WriteLow(GPIOC, GPIO_PIN_2);
			GPIO_WriteLow(GPIOC, GPIO_PIN_3);
			
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
			
			/*
			ADC1->CSR = ADC1_CSR_EOCIE | (3 & ADC1_CSR_CH);  	// ADC EOC interrupt enable, channel xxx
			ADC1->CR1 = 4 << 4 & ADC1_CR1_SPSEL;			        // master clock/8, single conversion
			ADC1->CR2 = 0; 										 								// left alignment
			ADC1->CR3 = 0;
			ADC1->TDRH = 0x03;									    					// disable Schmitt trigger on AD input xxx
			ADC1->TDRL = 0xFF;                                
					
			ADC1->CR1 |= ADC1_CR1_ADON;					            	// ADC on
			temp = 0x8000;
			while (temp--);		
			
			enableInterrupts();							                	// enable all interrupts 
			
			ADC1->CR1 |= ADC1_CR1_ADON;					            	// ADC on
			*/			
			
			ADC1_DeInit(); 
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
								ADC1_CHANNEL_4, 
								ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM, 
								DISABLE, 
								ADC1_ALIGN_RIGHT, 
								ADC1_SCHMITTTRIG_CHANNEL4, 
								DISABLE); 
			ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE); // Enable EOC interrupt	
			ADC1_Cmd(ENABLE); // ADON for the first time it just wakes the ADC up
			ADC1_StartConversion();
					
			enableInterrupts();							                	
						
			bState = SM_DEBUG2;
			break;
			
		case SM_DEBUG2:
			break;
		
		case SM_STARTINIT:
			retVal = driveStartUpInit();
			next_state(retVal, SM_START, SM_STARTINIT_FAULT);
			break;
			
		case SM_START:
			retVal = driveStartUp();
			next_state(retVal, SM_RUN, SM_START_FAULT);
			break;
			
		case SM_RUN:
		  retVal = driveRun(); // Execute the motor control run
			next_state(retVal, SM_STOP, SM_RUN_FAULT);
			break;
			
		case SM_STOP:
			retVal = driveStop();
			next_state(retVal, SM_WAIT, SM_STOP_FAULT);
			break;
			
		case SM_WAIT:
			retVal = driveWait();
			next_state(retVal, SM_IDLE, SM_WAIT_FAULT);
			break;
			
		case SM_FAULT:
			if (FaultingState != SM_NO_FAULT)
			{
				// Corrective drive actions accordingly the origin state
				// ...
				FaultingState = SM_NO_FAULT;
			}
			next_state(FUNCTION_ENDED, SM_IDLE, 0);
			break;
	}
}
