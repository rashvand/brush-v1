   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
 324                     ; 146 uint8_t atomQueueCreate (ATOM_QUEUE *qptr, uint8_t *buff_ptr, uint32_t unit_size, uint32_t max_num_msgs)
 324                     ; 147 {
 326                     .text:	section	.text,new
 327  0000               _atomQueueCreate:
 329  0000 89            	pushw	x
 330  0001 88            	push	a
 331       00000001      OFST:	set	1
 334                     ; 151     if ((qptr == NULL) || (buff_ptr == NULL))
 336  0002 a30000        	cpw	x,#0
 337  0005 2704          	jreq	L112
 339  0007 1e06          	ldw	x,(OFST+5,sp)
 340  0009 2609          	jrne	L702
 341  000b               L112:
 342                     ; 154         status = ATOM_ERR_PARAM;
 344  000b a6c9          	ld	a,#201
 345  000d 6b01          	ld	(OFST+0,sp),a
 347  000f               L312:
 348                     ; 181     return (status);
 350  000f 7b01          	ld	a,(OFST+0,sp)
 353  0011 5b03          	addw	sp,#3
 354  0013 81            	ret
 355  0014               L702:
 356                     ; 156     else if ((unit_size == 0) || (max_num_msgs == 0))
 358  0014 96            	ldw	x,sp
 359  0015 1c0008        	addw	x,#OFST+7
 360  0018 cd0000        	call	c_lzmp
 362  001b 2709          	jreq	L712
 364  001d 96            	ldw	x,sp
 365  001e 1c000c        	addw	x,#OFST+11
 366  0021 cd0000        	call	c_lzmp
 368  0024 2606          	jrne	L512
 369  0026               L712:
 370                     ; 159         status = ATOM_ERR_PARAM;
 372  0026 a6c9          	ld	a,#201
 373  0028 6b01          	ld	(OFST+0,sp),a
 375  002a 20e3          	jra	L312
 376  002c               L512:
 377                     ; 164         qptr->buff_ptr = buff_ptr;
 379  002c 1e02          	ldw	x,(OFST+1,sp)
 380  002e 1606          	ldw	y,(OFST+5,sp)
 381  0030 ef04          	ldw	(4,x),y
 382                     ; 165         qptr->unit_size = unit_size;
 384  0032 1e02          	ldw	x,(OFST+1,sp)
 385  0034 7b0b          	ld	a,(OFST+10,sp)
 386  0036 e709          	ld	(9,x),a
 387  0038 7b0a          	ld	a,(OFST+9,sp)
 388  003a e708          	ld	(8,x),a
 389  003c 7b09          	ld	a,(OFST+8,sp)
 390  003e e707          	ld	(7,x),a
 391  0040 7b08          	ld	a,(OFST+7,sp)
 392  0042 e706          	ld	(6,x),a
 393                     ; 166         qptr->max_num_msgs = max_num_msgs;
 395  0044 1e02          	ldw	x,(OFST+1,sp)
 396  0046 7b0f          	ld	a,(OFST+14,sp)
 397  0048 e70d          	ld	(13,x),a
 398  004a 7b0e          	ld	a,(OFST+13,sp)
 399  004c e70c          	ld	(12,x),a
 400  004e 7b0d          	ld	a,(OFST+12,sp)
 401  0050 e70b          	ld	(11,x),a
 402  0052 7b0c          	ld	a,(OFST+11,sp)
 403  0054 e70a          	ld	(10,x),a
 404                     ; 169         qptr->putSuspQ = NULL;
 406  0056 1e02          	ldw	x,(OFST+1,sp)
 407  0058 905f          	clrw	y
 408  005a ff            	ldw	(x),y
 409                     ; 170         qptr->getSuspQ = NULL;
 411  005b 1e02          	ldw	x,(OFST+1,sp)
 412  005d 905f          	clrw	y
 413  005f ef02          	ldw	(2,x),y
 414                     ; 173         qptr->insert_index = 0;
 416  0061 1e02          	ldw	x,(OFST+1,sp)
 417  0063 a600          	ld	a,#0
 418  0065 e711          	ld	(17,x),a
 419  0067 a600          	ld	a,#0
 420  0069 e710          	ld	(16,x),a
 421  006b a600          	ld	a,#0
 422  006d e70f          	ld	(15,x),a
 423  006f a600          	ld	a,#0
 424  0071 e70e          	ld	(14,x),a
 425                     ; 174         qptr->remove_index = 0;
 427  0073 1e02          	ldw	x,(OFST+1,sp)
 428  0075 a600          	ld	a,#0
 429  0077 e715          	ld	(21,x),a
 430  0079 a600          	ld	a,#0
 431  007b e714          	ld	(20,x),a
 432  007d a600          	ld	a,#0
 433  007f e713          	ld	(19,x),a
 434  0081 a600          	ld	a,#0
 435  0083 e712          	ld	(18,x),a
 436                     ; 175         qptr->num_msgs_stored = 0;
 438  0085 1e02          	ldw	x,(OFST+1,sp)
 439  0087 a600          	ld	a,#0
 440  0089 e719          	ld	(25,x),a
 441  008b a600          	ld	a,#0
 442  008d e718          	ld	(24,x),a
 443  008f a600          	ld	a,#0
 444  0091 e717          	ld	(23,x),a
 445  0093 a600          	ld	a,#0
 446  0095 e716          	ld	(22,x),a
 447                     ; 178         status = ATOM_OK;
 449  0097 0f01          	clr	(OFST+0,sp)
 450  0099 cc000f        	jra	L312
 527                     ; 205 uint8_t atomQueueDelete (ATOM_QUEUE *qptr)
 527                     ; 206 {
 528                     .text:	section	.text,new
 529  0000               _atomQueueDelete:
 531  0000 89            	pushw	x
 532  0001 5205          	subw	sp,#5
 533       00000005      OFST:	set	5
 536                     ; 210     uint8_t woken_threads = FALSE;
 538  0003 0f01          	clr	(OFST-4,sp)
 539                     ; 213     if (qptr == NULL)
 541  0005 a30000        	cpw	x,#0
 542  0008 2608          	jrne	L752
 543                     ; 216         status = ATOM_ERR_PARAM;
 545  000a a6c9          	ld	a,#201
 546  000c 6b02          	ld	(OFST-3,sp),a
 548  000e aca300a3      	jpf	L162
 549  0012               L752:
 550                     ; 221         status = ATOM_OK;
 552  0012 0f02          	clr	(OFST-3,sp)
 553  0014               L362:
 554                     ; 227             CRITICAL_START ();
 556  0014 96            	ldw	x,sp
 557  0015 1c0003        	addw	x,#OFST-2
 559  0018 8a            push CC
 560  0019 84            pop a
 561  001a f7            ld (X),A
 562  001b 9b            sim
 564                     ; 230             if (((tcb_ptr = tcbDequeueHead (&qptr->getSuspQ)) != NULL)
 564                     ; 231                 || ((tcb_ptr = tcbDequeueHead (&qptr->putSuspQ)) != NULL))
 566  001c 1e06          	ldw	x,(OFST+1,sp)
 567  001e 5c            	incw	x
 568  001f 5c            	incw	x
 569  0020 cd0000        	call	_tcbDequeueHead
 571  0023 1f04          	ldw	(OFST-1,sp),x
 572  0025 1e04          	ldw	x,(OFST-1,sp)
 573  0027 260b          	jrne	L172
 575  0029 1e06          	ldw	x,(OFST+1,sp)
 576  002b cd0000        	call	_tcbDequeueHead
 578  002e 1f04          	ldw	(OFST-1,sp),x
 579  0030 1e04          	ldw	x,(OFST-1,sp)
 580  0032 2766          	jreq	L762
 581  0034               L172:
 582                     ; 236                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 584  0034 1e04          	ldw	x,(OFST-1,sp)
 585  0036 a6ca          	ld	a,#202
 586  0038 e70e          	ld	(14,x),a
 587                     ; 239                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 589  003a 1e04          	ldw	x,(OFST-1,sp)
 590  003c 89            	pushw	x
 591  003d ae0000        	ldw	x,#_tcbReadyQ
 592  0040 cd0000        	call	_tcbEnqueuePriority
 594  0043 85            	popw	x
 595  0044 4d            	tnz	a
 596  0045 270d          	jreq	L372
 597                     ; 242                     CRITICAL_END ();
 599  0047 96            	ldw	x,sp
 600  0048 1c0003        	addw	x,#OFST-2
 602  004b f6            ld A,(X)
 603  004c 88            push A
 604  004d 86            pop CC
 606                     ; 245                     status = ATOM_ERR_QUEUE;
 608  004e a6cc          	ld	a,#204
 609  0050 6b02          	ld	(OFST-3,sp),a
 610                     ; 246                     break;
 612  0052 201d          	jra	L562
 613  0054               L372:
 614                     ; 250                 if (tcb_ptr->suspend_timo_cb)
 616  0054 1e04          	ldw	x,(OFST-1,sp)
 617  0056 e610          	ld	a,(16,x)
 618  0058 ea0f          	or	a,(15,x)
 619  005a 272f          	jreq	L572
 620                     ; 253                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 622  005c 1e04          	ldw	x,(OFST-1,sp)
 623  005e ee0f          	ldw	x,(15,x)
 624  0060 cd0000        	call	_atomTimerCancel
 626  0063 4d            	tnz	a
 627  0064 271f          	jreq	L772
 628                     ; 256                         CRITICAL_END ();
 630  0066 96            	ldw	x,sp
 631  0067 1c0003        	addw	x,#OFST-2
 633  006a f6            ld A,(X)
 634  006b 88            push A
 635  006c 86            pop CC
 637                     ; 259                         status = ATOM_ERR_TIMER;
 639  006d a6cd          	ld	a,#205
 640  006f 6b02          	ld	(OFST-3,sp),a
 641                     ; 260                         break;
 642  0071               L562:
 643                     ; 285         if (woken_threads == TRUE)
 645  0071 7b01          	ld	a,(OFST-4,sp)
 646  0073 a101          	cp	a,#1
 647  0075 262c          	jrne	L162
 648                     ; 291             if (atomCurrentContext())
 650  0077 cd0000        	call	_atomCurrentContext
 652  007a a30000        	cpw	x,#0
 653  007d 2724          	jreq	L162
 654                     ; 292                 atomSched (FALSE);
 656  007f 4f            	clr	a
 657  0080 cd0000        	call	_atomSched
 659  0083 201e          	jra	L162
 660  0085               L772:
 661                     ; 264                     tcb_ptr->suspend_timo_cb = NULL;
 663  0085 1e04          	ldw	x,(OFST-1,sp)
 664  0087 905f          	clrw	y
 665  0089 ef0f          	ldw	(15,x),y
 666  008b               L572:
 667                     ; 269                 CRITICAL_END ();
 669  008b 96            	ldw	x,sp
 670  008c 1c0003        	addw	x,#OFST-2
 672  008f f6            ld A,(X)
 673  0090 88            push A
 674  0091 86            pop CC
 676                     ; 272                 woken_threads = TRUE;
 678  0092 a601          	ld	a,#1
 679  0094 6b01          	ld	(OFST-4,sp),a
 681  0096 ac140014      	jpf	L362
 682  009a               L762:
 683                     ; 279                 CRITICAL_END ();
 685  009a 96            	ldw	x,sp
 686  009b 1c0003        	addw	x,#OFST-2
 688  009e f6            ld A,(X)
 689  009f 88            push A
 690  00a0 86            pop CC
 692                     ; 280                 break;
 694  00a1 20ce          	jra	L562
 695  00a3               L162:
 696                     ; 296     return (status);
 698  00a3 7b02          	ld	a,(OFST-3,sp)
 701  00a5 5b07          	addw	sp,#7
 702  00a7 81            	ret
 855                     ; 337 uint8_t atomQueueGet (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
 855                     ; 338 {
 856                     .text:	section	.text,new
 857  0000               _atomQueueGet:
 859  0000 89            	pushw	x
 860  0001 5214          	subw	sp,#20
 861       00000014      OFST:	set	20
 864                     ; 346     if ((qptr == NULL) || (msgptr == NULL))
 866  0003 a30000        	cpw	x,#0
 867  0006 2704          	jreq	L704
 869  0008 1e1d          	ldw	x,(OFST+9,sp)
 870  000a 2609          	jrne	L504
 871  000c               L704:
 872                     ; 349         status = ATOM_ERR_PARAM;
 874  000c a6c9          	ld	a,#201
 875  000e 6b14          	ld	(OFST+0,sp),a
 877  0010               L114:
 878                     ; 502     return (status);
 880  0010 7b14          	ld	a,(OFST+0,sp)
 883  0012 5b16          	addw	sp,#22
 884  0014 81            	ret
 885  0015               L504:
 886                     ; 354         CRITICAL_START ();
 888  0015 96            	ldw	x,sp
 889  0016 1c0011        	addw	x,#OFST-3
 891  0019 8a            push CC
 892  001a 84            pop a
 893  001b f7            ld (X),A
 894  001c 9b            sim
 896                     ; 357         if (qptr->num_msgs_stored == 0)
 898  001d 1e15          	ldw	x,(OFST+1,sp)
 899  001f 1c0016        	addw	x,#22
 900  0022 cd0000        	call	c_lzmp
 902  0025 2703          	jreq	L21
 903  0027 cc0120        	jp	L314
 904  002a               L21:
 905                     ; 360             if (timeout >= 0)
 907  002a 9c            	rvf
 908  002b 9c            	rvf
 909  002c 0d19          	tnz	(OFST+5,sp)
 910  002e 2e03          	jrsge	L41
 911  0030 cc0111        	jp	L514
 912  0033               L41:
 913                     ; 365                 curr_tcb_ptr = atomCurrentContext();
 915  0033 cd0000        	call	_atomCurrentContext
 917  0036 1f12          	ldw	(OFST-2,sp),x
 918                     ; 368                 if (curr_tcb_ptr)
 920  0038 1e12          	ldw	x,(OFST-2,sp)
 921  003a 2603          	jrne	L61
 922  003c cc0102        	jp	L714
 923  003f               L61:
 924                     ; 371                     if (tcbEnqueuePriority (&qptr->getSuspQ, curr_tcb_ptr) == ATOM_OK)
 926  003f 1e12          	ldw	x,(OFST-2,sp)
 927  0041 89            	pushw	x
 928  0042 1e17          	ldw	x,(OFST+3,sp)
 929  0044 5c            	incw	x
 930  0045 5c            	incw	x
 931  0046 cd0000        	call	_tcbEnqueuePriority
 933  0049 85            	popw	x
 934  004a 4d            	tnz	a
 935  004b 2703          	jreq	L02
 936  004d cc00f3        	jp	L124
 937  0050               L02:
 938                     ; 374                         curr_tcb_ptr->suspended = TRUE;
 940  0050 1e12          	ldw	x,(OFST-2,sp)
 941  0052 a601          	ld	a,#1
 942  0054 e70d          	ld	(13,x),a
 943                     ; 377                         status = ATOM_OK;
 945  0056 0f14          	clr	(OFST+0,sp)
 946                     ; 380                         if (timeout)
 948  0058 96            	ldw	x,sp
 949  0059 1c0019        	addw	x,#OFST+5
 950  005c cd0000        	call	c_lzmp
 952  005f 274f          	jreq	L324
 953                     ; 386                             timer_data.tcb_ptr = curr_tcb_ptr;
 955  0061 1e12          	ldw	x,(OFST-2,sp)
 956  0063 1f01          	ldw	(OFST-19,sp),x
 957                     ; 387                             timer_data.queue_ptr = qptr;
 959  0065 1e15          	ldw	x,(OFST+1,sp)
 960  0067 1f03          	ldw	(OFST-17,sp),x
 961                     ; 388                             timer_data.suspQ = &qptr->getSuspQ;
 963  0069 1e15          	ldw	x,(OFST+1,sp)
 964  006b 5c            	incw	x
 965  006c 5c            	incw	x
 966  006d 1f05          	ldw	(OFST-15,sp),x
 967                     ; 391                             timer_cb.cb_func = atomQueueTimerCallback;
 969  006f ae0000        	ldw	x,#L7_atomQueueTimerCallback
 970  0072 1f07          	ldw	(OFST-13,sp),x
 971                     ; 392                             timer_cb.cb_data = (POINTER)&timer_data;
 973  0074 96            	ldw	x,sp
 974  0075 1c0001        	addw	x,#OFST-19
 975  0078 1f09          	ldw	(OFST-11,sp),x
 976                     ; 393                             timer_cb.cb_ticks = timeout;
 978  007a 1e1b          	ldw	x,(OFST+7,sp)
 979  007c 1f0d          	ldw	(OFST-7,sp),x
 980  007e 1e19          	ldw	x,(OFST+5,sp)
 981  0080 1f0b          	ldw	(OFST-9,sp),x
 982                     ; 400                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 984  0082 96            	ldw	x,sp
 985  0083 1c0007        	addw	x,#OFST-13
 986  0086 1612          	ldw	y,(OFST-2,sp)
 987  0088 90ef0f        	ldw	(15,y),x
 988                     ; 403                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 990  008b 96            	ldw	x,sp
 991  008c 1c0007        	addw	x,#OFST-13
 992  008f cd0000        	call	_atomTimerRegister
 994  0092 4d            	tnz	a
 995  0093 2721          	jreq	L724
 996                     ; 406                                 status = ATOM_ERR_TIMER;
 998  0095 a6cd          	ld	a,#205
 999  0097 6b14          	ld	(OFST+0,sp),a
1000                     ; 409                                 (void)tcbDequeueEntry (&qptr->getSuspQ, curr_tcb_ptr);
1002  0099 1e12          	ldw	x,(OFST-2,sp)
1003  009b 89            	pushw	x
1004  009c 1e17          	ldw	x,(OFST+3,sp)
1005  009e 5c            	incw	x
1006  009f 5c            	incw	x
1007  00a0 cd0000        	call	_tcbDequeueEntry
1009  00a3 85            	popw	x
1010                     ; 410                                 curr_tcb_ptr->suspended = FALSE;
1012  00a4 1e12          	ldw	x,(OFST-2,sp)
1013  00a6 6f0d          	clr	(13,x)
1014                     ; 411                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1016  00a8 1e12          	ldw	x,(OFST-2,sp)
1017  00aa 905f          	clrw	y
1018  00ac ef0f          	ldw	(15,x),y
1019  00ae 2006          	jra	L724
1020  00b0               L324:
1021                     ; 419                             curr_tcb_ptr->suspend_timo_cb = NULL;
1023  00b0 1e12          	ldw	x,(OFST-2,sp)
1024  00b2 905f          	clrw	y
1025  00b4 ef0f          	ldw	(15,x),y
1026  00b6               L724:
1027                     ; 423                         CRITICAL_END ();
1029  00b6 96            	ldw	x,sp
1030  00b7 1c0011        	addw	x,#OFST-3
1032  00ba f6            ld A,(X)
1033  00bb 88            push A
1034  00bc 86            pop CC
1036                     ; 426                         if (status == ATOM_OK)
1038  00bd 0d14          	tnz	(OFST+0,sp)
1039  00bf 2703          	jreq	L22
1040  00c1 cc0010        	jp	L114
1041  00c4               L22:
1042                     ; 433                             atomSched (FALSE);
1044  00c4 4f            	clr	a
1045  00c5 cd0000        	call	_atomSched
1047                     ; 440                             status = curr_tcb_ptr->suspend_wake_status;
1049  00c8 1e12          	ldw	x,(OFST-2,sp)
1050  00ca e60e          	ld	a,(14,x)
1051  00cc 6b14          	ld	(OFST+0,sp),a
1052                     ; 450                             if (status == ATOM_OK)
1054  00ce 0d14          	tnz	(OFST+0,sp)
1055  00d0 2703          	jreq	L42
1056  00d2 cc0010        	jp	L114
1057  00d5               L42:
1058                     ; 453                                 CRITICAL_START();
1060  00d5 96            	ldw	x,sp
1061  00d6 1c0011        	addw	x,#OFST-3
1063  00d9 8a            push CC
1064  00da 84            pop a
1065  00db f7            ld (X),A
1066  00dc 9b            sim
1068                     ; 456                                 status = queue_remove (qptr, msgptr);
1070  00dd 1e1d          	ldw	x,(OFST+9,sp)
1071  00df 89            	pushw	x
1072  00e0 1e17          	ldw	x,(OFST+3,sp)
1073  00e2 cd0000        	call	L3_queue_remove
1075  00e5 85            	popw	x
1076  00e6 6b14          	ld	(OFST+0,sp),a
1077                     ; 459                                 CRITICAL_END();
1079  00e8 96            	ldw	x,sp
1080  00e9 1c0011        	addw	x,#OFST-3
1082  00ec f6            ld A,(X)
1083  00ed 88            push A
1084  00ee 86            pop CC
1086  00ef ac100010      	jpf	L114
1087  00f3               L124:
1088                     ; 466                         CRITICAL_END ();
1090  00f3 96            	ldw	x,sp
1091  00f4 1c0011        	addw	x,#OFST-3
1093  00f7 f6            ld A,(X)
1094  00f8 88            push A
1095  00f9 86            pop CC
1097                     ; 467                         status = ATOM_ERR_QUEUE;
1099  00fa a6cc          	ld	a,#204
1100  00fc 6b14          	ld	(OFST+0,sp),a
1101  00fe ac100010      	jpf	L114
1102  0102               L714:
1103                     ; 473                     CRITICAL_END ();
1105  0102 96            	ldw	x,sp
1106  0103 1c0011        	addw	x,#OFST-3
1108  0106 f6            ld A,(X)
1109  0107 88            push A
1110  0108 86            pop CC
1112                     ; 474                     status = ATOM_ERR_CONTEXT;
1114  0109 a6c8          	ld	a,#200
1115  010b 6b14          	ld	(OFST+0,sp),a
1116  010d ac100010      	jpf	L114
1117  0111               L514:
1118                     ; 480                 CRITICAL_END();
1120  0111 96            	ldw	x,sp
1121  0112 1c0011        	addw	x,#OFST-3
1123  0115 f6            ld A,(X)
1124  0116 88            push A
1125  0117 86            pop CC
1127                     ; 481                 status = ATOM_WOULDBLOCK;
1129  0118 a603          	ld	a,#3
1130  011a 6b14          	ld	(OFST+0,sp),a
1131  011c ac100010      	jpf	L114
1132  0120               L314:
1133                     ; 487             status = queue_remove (qptr, msgptr);
1135  0120 1e1d          	ldw	x,(OFST+9,sp)
1136  0122 89            	pushw	x
1137  0123 1e17          	ldw	x,(OFST+3,sp)
1138  0125 cd0000        	call	L3_queue_remove
1140  0128 85            	popw	x
1141  0129 6b14          	ld	(OFST+0,sp),a
1142                     ; 490             CRITICAL_END ();
1144  012b 96            	ldw	x,sp
1145  012c 1c0011        	addw	x,#OFST-3
1147  012f f6            ld A,(X)
1148  0130 88            push A
1149  0131 86            pop CC
1151                     ; 497             if (atomCurrentContext())
1153  0132 cd0000        	call	_atomCurrentContext
1155  0135 a30000        	cpw	x,#0
1156  0138 2603          	jrne	L62
1157  013a cc0010        	jp	L114
1158  013d               L62:
1159                     ; 498                 atomSched (FALSE);
1161  013d 4f            	clr	a
1162  013e cd0000        	call	_atomSched
1164  0141 ac100010      	jpf	L114
1273                     ; 543 uint8_t atomQueuePut (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
1273                     ; 544 {
1274                     .text:	section	.text,new
1275  0000               _atomQueuePut:
1277  0000 89            	pushw	x
1278  0001 5214          	subw	sp,#20
1279       00000014      OFST:	set	20
1282                     ; 552     if ((qptr == NULL) || (msgptr == NULL))
1284  0003 a30000        	cpw	x,#0
1285  0006 2704          	jreq	L125
1287  0008 1e1d          	ldw	x,(OFST+9,sp)
1288  000a 2609          	jrne	L715
1289  000c               L125:
1290                     ; 555         status = ATOM_ERR_PARAM;
1292  000c a6c9          	ld	a,#201
1293  000e 6b14          	ld	(OFST+0,sp),a
1295  0010               L325:
1296                     ; 710     return (status);
1298  0010 7b14          	ld	a,(OFST+0,sp)
1301  0012 5b16          	addw	sp,#22
1302  0014 81            	ret
1303  0015               L715:
1304                     ; 560         CRITICAL_START ();
1306  0015 96            	ldw	x,sp
1307  0016 1c0011        	addw	x,#OFST-3
1309  0019 8a            push CC
1310  001a 84            pop a
1311  001b f7            ld (X),A
1312  001c 9b            sim
1314                     ; 563         if (qptr->num_msgs_stored == qptr->max_num_msgs)
1316  001d 1e15          	ldw	x,(OFST+1,sp)
1317  001f 1c0016        	addw	x,#22
1318  0022 cd0000        	call	c_ltor
1320  0025 1e15          	ldw	x,(OFST+1,sp)
1321  0027 1c000a        	addw	x,#10
1322  002a cd0000        	call	c_lcmp
1324  002d 2703          	jreq	L23
1325  002f cc0122        	jp	L525
1326  0032               L23:
1327                     ; 566             if (timeout >= 0)
1329  0032 9c            	rvf
1330  0033 9c            	rvf
1331  0034 0d19          	tnz	(OFST+5,sp)
1332  0036 2e03          	jrsge	L43
1333  0038 cc0113        	jp	L725
1334  003b               L43:
1335                     ; 571                 curr_tcb_ptr = atomCurrentContext();
1337  003b cd0000        	call	_atomCurrentContext
1339  003e 1f12          	ldw	(OFST-2,sp),x
1340                     ; 574                 if (curr_tcb_ptr)
1342  0040 1e12          	ldw	x,(OFST-2,sp)
1343  0042 2603          	jrne	L63
1344  0044 cc0104        	jp	L135
1345  0047               L63:
1346                     ; 577                     if (tcbEnqueuePriority (&qptr->putSuspQ, curr_tcb_ptr) == ATOM_OK)
1348  0047 1e12          	ldw	x,(OFST-2,sp)
1349  0049 89            	pushw	x
1350  004a 1e17          	ldw	x,(OFST+3,sp)
1351  004c cd0000        	call	_tcbEnqueuePriority
1353  004f 85            	popw	x
1354  0050 4d            	tnz	a
1355  0051 2703          	jreq	L04
1356  0053 cc00f5        	jp	L335
1357  0056               L04:
1358                     ; 580                         curr_tcb_ptr->suspended = TRUE;
1360  0056 1e12          	ldw	x,(OFST-2,sp)
1361  0058 a601          	ld	a,#1
1362  005a e70d          	ld	(13,x),a
1363                     ; 583                         status = ATOM_OK;
1365  005c 0f14          	clr	(OFST+0,sp)
1366                     ; 586                         if (timeout)
1368  005e 96            	ldw	x,sp
1369  005f 1c0019        	addw	x,#OFST+5
1370  0062 cd0000        	call	c_lzmp
1372  0065 274b          	jreq	L535
1373                     ; 592                             timer_data.tcb_ptr = curr_tcb_ptr;
1375  0067 1e12          	ldw	x,(OFST-2,sp)
1376  0069 1f01          	ldw	(OFST-19,sp),x
1377                     ; 593                             timer_data.queue_ptr = qptr;
1379  006b 1e15          	ldw	x,(OFST+1,sp)
1380  006d 1f03          	ldw	(OFST-17,sp),x
1381                     ; 594                             timer_data.suspQ = &qptr->putSuspQ;
1383  006f 1e15          	ldw	x,(OFST+1,sp)
1384  0071 1f05          	ldw	(OFST-15,sp),x
1385                     ; 598                             timer_cb.cb_func = atomQueueTimerCallback;
1387  0073 ae0000        	ldw	x,#L7_atomQueueTimerCallback
1388  0076 1f07          	ldw	(OFST-13,sp),x
1389                     ; 599                             timer_cb.cb_data = (POINTER)&timer_data;
1391  0078 96            	ldw	x,sp
1392  0079 1c0001        	addw	x,#OFST-19
1393  007c 1f09          	ldw	(OFST-11,sp),x
1394                     ; 600                             timer_cb.cb_ticks = timeout;
1396  007e 1e1b          	ldw	x,(OFST+7,sp)
1397  0080 1f0d          	ldw	(OFST-7,sp),x
1398  0082 1e19          	ldw	x,(OFST+5,sp)
1399  0084 1f0b          	ldw	(OFST-9,sp),x
1400                     ; 608                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
1402  0086 96            	ldw	x,sp
1403  0087 1c0007        	addw	x,#OFST-13
1404  008a 1612          	ldw	y,(OFST-2,sp)
1405  008c 90ef0f        	ldw	(15,y),x
1406                     ; 611                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
1408  008f 96            	ldw	x,sp
1409  0090 1c0007        	addw	x,#OFST-13
1410  0093 cd0000        	call	_atomTimerRegister
1412  0096 4d            	tnz	a
1413  0097 271f          	jreq	L145
1414                     ; 614                                 status = ATOM_ERR_TIMER;
1416  0099 a6cd          	ld	a,#205
1417  009b 6b14          	ld	(OFST+0,sp),a
1418                     ; 617                                 (void)tcbDequeueEntry (&qptr->putSuspQ, curr_tcb_ptr);
1420  009d 1e12          	ldw	x,(OFST-2,sp)
1421  009f 89            	pushw	x
1422  00a0 1e17          	ldw	x,(OFST+3,sp)
1423  00a2 cd0000        	call	_tcbDequeueEntry
1425  00a5 85            	popw	x
1426                     ; 618                                 curr_tcb_ptr->suspended = FALSE;
1428  00a6 1e12          	ldw	x,(OFST-2,sp)
1429  00a8 6f0d          	clr	(13,x)
1430                     ; 619                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1432  00aa 1e12          	ldw	x,(OFST-2,sp)
1433  00ac 905f          	clrw	y
1434  00ae ef0f          	ldw	(15,x),y
1435  00b0 2006          	jra	L145
1436  00b2               L535:
1437                     ; 627                             curr_tcb_ptr->suspend_timo_cb = NULL;
1439  00b2 1e12          	ldw	x,(OFST-2,sp)
1440  00b4 905f          	clrw	y
1441  00b6 ef0f          	ldw	(15,x),y
1442  00b8               L145:
1443                     ; 631                         CRITICAL_END ();
1445  00b8 96            	ldw	x,sp
1446  00b9 1c0011        	addw	x,#OFST-3
1448  00bc f6            ld A,(X)
1449  00bd 88            push A
1450  00be 86            pop CC
1452                     ; 634                         if (status == ATOM_OK)
1454  00bf 0d14          	tnz	(OFST+0,sp)
1455  00c1 2703          	jreq	L24
1456  00c3 cc0010        	jp	L325
1457  00c6               L24:
1458                     ; 641                             atomSched (FALSE);
1460  00c6 4f            	clr	a
1461  00c7 cd0000        	call	_atomSched
1463                     ; 648                             status = curr_tcb_ptr->suspend_wake_status;
1465  00ca 1e12          	ldw	x,(OFST-2,sp)
1466  00cc e60e          	ld	a,(14,x)
1467  00ce 6b14          	ld	(OFST+0,sp),a
1468                     ; 658                             if (status == ATOM_OK)
1470  00d0 0d14          	tnz	(OFST+0,sp)
1471  00d2 2703          	jreq	L44
1472  00d4 cc0010        	jp	L325
1473  00d7               L44:
1474                     ; 661                                 CRITICAL_START();
1476  00d7 96            	ldw	x,sp
1477  00d8 1c0011        	addw	x,#OFST-3
1479  00db 8a            push CC
1480  00dc 84            pop a
1481  00dd f7            ld (X),A
1482  00de 9b            sim
1484                     ; 664                                 status = queue_insert (qptr, msgptr);
1486  00df 1e1d          	ldw	x,(OFST+9,sp)
1487  00e1 89            	pushw	x
1488  00e2 1e17          	ldw	x,(OFST+3,sp)
1489  00e4 cd0000        	call	L5_queue_insert
1491  00e7 85            	popw	x
1492  00e8 6b14          	ld	(OFST+0,sp),a
1493                     ; 667                                 CRITICAL_END();
1495  00ea 96            	ldw	x,sp
1496  00eb 1c0011        	addw	x,#OFST-3
1498  00ee f6            ld A,(X)
1499  00ef 88            push A
1500  00f0 86            pop CC
1502  00f1 ac100010      	jpf	L325
1503  00f5               L335:
1504                     ; 674                         CRITICAL_END ();
1506  00f5 96            	ldw	x,sp
1507  00f6 1c0011        	addw	x,#OFST-3
1509  00f9 f6            ld A,(X)
1510  00fa 88            push A
1511  00fb 86            pop CC
1513                     ; 675                         status = ATOM_ERR_QUEUE;
1515  00fc a6cc          	ld	a,#204
1516  00fe 6b14          	ld	(OFST+0,sp),a
1517  0100 ac100010      	jpf	L325
1518  0104               L135:
1519                     ; 681                     CRITICAL_END ();
1521  0104 96            	ldw	x,sp
1522  0105 1c0011        	addw	x,#OFST-3
1524  0108 f6            ld A,(X)
1525  0109 88            push A
1526  010a 86            pop CC
1528                     ; 682                     status = ATOM_ERR_CONTEXT;
1530  010b a6c8          	ld	a,#200
1531  010d 6b14          	ld	(OFST+0,sp),a
1532  010f ac100010      	jpf	L325
1533  0113               L725:
1534                     ; 688                 CRITICAL_END();
1536  0113 96            	ldw	x,sp
1537  0114 1c0011        	addw	x,#OFST-3
1539  0117 f6            ld A,(X)
1540  0118 88            push A
1541  0119 86            pop CC
1543                     ; 689                 status = ATOM_WOULDBLOCK;
1545  011a a603          	ld	a,#3
1546  011c 6b14          	ld	(OFST+0,sp),a
1547  011e ac100010      	jpf	L325
1548  0122               L525:
1549                     ; 695             status = queue_insert (qptr, msgptr);
1551  0122 1e1d          	ldw	x,(OFST+9,sp)
1552  0124 89            	pushw	x
1553  0125 1e17          	ldw	x,(OFST+3,sp)
1554  0127 cd0000        	call	L5_queue_insert
1556  012a 85            	popw	x
1557  012b 6b14          	ld	(OFST+0,sp),a
1558                     ; 698             CRITICAL_END ();
1560  012d 96            	ldw	x,sp
1561  012e 1c0011        	addw	x,#OFST-3
1563  0131 f6            ld A,(X)
1564  0132 88            push A
1565  0133 86            pop CC
1567                     ; 705             if (atomCurrentContext())
1569  0134 cd0000        	call	_atomCurrentContext
1571  0137 a30000        	cpw	x,#0
1572  013a 2603          	jrne	L64
1573  013c cc0010        	jp	L325
1574  013f               L64:
1575                     ; 706                 atomSched (FALSE);
1577  013f 4f            	clr	a
1578  0140 cd0000        	call	_atomSched
1580  0143 ac100010      	jpf	L325
1638                     ; 726 static void atomQueueTimerCallback (POINTER cb_data)
1638                     ; 727 {
1639                     .text:	section	.text,new
1640  0000               L7_atomQueueTimerCallback:
1642  0000 5203          	subw	sp,#3
1643       00000003      OFST:	set	3
1646                     ; 732     timer_data_ptr = (QUEUE_TIMER *)cb_data;
1648  0002 1f02          	ldw	(OFST-1,sp),x
1649                     ; 735     if (timer_data_ptr)
1651  0004 1e02          	ldw	x,(OFST-1,sp)
1652  0006 2734          	jreq	L706
1653                     ; 738         CRITICAL_START ();
1655  0008 96            	ldw	x,sp
1656  0009 1c0001        	addw	x,#OFST-2
1658  000c 8a            push CC
1659  000d 84            pop a
1660  000e f7            ld (X),A
1661  000f 9b            sim
1663                     ; 741         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1665  0010 1e02          	ldw	x,(OFST-1,sp)
1666  0012 fe            	ldw	x,(x)
1667  0013 a602          	ld	a,#2
1668  0015 e70e          	ld	(14,x),a
1669                     ; 744         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1671  0017 1e02          	ldw	x,(OFST-1,sp)
1672  0019 fe            	ldw	x,(x)
1673  001a 905f          	clrw	y
1674  001c ef0f          	ldw	(15,x),y
1675                     ; 750         (void)tcbDequeueEntry (timer_data_ptr->suspQ, timer_data_ptr->tcb_ptr);
1677  001e 1e02          	ldw	x,(OFST-1,sp)
1678  0020 fe            	ldw	x,(x)
1679  0021 89            	pushw	x
1680  0022 1e04          	ldw	x,(OFST+1,sp)
1681  0024 ee04          	ldw	x,(4,x)
1682  0026 cd0000        	call	_tcbDequeueEntry
1684  0029 85            	popw	x
1685                     ; 753         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1687  002a 1e02          	ldw	x,(OFST-1,sp)
1688  002c fe            	ldw	x,(x)
1689  002d 89            	pushw	x
1690  002e ae0000        	ldw	x,#_tcbReadyQ
1691  0031 cd0000        	call	_tcbEnqueuePriority
1693  0034 85            	popw	x
1694                     ; 756         CRITICAL_END ();
1696  0035 96            	ldw	x,sp
1697  0036 1c0001        	addw	x,#OFST-2
1699  0039 f6            ld A,(X)
1700  003a 88            push A
1701  003b 86            pop CC
1703  003c               L706:
1704                     ; 763 }
1707  003c 5b03          	addw	sp,#3
1708  003e 81            	ret
1779                     ; 788 static uint8_t queue_remove (ATOM_QUEUE *qptr, uint8_t* msgptr)
1779                     ; 789 {
1780                     .text:	section	.text,new
1781  0000               L3_queue_remove:
1783  0000 89            	pushw	x
1784  0001 5207          	subw	sp,#7
1785       00000007      OFST:	set	7
1788                     ; 794     if ((qptr == NULL) || (msgptr == NULL))
1790  0003 a30000        	cpw	x,#0
1791  0006 2704          	jreq	L746
1793  0008 1e0c          	ldw	x,(OFST+5,sp)
1794  000a 2609          	jrne	L546
1795  000c               L746:
1796                     ; 797         status = ATOM_ERR_PARAM;
1798  000c a6c9          	ld	a,#201
1799  000e 6b05          	ld	(OFST-2,sp),a
1801  0010               L156:
1802                     ; 856     return (status);
1804  0010 7b05          	ld	a,(OFST-2,sp)
1807  0012 5b09          	addw	sp,#9
1808  0014 81            	ret
1809  0015               L546:
1810                     ; 802         memcpy (msgptr, (qptr->buff_ptr + qptr->remove_index), qptr->unit_size);
1812  0015 1e08          	ldw	x,(OFST+1,sp)
1813  0017 ee08          	ldw	x,(8,x)
1814  0019 89            	pushw	x
1815  001a 1e0a          	ldw	x,(OFST+3,sp)
1816  001c ee14          	ldw	x,(20,x)
1817  001e 160a          	ldw	y,(OFST+3,sp)
1818  0020 90ee04        	ldw	y,(4,y)
1819  0023 90bf00        	ldw	c_x,y
1820  0026 72bb0000      	addw	x,c_x
1821  002a 89            	pushw	x
1822  002b 1e10          	ldw	x,(OFST+9,sp)
1823  002d cd0000        	call	_memcpy
1825  0030 5b04          	addw	sp,#4
1826                     ; 803         qptr->remove_index += qptr->unit_size;
1828  0032 1e08          	ldw	x,(OFST+1,sp)
1829  0034 1608          	ldw	y,(OFST+1,sp)
1830  0036 90e609        	ld	a,(9,y)
1831  0039 b703          	ld	c_lreg+3,a
1832  003b 90e608        	ld	a,(8,y)
1833  003e b702          	ld	c_lreg+2,a
1834  0040 90e607        	ld	a,(7,y)
1835  0043 b701          	ld	c_lreg+1,a
1836  0045 90e606        	ld	a,(6,y)
1837  0048 b700          	ld	c_lreg,a
1838  004a 1c0012        	addw	x,#18
1839  004d cd0000        	call	c_lgadd
1841                     ; 804         qptr->num_msgs_stored--;
1843  0050 1e08          	ldw	x,(OFST+1,sp)
1844  0052 1c0016        	addw	x,#22
1845  0055 a601          	ld	a,#1
1846  0057 cd0000        	call	c_lgsbc
1848                     ; 807         if (qptr->remove_index >= (qptr->unit_size * qptr->max_num_msgs))
1850  005a 1e08          	ldw	x,(OFST+1,sp)
1851  005c 1c0006        	addw	x,#6
1852  005f cd0000        	call	c_ltor
1854  0062 1e08          	ldw	x,(OFST+1,sp)
1855  0064 1c000a        	addw	x,#10
1856  0067 cd0000        	call	c_lmul
1858  006a 96            	ldw	x,sp
1859  006b 1c0001        	addw	x,#OFST-6
1860  006e cd0000        	call	c_rtol
1862  0071 1e08          	ldw	x,(OFST+1,sp)
1863  0073 1c0012        	addw	x,#18
1864  0076 cd0000        	call	c_ltor
1866  0079 96            	ldw	x,sp
1867  007a 1c0001        	addw	x,#OFST-6
1868  007d cd0000        	call	c_lcmp
1870  0080 2512          	jrult	L356
1871                     ; 808             qptr->remove_index = 0;
1873  0082 1e08          	ldw	x,(OFST+1,sp)
1874  0084 a600          	ld	a,#0
1875  0086 e715          	ld	(21,x),a
1876  0088 a600          	ld	a,#0
1877  008a e714          	ld	(20,x),a
1878  008c a600          	ld	a,#0
1879  008e e713          	ld	(19,x),a
1880  0090 a600          	ld	a,#0
1881  0092 e712          	ld	(18,x),a
1882  0094               L356:
1883                     ; 815         tcb_ptr = tcbDequeueHead (&qptr->putSuspQ);
1885  0094 1e08          	ldw	x,(OFST+1,sp)
1886  0096 cd0000        	call	_tcbDequeueHead
1888  0099 1f06          	ldw	(OFST-1,sp),x
1889                     ; 816         if (tcb_ptr)
1891  009b 1e06          	ldw	x,(OFST-1,sp)
1892  009d 273f          	jreq	L556
1893                     ; 819             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
1895  009f 1e06          	ldw	x,(OFST-1,sp)
1896  00a1 89            	pushw	x
1897  00a2 ae0000        	ldw	x,#_tcbReadyQ
1898  00a5 cd0000        	call	_tcbEnqueuePriority
1900  00a8 85            	popw	x
1901  00a9 4d            	tnz	a
1902  00aa 262a          	jrne	L756
1903                     ; 822                 tcb_ptr->suspend_wake_status = ATOM_OK;
1905  00ac 1e06          	ldw	x,(OFST-1,sp)
1906  00ae 6f0e          	clr	(14,x)
1907                     ; 825                 if ((tcb_ptr->suspend_timo_cb != NULL)
1907                     ; 826                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1909  00b0 1e06          	ldw	x,(OFST-1,sp)
1910  00b2 e610          	ld	a,(16,x)
1911  00b4 ea0f          	or	a,(15,x)
1912  00b6 2712          	jreq	L166
1914  00b8 1e06          	ldw	x,(OFST-1,sp)
1915  00ba ee0f          	ldw	x,(15,x)
1916  00bc cd0000        	call	_atomTimerCancel
1918  00bf 4d            	tnz	a
1919  00c0 2708          	jreq	L166
1920                     ; 829                     status = ATOM_ERR_TIMER;
1922  00c2 a6cd          	ld	a,#205
1923  00c4 6b05          	ld	(OFST-2,sp),a
1925  00c6 ac100010      	jpf	L156
1926  00ca               L166:
1927                     ; 834                     tcb_ptr->suspend_timo_cb = NULL;
1929  00ca 1e06          	ldw	x,(OFST-1,sp)
1930  00cc 905f          	clrw	y
1931  00ce ef0f          	ldw	(15,x),y
1932                     ; 837                     status = ATOM_OK;
1934  00d0 0f05          	clr	(OFST-2,sp)
1935  00d2 ac100010      	jpf	L156
1936  00d6               L756:
1937                     ; 846                 status = ATOM_ERR_QUEUE;
1939  00d6 a6cc          	ld	a,#204
1940  00d8 6b05          	ld	(OFST-2,sp),a
1941  00da ac100010      	jpf	L156
1942  00de               L556:
1943                     ; 852             status = ATOM_OK;
1945  00de 0f05          	clr	(OFST-2,sp)
1946  00e0 ac100010      	jpf	L156
2017                     ; 882 static uint8_t queue_insert (ATOM_QUEUE *qptr, uint8_t* msgptr)
2017                     ; 883 {
2018                     .text:	section	.text,new
2019  0000               L5_queue_insert:
2021  0000 89            	pushw	x
2022  0001 5207          	subw	sp,#7
2023       00000007      OFST:	set	7
2026                     ; 888     if ((qptr == NULL) || (msgptr == NULL))
2028  0003 a30000        	cpw	x,#0
2029  0006 2704          	jreq	L727
2031  0008 1e0c          	ldw	x,(OFST+5,sp)
2032  000a 2609          	jrne	L527
2033  000c               L727:
2034                     ; 891         status = ATOM_ERR_PARAM;
2036  000c a6c9          	ld	a,#201
2037  000e 6b05          	ld	(OFST-2,sp),a
2039  0010               L137:
2040                     ; 950     return (status);
2042  0010 7b05          	ld	a,(OFST-2,sp)
2045  0012 5b09          	addw	sp,#9
2046  0014 81            	ret
2047  0015               L527:
2048                     ; 896         memcpy ((qptr->buff_ptr + qptr->insert_index), msgptr, qptr->unit_size);
2050  0015 1e08          	ldw	x,(OFST+1,sp)
2051  0017 ee10          	ldw	x,(16,x)
2052  0019 1608          	ldw	y,(OFST+1,sp)
2053  001b 90ee04        	ldw	y,(4,y)
2054  001e 90bf00        	ldw	c_x,y
2055  0021 72bb0000      	addw	x,c_x
2056  0025 bf00          	ldw	c_x,x
2057  0027 160c          	ldw	y,(OFST+5,sp)
2058  0029 90bf00        	ldw	c_y,y
2059  002c 1e08          	ldw	x,(OFST+1,sp)
2060  002e ee08          	ldw	x,(8,x)
2061  0030 5d            	tnzw	x
2062  0031 270a          	jreq	L65
2063  0033               L06:
2064  0033 5a            	decw	x
2065  0034 92d600        	ld	a,([c_y.w],x)
2066  0037 92d700        	ld	([c_x.w],x),a
2067  003a 5d            	tnzw	x
2068  003b 26f6          	jrne	L06
2069  003d               L65:
2070                     ; 897         qptr->insert_index += qptr->unit_size;
2072  003d 1e08          	ldw	x,(OFST+1,sp)
2073  003f 1608          	ldw	y,(OFST+1,sp)
2074  0041 90e609        	ld	a,(9,y)
2075  0044 b703          	ld	c_lreg+3,a
2076  0046 90e608        	ld	a,(8,y)
2077  0049 b702          	ld	c_lreg+2,a
2078  004b 90e607        	ld	a,(7,y)
2079  004e b701          	ld	c_lreg+1,a
2080  0050 90e606        	ld	a,(6,y)
2081  0053 b700          	ld	c_lreg,a
2082  0055 1c000e        	addw	x,#14
2083  0058 cd0000        	call	c_lgadd
2085                     ; 898         qptr->num_msgs_stored++;
2087  005b 1e08          	ldw	x,(OFST+1,sp)
2088  005d 1c0016        	addw	x,#22
2089  0060 a601          	ld	a,#1
2090  0062 cd0000        	call	c_lgadc
2092                     ; 901         if (qptr->insert_index >= (qptr->unit_size * qptr->max_num_msgs))
2094  0065 1e08          	ldw	x,(OFST+1,sp)
2095  0067 1c0006        	addw	x,#6
2096  006a cd0000        	call	c_ltor
2098  006d 1e08          	ldw	x,(OFST+1,sp)
2099  006f 1c000a        	addw	x,#10
2100  0072 cd0000        	call	c_lmul
2102  0075 96            	ldw	x,sp
2103  0076 1c0001        	addw	x,#OFST-6
2104  0079 cd0000        	call	c_rtol
2106  007c 1e08          	ldw	x,(OFST+1,sp)
2107  007e 1c000e        	addw	x,#14
2108  0081 cd0000        	call	c_ltor
2110  0084 96            	ldw	x,sp
2111  0085 1c0001        	addw	x,#OFST-6
2112  0088 cd0000        	call	c_lcmp
2114  008b 2512          	jrult	L337
2115                     ; 902             qptr->insert_index = 0;
2117  008d 1e08          	ldw	x,(OFST+1,sp)
2118  008f a600          	ld	a,#0
2119  0091 e711          	ld	(17,x),a
2120  0093 a600          	ld	a,#0
2121  0095 e710          	ld	(16,x),a
2122  0097 a600          	ld	a,#0
2123  0099 e70f          	ld	(15,x),a
2124  009b a600          	ld	a,#0
2125  009d e70e          	ld	(14,x),a
2126  009f               L337:
2127                     ; 909         tcb_ptr = tcbDequeueHead (&qptr->getSuspQ);
2129  009f 1e08          	ldw	x,(OFST+1,sp)
2130  00a1 5c            	incw	x
2131  00a2 5c            	incw	x
2132  00a3 cd0000        	call	_tcbDequeueHead
2134  00a6 1f06          	ldw	(OFST-1,sp),x
2135                     ; 910         if (tcb_ptr)
2137  00a8 1e06          	ldw	x,(OFST-1,sp)
2138  00aa 273f          	jreq	L537
2139                     ; 913             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
2141  00ac 1e06          	ldw	x,(OFST-1,sp)
2142  00ae 89            	pushw	x
2143  00af ae0000        	ldw	x,#_tcbReadyQ
2144  00b2 cd0000        	call	_tcbEnqueuePriority
2146  00b5 85            	popw	x
2147  00b6 4d            	tnz	a
2148  00b7 262a          	jrne	L737
2149                     ; 916                 tcb_ptr->suspend_wake_status = ATOM_OK;
2151  00b9 1e06          	ldw	x,(OFST-1,sp)
2152  00bb 6f0e          	clr	(14,x)
2153                     ; 919                 if ((tcb_ptr->suspend_timo_cb != NULL)
2153                     ; 920                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
2155  00bd 1e06          	ldw	x,(OFST-1,sp)
2156  00bf e610          	ld	a,(16,x)
2157  00c1 ea0f          	or	a,(15,x)
2158  00c3 2712          	jreq	L147
2160  00c5 1e06          	ldw	x,(OFST-1,sp)
2161  00c7 ee0f          	ldw	x,(15,x)
2162  00c9 cd0000        	call	_atomTimerCancel
2164  00cc 4d            	tnz	a
2165  00cd 2708          	jreq	L147
2166                     ; 923                     status = ATOM_ERR_TIMER;
2168  00cf a6cd          	ld	a,#205
2169  00d1 6b05          	ld	(OFST-2,sp),a
2171  00d3 ac100010      	jpf	L137
2172  00d7               L147:
2173                     ; 928                     tcb_ptr->suspend_timo_cb = NULL;
2175  00d7 1e06          	ldw	x,(OFST-1,sp)
2176  00d9 905f          	clrw	y
2177  00db ef0f          	ldw	(15,x),y
2178                     ; 931                     status = ATOM_OK;
2180  00dd 0f05          	clr	(OFST-2,sp)
2181  00df ac100010      	jpf	L137
2182  00e3               L737:
2183                     ; 940                 status = ATOM_ERR_QUEUE;
2185  00e3 a6cc          	ld	a,#204
2186  00e5 6b05          	ld	(OFST-2,sp),a
2187  00e7 ac100010      	jpf	L137
2188  00eb               L537:
2189                     ; 946             status = ATOM_OK;
2191  00eb 0f05          	clr	(OFST-2,sp)
2192  00ed ac100010      	jpf	L137
2205                     	xdef	_atomQueuePut
2206                     	xdef	_atomQueueGet
2207                     	xdef	_atomQueueDelete
2208                     	xdef	_atomQueueCreate
2209                     	xref	_atomCurrentContext
2210                     	xref	_tcbDequeueEntry
2211                     	xref	_tcbDequeueHead
2212                     	xref	_tcbEnqueuePriority
2213                     	xref	_atomSched
2214                     	xref	_tcbReadyQ
2215                     	xref	_atomTimerCancel
2216                     	xref	_atomTimerRegister
2217                     	xref	_memcpy
2218                     	xref.b	c_lreg
2219                     	xref.b	c_x
2220                     	xref.b	c_y
2239                     	xref	c_lgadc
2240                     	xref	c_rtol
2241                     	xref	c_lmul
2242                     	xref	c_lgsbc
2243                     	xref	c_lgadd
2244                     	xref	c_lcmp
2245                     	xref	c_ltor
2246                     	xref	c_lzmp
2247                     	end
