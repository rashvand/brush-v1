   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  64                     ; 136 NO_REG_SAVE void main ( void )
  64                     ; 137 {
  66                     .text:	section	.text,new
  67  0000               _main:
  69  0000 88            	push	a
  70       00000001      OFST:	set	1
  73                     ; 149     status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE_BYTES - 1], IDLE_STACK_SIZE_BYTES);
  75  0001 ae0080        	ldw	x,#128
  76  0004 89            	pushw	x
  77  0005 ae0000        	ldw	x,#0
  78  0008 89            	pushw	x
  79  0009 ae0093        	ldw	x,#L7_idle_thread_stack+127
  80  000c cd0000        	call	_atomOSInit
  82  000f 5b04          	addw	sp,#4
  83  0011 6b01          	ld	(OFST+0,sp),a
  84                     ; 150     if (status == ATOM_OK)
  86  0013 0d01          	tnz	(OFST+0,sp)
  87  0015 262e          	jrne	L14
  88                     ; 153         archInitSystemTickTimer();
  90  0017 cd0000        	call	_archInitSystemTickTimer
  92                     ; 156         status = atomThreadCreate(&main_tcb,
  92                     ; 157                      TEST_THREAD_PRIO, main_thread_func, 0,
  92                     ; 158                      &main_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
  92                     ; 159                      MAIN_STACK_SIZE_BYTES);
  94  001a ae0100        	ldw	x,#256
  95  001d 89            	pushw	x
  96  001e ae0000        	ldw	x,#0
  97  0021 89            	pushw	x
  98  0022 ae0193        	ldw	x,#L5_main_thread_stack+255
  99  0025 89            	pushw	x
 100  0026 ae0000        	ldw	x,#0
 101  0029 89            	pushw	x
 102  002a ae0000        	ldw	x,#0
 103  002d 89            	pushw	x
 104  002e ae0000        	ldw	x,#L11_main_thread_func
 105  0031 89            	pushw	x
 106  0032 4b10          	push	#16
 107  0034 ae0194        	ldw	x,#L3_main_tcb
 108  0037 cd0000        	call	_atomThreadCreate
 110  003a 5b0d          	addw	sp,#13
 111  003c 6b01          	ld	(OFST+0,sp),a
 112                     ; 160         if (status == ATOM_OK)
 114  003e 0d01          	tnz	(OFST+0,sp)
 115  0040 2603          	jrne	L14
 116                     ; 172             atomOSStart();
 118  0042 cd0000        	call	_atomOSStart
 120  0045               L14:
 122  0045 20fe          	jra	L14
 198                     ; 195 static void main_thread_func (uint32_t param)
 198                     ; 196 {
 199                     .text:	section	.text,new
 200  0000               L11_main_thread_func:
 202  0000 520e          	subw	sp,#14
 203       0000000e      OFST:	set	14
 206                     ; 201     param = param;
 208                     ; 204 		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 210  0002 4f            	clr	a
 211  0003 cd0000        	call	_CLK_HSIPrescalerConfig
 213                     ; 207     GPIO_DeInit(GPIOD);
 215  0006 ae500f        	ldw	x,#20495
 216  0009 cd0000        	call	_GPIO_DeInit
 218                     ; 208 		GPIO_DeInit(GPIOE);
 220  000c ae5014        	ldw	x,#20500
 221  000f cd0000        	call	_GPIO_DeInit
 223                     ; 209     GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 1
 225  0012 4be0          	push	#224
 226  0014 4b80          	push	#128
 227  0016 ae500f        	ldw	x,#20495
 228  0019 cd0000        	call	_GPIO_Init
 230  001c 85            	popw	x
 231                     ; 210 		GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); //Debug 2
 233  001d 4be0          	push	#224
 234  001f 4b04          	push	#4
 235  0021 ae500f        	ldw	x,#20495
 236  0024 cd0000        	call	_GPIO_Init
 238  0027 85            	popw	x
 239                     ; 214 		GPIO_Init(GPIOE, GPIO_PIN_6, 		GPIO_MODE_IN_FL_NO_IT);     //ain9
 241  0028 4b00          	push	#0
 242  002a 4b40          	push	#64
 243  002c ae5014        	ldw	x,#20500
 244  002f cd0000        	call	_GPIO_Init
 246  0032 85            	popw	x
 247                     ; 215 		GPIO_Init(GPIOE, GPIO_PIN_7, 		GPIO_MODE_IN_FL_NO_IT);     //ain8
 249  0033 4b00          	push	#0
 250  0035 4b80          	push	#128
 251  0037 ae5014        	ldw	x,#20500
 252  003a cd0000        	call	_GPIO_Init
 254  003d 85            	popw	x
 255                     ; 216 		GPIO_Init(GPIOB, GPIO_PIN_ALL, 	GPIO_MODE_IN_FL_NO_IT); 		//ain0-ain7
 257  003e 4b00          	push	#0
 258  0040 4bff          	push	#255
 259  0042 ae5005        	ldw	x,#20485
 260  0045 cd0000        	call	_GPIO_Init
 262  0048 85            	popw	x
 263                     ; 219     if (uart_init(115200) != 0)
 265  0049 aec200        	ldw	x,#49664
 266  004c 89            	pushw	x
 267  004d ae0001        	ldw	x,#1
 268  0050 89            	pushw	x
 269  0051 cd0000        	call	_uart_init
 271  0054 5b04          	addw	sp,#4
 272  0056 a30000        	cpw	x,#0
 273                     ; 224 		ADC1_DeInit(); 
 275  0059 cd0000        	call	_ADC1_DeInit
 277                     ; 237 		ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
 277                     ; 238 							ADC1_CHANNEL_9, 
 277                     ; 239 							ADC1_PRESSEL_FCPU_D2, 
 277                     ; 240 							ADC1_EXTTRIG_TIM, 
 277                     ; 241 							DISABLE, 
 277                     ; 242 							ADC1_ALIGN_LEFT, 
 277                     ; 243 							ADC1_SCHMITTTRIG_ALL, 
 277                     ; 244 							DISABLE); 
 279  005c 4b00          	push	#0
 280  005e 4bff          	push	#255
 281  0060 4b00          	push	#0
 282  0062 4b00          	push	#0
 283  0064 4b00          	push	#0
 284  0066 4b00          	push	#0
 285  0068 ae0109        	ldw	x,#265
 286  006b cd0000        	call	_ADC1_Init
 288  006e 5b06          	addw	sp,#6
 289                     ; 247 		ADC1_ScanModeCmd(ENABLE); //ENABLE
 291  0070 a601          	ld	a,#1
 292  0072 cd0000        	call	_ADC1_ScanModeCmd
 294                     ; 250     ADC1_ITConfig(ADC1_IT_EOCIE,ENABLE);
 296  0075 4b01          	push	#1
 297  0077 ae0020        	ldw	x,#32
 298  007a cd0000        	call	_ADC1_ITConfig
 300  007d 84            	pop	a
 301                     ; 253 		ADC1_Cmd(ENABLE);
 303  007e a601          	ld	a,#1
 304  0080 cd0000        	call	_ADC1_Cmd
 306                     ; 256 		ADC1_StartConversion();
 308  0083 cd0000        	call	_ADC1_StartConversion
 310                     ; 281     if (test_status == 0)
 312  0086 96            	ldw	x,sp
 313  0087 1c0009        	addw	x,#OFST-5
 314  008a cd0000        	call	c_lzmp
 316  008d 2627          	jrne	L37
 317                     ; 286         if (atomThreadStackCheck (&main_tcb, &used_bytes, &free_bytes) == ATOM_OK)
 319  008f 96            	ldw	x,sp
 320  0090 1c0005        	addw	x,#OFST-9
 321  0093 89            	pushw	x
 322  0094 96            	ldw	x,sp
 323  0095 1c0003        	addw	x,#OFST-11
 324  0098 89            	pushw	x
 325  0099 ae0194        	ldw	x,#L3_main_tcb
 326  009c cd0000        	call	_atomThreadStackCheck
 328  009f 5b04          	addw	sp,#4
 329  00a1 4d            	tnz	a
 330  00a2 2612          	jrne	L37
 331                     ; 289             if (free_bytes == 0)
 333  00a4 96            	ldw	x,sp
 334  00a5 1c0005        	addw	x,#OFST-9
 335  00a8 cd0000        	call	c_lzmp
 337  00ab 2609          	jrne	L37
 338                     ; 292                 test_status++;
 340  00ad 96            	ldw	x,sp
 341  00ae 1c0009        	addw	x,#OFST-5
 342  00b1 a601          	ld	a,#1
 343  00b3 cd0000        	call	c_lgadc
 345  00b6               L37:
 346                     ; 318 		sleep_ticks = SYSTEM_TICKS_PER_SEC;
 348  00b6 ae0064        	ldw	x,#100
 349  00b9 1f0d          	ldw	(OFST-1,sp),x
 350  00bb               L101:
 351                     ; 324         GPIO_WriteReverse(GPIOD, GPIO_PIN_7);
 353  00bb 4b80          	push	#128
 354  00bd ae500f        	ldw	x,#20495
 355  00c0 cd0000        	call	_GPIO_WriteReverse
 357  00c3 84            	pop	a
 358                     ; 325 				GPIO_WriteReverse(GPIOD, GPIO_PIN_2);
 360  00c4 4b04          	push	#4
 361  00c6 ae500f        	ldw	x,#20495
 362  00c9 cd0000        	call	_GPIO_WriteReverse
 364  00cc 84            	pop	a
 365                     ; 326 				GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 367  00cd 4b01          	push	#1
 368  00cf ae500f        	ldw	x,#20495
 369  00d2 cd0000        	call	_GPIO_WriteReverse
 371  00d5 84            	pop	a
 372                     ; 327 				GPIO_WriteReverse(GPIOE, GPIO_PIN_0);
 374  00d6 4b01          	push	#1
 375  00d8 ae5014        	ldw	x,#20500
 376  00db cd0000        	call	_GPIO_WriteReverse
 378  00de 84            	pop	a
 379                     ; 330 				printf("<ADC> %6u %6u %6u %6u %6u %6u %6u %6u %6u %6u </ADC>\r\n",
 379                     ; 331 				Conversion_Values[0],
 379                     ; 332 				Conversion_Values[1],
 379                     ; 333 				Conversion_Values[2],
 379                     ; 334 				Conversion_Values[3],
 379                     ; 335 				Conversion_Values[4],
 379                     ; 336 				Conversion_Values[5],
 379                     ; 337 				Conversion_Values[6],
 379                     ; 338 				Conversion_Values[7],
 379                     ; 339 				Conversion_Values[8],
 379                     ; 340 				Conversion_Values[9]);
 381  00df ce0012        	ldw	x,_Conversion_Values+18
 382  00e2 89            	pushw	x
 383  00e3 ce0010        	ldw	x,_Conversion_Values+16
 384  00e6 89            	pushw	x
 385  00e7 ce000e        	ldw	x,_Conversion_Values+14
 386  00ea 89            	pushw	x
 387  00eb ce000c        	ldw	x,_Conversion_Values+12
 388  00ee 89            	pushw	x
 389  00ef ce000a        	ldw	x,_Conversion_Values+10
 390  00f2 89            	pushw	x
 391  00f3 ce0008        	ldw	x,_Conversion_Values+8
 392  00f6 89            	pushw	x
 393  00f7 ce0006        	ldw	x,_Conversion_Values+6
 394  00fa 89            	pushw	x
 395  00fb ce0004        	ldw	x,_Conversion_Values+4
 396  00fe 89            	pushw	x
 397  00ff ce0002        	ldw	x,_Conversion_Values+2
 398  0102 89            	pushw	x
 399  0103 ce0000        	ldw	x,_Conversion_Values
 400  0106 89            	pushw	x
 401  0107 ae0000        	ldw	x,#L501
 402  010a cd0000        	call	_printf
 404  010d 5b14          	addw	sp,#20
 405                     ; 343         atomTimerDelay(sleep_ticks);
 407  010f 1e0d          	ldw	x,(OFST-1,sp)
 408  0111 cd0000        	call	c_itolx
 410  0114 be02          	ldw	x,c_lreg+2
 411  0116 89            	pushw	x
 412  0117 be00          	ldw	x,c_lreg
 413  0119 89            	pushw	x
 414  011a cd0000        	call	_atomTimerDelay
 416  011d 5b04          	addw	sp,#4
 418  011f 209a          	jra	L101
 630                     	xdef	_main
 631                     	switch	.bss
 632  0000               _Conversion_Values:
 633  0000 000000000000  	ds.b	20
 634                     	xdef	_Conversion_Values
 635  0014               L7_idle_thread_stack:
 636  0014 000000000000  	ds.b	128
 637  0094               L5_main_thread_stack:
 638  0094 000000000000  	ds.b	256
 639  0194               L3_main_tcb:
 640  0194 000000000000  	ds.b	23
 641                     	xref	_GPIO_WriteReverse
 642                     	xref	_GPIO_Init
 643                     	xref	_GPIO_DeInit
 644                     	xref	_CLK_HSIPrescalerConfig
 645                     	xref	_ADC1_StartConversion
 646                     	xref	_ADC1_ITConfig
 647                     	xref	_ADC1_ScanModeCmd
 648                     	xref	_ADC1_Cmd
 649                     	xref	_ADC1_Init
 650                     	xref	_ADC1_DeInit
 651                     	xref	_uart_init
 652                     	xref	_archInitSystemTickTimer
 653                     	xref	_atomThreadStackCheck
 654                     	xref	_atomThreadCreate
 655                     	xref	_atomOSStart
 656                     	xref	_atomOSInit
 657                     	xref	_atomTimerDelay
 658                     	xref	_printf
 659                     .const:	section	.text
 660  0000               L501:
 661  0000 3c4144433e20  	dc.b	"<ADC> %6u %6u %6u "
 662  0012 253675202536  	dc.b	"%6u %6u %6u %6u %6"
 663  0024 752025367520  	dc.b	"u %6u %6u </ADC>",13
 664  0035 0a00          	dc.b	10,0
 665                     	xref.b	c_lreg
 685                     	xref	c_itolx
 686                     	xref	c_lgadc
 687                     	xref	c_lzmp
 688                     	end