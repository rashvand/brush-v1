//This file contains basic functions to control the mono LCD device.

#include "mono_lcd.h"

/* Private define ------------------------------------------------------------*/

/* This table contains the "S" of ST logo */
const u8 S_CGRAM[] =
  {
    /* 0~7 */
    0b00000011, 0b11111111,
    0b00000010, 0b00000000,
    0b00000100, 0b00000000,
    0b00000100, 0b00000000,
    0b00001100, 0b01111111,
    0b00001100, 0b01111111,
    0b00011100, 0b00111111,
    0b00011110, 0b00011111,
    /* 8~15 */
    0b00111111, 0b00001111,
    0b00111111, 0b10000111,
    0b01111111, 0b11000011,
    0b01111111, 0b11100011,
    0b00000000, 0b00000011,
    0b00000000, 0b00000011,
    0b00000000, 0b00000111,
    0b11111111, 0b11111110,
  };

/* This table contains the "T" of ST logo */
const u8 T_CGRAM[] =
  {
    /* 0~7 */
    0b11111111, 0b11111111,
    0b00000000, 0b00000000,
    0b00000000, 0b00000000,
    0b00000000, 0b00000000,
    0b11111000, 0b11111000,
    0b11110000, 0b11111000,
    0b11110000, 0b11110000,
    0b11110000, 0b11110000,
    /* 8~15 */
    0b11100001, 0b11100000,
    0b11100011, 0b11100000,
    0b11000011, 0b11000000,
    0b11000111, 0b11000000,
    0b10000111, 0b11000000,
    0b10001111, 0b10000000,
    0b00001111, 0b10000000,
    0b00011111, 0b00000000
  };


void LCD_Delay(u16 nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}

//Send a byte to LCD through the SPI peripheral
static u8 LCD_SPISendByte(u8 DataToSend)
{

  /* Send byte through the SPI peripheral */
  SPI->DR = DataToSend;

  while ((SPI->SR & SPI_SR_TXE) == 0)
  {
    /* Wait while the byte is transmitted */
  }

  while ((SPI->SR & SPI_SR_RXNE) == 0)
  {
    /* Wait to receive a byte */
  }

  /* Return the byte read from the SPI bus */
  return SPI->DR;
}


// Enable or Disable the LCD through CS pin
void LCD_ChipSelect(FunctionalState NewState)
{
  if (NewState == DISABLE)
  {
    GPIO_WriteLow(LCD_CS_PORT, LCD_CS_PIN); /* CS pin low: LCD disabled */
  }
  else
  {
    GPIO_WriteHigh(LCD_CS_PORT, LCD_CS_PIN); /* CS pin high: LCD enabled */
  }
}

// Enable or Disable the LCD backlight
void LCD_Backlight(FunctionalState NewState)
{
  if (NewState == DISABLE)
  {
    GPIO_WriteLow(LCD_BACKLIGHT_PORT, LCD_BACKLIGHT_PIN);
  }
  else
  {
    GPIO_WriteHigh(LCD_BACKLIGHT_PORT, LCD_BACKLIGHT_PIN);
  }
}

// Send a byte to LCD
void LCD_SendByte(u8 DataType, u8 DataToSend)
{

  LCD_ChipSelect(ENABLE); /* Enable access to LCD */

  LCD_SPISendByte(DataType); /* Send Synchro/Mode byte */
  LCD_SPISendByte((u8)(DataToSend & (u8)0xF0)); /* Send byte high nibble */
  LCD_SPISendByte((u8)((u8)(DataToSend << 4) & (u8)0xF0)); /* Send byte low nibble */

  LCD_ChipSelect(DISABLE); /* Disable access to LCD */

}

// Send a buffer to LCD
void LCD_SendBuffer(u8 *pTxBuffer, u8 *pRxBuffer, u8 NumByte)
{
  LCD_ChipSelect(ENABLE);
  while (NumByte--) /* while there is data to be read */
  {
    *pRxBuffer = LCD_SPISendByte(*pTxBuffer);
    pTxBuffer++;
    pRxBuffer++;
  }
  LCD_ChipSelect(DISABLE);
}

