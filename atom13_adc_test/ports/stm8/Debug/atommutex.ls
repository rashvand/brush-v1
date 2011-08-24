   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
 262                     ; 144 uint8_t atomMutexCreate (ATOM_MUTEX *mutex)
 262                     ; 145 {
 264                     .text:	section	.text,new
 265  0000               _atomMutexCreate:
 267  0000 89            	pushw	x
 268  0001 88            	push	a
 269       00000001      OFST:	set	1
 272                     ; 149     if (mutex == NULL)
 274  0002 a30000        	cpw	x,#0
 275  0005 2606          	jrne	L751
 276                     ; 152         status = ATOM_ERR_PARAM;
 278  0007 a6c9          	ld	a,#201
 279  0009 6b01          	ld	(OFST+0,sp),a
 281  000b 2011          	jra	L161
 282  000d               L751:
 283                     ; 157         mutex->owner = NULL;
 285  000d 1e02          	ldw	x,(OFST+1,sp)
 286  000f 905f          	clrw	y
 287  0011 ef02          	ldw	(2,x),y
 288                     ; 160         mutex->count = 0;
 290  0013 1e02          	ldw	x,(OFST+1,sp)
 291  0015 6f04          	clr	(4,x)
 292                     ; 163         mutex->suspQ = NULL;
 294  0017 1e02          	ldw	x,(OFST+1,sp)
 295  0019 905f          	clrw	y
 296  001b ff            	ldw	(x),y
 297                     ; 166         status = ATOM_OK;
 299  001c 0f01          	clr	(OFST+0,sp)
 300  001e               L161:
 301                     ; 169     return (status);
 303  001e 7b01          	ld	a,(OFST+0,sp)
 306  0020 5b03          	addw	sp,#3
 307  0022 81            	ret
 384                     ; 193 uint8_t atomMutexDelete (ATOM_MUTEX *mutex)
 384                     ; 194 {
 385                     .text:	section	.text,new
 386  0000               _atomMutexDelete:
 388  0000 89            	pushw	x
 389  0001 5205          	subw	sp,#5
 390       00000005      OFST:	set	5
 393                     ; 198     uint8_t woken_threads = FALSE;
 395  0003 0f01          	clr	(OFST-4,sp)
 396                     ; 201     if (mutex == NULL)
 398  0005 a30000        	cpw	x,#0
 399  0008 2608          	jrne	L712
 400                     ; 204         status = ATOM_ERR_PARAM;
 402  000a a6c9          	ld	a,#201
 403  000c 6b02          	ld	(OFST-3,sp),a
 405  000e ac920092      	jpf	L122
 406  0012               L712:
 407                     ; 209         status = ATOM_OK;
 409  0012 0f02          	clr	(OFST-3,sp)
 410  0014               L322:
 411                     ; 215             CRITICAL_START ();
 413  0014 96            	ldw	x,sp
 414  0015 1c0003        	addw	x,#OFST-2
 416  0018 8a            push CC
 417  0019 84            pop a
 418  001a f7            ld (X),A
 419  001b 9b            sim
 421                     ; 218             tcb_ptr = tcbDequeueHead (&mutex->suspQ);
 423  001c 1e06          	ldw	x,(OFST+1,sp)
 424  001e cd0000        	call	_tcbDequeueHead
 426  0021 1f04          	ldw	(OFST-1,sp),x
 427                     ; 221             if (tcb_ptr)
 429  0023 1e04          	ldw	x,(OFST-1,sp)
 430  0025 2752          	jreq	L722
 431                     ; 224                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 433  0027 1e04          	ldw	x,(OFST-1,sp)
 434  0029 a6ca          	ld	a,#202
 435  002b e70e          	ld	(14,x),a
 436                     ; 227                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 438  002d 1e04          	ldw	x,(OFST-1,sp)
 439  002f 89            	pushw	x
 440  0030 ae0000        	ldw	x,#_tcbReadyQ
 441  0033 cd0000        	call	_tcbEnqueuePriority
 443  0036 85            	popw	x
 444  0037 4d            	tnz	a
 445  0038 270d          	jreq	L132
 446                     ; 230                     CRITICAL_END ();
 448  003a 96            	ldw	x,sp
 449  003b 1c0003        	addw	x,#OFST-2
 451  003e f6            ld A,(X)
 452  003f 88            push A
 453  0040 86            pop CC
 455                     ; 233                     status = ATOM_ERR_QUEUE;
 457  0041 a6cc          	ld	a,#204
 458  0043 6b02          	ld	(OFST-3,sp),a
 459                     ; 234                     break;
 461  0045 2039          	jra	L522
 462  0047               L132:
 463                     ; 238                 if (tcb_ptr->suspend_timo_cb)
 465  0047 1e04          	ldw	x,(OFST-1,sp)
 466  0049 e610          	ld	a,(16,x)
 467  004b ea0f          	or	a,(15,x)
 468  004d 271d          	jreq	L332
 469                     ; 241                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 471  004f 1e04          	ldw	x,(OFST-1,sp)
 472  0051 ee0f          	ldw	x,(15,x)
 473  0053 cd0000        	call	_atomTimerCancel
 475  0056 4d            	tnz	a
 476  0057 270d          	jreq	L532
 477                     ; 244                         CRITICAL_END ();
 479  0059 96            	ldw	x,sp
 480  005a 1c0003        	addw	x,#OFST-2
 482  005d f6            ld A,(X)
 483  005e 88            push A
 484  005f 86            pop CC
 486                     ; 247                         status = ATOM_ERR_TIMER;
 488  0060 a6cd          	ld	a,#205
 489  0062 6b02          	ld	(OFST-3,sp),a
 490                     ; 248                         break;
 492  0064 201a          	jra	L522
 493  0066               L532:
 494                     ; 252                     tcb_ptr->suspend_timo_cb = NULL;
 496  0066 1e04          	ldw	x,(OFST-1,sp)
 497  0068 905f          	clrw	y
 498  006a ef0f          	ldw	(15,x),y
 499  006c               L332:
 500                     ; 257                 CRITICAL_END ();
 502  006c 96            	ldw	x,sp
 503  006d 1c0003        	addw	x,#OFST-2
 505  0070 f6            ld A,(X)
 506  0071 88            push A
 507  0072 86            pop CC
 509                     ; 260                 woken_threads = TRUE;
 511  0073 a601          	ld	a,#1
 512  0075 6b01          	ld	(OFST-4,sp),a
 514  0077 209b          	jra	L322
 515  0079               L722:
 516                     ; 267                 CRITICAL_END ();
 518  0079 96            	ldw	x,sp
 519  007a 1c0003        	addw	x,#OFST-2
 521  007d f6            ld A,(X)
 522  007e 88            push A
 523  007f 86            pop CC
 525                     ; 268                 break;
 526  0080               L522:
 527                     ; 273         if (woken_threads == TRUE)
 529  0080 7b01          	ld	a,(OFST-4,sp)
 530  0082 a101          	cp	a,#1
 531  0084 260c          	jrne	L122
 532                     ; 279             if (atomCurrentContext())
 534  0086 cd0000        	call	_atomCurrentContext
 536  0089 a30000        	cpw	x,#0
 537  008c 2704          	jreq	L122
 538                     ; 280                 atomSched (FALSE);
 540  008e 4f            	clr	a
 541  008f cd0000        	call	_atomSched
 543  0092               L122:
 544                     ; 284     return (status);
 546  0092 7b02          	ld	a,(OFST-3,sp)
 549  0094 5b07          	addw	sp,#7
 550  0096 81            	ret
 679                     ; 340 uint8_t atomMutexGet (ATOM_MUTEX *mutex, int32_t timeout)
 679                     ; 341 {
 680                     .text:	section	.text,new
 681  0000               _atomMutexGet:
 683  0000 89            	pushw	x
 684  0001 5212          	subw	sp,#18
 685       00000012      OFST:	set	18
 688                     ; 349     if (mutex == NULL)
 690  0003 a30000        	cpw	x,#0
 691  0006 2608          	jrne	L133
 692                     ; 352         status = ATOM_ERR_PARAM;
 694  0008 a6c9          	ld	a,#201
 695  000a 6b10          	ld	(OFST-2,sp),a
 697  000c ac210121      	jpf	L333
 698  0010               L133:
 699                     ; 357         curr_tcb_ptr = atomCurrentContext();
 701  0010 cd0000        	call	_atomCurrentContext
 703  0013 1f11          	ldw	(OFST-1,sp),x
 704                     ; 360         CRITICAL_START ();
 706  0015 96            	ldw	x,sp
 707  0016 1c000f        	addw	x,#OFST-3
 709  0019 8a            push CC
 710  001a 84            pop a
 711  001b f7            ld (X),A
 712  001c 9b            sim
 714                     ; 367         if (curr_tcb_ptr == NULL)
 716  001d 1e11          	ldw	x,(OFST-1,sp)
 717  001f 260f          	jrne	L533
 718                     ; 370             CRITICAL_END ();
 720  0021 96            	ldw	x,sp
 721  0022 1c000f        	addw	x,#OFST-3
 723  0025 f6            ld A,(X)
 724  0026 88            push A
 725  0027 86            pop CC
 727                     ; 373             status = ATOM_ERR_CONTEXT;
 729  0028 a6c8          	ld	a,#200
 730  002a 6b10          	ld	(OFST-2,sp),a
 732  002c ac210121      	jpf	L333
 733  0030               L533:
 734                     ; 377         else if ((mutex->owner != NULL) && (mutex->owner != curr_tcb_ptr))
 736  0030 1e13          	ldw	x,(OFST+1,sp)
 737  0032 e603          	ld	a,(3,x)
 738  0034 ea02          	or	a,(2,x)
 739  0036 2603          	jrne	L21
 740  0038 cc00f8        	jp	L143
 741  003b               L21:
 743  003b 1e13          	ldw	x,(OFST+1,sp)
 744  003d 9093          	ldw	y,x
 745  003f 51            	exgw	x,y
 746  0040 ee02          	ldw	x,(2,x)
 747  0042 1311          	cpw	x,(OFST-1,sp)
 748  0044 51            	exgw	x,y
 749  0045 2603          	jrne	L41
 750  0047 cc00f8        	jp	L143
 751  004a               L41:
 752                     ; 380             if (timeout >= 0)
 754  004a 9c            	rvf
 755  004b 9c            	rvf
 756  004c 0d17          	tnz	(OFST+5,sp)
 757  004e 2e03          	jrsge	L61
 758  0050 cc00eb        	jp	L343
 759  0053               L61:
 760                     ; 383                 if (tcbEnqueuePriority (&mutex->suspQ, curr_tcb_ptr) != ATOM_OK)
 762  0053 1e11          	ldw	x,(OFST-1,sp)
 763  0055 89            	pushw	x
 764  0056 1e15          	ldw	x,(OFST+3,sp)
 765  0058 cd0000        	call	_tcbEnqueuePriority
 767  005b 85            	popw	x
 768  005c 4d            	tnz	a
 769  005d 270f          	jreq	L543
 770                     ; 386                     CRITICAL_END ();
 772  005f 96            	ldw	x,sp
 773  0060 1c000f        	addw	x,#OFST-3
 775  0063 f6            ld A,(X)
 776  0064 88            push A
 777  0065 86            pop CC
 779                     ; 389                     status = ATOM_ERR_QUEUE;
 781  0066 a6cc          	ld	a,#204
 782  0068 6b10          	ld	(OFST-2,sp),a
 784  006a ac210121      	jpf	L333
 785  006e               L543:
 786                     ; 394                     curr_tcb_ptr->suspended = TRUE;
 788  006e 1e11          	ldw	x,(OFST-1,sp)
 789  0070 a601          	ld	a,#1
 790  0072 e70d          	ld	(13,x),a
 791                     ; 397                     status = ATOM_OK;
 793  0074 0f10          	clr	(OFST-2,sp)
 794                     ; 400                     if (timeout)
 796  0076 96            	ldw	x,sp
 797  0077 1c0017        	addw	x,#OFST+5
 798  007a cd0000        	call	c_lzmp
 800  007d 2747          	jreq	L153
 801                     ; 403                         timer_data.tcb_ptr = curr_tcb_ptr;
 803  007f 1e11          	ldw	x,(OFST-1,sp)
 804  0081 1f01          	ldw	(OFST-17,sp),x
 805                     ; 404                         timer_data.mutex_ptr = mutex;
 807  0083 1e13          	ldw	x,(OFST+1,sp)
 808  0085 1f03          	ldw	(OFST-15,sp),x
 809                     ; 407                         timer_cb.cb_func = atomMutexTimerCallback;
 811  0087 ae0000        	ldw	x,#L3_atomMutexTimerCallback
 812  008a 1f05          	ldw	(OFST-13,sp),x
 813                     ; 408                         timer_cb.cb_data = (POINTER)&timer_data;
 815  008c 96            	ldw	x,sp
 816  008d 1c0001        	addw	x,#OFST-17
 817  0090 1f07          	ldw	(OFST-11,sp),x
 818                     ; 409                         timer_cb.cb_ticks = timeout;
 820  0092 1e19          	ldw	x,(OFST+7,sp)
 821  0094 1f0b          	ldw	(OFST-7,sp),x
 822  0096 1e17          	ldw	x,(OFST+5,sp)
 823  0098 1f09          	ldw	(OFST-9,sp),x
 824                     ; 416                         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 826  009a 96            	ldw	x,sp
 827  009b 1c0005        	addw	x,#OFST-13
 828  009e 1611          	ldw	y,(OFST-1,sp)
 829  00a0 90ef0f        	ldw	(15,y),x
 830                     ; 419                         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 832  00a3 96            	ldw	x,sp
 833  00a4 1c0005        	addw	x,#OFST-13
 834  00a7 cd0000        	call	_atomTimerRegister
 836  00aa 4d            	tnz	a
 837  00ab 271f          	jreq	L553
 838                     ; 422                             status = ATOM_ERR_TIMER;
 840  00ad a6cd          	ld	a,#205
 841  00af 6b10          	ld	(OFST-2,sp),a
 842                     ; 425                             (void)tcbDequeueEntry (&mutex->suspQ, curr_tcb_ptr);
 844  00b1 1e11          	ldw	x,(OFST-1,sp)
 845  00b3 89            	pushw	x
 846  00b4 1e15          	ldw	x,(OFST+3,sp)
 847  00b6 cd0000        	call	_tcbDequeueEntry
 849  00b9 85            	popw	x
 850                     ; 426                             curr_tcb_ptr->suspended = FALSE;
 852  00ba 1e11          	ldw	x,(OFST-1,sp)
 853  00bc 6f0d          	clr	(13,x)
 854                     ; 427                             curr_tcb_ptr->suspend_timo_cb = NULL;
 856  00be 1e11          	ldw	x,(OFST-1,sp)
 857  00c0 905f          	clrw	y
 858  00c2 ef0f          	ldw	(15,x),y
 859  00c4 2006          	jra	L553
 860  00c6               L153:
 861                     ; 435                         curr_tcb_ptr->suspend_timo_cb = NULL;
 863  00c6 1e11          	ldw	x,(OFST-1,sp)
 864  00c8 905f          	clrw	y
 865  00ca ef0f          	ldw	(15,x),y
 866  00cc               L553:
 867                     ; 439                     CRITICAL_END ();
 869  00cc 96            	ldw	x,sp
 870  00cd 1c000f        	addw	x,#OFST-3
 872  00d0 f6            ld A,(X)
 873  00d1 88            push A
 874  00d2 86            pop CC
 876                     ; 442                     if (status == ATOM_OK)
 878  00d3 0d10          	tnz	(OFST-2,sp)
 879  00d5 264a          	jrne	L333
 880                     ; 449                         atomSched (FALSE);
 882  00d7 4f            	clr	a
 883  00d8 cd0000        	call	_atomSched
 885                     ; 455                         status = curr_tcb_ptr->suspend_wake_status;
 887  00db 1e11          	ldw	x,(OFST-1,sp)
 888  00dd e60e          	ld	a,(14,x)
 889  00df 6b10          	ld	(OFST-2,sp),a
 890                     ; 467                         if (status == ATOM_OK)
 892  00e1 0d10          	tnz	(OFST-2,sp)
 893  00e3 263c          	jrne	L333
 894                     ; 474                             mutex->count++;
 896  00e5 1e13          	ldw	x,(OFST+1,sp)
 897  00e7 6c04          	inc	(4,x)
 898  00e9 2036          	jra	L333
 899  00eb               L343:
 900                     ; 482                 CRITICAL_END();
 902  00eb 96            	ldw	x,sp
 903  00ec 1c000f        	addw	x,#OFST-3
 905  00ef f6            ld A,(X)
 906  00f0 88            push A
 907  00f1 86            pop CC
 909                     ; 483                 status = ATOM_WOULDBLOCK;
 911  00f2 a603          	ld	a,#3
 912  00f4 6b10          	ld	(OFST-2,sp),a
 913  00f6 2029          	jra	L333
 914  00f8               L143:
 915                     ; 491             if (mutex->count == 255)
 917  00f8 1e13          	ldw	x,(OFST+1,sp)
 918  00fa e604          	ld	a,(4,x)
 919  00fc a1ff          	cp	a,#255
 920  00fe 2606          	jrne	L763
 921                     ; 494                 status = ATOM_ERR_OVF;
 923  0100 a6cb          	ld	a,#203
 924  0102 6b10          	ld	(OFST-2,sp),a
 926  0104 2014          	jra	L173
 927  0106               L763:
 928                     ; 499                 mutex->count++;
 930  0106 1e13          	ldw	x,(OFST+1,sp)
 931  0108 6c04          	inc	(4,x)
 932                     ; 502                 if (mutex->owner == NULL)
 934  010a 1e13          	ldw	x,(OFST+1,sp)
 935  010c e603          	ld	a,(3,x)
 936  010e ea02          	or	a,(2,x)
 937  0110 2606          	jrne	L373
 938                     ; 504                     mutex->owner = curr_tcb_ptr;
 940  0112 1e13          	ldw	x,(OFST+1,sp)
 941  0114 1611          	ldw	y,(OFST-1,sp)
 942  0116 ef02          	ldw	(2,x),y
 943  0118               L373:
 944                     ; 508                 status = ATOM_OK;
 946  0118 0f10          	clr	(OFST-2,sp)
 947  011a               L173:
 948                     ; 512             CRITICAL_END ();
 950  011a 96            	ldw	x,sp
 951  011b 1c000f        	addw	x,#OFST-3
 953  011e f6            ld A,(X)
 954  011f 88            push A
 955  0120 86            pop CC
 957  0121               L333:
 958                     ; 516     return (status);
 960  0121 7b10          	ld	a,(OFST-2,sp)
 963  0123 5b14          	addw	sp,#20
 964  0125 81            	ret
1046                     ; 546 uint8_t atomMutexPut (ATOM_MUTEX * mutex)
1046                     ; 547 {
1047                     .text:	section	.text,new
1048  0000               _atomMutexPut:
1050  0000 89            	pushw	x
1051  0001 5204          	subw	sp,#4
1052       00000004      OFST:	set	4
1055                     ; 553     if (mutex == NULL)
1057  0003 a30000        	cpw	x,#0
1058  0006 2608          	jrne	L534
1059                     ; 556         status = ATOM_ERR_PARAM;
1061  0008 a6c9          	ld	a,#201
1062  000a 6b02          	ld	(OFST-2,sp),a
1064  000c acbd00bd      	jpf	L734
1065  0010               L534:
1066                     ; 561         curr_tcb_ptr = atomCurrentContext();
1068  0010 cd0000        	call	_atomCurrentContext
1070  0013 1f03          	ldw	(OFST-1,sp),x
1071                     ; 564         CRITICAL_START ();
1073  0015 96            	ldw	x,sp
1074  0016 1c0001        	addw	x,#OFST-3
1076  0019 8a            push CC
1077  001a 84            pop a
1078  001b f7            ld (X),A
1079  001c 9b            sim
1081                     ; 567         if (mutex->owner != curr_tcb_ptr)
1083  001d 1e05          	ldw	x,(OFST+1,sp)
1084  001f 9093          	ldw	y,x
1085  0021 51            	exgw	x,y
1086  0022 ee02          	ldw	x,(2,x)
1087  0024 1303          	cpw	x,(OFST-1,sp)
1088  0026 51            	exgw	x,y
1089  0027 270f          	jreq	L144
1090                     ; 570             CRITICAL_END ();
1092  0029 96            	ldw	x,sp
1093  002a 1c0001        	addw	x,#OFST-3
1095  002d f6            ld A,(X)
1096  002e 88            push A
1097  002f 86            pop CC
1099                     ; 573             status = ATOM_ERR_OWNERSHIP;
1101  0030 a6cf          	ld	a,#207
1102  0032 6b02          	ld	(OFST-2,sp),a
1104  0034 acbd00bd      	jpf	L734
1105  0038               L144:
1106                     ; 578             mutex->count--;
1108  0038 1e05          	ldw	x,(OFST+1,sp)
1109  003a 6a04          	dec	(4,x)
1110                     ; 581             if (mutex->count == 0)
1112  003c 1e05          	ldw	x,(OFST+1,sp)
1113  003e 6d04          	tnz	(4,x)
1114  0040 2702          	jreq	L22
1115  0042 2070          	jp	L544
1116  0044               L22:
1117                     ; 584                 mutex->owner = NULL;
1119  0044 1e05          	ldw	x,(OFST+1,sp)
1120  0046 905f          	clrw	y
1121  0048 ef02          	ldw	(2,x),y
1122                     ; 587                 if (mutex->suspQ)
1124  004a 1e05          	ldw	x,(OFST+1,sp)
1125  004c e601          	ld	a,(1,x)
1126  004e fa            	or	a,(x)
1127  004f 2758          	jreq	L744
1128                     ; 594                     tcb_ptr = tcbDequeueHead (&mutex->suspQ);
1130  0051 1e05          	ldw	x,(OFST+1,sp)
1131  0053 cd0000        	call	_tcbDequeueHead
1133  0056 1f03          	ldw	(OFST-1,sp),x
1134                     ; 595                     if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
1136  0058 1e03          	ldw	x,(OFST-1,sp)
1137  005a 89            	pushw	x
1138  005b ae0000        	ldw	x,#_tcbReadyQ
1139  005e cd0000        	call	_tcbEnqueuePriority
1141  0061 85            	popw	x
1142  0062 4d            	tnz	a
1143  0063 270d          	jreq	L154
1144                     ; 598                         CRITICAL_END ();
1146  0065 96            	ldw	x,sp
1147  0066 1c0001        	addw	x,#OFST-3
1149  0069 f6            ld A,(X)
1150  006a 88            push A
1151  006b 86            pop CC
1153                     ; 601                         status = ATOM_ERR_QUEUE;
1155  006c a6cc          	ld	a,#204
1156  006e 6b02          	ld	(OFST-2,sp),a
1158  0070 204b          	jra	L734
1159  0072               L154:
1160                     ; 606                         tcb_ptr->suspend_wake_status = ATOM_OK;
1162  0072 1e03          	ldw	x,(OFST-1,sp)
1163  0074 6f0e          	clr	(14,x)
1164                     ; 609                         mutex->owner = tcb_ptr;
1166  0076 1e05          	ldw	x,(OFST+1,sp)
1167  0078 1603          	ldw	y,(OFST-1,sp)
1168  007a ef02          	ldw	(2,x),y
1169                     ; 612                         if ((tcb_ptr->suspend_timo_cb != NULL)
1169                     ; 613                             && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1171  007c 1e03          	ldw	x,(OFST-1,sp)
1172  007e e610          	ld	a,(16,x)
1173  0080 ea0f          	or	a,(15,x)
1174  0082 2710          	jreq	L554
1176  0084 1e03          	ldw	x,(OFST-1,sp)
1177  0086 ee0f          	ldw	x,(15,x)
1178  0088 cd0000        	call	_atomTimerCancel
1180  008b 4d            	tnz	a
1181  008c 2706          	jreq	L554
1182                     ; 616                             status = ATOM_ERR_TIMER;
1184  008e a6cd          	ld	a,#205
1185  0090 6b02          	ld	(OFST-2,sp),a
1187  0092 2008          	jra	L754
1188  0094               L554:
1189                     ; 621                             tcb_ptr->suspend_timo_cb = NULL;
1191  0094 1e03          	ldw	x,(OFST-1,sp)
1192  0096 905f          	clrw	y
1193  0098 ef0f          	ldw	(15,x),y
1194                     ; 624                             status = ATOM_OK;
1196  009a 0f02          	clr	(OFST-2,sp)
1197  009c               L754:
1198                     ; 628                         CRITICAL_END ();
1200  009c 96            	ldw	x,sp
1201  009d 1c0001        	addw	x,#OFST-3
1203  00a0 f6            ld A,(X)
1204  00a1 88            push A
1205  00a2 86            pop CC
1207                     ; 635                         atomSched (FALSE);
1209  00a3 4f            	clr	a
1210  00a4 cd0000        	call	_atomSched
1212  00a7 2014          	jra	L734
1213  00a9               L744:
1214                     ; 646                     CRITICAL_END ();
1216  00a9 96            	ldw	x,sp
1217  00aa 1c0001        	addw	x,#OFST-3
1219  00ad f6            ld A,(X)
1220  00ae 88            push A
1221  00af 86            pop CC
1223                     ; 649                     status = ATOM_OK;
1225  00b0 0f02          	clr	(OFST-2,sp)
1226  00b2 2009          	jra	L734
1227  00b4               L544:
1228                     ; 660                 CRITICAL_END ();
1230  00b4 96            	ldw	x,sp
1231  00b5 1c0001        	addw	x,#OFST-3
1233  00b8 f6            ld A,(X)
1234  00b9 88            push A
1235  00ba 86            pop CC
1237                     ; 663                 status = ATOM_OK;
1239  00bb 0f02          	clr	(OFST-2,sp)
1240  00bd               L734:
1241                     ; 668     return (status);
1243  00bd 7b02          	ld	a,(OFST-2,sp)
1246  00bf 5b06          	addw	sp,#6
1247  00c1 81            	ret
1305                     ; 684 static void atomMutexTimerCallback (POINTER cb_data)
1305                     ; 685 {
1306                     .text:	section	.text,new
1307  0000               L3_atomMutexTimerCallback:
1309  0000 5203          	subw	sp,#3
1310       00000003      OFST:	set	3
1313                     ; 690     timer_data_ptr = (MUTEX_TIMER *)cb_data;
1315  0002 1f02          	ldw	(OFST-1,sp),x
1316                     ; 693     if (timer_data_ptr)
1318  0004 1e02          	ldw	x,(OFST-1,sp)
1319  0006 2734          	jreq	L315
1320                     ; 696         CRITICAL_START ();
1322  0008 96            	ldw	x,sp
1323  0009 1c0001        	addw	x,#OFST-2
1325  000c 8a            push CC
1326  000d 84            pop a
1327  000e f7            ld (X),A
1328  000f 9b            sim
1330                     ; 699         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1332  0010 1e02          	ldw	x,(OFST-1,sp)
1333  0012 fe            	ldw	x,(x)
1334  0013 a602          	ld	a,#2
1335  0015 e70e          	ld	(14,x),a
1336                     ; 702         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1338  0017 1e02          	ldw	x,(OFST-1,sp)
1339  0019 fe            	ldw	x,(x)
1340  001a 905f          	clrw	y
1341  001c ef0f          	ldw	(15,x),y
1342                     ; 705         (void)tcbDequeueEntry (&timer_data_ptr->mutex_ptr->suspQ, timer_data_ptr->tcb_ptr);
1344  001e 1e02          	ldw	x,(OFST-1,sp)
1345  0020 fe            	ldw	x,(x)
1346  0021 89            	pushw	x
1347  0022 1e04          	ldw	x,(OFST+1,sp)
1348  0024 ee02          	ldw	x,(2,x)
1349  0026 cd0000        	call	_tcbDequeueEntry
1351  0029 85            	popw	x
1352                     ; 708         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1354  002a 1e02          	ldw	x,(OFST-1,sp)
1355  002c fe            	ldw	x,(x)
1356  002d 89            	pushw	x
1357  002e ae0000        	ldw	x,#_tcbReadyQ
1358  0031 cd0000        	call	_tcbEnqueuePriority
1360  0034 85            	popw	x
1361                     ; 711         CRITICAL_END ();
1363  0035 96            	ldw	x,sp
1364  0036 1c0001        	addw	x,#OFST-2
1366  0039 f6            ld A,(X)
1367  003a 88            push A
1368  003b 86            pop CC
1370  003c               L315:
1371                     ; 718 }
1374  003c 5b03          	addw	sp,#3
1375  003e 81            	ret
1388                     	xdef	_atomMutexPut
1389                     	xdef	_atomMutexGet
1390                     	xdef	_atomMutexDelete
1391                     	xdef	_atomMutexCreate
1392                     	xref	_atomCurrentContext
1393                     	xref	_tcbDequeueEntry
1394                     	xref	_tcbDequeueHead
1395                     	xref	_tcbEnqueuePriority
1396                     	xref	_atomSched
1397                     	xref	_tcbReadyQ
1398                     	xref	_atomTimerCancel
1399                     	xref	_atomTimerRegister
1418                     	xref	c_lzmp
1419                     	end
