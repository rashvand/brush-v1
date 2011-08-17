   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 62 u8 ITC_GetCPUCC(void)
  47                     ; 63 {
  49                     	switch	.text
  50  0000               _ITC_GetCPUCC:
  54                     ; 64   _asm("push cc");
  57  0000 8a            	push	cc
  59                     ; 65   _asm("pop a");
  62  0001 84            	pop	a
  64                     ; 66   return; /* Ignore compiler warning, the returned value is in A register */
  67  0002 81            	ret	
  90                     ; 97 void ITC_DeInit(void)
  90                     ; 98 {
  91                     	switch	.text
  92  0003               _ITC_DeInit:
  96                     ; 99   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  98  0003 35ff7f70      	mov	32624,#255
  99                     ; 100   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 101  0007 35ff7f71      	mov	32625,#255
 102                     ; 101   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 104  000b 35ff7f72      	mov	32626,#255
 105                     ; 102   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 107  000f 35ff7f73      	mov	32627,#255
 108                     ; 103   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 110  0013 35ff7f74      	mov	32628,#255
 111                     ; 104   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 113  0017 35ff7f75      	mov	32629,#255
 114                     ; 105   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 116  001b 35ff7f76      	mov	32630,#255
 117                     ; 106   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 119  001f 35ff7f77      	mov	32631,#255
 120                     ; 107 }
 123  0023 81            	ret	
 148                     ; 124 u8 ITC_GetSoftIntStatus(void)
 148                     ; 125 {
 149                     	switch	.text
 150  0024               _ITC_GetSoftIntStatus:
 154                     ; 126   return (u8)(ITC_GetCPUCC() & CPU_CC_I1I0);
 156  0024 adda          	call	_ITC_GetCPUCC
 158  0026 a428          	and	a,#40
 161  0028 81            	ret	
 438                     .const:	section	.text
 439  0000               L42:
 440  0000 004a          	dc.w	L14
 441  0002 004a          	dc.w	L14
 442  0004 004a          	dc.w	L14
 443  0006 004a          	dc.w	L14
 444  0008 004f          	dc.w	L34
 445  000a 004f          	dc.w	L34
 446  000c 004f          	dc.w	L34
 447  000e 004f          	dc.w	L34
 448  0010 0054          	dc.w	L54
 449  0012 0054          	dc.w	L54
 450  0014 0054          	dc.w	L54
 451  0016 0054          	dc.w	L54
 452  0018 0059          	dc.w	L74
 453  001a 0059          	dc.w	L74
 454  001c 0059          	dc.w	L74
 455  001e 0059          	dc.w	L74
 456  0020 005e          	dc.w	L15
 457  0022 005e          	dc.w	L15
 458  0024 005e          	dc.w	L15
 459  0026 005e          	dc.w	L15
 460  0028 0063          	dc.w	L35
 461  002a 0063          	dc.w	L35
 462  002c 0063          	dc.w	L35
 463  002e 0063          	dc.w	L35
 464  0030 0068          	dc.w	L55
 465                     ; 144 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 465                     ; 145 {
 466                     	switch	.text
 467  0029               _ITC_GetSoftwarePriority:
 469  0029 88            	push	a
 470  002a 89            	pushw	x
 471       00000002      OFST:	set	2
 474                     ; 147   u8 Value = 0;
 476  002b 0f02          	clr	(OFST+0,sp)
 477                     ; 151   assert_param(IS_ITC_IRQ_OK((u8)IrqNum));
 479                     ; 154   Mask = (u8)(0x03U << (((u8)IrqNum % 4U) * 2U));
 481  002d a403          	and	a,#3
 482  002f 48            	sll	a
 483  0030 5f            	clrw	x
 484  0031 97            	ld	xl,a
 485  0032 a603          	ld	a,#3
 486  0034 5d            	tnzw	x
 487  0035 2704          	jreq	L61
 488  0037               L02:
 489  0037 48            	sll	a
 490  0038 5a            	decw	x
 491  0039 26fc          	jrne	L02
 492  003b               L61:
 493  003b 6b01          	ld	(OFST-1,sp),a
 494                     ; 156   switch (IrqNum)
 496  003d 7b03          	ld	a,(OFST+1,sp)
 498                     ; 197     default:
 498                     ; 198       break;
 499  003f a119          	cp	a,#25
 500  0041 242e          	jruge	L312
 501  0043 5f            	clrw	x
 502  0044 97            	ld	xl,a
 503  0045 58            	sllw	x
 504  0046 de0000        	ldw	x,(L42,x)
 505  0049 fc            	jp	(x)
 506  004a               L14:
 507                     ; 158     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 507                     ; 159     case ITC_IRQ_AWU:
 507                     ; 160     case ITC_IRQ_CLK:
 507                     ; 161     case ITC_IRQ_PORTA:
 507                     ; 162       Value = (u8)(ITC->ISPR1 & Mask); /* Read software priority */
 509  004a c67f70        	ld	a,32624
 510                     ; 163       break;
 512  004d 201c          	jp	LC001
 513  004f               L34:
 514                     ; 164     case ITC_IRQ_PORTB:
 514                     ; 165     case ITC_IRQ_PORTC:
 514                     ; 166     case ITC_IRQ_PORTD:
 514                     ; 167     case ITC_IRQ_PORTE:
 514                     ; 168       Value = (u8)(ITC->ISPR2 & Mask); /* Read software priority */
 516  004f c67f71        	ld	a,32625
 517                     ; 169       break;
 519  0052 2017          	jp	LC001
 520  0054               L54:
 521                     ; 170     case ITC_IRQ_CAN_RX:
 521                     ; 171     case ITC_IRQ_CAN_TX:
 521                     ; 172     case ITC_IRQ_SPI:
 521                     ; 173     case ITC_IRQ_TIM1_OVF:
 521                     ; 174       Value = (u8)(ITC->ISPR3 & Mask); /* Read software priority */
 523  0054 c67f72        	ld	a,32626
 524                     ; 175       break;
 526  0057 2012          	jp	LC001
 527  0059               L74:
 528                     ; 176     case ITC_IRQ_TIM1_CAPCOM:
 528                     ; 177     case ITC_IRQ_TIM2_OVF:
 528                     ; 178     case ITC_IRQ_TIM2_CAPCOM:
 528                     ; 179     case ITC_IRQ_TIM3_OVF:
 528                     ; 180       Value = (u8)(ITC->ISPR4 & Mask); /* Read software priority */
 530  0059 c67f73        	ld	a,32627
 531                     ; 181       break;
 533  005c 200d          	jp	LC001
 534  005e               L15:
 535                     ; 182     case ITC_IRQ_TIM3_CAPCOM:
 535                     ; 183     case ITC_IRQ_USART_TX:
 535                     ; 184     case ITC_IRQ_USART_RX:
 535                     ; 185     case ITC_IRQ_I2C:
 535                     ; 186       Value = (u8)(ITC->ISPR5 & Mask); /* Read software priority */
 537  005e c67f74        	ld	a,32628
 538                     ; 187       break;
 540  0061 2008          	jp	LC001
 541  0063               L35:
 542                     ; 188     case ITC_IRQ_LINUART_TX:
 542                     ; 189     case ITC_IRQ_LINUART_RX:
 542                     ; 190     case ITC_IRQ_ADC:
 542                     ; 191     case ITC_IRQ_TIM4_OVF:
 542                     ; 192       Value = (u8)(ITC->ISPR6 & Mask); /* Read software priority */
 544  0063 c67f75        	ld	a,32629
 545                     ; 193       break;
 547  0066 2003          	jp	LC001
 548  0068               L55:
 549                     ; 194     case ITC_IRQ_EEPROM_EEC:
 549                     ; 195       Value = (u8)(ITC->ISPR7 & Mask); /* Read software priority */
 551  0068 c67f76        	ld	a,32630
 552  006b               LC001:
 553  006b 1401          	and	a,(OFST-1,sp)
 554  006d 6b02          	ld	(OFST+0,sp),a
 555                     ; 196       break;
 557                     ; 197     default:
 557                     ; 198       break;
 559  006f 7b03          	ld	a,(OFST+1,sp)
 560  0071               L312:
 561                     ; 201   Value >>= (u8)(((u8)IrqNum % 4u) * 2u);
 563  0071 a403          	and	a,#3
 564  0073 48            	sll	a
 565  0074 5f            	clrw	x
 566  0075 97            	ld	xl,a
 567  0076 7b02          	ld	a,(OFST+0,sp)
 568  0078 5d            	tnzw	x
 569  0079 2704          	jreq	L62
 570  007b               L03:
 571  007b 44            	srl	a
 572  007c 5a            	decw	x
 573  007d 26fc          	jrne	L03
 574  007f               L62:
 575                     ; 203   return((ITC_PriorityLevel_TypeDef)Value);
 579  007f 5b03          	addw	sp,#3
 580  0081 81            	ret	
 644                     	switch	.const
 645  0032               L64:
 646  0032 00b8          	dc.w	L512
 647  0034 00b8          	dc.w	L512
 648  0036 00b8          	dc.w	L512
 649  0038 00b8          	dc.w	L512
 650  003a 00ca          	dc.w	L712
 651  003c 00ca          	dc.w	L712
 652  003e 00ca          	dc.w	L712
 653  0040 00ca          	dc.w	L712
 654  0042 00dc          	dc.w	L122
 655  0044 00dc          	dc.w	L122
 656  0046 00dc          	dc.w	L122
 657  0048 00dc          	dc.w	L122
 658  004a 00ee          	dc.w	L322
 659  004c 00ee          	dc.w	L322
 660  004e 00ee          	dc.w	L322
 661  0050 00ee          	dc.w	L322
 662  0052 0100          	dc.w	L522
 663  0054 0100          	dc.w	L522
 664  0056 0100          	dc.w	L522
 665  0058 0100          	dc.w	L522
 666  005a 0112          	dc.w	L722
 667  005c 0112          	dc.w	L722
 668  005e 0112          	dc.w	L722
 669  0060 0112          	dc.w	L722
 670  0062 0124          	dc.w	L132
 671                     ; 223 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 671                     ; 224 {
 672                     	switch	.text
 673  0082               _ITC_SetSoftwarePriority:
 675  0082 89            	pushw	x
 676  0083 89            	pushw	x
 677       00000002      OFST:	set	2
 680                     ; 230   assert_param(IS_ITC_IRQ_OK((u8)IrqNum));
 682                     ; 231   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 684                     ; 234   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 686                     ; 238   Mask = (u8)(~(u8)(0x03U << (((u8)IrqNum % 4U) * 2U)));
 688  0084 9e            	ld	a,xh
 689  0085 a403          	and	a,#3
 690  0087 48            	sll	a
 691  0088 5f            	clrw	x
 692  0089 97            	ld	xl,a
 693  008a a603          	ld	a,#3
 694  008c 5d            	tnzw	x
 695  008d 2704          	jreq	L43
 696  008f               L63:
 697  008f 48            	sll	a
 698  0090 5a            	decw	x
 699  0091 26fc          	jrne	L63
 700  0093               L43:
 701  0093 43            	cpl	a
 702  0094 6b01          	ld	(OFST-1,sp),a
 703                     ; 241   NewPriority = (u8)((u8)(PriorityValue) << (((u8)IrqNum % 4U) * 2U));
 705  0096 7b03          	ld	a,(OFST+1,sp)
 706  0098 a403          	and	a,#3
 707  009a 48            	sll	a
 708  009b 5f            	clrw	x
 709  009c 97            	ld	xl,a
 710  009d 7b04          	ld	a,(OFST+2,sp)
 711  009f 5d            	tnzw	x
 712  00a0 2704          	jreq	L04
 713  00a2               L24:
 714  00a2 48            	sll	a
 715  00a3 5a            	decw	x
 716  00a4 26fc          	jrne	L24
 717  00a6               L04:
 718  00a6 6b02          	ld	(OFST+0,sp),a
 719                     ; 243   switch (IrqNum)
 721  00a8 7b03          	ld	a,(OFST+1,sp)
 723                     ; 299     default:
 723                     ; 300       break;
 724  00aa a119          	cp	a,#25
 725  00ac 2503cc0134    	jruge	L172
 726  00b1 5f            	clrw	x
 727  00b2 97            	ld	xl,a
 728  00b3 58            	sllw	x
 729  00b4 de0032        	ldw	x,(L64,x)
 730  00b7 fc            	jp	(x)
 731  00b8               L512:
 732                     ; 246     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 732                     ; 247     case ITC_IRQ_AWU:
 732                     ; 248     case ITC_IRQ_CLK:
 732                     ; 249     case ITC_IRQ_PORTA:
 732                     ; 250       ITC->ISPR1 &= Mask;
 734  00b8 c67f70        	ld	a,32624
 735  00bb 1401          	and	a,(OFST-1,sp)
 736  00bd c77f70        	ld	32624,a
 737                     ; 251       ITC->ISPR1 |= NewPriority;
 739  00c0 c67f70        	ld	a,32624
 740  00c3 1a02          	or	a,(OFST+0,sp)
 741  00c5 c77f70        	ld	32624,a
 742                     ; 252       break;
 744  00c8 206a          	jra	L172
 745  00ca               L712:
 746                     ; 254     case ITC_IRQ_PORTB:
 746                     ; 255     case ITC_IRQ_PORTC:
 746                     ; 256     case ITC_IRQ_PORTD:
 746                     ; 257     case ITC_IRQ_PORTE:
 746                     ; 258       ITC->ISPR2 &= Mask;
 748  00ca c67f71        	ld	a,32625
 749  00cd 1401          	and	a,(OFST-1,sp)
 750  00cf c77f71        	ld	32625,a
 751                     ; 259       ITC->ISPR2 |= NewPriority;
 753  00d2 c67f71        	ld	a,32625
 754  00d5 1a02          	or	a,(OFST+0,sp)
 755  00d7 c77f71        	ld	32625,a
 756                     ; 260       break;
 758  00da 2058          	jra	L172
 759  00dc               L122:
 760                     ; 262     case ITC_IRQ_CAN_RX:
 760                     ; 263     case ITC_IRQ_CAN_TX:
 760                     ; 264     case ITC_IRQ_SPI:
 760                     ; 265     case ITC_IRQ_TIM1_OVF:
 760                     ; 266       ITC->ISPR3 &= Mask;
 762  00dc c67f72        	ld	a,32626
 763  00df 1401          	and	a,(OFST-1,sp)
 764  00e1 c77f72        	ld	32626,a
 765                     ; 267       ITC->ISPR3 |= NewPriority;
 767  00e4 c67f72        	ld	a,32626
 768  00e7 1a02          	or	a,(OFST+0,sp)
 769  00e9 c77f72        	ld	32626,a
 770                     ; 268       break;
 772  00ec 2046          	jra	L172
 773  00ee               L322:
 774                     ; 270     case ITC_IRQ_TIM1_CAPCOM:
 774                     ; 271     case ITC_IRQ_TIM2_OVF:
 774                     ; 272     case ITC_IRQ_TIM2_CAPCOM:
 774                     ; 273     case ITC_IRQ_TIM3_OVF:
 774                     ; 274       ITC->ISPR4 &= Mask;
 776  00ee c67f73        	ld	a,32627
 777  00f1 1401          	and	a,(OFST-1,sp)
 778  00f3 c77f73        	ld	32627,a
 779                     ; 275       ITC->ISPR4 |= NewPriority;
 781  00f6 c67f73        	ld	a,32627
 782  00f9 1a02          	or	a,(OFST+0,sp)
 783  00fb c77f73        	ld	32627,a
 784                     ; 276       break;
 786  00fe 2034          	jra	L172
 787  0100               L522:
 788                     ; 278     case ITC_IRQ_TIM3_CAPCOM:
 788                     ; 279     case ITC_IRQ_USART_TX:
 788                     ; 280     case ITC_IRQ_USART_RX:
 788                     ; 281     case ITC_IRQ_I2C:
 788                     ; 282       ITC->ISPR5 &= Mask;
 790  0100 c67f74        	ld	a,32628
 791  0103 1401          	and	a,(OFST-1,sp)
 792  0105 c77f74        	ld	32628,a
 793                     ; 283       ITC->ISPR5 |= NewPriority;
 795  0108 c67f74        	ld	a,32628
 796  010b 1a02          	or	a,(OFST+0,sp)
 797  010d c77f74        	ld	32628,a
 798                     ; 284       break;
 800  0110 2022          	jra	L172
 801  0112               L722:
 802                     ; 286     case ITC_IRQ_LINUART_TX:
 802                     ; 287     case ITC_IRQ_LINUART_RX:
 802                     ; 288     case ITC_IRQ_ADC:
 802                     ; 289     case ITC_IRQ_TIM4_OVF:
 802                     ; 290       ITC->ISPR6 &= Mask;
 804  0112 c67f75        	ld	a,32629
 805  0115 1401          	and	a,(OFST-1,sp)
 806  0117 c77f75        	ld	32629,a
 807                     ; 291       ITC->ISPR6 |= NewPriority;
 809  011a c67f75        	ld	a,32629
 810  011d 1a02          	or	a,(OFST+0,sp)
 811  011f c77f75        	ld	32629,a
 812                     ; 292       break;
 814  0122 2010          	jra	L172
 815  0124               L132:
 816                     ; 294     case ITC_IRQ_EEPROM_EEC:
 816                     ; 295       ITC->ISPR7 &= Mask;
 818  0124 c67f76        	ld	a,32630
 819  0127 1401          	and	a,(OFST-1,sp)
 820  0129 c77f76        	ld	32630,a
 821                     ; 296       ITC->ISPR7 |= NewPriority;
 823  012c c67f76        	ld	a,32630
 824  012f 1a02          	or	a,(OFST+0,sp)
 825  0131 c77f76        	ld	32630,a
 826                     ; 297       break;
 828                     ; 299     default:
 828                     ; 300       break;
 830  0134               L172:
 831                     ; 304 }
 834  0134 5b04          	addw	sp,#4
 835  0136 81            	ret	
 848                     	xdef	_ITC_GetSoftwarePriority
 849                     	xdef	_ITC_SetSoftwarePriority
 850                     	xdef	_ITC_GetSoftIntStatus
 851                     	xdef	_ITC_DeInit
 852                     	xdef	_ITC_GetCPUCC
 871                     	end
