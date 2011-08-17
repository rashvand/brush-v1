   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  77                     .const:	section	.text
  78  0000               L6:
  79  0000 00000001      	dc.l	1
  80                     ; 35 errorcode vdev_fninp8(u32 addr, pu8 pportvalue)
  80                     ; 36 {
  81                     	scross	off
  82                     	switch	.text
  83  0000               _vdev_fninp8:
  85  0000 88            	push	a
  86       00000001      OFST:	set	1
  89                     ; 37 	errorcode ret = VDEV_ERROR_NONE;
  91  0001 0f01          	clr	(OFST+0,sp)
  92                     ; 39 	switch (addr)
  94  0003 96            	ldw	x,sp
  95  0004 1c0004        	addw	x,#OFST+3
  96  0007 cd0000        	call	c_ltor
  98  000a ae0000        	ldw	x,#L6
  99  000d cd0000        	call	c_lcmp
 101  0010 2603          	jrne	L34
 104                     ; 41 		case VDEV_INP8_USER_INPUT:
 104                     ; 42 			*pportvalue = 0;
 106  0012 1e08          	ldw	x,(OFST+7,sp)
 107  0014 7f            	clr	(x)
 108                     ; 53 		break;
 110  0015               L34:
 111                     ; 55 	return ret;
 113  0015 7b01          	ld	a,(OFST+0,sp)
 116  0017 5b01          	addw	sp,#1
 117  0019 81            	ret	
 160                     ; 58 errorcode vdev_fninp16(u32 addr, pu16 pportvalue)
 160                     ; 59 {
 161                     	switch	.text
 162  001a               _vdev_fninp16:
 164  001a 88            	push	a
 165       00000001      OFST:	set	1
 168                     ; 60 	errorcode ret = VDEV_ERROR_NONE;
 170                     ; 62 	return ret;
 172  001b 4f            	clr	a
 175  001c 5b01          	addw	sp,#1
 176  001e 81            	ret	
 219                     ; 65 errorcode vdev_fninp32(u32 addr, pu32 pportvalue)
 219                     ; 66 {
 220                     	switch	.text
 221  001f               _vdev_fninp32:
 223  001f 88            	push	a
 224       00000001      OFST:	set	1
 227                     ; 67 	errorcode ret = VDEV_ERROR_NONE;
 229                     ; 69 	return ret;
 231  0020 4f            	clr	a
 234  0021 5b01          	addw	sp,#1
 235  0023 81            	ret	
 287                     	switch	.const
 288  0004               L302:
 289  0004 0004          	dc.w	4
 290  0006 00000004      	dc.l	4
 291  000a 0037          	dc.w	L511
 292  000c 00000005      	dc.l	5
 293  0010 0056          	dc.w	L521
 294  0012 00000006      	dc.l	6
 295  0016 0075          	dc.w	L531
 296  0018 00000007      	dc.l	7
 297  001c 0097          	dc.w	L541
 298  001e 00b7          	dc.w	L502
 299                     ; 72 errorcode vdev_fnout8(u32 addr, u8 pportvalue)
 299                     ; 73 {
 300                     	switch	.text
 301  0024               _vdev_fnout8:
 303  0024 88            	push	a
 304       00000001      OFST:	set	1
 307                     ; 74 	errorcode ret = VDEV_ERROR_NONE;
 309  0025 0f01          	clr	(OFST+0,sp)
 310                     ; 76 	switch (addr)
 312  0027 96            	ldw	x,sp
 313  0028 1c0004        	addw	x,#OFST+3
 314  002b cd0000        	call	c_ltor
 317  002e ae0004        	ldw	x,#L302
 318  0031 cd0000        	call	c_jltab
 319                     ; 78 		case VDEV_OUT8_DISPLAY_FLUSH:
 319                     ; 79 			#ifdef DISPLAY
 319                     ; 80 				// Display flush
 319                     ; 81 				dev_displayFlush();
 319                     ; 82 			#endif
 319                     ; 83 		break;
 321  0034 cc00b7        	jra	L502
 322                     ; 85 		case VDEV_OUT8_DISPLAY_PRINTCH:
 322                     ; 86 			#ifdef DISPLAY
 322                     ; 87 				// Display printch
 322                     ; 88 				dev_displayPrintch();
 322                     ; 89 			#endif
 322                     ; 90 		break;
 324  0037               L511:
 325                     ; 92 		case VDEV_OUT8_LED_1:
 325                     ; 93 			switch (pportvalue)
 327  0037 7b08          	ld	a,(OFST+7,sp)
 329                     ; 103 				break;
 330  0039 2708          	jreq	L711
 331  003b 4a            	dec	a
 332  003c 270b          	jreq	L121
 333  003e 4a            	dec	a
 334  003f 270e          	jreq	L321
 335  0041 2074          	jra	L502
 336  0043               L711:
 337                     ; 95 				case LED_ON:
 337                     ; 96 					DEBUG0_PORT->ODR |= DEBUG0_PIN;
 339  0043 721e500f      	bset	20495,#7
 340                     ; 97 				break;
 342  0047 206e          	jra	L502
 343  0049               L121:
 344                     ; 98 				case LED_OFF:
 344                     ; 99 					DEBUG0_PORT->ODR &= (u8)(~DEBUG0_PIN);
 346  0049 721f500f      	bres	20495,#7
 347                     ; 100 				break;
 349  004d 2068          	jra	L502
 350  004f               L321:
 351                     ; 101 				case LED_TOGGLE:
 351                     ; 102 					DEBUG0_PORT->ODR ^= DEBUG0_PIN;
 353  004f c6500f        	ld	a,20495
 354  0052 a880          	xor	a,#128
 355                     ; 103 				break;
 357  0054 203c          	jp	LC001
 358                     ; 105 		break;
 360  0056               L521:
 361                     ; 107 		case VDEV_OUT8_LED_2:
 361                     ; 108 			switch (pportvalue)
 363  0056 7b08          	ld	a,(OFST+7,sp)
 365                     ; 118 				break;
 366  0058 2708          	jreq	L721
 367  005a 4a            	dec	a
 368  005b 270b          	jreq	L131
 369  005d 4a            	dec	a
 370  005e 270e          	jreq	L331
 371  0060 2055          	jra	L502
 372  0062               L721:
 373                     ; 110 				case LED_ON:
 373                     ; 111 					DEBUG1_PORT->ODR |= DEBUG1_PIN;
 375  0062 7214500f      	bset	20495,#2
 376                     ; 112 				break;
 378  0066 204f          	jra	L502
 379  0068               L131:
 380                     ; 113 				case LED_OFF:
 380                     ; 114 					DEBUG1_PORT->ODR &= (u8)(~DEBUG1_PIN);
 382  0068 7215500f      	bres	20495,#2
 383                     ; 115 				break;
 385  006c 2049          	jra	L502
 386  006e               L331:
 387                     ; 116 				case LED_TOGGLE:
 387                     ; 117 					DEBUG1_PORT->ODR ^= DEBUG1_PIN;
 389  006e c6500f        	ld	a,20495
 390  0071 a804          	xor	a,#4
 391                     ; 118 				break;
 393  0073 201d          	jp	LC001
 394                     ; 120 		break;
 396  0075               L531:
 397                     ; 122 		case VDEV_OUT8_LED_3:
 397                     ; 123 			switch (pportvalue)
 399  0075 7b08          	ld	a,(OFST+7,sp)
 401                     ; 133 				break;
 402  0077 2708          	jreq	L731
 403  0079 4a            	dec	a
 404  007a 270b          	jreq	L141
 405  007c 4a            	dec	a
 406  007d 270e          	jreq	L341
 407  007f 2036          	jra	L502
 408  0081               L731:
 409                     ; 125 				case LED_ON:
 409                     ; 126 					DEBUG2_PORT->ODR |= DEBUG2_PIN;
 411  0081 7210500f      	bset	20495,#0
 412                     ; 127 				break;
 414  0085 2030          	jra	L502
 415  0087               L141:
 416                     ; 128 				case LED_OFF:
 416                     ; 129 					DEBUG2_PORT->ODR &= (u8)(~DEBUG2_PIN);
 418  0087 7211500f      	bres	20495,#0
 419                     ; 130 				break;
 421  008b 202a          	jra	L502
 422  008d               L341:
 423                     ; 131 				case LED_TOGGLE:
 423                     ; 132 					DEBUG2_PORT->ODR ^= DEBUG2_PIN;
 425  008d c6500f        	ld	a,20495
 426  0090 a801          	xor	a,#1
 427  0092               LC001:
 428  0092 c7500f        	ld	20495,a
 429                     ; 133 				break;
 431  0095 2020          	jra	L502
 432                     ; 136 		break;
 434  0097               L541:
 435                     ; 138 		case VDEV_OUT8_LED_4:
 435                     ; 139 			switch (pportvalue)
 437  0097 7b08          	ld	a,(OFST+7,sp)
 439                     ; 149 				break;
 440  0099 2708          	jreq	L741
 441  009b 4a            	dec	a
 442  009c 270b          	jreq	L151
 443  009e 4a            	dec	a
 444  009f 270e          	jreq	L351
 445  00a1 2014          	jra	L502
 446  00a3               L741:
 447                     ; 141 				case LED_ON:
 447                     ; 142 					DEBUG3_PORT->ODR |= DEBUG3_PIN;
 449  00a3 72105014      	bset	20500,#0
 450                     ; 143 				break;
 452  00a7 200e          	jra	L502
 453  00a9               L151:
 454                     ; 144 				case LED_OFF:
 454                     ; 145 					DEBUG3_PORT->ODR &= (u8)(~DEBUG3_PIN);
 456  00a9 72115014      	bres	20500,#0
 457                     ; 146 				break;
 459  00ad 2008          	jra	L502
 460  00af               L351:
 461                     ; 147 				case LED_TOGGLE:
 461                     ; 148 					DEBUG3_PORT->ODR ^= DEBUG3_PIN;
 463  00af c65014        	ld	a,20500
 464  00b2 a801          	xor	a,#1
 465  00b4 c75014        	ld	20500,a
 466                     ; 149 				break;
 468                     ; 152 		break;
 470  00b7               L502:
 471                     ; 154 	return ret;
 473  00b7 7b01          	ld	a,(OFST+0,sp)
 476  00b9 5b01          	addw	sp,#1
 477  00bb 81            	ret	
 520                     ; 157 errorcode vdev_fnout16(u32 addr, u16 pportvalue)
 520                     ; 158 {
 521                     	switch	.text
 522  00bc               _vdev_fnout16:
 524  00bc 88            	push	a
 525       00000001      OFST:	set	1
 528                     ; 159 	errorcode ret = VDEV_ERROR_NONE;
 530                     ; 161 	return ret;
 532  00bd 4f            	clr	a
 535  00be 5b01          	addw	sp,#1
 536  00c0 81            	ret	
 579                     ; 164 errorcode vdev_fnout32(u32 addr, u32 pportvalue)
 579                     ; 165 {
 580                     	switch	.text
 581  00c1               _vdev_fnout32:
 583  00c1 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 166 	errorcode ret = VDEV_ERROR_NONE;
 589                     ; 168 	return ret;
 591  00c2 4f            	clr	a
 594  00c3 5b01          	addw	sp,#1
 595  00c5 81            	ret	
 608                     	xdef	_vdev_fnout32
 609                     	xdef	_vdev_fnout16
 610                     	xdef	_vdev_fnout8
 611                     	xdef	_vdev_fninp32
 612                     	xdef	_vdev_fninp16
 613                     	xdef	_vdev_fninp8
 614                     	xref.b	c_x
 633                     	xref	c_jltab
 634                     	xref	c_lcmp
 635                     	xref	c_ltor
 636                     	end
