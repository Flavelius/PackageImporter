//==============================================================================
//  GUI_NPCDebugWindow
//==============================================================================

class GUI_NPCDebugWindow extends GUI_Window
    native
    dependsOn(GUI_TextCtrl)
    Transient
    Config(User)
  ;

  var GUI_TextCtrl mText;
  var Game_NPCPawn mLastPawn;


  function Initialize() {
    mWidth = mDesktop.GetScreenWidth();                                         //0000 : 0F 01 60 87 31 16 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 
    mHeight = mDesktop.GetScreenHeight();                                       //0015 : 0F 01 40 88 31 16 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 
    Super.Initialize();                                                         //002A : 1C 28 9E 9E 19 16 
    mText = GUI_TextCtrl(CreatePage("GUI_TextCtrl",Class'GUI_Desktop'.524288,0,0,0,200,400));//0030 : 0F 01 80 17 A8 19 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 12 20 48 DB 2E 1D 05 00 04 1D 00 00 08 00 25 25 25 2C C8 1D 90 01 00 00 16 
    mText.SetBorder(2,4,4,4,"textfield","SBGuiTX.GUI_Styles","GUI_Styles");     //0067 : 19 01 80 17 A8 19 39 00 00 1B 2B 98 00 00 2C 02 2C 04 2C 04 2C 04 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    //0F 01 60 87 31 16 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 0F 01 40 88 31 16 19 01 48 0C 9D 
    //19 06 00 04 1B 2E 98 00 00 16 1C 28 9E 9E 19 16 0F 01 80 17 A8 19 2E 20 79 2F 1D 1B 16 98 00 00 
    //1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 12 20 48 DB 2E 1D 05 00 04 1D 00 00 08 00 25 25 25 2C 
    //C8 1D 90 01 00 00 16 19 01 80 17 A8 19 39 00 00 1B 2B 98 00 00 2C 02 2C 04 2C 04 2C 04 1F 74 65 
    //78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 
    //5F 53 74 79 6C 65 73 00 16 04 0B 47 
  }



