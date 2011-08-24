   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  18                     	switch	.data
  19  0000               L3_timer_queue:
  20  0000 0000          	dc.w	0
  21  0002               L5_system_ticks:
  22  0002 00000000      	dc.l	0
 127                     ; 126 uint8_t atomTimerRegister (ATOM_TIMER *timer_ptr)
 127                     ; 127 {
 129                     .text:	section	.text,new
 130  0000               _atomTimerRegister:
 132  0000 89            	pushw	x
 133  0001 89            	pushw	x
 134       00000002      OFST:	set	2
 137                     ; 132     if ((timer_ptr == NULL) || (timer_ptr->cb_func == NULL)
 137                     ; 133         || (timer_ptr->cb_ticks == 0))
 139  0002 a30000        	cpw	x,#0
 140  0005 270d          	jreq	L37
 142  0007 e601          	ld	a,(1,x)
 143  0009 fa            	or	a,(x)
 144  000a 2708          	jreq	L37
 146  000c 1c0004        	addw	x,#4
 147  000f cd0000        	call	c_lzmp
 149  0012 2609          	jrne	L17
 150  0014               L37:
 151                     ; 136         status = ATOM_ERR_PARAM;
 153  0014 a6c9          	ld	a,#201
 154  0016 6b02          	ld	(OFST+0,sp),a
 156  0018               L77:
 157                     ; 172     return (status);
 159  0018 7b02          	ld	a,(OFST+0,sp)
 162  001a 5b04          	addw	sp,#4
 163  001c 81            	ret
 164  001d               L17:
 165                     ; 141         CRITICAL_START ();
 167  001d 96            	ldw	x,sp
 168  001e 1c0001        	addw	x,#OFST-1
 170  0021 8a            push CC
 171  0022 84            pop a
 172  0023 f7            ld (X),A
 173  0024 9b            sim
 175                     ; 152         if (timer_queue == NULL)
 177  0025 ce0000        	ldw	x,L3_timer_queue
 178  0028 260d          	jrne	L101
 179                     ; 155             timer_ptr->next_timer = NULL;
 181  002a 1e03          	ldw	x,(OFST+1,sp)
 182  002c 905f          	clrw	y
 183  002e ef08          	ldw	(8,x),y
 184                     ; 156             timer_queue = timer_ptr;
 186  0030 1e03          	ldw	x,(OFST+1,sp)
 187  0032 cf0000        	ldw	L3_timer_queue,x
 189  0035 200d          	jra	L301
 190  0037               L101:
 191                     ; 161             timer_ptr->next_timer = timer_queue;
 193  0037 1e03          	ldw	x,(OFST+1,sp)
 194  0039 90ce0000      	ldw	y,L3_timer_queue
 195  003d ef08          	ldw	(8,x),y
 196                     ; 162             timer_queue = timer_ptr;
 198  003f 1e03          	ldw	x,(OFST+1,sp)
 199  0041 cf0000        	ldw	L3_timer_queue,x
 200  0044               L301:
 201                     ; 166         CRITICAL_END ();
 203  0044 96            	ldw	x,sp
 204  0045 1c0001        	addw	x,#OFST-1
 206  0048 f6            ld A,(X)
 207  0049 88            push A
 208  004a 86            pop CC
 210                     ; 169         status = ATOM_OK;
 212  004b 0f02          	clr	(OFST+0,sp)
 213  004d 20c9          	jra	L77
 289                     ; 191 uint8_t atomTimerCancel (ATOM_TIMER *timer_ptr)
 289                     ; 192 {
 290                     .text:	section	.text,new
 291  0000               _atomTimerCancel:
 293  0000 89            	pushw	x
 294  0001 5206          	subw	sp,#6
 295       00000006      OFST:	set	6
 298                     ; 193     uint8_t status = ATOM_ERR_NOT_FOUND;
 300  0003 a6ce          	ld	a,#206
 301  0005 6b02          	ld	(OFST-4,sp),a
 302                     ; 198     if (timer_ptr == NULL)
 304  0007 a30000        	cpw	x,#0
 305  000a 2609          	jrne	L541
 306                     ; 201         status = ATOM_ERR_PARAM;
 308  000c a6c9          	ld	a,#201
 309  000e 6b02          	ld	(OFST-4,sp),a
 311  0010               L741:
 312                     ; 241     return (status);
 314  0010 7b02          	ld	a,(OFST-4,sp)
 317  0012 5b08          	addw	sp,#8
 318  0014 81            	ret
 319  0015               L541:
 320                     ; 206         CRITICAL_START ();
 322  0015 96            	ldw	x,sp
 323  0016 1c0001        	addw	x,#OFST-5
 325  0019 8a            push CC
 326  001a 84            pop a
 327  001b f7            ld (X),A
 328  001c 9b            sim
 330                     ; 209         prev_ptr = next_ptr = timer_queue;
 332  001d ce0000        	ldw	x,L3_timer_queue
 333  0020 1f05          	ldw	(OFST-1,sp),x
 334  0022 1e05          	ldw	x,(OFST-1,sp)
 335  0024 1f03          	ldw	(OFST-3,sp),x
 337  0026 2036          	jra	L551
 338  0028               L151:
 339                     ; 213             if (next_ptr == timer_ptr)
 341  0028 1e05          	ldw	x,(OFST-1,sp)
 342  002a 1307          	cpw	x,(OFST+1,sp)
 343  002c 2626          	jrne	L161
 344                     ; 215                 if (next_ptr == timer_queue)
 346  002e 1e05          	ldw	x,(OFST-1,sp)
 347  0030 c30000        	cpw	x,L3_timer_queue
 348  0033 2609          	jrne	L361
 349                     ; 218                     timer_queue = next_ptr->next_timer;
 351  0035 1e05          	ldw	x,(OFST-1,sp)
 352  0037 ee08          	ldw	x,(8,x)
 353  0039 cf0000        	ldw	L3_timer_queue,x
 355  003c 200b          	jra	L561
 356  003e               L361:
 357                     ; 223                     prev_ptr->next_timer = next_ptr->next_timer;
 359  003e 1e05          	ldw	x,(OFST-1,sp)
 360  0040 1603          	ldw	y,(OFST-3,sp)
 361  0042 89            	pushw	x
 362  0043 ee08          	ldw	x,(8,x)
 363  0045 90ef08        	ldw	(8,y),x
 364  0048 85            	popw	x
 365  0049               L561:
 366                     ; 227                 status = ATOM_OK;
 368  0049 0f02          	clr	(OFST-4,sp)
 369                     ; 228                 break;
 370  004b               L751:
 371                     ; 238         CRITICAL_END ();
 373  004b 96            	ldw	x,sp
 374  004c 1c0001        	addw	x,#OFST-5
 376  004f f6            ld A,(X)
 377  0050 88            push A
 378  0051 86            pop CC
 380  0052 20bc          	jra	L741
 381  0054               L161:
 382                     ; 232             prev_ptr = next_ptr;
 384  0054 1e05          	ldw	x,(OFST-1,sp)
 385  0056 1f03          	ldw	(OFST-3,sp),x
 386                     ; 233             next_ptr = next_ptr->next_timer;
 388  0058 1e05          	ldw	x,(OFST-1,sp)
 389  005a ee08          	ldw	x,(8,x)
 390  005c 1f05          	ldw	(OFST-1,sp),x
 391  005e               L551:
 392                     ; 210         while (next_ptr)
 394  005e 1e05          	ldw	x,(OFST-1,sp)
 395  0060 26c6          	jrne	L151
 396  0062 20e7          	jra	L751
 420                     ; 255 uint32_t atomTimeGet(void)
 420                     ; 256 {
 421                     .text:	section	.text,new
 422  0000               _atomTimeGet:
 426                     ; 257     return (system_ticks);
 428  0000 ae0002        	ldw	x,#L5_system_ticks
 429  0003 cd0000        	call	c_ltor
 433  0006 81            	ret
 466                     ; 277 void atomTimeSet(uint32_t new_time)
 466                     ; 278 {
 467                     .text:	section	.text,new
 468  0000               _atomTimeSet:
 470       00000000      OFST:	set	0
 473                     ; 279     system_ticks = new_time;
 475  0000 1e05          	ldw	x,(OFST+5,sp)
 476  0002 cf0004        	ldw	L5_system_ticks+2,x
 477  0005 1e03          	ldw	x,(OFST+3,sp)
 478  0007 cf0002        	ldw	L5_system_ticks,x
 479                     ; 280 }
 482  000a 81            	ret
 508                     ; 296 void atomTimerTick (void)
 508                     ; 297 {
 509                     .text:	section	.text,new
 510  0000               _atomTimerTick:
 514                     ; 299     if (atomOSStarted)
 516  0000 725d0000      	tnz	_atomOSStarted
 517  0004 270b          	jreq	L322
 518                     ; 302         system_ticks++;
 520  0006 ae0002        	ldw	x,#L5_system_ticks
 521  0009 a601          	ld	a,#1
 522  000b cd0000        	call	c_lgadc
 524                     ; 305         atomTimerCallbacks ();
 526  000e cd0000        	call	L7_atomTimerCallbacks
 528  0011               L322:
 529                     ; 307 }
 532  0011 81            	ret
 745                     ; 328 uint8_t atomTimerDelay (uint32_t ticks)
 745                     ; 329 {
 746                     .text:	section	.text,new
 747  0000               _atomTimerDelay:
 749  0000 5210          	subw	sp,#16
 750       00000010      OFST:	set	16
 753                     ; 337     curr_tcb_ptr = atomCurrentContext();
 755  0002 cd0000        	call	_atomCurrentContext
 757  0005 1f04          	ldw	(OFST-12,sp),x
 758                     ; 340     if (ticks == 0)
 760  0007 96            	ldw	x,sp
 761  0008 1c0013        	addw	x,#OFST+3
 762  000b cd0000        	call	c_lzmp
 764  000e 2606          	jrne	L153
 765                     ; 343         status = ATOM_ERR_PARAM;
 767  0010 a6c9          	ld	a,#201
 768  0012 6b10          	ld	(OFST+0,sp),a
 770  0014 205c          	jra	L353
 771  0016               L153:
 772                     ; 347     else if (curr_tcb_ptr == NULL)
 774  0016 1e04          	ldw	x,(OFST-12,sp)
 775  0018 2606          	jrne	L553
 776                     ; 350         status = ATOM_ERR_CONTEXT;
 778  001a a6c8          	ld	a,#200
 779  001c 6b10          	ld	(OFST+0,sp),a
 781  001e 2052          	jra	L353
 782  0020               L553:
 783                     ; 357         CRITICAL_START ();
 785  0020 96            	ldw	x,sp
 786  0021 1c0003        	addw	x,#OFST-13
 788  0024 8a            push CC
 789  0025 84            pop a
 790  0026 f7            ld (X),A
 791  0027 9b            sim
 793                     ; 360         curr_tcb_ptr->suspended = TRUE;
 795  0028 1e04          	ldw	x,(OFST-12,sp)
 796  002a a601          	ld	a,#1
 797  002c e70d          	ld	(13,x),a
 798                     ; 365         timer_data.tcb_ptr = curr_tcb_ptr;
 800  002e 1e04          	ldw	x,(OFST-12,sp)
 801  0030 1f01          	ldw	(OFST-15,sp),x
 802                     ; 368         timer_cb.cb_func = atomTimerDelayCallback;
 804  0032 ae0000        	ldw	x,#L11_atomTimerDelayCallback
 805  0035 1f06          	ldw	(OFST-10,sp),x
 806                     ; 369         timer_cb.cb_data = (POINTER)&timer_data;
 808  0037 96            	ldw	x,sp
 809  0038 1c0001        	addw	x,#OFST-15
 810  003b 1f08          	ldw	(OFST-8,sp),x
 811                     ; 370         timer_cb.cb_ticks = ticks;
 813  003d 1e15          	ldw	x,(OFST+5,sp)
 814  003f 1f0c          	ldw	(OFST-4,sp),x
 815  0041 1e13          	ldw	x,(OFST+3,sp)
 816  0043 1f0a          	ldw	(OFST-6,sp),x
 817                     ; 373         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 819  0045 96            	ldw	x,sp
 820  0046 1c0006        	addw	x,#OFST-10
 821  0049 1604          	ldw	y,(OFST-12,sp)
 822  004b 90ef0f        	ldw	(15,y),x
 823                     ; 376         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 825  004e 96            	ldw	x,sp
 826  004f 1c0006        	addw	x,#OFST-10
 827  0052 cd0000        	call	_atomTimerRegister
 829  0055 4d            	tnz	a
 830  0056 270d          	jreq	L163
 831                     ; 379             CRITICAL_END ();
 833  0058 96            	ldw	x,sp
 834  0059 1c0003        	addw	x,#OFST-13
 836  005c f6            ld A,(X)
 837  005d 88            push A
 838  005e 86            pop CC
 840                     ; 382             status = ATOM_ERR_TIMER;
 842  005f a6cd          	ld	a,#205
 843  0061 6b10          	ld	(OFST+0,sp),a
 845  0063 200d          	jra	L353
 846  0065               L163:
 847                     ; 387             CRITICAL_END ();
 849  0065 96            	ldw	x,sp
 850  0066 1c0003        	addw	x,#OFST-13
 852  0069 f6            ld A,(X)
 853  006a 88            push A
 854  006b 86            pop CC
 856                     ; 390             status = ATOM_OK;
 858  006c 0f10          	clr	(OFST+0,sp)
 859                     ; 393             atomSched (FALSE);
 861  006e 4f            	clr	a
 862  006f cd0000        	call	_atomSched
 864  0072               L353:
 865                     ; 397     return (status);
 867  0072 7b10          	ld	a,(OFST+0,sp)
 870  0074 5b10          	addw	sp,#16
 871  0076 81            	ret
 921                     ; 410 static void atomTimerCallbacks (void)
 921                     ; 411 {
 922                     .text:	section	.text,new
 923  0000               L7_atomTimerCallbacks:
 925  0000 5204          	subw	sp,#4
 926       00000004      OFST:	set	4
 929                     ; 418     prev_ptr = next_ptr = timer_queue;
 931  0002 ce0000        	ldw	x,L3_timer_queue
 932  0005 1f03          	ldw	(OFST-1,sp),x
 933  0007 1e03          	ldw	x,(OFST-1,sp)
 934  0009 1f01          	ldw	(OFST-3,sp),x
 936  000b 2047          	jra	L714
 937  000d               L314:
 938                     ; 422         if (--(next_ptr->cb_ticks) == 0)
 940  000d 1e03          	ldw	x,(OFST-1,sp)
 941  000f 1c0004        	addw	x,#4
 942  0012 a601          	ld	a,#1
 943  0014 cd0000        	call	c_lgsbc
 945  0017 cd0000        	call	c_lzmp
 947  001a 262e          	jrne	L324
 948                     ; 425             if (next_ptr == timer_queue)
 950  001c 1e03          	ldw	x,(OFST-1,sp)
 951  001e c30000        	cpw	x,L3_timer_queue
 952  0021 2609          	jrne	L524
 953                     ; 428                 timer_queue = next_ptr->next_timer;
 955  0023 1e03          	ldw	x,(OFST-1,sp)
 956  0025 ee08          	ldw	x,(8,x)
 957  0027 cf0000        	ldw	L3_timer_queue,x
 959  002a 200b          	jra	L724
 960  002c               L524:
 961                     ; 433                 prev_ptr->next_timer = next_ptr->next_timer;
 963  002c 1e03          	ldw	x,(OFST-1,sp)
 964  002e 1601          	ldw	y,(OFST-3,sp)
 965  0030 89            	pushw	x
 966  0031 ee08          	ldw	x,(8,x)
 967  0033 90ef08        	ldw	(8,y),x
 968  0036 85            	popw	x
 969  0037               L724:
 970                     ; 437             if (next_ptr->cb_func)
 972  0037 1e03          	ldw	x,(OFST-1,sp)
 973  0039 e601          	ld	a,(1,x)
 974  003b fa            	or	a,(x)
 975  003c 2710          	jreq	L334
 976                     ; 439                 next_ptr->cb_func (next_ptr->cb_data);
 978  003e 1e03          	ldw	x,(OFST-1,sp)
 979  0040 ee02          	ldw	x,(2,x)
 980  0042 1603          	ldw	y,(OFST-1,sp)
 981  0044 90fe          	ldw	y,(y)
 982  0046 90fd          	call	(y)
 984  0048 2004          	jra	L334
 985  004a               L324:
 986                     ; 453             prev_ptr = next_ptr;
 988  004a 1e03          	ldw	x,(OFST-1,sp)
 989  004c 1f01          	ldw	(OFST-3,sp),x
 990  004e               L334:
 991                     ; 457         next_ptr = next_ptr->next_timer;
 993  004e 1e03          	ldw	x,(OFST-1,sp)
 994  0050 ee08          	ldw	x,(8,x)
 995  0052 1f03          	ldw	(OFST-1,sp),x
 996  0054               L714:
 997                     ; 419     while (next_ptr)
 999  0054 1e03          	ldw	x,(OFST-1,sp)
1000  0056 26b5          	jrne	L314
1001                     ; 461 }
1004  0058 5b04          	addw	sp,#4
1005  005a 81            	ret
1062                     ; 475 static void atomTimerDelayCallback (POINTER cb_data)
1062                     ; 476 {
1063                     .text:	section	.text,new
1064  0000               L11_atomTimerDelayCallback:
1066  0000 5203          	subw	sp,#3
1067       00000003      OFST:	set	3
1070                     ; 481     timer_data_ptr = (DELAY_TIMER *)cb_data;
1072  0002 1f02          	ldw	(OFST-1,sp),x
1073                     ; 484     if (timer_data_ptr)
1075  0004 1e02          	ldw	x,(OFST-1,sp)
1076  0006 271a          	jreq	L364
1077                     ; 487         CRITICAL_START ();
1079  0008 96            	ldw	x,sp
1080  0009 1c0001        	addw	x,#OFST-2
1082  000c 8a            push CC
1083  000d 84            pop a
1084  000e f7            ld (X),A
1085  000f 9b            sim
1087                     ; 490         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1089  0010 1e02          	ldw	x,(OFST-1,sp)
1090  0012 fe            	ldw	x,(x)
1091  0013 89            	pushw	x
1092  0014 ae0000        	ldw	x,#_tcbReadyQ
1093  0017 cd0000        	call	_tcbEnqueuePriority
1095  001a 85            	popw	x
1096                     ; 493         CRITICAL_END ();
1098  001b 96            	ldw	x,sp
1099  001c 1c0001        	addw	x,#OFST-2
1101  001f f6            ld A,(X)
1102  0020 88            push A
1103  0021 86            pop CC
1105  0022               L364:
1106                     ; 501 }
1109  0022 5b03          	addw	sp,#3
1110  0024 81            	ret
1144                     	xdef	_atomTimerTick
1145                     	xref	_atomCurrentContext
1146                     	xref	_tcbEnqueuePriority
1147                     	xref	_atomSched
1148                     	xref	_atomOSStarted
1149                     	xref	_tcbReadyQ
1150                     	xdef	_atomTimeSet
1151                     	xdef	_atomTimeGet
1152                     	xdef	_atomTimerDelay
1153                     	xdef	_atomTimerCancel
1154                     	xdef	_atomTimerRegister
1173                     	xref	c_lgsbc
1174                     	xref	c_lgadc
1175                     	xref	c_ltor
1176                     	xref	c_lzmp
1177                     	end
