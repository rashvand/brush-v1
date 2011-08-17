   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 64 void BEEP_DeInit(void)
  47                     ; 65 {
  49                     	switch	.text
  50  0000               _BEEP_DeInit:
  54                     ; 66   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  56  0000 351f50f3      	mov	20723,#31
  57                     ; 67 }
  60  0004 81            	ret	
 125                     ; 83 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 125                     ; 84 {
 126                     	switch	.text
 127  0005               _BEEP_Init:
 129       00000000      OFST:	set	0
 132                     ; 87   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 134                     ; 90   BEEP->CSR |= BEEP_CSR_BEEPEN;
 136  0005 721a50f3      	bset	20723,#5
 137  0009 88            	push	a
 138                     ; 93   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 140  000a c650f3        	ld	a,20723
 141  000d a41f          	and	a,#31
 142  000f a11f          	cp	a,#31
 143  0011 2610          	jrne	L15
 144                     ; 95     BEEP->CSR &= (u8)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 146  0013 c650f3        	ld	a,20723
 147  0016 a4e0          	and	a,#224
 148  0018 c750f3        	ld	20723,a
 149                     ; 96     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 151  001b c650f3        	ld	a,20723
 152  001e aa0b          	or	a,#11
 153  0020 c750f3        	ld	20723,a
 154  0023               L15:
 155                     ; 100   BEEP->CSR &= (u8)(~BEEP_CSR_BEEPSEL);
 157  0023 c650f3        	ld	a,20723
 158  0026 a43f          	and	a,#63
 159  0028 c750f3        	ld	20723,a
 160                     ; 101   BEEP->CSR |= (u8)(BEEP_Frequency);
 162  002b c650f3        	ld	a,20723
 163  002e 1a01          	or	a,(OFST+1,sp)
 164  0030 c750f3        	ld	20723,a
 165                     ; 103 }
 168  0033 84            	pop	a
 169  0034 81            	ret	
 224                     ; 118 void BEEP_Cmd(FunctionalState NewState)
 224                     ; 119 {
 225                     	switch	.text
 226  0035               _BEEP_Cmd:
 230                     ; 120   if (NewState != DISABLE)
 232  0035 4d            	tnz	a
 233  0036 2705          	jreq	L101
 234                     ; 123     BEEP->CSR |= BEEP_CSR_BEEPEN;
 236  0038 721a50f3      	bset	20723,#5
 239  003c 81            	ret	
 240  003d               L101:
 241                     ; 128     BEEP->CSR &= (u8)(~BEEP_CSR_BEEPEN);
 243  003d 721b50f3      	bres	20723,#5
 244                     ; 130 }
 247  0041 81            	ret	
 300                     .const:	section	.text
 301  0000               L41:
 302  0000 000003e8      	dc.l	1000
 303                     ; 157 void BEEP_LSICalibrationConfig(u32 LSIFreqHz)
 303                     ; 158 {
 304                     	switch	.text
 305  0042               _BEEP_LSICalibrationConfig:
 307  0042 5206          	subw	sp,#6
 308       00000006      OFST:	set	6
 311                     ; 164   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 313                     ; 166   lsifreqkhz = (u16)(LSIFreqHz / 1000); /* Converts value in kHz */
 315  0044 96            	ldw	x,sp
 316  0045 1c0009        	addw	x,#OFST+3
 317  0048 cd0000        	call	c_ltor
 319  004b ae0000        	ldw	x,#L41
 320  004e cd0000        	call	c_ludv
 322  0051 be02          	ldw	x,c_lreg+2
 323  0053 1f03          	ldw	(OFST-3,sp),x
 324                     ; 170   BEEP->CSR &= (u8)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 326  0055 c650f3        	ld	a,20723
 327  0058 a4e0          	and	a,#224
 328  005a c750f3        	ld	20723,a
 329                     ; 172   A = (u16)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 331  005d 54            	srlw	x
 332  005e 54            	srlw	x
 333  005f 54            	srlw	x
 334  0060 1f05          	ldw	(OFST-1,sp),x
 335                     ; 174   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 337  0062 58            	sllw	x
 338  0063 58            	sllw	x
 339  0064 58            	sllw	x
 340  0065 1f01          	ldw	(OFST-5,sp),x
 341  0067 1e03          	ldw	x,(OFST-3,sp)
 342  0069 72f001        	subw	x,(OFST-5,sp)
 343  006c 1605          	ldw	y,(OFST-1,sp)
 344  006e 9058          	sllw	y
 345  0070 905c          	incw	y
 346  0072 cd0000        	call	c_imul
 348  0075 1605          	ldw	y,(OFST-1,sp)
 349  0077 9058          	sllw	y
 350  0079 9058          	sllw	y
 351  007b bf00          	ldw	c_x,x
 352  007d 9058          	sllw	y
 353  007f 90b300        	cpw	y,c_x
 354  0082 7b06          	ld	a,(OFST+0,sp)
 355  0084 2504          	jrult	L331
 356                     ; 176     BEEP->CSR |= (u8)(A - 2U);
 358  0086 a002          	sub	a,#2
 360  0088 2001          	jra	L531
 361  008a               L331:
 362                     ; 180     BEEP->CSR |= (u8)(A - 1U);
 364  008a 4a            	dec	a
 365  008b               L531:
 366  008b ca50f3        	or	a,20723
 367  008e c750f3        	ld	20723,a
 368                     ; 184   AWU->CSR |= AWU_CSR_MR;
 370                     ; 186 }
 373  0091 5b06          	addw	sp,#6
 374  0093 721250f0      	bset	20720,#1
 375  0097 81            	ret	
 453                     	switch	.const
 454  0004               L42:
 455  0004 000186a0      	dc.l	100000
 456  0008               L62:
 457  0008 00030d41      	dc.l	200001
 458                     ; 204 ErrorStatus BEEP_AutoLSICalibration(void)
 458                     ; 205 {
 459                     	switch	.text
 460  0098               _BEEP_AutoLSICalibration:
 462  0098 5205          	subw	sp,#5
 463       00000005      OFST:	set	5
 466                     ; 211   fmaster = CLK_GetClockFreq();
 468  009a cd0000        	call	_CLK_GetClockFreq
 470  009d 96            	ldw	x,sp
 471  009e 1c0002        	addw	x,#OFST-3
 472  00a1 cd0000        	call	c_rtol
 474                     ; 214   AWU->CSR |= AWU_CSR_MSR;
 476  00a4 721050f0      	bset	20720,#0
 477                     ; 217   lsi_freq_hz = TIM3_ComputeLsiClockFreq(fmaster);
 479  00a8 1e04          	ldw	x,(OFST-1,sp)
 480  00aa 89            	pushw	x
 481  00ab 1e04          	ldw	x,(OFST-1,sp)
 482  00ad 89            	pushw	x
 483  00ae cd0000        	call	_TIM3_ComputeLsiClockFreq
 485  00b1 5b04          	addw	sp,#4
 486  00b3 96            	ldw	x,sp
 487  00b4 1c0002        	addw	x,#OFST-3
 488  00b7 cd0000        	call	c_rtol
 490                     ; 220   AWU->CSR &= (u8)(~AWU_CSR_MSR);
 492  00ba 721150f0      	bres	20720,#0
 493                     ; 222   if ((lsi_freq_hz >= LSI_FREQUENCY_MIN) && (lsi_freq_hz <= LSI_FREQUENCY_MAX))
 495  00be 96            	ldw	x,sp
 496  00bf 1c0002        	addw	x,#OFST-3
 497  00c2 cd0000        	call	c_ltor
 499  00c5 ae0004        	ldw	x,#L42
 500  00c8 cd0000        	call	c_lcmp
 502  00cb 251e          	jrult	L571
 504  00cd 96            	ldw	x,sp
 505  00ce 1c0002        	addw	x,#OFST-3
 506  00d1 cd0000        	call	c_ltor
 508  00d4 ae0008        	ldw	x,#L62
 509  00d7 cd0000        	call	c_lcmp
 511  00da 240f          	jruge	L571
 512                     ; 225     BEEP_LSICalibrationConfig(lsi_freq_hz);
 514  00dc 1e04          	ldw	x,(OFST-1,sp)
 515  00de 89            	pushw	x
 516  00df 1e04          	ldw	x,(OFST-1,sp)
 517  00e1 89            	pushw	x
 518  00e2 cd0042        	call	_BEEP_LSICalibrationConfig
 520  00e5 5b04          	addw	sp,#4
 521                     ; 226     status = SUCCESS;
 523  00e7 a601          	ld	a,#1
 525  00e9 2001          	jra	L771
 526  00eb               L571:
 527                     ; 230     status = ERROR;
 529  00eb 4f            	clr	a
 530  00ec               L771:
 531                     ; 233   return status;
 535  00ec 5b05          	addw	sp,#5
 536  00ee 81            	ret	
 549                     	xdef	_BEEP_AutoLSICalibration
 550                     	xdef	_BEEP_LSICalibrationConfig
 551                     	xdef	_BEEP_Cmd
 552                     	xdef	_BEEP_Init
 553                     	xdef	_BEEP_DeInit
 554                     	xref	_CLK_GetClockFreq
 555                     	xref	_TIM3_ComputeLsiClockFreq
 556                     	xref.b	c_lreg
 557                     	xref.b	c_x
 576                     	xref	c_lcmp
 577                     	xref	c_rtol
 578                     	xref	c_imul
 579                     	xref	c_ludv
 580                     	xref	c_ltor
 581                     	end
