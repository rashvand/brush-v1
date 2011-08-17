   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  48                     ; 53 @near @interrupt void NonHandledInterrupt(void)
  48                     ; 54 {
  50                     	switch	.text
  51  0000               _NonHandledInterrupt:
  55                     ; 58   return;
  58  0000 80            	iret	
  81                     ; 71 @near @interrupt void TRAP_IRQHandler(void)
  81                     ; 72 {
  82                     	switch	.text
  83  0001               _TRAP_IRQHandler:
  87                     ; 76   return;
  90  0001 80            	iret	
 113                     ; 89 @near @interrupt void TLI_IRQHandler (void)
 113                     ; 90 {
 114                     	switch	.text
 115  0002               _TLI_IRQHandler:
 119                     ; 94   return;
 122  0002 80            	iret	
 145                     ; 107 @near @interrupt void AWU_IRQHandler (void)
 145                     ; 108 {
 146                     	switch	.text
 147  0003               _AWU_IRQHandler:
 151                     ; 112   return;
 154  0003 80            	iret	
 177                     ; 125 @near @interrupt void CLK_IRQHandler (void)
 177                     ; 126 {
 178                     	switch	.text
 179  0004               _CLK_IRQHandler:
 183                     ; 130   return;
 186  0004 80            	iret	
 210                     ; 143 @near @interrupt void EXTI_PORTA_IRQHandler (void)
 210                     ; 144 {
 211                     	switch	.text
 212  0005               _EXTI_PORTA_IRQHandler:
 216                     ; 148   return;
 219  0005 80            	iret	
 243                     ; 161 @near @interrupt void EXTI_PORTB_IRQHandler (void)
 243                     ; 162 {
 244                     	switch	.text
 245  0006               _EXTI_PORTB_IRQHandler:
 249                     ; 166   return;
 252  0006 80            	iret	
 276                     ; 179 @near @interrupt void EXTI_PORTC_IRQHandler (void)
 276                     ; 180 {
 277                     	switch	.text
 278  0007               _EXTI_PORTC_IRQHandler:
 282                     ; 184   return;
 285  0007 80            	iret	
 309                     ; 197 @near @interrupt void EXTI_PORTD_IRQHandler (void)
 309                     ; 198 {
 310                     	switch	.text
 311  0008               _EXTI_PORTD_IRQHandler:
 315                     ; 202   return;
 318  0008 80            	iret	
 342                     ; 215 @near @interrupt void EXTI_PORTE_IRQHandler (void)
 342                     ; 216 {
 343                     	switch	.text
 344  0009               _EXTI_PORTE_IRQHandler:
 348                     ; 220   return;
 351  0009 80            	iret	
 374                     ; 233 @near @interrupt void CAN_RX_IRQHandler (void)
 374                     ; 234 {
 375                     	switch	.text
 376  000a               _CAN_RX_IRQHandler:
 380                     ; 238   return;
 383  000a 80            	iret	
 406                     ; 251 @near @interrupt void CAN_TX_IRQHandler (void)
 406                     ; 252 {
 407                     	switch	.text
 408  000b               _CAN_TX_IRQHandler:
 412                     ; 256   return;
 415  000b 80            	iret	
 438                     ; 269 @near @interrupt void SPI_IRQHandler (void)
 438                     ; 270 {
 439                     	switch	.text
 440  000c               _SPI_IRQHandler:
 444                     ; 274   return;
 447  000c 80            	iret	
 471                     ; 290 @near @interrupt void TIM1_CAP_COM_IRQHandler (void)
 471                     ; 291 {
 472                     	switch	.text
 473  000d               _TIM1_CAP_COM_IRQHandler:
 477                     ; 295   return;
 480  000d 80            	iret	
 504                     ; 309 @near @interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
 504                     ; 310 {
 505                     	switch	.text
 506  000e               _TIM2_UPD_OVF_BRK_IRQHandler:
 510                     ; 314   return;
 513  000e 80            	iret	
 537                     ; 329 @near @interrupt void TIM2_CAP_COM_IRQHandler (void)
 537                     ; 330 {
 538                     	switch	.text
 539  000f               _TIM2_CAP_COM_IRQHandler:
 543                     ; 334   return;
 546  000f 80            	iret	
 570                     ; 349 @near @interrupt void TIM3_UPD_OVF_BRK_IRQHandler (void)
 570                     ; 350 {
 571                     	switch	.text
 572  0010               _TIM3_UPD_OVF_BRK_IRQHandler:
 576                     ; 354   return;
 579  0010 80            	iret	
 603                     ; 359 @near @interrupt void TIM3_CAP_COM_IRQHandler (void)
 603                     ; 360 {
 604                     	switch	.text
 605  0011               _TIM3_CAP_COM_IRQHandler:
 609                     ; 364   return;
 612  0011 80            	iret	
 636                     ; 378 @near @interrupt void UART1_TX_IRQHandler (void)
 636                     ; 379 {
 637                     	switch	.text
 638  0012               _UART1_TX_IRQHandler:
 642                     ; 383   return;
 645  0012 80            	iret	
 669                     ; 396 @near @interrupt void UART1_RX_IRQHandler (void)
 669                     ; 397 {
 670                     	switch	.text
 671  0013               _UART1_RX_IRQHandler:
 675                     ; 401   return;
 678  0013 80            	iret	
 701                     ; 414 @near @interrupt void I2C_IRQHandler (void)
 701                     ; 415 {
 702                     	switch	.text
 703  0014               _I2C_IRQHandler:
 707                     ; 419   return;
 710  0014 80            	iret	
 734                     ; 432 @near @interrupt void UART2_TX_IRQHandler (void)
 734                     ; 433 {
 735                     	switch	.text
 736  0015               _UART2_TX_IRQHandler:
 740                     ; 437     return;
 743  0015 80            	iret	
 767                     ; 450 @near @interrupt void UART2_RX_IRQHandler (void)
 767                     ; 451 {
 768                     	switch	.text
 769  0016               _UART2_RX_IRQHandler:
 773                     ; 455     return;
 776  0016 80            	iret	
 800                     ; 468 @near @interrupt void UART3_TX_IRQHandler (void)
 800                     ; 469 {
 801                     	switch	.text
 802  0017               _UART3_TX_IRQHandler:
 806                     ; 473     return;
 809  0017 80            	iret	
 833                     ; 486 @near @interrupt void UART3_RX_IRQHandler (void)
 833                     ; 487 {
 834                     	switch	.text
 835  0018               _UART3_RX_IRQHandler:
 839                     ; 491     return;
 842  0018 80            	iret	
 865                     ; 504 @near @interrupt void ADC1_IRQHandler (void)
 865                     ; 505 {
 866                     	switch	.text
 867  0019               _ADC1_IRQHandler:
 871                     ; 510     return;
 874  0019 80            	iret	
 898                     ; 526 @near @interrupt void EEPROM_EEC_IRQHandler (void)
 898                     ; 527 {
 899                     	switch	.text
 900  001a               _EEPROM_EEC_IRQHandler:
 904                     ; 531   return;
 907  001a 80            	iret	
 920                     	xdef	_TRAP_IRQHandler
 921                     	xdef	_TLI_IRQHandler
 922                     	xdef	_AWU_IRQHandler
 923                     	xdef	_CLK_IRQHandler
 924                     	xdef	_EXTI_PORTA_IRQHandler
 925                     	xdef	_EXTI_PORTB_IRQHandler
 926                     	xdef	_EXTI_PORTC_IRQHandler
 927                     	xdef	_EXTI_PORTD_IRQHandler
 928                     	xdef	_EXTI_PORTE_IRQHandler
 929                     	xdef	_CAN_RX_IRQHandler
 930                     	xdef	_CAN_TX_IRQHandler
 931                     	xdef	_SPI_IRQHandler
 932                     	xdef	_TIM1_CAP_COM_IRQHandler
 933                     	xdef	_TIM2_UPD_OVF_BRK_IRQHandler
 934                     	xdef	_TIM2_CAP_COM_IRQHandler
 935                     	xdef	_TIM3_UPD_OVF_BRK_IRQHandler
 936                     	xdef	_TIM3_CAP_COM_IRQHandler
 937                     	xdef	_UART1_TX_IRQHandler
 938                     	xdef	_UART1_RX_IRQHandler
 939                     	xdef	_I2C_IRQHandler
 940                     	xdef	_UART2_TX_IRQHandler
 941                     	xdef	_UART2_RX_IRQHandler
 942                     	xdef	_UART3_TX_IRQHandler
 943                     	xdef	_UART3_RX_IRQHandler
 944                     	xdef	_ADC1_IRQHandler
 945                     	xdef	_EEPROM_EEC_IRQHandler
 946                     	xdef	_NonHandledInterrupt
 965                     	end
