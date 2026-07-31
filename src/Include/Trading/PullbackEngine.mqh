//+------------------------------------------------------------------+
//| PullbackEngine.mqh                                               |
//+------------------------------------------------------------------+
#ifndef DEX_PULLBACK_ENGINE_MQH
#define DEX_PULLBACK_ENGINE_MQH

class CPullbackEngine
{
public:

   bool BuySignal(
      double price,
      double ema50,
      ENUM_TREND trend,
      double atr
   )
   {
      if(trend != TREND_BULLISH)
         return false;

      double tolerance = atr * 0.30;

      return MathAbs(price - ema50) <= tolerance;
   }

   bool SellSignal(
      double price,
      double ema50,
      ENUM_TREND trend,
      double atr
   )
   {
      if(trend != TREND_BEARISH)
         return false;

      double tolerance = atr * 0.30;

      return MathAbs(price - ema50) <= tolerance;
   }
};

#endif