// Initialize the LCD
void LCD_Init(void)
{
  /* Set LCD ChipSelect pin in Output push-pull low level (chip select disabled) */
  GPIO_Init(LCD_CS_PORT, LCD_CS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

  /* Set LCD backlight pin in Output push-pull low level (backlight off) */
  GPIO_Init(LCD_BACKLIGHT_PORT, LCD_BACKLIGHT_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

  LCD_SendByte(COMMAND_TYPE, SET_TEXT_MODE); /* Set the LCD in TEXT mode */
  LCD_SendByte(COMMAND_TYPE, DISPLAY_ON); /* Enable the display */
  LCD_Clear(); /* Clear the LCD */
  LCD_SendByte(COMMAND_TYPE, ENTRY_MODE_SET_INC); /* Select the entry mode type */

}

// Clear the LCD
void LCD_Clear(void)
{
  u16 i;

  LCD_SendByte(COMMAND_TYPE, DISPLAY_CLR); /* Clear the LCD */
  /* Delay required to complete LCD clear command */
  for (i = 0; i < 5000; i++)
  {
  }
}

// Set the LCD in text mode
void LCD_SetTextMode(void)
{
  LCD_SendByte(COMMAND_TYPE, SET_TEXT_MODE);
  LCD_Clear();
}

// Set the LCD in graphic mode
void LCD_SetGraphicMode(void)
{
  LCD_Clear();
  LCD_SendByte(COMMAND_TYPE, SET_GRAPHIC_MODE);

}

// Clear one LCD line
void LCD_ClearLine(u8 Line)
{
  u8 CharPos;

  /* Select the line to be cleared */
  LCD_SendByte(COMMAND_TYPE, Line);

  /* Clear the selected line */
  for (CharPos = 0; CharPos < LCD_LINE_MAX_CHAR; CharPos++)
  {
    LCD_SendByte(DATA_TYPE, ' ');
  }
}

// Set the LCD cursor to the specified location
void LCD_SetCursorPos(u8 Line, u8 Offset)
{
  LCD_SendByte(COMMAND_TYPE, (u8)(Line + Offset));
}

// Display a character at the current cursor position
void LCD_PrintChar(u8 Ascii)
{
  LCD_SendByte(DATA_TYPE, Ascii);
}

// Display a string on the selected line of the LCD
void LCD_PrintString(u8 Line, FunctionalState AutoComplete, FunctionalState Append, u8 *ptr)
{
  u8 CharPos = 0;

  /* Set cursor position at beginning of Line if Append option is enabled */
  if (Append == DISABLE)
  {
    LCD_SendByte(COMMAND_TYPE, Line);
  }

  /* Display each character of the string */
  while ((*ptr != 0) && (CharPos < LCD_LINE_MAX_CHAR))
  {
    LCD_SendByte(DATA_TYPE, *ptr);
    CharPos++;
    ptr++;
  }

  /* Complete the line with spaces if AutoFill option is enabled */
  if (AutoComplete == ENABLE)
  {
    while (CharPos < LCD_LINE_MAX_CHAR)
    {
      LCD_SendByte(DATA_TYPE, ' ');
      CharPos++;
    }
  }
}

// Display a string on the LCD with automatic carriage return
void LCD_PrintMsg(u8 *ptr)
{
  u8 Char = 0;
  u8 CharPos = 0;

  LCD_Clear(); /* Clear the LCD display */

  /* Set cursor to home position on line 1 */
  LCD_SendByte(COMMAND_TYPE, LCD_LINE1);

  /* Send String */
  while ((*ptr != 0) && (CharPos < (LCD_LINE_MAX_CHAR * 2)))
  {
    /* Check if string length is bigger than LINE1 */
    if (CharPos == LCD_LINE_MAX_CHAR)
    {
      LCD_SendByte(COMMAND_TYPE, LCD_LINE2); /* Select second line */
    }

    Char = *ptr;

    switch (Char)
    {
      case ('\r'):
        /* Carriage return */
        CharPos++;
        ptr++;
      break;
      case ('\n'):
        CharPos = 0;
        ptr++;
        /* Set cursor to line 2 */
        LCD_SendByte(COMMAND_TYPE, LCD_LINE2);
      break;
      default:
        /* Display characters different from (\r, \n) */
        LCD_SendByte(DATA_TYPE, Char);
        CharPos++;
        ptr++;
      break;
    }
  }
}

// Display the Number in decimal format at the current cursor position
void LCD_PrintDec1(u8 Number)
{
  u8 NbreTmp;

  if (Number < (u8)10)
  {

    /* Display second digit of the number : 10 */
    NbreTmp = (u8)(Number / (u8)10);
    //LCD_PrintChar((u8)(NbreTmp + (u8)0x30));

    /* Display last digit of the number : Units */
    NbreTmp = (u8)(Number - (u8)((u8)10 * NbreTmp));
    LCD_PrintChar((u8)(NbreTmp + (u8)0x30));
  }
}

// Display the Number in decimal format at the current cursor position
void LCD_PrintDec2(u8 Number)
{
  u8 NbreTmp;

  if (Number < (u8)100)
  {

    /* Display second digit of the number : 10 */
    NbreTmp = (u8)(Number / (u8)10);
    LCD_PrintChar((u8)(NbreTmp + (u8)0x30));

    /* Display last digit of the number : Units */
    NbreTmp = (u8)(Number - (u8)((u8)10 * NbreTmp));
    LCD_PrintChar((u8)(NbreTmp + (u8)0x30));
  }
}

// Display the Number in decimal format at the current cursor position
void LCD_PrintDec3(u16 Number)
{
  u8 Nbre1Tmp;
  u8 Nbre2Tmp;

  if (Number < (u16)1000)
  {
    /* Display first digit of the number : 100 */
    Nbre1Tmp = (u8)(Number / (u8)100);
    LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));

    /* Display second digit of the number : 10 */
    Nbre1Tmp = (u8)(Number - ((u8)100 * Nbre1Tmp));
    Nbre2Tmp = (u8)(Nbre1Tmp / (u8)10);
    LCD_PrintChar((u8)(Nbre2Tmp + (u8)0x30));

    /* Display last digit of the number : Units */
    Nbre1Tmp = ((u8)(Nbre1Tmp - (u8)((u8)10 * Nbre2Tmp)));
    LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));
  }

}

