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

   int    m_scoreTrend;
   int    m_scoreADX;
   int    m_scoreATR;
   int    m_scoreSpread;
   int    m_minimumScore;

public:

   CConfig()
{
   m_riskPercent = 1.0;
   m_autoLot = true;
   m_trailingStop = true;

   m_scoreTrend   = 20;
   m_scoreADX     = 15;
   m_scoreATR     = 10;
   m_scoreSpread  = 5;
   m_minimumScore = 45;
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
   
   int ScoreTrend()
{
   return m_scoreTrend;
}

int ScoreADX()
{
   return m_scoreADX;
}

int ScoreATR()
{
   return m_scoreATR;
}

int ScoreSpread()
{
   return m_scoreSpread;
}

int MinimumScore()
{
   return m_minimumScore;
}
};

#endif