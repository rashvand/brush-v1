   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  48                     ; 34 void Init_MC_Port(void)
  48                     ; 35 {
  50                     	switch	.text
  51  0000               _Init_MC_Port:
  55                     ; 38 		GPIO_Init(MCO0_PORT, MCO0_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  57  0000 4bc0          	push	#192
  58  0002 4b01          	push	#1
  59  0004 ae5005        	ldw	x,#20485
  60  0007 cd0000        	call	_GPIO_Init
  62  000a 85            	popw	x
  63                     ; 44 		GPIO_Init(MCO1_PORT, MCO1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  65  000b 4bc0          	push	#192
  66  000d 4b02          	push	#2
  67  000f ae500a        	ldw	x,#20490
  68  0012 cd0000        	call	_GPIO_Init
  70  0015 85            	popw	x
  71                     ; 50 		GPIO_Init(MCO2_PORT, MCO2_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  73  0016 4bc0          	push	#192
  74  0018 4b02          	push	#2
  75  001a ae5005        	ldw	x,#20485
  76  001d cd0000        	call	_GPIO_Init
  78  0020 85            	popw	x
  79                     ; 56 		GPIO_Init(MCO3_PORT, MCO3_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  81  0021 4bc0          	push	#192
  82  0023 4b04          	push	#4
  83  0025 ae500a        	ldw	x,#20490
  84  0028 cd0000        	call	_GPIO_Init
  86  002b 85            	popw	x
  87                     ; 62 		GPIO_Init(MCO4_PORT, MCO4_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  89  002c 4bc0          	push	#192
  90  002e 4b04          	push	#4
  91  0030 ae5005        	ldw	x,#20485
  92  0033 cd0000        	call	_GPIO_Init
  94  0036 85            	popw	x
  95                     ; 68 		GPIO_Init(MCO5_PORT, MCO5_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  97  0037 4bc0          	push	#192
  98  0039 4b08          	push	#8
  99  003b ae500a        	ldw	x,#20490
 100  003e cd0000        	call	_GPIO_Init
 102  0041 85            	popw	x
 103                     ; 74 }
 106  0042 81            	ret	
 130                     ; 76 void Init_DEBUG_Port(void)
 130                     ; 77 {
 131                     	switch	.text
 132  0043               _Init_DEBUG_Port:
 136                     ; 78 	GPIO_Init(DEBUG0_PORT, DEBUG0_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 138  0043 4bc0          	push	#192
 139  0045 4b80          	push	#128
 140  0047 ae500f        	ldw	x,#20495
 141  004a cd0000        	call	_GPIO_Init
 143  004d 85            	popw	x
 144                     ; 79 	GPIO_Init(DEBUG1_PORT, DEBUG1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 146  004e 4bc0          	push	#192
 147  0050 4b04          	push	#4
 148  0052 ae500f        	ldw	x,#20495
 149  0055 cd0000        	call	_GPIO_Init
 151  0058 85            	popw	x
 152                     ; 80 	GPIO_Init(DEBUG2_PORT, DEBUG2_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 154  0059 4bc0          	push	#192
 155  005b 4b01          	push	#1
 156  005d ae500f        	ldw	x,#20495
 157  0060 cd0000        	call	_GPIO_Init
 159  0063 85            	popw	x
 160                     ; 81 	GPIO_Init(DEBUG3_PORT, DEBUG3_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 162  0064 4bc0          	push	#192
 163  0066 4b01          	push	#1
 164  0068 ae5014        	ldw	x,#20500
 165  006b cd0000        	call	_GPIO_Init
 167  006e 85            	popw	x
 168                     ; 82 }
 171  006f 81            	ret	
 196                     ; 95 void dev_portInit(void)
 196                     ; 96 {
 197                     	switch	.text
 198  0070               _dev_portInit:
 202                     ; 97 	Init_MC_Port();
 204  0070 ad8e          	call	_Init_MC_Port
 206                     ; 98 	Init_DEBUG_Port();
 209                     ; 102 }
 212  0072 20cf          	jp	_Init_DEBUG_Port
 225                     	xdef	_Init_DEBUG_Port
 226                     	xdef	_Init_MC_Port
 227                     	xdef	_dev_portInit
 228                     	xref	_GPIO_Init
 247                     	end
