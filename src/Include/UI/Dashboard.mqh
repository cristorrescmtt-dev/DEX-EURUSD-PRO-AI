//+------------------------------------------------------------------+
//| Dashboard.mqh                                                    |
//+------------------------------------------------------------------+
#ifndef DEX_DASHBOARD_MQH
#define DEX_DASHBOARD_MQH

class CDashboard
{
public:

   void Show(
   string trend,
   int trendScore,
   int adxScore,
   int atrScore,
   int spreadScore,
   int totalScore,
   bool ready,
   double risk,
   string session,
   bool trading,
   string setup,
   string pullback,
   string entry
)
   {
      string text;

      text =
      "=====================================\n"
      "        DEX ENGINE PRO\n"
      "=====================================\n\n"

      "Trend      : " + trend + "\n"

      "EMA Score  : " + IntegerToString(trendScore) + "\n"

      "ADX Score  : " + IntegerToString(adxScore) + "\n"

      "ATR Score  : " + IntegerToString(atrScore) + "\n"

      "Spread     : " + IntegerToString(spreadScore) + "\n\n"

      "TOTAL      : " + IntegerToString(totalScore) + "\n"

      "STATUS     : " + (ready ? "READY" : "WAIT") + "\n\n"

      "Risk       : " + DoubleToString(risk,2) + " %\n"

      "Session    : " + session + "\n"

      "Trading    : " + (trading ? "YES" : "NO") + "\n"

      "Setup      : " + setup + "\n"

      "Pullback   : " + pullback + "\n"

      "Entry      : " + entry;

      Comment(text);
   }

};

#endif