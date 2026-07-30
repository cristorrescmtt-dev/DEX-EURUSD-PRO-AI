//+------------------------------------------------------------------+
//| DEX Engine                                                       |
//| Constants.mqh                                                    |
//| Version: 0.1.0 Alpha                                             |
//+------------------------------------------------------------------+
#ifndef DEX_CONSTANTS_MQH
#define DEX_CONSTANTS_MQH

//--------------------------------------------------
// Información del proyecto
//--------------------------------------------------
#define DEX_NAME           "DEX EURUSD PRO AI"
#define DEX_VERSION        "0.1.0"
#define DEX_AUTHOR         "Digital Express"

//--------------------------------------------------
// Trading
//--------------------------------------------------
#define DEX_MAGIC_NUMBER   26073001
#define DEX_SYMBOL         "EURUSD"

//--------------------------------------------------
// Límites
//--------------------------------------------------
#define MAX_SPREAD_POINTS  20
#define MAX_OPEN_TRADES    1

//--------------------------------------------------
// Estados del motor
//--------------------------------------------------
enum ENUM_ENGINE_STATE
{
   ENGINE_STOPPED = 0,
   ENGINE_RUNNING = 1
};

//--------------------------------------------------
// Señales
//--------------------------------------------------
enum ENUM_SIGNAL
{
   SIGNAL_NONE = 0,
   SIGNAL_BUY  = 1,
   SIGNAL_SELL = -1
};

#endif