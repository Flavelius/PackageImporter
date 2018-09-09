//==============================================================================
//  HUD_OnScreenMessages
//==============================================================================

class HUD_OnScreenMessages extends GUI_Window
    native
    exportstructs
    dependsOn(GUI_TextCtrl)
    Transient
    Config(User)
  ;

  struct OnScreenMessage {
      var GUI_TextCtrl TextCtrl;
      var float CreationTime;
      var float PreviousTop;
      var bool Fading;

  };


  var array<OnScreenMessage> OnScreenMessages;
  var string mDefaultFont;
  var Color mDefaultColor;
  var float mTimer;
  var float mDefaultDisplayTime;
  var float mDefaultFadeTime;
  var int mDefaultWidth;
  var int mDefaultHeight;
  var int mPreviousMessageCount;
  var string mPreviousMessageText;
  var float mPreviousMessageTimer;


  event AddOnScreenMessage(string aMessage,optional Color aColor,optional string aFont) {
    local GUI_TextCtrl lTextCtrl;
    if (aMessage == mPreviousMessageText
      && mTimer - mPreviousMessageTimer < mDefaultDisplayTime + mDefaultFadeTime) {//0000 : 07 30 00 82 7A 00 A8 C4 A2 19 01 D8 C8 A2 19 16 18 1B 00 B0 AF 01 50 C9 A2 19 01 C8 C9 A2 19 16 AE 01 40 CA A2 19 01 B8 CA A2 19 16 16 16 
      return;                                                                   //002E : 04 0B 
    }
    lTextCtrl = GUI_TextCtrl(CreatePage("GUI_TextCtrl",Class'GUI_BaseDesktop'.524288,0,0,0,mDefaultWidth,0));//0030 : 0F 00 30 CB A2 19 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 01 A8 CB A2 19 25 16 
    lTextCtrl.Invalidate();                                                     //0066 : 19 00 30 CB A2 19 06 00 00 1B 1D 98 00 00 16 
    lTextCtrl.SetText(aMessage);                                                //0075 : 19 00 30 CB A2 19 0B 00 00 1B 13 98 00 00 00 A8 C4 A2 19 16 
    lTextCtrl.SetUseColorCodes(True);                                           //0089 : 19 00 30 CB A2 19 07 00 00 1B CB 98 00 00 27 16 
    lTextCtrl.mUseParentAlpha = False;                                          //0099 : 14 19 00 30 CB A2 19 06 00 04 2D 01 58 E0 9D 19 28 
    lTextCtrl.mLabelStyle = 4096 | 512;                                         //00AA : 0F 19 00 30 CB A2 19 05 00 04 01 20 CC A2 19 9E 1D 00 10 00 00 1D 00 02 00 00 16 
    if (aFont != "") {                                                          //00C5 : 07 E8 00 7B 00 98 CC A2 19 1F 00 16 
      lTextCtrl.SetFont(aFont);                                                 //00D1 : 19 00 30 CB A2 19 0B 00 00 1B 25 98 00 00 00 98 CC A2 19 16 
    } else {                                                                    //00E5 : 06 FC 00 
      lTextCtrl.SetFont(mDefaultFont);                                          //00E8 : 19 00 30 CB A2 19 0B 00 00 1B 25 98 00 00 01 10 CD A2 19 16 
    }
    if (aColor.R != 0 || aColor.G != 0 || aColor.B != 0
      || aColor.A != 0) {//00FC : 07 8C 01 84 84 84 9B 39 3A 36 D0 90 6A 0F 00 88 CD A2 19 25 16 18 10 00 9B 39 3A 36 58 90 6A 0F 00 88 CD A2 19 25 16 16 18 10 00 9B 39 3A 36 E0 8F 6A 0F 00 88 CD A2 19 25 16 16 18 10 00 9B 39 3A 36 48 91 6A 0F 00 88 CD A2 19 25 16 16 
      lTextCtrl.SetColor(aColor.R,aColor.G,aColor.B,aColor.A);                  //014A : 19 00 30 CB A2 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 00 88 CD A2 19 39 3A 36 58 90 6A 0F 00 88 CD A2 19 39 3A 36 E0 8F 6A 0F 00 88 CD A2 19 39 3A 36 48 91 6A 0F 00 88 CD A2 19 16 
    } else {                                                                    //0189 : 06 CB 01 
      lTextCtrl.SetColor(mDefaultColor.R,mDefaultColor.G,mDefaultColor.B,mDefaultColor.A);//018C : 19 00 30 CB A2 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 00 CE A2 19 39 3A 36 58 90 6A 0F 01 00 CE A2 19 39 3A 36 E0 8F 6A 0F 01 00 CE A2 19 39 3A 36 48 91 6A 0F 01 00 CE A2 19 16 
    }
    mPreviousMessageCount = OnScreenMessages.Length;                            //01CB : 0F 01 78 CE A2 19 37 01 F0 CE A2 19 
    mPreviousMessageText = aMessage;                                            //01D7 : 0F 01 D8 C8 A2 19 00 A8 C4 A2 19 
    mPreviousMessageTimer = mTimer;                                             //01E2 : 0F 01 C8 C9 A2 19 01 50 C9 A2 19 
    OnScreenMessages.Insert(OnScreenMessages.Length,1);                         //01ED : 40 01 F0 CE A2 19 37 01 F0 CE A2 19 26 
    OnScreenMessages[OnScreenMessages.Length - 1].TextCtrl = lTextCtrl;         //01FA : 0F 36 F0 CF A2 19 10 93 37 01 F0 CE A2 19 26 16 01 F0 CE A2 19 00 30 CB A2 19 
    OnScreenMessages[OnScreenMessages.Length - 1].CreationTime = mTimer;        //0214 : 0F 36 68 D0 A2 19 10 93 37 01 F0 CE A2 19 26 16 01 F0 CE A2 19 01 50 C9 A2 19 
    OnScreenMessages[OnScreenMessages.Length - 1].Fading = False;               //022E : 14 2D 36 E0 D0 A2 19 10 93 37 01 F0 CE A2 19 26 16 01 F0 CE A2 19 28 
    OnScreenMessages[OnScreenMessages.Length - 1].PreviousTop = 0.00000000;     //0245 : 0F 36 58 D1 A2 19 10 93 37 01 F0 CE A2 19 26 16 01 F0 CE A2 19 1E 00 00 00 00 
    mDesktop.ShowStdWindow(Class'GUI_Desktop'.76,Class'GUI_Desktop'.1);         //025F : 19 01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 4C 12 20 48 DB 2E 1D 01 00 04 26 16 
    mDesktop.BringToTop(self);                                                  //0283 : 19 01 48 0C 9D 19 07 00 00 1B 3E 98 00 00 17 16 
    //07 30 00 82 7A 00 A8 C4 A2 19 01 D8 C8 A2 19 16 18 1B 00 B0 AF 01 50 C9 A2 19 01 C8 C9 A2 19 16 
    //AE 01 40 CA A2 19 01 B8 CA A2 19 16 16 16 04 0B 0F 00 30 CB A2 19 2E 20 79 2F 1D 1B 16 98 00 00 
    //1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 01 
    //A8 CB A2 19 25 16 19 00 30 CB A2 19 06 00 00 1B 1D 98 00 00 16 19 00 30 CB A2 19 0B 00 00 1B 13 
    //98 00 00 00 A8 C4 A2 19 16 19 00 30 CB A2 19 07 00 00 1B CB 98 00 00 27 16 14 19 00 30 CB A2 19 
    //06 00 04 2D 01 58 E0 9D 19 28 0F 19 00 30 CB A2 19 05 00 04 01 20 CC A2 19 9E 1D 00 10 00 00 1D 
    //00 02 00 00 16 07 E8 00 7B 00 98 CC A2 19 1F 00 16 19 00 30 CB A2 19 0B 00 00 1B 25 98 00 00 00 
    //98 CC A2 19 16 06 FC 00 19 00 30 CB A2 19 0B 00 00 1B 25 98 00 00 01 10 CD A2 19 16 07 8C 01 84 
    //84 84 9B 39 3A 36 D0 90 6A 0F 00 88 CD A2 19 25 16 18 10 00 9B 39 3A 36 58 90 6A 0F 00 88 CD A2 
    //19 25 16 16 18 10 00 9B 39 3A 36 E0 8F 6A 0F 00 88 CD A2 19 25 16 16 18 10 00 9B 39 3A 36 48 91 
    //6A 0F 00 88 CD A2 19 25 16 16 19 00 30 CB A2 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 00 
    //88 CD A2 19 39 3A 36 58 90 6A 0F 00 88 CD A2 19 39 3A 36 E0 8F 6A 0F 00 88 CD A2 19 39 3A 36 48 
    //91 6A 0F 00 88 CD A2 19 16 06 CB 01 19 00 30 CB A2 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 
    //0F 01 00 CE A2 19 39 3A 36 58 90 6A 0F 01 00 CE A2 19 39 3A 36 E0 8F 6A 0F 01 00 CE A2 19 39 3A 
    //36 48 91 6A 0F 01 00 CE A2 19 16 0F 01 78 CE A2 19 37 01 F0 CE A2 19 0F 01 D8 C8 A2 19 00 A8 C4 
    //A2 19 0F 01 C8 C9 A2 19 01 50 C9 A2 19 40 01 F0 CE A2 19 37 01 F0 CE A2 19 26 0F 36 F0 CF A2 19 
    //10 93 37 01 F0 CE A2 19 26 16 01 F0 CE A2 19 00 30 CB A2 19 0F 36 68 D0 A2 19 10 93 37 01 F0 CE 
    //A2 19 26 16 01 F0 CE A2 19 01 50 C9 A2 19 14 2D 36 E0 D0 A2 19 10 93 37 01 F0 CE A2 19 26 16 01 
    //F0 CE A2 19 28 0F 36 58 D1 A2 19 10 93 37 01 F0 CE A2 19 26 16 01 F0 CE A2 19 1E 00 00 00 00 19 
    //01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 4C 12 20 48 DB 2E 1D 01 00 
    //04 26 16 19 01 48 0C 9D 19 07 00 00 1B 3E 98 00 00 17 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 80 D2 A2 19 16 
    //1C 20 7A 9E 19 00 80 D2 A2 19 16 04 0B 47 
  }


  event Initialize() {
    mWidth = mDefaultWidth;                                                     //0000 : 0F 01 60 87 31 16 39 3F 01 A8 CB A2 19 
    mHeight = mDefaultHeight;                                                   //000D : 0F 01 40 88 31 16 39 3F 01 38 D3 A2 19 
    mTimer = 0.00000000;                                                        //001A : 0F 01 50 C9 A2 19 1E 00 00 00 00 
    Super.Initialize();                                                         //0025 : 1C 28 9E 9E 19 16 
    mComponentStyle = mComponentStyle | Class'GUI_BaseDesktop'.524288;          //002B : 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 16 
    //0F 01 60 87 31 16 39 3F 01 A8 CB A2 19 0F 01 40 88 31 16 39 3F 01 38 D3 A2 19 0F 01 50 C9 A2 19 
    //1E 00 00 00 00 1C 28 9E 9E 19 16 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 00 68 D7 00 05 00 04 
    //1D 00 00 08 00 16 04 0B 47 
  }



