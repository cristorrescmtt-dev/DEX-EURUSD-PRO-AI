//+------------------------------------------------------------------+
//| MarketState.mqh                                                  |
//+------------------------------------------------------------------+
#ifndef DEX_MARKET_STATE_MQH
#define DEX_MARKET_STATE_MQH

#include "../Trading/TrendEngine.mqh"
#include "../Trading/ScoreEngine.mqh"

struct MarketState
{
   // Precio
   double bid;
   double ask;
   double spread;

   // Indicadores
   double ema50;
   double ema200;
   double atr;
   double adx;

   // Tendencia
   ENUM_TREND trend;

   // Sesión
   bool tradingAllowed;
   string sessionName;

   // Pullback
   bool pullbackBuy;
   bool pullbackSell;

   // Score
   ScoreResult score;
};

#endif