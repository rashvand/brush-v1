#ifndef __BLDC_MTC_PARAM_H
#define __BLDC_MTC_PARAM_H

#include "MC_ControlStage_param.h"
#include "MC_PowerStage_param.h"

#define STM8_FREQ_MHZ 16
//#define STM8_FREQ_MHZ 24

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

// bemf adc rimappati
#define PHASE_A_BEMF_ADC_CHAN 			ADC2_CHANNEL_4	// PB4
#define PHASE_B_BEMF_ADC_CHAN 			ADC2_CHANNEL_5	// PB5
#define PHASE_C_BEMF_ADC_CHAN 			ADC2_CHANNEL_6	// PB6

// tensione batteria
#define ADC_BUS_CHANNEL							ADC2_CHANNEL_9	// BUS Voltage channel - PB3, spostato

// corrente sul motore
#define ADC_CURRENT_CHANNEL					ADC2_CHANNEL_7	// Current Feedback channel - PB7

// rimappato su PORT A
// Control PINS for samping during Ton
#define MCI_CONTROL_PINS 	(BIT4|BIT5|BIT6)
#define MCI_CONTROL_DDR 	GPIOA->DDR
#define MCI_CONTROL_DR  	GPIOA->ODR

/****************************************************************************************
*** Debug Pin Info **********************************************************************
*****************************************************************************************
board vista dal TOP: quarzo in alto, connessioni al motore a destra
sequenza di LED:
D10	UC_DEBUG3 -> AUTO_SWITCH
D11	UC_DEBUG4 -> PWM_ON_SW
D8	UC_DEBUG1 -> Z_DEBUG
D9	UC_DEBUG2 -> C_D_DEBUG
****************************************************************************************/

// Debug Pin
#define Z_DEBUG_PORT 			DEBUG0_PORT->ODR
#define Z_DEBUG_PIN  			DEBUG0_PIN

#define C_D_DEBUG_PORT 		DEBUG1_PORT->ODR
#define C_D_DEBUG_PIN  		DEBUG1_PIN

#define AUTO_SWITCH_PORT 	DEBUG2_PORT->ODR
#define AUTO_SWITCH_PIN  	DEBUG2_PIN

#define PWM_ON_SW_PORT 		DEBUG3_PORT->ODR
#define PWM_ON_SW_PIN  		DEBUG3_PIN

// rimappati questi pin
// anche se il pilotaggio dei low side deve essere fatto con TIM1_NCHx
// Low side GPIO Control settings
#define LS_A_PORT 	GPIOB
#define LS_A_PIN 		BIT0		// UC_PWM_UL
#define LS_B_PORT 	GPIOB
#define LS_B_PIN 		BIT1		// UC_PWM_VL
#define LS_C_PORT 	GPIOB
#define LS_C_PIN 		BIT2		// UC_PWM_WL

// sulla scheda non è previsto il comparatore
// eventuali limitazioni li facciamo direttamente con l'adc
// cercare ETR nel pdf della libreria
// ETR Setting
// #define ETR_INPUT

// questa sezione è disabilitata
#ifdef ETR_INPUT
	#ifndef TIM1_CHxN_REMAP
		#define ETR_PORT GPIOH
		#define ETR_PIN	BIT4
	#else
		#define ETR_PORT GPIOB
		#define ETR_PIN	BIT3
	#endif
#endif

#define CURRENT_FILTER_NOFILTER 0	// sampling is done at fMASTER.
#define CURRENT_FILTER_F_N2 1		//	fSAMPLING=fMASTER, N=2.
#define CURRENT_FILTER_F_N4 2		//	fSAMPLING=fMASTER, N=4.
#define CURRENT_FILTER_F_N8 3		// fSAMPLING=fMASTER, N=8.
#define CURRENT_FILTER_F2_N6 4		// fSAMPLING=fMASTER/2, N=6.
#define CURRENT_FILTER_F2_N8 5		// fSAMPLING=fMASTER/2, N=8.
#define CURRENT_FILTER_F4_N6 6		// fSAMPLING=fMASTER/4, N=6.
#define CURRENT_FILTER_F4_N8 7		// fSAMPLING=fMASTER/4, N=8.
#define CURRENT_FILTER_F8_N6 8		// fSAMPLING=fMASTER/8, N=6.
#define CURRENT_FILTER_F8_N8 9		// fSAMPLING=fMASTER/8, N=8.
#define CURRENT_FILTER_F16_N5 10	// fSAMPLING=fMASTER/16, N=5.
#define CURRENT_FILTER_F16_N6 11	// fSAMPLING=fMASTER/16, N=6.
#define CURRENT_FILTER_F16_N8 12	// fSAMPLING=fMASTER/16, N=8.
#define CURRENT_FILTER_F32_N5 13	// fSAMPLING=fMASTER/32, N=5.
#define CURRENT_FILTER_F32_N6 14	// fSAMPLING=fMASTER/32, N=6.
#define CURRENT_FILTER_F32_N8 15	// fSAMPLING=fMASTER/32, N=8.

