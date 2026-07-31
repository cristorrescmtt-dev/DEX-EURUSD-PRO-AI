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
   ulong m_magic;

public:

   COrderManager()
   {
      m_magic = 20260001;
      m_trade.SetExpertMagicNumber(m_magic);
   }

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

   bool HasOpenPosition()
   {
      for(int i = PositionsTotal() - 1; i >= 0; i--)
      {
         ulong ticket = PositionGetTicket(i);

         if(ticket == 0)
            continue;

         if(!PositionSelectByTicket(ticket))
            continue;

         if(PositionGetString(POSITION_SYMBOL) != _Symbol)
            continue;

         if((ulong)PositionGetInteger(POSITION_MAGIC) != m_magic)
            continue;

         return true;
      }

      return false;
   }
};

#endif