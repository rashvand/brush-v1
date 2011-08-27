/* Includes ------------------------------------------------------------------*/
#include "stm8s_type.h"
#include "MC_StateMachine.h"
#include <stdio.h>

/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/*****************************************************************************/
extern u16 ADC_Buffer[ 6 ];

void main(void)
{
  u32 i=0;
	/* Infinite loop */
  while (1)
  {
		i++;
		StateMachineExec();
		/* Print ADC value on serial port */
		if(i == 300)
		{
			printf("<ADC> %6u %6u %6u %6u %6u %6u %6u %6u %6u %6u </ADC>\r\n",
				ADC_Buffer[0],
				ADC_Buffer[1],
				ADC_Buffer[2],
				ADC_Buffer[3],
				ADC_Buffer[4],
				ADC_Buffer[5],
				0,0,0,0);
			i = 0;
		}
  }
}

/**
  * @brief Reports the name of the source file and the source line number where
  * the assert error has occurred.
  * User can add his own implementation to report the file name and line number.
  * ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line)
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  */
#ifdef FULL_ASSERT
void assert_failed(u8 *file, u16 line)
#else
void assert_failed(void)
#endif
{
  /* Add your own code to manage an assert error */
  /* Infinite loop */
  while (1)
  {
  }
}

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
