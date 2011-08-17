   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 63 void TIM2_DeInit(void)
  47                     ; 64 {
  49                     	switch	.text
  50  0000               _TIM2_DeInit:
  54                     ; 66   TIM2->CR1 = (u8)TIM2_CR1_RESET_VALUE;
  56  0000 725f5300      	clr	21248
  57                     ; 67   TIM2->IER = (u8)TIM2_IER_RESET_VALUE;
  59  0004 725f5301      	clr	21249
  60                     ; 68   TIM2->SR2 = (u8)TIM2_SR2_RESET_VALUE;
  62  0008 725f5303      	clr	21251
  63                     ; 71   TIM2->CCER1 = (u8)TIM2_CCER1_RESET_VALUE;
  65  000c 725f5308      	clr	21256
  66                     ; 72   TIM2->CCER2 = (u8)TIM2_CCER2_RESET_VALUE;
  68  0010 725f5309      	clr	21257
  69                     ; 76   TIM2->CCER1 = (u8)TIM2_CCER1_RESET_VALUE;
  71  0014 725f5308      	clr	21256
  72                     ; 77   TIM2->CCER2 = (u8)TIM2_CCER2_RESET_VALUE;
  74  0018 725f5309      	clr	21257
  75                     ; 78   TIM2->CCMR1 = (u8)TIM2_CCMR1_RESET_VALUE;
  77  001c 725f5305      	clr	21253
  78                     ; 79   TIM2->CCMR2 = (u8)TIM2_CCMR2_RESET_VALUE;
  80  0020 725f5306      	clr	21254
  81                     ; 80   TIM2->CCMR3 = (u8)TIM2_CCMR3_RESET_VALUE;
  83  0024 725f5307      	clr	21255
  84                     ; 81   TIM2->CNTRH = (u8)TIM2_CNTRH_RESET_VALUE;
  86  0028 725f530a      	clr	21258
  87                     ; 82   TIM2->CNTRL = (u8)TIM2_CNTRL_RESET_VALUE;
  89  002c 725f530b      	clr	21259
  90                     ; 83   TIM2->PSCR = (u8)TIM2_PSCR_RESET_VALUE;
  92  0030 725f530c      	clr	21260
  93                     ; 84   TIM2->ARRH  = (u8)TIM2_ARRH_RESET_VALUE;
  95  0034 35ff530d      	mov	21261,#255
  96                     ; 85   TIM2->ARRL  = (u8)TIM2_ARRL_RESET_VALUE;
  98  0038 35ff530e      	mov	21262,#255
  99                     ; 86   TIM2->CCR1H = (u8)TIM2_CCR1H_RESET_VALUE;
 101  003c 725f530f      	clr	21263
 102                     ; 87   TIM2->CCR1L = (u8)TIM2_CCR1L_RESET_VALUE;
 104  0040 725f5310      	clr	21264
 105                     ; 88   TIM2->CCR2H = (u8)TIM2_CCR2H_RESET_VALUE;
 107  0044 725f5311      	clr	21265
 108                     ; 89   TIM2->CCR2L = (u8)TIM2_CCR2L_RESET_VALUE;
 110  0048 725f5312      	clr	21266
 111                     ; 90   TIM2->CCR3H = (u8)TIM2_CCR3H_RESET_VALUE;
 113  004c 725f5313      	clr	21267
 114                     ; 91   TIM2->CCR3L = (u8)TIM2_CCR3L_RESET_VALUE;
 116  0050 725f5314      	clr	21268
 117                     ; 92   TIM2->SR1 = (u8)TIM2_SR1_RESET_VALUE;
 119  0054 725f5302      	clr	21250
 120                     ; 93 }
 123  0058 81            	ret	
 291                     ; 113 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 291                     ; 114                         u16 TIM2_Period)
 291                     ; 115 {
 292                     	switch	.text
 293  0059               _TIM2_TimeBaseInit:
 295       00000000      OFST:	set	0
 298                     ; 117   TIM2->PSCR = (u8)(TIM2_Prescaler);
 300  0059 c7530c        	ld	21260,a
 301  005c 88            	push	a
 302                     ; 119   TIM2->ARRH = (u8)(TIM2_Period >> 8);
 304  005d 7b04          	ld	a,(OFST+4,sp)
 305  005f c7530d        	ld	21261,a
 306                     ; 120   TIM2->ARRL = (u8)(TIM2_Period);
 308  0062 7b05          	ld	a,(OFST+5,sp)
 309  0064 c7530e        	ld	21262,a
 310                     ; 121 }
 313  0067 84            	pop	a
 314  0068 81            	ret	
 471                     ; 145 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 471                     ; 146                   TIM2_OutputState_TypeDef TIM2_OutputState,
 471                     ; 147                   u16 TIM2_Pulse,
 471                     ; 148                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 471                     ; 149 {
 472                     	switch	.text
 473  0069               _TIM2_OC1Init:
 475  0069 89            	pushw	x
 476  006a 88            	push	a
 477       00000001      OFST:	set	1
 480                     ; 151   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 482                     ; 152   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 484                     ; 153   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 486                     ; 156   TIM2->CCER1 &= (u8)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 488  006b c65308        	ld	a,21256
 489  006e a4fc          	and	a,#252
 490  0070 c75308        	ld	21256,a
 491                     ; 158   TIM2->CCER1 |= (u8)((TIM2_OutputState  & TIM2_CCER1_CC1E   ) | (TIM2_OCPolarity   & TIM2_CCER1_CC1P   ));
 493  0073 7b08          	ld	a,(OFST+7,sp)
 494  0075 a402          	and	a,#2
 495  0077 6b01          	ld	(OFST+0,sp),a
 496  0079 9f            	ld	a,xl
 497  007a a401          	and	a,#1
 498  007c 1a01          	or	a,(OFST+0,sp)
 499  007e ca5308        	or	a,21256
 500  0081 c75308        	ld	21256,a
 501                     ; 161   TIM2->CCMR1 = (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
 503  0084 c65305        	ld	a,21253
 504  0087 a48f          	and	a,#143
 505  0089 1a02          	or	a,(OFST+1,sp)
 506  008b c75305        	ld	21253,a
 507                     ; 164   TIM2->CCR1H = (u8)(TIM2_Pulse >> 8);
 509  008e 7b06          	ld	a,(OFST+5,sp)
 510  0090 c7530f        	ld	21263,a
 511                     ; 165   TIM2->CCR1L = (u8)(TIM2_Pulse);
 513  0093 7b07          	ld	a,(OFST+6,sp)
 514  0095 c75310        	ld	21264,a
 515                     ; 166 }
 518  0098 5b03          	addw	sp,#3
 519  009a 81            	ret	
 583                     ; 190 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 583                     ; 191                   TIM2_OutputState_TypeDef TIM2_OutputState,
 583                     ; 192                   u16 TIM2_Pulse,
 583                     ; 193                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 583                     ; 194 {
 584                     	switch	.text
 585  009b               _TIM2_OC2Init:
 587  009b 89            	pushw	x
 588  009c 88            	push	a
 589       00000001      OFST:	set	1
 592                     ; 196   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 594                     ; 197   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 596                     ; 198   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 598                     ; 202   TIM2->CCER1 &= (u8)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 600  009d c65308        	ld	a,21256
 601  00a0 a4cf          	and	a,#207
 602  00a2 c75308        	ld	21256,a
 603                     ; 204   TIM2->CCER1 |= (u8)((TIM2_OutputState  & TIM2_CCER1_CC2E   ) | \
 603                     ; 205                       (TIM2_OCPolarity   & TIM2_CCER1_CC2P   ));
 605  00a5 7b08          	ld	a,(OFST+7,sp)
 606  00a7 a420          	and	a,#32
 607  00a9 6b01          	ld	(OFST+0,sp),a
 608  00ab 9f            	ld	a,xl
 609  00ac a410          	and	a,#16
 610  00ae 1a01          	or	a,(OFST+0,sp)
 611  00b0 ca5308        	or	a,21256
 612  00b3 c75308        	ld	21256,a
 613                     ; 209   TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
 615  00b6 c65306        	ld	a,21254
 616  00b9 a48f          	and	a,#143
 617  00bb 1a02          	or	a,(OFST+1,sp)
 618  00bd c75306        	ld	21254,a
 619                     ; 213   TIM2->CCR2H = (u8)(TIM2_Pulse >> 8);
 621  00c0 7b06          	ld	a,(OFST+5,sp)
 622  00c2 c75311        	ld	21265,a
 623                     ; 214   TIM2->CCR2L = (u8)(TIM2_Pulse);
 625  00c5 7b07          	ld	a,(OFST+6,sp)
 626  00c7 c75312        	ld	21266,a
 627                     ; 215 }
 630  00ca 5b03          	addw	sp,#3
 631  00cc 81            	ret	
 695                     ; 239 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 695                     ; 240                   TIM2_OutputState_TypeDef TIM2_OutputState,
 695                     ; 241                   u16 TIM2_Pulse,
 695                     ; 242                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 695                     ; 243 {
 696                     	switch	.text
 697  00cd               _TIM2_OC3Init:
 699  00cd 89            	pushw	x
 700  00ce 88            	push	a
 701       00000001      OFST:	set	1
 704                     ; 245   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 706                     ; 246   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 708                     ; 247   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 710                     ; 249   TIM2->CCER2 &= (u8)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 712  00cf c65309        	ld	a,21257
 713  00d2 a4fc          	and	a,#252
 714  00d4 c75309        	ld	21257,a
 715                     ; 251   TIM2->CCER2 |= (u8)((TIM2_OutputState  & TIM2_CCER2_CC3E   ) |  (TIM2_OCPolarity   & TIM2_CCER2_CC3P   ));
 717  00d7 7b08          	ld	a,(OFST+7,sp)
 718  00d9 a402          	and	a,#2
 719  00db 6b01          	ld	(OFST+0,sp),a
 720  00dd 9f            	ld	a,xl
 721  00de a401          	and	a,#1
 722  00e0 1a01          	or	a,(OFST+0,sp)
 723  00e2 ca5309        	or	a,21257
 724  00e5 c75309        	ld	21257,a
 725                     ; 254   TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
 727  00e8 c65307        	ld	a,21255
 728  00eb a48f          	and	a,#143
 729  00ed 1a02          	or	a,(OFST+1,sp)
 730  00ef c75307        	ld	21255,a
 731                     ; 257   TIM2->CCR3H = (u8)(TIM2_Pulse >> 8);
 733  00f2 7b06          	ld	a,(OFST+5,sp)
 734  00f4 c75313        	ld	21267,a
 735                     ; 258   TIM2->CCR3L = (u8)(TIM2_Pulse);
 737  00f7 7b07          	ld	a,(OFST+6,sp)
 738  00f9 c75314        	ld	21268,a
 739                     ; 260 }
 742  00fc 5b03          	addw	sp,#3
 743  00fe 81            	ret	
 936                     ; 291 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 936                     ; 292                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 936                     ; 293                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 936                     ; 294                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 936                     ; 295                  u8 TIM2_ICFilter)
 936                     ; 296 {
 937                     	switch	.text
 938  00ff               _TIM2_ICInit:
 940  00ff 89            	pushw	x
 941       00000000      OFST:	set	0
 944                     ; 298   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 946                     ; 299   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 948                     ; 300   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 950                     ; 301   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 952                     ; 302   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 954                     ; 304   if (TIM2_Channel == TIM2_CHANNEL_1)
 956  0100 9e            	ld	a,xh
 957  0101 4d            	tnz	a
 958  0102 2614          	jrne	L104
 959                     ; 307     TI1_Config(TIM2_ICPolarity,
 959                     ; 308                TIM2_ICSelection,
 959                     ; 309                TIM2_ICFilter);
 961  0104 7b07          	ld	a,(OFST+7,sp)
 962  0106 88            	push	a
 963  0107 7b06          	ld	a,(OFST+6,sp)
 964  0109 97            	ld	xl,a
 965  010a 7b03          	ld	a,(OFST+3,sp)
 966  010c 95            	ld	xh,a
 967  010d cd0410        	call	L3_TI1_Config
 969  0110 84            	pop	a
 970                     ; 312     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 972  0111 7b06          	ld	a,(OFST+6,sp)
 973  0113 cd032c        	call	_TIM2_SetIC1Prescaler
 976  0116 202b          	jra	L304
 977  0118               L104:
 978                     ; 314   else if (TIM2_Channel == TIM2_CHANNEL_2)
 980  0118 7b01          	ld	a,(OFST+1,sp)
 981  011a 4a            	dec	a
 982  011b 2614          	jrne	L504
 983                     ; 317     TI2_Config(TIM2_ICPolarity,
 983                     ; 318                TIM2_ICSelection,
 983                     ; 319                TIM2_ICFilter);
 985  011d 7b07          	ld	a,(OFST+7,sp)
 986  011f 88            	push	a
 987  0120 7b06          	ld	a,(OFST+6,sp)
 988  0122 97            	ld	xl,a
 989  0123 7b03          	ld	a,(OFST+3,sp)
 990  0125 95            	ld	xh,a
 991  0126 cd0440        	call	L5_TI2_Config
 993  0129 84            	pop	a
 994                     ; 322     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 996  012a 7b06          	ld	a,(OFST+6,sp)
 997  012c cd0339        	call	_TIM2_SetIC2Prescaler
1000  012f 2012          	jra	L304
1001  0131               L504:
1002                     ; 327     TI3_Config(TIM2_ICPolarity,
1002                     ; 328                TIM2_ICSelection,
1002                     ; 329                TIM2_ICFilter);
1004  0131 7b07          	ld	a,(OFST+7,sp)
1005  0133 88            	push	a
1006  0134 7b06          	ld	a,(OFST+6,sp)
1007  0136 97            	ld	xl,a
1008  0137 7b03          	ld	a,(OFST+3,sp)
1009  0139 95            	ld	xh,a
1010  013a cd0470        	call	L7_TI3_Config
1012  013d 84            	pop	a
1013                     ; 332     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1015  013e 7b06          	ld	a,(OFST+6,sp)
1016  0140 cd0346        	call	_TIM2_SetIC3Prescaler
1018  0143               L304:
1019                     ; 334 }
1022  0143 85            	popw	x
1023  0144 81            	ret	
1119                     ; 363 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1119                     ; 364                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1119                     ; 365                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1119                     ; 366                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1119                     ; 367                      u8 TIM2_ICFilter)
1119                     ; 368 {
1120                     	switch	.text
1121  0145               _TIM2_PWMIConfig:
1123  0145 89            	pushw	x
1124  0146 89            	pushw	x
1125       00000002      OFST:	set	2
1128                     ; 369   u8 icpolarity = (u8)TIM2_ICPOLARITY_RISING;
1130                     ; 370   u8 icselection = (u8)TIM2_ICSELECTION_DIRECTTI;
1132                     ; 373   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1134                     ; 374   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1136                     ; 375   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1138                     ; 376   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1140                     ; 379   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1142  0147 9f            	ld	a,xl
1143  0148 a144          	cp	a,#68
1144  014a 2706          	jreq	L754
1145                     ; 381     icpolarity = (u8)TIM2_ICPOLARITY_FALLING;
1147  014c a644          	ld	a,#68
1148  014e 6b01          	ld	(OFST-1,sp),a
1150  0150 2002          	jra	L164
1151  0152               L754:
1152                     ; 385     icpolarity = (u8)TIM2_ICPOLARITY_RISING;
1154  0152 0f01          	clr	(OFST-1,sp)
1155  0154               L164:
1156                     ; 389   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1158  0154 7b07          	ld	a,(OFST+5,sp)
1159  0156 4a            	dec	a
1160  0157 2604          	jrne	L364
1161                     ; 391     icselection = (u8)TIM2_ICSELECTION_INDIRECTTI;
1163  0159 a602          	ld	a,#2
1165  015b 2002          	jra	L564
1166  015d               L364:
1167                     ; 395     icselection = (u8)TIM2_ICSELECTION_DIRECTTI;
1169  015d a601          	ld	a,#1
1170  015f               L564:
1171  015f 6b02          	ld	(OFST+0,sp),a
1172                     ; 398   if (TIM2_Channel == TIM2_CHANNEL_1)
1174  0161 7b03          	ld	a,(OFST+1,sp)
1175  0163 2626          	jrne	L764
1176                     ; 401     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1176                     ; 402                TIM2_ICFilter);
1178  0165 7b09          	ld	a,(OFST+7,sp)
1179  0167 88            	push	a
1180  0168 7b08          	ld	a,(OFST+6,sp)
1181  016a 97            	ld	xl,a
1182  016b 7b05          	ld	a,(OFST+3,sp)
1183  016d 95            	ld	xh,a
1184  016e cd0410        	call	L3_TI1_Config
1186  0171 84            	pop	a
1187                     ; 405     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1189  0172 7b08          	ld	a,(OFST+6,sp)
1190  0174 cd032c        	call	_TIM2_SetIC1Prescaler
1192                     ; 408     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1194  0177 7b09          	ld	a,(OFST+7,sp)
1195  0179 88            	push	a
1196  017a 7b03          	ld	a,(OFST+1,sp)
1197  017c 97            	ld	xl,a
1198  017d 7b02          	ld	a,(OFST+0,sp)
1199  017f 95            	ld	xh,a
1200  0180 cd0440        	call	L5_TI2_Config
1202  0183 84            	pop	a
1203                     ; 411     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1205  0184 7b08          	ld	a,(OFST+6,sp)
1206  0186 cd0339        	call	_TIM2_SetIC2Prescaler
1209  0189 2024          	jra	L174
1210  018b               L764:
1211                     ; 416     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1211                     ; 417                TIM2_ICFilter);
1213  018b 7b09          	ld	a,(OFST+7,sp)
1214  018d 88            	push	a
1215  018e 7b08          	ld	a,(OFST+6,sp)
1216  0190 97            	ld	xl,a
1217  0191 7b05          	ld	a,(OFST+3,sp)
1218  0193 95            	ld	xh,a
1219  0194 cd0440        	call	L5_TI2_Config
1221  0197 84            	pop	a
1222                     ; 420     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1224  0198 7b08          	ld	a,(OFST+6,sp)
1225  019a cd0339        	call	_TIM2_SetIC2Prescaler
1227                     ; 423     TI1_Config(icpolarity, icselection, TIM2_ICFilter);
1229  019d 7b09          	ld	a,(OFST+7,sp)
1230  019f 88            	push	a
1231  01a0 7b03          	ld	a,(OFST+1,sp)
1232  01a2 97            	ld	xl,a
1233  01a3 7b02          	ld	a,(OFST+0,sp)
1234  01a5 95            	ld	xh,a
1235  01a6 cd0410        	call	L3_TI1_Config
1237  01a9 84            	pop	a
1238                     ; 426     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1240  01aa 7b08          	ld	a,(OFST+6,sp)
1241  01ac cd032c        	call	_TIM2_SetIC1Prescaler
1243  01af               L174:
1244                     ; 428 }
1247  01af 5b04          	addw	sp,#4
1248  01b1 81            	ret	
1303                     ; 446 void TIM2_Cmd(FunctionalState NewState)
1303                     ; 447 {
1304                     	switch	.text
1305  01b2               _TIM2_Cmd:
1309                     ; 449   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1311                     ; 452   if (NewState != DISABLE)
1313  01b2 4d            	tnz	a
1314  01b3 2705          	jreq	L125
1315                     ; 454     TIM2->CR1 |= TIM2_CR1_CEN;
1317  01b5 72105300      	bset	21248,#0
1320  01b9 81            	ret	
1321  01ba               L125:
1322                     ; 458     TIM2->CR1 &= (u8)(~TIM2_CR1_CEN);
1324  01ba 72115300      	bres	21248,#0
1325                     ; 460 }
1328  01be 81            	ret	
1407                     ; 485 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1407                     ; 486 {
1408                     	switch	.text
1409  01bf               _TIM2_ITConfig:
1411  01bf 89            	pushw	x
1412       00000000      OFST:	set	0
1415                     ; 488   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1417                     ; 489   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1419                     ; 491   if (NewState != DISABLE)
1421  01c0 9f            	ld	a,xl
1422  01c1 4d            	tnz	a
1423  01c2 2706          	jreq	L365
1424                     ; 494     TIM2->IER |= TIM2_IT;
1426  01c4 9e            	ld	a,xh
1427  01c5 ca5301        	or	a,21249
1429  01c8 2006          	jra	L565
1430  01ca               L365:
1431                     ; 499     TIM2->IER &= (u8)(~TIM2_IT);
1433  01ca 7b01          	ld	a,(OFST+1,sp)
1434  01cc 43            	cpl	a
1435  01cd c45301        	and	a,21249
1436  01d0               L565:
1437  01d0 c75301        	ld	21249,a
1438                     ; 501 }
1441  01d3 85            	popw	x
1442  01d4 81            	ret	
1478                     ; 519 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1478                     ; 520 {
1479                     	switch	.text
1480  01d5               _TIM2_UpdateDisableConfig:
1484                     ; 522   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1486                     ; 525   if (NewState != DISABLE)
1488  01d5 4d            	tnz	a
1489  01d6 2705          	jreq	L506
1490                     ; 527     TIM2->CR1 |= TIM2_CR1_UDIS;
1492  01d8 72125300      	bset	21248,#1
1495  01dc 81            	ret	
1496  01dd               L506:
1497                     ; 531     TIM2->CR1 &= (u8)(~TIM2_CR1_UDIS);
1499  01dd 72135300      	bres	21248,#1
1500                     ; 533 }
1503  01e1 81            	ret	
1561                     ; 552 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1561                     ; 553 {
1562                     	switch	.text
1563  01e2               _TIM2_UpdateRequestConfig:
1567                     ; 555   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1569                     ; 558   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1571  01e2 4d            	tnz	a
1572  01e3 2705          	jreq	L736
1573                     ; 560     TIM2->CR1 |= TIM2_CR1_URS;
1575  01e5 72145300      	bset	21248,#2
1578  01e9 81            	ret	
1579  01ea               L736:
1580                     ; 564     TIM2->CR1 &= (u8)(~TIM2_CR1_URS);
1582  01ea 72155300      	bres	21248,#2
1583                     ; 566 }
1586  01ee 81            	ret	
1643                     ; 586 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1643                     ; 587 {
1644                     	switch	.text
1645  01ef               _TIM2_SelectOnePulseMode:
1649                     ; 589   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1651                     ; 592   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1653  01ef 4d            	tnz	a
1654  01f0 2705          	jreq	L176
1655                     ; 594     TIM2->CR1 |= TIM2_CR1_OPM;
1657  01f2 72165300      	bset	21248,#3
1660  01f6 81            	ret	
1661  01f7               L176:
1662                     ; 598     TIM2->CR1 &= (u8)(~TIM2_CR1_OPM);
1664  01f7 72175300      	bres	21248,#3
1665                     ; 601 }
1668  01fb 81            	ret	
1736                     ; 641 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1736                     ; 642                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1736                     ; 643 {
1737                     	switch	.text
1738  01fc               _TIM2_PrescalerConfig:
1742                     ; 645   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1744                     ; 646   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1746                     ; 649   TIM2->PSCR = Prescaler;
1748  01fc 9e            	ld	a,xh
1749  01fd c7530c        	ld	21260,a
1750                     ; 652   TIM2->EGR = TIM2_PSCReloadMode;
1752  0200 9f            	ld	a,xl
1753  0201 c75304        	ld	21252,a
1754                     ; 653 }
1757  0204 81            	ret	
1815                     ; 673 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1815                     ; 674 {
1816                     	switch	.text
1817  0205               _TIM2_ForcedOC1Config:
1819  0205 88            	push	a
1820       00000000      OFST:	set	0
1823                     ; 676   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1825                     ; 679   TIM2->CCMR1  =  (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_OCM))  | (u8)TIM2_ForcedAction);
1827  0206 c65305        	ld	a,21253
1828  0209 a48f          	and	a,#143
1829  020b 1a01          	or	a,(OFST+1,sp)
1830  020d c75305        	ld	21253,a
1831                     ; 680 }
1834  0210 84            	pop	a
1835  0211 81            	ret	
1871                     ; 700 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1871                     ; 701 {
1872                     	switch	.text
1873  0212               _TIM2_ForcedOC2Config:
1875  0212 88            	push	a
1876       00000000      OFST:	set	0
1879                     ; 703   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1881                     ; 706   TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_OCM))  | (u8)TIM2_ForcedAction);
1883  0213 c65306        	ld	a,21254
1884  0216 a48f          	and	a,#143
1885  0218 1a01          	or	a,(OFST+1,sp)
1886  021a c75306        	ld	21254,a
1887                     ; 707 }
1890  021d 84            	pop	a
1891  021e 81            	ret	
1927                     ; 727 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1927                     ; 728 {
1928                     	switch	.text
1929  021f               _TIM2_ForcedOC3Config:
1931  021f 88            	push	a
1932       00000000      OFST:	set	0
1935                     ; 730   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1937                     ; 733   TIM2->CCMR3  =  (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_OCM))  | (u8)TIM2_ForcedAction);
1939  0220 c65307        	ld	a,21255
1940  0223 a48f          	and	a,#143
1941  0225 1a01          	or	a,(OFST+1,sp)
1942  0227 c75307        	ld	21255,a
1943                     ; 734 }
1946  022a 84            	pop	a
1947  022b 81            	ret	
1983                     ; 752 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1983                     ; 753 {
1984                     	switch	.text
1985  022c               _TIM2_ARRPreloadConfig:
1989                     ; 755   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1991                     ; 758   if (NewState != DISABLE)
1993  022c 4d            	tnz	a
1994  022d 2705          	jreq	L7201
1995                     ; 760     TIM2->CR1 |= TIM2_CR1_ARPE;
1997  022f 721e5300      	bset	21248,#7
2000  0233 81            	ret	
2001  0234               L7201:
2002                     ; 764     TIM2->CR1 &= (u8)(~TIM2_CR1_ARPE);
2004  0234 721f5300      	bres	21248,#7
2005                     ; 766 }
2008  0238 81            	ret	
2044                     ; 784 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2044                     ; 785 {
2045                     	switch	.text
2046  0239               _TIM2_OC1PreloadConfig:
2050                     ; 787   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2052                     ; 790   if (NewState != DISABLE)
2054  0239 4d            	tnz	a
2055  023a 2705          	jreq	L1501
2056                     ; 792     TIM2->CCMR1 |= TIM2_CCMR_OCxPE;
2058  023c 72165305      	bset	21253,#3
2061  0240 81            	ret	
2062  0241               L1501:
2063                     ; 796     TIM2->CCMR1 &= (u8)(~TIM2_CCMR_OCxPE);
2065  0241 72175305      	bres	21253,#3
2066                     ; 798 }
2069  0245 81            	ret	
2105                     ; 816 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2105                     ; 817 {
2106                     	switch	.text
2107  0246               _TIM2_OC2PreloadConfig:
2111                     ; 819   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2113                     ; 822   if (NewState != DISABLE)
2115  0246 4d            	tnz	a
2116  0247 2705          	jreq	L3701
2117                     ; 824     TIM2->CCMR2 |= TIM2_CCMR_OCxPE;
2119  0249 72165306      	bset	21254,#3
2122  024d 81            	ret	
2123  024e               L3701:
2124                     ; 828     TIM2->CCMR2 &= (u8)(~TIM2_CCMR_OCxPE);
2126  024e 72175306      	bres	21254,#3
2127                     ; 830 }
2130  0252 81            	ret	
2166                     ; 848 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2166                     ; 849 {
2167                     	switch	.text
2168  0253               _TIM2_OC3PreloadConfig:
2172                     ; 851   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2174                     ; 854   if (NewState != DISABLE)
2176  0253 4d            	tnz	a
2177  0254 2705          	jreq	L5111
2178                     ; 856     TIM2->CCMR3 |= TIM2_CCMR_OCxPE;
2180  0256 72165307      	bset	21255,#3
2183  025a 81            	ret	
2184  025b               L5111:
2185                     ; 860     TIM2->CCMR3 &= (u8)(~TIM2_CCMR_OCxPE);
2187  025b 72175307      	bres	21255,#3
2188                     ; 862 }
2191  025f 81            	ret	
2264                     ; 884 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2264                     ; 885 {
2265                     	switch	.text
2266  0260               _TIM2_GenerateEvent:
2270                     ; 887   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2272                     ; 890   TIM2->EGR = TIM2_EventSource;
2274  0260 c75304        	ld	21252,a
2275                     ; 891 }
2278  0263 81            	ret	
2314                     ; 911 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2314                     ; 912 {
2315                     	switch	.text
2316  0264               _TIM2_OC1PolarityConfig:
2320                     ; 914   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2322                     ; 917   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2324  0264 4d            	tnz	a
2325  0265 2705          	jreq	L1711
2326                     ; 919     TIM2->CCER1 |= TIM2_CCER1_CC1P;
2328  0267 72125308      	bset	21256,#1
2331  026b 81            	ret	
2332  026c               L1711:
2333                     ; 923     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1P);
2335  026c 72135308      	bres	21256,#1
2336                     ; 925 }
2339  0270 81            	ret	
2375                     ; 945 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2375                     ; 946 {
2376                     	switch	.text
2377  0271               _TIM2_OC2PolarityConfig:
2381                     ; 948   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2383                     ; 951   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2385  0271 4d            	tnz	a
2386  0272 2705          	jreq	L3121
2387                     ; 953     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2389  0274 721a5308      	bset	21256,#5
2392  0278 81            	ret	
2393  0279               L3121:
2394                     ; 957     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2P);
2396  0279 721b5308      	bres	21256,#5
2397                     ; 959 }
2400  027d 81            	ret	
2436                     ; 979 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2436                     ; 980 {
2437                     	switch	.text
2438  027e               _TIM2_OC3PolarityConfig:
2442                     ; 982   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2444                     ; 985   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2446  027e 4d            	tnz	a
2447  027f 2705          	jreq	L5321
2448                     ; 987     TIM2->CCER2 |= TIM2_CCER2_CC3P;
2450  0281 72125309      	bset	21257,#1
2453  0285 81            	ret	
2454  0286               L5321:
2455                     ; 991     TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3P);
2457  0286 72135309      	bres	21257,#1
2458                     ; 993 }
2461  028a 81            	ret	
2506                     ; 1016 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2506                     ; 1017 {
2507                     	switch	.text
2508  028b               _TIM2_CCxCmd:
2510  028b 89            	pushw	x
2511       00000000      OFST:	set	0
2514                     ; 1019   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2516                     ; 1020   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2518                     ; 1022   if (TIM2_Channel == TIM2_CHANNEL_1)
2520  028c 9e            	ld	a,xh
2521  028d 4d            	tnz	a
2522  028e 2610          	jrne	L3621
2523                     ; 1025     if (NewState != DISABLE)
2525  0290 9f            	ld	a,xl
2526  0291 4d            	tnz	a
2527  0292 2706          	jreq	L5621
2528                     ; 1027       TIM2->CCER1 |= TIM2_CCER1_CC1E;
2530  0294 72105308      	bset	21256,#0
2532  0298 2029          	jra	L1721
2533  029a               L5621:
2534                     ; 1031       TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1E);
2536  029a 72115308      	bres	21256,#0
2537  029e 2023          	jra	L1721
2538  02a0               L3621:
2539                     ; 1035   else if (TIM2_Channel == TIM2_CHANNEL_2)
2541  02a0 7b01          	ld	a,(OFST+1,sp)
2542  02a2 4a            	dec	a
2543  02a3 2610          	jrne	L3721
2544                     ; 1038     if (NewState != DISABLE)
2546  02a5 7b02          	ld	a,(OFST+2,sp)
2547  02a7 2706          	jreq	L5721
2548                     ; 1040       TIM2->CCER1 |= TIM2_CCER1_CC2E;
2550  02a9 72185308      	bset	21256,#4
2552  02ad 2014          	jra	L1721
2553  02af               L5721:
2554                     ; 1044       TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2E);
2556  02af 72195308      	bres	21256,#4
2557  02b3 200e          	jra	L1721
2558  02b5               L3721:
2559                     ; 1050     if (NewState != DISABLE)
2561  02b5 7b02          	ld	a,(OFST+2,sp)
2562  02b7 2706          	jreq	L3031
2563                     ; 1052       TIM2->CCER2 |= TIM2_CCER2_CC3E;
2565  02b9 72105309      	bset	21257,#0
2567  02bd 2004          	jra	L1721
2568  02bf               L3031:
2569                     ; 1056       TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3E);
2571  02bf 72115309      	bres	21257,#0
2572  02c3               L1721:
2573                     ; 1059 }
2576  02c3 85            	popw	x
2577  02c4 81            	ret	
2622                     ; 1090 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2622                     ; 1091 {
2623                     	switch	.text
2624  02c5               _TIM2_SelectOCxM:
2626  02c5 89            	pushw	x
2627       00000000      OFST:	set	0
2630                     ; 1093   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2632                     ; 1094   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2634                     ; 1096   if (TIM2_Channel == TIM2_CHANNEL_1)
2636  02c6 9e            	ld	a,xh
2637  02c7 4d            	tnz	a
2638  02c8 2610          	jrne	L1331
2639                     ; 1099     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1E);
2641  02ca 72115308      	bres	21256,#0
2642                     ; 1102     TIM2->CCMR1 = (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
2644  02ce c65305        	ld	a,21253
2645  02d1 a48f          	and	a,#143
2646  02d3 1a02          	or	a,(OFST+2,sp)
2647  02d5 c75305        	ld	21253,a
2649  02d8 2023          	jra	L3331
2650  02da               L1331:
2651                     ; 1104   else if (TIM2_Channel == TIM2_CHANNEL_2)
2653  02da 7b01          	ld	a,(OFST+1,sp)
2654  02dc 4a            	dec	a
2655  02dd 2610          	jrne	L5331
2656                     ; 1107     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2E);
2658  02df 72195308      	bres	21256,#4
2659                     ; 1110     TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
2661  02e3 c65306        	ld	a,21254
2662  02e6 a48f          	and	a,#143
2663  02e8 1a02          	or	a,(OFST+2,sp)
2664  02ea c75306        	ld	21254,a
2666  02ed 200e          	jra	L3331
2667  02ef               L5331:
2668                     ; 1115     TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3E);
2670  02ef 72115309      	bres	21257,#0
2671                     ; 1118     TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
2673  02f3 c65307        	ld	a,21255
2674  02f6 a48f          	and	a,#143
2675  02f8 1a02          	or	a,(OFST+2,sp)
2676  02fa c75307        	ld	21255,a
2677  02fd               L3331:
2678                     ; 1120 }
2681  02fd 85            	popw	x
2682  02fe 81            	ret	
2716                     ; 1138 void TIM2_SetCounter(u16 Counter)
2716                     ; 1139 {
2717                     	switch	.text
2718  02ff               _TIM2_SetCounter:
2722                     ; 1141   TIM2->CNTRH = (u8)(Counter >> 8);
2724  02ff 9e            	ld	a,xh
2725  0300 c7530a        	ld	21258,a
2726                     ; 1142   TIM2->CNTRL = (u8)(Counter);
2728  0303 9f            	ld	a,xl
2729  0304 c7530b        	ld	21259,a
2730                     ; 1144 }
2733  0307 81            	ret	
2767                     ; 1162 void TIM2_SetAutoreload(u16 Autoreload)
2767                     ; 1163 {
2768                     	switch	.text
2769  0308               _TIM2_SetAutoreload:
2773                     ; 1166   TIM2->ARRH = (u8)(Autoreload >> 8);
2775  0308 9e            	ld	a,xh
2776  0309 c7530d        	ld	21261,a
2777                     ; 1167   TIM2->ARRL = (u8)(Autoreload);
2779  030c 9f            	ld	a,xl
2780  030d c7530e        	ld	21262,a
2781                     ; 1169 }
2784  0310 81            	ret	
2818                     ; 1187 void TIM2_SetCompare1(u16 Compare1)
2818                     ; 1188 {
2819                     	switch	.text
2820  0311               _TIM2_SetCompare1:
2824                     ; 1190   TIM2->CCR1H = (u8)(Compare1 >> 8);
2826  0311 9e            	ld	a,xh
2827  0312 c7530f        	ld	21263,a
2828                     ; 1191   TIM2->CCR1L = (u8)(Compare1);
2830  0315 9f            	ld	a,xl
2831  0316 c75310        	ld	21264,a
2832                     ; 1193 }
2835  0319 81            	ret	
2869                     ; 1211 void TIM2_SetCompare2(u16 Compare2)
2869                     ; 1212 {
2870                     	switch	.text
2871  031a               _TIM2_SetCompare2:
2875                     ; 1214   TIM2->CCR2H = (u8)(Compare2 >> 8);
2877  031a 9e            	ld	a,xh
2878  031b c75311        	ld	21265,a
2879                     ; 1215   TIM2->CCR2L = (u8)(Compare2);
2881  031e 9f            	ld	a,xl
2882  031f c75312        	ld	21266,a
2883                     ; 1217 }
2886  0322 81            	ret	
2920                     ; 1235 void TIM2_SetCompare3(u16 Compare3)
2920                     ; 1236 {
2921                     	switch	.text
2922  0323               _TIM2_SetCompare3:
2926                     ; 1238   TIM2->CCR3H = (u8)(Compare3 >> 8);
2928  0323 9e            	ld	a,xh
2929  0324 c75313        	ld	21267,a
2930                     ; 1239   TIM2->CCR3L = (u8)(Compare3);
2932  0327 9f            	ld	a,xl
2933  0328 c75314        	ld	21268,a
2934                     ; 1241 }
2937  032b 81            	ret	
2973                     ; 1263 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2973                     ; 1264 {
2974                     	switch	.text
2975  032c               _TIM2_SetIC1Prescaler:
2977  032c 88            	push	a
2978       00000000      OFST:	set	0
2981                     ; 1266   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2983                     ; 1269   TIM2->CCMR1 = (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_ICxPSC)) | (u8)TIM2_IC1Prescaler);
2985  032d c65305        	ld	a,21253
2986  0330 a4f3          	and	a,#243
2987  0332 1a01          	or	a,(OFST+1,sp)
2988  0334 c75305        	ld	21253,a
2989                     ; 1270 }
2992  0337 84            	pop	a
2993  0338 81            	ret	
3029                     ; 1291 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3029                     ; 1292 {
3030                     	switch	.text
3031  0339               _TIM2_SetIC2Prescaler:
3033  0339 88            	push	a
3034       00000000      OFST:	set	0
3037                     ; 1294   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3039                     ; 1297   TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_ICxPSC)) | (u8)TIM2_IC2Prescaler);
3041  033a c65306        	ld	a,21254
3042  033d a4f3          	and	a,#243
3043  033f 1a01          	or	a,(OFST+1,sp)
3044  0341 c75306        	ld	21254,a
3045                     ; 1298 }
3048  0344 84            	pop	a
3049  0345 81            	ret	
3085                     ; 1319 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3085                     ; 1320 {
3086                     	switch	.text
3087  0346               _TIM2_SetIC3Prescaler:
3089  0346 88            	push	a
3090       00000000      OFST:	set	0
3093                     ; 1323   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3095                     ; 1325   TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_ICxPSC)) | (u8)TIM2_IC3Prescaler);
3097  0347 c65307        	ld	a,21255
3098  034a a4f3          	and	a,#243
3099  034c 1a01          	or	a,(OFST+1,sp)
3100  034e c75307        	ld	21255,a
3101                     ; 1326 }
3104  0351 84            	pop	a
3105  0352 81            	ret	
3157                     ; 1344 u16 TIM2_GetCapture1(void)
3157                     ; 1345 {
3158                     	switch	.text
3159  0353               _TIM2_GetCapture1:
3161  0353 5204          	subw	sp,#4
3162       00000004      OFST:	set	4
3165                     ; 1347    u16 tmpccr1 = 0;
3167                     ; 1348    u8 tmpccr1l=0, tmpccr1h=0;
3171                     ; 1350     tmpccr1h = TIM2->CCR1H;
3173  0355 c6530f        	ld	a,21263
3174  0358 6b02          	ld	(OFST-2,sp),a
3175                     ; 1351 	tmpccr1l = TIM2->CCR1L;
3177  035a c65310        	ld	a,21264
3178  035d 6b01          	ld	(OFST-3,sp),a
3179                     ; 1353     tmpccr1 = (u16)(tmpccr1l);
3181  035f 5f            	clrw	x
3182  0360 97            	ld	xl,a
3183  0361 1f03          	ldw	(OFST-1,sp),x
3184                     ; 1354     tmpccr1 |= (u16)((u16)tmpccr1h << 8);
3186  0363 5f            	clrw	x
3187  0364 7b02          	ld	a,(OFST-2,sp)
3188  0366 97            	ld	xl,a
3189  0367 7b04          	ld	a,(OFST+0,sp)
3190  0369 01            	rrwa	x,a
3191  036a 1a03          	or	a,(OFST-1,sp)
3192  036c 01            	rrwa	x,a
3193                     ; 1356     return (u16)tmpccr1;
3197  036d 5b04          	addw	sp,#4
3198  036f 81            	ret	
3250                     ; 1375 u16 TIM2_GetCapture2(void)
3250                     ; 1376 {
3251                     	switch	.text
3252  0370               _TIM2_GetCapture2:
3254  0370 5204          	subw	sp,#4
3255       00000004      OFST:	set	4
3258                     ; 1378    u16 tmpccr2 = 0;
3260                     ; 1379    u8 tmpccr2l=0, tmpccr2h=0;
3264                     ; 1381     tmpccr2h = TIM2->CCR2H;
3266  0372 c65311        	ld	a,21265
3267  0375 6b02          	ld	(OFST-2,sp),a
3268                     ; 1382 	tmpccr2l = TIM2->CCR2L;
3270  0377 c65312        	ld	a,21266
3271  037a 6b01          	ld	(OFST-3,sp),a
3272                     ; 1384     tmpccr2 = (u16)(tmpccr2l);
3274  037c 5f            	clrw	x
3275  037d 97            	ld	xl,a
3276  037e 1f03          	ldw	(OFST-1,sp),x
3277                     ; 1385     tmpccr2 |= (u16)((u16)tmpccr2h << 8);
3279  0380 5f            	clrw	x
3280  0381 7b02          	ld	a,(OFST-2,sp)
3281  0383 97            	ld	xl,a
3282  0384 7b04          	ld	a,(OFST+0,sp)
3283  0386 01            	rrwa	x,a
3284  0387 1a03          	or	a,(OFST-1,sp)
3285  0389 01            	rrwa	x,a
3286                     ; 1387     return (u16)tmpccr2;
3290  038a 5b04          	addw	sp,#4
3291  038c 81            	ret	
3343                     ; 1406 u16 TIM2_GetCapture3(void)
3343                     ; 1407 {
3344                     	switch	.text
3345  038d               _TIM2_GetCapture3:
3347  038d 5204          	subw	sp,#4
3348       00000004      OFST:	set	4
3351                     ; 1409     u16 tmpccr3 = 0;
3353                     ; 1410     u8 tmpccr3l=0, tmpccr3h=0;
3357                     ; 1412     tmpccr3h = TIM2->CCR3H;
3359  038f c65313        	ld	a,21267
3360  0392 6b02          	ld	(OFST-2,sp),a
3361                     ; 1413 	tmpccr3l = TIM2->CCR3L;
3363  0394 c65314        	ld	a,21268
3364  0397 6b01          	ld	(OFST-3,sp),a
3365                     ; 1415     tmpccr3 = (u16)(tmpccr3l);
3367  0399 5f            	clrw	x
3368  039a 97            	ld	xl,a
3369  039b 1f03          	ldw	(OFST-1,sp),x
3370                     ; 1416     tmpccr3 |= (u16)((u16)tmpccr3h << 8);
3372  039d 5f            	clrw	x
3373  039e 7b02          	ld	a,(OFST-2,sp)
3374  03a0 97            	ld	xl,a
3375  03a1 7b04          	ld	a,(OFST+0,sp)
3376  03a3 01            	rrwa	x,a
3377  03a4 1a03          	or	a,(OFST-1,sp)
3378  03a6 01            	rrwa	x,a
3379                     ; 1418     return (u16)tmpccr3;
3383  03a7 5b04          	addw	sp,#4
3384  03a9 81            	ret	
3407                     ; 1437 u16 TIM2_GetCounter(void)
3407                     ; 1438 {
3408                     	switch	.text
3409  03aa               _TIM2_GetCounter:
3411  03aa 89            	pushw	x
3412       00000002      OFST:	set	2
3415                     ; 1440   return (u16)(((u16)TIM2->CNTRH << 8) | (u16)(TIM2->CNTRL));
3417  03ab c6530b        	ld	a,21259
3418  03ae 5f            	clrw	x
3419  03af 97            	ld	xl,a
3420  03b0 1f01          	ldw	(OFST-1,sp),x
3421  03b2 5f            	clrw	x
3422  03b3 c6530a        	ld	a,21258
3423  03b6 97            	ld	xl,a
3424  03b7 7b02          	ld	a,(OFST+0,sp)
3425  03b9 01            	rrwa	x,a
3426  03ba 1a01          	or	a,(OFST-1,sp)
3427  03bc 01            	rrwa	x,a
3430  03bd 5b02          	addw	sp,#2
3431  03bf 81            	ret	
3455                     ; 1460 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3455                     ; 1461 {
3456                     	switch	.text
3457  03c0               _TIM2_GetPrescaler:
3461                     ; 1463   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3463  03c0 c6530c        	ld	a,21260
3466  03c3 81            	ret	
3605                     ; 1490 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3605                     ; 1491 {
3606                     	switch	.text
3607  03c4               _TIM2_GetFlagStatus:
3609  03c4 5203          	subw	sp,#3
3610       00000003      OFST:	set	3
3613                     ; 1492   FlagStatus bitstatus = RESET;
3615                     ; 1496   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3617                     ; 1498   tim2_flag_l = (u8)(TIM2_FLAG);
3619  03c6 9f            	ld	a,xl
3620  03c7 6b02          	ld	(OFST-1,sp),a
3621                     ; 1499   tim2_flag_h = (u8)(TIM2_FLAG >> 8);
3623  03c9 9e            	ld	a,xh
3624  03ca 6b03          	ld	(OFST+0,sp),a
3625                     ; 1501   if (((TIM2->SR1 & tim2_flag_l) | (TIM2->SR2 & tim2_flag_h)) != (u8)RESET )
3627  03cc c45303        	and	a,21251
3628  03cf 6b01          	ld	(OFST-2,sp),a
3629  03d1 c65302        	ld	a,21250
3630  03d4 1402          	and	a,(OFST-1,sp)
3631  03d6 1a01          	or	a,(OFST-2,sp)
3632  03d8 2702          	jreq	L7271
3633                     ; 1503     bitstatus = SET;
3635  03da a601          	ld	a,#1
3637  03dc               L7271:
3638                     ; 1507     bitstatus = RESET;
3640                     ; 1509   return (FlagStatus)bitstatus;
3644  03dc 5b03          	addw	sp,#3
3645  03de 81            	ret	
3680                     ; 1535 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3680                     ; 1536 {
3681                     	switch	.text
3682  03df               _TIM2_ClearFlag:
3684  03df 89            	pushw	x
3685       00000000      OFST:	set	0
3688                     ; 1538   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3690                     ; 1541   TIM2->SR1 = (u8)(~((u8)(TIM2_FLAG)));
3692  03e0 9f            	ld	a,xl
3693  03e1 43            	cpl	a
3694  03e2 c75302        	ld	21250,a
3695                     ; 1542   TIM2->SR2 = (u8)(~((u8)(TIM2_FLAG >> 8)));
3697  03e5 7b01          	ld	a,(OFST+1,sp)
3698  03e7 43            	cpl	a
3699  03e8 c75303        	ld	21251,a
3700                     ; 1543 }
3703  03eb 85            	popw	x
3704  03ec 81            	ret	
3768                     ; 1567 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3768                     ; 1568 {
3769                     	switch	.text
3770  03ed               _TIM2_GetITStatus:
3772  03ed 88            	push	a
3773  03ee 89            	pushw	x
3774       00000002      OFST:	set	2
3777                     ; 1569   ITStatus bitstatus = RESET;
3779                     ; 1571   u8 TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
3783                     ; 1574   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3785                     ; 1576   TIM2_itStatus = (u8)(TIM2->SR1 & TIM2_IT);
3787  03ef c45302        	and	a,21250
3788  03f2 6b01          	ld	(OFST-1,sp),a
3789                     ; 1578   TIM2_itEnable = (u8)(TIM2->IER & TIM2_IT);
3791  03f4 c65301        	ld	a,21249
3792  03f7 1403          	and	a,(OFST+1,sp)
3793  03f9 6b02          	ld	(OFST+0,sp),a
3794                     ; 1580   if ((TIM2_itStatus != (u8)RESET ) && (TIM2_itEnable != (u8)RESET ))
3796  03fb 7b01          	ld	a,(OFST-1,sp)
3797  03fd 2708          	jreq	L3002
3799  03ff 7b02          	ld	a,(OFST+0,sp)
3800  0401 2704          	jreq	L3002
3801                     ; 1582     bitstatus = SET;
3803  0403 a601          	ld	a,#1
3805  0405 2001          	jra	L5002
3806  0407               L3002:
3807                     ; 1586     bitstatus = RESET;
3809  0407 4f            	clr	a
3810  0408               L5002:
3811                     ; 1588   return (ITStatus)(bitstatus);
3815  0408 5b03          	addw	sp,#3
3816  040a 81            	ret	
3852                     ; 1611 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3852                     ; 1612 {
3853                     	switch	.text
3854  040b               _TIM2_ClearITPendingBit:
3858                     ; 1614   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3860                     ; 1617   TIM2->SR1 = (u8)(~TIM2_IT);
3862  040b 43            	cpl	a
3863  040c c75302        	ld	21250,a
3864                     ; 1618 }
3867  040f 81            	ret	
3919                     ; 1646 static void TI1_Config(u8 TIM2_ICPolarity,
3919                     ; 1647                        u8 TIM2_ICSelection,
3919                     ; 1648                        u8 TIM2_ICFilter)
3919                     ; 1649 {
3920                     	switch	.text
3921  0410               L3_TI1_Config:
3923  0410 89            	pushw	x
3924       00000001      OFST:	set	1
3927                     ; 1651   TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1E);
3929  0411 72115308      	bres	21256,#0
3930  0415 88            	push	a
3931                     ; 1654   TIM2->CCMR1  = (u8)((TIM2->CCMR1 & (u8)(~( TIM2_CCMR_CCxS     |        TIM2_CCMR_ICxF    ))) | (u8)(( (TIM2_ICSelection)) | ((u8)( TIM2_ICFilter << 4))));
3933  0416 7b06          	ld	a,(OFST+5,sp)
3934  0418 97            	ld	xl,a
3935  0419 a610          	ld	a,#16
3936  041b 42            	mul	x,a
3937  041c 9f            	ld	a,xl
3938  041d 1a03          	or	a,(OFST+2,sp)
3939  041f 6b01          	ld	(OFST+0,sp),a
3940  0421 c65305        	ld	a,21253
3941  0424 a40c          	and	a,#12
3942  0426 1a01          	or	a,(OFST+0,sp)
3943  0428 c75305        	ld	21253,a
3944                     ; 1657   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3946  042b 7b02          	ld	a,(OFST+1,sp)
3947  042d 2706          	jreq	L3502
3948                     ; 1659     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3950  042f 72125308      	bset	21256,#1
3952  0433 2004          	jra	L5502
3953  0435               L3502:
3954                     ; 1663     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1P);
3956  0435 72135308      	bres	21256,#1
3957  0439               L5502:
3958                     ; 1666   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3960  0439 72105308      	bset	21256,#0
3961                     ; 1667 }
3964  043d 5b03          	addw	sp,#3
3965  043f 81            	ret	
4017                     ; 1695 static void TI2_Config(u8 TIM2_ICPolarity,
4017                     ; 1696                        u8 TIM2_ICSelection,
4017                     ; 1697                        u8 TIM2_ICFilter)
4017                     ; 1698 {
4018                     	switch	.text
4019  0440               L5_TI2_Config:
4021  0440 89            	pushw	x
4022       00000001      OFST:	set	1
4025                     ; 1700   TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2E);
4027  0441 72195308      	bres	21256,#4
4028  0445 88            	push	a
4029                     ; 1703   TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~( TIM2_CCMR_CCxS     |        TIM2_CCMR_ICxF    ))) | (u8)(( (TIM2_ICSelection)) | ((u8)( TIM2_ICFilter << 4))));
4031  0446 7b06          	ld	a,(OFST+5,sp)
4032  0448 97            	ld	xl,a
4033  0449 a610          	ld	a,#16
4034  044b 42            	mul	x,a
4035  044c 9f            	ld	a,xl
4036  044d 1a03          	or	a,(OFST+2,sp)
4037  044f 6b01          	ld	(OFST+0,sp),a
4038  0451 c65306        	ld	a,21254
4039  0454 a40c          	and	a,#12
4040  0456 1a01          	or	a,(OFST+0,sp)
4041  0458 c75306        	ld	21254,a
4042                     ; 1707   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4044  045b 7b02          	ld	a,(OFST+1,sp)
4045  045d 2706          	jreq	L5012
4046                     ; 1709     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4048  045f 721a5308      	bset	21256,#5
4050  0463 2004          	jra	L7012
4051  0465               L5012:
4052                     ; 1713     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2P);
4054  0465 721b5308      	bres	21256,#5
4055  0469               L7012:
4056                     ; 1717   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4058  0469 72185308      	bset	21256,#4
4059                     ; 1719 }
4062  046d 5b03          	addw	sp,#3
4063  046f 81            	ret	
4115                     ; 1744 static void TI3_Config(u8 TIM2_ICPolarity, u8 TIM2_ICSelection,
4115                     ; 1745                        u8 TIM2_ICFilter)
4115                     ; 1746 {
4116                     	switch	.text
4117  0470               L7_TI3_Config:
4119  0470 89            	pushw	x
4120       00000001      OFST:	set	1
4123                     ; 1748   TIM2->CCER2 &=  (u8)(~TIM2_CCER2_CC3E);
4125  0471 72115309      	bres	21257,#0
4126  0475 88            	push	a
4127                     ; 1751   TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~( TIM2_CCMR_CCxS     |        TIM2_CCMR_ICxF    ))) | (u8)(( (TIM2_ICSelection)) | ((u8)( TIM2_ICFilter << 4))));
4129  0476 7b06          	ld	a,(OFST+5,sp)
4130  0478 97            	ld	xl,a
4131  0479 a610          	ld	a,#16
4132  047b 42            	mul	x,a
4133  047c 9f            	ld	a,xl
4134  047d 1a03          	or	a,(OFST+2,sp)
4135  047f 6b01          	ld	(OFST+0,sp),a
4136  0481 c65307        	ld	a,21255
4137  0484 a40c          	and	a,#12
4138  0486 1a01          	or	a,(OFST+0,sp)
4139  0488 c75307        	ld	21255,a
4140                     ; 1755   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4142  048b 7b02          	ld	a,(OFST+1,sp)
4143  048d 2706          	jreq	L7312
4144                     ; 1757     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4146  048f 72125309      	bset	21257,#1
4148  0493 2004          	jra	L1412
4149  0495               L7312:
4150                     ; 1761     TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3P);
4152  0495 72135309      	bres	21257,#1
4153  0499               L1412:
4154                     ; 1764   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4156  0499 72105309      	bset	21257,#0
4157                     ; 1765 }
4160  049d 5b03          	addw	sp,#3
4161  049f 81            	ret	
4174                     	xdef	_TIM2_ClearITPendingBit
4175                     	xdef	_TIM2_GetITStatus
4176                     	xdef	_TIM2_ClearFlag
4177                     	xdef	_TIM2_GetFlagStatus
4178                     	xdef	_TIM2_GetPrescaler
4179                     	xdef	_TIM2_GetCounter
4180                     	xdef	_TIM2_GetCapture3
4181                     	xdef	_TIM2_GetCapture2
4182                     	xdef	_TIM2_GetCapture1
4183                     	xdef	_TIM2_SetIC3Prescaler
4184                     	xdef	_TIM2_SetIC2Prescaler
4185                     	xdef	_TIM2_SetIC1Prescaler
4186                     	xdef	_TIM2_SetCompare3
4187                     	xdef	_TIM2_SetCompare2
4188                     	xdef	_TIM2_SetCompare1
4189                     	xdef	_TIM2_SetAutoreload
4190                     	xdef	_TIM2_SetCounter
4191                     	xdef	_TIM2_SelectOCxM
4192                     	xdef	_TIM2_CCxCmd
4193                     	xdef	_TIM2_OC3PolarityConfig
4194                     	xdef	_TIM2_OC2PolarityConfig
4195                     	xdef	_TIM2_OC1PolarityConfig
4196                     	xdef	_TIM2_GenerateEvent
4197                     	xdef	_TIM2_OC3PreloadConfig
4198                     	xdef	_TIM2_OC2PreloadConfig
4199                     	xdef	_TIM2_OC1PreloadConfig
4200                     	xdef	_TIM2_ARRPreloadConfig
4201                     	xdef	_TIM2_ForcedOC3Config
4202                     	xdef	_TIM2_ForcedOC2Config
4203                     	xdef	_TIM2_ForcedOC1Config
4204                     	xdef	_TIM2_PrescalerConfig
4205                     	xdef	_TIM2_SelectOnePulseMode
4206                     	xdef	_TIM2_UpdateRequestConfig
4207                     	xdef	_TIM2_UpdateDisableConfig
4208                     	xdef	_TIM2_ITConfig
4209                     	xdef	_TIM2_Cmd
4210                     	xdef	_TIM2_PWMIConfig
4211                     	xdef	_TIM2_ICInit
4212                     	xdef	_TIM2_OC3Init
4213                     	xdef	_TIM2_OC2Init
4214                     	xdef	_TIM2_OC1Init
4215                     	xdef	_TIM2_TimeBaseInit
4216                     	xdef	_TIM2_DeInit
4235                     	end
