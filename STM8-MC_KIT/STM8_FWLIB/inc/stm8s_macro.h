/**
  ******************************************************************************
  * @file stm8s_macro.h
  * @brief This file contains all generic macros.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.1
  * @date 09/22/2008
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2008 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8S_MACRO_H
#define __STM8S_MACRO_H

/* Defined used compiler -----------------------------------------------------*/
#if defined(__CSMC__)
#undef _RAISONANCE_
#define _COSMIC_
#elif defined(__RCST7__)
#undef _COSMIC_
#define _RAISONANCE_
#else
#error "Unsupported Compiler!"            /* Compiler defines not found */
#endif

/* Includes ------------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/

/*============================== Interrupts ====================================*/
#ifdef _RAISONANCE_
#include <intrist7.h>
#define enableInterrupts()  _rim_()  /* enable interrupts */
#define disableInterrupts() _sim_()  /* disable interrupts */
#define rim()               _rim_()  /* enable interrupts */
#define sim()               _sim_()  /* disable interrupts */
#define nop()               _nop_()  /* No Operation */
#define trap()              _trap_() /* Trap (soft IT) */
#define wfi()               _wfi_()  /* Wait For Interrupt */
#define halt()              _halt_() /* Halt */
#else /* COSMIC */
#define enableInterrupts() {_asm("rim\n");} /* enable interrupts */
#define disableInterrupts() {_asm("sim\n");} /* disable interrupts */
#define rim() {_asm("rim\n");} /* enable interrupts */
#define sim() {_asm("sim\n");} /* disable interrupts */
#define nop() {_asm("nop\n");} /* No Operation */
#define trap() {_asm("trap\n");} /* Trap (soft IT) */
#define wfi() {_asm("wfi\n");} /* Wait For Interrupt */
#define halt() {_asm("halt\n");} /* Halt */
#endif
/*============================== Handling bits ====================================*/

/*-----------------------------------------------------------------------------
Method : I
Description : Handle the bit from the character variables.
Comments :    The different parameters of commands are
              - VAR : Name of the character variable where the bit is located.
              - Place : Bit position in the variable (7 6 5 4 3 2 1 0)
              - Value : Can be 0 (reset bit) or not 0 (set bit)
              The "MskBit" command allows to select some bits in a source
              variables and copy it in a destination var (return the value).
              The "ValBit" command returns the value of a bit in a char
              variable: the bit is reseted if it returns 0 else the bit is set.
              This method generates not an optimised code yet.
-----------------------------------------------------------------------------*/
#define SetBit(VAR,Place)         ( (VAR) |= (u8)((u8)1<<(u8)(Place)) )
#define ClrBit(VAR,Place)         ( (VAR) &= (u8)((u8)((u8)1<<(u8)(Place))^(u8)255) )

#define ChgBit(VAR,Place)         ( (VAR) ^= (u8)((u8)1<<(u8)(Place)) )
#define AffBit(VAR,Place,Value)   ((Value) ? \
                                   ((VAR) |= ((u8)1<<(Place))) : \
                                   ((VAR) &= (((u8)1<<(Place))^(u8)255)))
#define MskBit(Dest,Msk,Src)      ( (Dest) = ((Msk) & (Src)) | ((~(Msk)) & (Dest)) )

#define ValBit(VAR,Place)         ((u8)(VAR) & (u8)((u8)1<<(u8)(Place)))

#define BYTE_0(n)                 ((u8)((n) & (u8)0xFF))        /*!< Returns the low byte of the 32-bit value */
#define BYTE_1(n)                 ((u8)(BYTE_0((n) >> (u8)8)))  /*!< Returns the second byte of the 32-bit value */
#define BYTE_2(n)                 ((u8)(BYTE_0((n) >> (u8)16))) /*!< Returns the third byte of the 32-bit value */
#define BYTE_3(n)                 ((u8)(BYTE_0((n) >> (u8)24))) /*!< Returns the high byte of the 32-bit value */

/*============================== Assert Macros ====================================*/

#define IS_STATE_VALUE_OK(SensitivityValue) \
  (((SensitivityValue) == ENABLE) || \
   ((SensitivityValue) == DISABLE))

/*-----------------------------------------------------------------------------
Method : II
Description : Handle directly the bit.
Comments :    The idea is to handle directly with the bit name. For that, it is
              necessary to have RAM area descriptions (example: HW register...)
              and the following command line for each area.
              This method generates the most optimized code.
-----------------------------------------------------------------------------*/

#define AREA 0x00     /* The area of bits begins at address 0x10. */

#define BitClr(BIT)  ( *((unsigned char *) (AREA+(BIT)/8)) &= (~(1<<(7-(BIT)%8))) )
#define BitSet(BIT)  ( *((unsigned char *) (AREA+(BIT)/8)) |= (1<<(7-(BIT)%8)) )
#define BitVal(BIT)  ( *((unsigned char *) (AREA+(BIT)/8)) & (1<<(7-(BIT)%8)) )

/* Exported functions ------------------------------------------------------- */

#endif /* __STM8S_MACRO_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
