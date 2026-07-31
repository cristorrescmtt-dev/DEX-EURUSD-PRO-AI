//+------------------------------------------------------------------+
//| StopLossEngine.mqh                                               |
//+------------------------------------------------------------------+
#ifndef DEX_STOPLOSS_ENGINE_MQH
#define DEX_STOPLOSS_ENGINE_MQH

class CStopLossEngine
{
public:

   double BuySL(double price,double atr,double multiplier=2.0)
   {
      return NormalizeDouble(
         price - atr * multiplier,
         _Digits
      );
   }

   double SellSL(double price,double atr,double multiplier=2.0)
   {
      return NormalizeDouble(
         price + atr * multiplier,
         _Digits
      );
   }

};

#endif