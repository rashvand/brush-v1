   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  59                     ; 6 void LCD_STR(const unsigned char *text){
  61                     .text:	section	.text,new
  62  0000               _LCD_STR:
  64  0000 89            	pushw	x
  65       00000000      OFST:	set	0
  68  0001 2015          	jra	L13
  69  0003               L72:
  70                     ; 8 	LCD_DATA(*text++,1);
  72  0003 ae0001        	ldw	x,#1
  73  0006 1601          	ldw	y,(OFST+1,sp)
  74  0008 72a90001      	addw	y,#1
  75  000c 1701          	ldw	(OFST+1,sp),y
  76  000e 72a20001      	subw	y,#1
  77  0012 90f6          	ld	a,(y)
  78  0014 95            	ld	xh,a
  79  0015 cd0000        	call	_LCD_DATA
  81  0018               L13:
  82                     ; 7 	while(*text){
  84  0018 1e01          	ldw	x,(OFST+1,sp)
  85  001a 7d            	tnz	(x)
  86  001b 26e6          	jrne	L72
  87                     ; 10 }
  90  001d 85            	popw	x
  91  001e 81            	ret
 120                     ; 12 void initLCD(void){
 121                     .text:	section	.text,new
 122  0000               _initLCD:
 126                     ; 13 	GPIO_DeInit(LCD_PORT);
 128  0000 ae5005        	ldw	x,#20485
 129  0003 cd0000        	call	_GPIO_DeInit
 131                     ; 14 	GPIO_Init(LCD_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
 133  0006 4be0          	push	#224
 134  0008 4bff          	push	#255
 135  000a ae5005        	ldw	x,#20485
 136  000d cd0000        	call	_GPIO_Init
 138  0010 85            	popw	x
 139                     ; 16 	GPIO_WriteLow(LCD_PORT,LCD_E); //clear enable
 141  0011 4b02          	push	#2
 142  0013 ae5005        	ldw	x,#20485
 143  0016 cd0000        	call	_GPIO_WriteLow
 145  0019 84            	pop	a
 146                     ; 17 	GPIO_WriteLow(LCD_PORT,LCD_RS); //going to write command
 148  001a 4b01          	push	#1
 149  001c ae5005        	ldw	x,#20485
 150  001f cd0000        	call	_GPIO_WriteLow
 152  0022 84            	pop	a
 153                     ; 19 	DelayMS(30); //delay for LCD to initialise.
 155  0023 ae001e        	ldw	x,#30
 156  0026 cd0000        	call	_DelayMS
 158                     ; 20 	LCD_NYB(0x03,0); //Required for initialisation
 160  0029 ae0300        	ldw	x,#768
 161  002c cd0000        	call	_LCD_NYB
 163                     ; 21 	DelayMS(5); //required delay
 165  002f ae0005        	ldw	x,#5
 166  0032 cd0000        	call	_DelayMS
 168                     ; 22 	LCD_NYB(0x03,0); //Required for initialisation
 170  0035 ae0300        	ldw	x,#768
 171  0038 cd0000        	call	_LCD_NYB
 173                     ; 23 	DelayMS(1); //required delay
 175  003b ae0001        	ldw	x,#1
 176  003e cd0000        	call	_DelayMS
 178                     ; 24 	LCD_DATA(0x02,0); //set to 4 bit interface, 1 line and 5*7 font
 180  0041 ae0200        	ldw	x,#512
 181  0044 cd0000        	call	_LCD_DATA
 183                     ; 25 	LCD_DATA(0x28,0); //set to 4 bit interface, 2 line and 5*10 font
 185  0047 ae2800        	ldw	x,#10240
 186  004a cd0000        	call	_LCD_DATA
 188                     ; 26 	LCD_DATA(0x0c,0); //set to 4 bit interface, 2 line and 5*7 font
 190  004d ae0c00        	ldw	x,#3072
 191  0050 cd0000        	call	_LCD_DATA
 193                     ; 27 	LCD_DATA(0x01,0); //clear display
 195  0053 ae0100        	ldw	x,#256
 196  0056 cd0000        	call	_LCD_DATA
 198                     ; 28 	LCD_DATA(0x06,0); //move cursor right after write
 200  0059 ae0600        	ldw	x,#1536
 201  005c cd0000        	call	_LCD_DATA
 203                     ; 29 }
 206  005f 81            	ret
 247                     ; 31 void LCD_DATA(unsigned char data,unsigned char type){
 248                     .text:	section	.text,new
 249  0000               _LCD_DATA:
 251  0000 89            	pushw	x
 252       00000000      OFST:	set	0
 255                     ; 32 	DelayMS(10); //TEST LCD FOR BUSY 
 257  0001 ae000a        	ldw	x,#10
 258  0004 cd0000        	call	_DelayMS
 260                     ; 33 	LCD_NYB(data>>4,type); //WRITE THE UPPER NIBBLE
 262  0007 7b02          	ld	a,(OFST+2,sp)
 263  0009 97            	ld	xl,a
 264  000a 7b01          	ld	a,(OFST+1,sp)
 265  000c 4e            	swap	a
 266  000d a40f          	and	a,#15
 267  000f 95            	ld	xh,a
 268  0010 cd0000        	call	_LCD_NYB
 270                     ; 34 	LCD_NYB(data,type); //WRITE THE LOWER NIBBLE
 272  0013 7b02          	ld	a,(OFST+2,sp)
 273  0015 97            	ld	xl,a
 274  0016 7b01          	ld	a,(OFST+1,sp)
 275  0018 95            	ld	xh,a
 276  0019 cd0000        	call	_LCD_NYB
 278                     ; 35 }
 281  001c 85            	popw	x
 282  001d 81            	ret
 332                     ; 38 void LCD_NYB(unsigned char nyb, char type){
 333                     .text:	section	.text,new
 334  0000               _LCD_NYB:
 336  0000 89            	pushw	x
 337  0001 88            	push	a
 338       00000001      OFST:	set	1
 341                     ; 40 	temp = (nyb<<4) & 0xF0;
 343  0002 9e            	ld	a,xh
 344  0003 97            	ld	xl,a
 345  0004 a610          	ld	a,#16
 346  0006 42            	mul	x,a
 347  0007 9f            	ld	a,xl
 348  0008 a4f0          	and	a,#240
 349  000a 6b01          	ld	(OFST+0,sp),a
 350                     ; 41 	GPIO_Write(LCD_PORT,temp);
 352  000c 7b01          	ld	a,(OFST+0,sp)
 353  000e 88            	push	a
 354  000f ae5005        	ldw	x,#20485
 355  0012 cd0000        	call	_GPIO_Write
 357  0015 84            	pop	a
 358                     ; 43 	if(type == 0){
 360  0016 0d03          	tnz	(OFST+2,sp)
 361  0018 260b          	jrne	L301
 362                     ; 44 		GPIO_WriteLow(LCD_PORT,LCD_RS); //COMMAND MODE
 364  001a 4b01          	push	#1
 365  001c ae5005        	ldw	x,#20485
 366  001f cd0000        	call	_GPIO_WriteLow
 368  0022 84            	pop	a
 370  0023 2009          	jra	L501
 371  0025               L301:
 372                     ; 46 	GPIO_WriteHigh(LCD_PORT,LCD_RS); //CHARACTER/DATA MODE
 374  0025 4b01          	push	#1
 375  0027 ae5005        	ldw	x,#20485
 376  002a cd0000        	call	_GPIO_WriteHigh
 378  002d 84            	pop	a
 379  002e               L501:
 380                     ; 49 	GPIO_WriteHigh(LCD_PORT,LCD_E); //ENABLE LCD DATA LINE
 382  002e 4b02          	push	#2
 383  0030 ae5005        	ldw	x,#20485
 384  0033 cd0000        	call	_GPIO_WriteHigh
 386  0036 84            	pop	a
 387                     ; 50 	DelayMS(1); //SMALL DELAY
 389  0037 ae0001        	ldw	x,#1
 390  003a cd0000        	call	_DelayMS
 392                     ; 51 	GPIO_WriteLow(LCD_PORT,LCD_E); //DISABLE LCD DATA LINE
 394  003d 4b02          	push	#2
 395  003f ae5005        	ldw	x,#20485
 396  0042 cd0000        	call	_GPIO_WriteLow
 398  0045 84            	pop	a
 399                     ; 52 }
 402  0046 5b03          	addw	sp,#3
 403  0048 81            	ret
 436                     ; 54 void LCD_LINE(char line){
 437                     .text:	section	.text,new
 438  0000               _LCD_LINE:
 442                     ; 55 	switch(line){
 445                     ; 62 	break;
 446  0000 4d            	tnz	a
 447  0001 2708          	jreq	L701
 448  0003 4a            	dec	a
 449  0004 2705          	jreq	L701
 450  0006 4a            	dec	a
 451  0007 270a          	jreq	L111
 452  0009 200e          	jra	L131
 453  000b               L701:
 454                     ; 56 	case 0:
 454                     ; 57 	case 1:
 454                     ; 58 	LCD_DATA(0x80,0);
 456  000b ae8000        	ldw	x,#32768
 457  000e cd0000        	call	_LCD_DATA
 459                     ; 59 	break;
 461  0011 2006          	jra	L131
 462  0013               L111:
 463                     ; 60 	case 2:
 463                     ; 61 	LCD_DATA(0xC0,0);
 465  0013 aec000        	ldw	x,#49152
 466  0016 cd0000        	call	_LCD_DATA
 468                     ; 62 	break;
 470  0019               L131:
 471                     ; 64 }
 474  0019 81            	ret
 513                     ; 66 void DelayMS(int delay){
 514                     .text:	section	.text,new
 515  0000               _DelayMS:
 517  0000 89            	pushw	x
 518  0001 89            	pushw	x
 519       00000002      OFST:	set	2
 522                     ; 67 	int nCount = 0;
 525  0002 2017          	jra	L351
 526  0004               L151:
 527                     ; 69 		nCount = 100;
 529  0004 ae0064        	ldw	x,#100
 530  0007 1f01          	ldw	(OFST-1,sp),x
 531  0009               L751:
 532                     ; 71 			nCount--;
 534  0009 1e01          	ldw	x,(OFST-1,sp)
 535  000b 1d0001        	subw	x,#1
 536  000e 1f01          	ldw	(OFST-1,sp),x
 537                     ; 70 		while (nCount != 0){
 539  0010 1e01          	ldw	x,(OFST-1,sp)
 540  0012 26f5          	jrne	L751
 541                     ; 73 		delay--;
 543  0014 1e03          	ldw	x,(OFST+1,sp)
 544  0016 1d0001        	subw	x,#1
 545  0019 1f03          	ldw	(OFST+1,sp),x
 546  001b               L351:
 547                     ; 68 	while (delay != 0){
 549  001b 1e03          	ldw	x,(OFST+1,sp)
 550  001d 26e5          	jrne	L151
 551                     ; 75 }
 554  001f 5b04          	addw	sp,#4
 555  0021 81            	ret
 568                     	xdef	_LCD_STR
 569                     	xdef	_LCD_LINE
 570                     	xdef	_LCD_NYB
 571                     	xdef	_LCD_DATA
 572                     	xdef	_initLCD
 573                     	xdef	_DelayMS
 574                     	xref	_GPIO_WriteLow
 575                     	xref	_GPIO_WriteHigh
 576                     	xref	_GPIO_Write
 577                     	xref	_GPIO_Init
 578                     	xref	_GPIO_DeInit
 597                     	end
