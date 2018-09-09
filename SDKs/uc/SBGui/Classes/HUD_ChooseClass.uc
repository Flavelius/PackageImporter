//==============================================================================
//  HUD_ChooseClass
//==============================================================================

class HUD_ChooseClass extends GUI_Window
    dependsOn(Game_PlayerPawn,Game_PlayerStats,GUI_Component,HUD_CharacterStatistics,Game_ShiftableAppearance,Game_CharacterStats,StringReferences,GED_Editor)
    Transient
    Config(User)
  ;

  var private GUI_Button mClass1Button;
  var private GUI_Button mClass2Button;
  var private GUI_Button mClass3Button;
  var private GUI_Button mCancelButton;


  function bool CancelHandler(GUI_Component clickedButton) {
    mDesktop.ShowWindow(mWindowHandle,2);                                       //0000 : 19 01 48 0C 9D 19 0D 00 00 1B 57 2D 00 00 01 E8 77 9E 19 2C 02 16 
    return True;                                                                //0016 : 04 27 
    //19 01 48 0C 9D 19 0D 00 00 1B 57 2D 00 00 01 E8 77 9E 19 2C 02 16 04 27 04 0B 47 
  }


  function bool ClassHandler(GUI_Component clickedButton) {
    local Game_PlayerPawn playerPawn;
    local export editinline Game_PlayerStats playerStats;
    local byte playerClass;
    playerPawn = Game_PlayerPawn(GetPawn());                                    //0000 : 0F 00 E0 07 07 1B 2E F0 47 5B 01 1B 2B 0C 00 00 16 
    if (playerPawn != None) {                                                   //0011 : 07 31 01 77 00 E0 07 07 1B 2A 16 
      playerStats = Game_PlayerStats(playerPawn.CharacterStats);                //001C : 0F 00 68 F5 04 1B 2E 10 A3 5F 01 19 00 E0 07 07 1B 05 00 04 01 08 43 34 0F 
      if (playerStats.mMayChooseClass) {                                        //0035 : 07 31 01 19 00 68 F5 04 1B 06 00 04 2D 01 C8 F3 24 11 
        switch (clickedButton.mIntTag) {                                        //0047 : 05 04 19 00 A0 1B 34 26 05 00 04 01 58 90 31 16 
          case 11 :                                                             //0057 : 0A 67 00 2C 0B 
            playerClass = 4;                                                    //005C : 0F 00 60 4A 8A 19 24 04 
            break;                                                              //0064 : 06 EA 00 
          case 12 :                                                             //0067 : 0A 77 00 2C 0C 
            playerClass = 5;                                                    //006C : 0F 00 60 4A 8A 19 24 05 
            break;                                                              //0074 : 06 EA 00 
          case 13 :                                                             //0077 : 0A 87 00 2C 0D 
            playerClass = 6;                                                    //007C : 0F 00 60 4A 8A 19 24 06 
            break;                                                              //0084 : 06 EA 00 
          case 21 :                                                             //0087 : 0A 97 00 2C 15 
            playerClass = 7;                                                    //008C : 0F 00 60 4A 8A 19 24 07 
            break;                                                              //0094 : 06 EA 00 
          case 22 :                                                             //0097 : 0A A7 00 2C 16 
            playerClass = 8;                                                    //009C : 0F 00 60 4A 8A 19 24 08 
            break;                                                              //00A4 : 06 EA 00 
          case 23 :                                                             //00A7 : 0A B7 00 2C 17 
            playerClass = 9;                                                    //00AC : 0F 00 60 4A 8A 19 24 09 
            break;                                                              //00B4 : 06 EA 00 
          case 31 :                                                             //00B7 : 0A C7 00 2C 1F 
            playerClass = 10;                                                   //00BC : 0F 00 60 4A 8A 19 24 0A 
            break;                                                              //00C4 : 06 EA 00 
          case 32 :                                                             //00C7 : 0A D7 00 2C 20 
            playerClass = 11;                                                   //00CC : 0F 00 60 4A 8A 19 24 0B 
            break;                                                              //00D4 : 06 EA 00 
          case 33 :                                                             //00D7 : 0A E7 00 2C 21 
            playerClass = 12;                                                   //00DC : 0F 00 60 4A 8A 19 24 0C 
            break;                                                              //00E4 : 06 EA 00 
          default:                                                              //00E7 : 0A FF FF 
        }
        if (playerClass != 0) {                                                 //00EA : 07 31 01 9B 39 3A 00 60 4A 8A 19 39 3A 24 00 16 
          playerStats.SetCharacterClass(playerClass);                           //00FA : 19 00 68 F5 04 1B 0B 00 00 1B AE 0C 00 00 00 60 4A 8A 19 16 
          playerStats.cl2sv_SetClass_CallStub(playerClass);                     //010E : 19 00 68 F5 04 1B 0B 00 00 1B D5 18 00 00 00 60 4A 8A 19 16 
          playerStats.cl_ClearMayChooseClass();                                 //0122 : 19 00 68 F5 04 1B 06 00 00 1B CA 18 00 00 16 
        }
      }
    }
    mDesktop.ShowWindow(mWindowHandle,2);                                       //0131 : 19 01 48 0C 9D 19 0D 00 00 1B 57 2D 00 00 01 E8 77 9E 19 2C 02 16 
    mDesktop.ShowStdWindow(38,4);                                               //0147 : 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 26 2C 04 16 
    mDesktop.ShowStdWindow(38,4);                                               //015A : 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 26 2C 04 16 
    HUD_CharacterStatistics(mDesktop.GetStdWindow(38)).Invalidate();            //016D : 19 2E D0 2C 2C 26 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 26 16 06 00 00 1B 1D 98 00 00 16 
    return True;                                                                //018D : 04 27 
    //0F 00 E0 07 07 1B 2E F0 47 5B 01 1B 2B 0C 00 00 16 07 31 01 77 00 E0 07 07 1B 2A 16 0F 00 68 F5 
    //04 1B 2E 10 A3 5F 01 19 00 E0 07 07 1B 05 00 04 01 08 43 34 0F 07 31 01 19 00 68 F5 04 1B 06 00 
    //04 2D 01 C8 F3 24 11 05 04 19 00 A0 1B 34 26 05 00 04 01 58 90 31 16 0A 67 00 2C 0B 0F 00 60 4A 
    //8A 19 24 04 06 EA 00 0A 77 00 2C 0C 0F 00 60 4A 8A 19 24 05 06 EA 00 0A 87 00 2C 0D 0F 00 60 4A 
    //8A 19 24 06 06 EA 00 0A 97 00 2C 15 0F 00 60 4A 8A 19 24 07 06 EA 00 0A A7 00 2C 16 0F 00 60 4A 
    //8A 19 24 08 06 EA 00 0A B7 00 2C 17 0F 00 60 4A 8A 19 24 09 06 EA 00 0A C7 00 2C 1F 0F 00 60 4A 
    //8A 19 24 0A 06 EA 00 0A D7 00 2C 20 0F 00 60 4A 8A 19 24 0B 06 EA 00 0A E7 00 2C 21 0F 00 60 4A 
    //8A 19 24 0C 06 EA 00 0A FF FF 07 31 01 9B 39 3A 00 60 4A 8A 19 39 3A 24 00 16 19 00 68 F5 04 1B 
    //0B 00 00 1B AE 0C 00 00 00 60 4A 8A 19 16 19 00 68 F5 04 1B 0B 00 00 1B D5 18 00 00 00 60 4A 8A 
    //19 16 19 00 68 F5 04 1B 06 00 00 1B CA 18 00 00 16 19 01 48 0C 9D 19 0D 00 00 1B 57 2D 00 00 01 
    //E8 77 9E 19 2C 02 16 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 26 2C 04 16 19 01 48 0C 9D 19 
    //0A 00 04 1B DF 0B 00 00 2C 26 2C 04 16 19 2E D0 2C 2C 26 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 
    //00 2C 26 16 06 00 00 1B 1D 98 00 00 16 04 27 04 0B 47 
  }


  event DoShowWindow(int flags) {
    local Game_PlayerPawn playerPawn;
    local bool playerFeminine;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 30 A8 33 26 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 7E 02 9A 00 30 A8 33 26 12 20 00 68 D7 00 01 00 04 26 16 
      playerPawn = Game_PlayerPawn(GetPawn());                                  //001F : 0F 00 10 AB 05 1B 2E F0 47 5B 01 1B 2B 0C 00 00 16 
      if (playerPawn != None) {                                                 //0030 : 07 7E 02 77 00 10 AB 05 1B 2A 16 
        playerFeminine = playerPawn.Appearance.IsFeminine();                    //003B : 14 2D 00 60 46 2B 26 19 19 00 10 AB 05 1B 05 00 04 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 
        switch (playerPawn.CharacterStats.GetArchetype()) {                     //005A : 05 01 19 19 00 10 AB 05 1B 05 00 04 01 08 43 34 0F 06 00 01 1C 70 9C 18 11 16 
          case 1 :                                                              //0074 : 0A 21 01 24 01 
            mClass1Button.SetText(Class'StringReferences'.GetClassName(4,playerFeminine));//0079 : 19 01 40 C0 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 04 2D 00 60 46 2B 26 16 16 
            mClass2Button.SetText(Class'StringReferences'.GetClassName(5,playerFeminine));//009F : 19 01 28 BE 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 05 2D 00 60 46 2B 26 16 16 
            mClass3Button.SetText(Class'StringReferences'.GetClassName(6,playerFeminine));//00C5 : 19 01 60 BB 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 06 2D 00 60 46 2B 26 16 16 
            mClass1Button.mIntTag = 11;                                         //00EB : 0F 19 01 40 C0 2C 26 05 00 04 01 58 90 31 16 2C 0B 
            mClass2Button.mIntTag = 12;                                         //00FC : 0F 19 01 28 BE 2C 26 05 00 04 01 58 90 31 16 2C 0C 
            mClass3Button.mIntTag = 13;                                         //010D : 0F 19 01 60 BB 2C 26 05 00 04 01 58 90 31 16 2C 0D 
            break;                                                              //011E : 06 7E 02 
          case 2 :                                                              //0121 : 0A CE 01 24 02 
            mClass1Button.SetText(Class'StringReferences'.GetClassName(7,playerFeminine));//0126 : 19 01 40 C0 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 07 2D 00 60 46 2B 26 16 16 
            mClass2Button.SetText(Class'StringReferences'.GetClassName(8,playerFeminine));//014C : 19 01 28 BE 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 08 2D 00 60 46 2B 26 16 16 
            mClass3Button.SetText(Class'StringReferences'.GetClassName(9,playerFeminine));//0172 : 19 01 60 BB 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 09 2D 00 60 46 2B 26 16 16 
            mClass1Button.mIntTag = 21;                                         //0198 : 0F 19 01 40 C0 2C 26 05 00 04 01 58 90 31 16 2C 15 
            mClass2Button.mIntTag = 22;                                         //01A9 : 0F 19 01 28 BE 2C 26 05 00 04 01 58 90 31 16 2C 16 
            mClass3Button.mIntTag = 23;                                         //01BA : 0F 19 01 60 BB 2C 26 05 00 04 01 58 90 31 16 2C 17 
            break;                                                              //01CB : 06 7E 02 
          case 3 :                                                              //01CE : 0A 7B 02 24 03 
            mClass1Button.SetText(Class'StringReferences'.GetClassName(10,playerFeminine));//01D3 : 19 01 40 C0 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 0A 2D 00 60 46 2B 26 16 16 
            mClass2Button.SetText(Class'StringReferences'.GetClassName(11,playerFeminine));//01F9 : 19 01 28 BE 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 0B 2D 00 60 46 2B 26 16 16 
            mClass3Button.SetText(Class'StringReferences'.GetClassName(12,playerFeminine));//021F : 19 01 60 BB 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 0C 2D 00 60 46 2B 26 16 16 
            mClass1Button.mIntTag = 31;                                         //0245 : 0F 19 01 40 C0 2C 26 05 00 04 01 58 90 31 16 2C 1F 
            mClass2Button.mIntTag = 32;                                         //0256 : 0F 19 01 28 BE 2C 26 05 00 04 01 58 90 31 16 2C 20 
            mClass3Button.mIntTag = 33;                                         //0267 : 0F 19 01 60 BB 2C 26 05 00 04 01 58 90 31 16 2C 21 
            break;                                                              //0278 : 06 7E 02 
          default:                                                              //027B : 0A FF FF 
        }
      }
    }
    //1C 20 7A 9E 19 00 30 A8 33 26 16 07 7E 02 9A 00 30 A8 33 26 12 20 00 68 D7 00 01 00 04 26 16 0F 
    //00 10 AB 05 1B 2E F0 47 5B 01 1B 2B 0C 00 00 16 07 7E 02 77 00 10 AB 05 1B 2A 16 14 2D 00 60 46 
    //2B 26 19 19 00 10 AB 05 1B 05 00 04 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 05 01 19 19 00 10 
    //AB 05 1B 05 00 04 01 08 43 34 0F 06 00 01 1C 70 9C 18 11 16 0A 21 01 24 01 19 01 40 C0 2C 26 1D 
    //00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 04 2D 00 60 46 2B 26 16 16 19 
    //01 28 BE 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 05 2D 00 60 
    //46 2B 26 16 16 19 01 60 BB 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 
    //00 24 06 2D 00 60 46 2B 26 16 16 0F 19 01 40 C0 2C 26 05 00 04 01 58 90 31 16 2C 0B 0F 19 01 28 
    //BE 2C 26 05 00 04 01 58 90 31 16 2C 0C 0F 19 01 60 BB 2C 26 05 00 04 01 58 90 31 16 2C 0D 06 7E 
    //02 0A CE 01 24 02 19 01 40 C0 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 
    //00 00 24 07 2D 00 60 46 2B 26 16 16 19 01 28 BE 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 
    //0E 00 00 1B 54 0D 00 00 24 08 2D 00 60 46 2B 26 16 16 19 01 60 BB 2C 26 1D 00 00 1B 13 98 00 00 
    //12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 09 2D 00 60 46 2B 26 16 16 0F 19 01 40 C0 2C 26 05 
    //00 04 01 58 90 31 16 2C 15 0F 19 01 28 BE 2C 26 05 00 04 01 58 90 31 16 2C 16 0F 19 01 60 BB 2C 
    //26 05 00 04 01 58 90 31 16 2C 17 06 7E 02 0A 7B 02 24 03 19 01 40 C0 2C 26 1D 00 00 1B 13 98 00 
    //00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 0A 2D 00 60 46 2B 26 16 16 19 01 28 BE 2C 26 1D 
    //00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 0B 2D 00 60 46 2B 26 16 16 19 
    //01 60 BB 2C 26 1D 00 00 1B 13 98 00 00 12 20 20 F7 60 01 0E 00 00 1B 54 0D 00 00 24 0C 2D 00 60 
    //46 2B 26 16 16 0F 19 01 40 C0 2C 26 05 00 04 01 58 90 31 16 2C 1F 0F 19 01 28 BE 2C 26 05 00 04 
    //01 58 90 31 16 2C 20 0F 19 01 60 BB 2C 26 05 00 04 01 58 90 31 16 2C 21 06 7E 02 0A FF FF 04 0B 
    //47 
  }


  event Initialize() {
    local GED_Editor Editor;
    mWidth = 406.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 CB 43 
    mHeight = 222.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 5E 43 
    mTop = 100.00000000;                                                        //0016 : 0F 01 80 86 31 16 1E 00 00 C8 42 
    mLeft = 5.00000000;                                                         //0021 : 0F 01 08 86 31 16 1E 00 00 A0 40 
    Super.Initialize();                                                         //002C : 1C 28 9E 9E 19 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0032 : 0F 00 20 72 04 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    Editor.Attach(self,"CharacterStatistics\ChooseClass.txt");                  //0057 : 19 00 20 72 04 1B 2C 00 00 1B 3F 01 00 00 17 1F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 5C 43 68 6F 6F 73 65 43 6C 61 73 73 2E 74 78 74 00 16 
    mClass1Button = GUI_Button(Editor.RetrieveComponent("mClass1Button"));      //008C : 0F 01 40 C0 2C 26 2E 78 F0 2E 1D 19 00 20 72 04 1B 15 00 04 1B 15 98 00 00 1F 6D 43 6C 61 73 73 31 42 75 74 74 6F 6E 00 16 
    mClass2Button = GUI_Button(Editor.RetrieveComponent("mClass2Button"));      //00B5 : 0F 01 28 BE 2C 26 2E 78 F0 2E 1D 19 00 20 72 04 1B 15 00 04 1B 15 98 00 00 1F 6D 43 6C 61 73 73 32 42 75 74 74 6F 6E 00 16 
    mClass3Button = GUI_Button(Editor.RetrieveComponent("mClass3Button"));      //00DE : 0F 01 60 BB 2C 26 2E 78 F0 2E 1D 19 00 20 72 04 1B 15 00 04 1B 15 98 00 00 1F 6D 43 6C 61 73 73 33 42 75 74 74 6F 6E 00 16 
    mClass1Button.__OnClick__Delegate = ClassHandler;                           //0107 : 45 19 01 40 C0 2C 26 05 00 08 01 98 EB 9D 19 44 46 99 00 00 
    mClass2Button.__OnClick__Delegate = ClassHandler;                           //011B : 45 19 01 28 BE 2C 26 05 00 08 01 98 EB 9D 19 44 46 99 00 00 
    mClass3Button.__OnClick__Delegate = ClassHandler;                           //012F : 45 19 01 60 BB 2C 26 05 00 08 01 98 EB 9D 19 44 46 99 00 00 
    mCancelButton = GUI_Button(Editor.RetrieveComponent("mCancelButton"));      //0143 : 0F 01 98 A9 33 26 2E 78 F0 2E 1D 19 00 20 72 04 1B 15 00 04 1B 15 98 00 00 1F 6D 43 61 6E 63 65 6C 42 75 74 74 6F 6E 00 16 
    mCancelButton.__OnClick__Delegate = CancelHandler;                          //016C : 45 19 01 98 A9 33 26 05 00 08 01 98 EB 9D 19 44 A1 9A 00 00 
    //0F 01 60 87 31 16 1E 00 00 CB 43 0F 01 40 88 31 16 1E 00 00 5E 43 0F 01 80 86 31 16 1E 00 00 C8 
    //42 0F 01 08 86 31 16 1E 00 00 A0 40 1C 28 9E 9E 19 16 0F 00 20 72 04 1B 2E D8 2F 32 1D 19 01 48 
    //0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 19 00 20 72 04 1B 2C 00 00 
    //1B 3F 01 00 00 17 1F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 5C 43 68 6F 6F 73 
    //65 43 6C 61 73 73 2E 74 78 74 00 16 0F 01 40 C0 2C 26 2E 78 F0 2E 1D 19 00 20 72 04 1B 15 00 04 
    //1B 15 98 00 00 1F 6D 43 6C 61 73 73 31 42 75 74 74 6F 6E 00 16 0F 01 28 BE 2C 26 2E 78 F0 2E 1D 
    //19 00 20 72 04 1B 15 00 04 1B 15 98 00 00 1F 6D 43 6C 61 73 73 32 42 75 74 74 6F 6E 00 16 0F 01 
    //60 BB 2C 26 2E 78 F0 2E 1D 19 00 20 72 04 1B 15 00 04 1B 15 98 00 00 1F 6D 43 6C 61 73 73 33 42 
    //75 74 74 6F 6E 00 16 45 19 01 40 C0 2C 26 05 00 08 01 98 EB 9D 19 44 46 99 00 00 45 19 01 28 BE 
    //2C 26 05 00 08 01 98 EB 9D 19 44 46 99 00 00 45 19 01 60 BB 2C 26 05 00 08 01 98 EB 9D 19 44 46 
    //99 00 00 0F 01 98 A9 33 26 2E 78 F0 2E 1D 19 00 20 72 04 1B 15 00 04 1B 15 98 00 00 1F 6D 43 61 
    //6E 63 65 6C 42 75 74 74 6F 6E 00 16 45 19 01 98 A9 33 26 05 00 08 01 98 EB 9D 19 44 A1 9A 00 00 
    //04 0B 47 
  }



