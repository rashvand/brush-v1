// Common prototype definition for low level drive

#ifndef __MC_DEV_DRIVE_H__
#define __MC_DEV_DRIVE_H__

/* Inlcudes ****************************/
#include "vdev.h"
#include "MC_dev.h"

/* Exported functions ******************/
void dev_driveInit(pvdev_device_t pdevice);
MC_FuncRetVal_t dev_driveStartUpInit(void);
MC_FuncRetVal_t dev_driveStartUp(void);
MC_FuncRetVal_t dev_driveRun(void);
MC_FuncRetVal_t dev_driveStop(void);
MC_FuncRetVal_t dev_driveWait(void);

#endif  /* __MC_DEV_DRIVE_H__ */
