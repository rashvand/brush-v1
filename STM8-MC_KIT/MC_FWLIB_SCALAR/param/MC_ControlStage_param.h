// Control stage configuartion

#ifndef __MC_CONTROLSTAGE_PARAM_H
#define __MC_CONTROLSTAGE_PARAM_H

#include "MC_stm8s_clk_param.h"

// tolto display e anche joystick
// Configuartion
//#define DISPLAY

// usare una delle 2 che segue??
//#define SET_TARGET_SPEED_BY_POTENTIOMETER
#define AUTO_START_UP

/*Comment to disable OPTION bite programming*/
#define ENABLE_OPTION_BYTE_PROGRAMMING

// questo ci vuole in quanto il pwm sui low side è sulla PORTB
// nota del manuale:
// This remapping is necessary if the STM8S features less than 80 pins.
#define TIM1_CHxN_REMAP

// BRK settings
//Comment this define statement to disable the emergency input feature
//#define BKIN

#include "MC_stm8s_port_param.h"

#endif /*__MC_CONTROLSTAGE_PARAM_H*/
