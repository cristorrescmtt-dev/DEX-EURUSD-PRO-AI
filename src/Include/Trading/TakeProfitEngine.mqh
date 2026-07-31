//+------------------------------------------------------------------+
//| TakeProfitEngine.mqh                                             |
//+------------------------------------------------------------------+
#ifndef DEX_TAKEPROFIT_ENGINE_MQH
#define DEX_TAKEPROFIT_ENGINE_MQH

class CTakeProfitEngine
{
public:

   double BuyTP(double entryPrice,
                double stopLoss,
                double riskReward = 2.0)
   {
      double risk = entryPrice - stopLoss;

      return NormalizeDouble(
         entryPrice + (risk * riskReward),
         _Digits
      );
   }

   double SellTP(double entryPrice,
                 double stopLoss,
                 double riskReward = 2.0)
   {
      double risk = stopLoss - entryPrice;

      return NormalizeDouble(
         entryPrice - (risk * riskReward),
         _Digits
      );
   }
};

#endif