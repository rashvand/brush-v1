   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
 219                     ; 81 static NO_REG_SAVE void thread_shell (void)
 219                     ; 82 {
 221                     .text:	section	.text,new
 222  0000               L3_thread_shell:
 224  0000 89            	pushw	x
 225       00000002      OFST:	set	2
 228                     ; 86     curr_tcb = atomCurrentContext();
 230  0001 cd0000        	call	_atomCurrentContext
 232  0004 1f01          	ldw	(OFST-1,sp),x
 233                     ; 93     _asm("rim");
 236  0006 9a            rim
 238                     ; 101     if (curr_tcb && curr_tcb->entry_point)
 240  0007 1e01          	ldw	x,(OFST-1,sp)
 241  0009 271a          	jreq	L331
 243  000b 1e01          	ldw	x,(OFST-1,sp)
 244  000d e604          	ld	a,(4,x)
 245  000f ea03          	or	a,(3,x)
 246  0011 2712          	jreq	L331
 247                     ; 103         curr_tcb->entry_point(curr_tcb->entry_param);
 249  0013 1e01          	ldw	x,(OFST-1,sp)
 250  0015 9093          	ldw	y,x
 251  0017 ee07          	ldw	x,(7,x)
 252  0019 89            	pushw	x
 253  001a 93            	ldw	x,y
 254  001b ee05          	ldw	x,(5,x)
 255  001d 89            	pushw	x
 256  001e 1e05          	ldw	x,(OFST+3,sp)
 257  0020 ee03          	ldw	x,(3,x)
 258  0022 fd            	call	(x)
 260  0023 5b04          	addw	sp,#4
 261  0025               L331:
 262                     ; 108 }
 265  0025 85            	popw	x
 266  0026 81            	ret
 327                     ; 166 void archThreadContextInit (ATOM_TCB *tcb_ptr, void *stack_top, void (*entry_point)(uint32_t), uint32_t entry_param)
 327                     ; 167 {
 328                     .text:	section	.text,new
 329  0000               _archThreadContextInit:
 331  0000 89            	pushw	x
 332  0001 89            	pushw	x
 333       00000002      OFST:	set	2
 336                     ; 171     stack_ptr = (uint8_t *)stack_top;
 338  0002 1e07          	ldw	x,(OFST+5,sp)
 339  0004 1f01          	ldw	(OFST-1,sp),x
 340                     ; 188     *stack_ptr-- = (uint8_t)((uint16_t)thread_shell & 0xFF);
 342  0006 a600          	ld	a,#low(L3_thread_shell)
 343  0008 a4ff          	and	a,#255
 344  000a 1e01          	ldw	x,(OFST-1,sp)
 345  000c 1d0001        	subw	x,#1
 346  000f 1f01          	ldw	(OFST-1,sp),x
 347  0011 1c0001        	addw	x,#1
 348  0014 f7            	ld	(x),a
 349                     ; 189     *stack_ptr-- = (uint8_t)(((uint16_t)thread_shell >> 8) & 0xFF);
 351  0015 ae0000        	ldw	x,#L3_thread_shell
 352  0018 4f            	clr	a
 353  0019 01            	rrwa	x,a
 354  001a 9f            	ld	a,xl
 355  001b 1e01          	ldw	x,(OFST-1,sp)
 356  001d 1d0001        	subw	x,#1
 357  0020 1f01          	ldw	(OFST-1,sp),x
 358  0022 1c0001        	addw	x,#1
 359  0025 f7            	ld	(x),a
 360                     ; 225     tcb_ptr->sp_save_ptr = stack_ptr;
 362  0026 1e03          	ldw	x,(OFST+1,sp)
 363  0028 1601          	ldw	y,(OFST-1,sp)
 364  002a ff            	ldw	(x),y
 365                     ; 227 }
 368  002b 5b04          	addw	sp,#4
 369  002d 81            	ret
 397                     ; 237 void archInitSystemTickTimer ( void )
 397                     ; 238 {
 398                     .text:	section	.text,new
 399  0000               _archInitSystemTickTimer:
 403                     ; 240     TIM1_DeInit();
 405  0000 cd0000        	call	_TIM1_DeInit
 407                     ; 243     TIM1_TimeBaseInit(10000, TIM1_COUNTERMODE_UP, 1, 0);
 409  0003 4b00          	push	#0
 410  0005 ae0001        	ldw	x,#1
 411  0008 89            	pushw	x
 412  0009 4b00          	push	#0
 413  000b ae2710        	ldw	x,#10000
 414  000e cd0000        	call	_TIM1_TimeBaseInit
 416  0011 5b04          	addw	sp,#4
 417                     ; 246     TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
 419  0013 ae0101        	ldw	x,#257
 420  0016 cd0000        	call	_TIM1_ITConfig
 422                     ; 249     TIM1_Cmd(ENABLE);
 424  0019 a601          	ld	a,#1
 425  001b cd0000        	call	_TIM1_Cmd
 427                     ; 251 }
 430  001e 81            	ret
 456                     ; 293 INTERRUPT void TIM1_SystemTickISR (void)
 456                     ; 294 #if defined(__RCSTM8__)
 456                     ; 295 interrupt 11
 456                     ; 296 #endif
 456                     ; 297 {
 458                     .text:	section	.text,new
 459  0000               f_TIM1_SystemTickISR:
 461  0000 3b0002        	push	c_x+2
 462  0003 be00          	ldw	x,c_x
 463  0005 89            	pushw	x
 464  0006 3b0002        	push	c_y+2
 465  0009 be00          	ldw	x,c_y
 466  000b 89            	pushw	x
 467  000c be02          	ldw	x,c_lreg+2
 468  000e 89            	pushw	x
 469  000f be00          	ldw	x,c_lreg
 470  0011 89            	pushw	x
 473                     ; 299     atomIntEnter();
 475  0012 cd0000        	call	_atomIntEnter
 477                     ; 302     atomTimerTick();
 479  0015 cd0000        	call	_atomTimerTick
 481                     ; 305     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT_UPDATE);
 483  0018 35fe5255      	mov	21077,#254
 484                     ; 308     atomIntExit(TRUE);
 486  001c a601          	ld	a,#1
 487  001e cd0000        	call	_atomIntExit
 489                     ; 309 }
 492  0021 85            	popw	x
 493  0022 bf00          	ldw	c_lreg,x
 494  0024 85            	popw	x
 495  0025 bf02          	ldw	c_lreg+2,x
 496  0027 85            	popw	x
 497  0028 bf00          	ldw	c_y,x
 498  002a 320002        	pop	c_y+2
 499  002d 85            	popw	x
 500  002e bf00          	ldw	c_x,x
 501  0030 320002        	pop	c_x+2
 502  0033 80            	iret
 545                     ; 317 INTERRUPT void ADC1_ISR (void)
 545                     ; 318 {
 546                     .text:	section	.text,new
 547  0000               f_ADC1_ISR:
 549       00000001      OFST:	set	1
 550  0000 3b0002        	push	c_x+2
 551  0003 be00          	ldw	x,c_x
 552  0005 89            	pushw	x
 553  0006 3b0002        	push	c_y+2
 554  0009 be00          	ldw	x,c_y
 555  000b 89            	pushw	x
 556  000c be02          	ldw	x,c_lreg+2
 557  000e 89            	pushw	x
 558  000f be00          	ldw	x,c_lreg
 559  0011 89            	pushw	x
 560  0012 88            	push	a
 563                     ; 323     atomIntEnter();
 565  0013 cd0000        	call	_atomIntEnter
 567                     ; 330 	for(i=0; i<=9;i++)
 569  0016 0f01          	clr	(OFST+0,sp)
 570  0018               L322:
 571                     ; 332 			Conversion_Values[i] = ADC1_GetBufferValue(i);
 573  0018 7b01          	ld	a,(OFST+0,sp)
 574  001a cd0000        	call	_ADC1_GetBufferValue
 576  001d 7b01          	ld	a,(OFST+0,sp)
 577  001f 905f          	clrw	y
 578  0021 9097          	ld	yl,a
 579  0023 9058          	sllw	y
 580  0025 90df0000      	ldw	(_Conversion_Values,y),x
 581                     ; 330 	for(i=0; i<=9;i++)
 583  0029 0c01          	inc	(OFST+0,sp)
 586  002b 7b01          	ld	a,(OFST+0,sp)
 587  002d a10a          	cp	a,#10
 588  002f 25e7          	jrult	L322
 589                     ; 337 		 csr_temp = ADC1->CSR;
 591  0031 c65400        	ld	a,21504
 592  0034 6b01          	ld	(OFST+0,sp),a
 593                     ; 338 		 csr_temp &= (uint8_t)~ADC1_IT_EOC;
 595  0036 7b01          	ld	a,(OFST+0,sp)
 596  0038 a47f          	and	a,#127
 597  003a 6b01          	ld	(OFST+0,sp),a
 598                     ; 339 		 csr_temp |= (uint8_t)(ADC1_CHANNEL_9);
 600  003c 7b01          	ld	a,(OFST+0,sp)
 601  003e aa09          	or	a,#9
 602  0040 6b01          	ld	(OFST+0,sp),a
 603                     ; 340 		 ADC1->CSR = csr_temp;
 605  0042 7b01          	ld	a,(OFST+0,sp)
 606  0044 c75400        	ld	21504,a
 607                     ; 345 		ADC1_StartConversion();
 609  0047 cd0000        	call	_ADC1_StartConversion
 611                     ; 348     atomIntExit(TRUE);
 613  004a a601          	ld	a,#1
 614  004c cd0000        	call	_atomIntExit
 616                     ; 349 }
 619  004f 84            	pop	a
 620  0050 85            	popw	x
 621  0051 bf00          	ldw	c_lreg,x
 622  0053 85            	popw	x
 623  0054 bf02          	ldw	c_lreg+2,x
 624  0056 85            	popw	x
 625  0057 bf00          	ldw	c_y,x
 626  0059 320002        	pop	c_y+2
 627  005c 85            	popw	x
 628  005d bf00          	ldw	c_x,x
 629  005f 320002        	pop	c_x+2
 630  0062 80            	iret
 642                     	xref	_Conversion_Values
 643                     	xref	_TIM1_ITConfig
 644                     	xref	_TIM1_Cmd
 645                     	xref	_TIM1_TimeBaseInit
 646                     	xref	_TIM1_DeInit
 647                     	xref	_ADC1_GetBufferValue
 648                     	xref	_ADC1_StartConversion
 649                     	xdef	f_ADC1_ISR
 650                     	xdef	f_TIM1_SystemTickISR
 651                     	xdef	_archInitSystemTickTimer
 652                     	xref	_atomTimerTick
 653                     	xdef	_archThreadContextInit
 654                     	xref	_atomCurrentContext
 655                     	xref	_atomIntExit
 656                     	xref	_atomIntEnter
 657                     	xref.b	c_lreg
 658                     	xref.b	c_x
 659                     	xref.b	c_y
 678                     	end
