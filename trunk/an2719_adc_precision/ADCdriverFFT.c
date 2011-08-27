//functions for ADC data collecting for FFT analysis
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stm8s_clk.h>
#include "globaldefFFT.h"
#include "ADCdriverFFT.h"
#ifndef debug
 #include "ADCfncFFT.h"
#endif //debug


//global variable for FFT test configuration
TParam param =
{
  /*unsigned int  StartInputChannel=*/         0,     // MAX INPUT CHANNEL number (0...5)
  /*unsigned char InputChannelCount=*/         6,     // MAX INPUT CHANNEL number (1...6)
  /*signed int *  AddrADCDataStart =*/         0,     // MEMORY start buffer (offset of data buffer)
  /*unsigned int  LengthADCData =*/            0,     // MEMORY LENGTH buffer (high word)
  /*signed int *  AddrADCDataStartNoAlign =*/  0,     // MEMORY start buffer origin - not alligned for EvalBoard  (offset of data buffer)
  /*unsigned char FreqvChannel =*/             0,     // FREQUENCY CHANNEL (this channel used for frequency mearurement)
  /*unsigned int  NumOfConversions =*/         0,     // NUMBER OF REQUESTED CONVERSIONS
  /*unsigned char EndOfAllConversions =*/      0,     // END OF ALL CONVERSIONS (=0 if all data transfered; =1 if data transfer in progress)
  /*unsigned int  ConvNumber =*/               0,     // CONVERSION NUMBER ... actual number of conversion
  /*double        SignalFrequency =*/         50,     // SIGNAL FREQUENCY
  /*double        NormalFreqvency =*/          0,     // NORMAL FREQUENCY ... primary frequency to counter trigger
  /*double        TriggerFrequency =*/         0,     // TRIGGER FREQUENCY ... frequency of trigger
  /*double        TriggerFreqvError =*/        0,     // ERROR OF TRIGGER FREQUENCY ... to the requested trigger frequency
  /*unsigned int  ErrNumber =*/                0,     // ERROR NUMBER (if =0 => no errors)
};

