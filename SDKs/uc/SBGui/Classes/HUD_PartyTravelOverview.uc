//==============================================================================
//  HUD_PartyTravelOverview
//==============================================================================

class HUD_PartyTravelOverview extends GUI_Window
    dependsOn(GUI_Label,Game_PlayerController,Game_PlayerTeams)
    Transient
    Config(User)
  ;

  var private GUI_Page mMainPage;
  var private GUI_Label mTimeoutLabel;
  var private GUI_Page mButtonPage;
  var private GUI_Button mCancelButton;
  var private float mTimeout;


  function TickHandler(float DeltaTime) {
    local string messageStr;
    if (mTimeout > 0.00000000) {                                                //0000 : 07 27 01 B1 01 F0 C6 2B 26 1E 00 00 00 00 16 
      mTimeout -= DeltaTime;                                                    //000F : B9 01 F0 C6 2B 26 00 38 2B 34 26 16 
      if (mTimeout > 0.99000001) {                                              //001B : 07 F5 00 B1 01 F0 C6 2B 26 1E A4 70 7D 3F 16 
        messageStr = Class'SBGuiStrings'.default.Departing_in_DEPART_TIME___.Text;//002A : 0F 00 98 ED 05 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 3A 99 19 
        if (mTimeout % 60.00000000 < 10) {                                      //0043 : 07 9D 00 B0 AD 01 F0 C6 2B 26 1E 00 00 70 42 16 39 3F 2C 0A 16 
          static.ReplaceText(messageStr,"[DEPART_TIME]",string(mTimeout / 60.00000000) $ ":0"
            $ string(mTimeout % 60.00000000));//0058 : 1C 30 80 69 0F 00 98 ED 05 1B 1F 5B 44 45 50 41 52 54 5F 54 49 4D 45 5D 00 70 70 39 53 39 44 AC 01 F0 C6 2B 26 1E 00 00 70 42 16 1F 3A 30 00 16 39 53 39 44 AD 01 F0 C6 2B 26 1E 00 00 70 42 16 16 16 
        } else {                                                                //009A : 06 DE 00 
          static.ReplaceText(messageStr,"[DEPART_TIME]",string(mTimeout / 60.00000000) $ ":"
            $ string(mTimeout % 60.00000000));//009D : 1C 30 80 69 0F 00 98 ED 05 1B 1F 5B 44 45 50 41 52 54 5F 54 49 4D 45 5D 00 70 70 39 53 39 44 AC 01 F0 C6 2B 26 1E 00 00 70 42 16 1F 3A 00 16 39 53 39 44 AD 01 F0 C6 2B 26 1E 00 00 70 42 16 16 16 
        }
        mTimeoutLabel.SetText(messageStr);                                      //00DE : 19 01 90 E7 05 1B 0B 00 00 1B 13 98 00 00 00 98 ED 05 1B 16 
      } else {                                                                  //00F2 : 06 27 01 
        mTimeoutLabel.SetText(Class'SBGuiStrings'.default.Departing___.Text);   //00F5 : 19 01 90 E7 05 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 38 99 19 16 
        mCancelButton.SetEnabled(False);                                        //0117 : 19 01 00 33 04 1B 07 00 00 1B 5F 32 00 00 28 16 
      }
    }
    //07 27 01 B1 01 F0 C6 2B 26 1E 00 00 00 00 16 B9 01 F0 C6 2B 26 00 38 2B 34 26 16 07 F5 00 B1 01 
    //F0 C6 2B 26 1E A4 70 7D 3F 16 0F 00 98 ED 05 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 
    //3A 99 19 07 9D 00 B0 AD 01 F0 C6 2B 26 1E 00 00 70 42 16 39 3F 2C 0A 16 1C 30 80 69 0F 00 98 ED 
    //05 1B 1F 5B 44 45 50 41 52 54 5F 54 49 4D 45 5D 00 70 70 39 53 39 44 AC 01 F0 C6 2B 26 1E 00 00 
    //70 42 16 1F 3A 30 00 16 39 53 39 44 AD 01 F0 C6 2B 26 1E 00 00 70 42 16 16 16 06 DE 00 1C 30 80 
    //69 0F 00 98 ED 05 1B 1F 5B 44 45 50 41 52 54 5F 54 49 4D 45 5D 00 70 70 39 53 39 44 AC 01 F0 C6 
    //2B 26 1E 00 00 70 42 16 1F 3A 00 16 39 53 39 44 AD 01 F0 C6 2B 26 1E 00 00 70 42 16 16 16 19 01 
    //90 E7 05 1B 0B 00 00 1B 13 98 00 00 00 98 ED 05 1B 16 06 27 01 19 01 90 E7 05 1B 19 00 00 1B 13 
    //98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 38 99 19 16 19 01 00 33 04 1B 07 00 00 
    //1B 5F 32 00 00 28 16 04 0B 47 
  }


  function bool CancelClickHandler(GUI_Component aButton) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 B0 37 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0011 : 07 34 00 77 00 B0 37 07 1B 2A 16 
      PlayerController.GroupingTeams.cl2sv_CancelPartyTravel_CallStub();        //001C : 19 19 00 B0 37 07 1B 05 00 04 01 48 C2 18 11 06 00 00 1B 20 11 00 00 16 
    }
    mDesktop.ShowStdWindow(82,2);                                               //0034 : 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 52 2C 02 16 
    return True;                                                                //0047 : 04 27 
    //0F 00 B0 37 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 34 00 77 00 B0 37 07 1B 2A 16 19 19 00 B0 
    //37 07 1B 05 00 04 01 48 C2 18 11 06 00 00 1B 20 11 00 00 16 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 
    //00 00 2C 52 2C 02 16 04 27 04 0B 47 
  }


  function WindowClosedHandler(GUI_Window aWindow) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 98 35 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0011 : 07 34 00 77 00 98 35 07 1B 2A 16 
      PlayerController.GroupingTeams.cl2sv_CancelPartyTravel_CallStub();        //001C : 19 19 00 98 35 07 1B 05 00 04 01 48 C2 18 11 06 00 00 1B 20 11 00 00 16 
    }
    //0F 00 98 35 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 34 00 77 00 98 35 07 1B 2A 16 19 19 00 98 
    //35 07 1B 05 00 04 01 48 C2 18 11 06 00 00 1B 20 11 00 00 16 04 0B 47 
  }


  function PartyTravelJoinHandler(int aMember,bool aIsJoining) {
    //04 0B 47 
  }


  function PartyTravelCancelHandler() {
    //04 0B 47 
  }


  event DoShowWindow(int flags) {
    local Game_PlayerController PlayerController;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 68 6A 33 26 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 90 00 9A 00 68 6A 33 26 12 20 00 68 D7 00 01 00 04 26 16 
      PlayerController = Game_PlayerController(GetPlayerController());          //001F : 0F 00 D0 EA 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
      if (PlayerController != None) {                                           //0030 : 07 75 00 77 00 D0 EA 05 1B 2A 16 
        PlayerController.GroupingTeams.__OnPartyTravelCancel__Delegate = PartyTravelCancelHandler;//003B : 45 19 19 00 D0 EA 05 1B 05 00 04 01 48 C2 18 11 05 00 08 01 E8 CF 27 11 44 3C 99 00 00 
        PlayerController.GroupingTeams.__OnPartyTravelJoin__Delegate = PartyTravelJoinHandler;//0058 : 45 19 19 00 D0 EA 05 1B 05 00 04 01 48 C2 18 11 05 00 08 01 28 DA 27 11 44 3A 99 00 00 
      }
      mCancelButton.SetEnabled(True);                                           //0075 : 19 01 00 33 04 1B 07 00 00 1B 5F 32 00 00 27 16 
      mTimeout = 10.00000000;                                                   //0085 : 0F 01 F0 C6 2B 26 1E 00 00 20 41 
    }
    //1C 20 7A 9E 19 00 68 6A 33 26 16 07 90 00 9A 00 68 6A 33 26 12 20 00 68 D7 00 01 00 04 26 16 0F 
    //00 D0 EA 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 75 00 77 00 D0 EA 05 1B 2A 16 45 19 19 00 D0 
    //EA 05 1B 05 00 04 01 48 C2 18 11 05 00 08 01 E8 CF 27 11 44 3C 99 00 00 45 19 19 00 D0 EA 05 1B 
    //05 00 04 01 48 C2 18 11 05 00 08 01 28 DA 27 11 44 3A 99 00 00 19 01 00 33 04 1B 07 00 00 1B 5F 
    //32 00 00 27 16 0F 01 F0 C6 2B 26 1E 00 00 20 41 04 0B 47 
  }


  event OnComponentDestroyed() {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 30 E9 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0011 : 07 56 00 77 00 30 E9 05 1B 2A 16 
      PlayerController.GroupingTeams.__OnPartyTravelCancel__Delegate = None;    //001C : 45 19 19 00 30 E9 05 1B 05 00 04 01 48 C2 18 11 05 00 08 01 E8 CF 27 11 44 00 00 00 00 
      PlayerController.GroupingTeams.__OnPartyTravelJoin__Delegate = None;      //0039 : 45 19 19 00 30 E9 05 1B 05 00 04 01 48 C2 18 11 05 00 08 01 28 DA 27 11 44 00 00 00 00 
    }
    Super.OnComponentDestroyed();                                               //0056 : 1C E0 DA 9D 19 16 
    //0F 00 30 E9 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 56 00 77 00 30 E9 05 1B 2A 16 45 19 19 00 
    //30 E9 05 1B 05 00 04 01 48 C2 18 11 05 00 08 01 E8 CF 27 11 44 00 00 00 00 45 19 19 00 30 E9 05 
    //1B 05 00 04 01 48 C2 18 11 05 00 08 01 28 DA 27 11 44 00 00 00 00 1C E0 DA 9D 19 16 04 0B 47 
  }


  function SetDelegates() {
    __OnTick__Delegate = TickHandler;                                           //0000 : 45 01 70 E6 9D 19 44 4B 98 00 00 
    __OnWindowClosed__Delegate = WindowClosedHandler;                           //000B : 45 01 E0 8C 9E 19 44 B6 9A 00 00 
    //45 01 70 E6 9D 19 44 4B 98 00 00 45 01 E0 8C 9E 19 44 B6 9A 00 00 04 0B 47 
  }


  event Initialize() {
    mWidth = 400.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 C8 43 
    mHeight = 225.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 61 43 
    mLeft = mDesktop.GetScreenWidth() / 2 - mWidth / 2;                         //0016 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 
    mTop = mDesktop.GetScreenHeight() / 2 - mHeight / 2;                        //003E : 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 
    Super.Initialize();                                                         //0066 : 1C 28 9E 9E 19 16 
    mMainPage = CreatePage("GUI_Page",0,0,6,21,382,118);                        //006C : 0F 01 18 E7 05 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 7E 01 00 00 2C 76 16 
    mMainPage.SetStdBackground(7);                                              //008F : 19 01 18 E7 05 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    mTimeoutLabel = mMainPage.CreateLabel("GUI_Label",524288,0,6,6,mMainPage.GetClientWidth(),28);//00A0 : 0F 01 90 E7 05 1B 19 01 18 E7 05 1B 2E 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 2C 06 2C 06 39 44 19 01 18 E7 05 1B 06 00 04 1B 17 98 00 00 16 2C 1C 16 
    mTimeoutLabel.SetText(Class'SBGuiStrings'.default.Departing___.Text);       //00DD : 19 01 90 E7 05 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 38 99 19 16 
    mButtonPage = CreatePage("GUI_Page",0,0,6,145,382,42);                      //00FF : 0F 01 70 34 07 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 91 1D 7E 01 00 00 2C 2A 16 
    mButtonPage.SetStdBackground(7);                                            //0122 : 19 01 70 34 07 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    mCancelButton = mButtonPage.CreateButton("GUI_Button",0,2,135,6,105,24);    //0133 : 0F 01 00 33 04 1B 19 01 70 34 07 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 87 2C 06 2C 69 2C 18 16 
    mCancelButton.SetText(Class'SBGuiStrings'.default.Cancel.Text);             //015F : 19 01 00 33 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 
    mCancelButton.__OnClick__Delegate = CancelClickHandler;                     //0181 : 45 19 01 00 33 04 1B 05 00 08 01 98 EB 9D 19 44 B8 9A 00 00 
    //0F 01 60 87 31 16 1E 00 00 C8 43 0F 01 40 88 31 16 1E 00 00 61 43 0F 01 08 86 31 16 AF AC 19 01 
    //48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 0F 01 
    //80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 
    //39 3F 2C 02 16 16 1C 28 9E 9E 19 16 0F 01 18 E7 05 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 
    //00 25 25 2C 06 2C 15 1D 7E 01 00 00 2C 76 16 19 01 18 E7 05 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    //0F 01 90 E7 05 1B 19 01 18 E7 05 1B 2E 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 
    //00 00 08 00 25 2C 06 2C 06 39 44 19 01 18 E7 05 1B 06 00 04 1B 17 98 00 00 16 2C 1C 16 19 01 90 
    //E7 05 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 38 99 19 16 0F 
    //01 70 34 07 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 91 1D 7E 01 00 00 2C 
    //2A 16 19 01 70 34 07 1B 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 00 33 04 1B 19 01 70 34 07 1B 1D 
    //00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 87 2C 06 2C 69 2C 18 16 19 
    //01 00 33 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 
    //16 45 19 01 00 33 04 1B 05 00 08 01 98 EB 9D 19 44 B8 9A 00 00 04 0B 47 
  }



