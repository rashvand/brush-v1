/*
 * Copyright (c) 2010, Kelvin Lawson. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. No personal names or organizations' names associated with the
 *    Atomthreads project may be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE ATOMTHREADS PROJECT AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE PROJECT OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */


#include <stdio.h>

#include "atom.h"
#include "atomport-private.h"
#include "atomport-tests.h"
#include "atomtests.h"
#include "atomtimer.h"
#include "uart.h"
#include "stm8s.h"

#include "lcd.h"

/* Constants */

/*
 * Idle thread stack size
 *
 * This needs to be large enough to handle any interrupt handlers
 * and callbacks called by interrupt handlers (e.g. user-created
 * timer callbacks) as well as the saving of all context when
 * switching away from this thread.
 *
 * In this case, the idle stack is allocated on the BSS via the
 * idle_thread_stack[] byte array.
 */
#define IDLE_STACK_SIZE_BYTES       128


/*
 * Main thread stack size
 *
 * Note that this is not a required OS kernel thread - you will replace
 * this with your own application thread.
 *
 * In this case the Main thread is responsible for calling out to the
 * test routines. Once a test routine has finished, the test status is
 * printed out on the UART and the thread remains running in a loop
 * flashing a LED.
 *
 * The Main thread stack generally needs to be larger than the idle
 * thread stack, as not only does it need to store interrupt handler
 * stack saves and context switch saves, but the application main thread
 * will generally be carrying out more nested function calls and require
 * stack for application code local variables etc.
 *
 * With all OS tests implemented to date on the STM8, the Main thread
 * stack has not exceeded 256 bytes. To allow all tests to run we set
 * a minimum main thread stack size of 204 bytes. This may increase in
 * future as the codebase changes but for the time being is enough to
 * cope with all of the automated tests.
 */
#define MAIN_STACK_SIZE_BYTES       256


/*
 * Startup code stack
 *
 * Some stack space is required at initial startup for running the main()
 * routine. This stack space is only temporarily required at first bootup
 * and is no longer required as soon as the OS is started. By default
 * Cosmic sets this to the top of RAM and it grows down from there.
 *
 * Because we only need this temporarily you may reuse the area once the
 * OS is started, and are free to use some area other than the top of RAM.
 * For convenience we just use the default region here.
 */


/* Linker-provided startup stack location (usually top of RAM) */
extern int _stack;


/* Local data */

/* Application threads' TCBs */
static ATOM_TCB main_tcb;

/* Main thread's stack area (large so place outside of the small page0 area on STM8) */
NEAR static uint8_t main_thread_stack[MAIN_STACK_SIZE_BYTES];

/* Idle thread's stack area (large so place outside of the small page0 area on STM8) */
NEAR static uint8_t idle_thread_stack[IDLE_STACK_SIZE_BYTES];


/* Forward declarations */
static void main_thread_func (uint32_t param);

/* Globals */
uint16_t Conversion_Values[10]; //ADC Converted values

/**
 * \b main
 *
 * Program entry point.
 *
 * Sets up the STM8 hardware resources (system tick timer interrupt) necessary
 * for the OS to be started. Creates an application thread and starts the OS.
 *
 * If the compiler supports it, stack space can be saved by preventing
 * the function from saving registers on entry. This is because we
 * are called directly by the C startup assembler, and know that we will
 * never return from here. The NO_REG_SAVE macro is used to denote such 
 * functions in a compiler-agnostic way, though not all compilers support it.
 *
 */
NO_REG_SAVE void main ( void )
{
    int8_t status;

    /**
     * Note: to protect OS structures and data during initialisation,
     * interrupts must remain disabled until the first thread
     * has been restored. They are reenabled at the very end of
     * the first thread restore, at which point it is safe for a
     * reschedule to take place.
     */

    /* Initialise the OS before creating our threads */
    status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE_BYTES - 1], IDLE_STACK_SIZE_BYTES);
    if (status == ATOM_OK)
    {
        /* Enable the system tick timer */
        archInitSystemTickTimer();

        /* Create an application thread */
        status = atomThreadCreate(&main_tcb,
                     TEST_THREAD_PRIO, main_thread_func, 0,
                     &main_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
                     MAIN_STACK_SIZE_BYTES);
        if (status == ATOM_OK)
        {
            /**
             * First application thread successfully created. It is
             * now possible to start the OS. Execution will not return
             * from atomOSStart(), which will restore the context of
             * our application thread and start executing it.
             *
             * Note that interrupts are still disabled at this point.
             * They will be enabled as we restore and execute our first
             * thread in archFirstThreadRestore().
             */
            atomOSStart();
        }
    }

    /* There was an error starting the OS if we reach here */
    while (1)
    {
    }

}


/**
 * \b main_thread_func
 *
 * Entry point for main application thread.
 *
 * This is the first thread that will be executed when the OS is started.
 *
 * @param[in] param Unused (optional thread entry parameter)
 *
 * @return None
 */
