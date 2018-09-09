//==============================================================================
//  Game_Desktop
//==============================================================================

class Game_Desktop extends GUI_BaseDesktop
    native
    dependsOn()
  ;

  const CT_System =  7;
  const CT_Combat =  6;
  const CT_Private =  5;
  const CT_Guild =  4;
  const CT_Team =  3;
  const CT_Trade =  2;
  const CT_Zone =  1;
  const CT_Local =  0;
  const CT_Invalid =  -1;

  event OnRankUp(int newRank);


  event OnLevelUp(int newLevel);


  native function CloseShapeShiftRelevantWindows();


  native function bool ShapeShiftRelevantWindow(int wndType);


  event AddScreenMessage(string aMessage,optional Color aColour);


  event AddMessage(string aSenderName,string aMessage,int aChannel);


  event ProcessMessage(string aMessage,int aChannel);



