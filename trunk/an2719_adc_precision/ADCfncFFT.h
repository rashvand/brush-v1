#ifndef _ADCFNCFFT_H
#define _ADCFNCFFT_H

void InitADCTimerTrigger(PParam pparam, unsigned int divider);
void ADCStart(void);
@far @interrupt void ADCInterrupt (void);

#endif //_ADCFNCFFT_H
