// BLDC motor drive configuration

#ifndef __MC_BLDC_CONF_H
#define __MC_BLDC_CONF_H

// Configuartion

//#define HALL
#define SENSORLESS

#if (!defined SENSORLESS)&&(!defined HALL)
#error "Invalid configuration: No speed sensor selected"
#endif

#if (defined SENSORLESS)&&(defined HALL)
#error "Invalid configuration: Two speed sensor selected"
#endif

#endif /*__MC_BLDC_CONF_H*/
