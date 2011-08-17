   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 60 void TIM4_DeInit(void)
  47                     ; 61 {
  49                     	switch	.text
  50  0000               _TIM4_DeInit:
  54                     ; 62   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  56  0000 725f5340      	clr	21312
  57                     ; 63   TIM4->IER = TIM4_IER_RESET_VALUE;
  59  0004 725f5341      	clr	21313
  60                     ; 64   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  62  0008 725f5344      	clr	21316
  63                     ; 65   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  65  000c 725f5345      	clr	21317
  66                     ; 66   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  68  0010 35ff5346      	mov	21318,#255
  69                     ; 67   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  71  0014 725f5342      	clr	21314
  72                     ; 68 }
  75  0018 81            	ret	
 181                     ; 87 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, u8 TIM4_Period)
 181                     ; 88 {
 182                     	switch	.text
 183  0019               _TIM4_TimeBaseInit:
 187                     ; 90   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 189                     ; 92   TIM4->PSCR = (u8)(TIM4_Prescaler);
 191  0019 9e            	ld	a,xh
 192  001a c75345        	ld	21317,a
 193                     ; 94   TIM4->ARR = (u8)(TIM4_Period);
 195  001d 9f            	ld	a,xl
 196  001e c75346        	ld	21318,a
 197                     ; 95 }
 200  0021 81            	ret	
 255                     ; 114 void TIM4_Cmd(FunctionalState NewState)
 255                     ; 115 {
 256                     	switch	.text
 257  0022               _TIM4_Cmd:
 261                     ; 117   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 263                     ; 120   if (NewState != DISABLE)
 265  0022 4d            	tnz	a
 266  0023 2705          	jreq	L511
 267                     ; 122     TIM4->CR1 |= TIM4_CR1_CEN;
 269  0025 72105340      	bset	21312,#0
 272  0029 81            	ret	
 273  002a               L511:
 274                     ; 126     TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);
 276  002a 72115340      	bres	21312,#0
 277                     ; 128 }
 280  002e 81            	ret	
 338                     ; 149 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 338                     ; 150 {
 339                     	switch	.text
 340  002f               _TIM4_ITConfig:
 342  002f 89            	pushw	x
 343       00000000      OFST:	set	0
 346                     ; 152   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 348                     ; 153   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 350                     ; 155   if (NewState != DISABLE)
 352  0030 9f            	ld	a,xl
 353  0031 4d            	tnz	a
 354  0032 2706          	jreq	L151
 355                     ; 158     TIM4->IER |= TIM4_IT;
 357  0034 9e            	ld	a,xh
 358  0035 ca5341        	or	a,21313
 360  0038 2006          	jra	L351
 361  003a               L151:
 362                     ; 163     TIM4->IER &= (u8)(~TIM4_IT);
 364  003a 7b01          	ld	a,(OFST+1,sp)
 365  003c 43            	cpl	a
 366  003d c45341        	and	a,21313
 367  0040               L351:
 368  0040 c75341        	ld	21313,a
 369                     ; 165 }
 372  0043 85            	popw	x
 373  0044 81            	ret	
 409                     ; 182 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 409                     ; 183 {
 410                     	switch	.text
 411  0045               _TIM4_UpdateDisableConfig:
 415                     ; 185   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 188   if (NewState != DISABLE)
 419  0045 4d            	tnz	a
 420  0046 2705          	jreq	L371
 421                     ; 190     TIM4->CR1 |= TIM4_CR1_UDIS;
 423  0048 72125340      	bset	21312,#1
 426  004c 81            	ret	
 427  004d               L371:
 428                     ; 194     TIM4->CR1 &= (u8)(~TIM4_CR1_UDIS);
 430  004d 72135340      	bres	21312,#1
 431                     ; 196 }
 434  0051 81            	ret	
 492                     ; 215 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 492                     ; 216 {
 493                     	switch	.text
 494  0052               _TIM4_UpdateRequestConfig:
 498                     ; 218   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 500                     ; 221   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 502  0052 4d            	tnz	a
 503  0053 2705          	jreq	L522
 504                     ; 223     TIM4->CR1 |= TIM4_CR1_URS;
 506  0055 72145340      	bset	21312,#2
 509  0059 81            	ret	
 510  005a               L522:
 511                     ; 227     TIM4->CR1 &= (u8)(~TIM4_CR1_URS);
 513  005a 72155340      	bres	21312,#2
 514                     ; 229 }
 517  005e 81            	ret	
 574                     ; 248 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 574                     ; 249 {
 575                     	switch	.text
 576  005f               _TIM4_SelectOnePulseMode:
 580                     ; 251   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 582                     ; 254   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 584  005f 4d            	tnz	a
 585  0060 2705          	jreq	L752
 586                     ; 256     TIM4->CR1 |= TIM4_CR1_OPM;
 588  0062 72165340      	bset	21312,#3
 591  0066 81            	ret	
 592  0067               L752:
 593                     ; 260     TIM4->CR1 &= (u8)(~TIM4_CR1_OPM);
 595  0067 72175340      	bres	21312,#3
 596                     ; 263 }
 599  006b 81            	ret	
 667                     ; 294 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 667                     ; 295 {
 668                     	switch	.text
 669  006c               _TIM4_PrescalerConfig:
 673                     ; 297   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 675                     ; 298   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 677                     ; 301   TIM4->PSCR = Prescaler;
 679  006c 9e            	ld	a,xh
 680  006d c75345        	ld	21317,a
 681                     ; 304   TIM4->EGR = TIM4_PSCReloadMode;
 683  0070 9f            	ld	a,xl
 684  0071 c75343        	ld	21315,a
 685                     ; 305 }
 688  0074 81            	ret	
 724                     ; 322 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 724                     ; 323 {
 725                     	switch	.text
 726  0075               _TIM4_ARRPreloadConfig:
 730                     ; 325   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 732                     ; 328   if (NewState != DISABLE)
 734  0075 4d            	tnz	a
 735  0076 2705          	jreq	L333
 736                     ; 330     TIM4->CR1 |= TIM4_CR1_ARPE;
 738  0078 721e5340      	bset	21312,#7
 741  007c 81            	ret	
 742  007d               L333:
 743                     ; 334     TIM4->CR1 &= (u8)(~TIM4_CR1_ARPE);
 745  007d 721f5340      	bres	21312,#7
 746                     ; 336 }
 749  0081 81            	ret	
 798                     ; 354 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 798                     ; 355 {
 799                     	switch	.text
 800  0082               _TIM4_GenerateEvent:
 804                     ; 357   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 806                     ; 360   TIM4->EGR = (u8)(TIM4_EventSource);
 808  0082 c75343        	ld	21315,a
 809                     ; 361 }
 812  0085 81            	ret	
 846                     ; 379 void TIM4_SetCounter(u8 Counter)
 846                     ; 380 {
 847                     	switch	.text
 848  0086               _TIM4_SetCounter:
 852                     ; 382   TIM4->CNTR = (u8)(Counter);
 854  0086 c75344        	ld	21316,a
 855                     ; 383 }
 858  0089 81            	ret	
 892                     ; 401 void TIM4_SetAutoreload(u8 Autoreload)
 892                     ; 402 {
 893                     	switch	.text
 894  008a               _TIM4_SetAutoreload:
 898                     ; 404   TIM4->ARR = (u8)(Autoreload);
 900  008a c75346        	ld	21318,a
 901                     ; 405 }
 904  008d 81            	ret	
 927                     ; 423 u8 TIM4_GetCounter(void)
 927                     ; 424 {
 928                     	switch	.text
 929  008e               _TIM4_GetCounter:
 933                     ; 426   return (u8)(TIM4->CNTR);
 935  008e c65344        	ld	a,21316
 938  0091 81            	ret	
 962                     ; 445 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 962                     ; 446 {
 963                     	switch	.text
 964  0092               _TIM4_GetPrescaler:
 968                     ; 448   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 970  0092 c65345        	ld	a,21317
 973  0095 81            	ret	
1042                     ; 468 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1042                     ; 469 {
1043                     	switch	.text
1044  0096               _TIM4_GetFlagStatus:
1048                     ; 471   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1050                     ; 473   if ((TIM4->SR1 & TIM4_FLAG) != RESET )
1052  0096 c45342        	and	a,21314
1053  0099 2702          	jreq	L374
1054                     ; 475     return (FlagStatus)(SET);
1056  009b a601          	ld	a,#1
1059  009d               L374:
1060                     ; 479     return (FlagStatus)(RESET);
1064  009d 81            	ret	
1099                     ; 499 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1099                     ; 500 {
1100                     	switch	.text
1101  009e               _TIM4_ClearFlag:
1105                     ; 502   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1107                     ; 505   TIM4->SR1 = (u8)(~TIM4_FLAG);
1109  009e 43            	cpl	a
1110  009f c75342        	ld	21314,a
1111                     ; 507 }
1114  00a2 81            	ret	
1150                     ; 526 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1150                     ; 527 {
1151                     	switch	.text
1152  00a3               _TIM4_GetITStatus:
1154  00a3 88            	push	a
1155       00000000      OFST:	set	0
1158                     ; 529   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1160                     ; 531   if (((TIM4->SR1 & TIM4_IT) != RESET ) && ((TIM4->IER & TIM4_IT) != RESET ))
1162  00a4 c45342        	and	a,21314
1163  00a7 270c          	jreq	L335
1165  00a9 c65341        	ld	a,21313
1166  00ac 1501          	bcp	a,(OFST+1,sp)
1167  00ae 2705          	jreq	L335
1168                     ; 533     return (ITStatus)(SET);
1170  00b0 a601          	ld	a,#1
1173  00b2 5b01          	addw	sp,#1
1174  00b4 81            	ret	
1175  00b5               L335:
1176                     ; 537     return (ITStatus)(RESET);
1178  00b5 4f            	clr	a
1181  00b6 5b01          	addw	sp,#1
1182  00b8 81            	ret	
1218                     ; 557 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1218                     ; 558 {
1219                     	switch	.text
1220  00b9               _TIM4_ClearITPendingBit:
1224                     ; 560   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1226                     ; 563   TIM4->SR1 = (u8)(~TIM4_IT);
1228  00b9 43            	cpl	a
1229  00ba c75342        	ld	21314,a
1230                     ; 564 }
1233  00bd 81            	ret	
1246                     	xdef	_TIM4_ClearITPendingBit
1247                     	xdef	_TIM4_GetITStatus
1248                     	xdef	_TIM4_ClearFlag
1249                     	xdef	_TIM4_GetFlagStatus
1250                     	xdef	_TIM4_GetPrescaler
1251                     	xdef	_TIM4_GetCounter
1252                     	xdef	_TIM4_SetAutoreload
1253                     	xdef	_TIM4_SetCounter
1254                     	xdef	_TIM4_GenerateEvent
1255                     	xdef	_TIM4_ARRPreloadConfig
1256                     	xdef	_TIM4_PrescalerConfig
1257                     	xdef	_TIM4_SelectOnePulseMode
1258                     	xdef	_TIM4_UpdateRequestConfig
1259                     	xdef	_TIM4_UpdateDisableConfig
1260                     	xdef	_TIM4_ITConfig
1261                     	xdef	_TIM4_Cmd
1262                     	xdef	_TIM4_TimeBaseInit
1263                     	xdef	_TIM4_DeInit
1282                     	end
