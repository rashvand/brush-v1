   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
 121                     ; 65 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 121                     ; 66 {
 123                     	switch	.text
 124  0000               _RST_GetFlagStatus:
 128                     ; 68   assert_param(IS_RST_FLAG_OK(RST_Flag));
 130                     ; 72   return ((FlagStatus)((u8)RST->SR & (u8)RST_Flag));
 132  0000 c450b3        	and	a,20659
 135  0003 81            	ret	
 170                     ; 90 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 170                     ; 91 {
 171                     	switch	.text
 172  0004               _RST_ClearFlag:
 176                     ; 93   assert_param(IS_RST_FLAG_OK(RST_Flag));
 178                     ; 95   RST->SR = (u8)RST_Flag;
 180  0004 c750b3        	ld	20659,a
 181                     ; 96 }
 184  0007 81            	ret	
 197                     	xdef	_RST_ClearFlag
 198                     	xdef	_RST_GetFlagStatus
 217                     	end
