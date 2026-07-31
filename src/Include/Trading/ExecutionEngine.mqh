//+------------------------------------------------------------------+
//| ExecutionEngine.mqh                                              |
//+------------------------------------------------------------------+
#ifndef DEX_EXECUTION_ENGINE_MQH
#define DEX_EXECUTION_ENGINE_MQH

#include "EntryEngine.mqh"
#include "OrderManager.mqh"

class CExecutionEngine
{
public:

   bool CanExecute(
      ENUM_ENTRY_SIGNAL signal,
      bool hasPosition,
      bool tradingAllowed,
      bool scoreValid
   )
   {
      if(signal == ENTRY_WAIT)
         return false;

      if(hasPosition)
         return false;

      if(!tradingAllowed)
         return false;

      if(!scoreValid)
         return false;

      return true;
   }

   bool Execute(
      COrderManager &orderManager,
      ENUM_ENTRY_SIGNAL signal,
      double lots,
      double stopLoss,
      double takeProfit
   )
   {
      switch(signal)
      {
         case ENTRY_BUY:
            return orderManager.Buy(
               lots,
               stopLoss,
               takeProfit,
               "DEX BUY"
            );

         case ENTRY_SELL:
            return orderManager.Sell(
               lots,
               stopLoss,
               takeProfit,
               "DEX SELL"
            );

         default:
            return false;
      }
   }
};

#endif