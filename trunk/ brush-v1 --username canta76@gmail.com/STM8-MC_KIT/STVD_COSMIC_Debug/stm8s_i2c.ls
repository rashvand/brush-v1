   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 64 void I2C_DeInit(void)
  47                     ; 65 {
  49                     	switch	.text
  50  0000               _I2C_DeInit:
  54                     ; 66   I2C->CR1 = I2C_CR1_RESET_VALUE;
  56  0000 725f5210      	clr	21008
  57                     ; 67   I2C->CR2 = I2C_CR2_RESET_VALUE;
  59  0004 725f5211      	clr	21009
  60                     ; 68   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  62  0008 725f5212      	clr	21010
  63                     ; 69   I2C->OARL = I2C_OARL_RESET_VALUE;
  65  000c 725f5213      	clr	21011
  66                     ; 70   I2C->OARH = I2C_OARH_RESET_VALUE;
  68  0010 725f5214      	clr	21012
  69                     ; 71   I2C->ITR = I2C_ITR_RESET_VALUE;
  71  0014 725f521a      	clr	21018
  72                     ; 72   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  74  0018 725f521b      	clr	21019
  75                     ; 73   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  77  001c 725f521c      	clr	21020
  78                     ; 74   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  80  0020 3502521d      	mov	21021,#2
  81                     ; 75 }
  84  0024 81            	ret	
 263                     .const:	section	.text
 264  0000               L01:
 265  0000 000186a1      	dc.l	100001
 266  0004               L21:
 267  0004 000f4240      	dc.l	1000000
 268                     ; 99 void I2C_Init(u32 OutputClockFrequencyHz, u16 OwnAddress, I2C_DutyCycle_TypeDef DutyCycle, I2C_Ack_TypeDef Ack, I2C_AddMode_TypeDef AddMode, u8 InputClockFrequencyMHz )
 268                     ; 100 {
 269                     	switch	.text
 270  0025               _I2C_Init:
 272  0025 5209          	subw	sp,#9
 273       00000009      OFST:	set	9
 276                     ; 101   u16 result = 0x0004;
 278                     ; 102   u16 tmpval = 0;
 280                     ; 103   u8 tmpccrh = 0;
 282  0027 0f07          	clr	(OFST-2,sp)
 283                     ; 106   assert_param(IS_I2C_ACK_OK(Ack));
 285                     ; 107   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 287                     ; 108   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 289                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 291                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 293                     ; 115   I2C->FREQR &= (u8)(~I2C_FREQR_FREQ);
 295  0029 c65212        	ld	a,21010
 296  002c a4c0          	and	a,#192
 297  002e c75212        	ld	21010,a
 298                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 300  0031 c65212        	ld	a,21010
 301  0034 1a15          	or	a,(OFST+12,sp)
 302  0036 c75212        	ld	21010,a
 303                     ; 121   I2C->CR1 &= (u8)(~I2C_CR1_PE);
 305  0039 72115210      	bres	21008,#0
 306                     ; 124   I2C->CCRH &= (u8)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 308  003d c6521c        	ld	a,21020
 309  0040 a430          	and	a,#48
 310  0042 c7521c        	ld	21020,a
 311                     ; 125   I2C->CCRL &= (u8)(~I2C_CCRL_CCR);
 313  0045 725f521b      	clr	21019
 314                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 316  0049 96            	ldw	x,sp
 317  004a 1c000c        	addw	x,#OFST+3
 318  004d cd0000        	call	c_ltor
 320  0050 ae0000        	ldw	x,#L01
 321  0053 cd0000        	call	c_lcmp
 323  0056 257c          	jrult	L131
 324                     ; 131     tmpccrh = I2C_CCRH_FS;
 326  0058 a680          	ld	a,#128
 327  005a 6b07          	ld	(OFST-2,sp),a
 328                     ; 133     if (DutyCycle == I2C_DUTYCYCLE_2)
 330  005c 96            	ldw	x,sp
 331  005d 0d12          	tnz	(OFST+9,sp)
 332  005f 262b          	jrne	L331
 333                     ; 136       result = (u16) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 335  0061 1c000c        	addw	x,#OFST+3
 336  0064 cd0000        	call	c_ltor
 338  0067 a603          	ld	a,#3
 339  0069 cd0000        	call	c_smul
 341  006c 96            	ldw	x,sp
 342  006d 5c            	incw	x
 343  006e cd0000        	call	c_rtol
 345  0071 7b15          	ld	a,(OFST+12,sp)
 346  0073 b703          	ld	c_lreg+3,a
 347  0075 3f02          	clr	c_lreg+2
 348  0077 3f01          	clr	c_lreg+1
 349  0079 3f00          	clr	c_lreg
 350  007b ae0004        	ldw	x,#L21
 351  007e cd0000        	call	c_lmul
 353  0081 96            	ldw	x,sp
 354  0082 5c            	incw	x
 355  0083 cd0000        	call	c_ludv
 357  0086 be02          	ldw	x,c_lreg+2
 358  0088 1f08          	ldw	(OFST-1,sp),x
 360  008a 202f          	jra	L531
 361  008c               L331:
 362                     ; 141       result = (u16) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 364  008c 1c000c        	addw	x,#OFST+3
 365  008f cd0000        	call	c_ltor
 367  0092 a619          	ld	a,#25
 368  0094 cd0000        	call	c_smul
 370  0097 96            	ldw	x,sp
 371  0098 5c            	incw	x
 372  0099 cd0000        	call	c_rtol
 374  009c 7b15          	ld	a,(OFST+12,sp)
 375  009e b703          	ld	c_lreg+3,a
 376  00a0 3f02          	clr	c_lreg+2
 377  00a2 3f01          	clr	c_lreg+1
 378  00a4 3f00          	clr	c_lreg
 379  00a6 ae0004        	ldw	x,#L21
 380  00a9 cd0000        	call	c_lmul
 382  00ac 96            	ldw	x,sp
 383  00ad 5c            	incw	x
 384  00ae cd0000        	call	c_ludv
 386  00b1 be02          	ldw	x,c_lreg+2
 387  00b3 1f08          	ldw	(OFST-1,sp),x
 388                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 390  00b5 7b07          	ld	a,(OFST-2,sp)
 391  00b7 aa40          	or	a,#64
 392  00b9 6b07          	ld	(OFST-2,sp),a
 393  00bb               L531:
 394                     ; 147     if (result < (u16)0x01)
 396  00bb 1e08          	ldw	x,(OFST-1,sp)
 397  00bd 2603          	jrne	L731
 398                     ; 150       result = (u16)0x0001;
 400  00bf 5c            	incw	x
 401  00c0 1f08          	ldw	(OFST-1,sp),x
 402  00c2               L731:
 403                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 405  00c2 7b15          	ld	a,(OFST+12,sp)
 406  00c4 97            	ld	xl,a
 407  00c5 a603          	ld	a,#3
 408  00c7 42            	mul	x,a
 409  00c8 a60a          	ld	a,#10
 410  00ca cd0000        	call	c_sdivx
 412  00cd 5c            	incw	x
 413  00ce 1f05          	ldw	(OFST-4,sp),x
 414                     ; 157     I2C->TRISER = (u8)tmpval;
 416  00d0 7b06          	ld	a,(OFST-3,sp)
 418  00d2 2038          	jra	L141
 419  00d4               L131:
 420                     ; 164     result = (u16)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (u8)1));
 422  00d4 96            	ldw	x,sp
 423  00d5 1c000c        	addw	x,#OFST+3
 424  00d8 cd0000        	call	c_ltor
 426  00db 3803          	sll	c_lreg+3
 427  00dd 3902          	rlc	c_lreg+2
 428  00df 3901          	rlc	c_lreg+1
 429  00e1 96            	ldw	x,sp
 430  00e2 3900          	rlc	c_lreg
 431  00e4 5c            	incw	x
 432  00e5 cd0000        	call	c_rtol
 434  00e8 7b15          	ld	a,(OFST+12,sp)
 435  00ea b703          	ld	c_lreg+3,a
 436  00ec 3f02          	clr	c_lreg+2
 437  00ee 3f01          	clr	c_lreg+1
 438  00f0 3f00          	clr	c_lreg
 439  00f2 ae0004        	ldw	x,#L21
 440  00f5 cd0000        	call	c_lmul
 442  00f8 96            	ldw	x,sp
 443  00f9 5c            	incw	x
 444  00fa cd0000        	call	c_ludv
 446  00fd be02          	ldw	x,c_lreg+2
 447                     ; 167     if (result < (u16)0x0004)
 449  00ff a30004        	cpw	x,#4
 450  0102 2403          	jruge	L341
 451                     ; 170       result = (u16)0x0004;
 453  0104 ae0004        	ldw	x,#4
 454  0107               L341:
 455  0107 1f08          	ldw	(OFST-1,sp),x
 456                     ; 176     I2C->TRISER = (u8)(InputClockFrequencyMHz + 1);
 458  0109 7b15          	ld	a,(OFST+12,sp)
 459  010b 4c            	inc	a
 460  010c               L141:
 461  010c c7521d        	ld	21021,a
 462                     ; 181   I2C->CCRL = (u8)result;
 464  010f 7b09          	ld	a,(OFST+0,sp)
 465  0111 c7521b        	ld	21019,a
 466                     ; 182   I2C->CCRH = (u8)(((u8)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 468  0114 7b08          	ld	a,(OFST-1,sp)
 469  0116 a40f          	and	a,#15
 470  0118 1a07          	or	a,(OFST-2,sp)
 471  011a c7521c        	ld	21020,a
 472                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 474  011d 72105210      	bset	21008,#0
 475                     ; 188   I2C_AcknowledgeConfig(Ack);
 477  0121 7b13          	ld	a,(OFST+10,sp)
 478  0123 ad6d          	call	_I2C_AcknowledgeConfig
 480                     ; 191   I2C->OARL = (u8)(OwnAddress);
 482  0125 7b11          	ld	a,(OFST+8,sp)
 483  0127 c75213        	ld	21011,a
 484                     ; 192   I2C->OARH = (u8)((u8)AddMode |
 484                     ; 193                    I2C_OARH_ADDCONF |
 484                     ; 194                    (u8)((OwnAddress & (u16)0x0300) >> (u8)7));
 486  012a 7b10          	ld	a,(OFST+7,sp)
 487  012c a403          	and	a,#3
 488  012e 97            	ld	xl,a
 489  012f 4f            	clr	a
 490  0130 02            	rlwa	x,a
 491  0131 4f            	clr	a
 492  0132 01            	rrwa	x,a
 493  0133 48            	sll	a
 494  0134 59            	rlcw	x
 495  0135 9f            	ld	a,xl
 496  0136 6b04          	ld	(OFST-5,sp),a
 497  0138 7b14          	ld	a,(OFST+11,sp)
 498  013a aa40          	or	a,#64
 499  013c 1a04          	or	a,(OFST-5,sp)
 500  013e c75214        	ld	21012,a
 501                     ; 195 }
 504  0141 5b09          	addw	sp,#9
 505  0143 81            	ret	
 560                     ; 212 void I2C_Cmd(FunctionalState NewState)
 560                     ; 213 {
 561                     	switch	.text
 562  0144               _I2C_Cmd:
 566                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 568                     ; 218   if (NewState != DISABLE)
 570  0144 4d            	tnz	a
 571  0145 2705          	jreq	L371
 572                     ; 221     I2C->CR1 |= I2C_CR1_PE;
 574  0147 72105210      	bset	21008,#0
 577  014b 81            	ret	
 578  014c               L371:
 579                     ; 226     I2C->CR1 &= (u8)(~I2C_CR1_PE);
 581  014c 72115210      	bres	21008,#0
 582                     ; 228 }
 585  0150 81            	ret	
 620                     ; 245 void I2C_GeneralCallCmd(FunctionalState NewState)
 620                     ; 246 {
 621                     	switch	.text
 622  0151               _I2C_GeneralCallCmd:
 626                     ; 249   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 628                     ; 251   if (NewState != DISABLE)
 630  0151 4d            	tnz	a
 631  0152 2705          	jreq	L512
 632                     ; 254     I2C->CR1 |= I2C_CR1_ENGC;
 634  0154 721c5210      	bset	21008,#6
 637  0158 81            	ret	
 638  0159               L512:
 639                     ; 259     I2C->CR1 &= (u8)(~I2C_CR1_ENGC);
 641  0159 721d5210      	bres	21008,#6
 642                     ; 261 }
 645  015d 81            	ret	
 680                     ; 278 void I2C_GenerateSTART(FunctionalState NewState)
 680                     ; 279 {
 681                     	switch	.text
 682  015e               _I2C_GenerateSTART:
 686                     ; 282   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 688                     ; 284   if (NewState != DISABLE)
 690  015e 4d            	tnz	a
 691  015f 2705          	jreq	L732
 692                     ; 287     I2C->CR2 |= I2C_CR2_START;
 694  0161 72105211      	bset	21009,#0
 697  0165 81            	ret	
 698  0166               L732:
 699                     ; 292     I2C->CR2 &= (u8)(~I2C_CR2_START);
 701  0166 72115211      	bres	21009,#0
 702                     ; 295 }
 705  016a 81            	ret	
 740                     ; 312 void I2C_GenerateSTOP(FunctionalState NewState)
 740                     ; 313 {
 741                     	switch	.text
 742  016b               _I2C_GenerateSTOP:
 746                     ; 316   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 748                     ; 318   if (NewState != DISABLE)
 750  016b 4d            	tnz	a
 751  016c 2705          	jreq	L162
 752                     ; 321     I2C->CR2 |= I2C_CR2_STOP;
 754  016e 72125211      	bset	21009,#1
 757  0172 81            	ret	
 758  0173               L162:
 759                     ; 326     I2C->CR2 &= (u8)(~I2C_CR2_STOP);
 761  0173 72135211      	bres	21009,#1
 762                     ; 329 }
 765  0177 81            	ret	
 801                     ; 346 void I2C_SoftwareResetCmd(FunctionalState NewState)
 801                     ; 347 {
 802                     	switch	.text
 803  0178               _I2C_SoftwareResetCmd:
 807                     ; 349   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 809                     ; 351   if (NewState != DISABLE)
 811  0178 4d            	tnz	a
 812  0179 2705          	jreq	L303
 813                     ; 354     I2C->CR2 |= I2C_CR2_SWRST;
 815  017b 721e5211      	bset	21009,#7
 818  017f 81            	ret	
 819  0180               L303:
 820                     ; 359     I2C->CR2 &= (u8)(~I2C_CR2_SWRST);
 822  0180 721f5211      	bres	21009,#7
 823                     ; 361 }
 826  0184 81            	ret	
 862                     ; 379 void I2C_StretchClockCmd(FunctionalState NewState)
 862                     ; 380 {
 863                     	switch	.text
 864  0185               _I2C_StretchClockCmd:
 868                     ; 382   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 870                     ; 384   if (NewState != DISABLE)
 872  0185 4d            	tnz	a
 873  0186 2705          	jreq	L523
 874                     ; 387     I2C->CR1 &= (u8)(~I2C_CR1_NOSTRETCH);
 876  0188 721f5210      	bres	21008,#7
 879  018c 81            	ret	
 880  018d               L523:
 881                     ; 393     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 883  018d 721e5210      	bset	21008,#7
 884                     ; 395 }
 887  0191 81            	ret	
 923                     ; 412 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 923                     ; 413 {
 924                     	switch	.text
 925  0192               _I2C_AcknowledgeConfig:
 927  0192 88            	push	a
 928       00000000      OFST:	set	0
 931                     ; 416   assert_param(IS_I2C_ACK_OK(Ack));
 933                     ; 418   if (Ack == I2C_ACK_NONE)
 935  0193 4d            	tnz	a
 936  0194 2606          	jrne	L743
 937                     ; 421     I2C->CR2 &= (u8)(~I2C_CR2_ACK);
 939  0196 72155211      	bres	21009,#2
 941  019a 2013          	jra	L153
 942  019c               L743:
 943                     ; 426     I2C->CR2 |= I2C_CR2_ACK;
 945  019c 72145211      	bset	21009,#2
 946                     ; 428     if (Ack == I2C_ACK_CURR)
 948  01a0 7b01          	ld	a,(OFST+1,sp)
 949  01a2 4a            	dec	a
 950  01a3 2606          	jrne	L353
 951                     ; 431       I2C->CR2 &= (u8)(~I2C_CR2_POS);
 953  01a5 72175211      	bres	21009,#3
 955  01a9 2004          	jra	L153
 956  01ab               L353:
 957                     ; 436       I2C->CR2 |= I2C_CR2_POS;
 959  01ab 72165211      	bset	21009,#3
 960  01af               L153:
 961                     ; 440 }
 964  01af 84            	pop	a
 965  01b0 81            	ret	
1037                     ; 459 void I2C_ITConfig(I2C_IT_TypeDef ITName, FunctionalState NewState)
1037                     ; 460 {
1038                     	switch	.text
1039  01b1               _I2C_ITConfig:
1041  01b1 89            	pushw	x
1042       00000000      OFST:	set	0
1045                     ; 463   assert_param(IS_I2C_INTERRUPT_OK(ITName));
1047                     ; 464   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1049                     ; 466   if (NewState != DISABLE)
1051  01b2 9f            	ld	a,xl
1052  01b3 4d            	tnz	a
1053  01b4 2706          	jreq	L314
1054                     ; 469     I2C->ITR |= (u8)ITName;
1056  01b6 9e            	ld	a,xh
1057  01b7 ca521a        	or	a,21018
1059  01ba 2006          	jra	L514
1060  01bc               L314:
1061                     ; 474     I2C->ITR &= (u8)(~(u8)ITName);
1063  01bc 7b01          	ld	a,(OFST+1,sp)
1064  01be 43            	cpl	a
1065  01bf c4521a        	and	a,21018
1066  01c2               L514:
1067  01c2 c7521a        	ld	21018,a
1068                     ; 476 }
1071  01c5 85            	popw	x
1072  01c6 81            	ret	
1108                     ; 493 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef DutyCycle)
1108                     ; 494 {
1109                     	switch	.text
1110  01c7               _I2C_FastModeDutyCycleConfig:
1114                     ; 497   assert_param(IS_I2C_DUTYCYCLE_OK(DutyCycle));
1116                     ; 499   if (DutyCycle == I2C_DUTYCYCLE_16_9)
1118  01c7 a140          	cp	a,#64
1119  01c9 2605          	jrne	L534
1120                     ; 502     I2C->CCRH |= I2C_CCRH_DUTY;
1122  01cb 721c521c      	bset	21020,#6
1125  01cf 81            	ret	
1126  01d0               L534:
1127                     ; 507     I2C->CCRH &= (u8)(~I2C_CCRH_DUTY);
1129  01d0 721d521c      	bres	21020,#6
1130                     ; 510 }
1133  01d4 81            	ret	
1311                     ; 531 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1311                     ; 532 {
1312                     	switch	.text
1313  01d5               _I2C_CheckEvent:
1315  01d5 89            	pushw	x
1316  01d6 89            	pushw	x
1317       00000002      OFST:	set	2
1320                     ; 534   u8 flag1 = 0;
1322                     ; 535   u8 flag2 = 0;
1324                     ; 536   ErrorStatus status = ERROR;
1326                     ; 539   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1328                     ; 541   flag1 = I2C->SR1;
1330  01d7 c65217        	ld	a,21015
1331  01da 6b01          	ld	(OFST-1,sp),a
1332                     ; 542   flag2 = I2C->SR2;
1334  01dc c65218        	ld	a,21016
1335  01df 6b02          	ld	(OFST+0,sp),a
1336                     ; 545   if (((u16)I2C_Event & (u16)0x0F00) == 0x0700)
1338  01e1 01            	rrwa	x,a
1339  01e2 9f            	ld	a,xl
1340  01e3 a40f          	and	a,#15
1341  01e5 97            	ld	xl,a
1342  01e6 4f            	clr	a
1343  01e7 02            	rlwa	x,a
1344  01e8 a30700        	cpw	x,#1792
1345  01eb 2608          	jrne	L535
1346                     ; 548     if (flag1 & (u8)I2C_Event)
1348  01ed 7b04          	ld	a,(OFST+2,sp)
1349  01ef 1501          	bcp	a,(OFST-1,sp)
1350  01f1 270c          	jreq	L545
1351                     ; 551       status = SUCCESS;
1353  01f3 2006          	jp	LC002
1354                     ; 556       status = ERROR;
1355  01f5               L535:
1356                     ; 561     if (flag2 & (u8)I2C_Event)
1358  01f5 7b04          	ld	a,(OFST+2,sp)
1359  01f7 1502          	bcp	a,(OFST+0,sp)
1360  01f9 2704          	jreq	L545
1361                     ; 564       status = SUCCESS;
1363  01fb               LC002:
1365  01fb a601          	ld	a,#1
1367  01fd 2001          	jra	L345
1368  01ff               L545:
1369                     ; 569       status = ERROR;
1372  01ff 4f            	clr	a
1373  0200               L345:
1374                     ; 574   return status;
1378  0200 5b04          	addw	sp,#4
1379  0202 81            	ret	
1402                     ; 594 u8 I2C_ReceiveData(void)
1402                     ; 595 {
1403                     	switch	.text
1404  0203               _I2C_ReceiveData:
1408                     ; 597   return ((u8)I2C->DR);
1410  0203 c65216        	ld	a,21014
1413  0206 81            	ret	
1478                     ; 616 void I2C_Send7bitAddress(u8 Address, I2C_Direction_TypeDef Direction)
1478                     ; 617 {
1479                     	switch	.text
1480  0207               _I2C_Send7bitAddress:
1482  0207 89            	pushw	x
1483       00000000      OFST:	set	0
1486                     ; 619   assert_param(IS_I2C_ADDRESS_OK(Address));
1488                     ; 620   assert_param(IS_I2C_DIRECTION_OK(Direction));
1490                     ; 623   Address &= (u8)0xFE;
1492  0208 7b01          	ld	a,(OFST+1,sp)
1493  020a a4fe          	and	a,#254
1494  020c 6b01          	ld	(OFST+1,sp),a
1495                     ; 626   I2C->DR = (u8)(Address | (u8)Direction);
1497  020e 1a02          	or	a,(OFST+2,sp)
1498  0210 c75216        	ld	21014,a
1499                     ; 627 }
1502  0213 85            	popw	x
1503  0214 81            	ret	
1537                     ; 643 void I2C_SendData(u8 Data)
1537                     ; 644 {
1538                     	switch	.text
1539  0215               _I2C_SendData:
1543                     ; 646   I2C->DR = Data;
1545  0215 c75216        	ld	21014,a
1546                     ; 647 }
1549  0218 81            	ret	
1746                     ; 666 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef Flag)
1746                     ; 667 {
1747                     	switch	.text
1748  0219               _I2C_GetFlagStatus:
1750  0219 89            	pushw	x
1751  021a 88            	push	a
1752       00000001      OFST:	set	1
1755                     ; 669   FlagStatus bitstatus = RESET;
1757  021b 0f01          	clr	(OFST+0,sp)
1758                     ; 672   assert_param(IS_I2C_FLAG_OK(Flag));
1760                     ; 675   switch ((u16)Flag & (u16)0xF000)
1762  021d 01            	rrwa	x,a
1763  021e 9f            	ld	a,xl
1764  021f a4f0          	and	a,#240
1765  0221 97            	ld	xl,a
1766  0222 4f            	clr	a
1767  0223 02            	rlwa	x,a
1769                     ; 723     default:
1769                     ; 724       break;
1770  0224 1d1000        	subw	x,#4096
1771  0227 270c          	jreq	L136
1772  0229 1d1000        	subw	x,#4096
1773  022c 270c          	jreq	L336
1774  022e 1d1000        	subw	x,#4096
1775  0231 2714          	jreq	L536
1776  0233 201b          	jra	L147
1777  0235               L136:
1778                     ; 679     case 0x1000:
1778                     ; 680       /* Check the status of the specified I2C flag */
1778                     ; 681       if ((I2C->SR1 & (u8)Flag) != 0)
1780  0235 c65217        	ld	a,21015
1781                     ; 684         bitstatus = SET;
1783  0238 2003          	jp	LC005
1784                     ; 689         bitstatus = RESET;
1785  023a               L336:
1786                     ; 694     case 0x2000:
1786                     ; 695       /* Check the status of the specified I2C flag */
1786                     ; 696       if ((I2C->SR2 & (u8)Flag) != 0)
1788  023a c65218        	ld	a,21016
1789  023d               LC005:
1790  023d 1503          	bcp	a,(OFST+2,sp)
1791  023f 270d          	jreq	L357
1792                     ; 699         bitstatus = SET;
1794  0241               LC004:
1797  0241 a601          	ld	a,#1
1798  0243 6b01          	ld	(OFST+0,sp),a
1800  0245 2009          	jra	L147
1801                     ; 704         bitstatus = RESET;
1802  0247               L536:
1803                     ; 709     case 0x3000:
1803                     ; 710       /* Check the status of the specified I2C flag */
1803                     ; 711       if ((I2C->SR3 & (u8)Flag) != 0)
1805  0247 c65219        	ld	a,21017
1806  024a 1503          	bcp	a,(OFST+2,sp)
1807                     ; 714         bitstatus = SET;
1809  024c 26f3          	jrne	LC004
1810  024e               L357:
1811                     ; 719         bitstatus = RESET;
1815  024e 0f01          	clr	(OFST+0,sp)
1816                     ; 723     default:
1816                     ; 724       break;
1818  0250               L147:
1819                     ; 729   return bitstatus;
1821  0250 7b01          	ld	a,(OFST+0,sp)
1824  0252 5b03          	addw	sp,#3
1825  0254 81            	ret	
1887                     ; 748 void I2C_ClearFlag(I2C_Flag_TypeDef Flag)
1887                     ; 749 {
1888                     	switch	.text
1889  0255               _I2C_ClearFlag:
1891  0255 89            	pushw	x
1892  0256 5204          	subw	sp,#4
1893       00000004      OFST:	set	4
1896                     ; 750   u8 tmp1 = 0;
1898                     ; 751   u8 tmp2 = 0;
1900                     ; 752   u16 tmp3 = 0;
1902                     ; 755   assert_param(IS_I2C_CLEAR_FLAG_OK(Flag));
1904                     ; 758   tmp3 = ((u16)Flag & (u16)0x0F00);
1906  0258 01            	rrwa	x,a
1907  0259 9f            	ld	a,xl
1908  025a a40f          	and	a,#15
1909  025c 97            	ld	xl,a
1910  025d 4f            	clr	a
1911  025e 02            	rlwa	x,a
1912  025f 1f03          	ldw	(OFST-1,sp),x
1913                     ; 761   if(tmp3 == 0x0100)
1915  0261 a30100        	cpw	x,#256
1916  0264 2608          	jrne	L1101
1917                     ; 764       I2C->SR2 = (u8)(~(u8)Flag);
1919  0266 7b06          	ld	a,(OFST+2,sp)
1920  0268 43            	cpl	a
1921  0269 c75218        	ld	21016,a
1923  026c 2022          	jra	L3101
1924  026e               L1101:
1925                     ; 767   else if(tmp3 == 0x0200)
1927  026e a30200        	cpw	x,#512
1928  0271 260a          	jrne	L5101
1929                     ; 770       tmp1 = I2C->SR1;
1931  0273 c65217        	ld	a,21015
1932                     ; 772       I2C->CR2 = I2C->CR2;
1934  0276 5552115211    	mov	21009,21009
1936  027b 2013          	jra	L3101
1937  027d               L5101:
1938                     ; 775   else if(tmp3 == 0x0300)
1940  027d a30300        	cpw	x,#768
1941  0280 2608          	jrne	L1201
1942                     ; 779       tmp1 = I2C->SR1;
1944  0282 c65217        	ld	a,21015
1945                     ; 781       tmp2 = I2C->SR3;
1947  0285 c65219        	ld	a,21017
1949  0288 2006          	jra	L3101
1950  028a               L1201:
1951                     ; 788       tmp1 = I2C->SR1;
1953  028a c65217        	ld	a,21015
1954                     ; 790       tmp2 = I2C->DR;
1956  028d c65216        	ld	a,21014
1957  0290               L3101:
1958                     ; 792 }
1961  0290 5b06          	addw	sp,#6
1962  0292 81            	ret	
2110                     ; 811 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef ITPendingBit)
2110                     ; 812 {
2111                     	switch	.text
2112  0293               _I2C_GetITStatus:
2114  0293 89            	pushw	x
2115  0294 88            	push	a
2116       00000001      OFST:	set	1
2119                     ; 813     ITStatus itstatus = RESET;
2121                     ; 816     assert_param(IS_I2C_ITPENDINGBIT_OK(ITPendingBit));
2123                     ; 819     if (((u16)ITPendingBit & 0xF000) == 0x1000) /* Returns whether the status register to check is SR1 */
2125  0295 01            	rrwa	x,a
2126  0296 9f            	ld	a,xl
2127  0297 a4f0          	and	a,#240
2128  0299 97            	ld	xl,a
2129  029a 4f            	clr	a
2130  029b 02            	rlwa	x,a
2131  029c a31000        	cpw	x,#4096
2132  029f 2609          	jrne	L3011
2133                     ; 822         if ((I2C->SR1 & (u8)ITPendingBit) != 0)
2135  02a1 c65217        	ld	a,21015
2136  02a4 1503          	bcp	a,(OFST+2,sp)
2137  02a6 270d          	jreq	L3111
2138                     ; 825             itstatus = SET;
2140  02a8 2007          	jp	LC007
2141                     ; 830             itstatus = RESET;
2142  02aa               L3011:
2143                     ; 836         if ((I2C->SR2 & (u8)ITPendingBit) != 0)
2145  02aa c65218        	ld	a,21016
2146  02ad 1503          	bcp	a,(OFST+2,sp)
2147  02af 2704          	jreq	L3111
2148                     ; 839             itstatus = SET;
2150  02b1               LC007:
2152  02b1 a601          	ld	a,#1
2154  02b3 2001          	jra	L1111
2155  02b5               L3111:
2156                     ; 844             itstatus = RESET;
2159  02b5 4f            	clr	a
2160  02b6               L1111:
2161                     ; 849     return itstatus;
2165  02b6 5b03          	addw	sp,#3
2166  02b8 81            	ret	
2229                     ; 868 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef ITPendingBit)
2229                     ; 869 {
2230                     	switch	.text
2231  02b9               _I2C_ClearITPendingBit:
2233  02b9 89            	pushw	x
2234  02ba 5204          	subw	sp,#4
2235       00000004      OFST:	set	4
2238                     ; 870   u8 tmp1 = 0;
2240                     ; 871   u8 tmp2 = 0;
2242                     ; 872   u16 tmp3 = 0;
2244                     ; 875   assert_param(IS_I2C_ITPENDINGBIT_OK(ITPendingBit));
2246                     ; 878   tmp3 = ((u16)ITPendingBit & (u16)0x0F00);
2248  02bc 01            	rrwa	x,a
2249  02bd 9f            	ld	a,xl
2250  02be a40f          	and	a,#15
2251  02c0 97            	ld	xl,a
2252  02c1 4f            	clr	a
2253  02c2 02            	rlwa	x,a
2254  02c3 1f03          	ldw	(OFST-1,sp),x
2255                     ; 881   if(tmp3 == 0x0100)
2257  02c5 a30100        	cpw	x,#256
2258  02c8 2608          	jrne	L1511
2259                     ; 884       I2C->SR2 = (u8)(~(u8)ITPendingBit);
2261  02ca 7b06          	ld	a,(OFST+2,sp)
2262  02cc 43            	cpl	a
2263  02cd c75218        	ld	21016,a
2265  02d0 2022          	jra	L3511
2266  02d2               L1511:
2267                     ; 887   else if(tmp3 == 0x0200)
2269  02d2 a30200        	cpw	x,#512
2270  02d5 260a          	jrne	L5511
2271                     ; 890       tmp1 = I2C->SR1;
2273  02d7 c65217        	ld	a,21015
2274                     ; 892       I2C->CR2 = I2C->CR2;
2276  02da 5552115211    	mov	21009,21009
2278  02df 2013          	jra	L3511
2279  02e1               L5511:
2280                     ; 895   else if(tmp3 == 0x0300)
2282  02e1 a30300        	cpw	x,#768
2283  02e4 2608          	jrne	L1611
2284                     ; 899       tmp1 = I2C->SR1;
2286  02e6 c65217        	ld	a,21015
2287                     ; 901       tmp2 = I2C->SR3;
2289  02e9 c65219        	ld	a,21017
2291  02ec 2006          	jra	L3511
2292  02ee               L1611:
2293                     ; 908       tmp1 = I2C->SR1;
2295  02ee c65217        	ld	a,21015
2296                     ; 910       tmp2 = I2C->DR;
2298  02f1 c65216        	ld	a,21014
2299  02f4               L3511:
2300                     ; 912 }
2303  02f4 5b06          	addw	sp,#6
2304  02f6 81            	ret	
2317                     	xdef	_I2C_ClearITPendingBit
2318                     	xdef	_I2C_GetITStatus
2319                     	xdef	_I2C_ClearFlag
2320                     	xdef	_I2C_GetFlagStatus
2321                     	xdef	_I2C_SendData
2322                     	xdef	_I2C_Send7bitAddress
2323                     	xdef	_I2C_ReceiveData
2324                     	xdef	_I2C_CheckEvent
2325                     	xdef	_I2C_ITConfig
2326                     	xdef	_I2C_FastModeDutyCycleConfig
2327                     	xdef	_I2C_AcknowledgeConfig
2328                     	xdef	_I2C_StretchClockCmd
2329                     	xdef	_I2C_SoftwareResetCmd
2330                     	xdef	_I2C_GenerateSTOP
2331                     	xdef	_I2C_GenerateSTART
2332                     	xdef	_I2C_GeneralCallCmd
2333                     	xdef	_I2C_Cmd
2334                     	xdef	_I2C_Init
2335                     	xdef	_I2C_DeInit
2336                     	xref.b	c_lreg
2337                     	xref.b	c_x
2356                     	xref	c_sdivx
2357                     	xref	c_ludv
2358                     	xref	c_rtol
2359                     	xref	c_smul
2360                     	xref	c_lmul
2361                     	xref	c_lcmp
2362                     	xref	c_ltor
2363                     	end
