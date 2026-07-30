//+------------------------------------------------------------------+
//| ScoreEngine.mqh                                                  |
//+------------------------------------------------------------------+
#ifndef DEX_SCORE_ENGINE_MQH
#define DEX_SCORE_ENGINE_MQH

struct ScoreResult
{
   int trend;
   int adx;
   int atr;
   int spread;
   int session;
   int trendline;
   int priceaction;

   int total;

   bool valid;
};

class CScoreEngine
{
public:

   ScoreResult Evaluate(
      bool bullish,
      bool bearish,
      double adx,
      double atr,
      double spread
   )
   {
      ScoreResult result;

      result.trend = 0;
      result.adx = 0;
      result.atr = 0;
      result.spread = 0;
      result.session = 0;
      result.trendline = 0;
      result.priceaction = 0;
      result.total = 0;
      result.valid = false;

      //-------------------------
      // Trend
      //-------------------------

      if(bullish || bearish)
         result.trend = 20;

      //-------------------------
      // ADX
      //-------------------------

      if(adx >= 25)
         result.adx = 15;

      //-------------------------
      // ATR
      //-------------------------

      if(atr > 0)
         result.atr = 10;

      //-------------------------
      // Spread
      //-------------------------

      if(spread <= 12)
         result.spread = 5;

      //-------------------------

      result.total =
         result.trend +
         result.adx +
         result.atr +
         result.spread;

      result.valid = (result.total >= 50);

      return result;
   }

};

#endif