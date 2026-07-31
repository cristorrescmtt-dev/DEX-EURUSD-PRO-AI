#ifndef DEX_TRADE_SETUP_ENGINE_MQH
#define DEX_TRADE_SETUP_ENGINE_MQH

enum ENUM_SETUP
{
   SETUP_NONE = 0,
   SETUP_BUY,
   SETUP_SELL
};

class CTradeSetupEngine
{
public:

   ENUM_SETUP Evaluate(
      ENUM_TREND trend,
      const ScoreResult &score,
      bool tradingAllowed
   )
   {
      if(!tradingAllowed)
         return SETUP_NONE;

      if(!score.valid)
         return SETUP_NONE;

      if(trend == TREND_BULLISH)
         return SETUP_BUY;

      if(trend == TREND_BEARISH)
         return SETUP_SELL;

      return SETUP_NONE;
   }

   string ToString(const ENUM_SETUP setup) const
   {
      switch(setup)
      {
         case SETUP_BUY:  return "BUY SETUP";
         case SETUP_SELL: return "SELL SETUP";
      }

      return "NO SETUP";
   }
};

#endif // DEX_TRADE_SETUP_ENGINE_MQH