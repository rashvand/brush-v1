#ifndef _GLOBALDEF_H
#define _GLOBALDEF_H

//#define debug

#define error_allocation 12
#define error_unallocation 13

#define F_NORMAL 16e6      // frequency of XTALL
#define F_SAMPL_MAX 100e3  // maximum safe sampling frequency

/***************************************************************************/
typedef struct{
  unsigned char StartInputChannel       ;  // START INPUT CHANNEL number (0...5)
  unsigned char InputChannelCount       ;  // MAX INPUT CHANNEL number (1...6)
  signed int *  AddrADCDataStart        ;  // MEMORY start buffer (offset of data buffer)
  unsigned int  LengthADCData           ;  // MEMORY LENGTH buffer (high word)
  signed int *  AddrADCDataStartNoAlign ;  // MEMORY start buffer origin - not alligned for DMA  (offset of data buffer)
  unsigned char FreqvChannel            ;  // FREQUENCY CHANNEL (this channel used for frequency mearurement)
  unsigned int  NumOfConversions        ;  // NUMBER OF REQUESTED CONVERSIONS
  unsigned char EndOfAllConversions     ;  // END OF ALL CONVERSIONS (=0 if all data transfered; =1 if data transfer in progress)
  unsigned int  ConvNumber              ;  // CONVERSION NUMBER ... actual number of conversion
  double        SignalFrequency         ;  // NORMAL FREQUENCY ... primary frequency to counter trigger  
  double        NormalFrequency         ;  // NORMAL FREQUENCY ... primary frequency to counter trigger
  double        TriggerFrequency        ;  // TRIGGER FREQUENCY ... frequency of trigger
  double        TriggerFreqvError       ;  // ERROR OF TRIGGER FREQUENCY ... to the requested trigger frequency
  unsigned int  ErrNumber               ;  // ERROR NUMBER (if =0 => no errors)
} TParam, * PParam;

extern TParam param;
/***************************************************************************/
#endif //_GLOBALDEF_H