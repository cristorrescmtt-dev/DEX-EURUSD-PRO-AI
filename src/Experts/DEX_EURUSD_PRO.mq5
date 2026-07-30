//+------------------------------------------------------------------+
//|                                              DEX_EURUSD_PRO.mq5  |
//|                       DEX ENGINE                                 |
//+------------------------------------------------------------------+
#property copyright "Digital Express"
#property version "1.000"
#property strict

#include "../Include/Core/Constants.mqh"
#include "../Include/Core/Config.mqh"
#include "../Include/Core/Logger.mqh"
#include "../Include/Core/Kernel.mqh"
#include "../Include/Market/MarketContext.mqh"
#include "../Include/Indicators/EMA.mqh"
#include "../Include/Indicators/ATR.mqh"
#include "../Include/Indicators/ADX.mqh"
#include "../Include/Trading/TrendEngine.mqh"
#include "../Include/Trading/ScoreEngine.mqh"
#include "../Include/Risk/RiskManager.mqh"
#include "../Include/Market/SessionManager.mqh"

//------------------------------------------------------------
// Objetos globales
//------------------------------------------------------------

CConfig Config;
CLogger Logger;
CKernel Kernel;
CMarketContext Market;
CEMA EMA50;
CEMA EMA200;
CATR ATR;
CADX ADX;
CTrendEngine TrendEngine;
CScoreEngine ScoreEngine;
CRiskManager Risk;
CSessionManager Session;


//------------------------------------------------------------
// Inicialización
//------------------------------------------------------------

int OnInit()
{
   Logger.Info("======================================");
   Logger.Info(DEX_NAME);
   Logger.Info("Versión: " + string(DEX_VERSION));
   Logger.Info("Inicializando DEX Engine...");

   if(!Kernel.Initialize())
   {
      Logger.Error("No se pudo inicializar el Kernel.");
      return(INIT_FAILED);
   }
    EMA50.Initialize(50);
    EMA200.Initialize(200);
    ATR.Initialize(14);
    ADX.Initialize(14);
    Risk.SetRisk(1.0);

   Logger.Info("Kernel inicializado correctamente.");
   Logger.Info("======================================");
    
   return(INIT_SUCCEEDED);
}

//------------------------------------------------------------
// Finalización
//------------------------------------------------------------

void OnDeinit(const int reason)
{
   Kernel.Shutdown();
   Logger.Info("DEX Engine finalizado.");
}

//------------------------------------------------------------
// Tick
//------------------------------------------------------------

void OnTick()
{
   Kernel.Update();

   Market.Update();

   double ema50 = EMA50.Value();
   double ema200 = EMA200.Value();
   double atr = ATR.Value();
   double adx = ADX.Value();
   ENUM_TREND trend =
   TrendEngine.Evaluate(
      ema50,
      ema200,
      adx
   );
   ScoreResult score =
   ScoreEngine.Evaluate(
      trend == TREND_BULLISH,
      trend == TREND_BEARISH,
      adx,
      atr,
      Market.Spread()
   );

   Comment(

   "DEX ENGINE\n",
   "========================\n\n",

   "Trend      : ", TrendEngine.ToString(trend), "\n",

   "EMA Score  : ", score.trend, "\n",

   "ADX Score  : ", score.adx, "\n",

   "ATR Score  : ", score.atr, "\n",

   "Spread     : ", score.spread, "\n\n",

   "TOTAL      : ", score.total, "\n\n",

   (score.valid ? "READY" : "WAIT"), "\n",

   "Risk       : ", DoubleToString(Risk.Risk(),2), " %\n",

   "Session    : ", Session.Name(), "\n",

   "Trading    : ", (Session.TradingAllowed() ? "YES" : "NO"), "\n"

);

}