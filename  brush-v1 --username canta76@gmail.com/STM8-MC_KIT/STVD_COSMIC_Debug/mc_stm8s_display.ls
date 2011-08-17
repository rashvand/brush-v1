   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
 339                     .const:	section	.text
 340  0000               L41:
 341  0000 00009c40      	dc.l	40000
 342                     ; 31 void dev_displayInit(pvdev_device_t pdevice)
 342                     ; 32 {
 343                     	scross	off
 344                     	switch	.text
 345  0000               _dev_displayInit:
 347  0000 89            	pushw	x
 348  0001 89            	pushw	x
 349       00000002      OFST:	set	2
 352                     ; 35 	pbuffer = pdevice->mems.m8;
 354  0002 ee09          	ldw	x,(9,x)
 355  0004 bf03          	ldw	L3_pbuffer,x
 356                     ; 36 	bufferSize = pdevice->mems.m8size;
 358  0006 1e03          	ldw	x,(OFST+1,sp)
 359  0008 ee0f          	ldw	x,(15,x)
 360  000a bf01          	ldw	L5_bufferSize,x
 361                     ; 39 	SPI_DeInit();
 363  000c cd0000        	call	_SPI_DeInit
 365                     ; 41 	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_32, SPI_MODE_MASTER,
 365                     ; 42 						SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_1LINE_TX,
 365                     ; 43 						SPI_NSS_SOFT, 0x07);
 367  000f 4b07          	push	#7
 368  0011 4b02          	push	#2
 369  0013 4bc0          	push	#192
 370  0015 4b01          	push	#1
 371  0017 4b02          	push	#2
 372  0019 4b04          	push	#4
 373  001b ae0020        	ldw	x,#32
 374  001e cd0000        	call	_SPI_Init
 376  0021 5b06          	addw	sp,#6
 377                     ; 44 	SPI_Cmd(ENABLE);
 379  0023 a601          	ld	a,#1
 380  0025 cd0000        	call	_SPI_Cmd
 382                     ; 47 	for (i=0; i<40000; i++)
 384  0028 5f            	clrw	x
 385  0029 1f01          	ldw	(OFST-1,sp),x
 386  002b               L702:
 389  002b 1e01          	ldw	x,(OFST-1,sp)
 390  002d 5c            	incw	x
 391  002e 1f01          	ldw	(OFST-1,sp),x
 394  0030 cd0000        	call	c_uitolx
 396  0033 ae0000        	ldw	x,#L41
 397  0036 cd0000        	call	c_lcmp
 399  0039 2ff0          	jrslt	L702
 400                     ; 53 	LCD_Init();
 402  003b cd0000        	call	_LCD_Init
 404                     ; 55 	dev_displayClear();
 406  003e ad03          	call	_dev_displayClear
 408                     ; 56 }
 411  0040 5b04          	addw	sp,#4
 412  0042 81            	ret	
 436                     ; 58 void dev_displayClear(void)
 436                     ; 59 {
 437                     	switch	.text
 438  0043               _dev_displayClear:
 442                     ; 60 	LCD_Clear();
 445                     ; 61 }
 448  0043 cc0000        	jp	_LCD_Clear
 451                     	switch	.ubsct
 452  0000               L522_i:
 453  0000 00            	ds.b	1
 489                     ; 63 void dev_displayFlush(void)
 489                     ; 64 {
 490                     	switch	.text
 491  0046               _dev_displayFlush:
 495                     ; 67 	LCD_Clear();
 497  0046 cd0000        	call	_LCD_Clear
 499                     ; 69 	LCD_SetCursorPos(LCD_LINE1,0);
 501  0049 ae8000        	ldw	x,#32768
 502  004c cd0000        	call	_LCD_SetCursorPos
 504                     ; 70 	for (i=0;i<15;i++)
 506  004f 4f            	clr	a
 507  0050 b700          	ld	L522_i,a
 508  0052               L542:
 509                     ; 72 		LCD_PrintChar(pbuffer[i]);
 511  0052 5f            	clrw	x
 512  0053 97            	ld	xl,a
 513  0054 92d603        	ld	a,([L3_pbuffer.w],x)
 514  0057 cd0000        	call	_LCD_PrintChar
 516                     ; 70 	for (i=0;i<15;i++)
 518  005a 3c00          	inc	L522_i
 521  005c b600          	ld	a,L522_i
 522  005e a10f          	cp	a,#15
 523  0060 25f0          	jrult	L542
 524                     ; 74 	LCD_SetCursorPos(LCD_LINE2,0);
 526  0062 ae9000        	ldw	x,#36864
 527  0065 cd0000        	call	_LCD_SetCursorPos
 529                     ; 75 	for (i=0;i<15;i++)
 531  0068 4f            	clr	a
 532  0069 b700          	ld	L522_i,a
 533  006b               L352:
 534                     ; 77 		LCD_PrintChar(pbuffer[i+15]);
 536  006b 5f            	clrw	x
 537  006c 97            	ld	xl,a
 538  006d 72bb0003      	addw	x,L3_pbuffer
 539  0071 e60f          	ld	a,(15,x)
 540  0073 cd0000        	call	_LCD_PrintChar
 542                     ; 75 	for (i=0;i<15;i++)
 544  0076 3c00          	inc	L522_i
 547  0078 b600          	ld	a,L522_i
 548  007a a10f          	cp	a,#15
 549  007c 25ed          	jrult	L352
 550                     ; 79 }
 553  007e 81            	ret	
 579                     ; 81 void dev_displayPrintch()
 579                     ; 82 {
 580                     	switch	.text
 581  007f               _dev_displayPrintch:
 585                     ; 83 	if (pbuffer[DISPLAYLINE_ADDR] == 1)
 587  007f be03          	ldw	x,L3_pbuffer
 588  0081 e61e          	ld	a,(30,x)
 589  0083 4a            	dec	a
 590  0084 2608          	jrne	L172
 591                     ; 85 		LCD_SetCursorPos(LCD_LINE1,(u8)(pbuffer[DISPLAYPOS_ADDR] >> 1));
 593  0086 e61f          	ld	a,(31,x)
 594  0088 44            	srl	a
 595  0089 97            	ld	xl,a
 596  008a a680          	ld	a,#128
 599  008c 2006          	jra	L372
 600  008e               L172:
 601                     ; 89 		LCD_SetCursorPos(LCD_LINE2,(u8)(pbuffer[DISPLAYPOS_ADDR] >> 1));
 603  008e e61f          	ld	a,(31,x)
 604  0090 44            	srl	a
 605  0091 97            	ld	xl,a
 606  0092 a690          	ld	a,#144
 608  0094               L372:
 609  0094 95            	ld	xh,a
 610  0095 cd0000        	call	_LCD_SetCursorPos
 611                     ; 91 	LCD_PrintChar(pbuffer[DISPLAYCH_ADDR]);
 613  0098 be03          	ldw	x,L3_pbuffer
 614  009a e620          	ld	a,(32,x)
 616                     ; 92 }
 619  009c cc0000        	jp	_LCD_PrintChar
 653                     	switch	.ubsct
 654  0001               L5_bufferSize:
 655  0001 0000          	ds.b	2
 656  0003               L3_pbuffer:
 657  0003 0000          	ds.b	2
 658                     	xdef	_dev_displayPrintch
 659                     	xdef	_dev_displayFlush
 660                     	xdef	_dev_displayClear
 661                     	xdef	_dev_displayInit
 662                     	xref	_LCD_PrintChar
 663                     	xref	_LCD_SetCursorPos
 664                     	xref	_LCD_Clear
 665                     	xref	_LCD_Init
 666                     	xref	_SPI_Cmd
 667                     	xref	_SPI_Init
 668                     	xref	_SPI_DeInit
 688                     	xref	c_lcmp
 689                     	xref	c_uitolx
 690                     	end
