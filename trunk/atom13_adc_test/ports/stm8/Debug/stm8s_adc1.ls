   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  46                     ; 46 void ADC1_DeInit(void)
  46                     ; 47 {
  48                     .text:	section	.text,new
  49  0000               _ADC1_DeInit:
  53                     ; 48     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  55  0000 725f5400      	clr	21504
  56                     ; 49     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  58  0004 725f5401      	clr	21505
  59                     ; 50     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  61  0008 725f5402      	clr	21506
  62                     ; 51     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  64  000c 725f5403      	clr	21507
  65                     ; 52     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  67  0010 725f5406      	clr	21510
  68                     ; 53     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  70  0014 725f5407      	clr	21511
  71                     ; 54     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  73  0018 35ff5408      	mov	21512,#255
  74                     ; 55     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  76  001c 35035409      	mov	21513,#3
  77                     ; 56     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  79  0020 725f540a      	clr	21514
  80                     ; 57     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  82  0024 725f540b      	clr	21515
  83                     ; 58     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  85  0028 725f540e      	clr	21518
  86                     ; 59     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  88  002c 725f540f      	clr	21519
  89                     ; 60 }
  92  0030 81            	ret
 528                     ; 83 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 528                     ; 84 {
 529                     .text:	section	.text,new
 530  0000               _ADC1_Init:
 532  0000 89            	pushw	x
 533       00000000      OFST:	set	0
 536                     ; 87     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 538                     ; 88     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 540                     ; 89     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 542                     ; 90     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 544                     ; 91     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 546                     ; 92     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 548                     ; 93     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 550                     ; 94     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 552                     ; 99     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 554  0001 7b08          	ld	a,(OFST+8,sp)
 555  0003 88            	push	a
 556  0004 9f            	ld	a,xl
 557  0005 97            	ld	xl,a
 558  0006 7b02          	ld	a,(OFST+2,sp)
 559  0008 95            	ld	xh,a
 560  0009 cd0000        	call	_ADC1_ConversionConfig
 562  000c 84            	pop	a
 563                     ; 101     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 565  000d 7b05          	ld	a,(OFST+5,sp)
 566  000f cd0000        	call	_ADC1_PrescalerConfig
 568                     ; 106     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 570  0012 7b07          	ld	a,(OFST+7,sp)
 571  0014 97            	ld	xl,a
 572  0015 7b06          	ld	a,(OFST+6,sp)
 573  0017 95            	ld	xh,a
 574  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 576                     ; 111     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 578  001b 7b0a          	ld	a,(OFST+10,sp)
 579  001d 97            	ld	xl,a
 580  001e 7b09          	ld	a,(OFST+9,sp)
 581  0020 95            	ld	xh,a
 582  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 584                     ; 114     ADC1->CR1 |= ADC1_CR1_ADON;
 586  0024 72105401      	bset	21505,#0
 587                     ; 116 }
 590  0028 85            	popw	x
 591  0029 81            	ret
 626                     ; 124 void ADC1_Cmd(FunctionalState NewState)
 626                     ; 125 {
 627                     .text:	section	.text,new
 628  0000               _ADC1_Cmd:
 632                     ; 128     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 634                     ; 130     if (NewState != DISABLE)
 636  0000 4d            	tnz	a
 637  0001 2706          	jreq	L752
 638                     ; 132         ADC1->CR1 |= ADC1_CR1_ADON;
 640  0003 72105401      	bset	21505,#0
 642  0007 2004          	jra	L162
 643  0009               L752:
 644                     ; 136         ADC1->CR1 &= (u8)(~ADC1_CR1_ADON);
 646  0009 72115401      	bres	21505,#0
 647  000d               L162:
 648                     ; 139 }
 651  000d 81            	ret
 686                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 686                     ; 147 {
 687                     .text:	section	.text,new
 688  0000               _ADC1_ScanModeCmd:
 692                     ; 150     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 694                     ; 152     if (NewState != DISABLE)
 696  0000 4d            	tnz	a
 697  0001 2706          	jreq	L103
 698                     ; 154         ADC1->CR2 |= ADC1_CR2_SCAN;
 700  0003 72125402      	bset	21506,#1
 702  0007 2004          	jra	L303
 703  0009               L103:
 704                     ; 158         ADC1->CR2 &= (u8)(~ADC1_CR2_SCAN);
 706  0009 72135402      	bres	21506,#1
 707  000d               L303:
 708                     ; 161 }
 711  000d 81            	ret
 746                     ; 168 void ADC1_DataBufferCmd(FunctionalState NewState)
 746                     ; 169 {
 747                     .text:	section	.text,new
 748  0000               _ADC1_DataBufferCmd:
 752                     ; 172     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 754                     ; 174     if (NewState != DISABLE)
 756  0000 4d            	tnz	a
 757  0001 2706          	jreq	L323
 758                     ; 176         ADC1->CR3 |= ADC1_CR3_DBUF;
 760  0003 721e5403      	bset	21507,#7
 762  0007 2004          	jra	L523
 763  0009               L323:
 764                     ; 180         ADC1->CR3 &= (u8)(~ADC1_CR3_DBUF);
 766  0009 721f5403      	bres	21507,#7
 767  000d               L523:
 768                     ; 183 }
 771  000d 81            	ret
 920                     ; 194 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 920                     ; 195 {
 921                     .text:	section	.text,new
 922  0000               _ADC1_ITConfig:
 924  0000 89            	pushw	x
 925       00000000      OFST:	set	0
 928                     ; 198     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 930                     ; 199     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 932                     ; 201     if (NewState != DISABLE)
 934  0001 0d05          	tnz	(OFST+5,sp)
 935  0003 2709          	jreq	L114
 936                     ; 204         ADC1->CSR |= (u8)ADC1_IT;
 938  0005 9f            	ld	a,xl
 939  0006 ca5400        	or	a,21504
 940  0009 c75400        	ld	21504,a
 942  000c 2009          	jra	L314
 943  000e               L114:
 944                     ; 209         ADC1->CSR &= (u8)(~ADC1_IT);
 946  000e 7b02          	ld	a,(OFST+2,sp)
 947  0010 43            	cpl	a
 948  0011 c45400        	and	a,21504
 949  0014 c75400        	ld	21504,a
 950  0017               L314:
 951                     ; 212 }
 954  0017 85            	popw	x
 955  0018 81            	ret
 991                     ; 220 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
 991                     ; 221 {
 992                     .text:	section	.text,new
 993  0000               _ADC1_PrescalerConfig:
 995  0000 88            	push	a
 996       00000000      OFST:	set	0
 999                     ; 224     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1001                     ; 227     ADC1->CR1 &= (u8)(~ADC1_CR1_SPSEL);
1003  0001 c65401        	ld	a,21505
1004  0004 a48f          	and	a,#143
1005  0006 c75401        	ld	21505,a
1006                     ; 229     ADC1->CR1 |= (u8)(ADC1_Prescaler);
1008  0009 c65401        	ld	a,21505
1009  000c 1a01          	or	a,(OFST+1,sp)
1010  000e c75401        	ld	21505,a
1011                     ; 231 }
1014  0011 84            	pop	a
1015  0012 81            	ret
1062                     ; 242 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1062                     ; 243 {
1063                     .text:	section	.text,new
1064  0000               _ADC1_SchmittTriggerConfig:
1066  0000 89            	pushw	x
1067       00000000      OFST:	set	0
1070                     ; 246     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1072                     ; 247     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1074                     ; 249     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1076  0001 9e            	ld	a,xh
1077  0002 a1ff          	cp	a,#255
1078  0004 2620          	jrne	L554
1079                     ; 251         if (NewState != DISABLE)
1081  0006 9f            	ld	a,xl
1082  0007 4d            	tnz	a
1083  0008 270a          	jreq	L754
1084                     ; 253             ADC1->TDRL &= (u8)0x0;
1086  000a 725f5407      	clr	21511
1087                     ; 254             ADC1->TDRH &= (u8)0x0;
1089  000e 725f5406      	clr	21510
1091  0012 2078          	jra	L364
1092  0014               L754:
1093                     ; 258             ADC1->TDRL |= (u8)0xFF;
1095  0014 c65407        	ld	a,21511
1096  0017 aaff          	or	a,#255
1097  0019 c75407        	ld	21511,a
1098                     ; 259             ADC1->TDRH |= (u8)0xFF;
1100  001c c65406        	ld	a,21510
1101  001f aaff          	or	a,#255
1102  0021 c75406        	ld	21510,a
1103  0024 2066          	jra	L364
1104  0026               L554:
1105                     ; 262     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1107  0026 7b01          	ld	a,(OFST+1,sp)
1108  0028 a108          	cp	a,#8
1109  002a 242f          	jruge	L564
1110                     ; 264         if (NewState != DISABLE)
1112  002c 0d02          	tnz	(OFST+2,sp)
1113  002e 2716          	jreq	L764
1114                     ; 266             ADC1->TDRL &= (u8)(~(u8)((u8)0x01 << (u8)ADC1_SchmittTriggerChannel));
1116  0030 7b01          	ld	a,(OFST+1,sp)
1117  0032 5f            	clrw	x
1118  0033 97            	ld	xl,a
1119  0034 a601          	ld	a,#1
1120  0036 5d            	tnzw	x
1121  0037 2704          	jreq	L42
1122  0039               L62:
1123  0039 48            	sll	a
1124  003a 5a            	decw	x
1125  003b 26fc          	jrne	L62
1126  003d               L42:
1127  003d 43            	cpl	a
1128  003e c45407        	and	a,21511
1129  0041 c75407        	ld	21511,a
1131  0044 2046          	jra	L364
1132  0046               L764:
1133                     ; 270             ADC1->TDRL |= (u8)((u8)0x01 << (u8)ADC1_SchmittTriggerChannel);
1135  0046 7b01          	ld	a,(OFST+1,sp)
1136  0048 5f            	clrw	x
1137  0049 97            	ld	xl,a
1138  004a a601          	ld	a,#1
1139  004c 5d            	tnzw	x
1140  004d 2704          	jreq	L03
1141  004f               L23:
1142  004f 48            	sll	a
1143  0050 5a            	decw	x
1144  0051 26fc          	jrne	L23
1145  0053               L03:
1146  0053 ca5407        	or	a,21511
1147  0056 c75407        	ld	21511,a
1148  0059 2031          	jra	L364
1149  005b               L564:
1150                     ; 275         if (NewState != DISABLE)
1152  005b 0d02          	tnz	(OFST+2,sp)
1153  005d 2718          	jreq	L574
1154                     ; 277             ADC1->TDRH &= (u8)(~(u8)((u8)0x01 << ((u8)ADC1_SchmittTriggerChannel - (u8)8)));
1156  005f 7b01          	ld	a,(OFST+1,sp)
1157  0061 a008          	sub	a,#8
1158  0063 5f            	clrw	x
1159  0064 97            	ld	xl,a
1160  0065 a601          	ld	a,#1
1161  0067 5d            	tnzw	x
1162  0068 2704          	jreq	L43
1163  006a               L63:
1164  006a 48            	sll	a
1165  006b 5a            	decw	x
1166  006c 26fc          	jrne	L63
1167  006e               L43:
1168  006e 43            	cpl	a
1169  006f c45406        	and	a,21510
1170  0072 c75406        	ld	21510,a
1172  0075 2015          	jra	L364
1173  0077               L574:
1174                     ; 281             ADC1->TDRH |= (u8)((u8)0x01 << ((u8)ADC1_SchmittTriggerChannel - (u8)8));
1176  0077 7b01          	ld	a,(OFST+1,sp)
1177  0079 a008          	sub	a,#8
1178  007b 5f            	clrw	x
1179  007c 97            	ld	xl,a
1180  007d a601          	ld	a,#1
1181  007f 5d            	tnzw	x
1182  0080 2704          	jreq	L04
1183  0082               L24:
1184  0082 48            	sll	a
1185  0083 5a            	decw	x
1186  0084 26fc          	jrne	L24
1187  0086               L04:
1188  0086 ca5406        	or	a,21510
1189  0089 c75406        	ld	21510,a
1190  008c               L364:
1191                     ; 285 }
1194  008c 85            	popw	x
1195  008d 81            	ret
1252                     ; 298 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1252                     ; 299 {
1253                     .text:	section	.text,new
1254  0000               _ADC1_ConversionConfig:
1256  0000 89            	pushw	x
1257       00000000      OFST:	set	0
1260                     ; 302     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1262                     ; 303     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1264                     ; 304     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1266                     ; 307     ADC1->CR2 &= (u8)(~ADC1_CR2_ALIGN);
1268  0001 72175402      	bres	21506,#3
1269                     ; 309     ADC1->CR2 |= (u8)(ADC1_Align);
1271  0005 c65402        	ld	a,21506
1272  0008 1a05          	or	a,(OFST+5,sp)
1273  000a c75402        	ld	21506,a
1274                     ; 311     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1276  000d 9e            	ld	a,xh
1277  000e a101          	cp	a,#1
1278  0010 2606          	jrne	L725
1279                     ; 314         ADC1->CR1 |= ADC1_CR1_CONT;
1281  0012 72125401      	bset	21505,#1
1283  0016 2004          	jra	L135
1284  0018               L725:
1285                     ; 319         ADC1->CR1 &= (u8)(~ADC1_CR1_CONT);
1287  0018 72135401      	bres	21505,#1
1288  001c               L135:
1289                     ; 323     ADC1->CSR &= (u8)(~ADC1_CSR_CH);
1291  001c c65400        	ld	a,21504
1292  001f a4f0          	and	a,#240
1293  0021 c75400        	ld	21504,a
1294                     ; 325     ADC1->CSR |= (u8)(ADC1_Channel);
1296  0024 c65400        	ld	a,21504
1297  0027 1a02          	or	a,(OFST+2,sp)
1298  0029 c75400        	ld	21504,a
1299                     ; 327 }
1302  002c 85            	popw	x
1303  002d 81            	ret
1349                     ; 340 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1349                     ; 341 {
1350                     .text:	section	.text,new
1351  0000               _ADC1_ExternalTriggerConfig:
1353  0000 89            	pushw	x
1354       00000000      OFST:	set	0
1357                     ; 344     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1359                     ; 345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1361                     ; 348     ADC1->CR2 &= (u8)(~ADC1_CR2_EXTSEL);
1363  0001 c65402        	ld	a,21506
1364  0004 a4cf          	and	a,#207
1365  0006 c75402        	ld	21506,a
1366                     ; 350     if (NewState != DISABLE)
1368  0009 9f            	ld	a,xl
1369  000a 4d            	tnz	a
1370  000b 2706          	jreq	L555
1371                     ; 353         ADC1->CR2 |= (u8)(ADC1_CR2_EXTTRIG);
1373  000d 721c5402      	bset	21506,#6
1375  0011 2004          	jra	L755
1376  0013               L555:
1377                     ; 358         ADC1->CR2 &= (u8)(~ADC1_CR2_EXTTRIG);
1379  0013 721d5402      	bres	21506,#6
1380  0017               L755:
1381                     ; 362     ADC1->CR2 |= (u8)(ADC1_ExtTrigger);
1383  0017 c65402        	ld	a,21506
1384  001a 1a01          	or	a,(OFST+1,sp)
1385  001c c75402        	ld	21506,a
1386                     ; 364 }
1389  001f 85            	popw	x
1390  0020 81            	ret
1414                     ; 377 void ADC1_StartConversion(void)
1414                     ; 378 {
1415                     .text:	section	.text,new
1416  0000               _ADC1_StartConversion:
1420                     ; 379     ADC1->CR1 |= ADC1_CR1_ADON;
1422  0000 72105401      	bset	21505,#0
1423                     ; 380 }
1426  0004 81            	ret
1466                     ; 390 u16 ADC1_GetConversionValue(void)
1466                     ; 391 {
1467                     .text:	section	.text,new
1468  0000               _ADC1_GetConversionValue:
1470  0000 5205          	subw	sp,#5
1471       00000005      OFST:	set	5
1474                     ; 393     u16 temph = 0;
1476                     ; 394     u8 templ = 0;
1478                     ; 396     if (ADC1->CR2 & ADC1_CR2_ALIGN) /* Right alignment */
1480  0002 c65402        	ld	a,21506
1481  0005 a508          	bcp	a,#8
1482  0007 2715          	jreq	L706
1483                     ; 399         templ = ADC1->DRL;
1485  0009 c65405        	ld	a,21509
1486  000c 6b03          	ld	(OFST-2,sp),a
1487                     ; 401         temph = ADC1->DRH;
1489  000e c65404        	ld	a,21508
1490  0011 5f            	clrw	x
1491  0012 97            	ld	xl,a
1492  0013 1f04          	ldw	(OFST-1,sp),x
1493                     ; 403         temph = (u16)(templ | (u16)(temph << (u8)8));
1495  0015 1e04          	ldw	x,(OFST-1,sp)
1496  0017 7b03          	ld	a,(OFST-2,sp)
1497  0019 02            	rlwa	x,a
1498  001a 1f04          	ldw	(OFST-1,sp),x
1500  001c 2021          	jra	L116
1501  001e               L706:
1502                     ; 408         temph = ADC1->DRH;
1504  001e c65404        	ld	a,21508
1505  0021 5f            	clrw	x
1506  0022 97            	ld	xl,a
1507  0023 1f04          	ldw	(OFST-1,sp),x
1508                     ; 410         templ = ADC1->DRL;
1510  0025 c65405        	ld	a,21509
1511  0028 6b03          	ld	(OFST-2,sp),a
1512                     ; 412         temph = (u16)((u16)(templ << (u8)6) | (u16)(temph << (u8)8));
1514  002a 1e04          	ldw	x,(OFST-1,sp)
1515  002c 4f            	clr	a
1516  002d 02            	rlwa	x,a
1517  002e 1f01          	ldw	(OFST-4,sp),x
1518  0030 7b03          	ld	a,(OFST-2,sp)
1519  0032 97            	ld	xl,a
1520  0033 a640          	ld	a,#64
1521  0035 42            	mul	x,a
1522  0036 01            	rrwa	x,a
1523  0037 1a02          	or	a,(OFST-3,sp)
1524  0039 01            	rrwa	x,a
1525  003a 1a01          	or	a,(OFST-4,sp)
1526  003c 01            	rrwa	x,a
1527  003d 1f04          	ldw	(OFST-1,sp),x
1528  003f               L116:
1529                     ; 415     return ((u16)temph);
1531  003f 1e04          	ldw	x,(OFST-1,sp)
1534  0041 5b05          	addw	sp,#5
1535  0043 81            	ret
1581                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1581                     ; 428 {
1582                     .text:	section	.text,new
1583  0000               _ADC1_AWDChannelConfig:
1585  0000 89            	pushw	x
1586       00000000      OFST:	set	0
1589                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1591                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1593                     ; 433     if (Channel < (u8)8)
1595  0001 9e            	ld	a,xh
1596  0002 a108          	cp	a,#8
1597  0004 242e          	jruge	L536
1598                     ; 435         if (NewState != DISABLE)
1600  0006 9f            	ld	a,xl
1601  0007 4d            	tnz	a
1602  0008 2714          	jreq	L736
1603                     ; 437             ADC1->AWCRL |= (u8)((u8)1 << Channel);
1605  000a 9e            	ld	a,xh
1606  000b 5f            	clrw	x
1607  000c 97            	ld	xl,a
1608  000d a601          	ld	a,#1
1609  000f 5d            	tnzw	x
1610  0010 2704          	jreq	L65
1611  0012               L06:
1612  0012 48            	sll	a
1613  0013 5a            	decw	x
1614  0014 26fc          	jrne	L06
1615  0016               L65:
1616  0016 ca540f        	or	a,21519
1617  0019 c7540f        	ld	21519,a
1619  001c 2047          	jra	L346
1620  001e               L736:
1621                     ; 441             ADC1->AWCRL &= (u8)(~((u8)1 << Channel));
1623  001e 7b01          	ld	a,(OFST+1,sp)
1624  0020 5f            	clrw	x
1625  0021 97            	ld	xl,a
1626  0022 a601          	ld	a,#1
1627  0024 5d            	tnzw	x
1628  0025 2704          	jreq	L26
1629  0027               L46:
1630  0027 48            	sll	a
1631  0028 5a            	decw	x
1632  0029 26fc          	jrne	L46
1633  002b               L26:
1634  002b 43            	cpl	a
1635  002c c4540f        	and	a,21519
1636  002f c7540f        	ld	21519,a
1637  0032 2031          	jra	L346
1638  0034               L536:
1639                     ; 446         if (NewState != DISABLE)
1641  0034 0d02          	tnz	(OFST+2,sp)
1642  0036 2717          	jreq	L546
1643                     ; 448             ADC1->AWCRH |= (u8)((u8)1 << (Channel - (u8)8));
1645  0038 7b01          	ld	a,(OFST+1,sp)
1646  003a a008          	sub	a,#8
1647  003c 5f            	clrw	x
1648  003d 97            	ld	xl,a
1649  003e a601          	ld	a,#1
1650  0040 5d            	tnzw	x
1651  0041 2704          	jreq	L66
1652  0043               L07:
1653  0043 48            	sll	a
1654  0044 5a            	decw	x
1655  0045 26fc          	jrne	L07
1656  0047               L66:
1657  0047 ca540e        	or	a,21518
1658  004a c7540e        	ld	21518,a
1660  004d 2016          	jra	L346
1661  004f               L546:
1662                     ; 452             ADC1->AWCRH &= (u8)(~((u8)1 << (Channel - (u8)8)));
1664  004f 7b01          	ld	a,(OFST+1,sp)
1665  0051 a008          	sub	a,#8
1666  0053 5f            	clrw	x
1667  0054 97            	ld	xl,a
1668  0055 a601          	ld	a,#1
1669  0057 5d            	tnzw	x
1670  0058 2704          	jreq	L27
1671  005a               L47:
1672  005a 48            	sll	a
1673  005b 5a            	decw	x
1674  005c 26fc          	jrne	L47
1675  005e               L27:
1676  005e 43            	cpl	a
1677  005f c4540e        	and	a,21518
1678  0062 c7540e        	ld	21518,a
1679  0065               L346:
1680                     ; 455 }
1683  0065 85            	popw	x
1684  0066 81            	ret
1717                     ; 463 void ADC1_SetHighThreshold(u16 Threshold)
1717                     ; 464 {
1718                     .text:	section	.text,new
1719  0000               _ADC1_SetHighThreshold:
1723                     ; 465     ADC1->HTRH = (u8)(Threshold >> (u8)8);
1725  0000 9e            	ld	a,xh
1726  0001 c75408        	ld	21512,a
1727                     ; 466     ADC1->HTRL = (u8)Threshold;
1729  0004 9f            	ld	a,xl
1730  0005 c75409        	ld	21513,a
1731                     ; 467 }
1734  0008 81            	ret
1767                     ; 475 void ADC1_SetLowThreshold(u16 Threshold)
1767                     ; 476 {
1768                     .text:	section	.text,new
1769  0000               _ADC1_SetLowThreshold:
1773                     ; 477     ADC1->LTRL = (u8)Threshold;
1775  0000 9f            	ld	a,xl
1776  0001 c7540b        	ld	21515,a
1777                     ; 478     ADC1->LTRH = (u8)(Threshold >> (u8)8);
1779  0004 9e            	ld	a,xh
1780  0005 c7540a        	ld	21514,a
1781                     ; 479 }
1784  0008 81            	ret
1831                     ; 488 u16 ADC1_GetBufferValue(u8 Buffer)
1831                     ; 489 {
1832                     .text:	section	.text,new
1833  0000               _ADC1_GetBufferValue:
1835  0000 88            	push	a
1836  0001 5205          	subw	sp,#5
1837       00000005      OFST:	set	5
1840                     ; 491     u16 temph = 0;
1842                     ; 492     u8 templ = 0;
1844                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1846                     ; 497     if (ADC1->CR2 & ADC1_CR2_ALIGN) /* Right alignment */
1848  0003 c65402        	ld	a,21506
1849  0006 a508          	bcp	a,#8
1850  0008 271f          	jreq	L127
1851                     ; 500         templ = *(u8*)(ADC1_BaseAddress + (Buffer << 1) + 1);
1853  000a 7b06          	ld	a,(OFST+1,sp)
1854  000c 5f            	clrw	x
1855  000d 97            	ld	xl,a
1856  000e 58            	sllw	x
1857  000f d653e1        	ld	a,(21473,x)
1858  0012 6b03          	ld	(OFST-2,sp),a
1859                     ; 502         temph = *(u8*)(ADC1_BaseAddress + (Buffer << 1));
1861  0014 7b06          	ld	a,(OFST+1,sp)
1862  0016 5f            	clrw	x
1863  0017 97            	ld	xl,a
1864  0018 58            	sllw	x
1865  0019 d653e0        	ld	a,(21472,x)
1866  001c 5f            	clrw	x
1867  001d 97            	ld	xl,a
1868  001e 1f04          	ldw	(OFST-1,sp),x
1869                     ; 504         temph = (u16)(templ | (u16)(temph << (u8)8));
1871  0020 1e04          	ldw	x,(OFST-1,sp)
1872  0022 7b03          	ld	a,(OFST-2,sp)
1873  0024 02            	rlwa	x,a
1874  0025 1f04          	ldw	(OFST-1,sp),x
1876  0027 202b          	jra	L327
1877  0029               L127:
1878                     ; 509         temph = *(u8*)(ADC1_BaseAddress + (Buffer << 1));
1880  0029 7b06          	ld	a,(OFST+1,sp)
1881  002b 5f            	clrw	x
1882  002c 97            	ld	xl,a
1883  002d 58            	sllw	x
1884  002e d653e0        	ld	a,(21472,x)
1885  0031 5f            	clrw	x
1886  0032 97            	ld	xl,a
1887  0033 1f04          	ldw	(OFST-1,sp),x
1888                     ; 511         templ = *(u8*)(ADC1_BaseAddress + (Buffer << 1) + 1);
1890  0035 7b06          	ld	a,(OFST+1,sp)
1891  0037 5f            	clrw	x
1892  0038 97            	ld	xl,a
1893  0039 58            	sllw	x
1894  003a d653e1        	ld	a,(21473,x)
1895  003d 6b03          	ld	(OFST-2,sp),a
1896                     ; 513         temph = (u16)((u16)(templ << (u8)6) | (u16)(temph << (u8)8));
1898  003f 1e04          	ldw	x,(OFST-1,sp)
1899  0041 4f            	clr	a
1900  0042 02            	rlwa	x,a
1901  0043 1f01          	ldw	(OFST-4,sp),x
1902  0045 7b03          	ld	a,(OFST-2,sp)
1903  0047 97            	ld	xl,a
1904  0048 a640          	ld	a,#64
1905  004a 42            	mul	x,a
1906  004b 01            	rrwa	x,a
1907  004c 1a02          	or	a,(OFST-3,sp)
1908  004e 01            	rrwa	x,a
1909  004f 1a01          	or	a,(OFST-4,sp)
1910  0051 01            	rrwa	x,a
1911  0052 1f04          	ldw	(OFST-1,sp),x
1912  0054               L327:
1913                     ; 516     return ((u16)temph);
1915  0054 1e04          	ldw	x,(OFST-1,sp)
1918  0056 5b06          	addw	sp,#6
1919  0058 81            	ret
1983                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1983                     ; 527 {
1984                     .text:	section	.text,new
1985  0000               _ADC1_GetAWDChannelStatus:
1987  0000 88            	push	a
1988  0001 88            	push	a
1989       00000001      OFST:	set	1
1992                     ; 528     u8 status = 0;
1994                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1996                     ; 533     if (Channel < (u8)8)
1998  0002 a108          	cp	a,#8
1999  0004 2412          	jruge	L557
2000                     ; 535         status = (u8)(ADC1->AWSRL & ((u8)1 << Channel));
2002  0006 5f            	clrw	x
2003  0007 97            	ld	xl,a
2004  0008 a601          	ld	a,#1
2005  000a 5d            	tnzw	x
2006  000b 2704          	jreq	L601
2007  000d               L011:
2008  000d 48            	sll	a
2009  000e 5a            	decw	x
2010  000f 26fc          	jrne	L011
2011  0011               L601:
2012  0011 c4540d        	and	a,21517
2013  0014 6b01          	ld	(OFST+0,sp),a
2015  0016 2014          	jra	L757
2016  0018               L557:
2017                     ; 539         status = (u8)(ADC1->AWSRH & ((u8)1 << (Channel - (u8)8)));
2019  0018 7b02          	ld	a,(OFST+1,sp)
2020  001a a008          	sub	a,#8
2021  001c 5f            	clrw	x
2022  001d 97            	ld	xl,a
2023  001e a601          	ld	a,#1
2024  0020 5d            	tnzw	x
2025  0021 2704          	jreq	L211
2026  0023               L411:
2027  0023 48            	sll	a
2028  0024 5a            	decw	x
2029  0025 26fc          	jrne	L411
2030  0027               L211:
2031  0027 c4540c        	and	a,21516
2032  002a 6b01          	ld	(OFST+0,sp),a
2033  002c               L757:
2034                     ; 542     return ((FlagStatus)status);
2036  002c 7b01          	ld	a,(OFST+0,sp)
2039  002e 85            	popw	x
2040  002f 81            	ret
2187                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2187                     ; 552 {
2188                     .text:	section	.text,new
2189  0000               _ADC1_GetFlagStatus:
2191  0000 88            	push	a
2192  0001 88            	push	a
2193       00000001      OFST:	set	1
2196                     ; 553     u8 flagstatus = 0;
2198                     ; 554     u8 temp = 0;
2200                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2202                     ; 559     if ((Flag & 0x0F) == 0x01)
2204  0002 a40f          	and	a,#15
2205  0004 a101          	cp	a,#1
2206  0006 2609          	jrne	L1401
2207                     ; 562         flagstatus = (u8)(ADC1->CR3 & ADC1_CR3_OVR);
2209  0008 c65403        	ld	a,21507
2210  000b a440          	and	a,#64
2211  000d 6b01          	ld	(OFST+0,sp),a
2213  000f 2045          	jra	L3401
2214  0011               L1401:
2215                     ; 564     else if ((Flag & 0xF0) == 0x10)
2217  0011 7b02          	ld	a,(OFST+1,sp)
2218  0013 a4f0          	and	a,#240
2219  0015 a110          	cp	a,#16
2220  0017 2636          	jrne	L5401
2221                     ; 567         temp = (u8)(Flag & 0x0F);
2223  0019 7b02          	ld	a,(OFST+1,sp)
2224  001b a40f          	and	a,#15
2225  001d 6b01          	ld	(OFST+0,sp),a
2226                     ; 568         if (temp < 8)
2228  001f 7b01          	ld	a,(OFST+0,sp)
2229  0021 a108          	cp	a,#8
2230  0023 2414          	jruge	L7401
2231                     ; 570             flagstatus = (u8)(ADC1->AWSRL & (1 << temp));
2233  0025 7b01          	ld	a,(OFST+0,sp)
2234  0027 5f            	clrw	x
2235  0028 97            	ld	xl,a
2236  0029 a601          	ld	a,#1
2237  002b 5d            	tnzw	x
2238  002c 2704          	jreq	L021
2239  002e               L221:
2240  002e 48            	sll	a
2241  002f 5a            	decw	x
2242  0030 26fc          	jrne	L221
2243  0032               L021:
2244  0032 c4540d        	and	a,21517
2245  0035 6b01          	ld	(OFST+0,sp),a
2247  0037 201d          	jra	L3401
2248  0039               L7401:
2249                     ; 574             flagstatus = (u8)(ADC1->AWSRH & (1 << (temp - 8)));
2251  0039 7b01          	ld	a,(OFST+0,sp)
2252  003b a008          	sub	a,#8
2253  003d 5f            	clrw	x
2254  003e 97            	ld	xl,a
2255  003f a601          	ld	a,#1
2256  0041 5d            	tnzw	x
2257  0042 2704          	jreq	L421
2258  0044               L621:
2259  0044 48            	sll	a
2260  0045 5a            	decw	x
2261  0046 26fc          	jrne	L621
2262  0048               L421:
2263  0048 c4540c        	and	a,21516
2264  004b 6b01          	ld	(OFST+0,sp),a
2265  004d 2007          	jra	L3401
2266  004f               L5401:
2267                     ; 579         flagstatus = (u8)(ADC1->CSR & Flag);
2269  004f c65400        	ld	a,21504
2270  0052 1402          	and	a,(OFST+1,sp)
2271  0054 6b01          	ld	(OFST+0,sp),a
2272  0056               L3401:
2273                     ; 581     return ((FlagStatus)flagstatus);
2275  0056 7b01          	ld	a,(OFST+0,sp)
2278  0058 85            	popw	x
2279  0059 81            	ret
2321                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2321                     ; 592 {
2322                     .text:	section	.text,new
2323  0000               _ADC1_ClearFlag:
2325  0000 88            	push	a
2326  0001 88            	push	a
2327       00000001      OFST:	set	1
2330                     ; 593     u8 temp = 0;
2332                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2334                     ; 598     if ((Flag & 0x0F) == 0x01)
2336  0002 a40f          	and	a,#15
2337  0004 a101          	cp	a,#1
2338  0006 2606          	jrne	L5701
2339                     ; 601         ADC1->CR3 &= (u8)(~ADC1_CR3_OVR);
2341  0008 721d5403      	bres	21507,#6
2343  000c 204b          	jra	L7701
2344  000e               L5701:
2345                     ; 603     else if ((Flag & 0xF0) == 0x10)
2347  000e 7b02          	ld	a,(OFST+1,sp)
2348  0010 a4f0          	and	a,#240
2349  0012 a110          	cp	a,#16
2350  0014 263a          	jrne	L1011
2351                     ; 606         temp = (u8)(Flag & 0x0F);
2353  0016 7b02          	ld	a,(OFST+1,sp)
2354  0018 a40f          	and	a,#15
2355  001a 6b01          	ld	(OFST+0,sp),a
2356                     ; 607         if (temp < 8)
2358  001c 7b01          	ld	a,(OFST+0,sp)
2359  001e a108          	cp	a,#8
2360  0020 2416          	jruge	L3011
2361                     ; 609             ADC1->AWSRL &= (u8)(~((u8)1 << temp));
2363  0022 7b01          	ld	a,(OFST+0,sp)
2364  0024 5f            	clrw	x
2365  0025 97            	ld	xl,a
2366  0026 a601          	ld	a,#1
2367  0028 5d            	tnzw	x
2368  0029 2704          	jreq	L231
2369  002b               L431:
2370  002b 48            	sll	a
2371  002c 5a            	decw	x
2372  002d 26fc          	jrne	L431
2373  002f               L231:
2374  002f 43            	cpl	a
2375  0030 c4540d        	and	a,21517
2376  0033 c7540d        	ld	21517,a
2378  0036 2021          	jra	L7701
2379  0038               L3011:
2380                     ; 613             ADC1->AWSRH &= (u8)(~((u8)1 << (temp - 8)));
2382  0038 7b01          	ld	a,(OFST+0,sp)
2383  003a a008          	sub	a,#8
2384  003c 5f            	clrw	x
2385  003d 97            	ld	xl,a
2386  003e a601          	ld	a,#1
2387  0040 5d            	tnzw	x
2388  0041 2704          	jreq	L631
2389  0043               L041:
2390  0043 48            	sll	a
2391  0044 5a            	decw	x
2392  0045 26fc          	jrne	L041
2393  0047               L631:
2394  0047 43            	cpl	a
2395  0048 c4540c        	and	a,21516
2396  004b c7540c        	ld	21516,a
2397  004e 2009          	jra	L7701
2398  0050               L1011:
2399                     ; 618         ADC1->CSR &= (u8) (~Flag);
2401  0050 7b02          	ld	a,(OFST+1,sp)
2402  0052 43            	cpl	a
2403  0053 c45400        	and	a,21504
2404  0056 c75400        	ld	21504,a
2405  0059               L7701:
2406                     ; 620 }
2409  0059 85            	popw	x
2410  005a 81            	ret
2463                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2463                     ; 641 {
2464                     .text:	section	.text,new
2465  0000               _ADC1_GetITStatus:
2467  0000 89            	pushw	x
2468  0001 88            	push	a
2469       00000001      OFST:	set	1
2472                     ; 642     ITStatus itstatus = RESET;
2474                     ; 643     u8 temp = 0;
2476                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2478                     ; 648     if ((ITPendingBit & 0xF0) == 0x10)
2480  0002 01            	rrwa	x,a
2481  0003 a4f0          	and	a,#240
2482  0005 5f            	clrw	x
2483  0006 02            	rlwa	x,a
2484  0007 a30010        	cpw	x,#16
2485  000a 2636          	jrne	L5311
2486                     ; 651         temp = (u8)(ITPendingBit & 0x0F);
2488  000c 7b03          	ld	a,(OFST+2,sp)
2489  000e a40f          	and	a,#15
2490  0010 6b01          	ld	(OFST+0,sp),a
2491                     ; 652         if (temp < 8)
2493  0012 7b01          	ld	a,(OFST+0,sp)
2494  0014 a108          	cp	a,#8
2495  0016 2414          	jruge	L7311
2496                     ; 654             itstatus = (u8)(ADC1->AWSRL & (u8)((u8)1 << temp));
2498  0018 7b01          	ld	a,(OFST+0,sp)
2499  001a 5f            	clrw	x
2500  001b 97            	ld	xl,a
2501  001c a601          	ld	a,#1
2502  001e 5d            	tnzw	x
2503  001f 2704          	jreq	L441
2504  0021               L641:
2505  0021 48            	sll	a
2506  0022 5a            	decw	x
2507  0023 26fc          	jrne	L641
2508  0025               L441:
2509  0025 c4540d        	and	a,21517
2510  0028 6b01          	ld	(OFST+0,sp),a
2512  002a 201d          	jra	L3411
2513  002c               L7311:
2514                     ; 658             itstatus = (u8)(ADC1->AWSRH & (u8)((u8)1 << (temp - 8)));
2516  002c 7b01          	ld	a,(OFST+0,sp)
2517  002e a008          	sub	a,#8
2518  0030 5f            	clrw	x
2519  0031 97            	ld	xl,a
2520  0032 a601          	ld	a,#1
2521  0034 5d            	tnzw	x
2522  0035 2704          	jreq	L051
2523  0037               L251:
2524  0037 48            	sll	a
2525  0038 5a            	decw	x
2526  0039 26fc          	jrne	L251
2527  003b               L051:
2528  003b c4540c        	and	a,21516
2529  003e 6b01          	ld	(OFST+0,sp),a
2530  0040 2007          	jra	L3411
2531  0042               L5311:
2532                     ; 663         itstatus = (u8)(ADC1->CSR & ITPendingBit);
2534  0042 c65400        	ld	a,21504
2535  0045 1403          	and	a,(OFST+2,sp)
2536  0047 6b01          	ld	(OFST+0,sp),a
2537  0049               L3411:
2538                     ; 665     return ((ITStatus)itstatus);
2540  0049 7b01          	ld	a,(OFST+0,sp)
2543  004b 5b03          	addw	sp,#3
2544  004d 81            	ret
2587                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2587                     ; 688 {
2588                     .text:	section	.text,new
2589  0000               _ADC1_ClearITPendingBit:
2591  0000 89            	pushw	x
2592  0001 88            	push	a
2593       00000001      OFST:	set	1
2596                     ; 689     u8 temp = 0;
2598                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2600                     ; 694     if ((ITPendingBit& 0xF0) == 0x10)
2602  0002 01            	rrwa	x,a
2603  0003 a4f0          	and	a,#240
2604  0005 5f            	clrw	x
2605  0006 02            	rlwa	x,a
2606  0007 a30010        	cpw	x,#16
2607  000a 263a          	jrne	L5611
2608                     ; 697         temp = (u8)(ITPendingBit & 0x0F);
2610  000c 7b03          	ld	a,(OFST+2,sp)
2611  000e a40f          	and	a,#15
2612  0010 6b01          	ld	(OFST+0,sp),a
2613                     ; 698         if (temp < 8)
2615  0012 7b01          	ld	a,(OFST+0,sp)
2616  0014 a108          	cp	a,#8
2617  0016 2416          	jruge	L7611
2618                     ; 700             ADC1->AWSRL &= (u8)(~((u8)1 << temp));
2620  0018 7b01          	ld	a,(OFST+0,sp)
2621  001a 5f            	clrw	x
2622  001b 97            	ld	xl,a
2623  001c a601          	ld	a,#1
2624  001e 5d            	tnzw	x
2625  001f 2704          	jreq	L651
2626  0021               L061:
2627  0021 48            	sll	a
2628  0022 5a            	decw	x
2629  0023 26fc          	jrne	L061
2630  0025               L651:
2631  0025 43            	cpl	a
2632  0026 c4540d        	and	a,21517
2633  0029 c7540d        	ld	21517,a
2635  002c 2021          	jra	L3711
2636  002e               L7611:
2637                     ; 704             ADC1->AWSRH &= (u8)(~((u8)1 << (temp - 8)));
2639  002e 7b01          	ld	a,(OFST+0,sp)
2640  0030 a008          	sub	a,#8
2641  0032 5f            	clrw	x
2642  0033 97            	ld	xl,a
2643  0034 a601          	ld	a,#1
2644  0036 5d            	tnzw	x
2645  0037 2704          	jreq	L261
2646  0039               L461:
2647  0039 48            	sll	a
2648  003a 5a            	decw	x
2649  003b 26fc          	jrne	L461
2650  003d               L261:
2651  003d 43            	cpl	a
2652  003e c4540c        	and	a,21516
2653  0041 c7540c        	ld	21516,a
2654  0044 2009          	jra	L3711
2655  0046               L5611:
2656                     ; 709         ADC1->CSR &= (u8) (~ITPendingBit);
2658  0046 7b03          	ld	a,(OFST+2,sp)
2659  0048 43            	cpl	a
2660  0049 c45400        	and	a,21504
2661  004c c75400        	ld	21504,a
2662  004f               L3711:
2663                     ; 711 }
2666  004f 5b03          	addw	sp,#3
2667  0051 81            	ret
2680                     	xdef	_ADC1_ClearITPendingBit
2681                     	xdef	_ADC1_GetITStatus
2682                     	xdef	_ADC1_ClearFlag
2683                     	xdef	_ADC1_GetFlagStatus
2684                     	xdef	_ADC1_GetAWDChannelStatus
2685                     	xdef	_ADC1_GetBufferValue
2686                     	xdef	_ADC1_SetLowThreshold
2687                     	xdef	_ADC1_SetHighThreshold
2688                     	xdef	_ADC1_GetConversionValue
2689                     	xdef	_ADC1_StartConversion
2690                     	xdef	_ADC1_AWDChannelConfig
2691                     	xdef	_ADC1_ExternalTriggerConfig
2692                     	xdef	_ADC1_ConversionConfig
2693                     	xdef	_ADC1_SchmittTriggerConfig
2694                     	xdef	_ADC1_PrescalerConfig
2695                     	xdef	_ADC1_ITConfig
2696                     	xdef	_ADC1_DataBufferCmd
2697                     	xdef	_ADC1_ScanModeCmd
2698                     	xdef	_ADC1_Cmd
2699                     	xdef	_ADC1_Init
2700                     	xdef	_ADC1_DeInit
2719                     	end
