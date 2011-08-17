   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 65 void ADC2_DeInit(void)
  47                     ; 66 {
  49                     	switch	.text
  50  0000               _ADC2_DeInit:
  54                     ; 67   ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  56  0000 725f5400      	clr	21504
  57                     ; 68   ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  59  0004 725f5401      	clr	21505
  60                     ; 69   ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  62  0008 725f5402      	clr	21506
  63                     ; 70   ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  65  000c 725f5406      	clr	21510
  66                     ; 71   ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  68  0010 725f5407      	clr	21511
  69                     ; 72 }
  72  0014 81            	ret	
 597                     ; 107 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTrigState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 597                     ; 108 {
 598                     	switch	.text
 599  0015               _ADC2_Init:
 601  0015 89            	pushw	x
 602       00000000      OFST:	set	0
 605                     ; 111   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 607                     ; 112   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 609                     ; 113   assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
 611                     ; 114   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 613                     ; 115   assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTrigState))));
 615                     ; 116   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 617                     ; 117   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 619                     ; 118   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 621                     ; 123   ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 623  0016 7b08          	ld	a,(OFST+8,sp)
 624  0018 88            	push	a
 625  0019 7b02          	ld	a,(OFST+2,sp)
 626  001b 95            	ld	xh,a
 627  001c cd00e3        	call	_ADC2_ConversionConfig
 629  001f 84            	pop	a
 630                     ; 125   ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 632  0020 7b05          	ld	a,(OFST+5,sp)
 633  0022 ad31          	call	_ADC2_PrescalerConfig
 635                     ; 130   ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTrigState);
 637  0024 7b07          	ld	a,(OFST+7,sp)
 638  0026 97            	ld	xl,a
 639  0027 7b06          	ld	a,(OFST+6,sp)
 640  0029 95            	ld	xh,a
 641  002a cd0110        	call	_ADC2_ExternalTriggerConfig
 643                     ; 135   ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 645  002d 7b0a          	ld	a,(OFST+10,sp)
 646  002f 97            	ld	xl,a
 647  0030 7b09          	ld	a,(OFST+9,sp)
 648  0032 95            	ld	xh,a
 649  0033 ad33          	call	_ADC2_SchmittTriggerConfig
 651                     ; 138   ADC2->CR1 |= ADC2_CR1_ADON;
 653  0035 72105401      	bset	21505,#0
 654                     ; 140 }
 657  0039 85            	popw	x
 658  003a 81            	ret	
 693                     ; 157 void ADC2_Cmd(FunctionalState NewState)
 693                     ; 158 {
 694                     	switch	.text
 695  003b               _ADC2_Cmd:
 699                     ; 161   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 701                     ; 163   if (NewState != DISABLE)
 703  003b 4d            	tnz	a
 704  003c 2705          	jreq	L703
 705                     ; 165     ADC2->CR1 |= ADC2_CR1_ADON;
 707  003e 72105401      	bset	21505,#0
 710  0042 81            	ret	
 711  0043               L703:
 712                     ; 169     ADC2->CR1 &= (u8)(~ADC2_CR1_ADON);
 714  0043 72115401      	bres	21505,#0
 715                     ; 172 }
 718  0047 81            	ret	
 753                     ; 192 void ADC2_ITConfig(FunctionalState ADC2_ITEnable)
 753                     ; 193 {
 754                     	switch	.text
 755  0048               _ADC2_ITConfig:
 759                     ; 196   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_ITEnable));
 761                     ; 198   if (ADC2_ITEnable != DISABLE)
 763  0048 4d            	tnz	a
 764  0049 2705          	jreq	L133
 765                     ; 201     ADC2->CSR |= (u8)ADC2_CSR_EOCIE;
 767  004b 721a5400      	bset	21504,#5
 770  004f 81            	ret	
 771  0050               L133:
 772                     ; 206     ADC2->CSR &= (u8)(~ADC2_CSR_EOCIE);
 774  0050 721b5400      	bres	21504,#5
 775                     ; 209 }
 778  0054 81            	ret	
 814                     ; 226 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
 814                     ; 227 {
 815                     	switch	.text
 816  0055               _ADC2_PrescalerConfig:
 818  0055 88            	push	a
 819       00000000      OFST:	set	0
 822                     ; 230   assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
 824                     ; 233   ADC2->CR1 &= (u8)(~ADC2_CR1_SPSEL);
 826  0056 c65401        	ld	a,21505
 827  0059 a48f          	and	a,#143
 828  005b c75401        	ld	21505,a
 829                     ; 235   ADC2->CR1 |= (u8)(ADC2_Prescaler);
 831  005e c65401        	ld	a,21505
 832  0061 1a01          	or	a,(OFST+1,sp)
 833  0063 c75401        	ld	21505,a
 834                     ; 237 }
 837  0066 84            	pop	a
 838  0067 81            	ret	
 886                     ; 257 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 886                     ; 258 {
 887                     	switch	.text
 888  0068               _ADC2_SchmittTriggerConfig:
 890  0068 89            	pushw	x
 891       00000000      OFST:	set	0
 894                     ; 261   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 896                     ; 262   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 898                     ; 264   if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
 900  0069 9e            	ld	a,xh
 901  006a a11f          	cp	a,#31
 902  006c 261d          	jrne	L573
 903                     ; 266     if (ADC2_SchmittTriggerState != DISABLE)
 905  006e 9f            	ld	a,xl
 906  006f 4d            	tnz	a
 907  0070 270a          	jreq	L773
 908                     ; 268       ADC2->TDRL &= (u8)0x0;
 910  0072 725f5407      	clr	21511
 911                     ; 269       ADC2->TDRH &= (u8)0x0;
 913  0076 725f5406      	clr	21510
 915  007a 2065          	jra	L304
 916  007c               L773:
 917                     ; 273       ADC2->TDRL |= (u8)0xFF;
 919  007c c65407        	ld	a,21511
 920  007f aaff          	or	a,#255
 921  0081 c75407        	ld	21511,a
 922                     ; 274       ADC2->TDRH |= (u8)0xFF;
 924  0084 c65406        	ld	a,21510
 925  0087 aaff          	or	a,#255
 926  0089 2053          	jp	LC001
 927  008b               L573:
 928                     ; 277   else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
 930  008b 7b01          	ld	a,(OFST+1,sp)
 931  008d a108          	cp	a,#8
 932  008f 0d02          	tnz	(OFST+2,sp)
 933  0091 2426          	jruge	L504
 934                     ; 279     if (ADC2_SchmittTriggerState != DISABLE)
 936  0093 2714          	jreq	L704
 937                     ; 281       ADC2->TDRL &= (u8)(~(u8)((u8)0x01 << (u8)ADC2_SchmittTriggerChannel));
 939  0095 5f            	clrw	x
 940  0096 97            	ld	xl,a
 941  0097 a601          	ld	a,#1
 942  0099 5d            	tnzw	x
 943  009a 2704          	jreq	L03
 944  009c               L23:
 945  009c 48            	sll	a
 946  009d 5a            	decw	x
 947  009e 26fc          	jrne	L23
 948  00a0               L03:
 949  00a0 43            	cpl	a
 950  00a1 c45407        	and	a,21511
 951  00a4               LC002:
 952  00a4 c75407        	ld	21511,a
 954  00a7 2038          	jra	L304
 955  00a9               L704:
 956                     ; 285       ADC2->TDRL |= (u8)((u8)0x01 << (u8)ADC2_SchmittTriggerChannel);
 958  00a9 5f            	clrw	x
 959  00aa 97            	ld	xl,a
 960  00ab a601          	ld	a,#1
 961  00ad 5d            	tnzw	x
 962  00ae 2704          	jreq	L43
 963  00b0               L63:
 964  00b0 48            	sll	a
 965  00b1 5a            	decw	x
 966  00b2 26fc          	jrne	L63
 967  00b4               L43:
 968  00b4 ca5407        	or	a,21511
 969  00b7 20eb          	jp	LC002
 970  00b9               L504:
 971                     ; 290     if (ADC2_SchmittTriggerState != DISABLE)
 973  00b9 2713          	jreq	L514
 974                     ; 292       ADC2->TDRH &= (u8)(~(u8)((u8)0x01 << ((u8)ADC2_SchmittTriggerChannel - (u8)8)));
 976  00bb a008          	sub	a,#8
 977  00bd 5f            	clrw	x
 978  00be 97            	ld	xl,a
 979  00bf a601          	ld	a,#1
 980  00c1 5d            	tnzw	x
 981  00c2 2704          	jreq	L04
 982  00c4               L24:
 983  00c4 48            	sll	a
 984  00c5 5a            	decw	x
 985  00c6 26fc          	jrne	L24
 986  00c8               L04:
 987  00c8 43            	cpl	a
 988  00c9 c45406        	and	a,21510
 990  00cc 2010          	jp	LC001
 991  00ce               L514:
 992                     ; 296       ADC2->TDRH |= (u8)((u8)0x01 << ((u8)ADC2_SchmittTriggerChannel - (u8)8));
 994  00ce a008          	sub	a,#8
 995  00d0 5f            	clrw	x
 996  00d1 97            	ld	xl,a
 997  00d2 a601          	ld	a,#1
 998  00d4 5d            	tnzw	x
 999  00d5 2704          	jreq	L44
1000  00d7               L64:
1001  00d7 48            	sll	a
1002  00d8 5a            	decw	x
1003  00d9 26fc          	jrne	L64
1004  00db               L44:
1005  00db ca5406        	or	a,21510
1006  00de               LC001:
1007  00de c75406        	ld	21510,a
1008  00e1               L304:
1009                     ; 300 }
1012  00e1 85            	popw	x
1013  00e2 81            	ret	
1070                     ; 322 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
1070                     ; 323 {
1071                     	switch	.text
1072  00e3               _ADC2_ConversionConfig:
1074       00000000      OFST:	set	0
1077                     ; 326   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
1079                     ; 327   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
1081                     ; 328   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
1083                     ; 331   ADC2->CR2 &= (u8)(~ADC2_CR2_ALIGN);
1085  00e3 72175402      	bres	21506,#3
1086  00e7 89            	pushw	x
1087                     ; 333   ADC2->CR2 |= (u8)(ADC2_Align);
1089  00e8 c65402        	ld	a,21506
1090  00eb 1a05          	or	a,(OFST+5,sp)
1091  00ed c75402        	ld	21506,a
1092                     ; 335   if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
1094  00f0 9e            	ld	a,xh
1095  00f1 4a            	dec	a
1096  00f2 2606          	jrne	L744
1097                     ; 338     ADC2->CR1 |= ADC2_CR1_CONT;
1099  00f4 72125401      	bset	21505,#1
1101  00f8 2004          	jra	L154
1102  00fa               L744:
1103                     ; 343     ADC2->CR1 &= (u8)(~ADC2_CR1_CONT);
1105  00fa 72135401      	bres	21505,#1
1106  00fe               L154:
1107                     ; 347   ADC2->CSR &= (u8)(~ADC2_CSR_CH);
1109  00fe c65400        	ld	a,21504
1110  0101 a4f0          	and	a,#240
1111  0103 c75400        	ld	21504,a
1112                     ; 349   ADC2->CSR |= (u8)(ADC2_Channel);
1114  0106 c65400        	ld	a,21504
1115  0109 1a02          	or	a,(OFST+2,sp)
1116  010b c75400        	ld	21504,a
1117                     ; 351 }
1120  010e 85            	popw	x
1121  010f 81            	ret	
1167                     ; 373 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTrigState)
1167                     ; 374 {
1168                     	switch	.text
1169  0110               _ADC2_ExternalTriggerConfig:
1171  0110 89            	pushw	x
1172       00000000      OFST:	set	0
1175                     ; 377   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
1177                     ; 378   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_ExtTrigState));
1179                     ; 381   ADC2->CR2 &= (u8)(~ADC2_CR2_EXTSEL);
1181  0111 c65402        	ld	a,21506
1182  0114 a4cf          	and	a,#207
1183  0116 c75402        	ld	21506,a
1184                     ; 383   if (ADC2_ExtTrigState != DISABLE)
1186  0119 9f            	ld	a,xl
1187  011a 4d            	tnz	a
1188  011b 2706          	jreq	L574
1189                     ; 386     ADC2->CR2 |= (u8)(ADC2_CR2_EXTTRIG);
1191  011d 721c5402      	bset	21506,#6
1193  0121 2004          	jra	L774
1194  0123               L574:
1195                     ; 391     ADC2->CR2 &= (u8)(~ADC2_CR2_EXTTRIG);
1197  0123 721d5402      	bres	21506,#6
1198  0127               L774:
1199                     ; 395   ADC2->CR2 |= (u8)(ADC2_ExtTrigger);
1201  0127 c65402        	ld	a,21506
1202  012a 1a01          	or	a,(OFST+1,sp)
1203  012c c75402        	ld	21506,a
1204                     ; 397 }
1207  012f 85            	popw	x
1208  0130 81            	ret	
1232                     ; 417 void ADC2_StartConversion(void)
1232                     ; 418 {
1233                     	switch	.text
1234  0131               _ADC2_StartConversion:
1238                     ; 419   ADC2->CR1 |= ADC2_CR1_ADON;
1240  0131 72105401      	bset	21505,#0
1241                     ; 420 }
1244  0135 81            	ret	
1288                     ; 438 u16 ADC2_GetConversionValue(void)
1288                     ; 439 {
1289                     	switch	.text
1290  0136               _ADC2_GetConversionValue:
1292  0136 5205          	subw	sp,#5
1293       00000005      OFST:	set	5
1296                     ; 441   u16 temph = 0;
1298                     ; 442   u8 templ = 0;
1300                     ; 444   if (ADC2->CR2 & ADC2_CR2_ALIGN) /* Right alignment */
1302  0138 720754020e    	btjf	21506,#3,L335
1303                     ; 447     templ = ADC2->DRL;
1305  013d c65405        	ld	a,21509
1306  0140 6b03          	ld	(OFST-2,sp),a
1307                     ; 449     temph = ADC2->DRH;
1309  0142 c65404        	ld	a,21508
1310  0145 97            	ld	xl,a
1311                     ; 451     temph = (u16)(templ | (u16)(temph << (u8)8));
1313  0146 7b03          	ld	a,(OFST-2,sp)
1314  0148 02            	rlwa	x,a
1316  0149 201a          	jra	L535
1317  014b               L335:
1318                     ; 456     temph = ADC2->DRH;
1320  014b c65404        	ld	a,21508
1321  014e 97            	ld	xl,a
1322                     ; 458     templ = ADC2->DRL;
1324  014f c65405        	ld	a,21509
1325  0152 6b03          	ld	(OFST-2,sp),a
1326                     ; 460     temph = (u16)((u16)(templ << (u8)6) | (u16)(temph << (u8)8));
1328  0154 4f            	clr	a
1329  0155 02            	rlwa	x,a
1330  0156 1f01          	ldw	(OFST-4,sp),x
1331  0158 7b03          	ld	a,(OFST-2,sp)
1332  015a 97            	ld	xl,a
1333  015b a640          	ld	a,#64
1334  015d 42            	mul	x,a
1335  015e 01            	rrwa	x,a
1336  015f 1a02          	or	a,(OFST-3,sp)
1337  0161 01            	rrwa	x,a
1338  0162 1a01          	or	a,(OFST-4,sp)
1339  0164 01            	rrwa	x,a
1340  0165               L535:
1341                     ; 463   return ((u16)temph);
1345  0165 5b05          	addw	sp,#5
1346  0167 81            	ret	
1390                     ; 483 FlagStatus ADC2_GetFlagStatus(void)
1390                     ; 484 {
1391                     	switch	.text
1392  0168               _ADC2_GetFlagStatus:
1396                     ; 486   return ((u8)(ADC2->CSR & ADC2_CSR_EOC));
1398  0168 c65400        	ld	a,21504
1399  016b a480          	and	a,#128
1402  016d 81            	ret	
1425                     ; 505 void ADC2_ClearFlag(void)
1425                     ; 506 {
1426                     	switch	.text
1427  016e               _ADC2_ClearFlag:
1431                     ; 507     ADC2->CSR &= (u8)(~ADC2_CSR_EOC);
1433  016e 721f5400      	bres	21504,#7
1434                     ; 508 }
1437  0172 81            	ret	
1461                     ; 526 ITStatus ADC2_GetITStatus(void)
1461                     ; 527 {
1462                     	switch	.text
1463  0173               _ADC2_GetITStatus:
1467                     ; 528   return ((u8)(ADC2->CSR & ADC2_CSR_EOC));
1469  0173 c65400        	ld	a,21504
1470  0176 a480          	and	a,#128
1473  0178 81            	ret	
1497                     ; 546 void ADC2_ClearITPendingBit(void)
1497                     ; 547 {
1498                     	switch	.text
1499  0179               _ADC2_ClearITPendingBit:
1503                     ; 548     ADC2->CSR &= (u8)(~ADC2_CSR_EOC);
1505  0179 721f5400      	bres	21504,#7
1506                     ; 549 }
1509  017d 81            	ret	
1522                     	xdef	_ADC2_ClearITPendingBit
1523                     	xdef	_ADC2_GetITStatus
1524                     	xdef	_ADC2_ClearFlag
1525                     	xdef	_ADC2_GetFlagStatus
1526                     	xdef	_ADC2_GetConversionValue
1527                     	xdef	_ADC2_StartConversion
1528                     	xdef	_ADC2_ExternalTriggerConfig
1529                     	xdef	_ADC2_ConversionConfig
1530                     	xdef	_ADC2_SchmittTriggerConfig
1531                     	xdef	_ADC2_PrescalerConfig
1532                     	xdef	_ADC2_ITConfig
1533                     	xdef	_ADC2_Cmd
1534                     	xdef	_ADC2_Init
1535                     	xdef	_ADC2_DeInit
1554                     	end
