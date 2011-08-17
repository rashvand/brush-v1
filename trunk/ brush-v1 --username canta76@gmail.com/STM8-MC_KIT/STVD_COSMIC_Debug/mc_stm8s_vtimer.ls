   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  52                     ; 33 void dev_vtimerInit(void)
  52                     ; 34 {
  54                     	switch	.text
  55  0000               _dev_vtimerInit:
  59                     ; 35 	TIM4_DeInit();
  61  0000 cd0000        	call	_TIM4_DeInit
  63                     ; 38 	TIM4_TimeBaseInit(TIM4_PRESCALER_128,ARRVALUE); // Setting for 1ms Delta time
  65  0003 ae077d        	ldw	x,#1917
  66  0006 cd0000        	call	_TIM4_TimeBaseInit
  68                     ; 40 	ITC->ISPR6 |= 0xC0;
  70  0009 c67f75        	ld	a,32629
  71  000c aac0          	or	a,#192
  72  000e c77f75        	ld	32629,a
  73                     ; 41 	ITC->ISPR6 &= 0x7F;
  75                     ; 43 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  77  0011 ae0101        	ldw	x,#257
  78  0014 721f7f75      	bres	32629,#7
  79  0018 cd0000        	call	_TIM4_ITConfig
  81                     ; 44 	enableInterrupts();
  84  001b 9a            	rim	
  86                     ; 47 	TIM4_Cmd(ENABLE);
  89  001c a601          	ld	a,#1
  91                     ; 48 }
  94  001e cc0000        	jp	_TIM4_Cmd
 120                     ; 60 @near @interrupt @svlreg void TIM4_UPD_OVF_IRQHandler (void)
 120                     ; 61 {
 121                     	switch	.text
 122  0021               _TIM4_UPD_OVF_IRQHandler:
 124  0021 8a            	push	cc
 125  0022 84            	pop	a
 126  0023 a4bf          	and	a,#191
 127  0025 88            	push	a
 128  0026 86            	pop	cc
 129  0027 3b0002        	push	c_x+2
 130  002a be00          	ldw	x,c_x
 131  002c 89            	pushw	x
 132  002d 3b0002        	push	c_y+2
 133  0030 be00          	ldw	x,c_y
 134  0032 89            	pushw	x
 135  0033 be02          	ldw	x,c_lreg+2
 136  0035 89            	pushw	x
 137  0036 be00          	ldw	x,c_lreg
 138  0038 89            	pushw	x
 141                     ; 65 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 143  0039 a601          	ld	a,#1
 144  003b cd0000        	call	_TIM4_ClearITPendingBit
 146                     ; 66 	vtimer_UpdateHandler();
 148  003e cd0000        	call	_vtimer_UpdateHandler
 150                     ; 67 	return;
 153  0041 85            	popw	x
 154  0042 bf00          	ldw	c_lreg,x
 155  0044 85            	popw	x
 156  0045 bf02          	ldw	c_lreg+2,x
 157  0047 85            	popw	x
 158  0048 bf00          	ldw	c_y,x
 159  004a 320002        	pop	c_y+2
 160  004d 85            	popw	x
 161  004e bf00          	ldw	c_x,x
 162  0050 320002        	pop	c_x+2
 163  0053 80            	iret	
 176                     	xdef	_TIM4_UPD_OVF_IRQHandler
 177                     	xdef	_dev_vtimerInit
 178                     	xref	_vtimer_UpdateHandler
 179                     	xref	_TIM4_ClearITPendingBit
 180                     	xref	_TIM4_ITConfig
 181                     	xref	_TIM4_Cmd
 182                     	xref	_TIM4_TimeBaseInit
 183                     	xref	_TIM4_DeInit
 184                     	xref.b	c_lreg
 185                     	xref.b	c_x
 186                     	xref.b	c_y
 205                     	end