/***************************************************************************/
/***************************************************************************/
//setting CPU clock for external or internal frequency - 16MHz
void SetCPUClock(unsigned char IntExt)
{
  if (IntExt)
  {
    CLK->CKDIVR = 0x00; // Fcpu = FHSI
    while(CLK->CCOR & CLK_CCOR_CCOBSY);
  }
  else
  {
    //enable external clock (HSE)
    CLK->ECKR  = 0x04;
    _asm("NOP");
    CLK->ECKR |= 0x01;
    //wait HSE ready
    while (!(CLK->ECKR & 0x2));
    //switch enable
    CLK->SWCR = 0x02;
    //select master clock
    CLK->SWR   = 0xB4;
    while (CLK->SWCR & 0x01);
    while(CLK->CMSR != 0xB4);
  }
}
/***************************************************************************/
/***************************************************************************/
unsigned int AllocateDataBuffer(PParam pparam)
{
    signed int * originBuf;
    signed int * databuf;
    unsigned long MAXSAMPLES = pparam->NumOfConversions;  //   NUMBER OF REQUESTED CONVERSIONS
    unsigned long sizeoriginBuf = 4*MAXSAMPLES+2;
    pparam->LengthADCData = sizeoriginBuf;
    if ((originBuf = (signed int * )malloc(sizeoriginBuf)) == NULL)
    {
      pparam->LengthADCData = 0;
      pparam->AddrADCDataStart = 0;
      pparam->AddrADCDataStartNoAlign = 0;
      pparam->ErrNumber = error_allocation;
      printf("Memory allocated error\n");
      return(error_allocation);
    }
    databuf = originBuf;

    pparam->AddrADCDataStart = databuf;
    pparam->AddrADCDataStartNoAlign = originBuf;
    pparam->ErrNumber = 0;     // (if =0 => no errors)
return(0);
}//AllocateDataBuffer
/***************************************************************************/
/***************************************************************************/
unsigned int UnAllocateDataBuffer(PParam pparam)
{
  signed int * originBuf;

  if (!pparam->AddrADCDataStartNoAlign)
  { printf("Memory unallocated error\n");
    return(error_unallocation);
  }
  originBuf = pparam->AddrADCDataStartNoAlign;
  free((void *)originBuf);
  pparam->LengthADCData = 0;
  pparam->AddrADCDataStart = 0;
  pparam->AddrADCDataStartNoAlign = 0;
  pparam->ErrNumber = 0;     // (if =0 => no errors)
  return(0);
}//UnAllocateDataBuffer
/***************************************************************************/
/***********************************************************************/
#ifndef debug
//start data sampling into memeory for FFT
void GetDataFromEvalBoard(PParam pparam)
{
  ADCStart();
}//GetDataFromEvalBoard
#endif //debug
/***************************************************************************/
/***************************************************************************/
void *AllocateEvalBoardBuffer(PParam pparam)
{
  AllocateDataBuffer(pparam);
  return(pparam->AddrADCDataStart);
}//AllocateEvalBoardBuffer
/***************************************************************************/
/***************************************************************************/
//check if all data (transfer in interrupt) were transfered
unsigned char ConvertInProgress(PParam pparam)
{
  return(!pparam->EndOfAllConversions);
}//ConvertInProgress
/***************************************************************************/
/***********************************************************************/
//initialization for ADC data collect
unsigned int InitEvalBoardcard(PParam pparam, unsigned int channels, unsigned int samplesperperiod, double * error)
{
  double fvzmax=F_SAMPL_MAX;
  double divider;
  unsigned int periods=0;
  unsigned int timerCount;
  do
  {
    periods++;
    divider= pparam->NormalFrequency / pparam->TriggerFrequency;
    //divider= periods * pparam->NormalFrequency / pparam->SignalFrequency / (double) samplesperperiod / (double) channels;
  } while((pparam->NormalFrequency/divider)>fvzmax);

  timerCount = ceil(divider);
  * error = ((double)(timerCount)-divider) / (double)(timerCount);
  #ifndef debug
    InitADCTimerTrigger(pparam, timerCount);
  #endif //debug

return(periods);
}/*InitEvalBoardcard*/
/***************************************************************************/
/***************************************************************************/
//parameter initialization
void InitEvalBoardparam(PParam pparam, unsigned int numsamples, unsigned int channels, double signalfrequency, unsigned int periods)
{
  pparam->NormalFrequency  = F_NORMAL; //frequency of etalon
  pparam->NumOfConversions = (numsamples*channels);
  pparam->TriggerFrequency = (pparam->NumOfConversions*signalfrequency)/periods;
  pparam->SignalFrequency  = signalfrequency;
  pparam->ErrNumber = 0;     // (if =0 => no errors)
}//InitEvalBoardparam
/***********************************************************************/
/***********************************************************************/
//returns maximum and minumum data from buffer
void GetMinMaxData(signed int *Buffer,unsigned int size,signed int * maximum,signed int * minimum)
{
  signed int m= (signed)(-0x8000),n= 32767;
  unsigned int i;
  for(i=0;i<size;i++)
  {
    if (Buffer[i]>m) m = Buffer[i];
    if (Buffer[i]<n) n = Buffer[i];
  }
  * maximum = m;
  * minimum = n;
}//GetMinMaxData
/***********************************************************************/
/***********************************************************************/
//auxiliary function for signal frequency measurement - returns number of points for one signal period
unsigned int GetPeriodIndex(signed int *Buffer,unsigned int size,signed int maximum,signed int minimum,double hysteresis)
{
  unsigned long m=0,n=0,minperiod=0,maxperiod=0,middle,minperiodold=0,maxperiodold=0;
  unsigned int i;
  signed int vzorka;

  middle = maximum/2 + minimum/2;
  maximum -= (((long)maximum-minimum)*hysteresis);
  minimum += (((long)maximum-minimum)*hysteresis);

  for (i=0;i<size;i++)
  {
    vzorka=Buffer[i];
    if ((m>=n) && (vzorka<minimum)) n=i;
    if ((m<=n) && (vzorka>maximum)) m=i;
    if ((m<n) && (maxperiodold>=minperiodold) && (vzorka<=middle))
      {
        if (minperiodold)
        {
          if (minperiod)
            minperiod = (i-minperiodold+minperiod)/2;
          else
            minperiod = i-minperiodold;
        }
        minperiodold = i;
      }
    if ((m>n) && (maxperiodold<=minperiodold) && (vzorka>=middle))
      {
        if (maxperiodold)
        {
          if (maxperiod)
            maxperiod = (i-maxperiodold+maxperiod)/2;
          else
            maxperiod = i-maxperiodold;
        }
        maxperiodold = i;
      }
  }
  if (maxperiod && minperiod)
    return (maxperiod+minperiod);
return((maxperiod+minperiod)*2);
}//GetPeriodIndex
/***********************************************************************/
/***********************************************************************/
#ifndef debug
//calculates signal frequency from sampled data - data is collected from one channel 
//collected data must have at least 2 periods
double GetDataFromEvalBoardfrequency(PParam pparam, double frequencycca, unsigned int channel)
{
  double smplerr;
  TParam tempparam;
  signed int *Buffer;
  signed int m,n;
  unsigned char i;
  unsigned char repeats = 10;
  unsigned int PeriodIndex;
  double frequencysum = 0;
  double frequencyexact = 0;

  frequencycca *= 0.9; //sample longer to sample more than expected 2 periods
  memcpy(&tempparam, pparam, sizeof(tempparam));
  tempparam.StartInputChannel = channel;     // first conversion from this channel
  tempparam.InputChannelCount = 1;     // only one channel
  Buffer = tempparam.AddrADCDataStart;

  for (i=1; i<=repeats; i++)
  {
    if(frequencycca<1) // if frequency is < 1 Hz
      return(0);
    InitEvalBoardparam(&tempparam,tempparam.NumOfConversions,1,frequencycca,2); //2 periods sampling
    InitEvalBoardcard(&tempparam, 1,tempparam.NumOfConversions,&smplerr); // 1 channel
    GetDataFromEvalBoard(&tempparam);
    while(ConvertInProgress(&tempparam));

    GetMinMaxData(Buffer,tempparam.NumOfConversions,&m,&n);
    PeriodIndex = GetPeriodIndex(Buffer,tempparam.NumOfConversions,m,n,0.01);
    if (!PeriodIndex)
    {
      frequencycca *= 0.8;
      i=0;
      frequencysum = 0;
      continue;
    }
    frequencyexact = frequencycca / ( (1+smplerr)*(PeriodIndex) / tempparam.NumOfConversions);
    frequencysum += frequencyexact;
  }
  frequencyexact = frequencysum/repeats;
  pparam->SignalFrequency = frequencyexact;
  return(frequencyexact);
}//GetDataFromEvalBoardfrequency
#endif //debug
/***********************************************************************/
/***********************************************************************/