#ifndef DEX_TREND_INFO_MQH
#define DEX_TREND_INFO_MQH

struct TrendInfo
{
   ENUM_TREND trend;

   double ema50;
   double ema200;

   double adx;
   double atr;

   bool strongTrend;
   bool valid;

   int score;
};

#endif