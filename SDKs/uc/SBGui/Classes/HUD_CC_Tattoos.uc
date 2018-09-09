//==============================================================================
//  HUD_CC_Tattoos
//==============================================================================

class HUD_CC_Tattoos extends HUD_CC_Window
    dependsOn(Appearance_Set)
    Transient
    Config(User)
  ;

  var private int mLastSelectedTattoo;
  var private int mLastSelectedTattooDup;
  var private LocalizedString mNoTattooText;
  var private LocalizedString mTattooText;


  function bool HasInfo() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function SetInfoText() {
    OnSetInfoText(Class'SBGuiStrings'.default.You_can_select_Tattoos_here.Text,Class'SBGuiStrings'.default.Press_Next_to_continue.Text);//0000 : 1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 49 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 46 99 19 16 
    //1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 49 99 19 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 E0 46 99 19 16 04 0B 47 
  }


  function OnMirror(HUD_CC_Option Item,int aSide) {
    local int val;
    local int MainWeapon;
    local int offhandWeapon;
    local export editinline Game_EquippedAppearance characterAppearance;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 88 BC 2C 26 1B 41 98 00 00 16 
    UpdateCurrentTattoo(Item);                                                  //000C : 1B 29 99 00 00 00 F8 2C 33 26 16 
    MainWeapon = characterAppearance.GetValue(16);                              //0017 : 0F 00 B8 2F 08 1B 19 00 88 BC 2C 26 08 00 04 1B 7D 0C 00 00 24 10 16 
    offhandWeapon = characterAppearance.GetValue(17);                           //002E : 0F 00 F8 32 08 1B 19 00 88 BC 2C 26 08 00 04 1B 7D 0C 00 00 24 11 16 
    val = characterAppearance.GetValue(23,mLastSelectedTattoo - 1);             //0045 : 0F 00 78 2C 08 1B 19 00 88 BC 2C 26 12 00 04 1B 7D 0C 00 00 24 17 39 3D 93 01 B8 C0 2C 26 26 16 16 
    characterAppearance.SetValue(23,val,mLastSelectedTattooDup - 1);            //0066 : 19 00 88 BC 2C 26 17 00 00 1B 37 0C 00 00 24 17 00 78 2C 08 1B 39 3D 93 01 D0 C4 04 1B 26 16 16 
    UpdateInfo();                                                               //0086 : 1B 3B 99 00 00 16 
    characterAppearance.SetValue(16,MainWeapon);                                //008C : 19 00 88 BC 2C 26 0D 00 00 1B 37 0C 00 00 24 10 00 B8 2F 08 1B 16 
    characterAppearance.SetValue(17,offhandWeapon);                             //00A2 : 19 00 88 BC 2C 26 0D 00 00 1B 37 0C 00 00 24 11 00 F8 32 08 1B 16 
    characterAppearance.Apply();                                                //00B8 : 19 00 88 BC 2C 26 06 00 00 1C A0 3B 21 11 16 
    UpdateAnimation();                                                          //00C7 : 1B 5E 98 00 00 16 
    //0F 00 88 BC 2C 26 1B 41 98 00 00 16 1B 29 99 00 00 00 F8 2C 33 26 16 0F 00 B8 2F 08 1B 19 00 88 
    //BC 2C 26 08 00 04 1B 7D 0C 00 00 24 10 16 0F 00 F8 32 08 1B 19 00 88 BC 2C 26 08 00 04 1B 7D 0C 
    //00 00 24 11 16 0F 00 78 2C 08 1B 19 00 88 BC 2C 26 12 00 04 1B 7D 0C 00 00 24 17 39 3D 93 01 B8 
    //C0 2C 26 26 16 16 19 00 88 BC 2C 26 17 00 00 1B 37 0C 00 00 24 17 00 78 2C 08 1B 39 3D 93 01 D0 
    //C4 04 1B 26 16 16 1B 3B 99 00 00 16 19 00 88 BC 2C 26 0D 00 00 1B 37 0C 00 00 24 10 00 B8 2F 08 
    //1B 16 19 00 88 BC 2C 26 0D 00 00 1B 37 0C 00 00 24 11 00 F8 32 08 1B 16 19 00 88 BC 2C 26 06 00 
    //00 1C A0 3B 21 11 16 1B 5E 98 00 00 16 04 0B 47 
  }


  function bool ResetValues(GUI_Component aButton) {
    local export editinline Game_EquippedAppearance characterAppearance;
    if (aButton != None) {                                                      //0000 : 07 68 00 77 00 58 27 08 1B 2A 16 
      characterAppearance = GetPreviewAppearance();                             //000B : 0F 00 E8 C6 04 1B 1B 41 98 00 00 16 
      characterAppearance.SetValue(23,0,0);                                     //0017 : 19 00 E8 C6 04 1B 0B 00 00 1B 37 0C 00 00 24 17 25 24 00 16 
      characterAppearance.SetValue(23,0,1);                                     //002B : 19 00 E8 C6 04 1B 0B 00 00 1B 37 0C 00 00 24 17 25 24 01 16 
      characterAppearance.SetValue(23,0,2);                                     //003F : 19 00 E8 C6 04 1B 0B 00 00 1B 37 0C 00 00 24 17 25 24 02 16 
      characterAppearance.Apply();                                              //0053 : 19 00 E8 C6 04 1B 06 00 00 1C A0 3B 21 11 16 
      UpdateAnimation();                                                        //0062 : 1B 5E 98 00 00 16 
    }
    return Super.ResetValues(aButton);                                          //0068 : 04 1C 88 F8 2A 26 00 58 27 08 1B 16 
    //07 68 00 77 00 58 27 08 1B 2A 16 0F 00 E8 C6 04 1B 1B 41 98 00 00 16 19 00 E8 C6 04 1B 0B 00 00 
    //1B 37 0C 00 00 24 17 25 24 00 16 19 00 E8 C6 04 1B 0B 00 00 1B 37 0C 00 00 24 17 25 24 01 16 19 
    //00 E8 C6 04 1B 0B 00 00 1B 37 0C 00 00 24 17 25 24 02 16 19 00 E8 C6 04 1B 06 00 00 1C A0 3B 21 
    //11 16 1B 5E 98 00 00 16 04 1C 88 F8 2A 26 00 58 27 08 1B 16 04 0B 47 
  }


  function OnNext(HUD_CC_Option Item,int aDelta) {
    local int val;
    local int Max;
    local export editinline Game_EquippedAppearance characterAppearance;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 00 63 04 1B 1B 41 98 00 00 16 
    UpdateCurrentTattoo(Item);                                                  //000C : 1B 29 99 00 00 00 00 25 08 1B 16 
    Max = characterAppearance.GetAppearanceSet().PCTattooSet.Length;            //0017 : 0F 00 38 8E 07 1B 37 19 19 00 00 63 04 1B 06 00 04 1B B4 0E 00 00 16 05 00 00 01 B8 7A 35 11 
    val = static.Mod(characterAppearance.GetValue(23,mLastSelectedTattoo - 1) + aDelta,Max);//0036 : 0F 00 48 C5 04 1B 1C 60 4D 6B 0F 92 19 00 00 63 04 1B 12 00 04 1B 7D 0C 00 00 24 17 39 3D 93 01 B8 C0 2C 26 26 16 16 00 08 2C 33 26 16 00 38 8E 07 1B 16 
    if (val < 0) {                                                              //0069 : 07 80 00 96 00 48 C5 04 1B 25 16 
      val += Max;                                                               //0074 : A1 00 48 C5 04 1B 00 38 8E 07 1B 16 
    }
    characterAppearance.SetValue(23,val,mLastSelectedTattoo - 1);               //0080 : 19 00 00 63 04 1B 17 00 00 1B 37 0C 00 00 24 17 00 48 C5 04 1B 39 3D 93 01 B8 C0 2C 26 26 16 16 
    if (Item.IsLocked() && mLastSelectedTattooDup != -1) {                      //00A0 : 07 E3 00 82 19 00 00 25 08 1B 06 00 04 1B CF 96 00 00 16 18 0D 00 9B 01 D0 C4 04 1B 1D FF FF FF FF 16 16 
      characterAppearance.SetValue(23,val,mLastSelectedTattooDup - 1);          //00C3 : 19 00 00 63 04 1B 17 00 00 1B 37 0C 00 00 24 17 00 48 C5 04 1B 39 3D 93 01 D0 C4 04 1B 26 16 16 
    }
    characterAppearance.Apply();                                                //00E3 : 19 00 00 63 04 1B 06 00 00 1C A0 3B 21 11 16 
    //0F 00 00 63 04 1B 1B 41 98 00 00 16 1B 29 99 00 00 00 00 25 08 1B 16 0F 00 38 8E 07 1B 37 19 19 
    //00 00 63 04 1B 06 00 04 1B B4 0E 00 00 16 05 00 00 01 B8 7A 35 11 0F 00 48 C5 04 1B 1C 60 4D 6B 
    //0F 92 19 00 00 63 04 1B 12 00 04 1B 7D 0C 00 00 24 17 39 3D 93 01 B8 C0 2C 26 26 16 16 00 08 2C 
    //33 26 16 00 38 8E 07 1B 16 07 80 00 96 00 48 C5 04 1B 25 16 A1 00 48 C5 04 1B 00 38 8E 07 1B 16 
    //19 00 00 63 04 1B 17 00 00 1B 37 0C 00 00 24 17 00 48 C5 04 1B 39 3D 93 01 B8 C0 2C 26 26 16 16 
    //07 E3 00 82 19 00 00 25 08 1B 06 00 04 1B CF 96 00 00 16 18 0D 00 9B 01 D0 C4 04 1B 1D FF FF FF 
    //FF 16 16 19 00 00 63 04 1B 17 00 00 1B 37 0C 00 00 24 17 00 48 C5 04 1B 39 3D 93 01 D0 C4 04 1B 
    //26 16 16 19 00 00 63 04 1B 06 00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  function UpdateTattooCamera() {
    local Vector V;
    local export editinline Game_EquippedAppearance characterAppearance;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 10 24 08 1B 1B 41 98 00 00 16 
    switch (mLastSelectedTattoo) {                                              //000C : 05 04 01 B8 C0 2C 26 
      case 1 :                                                                  //0013 : 0A 2D 00 26 
        V = vect(110.000000, 0.000000, 16.000000);                              //0017 : 0F 00 70 1F 06 1B 23 00 00 DC 42 00 00 00 00 00 00 80 41 
        break;                                                                  //002A : 06 66 00 
      case 3 :                                                                  //002D : 0A 48 00 2C 03 
        V = vect(90.000000, 16384.000000, 16.000000);                           //0032 : 0F 00 70 1F 06 1B 23 00 00 B4 42 00 00 80 46 00 00 80 41 
        break;                                                                  //0045 : 06 66 00 
      case 5 :                                                                  //0048 : 0A 63 00 2C 05 
        V = vect(90.000000, 49152.000000, 16.000000);                           //004D : 0F 00 70 1F 06 1B 23 00 00 B4 42 00 00 40 47 00 00 80 41 
        break;                                                                  //0060 : 06 66 00 
      default:                                                                  //0063 : 0A FF FF 
    }
    if (characterAppearance.GetGender() == 1) {                                 //0066 : 07 8D 00 9A 39 3A 19 00 10 24 08 1B 06 00 01 1B 6F 05 00 00 16 26 16 
      V.X += 20;                                                                //007D : B8 36 48 C4 69 0F 00 70 1F 06 1B 39 3F 2C 14 16 
    }
    //0F 00 10 24 08 1B 1B 41 98 00 00 16 05 04 01 B8 C0 2C 26 0A 2D 00 26 0F 00 70 1F 06 1B 23 00 00 
    //DC 42 00 00 00 00 00 00 80 41 06 66 00 0A 48 00 2C 03 0F 00 70 1F 06 1B 23 00 00 B4 42 00 00 80 
    //46 00 00 80 41 06 66 00 0A 63 00 2C 05 0F 00 70 1F 06 1B 23 00 00 B4 42 00 00 40 47 00 00 80 41 
    //06 66 00 0A FF FF 07 8D 00 9A 39 3A 19 00 10 24 08 1B 06 00 01 1B 6F 05 00 00 16 26 16 B8 36 48 
    //C4 69 0F 00 70 1F 06 1B 39 3F 2C 14 16 04 0B 47 
  }


  function UpdateCurrentTattoo(HUD_CC_Option Item) {
    switch (Item) {                                                             //0000 : 05 04 00 50 90 07 1B 
      case mOptions[0] :                                                        //0007 : 0A 26 00 10 25 01 A8 F2 2B 26 
        mLastSelectedTattoo = 1;                                                //0011 : 0F 01 B8 C0 2C 26 26 
        mLastSelectedTattooDup = -1;                                            //0018 : 0F 01 D0 C4 04 1B 1D FF FF FF FF 
        break;                                                                  //0023 : 06 7E 00 
      case mOptions[1] :                                                        //0026 : 0A 7B 00 10 26 01 A8 F2 2B 26 
        if (Item.IsLocked() || Item.SelectedLeft()) {                           //0030 : 07 61 00 84 19 00 50 90 07 1B 06 00 04 1B CF 96 00 00 16 18 10 00 19 00 50 90 07 1B 06 00 04 1B B5 98 00 00 16 16 
          mLastSelectedTattoo = 2;                                              //0056 : 0F 01 B8 C0 2C 26 2C 02 
        } else {                                                                //005E : 06 69 00 
          mLastSelectedTattoo = 3;                                              //0061 : 0F 01 B8 C0 2C 26 2C 03 
        }
        mLastSelectedTattooDup = 5 - mLastSelectedTattoo;                       //0069 : 0F 01 D0 C4 04 1B 93 2C 05 01 B8 C0 2C 26 16 
        break;                                                                  //0078 : 06 7E 00 
      default:                                                                  //007B : 0A FF FF 
    }
    UpdateTattooCamera();                                                       //007E : 1B 82 9A 00 00 16 
    //05 04 00 50 90 07 1B 0A 26 00 10 25 01 A8 F2 2B 26 0F 01 B8 C0 2C 26 26 0F 01 D0 C4 04 1B 1D FF 
    //FF FF FF 06 7E 00 0A 7B 00 10 26 01 A8 F2 2B 26 07 61 00 84 19 00 50 90 07 1B 06 00 04 1B CF 96 
    //00 00 16 18 10 00 19 00 50 90 07 1B 06 00 04 1B B5 98 00 00 16 16 0F 01 B8 C0 2C 26 2C 02 06 69 
    //00 0F 01 B8 C0 2C 26 2C 03 0F 01 D0 C4 04 1B 93 2C 05 01 B8 C0 2C 26 16 06 7E 00 0A FF FF 1B 82 
    //9A 00 00 16 04 0B 47 
  }


  function OnTattooButton(HUD_CC_Option Item) {
    UpdateCurrentTattoo(Item);                                                  //0000 : 1B 29 99 00 00 00 F0 29 33 26 16 
    //1B 29 99 00 00 00 F0 29 33 26 16 04 0B 47 
  }


  function ApplyRandomization(export editinline Game_EquippedAppearance characterAppearance) {
    characterAppearance.SetRandom(67108864,0,False,True,False,False,False,mOptions[1].mLocked);//0000 : 19 00 C8 28 33 26 22 00 00 1B E9 0E 00 00 1D 00 00 00 04 25 28 27 28 28 28 19 10 26 01 A8 F2 2B 26 06 00 04 2D 01 D0 48 2B 26 16 
    //19 00 C8 28 33 26 22 00 00 1B E9 0E 00 00 1D 00 00 00 04 25 28 27 28 28 28 19 10 26 01 A8 F2 2B 
    //26 06 00 04 2D 01 D0 48 2B 26 16 04 0B 47 
  }


  event Initialize() {
    local int i;
    Super.Initialize();                                                         //0000 : 1C 48 DC 2A 26 16 
    SetIcon("header_tattoo","SBGuiTX.CC_Styles","CC_Styles");                   //0006 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 74 61 74 74 6F 6F 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    i = 0;                                                                      //0039 : 0F 00 88 5A 2B 26 25 
    while (i < 2) {                                                             //0040 : 07 26 01 96 00 88 5A 2B 26 2C 02 16 
      mOptions[i] = HUD_CC_Option(mMainPane.CreatePage("HUD_CC_Option",0,0,6,6 + i * 40,0,0));//004C : 0F 10 00 88 5A 2B 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 01 88 51 EC 25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 92 2C 06 90 00 88 5A 2B 26 2C 28 16 16 25 25 16 
      mOptions[i].mOwnerWindow = self;                                          //008E : 0F 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 05 00 04 01 C8 9C 2B 26 17 
      mOptions[i].SetSides(False);                                              //00A4 : 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 
      mOptions[i].SetColorPos(2);                                               //00BA : 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 02 16 
      mOptions[i].__OnNext__Delegate = OnNext;                                  //00D1 : 45 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 05 00 08 01 D0 2C 8A 19 44 0F 97 00 00 
      mOptions[i].__OnMirror__Delegate = OnMirror;                              //00EB : 45 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 05 00 08 01 20 29 05 1B 44 08 97 00 00 
      mOptions[i].HasColors = False;                                            //0105 : 14 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 06 00 04 2D 01 98 C9 05 1B 28 
      i++;                                                                      //011C : A5 00 88 5A 2B 26 16 
    }
    mOptions[0].SetTitle(Class'SBGuiStrings'.default.Chest.Text);               //0126 : 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 46 98 19 16 
    mOptions[1].SetTitle(Class'SBGuiStrings'.default.Upper_Arm.Text);           //014A : 19 10 26 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 8E 98 19 16 
    mOptions[1].mPart = 23;                                                     //016E : 0F 19 10 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 17 
    mOptions[1].SetSides(True);                                                 //0181 : 19 10 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 27 16 
    //1C 48 DC 2A 26 16 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 74 61 74 74 6F 6F 00 1F 53 42 47 75 69 
    //54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 0F 00 88 5A 2B 26 25 
    //07 26 01 96 00 88 5A 2B 26 2C 02 16 0F 10 00 88 5A 2B 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 01 88 
    //51 EC 25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 92 2C 
    //06 90 00 88 5A 2B 26 2C 28 16 16 25 25 16 0F 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 05 00 04 01 C8 
    //9C 2B 26 17 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 19 10 00 88 5A 2B 
    //26 01 A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 02 16 45 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 05 00 
    //08 01 D0 2C 8A 19 44 0F 97 00 00 45 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 05 00 08 01 20 29 05 1B 
    //44 08 97 00 00 14 19 10 00 88 5A 2B 26 01 A8 F2 2B 26 06 00 04 2D 01 98 C9 05 1B 28 A5 00 88 5A 
    //2B 26 16 06 40 00 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 C8 46 98 19 16 19 10 26 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 D8 8E 98 19 16 0F 19 10 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 
    //17 19 10 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 27 16 04 0B 47 
  }



