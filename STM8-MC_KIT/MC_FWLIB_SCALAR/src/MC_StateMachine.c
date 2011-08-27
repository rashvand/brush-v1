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

/* private typedef **********************************************************/
typedef enum 
{
	SM_RESET,
	SM_IDLE,
	SM_STARTINIT,
	SM_START,
	SM_RUN,
	SM_STOP,
	SM_WAIT,
	SM_FAULT,
	SM_DEBUG
} State_t;

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

static State_t bState = SM_RESET;
static SM_FaultingState_t FaultingState = SM_NO_FAULT;

State_t get_next_state(MC_FuncRetVal_t current_ret, 
											 State_t next_state, 
											 SM_FaultingState_t fault)
{
	if (devChkHWErr() == FUNCTION_ERROR)
	{
		// stop e vado in fault, c'è stato un problema hw
		driveStop();
		return SM_FAULT;
	}
	if (current_ret == FUNCTION_ERROR)
	{
		// mi salvo lo stato e vado in fault
		FaultingState = fault;
		return SM_FAULT;
	}
	if (current_ret == FUNCTION_ENDED)
	{
		// vado al nuovo stato
		return next_state;
	}
	// rimango nel medesimo stato
	return bState;
}

void StateMachineExec(void)
{
	pvdev_device_t pDevice;
	MC_FuncRetVal_t retVal;
	
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
			bState = get_next_state(retVal, SM_STARTINIT, SM_IDLE_FAULT);
			//bState = get_next_state(retVal, SM_DEBUG, SM_IDLE_FAULT);
			break;
		
		case SM_DEBUG:
			break;
			
		case SM_STARTINIT:
			retVal = driveStartUpInit();
			bState = get_next_state(retVal, SM_START, SM_STARTINIT_FAULT);
			break;
			
		case SM_START:
			retVal = driveStartUp();
			bState = get_next_state(retVal, SM_RUN, SM_START_FAULT);
			break;
			
		case SM_RUN:
		  retVal = driveRun(); // Execute the motor control run
			bState = get_next_state(retVal, SM_STOP, SM_RUN_FAULT);
			break;
			
		case SM_STOP:
			retVal = driveStop();
			bState = get_next_state(retVal, SM_WAIT, SM_STOP_FAULT);
			break;
			
		case SM_WAIT:
			retVal = driveWait();
			bState = get_next_state(retVal, SM_IDLE, SM_WAIT_FAULT);
			break;
			
		case SM_FAULT:
			if (FaultingState != SM_NO_FAULT)
			{
				// Corrective drive actions accordingly the origin state
				// ...
				FaultingState = SM_NO_FAULT;
			}
			bState = get_next_state(FUNCTION_ENDED, SM_IDLE, 0);
			break;
	}
}
