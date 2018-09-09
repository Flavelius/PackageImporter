//==============================================================================
//  HUD_CC_Head
//==============================================================================

class HUD_CC_Head extends HUD_CC_Window
    dependsOn()
    Transient
    Config(User)
  ;

  const PLAYER_VOICE_COUNT =  8;

  function bool HasInfo() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function SetInfoText() {
    OnSetInfoText(Class'SBGuiStrings'.default.You_can_select_your_Facial_Features_and_Hair_Style_here.Text,Class'SBGuiStrings'.default.Press_Next_to_continue.Text);//0000 : 1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 47 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 46 99 19 16 
    //1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 47 99 19 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 E0 46 99 19 16 04 0B 47 
  }


  function SetOptionColors(bool aUpdateLock) {
    mOptions[1].UpdateColors(mOptions[1].mPart);                                //0000 : 19 10 26 01 A8 F2 2B 26 16 00 00 1B 6D 98 00 00 19 10 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 16 
    ClosePicker();                                                              //0021 : 1B 5C 98 00 00 16 
    //19 10 26 01 A8 F2 2B 26 16 00 00 1B 6D 98 00 00 19 10 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 
    //16 1B 5C 98 00 00 16 04 0B 47 
  }


  function bool ResetValues(GUI_Component aButton) {
    local export editinline Game_EquippedAppearance characterAppearance;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 78 FE 04 1B 1B 41 98 00 00 16 
    if (aButton != None) {                                                      //000C : 07 6C 00 77 00 E8 62 06 1B 2A 16 
      characterAppearance.SetValue(22,0);                                       //0017 : 19 00 78 FE 04 1B 09 00 00 1B 37 0C 00 00 24 16 25 16 
      characterAppearance.SetValue(18,0);                                       //0029 : 19 00 78 FE 04 1B 09 00 00 1B 37 0C 00 00 24 12 25 16 
      characterAppearance.SetColorValue(18,0,0);                                //003B : 19 00 78 FE 04 1B 0C 00 00 1B 04 0C 00 00 24 12 24 00 24 00 16 
      SetVoice(0);                                                              //0050 : 1B 75 0C 00 00 25 16 
      characterAppearance.Apply();                                              //0057 : 19 00 78 FE 04 1B 06 00 00 1C A0 3B 21 11 16 
      UpdateAnimation();                                                        //0066 : 1B 5E 98 00 00 16 
    }
    SetOptionColors(False);                                                     //006C : 1B 80 98 00 00 28 16 
    return Super.ResetValues(aButton);                                          //0073 : 04 1C 88 F8 2A 26 00 E8 62 06 1B 16 
    //0F 00 78 FE 04 1B 1B 41 98 00 00 16 07 6C 00 77 00 E8 62 06 1B 2A 16 19 00 78 FE 04 1B 09 00 00 
    //1B 37 0C 00 00 24 16 25 16 19 00 78 FE 04 1B 09 00 00 1B 37 0C 00 00 24 12 25 16 19 00 78 FE 04 
    //1B 0C 00 00 1B 04 0C 00 00 24 12 24 00 24 00 16 1B 75 0C 00 00 25 16 19 00 78 FE 04 1B 06 00 00 
    //1C A0 3B 21 11 16 1B 5E 98 00 00 16 1B 80 98 00 00 28 16 04 1C 88 F8 2A 26 00 E8 62 06 1B 16 04 
    //0B 47 
  }


  private function SetVoice(int val) {
    GetPreviewAppearance().SetVoice(val);                                       //0000 : 19 1B 41 98 00 00 16 0D 00 00 1B 75 0C 00 00 39 3D 00 80 61 06 1B 16 
    Game_Pawn(GetPreviewPage().mMeshActor).StaticStopSound(6);                  //0017 : 19 2E 18 38 5B 01 19 1B 91 98 00 00 16 05 00 04 01 08 0C A3 19 08 00 00 1B 2B 06 00 00 24 06 16 
    mOptions[2].SetTitle(Class'SBGuiStrings'.default.Voice.Text
      @ "#"
      $ string(val + 1));//0037 : 19 10 2C 02 01 A8 F2 2B 26 2A 00 00 1B 0A 2C 00 00 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 64 98 19 1F 23 00 16 39 53 92 00 80 61 06 1B 26 16 16 16 
    Game_Pawn(GetPreviewPage().mMeshActor).StaticPlaySound(73,1024.00000000);   //006D : 19 2E 18 38 5B 01 19 1B 91 98 00 00 16 05 00 04 01 08 0C A3 19 0D 00 04 1B 29 06 00 00 24 49 1E 00 00 80 44 16 
    //19 1B 41 98 00 00 16 0D 00 00 1B 75 0C 00 00 39 3D 00 80 61 06 1B 16 19 2E 18 38 5B 01 19 1B 91 
    //98 00 00 16 05 00 04 01 08 0C A3 19 08 00 00 1B 2B 06 00 00 24 06 16 19 10 2C 02 01 A8 F2 2B 26 
    //2A 00 00 1B 0A 2C 00 00 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 64 98 19 1F 23 00 
    //16 39 53 92 00 80 61 06 1B 26 16 16 16 19 2E 18 38 5B 01 19 1B 91 98 00 00 16 05 00 04 01 08 0C 
    //A3 19 0D 00 04 1B 29 06 00 00 24 49 1E 00 00 80 44 16 04 0B 47 
  }


  function OnNext(HUD_CC_Option Item,int aDelta) {
    local export editinline Game_EquippedAppearance characterAppearance;
    local int val;
    local int headVar;
    local int Max;
    local int Head;
    local int MainWeapon;
    local int offhandWeapon;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 E0 3D 2B 26 1B 41 98 00 00 16 
    MainWeapon = characterAppearance.GetValue(16);                              //000C : 0F 00 40 5E 06 1B 19 00 E0 3D 2B 26 08 00 04 1B 7D 0C 00 00 24 10 16 
    offhandWeapon = characterAppearance.GetValue(17);                           //0023 : 0F 00 B8 5E 06 1B 19 00 E0 3D 2B 26 08 00 04 1B 7D 0C 00 00 24 11 16 
    switch (Item) {                                                             //003A : 05 04 00 D8 AE 07 1B 
      case mOptions[0] :                                                        //0041 : 0A ED 01 10 25 01 A8 F2 2B 26 
        switch (characterAppearance.GetRace()) {                                //004B : 05 01 19 00 E0 3D 2B 26 06 00 01 1B 6C 0F 00 00 16 
          case 0 :                                                              //005C : 0A CF 01 24 00 
            Max = characterAppearance.GetMax(22);                               //0061 : 0F 00 F8 AC 07 1B 19 00 E0 3D 2B 26 08 00 04 1B 65 11 00 00 24 16 16 
            Head = characterAppearance.GetValue(22);                            //0078 : 0F 00 58 25 2C 26 19 00 E0 3D 2B 26 08 00 04 1B 7D 0C 00 00 24 16 16 
            headVar = Head >> 4 & 3;                                            //008F : 0F 00 48 9E 04 1B 9C 95 00 58 25 2C 26 2C 04 16 2C 03 16 
            headVar += aDelta;                                                  //00A2 : A1 00 48 9E 04 1B 00 48 1B 05 1B 16 
            if (headVar == -1) {                                                //00AE : 07 02 01 9A 00 48 9E 04 1B 1D FF FF FF FF 16 
              Head = (Head & 15) - 1;                                           //00BD : 0F 00 58 25 2C 26 93 9C 00 58 25 2C 26 2C 0F 16 26 16 
              if (Head == -1) {                                                 //00CF : 07 EC 00 9A 00 58 25 2C 26 1D FF FF FF FF 16 
                Head = Max - 1;                                                 //00DE : 0F 00 58 25 2C 26 93 00 F8 AC 07 1B 26 16 
              }
              Head = Head | 3 << 4;                                             //00EC : 0F 00 58 25 2C 26 9E 00 58 25 2C 26 94 2C 03 2C 04 16 16 
            } else {                                                            //00FF : 06 65 01 
              if (headVar == 4) {                                               //0102 : 07 4B 01 9A 00 48 9E 04 1B 2C 04 16 
                Head = (Head & 15) + 1;                                         //010E : 0F 00 58 25 2C 26 92 9C 00 58 25 2C 26 2C 0F 16 26 16 
                if (Head == Max) {                                              //0120 : 07 36 01 9A 00 58 25 2C 26 00 F8 AC 07 1B 16 
                  Head = 0;                                                     //012F : 0F 00 58 25 2C 26 25 
                }
                Head = Head | 0 << 4;                                           //0136 : 0F 00 58 25 2C 26 9E 00 58 25 2C 26 94 25 2C 04 16 16 
              } else {                                                          //0148 : 06 65 01 
                Head = Head & 15 | headVar << 4;                                //014B : 0F 00 58 25 2C 26 9E 9C 00 58 25 2C 26 2C 0F 16 94 00 48 9E 04 1B 2C 04 16 16 
              }
            }
            characterAppearance.SetValue(22,Head);                              //0165 : 19 00 E0 3D 2B 26 0D 00 00 1B 37 0C 00 00 24 16 00 58 25 2C 26 16 
            characterAppearance.CheckCompatibility(True);                       //017B : 19 00 E0 3D 2B 26 07 00 00 1B 8D 04 00 00 27 16 
            characterAppearance.SetValue(16,MainWeapon);                        //018B : 19 00 E0 3D 2B 26 0D 00 00 1B 37 0C 00 00 24 10 00 40 5E 06 1B 16 
            characterAppearance.SetValue(17,offhandWeapon);                     //01A1 : 19 00 E0 3D 2B 26 0D 00 00 1B 37 0C 00 00 24 11 00 B8 5E 06 1B 16 
            characterAppearance.Apply();                                        //01B7 : 19 00 E0 3D 2B 26 06 00 00 1C A0 3B 21 11 16 
            UpdateAnimation();                                                  //01C6 : 1B 5E 98 00 00 16 
            break;                                                              //01CC : 06 EA 01 
          case 1 :                                                              //01CF : 0A E7 01 24 01 
            Super.OnNext(Item,aDelta);                                          //01D4 : 1C C8 A0 89 19 00 D8 AE 07 1B 00 48 1B 05 1B 16 
            break;                                                              //01E4 : 06 EA 01 
          default:                                                              //01E7 : 0A FF FF 
        }
        break;                                                                  //01EA : 06 60 02 
      case mOptions[1] :                                                        //01ED : 0A 0A 02 10 26 01 A8 F2 2B 26 
        Super.OnNext(Item,aDelta);                                              //01F7 : 1C C8 A0 89 19 00 D8 AE 07 1B 00 48 1B 05 1B 16 
        break;                                                                  //0207 : 06 60 02 
      case mOptions[2] :                                                        //020A : 0A 5D 02 10 2C 02 01 A8 F2 2B 26 
        val = static.Mod(characterAppearance.GetVoice() + aDelta,8);            //0215 : 0F 00 28 23 05 1B 1C 60 4D 6B 0F 92 39 3A 19 00 E0 3D 2B 26 06 00 01 1B 41 11 00 00 16 00 48 1B 05 1B 16 2C 08 16 
        if (val < 0) {                                                          //023B : 07 4F 02 96 00 28 23 05 1B 25 16 
          val += 8;                                                             //0246 : A1 00 28 23 05 1B 2C 08 16 
        }
        SetVoice(val);                                                          //024F : 1B 75 0C 00 00 00 28 23 05 1B 16 
        break;                                                                  //025A : 06 60 02 
      default:                                                                  //025D : 0A FF FF 
      }
    }
    //0F 00 E0 3D 2B 26 1B 41 98 00 00 16 0F 00 40 5E 06 1B 19 00 E0 3D 2B 26 08 00 04 1B 7D 0C 00 00 
    //24 10 16 0F 00 B8 5E 06 1B 19 00 E0 3D 2B 26 08 00 04 1B 7D 0C 00 00 24 11 16 05 04 00 D8 AE 07 
    //1B 0A ED 01 10 25 01 A8 F2 2B 26 05 01 19 00 E0 3D 2B 26 06 00 01 1B 6C 0F 00 00 16 0A CF 01 24 
    //00 0F 00 F8 AC 07 1B 19 00 E0 3D 2B 26 08 00 04 1B 65 11 00 00 24 16 16 0F 00 58 25 2C 26 19 00 
    //E0 3D 2B 26 08 00 04 1B 7D 0C 00 00 24 16 16 0F 00 48 9E 04 1B 9C 95 00 58 25 2C 26 2C 04 16 2C 
    //03 16 A1 00 48 9E 04 1B 00 48 1B 05 1B 16 07 02 01 9A 00 48 9E 04 1B 1D FF FF FF FF 16 0F 00 58 
    //25 2C 26 93 9C 00 58 25 2C 26 2C 0F 16 26 16 07 EC 00 9A 00 58 25 2C 26 1D FF FF FF FF 16 0F 00 
    //58 25 2C 26 93 00 F8 AC 07 1B 26 16 0F 00 58 25 2C 26 9E 00 58 25 2C 26 94 2C 03 2C 04 16 16 06 
    //65 01 07 4B 01 9A 00 48 9E 04 1B 2C 04 16 0F 00 58 25 2C 26 92 9C 00 58 25 2C 26 2C 0F 16 26 16 
    //07 36 01 9A 00 58 25 2C 26 00 F8 AC 07 1B 16 0F 00 58 25 2C 26 25 0F 00 58 25 2C 26 9E 00 58 25 
    //2C 26 94 25 2C 04 16 16 06 65 01 0F 00 58 25 2C 26 9E 9C 00 58 25 2C 26 2C 0F 16 94 00 48 9E 04 
    //1B 2C 04 16 16 19 00 E0 3D 2B 26 0D 00 00 1B 37 0C 00 00 24 16 00 58 25 2C 26 16 19 00 E0 3D 2B 
    //26 07 00 00 1B 8D 04 00 00 27 16 19 00 E0 3D 2B 26 0D 00 00 1B 37 0C 00 00 24 10 00 40 5E 06 1B 
    //16 19 00 E0 3D 2B 26 0D 00 00 1B 37 0C 00 00 24 11 00 B8 5E 06 1B 16 19 00 E0 3D 2B 26 06 00 00 
    //1C A0 3B 21 11 16 1B 5E 98 00 00 16 06 EA 01 0A E7 01 24 01 1C C8 A0 89 19 00 D8 AE 07 1B 00 48 
    //1B 05 1B 16 06 EA 01 0A FF FF 06 60 02 0A 0A 02 10 26 01 A8 F2 2B 26 1C C8 A0 89 19 00 D8 AE 07 
    //1B 00 48 1B 05 1B 16 06 60 02 0A 5D 02 10 2C 02 01 A8 F2 2B 26 0F 00 28 23 05 1B 1C 60 4D 6B 0F 
    //92 39 3A 19 00 E0 3D 2B 26 06 00 01 1B 41 11 00 00 16 00 48 1B 05 1B 16 2C 08 16 07 4F 02 96 00 
    //28 23 05 1B 25 16 A1 00 28 23 05 1B 2C 08 16 1B 75 0C 00 00 00 28 23 05 1B 16 06 60 02 0A FF FF 
    //04 0B 47 
  }


  function OnComponentShown() {
    UpdateAnimation();                                                          //0000 : 1B 5E 98 00 00 16 
    //1B 5E 98 00 00 16 04 0B 47 
  }


  function ApplyRandomization(export editinline Game_EquippedAppearance characterAppearance) {
    characterAppearance.SetRandom(8 + 16777216 + 33554432,262144,False,True,False,False,False,False);//0000 : 19 00 40 1B 33 26 21 00 00 1B E9 0E 00 00 92 92 2C 08 1D 00 00 00 01 16 1D 00 00 00 02 16 1D 00 00 04 00 28 27 28 28 28 28 16 
    //19 00 40 1B 33 26 21 00 00 1B E9 0E 00 00 92 92 2C 08 1D 00 00 00 01 16 1D 00 00 00 02 16 1D 00 
    //00 04 00 28 27 28 28 28 28 16 04 0B 47 
  }


  event Initialize() {
    local int i;
    Super.Initialize();                                                         //0000 : 1C 48 DC 2A 26 16 
    SetIcon("header_face","SBGuiTX.CC_Styles","CC_Styles");                     //0006 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 66 61 63 65 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    i = 0;                                                                      //0037 : 0F 00 C0 3E 2C 26 25 
    while (i < 3) {                                                             //003E : 07 41 01 96 00 C0 3E 2C 26 2C 03 16 
      mOptions[i] = HUD_CC_Option(mMainPane.CreatePage("HUD_CC_Option",0,0,6,6 + i * 40,0,0));//004A : 0F 10 00 C0 3E 2C 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 01 88 51 EC 25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 92 2C 06 90 00 C0 3E 2C 26 2C 28 16 16 25 25 16 
      mOptions[i].mOwnerWindow = self;                                          //008C : 0F 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 04 01 C8 9C 2B 26 17 
      mOptions[i].SetSides(False);                                              //00A2 : 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 
      mOptions[i].SetColorPos(2);                                               //00B8 : 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 02 16 
      mOptions[i].__OnNext__Delegate = OnNext;                                  //00CF : 45 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 D0 2C 8A 19 44 0F 97 00 00 
      mOptions[i].__OnSetColor__Delegate = OnSetColor;                          //00E9 : 45 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 60 FA 2C 26 44 21 97 00 00 
      mOptions[i].__OnOpenPicker__Delegate = OnOpenPicker;                      //0103 : 45 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 30 FD 2C 26 44 10 97 00 00 
      mOptions[i].__OnGetPalette__Delegate = OnGetPalette;                      //011D : 45 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 E0 2B 8A 19 44 F6 96 00 00 
      i++;                                                                      //0137 : A5 00 C0 3E 2C 26 16 
    }
    mOptions[0].SetTitle(Class'SBGuiStrings'.default.Head_Type.Text);           //0141 : 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 DD 98 19 16 
    mOptions[0].mPart = 22;                                                     //0165 : 0F 19 10 25 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 16 
    mOptions[1].SetTitle(Class'SBGuiStrings'.default.Hair_Type.Text);           //0178 : 19 10 26 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 5B 98 19 16 
    mOptions[1].mPart = 18;                                                     //019C : 0F 19 10 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 12 
    mOptions[2].SetTitle(Class'SBGuiStrings'.default.Voice.Text
      @ "#1");  //01AF : 19 10 2C 02 01 A8 F2 2B 26 1F 00 00 1B 0A 2C 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 64 98 19 1F 23 31 00 16 16 
    //1C 48 DC 2A 26 16 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 66 61 63 65 00 1F 53 42 47 75 69 54 58 
    //2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 0F 00 C0 3E 2C 26 25 07 41 
    //01 96 00 C0 3E 2C 26 2C 03 16 0F 10 00 C0 3E 2C 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 01 88 51 EC 
    //25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 92 2C 06 90 
    //00 C0 3E 2C 26 2C 28 16 16 25 25 16 0F 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 04 01 C8 9C 2B 
    //26 17 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 19 10 00 C0 3E 2C 26 01 
    //A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 02 16 45 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 
    //D0 2C 8A 19 44 0F 97 00 00 45 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 60 FA 2C 26 44 21 
    //97 00 00 45 19 10 00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 30 FD 2C 26 44 10 97 00 00 45 19 10 
    //00 C0 3E 2C 26 01 A8 F2 2B 26 05 00 08 01 E0 2B 8A 19 44 F6 96 00 00 A5 00 C0 3E 2C 26 16 06 3E 
    //00 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //58 DD 98 19 16 0F 19 10 25 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 16 19 10 26 01 A8 F2 2B 26 
    //19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 5B 98 19 16 0F 19 10 26 
    //01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 12 19 10 2C 02 01 A8 F2 2B 26 1F 00 00 1B 0A 2C 00 00 
    //A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 64 98 19 1F 23 31 00 16 16 04 0B 47 
  }



