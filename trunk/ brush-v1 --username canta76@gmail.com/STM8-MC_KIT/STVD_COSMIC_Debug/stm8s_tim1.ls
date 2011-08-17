   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 69 void TIM1_DeInit(void)
  47                     ; 70 {
  49                     	switch	.text
  50  0000               _TIM1_DeInit:
  54                     ; 71   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  56  0000 725f5250      	clr	21072
  57                     ; 72   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  59  0004 725f5251      	clr	21073
  60                     ; 73   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  62  0008 725f5252      	clr	21074
  63                     ; 74   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  65  000c 725f5253      	clr	21075
  66                     ; 75   TIM1->IER  = TIM1_IER_RESET_VALUE;
  68  0010 725f5254      	clr	21076
  69                     ; 76   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  71  0014 725f5256      	clr	21078
  72                     ; 78   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  74  0018 725f525c      	clr	21084
  75                     ; 79   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  77  001c 725f525d      	clr	21085
  78                     ; 81   TIM1->CCMR1 = 0x01;
  80  0020 35015258      	mov	21080,#1
  81                     ; 82   TIM1->CCMR2 = 0x01;
  83  0024 35015259      	mov	21081,#1
  84                     ; 83   TIM1->CCMR3 = 0x01;
  86  0028 3501525a      	mov	21082,#1
  87                     ; 84   TIM1->CCMR4 = 0x01;
  89  002c 3501525b      	mov	21083,#1
  90                     ; 86   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  92  0030 725f525c      	clr	21084
  93                     ; 87   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  95  0034 725f525d      	clr	21085
  96                     ; 88   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  98  0038 725f5258      	clr	21080
  99                     ; 89   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 101  003c 725f5259      	clr	21081
 102                     ; 90   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 104  0040 725f525a      	clr	21082
 105                     ; 91   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 107  0044 725f525b      	clr	21083
 108                     ; 92   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 110  0048 725f525e      	clr	21086
 111                     ; 93   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 113  004c 725f525f      	clr	21087
 114                     ; 94   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 116  0050 725f5260      	clr	21088
 117                     ; 95   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 119  0054 725f5261      	clr	21089
 120                     ; 96   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 122  0058 35ff5262      	mov	21090,#255
 123                     ; 97   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 125  005c 35ff5263      	mov	21091,#255
 126                     ; 98   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 128  0060 725f5265      	clr	21093
 129                     ; 99   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 131  0064 725f5266      	clr	21094
 132                     ; 100   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 134  0068 725f5267      	clr	21095
 135                     ; 101   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 137  006c 725f5268      	clr	21096
 138                     ; 102   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 140  0070 725f5269      	clr	21097
 141                     ; 103   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 143  0074 725f526a      	clr	21098
 144                     ; 104   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 146  0078 725f526b      	clr	21099
 147                     ; 105   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 149  007c 725f526c      	clr	21100
 150                     ; 106   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 152  0080 725f526f      	clr	21103
 153                     ; 107   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 155  0084 35015257      	mov	21079,#1
 156                     ; 108   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 158  0088 725f526e      	clr	21102
 159                     ; 109   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 161  008c 725f526d      	clr	21101
 162                     ; 110   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 164  0090 725f5264      	clr	21092
 165                     ; 111   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 167  0094 725f5255      	clr	21077
 168                     ; 112 }
 171  0098 81            	ret	
 280                     ; 135 void TIM1_TimeBaseInit(u16 TIM1_Prescaler,
 280                     ; 136                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 280                     ; 137                        u16 TIM1_Period,
 280                     ; 138                        u8 TIM1_RepetitionCounter)
 280                     ; 139 {
 281                     	switch	.text
 282  0099               _TIM1_TimeBaseInit:
 284  0099 89            	pushw	x
 285       00000000      OFST:	set	0
 288                     ; 142   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 290                     ; 145   TIM1->ARRH = (u8)(TIM1_Period >> 8);
 292  009a 7b06          	ld	a,(OFST+6,sp)
 293  009c c75262        	ld	21090,a
 294                     ; 146   TIM1->ARRL = (u8)(TIM1_Period);
 296  009f 7b07          	ld	a,(OFST+7,sp)
 297  00a1 c75263        	ld	21091,a
 298                     ; 149   TIM1->PSCRH = (u8)(TIM1_Prescaler >> 8);
 300  00a4 9e            	ld	a,xh
 301  00a5 c75260        	ld	21088,a
 302                     ; 150   TIM1->PSCRL = (u8)(TIM1_Prescaler);
 304  00a8 9f            	ld	a,xl
 305  00a9 c75261        	ld	21089,a
 306                     ; 153   TIM1->CR1 = (u8)(((TIM1->CR1) & (u8)(~(TIM1_CR1_CMS | TIM1_CR1_DIR))) | (u8)(TIM1_CounterMode));
 308  00ac c65250        	ld	a,21072
 309  00af a48f          	and	a,#143
 310  00b1 1a05          	or	a,(OFST+5,sp)
 311  00b3 c75250        	ld	21072,a
 312                     ; 156   TIM1->RCR = TIM1_RepetitionCounter;
 314  00b6 7b08          	ld	a,(OFST+8,sp)
 315  00b8 c75264        	ld	21092,a
 316                     ; 158 }
 319  00bb 85            	popw	x
 320  00bc 81            	ret	
 605                     ; 189 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 605                     ; 190                   TIM1_OutputState_TypeDef TIM1_OutputState,
 605                     ; 191                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 605                     ; 192                   u16 TIM1_Pulse,
 605                     ; 193                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 605                     ; 194                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 605                     ; 195                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 605                     ; 196                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 605                     ; 197 {
 606                     	switch	.text
 607  00bd               _TIM1_OC1Init:
 609  00bd 89            	pushw	x
 610  00be 5203          	subw	sp,#3
 611       00000003      OFST:	set	3
 614                     ; 199   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 616                     ; 200   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 618                     ; 201   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 620                     ; 202   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 622                     ; 203   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 624                     ; 204   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 626                     ; 205   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 628                     ; 208   TIM1->CCER1 &= (u8)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 630  00c0 c6525c        	ld	a,21084
 631  00c3 a4f0          	and	a,#240
 632  00c5 c7525c        	ld	21084,a
 633                     ; 210   TIM1->CCER1 |= (u8)((TIM1_OutputState & TIM1_CCER1_CC1E  ) | (TIM1_OutputNState & TIM1_CCER1_CC1NE ) | (TIM1_OCPolarity  & TIM1_CCER1_CC1P  ) | (TIM1_OCNPolarity & TIM1_CCER1_CC1NP ));
 635  00c8 7b0c          	ld	a,(OFST+9,sp)
 636  00ca a408          	and	a,#8
 637  00cc 6b03          	ld	(OFST+0,sp),a
 638  00ce 7b0b          	ld	a,(OFST+8,sp)
 639  00d0 a402          	and	a,#2
 640  00d2 6b02          	ld	(OFST-1,sp),a
 641  00d4 7b08          	ld	a,(OFST+5,sp)
 642  00d6 a404          	and	a,#4
 643  00d8 6b01          	ld	(OFST-2,sp),a
 644  00da 9f            	ld	a,xl
 645  00db a401          	and	a,#1
 646  00dd 1a01          	or	a,(OFST-2,sp)
 647  00df 1a02          	or	a,(OFST-1,sp)
 648  00e1 1a03          	or	a,(OFST+0,sp)
 649  00e3 ca525c        	or	a,21084
 650  00e6 c7525c        	ld	21084,a
 651                     ; 213   TIM1->CCMR1 = (u8)((TIM1->CCMR1 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_OCMode);
 653  00e9 c65258        	ld	a,21080
 654  00ec a48f          	and	a,#143
 655  00ee 1a04          	or	a,(OFST+1,sp)
 656  00f0 c75258        	ld	21080,a
 657                     ; 216   TIM1->OISR &= (u8)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 659  00f3 c6526f        	ld	a,21103
 660  00f6 a4fc          	and	a,#252
 661  00f8 c7526f        	ld	21103,a
 662                     ; 218   TIM1->OISR |= (u8)(( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | ( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 664  00fb 7b0e          	ld	a,(OFST+11,sp)
 665  00fd a402          	and	a,#2
 666  00ff 6b03          	ld	(OFST+0,sp),a
 667  0101 7b0d          	ld	a,(OFST+10,sp)
 668  0103 a401          	and	a,#1
 669  0105 1a03          	or	a,(OFST+0,sp)
 670  0107 ca526f        	or	a,21103
 671  010a c7526f        	ld	21103,a
 672                     ; 221   TIM1->CCR1H = (u8)(TIM1_Pulse >> 8);
 674  010d 7b09          	ld	a,(OFST+6,sp)
 675  010f c75265        	ld	21093,a
 676                     ; 222   TIM1->CCR1L = (u8)(TIM1_Pulse);
 678  0112 7b0a          	ld	a,(OFST+7,sp)
 679  0114 c75266        	ld	21094,a
 680                     ; 223 }
 683  0117 5b05          	addw	sp,#5
 684  0119 81            	ret	
 788                     ; 254 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 788                     ; 255                   TIM1_OutputState_TypeDef TIM1_OutputState,
 788                     ; 256                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 788                     ; 257                   u16 TIM1_Pulse,
 788                     ; 258                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 788                     ; 259                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 788                     ; 260                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 788                     ; 261                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 788                     ; 262 {
 789                     	switch	.text
 790  011a               _TIM1_OC2Init:
 792  011a 89            	pushw	x
 793  011b 5203          	subw	sp,#3
 794       00000003      OFST:	set	3
 797                     ; 266   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 799                     ; 267   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 801                     ; 268   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 803                     ; 269   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 805                     ; 270   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 807                     ; 271   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 809                     ; 272   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 811                     ; 275   TIM1->CCER1 &= (u8)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 813  011d c6525c        	ld	a,21084
 814  0120 a40f          	and	a,#15
 815  0122 c7525c        	ld	21084,a
 816                     ; 277   TIM1->CCER1 |= (u8)((TIM1_OutputState & TIM1_CCER1_CC2E  ) | (TIM1_OutputNState & TIM1_CCER1_CC2NE ) | (TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | (TIM1_OCNPolarity & TIM1_CCER1_CC2NP ));
 818  0125 7b0c          	ld	a,(OFST+9,sp)
 819  0127 a480          	and	a,#128
 820  0129 6b03          	ld	(OFST+0,sp),a
 821  012b 7b0b          	ld	a,(OFST+8,sp)
 822  012d a420          	and	a,#32
 823  012f 6b02          	ld	(OFST-1,sp),a
 824  0131 7b08          	ld	a,(OFST+5,sp)
 825  0133 a440          	and	a,#64
 826  0135 6b01          	ld	(OFST-2,sp),a
 827  0137 9f            	ld	a,xl
 828  0138 a410          	and	a,#16
 829  013a 1a01          	or	a,(OFST-2,sp)
 830  013c 1a02          	or	a,(OFST-1,sp)
 831  013e 1a03          	or	a,(OFST+0,sp)
 832  0140 ca525c        	or	a,21084
 833  0143 c7525c        	ld	21084,a
 834                     ; 281   TIM1->CCMR2 = (u8)((TIM1->CCMR2 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_OCMode);
 836  0146 c65259        	ld	a,21081
 837  0149 a48f          	and	a,#143
 838  014b 1a04          	or	a,(OFST+1,sp)
 839  014d c75259        	ld	21081,a
 840                     ; 284   TIM1->OISR &= (u8)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 842  0150 c6526f        	ld	a,21103
 843  0153 a4f3          	and	a,#243
 844  0155 c7526f        	ld	21103,a
 845                     ; 286   TIM1->OISR |= (u8)((TIM1_OISR_OIS2 & TIM1_OCIdleState) | (TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 847  0158 7b0e          	ld	a,(OFST+11,sp)
 848  015a a408          	and	a,#8
 849  015c 6b03          	ld	(OFST+0,sp),a
 850  015e 7b0d          	ld	a,(OFST+10,sp)
 851  0160 a404          	and	a,#4
 852  0162 1a03          	or	a,(OFST+0,sp)
 853  0164 ca526f        	or	a,21103
 854  0167 c7526f        	ld	21103,a
 855                     ; 289   TIM1->CCR2H = (u8)(TIM1_Pulse >> 8);
 857  016a 7b09          	ld	a,(OFST+6,sp)
 858  016c c75267        	ld	21095,a
 859                     ; 290   TIM1->CCR2L = (u8)(TIM1_Pulse);
 861  016f 7b0a          	ld	a,(OFST+7,sp)
 862  0171 c75268        	ld	21096,a
 863                     ; 292 }
 866  0174 5b05          	addw	sp,#5
 867  0176 81            	ret	
 971                     ; 323 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 971                     ; 324                   TIM1_OutputState_TypeDef TIM1_OutputState,
 971                     ; 325                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 971                     ; 326                   u16 TIM1_Pulse,
 971                     ; 327                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 971                     ; 328                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 971                     ; 329                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 971                     ; 330                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 971                     ; 331 {
 972                     	switch	.text
 973  0177               _TIM1_OC3Init:
 975  0177 89            	pushw	x
 976  0178 5203          	subw	sp,#3
 977       00000003      OFST:	set	3
 980                     ; 334   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 982                     ; 335   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 984                     ; 336   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 986                     ; 337   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 988                     ; 338   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 990                     ; 339   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 992                     ; 340   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 994                     ; 343   TIM1->CCER2 &= (u8)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 996  017a c6525d        	ld	a,21085
 997  017d a4f0          	and	a,#240
 998  017f c7525d        	ld	21085,a
 999                     ; 345   TIM1->CCER2 |= (u8)((TIM1_OutputState  & TIM1_CCER2_CC3E   ) |                 (TIM1_OutputNState & TIM1_CCER2_CC3NE  ) | (TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | (TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  ));
1001  0182 7b0c          	ld	a,(OFST+9,sp)
1002  0184 a408          	and	a,#8
1003  0186 6b03          	ld	(OFST+0,sp),a
1004  0188 7b0b          	ld	a,(OFST+8,sp)
1005  018a a402          	and	a,#2
1006  018c 6b02          	ld	(OFST-1,sp),a
1007  018e 7b08          	ld	a,(OFST+5,sp)
1008  0190 a404          	and	a,#4
1009  0192 6b01          	ld	(OFST-2,sp),a
1010  0194 9f            	ld	a,xl
1011  0195 a401          	and	a,#1
1012  0197 1a01          	or	a,(OFST-2,sp)
1013  0199 1a02          	or	a,(OFST-1,sp)
1014  019b 1a03          	or	a,(OFST+0,sp)
1015  019d ca525d        	or	a,21085
1016  01a0 c7525d        	ld	21085,a
1017                     ; 350   TIM1->CCMR3 = (u8)((TIM1->CCMR3 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_OCMode);
1019  01a3 c6525a        	ld	a,21082
1020  01a6 a48f          	and	a,#143
1021  01a8 1a04          	or	a,(OFST+1,sp)
1022  01aa c7525a        	ld	21082,a
1023                     ; 353   TIM1->OISR &= (u8)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1025  01ad c6526f        	ld	a,21103
1026  01b0 a4cf          	and	a,#207
1027  01b2 c7526f        	ld	21103,a
1028                     ; 355   TIM1->OISR |= (u8)((TIM1_OISR_OIS3 & TIM1_OCIdleState) | (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1030  01b5 7b0e          	ld	a,(OFST+11,sp)
1031  01b7 a420          	and	a,#32
1032  01b9 6b03          	ld	(OFST+0,sp),a
1033  01bb 7b0d          	ld	a,(OFST+10,sp)
1034  01bd a410          	and	a,#16
1035  01bf 1a03          	or	a,(OFST+0,sp)
1036  01c1 ca526f        	or	a,21103
1037  01c4 c7526f        	ld	21103,a
1038                     ; 358   TIM1->CCR3H = (u8)(TIM1_Pulse >> 8);
1040  01c7 7b09          	ld	a,(OFST+6,sp)
1041  01c9 c75269        	ld	21097,a
1042                     ; 359   TIM1->CCR3L = (u8)(TIM1_Pulse);
1044  01cc 7b0a          	ld	a,(OFST+7,sp)
1045  01ce c7526a        	ld	21098,a
1046                     ; 361 }
1049  01d1 5b05          	addw	sp,#5
1050  01d3 81            	ret	
1124                     ; 386 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1124                     ; 387                   TIM1_OutputState_TypeDef TIM1_OutputState,
1124                     ; 388                   u16 TIM1_Pulse,
1124                     ; 389                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1124                     ; 390                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1124                     ; 391 {
1125                     	switch	.text
1126  01d4               _TIM1_OC4Init:
1128  01d4 89            	pushw	x
1129  01d5 88            	push	a
1130       00000001      OFST:	set	1
1133                     ; 394   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1135                     ; 395   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1137                     ; 396   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1139                     ; 397   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1141                     ; 402   TIM1->CCER2 &= (u8)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1143  01d6 c6525d        	ld	a,21085
1144  01d9 a4cf          	and	a,#207
1145  01db c7525d        	ld	21085,a
1146                     ; 404   TIM1->CCER2 |= (u8)((TIM1_OutputState & TIM1_CCER2_CC4E ) |  (TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1148  01de 7b08          	ld	a,(OFST+7,sp)
1149  01e0 a420          	and	a,#32
1150  01e2 6b01          	ld	(OFST+0,sp),a
1151  01e4 9f            	ld	a,xl
1152  01e5 a410          	and	a,#16
1153  01e7 1a01          	or	a,(OFST+0,sp)
1154  01e9 ca525d        	or	a,21085
1155  01ec c7525d        	ld	21085,a
1156                     ; 407   TIM1->CCMR4 = (u8)((TIM1->CCMR4 & (u8)(~TIM1_CCMR_OCM)) | (TIM1_OCMode));
1158  01ef c6525b        	ld	a,21083
1159  01f2 a48f          	and	a,#143
1160  01f4 1a02          	or	a,(OFST+1,sp)
1161  01f6 c7525b        	ld	21083,a
1162                     ; 410   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1164  01f9 7b09          	ld	a,(OFST+8,sp)
1165  01fb 270a          	jreq	L534
1166                     ; 412     TIM1->OISR |= (u8)(~TIM1_CCER2_CC4P);
1168  01fd c6526f        	ld	a,21103
1169  0200 aadf          	or	a,#223
1170  0202 c7526f        	ld	21103,a
1172  0205 2004          	jra	L734
1173  0207               L534:
1174                     ; 416     TIM1->OISR &= (u8)(~TIM1_OISR_OIS4);
1176  0207 721d526f      	bres	21103,#6
1177  020b               L734:
1178                     ; 420   TIM1->CCR4H = (u8)(TIM1_Pulse >> 8);
1180  020b 7b06          	ld	a,(OFST+5,sp)
1181  020d c7526b        	ld	21099,a
1182                     ; 421   TIM1->CCR4L = (u8)(TIM1_Pulse);
1184  0210 7b07          	ld	a,(OFST+6,sp)
1185  0212 c7526c        	ld	21100,a
1186                     ; 423 }
1189  0215 5b03          	addw	sp,#3
1190  0217 81            	ret	
1395                     ; 451 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1395                     ; 452                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1395                     ; 453                      u8 TIM1_DeadTime,
1395                     ; 454                      TIM1_BreakState_TypeDef TIM1_Break,
1395                     ; 455                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1395                     ; 456                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1395                     ; 457 {
1396                     	switch	.text
1397  0218               _TIM1_BDTRConfig:
1399  0218 89            	pushw	x
1400       00000000      OFST:	set	0
1403                     ; 461   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1405                     ; 462   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1407                     ; 463   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1409                     ; 464   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1411                     ; 465   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1413                     ; 468   TIM1->DTR = (u8)(TIM1_DeadTime);
1415  0219 7b05          	ld	a,(OFST+5,sp)
1416  021b c7526e        	ld	21102,a
1417                     ; 472   TIM1->BKR  =  (u8)((u8)TIM1_OSSIState       | \
1417                     ; 473                      (u8)TIM1_LockLevel       | \
1417                     ; 474                      (u8)TIM1_Break           | \
1417                     ; 475                      (u8)TIM1_BreakPolarity   | \
1417                     ; 476                      (u8)TIM1_AutomaticOutput);
1419  021e 9f            	ld	a,xl
1420  021f 1a01          	or	a,(OFST+1,sp)
1421  0221 1a06          	or	a,(OFST+6,sp)
1422  0223 1a07          	or	a,(OFST+7,sp)
1423  0225 1a08          	or	a,(OFST+8,sp)
1424  0227 c7526d        	ld	21101,a
1425                     ; 478 }
1428  022a 85            	popw	x
1429  022b 81            	ret	
1631                     ; 511 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1631                     ; 512                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1631                     ; 513                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1631                     ; 514                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1631                     ; 515                  u8 TIM1_ICFilter)
1631                     ; 516 {
1632                     	switch	.text
1633  022c               _TIM1_ICInit:
1635  022c 89            	pushw	x
1636       00000000      OFST:	set	0
1639                     ; 519   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1641                     ; 520   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1643                     ; 521   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1645                     ; 522   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1647                     ; 523   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1649                     ; 525   if (TIM1_Channel == TIM1_CHANNEL_1)
1651  022d 9e            	ld	a,xh
1652  022e 4d            	tnz	a
1653  022f 2614          	jrne	L766
1654                     ; 528     TI1_Config(TIM1_ICPolarity,
1654                     ; 529                TIM1_ICSelection,
1654                     ; 530                TIM1_ICFilter);
1656  0231 7b07          	ld	a,(OFST+7,sp)
1657  0233 88            	push	a
1658  0234 7b06          	ld	a,(OFST+6,sp)
1659  0236 97            	ld	xl,a
1660  0237 7b03          	ld	a,(OFST+3,sp)
1661  0239 95            	ld	xh,a
1662  023a cd07a1        	call	L3_TI1_Config
1664  023d 84            	pop	a
1665                     ; 532     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1667  023e 7b06          	ld	a,(OFST+6,sp)
1668  0240 cd067f        	call	_TIM1_SetIC1Prescaler
1671  0243 2044          	jra	L176
1672  0245               L766:
1673                     ; 534   else if (TIM1_Channel == TIM1_CHANNEL_2)
1675  0245 7b01          	ld	a,(OFST+1,sp)
1676  0247 a101          	cp	a,#1
1677  0249 2614          	jrne	L376
1678                     ; 537     TI2_Config(TIM1_ICPolarity,
1678                     ; 538                TIM1_ICSelection,
1678                     ; 539                TIM1_ICFilter);
1680  024b 7b07          	ld	a,(OFST+7,sp)
1681  024d 88            	push	a
1682  024e 7b06          	ld	a,(OFST+6,sp)
1683  0250 97            	ld	xl,a
1684  0251 7b03          	ld	a,(OFST+3,sp)
1685  0253 95            	ld	xh,a
1686  0254 cd07d1        	call	L5_TI2_Config
1688  0257 84            	pop	a
1689                     ; 541     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1691  0258 7b06          	ld	a,(OFST+6,sp)
1692  025a cd068c        	call	_TIM1_SetIC2Prescaler
1695  025d 202a          	jra	L176
1696  025f               L376:
1697                     ; 543   else if (TIM1_Channel == TIM1_CHANNEL_3)
1699  025f a102          	cp	a,#2
1700  0261 2614          	jrne	L776
1701                     ; 546     TI3_Config(TIM1_ICPolarity,
1701                     ; 547                TIM1_ICSelection,
1701                     ; 548                TIM1_ICFilter);
1703  0263 7b07          	ld	a,(OFST+7,sp)
1704  0265 88            	push	a
1705  0266 7b06          	ld	a,(OFST+6,sp)
1706  0268 97            	ld	xl,a
1707  0269 7b03          	ld	a,(OFST+3,sp)
1708  026b 95            	ld	xh,a
1709  026c cd0801        	call	L7_TI3_Config
1711  026f 84            	pop	a
1712                     ; 550     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1714  0270 7b06          	ld	a,(OFST+6,sp)
1715  0272 cd0699        	call	_TIM1_SetIC3Prescaler
1718  0275 2012          	jra	L176
1719  0277               L776:
1720                     ; 555     TI4_Config(TIM1_ICPolarity,
1720                     ; 556                TIM1_ICSelection,
1720                     ; 557                TIM1_ICFilter);
1722  0277 7b07          	ld	a,(OFST+7,sp)
1723  0279 88            	push	a
1724  027a 7b06          	ld	a,(OFST+6,sp)
1725  027c 97            	ld	xl,a
1726  027d 7b03          	ld	a,(OFST+3,sp)
1727  027f 95            	ld	xh,a
1728  0280 cd0831        	call	L11_TI4_Config
1730  0283 84            	pop	a
1731                     ; 559     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1733  0284 7b06          	ld	a,(OFST+6,sp)
1734  0286 cd06a6        	call	_TIM1_SetIC4Prescaler
1736  0289               L176:
1737                     ; 562 }
1740  0289 85            	popw	x
1741  028a 81            	ret	
1837                     ; 590 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1837                     ; 591                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1837                     ; 592                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1837                     ; 593                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1837                     ; 594                      u8 TIM1_ICFilter)
1837                     ; 595 {
1838                     	switch	.text
1839  028b               _TIM1_PWMIConfig:
1841  028b 89            	pushw	x
1842  028c 89            	pushw	x
1843       00000002      OFST:	set	2
1846                     ; 596   u8 icpolarity = TIM1_ICPOLARITY_RISING;
1848                     ; 597   u8 icselection = TIM1_ICSELECTION_DIRECTTI;
1850                     ; 600   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1852                     ; 601   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1854                     ; 602   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1856                     ; 603   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1858                     ; 606   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1860  028d 9f            	ld	a,xl
1861  028e 4a            	dec	a
1862  028f 2702          	jreq	L157
1863                     ; 608     icpolarity = TIM1_ICPOLARITY_FALLING;
1865  0291 a601          	ld	a,#1
1867  0293               L157:
1868                     ; 612     icpolarity = TIM1_ICPOLARITY_RISING;
1870  0293 6b01          	ld	(OFST-1,sp),a
1871                     ; 616   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1873  0295 7b07          	ld	a,(OFST+5,sp)
1874  0297 4a            	dec	a
1875  0298 2604          	jrne	L557
1876                     ; 618     icselection = TIM1_ICSELECTION_INDIRECTTI;
1878  029a a602          	ld	a,#2
1880  029c 2002          	jra	L757
1881  029e               L557:
1882                     ; 622     icselection = TIM1_ICSELECTION_DIRECTTI;
1884  029e a601          	ld	a,#1
1885  02a0               L757:
1886  02a0 6b02          	ld	(OFST+0,sp),a
1887                     ; 625   if (TIM1_Channel == TIM1_CHANNEL_1)
1889  02a2 7b03          	ld	a,(OFST+1,sp)
1890  02a4 2626          	jrne	L167
1891                     ; 628     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection,
1891                     ; 629                TIM1_ICFilter);
1893  02a6 7b09          	ld	a,(OFST+7,sp)
1894  02a8 88            	push	a
1895  02a9 7b08          	ld	a,(OFST+6,sp)
1896  02ab 97            	ld	xl,a
1897  02ac 7b05          	ld	a,(OFST+3,sp)
1898  02ae 95            	ld	xh,a
1899  02af cd07a1        	call	L3_TI1_Config
1901  02b2 84            	pop	a
1902                     ; 632     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1904  02b3 7b08          	ld	a,(OFST+6,sp)
1905  02b5 cd067f        	call	_TIM1_SetIC1Prescaler
1907                     ; 635     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1909  02b8 7b09          	ld	a,(OFST+7,sp)
1910  02ba 88            	push	a
1911  02bb 7b03          	ld	a,(OFST+1,sp)
1912  02bd 97            	ld	xl,a
1913  02be 7b02          	ld	a,(OFST+0,sp)
1914  02c0 95            	ld	xh,a
1915  02c1 cd07d1        	call	L5_TI2_Config
1917  02c4 84            	pop	a
1918                     ; 638     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1920  02c5 7b08          	ld	a,(OFST+6,sp)
1921  02c7 cd068c        	call	_TIM1_SetIC2Prescaler
1924  02ca 2024          	jra	L367
1925  02cc               L167:
1926                     ; 643     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection,
1926                     ; 644                TIM1_ICFilter);
1928  02cc 7b09          	ld	a,(OFST+7,sp)
1929  02ce 88            	push	a
1930  02cf 7b08          	ld	a,(OFST+6,sp)
1931  02d1 97            	ld	xl,a
1932  02d2 7b05          	ld	a,(OFST+3,sp)
1933  02d4 95            	ld	xh,a
1934  02d5 cd07d1        	call	L5_TI2_Config
1936  02d8 84            	pop	a
1937                     ; 647     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1939  02d9 7b08          	ld	a,(OFST+6,sp)
1940  02db cd068c        	call	_TIM1_SetIC2Prescaler
1942                     ; 650     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1944  02de 7b09          	ld	a,(OFST+7,sp)
1945  02e0 88            	push	a
1946  02e1 7b03          	ld	a,(OFST+1,sp)
1947  02e3 97            	ld	xl,a
1948  02e4 7b02          	ld	a,(OFST+0,sp)
1949  02e6 95            	ld	xh,a
1950  02e7 cd07a1        	call	L3_TI1_Config
1952  02ea 84            	pop	a
1953                     ; 653     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1955  02eb 7b08          	ld	a,(OFST+6,sp)
1956  02ed cd067f        	call	_TIM1_SetIC1Prescaler
1958  02f0               L367:
1959                     ; 655 }
1962  02f0 5b04          	addw	sp,#4
1963  02f2 81            	ret	
2018                     ; 673 void TIM1_Cmd(FunctionalState NewState)
2018                     ; 674 {
2019                     	switch	.text
2020  02f3               _TIM1_Cmd:
2024                     ; 676   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2026                     ; 679   if (NewState != DISABLE)
2028  02f3 4d            	tnz	a
2029  02f4 2705          	jreq	L3101
2030                     ; 681     TIM1->CR1 |= TIM1_CR1_CEN;
2032  02f6 72105250      	bset	21072,#0
2035  02fa 81            	ret	
2036  02fb               L3101:
2037                     ; 685     TIM1->CR1 &= (u8)(~TIM1_CR1_CEN);
2039  02fb 72115250      	bres	21072,#0
2040                     ; 687 }
2043  02ff 81            	ret	
2079                     ; 705 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2079                     ; 706 {
2080                     	switch	.text
2081  0300               _TIM1_CtrlPWMOutputs:
2085                     ; 708   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2087                     ; 712   if (NewState != DISABLE)
2089  0300 4d            	tnz	a
2090  0301 2705          	jreq	L5301
2091                     ; 714     TIM1->BKR |= TIM1_BKR_MOE;
2093  0303 721e526d      	bset	21101,#7
2096  0307 81            	ret	
2097  0308               L5301:
2098                     ; 718     TIM1->BKR &= (u8)(~TIM1_BKR_MOE);
2100  0308 721f526d      	bres	21101,#7
2101                     ; 720 }
2104  030c 81            	ret	
2211                     ; 749 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2211                     ; 750 {
2212                     	switch	.text
2213  030d               _TIM1_ITConfig:
2215  030d 89            	pushw	x
2216       00000000      OFST:	set	0
2219                     ; 752   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2221                     ; 753   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2223                     ; 755   if (NewState != DISABLE)
2225  030e 9f            	ld	a,xl
2226  030f 4d            	tnz	a
2227  0310 2706          	jreq	L7011
2228                     ; 758     TIM1->IER |= (u8)TIM1_IT;
2230  0312 9e            	ld	a,xh
2231  0313 ca5254        	or	a,21076
2233  0316 2006          	jra	L1111
2234  0318               L7011:
2235                     ; 763     TIM1->IER &= (u8)(~(u8)TIM1_IT);
2237  0318 7b01          	ld	a,(OFST+1,sp)
2238  031a 43            	cpl	a
2239  031b c45254        	and	a,21076
2240  031e               L1111:
2241  031e c75254        	ld	21076,a
2242                     ; 765 }
2245  0321 85            	popw	x
2246  0322 81            	ret	
2270                     ; 783 void TIM1_InternalClockConfig(void)
2270                     ; 784 {
2271                     	switch	.text
2272  0323               _TIM1_InternalClockConfig:
2276                     ; 786   TIM1->SMCR &= (u8)(~TIM1_SMCR_SMS);
2278  0323 c65252        	ld	a,21074
2279  0326 a4f8          	and	a,#248
2280  0328 c75252        	ld	21074,a
2281                     ; 787 }
2284  032b 81            	ret	
2401                     ; 815 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2401                     ; 816                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2401                     ; 817                               u8 ExtTRGFilter)
2401                     ; 818 {
2402                     	switch	.text
2403  032c               _TIM1_ETRClockMode1Config:
2405  032c 89            	pushw	x
2406       00000000      OFST:	set	0
2409                     ; 820   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2411                     ; 821   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2413                     ; 824   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2415  032d 7b05          	ld	a,(OFST+5,sp)
2416  032f 88            	push	a
2417  0330 7b02          	ld	a,(OFST+2,sp)
2418  0332 95            	ld	xh,a
2419  0333 ad1b          	call	_TIM1_ETRConfig
2421  0335 84            	pop	a
2422                     ; 827   TIM1->SMCR = (u8)((TIM1->SMCR & (u8)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS ))) | (u8)(  TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2424  0336 c65252        	ld	a,21074
2425  0339 aa77          	or	a,#119
2426  033b c75252        	ld	21074,a
2427                     ; 828 }
2430  033e 85            	popw	x
2431  033f 81            	ret	
2489                     ; 856 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2489                     ; 857                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2489                     ; 858                               u8 ExtTRGFilter)
2489                     ; 859 {
2490                     	switch	.text
2491  0340               _TIM1_ETRClockMode2Config:
2493  0340 89            	pushw	x
2494       00000000      OFST:	set	0
2497                     ; 861   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2499                     ; 862   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2501                     ; 865   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2503  0341 7b05          	ld	a,(OFST+5,sp)
2504  0343 88            	push	a
2505  0344 7b02          	ld	a,(OFST+2,sp)
2506  0346 95            	ld	xh,a
2507  0347 ad07          	call	_TIM1_ETRConfig
2509  0349 721c5253      	bset	21075,#6
2510  034d 84            	pop	a
2511                     ; 868   TIM1->ETR |= TIM1_ETR_ECE;
2513                     ; 869 }
2516  034e 85            	popw	x
2517  034f 81            	ret	
2573                     ; 897 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2573                     ; 898                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2573                     ; 899                     u8 ExtTRGFilter)
2573                     ; 900 {
2574                     	switch	.text
2575  0350               _TIM1_ETRConfig:
2577  0350 89            	pushw	x
2578       00000000      OFST:	set	0
2581                     ; 902   TIM1->ETR |= (u8)((u8)TIM1_ExtTRGPrescaler |
2581                     ; 903                     (u8)TIM1_ExtTRGPolarity  |
2581                     ; 904                     (u8)ExtTRGFilter          );
2583  0351 9f            	ld	a,xl
2584  0352 1a01          	or	a,(OFST+1,sp)
2585  0354 1a05          	or	a,(OFST+5,sp)
2586  0356 ca5253        	or	a,21075
2587  0359 c75253        	ld	21075,a
2588                     ; 905 }
2591  035c 85            	popw	x
2592  035d 81            	ret	
2681                     ; 934 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2681                     ; 935                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2681                     ; 936                                  u8 ICFilter)
2681                     ; 937 {
2682                     	switch	.text
2683  035e               _TIM1_TIxExternalClockConfig:
2685  035e 89            	pushw	x
2686       00000000      OFST:	set	0
2689                     ; 939   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2691                     ; 940   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2693                     ; 941   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2695                     ; 944   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2697  035f 9e            	ld	a,xh
2698  0360 a160          	cp	a,#96
2699  0362 260e          	jrne	L1131
2700                     ; 946     TI2_Config(TIM1_ICPolarity, TIM1_ICSELECTION_DIRECTTI, ICFilter);
2702  0364 7b05          	ld	a,(OFST+5,sp)
2703  0366 88            	push	a
2704  0367 ae0001        	ldw	x,#1
2705  036a 7b03          	ld	a,(OFST+3,sp)
2706  036c 95            	ld	xh,a
2707  036d cd07d1        	call	L5_TI2_Config
2710  0370 200c          	jra	L3131
2711  0372               L1131:
2712                     ; 950     TI1_Config(TIM1_ICPolarity, TIM1_ICSELECTION_DIRECTTI, ICFilter);
2714  0372 7b05          	ld	a,(OFST+5,sp)
2715  0374 88            	push	a
2716  0375 ae0001        	ldw	x,#1
2717  0378 7b03          	ld	a,(OFST+3,sp)
2718  037a 95            	ld	xh,a
2719  037b cd07a1        	call	L3_TI1_Config
2721  037e               L3131:
2722  037e 84            	pop	a
2723                     ; 954   TIM1_SelectInputTrigger(TIM1_TIxExternalCLKSource);
2725  037f 7b01          	ld	a,(OFST+1,sp)
2726  0381 ad0a          	call	_TIM1_SelectInputTrigger
2728                     ; 957   TIM1->SMCR |= (u8)(TIM1_SLAVEMODE_EXTERNAL1);
2730  0383 c65252        	ld	a,21074
2731  0386 aa07          	or	a,#7
2732  0388 c75252        	ld	21074,a
2733                     ; 958 }
2736  038b 85            	popw	x
2737  038c 81            	ret	
2808                     ; 979 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2808                     ; 980 {
2809                     	switch	.text
2810  038d               _TIM1_SelectInputTrigger:
2812  038d 88            	push	a
2813       00000000      OFST:	set	0
2816                     ; 982   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2818                     ; 985   TIM1->SMCR = (u8)((TIM1->SMCR & (u8)(~TIM1_SMCR_TS)) | (u8)TIM1_InputTriggerSource);
2820  038e c65252        	ld	a,21074
2821  0391 a48f          	and	a,#143
2822  0393 1a01          	or	a,(OFST+1,sp)
2823  0395 c75252        	ld	21074,a
2824                     ; 986 }
2827  0398 84            	pop	a
2828  0399 81            	ret	
2864                     ; 1005 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2864                     ; 1006 {
2865                     	switch	.text
2866  039a               _TIM1_UpdateDisableConfig:
2870                     ; 1008   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2872                     ; 1011   if (NewState != DISABLE)
2874  039a 4d            	tnz	a
2875  039b 2705          	jreq	L5631
2876                     ; 1013     TIM1->CR1 |= TIM1_CR1_UDIS;
2878  039d 72125250      	bset	21072,#1
2881  03a1 81            	ret	
2882  03a2               L5631:
2883                     ; 1017     TIM1->CR1 &= (u8)(~TIM1_CR1_UDIS);
2885  03a2 72135250      	bres	21072,#1
2886                     ; 1019 }
2889  03a6 81            	ret	
2947                     ; 1038 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2947                     ; 1039 {
2948                     	switch	.text
2949  03a7               _TIM1_UpdateRequestConfig:
2953                     ; 1041   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2955                     ; 1044   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2957  03a7 4d            	tnz	a
2958  03a8 2705          	jreq	L7141
2959                     ; 1046     TIM1->CR1 |= TIM1_CR1_URS;
2961  03aa 72145250      	bset	21072,#2
2964  03ae 81            	ret	
2965  03af               L7141:
2966                     ; 1050     TIM1->CR1 &= (u8)(~TIM1_CR1_URS);
2968  03af 72155250      	bres	21072,#2
2969                     ; 1052 }
2972  03b3 81            	ret	
3008                     ; 1070 void TIM1_SelectHallSensor(FunctionalState NewState)
3008                     ; 1071 {
3009                     	switch	.text
3010  03b4               _TIM1_SelectHallSensor:
3014                     ; 1073   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3016                     ; 1076   if (NewState != DISABLE)
3018  03b4 4d            	tnz	a
3019  03b5 2705          	jreq	L1441
3020                     ; 1078     TIM1->CR2 |= TIM1_CR2_TI1S;
3022  03b7 721e5251      	bset	21073,#7
3025  03bb 81            	ret	
3026  03bc               L1441:
3027                     ; 1082     TIM1->CR2 &= (u8)(~TIM1_CR2_TI1S);
3029  03bc 721f5251      	bres	21073,#7
3030                     ; 1084 }
3033  03c0 81            	ret	
3090                     ; 1104 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3090                     ; 1105 {
3091                     	switch	.text
3092  03c1               _TIM1_SelectOnePulseMode:
3096                     ; 1107   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3098                     ; 1110   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3100  03c1 4d            	tnz	a
3101  03c2 2705          	jreq	L3741
3102                     ; 1112     TIM1->CR1 |= TIM1_CR1_OPM;
3104  03c4 72165250      	bset	21072,#3
3107  03c8 81            	ret	
3108  03c9               L3741:
3109                     ; 1116     TIM1->CR1 &= (u8)(~TIM1_CR1_OPM);
3111  03c9 72175250      	bres	21072,#3
3112                     ; 1119 }
3115  03cd 81            	ret	
3213                     ; 1144 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3213                     ; 1145 {
3214                     	switch	.text
3215  03ce               _TIM1_SelectOutputTrigger:
3217  03ce 88            	push	a
3218       00000000      OFST:	set	0
3221                     ; 1148   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3223                     ; 1150   TIM1->CR2 = (u8)((TIM1->CR2 & (u8)(~TIM1_CR2_MMS    )) | (u8)  TIM1_TRGOSource);
3225  03cf c65251        	ld	a,21073
3226  03d2 a48f          	and	a,#143
3227  03d4 1a01          	or	a,(OFST+1,sp)
3228  03d6 c75251        	ld	21073,a
3229                     ; 1151 }
3232  03d9 84            	pop	a
3233  03da 81            	ret	
3307                     ; 1172 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3307                     ; 1173 {
3308                     	switch	.text
3309  03db               _TIM1_SelectSlaveMode:
3311  03db 88            	push	a
3312       00000000      OFST:	set	0
3315                     ; 1176   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3317                     ; 1179   TIM1->SMCR = (u8)((TIM1->SMCR &  (u8)(~TIM1_SMCR_SMS)) |  (u8)TIM1_SlaveMode);
3319  03dc c65252        	ld	a,21074
3320  03df a4f8          	and	a,#248
3321  03e1 1a01          	or	a,(OFST+1,sp)
3322  03e3 c75252        	ld	21074,a
3323                     ; 1181 }
3326  03e6 84            	pop	a
3327  03e7 81            	ret	
3363                     ; 1198 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3363                     ; 1199 {
3364                     	switch	.text
3365  03e8               _TIM1_SelectMasterSlaveMode:
3369                     ; 1201   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3371                     ; 1204   if (NewState != DISABLE)
3373  03e8 4d            	tnz	a
3374  03e9 2705          	jreq	L7061
3375                     ; 1206     TIM1->SMCR |= TIM1_SMCR_MSM;
3377  03eb 721e5252      	bset	21074,#7
3380  03ef 81            	ret	
3381  03f0               L7061:
3382                     ; 1210     TIM1->SMCR &= (u8)(~TIM1_SMCR_MSM);
3384  03f0 721f5252      	bres	21074,#7
3385                     ; 1212 }
3388  03f4 81            	ret	
3474                     ; 1243 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3474                     ; 1244                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3474                     ; 1245                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3474                     ; 1246 {
3475                     	switch	.text
3476  03f5               _TIM1_EncoderInterfaceConfig:
3478  03f5 89            	pushw	x
3479       00000000      OFST:	set	0
3482                     ; 1250   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3484                     ; 1251   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3486                     ; 1252   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3488                     ; 1255   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3490  03f6 9f            	ld	a,xl
3491  03f7 4d            	tnz	a
3492  03f8 2706          	jreq	L3561
3493                     ; 1257     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3495  03fa 7212525c      	bset	21084,#1
3497  03fe 2004          	jra	L5561
3498  0400               L3561:
3499                     ; 1261     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1P);
3501  0400 7213525c      	bres	21084,#1
3502  0404               L5561:
3503                     ; 1264   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3505  0404 7b05          	ld	a,(OFST+5,sp)
3506  0406 2706          	jreq	L7561
3507                     ; 1266     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3509  0408 721a525c      	bset	21084,#5
3511  040c 2004          	jra	L1661
3512  040e               L7561:
3513                     ; 1270     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC2P);
3515  040e 721b525c      	bres	21084,#5
3516  0412               L1661:
3517                     ; 1273   TIM1->SMCR = (u8)((TIM1->SMCR & (u8)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (u8) TIM1_EncoderMode);
3519  0412 c65252        	ld	a,21074
3520  0415 a4f0          	and	a,#240
3521  0417 1a01          	or	a,(OFST+1,sp)
3522  0419 c75252        	ld	21074,a
3523                     ; 1276   TIM1->CCMR1 = (u8)((TIM1->CCMR1 & (u8)(~TIM1_CCMR_CCxS))  | (u8) CCMR_TIxDirect_Set);
3525  041c c65258        	ld	a,21080
3526  041f a4fc          	and	a,#252
3527  0421 aa01          	or	a,#1
3528  0423 c75258        	ld	21080,a
3529                     ; 1277   TIM1->CCMR2 = (u8)((TIM1->CCMR2 & (u8)(~TIM1_CCMR_CCxS)) | (u8) CCMR_TIxDirect_Set);
3531  0426 c65259        	ld	a,21081
3532  0429 a4fc          	and	a,#252
3533  042b aa01          	or	a,#1
3534  042d c75259        	ld	21081,a
3535                     ; 1279 }
3538  0430 85            	popw	x
3539  0431 81            	ret	
3606                     ; 1303 void TIM1_PrescalerConfig(u16 Prescaler,
3606                     ; 1304                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3606                     ; 1305 {
3607                     	switch	.text
3608  0432               _TIM1_PrescalerConfig:
3610  0432 89            	pushw	x
3611       00000000      OFST:	set	0
3614                     ; 1307   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3616                     ; 1310   TIM1->PSCRH = (u8)(Prescaler >> 8);
3618  0433 9e            	ld	a,xh
3619  0434 c75260        	ld	21088,a
3620                     ; 1311   TIM1->PSCRL = (u8)(Prescaler);
3622  0437 9f            	ld	a,xl
3623  0438 c75261        	ld	21089,a
3624                     ; 1314   TIM1->EGR = TIM1_PSCReloadMode;
3626  043b 7b05          	ld	a,(OFST+5,sp)
3627  043d c75257        	ld	21079,a
3628                     ; 1316 }
3631  0440 85            	popw	x
3632  0441 81            	ret	
3668                     ; 1338 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3668                     ; 1339 {
3669                     	switch	.text
3670  0442               _TIM1_CounterModeConfig:
3672  0442 88            	push	a
3673       00000000      OFST:	set	0
3676                     ; 1341   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3678                     ; 1345   TIM1->CR1 = (u8)((TIM1->CR1 & (u8)((u8)(~TIM1_CR1_CMS) & (u8)(~TIM1_CR1_DIR))) | (u8)TIM1_CounterMode);
3680  0443 c65250        	ld	a,21072
3681  0446 a48f          	and	a,#143
3682  0448 1a01          	or	a,(OFST+1,sp)
3683  044a c75250        	ld	21072,a
3684                     ; 1346 }
3687  044d 84            	pop	a
3688  044e 81            	ret	
3746                     ; 1367 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3746                     ; 1368 {
3747                     	switch	.text
3748  044f               _TIM1_ForcedOC1Config:
3750  044f 88            	push	a
3751       00000000      OFST:	set	0
3754                     ; 1370   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3756                     ; 1373   TIM1->CCMR1 =  (u8)((TIM1->CCMR1 & (u8)(~TIM1_CCMR_OCM))  | (u8)TIM1_ForcedAction);
3758  0450 c65258        	ld	a,21080
3759  0453 a48f          	and	a,#143
3760  0455 1a01          	or	a,(OFST+1,sp)
3761  0457 c75258        	ld	21080,a
3762                     ; 1374 }
3765  045a 84            	pop	a
3766  045b 81            	ret	
3802                     ; 1395 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3802                     ; 1396 {
3803                     	switch	.text
3804  045c               _TIM1_ForcedOC2Config:
3806  045c 88            	push	a
3807       00000000      OFST:	set	0
3810                     ; 1398   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3812                     ; 1401   TIM1->CCMR2  =  (u8)((TIM1->CCMR2 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_ForcedAction);
3814  045d c65259        	ld	a,21081
3815  0460 a48f          	and	a,#143
3816  0462 1a01          	or	a,(OFST+1,sp)
3817  0464 c75259        	ld	21081,a
3818                     ; 1402 }
3821  0467 84            	pop	a
3822  0468 81            	ret	
3858                     ; 1423 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3858                     ; 1424 {
3859                     	switch	.text
3860  0469               _TIM1_ForcedOC3Config:
3862  0469 88            	push	a
3863       00000000      OFST:	set	0
3866                     ; 1426   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3868                     ; 1429   TIM1->CCMR3  =  (u8)((TIM1->CCMR3 & (u8)(~TIM1_CCMR_OCM))  | (u8)TIM1_ForcedAction);
3870  046a c6525a        	ld	a,21082
3871  046d a48f          	and	a,#143
3872  046f 1a01          	or	a,(OFST+1,sp)
3873  0471 c7525a        	ld	21082,a
3874                     ; 1430 }
3877  0474 84            	pop	a
3878  0475 81            	ret	
3914                     ; 1451 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3914                     ; 1452 {
3915                     	switch	.text
3916  0476               _TIM1_ForcedOC4Config:
3918  0476 88            	push	a
3919       00000000      OFST:	set	0
3922                     ; 1454   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3924                     ; 1457   TIM1->CCMR4  =  (u8)((TIM1->CCMR4 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_ForcedAction);
3926  0477 c6525b        	ld	a,21083
3927  047a a48f          	and	a,#143
3928  047c 1a01          	or	a,(OFST+1,sp)
3929  047e c7525b        	ld	21083,a
3930                     ; 1458 }
3933  0481 84            	pop	a
3934  0482 81            	ret	
3970                     ; 1476 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3970                     ; 1477 {
3971                     	switch	.text
3972  0483               _TIM1_ARRPreloadConfig:
3976                     ; 1479   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3978                     ; 1482   if (NewState != DISABLE)
3980  0483 4d            	tnz	a
3981  0484 2705          	jreq	L1502
3982                     ; 1484     TIM1->CR1 |= TIM1_CR1_ARPE;
3984  0486 721e5250      	bset	21072,#7
3987  048a 81            	ret	
3988  048b               L1502:
3989                     ; 1488     TIM1->CR1 &= (u8)(~TIM1_CR1_ARPE);
3991  048b 721f5250      	bres	21072,#7
3992                     ; 1490 }
3995  048f 81            	ret	
4030                     ; 1508 void TIM1_SelectCOM(FunctionalState NewState)
4030                     ; 1509 {
4031                     	switch	.text
4032  0490               _TIM1_SelectCOM:
4036                     ; 1511   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4038                     ; 1514   if (NewState != DISABLE)
4040  0490 4d            	tnz	a
4041  0491 2705          	jreq	L3702
4042                     ; 1516     TIM1->CR2 |= TIM1_CR2_COMS;
4044  0493 72145251      	bset	21073,#2
4047  0497 81            	ret	
4048  0498               L3702:
4049                     ; 1520     TIM1->CR2 &= (u8)(~TIM1_CR2_COMS);
4051  0498 72155251      	bres	21073,#2
4052                     ; 1522 }
4055  049c 81            	ret	
4091                     ; 1539 void TIM1_CCPreloadControl(FunctionalState NewState)
4091                     ; 1540 {
4092                     	switch	.text
4093  049d               _TIM1_CCPreloadControl:
4097                     ; 1542   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4099                     ; 1545   if (NewState != DISABLE)
4101  049d 4d            	tnz	a
4102  049e 2705          	jreq	L5112
4103                     ; 1547     TIM1->CR2 |= TIM1_CR2_CCPC;
4105  04a0 72105251      	bset	21073,#0
4108  04a4 81            	ret	
4109  04a5               L5112:
4110                     ; 1551     TIM1->CR2 &= (u8)(~TIM1_CR2_CCPC);
4112  04a5 72115251      	bres	21073,#0
4113                     ; 1553 }
4116  04a9 81            	ret	
4152                     ; 1571 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4152                     ; 1572 {
4153                     	switch	.text
4154  04aa               _TIM1_OC1PreloadConfig:
4158                     ; 1574   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4160                     ; 1577   if (NewState != DISABLE)
4162  04aa 4d            	tnz	a
4163  04ab 2705          	jreq	L7312
4164                     ; 1579     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4166  04ad 72165258      	bset	21080,#3
4169  04b1 81            	ret	
4170  04b2               L7312:
4171                     ; 1583     TIM1->CCMR1 &= (u8)(~TIM1_CCMR_OCxPE);
4173  04b2 72175258      	bres	21080,#3
4174                     ; 1585 }
4177  04b6 81            	ret	
4213                     ; 1603 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4213                     ; 1604 {
4214                     	switch	.text
4215  04b7               _TIM1_OC2PreloadConfig:
4219                     ; 1606   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4221                     ; 1609   if (NewState != DISABLE)
4223  04b7 4d            	tnz	a
4224  04b8 2705          	jreq	L1612
4225                     ; 1611     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4227  04ba 72165259      	bset	21081,#3
4230  04be 81            	ret	
4231  04bf               L1612:
4232                     ; 1615     TIM1->CCMR2 &= (u8)(~TIM1_CCMR_OCxPE);
4234  04bf 72175259      	bres	21081,#3
4235                     ; 1617 }
4238  04c3 81            	ret	
4274                     ; 1635 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4274                     ; 1636 {
4275                     	switch	.text
4276  04c4               _TIM1_OC3PreloadConfig:
4280                     ; 1638   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4282                     ; 1641   if (NewState != DISABLE)
4284  04c4 4d            	tnz	a
4285  04c5 2705          	jreq	L3022
4286                     ; 1643     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4288  04c7 7216525a      	bset	21082,#3
4291  04cb 81            	ret	
4292  04cc               L3022:
4293                     ; 1647     TIM1->CCMR3 &= (u8)(~TIM1_CCMR_OCxPE);
4295  04cc 7217525a      	bres	21082,#3
4296                     ; 1649 }
4299  04d0 81            	ret	
4335                     ; 1668 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4335                     ; 1669 {
4336                     	switch	.text
4337  04d1               _TIM1_OC4PreloadConfig:
4341                     ; 1671   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4343                     ; 1674   if (NewState != DISABLE)
4345  04d1 4d            	tnz	a
4346  04d2 2705          	jreq	L5222
4347                     ; 1676     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4349  04d4 7216525b      	bset	21083,#3
4352  04d8 81            	ret	
4353  04d9               L5222:
4354                     ; 1680     TIM1->CCMR4 &= (u8)(~TIM1_CCMR_OCxPE);
4356  04d9 7217525b      	bres	21083,#3
4357                     ; 1682 }
4360  04dd 81            	ret	
4395                     ; 1699 void TIM1_OC1FastConfig(FunctionalState NewState)
4395                     ; 1700 {
4396                     	switch	.text
4397  04de               _TIM1_OC1FastConfig:
4401                     ; 1702   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4403                     ; 1705   if (NewState != DISABLE)
4405  04de 4d            	tnz	a
4406  04df 2705          	jreq	L7422
4407                     ; 1707     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4409  04e1 72145258      	bset	21080,#2
4412  04e5 81            	ret	
4413  04e6               L7422:
4414                     ; 1711     TIM1->CCMR1 &= (u8)(~TIM1_CCMR_OCxFE);
4416  04e6 72155258      	bres	21080,#2
4417                     ; 1713 }
4420  04ea 81            	ret	
4455                     ; 1732 void TIM1_OC2FastConfig(FunctionalState NewState)
4455                     ; 1733 {
4456                     	switch	.text
4457  04eb               _TIM1_OC2FastConfig:
4461                     ; 1735   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4463                     ; 1738   if (NewState != DISABLE)
4465  04eb 4d            	tnz	a
4466  04ec 2705          	jreq	L1722
4467                     ; 1740     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4469  04ee 72145259      	bset	21081,#2
4472  04f2 81            	ret	
4473  04f3               L1722:
4474                     ; 1744     TIM1->CCMR2 &= (u8)(~TIM1_CCMR_OCxFE);
4476  04f3 72155259      	bres	21081,#2
4477                     ; 1746 }
4480  04f7 81            	ret	
4515                     ; 1764 void TIM1_OC3FastConfig(FunctionalState NewState)
4515                     ; 1765 {
4516                     	switch	.text
4517  04f8               _TIM1_OC3FastConfig:
4521                     ; 1767   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4523                     ; 1770   if (NewState != DISABLE)
4525  04f8 4d            	tnz	a
4526  04f9 2705          	jreq	L3132
4527                     ; 1772     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4529  04fb 7214525a      	bset	21082,#2
4532  04ff 81            	ret	
4533  0500               L3132:
4534                     ; 1776     TIM1->CCMR3 &= (u8)(~TIM1_CCMR_OCxFE);
4536  0500 7215525a      	bres	21082,#2
4537                     ; 1778 }
4540  0504 81            	ret	
4575                     ; 1796 void TIM1_OC4FastConfig(FunctionalState NewState)
4575                     ; 1797 {
4576                     	switch	.text
4577  0505               _TIM1_OC4FastConfig:
4581                     ; 1799   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4583                     ; 1802   if (NewState != DISABLE)
4585  0505 4d            	tnz	a
4586  0506 2705          	jreq	L5332
4587                     ; 1804     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4589  0508 7214525b      	bset	21083,#2
4592  050c 81            	ret	
4593  050d               L5332:
4594                     ; 1808     TIM1->CCMR4 &= (u8)(~TIM1_CCMR_OCxFE);
4596  050d 7215525b      	bres	21083,#2
4597                     ; 1810 }
4600  0511 81            	ret	
4705                     ; 1836 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4705                     ; 1837 {
4706                     	switch	.text
4707  0512               _TIM1_GenerateEvent:
4711                     ; 1839   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4713                     ; 1842   TIM1->EGR = (u8)TIM1_EventSource;
4715  0512 c75257        	ld	21079,a
4716                     ; 1843 }
4719  0515 81            	ret	
4755                     ; 1863 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4755                     ; 1864 {
4756                     	switch	.text
4757  0516               _TIM1_OC1PolarityConfig:
4761                     ; 1866   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4763                     ; 1869   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4765  0516 4d            	tnz	a
4766  0517 2705          	jreq	L1242
4767                     ; 1871     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4769  0519 7212525c      	bset	21084,#1
4772  051d 81            	ret	
4773  051e               L1242:
4774                     ; 1875     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1P);
4776  051e 7213525c      	bres	21084,#1
4777                     ; 1877 }
4780  0522 81            	ret	
4816                     ; 1897 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4816                     ; 1898 {
4817                     	switch	.text
4818  0523               _TIM1_OC1NPolarityConfig:
4822                     ; 1900   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4824                     ; 1903   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4826  0523 4d            	tnz	a
4827  0524 2705          	jreq	L3442
4828                     ; 1905     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4830  0526 7216525c      	bset	21084,#3
4833  052a 81            	ret	
4834  052b               L3442:
4835                     ; 1909     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1NP);
4837  052b 7217525c      	bres	21084,#3
4838                     ; 1911 }
4841  052f 81            	ret	
4877                     ; 1931 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4877                     ; 1932 {
4878                     	switch	.text
4879  0530               _TIM1_OC2PolarityConfig:
4883                     ; 1934   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4885                     ; 1937   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4887  0530 4d            	tnz	a
4888  0531 2705          	jreq	L5642
4889                     ; 1939     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4891  0533 721a525c      	bset	21084,#5
4894  0537 81            	ret	
4895  0538               L5642:
4896                     ; 1943     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC2P);
4898  0538 721b525c      	bres	21084,#5
4899                     ; 1945 }
4902  053c 81            	ret	
4938                     ; 1964 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4938                     ; 1965 {
4939                     	switch	.text
4940  053d               _TIM1_OC2NPolarityConfig:
4944                     ; 1967   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4946                     ; 1970   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4948  053d 4d            	tnz	a
4949  053e 2705          	jreq	L7052
4950                     ; 1972     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4952  0540 721e525c      	bset	21084,#7
4955  0544 81            	ret	
4956  0545               L7052:
4957                     ; 1976     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC2NP);
4959  0545 721f525c      	bres	21084,#7
4960                     ; 1978 }
4963  0549 81            	ret	
4999                     ; 1998 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4999                     ; 1999 {
5000                     	switch	.text
5001  054a               _TIM1_OC3PolarityConfig:
5005                     ; 2001   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5007                     ; 2004   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5009  054a 4d            	tnz	a
5010  054b 2705          	jreq	L1352
5011                     ; 2006     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5013  054d 7212525d      	bset	21085,#1
5016  0551 81            	ret	
5017  0552               L1352:
5018                     ; 2010     TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC3P);
5020  0552 7213525d      	bres	21085,#1
5021                     ; 2012 }
5024  0556 81            	ret	
5060                     ; 2032 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5060                     ; 2033 {
5061                     	switch	.text
5062  0557               _TIM1_OC3NPolarityConfig:
5066                     ; 2035   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5068                     ; 2038   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5070  0557 4d            	tnz	a
5071  0558 2705          	jreq	L3552
5072                     ; 2040     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5074  055a 7216525d      	bset	21085,#3
5077  055e 81            	ret	
5078  055f               L3552:
5079                     ; 2044     TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC3NP);
5081  055f 7217525d      	bres	21085,#3
5082                     ; 2046 }
5085  0563 81            	ret	
5121                     ; 2065 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5121                     ; 2066 {
5122                     	switch	.text
5123  0564               _TIM1_OC4PolarityConfig:
5127                     ; 2068   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5129                     ; 2071   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5131  0564 4d            	tnz	a
5132  0565 2705          	jreq	L5752
5133                     ; 2073     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5135  0567 721a525d      	bset	21085,#5
5138  056b 81            	ret	
5139  056c               L5752:
5140                     ; 2077     TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC4P);
5142  056c 721b525d      	bres	21085,#5
5143                     ; 2079 }
5146  0570 81            	ret	
5191                     ; 2103 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5191                     ; 2104 {
5192                     	switch	.text
5193  0571               _TIM1_CCxCmd:
5195  0571 89            	pushw	x
5196       00000000      OFST:	set	0
5199                     ; 2106   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5201                     ; 2107   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5203                     ; 2109   if (TIM1_Channel == TIM1_CHANNEL_1)
5205  0572 9e            	ld	a,xh
5206  0573 4d            	tnz	a
5207  0574 2610          	jrne	L3262
5208                     ; 2112     if (NewState != DISABLE)
5210  0576 9f            	ld	a,xl
5211  0577 4d            	tnz	a
5212  0578 2706          	jreq	L5262
5213                     ; 2114       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5215  057a 7210525c      	bset	21084,#0
5217  057e 203e          	jra	L1362
5218  0580               L5262:
5219                     ; 2118       TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1E);
5221  0580 7211525c      	bres	21084,#0
5222  0584 2038          	jra	L1362
5223  0586               L3262:
5224                     ; 2122   else if (TIM1_Channel == TIM1_CHANNEL_2)
5226  0586 7b01          	ld	a,(OFST+1,sp)
5227  0588 a101          	cp	a,#1
5228  058a 2610          	jrne	L3362
5229                     ; 2125     if (NewState != DISABLE)
5231  058c 7b02          	ld	a,(OFST+2,sp)
5232  058e 2706          	jreq	L5362
5233                     ; 2127       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5235  0590 7218525c      	bset	21084,#4
5237  0594 2028          	jra	L1362
5238  0596               L5362:
5239                     ; 2131       TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC2E);
5241  0596 7219525c      	bres	21084,#4
5242  059a 2022          	jra	L1362
5243  059c               L3362:
5244                     ; 2134   else if (TIM1_Channel == TIM1_CHANNEL_3)
5246  059c a102          	cp	a,#2
5247  059e 2610          	jrne	L3462
5248                     ; 2137     if (NewState != DISABLE)
5250  05a0 7b02          	ld	a,(OFST+2,sp)
5251  05a2 2706          	jreq	L5462
5252                     ; 2139       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5254  05a4 7210525d      	bset	21085,#0
5256  05a8 2014          	jra	L1362
5257  05aa               L5462:
5258                     ; 2143       TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC3E);
5260  05aa 7211525d      	bres	21085,#0
5261  05ae 200e          	jra	L1362
5262  05b0               L3462:
5263                     ; 2149     if (NewState != DISABLE)
5265  05b0 7b02          	ld	a,(OFST+2,sp)
5266  05b2 2706          	jreq	L3562
5267                     ; 2151       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5269  05b4 7218525d      	bset	21085,#4
5271  05b8 2004          	jra	L1362
5272  05ba               L3562:
5273                     ; 2155       TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC4E);
5275  05ba 7219525d      	bres	21085,#4
5276  05be               L1362:
5277                     ; 2158 }
5280  05be 85            	popw	x
5281  05bf 81            	ret	
5326                     ; 2180 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5326                     ; 2181 {
5327                     	switch	.text
5328  05c0               _TIM1_CCxNCmd:
5330  05c0 89            	pushw	x
5331       00000000      OFST:	set	0
5334                     ; 2183   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5336                     ; 2184   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5338                     ; 2186   if (TIM1_Channel == TIM1_CHANNEL_1)
5340  05c1 9e            	ld	a,xh
5341  05c2 4d            	tnz	a
5342  05c3 2610          	jrne	L1072
5343                     ; 2189     if (NewState != DISABLE)
5345  05c5 9f            	ld	a,xl
5346  05c6 4d            	tnz	a
5347  05c7 2706          	jreq	L3072
5348                     ; 2191       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5350  05c9 7214525c      	bset	21084,#2
5352  05cd 2029          	jra	L7072
5353  05cf               L3072:
5354                     ; 2195       TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1NE);
5356  05cf 7215525c      	bres	21084,#2
5357  05d3 2023          	jra	L7072
5358  05d5               L1072:
5359                     ; 2198   else if (TIM1_Channel == TIM1_CHANNEL_2)
5361  05d5 7b01          	ld	a,(OFST+1,sp)
5362  05d7 4a            	dec	a
5363  05d8 2610          	jrne	L1172
5364                     ; 2201     if (NewState != DISABLE)
5366  05da 7b02          	ld	a,(OFST+2,sp)
5367  05dc 2706          	jreq	L3172
5368                     ; 2203       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5370  05de 721c525c      	bset	21084,#6
5372  05e2 2014          	jra	L7072
5373  05e4               L3172:
5374                     ; 2207       TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC2NE);
5376  05e4 721d525c      	bres	21084,#6
5377  05e8 200e          	jra	L7072
5378  05ea               L1172:
5379                     ; 2213     if (NewState != DISABLE)
5381  05ea 7b02          	ld	a,(OFST+2,sp)
5382  05ec 2706          	jreq	L1272
5383                     ; 2215       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5385  05ee 7214525d      	bset	21085,#2
5387  05f2 2004          	jra	L7072
5388  05f4               L1272:
5389                     ; 2219       TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC3NE);
5391  05f4 7215525d      	bres	21085,#2
5392  05f8               L7072:
5393                     ; 2222 }
5396  05f8 85            	popw	x
5397  05f9 81            	ret	
5442                     ; 2255 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5442                     ; 2256 {
5443                     	switch	.text
5444  05fa               _TIM1_SelectOCxM:
5446  05fa 89            	pushw	x
5447       00000000      OFST:	set	0
5450                     ; 2258   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5452                     ; 2259   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5454                     ; 2261   if (TIM1_Channel == TIM1_CHANNEL_1)
5456  05fb 9e            	ld	a,xh
5457  05fc 4d            	tnz	a
5458  05fd 2610          	jrne	L7472
5459                     ; 2264     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1E);
5461  05ff 7211525c      	bres	21084,#0
5462                     ; 2267     TIM1->CCMR1 = (u8)((TIM1->CCMR1 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_OCMode);
5464  0603 c65258        	ld	a,21080
5465  0606 a48f          	and	a,#143
5466  0608 1a02          	or	a,(OFST+2,sp)
5467  060a c75258        	ld	21080,a
5469  060d 2038          	jra	L1572
5470  060f               L7472:
5471                     ; 2269   else if (TIM1_Channel == TIM1_CHANNEL_2)
5473  060f 7b01          	ld	a,(OFST+1,sp)
5474  0611 a101          	cp	a,#1
5475  0613 2610          	jrne	L3572
5476                     ; 2272     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC2E);
5478  0615 7219525c      	bres	21084,#4
5479                     ; 2275     TIM1->CCMR2 = (u8)((TIM1->CCMR2 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_OCMode);
5481  0619 c65259        	ld	a,21081
5482  061c a48f          	and	a,#143
5483  061e 1a02          	or	a,(OFST+2,sp)
5484  0620 c75259        	ld	21081,a
5486  0623 2022          	jra	L1572
5487  0625               L3572:
5488                     ; 2277   else if (TIM1_Channel == TIM1_CHANNEL_3)
5490  0625 a102          	cp	a,#2
5491  0627 2610          	jrne	L7572
5492                     ; 2280     TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC3E);
5494  0629 7211525d      	bres	21085,#0
5495                     ; 2283     TIM1->CCMR3 = (u8)((TIM1->CCMR3 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_OCMode);
5497  062d c6525a        	ld	a,21082
5498  0630 a48f          	and	a,#143
5499  0632 1a02          	or	a,(OFST+2,sp)
5500  0634 c7525a        	ld	21082,a
5502  0637 200e          	jra	L1572
5503  0639               L7572:
5504                     ; 2288     TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC4E);
5506  0639 7219525d      	bres	21085,#4
5507                     ; 2291     TIM1->CCMR4 = (u8)((TIM1->CCMR4 & (u8)(~TIM1_CCMR_OCM)) | (u8)TIM1_OCMode);
5509  063d c6525b        	ld	a,21083
5510  0640 a48f          	and	a,#143
5511  0642 1a02          	or	a,(OFST+2,sp)
5512  0644 c7525b        	ld	21083,a
5513  0647               L1572:
5514                     ; 2293 }
5517  0647 85            	popw	x
5518  0648 81            	ret	
5552                     ; 2311 void TIM1_SetCounter(u16 Counter)
5552                     ; 2312 {
5553                     	switch	.text
5554  0649               _TIM1_SetCounter:
5558                     ; 2314   TIM1->CNTRH = (u8)(Counter >> 8);
5560  0649 9e            	ld	a,xh
5561  064a c7525e        	ld	21086,a
5562                     ; 2315   TIM1->CNTRL = (u8)(Counter);
5564  064d 9f            	ld	a,xl
5565  064e c7525f        	ld	21087,a
5566                     ; 2317 }
5569  0651 81            	ret	
5603                     ; 2335 void TIM1_SetAutoreload(u16 Autoreload)
5603                     ; 2336 {
5604                     	switch	.text
5605  0652               _TIM1_SetAutoreload:
5609                     ; 2339   TIM1->ARRH = (u8)(Autoreload >> 8);
5611  0652 9e            	ld	a,xh
5612  0653 c75262        	ld	21090,a
5613                     ; 2340   TIM1->ARRL = (u8)(Autoreload);
5615  0656 9f            	ld	a,xl
5616  0657 c75263        	ld	21091,a
5617                     ; 2342 }
5620  065a 81            	ret	
5654                     ; 2360 void TIM1_SetCompare1(u16 Compare1)
5654                     ; 2361 {
5655                     	switch	.text
5656  065b               _TIM1_SetCompare1:
5660                     ; 2363   TIM1->CCR1H = (u8)(Compare1 >> 8);
5662  065b 9e            	ld	a,xh
5663  065c c75265        	ld	21093,a
5664                     ; 2364   TIM1->CCR1L = (u8)(Compare1);
5666  065f 9f            	ld	a,xl
5667  0660 c75266        	ld	21094,a
5668                     ; 2366 }
5671  0663 81            	ret	
5705                     ; 2384 void TIM1_SetCompare2(u16 Compare2)
5705                     ; 2385 {
5706                     	switch	.text
5707  0664               _TIM1_SetCompare2:
5711                     ; 2387   TIM1->CCR2H = (u8)(Compare2 >> 8);
5713  0664 9e            	ld	a,xh
5714  0665 c75267        	ld	21095,a
5715                     ; 2388   TIM1->CCR2L = (u8)(Compare2);
5717  0668 9f            	ld	a,xl
5718  0669 c75268        	ld	21096,a
5719                     ; 2390 }
5722  066c 81            	ret	
5756                     ; 2408 void TIM1_SetCompare3(u16 Compare3)
5756                     ; 2409 {
5757                     	switch	.text
5758  066d               _TIM1_SetCompare3:
5762                     ; 2411   TIM1->CCR3H = (u8)(Compare3 >> 8);
5764  066d 9e            	ld	a,xh
5765  066e c75269        	ld	21097,a
5766                     ; 2412   TIM1->CCR3L = (u8)(Compare3);
5768  0671 9f            	ld	a,xl
5769  0672 c7526a        	ld	21098,a
5770                     ; 2414 }
5773  0675 81            	ret	
5807                     ; 2432 void TIM1_SetCompare4(u16 Compare4)
5807                     ; 2433 {
5808                     	switch	.text
5809  0676               _TIM1_SetCompare4:
5813                     ; 2435   TIM1->CCR4H = (u8)(Compare4 >> 8);
5815  0676 9e            	ld	a,xh
5816  0677 c7526b        	ld	21099,a
5817                     ; 2436   TIM1->CCR4L = (u8)(Compare4);
5819  067a 9f            	ld	a,xl
5820  067b c7526c        	ld	21100,a
5821                     ; 2438 }
5824  067e 81            	ret	
5860                     ; 2460 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5860                     ; 2461 {
5861                     	switch	.text
5862  067f               _TIM1_SetIC1Prescaler:
5864  067f 88            	push	a
5865       00000000      OFST:	set	0
5868                     ; 2463   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5870                     ; 2466   TIM1->CCMR1 = (u8)((TIM1->CCMR1 & (u8)(~TIM1_CCMR_ICxPSC)) | (u8)TIM1_IC1Prescaler);
5872  0680 c65258        	ld	a,21080
5873  0683 a4f3          	and	a,#243
5874  0685 1a01          	or	a,(OFST+1,sp)
5875  0687 c75258        	ld	21080,a
5876                     ; 2468 }
5879  068a 84            	pop	a
5880  068b 81            	ret	
5916                     ; 2489 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5916                     ; 2490 {
5917                     	switch	.text
5918  068c               _TIM1_SetIC2Prescaler:
5920  068c 88            	push	a
5921       00000000      OFST:	set	0
5924                     ; 2493   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5926                     ; 2496   TIM1->CCMR2 = (u8)((TIM1->CCMR2 & (u8)(~TIM1_CCMR_ICxPSC)) | (u8)TIM1_IC2Prescaler);
5928  068d c65259        	ld	a,21081
5929  0690 a4f3          	and	a,#243
5930  0692 1a01          	or	a,(OFST+1,sp)
5931  0694 c75259        	ld	21081,a
5932                     ; 2497 }
5935  0697 84            	pop	a
5936  0698 81            	ret	
5972                     ; 2519 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5972                     ; 2520 {
5973                     	switch	.text
5974  0699               _TIM1_SetIC3Prescaler:
5976  0699 88            	push	a
5977       00000000      OFST:	set	0
5980                     ; 2523   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5982                     ; 2526   TIM1->CCMR3 = (u8)((TIM1->CCMR3 & (u8)(~TIM1_CCMR_ICxPSC)) | (u8)TIM1_IC3Prescaler);
5984  069a c6525a        	ld	a,21082
5985  069d a4f3          	and	a,#243
5986  069f 1a01          	or	a,(OFST+1,sp)
5987  06a1 c7525a        	ld	21082,a
5988                     ; 2527 }
5991  06a4 84            	pop	a
5992  06a5 81            	ret	
6028                     ; 2549 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6028                     ; 2550 {
6029                     	switch	.text
6030  06a6               _TIM1_SetIC4Prescaler:
6032  06a6 88            	push	a
6033       00000000      OFST:	set	0
6036                     ; 2553   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6038                     ; 2556   TIM1->CCMR4 = (u8)((TIM1->CCMR4 & (u8)(~TIM1_CCMR_ICxPSC)) | (u8)TIM1_IC4Prescaler);
6040  06a7 c6525b        	ld	a,21083
6041  06aa a4f3          	and	a,#243
6042  06ac 1a01          	or	a,(OFST+1,sp)
6043  06ae c7525b        	ld	21083,a
6044                     ; 2557 }
6047  06b1 84            	pop	a
6048  06b2 81            	ret	
6100                     ; 2576 u16 TIM1_GetCapture1(void)
6100                     ; 2577 {
6101                     	switch	.text
6102  06b3               _TIM1_GetCapture1:
6104  06b3 5204          	subw	sp,#4
6105       00000004      OFST:	set	4
6108                     ; 2580   u16 tmpccr1 = 0;
6110                     ; 2581   u8 tmpccr1l=0, tmpccr1h=0;
6114                     ; 2583     tmpccr1h = TIM1->CCR1H;
6116  06b5 c65265        	ld	a,21093
6117  06b8 6b02          	ld	(OFST-2,sp),a
6118                     ; 2584 	tmpccr1l = TIM1->CCR1L;
6120  06ba c65266        	ld	a,21094
6121  06bd 6b01          	ld	(OFST-3,sp),a
6122                     ; 2586     tmpccr1 = (u16)(tmpccr1l);
6124  06bf 5f            	clrw	x
6125  06c0 97            	ld	xl,a
6126  06c1 1f03          	ldw	(OFST-1,sp),x
6127                     ; 2587     tmpccr1 |= (u16)((u16)tmpccr1h << 8);
6129  06c3 5f            	clrw	x
6130  06c4 7b02          	ld	a,(OFST-2,sp)
6131  06c6 97            	ld	xl,a
6132  06c7 7b04          	ld	a,(OFST+0,sp)
6133  06c9 01            	rrwa	x,a
6134  06ca 1a03          	or	a,(OFST-1,sp)
6135  06cc 01            	rrwa	x,a
6136                     ; 2589     return (u16)tmpccr1;
6140  06cd 5b04          	addw	sp,#4
6141  06cf 81            	ret	
6193                     ; 2608 u16 TIM1_GetCapture2(void)
6193                     ; 2609 {
6194                     	switch	.text
6195  06d0               _TIM1_GetCapture2:
6197  06d0 5204          	subw	sp,#4
6198       00000004      OFST:	set	4
6201                     ; 2612   u16 tmpccr2 = 0;
6203                     ; 2613   u8 tmpccr2l=0, tmpccr2h=0;
6207                     ; 2615     tmpccr2h = TIM1->CCR2H;
6209  06d2 c65267        	ld	a,21095
6210  06d5 6b02          	ld	(OFST-2,sp),a
6211                     ; 2616 	tmpccr2l = TIM1->CCR2L;
6213  06d7 c65268        	ld	a,21096
6214  06da 6b01          	ld	(OFST-3,sp),a
6215                     ; 2618     tmpccr2 = (u16)(tmpccr2l);
6217  06dc 5f            	clrw	x
6218  06dd 97            	ld	xl,a
6219  06de 1f03          	ldw	(OFST-1,sp),x
6220                     ; 2619     tmpccr2 |= (u16)((u16)tmpccr2h << 8);
6222  06e0 5f            	clrw	x
6223  06e1 7b02          	ld	a,(OFST-2,sp)
6224  06e3 97            	ld	xl,a
6225  06e4 7b04          	ld	a,(OFST+0,sp)
6226  06e6 01            	rrwa	x,a
6227  06e7 1a03          	or	a,(OFST-1,sp)
6228  06e9 01            	rrwa	x,a
6229                     ; 2621     return (u16)tmpccr2;
6233  06ea 5b04          	addw	sp,#4
6234  06ec 81            	ret	
6286                     ; 2640 u16 TIM1_GetCapture3(void)
6286                     ; 2641 {
6287                     	switch	.text
6288  06ed               _TIM1_GetCapture3:
6290  06ed 5204          	subw	sp,#4
6291       00000004      OFST:	set	4
6294                     ; 2643     u16 tmpccr3 = 0;
6296                     ; 2644   u8 tmpccr3l=0, tmpccr3h=0;
6300                     ; 2646     tmpccr3h = TIM1->CCR3H;
6302  06ef c65269        	ld	a,21097
6303  06f2 6b02          	ld	(OFST-2,sp),a
6304                     ; 2647 	tmpccr3l = TIM1->CCR3L;
6306  06f4 c6526a        	ld	a,21098
6307  06f7 6b01          	ld	(OFST-3,sp),a
6308                     ; 2649     tmpccr3 = (u16)(tmpccr3l);
6310  06f9 5f            	clrw	x
6311  06fa 97            	ld	xl,a
6312  06fb 1f03          	ldw	(OFST-1,sp),x
6313                     ; 2650     tmpccr3 |= (u16)((u16)tmpccr3h << 8);
6315  06fd 5f            	clrw	x
6316  06fe 7b02          	ld	a,(OFST-2,sp)
6317  0700 97            	ld	xl,a
6318  0701 7b04          	ld	a,(OFST+0,sp)
6319  0703 01            	rrwa	x,a
6320  0704 1a03          	or	a,(OFST-1,sp)
6321  0706 01            	rrwa	x,a
6322                     ; 2652     return (u16)tmpccr3;
6326  0707 5b04          	addw	sp,#4
6327  0709 81            	ret	
6379                     ; 2671 u16 TIM1_GetCapture4(void)
6379                     ; 2672 {
6380                     	switch	.text
6381  070a               _TIM1_GetCapture4:
6383  070a 5204          	subw	sp,#4
6384       00000004      OFST:	set	4
6387                     ; 2674     u16 tmpccr4 = 0;
6389                     ; 2675   u8 tmpccr4l=0, tmpccr4h=0;
6393                     ; 2677     tmpccr4h = TIM1->CCR4H;
6395  070c c6526b        	ld	a,21099
6396  070f 6b02          	ld	(OFST-2,sp),a
6397                     ; 2678 	tmpccr4l = TIM1->CCR4L;
6399  0711 c6526c        	ld	a,21100
6400  0714 6b01          	ld	(OFST-3,sp),a
6401                     ; 2680     tmpccr4 = (u16)(tmpccr4l);
6403  0716 5f            	clrw	x
6404  0717 97            	ld	xl,a
6405  0718 1f03          	ldw	(OFST-1,sp),x
6406                     ; 2681     tmpccr4 |= (u16)((u16)tmpccr4h << 8);
6408  071a 5f            	clrw	x
6409  071b 7b02          	ld	a,(OFST-2,sp)
6410  071d 97            	ld	xl,a
6411  071e 7b04          	ld	a,(OFST+0,sp)
6412  0720 01            	rrwa	x,a
6413  0721 1a03          	or	a,(OFST-1,sp)
6414  0723 01            	rrwa	x,a
6415                     ; 2683     return (u16)tmpccr4;
6419  0724 5b04          	addw	sp,#4
6420  0726 81            	ret	
6443                     ; 2703 u16 TIM1_GetCounter(void)
6443                     ; 2704 {
6444                     	switch	.text
6445  0727               _TIM1_GetCounter:
6447  0727 89            	pushw	x
6448       00000002      OFST:	set	2
6451                     ; 2706   return (u16)(((u16)TIM1->CNTRH << 8) | (u16)(TIM1->CNTRL));
6453  0728 c6525f        	ld	a,21087
6454  072b 5f            	clrw	x
6455  072c 97            	ld	xl,a
6456  072d 1f01          	ldw	(OFST-1,sp),x
6457  072f 5f            	clrw	x
6458  0730 c6525e        	ld	a,21086
6459  0733 97            	ld	xl,a
6460  0734 7b02          	ld	a,(OFST+0,sp)
6461  0736 01            	rrwa	x,a
6462  0737 1a01          	or	a,(OFST-1,sp)
6463  0739 01            	rrwa	x,a
6466  073a 5b02          	addw	sp,#2
6467  073c 81            	ret	
6490                     ; 2726 u16 TIM1_GetPrescaler(void)
6490                     ; 2727 {
6491                     	switch	.text
6492  073d               _TIM1_GetPrescaler:
6494  073d 89            	pushw	x
6495       00000002      OFST:	set	2
6498                     ; 2729   return (u16)(((u16)TIM1->PSCRH << 8) | (u16)(TIM1->PSCRL));
6500  073e c65261        	ld	a,21089
6501  0741 5f            	clrw	x
6502  0742 97            	ld	xl,a
6503  0743 1f01          	ldw	(OFST-1,sp),x
6504  0745 5f            	clrw	x
6505  0746 c65260        	ld	a,21088
6506  0749 97            	ld	xl,a
6507  074a 7b02          	ld	a,(OFST+0,sp)
6508  074c 01            	rrwa	x,a
6509  074d 1a01          	or	a,(OFST-1,sp)
6510  074f 01            	rrwa	x,a
6513  0750 5b02          	addw	sp,#2
6514  0752 81            	ret	
6688                     ; 2761 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6688                     ; 2762 {
6689                     	switch	.text
6690  0753               _TIM1_GetFlagStatus:
6692  0753 5203          	subw	sp,#3
6693       00000003      OFST:	set	3
6696                     ; 2763   FlagStatus bitstatus = RESET;
6698                     ; 2767   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6700                     ; 2769   tim1_flag_l = (u8)(TIM1_FLAG);
6702  0755 9f            	ld	a,xl
6703  0756 6b02          	ld	(OFST-1,sp),a
6704                     ; 2770   tim1_flag_h = (u8)((u16)TIM1_FLAG >> 8);
6706  0758 9e            	ld	a,xh
6707  0759 6b03          	ld	(OFST+0,sp),a
6708                     ; 2772   if (((TIM1->SR1 & tim1_flag_l) | (TIM1->SR2 & tim1_flag_h)) != 0)
6710  075b c45256        	and	a,21078
6711  075e 6b01          	ld	(OFST-2,sp),a
6712  0760 c65255        	ld	a,21077
6713  0763 1402          	and	a,(OFST-1,sp)
6714  0765 1a01          	or	a,(OFST-2,sp)
6715  0767 2702          	jreq	L5443
6716                     ; 2774     bitstatus = SET;
6718  0769 a601          	ld	a,#1
6720  076b               L5443:
6721                     ; 2778     bitstatus = RESET;
6723                     ; 2780   return (FlagStatus)(bitstatus);
6727  076b 5b03          	addw	sp,#3
6728  076d 81            	ret	
6763                     ; 2811 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6763                     ; 2812 {
6764                     	switch	.text
6765  076e               _TIM1_ClearFlag:
6767  076e 89            	pushw	x
6768       00000000      OFST:	set	0
6771                     ; 2814   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6773                     ; 2817   TIM1->SR1 = (u8)(~(u8)(TIM1_FLAG));
6775  076f 9f            	ld	a,xl
6776  0770 43            	cpl	a
6777  0771 c75255        	ld	21077,a
6778                     ; 2818   TIM1->SR2 = (u8)((u8)(~((u8)((u16)TIM1_FLAG >> 8))) & (u8)0x1E);
6780  0774 7b01          	ld	a,(OFST+1,sp)
6781  0776 43            	cpl	a
6782  0777 a41e          	and	a,#30
6783  0779 c75256        	ld	21078,a
6784                     ; 2819 }
6787  077c 85            	popw	x
6788  077d 81            	ret	
6852                     ; 2847 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6852                     ; 2848 {
6853                     	switch	.text
6854  077e               _TIM1_GetITStatus:
6856  077e 88            	push	a
6857  077f 89            	pushw	x
6858       00000002      OFST:	set	2
6861                     ; 2849   ITStatus bitstatus = RESET;
6863                     ; 2851   u8 TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
6867                     ; 2854   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6869                     ; 2856   TIM1_itStatus = (u8)(TIM1->SR1 & (u8)TIM1_IT);
6871  0780 c45255        	and	a,21077
6872  0783 6b01          	ld	(OFST-1,sp),a
6873                     ; 2858   TIM1_itEnable = (u8)(TIM1->IER & (u8)TIM1_IT);
6875  0785 c65254        	ld	a,21076
6876  0788 1403          	and	a,(OFST+1,sp)
6877  078a 6b02          	ld	(OFST+0,sp),a
6878                     ; 2860   if ((TIM1_itStatus != (u8)RESET ) && (TIM1_itEnable != (u8)RESET ))
6880  078c 7b01          	ld	a,(OFST-1,sp)
6881  078e 2708          	jreq	L1253
6883  0790 7b02          	ld	a,(OFST+0,sp)
6884  0792 2704          	jreq	L1253
6885                     ; 2862     bitstatus = SET;
6887  0794 a601          	ld	a,#1
6889  0796 2001          	jra	L3253
6890  0798               L1253:
6891                     ; 2866     bitstatus = RESET;
6893  0798 4f            	clr	a
6894  0799               L3253:
6895                     ; 2868   return (ITStatus)(bitstatus);
6899  0799 5b03          	addw	sp,#3
6900  079b 81            	ret	
6936                     ; 2895 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6936                     ; 2896 {
6937                     	switch	.text
6938  079c               _TIM1_ClearITPendingBit:
6942                     ; 2898   assert_param(IS_TIM1_IT_OK(TIM1_IT));
6944                     ; 2901   TIM1->SR1 = (u8)(~(u8)TIM1_IT);
6946  079c 43            	cpl	a
6947  079d c75255        	ld	21077,a
6948                     ; 2902 }
6951  07a0 81            	ret	
7003                     ; 2930 static void TI1_Config(u8 TIM1_ICPolarity,
7003                     ; 2931                        u8 TIM1_ICSelection,
7003                     ; 2932                        u8 TIM1_ICFilter)
7003                     ; 2933 {
7004                     	switch	.text
7005  07a1               L3_TI1_Config:
7007  07a1 89            	pushw	x
7008       00000001      OFST:	set	1
7011                     ; 2936   TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1E);
7013  07a2 7211525c      	bres	21084,#0
7014  07a6 88            	push	a
7015                     ; 2939   TIM1->CCMR1 = (u8)((TIM1->CCMR1 & (u8)(~( TIM1_CCMR_CCxS     |        TIM1_CCMR_ICxF    ))) | (u8)(( (TIM1_ICSelection)) | ((u8)( TIM1_ICFilter << 4))));
7017  07a7 7b06          	ld	a,(OFST+5,sp)
7018  07a9 97            	ld	xl,a
7019  07aa a610          	ld	a,#16
7020  07ac 42            	mul	x,a
7021  07ad 9f            	ld	a,xl
7022  07ae 1a03          	or	a,(OFST+2,sp)
7023  07b0 6b01          	ld	(OFST+0,sp),a
7024  07b2 c65258        	ld	a,21080
7025  07b5 a40c          	and	a,#12
7026  07b7 1a01          	or	a,(OFST+0,sp)
7027  07b9 c75258        	ld	21080,a
7028                     ; 2944   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7030  07bc 7b02          	ld	a,(OFST+1,sp)
7031  07be 2706          	jreq	L1753
7032                     ; 2946     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7034  07c0 7212525c      	bset	21084,#1
7036  07c4 2004          	jra	L3753
7037  07c6               L1753:
7038                     ; 2950     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC1P);
7040  07c6 7213525c      	bres	21084,#1
7041  07ca               L3753:
7042                     ; 2954   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7044  07ca 7210525c      	bset	21084,#0
7045                     ; 2955 }
7048  07ce 5b03          	addw	sp,#3
7049  07d0 81            	ret	
7101                     ; 2983 static void TI2_Config(u8 TIM1_ICPolarity,
7101                     ; 2984                        u8 TIM1_ICSelection,
7101                     ; 2985                        u8 TIM1_ICFilter)
7101                     ; 2986 {
7102                     	switch	.text
7103  07d1               L5_TI2_Config:
7105  07d1 89            	pushw	x
7106       00000001      OFST:	set	1
7109                     ; 2988   TIM1->CCER1 &=  (u8)(~TIM1_CCER1_CC2E);
7111  07d2 7219525c      	bres	21084,#4
7112  07d6 88            	push	a
7113                     ; 2991   TIM1->CCMR2  = (u8)((TIM1->CCMR2 & (u8)(~( TIM1_CCMR_CCxS     |        TIM1_CCMR_ICxF    ))) | (u8)(( (TIM1_ICSelection)) | ((u8)( TIM1_ICFilter << 4))));
7115  07d7 7b06          	ld	a,(OFST+5,sp)
7116  07d9 97            	ld	xl,a
7117  07da a610          	ld	a,#16
7118  07dc 42            	mul	x,a
7119  07dd 9f            	ld	a,xl
7120  07de 1a03          	or	a,(OFST+2,sp)
7121  07e0 6b01          	ld	(OFST+0,sp),a
7122  07e2 c65259        	ld	a,21081
7123  07e5 a40c          	and	a,#12
7124  07e7 1a01          	or	a,(OFST+0,sp)
7125  07e9 c75259        	ld	21081,a
7126                     ; 2993   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7128  07ec 7b02          	ld	a,(OFST+1,sp)
7129  07ee 2706          	jreq	L3263
7130                     ; 2995     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7132  07f0 721a525c      	bset	21084,#5
7134  07f4 2004          	jra	L5263
7135  07f6               L3263:
7136                     ; 2999     TIM1->CCER1 &= (u8)(~TIM1_CCER1_CC2P);
7138  07f6 721b525c      	bres	21084,#5
7139  07fa               L5263:
7140                     ; 3002   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7142  07fa 7218525c      	bset	21084,#4
7143                     ; 3003 }
7146  07fe 5b03          	addw	sp,#3
7147  0800 81            	ret	
7199                     ; 3030 static void TI3_Config(u8 TIM1_ICPolarity,
7199                     ; 3031                        u8 TIM1_ICSelection,
7199                     ; 3032                        u8 TIM1_ICFilter)
7199                     ; 3033 {
7200                     	switch	.text
7201  0801               L7_TI3_Config:
7203  0801 89            	pushw	x
7204       00000001      OFST:	set	1
7207                     ; 3035   TIM1->CCER2 &=  (u8)(~TIM1_CCER2_CC3E);
7209  0802 7211525d      	bres	21085,#0
7210  0806 88            	push	a
7211                     ; 3038   TIM1->CCMR3 = (u8)((TIM1->CCMR3 & (u8)(~( TIM1_CCMR_CCxS     |        TIM1_CCMR_ICxF    ))) | (u8)(( (TIM1_ICSelection)) | ((u8)( TIM1_ICFilter << 4))));
7213  0807 7b06          	ld	a,(OFST+5,sp)
7214  0809 97            	ld	xl,a
7215  080a a610          	ld	a,#16
7216  080c 42            	mul	x,a
7217  080d 9f            	ld	a,xl
7218  080e 1a03          	or	a,(OFST+2,sp)
7219  0810 6b01          	ld	(OFST+0,sp),a
7220  0812 c6525a        	ld	a,21082
7221  0815 a40c          	and	a,#12
7222  0817 1a01          	or	a,(OFST+0,sp)
7223  0819 c7525a        	ld	21082,a
7224                     ; 3041   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7226  081c 7b02          	ld	a,(OFST+1,sp)
7227  081e 2706          	jreq	L5563
7228                     ; 3043     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7230  0820 7212525d      	bset	21085,#1
7232  0824 2004          	jra	L7563
7233  0826               L5563:
7234                     ; 3047     TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC3P);
7236  0826 7213525d      	bres	21085,#1
7237  082a               L7563:
7238                     ; 3050   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7240  082a 7210525d      	bset	21085,#0
7241                     ; 3051 }
7244  082e 5b03          	addw	sp,#3
7245  0830 81            	ret	
7297                     ; 3079 static void TI4_Config(u8 TIM1_ICPolarity,
7297                     ; 3080                        u8 TIM1_ICSelection,
7297                     ; 3081                        u8 TIM1_ICFilter)
7297                     ; 3082 {
7298                     	switch	.text
7299  0831               L11_TI4_Config:
7301  0831 89            	pushw	x
7302       00000001      OFST:	set	1
7305                     ; 3085   TIM1->CCER2 &=  (u8)(~TIM1_CCER2_CC4E);
7307  0832 7219525d      	bres	21085,#4
7308  0836 88            	push	a
7309                     ; 3088   TIM1->CCMR4 = (u8)((TIM1->CCMR4 & (u8)(~( TIM1_CCMR_CCxS     |        TIM1_CCMR_ICxF    )))  | (u8)(( (TIM1_ICSelection)) | ((u8)( TIM1_ICFilter << 4))));
7311  0837 7b06          	ld	a,(OFST+5,sp)
7312  0839 97            	ld	xl,a
7313  083a a610          	ld	a,#16
7314  083c 42            	mul	x,a
7315  083d 9f            	ld	a,xl
7316  083e 1a03          	or	a,(OFST+2,sp)
7317  0840 6b01          	ld	(OFST+0,sp),a
7318  0842 c6525b        	ld	a,21083
7319  0845 a40c          	and	a,#12
7320  0847 1a01          	or	a,(OFST+0,sp)
7321  0849 c7525b        	ld	21083,a
7322                     ; 3093   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7324  084c 7b02          	ld	a,(OFST+1,sp)
7325  084e 2706          	jreq	L7073
7326                     ; 3095     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7328  0850 721a525d      	bset	21085,#5
7330  0854 2004          	jra	L1173
7331  0856               L7073:
7332                     ; 3099     TIM1->CCER2 &= (u8)(~TIM1_CCER2_CC4P);
7334  0856 721b525d      	bres	21085,#5
7335  085a               L1173:
7336                     ; 3103   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7338  085a 7218525d      	bset	21085,#4
7339                     ; 3104 }
7342  085e 5b03          	addw	sp,#3
7343  0860 81            	ret	
7356                     	xdef	_TIM1_ClearITPendingBit
7357                     	xdef	_TIM1_GetITStatus
7358                     	xdef	_TIM1_ClearFlag
7359                     	xdef	_TIM1_GetFlagStatus
7360                     	xdef	_TIM1_GetPrescaler
7361                     	xdef	_TIM1_GetCounter
7362                     	xdef	_TIM1_GetCapture4
7363                     	xdef	_TIM1_GetCapture3
7364                     	xdef	_TIM1_GetCapture2
7365                     	xdef	_TIM1_GetCapture1
7366                     	xdef	_TIM1_SetIC4Prescaler
7367                     	xdef	_TIM1_SetIC3Prescaler
7368                     	xdef	_TIM1_SetIC2Prescaler
7369                     	xdef	_TIM1_SetIC1Prescaler
7370                     	xdef	_TIM1_SetCompare4
7371                     	xdef	_TIM1_SetCompare3
7372                     	xdef	_TIM1_SetCompare2
7373                     	xdef	_TIM1_SetCompare1
7374                     	xdef	_TIM1_SetAutoreload
7375                     	xdef	_TIM1_SetCounter
7376                     	xdef	_TIM1_SelectOCxM
7377                     	xdef	_TIM1_CCxNCmd
7378                     	xdef	_TIM1_CCxCmd
7379                     	xdef	_TIM1_OC4PolarityConfig
7380                     	xdef	_TIM1_OC3NPolarityConfig
7381                     	xdef	_TIM1_OC3PolarityConfig
7382                     	xdef	_TIM1_OC2NPolarityConfig
7383                     	xdef	_TIM1_OC2PolarityConfig
7384                     	xdef	_TIM1_OC1NPolarityConfig
7385                     	xdef	_TIM1_OC1PolarityConfig
7386                     	xdef	_TIM1_GenerateEvent
7387                     	xdef	_TIM1_OC4FastConfig
7388                     	xdef	_TIM1_OC3FastConfig
7389                     	xdef	_TIM1_OC2FastConfig
7390                     	xdef	_TIM1_OC1FastConfig
7391                     	xdef	_TIM1_OC4PreloadConfig
7392                     	xdef	_TIM1_OC3PreloadConfig
7393                     	xdef	_TIM1_OC2PreloadConfig
7394                     	xdef	_TIM1_OC1PreloadConfig
7395                     	xdef	_TIM1_CCPreloadControl
7396                     	xdef	_TIM1_SelectCOM
7397                     	xdef	_TIM1_ARRPreloadConfig
7398                     	xdef	_TIM1_ForcedOC4Config
7399                     	xdef	_TIM1_ForcedOC3Config
7400                     	xdef	_TIM1_ForcedOC2Config
7401                     	xdef	_TIM1_ForcedOC1Config
7402                     	xdef	_TIM1_CounterModeConfig
7403                     	xdef	_TIM1_PrescalerConfig
7404                     	xdef	_TIM1_EncoderInterfaceConfig
7405                     	xdef	_TIM1_SelectMasterSlaveMode
7406                     	xdef	_TIM1_SelectSlaveMode
7407                     	xdef	_TIM1_SelectOutputTrigger
7408                     	xdef	_TIM1_SelectOnePulseMode
7409                     	xdef	_TIM1_SelectHallSensor
7410                     	xdef	_TIM1_UpdateRequestConfig
7411                     	xdef	_TIM1_UpdateDisableConfig
7412                     	xdef	_TIM1_SelectInputTrigger
7413                     	xdef	_TIM1_TIxExternalClockConfig
7414                     	xdef	_TIM1_ETRConfig
7415                     	xdef	_TIM1_ETRClockMode2Config
7416                     	xdef	_TIM1_ETRClockMode1Config
7417                     	xdef	_TIM1_InternalClockConfig
7418                     	xdef	_TIM1_ITConfig
7419                     	xdef	_TIM1_CtrlPWMOutputs
7420                     	xdef	_TIM1_Cmd
7421                     	xdef	_TIM1_PWMIConfig
7422                     	xdef	_TIM1_ICInit
7423                     	xdef	_TIM1_BDTRConfig
7424                     	xdef	_TIM1_OC4Init
7425                     	xdef	_TIM1_OC3Init
7426                     	xdef	_TIM1_OC2Init
7427                     	xdef	_TIM1_OC1Init
7428                     	xdef	_TIM1_TimeBaseInit
7429                     	xdef	_TIM1_DeInit
7448                     	end
