   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     .const:	section	.text
  20  0000               _APR_Array:
  21  0000 00            	dc.b	0
  22  0001 1e            	dc.b	30
  23  0002 1e            	dc.b	30
  24  0003 1e            	dc.b	30
  25  0004 1e            	dc.b	30
  26  0005 1e            	dc.b	30
  27  0006 1e            	dc.b	30
  28  0007 1e            	dc.b	30
  29  0008 1e            	dc.b	30
  30  0009 1e            	dc.b	30
  31  000a 1e            	dc.b	30
  32  000b 1e            	dc.b	30
  33  000c 1e            	dc.b	30
  34  000d 3d            	dc.b	61
  35  000e 17            	dc.b	23
  36  000f 17            	dc.b	23
  37  0010 3e            	dc.b	62
  38  0011               _TBR_Array:
  39  0011 00            	dc.b	0
  40  0012 01            	dc.b	1
  41  0013 02            	dc.b	2
  42  0014 03            	dc.b	3
  43  0015 04            	dc.b	4
  44  0016 05            	dc.b	5
  45  0017 06            	dc.b	6
  46  0018 07            	dc.b	7
  47  0019 08            	dc.b	8
  48  001a 09            	dc.b	9
  49  001b 0a            	dc.b	10
  50  001c 0b            	dc.b	11
  51  001d 0c            	dc.b	12
  52  001e 0c            	dc.b	12
  53  001f 0e            	dc.b	14
  54  0020 0f            	dc.b	15
  55  0021 0f            	dc.b	15
  84                     ; 83 void AWU_DeInit(void)
  84                     ; 84 {
  86                     	switch	.text
  87  0000               _AWU_DeInit:
  91                     ; 85   AWU->CSR = AWU_CSR_RESET_VALUE;
  93  0000 725f50f0      	clr	20720
  94                     ; 86   AWU->APR = AWU_APR_RESET_VALUE;
  96  0004 353f50f1      	mov	20721,#63
  97                     ; 87   AWU->TBR = AWU_TBR_RESET_VALUE;
  99  0008 725f50f2      	clr	20722
 100                     ; 88 }
 103  000c 81            	ret	
 265                     ; 105 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 265                     ; 106 {
 266                     	switch	.text
 267  000d               _AWU_Init:
 269       00000000      OFST:	set	0
 272                     ; 109   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 274                     ; 112   AWU->CSR |= AWU_CSR_AWUEN;
 276  000d 721850f0      	bset	20720,#4
 277  0011 88            	push	a
 278                     ; 115   AWU->TBR &= (u8)(~AWU_TBR_AWUTB);
 280  0012 c650f2        	ld	a,20722
 281  0015 a4f0          	and	a,#240
 282  0017 c750f2        	ld	20722,a
 283                     ; 116   AWU->TBR |= TBR_Array[(u8)AWU_TimeBase];
 285  001a 5f            	clrw	x
 286  001b 7b01          	ld	a,(OFST+1,sp)
 287  001d 97            	ld	xl,a
 288  001e c650f2        	ld	a,20722
 289  0021 da0011        	or	a,(_TBR_Array,x)
 290  0024 c750f2        	ld	20722,a
 291                     ; 119   AWU->APR &= (u8)(~AWU_APR_APR);
 293  0027 c650f1        	ld	a,20721
 294  002a a4c0          	and	a,#192
 295  002c c750f1        	ld	20721,a
 296                     ; 120   AWU->APR |= APR_Array[(u8)AWU_TimeBase];
 298  002f 5f            	clrw	x
 299  0030 7b01          	ld	a,(OFST+1,sp)
 300  0032 97            	ld	xl,a
 301  0033 c650f1        	ld	a,20721
 302  0036 da0000        	or	a,(_APR_Array,x)
 303  0039 c750f1        	ld	20721,a
 304                     ; 122 }
 307  003c 84            	pop	a
 308  003d 81            	ret	
 363                     ; 137 void AWU_Cmd(FunctionalState NewState)
 363                     ; 138 {
 364                     	switch	.text
 365  003e               _AWU_Cmd:
 369                     ; 139   if (NewState != DISABLE)
 371  003e 4d            	tnz	a
 372  003f 2705          	jreq	L331
 373                     ; 142     AWU->CSR |= AWU_CSR_AWUEN;
 375  0041 721850f0      	bset	20720,#4
 378  0045 81            	ret	
 379  0046               L331:
 380                     ; 147     AWU->CSR &= (u8)(~AWU_CSR_AWUEN);
 382  0046 721950f0      	bres	20720,#4
 383                     ; 149 }
 386  004a 81            	ret	
 439                     	switch	.const
 440  0022               L41:
 441  0022 000003e8      	dc.l	1000
 442                     ; 176 void AWU_LSICalibrationConfig(u32 LSIFreqHz)
 442                     ; 177 {
 443                     	switch	.text
 444  004b               _AWU_LSICalibrationConfig:
 446  004b 5206          	subw	sp,#6
 447       00000006      OFST:	set	6
 450                     ; 179   u16 lsifreqkhz = 0x0;
 452                     ; 180   u16 A = 0x0;
 454                     ; 183   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 456                     ; 185   lsifreqkhz = (u16)(LSIFreqHz / 1000); /* Converts value in kHz */
 458  004d 96            	ldw	x,sp
 459  004e 1c0009        	addw	x,#OFST+3
 460  0051 cd0000        	call	c_ltor
 462  0054 ae0022        	ldw	x,#L41
 463  0057 cd0000        	call	c_ludv
 465  005a be02          	ldw	x,c_lreg+2
 466  005c 1f03          	ldw	(OFST-3,sp),x
 467                     ; 189   A = (u16)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 469  005e 54            	srlw	x
 470  005f 54            	srlw	x
 471  0060 1f05          	ldw	(OFST-1,sp),x
 472                     ; 191   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 474  0062 58            	sllw	x
 475  0063 58            	sllw	x
 476  0064 1f01          	ldw	(OFST-5,sp),x
 477  0066 1e03          	ldw	x,(OFST-3,sp)
 478  0068 72f001        	subw	x,(OFST-5,sp)
 479  006b 1605          	ldw	y,(OFST-1,sp)
 480  006d 9058          	sllw	y
 481  006f 905c          	incw	y
 482  0071 cd0000        	call	c_imul
 484  0074 1605          	ldw	y,(OFST-1,sp)
 485  0076 9058          	sllw	y
 486  0078 bf00          	ldw	c_x,x
 487  007a 9058          	sllw	y
 488  007c 90b300        	cpw	y,c_x
 489  007f 7b06          	ld	a,(OFST+0,sp)
 490  0081 2504          	jrult	L561
 491                     ; 193     AWU->APR = (u8)(A - 2U);
 493  0083 a002          	sub	a,#2
 495  0085 2001          	jra	L761
 496  0087               L561:
 497                     ; 197     AWU->APR = (u8)(A - 1U);
 499  0087 4a            	dec	a
 500  0088               L761:
 501  0088 c750f1        	ld	20721,a
 502                     ; 201   AWU->CSR |= AWU_CSR_MR;
 504                     ; 203 }
 507  008b 5b06          	addw	sp,#6
 508  008d 721250f0      	bset	20720,#1
 509  0091 81            	ret	
 587                     	switch	.const
 588  0026               L42:
 589  0026 000186a0      	dc.l	100000
 590  002a               L62:
 591  002a 00030d41      	dc.l	200001
 592                     ; 221 ErrorStatus AWU_AutoLSICalibration(void)
 592                     ; 222 {
 593                     	switch	.text
 594  0092               _AWU_AutoLSICalibration:
 596  0092 5205          	subw	sp,#5
 597       00000005      OFST:	set	5
 600                     ; 224   u32 lsi_freq_hz = 0x0;
 602                     ; 225   u32 fmaster = 0x0;
 604                     ; 226   ErrorStatus status = ERROR;
 606                     ; 229   fmaster = CLK_GetClockFreq();
 608  0094 cd0000        	call	_CLK_GetClockFreq
 610  0097 96            	ldw	x,sp
 611  0098 1c0002        	addw	x,#OFST-3
 612  009b cd0000        	call	c_rtol
 614                     ; 232   AWU->CSR |= AWU_CSR_MSR;
 616  009e 721050f0      	bset	20720,#0
 617                     ; 235   lsi_freq_hz = TIM3_ComputeLsiClockFreq(fmaster);
 619  00a2 1e04          	ldw	x,(OFST-1,sp)
 620  00a4 89            	pushw	x
 621  00a5 1e04          	ldw	x,(OFST-1,sp)
 622  00a7 89            	pushw	x
 623  00a8 cd0000        	call	_TIM3_ComputeLsiClockFreq
 625  00ab 5b04          	addw	sp,#4
 626  00ad 96            	ldw	x,sp
 627  00ae 1c0002        	addw	x,#OFST-3
 628  00b1 cd0000        	call	c_rtol
 630                     ; 238   AWU->CSR &= (u8)(~AWU_CSR_MSR);
 632  00b4 721150f0      	bres	20720,#0
 633                     ; 240   if ((lsi_freq_hz >= LSI_FREQUENCY_MIN) && (lsi_freq_hz <= LSI_FREQUENCY_MAX))
 635  00b8 96            	ldw	x,sp
 636  00b9 1c0002        	addw	x,#OFST-3
 637  00bc cd0000        	call	c_ltor
 639  00bf ae0026        	ldw	x,#L42
 640  00c2 cd0000        	call	c_lcmp
 642  00c5 251e          	jrult	L722
 644  00c7 96            	ldw	x,sp
 645  00c8 1c0002        	addw	x,#OFST-3
 646  00cb cd0000        	call	c_ltor
 648  00ce ae002a        	ldw	x,#L62
 649  00d1 cd0000        	call	c_lcmp
 651  00d4 240f          	jruge	L722
 652                     ; 243     AWU_LSICalibrationConfig(lsi_freq_hz);
 654  00d6 1e04          	ldw	x,(OFST-1,sp)
 655  00d8 89            	pushw	x
 656  00d9 1e04          	ldw	x,(OFST-1,sp)
 657  00db 89            	pushw	x
 658  00dc cd004b        	call	_AWU_LSICalibrationConfig
 660  00df 5b04          	addw	sp,#4
 661                     ; 244     status = SUCCESS;
 663  00e1 a601          	ld	a,#1
 665  00e3 2001          	jra	L132
 666  00e5               L722:
 667                     ; 248     status = ERROR;
 669  00e5 4f            	clr	a
 670  00e6               L132:
 671                     ; 251   return status;
 675  00e6 5b05          	addw	sp,#5
 676  00e8 81            	ret	
 699                     ; 269 void AWU_IdleModeEnable(void)
 699                     ; 270 {
 700                     	switch	.text
 701  00e9               _AWU_IdleModeEnable:
 705                     ; 273   AWU->CSR &= (u8)(~AWU_CSR_AWUEN);
 707  00e9 721950f0      	bres	20720,#4
 708                     ; 276   AWU->TBR = (u8)(~AWU_TBR_AWUTB);
 710  00ed 35f050f2      	mov	20722,#240
 711                     ; 278 }
 714  00f1 81            	ret	
 737                     ; 294 void AWU_ReInitCounter(void)
 737                     ; 295 {
 738                     	switch	.text
 739  00f2               _AWU_ReInitCounter:
 743                     ; 296   AWU->CSR |= AWU_CSR_MR;
 745  00f2 721250f0      	bset	20720,#1
 746                     ; 297 }
 749  00f6 81            	ret	
 793                     ; 317 FlagStatus AWU_GetFlagStatus(void)
 793                     ; 318 {
 794                     	switch	.text
 795  00f7               _AWU_GetFlagStatus:
 799                     ; 319   return((FlagStatus)(((u8)(AWU->CSR & AWU_CSR_AWUF) == (u8)0x00) ? RESET : SET));
 801  00f7 720a50f002    	btjt	20720,#5,L04
 802  00fc 4f            	clr	a
 804  00fd 81            	ret	
 805  00fe               L04:
 806  00fe a601          	ld	a,#1
 809  0100 81            	ret	
 844                     	xdef	_TBR_Array
 845                     	xdef	_APR_Array
 846                     	xdef	_AWU_GetFlagStatus
 847                     	xdef	_AWU_ReInitCounter
 848                     	xdef	_AWU_IdleModeEnable
 849                     	xdef	_AWU_AutoLSICalibration
 850                     	xdef	_AWU_LSICalibrationConfig
 851                     	xdef	_AWU_Cmd
 852                     	xdef	_AWU_Init
 853                     	xdef	_AWU_DeInit
 854                     	xref	_CLK_GetClockFreq
 855                     	xref	_TIM3_ComputeLsiClockFreq
 856                     	xref.b	c_lreg
 857                     	xref.b	c_x
 876                     	xref	c_lcmp
 877                     	xref	c_rtol
 878                     	xref	c_imul
 879                     	xref	c_ludv
 880                     	xref	c_ltor
 881                     	end
