   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
 330                     ; 44 void devInit(pvdev_device_t pdevice)
 330                     ; 45 {
 332                     	switch	.text
 333  0000               _devInit:
 335  0000 89            	pushw	x
 336       00000000      OFST:	set	0
 339                     ; 46 	pHWerrorOccurred_reg = (pdevice->regs.r16+VDEV_REG16_HW_ERROR_OCCURRED);
 341  0001 ee02          	ldw	x,(2,x)
 342  0003 1c0010        	addw	x,#16
 343  0006 bf02          	ldw	L3_pHWerrorOccurred_reg,x
 344                     ; 47 	pHWerrorActual_reg = (pdevice->regs.r16+VDEV_REG16_HW_ERROR_ACTUAL);
 346  0008 1e01          	ldw	x,(OFST+1,sp)
 347  000a ee02          	ldw	x,(2,x)
 348  000c 1c0012        	addw	x,#18
 349  000f bf00          	ldw	L5_pHWerrorActual_reg,x
 350                     ; 50 		dev_optInit();
 352  0011 cd0000        	call	_dev_optInit
 354                     ; 53 	dev_clkInit();
 356  0014 cd0000        	call	_dev_clkInit
 358                     ; 54 	dev_portInit();
 360  0017 cd0000        	call	_dev_portInit
 362                     ; 61 	dev_keysInit();  
 364  001a cd0000        	call	_dev_keysInit
 366                     ; 62 	dev_vtimerInit();
 368  001d cd0000        	call	_dev_vtimerInit
 370                     ; 63 }
 373  0020 85            	popw	x
 374  0021 81            	ret	
 438                     ; 65 MC_FuncRetVal_t devChkHWErr(void)
 438                     ; 66 {
 439                     	switch	.text
 440  0022               _devChkHWErr:
 442       00000001      OFST:	set	1
 445                     ; 69   if (*pHWerrorOccurred_reg == 0)
 447  0022 be02          	ldw	x,L3_pHWerrorOccurred_reg
 448  0024 88            	push	a
 449  0025 e601          	ld	a,(1,x)
 450  0027 fa            	or	a,(x)
 451  0028 2603          	jrne	L332
 452                     ; 71     a = FUNCTION_ENDED;
 454  002a 4c            	inc	a
 456  002b 2002          	jra	L532
 457  002d               L332:
 458                     ; 75     a = FUNCTION_ERROR;
 460  002d a602          	ld	a,#2
 461  002f               L532:
 462                     ; 78   return a;
 466  002f 5b01          	addw	sp,#1
 467  0031 81            	ret	
 504                     ; 81 MC_FuncRetVal_t devChkHWErrEnd(void)
 504                     ; 82 {
 505                     	switch	.text
 506  0032               _devChkHWErrEnd:
 508       00000001      OFST:	set	1
 511                     ; 85   if (*pHWerrorActual_reg == 0)
 513  0032 be00          	ldw	x,L5_pHWerrorActual_reg
 514  0034 88            	push	a
 515  0035 e601          	ld	a,(1,x)
 516  0037 fa            	or	a,(x)
 517  0038 2603          	jrne	L552
 518                     ; 87     a = FUNCTION_ENDED;
 520  003a 4c            	inc	a
 522  003b 2002          	jra	L752
 523  003d               L552:
 524                     ; 91     a = FUNCTION_ERROR;
 526  003d a602          	ld	a,#2
 527  003f               L752:
 528                     ; 94   return a;
 532  003f 5b01          	addw	sp,#1
 533  0041 81            	ret	
 557                     ; 97 void devChkHWErrClr(void)
 557                     ; 98 {
 558                     	switch	.text
 559  0042               _devChkHWErrClr:
 563                     ; 99   *pHWerrorOccurred_reg = 0;
 565  0042 5f            	clrw	x
 566  0043 92cf02        	ldw	[L3_pHWerrorOccurred_reg.w],x
 567                     ; 100 }
 570  0046 81            	ret	
 606                     	switch	.ubsct
 607  0000               L5_pHWerrorActual_reg:
 608  0000 0000          	ds.b	2
 609  0002               L3_pHWerrorOccurred_reg:
 610  0002 0000          	ds.b	2
 611                     	xref	_dev_vtimerInit
 612                     	xref	_dev_keysInit
 613                     	xref	_dev_portInit
 614                     	xref	_dev_clkInit
 615                     	xref	_dev_optInit
 616                     	xdef	_devChkHWErrClr
 617                     	xdef	_devChkHWErrEnd
 618                     	xdef	_devChkHWErr
 619                     	xdef	_devInit
 639                     	end
