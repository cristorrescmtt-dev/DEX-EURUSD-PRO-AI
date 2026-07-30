//+------------------------------------------------------------------+
//| SessionManager.mqh                                               |
//+------------------------------------------------------------------+
#ifndef DEX_SESSION_MANAGER_MQH
#define DEX_SESSION_MANAGER_MQH

enum ENUM_SESSION
{
   SESSION_CLOSED = 0,
   SESSION_ASIA,
   SESSION_LONDON,
   SESSION_NEWYORK
};

class CSessionManager
{
public:

   ENUM_SESSION Current()
   {
      MqlDateTime tm;
      TimeToStruct(TimeCurrent(), tm);

      int hour = tm.hour;

      // Horarios aproximados (hora del servidor)
      if(hour >= 0 && hour < 7)
         return SESSION_ASIA;

      if(hour >= 7 && hour < 13)
         return SESSION_LONDON;

      if(hour >= 13 && hour < 22)
         return SESSION_NEWYORK;

      return SESSION_CLOSED;
   }

   bool TradingAllowed()
   {
      ENUM_SESSION s = Current();

      return (s == SESSION_LONDON || s == SESSION_NEWYORK);
   }

   string Name()
   {
      switch(Current())
      {
         case SESSION_ASIA:
            return "ASIA";

         case SESSION_LONDON:
            return "LONDON";

         case SESSION_NEWYORK:
            return "NEW YORK";

         default:
            return "CLOSED";
      }
   }
};

#endif