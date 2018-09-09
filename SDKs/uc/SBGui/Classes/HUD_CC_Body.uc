//==============================================================================
//  HUD_CC_Body
//==============================================================================

class HUD_CC_Body extends HUD_CC_Window
    dependsOn()
    Transient
    Config(User)
  ;

  var private LocalizedString mRaceHuman;
  var private LocalizedString mRaceDaevi;
  var private LocalizedString mGenderMale;
  var private LocalizedString mGenderFemale;
  var private LocalizedString mBodySkinny;
  var private LocalizedString mBodyAthletic;
  var private LocalizedString mBodyFat;
  var private LocalizedString mBodyHulky;
  var private array<GUI_Window> mRaceInfoWindows;


  event ResolutionChanged(int ResX,int ResY) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 E8 1F 05 1B 25 
    while (i < mRaceInfoWindows.Length) {                                       //0007 : 07 44 00 96 00 E8 1F 05 1B 37 01 28 6B 2B 26 16 
      mRaceInfoWindows[i].mTop = 0.25000000 * ResY;                             //0017 : 0F 19 10 00 E8 1F 05 1B 01 28 6B 2B 26 05 00 04 01 80 86 31 16 AB 1E 00 00 80 3E 39 3F 00 00 1F 33 26 16 
      i++;                                                                      //003A : A5 00 E8 1F 05 1B 16 
    }
    //0F 00 E8 1F 05 1B 25 07 44 00 96 00 E8 1F 05 1B 37 01 28 6B 2B 26 16 0F 19 10 00 E8 1F 05 1B 01 
    //28 6B 2B 26 05 00 04 01 80 86 31 16 AB 1E 00 00 80 3E 39 3F 00 00 1F 33 26 16 A5 00 E8 1F 05 1B 
    //16 06 07 00 04 0B 47 
  }


  function UpdateRaceInformation(int aRace) {
    local int i;
    local GED_Editor Editor;
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0000 : 0F 00 D0 A1 07 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (mRaceInfoWindows.Length == 0) {                                         //0025 : 07 2D 01 9A 37 01 28 6B 2B 26 25 16 
      mRaceInfoWindows[0] = Editor.ShowWindow("CharacterCreation\BodySelection\HumanInfoWindow.txt",Class'GUI_BaseDesktop'.2);//0031 : 0F 10 25 01 28 6B 2B 26 19 00 D0 A1 07 1B 46 00 04 1B 57 2D 00 00 1F 43 68 61 72 61 63 74 65 72 43 72 65 61 74 69 6F 6E 5C 42 6F 64 79 53 65 6C 65 63 74 69 6F 6E 5C 48 75 6D 61 6E 49 6E 66 6F 57 69 6E 64 6F 77 2E 74 78 74 00 12 20 00 68 D7 00 02 00 04 2C 02 16 
      mRaceInfoWindows[1] = Editor.ShowWindow("CharacterCreation\BodySelection\DaeviInfoWindow.txt",Class'GUI_BaseDesktop'.2);//0088 : 0F 10 26 01 28 6B 2B 26 19 00 D0 A1 07 1B 46 00 04 1B 57 2D 00 00 1F 43 68 61 72 61 63 74 65 72 43 72 65 61 74 69 6F 6E 5C 42 6F 64 79 53 65 6C 65 63 74 69 6F 6E 5C 44 61 65 76 69 49 6E 66 6F 57 69 6E 64 6F 77 2E 74 78 74 00 12 20 00 68 D7 00 02 00 04 2C 02 16 
      mRaceInfoWindows[0].mTop = 0.25000000 * mDesktop.GetScreenHeight();       //00DF : 0F 19 10 25 01 28 6B 2B 26 05 00 04 01 80 86 31 16 AB 1E 00 00 80 3E 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 16 
      mRaceInfoWindows[1].mTop = 0.25000000 * mDesktop.GetScreenHeight();       //0106 : 0F 19 10 26 01 28 6B 2B 26 05 00 04 01 80 86 31 16 AB 1E 00 00 80 3E 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 16 
    }
    i = 0;                                                                      //012D : 0F 00 78 17 04 1B 25 
    while (i < mRaceInfoWindows.Length) {                                       //0134 : 07 A9 01 96 00 78 17 04 1B 37 01 28 6B 2B 26 16 
      if (i == aRace) {                                                         //0144 : 07 7A 01 9A 00 78 17 04 1B 00 F0 1F 33 26 16 
        mDesktop.ShowWindow(mRaceInfoWindows[i].mWindowHandle,1);               //0153 : 19 01 48 0C 9D 19 1B 00 00 1B 57 2D 00 00 19 10 00 78 17 04 1B 01 28 6B 2B 26 05 00 04 01 E8 77 9E 19 26 16 
      } else {                                                                  //0177 : 06 9F 01 
        mDesktop.ShowWindow(mRaceInfoWindows[i].mWindowHandle,2);               //017A : 19 01 48 0C 9D 19 1C 00 00 1B 57 2D 00 00 19 10 00 78 17 04 1B 01 28 6B 2B 26 05 00 04 01 E8 77 9E 19 2C 02 16 
      }
      i++;                                                                      //019F : A5 00 78 17 04 1B 16 
    }
    //0F 00 D0 A1 07 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 
    //00 04 2C 2D 16 07 2D 01 9A 37 01 28 6B 2B 26 25 16 0F 10 25 01 28 6B 2B 26 19 00 D0 A1 07 1B 46 
    //00 04 1B 57 2D 00 00 1F 43 68 61 72 61 63 74 65 72 43 72 65 61 74 69 6F 6E 5C 42 6F 64 79 53 65 
    //6C 65 63 74 69 6F 6E 5C 48 75 6D 61 6E 49 6E 66 6F 57 69 6E 64 6F 77 2E 74 78 74 00 12 20 00 68 
    //D7 00 02 00 04 2C 02 16 0F 10 26 01 28 6B 2B 26 19 00 D0 A1 07 1B 46 00 04 1B 57 2D 00 00 1F 43 
    //68 61 72 61 63 74 65 72 43 72 65 61 74 69 6F 6E 5C 42 6F 64 79 53 65 6C 65 63 74 69 6F 6E 5C 44 
    //61 65 76 69 49 6E 66 6F 57 69 6E 64 6F 77 2E 74 78 74 00 12 20 00 68 D7 00 02 00 04 2C 02 16 0F 
    //19 10 25 01 28 6B 2B 26 05 00 04 01 80 86 31 16 AB 1E 00 00 80 3E 19 01 48 0C 9D 19 06 00 04 1B 
    //2E 98 00 00 16 16 0F 19 10 26 01 28 6B 2B 26 05 00 04 01 80 86 31 16 AB 1E 00 00 80 3E 19 01 48 
    //0C 9D 19 06 00 04 1B 2E 98 00 00 16 16 0F 00 78 17 04 1B 25 07 A9 01 96 00 78 17 04 1B 37 01 28 
    //6B 2B 26 16 07 7A 01 9A 00 78 17 04 1B 00 F0 1F 33 26 16 19 01 48 0C 9D 19 1B 00 00 1B 57 2D 00 
    //00 19 10 00 78 17 04 1B 01 28 6B 2B 26 05 00 04 01 E8 77 9E 19 26 16 06 9F 01 19 01 48 0C 9D 19 
    //1C 00 00 1B 57 2D 00 00 19 10 00 78 17 04 1B 01 28 6B 2B 26 05 00 04 01 E8 77 9E 19 2C 02 16 A5 
    //00 78 17 04 1B 16 06 34 01 04 0B 47 
  }


  function SetInfoText() {
    OnSetInfoText(Class'SBGuiStrings'.default.You_can_select_your_Race_Gender_and_Body_here.Text,Class'SBGuiStrings'.default.Press_Next_to_continue.Text);//0000 : 1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 48 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 46 99 19 16 
    //1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 48 99 19 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 E0 46 99 19 16 04 0B 47 
  }


  function SetOptionColors(bool aUpdateLock) {
    mOptions[2].UpdateColors(mOptions[2].mPart,1);                              //0000 : 19 10 2C 02 01 A8 F2 2B 26 18 00 00 1B 6D 98 00 00 19 10 2C 02 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 26 16 
    ClosePicker();                                                              //0024 : 1B 5C 98 00 00 16 
    //19 10 2C 02 01 A8 F2 2B 26 18 00 00 1B 6D 98 00 00 19 10 2C 02 01 A8 F2 2B 26 05 00 01 01 F0 EF 
    //EB 25 26 16 1B 5C 98 00 00 16 04 0B 47 
  }


  function ApplyRandomization(export editinline Game_EquippedAppearance characterAppearance) {
    characterAppearance.SetRandom(1 + 2 + 4,1,False,True,False,False,False,False);//0000 : 19 00 B8 22 33 26 16 00 00 1B E9 0E 00 00 92 92 26 2C 02 16 2C 04 16 26 28 27 28 28 28 28 16 
    //19 00 B8 22 33 26 16 00 00 1B E9 0E 00 00 92 92 26 2C 02 16 2C 04 16 26 28 27 28 28 28 28 16 04 
    //0B 47 
  }


  function bool ResetValues(GUI_Component aButton) {
    local export editinline Game_EquippedAppearance characterAppearance;
    if (aButton != None) {                                                      //0000 : 07 9F 00 77 00 E0 70 06 1B 2A 16 
      characterAppearance = GetPreviewAppearance();                             //000B : 0F 00 F8 B9 2C 26 1B 41 98 00 00 16 
      characterAppearance.SetGender(0);                                         //0017 : 19 00 F8 B9 2C 26 08 00 00 1B 0F 10 00 00 24 00 16 
      characterAppearance.SetBody(1);                                           //0028 : 19 00 F8 B9 2C 26 08 00 00 1B 10 10 00 00 24 01 16 
      characterAppearance.SetColorValue(21,43,0);                               //0039 : 19 00 F8 B9 2C 26 0C 00 00 1B 04 0C 00 00 24 15 24 2B 24 00 16 
      characterAppearance.SetRace(0);                                           //004E : 19 00 F8 B9 2C 26 08 00 00 1B 0E 10 00 00 24 00 16 
      UpdateRaceInformation(0);                                                 //005F : 1B FF 98 00 00 25 16 
      characterAppearance.SetValue(22,0);                                       //0066 : 19 00 F8 B9 2C 26 09 00 00 1B 37 0C 00 00 24 16 25 16 
      characterAppearance.SetValue(18,0);                                       //0078 : 19 00 F8 B9 2C 26 09 00 00 1B 37 0C 00 00 24 12 25 16 
      characterAppearance.Apply();                                              //008A : 19 00 F8 B9 2C 26 06 00 00 1C A0 3B 21 11 16 
      UpdateAnimation();                                                        //0099 : 1B 5E 98 00 00 16 
    }
    SetOptionColors(False);                                                     //009F : 1B 80 98 00 00 28 16 
    return Super.ResetValues(aButton);                                          //00A6 : 04 1C 88 F8 2A 26 00 E0 70 06 1B 16 
    //07 9F 00 77 00 E0 70 06 1B 2A 16 0F 00 F8 B9 2C 26 1B 41 98 00 00 16 19 00 F8 B9 2C 26 08 00 00 
    //1B 0F 10 00 00 24 00 16 19 00 F8 B9 2C 26 08 00 00 1B 10 10 00 00 24 01 16 19 00 F8 B9 2C 26 0C 
    //00 00 1B 04 0C 00 00 24 15 24 2B 24 00 16 19 00 F8 B9 2C 26 08 00 00 1B 0E 10 00 00 24 00 16 1B 
    //FF 98 00 00 25 16 19 00 F8 B9 2C 26 09 00 00 1B 37 0C 00 00 24 16 25 16 19 00 F8 B9 2C 26 09 00 
    //00 1B 37 0C 00 00 24 12 25 16 19 00 F8 B9 2C 26 06 00 00 1C A0 3B 21 11 16 1B 5E 98 00 00 16 1B 
    //80 98 00 00 28 16 04 1C 88 F8 2A 26 00 E0 70 06 1B 16 04 0B 47 
  }


  function OnSetColor(HUD_CC_Option Item,int aColor,byte Index) {
    local export editinline Game_EquippedAppearance characterAppearance;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 00 9F 07 1B 1B 41 98 00 00 16 
    characterAppearance.SetColorValue(21,Index,aColor);                         //000C : 19 00 00 9F 07 1B 14 00 00 1B 04 0C 00 00 24 15 00 30 23 33 26 39 3D 00 A8 23 33 26 16 
    characterAppearance.Apply();                                                //0029 : 19 00 00 9F 07 1B 06 00 00 1C A0 3B 21 11 16 
    //0F 00 00 9F 07 1B 1B 41 98 00 00 16 19 00 00 9F 07 1B 14 00 00 1B 04 0C 00 00 24 15 00 30 23 33 
    //26 39 3D 00 A8 23 33 26 16 19 00 00 9F 07 1B 06 00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  function OnNext(HUD_CC_Option Item,int aDelta) {
    local export editinline Game_EquippedAppearance characterAppearance;
    local int val;
    local int Max;
    local int Start;
    local int MainWeapon;
    local int offhandWeapon;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 78 A1 89 19 1B 41 98 00 00 16 
    MainWeapon = characterAppearance.GetValue(16);                              //000C : 0F 00 38 16 08 1B 19 00 78 A1 89 19 08 00 04 1B 7D 0C 00 00 24 10 16 
    offhandWeapon = characterAppearance.GetValue(17);                           //0023 : 0F 00 C0 15 08 1B 19 00 78 A1 89 19 08 00 04 1B 7D 0C 00 00 24 11 16 
    Start = characterAppearance.GetGender();                                    //003A : 0F 00 98 24 33 26 39 3A 19 00 78 A1 89 19 06 00 01 1B 6F 05 00 00 16 
    if (Item == mOptions[0]) {                                                  //0051 : 07 E1 00 72 00 30 99 07 1B 10 25 01 A8 F2 2B 26 16 
      val = static.Mod(characterAppearance.GetRace() + aDelta,2);               //0062 : 0F 00 88 FB 2A 26 1C 60 4D 6B 0F 92 39 3A 19 00 78 A1 89 19 06 00 01 1B 6C 0F 00 00 16 00 A8 99 07 1B 16 2C 02 16 
      if (val < 0) {                                                            //0088 : 07 9C 00 96 00 88 FB 2A 26 25 16 
        val += 2;                                                               //0093 : A1 00 88 FB 2A 26 2C 02 16 
      }
      characterAppearance.SetValue(22,0);                                       //009C : 19 00 78 A1 89 19 09 00 00 1B 37 0C 00 00 24 16 25 16 
      characterAppearance.SetValue(18,0);                                       //00AE : 19 00 78 A1 89 19 09 00 00 1B 37 0C 00 00 24 12 25 16 
      characterAppearance.SetRace(val);                                         //00C0 : 19 00 78 A1 89 19 0D 00 00 1B 0E 10 00 00 39 3D 00 88 FB 2A 26 16 
      UpdateRaceInformation(val);                                               //00D6 : 1B FF 98 00 00 00 88 FB 2A 26 16 
    }
    if (Item == mOptions[1]) {                                                  //00E1 : 07 98 01 72 00 30 99 07 1B 10 26 01 A8 F2 2B 26 16 
      val = (characterAppearance.GetGender() + aDelta) % 2;                     //00F2 : 0F 00 88 FB 2A 26 39 44 AD 39 3F 92 39 3A 19 00 78 A1 89 19 06 00 01 1B 6F 05 00 00 16 00 A8 99 07 1B 16 39 3F 2C 02 16 
      if (val < 0) {                                                            //011A : 07 2E 01 96 00 88 FB 2A 26 25 16 
        val += 2;                                                               //0125 : A1 00 88 FB 2A 26 2C 02 16 
      }
      characterAppearance.SetGender(val);                                       //012E : 19 00 78 A1 89 19 0D 00 00 1B 0F 10 00 00 39 3D 00 88 FB 2A 26 16 
      if (characterAppearance.GetBody() == 3
        && !val == 0
        && characterAppearance.GetRace() == 0) {//0144 : 07 95 01 82 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 9A 0C 00 00 16 2C 03 16 18 24 00 81 82 9A 00 88 FB 2A 26 25 16 18 15 00 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 6C 0F 00 00 16 25 16 16 16 16 
        characterAppearance.SetBody(0);                                         //0184 : 19 00 78 A1 89 19 08 00 00 1B 10 10 00 00 24 00 16 
      }
    } else {                                                                    //0195 : 06 45 02 
      if (Item == mOptions[2]) {                                                //0198 : 07 45 02 72 00 30 99 07 1B 10 2C 02 01 A8 F2 2B 26 16 
        if (characterAppearance.GetRace() == 0
          && characterAppearance.GetGender() == 0) {//01AA : 07 E5 01 82 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 6C 0F 00 00 16 25 16 18 15 00 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 6F 05 00 00 16 25 16 16 
          Max = 4;                                                              //01DA : 0F 00 D0 41 06 1B 2C 04 
        } else {                                                                //01E2 : 06 ED 01 
          Max = 3;                                                              //01E5 : 0F 00 D0 41 06 1B 2C 03 
        }
        val = (characterAppearance.GetBody() + aDelta) % Max;                   //01ED : 0F 00 88 FB 2A 26 39 44 AD 39 3F 92 39 3A 19 00 78 A1 89 19 06 00 01 1B 9A 0C 00 00 16 00 A8 99 07 1B 16 39 3F 00 D0 41 06 1B 16 
        if (val < 0) {                                                          //0218 : 07 2F 02 96 00 88 FB 2A 26 25 16 
          val += Max;                                                           //0223 : A1 00 88 FB 2A 26 00 D0 41 06 1B 16 
        }
        characterAppearance.SetBody(val);                                       //022F : 19 00 78 A1 89 19 0D 00 00 1B 10 10 00 00 39 3D 00 88 FB 2A 26 16 
      }
    }
    characterAppearance.CheckCompatibility(True);                               //0245 : 19 00 78 A1 89 19 07 00 00 1B 8D 04 00 00 27 16 
    characterAppearance.SetValue(16,MainWeapon);                                //0255 : 19 00 78 A1 89 19 0D 00 00 1B 37 0C 00 00 24 10 00 38 16 08 1B 16 
    characterAppearance.SetValue(17,offhandWeapon);                             //026B : 19 00 78 A1 89 19 0D 00 00 1B 37 0C 00 00 24 11 00 C0 15 08 1B 16 
    characterAppearance.Apply();                                                //0281 : 19 00 78 A1 89 19 06 00 00 1C A0 3B 21 11 16 
    UpdateAnimation();                                                          //0290 : 1B 5E 98 00 00 16 
    SetOptionColors(False);                                                     //0296 : 1B 80 98 00 00 28 16 
    //0F 00 78 A1 89 19 1B 41 98 00 00 16 0F 00 38 16 08 1B 19 00 78 A1 89 19 08 00 04 1B 7D 0C 00 00 
    //24 10 16 0F 00 C0 15 08 1B 19 00 78 A1 89 19 08 00 04 1B 7D 0C 00 00 24 11 16 0F 00 98 24 33 26 
    //39 3A 19 00 78 A1 89 19 06 00 01 1B 6F 05 00 00 16 07 E1 00 72 00 30 99 07 1B 10 25 01 A8 F2 2B 
    //26 16 0F 00 88 FB 2A 26 1C 60 4D 6B 0F 92 39 3A 19 00 78 A1 89 19 06 00 01 1B 6C 0F 00 00 16 00 
    //A8 99 07 1B 16 2C 02 16 07 9C 00 96 00 88 FB 2A 26 25 16 A1 00 88 FB 2A 26 2C 02 16 19 00 78 A1 
    //89 19 09 00 00 1B 37 0C 00 00 24 16 25 16 19 00 78 A1 89 19 09 00 00 1B 37 0C 00 00 24 12 25 16 
    //19 00 78 A1 89 19 0D 00 00 1B 0E 10 00 00 39 3D 00 88 FB 2A 26 16 1B FF 98 00 00 00 88 FB 2A 26 
    //16 07 98 01 72 00 30 99 07 1B 10 26 01 A8 F2 2B 26 16 0F 00 88 FB 2A 26 39 44 AD 39 3F 92 39 3A 
    //19 00 78 A1 89 19 06 00 01 1B 6F 05 00 00 16 00 A8 99 07 1B 16 39 3F 2C 02 16 07 2E 01 96 00 88 
    //FB 2A 26 25 16 A1 00 88 FB 2A 26 2C 02 16 19 00 78 A1 89 19 0D 00 00 1B 0F 10 00 00 39 3D 00 88 
    //FB 2A 26 16 07 95 01 82 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 9A 0C 00 00 16 2C 03 16 18 24 00 
    //81 82 9A 00 88 FB 2A 26 25 16 18 15 00 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 6C 0F 00 00 16 25 
    //16 16 16 16 19 00 78 A1 89 19 08 00 00 1B 10 10 00 00 24 00 16 06 45 02 07 45 02 72 00 30 99 07 
    //1B 10 2C 02 01 A8 F2 2B 26 16 07 E5 01 82 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 6C 0F 00 00 16 
    //25 16 18 15 00 9A 39 3A 19 00 78 A1 89 19 06 00 01 1B 6F 05 00 00 16 25 16 16 0F 00 D0 41 06 1B 
    //2C 04 06 ED 01 0F 00 D0 41 06 1B 2C 03 0F 00 88 FB 2A 26 39 44 AD 39 3F 92 39 3A 19 00 78 A1 89 
    //19 06 00 01 1B 9A 0C 00 00 16 00 A8 99 07 1B 16 39 3F 00 D0 41 06 1B 16 07 2F 02 96 00 88 FB 2A 
    //26 25 16 A1 00 88 FB 2A 26 00 D0 41 06 1B 16 19 00 78 A1 89 19 0D 00 00 1B 10 10 00 00 39 3D 00 
    //88 FB 2A 26 16 19 00 78 A1 89 19 07 00 00 1B 8D 04 00 00 27 16 19 00 78 A1 89 19 0D 00 00 1B 37 
    //0C 00 00 24 10 00 38 16 08 1B 16 19 00 78 A1 89 19 0D 00 00 1B 37 0C 00 00 24 11 00 C0 15 08 1B 
    //16 19 00 78 A1 89 19 06 00 00 1C A0 3B 21 11 16 1B 5E 98 00 00 16 1B 80 98 00 00 28 16 04 0B 47 
    //
  }


  function Texture OnGetPalette(int aColor,HUD_CC_Option Item) {
    local export editinline Game_EquippedAppearance characterAppearance;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 98 1C 08 1B 1B 41 98 00 00 16 
    return characterAppearance.GetBodyPalette();                                //000C : 04 19 00 98 1C 08 1B 06 00 04 1B 5E 11 00 00 16 
    //0F 00 98 1C 08 1B 1B 41 98 00 00 16 04 19 00 98 1C 08 1B 06 00 04 1B 5E 11 00 00 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 48 95 2C 26 00 E8 1E 08 1B 16 
    if (flags == Class'GUI_BaseDesktop'.2) {                                    //000B : 07 2E 00 9A 00 E8 1E 08 1B 12 20 00 68 D7 00 02 00 04 2C 02 16 
      UpdateRaceInformation(-1);                                                //0020 : 1B FF 98 00 00 1D FF FF FF FF 16 
    } else {                                                                    //002B : 06 46 00 
      UpdateRaceInformation(GetPreviewAppearance().GetRace());                  //002E : 1B FF 98 00 00 39 3A 19 1B 41 98 00 00 16 06 00 01 1B 6C 0F 00 00 16 16 
    }
    //1C 48 95 2C 26 00 E8 1E 08 1B 16 07 2E 00 9A 00 E8 1E 08 1B 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //1B FF 98 00 00 1D FF FF FF FF 16 06 46 00 1B FF 98 00 00 39 3A 19 1B 41 98 00 00 16 06 00 01 1B 
    //6C 0F 00 00 16 16 04 0B 47 
  }


  event Initialize() {
    local int i;
    Super.Initialize();                                                         //0000 : 1C 48 DC 2A 26 16 
    SetIcon("header_body","SBGuiTX.CC_Styles","CC_Styles");                     //0006 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 62 6F 64 79 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    i = 0;                                                                      //0037 : 0F 00 98 3D 2C 26 25 
    while (i < 3) {                                                             //003E : 07 41 01 96 00 98 3D 2C 26 2C 03 16 
      mOptions[i] = HUD_CC_Option(mMainPane.CreatePage("HUD_CC_Option",0,0,6,6 + i * 40,0,0));//004A : 0F 10 00 98 3D 2C 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 01 88 51 EC 25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 92 2C 06 90 00 98 3D 2C 26 2C 28 16 16 25 25 16 
      mOptions[i].mOwnerWindow = self;                                          //008C : 0F 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 04 01 C8 9C 2B 26 17 
      mOptions[i].SetSides(False);                                              //00A2 : 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 
      mOptions[i].SetColorPos(2);                                               //00B8 : 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 02 16 
      mOptions[i].__OnOpenPicker__Delegate = OnOpenPicker;                      //00CF : 45 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 30 FD 2C 26 44 10 97 00 00 
      mOptions[i].__OnGetPalette__Delegate = OnGetPalette;                      //00E9 : 45 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 E0 2B 8A 19 44 F6 96 00 00 
      mOptions[i].__OnNext__Delegate = OnNext;                                  //0103 : 45 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 D0 2C 8A 19 44 0F 97 00 00 
      mOptions[i].__OnSetColor__Delegate = OnSetColor;                          //011D : 45 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 60 FA 2C 26 44 21 97 00 00 
      i++;                                                                      //0137 : A5 00 98 3D 2C 26 16 
    }
    mOptions[0].SetTitle(Class'SBGuiStrings'.default.Race.Text);                //0141 : 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 94 98 19 16 
    mOptions[1].SetTitle(Class'SBGuiStrings'.default.Gender.Text);              //0165 : 19 10 26 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 D3 98 19 16 
    mOptions[2].SetTitle(Class'SBGuiStrings'.default.Bodytype.Text);            //0189 : 19 10 2C 02 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 49 98 19 16 
    mOptions[2].mPart = 21;                                                     //01AE : 0F 19 10 2C 02 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 15 
    mOptions[2].UpdateColors(mOptions[2].mPart,1);                              //01C2 : 19 10 2C 02 01 A8 F2 2B 26 18 00 00 1B 6D 98 00 00 19 10 2C 02 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 26 16 
    //1C 48 DC 2A 26 16 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 62 6F 64 79 00 1F 53 42 47 75 69 54 58 
    //2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 0F 00 98 3D 2C 26 25 07 41 
    //01 96 00 98 3D 2C 26 2C 03 16 0F 10 00 98 3D 2C 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 01 88 51 EC 
    //25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 92 2C 06 90 
    //00 98 3D 2C 26 2C 28 16 16 25 25 16 0F 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 04 01 C8 9C 2B 
    //26 17 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 19 10 00 98 3D 2C 26 01 
    //A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 02 16 45 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 
    //30 FD 2C 26 44 10 97 00 00 45 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 E0 2B 8A 19 44 F6 
    //96 00 00 45 19 10 00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 D0 2C 8A 19 44 0F 97 00 00 45 19 10 
    //00 98 3D 2C 26 01 A8 F2 2B 26 05 00 08 01 60 FA 2C 26 44 21 97 00 00 A5 00 98 3D 2C 26 16 06 3E 
    //00 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //78 94 98 19 16 19 10 26 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 08 D3 98 19 16 19 10 2C 02 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 98 49 98 19 16 0F 19 10 2C 02 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 
    //24 15 19 10 2C 02 01 A8 F2 2B 26 18 00 00 1B 6D 98 00 00 19 10 2C 02 01 A8 F2 2B 26 05 00 01 01 
    //F0 EF EB 25 26 16 04 0B 47 
  }



