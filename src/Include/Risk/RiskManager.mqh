//+------------------------------------------------------------------+
//| RiskManager.mqh                                                  |
//+------------------------------------------------------------------+
#ifndef DEX_RISK_MANAGER_MQH
#define DEX_RISK_MANAGER_MQH

class CRiskManager
{
private:

   double m_riskPercent;

public:

   CRiskManager()
   {
      m_riskPercent = 1.0;
   }

   void SetRisk(double risk)
   {
      m_riskPercent = risk;
   }

   double Risk()
   {
      return m_riskPercent;
   }

   bool CanTrade()
   {
      return true;
   }

};

#endif