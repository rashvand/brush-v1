#ifndef LCD_H
#define LCD_H

#include "stm8s.h"

#define LCD_PORT GPIOB
#define LCD_RS GPIO_PIN_0
#define LCD_E GPIO_PIN_1

void DelayMS(int delay);
void initLCD(void);
void LCD_DATA(unsigned char data,unsigned char type);
void LCD_NYB(unsigned char nyb, char type);
void LCD_LINE(char line);
void LCD_STR(const unsigned char *text);

#endif
