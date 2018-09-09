//==============================================================================
//  HUD_Login
//==============================================================================

class HUD_Login extends GUI_Window
    native
    dependsOn(Login_PlayerController,Actor,Game_GameClient,PlayerController,GUI_EditBox,GUI_Label,GUI_Component,Base_GameClient,Player,LevelInfo,EnvironmentManager)
    Transient
    Config(User)
  ;

  const LOGIN_HEIGHT =  220;
  const LOGIN_WIDTH =  401;
  const IDC_SM_ACCOUNT_FORCED_FAILED =  12;
  const IDC_SM_ACCOUNT_LOCKED =  11;
  const IDC_SM_ACCOUNT_LOCK_STATUS =  10;
  const IDC_SM_INVALID_PROTOCOL =  5;
  const IDC_SM_AUTH_TIMEOUT =  4;
  const IDC_SM_AUTH_FAILED =  3;
  const IDC_SM_CANCEL =  2;
  const IDC_SM_LOGIN =  1;
  const IDC_SM_QUIT =  0;
  enum eLoginRequestResult {
    LRR_NONE ,
    LRR_INVALID_REVISION ,
    LRR_INVALID_USERNAME ,
    LRR_INVALID_PASSWORD ,
    LRR_AUTHENTICATE_FAILED ,
    LRR_LOGIN_ADD_FAILED ,
    LRR_LOGIN_CONNECT_FAILED ,
    LRR_INVALID_ACTIVE_CODE ,
    LRR_BANNED_ACCOUNT ,
    LRR_SUSPENDED_ACCOUNT ,
    LRR_DISABLED_ACCOUNT 
  };

  var private GUI_Page mMainPage;
  var private GUI_Label mLoginNameLabel;
  var private GUI_EditBox mLoginName;
  var private GUI_Label mLoginPwdLabel;
  var private GUI_EditBox mLoginPwd;
  var private GUI_Label mRememberLabel;
  var private GUI_Button mRememberButton;
  var private GUI_Page mButtonPage;
  var private GUI_Button mLoginButton;
  var private GUI_Button mQuitButton;
  var private GUI_Page mStatusPage;
  var private GUI_Label mErrorLabel;
  var private GUI_Page mCancelPage;
  var private GUI_Button mCancelButton;
  var globalconfig string mLastUserName;
  var globalconfig bool mRememberUserName;
  var float mForcedDisconnectTimer;
  var private int mForcedDisconnectReason;


  event OnComponentDestroyed() {
    GetLoginController().__HandleLoginResult__Delegate = None;                  //0000 : 45 19 1B 11 99 00 00 16 05 00 08 01 10 D9 35 0F 44 00 00 00 00 
    Super.OnComponentDestroyed();                                               //0015 : 1C E0 DA 9D 19 16 
    //45 19 1B 11 99 00 00 16 05 00 08 01 10 D9 35 0F 44 00 00 00 00 1C E0 DA 9D 19 16 04 0B 47 
  }


  event bool HandleKeyEvent(GUI_Component component,out byte Key,out byte State,float delta) {
    if (State == 3) {                                                           //0000 : 07 37 00 9A 39 3A 00 C0 0A B6 1C 2C 03 16 
      switch (Key) {                                                            //000E : 05 01 00 38 0B B6 1C 
        case 13 :                                                               //0015 : 0A 34 00 24 0D 
          mLoginButton.OnClick(mLoginButton);                                   //001A : 19 01 B0 0B B6 1C 0F 00 04 43 98 EB 9D 19 DD 96 00 00 01 B0 0B B6 1C 16 
          return True;                                                          //0032 : 04 27 
        default:                                                                //0034 : 0A FF FF 
      }
      return False;                                                             //0037 : 04 28 
    }
    //07 37 00 9A 39 3A 00 C0 0A B6 1C 2C 03 16 05 01 00 38 0B B6 1C 0A 34 00 24 0D 19 01 B0 0B B6 1C 
    //0F 00 04 43 98 EB 9D 19 DD 96 00 00 01 B0 0B B6 1C 16 04 27 0A FF FF 04 28 04 0B 47 
  }


  function EnableInteractiveComponents(bool IsEnabled) {
    mMainPage.SetVisible(IsEnabled);                                            //0000 : 19 01 E8 0E B6 1C 0C 00 00 1B 14 98 00 00 2D 00 C8 0D B6 1C 16 
    mButtonPage.SetVisible(IsEnabled);                                          //0015 : 19 01 60 0F B6 1C 0C 00 00 1B 14 98 00 00 2D 00 C8 0D B6 1C 16 
    mStatusPage.SetVisible(!IsEnabled);                                         //002A : 19 01 D8 0F B6 1C 0E 00 00 1B 14 98 00 00 81 2D 00 C8 0D B6 1C 16 16 
    mCancelPage.SetVisible(!IsEnabled);                                         //0041 : 19 01 50 10 B6 1C 0E 00 00 1B 14 98 00 00 81 2D 00 C8 0D B6 1C 16 16 
    //19 01 E8 0E B6 1C 0C 00 00 1B 14 98 00 00 2D 00 C8 0D B6 1C 16 19 01 60 0F B6 1C 0C 00 00 1B 14 
    //98 00 00 2D 00 C8 0D B6 1C 16 19 01 D8 0F B6 1C 0E 00 00 1B 14 98 00 00 81 2D 00 C8 0D B6 1C 16 
    //16 19 01 50 10 B6 1C 0E 00 00 1B 14 98 00 00 81 2D 00 C8 0D B6 1C 16 16 04 0B 47 
  }


  function bool MBClickHandler(GUI_MessageBox messageBox,int boxTag,int buttonTag) {
    switch (boxTag) {                                                           //0000 : 05 04 00 40 17 B6 1C 
      case 102 :                                                                //0007 : 0A 0C 00 2C 66 
      case 107 :                                                                //000C : 0A 3D 00 2C 6B 
        ResetTimer();                                                           //0011 : 1B AD 98 00 00 16 
        Game_GameClient(Class'Actor'.static.GetGameEngine()).Logout(boxTag);    //0017 : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 40 17 B6 1C 16 
        break;                                                                  //003A : 06 B9 03 
      case 108 :                                                                //003D : 0A 68 00 2C 6C 
        Game_GameClient(Class'Actor'.static.GetGameEngine()).Logout(boxTag);    //0042 : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 40 17 B6 1C 16 
        break;                                                                  //0065 : 06 B9 03 
      case 103 :                                                                //0068 : 0A 6D 00 2C 67 
      case 104 :                                                                //006D : 0A 72 00 2C 68 
      case 105 :                                                                //0072 : 0A 77 00 2C 69 
      case 106 :                                                                //0077 : 0A A2 00 2C 6A 
        Game_GameClient(Class'Actor'.static.GetGameEngine()).Logout(boxTag);    //007C : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 40 17 B6 1C 16 
        break;                                                                  //009F : 06 B9 03 
      case 201 :                                                                //00A2 : 0A A7 00 2C C9 
      case 202 :                                                                //00A7 : 0A AC 00 2C CA 
      case 301 :                                                                //00AC : 0A B4 00 1D 2D 01 00 00 
      case 302 :                                                                //00B4 : 0A E2 00 1D 2E 01 00 00 
        Game_GameClient(Class'Actor'.static.GetGameEngine()).Logout(boxTag);    //00BC : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 40 17 B6 1C 16 
        break;                                                                  //00DF : 06 B9 03 
      case 203 :                                                                //00E2 : 0A E7 00 2C CB 
      case 303 :                                                                //00E7 : 0A F2 00 1D 2F 01 00 00 
        break;                                                                  //00EF : 06 B9 03 
      case 0 :                                                                  //00F2 : 0A 3C 01 25 
        switch (buttonTag) {                                                    //00F6 : 05 04 00 B8 17 B6 1C 
          case Class'GUI_BaseDesktop'.4 :                                       //00FD : 0A 25 01 12 20 00 68 D7 00 02 00 04 2C 04 
            break;                                                              //0122 : 06 39 01 
          case Class'GUI_BaseDesktop'.8 :                                       //0125 : 0A 36 01 12 20 00 68 D7 00 02 00 04 2C 08 
            break;                                                              //0133 : 06 39 01 
          default:                                                              //0136 : 0A FF FF 
        }
        break;                                                                  //0139 : 06 B9 03 
      case 3 :                                                                  //013C : 0A B6 01 2C 03 
        mLoginName.SetText(mLastUserName);                                      //0141 : 19 01 30 18 B6 1C 0B 00 00 1B 13 98 00 00 01 A8 18 B6 1C 16 
        mLoginPwd.SetText("");                                                  //0155 : 19 01 20 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mErrorLabel.SetText("");                                                //0166 : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mLoginName.SetFocus();                                                  //0177 : 19 01 30 18 B6 1C 06 00 00 1B 3A 2D 00 00 16 
        EnableInteractiveComponents(True);                                      //0186 : 1B 7F 98 00 00 27 16 
        Game_GameClient(Class'Actor'.static.GetGameEngine()).Logout(ForcedLogout2PacketLogout(3));//018D : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0E 00 00 1B 47 3F 00 00 1B 2E 9A 00 00 2C 03 16 16 
        break;                                                                  //01B3 : 06 B9 03 
      case 4 :                                                                  //01B6 : 0A E5 01 2C 04 
        mErrorLabel.SetText("");                                                //01BB : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mLoginButton.SetFocus();                                                //01CC : 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 
        EnableInteractiveComponents(True);                                      //01DB : 1B 7F 98 00 00 27 16 
        break;                                                                  //01E2 : 06 B9 03 
      case 5 :                                                                  //01E5 : 0A 39 02 2C 05 
        mLoginName.SetText(mLastUserName);                                      //01EA : 19 01 30 18 B6 1C 0B 00 00 1B 13 98 00 00 01 A8 18 B6 1C 16 
        mLoginPwd.SetText("");                                                  //01FE : 19 01 20 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mErrorLabel.SetText("");                                                //020F : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mQuitButton.SetFocus();                                                 //0220 : 19 01 10 1A B6 1C 06 00 00 1B 3A 2D 00 00 16 
        EnableInteractiveComponents(True);                                      //022F : 1B 7F 98 00 00 27 16 
        break;                                                                  //0236 : 06 B9 03 
      case 10 :                                                                 //0239 : 0A D1 02 2C 0A 
        switch (buttonTag) {                                                    //023E : 05 04 00 B8 17 B6 1C 
          case Class'GUI_BaseDesktop'.4 :                                       //0245 : 0A 75 02 12 20 00 68 D7 00 02 00 04 2C 04 
            Game_GameClient(Class'Actor'.static.GetGameEngine()).ForcedLogin(1);//0253 : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 07 00 00 1B 3C 3F 00 00 26 16 
            break;                                                              //0272 : 06 CE 02 
          case Class'GUI_BaseDesktop'.8 :                                       //0275 : 0A CB 02 12 20 00 68 D7 00 02 00 04 2C 08 
            Game_GameClient(Class'Actor'.static.GetGameEngine()).CancelConnectToLogin();//0283 : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 06 00 00 1B 38 3F 00 00 16 
            mErrorLabel.SetText("");                                            //02A1 : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
            mLoginButton.SetFocus();                                            //02B2 : 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 
            EnableInteractiveComponents(True);                                  //02C1 : 1B 7F 98 00 00 27 16 
            break;                                                              //02C8 : 06 CE 02 
          default:                                                              //02CB : 0A FF FF 
        }
        break;                                                                  //02CE : 06 B9 03 
      case 11 :                                                                 //02D1 : 0A 69 03 2C 0B 
        switch (buttonTag) {                                                    //02D6 : 05 04 00 B8 17 B6 1C 
          case Class'GUI_BaseDesktop'.4 :                                       //02DD : 0A 0D 03 12 20 00 68 D7 00 02 00 04 2C 04 
            Game_GameClient(Class'Actor'.static.GetGameEngine()).ForcedLogin(0);//02EB : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 07 00 00 1B 3C 3F 00 00 25 16 
            break;                                                              //030A : 06 66 03 
          case Class'GUI_BaseDesktop'.8 :                                       //030D : 0A 63 03 12 20 00 68 D7 00 02 00 04 2C 08 
            Game_GameClient(Class'Actor'.static.GetGameEngine()).CancelConnectToLogin();//031B : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 06 00 00 1B 38 3F 00 00 16 
            mErrorLabel.SetText("");                                            //0339 : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
            mLoginButton.SetFocus();                                            //034A : 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 
            EnableInteractiveComponents(True);                                  //0359 : 1B 7F 98 00 00 27 16 
            break;                                                              //0360 : 06 66 03 
          default:                                                              //0363 : 0A FF FF 
        }
        break;                                                                  //0366 : 06 B9 03 
      case 12 :                                                                 //0369 : 0A B6 03 2C 0C 
        Game_GameClient(Class'Actor'.static.GetGameEngine()).CancelConnectToLogin();//036E : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 06 00 00 1B 38 3F 00 00 16 
        mErrorLabel.SetText("");                                                //038C : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mLoginButton.SetFocus();                                                //039D : 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 
        EnableInteractiveComponents(True);                                      //03AC : 1B 7F 98 00 00 27 16 
        break;                                                                  //03B3 : 06 B9 03 
      default:                                                                  //03B6 : 0A FF FF 
    }
    return True;                                                                //03B9 : 04 27 
    //05 04 00 40 17 B6 1C 0A 0C 00 2C 66 0A 3D 00 2C 6B 1B AD 98 00 00 16 19 2E D8 D3 5A 01 12 20 F8 
    //8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 40 17 B6 1C 16 06 B9 03 0A 68 00 
    //2C 6C 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 
    //40 17 B6 1C 16 06 B9 03 0A 6D 00 2C 67 0A 72 00 2C 68 0A 77 00 2C 69 0A A2 00 2C 6A 19 2E D8 D3 
    //5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 40 17 B6 1C 16 06 
    //B9 03 0A A7 00 2C C9 0A AC 00 2C CA 0A B4 00 1D 2D 01 00 00 0A E2 00 1D 2E 01 00 00 19 2E D8 D3 
    //5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 00 40 17 B6 1C 16 06 
    //B9 03 0A E7 00 2C CB 0A F2 00 1D 2F 01 00 00 06 B9 03 0A 3C 01 25 05 04 00 B8 17 B6 1C 0A 25 01 
    //12 20 00 68 D7 00 02 00 04 2C 04 0E 19 1B 0E 2F 00 00 16 0C 00 00 1B 65 0C 00 00 1F 51 55 49 54 
    //00 16 06 39 01 0A 36 01 12 20 00 68 D7 00 02 00 04 2C 08 06 39 01 0A FF FF 06 B9 03 0A B6 01 2C 
    //03 19 01 30 18 B6 1C 0B 00 00 1B 13 98 00 00 01 A8 18 B6 1C 16 19 01 20 19 B6 1C 08 00 00 1B 13 
    //98 00 00 1F 00 16 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 19 01 30 18 B6 1C 06 00 00 
    //1B 3A 2D 00 00 16 1B 7F 98 00 00 27 16 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 
    //0F 16 0E 00 00 1B 47 3F 00 00 1B 2E 9A 00 00 2C 03 16 16 06 B9 03 0A E5 01 2C 04 19 01 98 19 B6 
    //1C 08 00 00 1B 13 98 00 00 1F 00 16 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 1B 7F 98 00 00 
    //27 16 06 B9 03 0A 39 02 2C 05 19 01 30 18 B6 1C 0B 00 00 1B 13 98 00 00 01 A8 18 B6 1C 16 19 01 
    //20 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
    //19 01 10 1A B6 1C 06 00 00 1B 3A 2D 00 00 16 1B 7F 98 00 00 27 16 06 B9 03 0A D1 02 2C 0A 05 04 
    //00 B8 17 B6 1C 0A 75 02 12 20 00 68 D7 00 02 00 04 2C 04 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 
    //00 04 1C 78 2B 6E 0F 16 07 00 00 1B 3C 3F 00 00 26 16 06 CE 02 0A CB 02 12 20 00 68 D7 00 02 00 
    //04 2C 08 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 06 00 00 1B 38 3F 00 00 
    //16 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 
    //16 1B 7F 98 00 00 27 16 06 CE 02 0A FF FF 06 B9 03 0A 69 03 2C 0B 05 04 00 B8 17 B6 1C 0A 0D 03 
    //12 20 00 68 D7 00 02 00 04 2C 04 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    //07 00 00 1B 3C 3F 00 00 25 16 06 66 03 0A 63 03 12 20 00 68 D7 00 02 00 04 2C 08 19 2E D8 D3 5A 
    //01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 06 00 00 1B 38 3F 00 00 16 19 01 98 19 B6 1C 08 
    //00 00 1B 13 98 00 00 1F 00 16 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 1B 7F 98 00 00 27 16 
    //06 66 03 0A FF FF 06 B9 03 0A B6 03 2C 0C 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 
    //6E 0F 16 06 00 00 1B 38 3F 00 00 16 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 19 01 B0 
    //0B B6 1C 06 00 00 1B 3A 2D 00 00 16 1B 7F 98 00 00 27 16 06 B9 03 0A FF FF 04 27 04 0B 47 
  }


  function bool ClickHandler(GUI_Component clickedButton) {
    local string lLastString;
    local int LoginResult;
    local Login_PlayerController Controller;
    Controller = GetLoginController();                                          //0000 : 0F 00 C8 1F B6 1C 1B 11 99 00 00 16 
    switch (clickedButton.mIntTag) {                                            //000C : 05 04 19 00 B0 1B B6 1C 05 00 04 01 58 90 31 16 
      case 0 :                                                                  //001C : 0A 8F 00 25 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Quit.Text,Class'SBGuiStrings'.default.Are_you_sure_you_want_to_quit_.Text,Class'GUI_BaseDesktop'.4 | Class'GUI_BaseDesktop'.8 | Class'GUI_BaseDesktop'.32,0,self);//0020 : 19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 C7 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 CA 98 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
        break;                                                                  //008C : 06 7E 02 
      case 1 :                                                                  //008F : 0A 2E 02 26 
        if (mLoginName.GetText() != "" && mLoginPwd.GetText() != "") {          //0093 : 07 CC 01 82 7B 19 01 30 18 B6 1C 06 00 00 1B 92 0C 00 00 16 1F 00 16 18 14 00 7B 19 01 20 19 B6 1C 06 00 00 1B 92 0C 00 00 16 1F 00 16 16 
          if (Controller != None) {                                             //00C1 : 07 E0 00 77 00 C8 1F B6 1C 2A 16 
            Controller.__HandleLoginResult__Delegate = HandleLoginResult;       //00CC : 45 19 00 C8 1F B6 1C 05 00 08 01 10 D9 35 0F 44 91 05 00 00 
          }
          mErrorLabel.SetText(Class'SBGuiStrings'.default.Logging_in___.Text);  //00E0 : 19 01 98 19 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 9E 99 19 16 
          mRememberUserName = mRememberButton.isChecked();                      //0102 : 14 2D 01 40 20 B6 1C 19 01 B8 20 B6 1C 06 00 04 1B 2F 98 00 00 16 
          if (mRememberUserName) {                                              //0118 : 07 39 01 2D 01 40 20 B6 1C 
            lLastString = mLoginName.GetText();                                 //0121 : 0F 00 30 21 B6 1C 19 01 30 18 B6 1C 06 00 00 1B 92 0C 00 00 16 
          } else {                                                              //0136 : 06 41 01 
            lLastString = "";                                                   //0139 : 0F 00 30 21 B6 1C 1F 00 
          }
          if (lLastString != mLastUserName) {                                   //0141 : 07 69 01 7B 00 30 21 B6 1C 01 A8 18 B6 1C 16 
            mLastUserName = "";                                                 //0150 : 0F 01 A8 18 B6 1C 1F 00 
            SaveConfig();                                                       //0158 : 62 18 16 
            mLastUserName = lLastString;                                        //015B : 0F 01 A8 18 B6 1C 00 30 21 B6 1C 
            SaveConfig();                                                       //0166 : 62 18 16 
          }
          LoginResult = Game_GameClient(Class'Actor'.static.GetGameEngine()).ConnectToLoginServer(mLoginName.GetText(),mLoginPwd.GetText());//0169 : 0F 00 A8 21 B6 1C 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 24 00 04 1B 3B 3F 00 00 19 01 30 18 B6 1C 06 00 00 1B 92 0C 00 00 16 19 01 20 19 B6 1C 06 00 00 1B 92 0C 00 00 16 16 
          if (LoginResult > 0) {                                                //01AB : 07 C2 01 97 00 A8 21 B6 1C 25 16 
            HandleLoginResult(False,LoginResult);                               //01B6 : 1B 91 05 00 00 28 00 A8 21 B6 1C 16 
          }
          EnableInteractiveComponents(False);                                   //01C2 : 1B 7F 98 00 00 28 16 
        } else {                                                                //01C9 : 06 2B 02 
          mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Error_.Text,Class'SBGuiStrings'.default.Please_fill_in_username_and_password.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//01CC : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 D4 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 DC 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        }
        break;                                                                  //022B : 06 7E 02 
      case 2 :                                                                  //022E : 0A 7B 02 2C 02 
        Game_GameClient(Class'Actor'.static.GetGameEngine()).CancelConnectToLogin();//0233 : 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 06 00 00 1B 38 3F 00 00 16 
        mErrorLabel.SetText("");                                                //0251 : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mLoginButton.SetFocus();                                                //0262 : 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 
        EnableInteractiveComponents(True);                                      //0271 : 1B 7F 98 00 00 27 16 
        break;                                                                  //0278 : 06 7E 02 
      default:                                                                  //027B : 0A FF FF 
    }
    return False;                                                               //027E : 04 28 
    //0F 00 C8 1F B6 1C 1B 11 99 00 00 16 05 04 19 00 B0 1B B6 1C 05 00 04 01 58 90 31 16 0A 8F 00 25 
    //19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 C7 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //20 CA 98 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 
    //68 D7 00 02 00 04 2C 20 16 25 17 16 06 7E 02 0A 2E 02 26 07 CC 01 82 7B 19 01 30 18 B6 1C 06 00 
    //00 1B 92 0C 00 00 16 1F 00 16 18 14 00 7B 19 01 20 19 B6 1C 06 00 00 1B 92 0C 00 00 16 1F 00 16 
    //16 07 E0 00 77 00 C8 1F B6 1C 2A 16 45 19 00 C8 1F B6 1C 05 00 08 01 10 D9 35 0F 44 91 05 00 00 
    //19 01 98 19 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 9E 99 
    //19 16 14 2D 01 40 20 B6 1C 19 01 B8 20 B6 1C 06 00 04 1B 2F 98 00 00 16 07 39 01 2D 01 40 20 B6 
    //1C 0F 00 30 21 B6 1C 19 01 30 18 B6 1C 06 00 00 1B 92 0C 00 00 16 06 41 01 0F 00 30 21 B6 1C 1F 
    //00 07 69 01 7B 00 30 21 B6 1C 01 A8 18 B6 1C 16 0F 01 A8 18 B6 1C 1F 00 62 18 16 0F 01 A8 18 B6 
    //1C 00 30 21 B6 1C 62 18 16 0F 00 A8 21 B6 1C 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 
    //2B 6E 0F 16 24 00 04 1B 3B 3F 00 00 19 01 30 18 B6 1C 06 00 00 1B 92 0C 00 00 16 19 01 20 19 B6 
    //1C 06 00 00 1B 92 0C 00 00 16 16 07 C2 01 97 00 A8 21 B6 1C 25 16 1B 91 05 00 00 28 00 A8 21 B6 
    //1C 16 1B 7F 98 00 00 28 16 06 2B 02 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 
    //65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 D4 98 19 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 DC 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 
    //00 02 00 04 2C 20 16 2C 03 17 16 06 7E 02 0A 7B 02 2C 02 19 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 
    //00 04 1C 78 2B 6E 0F 16 06 00 00 1B 38 3F 00 00 16 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 
    //00 16 19 01 B0 0B B6 1C 06 00 00 1B 3A 2D 00 00 16 1B 7F 98 00 00 27 16 06 7E 02 0A FF FF 04 28 
    //04 0B 47 
  }


  function TickHandler(float aDeltaTime) {
    mForcedDisconnectTimer -= aDeltaTime;                                       //0000 : B9 01 C0 23 B6 1C 00 48 23 B6 1C 16 
    if (mForcedDisconnectTimer < 0.01000000) {                                  //000C : 07 44 00 B0 01 C0 23 B6 1C 1E 0A D7 23 3C 16 
      ResetTimer();                                                             //001B : 1B AD 98 00 00 16 
      Base_GameClient(Class'Actor'.static.GetGameEngine()).Logout(mForcedDisconnectReason);//0021 : 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 01 38 24 B6 1C 16 
    }
    //B9 01 C0 23 B6 1C 00 48 23 B6 1C 16 07 44 00 B0 01 C0 23 B6 1C 1E 0A D7 23 3C 16 1B AD 98 00 00 
    //16 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 0B 00 00 1B 47 3F 00 00 01 38 
    //24 B6 1C 16 04 0B 47 
  }


  function ResetTimer() {
    mForcedDisconnectTimer = 0.00000000;                                        //0000 : 0F 01 C0 23 B6 1C 1E 00 00 00 00 
    __OnTick__Delegate = None;                                                  //000B : 45 01 70 E6 9D 19 44 00 00 00 00 
    //0F 01 C0 23 B6 1C 1E 00 00 00 00 45 01 70 E6 9D 19 44 00 00 00 00 04 0B 47 
  }


  function InitTimer(int Reason) {
    mForcedDisconnectReason = Reason;                                           //0000 : 0F 01 38 24 B6 1C 00 60 26 B6 1C 
    mForcedDisconnectTimer = 3.00000000;                                        //000B : 0F 01 C0 23 B6 1C 1E 00 00 40 40 
    __OnTick__Delegate = TickHandler;                                           //0016 : 45 01 70 E6 9D 19 44 4B 98 00 00 
    //0F 01 38 24 B6 1C 00 60 26 B6 1C 0F 01 C0 23 B6 1C 1E 00 00 40 40 45 01 70 E6 9D 19 44 4B 98 00 
    //00 04 0B 47 
  }


  function HandleLoginResult(bool aSuccess,int aResult) {
    if (aSuccess == True) {                                                     //0000 : 07 0E 00 F2 2D 00 E8 27 B6 1C 27 16 
      return;                                                                   //000C : 04 0B 
    }
    switch (PacketResult2LoginResult(aResult)) {                                //000E : 05 01 39 3D 1B 2C 9A 00 00 00 B0 2C B6 1C 16 
      case 1 :                                                                  //001D : 0A 84 00 24 01 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Login_failed.Text,Class'SBGuiStrings'.default.Wrong_client_version.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//0022 : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 59 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        break;                                                                  //0081 : 06 FE 02 
      case 2 :                                                                  //0084 : 0A 89 00 24 02 
      case 3 :                                                                  //0089 : 0A F0 00 24 03 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Login_failed.Text,Class'SBGuiStrings'.default.User_name_or_password_incorrect.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//008E : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 58 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        break;                                                                  //00ED : 06 FE 02 
      case 4 :                                                                  //00F0 : 0A F5 00 24 04 
      case 5 :                                                                  //00F5 : 0A 5C 01 24 05 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Login_failed.Text,Class'SBGuiStrings'.default.Error_during_authentication.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//00FA : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 BC 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        break;                                                                  //0159 : 06 FE 02 
      case 6 :                                                                  //015C : 0A C3 01 24 06 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Login_failed.Text,Class'SBGuiStrings'.default.Failed_to_connect.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//0161 : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 BB 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        break;                                                                  //01C0 : 06 FE 02 
      case 8 :                                                                  //01C3 : 0A 2A 02 24 08 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Login_failed.Text,Class'SBGuiStrings'.default.This_account_has_been_banned.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//01C8 : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 B7 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        break;                                                                  //0227 : 06 FE 02 
      case 9 :                                                                  //022A : 0A 91 02 24 09 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Login_failed.Text,Class'SBGuiStrings'.default.This_account_is_temporarily_suspended_Contact_support.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//022F : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 B7 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        break;                                                                  //028E : 06 FE 02 
      case 10 :                                                                 //0291 : 0A F8 02 24 0A 
        mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Login_failed.Text,Class'SBGuiStrings'.default.This_account_is_waiting_for_email_confirmation.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,3,self);//0296 : 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 B7 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
        break;                                                                  //02F5 : 06 FE 02 
      default:                                                                  //02F8 : 0A FF FF 
        break;                                                                  //02FB : 06 FE 02 
    }
    //07 0E 00 F2 2D 00 E8 27 B6 1C 27 16 04 0B 05 01 39 3D 1B 2C 9A 00 00 00 B0 2C B6 1C 16 0A 84 00 
    //24 01 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 
    //0C 02 68 59 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 
    //16 06 FE 02 0A 89 00 24 02 0A F0 00 24 03 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 
    //5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 58 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 
    //68 D7 00 02 00 04 2C 20 16 2C 03 17 16 06 FE 02 0A F5 00 24 04 0A 5C 01 24 05 19 01 48 0C 9D 19 
    //56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 BC 98 19 9E 12 
    //20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 06 FE 02 0A C3 01 24 
    //06 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 20 BB 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 
    //06 FE 02 0A 2A 02 24 08 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 
    //67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 00 B7 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 
    //2C 20 16 2C 03 17 16 06 FE 02 0A 91 02 24 09 19 01 48 0C 9D 19 56 00 04 1B 1C 98 00 00 1F 47 55 
    //49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 CF 98 19 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 B7 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 
    //00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 06 FE 02 0A F8 02 24 0A 19 01 48 0C 9D 19 56 00 04 1B 
    //1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 C0 CF 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 B7 2F 16 9E 12 20 00 68 D7 
    //00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 03 17 16 06 FE 02 0A FF FF 06 FE 02 04 0B 
    //47 
  }


  function OnUpdate(optional int intParam,optional Object objParam,optional string stringParam,optional int intParam2) {
    switch (intParam) {                                                         //0000 : 05 04 00 D8 2D B6 1C 
      case 100 :                                                                //0007 : 0A 0A 02 2C 64 
        switch (intParam2) {                                                    //000C : 05 04 00 D0 33 B6 1C 
          case 2 :                                                              //0013 : 0A 90 00 2C 02 
            InitTimer(100 + intParam2);                                         //0018 : 1B B4 98 00 00 92 2C 64 00 D0 33 B6 1C 16 16 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Log_out.Text,Class'SBGuiStrings'.default.You_will_be_logged_out.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,100 + intParam2,self);//0027 : 19 01 48 0C 9D 19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 D4 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 BF 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C 64 00 D0 33 B6 1C 16 17 16 
            break;                                                              //008D : 06 07 02 
          case 3 :                                                              //0090 : 0A 95 00 2C 03 
          case 4 :                                                              //0095 : 0A 9A 00 2C 04 
          case 5 :                                                              //009A : 0A 9F 00 2C 05 
          case 6 :                                                              //009F : 0A 0D 01 2C 06 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Log_out.Text,Class'SBGuiStrings'.default.Error_during_connect.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,100 + intParam2,self);//00A4 : 19 01 48 0C 9D 19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 D4 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 BA 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C 64 00 D0 33 B6 1C 16 17 16 
            break;                                                              //010A : 06 07 02 
          case 7 :                                                              //010D : 0A 96 01 2C 07 
            InitTimer(100 + intParam2);                                         //0112 : 1B B4 98 00 00 92 2C 64 00 D0 33 B6 1C 16 16 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Log_out.Text,stringParam @ " "
              @ Class'SBGuiStrings'.default.You_will_be_logged_out.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,100 + intParam2,self);//0121 : 19 01 48 0C 9D 19 69 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 D4 98 19 A8 A8 00 48 34 B6 1C 1F 20 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 BF 98 19 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C 64 00 D0 33 B6 1C 16 17 16 
            break;                                                              //0193 : 06 07 02 
          case 8 :                                                              //0196 : 0A 04 02 2C 08 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Log_out.Text,Class'SBGuiStrings'.default.Error_during_connect.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,100 + intParam2,self);//019B : 19 01 48 0C 9D 19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 D4 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 BA 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C 64 00 D0 33 B6 1C 16 17 16 
            break;                                                              //0201 : 06 07 02 
          default:                                                              //0204 : 0A FF FF 
        }
        break;                                                                  //0207 : 06 DE 03 
      case 200 :                                                                //020A : 0A EE 02 2C C8 
        switch (intParam2) {                                                    //020F : 05 04 00 D0 33 B6 1C 
          case 1 :                                                              //0216 : 0A 1A 02 26 
          case 2 :                                                              //021A : 0A 88 02 2C 02 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.System_Message.Text,Class'SBGuiStrings'.default.You_have_been_disconnected_from_the_game_server.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,200 + intParam2,self);//021F : 19 01 48 0C 9D 19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 B6 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C C8 00 D0 33 B6 1C 16 17 16 
            break;                                                              //0285 : 06 EB 02 
          case 3 :                                                              //0288 : 0A E8 02 2C 03 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.System_Message.Text,stringParam,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,200 + intParam2,self);//028D : 19 01 48 0C 9D 19 4F 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 00 48 34 B6 1C 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C C8 00 D0 33 B6 1C 16 17 16 
            break;                                                              //02E5 : 06 EB 02 
          default:                                                              //02E8 : 0A FF FF 
        }
        break;                                                                  //02EB : 06 DE 03 
      case 300 :                                                                //02EE : 0A DB 03 1D 2C 01 00 00 
        switch (intParam2) {                                                    //02F6 : 05 04 00 D0 33 B6 1C 
          case 1 :                                                              //02FD : 0A 01 03 26 
          case 2 :                                                              //0301 : 0A 72 03 2C 02 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.System_Message.Text,Class'SBGuiStrings'.default.You_have_been_disconnected_from_the_login_server.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,300 + intParam2,self);//0306 : 19 01 48 0C 9D 19 60 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 B6 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 1D 2C 01 00 00 00 D0 33 B6 1C 16 17 16 
            break;                                                              //036F : 06 D8 03 
          case 3 :                                                              //0372 : 0A D5 03 2C 03 
            mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.System_Message.Text,stringParam,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,300 + intParam2,self);//0377 : 19 01 48 0C 9D 19 52 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 00 48 34 B6 1C 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 1D 2C 01 00 00 00 D0 33 B6 1C 16 17 16 
            break;                                                              //03D2 : 06 D8 03 
          default:                                                              //03D5 : 0A FF FF 
        }
        break;                                                                  //03D8 : 06 DE 03 
      default:                                                                  //03DB : 0A FF FF 
      }
    }
    //05 04 00 D8 2D B6 1C 0A 0A 02 2C 64 05 04 00 D0 33 B6 1C 0A 90 00 2C 02 1B B4 98 00 00 92 2C 64 
    //00 D0 33 B6 1C 16 16 19 01 48 0C 9D 19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 
    //65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 D4 98 19 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 D0 BF 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 
    //20 16 92 2C 64 00 D0 33 B6 1C 16 17 16 06 07 02 0A 95 00 2C 03 0A 9A 00 2C 04 0A 9F 00 2C 05 0A 
    //0D 01 2C 06 19 01 48 0C 9D 19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 
    //78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 D4 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 A8 BA 98 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 
    //2C 64 00 D0 33 B6 1C 16 17 16 06 07 02 0A 96 01 2C 07 1B B4 98 00 00 92 2C 64 00 D0 33 B6 1C 16 
    //16 19 01 48 0C 9D 19 69 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 D4 98 19 A8 A8 00 48 34 B6 1C 1F 20 00 16 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 BF 98 19 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 
    //D7 00 02 00 04 2C 20 16 92 2C 64 00 D0 33 B6 1C 16 17 16 06 07 02 0A 04 02 2C 08 19 01 48 0C 9D 
    //19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 E8 D4 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 BA 98 19 9E 
    //12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C 64 00 D0 33 B6 1C 16 17 
    //16 06 07 02 0A FF FF 06 DE 03 0A EE 02 2C C8 05 04 00 D0 33 B6 1C 0A 1A 02 26 0A 88 02 2C 02 19 
    //01 48 0C 9D 19 5D 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 
    //B6 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C C8 00 D0 33 
    //B6 1C 16 17 16 06 EB 02 0A E8 02 2C 03 19 01 48 0C 9D 19 4F 00 04 1B 1C 98 00 00 1F 47 55 49 5F 
    //4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 00 48 
    //34 B6 1C 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 92 2C C8 00 D0 33 
    //B6 1C 16 17 16 06 EB 02 0A FF FF 06 DE 03 0A DB 03 1D 2C 01 00 00 05 04 00 D0 33 B6 1C 0A 01 03 
    //26 0A 72 03 2C 02 19 01 48 0C 9D 19 60 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 
    //42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 10 B6 2F 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 
    //16 92 1D 2C 01 00 00 00 D0 33 B6 1C 16 17 16 06 D8 03 0A D5 03 2C 03 19 01 48 0C 9D 19 52 00 04 
    //1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 00 EC 96 19 00 48 34 B6 1C 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 
    //04 2C 20 16 92 1D 2C 01 00 00 00 D0 33 B6 1C 16 17 16 06 D8 03 0A FF FF 06 DE 03 0A FF FF 04 0B 
    //47 
  }


  event ResolutionChanged(int ResX,int ResY) {
    if (ResX > 0 && ResY > 0) {                                                 //0000 : 07 68 00 82 97 00 E8 35 B6 1C 25 16 18 09 00 97 00 60 36 B6 1C 25 16 16 
      mLeft = mDesktop.GetScreenWidth() / 2 - mWidth / 2;                       //0018 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 
      mTop = mDesktop.GetScreenHeight() / 2 - mHeight / 2;                      //0040 : 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 
    }
    //07 68 00 82 97 00 E8 35 B6 1C 25 16 18 09 00 97 00 60 36 B6 1C 25 16 16 0F 01 08 86 31 16 AF AC 
    //19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 
    //0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 
    //31 16 39 3F 2C 02 16 16 04 0B 47 
  }


  native function int ForcedLogout2PacketLogout(int Reason);


  native function int PacketResult2LoginResult(int packetResult);


  native function string FormatTimestamp(int TimeStamp);


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 68 3C B6 1C 16 
    mLoginName.SetText(mLastUserName);                                          //000B : 19 01 30 18 B6 1C 0B 00 00 1B 13 98 00 00 01 A8 18 B6 1C 16 
    mLoginPwd.SetText("");                                                      //001F : 19 01 20 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
    mRememberButton.SetChecked(mRememberUserName);                              //0030 : 19 01 B8 20 B6 1C 0C 00 00 1B 40 97 00 00 2D 01 40 20 B6 1C 16 
    mErrorLabel.SetText("");                                                    //0045 : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
    if (Len(mLastUserName) == 0) {                                              //0056 : 07 75 00 9A 7D 01 A8 18 B6 1C 16 25 16 
      mLoginName.SetFocus();                                                    //0063 : 19 01 30 18 B6 1C 06 00 00 1B 3A 2D 00 00 16 
    } else {                                                                    //0072 : 06 84 00 
      mLoginPwd.SetFocus();                                                     //0075 : 19 01 20 19 B6 1C 06 00 00 1B 3A 2D 00 00 16 
    }
    EnableInteractiveComponents(True);                                          //0084 : 1B 7F 98 00 00 27 16 
    //1C 20 7A 9E 19 00 68 3C B6 1C 16 19 01 30 18 B6 1C 0B 00 00 1B 13 98 00 00 01 A8 18 B6 1C 16 19 
    //01 20 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 19 01 B8 20 B6 1C 0C 00 00 1B 40 97 00 00 2D 01 
    //40 20 B6 1C 16 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 07 75 00 9A 7D 01 A8 18 B6 1C 
    //16 25 16 19 01 30 18 B6 1C 06 00 00 1B 3A 2D 00 00 16 06 84 00 19 01 20 19 B6 1C 06 00 00 1B 3A 
    //2D 00 00 16 1B 7F 98 00 00 27 16 04 0B 47 
  }


  event Initialize() {
    local float cWidth;
    local float cHeight;
    local Color DefaultColor;
    DefaultColor.R = 224;                                                       //0000 : 0F 36 D0 90 6A 0F 00 A0 47 B6 1C 24 E0 
    DefaultColor.G = 218;                                                       //000D : 0F 36 58 90 6A 0F 00 A0 47 B6 1C 24 DA 
    DefaultColor.B = 182;                                                       //001A : 0F 36 E0 8F 6A 0F 00 A0 47 B6 1C 24 B6 
    DefaultColor.A = 255.00000000;                                              //0027 : 0F 36 48 91 6A 0F 00 A0 47 B6 1C 39 43 1E 00 00 7F 43 
    SetStdBackground(Class'GUI_BaseDesktop'.4);                                 //0039 : 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 04 16 
    mWidth = 401.00000000;                                                      //004A : 0F 01 60 87 31 16 1E 00 80 C8 43 
    mHeight = 220.00000000;                                                     //0055 : 0F 01 40 88 31 16 1E 00 00 5C 43 
    mLeft = mDesktop.GetScreenWidth() / 2 - mWidth / 2;                         //0060 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 
    mTop = mDesktop.GetScreenHeight() / 2 - mHeight / 2;                        //0088 : 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 
    Super.Initialize();                                                         //00B0 : 1C 28 9E 9E 19 16 
    cWidth = GetClientWidth();                                                  //00B6 : 0F 00 E0 3C B6 1C 1B 17 98 00 00 16 
    cHeight = GetClientHeight();                                                //00C2 : 0F 00 18 48 B6 1C 1B 1F 98 00 00 16 
    mMainPage = CreatePage("GUI_Page",0,0,6,21,383,101);                        //00CE : 0F 01 E8 0E B6 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 7F 01 00 00 2C 65 16 
    mMainPage.SetStdBackground(7);                                              //00F1 : 19 01 E8 0E B6 1C 08 00 00 1B 22 98 00 00 2C 07 16 
    mLoginNameLabel = mMainPage.CreateLabel("GUI_Label",0,4096 | 2048,9,13,94,18);//0102 : 0F 01 90 48 B6 1C 19 01 E8 0E B6 1C 26 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 10 00 00 1D 00 08 00 00 16 2C 09 2C 0D 2C 5E 2C 12 16 
    mLoginNameLabel.SetText(Class'SBGuiStrings'.default.Username.Text
      $ ":");//0137 : 19 01 90 48 B6 1C 1E 00 00 1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 41 98 19 1F 3A 00 16 16 
    mLoginNameLabel.SetColor(176,170,188);                                      //015E : 19 01 90 48 B6 1C 0C 00 00 1B 19 98 00 00 2C B0 2C AA 2C BC 16 
    mLoginName = mMainPage.CreateEditBox("GUI_EditBox",Class'GUI_BaseDesktop'.4194304,0,93,8,278,28);//0173 : 0F 01 30 18 B6 1C 19 01 E8 0E B6 1C 2D 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 25 2C 5D 2C 08 1D 16 01 00 00 2C 1C 16 
    mLoginName.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");    //01AF : 19 01 30 18 B6 1C 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mLoginName.SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);         //01E9 : 19 01 30 18 B6 1C 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mLoginName.mTabIndex = 1;                                                   //020C : 0F 19 01 30 18 B6 1C 05 00 04 01 E0 8F 31 16 26 
    mLoginName.SetColor(255.00000000,255.00000000,255.00000000);                //021C : 19 01 30 18 B6 1C 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mLoginPwdLabel = mMainPage.CreateLabel("GUI_Label",0,4096 | 2048,9,44,94,18);//023A : 0F 01 08 49 B6 1C 19 01 E8 0E B6 1C 26 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 10 00 00 1D 00 08 00 00 16 2C 09 2C 2C 2C 5E 2C 12 16 
    mLoginPwdLabel.SetText(Class'SBGuiStrings'.default.Password.Text
      $ ":");//026F : 19 01 08 49 B6 1C 1E 00 00 1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 41 98 19 1F 3A 00 16 16 
    mLoginPwdLabel.SetColor(176,170,188);                                       //0296 : 19 01 08 49 B6 1C 0C 00 00 1B 19 98 00 00 2C B0 2C AA 2C BC 16 
    mLoginPwd = mMainPage.CreateEditBox("GUI_EditBox",Class'GUI_BaseDesktop'.768 | Class'GUI_BaseDesktop'.4194304,Class'GUI_BaseDesktop'.8192,93,39,278,28);//02AB : 0F 01 20 19 B6 1C 19 01 E8 0E B6 1C 4A 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 9E 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 16 12 20 00 68 D7 00 05 00 04 1D 00 20 00 00 2C 5D 2C 27 1D 16 01 00 00 2C 1C 16 
    mLoginPwd.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");     //0304 : 19 01 20 19 B6 1C 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mLoginPwd.__OnKeyEvent__Delegate = HandleKeyEvent;                          //033E : 45 19 01 20 19 B6 1C 05 00 08 01 30 EA 9D 19 44 C9 96 00 00 
    mLoginPwd.SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);          //0352 : 19 01 20 19 B6 1C 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mLoginPwd.mTabIndex = 2;                                                    //0375 : 0F 19 01 20 19 B6 1C 05 00 04 01 E0 8F 31 16 2C 02 
    mLoginPwd.SetColor(255.00000000,255.00000000,255.00000000);                 //0386 : 19 01 20 19 B6 1C 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mRememberButton = mMainPage.CreateButton("GUI_Button",4194304,4,8,70);      //03A4 : 0F 01 B8 20 B6 1C 19 01 E8 0E B6 1C 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 04 2C 08 2C 46 16 
    mRememberLabel = mMainPage.CreateLabel("GUI_Label",0,4096 | 2048,31,70,127,18);//03D0 : 0F 01 80 49 B6 1C 19 01 E8 0E B6 1C 26 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 10 00 00 1D 00 08 00 00 16 2C 1F 2C 46 2C 7F 2C 12 16 
    mRememberLabel.SetText(Class'SBGuiStrings'.default.Remember_username.Text); //0405 : 19 01 80 49 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 96 2F 16 16 
    mRememberLabel.SetColor(176,170,188);                                       //0427 : 19 01 80 49 B6 1C 0C 00 00 1B 19 98 00 00 2C B0 2C AA 2C BC 16 
    mButtonPage = CreatePage("GUI_Page",0,0,6,128,383,54);                      //043C : 0F 01 60 0F B6 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 80 1D 7F 01 00 00 2C 36 16 
    mButtonPage.SetStdBackground(7);                                            //045F : 19 01 60 0F B6 1C 08 00 00 1B 22 98 00 00 2C 07 16 
    mLoginButton = mButtonPage.CreateButton("GUI_Button",4194304,2,78,12,107,24);//0470 : 0F 01 B0 0B B6 1C 19 01 60 0F B6 1C 21 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C 4E 2C 0C 2C 6B 2C 18 16 
    mLoginButton.mIntTag = 1;                                                   //04A0 : 0F 19 01 B0 0B B6 1C 05 00 04 01 58 90 31 16 26 
    mLoginButton.__OnClick__Delegate = ClickHandler;                            //04B0 : 45 19 01 B0 0B B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mLoginButton.SetText(Class'SBGuiStrings'.default.Login.Text);               //04C4 : 19 01 B0 0B B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 8D 97 19 16 
    mLoginButton.SetTextBorder(0.00000000,3.00000000);                          //04E6 : 19 01 B0 0B B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mLoginButton.mTabIndex = 3;                                                 //04FF : 0F 19 01 B0 0B B6 1C 05 00 04 01 E0 8F 31 16 2C 03 
    mQuitButton = mButtonPage.CreateButton("GUI_Button",4194304,2,191,12,107,24);//0510 : 0F 01 10 1A B6 1C 19 01 60 0F B6 1C 21 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C BF 2C 0C 2C 6B 2C 18 16 
    mQuitButton.mIntTag = 0;                                                    //0540 : 0F 19 01 10 1A B6 1C 05 00 04 01 58 90 31 16 25 
    mQuitButton.__OnClick__Delegate = ClickHandler;                             //0550 : 45 19 01 10 1A B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mQuitButton.SetText(Class'SBGuiStrings'.default.Quit_Game.Text);            //0564 : 19 01 10 1A B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 A7 98 19 16 
    mQuitButton.SetTextBorder(0.00000000,3.00000000);                           //0586 : 19 01 10 1A B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mQuitButton.mTabIndex = 4;                                                  //059F : 0F 19 01 10 1A B6 1C 05 00 04 01 E0 8F 31 16 2C 04 
    mStatusPage = CreatePage("GUI_Page",0,0,6,21,383,101);                      //05B0 : 0F 01 D8 0F B6 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 7F 01 00 00 2C 65 16 
    mStatusPage.SetStdBackground(7);                                            //05D3 : 19 01 D8 0F B6 1C 08 00 00 1B 22 98 00 00 2C 07 16 
    mErrorLabel = mStatusPage.CreateLabel("GUI_Label",524288,4096 | 2048 | 512,0,0,377,95);//05E4 : 0F 01 98 19 B6 1C 19 01 D8 0F B6 1C 32 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 9E 1D 00 10 00 00 1D 00 08 00 00 16 1D 00 02 00 00 16 25 25 1D 79 01 00 00 2C 5F 16 
    mErrorLabel.SetText("");                                                    //0625 : 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
    mCancelPage = CreatePage("GUI_Page",0,0,6,128,383,54);                      //0636 : 0F 01 50 10 B6 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 80 1D 7F 01 00 00 2C 36 16 
    mCancelPage.SetStdBackground(7);                                            //0659 : 19 01 50 10 B6 1C 08 00 00 1B 22 98 00 00 2C 07 16 
    mCancelButton = mCancelPage.CreateButton("GUI_Button",4194304,2,129,12,107,24);//066A : 0F 01 F8 49 B6 1C 19 01 50 10 B6 1C 21 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C 81 2C 0C 2C 6B 2C 18 16 
    mCancelButton.mIntTag = 2;                                                  //069A : 0F 19 01 F8 49 B6 1C 05 00 04 01 58 90 31 16 2C 02 
    mCancelButton.__OnClick__Delegate = ClickHandler;                           //06AB : 45 19 01 F8 49 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mCancelButton.SetText(Class'SBGuiStrings'.default.Cancel.Text);             //06BF : 19 01 F8 49 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 
    mCancelButton.SetTextBorder(0.00000000,3.00000000);                         //06E1 : 19 01 F8 49 B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mCancelButton.mTabIndex = 4;                                                //06FA : 0F 19 01 F8 49 B6 1C 05 00 04 01 E0 8F 31 16 2C 04 
    mDesktop.ViewportOwner.Actor.Level.GetEnvironmentManager().SetDefaultHUDColor(DefaultColor);//070B : 19 19 19 19 19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 06 00 04 1B D4 12 00 00 16 0B 00 00 1C 98 9A 7C 0F 00 A0 47 B6 1C 16 
    __OnMBClick__Delegate = MBClickHandler;                                     //0744 : 45 01 B8 E9 9D 19 44 2D 98 00 00 
    self.SetFocus();                                                            //074F : 19 17 06 00 00 1B 3A 2D 00 00 16 
    //0F 36 D0 90 6A 0F 00 A0 47 B6 1C 24 E0 0F 36 58 90 6A 0F 00 A0 47 B6 1C 24 DA 0F 36 E0 8F 6A 0F 
    //00 A0 47 B6 1C 24 B6 0F 36 48 91 6A 0F 00 A0 47 B6 1C 39 43 1E 00 00 7F 43 1B 22 98 00 00 12 20 
    //00 68 D7 00 02 00 04 2C 04 16 0F 01 60 87 31 16 1E 00 80 C8 43 0F 01 40 88 31 16 1E 00 00 5C 43 
    //0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 
    //31 16 39 3F 2C 02 16 16 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 
    //3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 1C 28 9E 9E 19 16 0F 00 E0 3C B6 1C 1B 17 98 00 
    //00 16 0F 00 18 48 B6 1C 1B 1F 98 00 00 16 0F 01 E8 0E B6 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 
    //67 65 00 25 25 2C 06 2C 15 1D 7F 01 00 00 2C 65 16 19 01 E8 0E B6 1C 08 00 00 1B 22 98 00 00 2C 
    //07 16 0F 01 90 48 B6 1C 19 01 E8 0E B6 1C 26 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 
    //00 25 9E 1D 00 10 00 00 1D 00 08 00 00 16 2C 09 2C 0D 2C 5E 2C 12 16 19 01 90 48 B6 1C 1E 00 00 
    //1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 41 98 19 1F 3A 00 16 16 19 01 
    //90 48 B6 1C 0C 00 00 1B 19 98 00 00 2C B0 2C AA 2C BC 16 0F 01 30 18 B6 1C 19 01 E8 0E B6 1C 2D 
    //00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 12 20 00 68 D7 00 05 00 04 1D 00 00 
    //40 00 25 2C 5D 2C 08 1D 16 01 00 00 2C 1C 16 19 01 30 18 B6 1C 31 00 00 1B 1A 98 00 00 1F 74 65 
    //78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 
    //5F 53 74 79 6C 65 73 00 16 19 01 30 18 B6 1C 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 
    //00 1E 00 00 80 3F 1E 00 00 00 00 16 0F 19 01 30 18 B6 1C 05 00 04 01 E0 8F 31 16 26 19 01 30 18 
    //B6 1C 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 0F 01 08 49 B6 1C 
    //19 01 E8 0E B6 1C 26 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 10 00 00 
    //1D 00 08 00 00 16 2C 09 2C 2C 2C 5E 2C 12 16 19 01 08 49 B6 1C 1E 00 00 1B 13 98 00 00 70 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 41 98 19 1F 3A 00 16 16 19 01 08 49 B6 1C 0C 00 00 1B 
    //19 98 00 00 2C B0 2C AA 2C BC 16 0F 01 20 19 B6 1C 19 01 E8 0E B6 1C 4A 00 04 1B 60 98 00 00 1F 
    //47 55 49 5F 45 64 69 74 42 6F 78 00 9E 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 12 20 00 68 D7 
    //00 05 00 04 1D 00 00 40 00 16 12 20 00 68 D7 00 05 00 04 1D 00 20 00 00 2C 5D 2C 27 1D 16 01 00 
    //00 2C 1C 16 19 01 20 19 B6 1C 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 
    //47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 45 19 
    //01 20 19 B6 1C 05 00 08 01 30 EA 9D 19 44 C9 96 00 00 19 01 20 19 B6 1C 1A 00 00 1B 24 98 00 00 
    //1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 0F 19 01 20 19 B6 1C 05 00 04 01 
    //E0 8F 31 16 2C 02 19 01 20 19 B6 1C 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 
    //00 7F 43 16 0F 01 B8 20 B6 1C 19 01 E8 0E B6 1C 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 
    //74 6F 6E 00 1D 00 00 40 00 2C 04 2C 08 2C 46 16 0F 01 80 49 B6 1C 19 01 E8 0E B6 1C 26 00 04 1B 
    //20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 10 00 00 1D 00 08 00 00 16 2C 1F 2C 46 
    //2C 7F 2C 12 16 19 01 80 49 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 
    //0C 02 28 96 2F 16 16 19 01 80 49 B6 1C 0C 00 00 1B 19 98 00 00 2C B0 2C AA 2C BC 16 0F 01 60 0F 
    //B6 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 80 1D 7F 01 00 00 2C 36 16 19 
    //01 60 0F B6 1C 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 B0 0B B6 1C 19 01 60 0F B6 1C 21 00 04 1B 
    //18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C 4E 2C 0C 2C 6B 2C 18 16 
    //0F 19 01 B0 0B B6 1C 05 00 04 01 58 90 31 16 26 45 19 01 B0 0B B6 1C 05 00 08 01 98 EB 9D 19 44 
    //21 98 00 00 19 01 B0 0B B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 58 8D 97 19 16 19 01 B0 0B B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 0F 
    //19 01 B0 0B B6 1C 05 00 04 01 E0 8F 31 16 2C 03 0F 01 10 1A B6 1C 19 01 60 0F B6 1C 21 00 04 1B 
    //18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C BF 2C 0C 2C 6B 2C 18 16 
    //0F 19 01 10 1A B6 1C 05 00 04 01 58 90 31 16 25 45 19 01 10 1A B6 1C 05 00 08 01 98 EB 9D 19 44 
    //21 98 00 00 19 01 10 1A B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 38 A7 98 19 16 19 01 10 1A B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 0F 
    //19 01 10 1A B6 1C 05 00 04 01 E0 8F 31 16 2C 04 0F 01 D8 0F B6 1C 1B 16 98 00 00 1F 47 55 49 5F 
    //50 61 67 65 00 25 25 2C 06 2C 15 1D 7F 01 00 00 2C 65 16 19 01 D8 0F B6 1C 08 00 00 1B 22 98 00 
    //00 2C 07 16 0F 01 98 19 B6 1C 19 01 D8 0F B6 1C 32 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 
    //65 6C 00 1D 00 00 08 00 9E 9E 1D 00 10 00 00 1D 00 08 00 00 16 1D 00 02 00 00 16 25 25 1D 79 01 
    //00 00 2C 5F 16 19 01 98 19 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 0F 01 50 10 B6 1C 1B 16 98 00 
    //00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 80 1D 7F 01 00 00 2C 36 16 19 01 50 10 B6 1C 08 
    //00 00 1B 22 98 00 00 2C 07 16 0F 01 F8 49 B6 1C 19 01 50 10 B6 1C 21 00 04 1B 18 98 00 00 1F 47 
    //55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C 81 2C 0C 2C 6B 2C 18 16 0F 19 01 F8 49 B6 
    //1C 05 00 04 01 58 90 31 16 2C 02 45 19 01 F8 49 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 19 
    //01 F8 49 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 
    //16 19 01 F8 49 B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 0F 19 01 F8 49 B6 
    //1C 05 00 04 01 E0 8F 31 16 2C 04 19 19 19 19 19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 
    //01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 06 00 04 1B D4 12 00 00 16 0B 00 00 1C 98 9A 7C 0F 00 A0 
    //47 B6 1C 16 45 01 B8 E9 9D 19 44 2D 98 00 00 19 17 06 00 00 1B 3A 2D 00 00 16 04 0B 47 
  }



