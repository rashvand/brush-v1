/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_StateMachine.c
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : State machine handler module
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

/* private typedef **********************************************************/
typedef enum 
{SM_RESET,SM_IDLE,SM_STARTINIT,SM_START,SM_RUN,SM_STOP,SM_WAIT,SM_FAULT,SM_FAULT_OVER} State_t;

typedef enum
{STATE_REMAIN,NEXT_STATE,OPTIONAL_JUMP,ERROR_CONDITION} SM_RetVal_t;

typedef enum
{SM_NO_FAULT,SM_RESET_FAULT,SM_IDLE_FAULT,SM_STARTINIT_FAULT,
SM_START_FAULT,SM_RUN_FAULT,SM_STOP_FAULT,SM_WAIT_FAULT,SM_FAULTOVER_FAULT} SM_FaultingState_t;

/* private prototypes *******************************************************/
SM_RetVal_t sm_reset(void);
SM_RetVal_t sm_idle(void);
SM_RetVal_t sm_startinit(void);
SM_RetVal_t sm_start(void);
SM_RetVal_t sm_run(void);
SM_RetVal_t sm_stop(void);
SM_RetVal_t sm_wait(void);
SM_RetVal_t sm_fault(void);
SM_RetVal_t sm_faultover(void);

static State_t bState = SM_RESET;
static SM_FaultingState_t FaultingState = SM_NO_FAULT;

void StateMachineExec(void)
{
  SM_RetVal_t bRetVal;
  switch (bState)
  {
  case SM_RESET:
    bRetVal = sm_reset();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_IDLE;
    else
      bState = SM_FAULT;
    break;
  case SM_IDLE:
    bRetVal = sm_idle();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_STARTINIT;
    else
      bState = SM_FAULT;
    break;
  case SM_STARTINIT:
    bRetVal = sm_startinit();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_START;
    else
      bState = SM_FAULT;
    break;
  case SM_START:
    bRetVal = sm_start();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_RUN;
    else if (bRetVal == OPTIONAL_JUMP)
      bState = SM_STOP;
    else
      bState = SM_FAULT;
    break;
  case SM_RUN:
    bRetVal = sm_run();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_STOP;
    else
      bState = SM_FAULT;
    break;
  case SM_STOP:
    bRetVal = sm_stop();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_WAIT;
    else
      bState = SM_FAULT;
    break;
  case SM_WAIT:
    bRetVal = sm_wait();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_IDLE;
    else
      bState = SM_FAULT;
    break;
  case SM_FAULT:
    bRetVal = sm_fault();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_FAULT_OVER;
    else
      bState = SM_FAULT;
    break;
  case SM_FAULT_OVER:
    bRetVal = sm_faultover();
    if (bRetVal == STATE_REMAIN)
    {}
    else if (bRetVal == NEXT_STATE)
      bState = SM_IDLE;
    else
      bState = SM_FAULT;
    break;
  }
}

SM_RetVal_t sm_reset(void)
{
  /******** Action to be performed *****************/
  pvdev_device_t pDevice;

  // vtimer init must be called before vdev_init to avoid unexpected beaviours
  vtimer_init();
  
  vdev_init();
  pDevice = vdev_get();
  FaultingState = SM_NO_FAULT;
  
  devInit(pDevice);
  
  driveInit(pDevice);
	
  return NEXT_STATE;
}

SM_RetVal_t sm_idle(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  MC_FuncRetVal_t hwRetVal;
  
  // Action to be performed
  driveIdle();
  hwRetVal = devChkHWErr();
  
  // State changes
  if (hwRetVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
  }	
  else
  {
    sm_retVal = NEXT_STATE; 
    
    // Exit actions
  }
  return sm_retVal;
}

SM_RetVal_t sm_startinit(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  u8 kpRetVal;
  MC_FuncRetVal_t retVal, hwRetVal;
  
  /******** Action to be performed *****************/
  retVal = driveStartUpInit();
  hwRetVal = devChkHWErr();
  //kpRetVal = keysProcess();
  
  /******** State change ****************************/
  if (hwRetVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
  }
  else if (retVal == FUNCTION_ERROR) 
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
    FaultingState = SM_STARTINIT_FAULT;
	//Communication to the user interface of actual state errors
  //  UserInterface_Fault(MOTOR_IS_RUNNING);    
  }  
  else if (retVal == FUNCTION_ENDED)
  {
    sm_retVal = NEXT_STATE;
    
    // Exit actions
  }

  
  return sm_retVal;
}

