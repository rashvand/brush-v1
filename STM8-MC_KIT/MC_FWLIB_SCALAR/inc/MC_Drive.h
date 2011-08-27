// Common prototype definition for high level drive

#ifndef __MC_DRIVE_H
#define __MC_DRIVE_H

#include "vdev.h"
#include "MC_dev.h"

void driveInit(pvdev_device_t pdevice);

MC_FuncRetVal_t driveIdle(void);
MC_FuncRetVal_t driveStartUpInit(void);
MC_FuncRetVal_t driveStartUp(void);
MC_FuncRetVal_t driveRun(void);
MC_FuncRetVal_t driveStop(void);
MC_FuncRetVal_t driveWait(void);

#endif /* __MC_DRIVE_H */
