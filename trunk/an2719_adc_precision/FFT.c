// FFT analysis on  EvalBoard card - mathematics calculations
#define M_SQRT_2 (double)(0.70710678118654752440084436210485)
#define M_PI     (double)(3.1415926535897932384626433832795)

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "globaldefFFT.h"
#include "ADCdriverFFT.h"
#include "mono_lcd.h"


#define ENABLE_EXTERNAL_FRQ  0
#define ENABLE_INTERNAL_FRQ  1

/******************************* SYSTEM CONSTANTS **********************/
#define numsample 32
const double rangeAD = 2.5; // +/- voltage
const ADbits = 10;
const maxAD = 1<<ADbits;
/******************************* SYSTEM CONSTANTS **********************/

/******************************* TUNED CONSTANTS ***********************/
const double multiplierU = 32768.0/rangeAD;
const double multiplierI = 32768.0/rangeAD;
const long int multiplierEnaX = 65536l;
/******************************* TUNED CONSTANTS ***********************/

/******************************* GLOBAL DECLARATION *********************/
typedef struct{
    signed long r;
    signed long i;
              }complex;
typedef complex arraysamples[numsample];
typedef arraysamples * pointarraysamples;

typedef unsigned int arrayindex[numsample];
typedef arrayindex * pointarrayindex;

typedef signed int EvalBoardADCarray[6*numsample];
typedef EvalBoardADCarray * pointEvalBoardADCarray;

typedef double UIDistortionPowerPhase[3][6];
typedef UIDistortionPowerPhase * pointUIDistortionPowerPhase;

typedef complex HarmonicsType[3][2][numsample/2]; //3phases, 2=U,I
typedef HarmonicsType * pointHarmonics;

typedef struct{
    UIDistortionPowerPhase BasicResults;
    HarmonicsType Harmonics;
              } Results, * pointResults;

typedef enum { no_interpolation, linear_interpolation, kvadratic_interpolation } interpolation_type;

pointResults AnaResults;
pointEvalBoardADCarray BufferEvalBoardADC;
pointarraysamples arrayexp,smpl;
pointarrayindex arrayinv;
interpolation_type interpolation = linear_interpolation;
unsigned int nbit;

unsigned char * DEBUG_STRING;

/******************************* GLOBAL DECLARATION *********************/