#define CURRENT_FILTER CURRENT_FILTER_F8_N8

#define STEP_RAMP_SIZE 64

#define RAMP_VALUE0		(u16)		1470
#define RAMP_VALUE1		(u16)		609
#define RAMP_VALUE2		(u16)		467
#define RAMP_VALUE3		(u16)		394
#define RAMP_VALUE4		(u16)		347
#define RAMP_VALUE5		(u16)		314
#define RAMP_VALUE6		(u16)		288
#define RAMP_VALUE7		(u16)		268
#define RAMP_VALUE8		(u16)		252
#define RAMP_VALUE9		(u16)		238
#define RAMP_VALUE10	(u16)		227
#define RAMP_VALUE11	(u16)		217
#define RAMP_VALUE12	(u16)		208
#define RAMP_VALUE13	(u16)		200
#define RAMP_VALUE14	(u16)		193
#define RAMP_VALUE15	(u16)		187
#define RAMP_VALUE16	(u16)		181
#define RAMP_VALUE17	(u16)		176
#define RAMP_VALUE18	(u16)		171
#define RAMP_VALUE19	(u16)		166
#define RAMP_VALUE20	(u16)		162
#define RAMP_VALUE21	(u16)		158
#define RAMP_VALUE22	(u16)		155
#define RAMP_VALUE23	(u16)		152
#define RAMP_VALUE24	(u16)		148
#define RAMP_VALUE25	(u16)		146
#define RAMP_VALUE26	(u16)		143
#define RAMP_VALUE27	(u16)		140
#define RAMP_VALUE28	(u16)		138
#define RAMP_VALUE29	(u16)		135
#define RAMP_VALUE30	(u16)		133
#define RAMP_VALUE31	(u16)		131
#define RAMP_VALUE32	(u16)		129
#define RAMP_VALUE33	(u16)		127
#define RAMP_VALUE34	(u16)		125
#define RAMP_VALUE35	(u16)		123
#define RAMP_VALUE36	(u16)		122
#define RAMP_VALUE37	(u16)		120
#define RAMP_VALUE38	(u16)		118
#define RAMP_VALUE39	(u16)		117
#define RAMP_VALUE40	(u16)		115
#define RAMP_VALUE41	(u16)		114
#define RAMP_VALUE42	(u16)		113
#define RAMP_VALUE43	(u16)		111
#define RAMP_VALUE44	(u16)		110
#define RAMP_VALUE45	(u16)		109
#define RAMP_VALUE46	(u16)		108
#define RAMP_VALUE47	(u16)		107
#define RAMP_VALUE48	(u16)		106
#define RAMP_VALUE49	(u16)		104
#define RAMP_VALUE50	(u16)		103
#define RAMP_VALUE51	(u16)		102
#define RAMP_VALUE52	(u16)		101
#define RAMP_VALUE53	(u16)		100
#define RAMP_VALUE54	(u16)		100
#define RAMP_VALUE55	(u16)		99
#define RAMP_VALUE56	(u16)		98
#define RAMP_VALUE57	(u16)		97
#define RAMP_VALUE58	(u16)		96
#define RAMP_VALUE59	(u16)		95
#define RAMP_VALUE60	(u16)		94
#define RAMP_VALUE61	(u16)		94
#define RAMP_VALUE62	(u16)		93
#define RAMP_VALUE63	(u16)		92

#endif /* __BLDC_MTC_PARAM_H */
