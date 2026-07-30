//+------------------------------------------------------------------+
//| MarketContext.mqh                                                |
//| DEX Engine                                                       |
//+------------------------------------------------------------------+
#ifndef DEX_MARKET_CONTEXT_MQH
#define DEX_MARKET_CONTEXT_MQH

class CMarketContext
{
private:

   string m_symbol;
   double m_bid;
   double m_ask;
   double m_spread;
   double m_point;
   int    m_digits;

public:

   bool Update()
   {
      m_symbol  = _Symbol;
      m_bid     = SymbolInfoDouble(_Symbol,SYMBOL_BID);
      m_ask     = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
      m_point   = SymbolInfoDouble(_Symbol,SYMBOL_POINT);
      m_digits  = (int)SymbolInfoInteger(_Symbol,SYMBOL_DIGITS);

      m_spread = (m_ask-m_bid)/m_point;

      return true;
   }

   string Symbol() const
   {
      return m_symbol;
   }

   double Bid() const
   {
      return m_bid;
   }

   double Ask() const
   {
      return m_ask;
   }

   double Spread() const
   {
      return m_spread;
   }

   int Digits() const
   {
      return m_digits;
   }
};

#endif