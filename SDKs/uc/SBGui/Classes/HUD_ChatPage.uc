//==============================================================================
//  HUD_ChatPage
//==============================================================================

class HUD_ChatPage extends GUI_Page
    native
    dependsOn(HUD_Chat,GUI_Menu,GUI_Window,HUD_ChatWindow,GUI_Desktop,GUI_TextCtrl,GUI_DefaultToolkit,Class,GUI_BaseDesktop)
    Transient
    Config(User)
  ;

  var private GUI_TextCtrl mTextCtrl;
  var private int mScrollDown;
  var private GUI_Page mTextCtrlContainer;
  var private HUD_Chat mChatMessagesSource;
  var private int mRegisteredChannels;
  var private GUI_Window mCurrentAssignedWindow;
  var private int mLastUsedChannel;
  var private int mFontSize;
  var string mTitle;
  var bool mIsWindowed;
  var (null);


  delegate OnMessageReceived(HUD_ChatPage aPage,string Message);


  function SaveChatSettings() {
    if (mChatMessagesSource != None) {                                          //0000 : 07 1A 00 77 01 60 BC A5 19 2A 16 
      mChatMessagesSource.SaveChatSettings();                                   //000B : 19 01 60 BC A5 19 06 00 00 1B 6A 98 00 00 16 
    }
    //07 1A 00 77 01 60 BC A5 19 2A 16 19 01 60 BC A5 19 06 00 00 1B 6A 98 00 00 16 04 0B 47 
  }


  function GetFontSize(GUI_Menu aFontSizeMenu) {
    if (aFontSizeMenu != None) {                                                //0000 : 07 59 00 77 00 88 BD A5 19 2A 16 
      aFontSizeMenu.CheckButton(10,mFontSize == 10);                            //000B : 19 00 88 BD A5 19 11 00 00 1B 7A 98 00 00 2C 0A 9A 01 00 BE A5 19 2C 0A 16 16 
      aFontSizeMenu.CheckButton(11,mFontSize == 11);                            //0025 : 19 00 88 BD A5 19 11 00 00 1B 7A 98 00 00 2C 0B 9A 01 00 BE A5 19 2C 0B 16 16 
      aFontSizeMenu.CheckButton(12,mFontSize == 12);                            //003F : 19 00 88 BD A5 19 11 00 00 1B 7A 98 00 00 2C 0C 9A 01 00 BE A5 19 2C 0C 16 16 
    }
    //07 59 00 77 00 88 BD A5 19 2A 16 19 00 88 BD A5 19 11 00 00 1B 7A 98 00 00 2C 0A 9A 01 00 BE A5 
    //19 2C 0A 16 16 19 00 88 BD A5 19 11 00 00 1B 7A 98 00 00 2C 0B 9A 01 00 BE A5 19 2C 0B 16 16 19 
    //00 88 BD A5 19 11 00 00 1B 7A 98 00 00 2C 0C 9A 01 00 BE A5 19 2C 0C 16 16 04 0B 47 
  }


  function GetFilterSettings(GUI_Menu aChannelFilterMenu) {
    local int idx;
    if (aChannelFilterMenu != None) {                                           //0000 : 07 4E 00 77 00 28 BF A5 19 2A 16 
      idx = 0;                                                                  //000B : 0F 00 A0 BF A5 19 25 
      while (idx < 8) {                                                         //0012 : 07 4E 00 96 00 A0 BF A5 19 2C 08 16 
        aChannelFilterMenu.CheckButton(idx,(mRegisteredChannels & 1 << idx) > 0);//001E : 19 00 28 BF A5 19 1D 00 00 1B 7A 98 00 00 00 A0 BF A5 19 97 9C 01 18 C0 A5 19 94 26 00 A0 BF A5 19 16 16 25 16 16 
        idx++;                                                                  //0044 : A5 00 A0 BF A5 19 16 
      }
    }
    //07 4E 00 77 00 28 BF A5 19 2A 16 0F 00 A0 BF A5 19 25 07 4E 00 96 00 A0 BF A5 19 2C 08 16 19 00 
    //28 BF A5 19 1D 00 00 1B 7A 98 00 00 00 A0 BF A5 19 97 9C 01 18 C0 A5 19 94 26 00 A0 BF A5 19 16 
    //16 25 16 16 A5 00 A0 BF A5 19 16 06 12 00 04 0B 47 
  }


  function SetLastUsedChannel(int i) {
    mLastUsedChannel = i;                                                       //0000 : 0F 01 F8 C1 A5 19 00 40 C1 A5 19 
    //0F 01 F8 C1 A5 19 00 40 C1 A5 19 04 0B 47 
  }


  function int GetLastUsedChannel() {
    return mLastUsedChannel;                                                    //0000 : 04 01 F8 C1 A5 19 
    //04 01 F8 C1 A5 19 04 0B 47 
  }


  function SetChannelFlags(int newFlags) {
    local int i;
    mRegisteredChannels = newFlags;                                             //0000 : 0F 01 18 C0 A5 19 00 80 C4 A5 19 
    i = 8;                                                                      //000B : 0F 00 80 C5 A5 19 2C 08 
    while (i < 8) {                                                             //0013 : 07 3E 00 96 00 80 C5 A5 19 2C 08 16 
      mRegisteredChannels = mRegisteredChannels | 1 << i;                       //001F : 0F 01 18 C0 A5 19 9E 01 18 C0 A5 19 94 26 00 80 C5 A5 19 16 16 
      i++;                                                                      //0034 : A5 00 80 C5 A5 19 16 
    }
    //0F 01 18 C0 A5 19 00 80 C4 A5 19 0F 00 80 C5 A5 19 2C 08 07 3E 00 96 00 80 C5 A5 19 2C 08 16 0F 
    //01 18 C0 A5 19 9E 01 18 C0 A5 19 94 26 00 80 C5 A5 19 16 16 A5 00 80 C5 A5 19 16 06 13 00 04 0B 
    //47 
  }


  function int GetRegisteredChannels() {
    return mRegisteredChannels;                                                 //0000 : 04 01 18 C0 A5 19 
    //04 01 18 C0 A5 19 04 0B 47 
  }


  native function bool AcceptsInput(int Channel);


  native function SetChannelFilter(int Channel,bool acceptingInput);


  native function ResetText();


  function SetChatSource(HUD_Chat aSource) {
    mChatMessagesSource = aSource;                                              //0000 : 0F 01 60 BC A5 19 00 98 CC A5 19 
    //0F 01 60 BC A5 19 00 98 CC A5 19 04 0B 47 
  }


  function GUI_Window GetWindow() {
    return mCurrentAssignedWindow;                                              //0000 : 04 01 B0 CE A5 19 
    //04 01 B0 CE A5 19 04 0B 47 
  }


  event ChangeWindow(GUI_Window aWindow) {
    if (aWindow != None) {                                                      //0000 : 07 75 00 77 00 D8 CF A5 19 2A 16 
      if (mCurrentAssignedWindow != None) {                                     //000B : 07 2A 00 77 01 B0 CE A5 19 2A 16 
        mCurrentAssignedWindow.__OnWindowClosed__Delegate = None;               //0016 : 45 19 01 B0 CE A5 19 05 00 08 01 E0 8C 9E 19 44 00 00 00 00 
      }
      mCurrentAssignedWindow = aWindow;                                         //002A : 0F 01 B0 CE A5 19 00 D8 CF A5 19 
      mCurrentAssignedWindow.__OnWindowClosed__Delegate = WindowClosed;         //0035 : 45 19 01 B0 CE A5 19 05 00 08 01 E0 8C 9E 19 44 6B 97 00 00 
      if (aWindow.IsA('HUD_ChatWindow')) {                                      //0049 : 07 72 00 19 00 D8 CF A5 19 08 00 04 61 2F 21 93 97 00 00 16 
        HUD_ChatWindow(aWindow).SetChatPage(self);                              //005D : 19 2E A0 7C 31 1D 00 D8 CF A5 19 07 00 00 1B 3F 97 00 00 17 16 
      }
    } else {                                                                    //0072 : 06 7C 00 
      mCurrentAssignedWindow = None;                                            //0075 : 0F 01 B0 CE A5 19 2A 
    }
    //07 75 00 77 00 D8 CF A5 19 2A 16 07 2A 00 77 01 B0 CE A5 19 2A 16 45 19 01 B0 CE A5 19 05 00 08 
    //01 E0 8C 9E 19 44 00 00 00 00 0F 01 B0 CE A5 19 00 D8 CF A5 19 45 19 01 B0 CE A5 19 05 00 08 01 
    //E0 8C 9E 19 44 6B 97 00 00 07 72 00 19 00 D8 CF A5 19 08 00 04 61 2F 21 93 97 00 00 16 19 2E A0 
    //7C 31 1D 00 D8 CF A5 19 07 00 00 1B 3F 97 00 00 17 16 06 7C 00 0F 01 B0 CE A5 19 2A 04 0B 47 
  }


  event OnComponentDestroyed() {
    //04 0B 47 
  }


  native function AddMessage(string aMessage,int aChannel);


  event SetFontSize(int FontSize) {
    local GUI_DefaultToolkit kit;
    kit = GUI_DefaultToolkit(mDesktop.mToolkit);                                //0000 : 0F 00 88 D5 A5 19 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 
    switch (FontSize) {                                                         //0019 : 05 04 00 B8 D3 A5 19 
      case 10 :                                                                 //0020 : 0A 59 00 2C 0A 
        mFontSize = 10;                                                         //0025 : 0F 01 00 BE A5 19 2C 0A 
        mTextCtrl.SetFont(kit.GetFontName(Class'GUI_DefaultToolkit'.2));        //002D : 19 01 00 D6 A5 19 20 00 00 1B 25 98 00 00 19 00 88 D5 A5 19 11 00 00 1B 1B 99 00 00 12 20 F0 D5 2E 1D 02 00 01 24 02 16 16 
        break;                                                                  //0056 : 06 CE 00 
      case 11 :                                                                 //0059 : 0A 92 00 2C 0B 
        mFontSize = 11;                                                         //005E : 0F 01 00 BE A5 19 2C 0B 
        mTextCtrl.SetFont(kit.GetFontName(Class'GUI_DefaultToolkit'.3));        //0066 : 19 01 00 D6 A5 19 20 00 00 1B 25 98 00 00 19 00 88 D5 A5 19 11 00 00 1B 1B 99 00 00 12 20 F0 D5 2E 1D 02 00 01 24 03 16 16 
        break;                                                                  //008F : 06 CE 00 
      case 12 :                                                                 //0092 : 0A CB 00 2C 0C 
        mFontSize = 12;                                                         //0097 : 0F 01 00 BE A5 19 2C 0C 
        mTextCtrl.SetFont(kit.GetFontName(Class'GUI_DefaultToolkit'.4));        //009F : 19 01 00 D6 A5 19 20 00 00 1B 25 98 00 00 19 00 88 D5 A5 19 11 00 00 1B 1B 99 00 00 12 20 F0 D5 2E 1D 02 00 01 24 04 16 16 
        break;                                                                  //00C8 : 06 CE 00 
      default:                                                                  //00CB : 0A FF FF 
    }
    mScrollDown = 2;                                                            //00CE : 0F 01 78 D6 A5 19 2C 02 
    //0F 00 88 D5 A5 19 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 05 04 00 B8 D3 A5 19 
    //0A 59 00 2C 0A 0F 01 00 BE A5 19 2C 0A 19 01 00 D6 A5 19 20 00 00 1B 25 98 00 00 19 00 88 D5 A5 
    //19 11 00 00 1B 1B 99 00 00 12 20 F0 D5 2E 1D 02 00 01 24 02 16 16 06 CE 00 0A 92 00 2C 0B 0F 01 
    //00 BE A5 19 2C 0B 19 01 00 D6 A5 19 20 00 00 1B 25 98 00 00 19 00 88 D5 A5 19 11 00 00 1B 1B 99 
    //00 00 12 20 F0 D5 2E 1D 02 00 01 24 03 16 16 06 CE 00 0A CB 00 2C 0C 0F 01 00 BE A5 19 2C 0C 19 
    //01 00 D6 A5 19 20 00 00 1B 25 98 00 00 19 00 88 D5 A5 19 11 00 00 1B 1B 99 00 00 12 20 F0 D5 2E 
    //1D 02 00 01 24 04 16 16 06 CE 00 0A FF FF 0F 01 78 D6 A5 19 2C 02 04 0B 47 
  }


  event AddText(string Text) {
    if (!mTextCtrl.IsEmpty()) {                                                 //0000 : 07 26 00 81 19 01 00 D6 A5 19 06 00 04 1B 7A 6E 00 00 16 16 
      mTextCtrl.AddText("",True);                                               //0014 : 19 01 00 D6 A5 19 09 00 00 1B AE 96 00 00 1F 00 27 16 
    }
    mTextCtrl.AddText(Text,False);                                              //0026 : 19 01 00 D6 A5 19 0C 00 00 1B AE 96 00 00 00 A0 D7 A5 19 28 16 
    mScrollDown = 2;                                                            //003B : 0F 01 78 D6 A5 19 2C 02 
    OnMessageReceived(self,Text);                                               //0043 : 43 90 19 A2 19 07 97 00 00 17 00 A0 D7 A5 19 16 
    //07 26 00 81 19 01 00 D6 A5 19 06 00 04 1B 7A 6E 00 00 16 16 19 01 00 D6 A5 19 09 00 00 1B AE 96 
    //00 00 1F 00 27 16 19 01 00 D6 A5 19 0C 00 00 1B AE 96 00 00 00 A0 D7 A5 19 28 16 0F 01 78 D6 A5 
    //19 2C 02 43 90 19 A2 19 07 97 00 00 17 00 A0 D7 A5 19 16 04 0B 47 
  }


  event AdjustTextCtrlDimensions(float X,float Y,float width,float Height) {
    local int lineHeight;
    lineHeight = mTextCtrl.GetLineHeight();                                     //0000 : 0F 00 E0 D9 A5 19 19 01 00 D6 A5 19 06 00 04 1B 19 9B 00 00 16 
    Height = Height / lineHeight * lineHeight - 1;                              //0015 : 0F 00 58 DA A5 19 AF AB 39 3F 91 39 44 00 58 DA A5 19 00 E0 D9 A5 19 16 39 3F 00 E0 D9 A5 19 16 39 3F 26 16 
    mTextCtrlContainer.SetPosition(X,Y,width,Height);                           //0039 : 19 01 D0 DA A5 19 1A 00 00 1B 23 98 00 00 00 68 D9 A5 19 00 48 DB A5 19 00 C0 DB A5 19 00 58 DA A5 19 16 
    mTextCtrl.SetPosition(0.00000000,0.00000000,width - 6 - 17,mTextCtrl.mHeight);//005C : 19 01 00 D6 A5 19 2F 00 00 1B 23 98 00 00 1E 00 00 00 00 1E 00 00 00 00 AF AF 00 C0 DB A5 19 39 3F 2C 06 16 39 3F 2C 11 16 19 01 00 D6 A5 19 05 00 04 01 40 88 31 16 16 
    mScrollDown = 2;                                                            //0094 : 0F 01 78 D6 A5 19 2C 02 
    Invalidate();                                                               //009C : 1B 1D 98 00 00 16 
    //0F 00 E0 D9 A5 19 19 01 00 D6 A5 19 06 00 04 1B 19 9B 00 00 16 0F 00 58 DA A5 19 AF AB 39 3F 91 
    //39 44 00 58 DA A5 19 00 E0 D9 A5 19 16 39 3F 00 E0 D9 A5 19 16 39 3F 26 16 19 01 D0 DA A5 19 1A 
    //00 00 1B 23 98 00 00 00 68 D9 A5 19 00 48 DB A5 19 00 C0 DB A5 19 00 58 DA A5 19 16 19 01 00 D6 
    //A5 19 2F 00 00 1B 23 98 00 00 1E 00 00 00 00 1E 00 00 00 00 AF AF 00 C0 DB A5 19 39 3F 2C 06 16 
    //39 3F 2C 11 16 19 01 00 D6 A5 19 05 00 04 01 40 88 31 16 16 0F 01 78 D6 A5 19 2C 02 1B 1D 98 00 
    //00 16 04 0B 47 
  }


  event WindowClosed(GUI_Window aWindow) {
    if (mChatMessagesSource != None) {                                          //0000 : 07 39 00 77 01 60 BC A5 19 2A 16 
      mChatMessagesSource.DeregisterChatPage(self);                             //000B : 19 01 60 BC A5 19 07 00 00 1B B9 96 00 00 17 16 
      mDesktop.DestroyWindow(aWindow.GetWindowHandle());                        //001B : 19 01 48 0C 9D 19 15 00 00 1B 54 2D 00 00 19 00 E8 DC A5 19 06 00 04 1B 9B 98 00 00 16 16 
    }
    //07 39 00 77 01 60 BC A5 19 2A 16 19 01 60 BC A5 19 07 00 00 1B B9 96 00 00 17 16 19 01 48 0C 9D 
    //19 15 00 00 1B 54 2D 00 00 19 00 E8 DC A5 19 06 00 04 1B 9B 98 00 00 16 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mTextCtrlContainer = CreatePage("GUI_Page",0,Class'GUI_BaseDesktop'.2,0,0,mWidth,mHeight);//0006 : 0F 01 D0 DA A5 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 12 20 00 68 D7 00 02 00 04 2C 02 25 25 39 44 01 60 87 31 16 39 44 01 40 88 31 16 16 
    mTextCtrlContainer.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000); //0038 : 19 01 D0 DA A5 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    mTextCtrlContainer.SetBorder(0,0,0,0);                                      //005B : 19 01 D0 DA A5 19 0A 00 00 1B 2B 98 00 00 25 25 25 25 16 
    mTextCtrl = GUI_TextCtrl(mTextCtrlContainer.CreatePage("GUI_TextCtrl",Class'GUI_BaseDesktop'.524288,0,0,0,mWidth - 17,25));//006E : 0F 01 00 D6 A5 19 2E 20 79 2F 1D 19 01 D0 DA A5 19 34 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 39 44 AF 01 60 87 31 16 39 3F 2C 11 16 2C 19 16 
    mTextCtrl.SetBorder(0,0,0,0);                                               //00B6 : 19 01 00 D6 A5 19 0A 00 00 1B 2B 98 00 00 25 25 25 25 16 
    mTextCtrl.SetAnchors(0.00000000,1.00000000,1.00000000,1.00000000);          //00C9 : 19 01 00 D6 A5 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 1E 00 00 80 3F 16 
    mTextCtrl.mLabelStyle = Class'GUI_BaseDesktop'.4096;                        //00EC : 0F 19 01 00 D6 A5 19 05 00 04 01 20 CC A2 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 
    mTextCtrl.SetUseColorCodes(True);                                           //0109 : 19 01 00 D6 A5 19 07 00 00 1B CB 98 00 00 27 16 
    mTextCtrl.mUseParentAlpha = False;                                          //0119 : 14 19 01 00 D6 A5 19 06 00 04 2D 01 58 E0 9D 19 28 
    mTextCtrl.mAlphaDeltaMode = 2;                                              //012A : 0F 19 01 00 D6 A5 19 05 00 01 01 50 11 A5 19 24 02 
    mTextCtrl.mAlphaDeltaStart = 2.40000010;                                    //013B : 0F 19 01 00 D6 A5 19 05 00 04 01 C8 11 A5 19 1E 9A 99 19 40 
    mTextCtrl.mAlphaDelta = 0.10000000;                                         //014F : 0F 19 01 00 D6 A5 19 05 00 04 01 90 12 A5 19 1E CD CC CC 3D 
    mFontSize = 11;                                                             //0163 : 0F 01 00 BE A5 19 2C 0B 
    SetFontSize(mFontSize);                                                     //016B : 1B 46 97 00 00 01 00 BE A5 19 16 
    //1C 40 5B 9E 19 16 0F 01 D0 DA A5 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 12 20 00 68 
    //D7 00 02 00 04 2C 02 25 25 39 44 01 60 87 31 16 39 44 01 40 88 31 16 16 19 01 D0 DA A5 19 1A 00 
    //00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 19 01 D0 DA A5 
    //19 0A 00 00 1B 2B 98 00 00 25 25 25 25 16 0F 01 00 D6 A5 19 2E 20 79 2F 1D 19 01 D0 DA A5 19 34 
    //00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 12 20 00 68 D7 00 05 00 04 1D 00 
    //00 08 00 25 25 25 39 44 AF 01 60 87 31 16 39 3F 2C 11 16 2C 19 16 19 01 00 D6 A5 19 0A 00 00 1B 
    //2B 98 00 00 25 25 25 25 16 19 01 00 D6 A5 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 80 
    //3F 1E 00 00 80 3F 1E 00 00 80 3F 16 0F 19 01 00 D6 A5 19 05 00 04 01 20 CC A2 19 12 20 00 68 D7 
    //00 05 00 04 1D 00 10 00 00 19 01 00 D6 A5 19 07 00 00 1B CB 98 00 00 27 16 14 19 01 00 D6 A5 19 
    //06 00 04 2D 01 58 E0 9D 19 28 0F 19 01 00 D6 A5 19 05 00 01 01 50 11 A5 19 24 02 0F 19 01 00 D6 
    //A5 19 05 00 04 01 C8 11 A5 19 1E 9A 99 19 40 0F 19 01 00 D6 A5 19 05 00 04 01 90 12 A5 19 1E CD 
    //CC CC 3D 0F 01 00 BE A5 19 2C 0B 1B 46 97 00 00 01 00 BE A5 19 16 04 0B 47 
  }



