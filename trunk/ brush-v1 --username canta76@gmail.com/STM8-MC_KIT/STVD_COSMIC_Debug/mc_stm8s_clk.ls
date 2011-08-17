   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  50                     ; 29 void dev_clkInit(void)
  50                     ; 30 {
  52                     	switch	.text
  53  0000               _dev_clkInit:
  57                     ; 31 	CLK_DeInit();
  59  0000 cd0000        	call	_CLK_DeInit
  61                     ; 32 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  63  0003 a680          	ld	a,#128
  64  0005 cd0000        	call	_CLK_SYSCLKConfig
  66                     ; 47 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, DISABLE); 
  68  0008 4b00          	push	#0
  69  000a 4b00          	push	#0
  70  000c ae01b4        	ldw	x,#436
  71  000f cd0000        	call	_CLK_ClockSwitchConfig
  73  0012 85            	popw	x
  74                     ; 48 }
  77  0013 81            	ret	
  90                     	xdef	_dev_clkInit
  91                     	xref	_CLK_SYSCLKConfig
  92                     	xref	_CLK_ClockSwitchConfig
  93                     	xref	_CLK_DeInit
 112                     	end
