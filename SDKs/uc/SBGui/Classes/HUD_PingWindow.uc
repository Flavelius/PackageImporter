//==============================================================================
//  HUD_PingWindow
//==============================================================================

class HUD_PingWindow extends GUI_Window
    dependsOn(Game_PlayerController,GUI_Label)
    Transient
    Config(User)
  ;

  var private GUI_Label mPingLabel;


  event OnComponentDestroyed() {
    Game_PlayerController(GetPlayerController()).__OnPong__Delegate = None;     //0000 : 45 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 08 01 A8 34 1B 11 44 00 00 00 00 
    Super.OnComponentDestroyed();                                               //001A : 1C E0 DA 9D 19 16 
    //45 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 08 01 A8 34 1B 11 44 00 00 00 00 1C E0 DA 9D 19 16 
    //04 0B 47 
  }


  function OnPongHandler(float aPing) {
    mPingLabel.SetText("" $ string(aPing));                                     //0000 : 19 01 00 69 33 26 11 00 00 1B 13 98 00 00 70 1F 00 39 55 00 88 2D 34 26 16 16 
    //19 01 00 69 33 26 11 00 00 1B 13 98 00 00 70 1F 00 39 55 00 88 2D 34 26 16 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 70 40 07 1B 16 
    if (flags == 1) {                                                           //000B : 07 2E 00 9A 00 70 40 07 1B 26 16 
      Game_PlayerController(GetPlayerController()).cl_StartPinging();           //0016 : 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 06 00 00 1B C9 12 00 00 16 
    } else {                                                                    //002B : 06 4F 00 
      if (flags == 2) {                                                         //002E : 07 4F 00 9A 00 70 40 07 1B 2C 02 16 
        Game_PlayerController(GetPlayerController()).cl_StopPinging();          //003A : 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 06 00 00 1B C8 12 00 00 16 
      }
    }
    //1C 20 7A 9E 19 00 70 40 07 1B 16 07 2E 00 9A 00 70 40 07 1B 26 16 19 2E 90 18 5B 01 1B 0E 2F 00 
    //00 16 06 00 00 1B C9 12 00 00 16 06 4F 00 07 4F 00 9A 00 70 40 07 1B 2C 02 16 19 2E 90 18 5B 01 
    //1B 0E 2F 00 00 16 06 00 00 1B C8 12 00 00 16 04 0B 47 
  }


  function SetDelegates() {
    Game_PlayerController(GetPlayerController()).__OnPong__Delegate = OnPongHandler;//0000 : 45 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 08 01 A8 34 1B 11 44 B9 9A 00 00 
    //45 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 08 01 A8 34 1B 11 44 B9 9A 00 00 04 0B 47 
  }


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    mTop = 180.00000000;                                                        //0006 : 0F 01 80 86 31 16 1E 00 00 34 43 
    mWidth = 75.00000000;                                                       //0011 : 0F 01 60 87 31 16 1E 00 00 96 42 
    mHeight = 79.00000000;                                                      //001C : 0F 01 40 88 31 16 1E 00 00 9E 42 
    mPingLabel = CreateLabel("GUI_Label",524288,512 | 2048,6,21,mWidth - 2 * (6 + 3),24);//0027 : 0F 01 00 69 33 26 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 02 00 00 1D 00 08 00 00 16 2C 06 2C 15 39 44 AF 01 60 87 31 16 39 3F 90 2C 02 92 2C 06 2C 03 16 16 16 2C 18 16 
    //1C 28 9E 9E 19 16 0F 01 80 86 31 16 1E 00 00 34 43 0F 01 60 87 31 16 1E 00 00 96 42 0F 01 40 88 
    //31 16 1E 00 00 9E 42 0F 01 00 69 33 26 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 
    //08 00 9E 1D 00 02 00 00 1D 00 08 00 00 16 2C 06 2C 15 39 44 AF 01 60 87 31 16 39 3F 90 2C 02 92 
    //2C 06 2C 03 16 16 16 2C 18 16 04 0B 47 
  }



