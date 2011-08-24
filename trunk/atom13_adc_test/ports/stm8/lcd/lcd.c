#ifndef LCD_C
#define LCD_C

#include "lcd.h"

void LCD_STR(const unsigned char *text){
	while(*text){
	LCD_DATA(*text++,1);
	}
}

void initLCD(void){
	GPIO_DeInit(LCD_PORT);
	GPIO_Init(LCD_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);

	GPIO_WriteLow(LCD_PORT,LCD_E); //clear enable
	GPIO_WriteLow(LCD_PORT,LCD_RS); //going to write command
   
	DelayMS(30); //delay for LCD to initialise.
	LCD_NYB(0x03,0); //Required for initialisation
	DelayMS(5); //required delay
	LCD_NYB(0x03,0); //Required for initialisation
	DelayMS(1); //required delay
	LCD_DATA(0x02,0); //set to 4 bit interface, 1 line and 5*7 font
	LCD_DATA(0x28,0); //set to 4 bit interface, 2 line and 5*10 font
	LCD_DATA(0x0c,0); //set to 4 bit interface, 2 line and 5*7 font
	LCD_DATA(0x01,0); //clear display
	LCD_DATA(0x06,0); //move cursor right after write
}

void LCD_DATA(unsigned char data,unsigned char type){
	DelayMS(10); //TEST LCD FOR BUSY 
	LCD_NYB(data>>4,type); //WRITE THE UPPER NIBBLE
	LCD_NYB(data,type); //WRITE THE LOWER NIBBLE
}


void LCD_NYB(unsigned char nyb, char type){
	unsigned char temp;
	temp = (nyb<<4) & 0xF0;
	GPIO_Write(LCD_PORT,temp);
   
	if(type == 0){
		GPIO_WriteLow(LCD_PORT,LCD_RS); //COMMAND MODE
	} else {
	GPIO_WriteHigh(LCD_PORT,LCD_RS); //CHARACTER/DATA MODE
	}
   
	GPIO_WriteHigh(LCD_PORT,LCD_E); //ENABLE LCD DATA LINE
	DelayMS(1); //SMALL DELAY
	GPIO_WriteLow(LCD_PORT,LCD_E); //DISABLE LCD DATA LINE
}

void LCD_LINE(char line){
	switch(line){
	case 0:
	case 1:
	LCD_DATA(0x80,0);
	break;
	case 2:
	LCD_DATA(0xC0,0);
	break;
	}
}

void DelayMS(int delay){
	int nCount = 0;
	while (delay != 0){
		nCount = 100;
		while (nCount != 0){
			nCount--;
		}
		delay--;
	}
}


#endif

