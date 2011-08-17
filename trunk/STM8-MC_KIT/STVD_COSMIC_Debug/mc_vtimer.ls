   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  59                     ; 31 void vtimer_init()
  59                     ; 32 {
  61                     	switch	.text
  62  0000               _vtimer_init:
  64  0000 88            	push	a
  65       00000001      OFST:	set	1
  68                     ; 34 	for (i = 0; i < VTIMER_NUM; i++)
  70  0001 4f            	clr	a
  71  0002 6b01          	ld	(OFST+0,sp),a
  72  0004               L13:
  73                     ; 36 		sVtimer[i].msec = 0;
  75  0004 97            	ld	xl,a
  76  0005 a604          	ld	a,#4
  77  0007 42            	mul	x,a
  78  0008 905f          	clrw	y
  79  000a df0000        	ldw	(L3_sVtimer,x),y
  80                     ; 37 		sVtimer[i].pCallback = 0;
  82  000d df0002        	ldw	(L3_sVtimer+2,x),y
  83                     ; 34 	for (i = 0; i < VTIMER_NUM; i++)
  85  0010 0c01          	inc	(OFST+0,sp)
  88  0012 7b01          	ld	a,(OFST+0,sp)
  89  0014 a10b          	cp	a,#11
  90  0016 25ec          	jrult	L13
  91                     ; 39 }
  94  0018 84            	pop	a
  95  0019 81            	ret	
 240                     ; 41 void vtimer_SetTimer(VtimerName_t name,timer_res_t  msec,void* pCallback)
 240                     ; 42 {
 241                     	switch	.text
 242  001a               _vtimer_SetTimer:
 244  001a 88            	push	a
 245       00000000      OFST:	set	0
 248                     ; 43 	sVtimer[name].msec = msec;
 250  001b 97            	ld	xl,a
 251  001c a604          	ld	a,#4
 252  001e 42            	mul	x,a
 253  001f 1604          	ldw	y,(OFST+4,sp)
 254  0021 df0000        	ldw	(L3_sVtimer,x),y
 255                     ; 44 	sVtimer[name].pCallback = pCallback;
 257  0024 7b01          	ld	a,(OFST+1,sp)
 258  0026 97            	ld	xl,a
 259  0027 a604          	ld	a,#4
 260  0029 42            	mul	x,a
 261  002a 1606          	ldw	y,(OFST+6,sp)
 262  002c df0002        	ldw	(L3_sVtimer+2,x),y
 263                     ; 45 }
 266  002f 84            	pop	a
 267  0030 81            	ret	
 303                     ; 47 void vtimer_KillTimer(VtimerName_t name)
 303                     ; 48 {
 304                     	switch	.text
 305  0031               _vtimer_KillTimer:
 307  0031 88            	push	a
 308       00000000      OFST:	set	0
 311                     ; 49 	sVtimer[name].msec = 0;
 313  0032 97            	ld	xl,a
 314  0033 a604          	ld	a,#4
 315  0035 42            	mul	x,a
 316  0036 905f          	clrw	y
 317  0038 df0000        	ldw	(L3_sVtimer,x),y
 318                     ; 50 	sVtimer[name].pCallback = 0;
 320  003b 7b01          	ld	a,(OFST+1,sp)
 321  003d 97            	ld	xl,a
 322  003e a604          	ld	a,#4
 323  0040 42            	mul	x,a
 324                     ; 51 }
 327  0041 84            	pop	a
 328  0042 df0002        	ldw	(L3_sVtimer+2,x),y
 329  0045 81            	ret	
 366                     ; 53 u8 vtimer_TimerElapsed(VtimerName_t name)
 366                     ; 54 {
 367                     	switch	.text
 368  0046               _vtimer_TimerElapsed:
 372                     ; 55 	if (sVtimer[name].msec == 0)
 374  0046 97            	ld	xl,a
 375  0047 a604          	ld	a,#4
 376  0049 42            	mul	x,a
 377  004a d60001        	ld	a,(L3_sVtimer+1,x)
 378  004d da0000        	or	a,(L3_sVtimer,x)
 379  0050 2602          	jrne	L551
 380                     ; 56 		return TRUE;
 382  0052 4c            	inc	a
 385  0053 81            	ret	
 386  0054               L551:
 387                     ; 58 		return FALSE;
 389  0054 4f            	clr	a
 392  0055 81            	ret	
 428                     ; 63 void vtimer_UpdateHandler(void)
 428                     ; 64 {
 429                     	switch	.text
 430  0056               _vtimer_UpdateHandler:
 432  0056 88            	push	a
 433       00000001      OFST:	set	1
 436                     ; 68 	for (i = 0; i < VTIMER_NUM; i++)
 438  0057 4f            	clr	a
 439  0058 6b01          	ld	(OFST+0,sp),a
 440  005a               L771:
 441                     ; 70 		if (sVtimer[i].msec != 0)
 443  005a 97            	ld	xl,a
 444  005b a604          	ld	a,#4
 445  005d 42            	mul	x,a
 446  005e d60001        	ld	a,(L3_sVtimer+1,x)
 447  0061 da0000        	or	a,(L3_sVtimer,x)
 448  0064 2724          	jreq	L502
 449                     ; 72 			sVtimer[i].msec--;
 451  0066 9093          	ldw	y,x
 452  0068 de0000        	ldw	x,(L3_sVtimer,x)
 453  006b 5a            	decw	x
 454  006c 90df0000      	ldw	(L3_sVtimer,y),x
 455                     ; 73 			if (sVtimer[i].pCallback != 0)
 457  0070 7b01          	ld	a,(OFST+0,sp)
 458  0072 97            	ld	xl,a
 459  0073 a604          	ld	a,#4
 460  0075 42            	mul	x,a
 461  0076 d60003        	ld	a,(L3_sVtimer+3,x)
 462  0079 da0002        	or	a,(L3_sVtimer+2,x)
 463  007c 270c          	jreq	L502
 464                     ; 75 				if (sVtimer[i].msec == 0) 
 466  007e d60001        	ld	a,(L3_sVtimer+1,x)
 467  0081 da0000        	or	a,(L3_sVtimer,x)
 468  0084 2604          	jrne	L502
 469                     ; 77 					((PFN_Callback_t)sVtimer[i].pCallback)();
 471  0086 de0002        	ldw	x,(L3_sVtimer+2,x)
 472  0089 fd            	call	(x)
 474  008a               L502:
 475                     ; 68 	for (i = 0; i < VTIMER_NUM; i++)
 477  008a 0c01          	inc	(OFST+0,sp)
 480  008c 7b01          	ld	a,(OFST+0,sp)
 481  008e a10b          	cp	a,#11
 482  0090 25c8          	jrult	L771
 483                     ; 82 }
 486  0092 84            	pop	a
 487  0093 81            	ret	
 538                     	switch	.bss
 539  0000               L3_sVtimer:
 540  0000 000000000000  	ds.b	44
 541                     	xdef	_vtimer_UpdateHandler
 542                     	xdef	_vtimer_TimerElapsed
 543                     	xdef	_vtimer_KillTimer
 544                     	xdef	_vtimer_SetTimer
 545                     	xdef	_vtimer_init
 565                     	end