// Display the Number in decimal format at the current cursor position
void LCD_PrintDec4(u16 Number)
{
  u16 Nbre1Tmp;
  u16 Nbre2Tmp;

  if (Number < (u16)10000)
  {
    /* Display first digit of the number : 1000 */
    Nbre1Tmp = (u16)(Number / (u16)1000);
    LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));

    /* Display second digit of the number : 100 */
    Nbre1Tmp = (u16)(Number - ((u16)1000 * Nbre1Tmp));
    Nbre2Tmp = (u16)(Nbre1Tmp / (u8)100);
    LCD_PrintChar((u8)(Nbre2Tmp + (u8)0x30));

    /* Display second digit of the number : 10 */
    Nbre1Tmp = (u16)(Nbre1Tmp - ((u16)100 * Nbre2Tmp));
    Nbre2Tmp = (u16)(Nbre1Tmp / (u16)10);
    LCD_PrintChar((u8)(Nbre2Tmp + (u8)0x30));

    /* Display last digit of the number : Units */
    Nbre1Tmp = ((u16)(Nbre1Tmp - (u16)((u16)10 * Nbre2Tmp)));
    LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));
  }
}

// Display the Number in Hexadecimal format at the current cursor position
void LCD_PrintHex1(u8 Number)
{
  if (Number < (u8)0x0A)
  {
    LCD_PrintChar((u8)(Number + (u8)0x30));
  }
  else
    if (Number < (u8)0x10)
    {
      LCD_PrintChar((u8)(Number + (u8)0x37));
    }
    else
    {
      LCD_PrintChar('-');
    }
}

