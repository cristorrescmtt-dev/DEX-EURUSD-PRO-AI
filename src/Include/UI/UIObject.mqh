#ifndef DEX_UI_OBJECT_MQH
#define DEX_UI_OBJECT_MQH

class CUIObject
{
public:

   void Label(
      string name,
      string text,
      int x,
      int y,
      color clr = clrWhite,
      int size = 10
   )
   {
      if(ObjectFind(0,name)<0)
      {
         ObjectCreate(0,name,OBJ_LABEL,0,0,0);
      }

      ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(0,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(0,name,OBJPROP_FONTSIZE,size);

      ObjectSetString(0,name,OBJPROP_FONT,"Consolas");
      ObjectSetString(0,name,OBJPROP_TEXT,text);
   }

};

#endif