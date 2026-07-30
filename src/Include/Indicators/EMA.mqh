//+------------------------------------------------------------------+
//| EMA.mqh                                                          |
//| DEX Engine                                                       |
//+------------------------------------------------------------------+
#ifndef DEX_EMA_MQH
#define DEX_EMA_MQH

class CEMA
{
private:

   int m_handle;
   int m_period;

public:

   CEMA()
   {
      m_handle = INVALID_HANDLE;
      m_period = 50;
   }

   bool Initialize(int period)
   {
      m_period = period;

      m_handle = iMA(
         _Symbol,
         PERIOD_H1,
         m_period,
         0,
         MODE_EMA,
         PRICE_CLOSE
      );

      if(m_handle == INVALID_HANDLE)
         return false;

      return true;
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