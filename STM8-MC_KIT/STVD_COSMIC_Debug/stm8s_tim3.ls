   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 62 void TIM3_DeInit(void)
  47                     ; 63 {
  49                     	switch	.text
  50  0000               _TIM3_DeInit:
  54                     ; 65   TIM3->CR1 = (u8)TIM3_CR1_RESET_VALUE;
  56  0000 725f5320      	clr	21280
  57                     ; 66   TIM3->IER = (u8)TIM3_IER_RESET_VALUE;
  59  0004 725f5321      	clr	21281
  60                     ; 67   TIM3->SR2 = (u8)TIM3_SR2_RESET_VALUE;
  62  0008 725f5323      	clr	21283
  63                     ; 70   TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  65  000c 725f5327      	clr	21287
  66                     ; 73   TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  68  0010 725f5327      	clr	21287
  69                     ; 74   TIM3->CCMR1 = (u8)TIM3_CCMR1_RESET_VALUE;
  71  0014 725f5325      	clr	21285
  72                     ; 75   TIM3->CCMR2 = (u8)TIM3_CCMR2_RESET_VALUE;
  74  0018 725f5326      	clr	21286
  75                     ; 76   TIM3->CNTRH = (u8)TIM3_CNTRH_RESET_VALUE;
  77  001c 725f5328      	clr	21288
  78                     ; 77   TIM3->CNTRL = (u8)TIM3_CNTRL_RESET_VALUE;
  80  0020 725f5329      	clr	21289
  81                     ; 78   TIM3->PSCR = (u8)TIM3_PSCR_RESET_VALUE;
  83  0024 725f532a      	clr	21290
  84                     ; 79   TIM3->ARRH  = (u8)TIM3_ARRH_RESET_VALUE;
  86  0028 35ff532b      	mov	21291,#255
  87                     ; 80   TIM3->ARRL  = (u8)TIM3_ARRL_RESET_VALUE;
  89  002c 35ff532c      	mov	21292,#255
  90                     ; 81   TIM3->CCR1H = (u8)TIM3_CCR1H_RESET_VALUE;
  92  0030 725f532d      	clr	21293
  93                     ; 82   TIM3->CCR1L = (u8)TIM3_CCR1L_RESET_VALUE;
  95  0034 725f532e      	clr	21294
  96                     ; 83   TIM3->CCR2H = (u8)TIM3_CCR2H_RESET_VALUE;
  98  0038 725f532f      	clr	21295
  99                     ; 84   TIM3->CCR2L = (u8)TIM3_CCR2L_RESET_VALUE;
 101  003c 725f5330      	clr	21296
 102                     ; 85   TIM3->SR1 = (u8)TIM3_SR1_RESET_VALUE;
 104  0040 725f5322      	clr	21282
 105                     ; 86 }
 108  0044 81            	ret	
 276                     ; 106 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 276                     ; 107                         u16 TIM3_Period)
 276                     ; 108 {
 277                     	switch	.text
 278  0045               _TIM3_TimeBaseInit:
 280       00000000      OFST:	set	0
 283                     ; 110   TIM3->PSCR = (u8)(TIM3_Prescaler);
 285  0045 c7532a        	ld	21290,a
 286  0048 88            	push	a
 287                     ; 112   TIM3->ARRH = (u8)(TIM3_Period >> 8);
 289  0049 7b04          	ld	a,(OFST+4,sp)
 290  004b c7532b        	ld	21291,a
 291                     ; 113   TIM3->ARRL = (u8)(TIM3_Period);
 293  004e 7b05          	ld	a,(OFST+5,sp)
 294  0050 c7532c        	ld	21292,a
 295                     ; 114 }
 298  0053 84            	pop	a
 299  0054 81            	ret	
 456                     ; 137 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 456                     ; 138                   TIM3_OutputState_TypeDef TIM3_OutputState,
 456                     ; 139                   u16 TIM3_Pulse,
 456                     ; 140                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 456                     ; 141 {
 457                     	switch	.text
 458  0055               _TIM3_OC1Init:
 460  0055 89            	pushw	x
 461  0056 88            	push	a
 462       00000001      OFST:	set	1
 465                     ; 143   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 467                     ; 144   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 469                     ; 145   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 471                     ; 148   TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 473  0057 c65327        	ld	a,21287
 474  005a a4fc          	and	a,#252
 475  005c c75327        	ld	21287,a
 476                     ; 150   TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 478  005f 7b08          	ld	a,(OFST+7,sp)
 479  0061 a402          	and	a,#2
 480  0063 6b01          	ld	(OFST+0,sp),a
 481  0065 9f            	ld	a,xl
 482  0066 a401          	and	a,#1
 483  0068 1a01          	or	a,(OFST+0,sp)
 484  006a ca5327        	or	a,21287
 485  006d c75327        	ld	21287,a
 486                     ; 153   TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 488  0070 c65325        	ld	a,21285
 489  0073 a48f          	and	a,#143
 490  0075 1a02          	or	a,(OFST+1,sp)
 491  0077 c75325        	ld	21285,a
 492                     ; 156   TIM3->CCR1H = (u8)(TIM3_Pulse >> 8);
 494  007a 7b06          	ld	a,(OFST+5,sp)
 495  007c c7532d        	ld	21293,a
 496                     ; 157   TIM3->CCR1L = (u8)(TIM3_Pulse);
 498  007f 7b07          	ld	a,(OFST+6,sp)
 499  0081 c7532e        	ld	21294,a
 500                     ; 158 }
 503  0084 5b03          	addw	sp,#3
 504  0086 81            	ret	
 568                     ; 182 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 568                     ; 183                   TIM3_OutputState_TypeDef TIM3_OutputState,
 568                     ; 184                   u16 TIM3_Pulse,
 568                     ; 185                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 568                     ; 186 {
 569                     	switch	.text
 570  0087               _TIM3_OC2Init:
 572  0087 89            	pushw	x
 573  0088 88            	push	a
 574       00000001      OFST:	set	1
 577                     ; 188   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 579                     ; 189   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 581                     ; 190   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 583                     ; 194   TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 585  0089 c65327        	ld	a,21287
 586  008c a4cf          	and	a,#207
 587  008e c75327        	ld	21287,a
 588                     ; 196   TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 590  0091 7b08          	ld	a,(OFST+7,sp)
 591  0093 a420          	and	a,#32
 592  0095 6b01          	ld	(OFST+0,sp),a
 593  0097 9f            	ld	a,xl
 594  0098 a410          	and	a,#16
 595  009a 1a01          	or	a,(OFST+0,sp)
 596  009c ca5327        	or	a,21287
 597  009f c75327        	ld	21287,a
 598                     ; 200   TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 600  00a2 c65326        	ld	a,21286
 601  00a5 a48f          	and	a,#143
 602  00a7 1a02          	or	a,(OFST+1,sp)
 603  00a9 c75326        	ld	21286,a
 604                     ; 204   TIM3->CCR2H = (u8)(TIM3_Pulse >> 8);
 606  00ac 7b06          	ld	a,(OFST+5,sp)
 607  00ae c7532f        	ld	21295,a
 608                     ; 205   TIM3->CCR2L = (u8)(TIM3_Pulse);
 610  00b1 7b07          	ld	a,(OFST+6,sp)
 611  00b3 c75330        	ld	21296,a
 612                     ; 206 }
 615  00b6 5b03          	addw	sp,#3
 616  00b8 81            	ret	
 800                     ; 236 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 800                     ; 237                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 800                     ; 238                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 800                     ; 239                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 800                     ; 240                  u8 TIM3_ICFilter)
 800                     ; 241 {
 801                     	switch	.text
 802  00b9               _TIM3_ICInit:
 804  00b9 89            	pushw	x
 805       00000000      OFST:	set	0
 808                     ; 243   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 810                     ; 244   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 812                     ; 245   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 814                     ; 246   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 816                     ; 247   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 818                     ; 249   if (TIM3_Channel != TIM3_CHANNEL_2)
 820  00ba 9e            	ld	a,xh
 821  00bb 4a            	dec	a
 822  00bc 2714          	jreq	L343
 823                     ; 252     TI1_Config(TIM3_ICPolarity,
 823                     ; 253                TIM3_ICSelection,
 823                     ; 254                TIM3_ICFilter);
 825  00be 7b07          	ld	a,(OFST+7,sp)
 826  00c0 88            	push	a
 827  00c1 7b06          	ld	a,(OFST+6,sp)
 828  00c3 97            	ld	xl,a
 829  00c4 7b03          	ld	a,(OFST+3,sp)
 830  00c6 95            	ld	xh,a
 831  00c7 cd032e        	call	L3_TI1_Config
 833  00ca 84            	pop	a
 834                     ; 257     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 836  00cb 7b06          	ld	a,(OFST+6,sp)
 837  00cd cd0274        	call	_TIM3_SetIC1Prescaler
 840  00d0 2012          	jra	L543
 841  00d2               L343:
 842                     ; 262     TI2_Config(TIM3_ICPolarity,
 842                     ; 263                TIM3_ICSelection,
 842                     ; 264                TIM3_ICFilter);
 844  00d2 7b07          	ld	a,(OFST+7,sp)
 845  00d4 88            	push	a
 846  00d5 7b06          	ld	a,(OFST+6,sp)
 847  00d7 97            	ld	xl,a
 848  00d8 7b03          	ld	a,(OFST+3,sp)
 849  00da 95            	ld	xh,a
 850  00db cd035e        	call	L5_TI2_Config
 852  00de 84            	pop	a
 853                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 855  00df 7b06          	ld	a,(OFST+6,sp)
 856  00e1 cd0281        	call	_TIM3_SetIC2Prescaler
 858  00e4               L543:
 859                     ; 269 }
 862  00e4 85            	popw	x
 863  00e5 81            	ret	
 959                     ; 296 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 959                     ; 297                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 959                     ; 298                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 959                     ; 299                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 959                     ; 300                      u8 TIM3_ICFilter)
 959                     ; 301 {
 960                     	switch	.text
 961  00e6               _TIM3_PWMIConfig:
 963  00e6 89            	pushw	x
 964  00e7 89            	pushw	x
 965       00000002      OFST:	set	2
 968                     ; 302   u8 icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 970                     ; 303   u8 icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
 972                     ; 306   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 974                     ; 307   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 976                     ; 308   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 978                     ; 309   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 980                     ; 312   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 982  00e8 9f            	ld	a,xl
 983  00e9 a144          	cp	a,#68
 984  00eb 2706          	jreq	L514
 985                     ; 314     icpolarity = (u8)TIM3_ICPOLARITY_FALLING;
 987  00ed a644          	ld	a,#68
 988  00ef 6b01          	ld	(OFST-1,sp),a
 990  00f1 2002          	jra	L714
 991  00f3               L514:
 992                     ; 318     icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 994  00f3 0f01          	clr	(OFST-1,sp)
 995  00f5               L714:
 996                     ; 322   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 998  00f5 7b07          	ld	a,(OFST+5,sp)
 999  00f7 4a            	dec	a
1000  00f8 2604          	jrne	L124
1001                     ; 324     icselection = (u8)TIM3_ICSELECTION_INDIRECTTI;
1003  00fa a602          	ld	a,#2
1005  00fc 2002          	jra	L324
1006  00fe               L124:
1007                     ; 328     icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
1009  00fe a601          	ld	a,#1
1010  0100               L324:
1011  0100 6b02          	ld	(OFST+0,sp),a
1012                     ; 331   if (TIM3_Channel != TIM3_CHANNEL_2)
1014  0102 7b03          	ld	a,(OFST+1,sp)
1015  0104 4a            	dec	a
1016  0105 2726          	jreq	L524
1017                     ; 334     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1017                     ; 335                TIM3_ICFilter);
1019  0107 7b09          	ld	a,(OFST+7,sp)
1020  0109 88            	push	a
1021  010a 7b08          	ld	a,(OFST+6,sp)
1022  010c 97            	ld	xl,a
1023  010d 7b05          	ld	a,(OFST+3,sp)
1024  010f 95            	ld	xh,a
1025  0110 cd032e        	call	L3_TI1_Config
1027  0113 84            	pop	a
1028                     ; 338     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1030  0114 7b08          	ld	a,(OFST+6,sp)
1031  0116 cd0274        	call	_TIM3_SetIC1Prescaler
1033                     ; 341     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1035  0119 7b09          	ld	a,(OFST+7,sp)
1036  011b 88            	push	a
1037  011c 7b03          	ld	a,(OFST+1,sp)
1038  011e 97            	ld	xl,a
1039  011f 7b02          	ld	a,(OFST+0,sp)
1040  0121 95            	ld	xh,a
1041  0122 cd035e        	call	L5_TI2_Config
1043  0125 84            	pop	a
1044                     ; 344     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1046  0126 7b08          	ld	a,(OFST+6,sp)
1047  0128 cd0281        	call	_TIM3_SetIC2Prescaler
1050  012b 2024          	jra	L724
1051  012d               L524:
1052                     ; 349     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1052                     ; 350                TIM3_ICFilter);
1054  012d 7b09          	ld	a,(OFST+7,sp)
1055  012f 88            	push	a
1056  0130 7b08          	ld	a,(OFST+6,sp)
1057  0132 97            	ld	xl,a
1058  0133 7b05          	ld	a,(OFST+3,sp)
1059  0135 95            	ld	xh,a
1060  0136 cd035e        	call	L5_TI2_Config
1062  0139 84            	pop	a
1063                     ; 353     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1065  013a 7b08          	ld	a,(OFST+6,sp)
1066  013c cd0281        	call	_TIM3_SetIC2Prescaler
1068                     ; 356     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1070  013f 7b09          	ld	a,(OFST+7,sp)
1071  0141 88            	push	a
1072  0142 7b03          	ld	a,(OFST+1,sp)
1073  0144 97            	ld	xl,a
1074  0145 7b02          	ld	a,(OFST+0,sp)
1075  0147 95            	ld	xh,a
1076  0148 cd032e        	call	L3_TI1_Config
1078  014b 84            	pop	a
1079                     ; 359     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1081  014c 7b08          	ld	a,(OFST+6,sp)
1082  014e cd0274        	call	_TIM3_SetIC1Prescaler
1084  0151               L724:
1085                     ; 361 }
1088  0151 5b04          	addw	sp,#4
1089  0153 81            	ret	
1144                     ; 379 void TIM3_Cmd(FunctionalState NewState)
1144                     ; 380 {
1145                     	switch	.text
1146  0154               _TIM3_Cmd:
1150                     ; 382   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1152                     ; 385   if (NewState != DISABLE)
1154  0154 4d            	tnz	a
1155  0155 2705          	jreq	L754
1156                     ; 387     TIM3->CR1 |= TIM3_CR1_CEN;
1158  0157 72105320      	bset	21280,#0
1161  015b 81            	ret	
1162  015c               L754:
1163                     ; 391     TIM3->CR1 &= (u8)(~TIM3_CR1_CEN);
1165  015c 72115320      	bres	21280,#0
1166                     ; 393 }
1169  0160 81            	ret	
1241                     ; 417 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1241                     ; 418 {
1242                     	switch	.text
1243  0161               _TIM3_ITConfig:
1245  0161 89            	pushw	x
1246       00000000      OFST:	set	0
1249                     ; 420   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1251                     ; 421   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1253                     ; 423   if (NewState != DISABLE)
1255  0162 9f            	ld	a,xl
1256  0163 4d            	tnz	a
1257  0164 2706          	jreq	L715
1258                     ; 426     TIM3->IER |= TIM3_IT;
1260  0166 9e            	ld	a,xh
1261  0167 ca5321        	or	a,21281
1263  016a 2006          	jra	L125
1264  016c               L715:
1265                     ; 431     TIM3->IER &= (u8)(~TIM3_IT);
1267  016c 7b01          	ld	a,(OFST+1,sp)
1268  016e 43            	cpl	a
1269  016f c45321        	and	a,21281
1270  0172               L125:
1271  0172 c75321        	ld	21281,a
1272                     ; 433 }
1275  0175 85            	popw	x
1276  0176 81            	ret	
1312                     ; 451 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1312                     ; 452 {
1313                     	switch	.text
1314  0177               _TIM3_UpdateDisableConfig:
1318                     ; 454   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1320                     ; 457   if (NewState != DISABLE)
1322  0177 4d            	tnz	a
1323  0178 2705          	jreq	L145
1324                     ; 459     TIM3->CR1 |= TIM3_CR1_UDIS;
1326  017a 72125320      	bset	21280,#1
1329  017e 81            	ret	
1330  017f               L145:
1331                     ; 463     TIM3->CR1 &= (u8)(~TIM3_CR1_UDIS);
1333  017f 72135320      	bres	21280,#1
1334                     ; 465 }
1337  0183 81            	ret	
1395                     ; 484 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1395                     ; 485 {
1396                     	switch	.text
1397  0184               _TIM3_UpdateRequestConfig:
1401                     ; 487   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1403                     ; 490   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1405  0184 4d            	tnz	a
1406  0185 2705          	jreq	L375
1407                     ; 492     TIM3->CR1 |= TIM3_CR1_URS;
1409  0187 72145320      	bset	21280,#2
1412  018b 81            	ret	
1413  018c               L375:
1414                     ; 496     TIM3->CR1 &= (u8)(~TIM3_CR1_URS);
1416  018c 72155320      	bres	21280,#2
1417                     ; 498 }
1420  0190 81            	ret	
1477                     ; 518 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1477                     ; 519 {
1478                     	switch	.text
1479  0191               _TIM3_SelectOnePulseMode:
1483                     ; 521   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1485                     ; 524   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1487  0191 4d            	tnz	a
1488  0192 2705          	jreq	L526
1489                     ; 526     TIM3->CR1 |= TIM3_CR1_OPM;
1491  0194 72165320      	bset	21280,#3
1494  0198 81            	ret	
1495  0199               L526:
1496                     ; 530     TIM3->CR1 &= (u8)(~TIM3_CR1_OPM);
1498  0199 72175320      	bres	21280,#3
1499                     ; 533 }
1502  019d 81            	ret	
1570                     ; 573 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1570                     ; 574                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1570                     ; 575 {
1571                     	switch	.text
1572  019e               _TIM3_PrescalerConfig:
1576                     ; 577   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1578                     ; 578   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1580                     ; 581   TIM3->PSCR = Prescaler;
1582  019e 9e            	ld	a,xh
1583  019f c7532a        	ld	21290,a
1584                     ; 584   TIM3->EGR = TIM3_PSCReloadMode;
1586  01a2 9f            	ld	a,xl
1587  01a3 c75324        	ld	21284,a
1588                     ; 585 }
1591  01a6 81            	ret	
1649                     ; 605 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1649                     ; 606 {
1650                     	switch	.text
1651  01a7               _TIM3_ForcedOC1Config:
1653  01a7 88            	push	a
1654       00000000      OFST:	set	0
1657                     ; 608   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1659                     ; 611   TIM3->CCMR1 =  (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM))  | (u8)TIM3_ForcedAction);
1661  01a8 c65325        	ld	a,21285
1662  01ab a48f          	and	a,#143
1663  01ad 1a01          	or	a,(OFST+1,sp)
1664  01af c75325        	ld	21285,a
1665                     ; 612 }
1668  01b2 84            	pop	a
1669  01b3 81            	ret	
1705                     ; 632 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1705                     ; 633 {
1706                     	switch	.text
1707  01b4               _TIM3_ForcedOC2Config:
1709  01b4 88            	push	a
1710       00000000      OFST:	set	0
1713                     ; 635   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1715                     ; 638   TIM3->CCMR2 =  (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_ForcedAction);
1717  01b5 c65326        	ld	a,21286
1718  01b8 a48f          	and	a,#143
1719  01ba 1a01          	or	a,(OFST+1,sp)
1720  01bc c75326        	ld	21286,a
1721                     ; 639 }
1724  01bf 84            	pop	a
1725  01c0 81            	ret	
1761                     ; 657 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1761                     ; 658 {
1762                     	switch	.text
1763  01c1               _TIM3_ARRPreloadConfig:
1767                     ; 660   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1769                     ; 663   if (NewState != DISABLE)
1771  01c1 4d            	tnz	a
1772  01c2 2705          	jreq	L547
1773                     ; 665     TIM3->CR1 |= TIM3_CR1_ARPE;
1775  01c4 721e5320      	bset	21280,#7
1778  01c8 81            	ret	
1779  01c9               L547:
1780                     ; 669     TIM3->CR1 &= (u8)(~TIM3_CR1_ARPE);
1782  01c9 721f5320      	bres	21280,#7
1783                     ; 671 }
1786  01cd 81            	ret	
1822                     ; 689 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1822                     ; 690 {
1823                     	switch	.text
1824  01ce               _TIM3_OC1PreloadConfig:
1828                     ; 692   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1830                     ; 695   if (NewState != DISABLE)
1832  01ce 4d            	tnz	a
1833  01cf 2705          	jreq	L767
1834                     ; 697     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1836  01d1 72165325      	bset	21285,#3
1839  01d5 81            	ret	
1840  01d6               L767:
1841                     ; 701     TIM3->CCMR1 &= (u8)(~TIM3_CCMR_OCxPE);
1843  01d6 72175325      	bres	21285,#3
1844                     ; 703 }
1847  01da 81            	ret	
1883                     ; 721 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1883                     ; 722 {
1884                     	switch	.text
1885  01db               _TIM3_OC2PreloadConfig:
1889                     ; 724   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1891                     ; 727   if (NewState != DISABLE)
1893  01db 4d            	tnz	a
1894  01dc 2705          	jreq	L1101
1895                     ; 729     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1897  01de 72165326      	bset	21286,#3
1900  01e2 81            	ret	
1901  01e3               L1101:
1902                     ; 733     TIM3->CCMR2 &= (u8)(~TIM3_CCMR_OCxPE);
1904  01e3 72175326      	bres	21286,#3
1905                     ; 735 }
1908  01e7 81            	ret	
1973                     ; 755 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1973                     ; 756 {
1974                     	switch	.text
1975  01e8               _TIM3_GenerateEvent:
1979                     ; 758   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1981                     ; 761   TIM3->EGR = TIM3_EventSource;
1983  01e8 c75324        	ld	21284,a
1984                     ; 762 }
1987  01eb 81            	ret	
2023                     ; 782 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2023                     ; 783 {
2024                     	switch	.text
2025  01ec               _TIM3_OC1PolarityConfig:
2029                     ; 785   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2031                     ; 788   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2033  01ec 4d            	tnz	a
2034  01ed 2705          	jreq	L3601
2035                     ; 790     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2037  01ef 72125327      	bset	21287,#1
2040  01f3 81            	ret	
2041  01f4               L3601:
2042                     ; 794     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
2044  01f4 72135327      	bres	21287,#1
2045                     ; 796 }
2048  01f8 81            	ret	
2084                     ; 816 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2084                     ; 817 {
2085                     	switch	.text
2086  01f9               _TIM3_OC2PolarityConfig:
2090                     ; 819   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2092                     ; 822   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2094  01f9 4d            	tnz	a
2095  01fa 2705          	jreq	L5011
2096                     ; 824     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2098  01fc 721a5327      	bset	21287,#5
2101  0200 81            	ret	
2102  0201               L5011:
2103                     ; 828     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
2105  0201 721b5327      	bres	21287,#5
2106                     ; 830 }
2109  0205 81            	ret	
2154                     ; 852 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2154                     ; 853 {
2155                     	switch	.text
2156  0206               _TIM3_CCxCmd:
2158  0206 89            	pushw	x
2159       00000000      OFST:	set	0
2162                     ; 855   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2164                     ; 856   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2166                     ; 858   if (TIM3_Channel == TIM3_CHANNEL_1)
2168  0207 9e            	ld	a,xh
2169  0208 4d            	tnz	a
2170  0209 2610          	jrne	L3311
2171                     ; 861     if (NewState != DISABLE)
2173  020b 9f            	ld	a,xl
2174  020c 4d            	tnz	a
2175  020d 2706          	jreq	L5311
2176                     ; 863       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2178  020f 72105327      	bset	21287,#0
2180  0213 2014          	jra	L1411
2181  0215               L5311:
2182                     ; 867       TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2184  0215 72115327      	bres	21287,#0
2185  0219 200e          	jra	L1411
2186  021b               L3311:
2187                     ; 874     if (NewState != DISABLE)
2189  021b 7b02          	ld	a,(OFST+2,sp)
2190  021d 2706          	jreq	L3411
2191                     ; 876       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2193  021f 72185327      	bset	21287,#4
2195  0223 2004          	jra	L1411
2196  0225               L3411:
2197                     ; 880       TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2199  0225 72195327      	bres	21287,#4
2200  0229               L1411:
2201                     ; 884 }
2204  0229 85            	popw	x
2205  022a 81            	ret	
2250                     ; 914 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2250                     ; 915 {
2251                     	switch	.text
2252  022b               _TIM3_SelectOCxM:
2254  022b 89            	pushw	x
2255       00000000      OFST:	set	0
2258                     ; 917   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2260                     ; 918   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2262                     ; 920   if (TIM3_Channel == TIM3_CHANNEL_1)
2264  022c 9e            	ld	a,xh
2265  022d 4d            	tnz	a
2266  022e 2610          	jrne	L1711
2267                     ; 923     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2269  0230 72115327      	bres	21287,#0
2270                     ; 926     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2272  0234 c65325        	ld	a,21285
2273  0237 a48f          	and	a,#143
2274  0239 1a02          	or	a,(OFST+2,sp)
2275  023b c75325        	ld	21285,a
2277  023e 200e          	jra	L3711
2278  0240               L1711:
2279                     ; 931     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2281  0240 72195327      	bres	21287,#4
2282                     ; 934     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2284  0244 c65326        	ld	a,21286
2285  0247 a48f          	and	a,#143
2286  0249 1a02          	or	a,(OFST+2,sp)
2287  024b c75326        	ld	21286,a
2288  024e               L3711:
2289                     ; 936 }
2292  024e 85            	popw	x
2293  024f 81            	ret	
2327                     ; 954 void TIM3_SetCounter(u16 Counter)
2327                     ; 955 {
2328                     	switch	.text
2329  0250               _TIM3_SetCounter:
2333                     ; 957   TIM3->CNTRH = (u8)(Counter >> 8);
2335  0250 9e            	ld	a,xh
2336  0251 c75328        	ld	21288,a
2337                     ; 958   TIM3->CNTRL = (u8)(Counter);
2339  0254 9f            	ld	a,xl
2340  0255 c75329        	ld	21289,a
2341                     ; 960 }
2344  0258 81            	ret	
2378                     ; 978 void TIM3_SetAutoreload(u16 Autoreload)
2378                     ; 979 {
2379                     	switch	.text
2380  0259               _TIM3_SetAutoreload:
2384                     ; 981   TIM3->ARRH = (u8)(Autoreload >> 8);
2386  0259 9e            	ld	a,xh
2387  025a c7532b        	ld	21291,a
2388                     ; 982   TIM3->ARRL = (u8)(Autoreload);
2390  025d 9f            	ld	a,xl
2391  025e c7532c        	ld	21292,a
2392                     ; 983 }
2395  0261 81            	ret	
2429                     ; 1001 void TIM3_SetCompare1(u16 Compare1)
2429                     ; 1002 {
2430                     	switch	.text
2431  0262               _TIM3_SetCompare1:
2435                     ; 1004   TIM3->CCR1H = (u8)(Compare1 >> 8);
2437  0262 9e            	ld	a,xh
2438  0263 c7532d        	ld	21293,a
2439                     ; 1005   TIM3->CCR1L = (u8)(Compare1);
2441  0266 9f            	ld	a,xl
2442  0267 c7532e        	ld	21294,a
2443                     ; 1006 }
2446  026a 81            	ret	
2480                     ; 1024 void TIM3_SetCompare2(u16 Compare2)
2480                     ; 1025 {
2481                     	switch	.text
2482  026b               _TIM3_SetCompare2:
2486                     ; 1027   TIM3->CCR2H = (u8)(Compare2 >> 8);
2488  026b 9e            	ld	a,xh
2489  026c c7532f        	ld	21295,a
2490                     ; 1028   TIM3->CCR2L = (u8)(Compare2);
2492  026f 9f            	ld	a,xl
2493  0270 c75330        	ld	21296,a
2494                     ; 1029 }
2497  0273 81            	ret	
2533                     ; 1051 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2533                     ; 1052 {
2534                     	switch	.text
2535  0274               _TIM3_SetIC1Prescaler:
2537  0274 88            	push	a
2538       00000000      OFST:	set	0
2541                     ; 1054   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2543                     ; 1057   TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC1Prescaler);
2545  0275 c65325        	ld	a,21285
2546  0278 a4f3          	and	a,#243
2547  027a 1a01          	or	a,(OFST+1,sp)
2548  027c c75325        	ld	21285,a
2549                     ; 1058 }
2552  027f 84            	pop	a
2553  0280 81            	ret	
2589                     ; 1079 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2589                     ; 1080 {
2590                     	switch	.text
2591  0281               _TIM3_SetIC2Prescaler:
2593  0281 88            	push	a
2594       00000000      OFST:	set	0
2597                     ; 1082   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2599                     ; 1085   TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC2Prescaler);
2601  0282 c65326        	ld	a,21286
2602  0285 a4f3          	and	a,#243
2603  0287 1a01          	or	a,(OFST+1,sp)
2604  0289 c75326        	ld	21286,a
2605                     ; 1086 }
2608  028c 84            	pop	a
2609  028d 81            	ret	
2661                     ; 1103 u16 TIM3_GetCapture1(void)
2661                     ; 1104 {
2662                     	switch	.text
2663  028e               _TIM3_GetCapture1:
2665  028e 5204          	subw	sp,#4
2666       00000004      OFST:	set	4
2669                     ; 1106    u16 tmpccr1 = 0;
2671                     ; 1107    u8 tmpccr1l=0, tmpccr1h=0;
2675                     ; 1109     tmpccr1h = TIM3->CCR1H;
2677  0290 c6532d        	ld	a,21293
2678  0293 6b02          	ld	(OFST-2,sp),a
2679                     ; 1110 	tmpccr1l = TIM3->CCR1L;
2681  0295 c6532e        	ld	a,21294
2682  0298 6b01          	ld	(OFST-3,sp),a
2683                     ; 1112     tmpccr1 = (u16)(tmpccr1l);
2685  029a 5f            	clrw	x
2686  029b 97            	ld	xl,a
2687  029c 1f03          	ldw	(OFST-1,sp),x
2688                     ; 1113     tmpccr1 |= (u16)((u16)tmpccr1h << 8);
2690  029e 5f            	clrw	x
2691  029f 7b02          	ld	a,(OFST-2,sp)
2692  02a1 97            	ld	xl,a
2693  02a2 7b04          	ld	a,(OFST+0,sp)
2694  02a4 01            	rrwa	x,a
2695  02a5 1a03          	or	a,(OFST-1,sp)
2696  02a7 01            	rrwa	x,a
2697                     ; 1115     return (u16)tmpccr1;
2701  02a8 5b04          	addw	sp,#4
2702  02aa 81            	ret	
2754                     ; 1134 u16 TIM3_GetCapture2(void)
2754                     ; 1135 {
2755                     	switch	.text
2756  02ab               _TIM3_GetCapture2:
2758  02ab 5204          	subw	sp,#4
2759       00000004      OFST:	set	4
2762                     ; 1137    u16 tmpccr2 = 0;
2764                     ; 1138    u8 tmpccr2l=0, tmpccr2h=0;
2768                     ; 1140     tmpccr2h = TIM3->CCR2H;
2770  02ad c6532f        	ld	a,21295
2771  02b0 6b02          	ld	(OFST-2,sp),a
2772                     ; 1141 	tmpccr2l = TIM3->CCR2L;
2774  02b2 c65330        	ld	a,21296
2775  02b5 6b01          	ld	(OFST-3,sp),a
2776                     ; 1143     tmpccr2 = (u16)(tmpccr2l);
2778  02b7 5f            	clrw	x
2779  02b8 97            	ld	xl,a
2780  02b9 1f03          	ldw	(OFST-1,sp),x
2781                     ; 1144     tmpccr2 |= (u16)((u16)tmpccr2h << 8);
2783  02bb 5f            	clrw	x
2784  02bc 7b02          	ld	a,(OFST-2,sp)
2785  02be 97            	ld	xl,a
2786  02bf 7b04          	ld	a,(OFST+0,sp)
2787  02c1 01            	rrwa	x,a
2788  02c2 1a03          	or	a,(OFST-1,sp)
2789  02c4 01            	rrwa	x,a
2790                     ; 1146     return (u16)tmpccr2;
2794  02c5 5b04          	addw	sp,#4
2795  02c7 81            	ret	
2818                     ; 1165 u16 TIM3_GetCounter(void)
2818                     ; 1166 {
2819                     	switch	.text
2820  02c8               _TIM3_GetCounter:
2822  02c8 89            	pushw	x
2823       00000002      OFST:	set	2
2826                     ; 1168   return (u16)(((u16)TIM3->CNTRH << 8) | (u16)(TIM3->CNTRL));
2828  02c9 c65329        	ld	a,21289
2829  02cc 5f            	clrw	x
2830  02cd 97            	ld	xl,a
2831  02ce 1f01          	ldw	(OFST-1,sp),x
2832  02d0 5f            	clrw	x
2833  02d1 c65328        	ld	a,21288
2834  02d4 97            	ld	xl,a
2835  02d5 7b02          	ld	a,(OFST+0,sp)
2836  02d7 01            	rrwa	x,a
2837  02d8 1a01          	or	a,(OFST-1,sp)
2838  02da 01            	rrwa	x,a
2841  02db 5b02          	addw	sp,#2
2842  02dd 81            	ret	
2866                     ; 1188 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2866                     ; 1189 {
2867                     	switch	.text
2868  02de               _TIM3_GetPrescaler:
2872                     ; 1191   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2874  02de c6532a        	ld	a,21290
2877  02e1 81            	ret	
3002                     ; 1216 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3002                     ; 1217 {
3003                     	switch	.text
3004  02e2               _TIM3_GetFlagStatus:
3006  02e2 5203          	subw	sp,#3
3007       00000003      OFST:	set	3
3010                     ; 1218   FlagStatus bitstatus = RESET;
3012                     ; 1222   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3014                     ; 1224   tim3_flag_l = (u8)(TIM3_FLAG);
3016  02e4 9f            	ld	a,xl
3017  02e5 6b02          	ld	(OFST-1,sp),a
3018                     ; 1225   tim3_flag_h = (u8)(TIM3_FLAG >> 8);
3020  02e7 9e            	ld	a,xh
3021  02e8 6b03          	ld	(OFST+0,sp),a
3022                     ; 1227   if (((TIM3->SR1 & tim3_flag_l) | (TIM3->SR2 & tim3_flag_h)) != (u8)RESET )
3024  02ea c45323        	and	a,21283
3025  02ed 6b01          	ld	(OFST-2,sp),a
3026  02ef c65322        	ld	a,21282
3027  02f2 1402          	and	a,(OFST-1,sp)
3028  02f4 1a01          	or	a,(OFST-2,sp)
3029  02f6 2702          	jreq	L5741
3030                     ; 1229     bitstatus = SET;
3032  02f8 a601          	ld	a,#1
3034  02fa               L5741:
3035                     ; 1233     bitstatus = RESET;
3037                     ; 1235   return (FlagStatus)bitstatus;
3041  02fa 5b03          	addw	sp,#3
3042  02fc 81            	ret	
3077                     ; 1259 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3077                     ; 1260 {
3078                     	switch	.text
3079  02fd               _TIM3_ClearFlag:
3081  02fd 89            	pushw	x
3082       00000000      OFST:	set	0
3085                     ; 1262   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3087                     ; 1265   TIM3->SR1 = (u8)(~((u8)(TIM3_FLAG)));
3089  02fe 9f            	ld	a,xl
3090  02ff 43            	cpl	a
3091  0300 c75322        	ld	21282,a
3092                     ; 1266   TIM3->SR2 = (u8)(~((u8)(TIM3_FLAG >> 8)));
3094  0303 7b01          	ld	a,(OFST+1,sp)
3095  0305 43            	cpl	a
3096  0306 c75323        	ld	21283,a
3097                     ; 1267 }
3100  0309 85            	popw	x
3101  030a 81            	ret	
3165                     ; 1290 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3165                     ; 1291 {
3166                     	switch	.text
3167  030b               _TIM3_GetITStatus:
3169  030b 88            	push	a
3170  030c 89            	pushw	x
3171       00000002      OFST:	set	2
3174                     ; 1292   ITStatus bitstatus = RESET;
3176                     ; 1294   u8 TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
3180                     ; 1297   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3182                     ; 1299   TIM3_itStatus = (u8)(TIM3->SR1 & TIM3_IT);
3184  030d c45322        	and	a,21282
3185  0310 6b01          	ld	(OFST-1,sp),a
3186                     ; 1301   TIM3_itEnable = (u8)(TIM3->IER & TIM3_IT);
3188  0312 c65321        	ld	a,21281
3189  0315 1403          	and	a,(OFST+1,sp)
3190  0317 6b02          	ld	(OFST+0,sp),a
3191                     ; 1303   if ((TIM3_itStatus != (u8)RESET ) && (TIM3_itEnable != (u8)RESET ))
3193  0319 7b01          	ld	a,(OFST-1,sp)
3194  031b 2708          	jreq	L1551
3196  031d 7b02          	ld	a,(OFST+0,sp)
3197  031f 2704          	jreq	L1551
3198                     ; 1305     bitstatus = SET;
3200  0321 a601          	ld	a,#1
3202  0323 2001          	jra	L3551
3203  0325               L1551:
3204                     ; 1309     bitstatus = RESET;
3206  0325 4f            	clr	a
3207  0326               L3551:
3208                     ; 1311   return (ITStatus)(bitstatus);
3212  0326 5b03          	addw	sp,#3
3213  0328 81            	ret	
3249                     ; 1333 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3249                     ; 1334 {
3250                     	switch	.text
3251  0329               _TIM3_ClearITPendingBit:
3255                     ; 1336   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3257                     ; 1339   TIM3->SR1 = (u8)(~TIM3_IT);
3259  0329 43            	cpl	a
3260  032a c75322        	ld	21282,a
3261                     ; 1340 }
3264  032d 81            	ret	
3316                     ; 1368 static void TI1_Config(u8 TIM3_ICPolarity,
3316                     ; 1369                        u8 TIM3_ICSelection,
3316                     ; 1370                        u8 TIM3_ICFilter)
3316                     ; 1371 {
3317                     	switch	.text
3318  032e               L3_TI1_Config:
3320  032e 89            	pushw	x
3321       00000001      OFST:	set	1
3324                     ; 1373   TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
3326  032f 72115327      	bres	21287,#0
3327  0333 88            	push	a
3328                     ; 1376   TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3330  0334 7b06          	ld	a,(OFST+5,sp)
3331  0336 97            	ld	xl,a
3332  0337 a610          	ld	a,#16
3333  0339 42            	mul	x,a
3334  033a 9f            	ld	a,xl
3335  033b 1a03          	or	a,(OFST+2,sp)
3336  033d 6b01          	ld	(OFST+0,sp),a
3337  033f c65325        	ld	a,21285
3338  0342 a40c          	and	a,#12
3339  0344 1a01          	or	a,(OFST+0,sp)
3340  0346 c75325        	ld	21285,a
3341                     ; 1379   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3343  0349 7b02          	ld	a,(OFST+1,sp)
3344  034b 2706          	jreq	L1261
3345                     ; 1381     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3347  034d 72125327      	bset	21287,#1
3349  0351 2004          	jra	L3261
3350  0353               L1261:
3351                     ; 1385     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
3353  0353 72135327      	bres	21287,#1
3354  0357               L3261:
3355                     ; 1388   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3357  0357 72105327      	bset	21287,#0
3358                     ; 1389 }
3361  035b 5b03          	addw	sp,#3
3362  035d 81            	ret	
3414                     ; 1417 static void TI2_Config(u8 TIM3_ICPolarity,
3414                     ; 1418                        u8 TIM3_ICSelection,
3414                     ; 1419                        u8 TIM3_ICFilter)
3414                     ; 1420 {
3415                     	switch	.text
3416  035e               L5_TI2_Config:
3418  035e 89            	pushw	x
3419       00000001      OFST:	set	1
3422                     ; 1422   TIM3->CCER1 &=  (u8)(~TIM3_CCER1_CC2E);
3424  035f 72195327      	bres	21287,#4
3425  0363 88            	push	a
3426                     ; 1425   TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3428  0364 7b06          	ld	a,(OFST+5,sp)
3429  0366 97            	ld	xl,a
3430  0367 a610          	ld	a,#16
3431  0369 42            	mul	x,a
3432  036a 9f            	ld	a,xl
3433  036b 1a03          	or	a,(OFST+2,sp)
3434  036d 6b01          	ld	(OFST+0,sp),a
3435  036f c65326        	ld	a,21286
3436  0372 a40c          	and	a,#12
3437  0374 1a01          	or	a,(OFST+0,sp)
3438  0376 c75326        	ld	21286,a
3439                     ; 1429   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3441  0379 7b02          	ld	a,(OFST+1,sp)
3442  037b 2706          	jreq	L3561
3443                     ; 1431     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3445  037d 721a5327      	bset	21287,#5
3447  0381 2004          	jra	L5561
3448  0383               L3561:
3449                     ; 1435     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
3451  0383 721b5327      	bres	21287,#5
3452  0387               L5561:
3453                     ; 1439   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3455  0387 72185327      	bset	21287,#4
3456                     ; 1441 }
3459  038b 5b03          	addw	sp,#3
3460  038d 81            	ret	
3527                     ; 1461 u32 TIM3_ComputeLsiClockFreq(u32 TimerClockFreq)
3527                     ; 1462 {
3528                     	switch	.text
3529  038e               _TIM3_ComputeLsiClockFreq:
3531  038e 520c          	subw	sp,#12
3532       0000000c      OFST:	set	12
3535                     ; 1467   TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI, TIM3_ICPSC_DIV8, 0);
3537  0390 4b00          	push	#0
3538  0392 4b0c          	push	#12
3539  0394 4b01          	push	#1
3540  0396 5f            	clrw	x
3541  0397 cd00b9        	call	_TIM3_ICInit
3543  039a 5b03          	addw	sp,#3
3544                     ; 1471   TIM3_ITConfig(TIM3_IT_CC1, ENABLE);
3546  039c ae0201        	ldw	x,#513
3547  039f cd0161        	call	_TIM3_ITConfig
3549                     ; 1474   TIM3_Cmd(ENABLE);
3551  03a2 a601          	ld	a,#1
3552  03a4 cd0154        	call	_TIM3_Cmd
3554                     ; 1476   TIM3->SR1 = 0x00;
3556  03a7 725f5322      	clr	21282
3557                     ; 1477   TIM3->SR2 = 0x00;
3559  03ab 725f5323      	clr	21283
3560                     ; 1480   TIM3_ClearFlag(TIM3_FLAG_CC1);
3562  03af ae0002        	ldw	x,#2
3563  03b2 cd02fd        	call	_TIM3_ClearFlag
3566  03b5               L3171:
3567                     ; 1483   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
3569  03b5 72035322fb    	btjf	21282,#1,L3171
3570                     ; 1485   ICValue1 = TIM3_GetCapture1();
3572  03ba cd028e        	call	_TIM3_GetCapture1
3574  03bd 1f09          	ldw	(OFST-3,sp),x
3575                     ; 1486   TIM3_ClearFlag(TIM3_FLAG_CC1);
3577  03bf ae0002        	ldw	x,#2
3578  03c2 cd02fd        	call	_TIM3_ClearFlag
3581  03c5               L1271:
3582                     ; 1489   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
3584  03c5 72035322fb    	btjf	21282,#1,L1271
3585                     ; 1491   ICValue2 = TIM3_GetCapture1();
3587  03ca cd028e        	call	_TIM3_GetCapture1
3589  03cd 1f0b          	ldw	(OFST-1,sp),x
3590                     ; 1492   TIM3_ClearFlag(TIM3_FLAG_CC1);
3592  03cf ae0002        	ldw	x,#2
3593  03d2 cd02fd        	call	_TIM3_ClearFlag
3595                     ; 1495   TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
3597  03d5 72115327      	bres	21287,#0
3598                     ; 1497   TIM3->CCMR1 = 0x00;
3600  03d9 725f5325      	clr	21285
3601                     ; 1499   TIM3_Cmd(DISABLE);
3603  03dd 4f            	clr	a
3604  03de cd0154        	call	_TIM3_Cmd
3606                     ; 1502   LSIClockFreq = (8 * TimerClockFreq) / (ICValue2 - ICValue1);
3608  03e1 1e0b          	ldw	x,(OFST-1,sp)
3609  03e3 72f009        	subw	x,(OFST-3,sp)
3610  03e6 cd0000        	call	c_uitolx
3612  03e9 96            	ldw	x,sp
3613  03ea 5c            	incw	x
3614  03eb cd0000        	call	c_rtol
3616  03ee 96            	ldw	x,sp
3617  03ef 1c000f        	addw	x,#OFST+3
3618  03f2 cd0000        	call	c_ltor
3620  03f5 a603          	ld	a,#3
3621  03f7 cd0000        	call	c_llsh
3623  03fa 96            	ldw	x,sp
3624  03fb 5c            	incw	x
3625  03fc cd0000        	call	c_ludv
3627  03ff 96            	ldw	x,sp
3628  0400 1c0005        	addw	x,#OFST-7
3629  0403 cd0000        	call	c_rtol
3631                     ; 1503   return (u32)LSIClockFreq;
3633  0406 96            	ldw	x,sp
3634  0407 1c0005        	addw	x,#OFST-7
3635  040a cd0000        	call	c_ltor
3639  040d 5b0c          	addw	sp,#12
3640  040f 81            	ret	
3653                     	xdef	_TIM3_ComputeLsiClockFreq
3654                     	xdef	_TIM3_ClearITPendingBit
3655                     	xdef	_TIM3_GetITStatus
3656                     	xdef	_TIM3_ClearFlag
3657                     	xdef	_TIM3_GetFlagStatus
3658                     	xdef	_TIM3_GetPrescaler
3659                     	xdef	_TIM3_GetCounter
3660                     	xdef	_TIM3_GetCapture2
3661                     	xdef	_TIM3_GetCapture1
3662                     	xdef	_TIM3_SetIC2Prescaler
3663                     	xdef	_TIM3_SetIC1Prescaler
3664                     	xdef	_TIM3_SetCompare2
3665                     	xdef	_TIM3_SetCompare1
3666                     	xdef	_TIM3_SetAutoreload
3667                     	xdef	_TIM3_SetCounter
3668                     	xdef	_TIM3_SelectOCxM
3669                     	xdef	_TIM3_CCxCmd
3670                     	xdef	_TIM3_OC2PolarityConfig
3671                     	xdef	_TIM3_OC1PolarityConfig
3672                     	xdef	_TIM3_GenerateEvent
3673                     	xdef	_TIM3_OC2PreloadConfig
3674                     	xdef	_TIM3_OC1PreloadConfig
3675                     	xdef	_TIM3_ARRPreloadConfig
3676                     	xdef	_TIM3_ForcedOC2Config
3677                     	xdef	_TIM3_ForcedOC1Config
3678                     	xdef	_TIM3_PrescalerConfig
3679                     	xdef	_TIM3_SelectOnePulseMode
3680                     	xdef	_TIM3_UpdateRequestConfig
3681                     	xdef	_TIM3_UpdateDisableConfig
3682                     	xdef	_TIM3_ITConfig
3683                     	xdef	_TIM3_Cmd
3684                     	xdef	_TIM3_PWMIConfig
3685                     	xdef	_TIM3_ICInit
3686                     	xdef	_TIM3_OC2Init
3687                     	xdef	_TIM3_OC1Init
3688                     	xdef	_TIM3_TimeBaseInit
3689                     	xdef	_TIM3_DeInit
3690                     	xref.b	c_x
3709                     	xref	c_ludv
3710                     	xref	c_rtol
3711                     	xref	c_uitolx
3712                     	xref	c_llsh
3713                     	xref	c_ltor
3714                     	end
