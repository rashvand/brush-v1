#ifndef _ADCDRIVERFFT_H
#define _ADCDRIVERFFT_H

#include "globaldefFFT.h"

void SetCPUClock(unsigned char IntExt);
unsigned int AllocateDataBuffer(PParam pparam);
unsigned int UnAllocateDataBuffer(PParam pparam);
void *AllocateEvalBoardBuffer(PParam pparam);
unsigned char ConvertInProgress(PParam pparam);
unsigned int InitEvalBoardcard(PParam pparam, unsigned int channels, unsigned int samplesperperiod, double * error);
void InitEvalBoardparam(PParam pparam, unsigned int numsamples, unsigned int channels, double signalfrequency, unsigned int periods);
#ifndef debug
void GetDataFromEvalBoard(PParam pparam);
double GetDataFromEvalBoardfrequency(PParam pparam, double frequencycca, unsigned int channel);
#endif //debug
/***********************************************************************/
/***********************************************************************/


#endif //_ADCDRIVERFFT_H