// Display the Number in Hexadecimal format at the current cursor position
void LCD_PrintHex2(u8 Number)
{
  LCD_PrintHex1((u8)(Number >> (u8)4));
  LCD_PrintHex1((u8)(Number & (u8)0x0F));
}

// Display the Number in Hexadecimal format at the current cursor position
void LCD_PrintHex3(u16 Number)
{
  LCD_PrintHex1((u8)(Number >> (u8)8));
  LCD_PrintHex1((u8)((u8)(Number) >> (u8)4));
  LCD_PrintHex1((u8)((u8)(Number) & (u8)0x0F));
}

// Display the Number in binary format at the current cursor position
void LCD_PrintBin2(u8 Number)
{
  LCD_PrintHex1((u8)((u8)(Number & (u8)0x02) >> (u8)1));
  LCD_PrintHex1((u8)(Number & (u8)0x01));
}

// Display the Number in binary format at the current cursor position
void LCD_PrintBin4(u8 Number)
{
  LCD_PrintHex1((u8)((u8)(Number & (u8)0x08) >> (u8)3));
  LCD_PrintHex1((u8)((u8)(Number & (u8)0x04) >> (u8)2));
  LCD_PrintHex1((u8)((u8)(Number & (u8)0x02) >> (u8)1));
  LCD_PrintHex1((u8)(Number & (u8)0x01));
}

// Display CGRAM on even address
void LCD_DisplayCGRAM0(u8 address, u8 *ptrTable)
{
  u8 u;

  /* Set CGRAM Address */
  LCD_SendByte(COMMAND_TYPE, (u8)0x40);

  u = 32; /* Nb byte in the table */
  while (u)
  {
    LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
    u--;
  }

  /* Setup Display Address */
  LCD_SendByte(COMMAND_TYPE, address);
  LCD_SendByte(DATA_TYPE, (u8)0x00);
  LCD_SendByte(DATA_TYPE, (u8)0x00);
}

// Display CGRAM on odd address
void LCD_DisplayCGRAM1(u8 address, u8 *ptrTable)
{
  u8 u;

 /* Set CGRAM Address */
  LCD_SendByte(COMMAND_TYPE, (u8)((u8)0x40 | (u8)0x10));

  u = 32; /* Nb byte in the table */
  while (u)
  {
    LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
    u--;
  }

  /* Setup Display Address */
  LCD_SendByte(COMMAND_TYPE, (u8)(address + 1));
  LCD_SendByte(DATA_TYPE, (u8)0x00);
  LCD_SendByte(DATA_TYPE, (u8)0x02);
}

// Display ST logo
void LCD_DisplayLogo(u8 address)
{
  LCD_DisplayCGRAM0(address, S_CGRAM);
  LCD_DisplayCGRAM1(address, T_CGRAM);
}

// Display a string in rolling mode
void LCD_RollString(u8 Line, u8 *ptr, u16 speed)
{
  u8 CharPos = 0;
  u8 *ptr2;
  u16 i;

  /* Set cursor position at beginning of line */
  LCD_SendByte(COMMAND_TYPE, Line);

  ptr2 = ptr;

  /* Display each character of the string */
  while (*ptr2 != 0)
  {
    if (*ptr != 0)
    {
      LCD_SendByte(DATA_TYPE, *ptr);
      ptr++;
    }
    else
    {
      LCD_SendByte(DATA_TYPE, ' ');
    }

    CharPos++;

    if (CharPos == LCD_LINE_MAX_CHAR)
    {
      for(i=0; i<1000; i++) LCD_Delay(speed);
      LCD_ClearLine(Line);
      LCD_SendByte(COMMAND_TYPE, Line);
      CharPos = 0;
      ptr2++;
      ptr = ptr2;
    }
  }
}
