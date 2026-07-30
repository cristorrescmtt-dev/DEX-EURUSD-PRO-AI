//+------------------------------------------------------------------+
//| Logger.mqh                                                       |
//| DEX Engine                                                       |
//+------------------------------------------------------------------+
#ifndef DEX_LOGGER_MQH
#define DEX_LOGGER_MQH

enum ENUM_LOG_LEVEL
{
   LOG_INFO,
   LOG_WARNING,
   LOG_ERROR,
   LOG_DEBUG
};

class CLogger
{
private:

   bool m_debugMode;

public:

   CLogger()
   {
      m_debugMode = true;
   }

   void EnableDebug(bool enabled)
   {
      m_debugMode = enabled;
   }

   void Info(string message)
   {
      Print("[INFO] ", message);
   }

   void Warning(string message)
   {
      Print("[WARNING] ", message);
   }

   void Error(string message)
   {
      Print("[ERROR] ", message);
   }

   void Debug(string message)
   {
      if(m_debugMode)
         Print("[DEBUG] ", message);
   }
};

#endif