#ifndef __MC_PORT_PARAM_H
#define __MC_PORT_PARAM_H

#include "MC_ControlStage_param.h"
#include "MC_PowerStage_param.h"

// verificati, ok
#define MCO1_PORT GPIOC
#define MCO1_PIN	GPIO_PIN_1
#define MCO3_PORT GPIOC
#define MCO3_PIN	GPIO_PIN_2
#define MCO5_PORT GPIOC
#define MCO5_PIN	GPIO_PIN_3

// questo è per il bkin, non usato
/*
#define MCO6_PORT GPIOE
#define MCO6_PIN	GPIO_PIN_3
*/

// TIM1_CHxN_REMAP è definito
// verificato il REMAP, ok su PORTB
#ifndef TIM1_CHxN_REMAP
	#define MCO0_PORT GPIOH
	#define MCO0_PIN	GPIO_PIN_7
	#define MCO2_PORT GPIOH
	#define MCO2_PIN	GPIO_PIN_6
	#define MCO4_PORT GPIOH
	#define MCO4_PIN	GPIO_PIN_5
#else
	#define MCO0_PORT GPIOB
	#define MCO0_PIN	GPIO_PIN_0
	#define MCO2_PORT GPIOB
	#define MCO2_PIN	GPIO_PIN_1
	#define MCO4_PORT GPIOB
	#define MCO4_PIN	GPIO_PIN_2
#endif

// qui ci mettiamo i LED
#define DEBUG0_PORT 	GPIOD
#define DEBUG0_PIN 		GPIO_PIN_7	// UC_DEBUG1
#define DEBUG1_PORT 	GPIOD
#define DEBUG1_PIN 		GPIO_PIN_2	// UC_DEBUG2
#define DEBUG2_PORT 	GPIOD
#define DEBUG2_PIN 		GPIO_PIN_0	// UC_DEBUG3
#define DEBUG3_PORT 	GPIOE
#define DEBUG3_PIN 		GPIO_PIN_0	// UC_DEBUG4


//della roba che segue non c'è niente ...
/*
// User interface configuration port/pin
#define KEY_UP_PORT GPIOB
#define KEY_UP_BIT  GPIO_PIN_6

#define KEY_DOWN_PORT GPIOB
#define KEY_DOWN_BIT  GPIO_PIN_7

#define KEY_RIGHT_PORT GPIOB
#define KEY_RIGHT_BIT  GPIO_PIN_5

#define KEY_LEFT_PORT  GPIOB
#define KEY_LEFT_BIT   GPIO_PIN_4

#define KEY_SEL_PORT   GPIOD
#define KEY_SEL_BIT    GPIO_PIN_7

#define USER_BUTTON_PORT GPIOC
#define USER_BUTTON_BIT  GPIO_PIN_0
*/

// questi non sono usati ....
// LCD Chip Select I/O definition
#define LCD_CS_PORT (GPIOF)
#define LCD_CS_PIN  (GPIO_PIN_0)

/*
// Brake command
#define DISSIPATIVE_BRAKE_PORT 	GPIOD
#define DISSIPATIVE_BRAKE_BIT 	GPIO_PIN_0
*/

#endif /* __MC_PORT_PARAM_H */
