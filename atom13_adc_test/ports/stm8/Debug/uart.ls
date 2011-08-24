   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  66                     ; 20 int uart_init(uint32_t baudrate)
  66                     ; 21 {
  68                     .text:	section	.text,new
  69  0000               _uart_init:
  71  0000 89            	pushw	x
  72       00000002      OFST:	set	2
  75                     ; 28   UART2_DeInit();
  77  0001 cd0000        	call	_UART2_DeInit
  79                     ; 29   UART2_Init (baudrate, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO,
  79                     ; 30               UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);
  81  0004 4b0c          	push	#12
  82  0006 4b80          	push	#128
  83  0008 4b00          	push	#0
  84  000a 4b00          	push	#0
  85  000c 4b00          	push	#0
  86  000e 1e0c          	ldw	x,(OFST+10,sp)
  87  0010 89            	pushw	x
  88  0011 1e0c          	ldw	x,(OFST+10,sp)
  89  0013 89            	pushw	x
  90  0014 cd0000        	call	_UART2_Init
  92  0017 5b09          	addw	sp,#9
  93                     ; 33   if (atomMutexCreate (&uart_mutex) != ATOM_OK)
  95  0019 ae0000        	ldw	x,#L3_uart_mutex
  96  001c cd0000        	call	_atomMutexCreate
  98  001f 4d            	tnz	a
  99  0020 2707          	jreq	L13
 100                     ; 35     status = -1;
 102  0022 aeffff        	ldw	x,#65535
 103  0025 1f01          	ldw	(OFST-1,sp),x
 105  0027 2003          	jra	L33
 106  0029               L13:
 107                     ; 39     status = 0;
 109  0029 5f            	clrw	x
 110  002a 1f01          	ldw	(OFST-1,sp),x
 111  002c               L33:
 112                     ; 43   return (status);
 114  002c 1e01          	ldw	x,(OFST-1,sp)
 117  002e 5b02          	addw	sp,#2
 118  0030 81            	ret
 156                     ; 56 char uart_putchar (char c)
 156                     ; 57 {
 157                     .text:	section	.text,new
 158  0000               _uart_putchar:
 160  0000 88            	push	a
 161       00000000      OFST:	set	0
 164                     ; 59     if (atomMutexGet(&uart_mutex, 0) == ATOM_OK)
 166  0001 ae0000        	ldw	x,#0
 167  0004 89            	pushw	x
 168  0005 ae0000        	ldw	x,#0
 169  0008 89            	pushw	x
 170  0009 ae0000        	ldw	x,#L3_uart_mutex
 171  000c cd0000        	call	_atomMutexGet
 173  000f 5b04          	addw	sp,#4
 174  0011 4d            	tnz	a
 175  0012 261f          	jrne	L15
 176                     ; 62         if (c == '\n')
 178  0014 7b01          	ld	a,(OFST+1,sp)
 179  0016 a10a          	cp	a,#10
 180  0018 2605          	jrne	L35
 181                     ; 63             putchar('\r');
 183  001a a60d          	ld	a,#13
 184  001c cd0000        	call	_putchar
 186  001f               L35:
 187                     ; 66         UART2_SendData8(c);
 189  001f 7b01          	ld	a,(OFST+1,sp)
 190  0021 cd0000        	call	_UART2_SendData8
 193  0024               L75:
 194                     ; 69         while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET)
 196  0024 ae0080        	ldw	x,#128
 197  0027 cd0000        	call	_UART2_GetFlagStatus
 199  002a 4d            	tnz	a
 200  002b 27f7          	jreq	L75
 201                     ; 73         atomMutexPut(&uart_mutex);
 203  002d ae0000        	ldw	x,#L3_uart_mutex
 204  0030 cd0000        	call	_atomMutexPut
 206  0033               L15:
 207                     ; 77     return (c);
 209  0033 7b01          	ld	a,(OFST+1,sp)
 212  0035 5b01          	addw	sp,#1
 213  0037 81            	ret
 246                     ; 92 char putchar (char c)
 246                     ; 93 {
 247                     .text:	section	.text,new
 248  0000               _putchar:
 252                     ; 94     return (uart_putchar(c));
 254  0000 cd0000        	call	_uart_putchar
 258  0003 81            	ret
 478                     	xdef	_uart_putchar
 479                     	switch	.bss
 480  0000               L3_uart_mutex:
 481  0000 0000000000    	ds.b	5
 482                     	xdef	_uart_init
 483                     	xref	_atomMutexPut
 484                     	xref	_atomMutexGet
 485                     	xref	_atomMutexCreate
 486                     	xref	_UART2_GetFlagStatus
 487                     	xref	_UART2_SendData8
 488                     	xref	_UART2_Init
 489                     	xref	_UART2_DeInit
 490                     	xdef	_putchar
 510                     	end
