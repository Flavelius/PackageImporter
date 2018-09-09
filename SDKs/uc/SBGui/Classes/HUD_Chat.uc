//==============================================================================
//  HUD_Chat
//==============================================================================

class HUD_Chat extends GUI_Window
    native
    exportstructs
    dependsOn(GUI_TabCtrl,Game_PlayerController,Game_PlayerTeams,Game_PlayerGuilds,Canvas,HUD_ChatPage,HUD_ChatWindow,HUD_ChatConsoleManager,GUI_EditBox,GUI_Component,GUI_EntryBox,Game_Chat,EventNotification,GUI_DefaultToolkit)
    Transient
    Config(User)
  ;

  const HD_TOTAL_CHANNEL_COUNT =  8;
  const HD_FILTERABLE_CHANNEL_COUNT =  8;
  const HD_SELECTABLE_CHANNEL_COUNT =  6;
  const HD_CHAT_PAGE_WIDTH_REDUCTION =  43;
  const HD_CHAT_PAGE_X_OFFSET =  40;
  const HD_OPTION_BUTTON_COUNT =  3;
  const HD_MAX_CHAT_PAGES =  4;
  const HD_OUTPUT_PAGE_COUNT =  8;
  const HD_MAX_VANISH_TIME =  0.25;
  const HD_MAX_FADE_TIME =  0.25;
  struct ChatSetting {
      var string Title;
      var int FontSize;
      var int FilterFlags;
      var bool Windowed;
      var float Left;
      var float top;
      var float width;
      var float Height;
      var bool HasFadeOut;

  };


  var GUI_Menu mEmoteWindow;
  var globalconfig string mEmoteWindowFile;
  var globalconfig int mMaxBacklogLength;
  var globalconfig int mMaxUserHistoryLength;
  var globalconfig bool mDisplayChannelInMessage;
  var globalconfig bool mDisplayTimeInMessage;
  var globalconfig bool mAutoSelectOutputPage;
  var globalconfig bool mAutoSelectOutputChannel;
  var globalconfig bool mHasFadeOut;
  var globalconfig bool mHasProfanityFilter;
  var globalconfig array<ChatSetting> mChatSettings;
  var bool mIsPositionLocked;
  var GUI_Image mOrnament;
  var GUI_TabCtrl mTabCtrl;
  var GUI_EditBox mEditBox;
  var GUI_Page mTabScrollPage;
  var GUI_Page mEditBoxScrollPage;
  var GUI_Page mChatIconPage;
  var GUI_Page mBackbarPage;
  var GUI_Button mChannelButtons[6];
  var string mChannelNames[8];
  var Color mChannelColors[8];
  var GUI_Button mChannelSelection;
  var array<HUD_ChatPage> mChatPages;
  var Color mDefaultMessageColor;
  var float mFadeTimer;
  var float mVanishTimer;
  var private string mCurrentWhisperTarget;
  var private GUI_TextButton mCreateTabMenuButton;
  var private GUI_TextButton mRemoveTabMenuButton;
  var GUI_Menu mChannelFilterMenu;
  var GUI_Menu mFontSizeMenu;
  var bool mIsUpdatingText;
  var HUD_ChatConsoleManager mConsoleManager;
  var int mMoveDirection;
  var private GUI_Button mSystemButton;
  var private GUI_TextButton mLockMenuButton;
  var int mChatData;


  function bool MBClickHandler(GUI_MessageBox messageBox,int boxTag,int buttonTag) {
    local string lChannelName;
    switch (boxTag) {                                                           //0000 : 05 04 00 30 C9 9D 19 
      case 1 :                                                                  //0007 : 0A 5F 00 26 
        switch (buttonTag) {                                                    //000B : 05 04 00 A8 C9 9D 19 
          case 1 :                                                              //0012 : 0A 59 00 26 
            lChannelName = GetProperty("GUI_EntryBox.mText");                   //0016 : 0F 00 20 CA 9D 19 1B 44 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 6D 54 65 78 74 00 16 
            lChannelName = Left(lChannelName,12);                               //0036 : 0F 00 20 CA 9D 19 80 00 20 CA 9D 19 2C 0C 16 
            ChangeChatTitle(lChannelName);                                      //0045 : 1B B3 96 00 00 00 20 CA 9D 19 16 
            SaveChatSettings();                                                 //0050 : 1B 6A 98 00 00 16 
            break;                                                              //0056 : 06 5C 00 
          default:                                                              //0059 : 0A FF FF 
        }
        break;                                                                  //005C : 06 62 00 
      default:                                                                  //005F : 0A FF FF 
        return True;                                                            //0062 : 04 27 
      }
    }
    //05 04 00 30 C9 9D 19 0A 5F 00 26 05 04 00 A8 C9 9D 19 0A 59 00 26 0F 00 20 CA 9D 19 1B 44 98 00 
    //00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 6D 54 65 78 74 00 16 0F 00 20 CA 9D 19 80 00 20 CA 
    //9D 19 2C 0C 16 1B B3 96 00 00 00 20 CA 9D 19 16 1B 6A 98 00 00 16 06 5C 00 0A FF FF 06 62 00 0A 
    //FF FF 04 27 04 0B 47 
  }


  function HUD_ChatPage GetActiveChatPage() {
    return HUD_ChatPage(mTabCtrl.GetSelectedPage());                            //0000 : 04 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 
    //04 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 04 0B 47 
  }


  function LayoutChannelButtons() {
    local int i;
    local int lLeft;
    lLeft = 13;                                                                 //0000 : 0F 00 E8 CF 9D 19 2C 0D 
    i = 0;                                                                      //0008 : 0F 00 B0 CD 9D 19 25 
    while (i < 6) {                                                             //000F : 07 21 01 96 00 B0 CD 9D 19 2C 06 16 
      if (GetPlayerController() != None
        && (i == 3
        && Game_PlayerController(GetPlayerController()).GroupingTeams.mTeamID == 0
        || i == 4
        && Game_PlayerController(GetPlayerController()).GroupingGuilds.mGuildID == 0)) {//001B : 07 A6 00 82 77 1B 0E 2F 00 00 16 2A 16 18 62 00 84 82 9A 00 B0 CD 9D 19 2C 03 16 18 21 00 9A 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 05 00 04 01 48 1A 28 11 25 16 16 18 2F 00 82 9A 00 B0 CD 9D 19 2C 04 16 18 21 00 9A 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 C8 A2 1B 11 05 00 04 01 20 B4 32 11 25 16 16 16 16 
        mChannelButtons[i].SetVisible(False);                                   //008D : 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 07 00 00 1B 14 98 00 00 28 16 
      } else {                                                                  //00A3 : 06 02 01 
        mChannelButtons[i].SetVisible(True);                                    //00A6 : 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 07 00 00 1B 14 98 00 00 27 16 
        mChannelButtons[i].mLeft = lLeft;                                       //00BC : 0F 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 05 00 04 01 08 86 31 16 39 3F 00 E8 CF 9D 19 
        lLeft = lLeft + mChannelButtons[i].mWidth - 1;                          //00D8 : 0F 00 E8 CF 9D 19 39 44 AE 39 3F 00 E8 CF 9D 19 AF 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 05 00 04 01 60 87 31 16 39 3F 26 16 16 
      }
      mChannelButtons[i].Invalidate();                                          //0102 : 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 06 00 00 1B 1D 98 00 00 16 
      i++;                                                                      //0117 : A5 00 B0 CD 9D 19 16 
    }
    //0F 00 E8 CF 9D 19 2C 0D 0F 00 B0 CD 9D 19 25 07 21 01 96 00 B0 CD 9D 19 2C 06 16 07 A6 00 82 77 
    //1B 0E 2F 00 00 16 2A 16 18 62 00 84 82 9A 00 B0 CD 9D 19 2C 03 16 18 21 00 9A 19 19 2E 90 18 5B 
    //01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 05 00 04 01 48 1A 28 11 25 16 16 18 2F 00 82 9A 00 
    //B0 CD 9D 19 2C 04 16 18 21 00 9A 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 C8 A2 1B 11 
    //05 00 04 01 20 B4 32 11 25 16 16 16 16 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 07 00 00 1B 14 98 00 
    //00 28 16 06 02 01 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 07 00 00 1B 14 98 00 00 27 16 0F 19 1A 00 
    //B0 CD 9D 19 01 60 D0 9D 19 05 00 04 01 08 86 31 16 39 3F 00 E8 CF 9D 19 0F 00 E8 CF 9D 19 39 44 
    //AE 39 3F 00 E8 CF 9D 19 AF 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 05 00 04 01 60 87 31 16 39 3F 26 
    //16 16 19 1A 00 B0 CD 9D 19 01 60 D0 9D 19 06 00 00 1B 1D 98 00 00 16 A5 00 B0 CD 9D 19 16 06 0F 
    //00 04 0B 47 
  }


  function InitChannelButtons() {
    mChannelNames[0] = Class'SBGuiStrings'.default.Local.Text;                  //0000 : 0F 1A 25 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 40 98 19 
    mChannelColors[0] = Class'Canvas'.static.MakeColor(106,134,253);            //001B : 0F 1A 25 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 6A 24 86 24 FD 16 
    mChannelNames[1] = Class'SBGuiStrings'.default.Zone.Text;                   //0038 : 0F 1A 26 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 F9 98 19 
    mChannelColors[1] = Class'Canvas'.static.MakeColor(59,167,75);              //0053 : 0F 1A 26 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 3B 24 A7 24 4B 16 
    mChannelNames[2] = Class'SBGuiStrings'.default.Trade.Text;                  //0070 : 0F 1A 2C 02 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 98 97 19 
    mChannelColors[2] = Class'Canvas'.static.MakeColor(255,214,186);            //008C : 0F 1A 2C 02 01 00 D2 9D 19 12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 39 3D 2C FF 24 D6 24 BA 16 
    mChannelNames[3] = Class'SBGuiStrings'.default.team.Text;                   //00AC : 0F 1A 2C 03 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 3F 98 19 
    mChannelColors[3] = Class'Canvas'.static.MakeColor(169,122,247);            //00C8 : 0F 1A 2C 03 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A9 24 7A 24 F7 16 
    mChannelNames[4] = Class'SBGuiStrings'.default.Guild.Text;                  //00E6 : 0F 1A 2C 04 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 33 97 19 
    mChannelColors[4] = Class'Canvas'.static.MakeColor(146,173,45);             //0102 : 0F 1A 2C 04 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 92 24 AD 24 2D 16 
    mChannelNames[5] = Class'SBGuiStrings'.default.Private.Text;                //0120 : 0F 1A 2C 05 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 F9 98 19 
    mChannelColors[5] = Class'Canvas'.static.MakeColor(236,89,219);             //013C : 0F 1A 2C 05 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 EC 24 59 24 DB 16 
    mChannelNames[6] = Class'SBGuiStrings'.default.Combat.Text;                 //015A : 0F 1A 2C 06 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 48 98 19 
    mChannelColors[6] = Class'Canvas'.static.MakeColor(230,47,64);              //0176 : 0F 1A 2C 06 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 E6 24 2F 24 40 16 
    mChannelNames[7] = Class'SBGuiStrings'.default.System.Text;                 //0194 : 0F 1A 2C 07 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 FA 98 19 
    mChannelColors[7] = Class'Canvas'.static.MakeColor(230,202,58);             //01B0 : 0F 1A 2C 07 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 E6 24 CA 24 3A 16 
    //0F 1A 25 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 40 98 19 0F 1A 25 01 00 
    //D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 6A 24 86 24 FD 16 0F 1A 26 01 88 D1 9D 19 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 F9 98 19 0F 1A 26 01 00 D2 9D 19 12 20 88 EE C2 
    //00 0C 00 04 1C 88 EB 76 0F 24 3B 24 A7 24 4B 16 0F 1A 2C 02 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 20 98 97 19 0F 1A 2C 02 01 00 D2 9D 19 12 20 88 EE C2 00 0E 00 04 1C 88 
    //EB 76 0F 39 3D 2C FF 24 D6 24 BA 16 0F 1A 2C 03 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 C0 3F 98 19 0F 1A 2C 03 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 
    //A9 24 7A 24 F7 16 0F 1A 2C 04 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 33 
    //97 19 0F 1A 2C 04 01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 92 24 AD 24 2D 16 
    //0F 1A 2C 05 01 88 D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 F9 98 19 0F 1A 2C 05 
    //01 00 D2 9D 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 EC 24 59 24 DB 16 0F 1A 2C 06 01 88 
    //D1 9D 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 48 98 19 0F 1A 2C 06 01 00 D2 9D 19 12 
    //20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 E6 24 2F 24 40 16 0F 1A 2C 07 01 88 D1 9D 19 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 FA 98 19 0F 1A 2C 07 01 00 D2 9D 19 12 20 88 EE C2 00 0C 
    //00 04 1C 88 EB 76 0F 24 E6 24 CA 24 3A 16 04 0B 47 
  }


  function ChangeTabTextColor(HUD_ChatPage aPage,string Text) {
    if (mTabCtrl.GetSelectedPage() != aPage) {                                  //0000 : 07 3E 00 77 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 00 B0 02 A2 19 16 
      mTabCtrl.FindButton(aPage).SetColor(255,155,0,255);                       //0019 : 19 19 01 88 CC 9D 19 0B 00 04 1B E8 99 00 00 00 B0 02 A2 19 16 0D 00 00 1B 19 98 00 00 2C FF 2C 9B 25 2C FF 16 
    }
    //07 3E 00 77 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 00 B0 02 A2 19 16 19 19 01 88 CC 9D 19 
    //0B 00 04 1B E8 99 00 00 00 B0 02 A2 19 16 0D 00 00 1B 19 98 00 00 2C FF 2C 9B 25 2C FF 16 04 0B 
    //47 
  }


  event DeregisterChatPage(HUD_ChatPage aPage) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 50 05 A2 19 25 
    while (i < mChatPages.Length) {                                             //0007 : 07 45 00 96 00 50 05 A2 19 37 01 C8 05 A2 19 16 
      if (mChatPages[i] == aPage) {                                             //0017 : 07 3B 00 72 10 00 50 05 A2 19 01 C8 05 A2 19 00 D8 04 A2 19 16 
        mChatPages.Remove(i,1);                                                 //002C : 41 01 C8 05 A2 19 00 50 05 A2 19 26 
        goto jl0045;                                                            //0038 : 06 45 00 
      }
      ++i;                                                                      //003B : A3 00 50 05 A2 19 16 
    }
    //0F 00 50 05 A2 19 25 07 45 00 96 00 50 05 A2 19 37 01 C8 05 A2 19 16 07 3B 00 72 10 00 50 05 A2 
    //19 01 C8 05 A2 19 00 D8 04 A2 19 16 41 01 C8 05 A2 19 00 50 05 A2 19 26 06 45 00 A3 00 50 05 A2 
    //19 16 06 07 00 04 0B 47 
  }


  function OnChatPageUndock(GUI_TabCtrl aSource,GUI_Window NewOwner,GUI_Page undockedPage) {
    if (aSource != None && NewOwner != None
      && undockedPage != None) {    //0000 : 07 3B 01 82 82 77 00 F0 06 A2 19 2A 16 18 09 00 77 00 48 09 A2 19 2A 16 16 18 09 00 77 00 C0 09 A2 19 2A 16 16 
      if (undockedPage.IsA('HUD_ChatPage')) {                                   //0025 : 07 3B 01 19 00 C0 09 A2 19 08 00 04 61 2F 21 95 97 00 00 16 
        HUD_ChatPage(undockedPage).ChangeWindow(NewOwner);                      //0039 : 19 2E 60 77 31 1D 00 C0 09 A2 19 0B 00 00 1B B4 96 00 00 00 48 09 A2 19 16 
        HUD_ChatPage(undockedPage).SetChatSource(self);                         //0052 : 19 2E 60 77 31 1D 00 C0 09 A2 19 07 00 00 1B 68 99 00 00 17 16 
        HUD_ChatPage(undockedPage).SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);//0067 : 19 2E 60 77 31 1D 00 C0 09 A2 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
        HUD_ChatPage(undockedPage).mIsWindowed = True;                          //008F : 14 19 2E 60 77 31 1D 00 C0 09 A2 19 06 00 04 2D 01 38 0A A2 19 27 
        HUD_ChatPage(undockedPage).AdjustTextCtrlDimensions(0.00000000,0.00000000,NewOwner.GetClientWidth(),NewOwner.GetClientHeight());//00A5 : 19 2E 60 77 31 1D 00 C0 09 A2 19 2E 00 00 1B AF 96 00 00 1E 00 00 00 00 1E 00 00 00 00 19 00 48 09 A2 19 06 00 04 1B 17 98 00 00 16 19 00 48 09 A2 19 06 00 04 1B 1F 98 00 00 16 16 
        HUD_ChatWindow(NewOwner).SetHasFadeOut(mHasFadeOut);                    //00E1 : 19 2E A0 7C 31 1D 00 48 09 A2 19 0C 00 00 1B 48 97 00 00 2D 01 B0 0A A2 19 16 
        mCreateTabMenuButton.SetEnabled(mChatPages.Length < 4);                 //00FB : 19 01 28 0B A2 19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 
        mRemoveTabMenuButton.SetEnabled(mTabCtrl.GetTabCount() > 1);            //0114 : 19 01 A0 0B A2 19 18 00 00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 
        SaveChatSettings();                                                     //0135 : 1B 6A 98 00 00 16 
      }
    }
    //07 3B 01 82 82 77 00 F0 06 A2 19 2A 16 18 09 00 77 00 48 09 A2 19 2A 16 16 18 09 00 77 00 C0 09 
    //A2 19 2A 16 16 07 3B 01 19 00 C0 09 A2 19 08 00 04 61 2F 21 95 97 00 00 16 19 2E 60 77 31 1D 00 
    //C0 09 A2 19 0B 00 00 1B B4 96 00 00 00 48 09 A2 19 16 19 2E 60 77 31 1D 00 C0 09 A2 19 07 00 00 
    //1B 68 99 00 00 17 16 19 2E 60 77 31 1D 00 C0 09 A2 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 
    //00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 14 19 2E 60 77 31 1D 00 C0 09 A2 19 06 00 04 2D 01 
    //38 0A A2 19 27 19 2E 60 77 31 1D 00 C0 09 A2 19 2E 00 00 1B AF 96 00 00 1E 00 00 00 00 1E 00 00 
    //00 00 19 00 48 09 A2 19 06 00 04 1B 17 98 00 00 16 19 00 48 09 A2 19 06 00 04 1B 1F 98 00 00 16 
    //16 19 2E A0 7C 31 1D 00 48 09 A2 19 0C 00 00 1B 48 97 00 00 2D 01 B0 0A A2 19 16 19 01 28 0B A2 
    //19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 19 01 A0 0B A2 19 18 00 00 1B 5F 32 
    //00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 1B 6A 98 00 00 16 04 0B 47 
  }


  function OnChatPageDock(GUI_TabCtrl aSource,GUI_Page aPage) {
    if (aPage.IsA('HUD_ChatPage')) {                                            //0000 : 07 D2 00 19 00 90 0E A2 19 08 00 04 61 2F 21 95 97 00 00 16 
      HUD_ChatPage(aPage).AdjustTextCtrlDimensions(15.00000000,3.00000000,mTabCtrl.mWidth - 10 - 14,170.00000000);//0014 : 19 2E 60 77 31 1D 00 90 0E A2 19 2F 00 00 1B AF 96 00 00 1E 00 00 70 41 1E 00 00 40 40 AF AF 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 3F 2C 0A 16 39 3F 2C 0E 16 1E 00 00 2A 43 16 
      HUD_ChatPage(aPage).ChangeWindow(None);                                   //0051 : 19 2E 60 77 31 1D 00 90 0E A2 19 07 00 00 1B B4 96 00 00 2A 16 
      HUD_ChatPage(aPage).mIsWindowed = False;                                  //0066 : 14 19 2E 60 77 31 1D 00 90 0E A2 19 06 00 04 2D 01 38 0A A2 19 28 
      SelectChatChannel(HUD_ChatPage(aPage));                                   //007C : 1B B6 99 00 00 2E 60 77 31 1D 00 90 0E A2 19 16 
      mCreateTabMenuButton.SetEnabled(mChatPages.Length < 4);                   //008C : 19 01 28 0B A2 19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 
      mRemoveTabMenuButton.SetEnabled(mTabCtrl.GetTabCount() > 1);              //00A5 : 19 01 A0 0B A2 19 18 00 00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 
      SaveChatSettings();                                                       //00C6 : 1B 6A 98 00 00 16 
      Invalidate();                                                             //00CC : 1B 1D 98 00 00 16 
    }
    //07 D2 00 19 00 90 0E A2 19 08 00 04 61 2F 21 95 97 00 00 16 19 2E 60 77 31 1D 00 90 0E A2 19 2F 
    //00 00 1B AF 96 00 00 1E 00 00 70 41 1E 00 00 40 40 AF AF 19 01 88 CC 9D 19 05 00 04 01 60 87 31 
    //16 39 3F 2C 0A 16 39 3F 2C 0E 16 1E 00 00 2A 43 16 19 2E 60 77 31 1D 00 90 0E A2 19 07 00 00 1B 
    //B4 96 00 00 2A 16 14 19 2E 60 77 31 1D 00 90 0E A2 19 06 00 04 2D 01 38 0A A2 19 28 1B B6 99 00 
    //00 2E 60 77 31 1D 00 90 0E A2 19 16 19 01 28 0B A2 19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 
    //19 2C 04 16 16 19 01 A0 0B A2 19 18 00 00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 
    //00 00 16 26 16 16 1B 6A 98 00 00 16 1B 1D 98 00 00 16 04 0B 47 
  }


  event OnScroll(bool scrollIn) {
    if (scrollIn) {                                                             //0000 : 07 29 00 2D 00 B8 0F A2 19 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.WindowFoldOut);              //0009 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 30 10 A2 19 16 
    } else {                                                                    //0026 : 06 46 00 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.WindowFoldIn);               //0029 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 A8 10 A2 19 16 
    }
    //07 29 00 2D 00 B8 0F A2 19 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 
    //02 30 10 A2 19 16 06 46 00 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 
    //02 A8 10 A2 19 16 04 0B 47 
  }


  event ChangeChatTitle(string aTitle) {
    local HUD_ChatPage aPage;
    aPage = HUD_ChatPage(mTabCtrl.GetSelectedPage());                           //0000 : 0F 00 D0 12 A2 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 
    aPage.mTitle = aTitle;                                                      //001A : 0F 19 00 D0 12 A2 19 05 00 00 01 48 13 A2 19 00 D0 11 A2 19 
    mTabCtrl.SetTabTitle(aTitle);                                               //002E : 19 01 88 CC 9D 19 0B 00 00 1B 6C 98 00 00 00 D0 11 A2 19 16 
    //0F 00 D0 12 A2 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 0F 19 00 D0 12 A2 
    //19 05 00 00 01 48 13 A2 19 00 D0 11 A2 19 19 01 88 CC 9D 19 0B 00 00 1B 6C 98 00 00 00 D0 11 A2 
    //19 16 04 0B 47 
  }


  function bool ChangeFontSize(GUI_TextButton aButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    if (HUD_ChatPage(mTabCtrl.GetSelectedPage()) != None) {                     //000F : 07 BF 00 77 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2A 16 
      HUD_ChatPage(mTabCtrl.GetSelectedPage()).SetFontSize(aButton.mIntTag);    //0029 : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 14 00 00 1B 46 97 00 00 19 00 70 14 A2 19 05 00 04 01 58 90 31 16 16 
      HUD_ChatPage(mTabCtrl.GetSelectedPage()).GetFontSize(mFontSizeMenu);      //0055 : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 0B 00 00 1B C8 98 00 00 01 E8 14 A2 19 16 
      HUD_ChatPage(mTabCtrl.GetSelectedPage()).AdjustTextCtrlDimensions(15.00000000,3.00000000,mTabCtrl.mWidth - 10 - 14,170.00000000);//0078 : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2F 00 00 1B AF 96 00 00 1E 00 00 70 41 1E 00 00 40 40 AF AF 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 3F 2C 0A 16 39 3F 2C 0E 16 1E 00 00 2A 43 16 
    }
    SaveChatSettings();                                                         //00BF : 1B 6A 98 00 00 16 
    return True;                                                                //00C5 : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 07 BF 00 77 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 
    //04 1B 33 98 00 00 16 2A 16 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 14 00 
    //00 1B 46 97 00 00 19 00 70 14 A2 19 05 00 04 01 58 90 31 16 16 19 2E 60 77 31 1D 19 01 88 CC 9D 
    //19 06 00 04 1B 33 98 00 00 16 0B 00 00 1B C8 98 00 00 01 E8 14 A2 19 16 19 2E 60 77 31 1D 19 01 
    //88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2F 00 00 1B AF 96 00 00 1E 00 00 70 41 1E 00 00 40 40 AF 
    //AF 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 3F 2C 0A 16 39 3F 2C 0E 16 1E 00 00 2A 43 16 1B 
    //6A 98 00 00 16 04 27 04 0B 47 
  }


  function bool ChangeFilterSetting(GUI_TextButton aButton) {
    if (HUD_ChatPage(mTabCtrl.GetSelectedPage()) != None) {                     //0000 : 07 73 00 77 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2A 16 
      HUD_ChatPage(mTabCtrl.GetSelectedPage()).SetChannelFilter(aButton.mIntTag,aButton.mChecked);//001A : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 23 00 00 1B 94 99 00 00 19 00 88 16 A2 19 05 00 04 01 58 90 31 16 19 00 88 16 A2 19 06 00 04 2D 01 08 93 9E 19 16 
      HUD_ChatPage(mTabCtrl.GetSelectedPage()).ResetText();                     //0055 : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 06 00 00 1B 01 99 00 00 16 
    }
    SaveChatSettings();                                                         //0073 : 1B 6A 98 00 00 16 
    return True;                                                                //0079 : 04 27 
    //07 73 00 77 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2A 16 19 2E 60 77 31 1D 
    //19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 23 00 00 1B 94 99 00 00 19 00 88 16 A2 19 05 00 04 
    //01 58 90 31 16 19 00 88 16 A2 19 06 00 04 2D 01 08 93 9E 19 16 19 2E 60 77 31 1D 19 01 88 CC 9D 
    //19 06 00 04 1B 33 98 00 00 16 06 00 00 1B 01 99 00 00 16 1B 6A 98 00 00 16 04 27 04 0B 47 
  }


  event HUD_ChatPage CreateChatTab(string aName,string ClassName) {
    local HUD_ChatPage newPage;
    if (mChatPages.Length < 4) {                                                //0000 : 07 59 01 96 37 01 C8 05 A2 19 2C 04 16 
      newPage = HUD_ChatPage(mTabCtrl.CreatePage(ClassName,0,0,0,0,mTabCtrl.mWidth,mTabCtrl.mHeight,aName,aName));//000D : 0F 00 A0 18 A2 19 2E 60 77 31 1D 19 01 88 CC 9D 19 39 00 04 1B 16 98 00 00 00 18 19 A2 19 25 25 25 25 39 44 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 44 19 01 88 CC 9D 19 05 00 04 01 40 88 31 16 00 28 18 A2 19 00 28 18 A2 19 16 
      if (newPage != None) {                                                    //005A : 07 07 01 77 00 A0 18 A2 19 2A 16 
        newPage.AdjustTextCtrlDimensions(15.00000000,3.00000000,mTabCtrl.mWidth - 10 - 14,170.00000000);//0065 : 19 00 A0 18 A2 19 2F 00 00 1B AF 96 00 00 1E 00 00 70 41 1E 00 00 40 40 AF AF 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 3F 2C 0A 16 39 3F 2C 0E 16 1E 00 00 2A 43 16 
        mChatPages[mChatPages.Length] = newPage;                                //009D : 0F 10 37 01 C8 05 A2 19 01 C8 05 A2 19 00 A0 18 A2 19 
        newPage.mTitle = aName;                                                 //00AF : 0F 19 00 A0 18 A2 19 05 00 00 01 48 13 A2 19 00 28 18 A2 19 
        newPage.mIsWindowed = False;                                            //00C3 : 14 19 00 A0 18 A2 19 06 00 04 2D 01 38 0A A2 19 28 
        newPage.SetChatSource(self);                                            //00D4 : 19 00 A0 18 A2 19 07 00 00 1B 68 99 00 00 17 16 
        newPage.ResetText();                                                    //00E4 : 19 00 A0 18 A2 19 06 00 00 1B 01 99 00 00 16 
        newPage.__OnMessageReceived__Delegate = ChangeTabTextColor;             //00F3 : 45 19 00 A0 18 A2 19 05 00 08 01 90 19 A2 19 44 B8 99 00 00 
      }
      if (mCreateTabMenuButton != None && mRemoveTabMenuButton != None) {       //0107 : 07 59 01 82 77 01 28 0B A2 19 2A 16 18 09 00 77 01 A0 0B A2 19 2A 16 16 
        mCreateTabMenuButton.SetEnabled(mChatPages.Length < 4);                 //011F : 19 01 28 0B A2 19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 
        mRemoveTabMenuButton.SetEnabled(mTabCtrl.GetTabCount() > 1);            //0138 : 19 01 A0 0B A2 19 18 00 00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 
      }
    }
    return newPage;                                                             //0159 : 04 00 A0 18 A2 19 
    //07 59 01 96 37 01 C8 05 A2 19 2C 04 16 0F 00 A0 18 A2 19 2E 60 77 31 1D 19 01 88 CC 9D 19 39 00 
    //04 1B 16 98 00 00 00 18 19 A2 19 25 25 25 25 39 44 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 
    //44 19 01 88 CC 9D 19 05 00 04 01 40 88 31 16 00 28 18 A2 19 00 28 18 A2 19 16 07 07 01 77 00 A0 
    //18 A2 19 2A 16 19 00 A0 18 A2 19 2F 00 00 1B AF 96 00 00 1E 00 00 70 41 1E 00 00 40 40 AF AF 19 
    //01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 3F 2C 0A 16 39 3F 2C 0E 16 1E 00 00 2A 43 16 0F 10 37 
    //01 C8 05 A2 19 01 C8 05 A2 19 00 A0 18 A2 19 0F 19 00 A0 18 A2 19 05 00 00 01 48 13 A2 19 00 28 
    //18 A2 19 14 19 00 A0 18 A2 19 06 00 04 2D 01 38 0A A2 19 28 19 00 A0 18 A2 19 07 00 00 1B 68 99 
    //00 00 17 16 19 00 A0 18 A2 19 06 00 00 1B 01 99 00 00 16 45 19 00 A0 18 A2 19 05 00 08 01 90 19 
    //A2 19 44 B8 99 00 00 07 59 01 82 77 01 28 0B A2 19 2A 16 18 09 00 77 01 A0 0B A2 19 2A 16 16 19 
    //01 28 0B A2 19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 19 01 A0 0B A2 19 18 00 
    //00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 04 00 A0 18 A2 19 04 
    //0B 47 
  }


  function CreateChatWindow(string aTitle,int aLeft,int aTop,int aWidth,int aHeight,bool aHasFadeOut) {
    local HUD_ChatWindow newWindow;
    local HUD_ChatPage newPage;
    newWindow = HUD_ChatWindow(mDesktop.GetWindow(mDesktop.CreateWindow("HUD_ChatWindow",4096,0,4 | 8 | 1 | 4096,aLeft,aTop,aWidth,aHeight,aTitle)));//0000 : 0F 00 E8 1E A2 19 2E A0 7C 31 1D 19 01 48 0C 9D 19 54 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 45 00 04 1B 4C 2D 00 00 1F 48 55 44 5F 43 68 61 74 57 69 6E 64 6F 77 00 1D 00 10 00 00 25 9E 9E 9E 2C 04 2C 08 16 26 16 1D 00 10 00 00 16 00 60 1F A2 19 00 D8 1F A2 19 00 50 20 A2 19 00 C8 20 A2 19 00 30 1B A2 19 16 16 
    newWindow.SetHasFadeOut(aHasFadeOut);                                       //0068 : 19 00 E8 1E A2 19 0C 00 00 1B 48 97 00 00 2D 00 40 21 A2 19 16 
    newWindow.mOwnerTabCtrl = mTabCtrl;                                         //007D : 0F 19 00 E8 1E A2 19 05 00 04 01 B8 21 A2 19 01 88 CC 9D 19 
    newPage = HUD_ChatPage(newWindow.CreatePage("HUD_ChatPage",0,0,0,0));       //0091 : 0F 00 30 22 A2 19 2E 60 77 31 1D 19 00 E8 1E A2 19 18 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 68 61 74 50 61 67 65 00 25 25 25 25 16 
    newPage.SetPosition(6.00000000,6.00000000,newWindow.GetClientWidth() - 12,newWindow.GetClientHeight() - 12);//00BD : 19 00 30 22 A2 19 3A 00 00 1B 23 98 00 00 1E 00 00 C0 40 1E 00 00 C0 40 AF 19 00 E8 1E A2 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 0C 16 AF 19 00 E8 1E A2 19 06 00 04 1B 1F 98 00 00 16 39 3F 2C 0C 16 16 
    newWindow.mObjectTag = newPage;                                             //0100 : 0F 19 00 E8 1E A2 19 05 00 04 01 48 91 31 16 00 30 22 A2 19 
    newWindow.SetChatPage(newPage);                                             //0114 : 19 00 E8 1E A2 19 0B 00 00 1B 3F 97 00 00 00 30 22 A2 19 16 
    newPage.mTitle = aTitle;                                                    //0128 : 0F 19 00 30 22 A2 19 05 00 00 01 48 13 A2 19 00 30 1B A2 19 
    newPage.mIsWindowed = True;                                                 //013C : 14 19 00 30 22 A2 19 06 00 04 2D 01 38 0A A2 19 27 
    newPage.SetChatSource(self);                                                //014D : 19 00 30 22 A2 19 07 00 00 1B 68 99 00 00 17 16 
    newPage.ResetText();                                                        //015D : 19 00 30 22 A2 19 06 00 00 1B 01 99 00 00 16 
    newPage.__OnMessageReceived__Delegate = None;                               //016C : 45 19 00 30 22 A2 19 05 00 08 01 90 19 A2 19 44 00 00 00 00 
    newPage.ChangeWindow(newWindow);                                            //0180 : 19 00 30 22 A2 19 0B 00 00 1B B4 96 00 00 00 E8 1E A2 19 16 
    newPage.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);            //0194 : 19 00 30 22 A2 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    newPage.AdjustTextCtrlDimensions(6.00000000,21.00000000 - 3,newWindow.GetClientWidth() - 10 - 6 - 4,newWindow.GetClientHeight() - 10 - 21 + 1);//01B7 : 19 00 30 22 A2 19 57 00 00 1B AF 96 00 00 1E 00 00 C0 40 AF 1E 00 00 A8 41 39 3F 2C 03 16 AF AF AF 19 00 E8 1E A2 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 06 16 39 3F 2C 04 16 AE AF AF 19 00 E8 1E A2 19 06 00 04 1B 1F 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 15 16 39 3F 26 16 16 
    mChatPages[mChatPages.Length] = newPage;                                    //0217 : 0F 10 37 01 C8 05 A2 19 01 C8 05 A2 19 00 30 22 A2 19 
    newWindow.SetVisible(True);                                                 //0229 : 19 00 E8 1E A2 19 07 00 00 1B 14 98 00 00 27 16 
    //0F 00 E8 1E A2 19 2E A0 7C 31 1D 19 01 48 0C 9D 19 54 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 45 
    //00 04 1B 4C 2D 00 00 1F 48 55 44 5F 43 68 61 74 57 69 6E 64 6F 77 00 1D 00 10 00 00 25 9E 9E 9E 
    //2C 04 2C 08 16 26 16 1D 00 10 00 00 16 00 60 1F A2 19 00 D8 1F A2 19 00 50 20 A2 19 00 C8 20 A2 
    //19 00 30 1B A2 19 16 16 19 00 E8 1E A2 19 0C 00 00 1B 48 97 00 00 2D 00 40 21 A2 19 16 0F 19 00 
    //E8 1E A2 19 05 00 04 01 B8 21 A2 19 01 88 CC 9D 19 0F 00 30 22 A2 19 2E 60 77 31 1D 19 00 E8 1E 
    //A2 19 18 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 68 61 74 50 61 67 65 00 25 25 25 25 16 19 00 30 
    //22 A2 19 3A 00 00 1B 23 98 00 00 1E 00 00 C0 40 1E 00 00 C0 40 AF 19 00 E8 1E A2 19 06 00 04 1B 
    //17 98 00 00 16 39 3F 2C 0C 16 AF 19 00 E8 1E A2 19 06 00 04 1B 1F 98 00 00 16 39 3F 2C 0C 16 16 
    //0F 19 00 E8 1E A2 19 05 00 04 01 48 91 31 16 00 30 22 A2 19 19 00 E8 1E A2 19 0B 00 00 1B 3F 97 
    //00 00 00 30 22 A2 19 16 0F 19 00 30 22 A2 19 05 00 00 01 48 13 A2 19 00 30 1B A2 19 14 19 00 30 
    //22 A2 19 06 00 04 2D 01 38 0A A2 19 27 19 00 30 22 A2 19 07 00 00 1B 68 99 00 00 17 16 19 00 30 
    //22 A2 19 06 00 00 1B 01 99 00 00 16 45 19 00 30 22 A2 19 05 00 08 01 90 19 A2 19 44 00 00 00 00 
    //19 00 30 22 A2 19 0B 00 00 1B B4 96 00 00 00 E8 1E A2 19 16 19 00 30 22 A2 19 1A 00 00 1B 24 98 
    //00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 19 00 30 22 A2 19 57 00 00 
    //1B AF 96 00 00 1E 00 00 C0 40 AF 1E 00 00 A8 41 39 3F 2C 03 16 AF AF AF 19 00 E8 1E A2 19 06 00 
    //04 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 06 16 39 3F 2C 04 16 AE AF AF 19 00 E8 1E A2 19 06 
    //00 04 1B 1F 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 15 16 39 3F 26 16 16 0F 10 37 01 C8 05 A2 19 01 
    //C8 05 A2 19 00 30 22 A2 19 19 00 E8 1E A2 19 07 00 00 1B 14 98 00 00 27 16 04 0B 47 
  }


  event DestroySelectedTab() {
    local HUD_ChatPage aPage;
    local HUD_ChatPage aNewPage;
    local int idx;
    aPage = HUD_ChatPage(mTabCtrl.GetSelectedPage());                           //0000 : 0F 00 58 23 A2 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 
    if (aPage != None && mChatPages.Length > 1) {                               //001A : 07 15 01 82 77 00 58 23 A2 19 2A 16 18 0A 00 97 37 01 C8 05 A2 19 26 16 16 
      idx = 0;                                                                  //0033 : 0F 00 80 25 A2 19 25 
      while (idx < mChatPages.Length) {                                         //003A : 07 97 00 96 00 80 25 A2 19 37 01 C8 05 A2 19 16 
        if (mChatPages[idx] != aPage
          && mChatPages[idx].mIsWindowed == False) {//004A : 07 8D 00 82 77 10 00 80 25 A2 19 01 C8 05 A2 19 00 58 23 A2 19 16 18 19 00 F2 19 10 00 80 25 A2 19 01 C8 05 A2 19 06 00 04 2D 01 38 0A A2 19 28 16 16 
          aNewPage = mChatPages[idx];                                           //007C : 0F 00 F8 25 A2 19 10 00 80 25 A2 19 01 C8 05 A2 19 
        }
        idx++;                                                                  //008D : A5 00 80 25 A2 19 16 
      }
      DeregisterChatPage(aPage);                                                //0097 : 1B B9 96 00 00 00 58 23 A2 19 16 
      mTabCtrl.DestroyPage(aPage);                                              //00A2 : 19 01 88 CC 9D 19 0B 00 00 1B 28 9B 00 00 00 58 23 A2 19 16 
      mTabCtrl.SetSelectedPage(aNewPage);                                       //00B6 : 19 01 88 CC 9D 19 0B 00 00 1B 4C 98 00 00 00 F8 25 A2 19 16 
      OnTabChanged(mTabCtrl,aNewPage,None);                                     //00CA : 1B 25 97 00 00 01 88 CC 9D 19 00 F8 25 A2 19 2A 16 
      mCreateTabMenuButton.SetEnabled(mChatPages.Length < 4);                   //00DB : 19 01 28 0B A2 19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 
      mRemoveTabMenuButton.SetEnabled(mTabCtrl.GetTabCount() > 1);              //00F4 : 19 01 A0 0B A2 19 18 00 00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 
    }
    //0F 00 58 23 A2 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 07 15 01 82 77 00 
    //58 23 A2 19 2A 16 18 0A 00 97 37 01 C8 05 A2 19 26 16 16 0F 00 80 25 A2 19 25 07 97 00 96 00 80 
    //25 A2 19 37 01 C8 05 A2 19 16 07 8D 00 82 77 10 00 80 25 A2 19 01 C8 05 A2 19 00 58 23 A2 19 16 
    //18 19 00 F2 19 10 00 80 25 A2 19 01 C8 05 A2 19 06 00 04 2D 01 38 0A A2 19 28 16 16 0F 00 F8 25 
    //A2 19 10 00 80 25 A2 19 01 C8 05 A2 19 A5 00 80 25 A2 19 16 06 3A 00 1B B9 96 00 00 00 58 23 A2 
    //19 16 19 01 88 CC 9D 19 0B 00 00 1B 28 9B 00 00 00 58 23 A2 19 16 19 01 88 CC 9D 19 0B 00 00 1B 
    //4C 98 00 00 00 F8 25 A2 19 16 1B 25 97 00 00 01 88 CC 9D 19 00 F8 25 A2 19 2A 16 19 01 28 0B A2 
    //19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 19 01 A0 0B A2 19 18 00 00 1B 5F 32 
    //00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 04 0B 47 
  }


  function int SelectChatChannel(HUD_ChatPage aPage) {
    local int i;
    if (!aPage.AcceptsInput(mChannelSelection.mIntTag)) {                       //0000 : 07 D6 00 81 19 00 20 27 A2 19 14 00 04 1B D7 98 00 00 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 16 16 
      if (aPage.GetLastUsedChannel() != -1) {                                   //0022 : 07 7E 00 9B 19 00 20 27 A2 19 06 00 04 1B 7F 99 00 00 16 1D FF FF FF FF 16 
        i = aPage.GetLastUsedChannel();                                         //003B : 0F 00 10 28 A2 19 19 00 20 27 A2 19 06 00 04 1B 7F 99 00 00 16 
        ChangeChannel(i);                                                       //0050 : 1B B2 96 00 00 00 10 28 A2 19 16 
        mChatIconPage.SetVisible(True);                                         //005B : 19 01 88 28 A2 19 07 00 00 1B 14 98 00 00 27 16 
        return aPage.GetLastUsedChannel();                                      //006B : 04 19 00 20 27 A2 19 06 00 04 1B 7F 99 00 00 16 
      } else {                                                                  //007B : 06 D3 00 
        i = 0;                                                                  //007E : 0F 00 10 28 A2 19 25 
        while (i < 6) {                                                         //0085 : 07 D3 00 96 00 10 28 A2 19 2C 06 16 
          if (aPage.AcceptsInput(i)) {                                          //0091 : 07 C9 00 19 00 20 27 A2 19 0B 00 04 1B D7 98 00 00 00 10 28 A2 19 16 
            ChangeChannel(i);                                                   //00A8 : 1B B2 96 00 00 00 10 28 A2 19 16 
            mChatIconPage.SetVisible(True);                                     //00B3 : 19 01 88 28 A2 19 07 00 00 1B 14 98 00 00 27 16 
            return -1;                                                          //00C3 : 04 1D FF FF FF FF 
          }
          i++;                                                                  //00C9 : A5 00 10 28 A2 19 16 
        }
      }
    } else {                                                                    //00D3 : 06 E5 00 
      return mChannelSelection.mIntTag;                                         //00D6 : 04 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 
    }
    return -1;                                                                  //00E5 : 04 1D FF FF FF FF 
    //07 D6 00 81 19 00 20 27 A2 19 14 00 04 1B D7 98 00 00 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 
    //16 16 07 7E 00 9B 19 00 20 27 A2 19 06 00 04 1B 7F 99 00 00 16 1D FF FF FF FF 16 0F 00 10 28 A2 
    //19 19 00 20 27 A2 19 06 00 04 1B 7F 99 00 00 16 1B B2 96 00 00 00 10 28 A2 19 16 19 01 88 28 A2 
    //19 07 00 00 1B 14 98 00 00 27 16 04 19 00 20 27 A2 19 06 00 04 1B 7F 99 00 00 16 06 D3 00 0F 00 
    //10 28 A2 19 25 07 D3 00 96 00 10 28 A2 19 2C 06 16 07 C9 00 19 00 20 27 A2 19 0B 00 04 1B D7 98 
    //00 00 00 10 28 A2 19 16 1B B2 96 00 00 00 10 28 A2 19 16 19 01 88 28 A2 19 07 00 00 1B 14 98 00 
    //00 27 16 04 1D FF FF FF FF A5 00 10 28 A2 19 16 06 85 00 06 E5 00 04 19 01 98 27 A2 19 05 00 04 
    //01 58 90 31 16 04 1D FF FF FF FF 04 0B 47 
  }


  function OnTabChanged(GUI_TabCtrl aSource,GUI_Page aNewSelectedPage,GUI_Page aPreviousSelectedPage) {
    local bool outputSupported;
    HUD_ChatPage(aNewSelectedPage).GetFilterSettings(mChannelFilterMenu);       //0000 : 19 2E 60 77 31 1D 00 08 2C A2 19 0B 00 00 1B A4 98 00 00 01 80 2C A2 19 16 
    HUD_ChatPage(aNewSelectedPage).GetFontSize(mFontSizeMenu);                  //0019 : 19 2E 60 77 31 1D 00 08 2C A2 19 0B 00 00 1B C8 98 00 00 01 E8 14 A2 19 16 
    if (mAutoSelectOutputChannel) {                                             //0032 : 07 7E 00 2D 01 F8 2C A2 19 
      if (HUD_ChatPage(aNewSelectedPage) != None) {                             //003B : 07 7E 00 77 2E 60 77 31 1D 00 08 2C A2 19 2A 16 
        outputSupported = SelectChatChannel(HUD_ChatPage(aNewSelectedPage)) != -1;//004B : 14 2D 00 70 2D A2 19 9B 1B B6 99 00 00 2E 60 77 31 1D 00 08 2C A2 19 16 1D FF FF FF FF 16 
        mChatIconPage.SetVisible(outputSupported);                              //0069 : 19 01 88 28 A2 19 0C 00 00 1B 14 98 00 00 2D 00 70 2D A2 19 16 
      }
    }
    mTabCtrl.FindButton(aNewSelectedPage).SetColor(255,255,255,255);            //007E : 19 19 01 88 CC 9D 19 0B 00 04 1B E8 99 00 00 00 08 2C A2 19 16 0E 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 2C FF 16 
    HUD_ChatPage(aNewSelectedPage).__OnMessageReceived__Delegate = None;        //00A4 : 45 19 2E 60 77 31 1D 00 08 2C A2 19 05 00 08 01 90 19 A2 19 44 00 00 00 00 
    if (aPreviousSelectedPage != None) {                                        //00BD : 07 E1 00 77 00 E8 2D A2 19 2A 16 
      HUD_ChatPage(aPreviousSelectedPage).__OnMessageReceived__Delegate = ChangeTabTextColor;//00C8 : 45 19 2E 60 77 31 1D 00 E8 2D A2 19 05 00 08 01 90 19 A2 19 44 B8 99 00 00 
    }
    //19 2E 60 77 31 1D 00 08 2C A2 19 0B 00 00 1B A4 98 00 00 01 80 2C A2 19 16 19 2E 60 77 31 1D 00 
    //08 2C A2 19 0B 00 00 1B C8 98 00 00 01 E8 14 A2 19 16 07 7E 00 2D 01 F8 2C A2 19 07 7E 00 77 2E 
    //60 77 31 1D 00 08 2C A2 19 2A 16 14 2D 00 70 2D A2 19 9B 1B B6 99 00 00 2E 60 77 31 1D 00 08 2C 
    //A2 19 16 1D FF FF FF FF 16 19 01 88 28 A2 19 0C 00 00 1B 14 98 00 00 2D 00 70 2D A2 19 16 19 19 
    //01 88 CC 9D 19 0B 00 04 1B E8 99 00 00 00 08 2C A2 19 16 0E 00 00 1B 19 98 00 00 2C FF 2C FF 2C 
    //FF 2C FF 16 45 19 2E 60 77 31 1D 00 08 2C A2 19 05 00 08 01 90 19 A2 19 44 00 00 00 00 07 E1 00 
    //77 00 E8 2D A2 19 2A 16 45 19 2E 60 77 31 1D 00 E8 2D A2 19 05 00 08 01 90 19 A2 19 44 B8 99 00 
    //00 04 0B 47 
  }


  event ReleaseFocus() {
    if (mDesktop.GetFocusedComponent() == mEditBox) {                           //0000 : 07 39 00 72 19 01 48 0C 9D 19 06 00 04 1C 80 08 89 19 16 01 90 2F A2 19 16 
      mDesktop.FocusComponent(None);                                            //0019 : 19 01 48 0C 9D 19 07 00 00 1B 89 98 00 00 2A 16 
      mDesktop.SetTempActive(False);                                            //0029 : 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 28 16 
    }
    //07 39 00 72 19 01 48 0C 9D 19 06 00 04 1C 80 08 89 19 16 01 90 2F A2 19 16 19 01 48 0C 9D 19 07 
    //00 00 1B 89 98 00 00 2A 16 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 28 16 04 0B 47 
  }


  function ProcessInput(string Text,int Channel) {
    if (Channel >= 0 && Channel < 8) {                                          //0000 : 07 32 00 82 99 00 A0 31 A2 19 25 16 18 0A 00 96 00 A0 31 A2 19 2C 08 16 16 
      mConsoleManager.HandleUserOutput(Text,Channel);                           //0019 : 19 01 18 32 A2 19 10 00 00 1B EE 98 00 00 00 B8 30 A2 19 00 A0 31 A2 19 16 
    }
    //07 32 00 82 99 00 A0 31 A2 19 25 16 18 0A 00 96 00 A0 31 A2 19 2C 08 16 16 19 01 18 32 A2 19 10 
    //00 00 1B EE 98 00 00 00 B8 30 A2 19 00 A0 31 A2 19 16 04 0B 47 
  }


  function bool EnterHandler(GUI_EditBox editBox) {
    local string Text;
    Text = editBox.GetText();                                                   //0000 : 0F 00 80 35 A2 19 19 00 40 33 A2 19 06 00 00 1B 92 0C 00 00 16 
    if (Len(Text) != 0) {                                                       //0015 : 07 1F 01 9B 7D 00 80 35 A2 19 16 25 16 
      if (mChannelSelection.mIntTag == 5 && Left(Text,1) != "/") {              //0022 : 07 77 00 82 9A 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 2C 05 16 18 0E 00 7B 80 00 80 35 A2 19 26 16 1F 2F 00 16 16 
        if (mCurrentWhisperTarget != "") {                                      //0049 : 07 6A 00 7B 01 F8 35 A2 19 1F 00 16 
          Text = mCurrentWhisperTarget @ Text;                                  //0055 : 0F 00 80 35 A2 19 A8 01 F8 35 A2 19 00 80 35 A2 19 16 
        } else {                                                                //0067 : 06 77 00 
          mCurrentWhisperTarget = Text;                                         //006A : 0F 01 F8 35 A2 19 00 80 35 A2 19 
          return True;                                                          //0075 : 04 27 
        }
      }
      mConsoleManager.HandleUserOutput(Text,mChannelSelection.mIntTag);         //0077 : 19 01 18 32 A2 19 19 00 00 1B EE 98 00 00 00 80 35 A2 19 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 16 
      if (HUD_ChatPage(mTabCtrl.GetSelectedPage()) != None
        && HUD_ChatPage(mTabCtrl.GetSelectedPage()).AcceptsInput(mChannelSelection.mIntTag)) {//0099 : 07 10 01 82 77 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2A 16 18 2D 00 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 14 00 04 1B D7 98 00 00 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 16 16 
        HUD_ChatPage(mTabCtrl.GetSelectedPage()).SetLastUsedChannel(mChannelSelection.mIntTag);//00E4 : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 14 00 00 1B 00 9B 00 00 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 16 
      }
      editBox.Clear();                                                          //0110 : 19 00 40 33 A2 19 06 00 00 1B A8 12 00 00 16 
    }
    ReleaseFocus();                                                             //011F : 1B 32 97 00 00 16 
    return True;                                                                //0125 : 04 27 
    //0F 00 80 35 A2 19 19 00 40 33 A2 19 06 00 00 1B 92 0C 00 00 16 07 1F 01 9B 7D 00 80 35 A2 19 16 
    //25 16 07 77 00 82 9A 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 2C 05 16 18 0E 00 7B 80 00 80 35 
    //A2 19 26 16 1F 2F 00 16 16 07 6A 00 7B 01 F8 35 A2 19 1F 00 16 0F 00 80 35 A2 19 A8 01 F8 35 A2 
    //19 00 80 35 A2 19 16 06 77 00 0F 01 F8 35 A2 19 00 80 35 A2 19 04 27 19 01 18 32 A2 19 19 00 00 
    //1B EE 98 00 00 00 80 35 A2 19 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 16 07 10 01 82 77 2E 60 
    //77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2A 16 18 2D 00 19 2E 60 77 31 1D 19 01 88 
    //CC 9D 19 06 00 04 1B 33 98 00 00 16 14 00 04 1B D7 98 00 00 19 01 98 27 A2 19 05 00 04 01 58 90 
    //31 16 16 16 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 14 00 00 1B 00 9B 00 
    //00 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 16 19 00 40 33 A2 19 06 00 00 1B A8 12 00 00 16 1B 
    //32 97 00 00 16 04 27 04 0B 47 
  }


  event bool SelectChatPage(int Channel) {
    local int i;
    if (HUD_ChatPage(mTabCtrl.GetSelectedPage()) != None) {                     //0000 : 07 42 00 77 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2A 16 
      if (HUD_ChatPage(mTabCtrl.GetSelectedPage()).AcceptsInput(Channel)) {     //001A : 07 42 00 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 0B 00 04 1B D7 98 00 00 00 98 37 A2 19 16 
        return True;                                                            //0040 : 04 27 
      }
    }
    i = 0;                                                                      //0042 : 0F 00 18 39 A2 19 25 
    while (i < mChatPages.Length) {                                             //0049 : 07 9C 00 96 00 18 39 A2 19 37 01 C8 05 A2 19 16 
      if (mChatPages[i].AcceptsInput(Channel)) {                                //0059 : 07 92 00 19 10 00 18 39 A2 19 01 C8 05 A2 19 0B 00 04 1B D7 98 00 00 00 98 37 A2 19 16 
        mTabCtrl.SetSelectedPage(mChatPages[i]);                                //0076 : 19 01 88 CC 9D 19 11 00 00 1B 4C 98 00 00 10 00 18 39 A2 19 01 C8 05 A2 19 16 
        return True;                                                            //0090 : 04 27 
      }
      i++;                                                                      //0092 : A5 00 18 39 A2 19 16 
    }
    return False;                                                               //009C : 04 28 
    //07 42 00 77 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 2A 16 07 42 00 19 2E 60 
    //77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 0B 00 04 1B D7 98 00 00 00 98 37 A2 19 16 
    //04 27 0F 00 18 39 A2 19 25 07 9C 00 96 00 18 39 A2 19 37 01 C8 05 A2 19 16 07 92 00 19 10 00 18 
    //39 A2 19 01 C8 05 A2 19 0B 00 04 1B D7 98 00 00 00 98 37 A2 19 16 19 01 88 CC 9D 19 11 00 00 1B 
    //4C 98 00 00 10 00 18 39 A2 19 01 C8 05 A2 19 16 04 27 A5 00 18 39 A2 19 16 06 49 00 04 28 04 0B 
    //47 
  }


  event bool HandleKeyEvent(GUI_Component component,out byte Key,out byte State,float delta) {
    if (mChannelSelection.mIntTag == 5) {                                       //0000 : 07 76 00 9A 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 2C 05 16 
      if (Key == 8 && State == 1 && mCurrentWhisperTarget != ""
        && mEditBox.GetText() == "") {//0015 : 07 76 00 82 82 82 9A 39 3A 00 30 3B A2 19 2C 08 16 18 0B 00 9A 39 3A 00 A8 3B A2 19 26 16 16 18 0A 00 7B 01 F8 35 A2 19 1F 00 16 16 18 14 00 7A 19 01 90 2F A2 19 06 00 00 1B 92 0C 00 00 16 1F 00 16 16 
        mEditBox.SetText(mCurrentWhisperTarget);                                //0058 : 19 01 90 2F A2 19 0B 00 00 1B 13 98 00 00 01 F8 35 A2 19 16 
        SetWhisperTarget("");                                                   //006C : 1B 56 97 00 00 1F 00 16 
        return True;                                                            //0074 : 04 27 
      }
    }
    return mConsoleManager.HandleKeyEvent(component,Key,State,delta);           //0076 : 04 19 01 18 32 A2 19 1A 00 04 1B C9 96 00 00 00 B8 3A A2 19 00 30 3B A2 19 00 A8 3B A2 19 00 20 3C A2 19 16 
    //07 76 00 9A 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 2C 05 16 07 76 00 82 82 82 9A 39 3A 00 30 
    //3B A2 19 2C 08 16 18 0B 00 9A 39 3A 00 A8 3B A2 19 26 16 16 18 0A 00 7B 01 F8 35 A2 19 1F 00 16 
    //16 18 14 00 7A 19 01 90 2F A2 19 06 00 00 1B 92 0C 00 00 16 1F 00 16 16 19 01 90 2F A2 19 0B 00 
    //00 1B 13 98 00 00 01 F8 35 A2 19 16 1B 56 97 00 00 1F 00 16 04 27 04 19 01 18 32 A2 19 1A 00 04 
    //1B C9 96 00 00 00 B8 3A A2 19 00 30 3B A2 19 00 A8 3B A2 19 00 20 3C A2 19 16 04 0B 47 
  }


  event bool HandleKeyType(GUI_Component component,out byte keyCode,string Unicode) {
    local string lTarget;
    if (mChannelSelection.mIntTag == 5) {                                       //0000 : 07 72 00 9A 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 2C 05 16 
      if (keyCode == 32 && mCurrentWhisperTarget == "") {                       //0015 : 07 72 00 82 9A 39 3A 00 38 3E A2 19 2C 20 16 18 0A 00 7A 01 F8 35 A2 19 1F 00 16 16 
        lTarget = mEditBox.GetText();                                           //0031 : 0F 00 B0 3E A2 19 19 01 90 2F A2 19 06 00 00 1B 92 0C 00 00 16 
        if (Left(lTarget,1) != "/") {                                           //0046 : 07 72 00 7B 80 00 B0 3E A2 19 26 16 1F 2F 00 16 
          mEditBox.Clear();                                                     //0056 : 19 01 90 2F A2 19 06 00 00 1B A8 12 00 00 16 
          SetWhisperTarget(lTarget);                                            //0065 : 1B 56 97 00 00 00 B0 3E A2 19 16 
          return True;                                                          //0070 : 04 27 
        }
      }
    }
    return mConsoleManager.HandleKeyType(component,keyCode,Unicode);            //0072 : 04 19 01 18 32 A2 19 15 00 04 1B CA 96 00 00 00 C0 3D A2 19 00 38 3E A2 19 00 28 3F A2 19 16 
    //07 72 00 9A 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 2C 05 16 07 72 00 82 9A 39 3A 00 38 3E A2 
    //19 2C 20 16 18 0A 00 7A 01 F8 35 A2 19 1F 00 16 16 0F 00 B0 3E A2 19 19 01 90 2F A2 19 06 00 00 
    //1B 92 0C 00 00 16 07 72 00 7B 80 00 B0 3E A2 19 26 16 1F 2F 00 16 19 01 90 2F A2 19 06 00 00 1B 
    //A8 12 00 00 16 1B 56 97 00 00 00 B0 3E A2 19 16 04 27 04 19 01 18 32 A2 19 15 00 04 1B CA 96 00 
    //00 00 C0 3D A2 19 00 38 3E A2 19 00 28 3F A2 19 16 04 0B 47 
  }


  event bool ChangeChannel(int aChannel) {
    if (mChannelSelection != None) {                                            //0000 : 07 4F 00 77 01 98 27 A2 19 2A 16 
      mChannelSelection.SetBackground("Chat_Tab_Small_Back","SBGuiTX.GUI_Styles","GUI_Styles");//000B : 19 01 98 27 A2 19 3B 00 00 1B 1A 98 00 00 1F 43 68 61 74 5F 54 61 62 5F 53 6D 61 6C 6C 5F 42 61 63 6B 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    }
    mChannelSelection = mChannelButtons[aChannel];                              //004F : 0F 01 98 27 A2 19 1A 00 C8 40 A2 19 01 60 D0 9D 19 
    mChannelSelection.SetBackground("Chat_Tab_Small_Front","SBGuiTX.GUI_Styles","GUI_Styles");//0060 : 19 01 98 27 A2 19 3C 00 00 1B 1A 98 00 00 1F 43 68 61 74 5F 54 61 62 5F 53 6D 61 6C 6C 5F 46 72 6F 6E 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mEditBox.SetColor(mChannelColors[aChannel].R,mChannelColors[aChannel].G,mChannelColors[aChannel].B);//00A5 : 19 01 90 2F A2 19 3C 00 00 1B 19 98 00 00 39 3C 36 D0 90 6A 0F 1A 00 C8 40 A2 19 01 00 D2 9D 19 39 3C 36 58 90 6A 0F 1A 00 C8 40 A2 19 01 00 D2 9D 19 39 3C 36 E0 8F 6A 0F 1A 00 C8 40 A2 19 01 00 D2 9D 19 16 
    if (aChannel == 5) {                                                        //00EA : 07 04 01 9A 00 C8 40 A2 19 2C 05 16 
      SetWhisperTarget(mCurrentWhisperTarget);                                  //00F6 : 1B 56 97 00 00 01 F8 35 A2 19 16 
    } else {                                                                    //0101 : 06 24 01 
      mEditBox.mPrefix = "";                                                    //0104 : 0F 19 01 90 2F A2 19 05 00 00 01 20 43 A2 19 1F 00 
      mEditBox.UpdateCaretPosition();                                           //0115 : 19 01 90 2F A2 19 06 00 00 1B 6E 99 00 00 16 
    }
    if (mAutoSelectOutputPage) {                                                //0124 : 07 38 01 2D 01 98 43 A2 19 
      SelectChatPage(aChannel);                                                 //012D : 1B 39 97 00 00 00 C8 40 A2 19 16 
    }
    return True;                                                                //0138 : 04 27 
    //07 4F 00 77 01 98 27 A2 19 2A 16 19 01 98 27 A2 19 3B 00 00 1B 1A 98 00 00 1F 43 68 61 74 5F 54 
    //61 62 5F 53 6D 61 6C 6C 5F 42 61 63 6B 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 
    //73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 98 27 A2 19 1A 00 C8 40 A2 19 01 60 D0 9D 19 
    //19 01 98 27 A2 19 3C 00 00 1B 1A 98 00 00 1F 43 68 61 74 5F 54 61 62 5F 53 6D 61 6C 6C 5F 46 72 
    //6F 6E 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 
    //6C 65 73 00 16 19 01 90 2F A2 19 3C 00 00 1B 19 98 00 00 39 3C 36 D0 90 6A 0F 1A 00 C8 40 A2 19 
    //01 00 D2 9D 19 39 3C 36 58 90 6A 0F 1A 00 C8 40 A2 19 01 00 D2 9D 19 39 3C 36 E0 8F 6A 0F 1A 00 
    //C8 40 A2 19 01 00 D2 9D 19 16 07 04 01 9A 00 C8 40 A2 19 2C 05 16 1B 56 97 00 00 01 F8 35 A2 19 
    //16 06 24 01 0F 19 01 90 2F A2 19 05 00 00 01 20 43 A2 19 1F 00 19 01 90 2F A2 19 06 00 00 1B 6E 
    //99 00 00 16 07 38 01 2D 01 98 43 A2 19 1B 39 97 00 00 00 C8 40 A2 19 16 04 27 04 0B 47 
  }


  function bool OnChannelButtonClick(GUI_Component aButton) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 38 46 A2 19 25 
    while (i < 6) {                                                             //0007 : 07 3E 00 96 00 38 46 A2 19 2C 06 16 
      if (aButton == mChannelButtons[i]) {                                      //0013 : 07 34 00 72 00 38 45 A2 19 1A 00 38 46 A2 19 01 60 D0 9D 19 16 
        return ChangeChannel(i);                                                //0028 : 04 1B B2 96 00 00 00 38 46 A2 19 16 
      }
      i++;                                                                      //0034 : A5 00 38 46 A2 19 16 
    }
    return False;                                                               //003E : 04 28 
    //0F 00 38 46 A2 19 25 07 3E 00 96 00 38 46 A2 19 2C 06 16 07 34 00 72 00 38 45 A2 19 1A 00 38 46 
    //A2 19 01 60 D0 9D 19 16 04 1B B2 96 00 00 00 38 46 A2 19 16 A5 00 38 46 A2 19 16 06 07 00 04 28 
    //04 0B 47 
  }


  function BeginSlashChatMessageEntry() {
    mDesktop.SetTempActive(True);                                               //0000 : 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 
    mDesktop.FocusComponent(mEditBox);                                          //0010 : 19 01 48 0C 9D 19 0B 00 00 1B 89 98 00 00 01 90 2F A2 19 16 
    mEditBox.SetText("/");                                                      //0024 : 19 01 90 2F A2 19 09 00 00 1B 13 98 00 00 1F 2F 00 16 
    //19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 19 01 48 0C 9D 19 0B 00 00 1B 89 98 00 00 01 90 
    //2F A2 19 16 19 01 90 2F A2 19 09 00 00 1B 13 98 00 00 1F 2F 00 16 04 0B 47 
  }


  function BeginChatMessageEntry(optional string aMessage) {
    mDesktop.SetTempActive(True);                                               //0000 : 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 
    if (aMessage != "") {                                                       //0010 : 07 6C 00 7B 00 00 49 A2 19 1F 00 16 
      if (aMessage == "/w") {                                                   //001C : 07 35 00 7A 00 00 49 A2 19 1F 2F 77 00 16 
        ChangeChannel(5);                                                       //002A : 1B B2 96 00 00 2C 05 16 
      } else {                                                                  //0032 : 06 6C 00 
        if (mChannelSelection.mIntTag == 5) {                                   //0035 : 07 58 00 9A 19 01 98 27 A2 19 05 00 04 01 58 90 31 16 2C 05 16 
          SetWhisperTarget(aMessage);                                           //004A : 1B 56 97 00 00 00 00 49 A2 19 16 
        } else {                                                                //0055 : 06 6C 00 
          mEditBox.SetText(aMessage);                                           //0058 : 19 01 90 2F A2 19 0B 00 00 1B 13 98 00 00 00 00 49 A2 19 16 
        }
      }
    }
    mDesktop.FocusComponent(mEditBox);                                          //006C : 19 01 48 0C 9D 19 0B 00 00 1B 89 98 00 00 01 90 2F A2 19 16 
    //19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 07 6C 00 7B 00 00 49 A2 19 1F 00 16 07 35 00 7A 
    //00 00 49 A2 19 1F 2F 77 00 16 1B B2 96 00 00 2C 05 16 06 6C 00 07 58 00 9A 19 01 98 27 A2 19 05 
    //00 04 01 58 90 31 16 2C 05 16 1B 56 97 00 00 00 00 49 A2 19 16 06 6C 00 19 01 90 2F A2 19 0B 00 
    //00 1B 13 98 00 00 00 00 49 A2 19 16 19 01 48 0C 9D 19 0B 00 00 1B 89 98 00 00 01 90 2F A2 19 16 
    //04 0B 47 
  }


  event SetWhisperTarget(string aTarget) {
    mCurrentWhisperTarget = aTarget;                                            //0000 : 0F 01 F8 35 A2 19 00 28 4A A2 19 
    if (mCurrentWhisperTarget == "") {                                          //000B : 07 2F 00 7A 01 F8 35 A2 19 1F 00 16 
      mEditBox.mPrefix = "To: ";                                                //0017 : 0F 19 01 90 2F A2 19 05 00 00 01 20 43 A2 19 1F 54 6F 3A 20 00 
    } else {                                                                    //002C : 06 50 00 
      mEditBox.mPrefix = "To " $ mCurrentWhisperTarget $ ": ";                  //002F : 0F 19 01 90 2F A2 19 05 00 00 01 20 43 A2 19 70 70 1F 54 6F 20 00 01 F8 35 A2 19 16 1F 3A 20 00 16 
    }
    mEditBox.UpdateCaretPosition();                                             //0050 : 19 01 90 2F A2 19 06 00 00 1B 6E 99 00 00 16 
    //0F 01 F8 35 A2 19 00 28 4A A2 19 07 2F 00 7A 01 F8 35 A2 19 1F 00 16 0F 19 01 90 2F A2 19 05 00 
    //00 01 20 43 A2 19 1F 54 6F 3A 20 00 06 50 00 0F 19 01 90 2F A2 19 05 00 00 01 20 43 A2 19 70 70 
    //1F 54 6F 20 00 01 F8 35 A2 19 16 1F 3A 20 00 16 19 01 90 2F A2 19 06 00 00 1B 6E 99 00 00 16 04 
    //0B 47 
  }


  event HandleMessage(string sender,string Message,int Channel) {
    if (Channel == 5) {                                                         //0000 : 07 29 00 9A 00 78 4C A2 19 2C 05 16 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.PrivateMessage);             //000C : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 F0 4C A2 19 16 
    }
    //07 29 00 9A 00 78 4C A2 19 2C 05 16 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 
    //05 00 04 02 F0 4C A2 19 16 04 0B 47 
  }


  native function OutputMessage(string Text,int Channel);


  native function AddChatMessage(string sender,string Text,int Channel);


  native function SaveChatSettings();


  function bool ToggleLockPosition(GUI_Component aClickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    mIsPositionLocked = !mIsPositionLocked;                                     //000F : 14 2D 01 E0 54 A2 19 81 2D 01 E0 54 A2 19 16 
    if (mIsPositionLocked) {                                                    //001E : 07 4C 00 2D 01 E0 54 A2 19 
      mLockMenuButton.SetText(Class'SBGuiStrings'.default.Unlock_Window.Text);  //0027 : 19 01 58 55 A2 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 41 99 19 16 
    } else {                                                                    //0049 : 06 6E 00 
      mLockMenuButton.SetText(Class'SBGuiStrings'.default.Lock_Window.Text);    //004C : 19 01 58 55 A2 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 41 99 19 16 
    }
    return True;                                                                //006E : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 14 2D 01 E0 54 A2 19 81 2D 01 E0 54 A2 19 16 07 4C 
    //00 2D 01 E0 54 A2 19 19 01 58 55 A2 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 B8 41 99 19 16 06 6E 00 19 01 58 55 A2 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 40 41 99 19 16 04 27 04 0B 47 
  }


  function bool ToggleProfanityFilter(GUI_Component aClickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    mHasProfanityFilter = !mHasProfanityFilter;                                 //000F : 14 2D 01 70 57 A2 19 81 2D 01 70 57 A2 19 16 
    return True;                                                                //001E : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 14 2D 01 70 57 A2 19 81 2D 01 70 57 A2 19 16 04 27 
    //04 0B 47 
  }


  function bool ChannelMenuClicked(GUI_Component aClickedButton) {
    local GUI_EntryBox entryBox;
    local HUD_ChatPage currentPage;
    local HUD_ChatPage newPage;
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    switch (aClickedButton.mIntTag) {                                           //000F : 05 04 19 00 10 59 A2 19 05 00 04 01 58 90 31 16 
      case 1 :                                                                  //001F : 0A 8E 00 26 
        currentPage = GetActiveChatPage();                                      //0023 : 0F 00 68 5B A2 19 1B DC 9A 00 00 16 
        newPage = CreateChatTab(Class'SBGuiStrings'.default.Chat.Text,"HUD_ChatPage");//002F : 0F 00 E0 5B A2 19 1B B6 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 59 98 19 1F 48 55 44 5F 43 68 61 74 50 61 67 65 00 16 
        mTabCtrl.SetSelectedPage(newPage);                                      //005C : 19 01 88 CC 9D 19 0B 00 00 1B 4C 98 00 00 00 E0 5B A2 19 16 
        OnTabChanged(mTabCtrl,newPage,currentPage);                             //0070 : 1B 25 97 00 00 01 88 CC 9D 19 00 E0 5B A2 19 00 68 5B A2 19 16 
        SaveChatSettings();                                                     //0085 : 1B 6A 98 00 00 16 
        break;                                                                  //008B : 06 38 01 
      case 2 :                                                                  //008E : 0A 21 01 2C 02 
        entryBox = GUI_EntryBox(mDesktop.GetWindow(mDesktop.CreateMessageBox("GUI_EntryBox",Class'SBGuiStrings'.default.Rename_current_channel.Text,Class'SBGuiStrings'.default.Enter_channel_name.Text,1 | 2,1,self)));//0093 : 0F 00 58 5C A2 19 2E D0 5C A2 19 19 01 48 0C 9D 19 50 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 41 00 04 1B 1C 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 44 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 44 99 19 9E 26 2C 02 16 26 17 16 16 
        entryBox.mEditBox.SetText(mTabCtrl.GetTabTitle());                      //00F7 : 19 19 00 58 5C A2 19 05 00 04 01 10 62 A2 19 15 00 00 1B 13 98 00 00 19 01 88 CC 9D 19 06 00 00 1B 20 9B 00 00 16 16 
        break;                                                                  //011E : 06 38 01 
      case 3 :                                                                  //0121 : 0A 35 01 2C 03 
        DestroySelectedTab();                                                   //0126 : 1B BA 96 00 00 16 
        SaveChatSettings();                                                     //012C : 1B 6A 98 00 00 16 
        break;                                                                  //0132 : 06 38 01 
      default:                                                                  //0135 : 0A FF FF 
    }
    return True;                                                                //0138 : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 05 04 19 00 10 59 A2 19 05 00 04 01 58 90 31 16 0A 
    //8E 00 26 0F 00 68 5B A2 19 1B DC 9A 00 00 16 0F 00 E0 5B A2 19 1B B6 96 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 E0 59 98 19 1F 48 55 44 5F 43 68 61 74 50 61 67 65 00 16 19 01 88 CC 
    //9D 19 0B 00 00 1B 4C 98 00 00 00 E0 5B A2 19 16 1B 25 97 00 00 01 88 CC 9D 19 00 E0 5B A2 19 00 
    //68 5B A2 19 16 1B 6A 98 00 00 16 06 38 01 0A 21 01 2C 02 0F 00 58 5C A2 19 2E D0 5C A2 19 19 01 
    //48 0C 9D 19 50 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 41 00 04 1B 1C 98 00 00 1F 47 55 49 5F 45 
    //6E 74 72 79 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 44 99 19 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 88 44 99 19 9E 26 2C 02 16 26 17 16 16 19 19 00 58 5C A2 19 05 00 
    //04 01 10 62 A2 19 15 00 00 1B 13 98 00 00 19 01 88 CC 9D 19 06 00 00 1B 20 9B 00 00 16 16 06 38 
    //01 0A 35 01 2C 03 1B BA 96 00 00 16 1B 6A 98 00 00 16 06 38 01 0A FF FF 04 27 04 0B 47 
  }


  function bool ToggleFadeOut(GUI_Component aClickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    mHasFadeOut = !mHasFadeOut;                                                 //000F : 14 2D 01 B0 0A A2 19 81 2D 01 B0 0A A2 19 16 
    return True;                                                                //001E : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 14 2D 01 B0 0A A2 19 81 2D 01 B0 0A A2 19 16 04 27 
    //04 0B 47 
  }


  function ShowChatWindows() {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 A8 65 A2 19 25 
    while (idx < mChatPages.Length) {                                           //0007 : 07 61 00 96 00 A8 65 A2 19 37 01 C8 05 A2 19 16 
      if (mChatPages[idx].mIsWindowed == True) {                                //0017 : 07 57 00 F2 19 10 00 A8 65 A2 19 01 C8 05 A2 19 06 00 04 2D 01 38 0A A2 19 27 16 
        mDesktop.ShowGUIWindow(mChatPages[idx].GetWindow(),1);                  //0032 : 19 01 48 0C 9D 19 1C 00 00 1B 51 98 00 00 19 10 00 A8 65 A2 19 01 C8 05 A2 19 06 00 04 1B 1E 98 00 00 16 26 16 
      }
      idx++;                                                                    //0057 : A5 00 A8 65 A2 19 16 
    }
    //0F 00 A8 65 A2 19 25 07 61 00 96 00 A8 65 A2 19 37 01 C8 05 A2 19 16 07 57 00 F2 19 10 00 A8 65 
    //A2 19 01 C8 05 A2 19 06 00 04 2D 01 38 0A A2 19 27 16 19 01 48 0C 9D 19 1C 00 00 1B 51 98 00 00 
    //19 10 00 A8 65 A2 19 01 C8 05 A2 19 06 00 04 1B 1E 98 00 00 16 26 16 A5 00 A8 65 A2 19 16 06 07 
    //00 04 0B 47 
  }


  function CreateChatWindows() {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 88 67 A2 19 25 
    while (idx < mChatSettings.Length) {                                        //0007 : 07 F9 00 96 00 88 67 A2 19 37 01 88 69 A2 19 16 
      if (mChatSettings[idx].Windowed == True) {                                //0017 : 07 EF 00 F2 2D 36 88 6A A2 19 10 00 88 67 A2 19 01 88 69 A2 19 27 16 
        CreateChatWindow(mChatSettings[idx].Title,mChatSettings[idx].Left,mChatSettings[idx].top,mChatSettings[idx].width,mChatSettings[idx].Height,mChatSettings[idx].HasFadeOut);//002E : 1B E2 9A 00 00 36 00 6B A2 19 10 00 88 67 A2 19 01 88 69 A2 19 39 44 36 78 6B A2 19 10 00 88 67 A2 19 01 88 69 A2 19 39 44 36 F0 6B A2 19 10 00 88 67 A2 19 01 88 69 A2 19 39 44 36 68 6C A2 19 10 00 88 67 A2 19 01 88 69 A2 19 39 44 36 E0 6C A2 19 10 00 88 67 A2 19 01 88 69 A2 19 2D 36 58 6D A2 19 10 00 88 67 A2 19 01 88 69 A2 19 16 
        mChatPages[mChatPages.Length - 1].SetChannelFlags(mChatSettings[idx].FilterFlags);//009D : 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 16 00 00 1B 91 99 00 00 36 D0 6D A2 19 10 00 88 67 A2 19 01 88 69 A2 19 16 
        mChatPages[mChatPages.Length - 1].SetFontSize(mChatSettings[idx].FontSize);//00C6 : 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 16 00 00 1B 46 97 00 00 36 48 6E A2 19 10 00 88 67 A2 19 01 88 69 A2 19 16 
      }
      idx++;                                                                    //00EF : A5 00 88 67 A2 19 16 
    }
    //0F 00 88 67 A2 19 25 07 F9 00 96 00 88 67 A2 19 37 01 88 69 A2 19 16 07 EF 00 F2 2D 36 88 6A A2 
    //19 10 00 88 67 A2 19 01 88 69 A2 19 27 16 1B E2 9A 00 00 36 00 6B A2 19 10 00 88 67 A2 19 01 88 
    //69 A2 19 39 44 36 78 6B A2 19 10 00 88 67 A2 19 01 88 69 A2 19 39 44 36 F0 6B A2 19 10 00 88 67 
    //A2 19 01 88 69 A2 19 39 44 36 68 6C A2 19 10 00 88 67 A2 19 01 88 69 A2 19 39 44 36 E0 6C A2 19 
    //10 00 88 67 A2 19 01 88 69 A2 19 2D 36 58 6D A2 19 10 00 88 67 A2 19 01 88 69 A2 19 16 19 10 93 
    //37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 16 00 00 1B 91 99 00 00 36 D0 6D A2 19 10 00 88 67 A2 19 
    //01 88 69 A2 19 16 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 16 00 00 1B 46 97 00 00 36 48 
    //6E A2 19 10 00 88 67 A2 19 01 88 69 A2 19 16 A5 00 88 67 A2 19 16 06 07 00 04 0B 47 
  }


  function CreateChatTabs() {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 70 6F A2 19 25 
    while (idx < mChatSettings.Length) {                                        //0007 : 07 F0 00 96 00 70 6F A2 19 37 01 88 69 A2 19 16 
      if (mChatSettings[idx].Windowed == False) {                               //0017 : 07 E6 00 F2 2D 36 88 6A A2 19 10 00 70 6F A2 19 01 88 69 A2 19 28 16 
        CreateChatTab(mChatSettings[idx].Title,"HUD_ChatPage");                 //002E : 1B B6 96 00 00 36 00 6B A2 19 10 00 70 6F A2 19 01 88 69 A2 19 1F 48 55 44 5F 43 68 61 74 50 61 67 65 00 16 
        mChatPages[mChatPages.Length - 1].SetChannelFlags(mChatSettings[idx].FilterFlags);//0052 : 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 16 00 00 1B 91 99 00 00 36 D0 6D A2 19 10 00 70 6F A2 19 01 88 69 A2 19 16 
        mChatPages[mChatPages.Length - 1].SetFontSize(mChatSettings[idx].FontSize);//007B : 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 16 00 00 1B 46 97 00 00 36 48 6E A2 19 10 00 70 6F A2 19 01 88 69 A2 19 16 
        mChatPages[mChatPages.Length - 1].AdjustTextCtrlDimensions(15.00000000,3.00000000,mTabCtrl.mWidth - 10 - 14,170.00000000);//00A4 : 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 2F 00 00 1B AF 96 00 00 1E 00 00 70 41 1E 00 00 40 40 AF AF 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 3F 2C 0A 16 39 3F 2C 0E 16 1E 00 00 2A 43 16 
      }
      idx++;                                                                    //00E6 : A5 00 70 6F A2 19 16 
    }
    //0F 00 70 6F A2 19 25 07 F0 00 96 00 70 6F A2 19 37 01 88 69 A2 19 16 07 E6 00 F2 2D 36 88 6A A2 
    //19 10 00 70 6F A2 19 01 88 69 A2 19 28 16 1B B6 96 00 00 36 00 6B A2 19 10 00 70 6F A2 19 01 88 
    //69 A2 19 1F 48 55 44 5F 43 68 61 74 50 61 67 65 00 16 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 
    //A2 19 16 00 00 1B 91 99 00 00 36 D0 6D A2 19 10 00 70 6F A2 19 01 88 69 A2 19 16 19 10 93 37 01 
    //C8 05 A2 19 26 16 01 C8 05 A2 19 16 00 00 1B 46 97 00 00 36 48 6E A2 19 10 00 70 6F A2 19 01 88 
    //69 A2 19 16 19 10 93 37 01 C8 05 A2 19 26 16 01 C8 05 A2 19 2F 00 00 1B AF 96 00 00 1E 00 00 70 
    //41 1E 00 00 40 40 AF AF 19 01 88 CC 9D 19 05 00 04 01 60 87 31 16 39 3F 2C 0A 16 39 3F 2C 0E 16 
    //1E 00 00 2A 43 16 A5 00 70 6F A2 19 16 06 07 00 04 0B 47 
  }


  event InitializeMenu(GUI_Menu Menu) {
    local GUI_TextButton menuButton;
    local GUI_Menu subMenu;
    menuButton = Menu.CreateMenuCheckbox(Class'SBGuiStrings'.default.Fade_Out.Text,mHasFadeOut);//0000 : 0F 00 30 77 A2 19 19 00 98 70 A2 19 1F 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 46 99 19 2D 01 B0 0A A2 19 16 
    menuButton.__OnClick__Delegate = ToggleFadeOut;                             //002E : 45 19 00 30 77 A2 19 05 00 08 01 98 EB 9D 19 44 66 99 00 00 
    menuButton = Menu.CreateMenuCheckbox(Class'SBGuiStrings'.default.Profanity_Filter.Text,mHasProfanityFilter);//0042 : 0F 00 30 77 A2 19 19 00 98 70 A2 19 1F 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 97 2F 16 2D 01 70 57 A2 19 16 
    menuButton.__OnClick__Delegate = ToggleProfanityFilter;                     //0070 : 45 19 00 30 77 A2 19 05 00 08 01 98 EB 9D 19 44 E9 9A 00 00 
    menuButton = Menu.CreateSubMenu(Class'SBGuiStrings'.default.Channel.Text,"GUI_Menu");//0084 : 0F 00 30 77 A2 19 19 00 98 70 A2 19 23 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 43 99 19 1F 47 55 49 5F 4D 65 6E 75 00 16 
    subMenu = GUI_Menu(Menu.GetSubMenu(menuButton));                            //00B6 : 0F 00 A8 77 A2 19 2E 68 B8 2F 1D 19 00 98 70 A2 19 0B 00 04 1B 70 98 00 00 00 30 77 A2 19 16 
    subMenu.mWidth = 200.00000000;                                              //00D5 : 0F 19 00 A8 77 A2 19 05 00 04 01 60 87 31 16 1E 00 00 48 43 
    mCreateTabMenuButton = subMenu.CreateMenuItem(Class'SBGuiStrings'.default.Create_new_channel.Text);//00E9 : 0F 01 28 0B A2 19 19 00 A8 77 A2 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 43 99 19 16 
    mCreateTabMenuButton.mIntTag = 1;                                           //0111 : 0F 19 01 28 0B A2 19 05 00 04 01 58 90 31 16 26 
    mCreateTabMenuButton.__OnClick__Delegate = ChannelMenuClicked;              //0121 : 45 19 01 28 0B A2 19 05 00 08 01 98 EB 9D 19 44 28 99 00 00 
    mCreateTabMenuButton.SetEnabled(mChatPages.Length < 4);                     //0135 : 19 01 28 0B A2 19 10 00 00 1B 5F 32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 
    menuButton = subMenu.CreateMenuItem(Class'SBGuiStrings'.default.Rename_current_channel.Text);//014E : 0F 00 30 77 A2 19 19 00 A8 77 A2 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 44 99 19 16 
    menuButton.mIntTag = 2;                                                     //0176 : 0F 19 00 30 77 A2 19 05 00 04 01 58 90 31 16 2C 02 
    menuButton.__OnClick__Delegate = ChannelMenuClicked;                        //0187 : 45 19 00 30 77 A2 19 05 00 08 01 98 EB 9D 19 44 28 99 00 00 
    mRemoveTabMenuButton = subMenu.CreateMenuItem(Class'SBGuiStrings'.default.Delete_current_channel.Text);//019B : 0F 01 A0 0B A2 19 19 00 A8 77 A2 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 45 99 19 16 
    mRemoveTabMenuButton.mIntTag = 3;                                           //01C3 : 0F 19 01 A0 0B A2 19 05 00 04 01 58 90 31 16 2C 03 
    mRemoveTabMenuButton.__OnClick__Delegate = ChannelMenuClicked;              //01D4 : 45 19 01 A0 0B A2 19 05 00 08 01 98 EB 9D 19 44 28 99 00 00 
    mRemoveTabMenuButton.SetEnabled(mTabCtrl.GetTabCount() > 1);                //01E8 : 19 01 A0 0B A2 19 18 00 00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 1B C7 98 00 00 16 26 16 16 
    menuButton = Menu.CreateSubMenu(Class'SBGuiStrings'.default.Emotes.Text,"","Emotes\EmoteWindow.txt");//0209 : 0F 00 30 77 A2 19 19 00 98 70 A2 19 33 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 45 99 19 1F 00 1F 45 6D 6F 74 65 73 5C 45 6D 6F 74 65 57 69 6E 64 6F 77 2E 74 78 74 00 16 
    menuButton = Menu.CreateSubMenu(Class'SBGuiStrings'.default.filter.Text,"","Chat\FilterWindow.txt");//024B : 0F 00 30 77 A2 19 19 00 98 70 A2 19 32 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 45 99 19 1F 00 1F 43 68 61 74 5C 46 69 6C 74 65 72 57 69 6E 64 6F 77 2E 74 78 74 00 16 
    mChannelFilterMenu = GUI_Menu(Menu.GetSubMenu(menuButton));                 //028C : 0F 01 80 2C A2 19 2E 68 B8 2F 1D 19 00 98 70 A2 19 0B 00 04 1B 70 98 00 00 00 30 77 A2 19 16 
    mChannelFilterMenu.__OnButtonChecked__Delegate = ChangeFilterSetting;       //02AB : 45 19 01 80 2C A2 19 05 00 08 01 78 99 9E 19 44 C3 98 00 00 
    HUD_ChatPage(mTabCtrl.GetSelectedPage()).GetFilterSettings(mChannelFilterMenu);//02BF : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 0B 00 00 1B A4 98 00 00 01 80 2C A2 19 16 
    menuButton = Menu.CreateSubMenu(Class'SBGuiStrings'.default.Font.Text,"GUI_Menu");//02E2 : 0F 00 30 77 A2 19 19 00 98 70 A2 19 23 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 98 2F 16 1F 47 55 49 5F 4D 65 6E 75 00 16 
    mFontSizeMenu = GUI_Menu(Menu.GetSubMenu(menuButton));                      //0314 : 0F 01 E8 14 A2 19 2E 68 B8 2F 1D 19 00 98 70 A2 19 0B 00 04 1B 70 98 00 00 00 30 77 A2 19 16 
    mFontSizeMenu.__OnButtonChecked__Delegate = ChangeFontSize;                 //0333 : 45 19 01 E8 14 A2 19 05 00 08 01 78 99 9E 19 44 4D 99 00 00 
    menuButton = mFontSizeMenu.CreateMenuCheckbox(Class'SBGuiStrings'.default.Small.Text,False);//0347 : 0F 00 30 77 A2 19 19 01 E8 14 A2 19 1A 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 98 2F 16 28 16 
    menuButton.mIntTag = 10;                                                    //0370 : 0F 19 00 30 77 A2 19 05 00 04 01 58 90 31 16 2C 0A 
    menuButton = mFontSizeMenu.CreateMenuCheckbox(Class'SBGuiStrings'.default.Medium.Text,False);//0381 : 0F 00 30 77 A2 19 19 01 E8 14 A2 19 1A 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 98 2F 16 28 16 
    menuButton.mIntTag = 11;                                                    //03AA : 0F 19 00 30 77 A2 19 05 00 04 01 58 90 31 16 2C 0B 
    menuButton = mFontSizeMenu.CreateMenuCheckbox(Class'SBGuiStrings'.default.Large.Text,False);//03BB : 0F 00 30 77 A2 19 19 01 E8 14 A2 19 1A 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 99 2F 16 28 16 
    menuButton.mIntTag = 12;                                                    //03E4 : 0F 19 00 30 77 A2 19 05 00 04 01 58 90 31 16 2C 0C 
    HUD_ChatPage(mTabCtrl.GetSelectedPage()).GetFontSize(mFontSizeMenu);        //03F5 : 19 2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 0B 00 00 1B C8 98 00 00 01 E8 14 A2 19 16 
    mLockMenuButton = Menu.CreateMenuItem(Class'SBGuiStrings'.default.Unlock_Window.Text);//0418 : 0F 01 58 55 A2 19 19 00 98 70 A2 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 41 99 19 16 
    mLockMenuButton.__OnClick__Delegate = ToggleLockPosition;                   //0440 : 45 19 01 58 55 A2 19 05 00 08 01 98 EB 9D 19 44 95 98 00 00 
    //0F 00 30 77 A2 19 19 00 98 70 A2 19 1F 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 68 46 99 19 2D 01 B0 0A A2 19 16 45 19 00 30 77 A2 19 05 00 08 01 98 EB 9D 19 44 66 99 
    //00 00 0F 00 30 77 A2 19 19 00 98 70 A2 19 1F 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 90 97 2F 16 2D 01 70 57 A2 19 16 45 19 00 30 77 A2 19 05 00 08 01 98 EB 9D 19 44 
    //E9 9A 00 00 0F 00 30 77 A2 19 19 00 98 70 A2 19 23 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 20 43 99 19 1F 47 55 49 5F 4D 65 6E 75 00 16 0F 00 A8 77 A2 19 2E 68 B8 2F 
    //1D 19 00 98 70 A2 19 0B 00 04 1B 70 98 00 00 00 30 77 A2 19 16 0F 19 00 A8 77 A2 19 05 00 04 01 
    //60 87 31 16 1E 00 00 48 43 0F 01 28 0B A2 19 19 00 A8 77 A2 19 19 00 04 1B 38 98 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 43 99 19 16 0F 19 01 28 0B A2 19 05 00 04 01 58 90 31 16 
    //26 45 19 01 28 0B A2 19 05 00 08 01 98 EB 9D 19 44 28 99 00 00 19 01 28 0B A2 19 10 00 00 1B 5F 
    //32 00 00 96 37 01 C8 05 A2 19 2C 04 16 16 0F 00 30 77 A2 19 19 00 A8 77 A2 19 19 00 04 1B 38 98 
    //00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 44 99 19 16 0F 19 00 30 77 A2 19 05 00 04 
    //01 58 90 31 16 2C 02 45 19 00 30 77 A2 19 05 00 08 01 98 EB 9D 19 44 28 99 00 00 0F 01 A0 0B A2 
    //19 19 00 A8 77 A2 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 45 
    //99 19 16 0F 19 01 A0 0B A2 19 05 00 04 01 58 90 31 16 2C 03 45 19 01 A0 0B A2 19 05 00 08 01 98 
    //EB 9D 19 44 28 99 00 00 19 01 A0 0B A2 19 18 00 00 1B 5F 32 00 00 97 19 01 88 CC 9D 19 06 00 04 
    //1B C7 98 00 00 16 26 16 16 0F 00 30 77 A2 19 19 00 98 70 A2 19 33 00 04 1B 76 98 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 45 99 19 1F 00 1F 45 6D 6F 74 65 73 5C 45 6D 6F 74 65 57 
    //69 6E 64 6F 77 2E 74 78 74 00 16 0F 00 30 77 A2 19 19 00 98 70 A2 19 32 00 04 1B 76 98 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 45 99 19 1F 00 1F 43 68 61 74 5C 46 69 6C 74 65 72 
    //57 69 6E 64 6F 77 2E 74 78 74 00 16 0F 01 80 2C A2 19 2E 68 B8 2F 1D 19 00 98 70 A2 19 0B 00 04 
    //1B 70 98 00 00 00 30 77 A2 19 16 45 19 01 80 2C A2 19 05 00 08 01 78 99 9E 19 44 C3 98 00 00 19 
    //2E 60 77 31 1D 19 01 88 CC 9D 19 06 00 04 1B 33 98 00 00 16 0B 00 00 1B A4 98 00 00 01 80 2C A2 
    //19 16 0F 00 30 77 A2 19 19 00 98 70 A2 19 23 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 08 98 2F 16 1F 47 55 49 5F 4D 65 6E 75 00 16 0F 01 E8 14 A2 19 2E 68 B8 2F 1D 19 
    //00 98 70 A2 19 0B 00 04 1B 70 98 00 00 00 30 77 A2 19 16 45 19 01 E8 14 A2 19 05 00 08 01 78 99 
    //9E 19 44 4D 99 00 00 0F 00 30 77 A2 19 19 01 E8 14 A2 19 1A 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 80 98 2F 16 28 16 0F 19 00 30 77 A2 19 05 00 04 01 58 90 31 16 2C 
    //0A 0F 00 30 77 A2 19 19 01 E8 14 A2 19 1A 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 F8 98 2F 16 28 16 0F 19 00 30 77 A2 19 05 00 04 01 58 90 31 16 2C 0B 0F 00 30 77 A2 
    //19 19 01 E8 14 A2 19 1A 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 99 
    //2F 16 28 16 0F 19 00 30 77 A2 19 05 00 04 01 58 90 31 16 2C 0C 19 2E 60 77 31 1D 19 01 88 CC 9D 
    //19 06 00 04 1B 33 98 00 00 16 0B 00 00 1B C8 98 00 00 01 E8 14 A2 19 16 0F 01 58 55 A2 19 19 00 
    //98 70 A2 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 41 99 19 16 
    //45 19 01 58 55 A2 19 05 00 08 01 98 EB 9D 19 44 95 98 00 00 04 0B 47 
  }


  function bool SystemClickHandler(GUI_Component aClickedButton) {
    ToggleContextMenu(aClickedButton);                                          //0000 : 1B 6F 98 00 00 00 D0 78 A2 19 16 
    return True;                                                                //000B : 04 27 
    //1B 6F 98 00 00 00 D0 78 A2 19 16 04 27 04 0B 47 
  }


  event Flush() {
    Super.Flush();                                                              //0000 : 1C D8 97 9E 19 16 
    mCreateTabMenuButton = None;                                                //0006 : 0F 01 28 0B A2 19 2A 
    mRemoveTabMenuButton = None;                                                //000D : 0F 01 A0 0B A2 19 2A 
    mChannelFilterMenu = None;                                                  //0014 : 0F 01 80 2C A2 19 2A 
    mFontSizeMenu = None;                                                       //001B : 0F 01 E8 14 A2 19 2A 
    mLockMenuButton = None;                                                     //0022 : 0F 01 58 55 A2 19 2A 
    //1C D8 97 9E 19 16 0F 01 28 0B A2 19 2A 0F 01 A0 0B A2 19 2A 0F 01 80 2C A2 19 2A 0F 01 E8 14 A2 
    //19 2A 0F 01 58 55 A2 19 2A 04 0B 47 
  }


  event bool TryCloseWindow() {
    mDesktop.FocusComponent(None);                                              //0000 : 19 01 48 0C 9D 19 07 00 00 1B 89 98 00 00 2A 16 
    return Super.TryCloseWindow();                                              //0010 : 04 1C B8 87 9E 19 16 
    //19 01 48 0C 9D 19 07 00 00 1B 89 98 00 00 2A 16 04 1C B8 87 9E 19 16 04 0B 47 
  }


  function OnLogin() {
    Super.OnLogin();                                                            //0000 : 1C 60 5A 9E 19 16 
    ShowChatWindows();                                                          //0006 : 1B EA 9A 00 00 16 
    //1C 60 5A 9E 19 16 1B EA 9A 00 00 16 04 0B 47 
  }


  event OnComponentDestroyed() {
    local Game_PlayerController PlayerController;
    PlayerController = GetGamePlayerController();                               //0000 : 0F 00 30 7E A2 19 1B 3A 98 00 00 16 
    if (PlayerController != None) {                                             //000C : 07 95 00 77 00 30 7E A2 19 2A 16 
      PlayerController.Chat.__OnBeginChatMessageEntry__Delegate = None;         //0017 : 45 19 19 00 30 7E A2 19 05 00 04 01 E8 A0 1B 11 05 00 08 01 50 7F 1E 11 44 00 00 00 00 
      PlayerController.Chat.__OnBeginSlashChatMessageEntry__Delegate = None;    //0034 : 45 19 19 00 30 7E A2 19 05 00 04 01 E8 A0 1B 11 05 00 08 01 20 7D 1E 11 44 00 00 00 00 
      PlayerController.GroupingGuilds.mGuildChanged.RemoveListener(self);       //0051 : 19 19 19 00 30 7E A2 19 05 00 04 01 C8 A2 1B 11 05 00 04 01 60 15 33 11 07 00 00 1C 98 A4 25 11 17 16 
      PlayerController.GroupingTeams.mTeamChanged.RemoveListener(self);         //0073 : 19 19 19 00 30 7E A2 19 05 00 04 01 48 C2 18 11 05 00 04 01 78 2D 28 11 07 00 00 1C 98 A4 25 11 17 16 
    }
    Super.OnComponentDestroyed();                                               //0095 : 1C E0 DA 9D 19 16 
    //0F 00 30 7E A2 19 1B 3A 98 00 00 16 07 95 00 77 00 30 7E A2 19 2A 16 45 19 19 00 30 7E A2 19 05 
    //00 04 01 E8 A0 1B 11 05 00 08 01 50 7F 1E 11 44 00 00 00 00 45 19 19 00 30 7E A2 19 05 00 04 01 
    //E8 A0 1B 11 05 00 08 01 20 7D 1E 11 44 00 00 00 00 19 19 19 00 30 7E A2 19 05 00 04 01 C8 A2 1B 
    //11 05 00 04 01 60 15 33 11 07 00 00 1C 98 A4 25 11 17 16 19 19 19 00 30 7E A2 19 05 00 04 01 48 
    //C2 18 11 05 00 04 01 78 2D 28 11 07 00 00 1C 98 A4 25 11 17 16 1C E0 DA 9D 19 16 04 0B 47 
  }


  event SetDelegates() {
    local Game_PlayerController PlayerController;
    PlayerController = GetGamePlayerController();                               //0000 : 0F 00 60 80 A2 19 1B 3A 98 00 00 16 
    if (PlayerController != None) {                                             //000C : 07 01 01 77 00 60 80 A2 19 2A 16 
      PlayerController.Chat.__OnBeginChatMessageEntry__Delegate = BeginChatMessageEntry;//0017 : 45 19 19 00 60 80 A2 19 05 00 04 01 E8 A0 1B 11 05 00 08 01 50 7F 1E 11 44 E7 9A 00 00 
      PlayerController.Chat.__OnBeginSlashChatMessageEntry__Delegate = BeginSlashChatMessageEntry;//0034 : 45 19 19 00 60 80 A2 19 05 00 04 01 E8 A0 1B 11 05 00 08 01 20 7D 1E 11 44 E6 9A 00 00 
      if (PlayerController.GroupingTeams.mTeamChanged != None
        && PlayerController.GroupingGuilds.mGuildChanged != None) {//0051 : 07 01 01 82 77 19 19 00 60 80 A2 19 05 00 04 01 48 C2 18 11 05 00 04 01 78 2D 28 11 2A 16 18 1B 00 77 19 19 00 60 80 A2 19 05 00 04 01 C8 A2 1B 11 05 00 04 01 60 15 33 11 2A 16 16 
        PlayerController.GroupingTeams.mTeamChanged.AddListener(self,name("LayoutChannelButtons"));//008D : 19 19 19 00 60 80 A2 19 05 00 04 01 48 C2 18 11 05 00 04 01 78 2D 28 11 1F 00 00 1C 48 A5 25 11 17 39 5A 1F 4C 61 79 6F 75 74 43 68 61 6E 6E 65 6C 42 75 74 74 6F 6E 73 00 16 
        PlayerController.GroupingGuilds.mGuildChanged.AddListener(self,name("LayoutChannelButtons"));//00C7 : 19 19 19 00 60 80 A2 19 05 00 04 01 C8 A2 1B 11 05 00 04 01 60 15 33 11 1F 00 00 1C 48 A5 25 11 17 39 5A 1F 4C 61 79 6F 75 74 43 68 61 6E 6E 65 6C 42 75 74 74 6F 6E 73 00 16 
      }
    }
    if (mSystemButton != None) {                                                //0101 : 07 22 01 77 01 98 82 A2 19 2A 16 
      ToggleContextMenu(mSystemButton);                                         //010C : 1B 6F 98 00 00 01 98 82 A2 19 16 
      ToggleContextMenu(mSystemButton);                                         //0117 : 1B 6F 98 00 00 01 98 82 A2 19 16 
    }
    //0F 00 60 80 A2 19 1B 3A 98 00 00 16 07 01 01 77 00 60 80 A2 19 2A 16 45 19 19 00 60 80 A2 19 05 
    //00 04 01 E8 A0 1B 11 05 00 08 01 50 7F 1E 11 44 E7 9A 00 00 45 19 19 00 60 80 A2 19 05 00 04 01 
    //E8 A0 1B 11 05 00 08 01 20 7D 1E 11 44 E6 9A 00 00 07 01 01 82 77 19 19 00 60 80 A2 19 05 00 04 
    //01 48 C2 18 11 05 00 04 01 78 2D 28 11 2A 16 18 1B 00 77 19 19 00 60 80 A2 19 05 00 04 01 C8 A2 
    //1B 11 05 00 04 01 60 15 33 11 2A 16 16 19 19 19 00 60 80 A2 19 05 00 04 01 48 C2 18 11 05 00 04 
    //01 78 2D 28 11 1F 00 00 1C 48 A5 25 11 17 39 5A 1F 4C 61 79 6F 75 74 43 68 61 6E 6E 65 6C 42 75 
    //74 74 6F 6E 73 00 16 19 19 19 00 60 80 A2 19 05 00 04 01 C8 A2 1B 11 05 00 04 01 60 15 33 11 1F 
    //00 00 1C 48 A5 25 11 17 39 5A 1F 4C 61 79 6F 75 74 43 68 61 6E 6E 65 6C 42 75 74 74 6F 6E 73 00 
    //16 07 22 01 77 01 98 82 A2 19 2A 16 1B 6F 98 00 00 01 98 82 A2 19 16 1B 6F 98 00 00 01 98 82 A2 
    //19 16 04 0B 47 
  }


  event Initialize() {
    local GUI_Page chatPage;
    local int i;
    local GUI_DefaultToolkit kit;
    mConsoleManager = new Class'HUD_ChatConsoleManager';                        //0000 : 0F 01 18 32 A2 19 11 0B 0B 0B 20 20 87 31 1D 
    mConsoleManager.Initialize(self);                                           //000F : 19 01 18 32 A2 19 07 00 00 1B 38 04 00 00 17 16 
    if (mChatSettings.Length > 0 && mChatSettings[0].Title == "") {             //001F : 07 60 00 82 97 37 01 88 69 A2 19 25 16 18 11 00 7A 36 00 6B A2 19 10 25 01 88 69 A2 19 1F 00 16 16 
      mChatSettings[0].Title = Class'SBGuiStrings'.default.Combat_log.Text;     //0040 : 0F 36 00 6B A2 19 10 25 01 88 69 A2 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 36 99 19 
    }
    if (mChatSettings.Length > 1 && mChatSettings[1].Title == "") {             //0060 : 07 A1 00 82 97 37 01 88 69 A2 19 26 16 18 11 00 7A 36 00 6B A2 19 10 26 01 88 69 A2 19 1F 00 16 16 
      mChatSettings[1].Title = Class'SBGuiStrings'.default.Spellborn.Text;      //0081 : 0F 36 00 6B A2 19 10 26 01 88 69 A2 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 36 99 19 
    }
    kit = GUI_DefaultToolkit(mDesktop.mToolkit);                                //00A1 : 0F 00 78 90 A2 19 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 
    mWidth = 402.00000000;                                                      //00BA : 0F 01 60 87 31 16 1E 00 00 C9 43 
    mHeight = 249.00000000;                                                     //00C5 : 0F 01 40 88 31 16 1E 00 00 79 43 
    Super.Initialize();                                                         //00D0 : 1C 28 9E 9E 19 16 
    mWindowStyle = mWindowStyle | 16384;                                        //00D6 : 0F 01 70 61 9E 19 9E 01 70 61 9E 19 1D 00 40 00 00 16 
    SetStdBackground(0);                                                        //00E8 : 1B 22 98 00 00 25 16 
    SetComponentTitle("HUD_Chat");                                              //00EF : 1B 42 97 00 00 1F 48 55 44 5F 43 68 61 74 00 16 
    SetTitle("Spellborn chat");                                                 //00FF : 1B 0A 2C 00 00 1F 53 70 65 6C 6C 62 6F 72 6E 20 63 68 61 74 00 16 
    mOrnament = CreateImage("chat_ornament","SBGuiTX.GUI_Styles","GUI_Styles"); //0115 : 0F 01 F0 90 A2 19 1B 26 98 00 00 1F 63 68 61 74 5F 6F 72 6E 61 6D 65 6E 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mEditBoxScrollPage = CreatePage("GUI_Page",Class'GUI_BaseDesktop'.524288,0,0,mHeight - 52,mWidth,52);//0150 : 0F 01 68 91 A2 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 39 44 AF 01 40 88 31 16 39 3F 2C 34 16 39 44 01 60 87 31 16 2C 34 16 
    mTabScrollPage = CreatePage("GUI_Page",Class'GUI_BaseDesktop'.524288,0,0,0,mWidth,mHeight - 45);//018C : 0F 01 E0 91 A2 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 39 44 01 60 87 31 16 39 44 AF 01 40 88 31 16 39 3F 2C 2D 16 16 
    mBackbarPage = mEditBoxScrollPage.CreatePage("GUI_Page",Class'GUI_BaseDesktop'.524288,0,0,0);//01C7 : 0F 01 58 92 A2 19 19 01 68 91 A2 19 21 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 16 
    mBackbarPage.SetBackground("Chat_Bar","SBGuiTX.GUI_Styles","GUI_Styles");   //01F7 : 19 01 58 92 A2 19 30 00 00 1B 1A 98 00 00 1F 43 68 61 74 5F 42 61 72 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mBackbarPage.mTop = mEditBoxScrollPage.mHeight - mBackbarPage.mTexHeight;   //0230 : 0F 19 01 58 92 A2 19 05 00 04 01 80 86 31 16 AF 19 01 68 91 A2 19 05 00 04 01 40 88 31 16 19 01 58 92 A2 19 05 00 04 01 E0 8B 31 16 16 
    mBackbarPage.mLeft = 0.00000000;                                            //025D : 0F 19 01 58 92 A2 19 05 00 04 01 08 86 31 16 1E 00 00 00 00 
    mBackbarPage.mWidth = mEditBoxScrollPage.mWidth;                            //0271 : 0F 19 01 58 92 A2 19 05 00 04 01 60 87 31 16 19 01 68 91 A2 19 05 00 04 01 60 87 31 16 
    mBackbarPage.mHeight = mBackbarPage.mTexHeight;                             //028E : 0F 19 01 58 92 A2 19 05 00 04 01 40 88 31 16 19 01 58 92 A2 19 05 00 04 01 E0 8B 31 16 
    mSystemButton = mBackbarPage.CreateButton("GUI_IconButton",0,0,382,22,17,23);//02AB : 0F 01 98 82 A2 19 19 01 58 92 A2 19 23 00 04 1B 18 98 00 00 1F 47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 1D 7E 01 00 00 2C 16 2C 11 2C 17 16 
    mSystemButton.SetBackground("hud_header_conversation","SBGuiTX.GUI_Styles","GUI_Styles");//02DD : 19 01 98 82 A2 19 3F 00 00 1B 1A 98 00 00 1F 68 75 64 5F 68 65 61 64 65 72 5F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mSystemButton.__OnClick__Delegate = SystemClickHandler;                     //0325 : 45 19 01 98 82 A2 19 05 00 08 01 98 EB 9D 19 44 58 98 00 00 
    mSystemButton.SetContextMenuEnabled(True);                                  //0339 : 19 01 98 82 A2 19 07 00 00 1B 77 98 00 00 27 16 
    mTabCtrl = mTabScrollPage.CreateTabCtrl("GUI_TabCtrl",0,0,0,4,0,mTabScrollPage.mWidth - 4 - 29,mTabScrollPage.mHeight);//0349 : 0F 01 88 CC 9D 19 19 01 E0 91 A2 19 45 00 04 1B 7D 99 00 00 1F 47 55 49 5F 54 61 62 43 74 72 6C 00 25 25 25 2C 04 25 39 44 AF AF 19 01 E0 91 A2 19 05 00 04 01 60 87 31 16 39 3F 2C 04 16 39 3F 2C 1D 16 39 44 19 01 E0 91 A2 19 05 00 04 01 40 88 31 16 16 
    mTabCtrl.mCanDnDTabs = True;                                                //039D : 14 19 01 88 CC 9D 19 06 00 04 2D 01 D0 92 A2 19 27 
    mTabCtrl.EnableDnD(True,"HUD_ChatWindow");                                  //03AE : 19 01 88 CC 9D 19 17 00 00 1B 29 9B 00 00 27 1F 48 55 44 5F 43 68 61 74 57 69 6E 64 6F 77 00 16 
    mTabCtrl.SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);           //03CE : 19 01 88 CC 9D 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mTabCtrl.SetMinBounds(0.00000000,0.00000000,100.00000000,100.00000000);     //03F1 : 19 01 88 CC 9D 19 1A 00 00 1B 59 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 C8 42 1E 00 00 C8 42 16 
    mTabCtrl.__OnTabChanged__Delegate = OnTabChanged;                           //0414 : 45 19 01 88 CC 9D 19 05 00 08 01 48 93 A2 19 44 25 97 00 00 
    mTabCtrl.mHideOnFadePolicy = False;                                         //0428 : 14 19 01 88 CC 9D 19 06 00 04 2D 01 E0 DF 9D 19 28 
    mTabCtrl.mButtonWidth = mTabScrollPage.mWidth / 4;                          //0439 : 0F 19 01 88 CC 9D 19 05 00 04 01 C0 93 A2 19 AC 19 01 E0 91 A2 19 05 00 04 01 60 87 31 16 39 3F 2C 04 16 
    mTabCtrl.mMaxButtonsX = 4;                                                  //045C : 0F 19 01 88 CC 9D 19 05 00 04 01 38 94 A2 19 2C 04 
    mTabCtrl.mMaxButtonsY = 1;                                                  //046D : 0F 19 01 88 CC 9D 19 05 00 04 01 B0 94 A2 19 26 
    mTabCtrl.SetCustomClipRect(0.00000000,0.00000000,0.00000000,-2.00000000);   //047D : 19 01 88 CC 9D 19 1A 00 00 1B 6F 99 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 C0 16 
    mTabCtrl.__OnPageDock__Delegate = OnChatPageDock;                           //04A0 : 45 19 01 88 CC 9D 19 05 00 08 01 28 95 A2 19 44 E0 9A 00 00 
    mTabCtrl.__OnPageUndocked__Delegate = OnChatPageUndock;                     //04B4 : 45 19 01 88 CC 9D 19 05 00 08 01 A0 95 A2 19 44 DF 9A 00 00 
    mTabCtrl.SetSelectedPage(chatPage);                                         //04C8 : 19 01 88 CC 9D 19 0B 00 00 1B 4C 98 00 00 00 88 83 A2 19 16 
    InitChannelButtons();                                                       //04DC : 1B DE 9A 00 00 16 
    i = 0;                                                                      //04E2 : 0F 00 18 96 A2 19 25 
    while (i < 6) {                                                             //04E9 : 07 CE 06 96 00 18 96 A2 19 2C 06 16 
      mChannelButtons[i] = mEditBoxScrollPage.CreateButton("GUI_Button",0,0,0,0);//04F5 : 0F 1A 00 18 96 A2 19 01 60 D0 9D 19 19 01 68 91 A2 19 16 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 16 
      mChannelButtons[i].SetBackground("Chat_Tab_Small_Back","SBGuiTX.GUI_Styles","GUI_Styles");//0520 : 19 1A 00 18 96 A2 19 01 60 D0 9D 19 3B 00 00 1B 1A 98 00 00 1F 43 68 61 74 5F 54 61 62 5F 53 6D 61 6C 6C 5F 42 61 63 6B 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
      mChannelButtons[i].mTop = 24.00000000;                                    //056A : 0F 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 04 01 80 86 31 16 1E 00 00 C0 41 
      mChannelButtons[i].mWidth = 60.00000000;                                  //0584 : 0F 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 04 01 60 87 31 16 1E 00 00 70 42 
      mChannelButtons[i].SetFont(kit.GetFontName(Class'GUI_DefaultToolkit'.2)); //059E : 19 1A 00 18 96 A2 19 01 60 D0 9D 19 20 00 00 1B 25 98 00 00 19 00 78 90 A2 19 11 00 00 1B 1B 99 00 00 12 20 F0 D5 2E 1D 02 00 01 24 02 16 16 
      mChannelButtons[i].SetText(mChannelNames[i]);                             //05CD : 19 1A 00 18 96 A2 19 01 60 D0 9D 19 11 00 00 1B 13 98 00 00 1A 00 18 96 A2 19 01 88 D1 9D 19 16 
      mChannelButtons[i].SetColor(mChannelColors[i].R,mChannelColors[i].G,mChannelColors[i].B);//05ED : 19 1A 00 18 96 A2 19 01 60 D0 9D 19 3C 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 1A 00 18 96 A2 19 01 00 D2 9D 19 39 3A 36 58 90 6A 0F 1A 00 18 96 A2 19 01 00 D2 9D 19 39 3A 36 E0 8F 6A 0F 1A 00 18 96 A2 19 01 00 D2 9D 19 16 
      mChannelButtons[i].__OnClick__Delegate = OnChannelButtonClick;            //0638 : 45 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 08 01 98 EB 9D 19 44 E5 9A 00 00 
      mChannelButtons[i].mTextBorders[0] = 1.00000000;                          //0652 : 0F 1A 25 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 10 01 90 96 A2 19 1E 00 00 80 3F 
      mChannelButtons[i].mTextBorders[1] = 2.00000000;                          //066E : 0F 1A 26 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 10 01 90 96 A2 19 1E 00 00 00 40 
      mChannelButtons[i].mIntTag = i;                                           //068A : 0F 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 04 01 58 90 31 16 00 18 96 A2 19 
      mChannelButtons[i].SetTooltipText(mChannelNames[i]);                      //06A4 : 19 1A 00 18 96 A2 19 01 60 D0 9D 19 11 00 00 1B 54 97 00 00 1A 00 18 96 A2 19 01 88 D1 9D 19 16 
      i++;                                                                      //06C4 : A5 00 18 96 A2 19 16 
    }
    LayoutChannelButtons();                                                     //06CE : 1B DD 9A 00 00 16 
    mEditBox = mEditBoxScrollPage.CreateEditBox("GUI_EditBox",0,0,0,0);         //06D4 : 0F 01 90 2F A2 19 19 01 68 91 A2 19 17 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 25 25 25 25 16 
    mEditBox.__OnKeyType__Delegate = HandleKeyType;                             //06FA : 45 19 01 90 2F A2 19 05 00 08 01 A8 EA 9D 19 44 CA 96 00 00 
    mEditBox.__OnKeyEvent__Delegate = HandleKeyEvent;                           //070E : 45 19 01 90 2F A2 19 05 00 08 01 30 EA 9D 19 44 C9 96 00 00 
    mEditBox.mLeft = 24.00000000;                                               //0722 : 0F 19 01 90 2F A2 19 05 00 04 01 08 86 31 16 1E 00 00 C0 41 
    mEditBox.mTop = 8.00000000;                                                 //0736 : 0F 19 01 90 2F A2 19 05 00 04 01 80 86 31 16 1E 00 00 00 41 
    mEditBox.mWidth = 314.00000000;                                             //074A : 0F 19 01 90 2F A2 19 05 00 04 01 60 87 31 16 1E 00 00 9D 43 
    mEditBox.mHeight = 20.00000000;                                             //075E : 0F 19 01 90 2F A2 19 05 00 04 01 40 88 31 16 1E 00 00 A0 41 
    mEditBox.__OnEnter__Delegate = EnterHandler;                                //0772 : 45 19 01 90 2F A2 19 05 00 08 01 08 97 A2 19 44 6D 99 00 00 
    mEditBox.SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);           //0786 : 19 01 90 2F A2 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mChatIconPage = mEditBoxScrollPage.CreatePage("GUI_Page",0,0,0,0);          //07A9 : 0F 01 88 28 A2 19 19 01 68 91 A2 19 14 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 16 
    mChatIconPage.SetIcon("chat_icon","SBGuiTX.GUI_Styles","GUI_Styles");       //07CC : 19 01 88 28 A2 19 31 00 00 1B 28 98 00 00 1F 63 68 61 74 5F 69 63 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mChatIconPage.mLeft = 10.00000000;                                          //0806 : 0F 19 01 88 28 A2 19 05 00 04 01 08 86 31 16 1E 00 00 20 41 
    mChatIconPage.mTop = mEditBox.mTop;                                         //081A : 0F 19 01 88 28 A2 19 05 00 04 01 80 86 31 16 19 01 90 2F A2 19 05 00 04 01 80 86 31 16 
    mChatIconPage.mWidth = 12.00000000;                                         //0837 : 0F 19 01 88 28 A2 19 05 00 04 01 60 87 31 16 1E 00 00 40 41 
    mChatIconPage.mHeight = mEditBox.mHeight;                                   //084B : 0F 19 01 88 28 A2 19 05 00 04 01 40 88 31 16 19 01 90 2F A2 19 05 00 04 01 40 88 31 16 
    ChangeChannel(0);                                                           //0868 : 1B B2 96 00 00 25 16 
    __OnMBClick__Delegate = MBClickHandler;                                     //086F : 45 01 B8 E9 9D 19 44 2D 98 00 00 
    CreateChatTabs();                                                           //087A : 1B EC 9A 00 00 16 
    CreateChatWindows();                                                        //0880 : 1B EB 9A 00 00 16 
    //0F 01 18 32 A2 19 11 0B 0B 0B 20 20 87 31 1D 19 01 18 32 A2 19 07 00 00 1B 38 04 00 00 17 16 07 
    //60 00 82 97 37 01 88 69 A2 19 25 16 18 11 00 7A 36 00 6B A2 19 10 25 01 88 69 A2 19 1F 00 16 16 
    //0F 36 00 6B A2 19 10 25 01 88 69 A2 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 36 99 19 
    //07 A1 00 82 97 37 01 88 69 A2 19 26 16 18 11 00 7A 36 00 6B A2 19 10 26 01 88 69 A2 19 1F 00 16 
    //16 0F 36 00 6B A2 19 10 26 01 88 69 A2 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 36 99 
    //19 0F 00 78 90 A2 19 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 0F 01 60 87 31 16 
    //1E 00 00 C9 43 0F 01 40 88 31 16 1E 00 00 79 43 1C 28 9E 9E 19 16 0F 01 70 61 9E 19 9E 01 70 61 
    //9E 19 1D 00 40 00 00 16 1B 22 98 00 00 25 16 1B 42 97 00 00 1F 48 55 44 5F 43 68 61 74 00 16 1B 
    //0A 2C 00 00 1F 53 70 65 6C 6C 62 6F 72 6E 20 63 68 61 74 00 16 0F 01 F0 90 A2 19 1B 26 98 00 00 
    //1F 63 68 61 74 5F 6F 72 6E 61 6D 65 6E 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 
    //65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 68 91 A2 19 1B 16 98 00 00 1F 47 55 49 5F 
    //50 61 67 65 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 39 44 AF 01 40 88 31 16 39 3F 2C 
    //34 16 39 44 01 60 87 31 16 2C 34 16 0F 01 E0 91 A2 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 
    //00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 39 44 01 60 87 31 16 39 44 AF 01 40 88 31 
    //16 39 3F 2C 2D 16 16 0F 01 58 92 A2 19 19 01 68 91 A2 19 21 00 04 1B 16 98 00 00 1F 47 55 49 5F 
    //50 61 67 65 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 16 19 01 58 92 A2 19 30 00 00 
    //1B 1A 98 00 00 1F 43 68 61 74 5F 42 61 72 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 
    //65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 19 01 58 92 A2 19 05 00 04 01 80 86 31 16 AF 
    //19 01 68 91 A2 19 05 00 04 01 40 88 31 16 19 01 58 92 A2 19 05 00 04 01 E0 8B 31 16 16 0F 19 01 
    //58 92 A2 19 05 00 04 01 08 86 31 16 1E 00 00 00 00 0F 19 01 58 92 A2 19 05 00 04 01 60 87 31 16 
    //19 01 68 91 A2 19 05 00 04 01 60 87 31 16 0F 19 01 58 92 A2 19 05 00 04 01 40 88 31 16 19 01 58 
    //92 A2 19 05 00 04 01 E0 8B 31 16 0F 01 98 82 A2 19 19 01 58 92 A2 19 23 00 04 1B 18 98 00 00 1F 
    //47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 1D 7E 01 00 00 2C 16 2C 11 2C 17 16 19 01 98 
    //82 A2 19 3F 00 00 1B 1A 98 00 00 1F 68 75 64 5F 68 65 61 64 65 72 5F 63 6F 6E 76 65 72 73 61 74 
    //69 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 
    //6C 65 73 00 16 45 19 01 98 82 A2 19 05 00 08 01 98 EB 9D 19 44 58 98 00 00 19 01 98 82 A2 19 07 
    //00 00 1B 77 98 00 00 27 16 0F 01 88 CC 9D 19 19 01 E0 91 A2 19 45 00 04 1B 7D 99 00 00 1F 47 55 
    //49 5F 54 61 62 43 74 72 6C 00 25 25 25 2C 04 25 39 44 AF AF 19 01 E0 91 A2 19 05 00 04 01 60 87 
    //31 16 39 3F 2C 04 16 39 3F 2C 1D 16 39 44 19 01 E0 91 A2 19 05 00 04 01 40 88 31 16 16 14 19 01 
    //88 CC 9D 19 06 00 04 2D 01 D0 92 A2 19 27 19 01 88 CC 9D 19 17 00 00 1B 29 9B 00 00 27 1F 48 55 
    //44 5F 43 68 61 74 57 69 6E 64 6F 77 00 16 19 01 88 CC 9D 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 
    //00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 19 01 88 CC 9D 19 1A 00 00 1B 59 98 00 00 1E 
    //00 00 00 00 1E 00 00 00 00 1E 00 00 C8 42 1E 00 00 C8 42 16 45 19 01 88 CC 9D 19 05 00 08 01 48 
    //93 A2 19 44 25 97 00 00 14 19 01 88 CC 9D 19 06 00 04 2D 01 E0 DF 9D 19 28 0F 19 01 88 CC 9D 19 
    //05 00 04 01 C0 93 A2 19 AC 19 01 E0 91 A2 19 05 00 04 01 60 87 31 16 39 3F 2C 04 16 0F 19 01 88 
    //CC 9D 19 05 00 04 01 38 94 A2 19 2C 04 0F 19 01 88 CC 9D 19 05 00 04 01 B0 94 A2 19 26 19 01 88 
    //CC 9D 19 1A 00 00 1B 6F 99 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 C0 16 
    //45 19 01 88 CC 9D 19 05 00 08 01 28 95 A2 19 44 E0 9A 00 00 45 19 01 88 CC 9D 19 05 00 08 01 A0 
    //95 A2 19 44 DF 9A 00 00 19 01 88 CC 9D 19 0B 00 00 1B 4C 98 00 00 00 88 83 A2 19 16 1B DE 9A 00 
    //00 16 0F 00 18 96 A2 19 25 07 CE 06 96 00 18 96 A2 19 2C 06 16 0F 1A 00 18 96 A2 19 01 60 D0 9D 
    //19 19 01 68 91 A2 19 16 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 16 
    //19 1A 00 18 96 A2 19 01 60 D0 9D 19 3B 00 00 1B 1A 98 00 00 1F 43 68 61 74 5F 54 61 62 5F 53 6D 
    //61 6C 6C 5F 42 61 63 6B 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 
    //49 5F 53 74 79 6C 65 73 00 16 0F 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 04 01 80 86 31 16 1E 
    //00 00 C0 41 0F 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 04 01 60 87 31 16 1E 00 00 70 42 19 1A 
    //00 18 96 A2 19 01 60 D0 9D 19 20 00 00 1B 25 98 00 00 19 00 78 90 A2 19 11 00 00 1B 1B 99 00 00 
    //12 20 F0 D5 2E 1D 02 00 01 24 02 16 16 19 1A 00 18 96 A2 19 01 60 D0 9D 19 11 00 00 1B 13 98 00 
    //00 1A 00 18 96 A2 19 01 88 D1 9D 19 16 19 1A 00 18 96 A2 19 01 60 D0 9D 19 3C 00 00 1B 19 98 00 
    //00 39 3A 36 D0 90 6A 0F 1A 00 18 96 A2 19 01 00 D2 9D 19 39 3A 36 58 90 6A 0F 1A 00 18 96 A2 19 
    //01 00 D2 9D 19 39 3A 36 E0 8F 6A 0F 1A 00 18 96 A2 19 01 00 D2 9D 19 16 45 19 1A 00 18 96 A2 19 
    //01 60 D0 9D 19 05 00 08 01 98 EB 9D 19 44 E5 9A 00 00 0F 1A 25 19 1A 00 18 96 A2 19 01 60 D0 9D 
    //19 05 00 10 01 90 96 A2 19 1E 00 00 80 3F 0F 1A 26 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 10 
    //01 90 96 A2 19 1E 00 00 00 40 0F 19 1A 00 18 96 A2 19 01 60 D0 9D 19 05 00 04 01 58 90 31 16 00 
    //18 96 A2 19 19 1A 00 18 96 A2 19 01 60 D0 9D 19 11 00 00 1B 54 97 00 00 1A 00 18 96 A2 19 01 88 
    //D1 9D 19 16 A5 00 18 96 A2 19 16 06 E9 04 1B DD 9A 00 00 16 0F 01 90 2F A2 19 19 01 68 91 A2 19 
    //17 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 25 25 25 25 16 45 19 01 90 2F A2 
    //19 05 00 08 01 A8 EA 9D 19 44 CA 96 00 00 45 19 01 90 2F A2 19 05 00 08 01 30 EA 9D 19 44 C9 96 
    //00 00 0F 19 01 90 2F A2 19 05 00 04 01 08 86 31 16 1E 00 00 C0 41 0F 19 01 90 2F A2 19 05 00 04 
    //01 80 86 31 16 1E 00 00 00 41 0F 19 01 90 2F A2 19 05 00 04 01 60 87 31 16 1E 00 00 9D 43 0F 19 
    //01 90 2F A2 19 05 00 04 01 40 88 31 16 1E 00 00 A0 41 45 19 01 90 2F A2 19 05 00 08 01 08 97 A2 
    //19 44 6D 99 00 00 19 01 90 2F A2 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 
    //00 80 3F 1E 00 00 00 00 16 0F 01 88 28 A2 19 19 01 68 91 A2 19 14 00 04 1B 16 98 00 00 1F 47 55 
    //49 5F 50 61 67 65 00 25 25 25 25 16 19 01 88 28 A2 19 31 00 00 1B 28 98 00 00 1F 63 68 61 74 5F 
    //69 63 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 
    //79 6C 65 73 00 16 0F 19 01 88 28 A2 19 05 00 04 01 08 86 31 16 1E 00 00 20 41 0F 19 01 88 28 A2 
    //19 05 00 04 01 80 86 31 16 19 01 90 2F A2 19 05 00 04 01 80 86 31 16 0F 19 01 88 28 A2 19 05 00 
    //04 01 60 87 31 16 1E 00 00 40 41 0F 19 01 88 28 A2 19 05 00 04 01 40 88 31 16 19 01 90 2F A2 19 
    //05 00 04 01 40 88 31 16 1B B2 96 00 00 25 16 45 01 B8 E9 9D 19 44 2D 98 00 00 1B EC 9A 00 00 16 
    //1B EB 9A 00 00 16 04 0B 47 
  }



