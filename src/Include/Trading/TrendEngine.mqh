//+------------------------------------------------------------------+
//| TrendEngine.mqh                                                  |
//| DEX Engine                                                       |
//+------------------------------------------------------------------+
#ifndef DEX_TREND_ENGINE_MQH
#define DEX_TREND_ENGINE_MQH

enum ENUM_TREND
{
   TREND_SIDEWAYS = 0,
   TREND_BULLISH,
   TREND_BEARISH
};

class CTrendEngine
{
public:

   ENUM_TREND Evaluate(double ema50,double ema200,double adx)
   {
      if(adx < 25)
         return TREND_SIDEWAYS;

      if(ema50 > ema200)
         return TREND_BULLISH;

      if(ema50 < ema200)
         return TREND_BEARISH;

      return TREND_SIDEWAYS;
   }

   string ToString(ENUM_TREND trend)
   {
      switch(trend)
      {
         case TREND_BULLISH:
            return "ALCISTA";

         case TREND_BEARISH:
            return "BAJISTA";

         default:
            return "LATERAL";
      }
   }

};

#endif