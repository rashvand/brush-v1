   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
 257                     ; 129 uint8_t atomSemCreate (ATOM_SEM *sem, uint8_t initial_count)
 257                     ; 130 {
 259                     .text:	section	.text,new
 260  0000               _atomSemCreate:
 262  0000 89            	pushw	x
 263  0001 88            	push	a
 264       00000001      OFST:	set	1
 267                     ; 134     if (sem == NULL)
 269  0002 a30000        	cpw	x,#0
 270  0005 2606          	jrne	L351
 271                     ; 137         status = ATOM_ERR_PARAM;
 273  0007 a6c9          	ld	a,#201
 274  0009 6b01          	ld	(OFST+0,sp),a
 276  000b 200d          	jra	L551
 277  000d               L351:
 278                     ; 142         sem->count = initial_count;
 280  000d 7b06          	ld	a,(OFST+5,sp)
 281  000f 1e02          	ldw	x,(OFST+1,sp)
 282  0011 e702          	ld	(2,x),a
 283                     ; 145         sem->suspQ = NULL;
 285  0013 1e02          	ldw	x,(OFST+1,sp)
 286  0015 905f          	clrw	y
 287  0017 ff            	ldw	(x),y
 288                     ; 148         status = ATOM_OK;
 290  0018 0f01          	clr	(OFST+0,sp)
 291  001a               L551:
 292                     ; 151     return (status);
 294  001a 7b01          	ld	a,(OFST+0,sp)
 297  001c 5b03          	addw	sp,#3
 298  001e 81            	ret
 375                     ; 175 uint8_t atomSemDelete (ATOM_SEM *sem)
 375                     ; 176 {
 376                     .text:	section	.text,new
 377  0000               _atomSemDelete:
 379  0000 89            	pushw	x
 380  0001 5205          	subw	sp,#5
 381       00000005      OFST:	set	5
 384                     ; 180     uint8_t woken_threads = FALSE;
 386  0003 0f01          	clr	(OFST-4,sp)
 387                     ; 183     if (sem == NULL)
 389  0005 a30000        	cpw	x,#0
 390  0008 2608          	jrne	L312
 391                     ; 186         status = ATOM_ERR_PARAM;
 393  000a a6c9          	ld	a,#201
 394  000c 6b02          	ld	(OFST-3,sp),a
 396  000e ac920092      	jpf	L512
 397  0012               L312:
 398                     ; 191         status = ATOM_OK;
 400  0012 0f02          	clr	(OFST-3,sp)
 401  0014               L712:
 402                     ; 197             CRITICAL_START ();
 404  0014 96            	ldw	x,sp
 405  0015 1c0003        	addw	x,#OFST-2
 407  0018 8a            push CC
 408  0019 84            pop a
 409  001a f7            ld (X),A
 410  001b 9b            sim
 412                     ; 200             tcb_ptr = tcbDequeueHead (&sem->suspQ);
 414  001c 1e06          	ldw	x,(OFST+1,sp)
 415  001e cd0000        	call	_tcbDequeueHead
 417  0021 1f04          	ldw	(OFST-1,sp),x
 418                     ; 203             if (tcb_ptr)
 420  0023 1e04          	ldw	x,(OFST-1,sp)
 421  0025 2752          	jreq	L322
 422                     ; 206                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 424  0027 1e04          	ldw	x,(OFST-1,sp)
 425  0029 a6ca          	ld	a,#202
 426  002b e70e          	ld	(14,x),a
 427                     ; 209                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 429  002d 1e04          	ldw	x,(OFST-1,sp)
 430  002f 89            	pushw	x
 431  0030 ae0000        	ldw	x,#_tcbReadyQ
 432  0033 cd0000        	call	_tcbEnqueuePriority
 434  0036 85            	popw	x
 435  0037 4d            	tnz	a
 436  0038 270d          	jreq	L522
 437                     ; 212                     CRITICAL_END ();
 439  003a 96            	ldw	x,sp
 440  003b 1c0003        	addw	x,#OFST-2
 442  003e f6            ld A,(X)
 443  003f 88            push A
 444  0040 86            pop CC
 446                     ; 215                     status = ATOM_ERR_QUEUE;
 448  0041 a6cc          	ld	a,#204
 449  0043 6b02          	ld	(OFST-3,sp),a
 450                     ; 216                     break;
 452  0045 2039          	jra	L122
 453  0047               L522:
 454                     ; 220                 if (tcb_ptr->suspend_timo_cb)
 456  0047 1e04          	ldw	x,(OFST-1,sp)
 457  0049 e610          	ld	a,(16,x)
 458  004b ea0f          	or	a,(15,x)
 459  004d 271d          	jreq	L722
 460                     ; 223                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 462  004f 1e04          	ldw	x,(OFST-1,sp)
 463  0051 ee0f          	ldw	x,(15,x)
 464  0053 cd0000        	call	_atomTimerCancel
 466  0056 4d            	tnz	a
 467  0057 270d          	jreq	L132
 468                     ; 226                         CRITICAL_END ();
 470  0059 96            	ldw	x,sp
 471  005a 1c0003        	addw	x,#OFST-2
 473  005d f6            ld A,(X)
 474  005e 88            push A
 475  005f 86            pop CC
 477                     ; 229                         status = ATOM_ERR_TIMER;
 479  0060 a6cd          	ld	a,#205
 480  0062 6b02          	ld	(OFST-3,sp),a
 481                     ; 230                         break;
 483  0064 201a          	jra	L122
 484  0066               L132:
 485                     ; 234                     tcb_ptr->suspend_timo_cb = NULL;
 487  0066 1e04          	ldw	x,(OFST-1,sp)
 488  0068 905f          	clrw	y
 489  006a ef0f          	ldw	(15,x),y
 490  006c               L722:
 491                     ; 239                 CRITICAL_END ();
 493  006c 96            	ldw	x,sp
 494  006d 1c0003        	addw	x,#OFST-2
 496  0070 f6            ld A,(X)
 497  0071 88            push A
 498  0072 86            pop CC
 500                     ; 242                 woken_threads = TRUE;
 502  0073 a601          	ld	a,#1
 503  0075 6b01          	ld	(OFST-4,sp),a
 505  0077 209b          	jra	L712
 506  0079               L322:
 507                     ; 249                 CRITICAL_END ();
 509  0079 96            	ldw	x,sp
 510  007a 1c0003        	addw	x,#OFST-2
 512  007d f6            ld A,(X)
 513  007e 88            push A
 514  007f 86            pop CC
 516                     ; 250                 break;
 517  0080               L122:
 518                     ; 255         if (woken_threads == TRUE)
 520  0080 7b01          	ld	a,(OFST-4,sp)
 521  0082 a101          	cp	a,#1
 522  0084 260c          	jrne	L512
 523                     ; 261             if (atomCurrentContext())
 525  0086 cd0000        	call	_atomCurrentContext
 527  0089 a30000        	cpw	x,#0
 528  008c 2704          	jreq	L512
 529                     ; 262                 atomSched (FALSE);
 531  008e 4f            	clr	a
 532  008f cd0000        	call	_atomSched
 534  0092               L512:
 535                     ; 266     return (status);
 537  0092 7b02          	ld	a,(OFST-3,sp)
 540  0094 5b07          	addw	sp,#7
 541  0096 81            	ret
 670                     ; 314 uint8_t atomSemGet (ATOM_SEM *sem, int32_t timeout)
 670                     ; 315 {
 671                     .text:	section	.text,new
 672  0000               _atomSemGet:
 674  0000 89            	pushw	x
 675  0001 5212          	subw	sp,#18
 676       00000012      OFST:	set	18
 679                     ; 323     if (sem == NULL)
 681  0003 a30000        	cpw	x,#0
 682  0006 2608          	jrne	L523
 683                     ; 326         status = ATOM_ERR_PARAM;
 685  0008 a6c9          	ld	a,#201
 686  000a 6b10          	ld	(OFST-2,sp),a
 688  000c aced00ed      	jpf	L723
 689  0010               L523:
 690                     ; 331         CRITICAL_START ();
 692  0010 96            	ldw	x,sp
 693  0011 1c000f        	addw	x,#OFST-3
 695  0014 8a            push CC
 696  0015 84            pop a
 697  0016 f7            ld (X),A
 698  0017 9b            sim
 700                     ; 334         if (sem->count == 0)
 702  0018 1e13          	ldw	x,(OFST+1,sp)
 703  001a 6d02          	tnz	(2,x)
 704  001c 2703          	jreq	L21
 705  001e cc00e0        	jp	L133
 706  0021               L21:
 707                     ; 337             if (timeout >= 0)
 709  0021 9c            	rvf
 710  0022 9c            	rvf
 711  0023 0d17          	tnz	(OFST+5,sp)
 712  0025 2e03          	jrsge	L41
 713  0027 cc00d3        	jp	L333
 714  002a               L41:
 715                     ; 342                 curr_tcb_ptr = atomCurrentContext();
 717  002a cd0000        	call	_atomCurrentContext
 719  002d 1f11          	ldw	(OFST-1,sp),x
 720                     ; 345                 if (curr_tcb_ptr)
 722  002f 1e11          	ldw	x,(OFST-1,sp)
 723  0031 2603          	jrne	L61
 724  0033 cc00c6        	jp	L533
 725  0036               L61:
 726                     ; 348                     if (tcbEnqueuePriority (&sem->suspQ, curr_tcb_ptr) != ATOM_OK)
 728  0036 1e11          	ldw	x,(OFST-1,sp)
 729  0038 89            	pushw	x
 730  0039 1e15          	ldw	x,(OFST+3,sp)
 731  003b cd0000        	call	_tcbEnqueuePriority
 733  003e 85            	popw	x
 734  003f 4d            	tnz	a
 735  0040 270f          	jreq	L733
 736                     ; 351                         CRITICAL_END ();
 738  0042 96            	ldw	x,sp
 739  0043 1c000f        	addw	x,#OFST-3
 741  0046 f6            ld A,(X)
 742  0047 88            push A
 743  0048 86            pop CC
 745                     ; 354                         status = ATOM_ERR_QUEUE;
 747  0049 a6cc          	ld	a,#204
 748  004b 6b10          	ld	(OFST-2,sp),a
 750  004d aced00ed      	jpf	L723
 751  0051               L733:
 752                     ; 359                         curr_tcb_ptr->suspended = TRUE;
 754  0051 1e11          	ldw	x,(OFST-1,sp)
 755  0053 a601          	ld	a,#1
 756  0055 e70d          	ld	(13,x),a
 757                     ; 362                         status = ATOM_OK;
 759  0057 0f10          	clr	(OFST-2,sp)
 760                     ; 365                         if (timeout)
 762  0059 96            	ldw	x,sp
 763  005a 1c0017        	addw	x,#OFST+5
 764  005d cd0000        	call	c_lzmp
 766  0060 2747          	jreq	L343
 767                     ; 368                             timer_data.tcb_ptr = curr_tcb_ptr;
 769  0062 1e11          	ldw	x,(OFST-1,sp)
 770  0064 1f01          	ldw	(OFST-17,sp),x
 771                     ; 369                             timer_data.sem_ptr = sem;
 773  0066 1e13          	ldw	x,(OFST+1,sp)
 774  0068 1f03          	ldw	(OFST-15,sp),x
 775                     ; 372                             timer_cb.cb_func = atomSemTimerCallback;
 777  006a ae0000        	ldw	x,#L3_atomSemTimerCallback
 778  006d 1f05          	ldw	(OFST-13,sp),x
 779                     ; 373                             timer_cb.cb_data = (POINTER)&timer_data;
 781  006f 96            	ldw	x,sp
 782  0070 1c0001        	addw	x,#OFST-17
 783  0073 1f07          	ldw	(OFST-11,sp),x
 784                     ; 374                             timer_cb.cb_ticks = timeout;
 786  0075 1e19          	ldw	x,(OFST+7,sp)
 787  0077 1f0b          	ldw	(OFST-7,sp),x
 788  0079 1e17          	ldw	x,(OFST+5,sp)
 789  007b 1f09          	ldw	(OFST-9,sp),x
 790                     ; 381                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 792  007d 96            	ldw	x,sp
 793  007e 1c0005        	addw	x,#OFST-13
 794  0081 1611          	ldw	y,(OFST-1,sp)
 795  0083 90ef0f        	ldw	(15,y),x
 796                     ; 384                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 798  0086 96            	ldw	x,sp
 799  0087 1c0005        	addw	x,#OFST-13
 800  008a cd0000        	call	_atomTimerRegister
 802  008d 4d            	tnz	a
 803  008e 271f          	jreq	L743
 804                     ; 387                                 status = ATOM_ERR_TIMER;
 806  0090 a6cd          	ld	a,#205
 807  0092 6b10          	ld	(OFST-2,sp),a
 808                     ; 390                                 (void)tcbDequeueEntry (&sem->suspQ, curr_tcb_ptr);
 810  0094 1e11          	ldw	x,(OFST-1,sp)
 811  0096 89            	pushw	x
 812  0097 1e15          	ldw	x,(OFST+3,sp)
 813  0099 cd0000        	call	_tcbDequeueEntry
 815  009c 85            	popw	x
 816                     ; 391                                 curr_tcb_ptr->suspended = FALSE;
 818  009d 1e11          	ldw	x,(OFST-1,sp)
 819  009f 6f0d          	clr	(13,x)
 820                     ; 392                                 curr_tcb_ptr->suspend_timo_cb = NULL;
 822  00a1 1e11          	ldw	x,(OFST-1,sp)
 823  00a3 905f          	clrw	y
 824  00a5 ef0f          	ldw	(15,x),y
 825  00a7 2006          	jra	L743
 826  00a9               L343:
 827                     ; 400                             curr_tcb_ptr->suspend_timo_cb = NULL;
 829  00a9 1e11          	ldw	x,(OFST-1,sp)
 830  00ab 905f          	clrw	y
 831  00ad ef0f          	ldw	(15,x),y
 832  00af               L743:
 833                     ; 404                         CRITICAL_END ();
 835  00af 96            	ldw	x,sp
 836  00b0 1c000f        	addw	x,#OFST-3
 838  00b3 f6            ld A,(X)
 839  00b4 88            push A
 840  00b5 86            pop CC
 842                     ; 407                         if (status == ATOM_OK)
 844  00b6 0d10          	tnz	(OFST-2,sp)
 845  00b8 2633          	jrne	L723
 846                     ; 414                             atomSched (FALSE);
 848  00ba 4f            	clr	a
 849  00bb cd0000        	call	_atomSched
 851                     ; 421                             status = curr_tcb_ptr->suspend_wake_status;
 853  00be 1e11          	ldw	x,(OFST-1,sp)
 854  00c0 e60e          	ld	a,(14,x)
 855  00c2 6b10          	ld	(OFST-2,sp),a
 856  00c4 2027          	jra	L723
 857  00c6               L533:
 858                     ; 446                     CRITICAL_END ();
 860  00c6 96            	ldw	x,sp
 861  00c7 1c000f        	addw	x,#OFST-3
 863  00ca f6            ld A,(X)
 864  00cb 88            push A
 865  00cc 86            pop CC
 867                     ; 449                     status = ATOM_ERR_CONTEXT;
 869  00cd a6c8          	ld	a,#200
 870  00cf 6b10          	ld	(OFST-2,sp),a
 871  00d1 201a          	jra	L723
 872  00d3               L333:
 873                     ; 455                 CRITICAL_END();
 875  00d3 96            	ldw	x,sp
 876  00d4 1c000f        	addw	x,#OFST-3
 878  00d7 f6            ld A,(X)
 879  00d8 88            push A
 880  00d9 86            pop CC
 882                     ; 456                 status = ATOM_WOULDBLOCK;
 884  00da a603          	ld	a,#3
 885  00dc 6b10          	ld	(OFST-2,sp),a
 886  00de 200d          	jra	L723
 887  00e0               L133:
 888                     ; 462             sem->count--;
 890  00e0 1e13          	ldw	x,(OFST+1,sp)
 891  00e2 6a02          	dec	(2,x)
 892                     ; 465             CRITICAL_END ();
 894  00e4 96            	ldw	x,sp
 895  00e5 1c000f        	addw	x,#OFST-3
 897  00e8 f6            ld A,(X)
 898  00e9 88            push A
 899  00ea 86            pop CC
 901                     ; 468             status = ATOM_OK;
 903  00eb 0f10          	clr	(OFST-2,sp)
 904  00ed               L723:
 905                     ; 472     return (status);
 907  00ed 7b10          	ld	a,(OFST-2,sp)
 910  00ef 5b14          	addw	sp,#20
 911  00f1 81            	ret
 981                     ; 498 uint8_t atomSemPut (ATOM_SEM * sem)
 981                     ; 499 {
 982                     .text:	section	.text,new
 983  0000               _atomSemPut:
 985  0000 89            	pushw	x
 986  0001 5204          	subw	sp,#4
 987       00000004      OFST:	set	4
 990                     ; 505     if (sem == NULL)
 992  0003 a30000        	cpw	x,#0
 993  0006 2608          	jrne	L314
 994                     ; 508         status = ATOM_ERR_PARAM;
 996  0008 a6c9          	ld	a,#201
 997  000a 6b04          	ld	(OFST+0,sp),a
 999  000c ac940094      	jpf	L514
1000  0010               L314:
1001                     ; 513         CRITICAL_START ();
1003  0010 96            	ldw	x,sp
1004  0011 1c0001        	addw	x,#OFST-3
1006  0014 8a            push CC
1007  0015 84            pop a
1008  0016 f7            ld (X),A
1009  0017 9b            sim
1011                     ; 516         if (sem->suspQ)
1013  0018 1e05          	ldw	x,(OFST+1,sp)
1014  001a e601          	ld	a,(1,x)
1015  001c fa            	or	a,(x)
1016  001d 275a          	jreq	L714
1017                     ; 523             tcb_ptr = tcbDequeueHead (&sem->suspQ);
1019  001f 1e05          	ldw	x,(OFST+1,sp)
1020  0021 cd0000        	call	_tcbDequeueHead
1022  0024 1f02          	ldw	(OFST-2,sp),x
1023                     ; 524             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
1025  0026 1e02          	ldw	x,(OFST-2,sp)
1026  0028 89            	pushw	x
1027  0029 ae0000        	ldw	x,#_tcbReadyQ
1028  002c cd0000        	call	_tcbEnqueuePriority
1030  002f 85            	popw	x
1031  0030 4d            	tnz	a
1032  0031 270d          	jreq	L124
1033                     ; 527                 CRITICAL_END ();
1035  0033 96            	ldw	x,sp
1036  0034 1c0001        	addw	x,#OFST-3
1038  0037 f6            ld A,(X)
1039  0038 88            push A
1040  0039 86            pop CC
1042                     ; 530                 status = ATOM_ERR_QUEUE;
1044  003a a6cc          	ld	a,#204
1045  003c 6b04          	ld	(OFST+0,sp),a
1047  003e 2054          	jra	L514
1048  0040               L124:
1049                     ; 535                 tcb_ptr->suspend_wake_status = ATOM_OK;
1051  0040 1e02          	ldw	x,(OFST-2,sp)
1052  0042 6f0e          	clr	(14,x)
1053                     ; 538                 if ((tcb_ptr->suspend_timo_cb != NULL)
1053                     ; 539                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1055  0044 1e02          	ldw	x,(OFST-2,sp)
1056  0046 e610          	ld	a,(16,x)
1057  0048 ea0f          	or	a,(15,x)
1058  004a 2710          	jreq	L524
1060  004c 1e02          	ldw	x,(OFST-2,sp)
1061  004e ee0f          	ldw	x,(15,x)
1062  0050 cd0000        	call	_atomTimerCancel
1064  0053 4d            	tnz	a
1065  0054 2706          	jreq	L524
1066                     ; 542                     status = ATOM_ERR_TIMER;
1068  0056 a6cd          	ld	a,#205
1069  0058 6b04          	ld	(OFST+0,sp),a
1071  005a 2008          	jra	L724
1072  005c               L524:
1073                     ; 547                     tcb_ptr->suspend_timo_cb = NULL;
1075  005c 1e02          	ldw	x,(OFST-2,sp)
1076  005e 905f          	clrw	y
1077  0060 ef0f          	ldw	(15,x),y
1078                     ; 550                     status = ATOM_OK;
1080  0062 0f04          	clr	(OFST+0,sp)
1081  0064               L724:
1082                     ; 554                 CRITICAL_END ();
1084  0064 96            	ldw	x,sp
1085  0065 1c0001        	addw	x,#OFST-3
1087  0068 f6            ld A,(X)
1088  0069 88            push A
1089  006a 86            pop CC
1091                     ; 561                 if (atomCurrentContext())
1093  006b cd0000        	call	_atomCurrentContext
1095  006e a30000        	cpw	x,#0
1096  0071 2721          	jreq	L514
1097                     ; 562                     atomSched (FALSE);
1099  0073 4f            	clr	a
1100  0074 cd0000        	call	_atomSched
1102  0077 201b          	jra	L514
1103  0079               L714:
1104                     ; 570             if (sem->count == 255)
1106  0079 1e05          	ldw	x,(OFST+1,sp)
1107  007b e602          	ld	a,(2,x)
1108  007d a1ff          	cp	a,#255
1109  007f 2606          	jrne	L534
1110                     ; 573                 status = ATOM_ERR_OVF;
1112  0081 a6cb          	ld	a,#203
1113  0083 6b04          	ld	(OFST+0,sp),a
1115  0085 2006          	jra	L734
1116  0087               L534:
1117                     ; 578                 sem->count++;
1119  0087 1e05          	ldw	x,(OFST+1,sp)
1120  0089 6c02          	inc	(2,x)
1121                     ; 579                 status = ATOM_OK;
1123  008b 0f04          	clr	(OFST+0,sp)
1124  008d               L734:
1125                     ; 583             CRITICAL_END ();
1127  008d 96            	ldw	x,sp
1128  008e 1c0001        	addw	x,#OFST-3
1130  0091 f6            ld A,(X)
1131  0092 88            push A
1132  0093 86            pop CC
1134  0094               L514:
1135                     ; 587     return (status);
1137  0094 7b04          	ld	a,(OFST+0,sp)
1140  0096 5b06          	addw	sp,#6
1141  0098 81            	ret
1192                     ; 608 uint8_t atomSemResetCount (ATOM_SEM *sem, uint8_t count)
1192                     ; 609 {
1193                     .text:	section	.text,new
1194  0000               _atomSemResetCount:
1196  0000 89            	pushw	x
1197  0001 88            	push	a
1198       00000001      OFST:	set	1
1201                     ; 613     if (sem == NULL)
1203  0002 a30000        	cpw	x,#0
1204  0005 2606          	jrne	L564
1205                     ; 616         status = ATOM_ERR_PARAM;
1207  0007 a6c9          	ld	a,#201
1208  0009 6b01          	ld	(OFST+0,sp),a
1210  000b 2008          	jra	L764
1211  000d               L564:
1212                     ; 621         sem->count = count;
1214  000d 7b06          	ld	a,(OFST+5,sp)
1215  000f 1e02          	ldw	x,(OFST+1,sp)
1216  0011 e702          	ld	(2,x),a
1217                     ; 624         status = ATOM_OK;
1219  0013 0f01          	clr	(OFST+0,sp)
1220  0015               L764:
1221                     ; 627     return (status);
1223  0015 7b01          	ld	a,(OFST+0,sp)
1226  0017 5b03          	addw	sp,#3
1227  0019 81            	ret
1285                     ; 644 static void atomSemTimerCallback (POINTER cb_data)
1285                     ; 645 {
1286                     .text:	section	.text,new
1287  0000               L3_atomSemTimerCallback:
1289  0000 5203          	subw	sp,#3
1290       00000003      OFST:	set	3
1293                     ; 650     timer_data_ptr = (SEM_TIMER *)cb_data;
1295  0002 1f02          	ldw	(OFST-1,sp),x
1296                     ; 653     if (timer_data_ptr)
1298  0004 1e02          	ldw	x,(OFST-1,sp)
1299  0006 2734          	jreq	L715
1300                     ; 656         CRITICAL_START ();
1302  0008 96            	ldw	x,sp
1303  0009 1c0001        	addw	x,#OFST-2
1305  000c 8a            push CC
1306  000d 84            pop a
1307  000e f7            ld (X),A
1308  000f 9b            sim
1310                     ; 659         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1312  0010 1e02          	ldw	x,(OFST-1,sp)
1313  0012 fe            	ldw	x,(x)
1314  0013 a602          	ld	a,#2
1315  0015 e70e          	ld	(14,x),a
1316                     ; 662         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1318  0017 1e02          	ldw	x,(OFST-1,sp)
1319  0019 fe            	ldw	x,(x)
1320  001a 905f          	clrw	y
1321  001c ef0f          	ldw	(15,x),y
1322                     ; 665         (void)tcbDequeueEntry (&timer_data_ptr->sem_ptr->suspQ, timer_data_ptr->tcb_ptr);
1324  001e 1e02          	ldw	x,(OFST-1,sp)
1325  0020 fe            	ldw	x,(x)
1326  0021 89            	pushw	x
1327  0022 1e04          	ldw	x,(OFST+1,sp)
1328  0024 ee02          	ldw	x,(2,x)
1329  0026 cd0000        	call	_tcbDequeueEntry
1331  0029 85            	popw	x
1332                     ; 668         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1334  002a 1e02          	ldw	x,(OFST-1,sp)
1335  002c fe            	ldw	x,(x)
1336  002d 89            	pushw	x
1337  002e ae0000        	ldw	x,#_tcbReadyQ
1338  0031 cd0000        	call	_tcbEnqueuePriority
1340  0034 85            	popw	x
1341                     ; 671         CRITICAL_END ();
1343  0035 96            	ldw	x,sp
1344  0036 1c0001        	addw	x,#OFST-2
1346  0039 f6            ld A,(X)
1347  003a 88            push A
1348  003b 86            pop CC
1350  003c               L715:
1351                     ; 678 }
1354  003c 5b03          	addw	sp,#3
1355  003e 81            	ret
1368                     	xdef	_atomSemResetCount
1369                     	xdef	_atomSemPut
1370                     	xdef	_atomSemGet
1371                     	xdef	_atomSemDelete
1372                     	xdef	_atomSemCreate
1373                     	xref	_atomCurrentContext
1374                     	xref	_tcbDequeueEntry
1375                     	xref	_tcbDequeueHead
1376                     	xref	_tcbEnqueuePriority
1377                     	xref	_atomSched
1378                     	xref	_tcbReadyQ
1379                     	xref	_atomTimerCancel
1380                     	xref	_atomTimerRegister
1399                     	xref	c_lzmp
1400                     	end
