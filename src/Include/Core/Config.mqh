//+------------------------------------------------------------------+
//| Config.mqh                                                       |
//+------------------------------------------------------------------+
#ifndef DEX_CONFIG_MQH
#define DEX_CONFIG_MQH

class CConfig
{
private:

   double m_riskPercent;
   bool   m_autoLot;
   bool   m_trailingStop;

public:

   CConfig()
   {
      m_riskPercent = 1.0;
      m_autoLot = true;
      m_trailingStop = true;
   }

   double RiskPercent()
   {
      return m_riskPercent;
   }

   bool AutoLot()
   {
      return m_autoLot;
   }

   bool TrailingStop()
   {
      return m_trailingStop;
   }
};

#endif