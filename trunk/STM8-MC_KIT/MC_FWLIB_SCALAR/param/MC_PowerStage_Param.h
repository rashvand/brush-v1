// Power Stage parameters

#ifndef __POWER_STAGE_PARAM_H
#define __POWER_STAGE_PARAM_H

#define RS_M 	10 // mOhm, resistenza in milliohm del current sense
#define AOP 	11 // messo a 11 come indicato nello schematico, guadagno dell'opamp per il current sense

//#define DISSIPATIVE_BRAKE // Uncomment to enable

/*
#define DISSIPATIVE_BRAKE_ACTIVE_HIGH 0
#define DISSIPATIVE_BRAKE_ACTIVE_LOW  1

#define DISSIPATIVE_BRAKE_POL DISSIPATIVE_BRAKE_ACTIVE_HIGH
*/

//BLDC drive: comment to drive the lowsides with GPIOs
//						uncomment to drive the lowsides with an advanced timer
//ACIM drive: comment to drive the lowsides with dedicated hardware
//						uncomment to drive the lowsides with an advanced timer
//#define PWM_LOWSIDE_OUTPUT_ENABLE

#define BUS_ADC_CONV_RATIO  	0.153 // DC bus voltage partitioning ratio: modificato: R71/(R71+R22)
#define EXPECTED_MCU_VOLTAGE 	3.4  	// modificato come da vcc di BRUSH
#define BUSV_CONVERSION (EXPECTED_MCU_VOLTAGE/BUS_ADC_CONV_RATIO)
#define MAX_BUS_VOLTAGE 	20 	//Volts: modificato
#define MIN_BUS_VOLTAGE 	5 	//Volts: modificato

#define ACTIVE_HIGH 	1
#define ACTIVE_LOW 		0
#define ACTIVE 				1
#define INACTIVE 			0

#define PWM_U_HIGH_SIDE_POLARITY			ACTIVE_HIGH
#define PWM_U_LOW_SIDE_POLARITY				ACTIVE_HIGH
#define PWM_U_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_U_LOW_SIDE_IDLE_STATE			INACTIVE

#define PWM_V_HIGH_SIDE_POLARITY			ACTIVE_HIGH
#define PWM_V_LOW_SIDE_POLARITY				ACTIVE_HIGH
#define PWM_V_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_V_LOW_SIDE_IDLE_STATE			INACTIVE

#define PWM_W_HIGH_SIDE_POLARITY			ACTIVE_HIGH
#define PWM_W_LOW_SIDE_POLARITY				ACTIVE_HIGH
#define PWM_W_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_W_LOW_SIDE_IDLE_STATE			INACTIVE 

// questo lo tolgo, non usato
// BRK_INPUT settings
// #define BKIN_POLARITY	ACTIVE_LOW

#endif /* __POWER_STAGE_PARAM_H */
