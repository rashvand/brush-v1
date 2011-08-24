   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  46                     ; 42 void TIM1_DeInit(void)
  46                     ; 43 {
  48                     .text:	section	.text,new
  49  0000               _TIM1_DeInit:
  53                     ; 44     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  55  0000 725f5250      	clr	21072
  56                     ; 45     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  58  0004 725f5251      	clr	21073
  59                     ; 46     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  61  0008 725f5252      	clr	21074
  62                     ; 47     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  64  000c 725f5253      	clr	21075
  65                     ; 48     TIM1->IER  = TIM1_IER_RESET_VALUE;
  67  0010 725f5254      	clr	21076
  68                     ; 49     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  70  0014 725f5256      	clr	21078
  71                     ; 51     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  73  0018 725f525c      	clr	21084
  74                     ; 52     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  76  001c 725f525d      	clr	21085
  77                     ; 54     TIM1->CCMR1 = 0x01;
  79  0020 35015258      	mov	21080,#1
  80                     ; 55     TIM1->CCMR2 = 0x01;
  82  0024 35015259      	mov	21081,#1
  83                     ; 56     TIM1->CCMR3 = 0x01;
  85  0028 3501525a      	mov	21082,#1
  86                     ; 57     TIM1->CCMR4 = 0x01;
  88  002c 3501525b      	mov	21083,#1
  89                     ; 59     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  91  0030 725f525c      	clr	21084
  92                     ; 60     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  94  0034 725f525d      	clr	21085
  95                     ; 61     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  97  0038 725f5258      	clr	21080
  98                     ; 62     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 100  003c 725f5259      	clr	21081
 101                     ; 63     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 103  0040 725f525a      	clr	21082
 104                     ; 64     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 106  0044 725f525b      	clr	21083
 107                     ; 65     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 109  0048 725f525e      	clr	21086
 110                     ; 66     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 112  004c 725f525f      	clr	21087
 113                     ; 67     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 115  0050 725f5260      	clr	21088
 116                     ; 68     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 118  0054 725f5261      	clr	21089
 119                     ; 69     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 121  0058 35ff5262      	mov	21090,#255
 122                     ; 70     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 124  005c 35ff5263      	mov	21091,#255
 125                     ; 71     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 127  0060 725f5265      	clr	21093
 128                     ; 72     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 130  0064 725f5266      	clr	21094
 131                     ; 73     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 133  0068 725f5267      	clr	21095
 134                     ; 74     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 136  006c 725f5268      	clr	21096
 137                     ; 75     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 139  0070 725f5269      	clr	21097
 140                     ; 76     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 142  0074 725f526a      	clr	21098
 143                     ; 77     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 145  0078 725f526b      	clr	21099
 146                     ; 78     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 148  007c 725f526c      	clr	21100
 149                     ; 79     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 151  0080 725f526f      	clr	21103
 152                     ; 80     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 154  0084 35015257      	mov	21079,#1
 155                     ; 81     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 157  0088 725f526e      	clr	21102
 158                     ; 82     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 160  008c 725f526d      	clr	21101
 161                     ; 83     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 163  0090 725f5264      	clr	21092
 164                     ; 84     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 166  0094 725f5255      	clr	21077
 167                     ; 85 }
 170  0098 81            	ret
 273                     ; 95 void TIM1_TimeBaseInit(u16 TIM1_Prescaler,
 273                     ; 96                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 273                     ; 97                        u16 TIM1_Period,
 273                     ; 98                        u8 TIM1_RepetitionCounter)
 273                     ; 99 {
 274                     .text:	section	.text,new
 275  0000               _TIM1_TimeBaseInit:
 277  0000 89            	pushw	x
 278       00000000      OFST:	set	0
 281                     ; 102     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 283                     ; 105     TIM1->ARRH = (u8)(TIM1_Period >> 8);
 285  0001 7b06          	ld	a,(OFST+6,sp)
 286  0003 c75262        	ld	21090,a
 287                     ; 106     TIM1->ARRL = (u8)(TIM1_Period);
 289  0006 7b07          	ld	a,(OFST+7,sp)
 290  0008 c75263        	ld	21091,a
 291                     ; 109     TIM1->PSCRH = (u8)(TIM1_Prescaler >> 8);
 293  000b 9e            	ld	a,xh
 294  000c c75260        	ld	21088,a
 295                     ; 110     TIM1->PSCRL = (u8)(TIM1_Prescaler);
 297  000f 9f            	ld	a,xl
 298  0010 c75261        	ld	21089,a
 299                     ; 113     TIM1->CR1 = (u8)(((TIM1->CR1) & (u8)(~(TIM1_CR1_CMS | TIM1_CR1_DIR))) | (u8)(TIM1_CounterMode));
 301  0013 c65250        	ld	a,21072
 302  0016 a48f          	and	a,#143
 303  0018 1a05          	or	a,(OFST+5,sp)
 304  001a c75250        	ld	21072,a
 305                     ; 116     TIM1->RCR = TIM1_RepetitionCounter;
 307  001d 7b08          	ld	a,(OFST+8,sp)
 308  001f c75264        	ld	21092,a
 309                     ; 118 }
 312  0022 85            	popw	x
 313  0023 81            	ret
 368                     ; 127 void TIM1_Cmd(FunctionalState NewState)
 368                     ; 128 {
 369                     .text:	section	.text,new
 370  0000               _TIM1_Cmd:
 374                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 376                     ; 133     if (NewState != DISABLE)
 378  0000 4d            	tnz	a
 379  0001 2706          	jreq	L111
 380                     ; 135         TIM1->CR1 |= TIM1_CR1_CEN;
 382  0003 72105250      	bset	21072,#0
 384  0007 2004          	jra	L311
 385  0009               L111:
 386                     ; 139         TIM1->CR1 &= (u8)(~TIM1_CR1_CEN);
 388  0009 72115250      	bres	21072,#0
 389  000d               L311:
 390                     ; 141 }
 393  000d 81            	ret
 500                     ; 161 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
 500                     ; 162 {
 501                     .text:	section	.text,new
 502  0000               _TIM1_ITConfig:
 504  0000 89            	pushw	x
 505       00000000      OFST:	set	0
 508                     ; 164     assert_param(IS_TIM1_IT_OK(TIM1_IT));
 510                     ; 165     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 512                     ; 167     if (NewState != DISABLE)
 514  0001 9f            	ld	a,xl
 515  0002 4d            	tnz	a
 516  0003 2709          	jreq	L361
 517                     ; 170         TIM1->IER |= (u8)TIM1_IT;
 519  0005 9e            	ld	a,xh
 520  0006 ca5254        	or	a,21076
 521  0009 c75254        	ld	21076,a
 523  000c 2009          	jra	L561
 524  000e               L361:
 525                     ; 175         TIM1->IER &= (u8)(~(u8)TIM1_IT);
 527  000e 7b01          	ld	a,(OFST+1,sp)
 528  0010 43            	cpl	a
 529  0011 c45254        	and	a,21076
 530  0014 c75254        	ld	21076,a
 531  0017               L561:
 532                     ; 177 }
 535  0017 85            	popw	x
 536  0018 81            	ret
 549                     	xdef	_TIM1_ITConfig
 550                     	xdef	_TIM1_Cmd
 551                     	xdef	_TIM1_TimeBaseInit
 552                     	xdef	_TIM1_DeInit
 571                     	end
