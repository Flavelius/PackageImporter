//==============================================================================
//  HUD_ChatWindow
//==============================================================================

class HUD_ChatWindow extends GUI_TabCtrlDnDWindow
    native
    dependsOn(HUD_ChatPage,GUI_TextButton,GUI_Menu,Class,SBGuiStrings,GUI_TitleBar)
    Transient
    Config(User)
  ;

  var private float mFadeOutTime;
  var private bool mHasFadeOut;
  var private GUI_Page mMainPage;
  var private HUD_ChatPage mChatPage;
  var private GUI_TextButton mFadeOutButton;
  var private GUI_Menu mChannelFilterMenu;
  var private GUI_Menu mFontSizeMenu;


  event OnEndMoving() {
    if (mChatPage != None) {                                                    //0000 : 07 1A 00 77 01 58 6E A7 19 2A 16 
      mChatPage.SaveChatSettings();                                             //000B : 19 01 58 6E A7 19 06 00 00 1B 6A 98 00 00 16 
    }
    Super.OnEndMoving();                                                        //001A : 1C A8 6A A7 19 16 
    //07 1A 00 77 01 58 6E A7 19 2A 16 19 01 58 6E A7 19 06 00 00 1B 6A 98 00 00 16 1C A8 6A A7 19 16 
    //04 0B 47 
  }


  function bool ChangeFontSize(GUI_TextButton aButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    if (mChatPage != None) {                                                    //000F : 07 5A 00 77 01 58 6E A7 19 2A 16 
      mChatPage.SetFontSize(aButton.mIntTag);                                   //001A : 19 01 58 6E A7 19 14 00 00 1B 46 97 00 00 19 00 80 6F A7 19 05 00 04 01 58 90 31 16 16 
      mChatPage.GetFontSize(mFontSizeMenu);                                     //0037 : 19 01 58 6E A7 19 0B 00 00 1B C8 98 00 00 01 A8 70 A7 19 16 
      mChatPage.SaveChatSettings();                                             //004B : 19 01 58 6E A7 19 06 00 00 1B 6A 98 00 00 16 
    }
    return True;                                                                //005A : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 07 5A 00 77 01 58 6E A7 19 2A 16 19 01 58 6E A7 19 
    //14 00 00 1B 46 97 00 00 19 00 80 6F A7 19 05 00 04 01 58 90 31 16 16 19 01 58 6E A7 19 0B 00 00 
    //1B C8 98 00 00 01 A8 70 A7 19 16 19 01 58 6E A7 19 06 00 00 1B 6A 98 00 00 16 04 27 04 0B 47 
  }


  function bool ChangeFilterSetting(GUI_TextButton aButton) {
    if (mChatPage != None) {                                                    //0000 : 07 46 00 77 01 58 6E A7 19 2A 16 
      mChatPage.SetChannelFilter(aButton.mIntTag,aButton.mChecked);             //000B : 19 01 58 6E A7 19 23 00 00 1B 94 99 00 00 19 00 48 72 A7 19 05 00 04 01 58 90 31 16 19 00 48 72 A7 19 06 00 04 2D 01 08 93 9E 19 16 
      mChatPage.ResetText();                                                    //0037 : 19 01 58 6E A7 19 06 00 00 1B 01 99 00 00 16 
    }
    return True;                                                                //0046 : 04 27 
    //07 46 00 77 01 58 6E A7 19 2A 16 19 01 58 6E A7 19 23 00 00 1B 94 99 00 00 19 00 48 72 A7 19 05 
    //00 04 01 58 90 31 16 19 00 48 72 A7 19 06 00 04 2D 01 08 93 9E 19 16 19 01 58 6E A7 19 06 00 00 
    //1B 01 99 00 00 16 04 27 04 0B 47 
  }


  function bool ToggleFadeOut(GUI_Component aClickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    mHasFadeOut = !mHasFadeOut;                                                 //000F : 14 2D 01 E0 74 A7 19 81 2D 01 E0 74 A7 19 16 
    if (mChatPage != None) {                                                    //001E : 07 38 00 77 01 58 6E A7 19 2A 16 
      mChatPage.SaveChatSettings();                                             //0029 : 19 01 58 6E A7 19 06 00 00 1B 6A 98 00 00 16 
    }
    return True;                                                                //0038 : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 14 2D 01 E0 74 A7 19 81 2D 01 E0 74 A7 19 16 07 38 
    //00 77 01 58 6E A7 19 2A 16 19 01 58 6E A7 19 06 00 00 1B 6A 98 00 00 16 04 27 04 0B 47 
  }


  event bool OnFocus(bool State) {
    mFadeOutTime = -1.00000000;                                                 //0000 : 0F 01 58 77 A7 19 1E 00 00 80 BF 
    if (mAlphaFactor < 1) {                                                     //000B : 07 23 00 B0 01 60 38 9D 19 39 3F 26 16 
      FadeIn(0.25000000);                                                       //0018 : 1B 72 34 00 00 1E 00 00 80 3E 16 
    }
    return True;                                                                //0023 : 04 27 
    //0F 01 58 77 A7 19 1E 00 00 80 BF 07 23 00 B0 01 60 38 9D 19 39 3F 26 16 1B 72 34 00 00 1E 00 00 
    //80 3E 16 04 27 04 0B 47 
  }


  event SetHasFadeOut(bool aHasFadeOut) {
    mHasFadeOut = aHasFadeOut;                                                  //0000 : 14 2D 01 E0 74 A7 19 2D 00 F8 78 A7 19 
    mFadeOutButton.mChecked = mHasFadeOut;                                      //000D : 14 19 01 D0 79 A7 19 06 00 04 2D 01 08 93 9E 19 2D 01 E0 74 A7 19 
    //14 2D 01 E0 74 A7 19 2D 00 F8 78 A7 19 14 19 01 D0 79 A7 19 06 00 04 2D 01 08 93 9E 19 2D 01 E0 
    //74 A7 19 04 0B 47 
  }


  event SetChatPage(HUD_ChatPage aChatPage) {
    mChatPage = aChatPage;                                                      //0000 : 0F 01 58 6E A7 19 00 F8 7A A7 19 
    //0F 01 58 6E A7 19 00 F8 7A A7 19 04 0B 47 
  }


  event InitializeMenu(GUI_Menu Menu) {
    local GUI_TextButton menuButton;
    mFadeOutButton = Menu.CreateMenuCheckbox(Class'SBGuiStrings'.default.Fade_Out.Text,mHasFadeOut);//0000 : 0F 01 D0 79 A7 19 19 00 60 7C A7 19 1F 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 46 99 19 2D 01 E0 74 A7 19 16 
    mFadeOutButton.__OnClick__Delegate = ToggleFadeOut;                         //002E : 45 19 01 D0 79 A7 19 05 00 08 01 98 EB 9D 19 44 66 99 00 00 
    menuButton = Menu.CreateSubMenu(Class'SBGuiStrings'.default.filter.Text,"","Chat\FilterWindow.txt");//0042 : 0F 00 90 7F A7 19 19 00 60 7C A7 19 32 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 45 99 19 1F 00 1F 43 68 61 74 5C 46 69 6C 74 65 72 57 69 6E 64 6F 77 2E 74 78 74 00 16 
    mChannelFilterMenu = GUI_Menu(Menu.GetSubMenu(menuButton));                 //0083 : 0F 01 08 80 A7 19 2E 68 B8 2F 1D 19 00 60 7C A7 19 0B 00 04 1B 70 98 00 00 00 90 7F A7 19 16 
    mChannelFilterMenu.__OnButtonChecked__Delegate = ChangeFilterSetting;       //00A2 : 45 19 01 08 80 A7 19 05 00 08 01 78 99 9E 19 44 C3 98 00 00 
    mChatPage.GetFilterSettings(mChannelFilterMenu);                            //00B6 : 19 01 58 6E A7 19 0B 00 00 1B A4 98 00 00 01 08 80 A7 19 16 
    menuButton = Menu.CreateSubMenu(Class'SBGuiStrings'.default.Font.Text,"GUI_Menu");//00CA : 0F 00 90 7F A7 19 19 00 60 7C A7 19 23 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 98 2F 16 1F 47 55 49 5F 4D 65 6E 75 00 16 
    mFontSizeMenu = GUI_Menu(Menu.GetSubMenu(menuButton));                      //00FC : 0F 01 A8 70 A7 19 2E 68 B8 2F 1D 19 00 60 7C A7 19 0B 00 04 1B 70 98 00 00 00 90 7F A7 19 16 
    mFontSizeMenu.__OnButtonChecked__Delegate = ChangeFontSize;                 //011B : 45 19 01 A8 70 A7 19 05 00 08 01 78 99 9E 19 44 4D 99 00 00 
    menuButton = mFontSizeMenu.CreateMenuCheckbox("Small",False);               //012F : 0F 00 90 7F A7 19 19 01 A8 70 A7 19 0E 00 04 1B 5B 98 00 00 1F 53 6D 61 6C 6C 00 28 16 
    menuButton.mIntTag = 10;                                                    //014C : 0F 19 00 90 7F A7 19 05 00 04 01 58 90 31 16 2C 0A 
    menuButton = mFontSizeMenu.CreateMenuCheckbox("Medium",False);              //015D : 0F 00 90 7F A7 19 19 01 A8 70 A7 19 0F 00 04 1B 5B 98 00 00 1F 4D 65 64 69 75 6D 00 28 16 
    menuButton.mIntTag = 11;                                                    //017B : 0F 19 00 90 7F A7 19 05 00 04 01 58 90 31 16 2C 0B 
    menuButton = mFontSizeMenu.CreateMenuCheckbox("Large",False);               //018C : 0F 00 90 7F A7 19 19 01 A8 70 A7 19 0E 00 04 1B 5B 98 00 00 1F 4C 61 72 67 65 00 28 16 
    menuButton.mIntTag = 12;                                                    //01A9 : 0F 19 00 90 7F A7 19 05 00 04 01 58 90 31 16 2C 0C 
    mChatPage.GetFontSize(mFontSizeMenu);                                       //01BA : 19 01 58 6E A7 19 0B 00 00 1B C8 98 00 00 01 A8 70 A7 19 16 
    Super.InitializeMenu(Menu);                                                 //01CE : 1C F8 93 9E 19 00 60 7C A7 19 16 
    //0F 01 D0 79 A7 19 19 00 60 7C A7 19 1F 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 68 46 99 19 2D 01 E0 74 A7 19 16 45 19 01 D0 79 A7 19 05 00 08 01 98 EB 9D 19 44 66 99 
    //00 00 0F 00 90 7F A7 19 19 00 60 7C A7 19 32 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 F0 45 99 19 1F 00 1F 43 68 61 74 5C 46 69 6C 74 65 72 57 69 6E 64 6F 77 2E 74 78 
    //74 00 16 0F 01 08 80 A7 19 2E 68 B8 2F 1D 19 00 60 7C A7 19 0B 00 04 1B 70 98 00 00 00 90 7F A7 
    //19 16 45 19 01 08 80 A7 19 05 00 08 01 78 99 9E 19 44 C3 98 00 00 19 01 58 6E A7 19 0B 00 00 1B 
    //A4 98 00 00 01 08 80 A7 19 16 0F 00 90 7F A7 19 19 00 60 7C A7 19 23 00 04 1B 76 98 00 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 98 2F 16 1F 47 55 49 5F 4D 65 6E 75 00 16 0F 01 A8 70 
    //A7 19 2E 68 B8 2F 1D 19 00 60 7C A7 19 0B 00 04 1B 70 98 00 00 00 90 7F A7 19 16 45 19 01 A8 70 
    //A7 19 05 00 08 01 78 99 9E 19 44 4D 99 00 00 0F 00 90 7F A7 19 19 01 A8 70 A7 19 0E 00 04 1B 5B 
    //98 00 00 1F 53 6D 61 6C 6C 00 28 16 0F 19 00 90 7F A7 19 05 00 04 01 58 90 31 16 2C 0A 0F 00 90 
    //7F A7 19 19 01 A8 70 A7 19 0F 00 04 1B 5B 98 00 00 1F 4D 65 64 69 75 6D 00 28 16 0F 19 00 90 7F 
    //A7 19 05 00 04 01 58 90 31 16 2C 0B 0F 00 90 7F A7 19 19 01 A8 70 A7 19 0E 00 04 1B 5B 98 00 00 
    //1F 4C 61 72 67 65 00 28 16 0F 19 00 90 7F A7 19 05 00 04 01 58 90 31 16 2C 0C 19 01 58 6E A7 19 
    //0B 00 00 1B C8 98 00 00 01 A8 70 A7 19 16 1C F8 93 9E 19 00 60 7C A7 19 16 04 0B 47 
  }


  event Flush() {
    Super.Flush();                                                              //0000 : 1C D8 97 9E 19 16 
    mFadeOutButton = None;                                                      //0006 : 0F 01 D0 79 A7 19 2A 
    mChannelFilterMenu = None;                                                  //000D : 0F 01 08 80 A7 19 2A 
    mFontSizeMenu = None;                                                       //0014 : 0F 01 A8 70 A7 19 2A 
    //1C D8 97 9E 19 16 0F 01 D0 79 A7 19 2A 0F 01 08 80 A7 19 2A 0F 01 A8 70 A7 19 2A 04 0B 47 
  }


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    mFadeOutTime = GetTimeSeconds();                                            //0006 : 0F 01 58 77 A7 19 1B 1A 9A 00 00 16 
    mTitleBar.mUseParentAlpha = True;                                           //0012 : 14 19 01 D8 63 9E 19 06 00 04 2D 01 58 E0 9D 19 27 
    SetIcon("header_conversation","SBGuiTX.GUI_Styles","GUI_Styles");           //0023 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mMainPage = CreatePage("GUI_Page",0,0,6,21,GetClientWidth() - 6 - 6,GetClientHeight() - 21 - 6);//005E : 0F 01 88 81 A7 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 06 16 39 3F 2C 06 16 39 44 AF AF 1B 1F 98 00 00 16 39 3F 2C 15 16 39 3F 2C 06 16 16 
    mMainPage.SetStdBackground(7);                                              //00A2 : 19 01 88 81 A7 19 08 00 00 1B 22 98 00 00 2C 07 16 
    SetMinBounds(0.00000000,0.00000000,100.00000000,100.00000000);              //00B3 : 1B 59 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 C8 42 1E 00 00 C8 42 16 
    //1C 28 9E 9E 19 16 0F 01 58 77 A7 19 1B 1A 9A 00 00 16 14 19 01 D8 63 9E 19 06 00 04 2D 01 58 E0 
    //9D 19 27 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 00 1F 53 42 
    //47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 
    //88 81 A7 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 39 44 AF AF 1B 17 98 
    //00 00 16 39 3F 2C 06 16 39 3F 2C 06 16 39 44 AF AF 1B 1F 98 00 00 16 39 3F 2C 15 16 39 3F 2C 06 
    //16 16 19 01 88 81 A7 19 08 00 00 1B 22 98 00 00 2C 07 16 1B 59 98 00 00 1E 00 00 00 00 1E 00 00 
    //00 00 1E 00 00 C8 42 1E 00 00 C8 42 16 04 0B 47 
  }



