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
#include "../Include/Market/MarketState.mqh"
#include "../Include/Indicators/EMA.mqh"
#include "../Include/Indicators/ATR.mqh"
#include "../Include/Indicators/ADX.mqh"
#include "../Include/Trading/TrendEngine.mqh"
#include "../Include/Trading/ScoreEngine.mqh"
#include "../Include/Risk/RiskManager.mqh"
#include "../Include/Market/SessionManager.mqh"
#include "../Include/Trading/TradeSetupEngine.mqh"
#include "../Include/UI/Dashboard.mqh"
#include "../Include/Trading/PullbackEngine.mqh"
#include "../Include/Trading/EntryEngine.mqh"

//------------------------------------------------------------
// Objetos globales
//------------------------------------------------------------

CConfig Config;
CLogger Logger;
CKernel Kernel;
CMarketContext Market;
MarketState State;

CEMA EMA50;
CEMA EMA200;
CATR ATR;
CADX ADX;

CTrendEngine TrendEngine;
CScoreEngine ScoreEngine;
CRiskManager Risk;
CSessionManager Session;

CTradeSetupEngine TradeSetup;
CDashboard Dashboard;
CPullbackEngine Pullback;
CEntryEngine EntryEngine;


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
   //==================================================
   // Construir MarketState
   //==================================================

   State.bid    = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   State.ask    = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   State.spread = Market.Spread();

   State.ema50  = ema50;
   State.ema200 = ema200;

   State.atr    = atr;
   State.adx    = adx;
   ENUM_TREND trend =
   TrendEngine.Evaluate(
      ema50,
      ema200,
      adx
   );
   State.trend = trend;

ScoreResult score =
   ScoreEngine.Evaluate(
      trend == TREND_BULLISH,
      trend == TREND_BEARISH,
      adx,
      atr,
      Market.Spread()
   );

State.tradingAllowed = Session.TradingAllowed();
State.sessionName    = Session.Name();
State.score          = score;

State.pullbackBuy = Pullback.BuySignal(
   State.bid,
   State.ema50,
   State.trend,
   State.atr
);

State.pullbackSell = Pullback.SellSignal(
   State.bid,
   State.ema50,
   State.trend,
   State.atr
);

ENUM_ENTRY_SIGNAL entrySignal = EntryEngine.Evaluate(State);

ENUM_SETUP setup =
   TradeSetup.Evaluate(
      trend,
      score,
      State.tradingAllowed
   );

Dashboard.Show(
   TrendEngine.ToString(trend),
   score.trend,
   score.adx,
   score.atr,
   score.spread,
   score.total,
   score.valid,
   Risk.Risk(),
   State.sessionName,
   State.tradingAllowed,
   TradeSetup.ToString(setup),
   State.pullbackBuy ? "BUY" : (State.pullbackSell ? "SELL" : "NO"),
   EntryEngine.ToString(entrySignal)
);
   
}