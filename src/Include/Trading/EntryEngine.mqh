//+------------------------------------------------------------------+
//| EntryEngine.mqh                                                  |
//+------------------------------------------------------------------+
#ifndef DEX_ENTRY_ENGINE_MQH
#define DEX_ENTRY_ENGINE_MQH

#include "../Market/MarketState.mqh"

enum ENUM_ENTRY_SIGNAL
{
   ENTRY_WAIT = 0,
   ENTRY_BUY,
   ENTRY_SELL
};

class CEntryEngine
{
public:

   ENUM_ENTRY_SIGNAL Evaluate(const MarketState &state)
   {
      if(!state.tradingAllowed)
         return ENTRY_WAIT;

      if(state.pullbackBuy &&
         state.score.valid &&
         state.trend == TREND_BULLISH)
         return ENTRY_BUY;

      if(state.pullbackSell &&
         state.score.valid &&
         state.trend == TREND_BEARISH)
         return ENTRY_SELL;

      return ENTRY_WAIT;
   }

   string ToString(ENUM_ENTRY_SIGNAL signal)
   {
      switch(signal)
      {
         case ENTRY_BUY:  return "BUY";
         case ENTRY_SELL: return "SELL";
         default:         return "WAIT";
      }
   }
};

#endif