/***********************************************************************/
unsigned int flipbits(unsigned int a)
{
  unsigned char  i;
  unsigned int temp;
  unsigned int powerExp;

  powerExp=numsample >> 1;
  temp=0;
  for (i=1;i<=nbit;i++)
  {
    temp+=(a%2)*powerExp;
    powerExp >>= 1;
    a >>= 1;
  }
  return(temp);
}/*flipbits*/
/***********************************************************************/
/***********************************************************************/
void FillExp(pointarraysamples arrayexp)
{
  unsigned int m,i,k,powr;
  i=0;
  powr=1;
  for (m=1; m<=nbit;m++)
    {
    for (k=0;k<=(powr-1);k++)
    {
      (*arrayexp)[i].r = (double)multiplierEnaX*cos(-M_PI*(double)k/powr);
      (*arrayexp)[i].i = (double)multiplierEnaX*sin(-M_PI*(double)k/powr);
      i++;
    }
    powr <<= 1;
    }
}/*FillExp*/
/***********************************************************************/
/***********************************************************************/
void FillInv(pointarrayindex arrayinv)
{
   unsigned int i;
   for (i=0;i<numsample;i++)
   {
      (*arrayinv)[i]=flipbits(i);
   }
}/*FillInv*/
/***********************************************************************/
/***********************************************************************/
void mulFFT(pointarraysamples psamples, unsigned int siz, unsigned int indexexponenta)
{
  unsigned int siz2,i,j,position,indexexp;
  complex a;

  siz2=siz >> 1;
  position=0;
  if (siz2>1)
  {
     while (position< numsample)
    {
      indexexp=indexexponenta;
      for (i=(position+1+siz2);i<(position+siz);i++)
        {
          a.r=((*arrayexp)[indexexp].r*(*psamples)[i].r-(*arrayexp)[indexexp].i*(*psamples)[i].i) / multiplierEnaX;
          (*psamples)[i].i=((*arrayexp)[indexexp].r*(*psamples)[i].i+(*arrayexp)[indexexp].i*(*psamples)[i].r) / multiplierEnaX;
          (*psamples)[i].r=a.r;
          indexexp++;
        }
      position+=siz;
    }
  }
  position=0;
  j=position+siz2;
  while (position< numsample)
  {
    for (i=position;i<(siz2+position);i++)
    {
      a.r=((*psamples)[i].r+(*psamples)[j].r)/2;
      a.i=((*psamples)[i].i+(*psamples)[j].i)/2;
      (*psamples)[j].r=((*psamples)[i].r-(*psamples)[j].r)/2;
      (*psamples)[j].i=((*psamples)[i].i-(*psamples)[j].i)/2;
      (*psamples)[i]=a;
      j++;
    }
    position+=siz;
    j+=siz2;
  }
}/*mulFFT*/
/***********************************************************************/
/***********************************************************************/
void FFT(pointarraysamples psamples)
{
  unsigned int k,siz2;
  unsigned int indexexp;

  siz2=1;
  for (k=0;k<nbit;k++)
  {
    indexexp=siz2;   // index exp pola+1
    siz2 <<= 1;      // blocks size
    mulFFT(psamples,siz2,indexexp);
  }
}/*FFT*/
/***********************************************************************/
/***********************************************************************/
long int FillSamplesInv(pointEvalBoardADCarray BufferEvalBoardADC, pointarraysamples samples, char channel, char channels,double samplingError)
{
  unsigned int i,w;
  signed long error=-1;
  char channeltemp;
  const signed long datamultiplier = 8;
  const signed long datamultiplier2 = datamultiplier*2;

#ifndef debug
  do {
     }while (ConvertInProgress(&param));     //   END OF ALL CONVERSIONS (=0 if all data transfered; =1 if data transfer in progress)
#endif //debug

if (interpolation == no_interpolation)
{
//---------------- without interpolation --------------//
  channeltemp=channel+1;
  for (i=0;i<numsample;i++)
  {
    w = (*arrayinv)[i];
    (*samples)[i].r = ((((*BufferEvalBoardADC)[channel+channels*(w)]) >> 4))*(datamultiplier2);
    (*samples)[i].i = ((((*BufferEvalBoardADC)[channeltemp+channels*(w)]) >> 4))*(datamultiplier2);
  }
//---------------- without interpolation --------------//
}
else if (interpolation==linear_interpolation)
{
//------------- linear interpolation ----------------//
  unsigned int index,k,l;
  signed long sampleBuf0,sampleBuf1;
  signed long errorPrecision = 100000l;
  signed long samplingerror2 = (samplingError*errorPrecision);
  signed long interp;

  channeltemp=channel+1;

  for (i=0;i<numsample;i++)
  {
    w = (*arrayinv)[i];
    interp = (signed long)w * samplingerror2;
    index = (interp/errorPrecision);
    interp = interp % errorPrecision;
    w -= index;
    //------- voltage filling ---------//
    sampleBuf0 = (((*BufferEvalBoardADC)[channel+(k=channels*(w--))]) >> 4);
    sampleBuf1 = (((*BufferEvalBoardADC)[channel+(l=channels*(w))]) >> 4);
    (*samples)[i].r = ((sampleBuf0 + (interp * (sampleBuf1-sampleBuf0))/errorPrecision)) * datamultiplier2;
    //------- current filling ---------//
    sampleBuf0 = (((*BufferEvalBoardADC)[channeltemp+k]) >> 4);
    sampleBuf1 = (((*BufferEvalBoardADC)[channeltemp+l]) >> 4);
    (*samples)[i].i = ((sampleBuf0 + (interp * (sampleBuf1-sampleBuf0))/errorPrecision)) * datamultiplier2;
  }
//------------- linear interpolation ----------------//
}
else if (interpolation==kvadratic_interpolation)
{
//----------- kvadratic interpolation ----------------//
  signed long a,b,c;
  unsigned int index,k,l,m;
  signed long sampleBuf0,sampleBuf1,sampleBuf2;
  double interp;
  channeltemp=channel+1;
  for (i=0;i<numsample;i++)
  {
    w = (*arrayinv)[i];
    interp = (samplingError*w);
    index = interp;
    interp = index-interp;
    w -= index;
    //------- voltage filling ---------//
    sampleBuf0 = (((*BufferEvalBoardADC)[channel+(k=channels*(w--))]) >> 4);
    sampleBuf1 = (((*BufferEvalBoardADC)[channel+(l=channels*(w--))]) >> 4);
    sampleBuf2 = (((*BufferEvalBoardADC)[channel+(m=channels*(w))]) >> 4);
    a=sampleBuf2-2*sampleBuf1+sampleBuf0;
    b=sampleBuf2-4*sampleBuf1+3*sampleBuf0;
    c=2*sampleBuf0;
    (*samples)[i].r = (((a*interp+b)*interp+c))*datamultiplier;
    //------- current filling ---------//
    sampleBuf0 = (((*BufferEvalBoardADC)[channeltemp+k]) >> 4);
    sampleBuf1 = (((*BufferEvalBoardADC)[channeltemp+l]) >> 4);
    sampleBuf2 = (((*BufferEvalBoardADC)[channeltemp+m]) >> 4);
    a=sampleBuf2-2*sampleBuf1+sampleBuf0;
    b=sampleBuf2-4*sampleBuf1+3*sampleBuf0;
    c=2*sampleBuf0;
    (*samples)[i].i = (((a*interp+b)*interp+c))*datamultiplier;
  }
//----------- kvadratic interpolation ----------------//
}
  return(error);
}/*FillSamplesInv*/
/***********************************************************************/
/***********************************************************************/
#ifdef debug
void FillEvalBoardADCBuffer(pointEvalBoardADCarray BufferEvalBoardADC, char channels, char periods, double error)
{
  unsigned int x,j;
  double uhol=2*M_PI/channels;
  static char first = 1;

  if (!first) return;

  first = 0;
  error=1+error;
  for (x=0;x<numsample;x++)
  {
    for(j=0;j<channels;j++)
    {
      (*BufferEvalBoardADC)[x*channels+j]=((signed int)(65530.0/2.0*(1.0*sin(periods*(uhol*j+2*M_PI*x/numsample*error))+0.0*cos(8*periods*2*M_PI*x/numsample*error)))) & ((maxAD-1) << (16 - ADbits));
    }
  }
}/*FillEvalBoardADCBuffer*/
#endif //debug
/***********************************************************************/
/***********************************************************************/
//initialization of FFT (allocations and array initializations)
void InitFFT(void)
{
  nbit=floor(log(numsample)/log(2)+0.2);

  arrayexp=(pointarraysamples) malloc(sizeof(arraysamples));
  arrayinv=(pointarrayindex) malloc(sizeof(arrayindex));
  smpl=(pointarraysamples) malloc(sizeof(arraysamples));
  BufferEvalBoardADC=(pointEvalBoardADCarray) AllocateEvalBoardBuffer(&param);
  AnaResults=(pointResults) malloc(sizeof(Results));

  if((arrayexp==NULL) | (arrayinv==NULL) | (smpl==NULL) | (BufferEvalBoardADC==NULL) | (AnaResults==NULL))
    {
     sprintf(DEBUG_STRING, "Not enough memory for FFT\n");
     _asm("trap\n");
    };
  FillExp(arrayexp);
  FillInv(arrayinv);
}/*InitFFT;*/
/***********************************************************************/
/***********************************************************************/
//deinitialization of FFT (deallocations)
void CloseFFT(void)
{
  free(smpl);
  free(arrayexp);
  free(arrayinv);
  UnAllocateDataBuffer(&param);
  free(AnaResults);
}/*CloseFFT;*/
/***********************************************************************/
/***********************************************************************/
//display results into string
//can be added print to LCD display
void PrintFFTAll(void)
{
  unsigned int x;
  for(x=0;x<3;x++)
  {
    /*
    sprintf(DEBUG_STRING, "\n channel%u :\n",x);
    sprintf(DEBUG_STRING, "Ue= %5.4f V\n",(* AnaResults).BasicResults[x][0]/multiplierU);
    sprintf(DEBUG_STRING, "Ie= %5.4f A\n",(* AnaResults).BasicResults[x][1]/multiplierI);
    sprintf(DEBUG_STRING, "dU= %5.4f %\n",(* AnaResults).BasicResults[x][2]);
    sprintf(DEBUG_STRING, "dI= %5.4f %\n",(* AnaResults).BasicResults[x][3]);
    sprintf(DEBUG_STRING, "Pe= %5.4f W\n",(* AnaResults).BasicResults[x][4]/(multiplierU*multiplierI));
    sprintf(DEBUG_STRING, "fi= %5.4f °\n",(* AnaResults).BasicResults[x][5]*180/M_PI);
    */
    
    sprintf(DEBUG_STRING, "channel%u : Ue= %4.2fV, Ie= %4.2fA, Pe= %4.2fW, fi= %4.2f deg, dU= %4.2f%, dI= %4.2f%"
    ,x
    ,(* AnaResults).BasicResults[x][0]/multiplierU
    ,(* AnaResults).BasicResults[x][1]/multiplierI
    ,(* AnaResults).BasicResults[x][4]/(multiplierU*multiplierI)
    ,(* AnaResults).BasicResults[x][5]*180/M_PI
    ,(* AnaResults).BasicResults[x][2]
    ,(* AnaResults).BasicResults[x][3]);
    
    
    LCD_RollString(LCD_LINE2, DEBUG_STRING, 600);
  }
  sprintf(DEBUG_STRING, "\nHarmonics:\n");
  for (x=0;x<numsample/2;x++)
  {
    sprintf(DEBUG_STRING, "%+10.6eV %+10.6ei   %+10.6eA %+10.6ei  |  "
      "%+10.6eV %+10.6ei   %+10.6eA %+10.6ei  |  "
      "%+10.6eV %+10.6ei   %+10.6eA %+10.6ei  |  "
      "\n",
      (* AnaResults).Harmonics[0][0][x].r*M_SQRT_2/multiplierU, (* AnaResults).Harmonics[0][0][x].i*M_SQRT_2/multiplierU, (* AnaResults).Harmonics[0][1][x].r*M_SQRT_2/multiplierI, (* AnaResults).Harmonics[0][1][x].i*M_SQRT_2/multiplierI,
      (* AnaResults).Harmonics[1][0][x].r*M_SQRT_2/multiplierU, (* AnaResults).Harmonics[1][0][x].i*M_SQRT_2/multiplierU, (* AnaResults).Harmonics[1][1][x].r*M_SQRT_2/multiplierI, (* AnaResults).Harmonics[1][1][x].i*M_SQRT_2/multiplierI,
      (* AnaResults).Harmonics[2][0][x].r*M_SQRT_2/multiplierU, (* AnaResults).Harmonics[2][0][x].i*M_SQRT_2/multiplierU, (* AnaResults).Harmonics[2][1][x].r*M_SQRT_2/multiplierI, (* AnaResults).Harmonics[2][1][x].i*M_SQRT_2/multiplierI
    );
  }
} /*PrintFFTAll*/
/***********************************************************************/
/***********************************************************************/
//calculates active power and RMS values of U and I signals for one phase of 3-phase system
unsigned int getHarmonicPower(pointarraysamples smpl, unsigned int periods,unsigned int channels,
        double *U,double *I,
        double *DistortionU,double *DistortionI,
        double *power,double *PhaseBasicHarm)
{
  double Phase;
  unsigned int i,numsampleindex;
  unsigned long integerDistortionU,integerDistortionI;
  unsigned long BasicHarmU;
  unsigned long BasicHarmI;
  unsigned int polovica = numsample>>1;
  complex Usmpl,Ismpl;
  double posuvfazy = 2*M_PI/(numsample*channels);// phase correction between U and I due to different sampling time
#ifdef debug
  posuvfazy=0;
#endif //debug
  integerDistortionU=0;
  integerDistortionI=0;
  * power=0.0;
          (*smpl)[0].r = 2 * (*smpl)[0].r;
          (*smpl)[polovica].r = 2 * (*smpl)[0].i;
          (*smpl)[0].i = 0;
          (*smpl)[polovica].i = 0;
  numsampleindex = numsample;
  for (i=1;i<polovica;i++)
  {
     numsampleindex--;
     Ismpl.r = ((*smpl)[i].i) + ((*smpl)[numsampleindex].i);
     Ismpl.i = ((*smpl)[numsampleindex].r) - ((*smpl)[i].r);

     Usmpl.r = ((*smpl)[i].r) + ((*smpl)[numsampleindex].r);
     Usmpl.i = ((*smpl)[i].i) - ((*smpl)[numsampleindex].i);

     (*smpl)[i].r = Usmpl.r;
     (*smpl)[i].i = Usmpl.i;

     (*smpl)[numsampleindex].r = Ismpl.r;
     (*smpl)[numsampleindex].i = Ismpl.i;

     //* power += 0.5*(Usmpl.r * Ismpl.r + Usmpl.i * Ismpl.i);
     if (i==periods)
     {
       if ((Ismpl.i+Ismpl.r) & (Usmpl.i+Usmpl.r))
         * PhaseBasicHarm = Phase = atan2(Ismpl.i,Ismpl.r) - atan2(Usmpl.i,Usmpl.r) - posuvfazy*i;
       else
         * PhaseBasicHarm = Phase = 0;
       integerDistortionU += Usmpl.r=Usmpl.r * Usmpl.r + Usmpl.i * Usmpl.i;
       integerDistortionI += Ismpl.r=Ismpl.r * Ismpl.r + Ismpl.i * Ismpl.i;
       BasicHarmU = Usmpl.r;
       BasicHarmI = Ismpl.r;
     }
     else
     {
       if ((Ismpl.i+Ismpl.r) & (Usmpl.i+Usmpl.r))
         Phase = atan2(Ismpl.i,Ismpl.r) - atan2(Usmpl.i,Usmpl.r) - posuvfazy*i;
       else
         Phase = 0;
       integerDistortionU += Usmpl.r=Usmpl.r * Usmpl.r + Usmpl.i * Usmpl.i;
       integerDistortionI += Ismpl.r=Ismpl.r * Ismpl.r + Ismpl.i * Ismpl.i;
     }
     * power += cos(Phase) * 0.5 * sqrt((double)(unsigned long)Usmpl.r * (double)(unsigned long)Ismpl.r);
  }
  * U = sqrt(0.5*integerDistortionU) ;
  * I = sqrt(0.5*integerDistortionI) ;
  if (BasicHarmU)
    * DistortionU = 100*sqrt((double)(integerDistortionU-BasicHarmU)/(double)BasicHarmU);
  else * DistortionU = 0;
  if (BasicHarmI)
    * DistortionI = 100*sqrt((double)(integerDistortionI-BasicHarmI)/(double)BasicHarmI);
  else * DistortionI = 0;

return(((numsample-1)>>1)/periods); // returns number of calculated harmonics
} /*getHarmonicPower*/
/***********************************************************************/
/***********************************************************************/
//calculate FFT (preprocess, calculation, results)
void FFTall(pointarraysamples smpl, unsigned int channels,unsigned int periods,double samplingError)
{
  unsigned int i,j,k;
  for (i=0;i < (channels>>1);i++)
  {
    FillSamplesInv(BufferEvalBoardADC,smpl,i<<1,channels,samplingError);
    FFT(smpl);
    getHarmonicPower(smpl,periods,channels,
     &(* AnaResults).BasicResults[i][0],
     &(* AnaResults).BasicResults[i][1],
     &(* AnaResults).BasicResults[i][2],
     &(* AnaResults).BasicResults[i][3],
     &(* AnaResults).BasicResults[i][4],
     &(* AnaResults).BasicResults[i][5]);
    memcpy((* AnaResults).Harmonics[i][0], &(*smpl), numsample/2*sizeof(complex));
    memcpy((* AnaResults).Harmonics[i][1], &((*smpl)[numsample>>1]), sizeof(complex));
    for(j=(numsample>>1)+1,k=(numsample>>1)-1; j<numsample; j++,k--)
      memcpy(&((* AnaResults).Harmonics[i][1][k]), &((*smpl)[j]), sizeof(complex));
  }
}/*FFTall*/
/***********************************************************************/
/***********************************************************************/
void InitEvalBoard(unsigned int numsamples, unsigned int channels, double signalfrequency, unsigned int periods)
{
  InitEvalBoardparam(&param, numsamples, channels, signalfrequency, periods);
}/*InitEvalBoard*/
/***********************************************************************/
/***********************************************************************/
//perform all FFT actions: collect data, calculate FFT
void * GetFFTResults(unsigned int channels, unsigned int periods)
{
  double smplerr;

  periods=InitEvalBoardcard(&param, channels,numsample,&smplerr); // 50Hz signal; 6channels ; returns number of calculated periods
   #ifdef debug
    FillEvalBoardADCBuffer(BufferEvalBoardADC, channels, periods, smplerr); // instead of ADC sampling
  #else
  GetDataFromEvalBoard(&param);
  #endif //debug
  FFTall(smpl,channels,periods,smplerr);  /* 6kanalov */
return(AnaResults);
}/*GetFFTResults*/
/***********************************************************************/
/***********************************************************************/
//returns signal frequency from sampled data (from one sampled channel)
double GetSignalfrequency(double frequencyIn)
{
  double frequencyOut;
 #ifdef debug
  frequencyOut = 50;
 #else //debug
  frequencyOut = GetDataFromEvalBoardfrequency(&param,frequencyIn,param.FreqvChannel);
 #endif //debug
return(frequencyOut);
}/*GetSignalfrequency*/
/***********************************************************************/
//main FFT testing routine
void TestADCFFT(void)
{
unsigned int  xx;
unsigned int periods=1;
unsigned int channels=6;
double signalfrequency=50.000;

  //allocate debug string space
  if ((DEBUG_STRING = malloc(255)) == NULL)
    _asm("trap\n");

  //set internal or external frequency
  SetCPUClock(ENABLE_EXTERNAL_FRQ); //XTALL - must be present 16MHz
  //SetCPUClock(ENABLE_INTERNAL_FRQ); //clock

  //init param structure
  InitEvalBoard(numsample,channels,signalfrequency,periods);
  //prepare FFT precalculations
  InitFFT();
  //determine signal frequency
  signalfrequency = GetSignalfrequency(signalfrequency); // sampling length longer that expected

  //for(xx=0;xx<100;xx++) //perform 100 times FFT for performance testing
  {
    //init params
    InitEvalBoard(numsample,channels,signalfrequency,periods);
    //collect data and calculate FFT
    GetFFTResults(channels, periods);
  }

  //print FFT results
  PrintFFTAll();
  //close FFT calculations
  CloseFFT();
  //unallocate debug string
  free(DEBUG_STRING);
}/*TestADCFFT*/
/***********************************************************************/
