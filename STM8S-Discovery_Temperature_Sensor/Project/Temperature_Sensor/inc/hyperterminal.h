 /******************** (C) COPYRIGHT 2010 STMicroelectronics ********************
* File Name          : hyperterminal.h
* Author             : MCD Application Team
* Date First Issued  : 03/30/2010
* Description        : This file provides headers for a very simple optimized
*                      hyperterminal driver derivated from the complete hyperterminal 
*                      driver of UM0884.                      
********************************************************************************
* History:
*  03/30/2010 : V1.0
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*******************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef _HYPERTERMINAL_H
 #define _HYPERTERMINAL_H
 
 /* Includes ------------------------------------------------------------------*/
 #include "stm8s.h"
 
 /* Exported types ------------------------------------------------------------*/
 
 /* Exported constants --------------------------------------------------------*/
 
 /* Constants used by Serial Command Line Mode */
 #define CMD_STRING_SIZE     128
 
 /* Exported macro ------------------------------------------------------------*/
 
 /* Exported functions ------------------------------------------------------- */
 u8 SerialKeyPressed(char *key);
 char GetKey(void);
 void SerialPutChar(char c);
 void SerialPutString(const char *s);
 void GetInputString(char * buffP);
#endif  /* _HYPERTERMINAL_H */

/*******************(C)COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
