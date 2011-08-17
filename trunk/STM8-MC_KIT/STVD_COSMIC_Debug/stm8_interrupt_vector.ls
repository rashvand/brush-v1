   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     .const:	section	.text
  20  0000               __vectab:
  21  0000 8200          	dc.w	-32256
  23  0002 0000          	dc.w	__stext
  24  0004 8200          	dc.w	-32256
  26  0006 0000          	dc.w	_TRAP_IRQHandler
  27  0008 8200          	dc.w	-32256
  29  000a 0000          	dc.w	_TLI_IRQHandler
  30  000c 8200          	dc.w	-32256
  32  000e 0000          	dc.w	_AWU_IRQHandler
  33  0010 8200          	dc.w	-32256
  35  0012 0000          	dc.w	_CLK_IRQHandler
  36  0014 8200          	dc.w	-32256
  38  0016 0000          	dc.w	_EXTI_PORTA_IRQHandler
  39  0018 8200          	dc.w	-32256
  41  001a 0000          	dc.w	_EXTI_PORTB_IRQHandler
  42  001c 8200          	dc.w	-32256
  44  001e 0000          	dc.w	_EXTI_PORTC_IRQHandler
  45  0020 8200          	dc.w	-32256
  47  0022 0000          	dc.w	_EXTI_PORTD_IRQHandler
  48  0024 8200          	dc.w	-32256
  50  0026 0000          	dc.w	_EXTI_PORTE_IRQHandler
  51  0028 8200          	dc.w	-32256
  53  002a 0000          	dc.w	_CAN_RX_IRQHandler
  54  002c 8200          	dc.w	-32256
  56  002e 0000          	dc.w	_CAN_TX_IRQHandler
  57  0030 8200          	dc.w	-32256
  59  0032 0000          	dc.w	_SPI_IRQHandler
  60  0034 8200          	dc.w	-32256
  62  0036 0000          	dc.w	_TIM1_UPD_OVF_TRG_BRK_IRQHandler
  63  0038 8200          	dc.w	-32256
  65  003a 0000          	dc.w	_TIM1_CAP_COM_IRQHandler
  66  003c 8200          	dc.w	-32256
  68  003e 0000          	dc.w	_TIM2_UPD_OVF_BRK_IRQHandler
  69  0040 8200          	dc.w	-32256
  71  0042 0000          	dc.w	_TIM2_CAP_COM_IRQHandler
  72  0044 8200          	dc.w	-32256
  74  0046 0000          	dc.w	_TIM3_UPD_OVF_BRK_IRQHandler
  75  0048 8200          	dc.w	-32256
  77  004a 0000          	dc.w	_TIM3_CAP_COM_IRQHandler
  78  004c 8200          	dc.w	-32256
  80  004e 0000          	dc.w	_UART1_TX_IRQHandler
  81  0050 8200          	dc.w	-32256
  83  0052 0000          	dc.w	_UART1_RX_IRQHandler
  84  0054 8200          	dc.w	-32256
  86  0056 0000          	dc.w	_I2C_IRQHandler
  87  0058 8200          	dc.w	-32256
  89  005a 0000          	dc.w	_UART3_TX_IRQHandler
  90  005c 8200          	dc.w	-32256
  92  005e 0000          	dc.w	_UART3_RX_IRQHandler
  93  0060 8200          	dc.w	-32256
  95  0062 0000          	dc.w	_ADC2_IRQHandler
  96  0064 8200          	dc.w	-32256
  98  0066 0000          	dc.w	_TIM4_UPD_OVF_IRQHandler
  99  0068 8200          	dc.w	-32256
 101  006a 0000          	dc.w	_EEPROM_EEC_IRQHandler
 102  006c 8200          	dc.w	-32256
 104  006e 0000          	dc.w	_NonHandledInterrupt
 105  0070 8200          	dc.w	-32256
 107  0072 0000          	dc.w	_NonHandledInterrupt
 108  0074 8200          	dc.w	-32256
 110  0076 0000          	dc.w	_NonHandledInterrupt
 111  0078 8200          	dc.w	-32256
 113  007a 0000          	dc.w	_NonHandledInterrupt
 114  007c 8200          	dc.w	-32256
 116  007e 0000          	dc.w	_NonHandledInterrupt
 150                     	xdef	__vectab
 151                     	xref	__stext
 152                     	xref	_TRAP_IRQHandler
 153                     	xref	_TLI_IRQHandler
 154                     	xref	_AWU_IRQHandler
 155                     	xref	_CLK_IRQHandler
 156                     	xref	_EXTI_PORTA_IRQHandler
 157                     	xref	_EXTI_PORTB_IRQHandler
 158                     	xref	_EXTI_PORTC_IRQHandler
 159                     	xref	_EXTI_PORTD_IRQHandler
 160                     	xref	_EXTI_PORTE_IRQHandler
 161                     	xref	_CAN_RX_IRQHandler
 162                     	xref	_CAN_TX_IRQHandler
 163                     	xref	_SPI_IRQHandler
 164                     	xref	_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 165                     	xref	_TIM1_CAP_COM_IRQHandler
 166                     	xref	_TIM2_UPD_OVF_BRK_IRQHandler
 167                     	xref	_TIM2_CAP_COM_IRQHandler
 168                     	xref	_TIM3_UPD_OVF_BRK_IRQHandler
 169                     	xref	_TIM3_CAP_COM_IRQHandler
 170                     	xref	_UART1_TX_IRQHandler
 171                     	xref	_UART1_RX_IRQHandler
 172                     	xref	_I2C_IRQHandler
 173                     	xref	_UART3_TX_IRQHandler
 174                     	xref	_UART3_RX_IRQHandler
 175                     	xref	_ADC2_IRQHandler
 176                     	xref	_TIM4_UPD_OVF_IRQHandler
 177                     	xref	_EEPROM_EEC_IRQHandler
 178                     	xref	_NonHandledInterrupt
 197                     	end
