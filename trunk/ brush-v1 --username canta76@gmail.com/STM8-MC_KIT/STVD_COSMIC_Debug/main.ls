   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  48                     ; 31 void main(void)
  48                     ; 32 {
  50                     	switch	.text
  51  0000               _main:
  55  0000               L12:
  56                     ; 36 		StateMachineExec();
  58  0000 cd0000        	call	_StateMachineExec
  61  0003 20fb          	jra	L12
  84                     ; 54 void assert_failed(void)
  84                     ; 55 #endif
  84                     ; 56 {
  85                     	switch	.text
  86  0005               _assert_failed:
  90  0005               L53:
  91  0005 20fe          	jra	L53
 104                     	xdef	_assert_failed
 105                     	xdef	_main
 106                     	xref	_StateMachineExec
 125                     	end