static void main_thread_func (uint32_t param)
{
    uint32_t test_status;
    int sleep_ticks;

    /* Compiler warnings */
    param = param;
		
		/* HSI CLK INIT */
		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
		
    /* Configure GPIO for flashing the STM8S Discovery LED on GPIO D0 */
    GPIO_DeInit(GPIOD);
		GPIO_DeInit(GPIOE);
		GPIO_DeInit(GPIOB);
		
    GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 1
		GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 2
		//GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 3
		//GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 4

		GPIO_Init(GPIOE, GPIO_PIN_6, 		GPIO_MODE_IN_FL_NO_IT);     //ain9
		GPIO_Init(GPIOE, GPIO_PIN_7, 		GPIO_MODE_IN_FL_NO_IT);     //ain8
		GPIO_Init(GPIOB, GPIO_PIN_ALL, 	GPIO_MODE_IN_FL_NO_IT); 		//ain0-ain7

    /* Initialise UART (115200bps) */
    if (uart_init(115200) != 0)
    {
        /* Error initialising UART */
    }

		ADC1_DeInit(); 
		
		/* Init ADC2 peripheral */
#if 0		
		ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
							ADC1_CHANNEL_9, 
							ADC1_PRESSEL_FCPU_D2, 
							ADC1_EXTTRIG_TIM, 
							DISABLE, 
							ADC1_ALIGN_LEFT, 
							ADC1_SCHMITTTRIG_ALL, 
							DISABLE); 
#else
		ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
							ADC1_CHANNEL_9, 
							ADC1_PRESSEL_FCPU_D2, 
							ADC1_EXTTRIG_TIM, 
							DISABLE, 
							ADC1_ALIGN_LEFT, 
							ADC1_SCHMITTTRIG_ALL, 
							DISABLE); 
#endif
		/* Enable SCAN mode conversion */
		ADC1_ScanModeCmd(ENABLE); //ENABLE
		
		/* Enable EOC interrupt */
    ADC1_ITConfig(ADC1_IT_EOCIE,ENABLE);

		// Enable the ADC: 1 -> ADON for the first time it just wakes the ADC up
		ADC1_Cmd(ENABLE);
		
		/*Start Conversion */
		ADC1_StartConversion();

#if 0 
		/* Initialize LCD */
		initLCD();
   
		LCD_LINE(1);
		LCD_STR("  AtomThreads   ");
		DelayMS(100);
		LCD_LINE(2);
		LCD_STR("  Antonio DR    ");
		DelayMS(100);

		/* generate clock for neg voltage generator */
		CLK_CCOCmd(ENABLE);

    /* Put a message out on the UART */
    printf("Go\n");

    /* Start test. All tests use the same start API. */
    test_status = test_start();
#endif

/* Check main thread stack usage (if enabled) */
#ifdef ATOM_STACK_CHECKING
    if (test_status == 0)
    {
        uint32_t used_bytes, free_bytes;

        /* Check idle thread stack usage */
        if (atomThreadStackCheck (&main_tcb, &used_bytes, &free_bytes) == ATOM_OK)
        {
            /* Check the thread did not use up to the end of stack */
            if (free_bytes == 0)
            {
                ///printf ("Main stack overflow\n");
                test_status++;
            }

            /* Log the stack usage */
#ifdef TESTS_LOG_STACK_USAGE
            ///printf ("MainUse:%d\n", (int)used_bytes);
#endif
        }

    }
#endif

#if 0
    /* Log final status */
    if (test_status == 0)
    {
        printf ("Pass\n");
    }
    else
    {
        printf ("Fail(%d)\n", (int)test_status);
    }
#endif

    /* Flash LED once per second if passed, very quickly if failed */
    //sleep_ticks = (test_status == 0) ? SYSTEM_TICKS_PER_SEC : (SYSTEM_TICKS_PER_SEC/8);
		sleep_ticks = SYSTEM_TICKS_PER_SEC;
		
    /* Test finished, flash slowly for pass, fast for fail */
    while (1)
    {
        /* Toggle LED on pin D0 (Discovery-specific) */
        GPIO_WriteReverse(GPIOD, GPIO_PIN_7);
				GPIO_WriteReverse(GPIOD, GPIO_PIN_2);
				GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
				GPIO_WriteReverse(GPIOE, GPIO_PIN_0);
				
				/* Print ADC value on serial port */
				printf("<ADC> %6u %6u %6u %6u %6u %6u %6u %6u %6u %6u </ADC>\r\n",
				Conversion_Values[0],
				Conversion_Values[1],
				Conversion_Values[2],
				Conversion_Values[3],
				Conversion_Values[4],
				Conversion_Values[5],
				Conversion_Values[6],
				Conversion_Values[7],
				Conversion_Values[8],
				Conversion_Values[9]);
				
        /* Sleep then toggle LED again */
        atomTimerDelay(sleep_ticks);
    }
}


