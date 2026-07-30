//+------------------------------------------------------------------+
//| Kernel.mqh                                                       |
//| DEX Engine                                                       |
//+------------------------------------------------------------------+
#ifndef DEX_KERNEL_MQH
#define DEX_KERNEL_MQH

class CKernel
{
private:

   bool m_initialized;

public:

   CKernel()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      m_initialized = true;
      return true;
   }

   void Shutdown()
   {
      m_initialized = false;
   }

   void Update()
   {
      if(!m_initialized)
         return;

      // Aquí iremos llamando a todos los módulos
      // Market
      // Indicators
      // Signals
      // Risk
      // Trading
      // Dashboard
   }

   bool IsInitialized()
   {
      return m_initialized;
   }
};

#endif