SM_RetVal_t sm_start(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  u8 kpRetVal;
  MC_FuncRetVal_t retVal, hwRetVal;
  
  /******** Action to be performed *****************/
  retVal = driveStartUp();
  hwRetVal = devChkHWErr();
  //kpRetVal = keysProcess();
  
  /******** State change ****************************/
  if (hwRetVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
  }		
  else if (retVal == FUNCTION_ENDED)
  {
    sm_retVal = NEXT_STATE;
    
    // Exit actions
  }
  if (retVal == FUNCTION_ERROR) 
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
    FaultingState = SM_START_FAULT;
    
    //Communication to the user interface of actual state errors
    //UserInterface_Fault(STARTUP_FAILED);
  }
  
  return sm_retVal;
}

SM_RetVal_t sm_run(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  u8 kpRetVal;
  MC_FuncRetVal_t retVal,hwRetVal;
  
  /******** Action to be performed *****************/  
  retVal = driveRun(); // Execute the motor control run
  hwRetVal = devChkHWErr();
  //kpRetVal = keysProcess();
  
  /******** State change ****************************/
  if (hwRetVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
  }	
  else if (retVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    //Exit actions
    FaultingState = SM_RUN_FAULT;	
    
    //Communication to the user interface of actual state errors
    //UserInterface_Fault(ERROR_ON_SPEED_FEEDBACK);
    
  }
  else if (retVal == FUNCTION_ENDED)
  {
    sm_retVal = OPTIONAL_JUMP;
    
    //Exit actions
  }
  
  return sm_retVal;
}

SM_RetVal_t sm_stop(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  MC_FuncRetVal_t retVal, hwRetVal;
  
  retVal = driveStop();
  hwRetVal = devChkHWErr();
  
  // State changes
  if (hwRetVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
  }	
  else if (retVal == FUNCTION_ENDED)
  {
    sm_retVal = NEXT_STATE;
    
    // Exit actions
  }
  else if (retVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
    FaultingState = SM_STOP_FAULT;		
  }
  
  return sm_retVal;
}

SM_RetVal_t sm_wait(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  MC_FuncRetVal_t retVal, hwRetVal;
  
  /******** Action to be performed *****************/
  retVal = driveWait();
  hwRetVal = devChkHWErr();
  
  /******** State change ****************************/
  if (hwRetVal == FUNCTION_ERROR)
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
  }		
  else if (retVal == FUNCTION_ENDED)
  {
    sm_retVal = NEXT_STATE;
    
    // Exit actions
  }
  else if (retVal == FUNCTION_ERROR) 
  {
    sm_retVal = ERROR_CONDITION;
    
    // Exit actions
    FaultingState = SM_WAIT_FAULT;	
  }
  
  return sm_retVal;
}

SM_RetVal_t sm_fault(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  MC_FuncRetVal_t hwRetVal;
  static u8 st_fault = 0;
  
  /******** Action to be performed *****************/
  driveFault();
  if (st_fault == 0)
  {
    driveStop();
    
    //Sets the user interface in lock condition
    //UserInterface_Lock();
    
    st_fault = 1;
  }
  hwRetVal = devChkHWErrEnd();
  
  if (FaultingState != SM_NO_FAULT)
  {
	//Corrective drive actions accordingly the origin state
  }
  
  /******** State change ****************************/
  if (hwRetVal == FUNCTION_ENDED)
  {		
    sm_retVal = NEXT_STATE;
    // Exit actions
    st_fault = 0;
  }	
  
  return sm_retVal;
}

SM_RetVal_t sm_faultover(void)
{
  SM_RetVal_t sm_retVal = STATE_REMAIN;
  MC_FuncRetVal_t hwRetVal;
  u8 kpRetVal;
  
  //kpRetVal = keysProcess();
  hwRetVal = devChkHWErrEnd();
  
  /******** State change ****************************/
  if (hwRetVal == FUNCTION_ERROR)
  {		
    sm_retVal = ERROR_CONDITION;
    // Exit actions
    FaultingState = SM_FAULTOVER_FAULT;	
  }
  return sm_retVal;
}

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
