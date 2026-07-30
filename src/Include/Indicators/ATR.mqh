//+------------------------------------------------------------------+
//| ATR.mqh                                                          |
//| DEX Engine                                                       |
//+------------------------------------------------------------------+
#ifndef DEX_ATR_MQH
#define DEX_ATR_MQH

class CATR
{
private:

   int m_handle;
   int m_period;

public:

   CATR()
   {
      m_handle = INVALID_HANDLE;
      m_period = 14;
   }

   bool Initialize(int period)
   {
      m_period = period;

      m_handle = iATR(
         _Symbol,
         PERIOD_H1,
         m_period
      );

      return (m_handle != INVALID_HANDLE);
   }

   double Value(int shift=0)
   {
      double buffer[];

      if(CopyBuffer(m_handle,0,shift,1,buffer)<=0)
         return 0;

      return buffer[0];
   }

   void Release()
   {
      if(m_handle!=INVALID_HANDLE)
         IndicatorRelease(m_handle);
   }
};

#endif