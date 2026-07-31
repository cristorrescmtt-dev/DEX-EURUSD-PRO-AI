//+------------------------------------------------------------------+
//| OrderManager.mqh                                                 |
//+------------------------------------------------------------------+
#ifndef DEX_ORDER_MANAGER_MQH
#define DEX_ORDER_MANAGER_MQH

#include <Trade/Trade.mqh>

class COrderManager
{
private:
   CTrade m_trade;

public:

   bool Buy(double lots,double sl,double tp,string comment="DEX")
   {
      return m_trade.Buy(
         lots,
         _Symbol,
         0.0,
         sl,
         tp,
         comment
      );
   }

   bool Sell(double lots,double sl,double tp,string comment="DEX")
   {
      return m_trade.Sell(
         lots,
         _Symbol,
         0.0,
         sl,
         tp,
         comment
      );
   }
};

#endif