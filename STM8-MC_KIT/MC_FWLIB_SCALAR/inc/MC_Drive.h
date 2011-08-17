/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_Drive.h
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Common prototype definition for high level drive
********************************************************************************
* History:
* mm/dd/yyyy ver. x.y.z
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*
* THIS SOURCE CODE IS PROTECTED BY A LICENSE.
* FOR MORE INFORMATION PLEASE CAREFULLY READ THE LICENSE AGREEMENT FILE LOCATED
* IN THE ROOT DIRECTORY OF THIS FIRMWARE PACKAGE.
*******************************************************************************/

/******************************************************************************/
#ifndef __MC_DRIVE_H
#define __MC_DRIVE_H

#include "vdev.h"
#include "MC_dev.h"

void driveInit(pvdev_device_t pdevice);
void driveIdle(void);
MC_FuncRetVal_t driveStartUpInit(void);
MC_FuncRetVal_t driveStartUp(void);
MC_FuncRetVal_t driveRun(void);
MC_FuncRetVal_t driveStop(void);
MC_FuncRetVal_t driveWait(void);
MC_FuncRetVal_t driveFault(void);

#endif /* __MC_DRIVE_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/