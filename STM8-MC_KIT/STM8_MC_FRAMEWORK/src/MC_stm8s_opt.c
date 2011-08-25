// Low level option byte managament module

/* Includes ------------------------------------------------------------------*/
#include "stm8s_lib.h"
#include "MC_dev_opt.h"
#include "MC_stm8s_param.h"
#include "MC_BLDC_conf.h"

void dev_optInit(void)
{
	u8 Opt;
	u16 OptComp;
	u16 i;	
	
	// Wait 10ms after reset to avoid bad option byte programming
	for (i=0;i<5000;i++);
		
	/* Define FLASH programming time */
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
	
	/* Unlock Data memory */
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	#if (STM8_FREQ_MHZ > 16)
		if (FLASH_ReadOptionByte(0x480D) != 0x01FE)
		{
			FLASH_ProgramOptionByte(0x480D, 0x01); // Set 1 Wait State
		}
	#else
		if (FLASH_ReadOptionByte(0x480D) != 0x00FF)
		{
			FLASH_ProgramOptionByte(0x480D, 0x00); // Set 0 Wait State
		}
	#endif
	
	Opt = 0;
	
	#ifdef TIM1_CHxN_REMAP
		Opt |= 0x20;
	#else
		Opt &= (u8)(~0x20);
	#endif
	
	#ifdef TIM2_CH3_REMAP
		Opt |= 0x02;
	#else
		Opt &= (u8)(~0x02);
	#endif
	
	OptComp = (u8)(~Opt) | (Opt << 8);
	
	if (OptComp != FLASH_ReadOptionByte(0x4803))
	{
		FLASH_ProgramOptionByte(0x4803, Opt );
	}
		
	/* Lock Data memory */	
	FLASH_Lock(FLASH_MEMTYPE_DATA);
}
