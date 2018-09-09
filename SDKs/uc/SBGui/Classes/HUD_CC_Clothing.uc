//==============================================================================
//  HUD_CC_Clothing
//==============================================================================

class HUD_CC_Clothing extends HUD_CC_Window
    dependsOn(Game_Appearance,StringReferences)
    Transient
    Config(User)
  ;


  function SetInfoText() {
    OnSetInfoText(Class'SBGuiStrings'.default.You_can_select_your_clothing_here.Text,Class'SBGuiStrings'.default.Press_Next_to_continue.Text);//0000 : 1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 48 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 46 99 19 16 
    //1B 98 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 48 99 19 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 E0 46 99 19 16 04 0B 47 
  }


  function SetItemInfo(HUD_CC_Option Item) {
    local export editinline Game_EquippedAppearance characterAppearance;
    local export editinline Item_Type ItemType;
    characterAppearance = GetPreviewAppearance();                               //0000 : 0F 00 08 C2 04 1B 1B 41 98 00 00 16 
    if (Item != None) {                                                         //000C : 07 0D 01 77 00 D8 AF 2C 26 2A 16 
      ItemType = Appearance_Base(characterAppearance.GetAppearanceResource(Item.mPart,characterAppearance.GetValue(Item.mPart)))._IT;//0017 : 0F 00 60 80 06 1B 19 2E 70 CD 5F 01 19 00 08 C2 04 1B 31 00 04 1B 08 0D 00 00 19 00 D8 AF 2C 26 05 00 01 01 F0 EF EB 25 19 00 08 C2 04 1B 14 00 04 1B 7D 0C 00 00 19 00 D8 AF 2C 26 05 00 01 01 F0 EF EB 25 16 16 05 00 04 01 D8 73 21 11 
      mInfoWindow.SetItem(Item.mPart,ItemType,0,0);                             //0065 : 19 01 78 EF EB 25 1B 00 00 1B 4A 97 00 00 19 00 D8 AF 2C 26 05 00 01 01 F0 EF EB 25 00 60 80 06 1B 25 25 16 
      if (Item.mHasSides) {                                                     //0089 : 07 0D 01 19 00 D8 AF 2C 26 06 00 04 2D 01 C8 1D 2C 26 
        ItemType = Appearance_Base(characterAppearance.GetAppearanceResource(Item.mPartRight,characterAppearance.GetValue(Item.mPartRight)))._IT;//009B : 0F 00 60 80 06 1B 19 2E 70 CD 5F 01 19 00 08 C2 04 1B 31 00 04 1B 08 0D 00 00 19 00 D8 AF 2C 26 05 00 01 01 E0 88 8A 19 19 00 08 C2 04 1B 14 00 04 1B 7D 0C 00 00 19 00 D8 AF 2C 26 05 00 01 01 E0 88 8A 19 16 16 05 00 04 01 D8 73 21 11 
        mInfoWindow.SetItem(Item.mPartRight,ItemType,0,0);                      //00E9 : 19 01 78 EF EB 25 1B 00 00 1B 4A 97 00 00 19 00 D8 AF 2C 26 05 00 01 01 E0 88 8A 19 00 60 80 06 1B 25 25 16 
      }
    }
    //0F 00 08 C2 04 1B 1B 41 98 00 00 16 07 0D 01 77 00 D8 AF 2C 26 2A 16 0F 00 60 80 06 1B 19 2E 70 
    //CD 5F 01 19 00 08 C2 04 1B 31 00 04 1B 08 0D 00 00 19 00 D8 AF 2C 26 05 00 01 01 F0 EF EB 25 19 
    //00 08 C2 04 1B 14 00 04 1B 7D 0C 00 00 19 00 D8 AF 2C 26 05 00 01 01 F0 EF EB 25 16 16 05 00 04 
    //01 D8 73 21 11 19 01 78 EF EB 25 1B 00 00 1B 4A 97 00 00 19 00 D8 AF 2C 26 05 00 01 01 F0 EF EB 
    //25 00 60 80 06 1B 25 25 16 07 0D 01 19 00 D8 AF 2C 26 06 00 04 2D 01 C8 1D 2C 26 0F 00 60 80 06 
    //1B 19 2E 70 CD 5F 01 19 00 08 C2 04 1B 31 00 04 1B 08 0D 00 00 19 00 D8 AF 2C 26 05 00 01 01 E0 
    //88 8A 19 19 00 08 C2 04 1B 14 00 04 1B 7D 0C 00 00 19 00 D8 AF 2C 26 05 00 01 01 E0 88 8A 19 16 
    //16 05 00 04 01 D8 73 21 11 19 01 78 EF EB 25 1B 00 00 1B 4A 97 00 00 19 00 D8 AF 2C 26 05 00 01 
    //01 E0 88 8A 19 00 60 80 06 1B 25 25 16 04 0B 47 
  }


  function OnNext(HUD_CC_Option Item,int aDelta) {
    Super.OnNext(Item,aDelta);                                                  //0000 : 1C C8 A0 89 19 00 58 60 06 1B 00 10 1E 33 26 16 
    SetItemInfo(Item);                                                          //0010 : 1B BA 98 00 00 00 58 60 06 1B 16 
    //1C C8 A0 89 19 00 58 60 06 1B 00 10 1E 33 26 16 1B BA 98 00 00 00 58 60 06 1B 16 04 0B 47 
  }


  function bool ResetValues(GUI_Component aButton) {
    local export editinline Game_EquippedAppearance characterAppearance;
    local int i;
    if (aButton != None) {                                                      //0000 : 07 4D 01 77 00 60 63 06 1B 2A 16 
      characterAppearance = GetPreviewAppearance();                             //000B : 0F 00 38 AE 2C 26 1B 41 98 00 00 16 
      i = 0;                                                                    //0017 : 0F 00 88 8B 2B 26 25 
      while (i < mOptions.Length) {                                             //001E : 07 38 01 96 00 88 8B 2B 26 37 01 A8 F2 2B 26 16 
        characterAppearance.SetValue(mOptions[i].mPart,0,0);                    //002E : 19 00 38 AE 2C 26 1D 00 00 1B 37 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 25 24 00 16 
        characterAppearance.SetColorValue(mOptions[i].mPart,0,0);               //0054 : 19 00 38 AE 2C 26 1E 00 00 1B 04 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 00 24 00 16 
        characterAppearance.SetColorValue(mOptions[i].mPart,0,1);               //007B : 19 00 38 AE 2C 26 1E 00 00 1B 04 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 00 24 01 16 
        if (mOptions[i].mHasSides) {                                            //00A2 : 07 2E 01 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 06 00 04 2D 01 C8 1D 2C 26 
          characterAppearance.SetValue(mOptions[i].mPartRight,0,0);             //00BA : 19 00 38 AE 2C 26 1D 00 00 1B 37 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 E0 88 8A 19 25 24 00 16 
          characterAppearance.SetColorValue(mOptions[i].mPartRight,0,0);        //00E0 : 19 00 38 AE 2C 26 1E 00 00 1B 04 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 E0 88 8A 19 24 00 24 00 16 
          characterAppearance.SetColorValue(mOptions[i].mPartRight,0,1);        //0107 : 19 00 38 AE 2C 26 1E 00 00 1B 04 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 E0 88 8A 19 24 00 24 01 16 
        }
        i++;                                                                    //012E : A5 00 88 8B 2B 26 16 
      }
      characterAppearance.Apply();                                              //0138 : 19 00 38 AE 2C 26 06 00 00 1C A0 3B 21 11 16 
      UpdateAnimation();                                                        //0147 : 1B 5E 98 00 00 16 
    }
    SetOptionColors(True);                                                      //014D : 1B 80 98 00 00 27 16 
    return Super.ResetValues(aButton);                                          //0154 : 04 1C 88 F8 2A 26 00 60 63 06 1B 16 
    //07 4D 01 77 00 60 63 06 1B 2A 16 0F 00 38 AE 2C 26 1B 41 98 00 00 16 0F 00 88 8B 2B 26 25 07 38 
    //01 96 00 88 8B 2B 26 37 01 A8 F2 2B 26 16 19 00 38 AE 2C 26 1D 00 00 1B 37 0C 00 00 19 10 00 88 
    //8B 2B 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 25 24 00 16 19 00 38 AE 2C 26 1E 00 00 1B 04 0C 
    //00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 00 24 00 16 19 00 38 AE 2C 
    //26 1E 00 00 1B 04 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 00 24 
    //01 16 07 2E 01 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 06 00 04 2D 01 C8 1D 2C 26 19 00 38 AE 2C 26 
    //1D 00 00 1B 37 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 E0 88 8A 19 25 24 00 16 
    //19 00 38 AE 2C 26 1E 00 00 1B 04 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 26 05 00 01 01 E0 88 
    //8A 19 24 00 24 00 16 19 00 38 AE 2C 26 1E 00 00 1B 04 0C 00 00 19 10 00 88 8B 2B 26 01 A8 F2 2B 
    //26 05 00 01 01 E0 88 8A 19 24 00 24 01 16 A5 00 88 8B 2B 26 16 06 1E 00 19 00 38 AE 2C 26 06 00 
    //00 1C A0 3B 21 11 16 1B 5E 98 00 00 16 1B 80 98 00 00 27 16 04 1C 88 F8 2A 26 00 60 63 06 1B 16 
    //04 0B 47 
  }


  function ApplyRandomization(export editinline Game_EquippedAppearance characterAppearance) {
    local int i;
    characterAppearance.SetRandom(16 + 32 + 64 + 128 + 256,2 + 4 + 8 + 16 + 32,False,True,mOptions[1].mLocked,False,False,False);//0000 : 19 00 88 1E 33 26 43 00 00 1B E9 0E 00 00 92 92 92 92 2C 10 2C 20 16 2C 40 16 2C 80 16 1D 00 01 00 00 16 92 92 92 92 2C 02 2C 04 16 2C 08 16 2C 10 16 2C 20 16 28 27 19 10 26 01 A8 F2 2B 26 06 00 04 2D 01 D0 48 2B 26 28 28 28 16 
    i = 0;                                                                      //004C : 0F 00 38 22 05 1B 25 
    while (i < 4) {                                                             //0053 : 07 7A 00 96 00 38 22 05 1B 2C 04 16 
      SetItemInfo(mOptions[i]);                                                 //005F : 1B BA 98 00 00 10 00 38 22 05 1B 01 A8 F2 2B 26 16 
      ++i;                                                                      //0070 : A3 00 38 22 05 1B 16 
    }
    //19 00 88 1E 33 26 43 00 00 1B E9 0E 00 00 92 92 92 92 2C 10 2C 20 16 2C 40 16 2C 80 16 1D 00 01 
    //00 00 16 92 92 92 92 2C 02 2C 04 16 2C 08 16 2C 10 16 2C 20 16 28 27 19 10 26 01 A8 F2 2B 26 06 
    //00 04 2D 01 D0 48 2B 26 28 28 28 16 0F 00 38 22 05 1B 25 07 7A 00 96 00 38 22 05 1B 2C 04 16 1B 
    //BA 98 00 00 10 00 38 22 05 1B 01 A8 F2 2B 26 16 A3 00 38 22 05 1B 16 06 53 00 04 0B 47 
  }


  event DoShowWindow(int flags) {
    local int i;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 48 95 2C 26 00 F0 65 06 1B 16 
    if (flags == 1) {                                                           //000B : 07 F2 00 9A 00 F0 65 06 1B 26 16 
      i = 0;                                                                    //0016 : 0F 00 B8 36 04 1B 25 
      while (i < mOptions.Length) {                                             //001D : 07 5C 00 96 00 B8 36 04 1B 37 01 A8 F2 2B 26 16 
        mOptions[i].OnNext(mOptions[i],0);                                      //002D : 19 10 00 B8 36 04 1B 01 A8 F2 2B 26 16 00 00 43 D0 2C 8A 19 0F 97 00 00 10 00 B8 36 04 1B 01 A8 F2 2B 26 25 16 
        ++i;                                                                    //0052 : A3 00 B8 36 04 1B 16 
      }
      if (GetPreviewAppearance().GetRace() == Class'Game_Appearance'.1) {       //005C : 07 B9 00 9A 39 3A 19 1B 41 98 00 00 16 06 00 01 1B 6C 0F 00 00 16 12 20 30 B3 5F 01 01 00 04 26 16 
        mOptions[3].SetVisible(False);                                          //007D : 19 10 2C 03 01 A8 F2 2B 26 07 00 00 1B 14 98 00 00 28 16 
        mAllColors.mTop = mOptions[2].mTop + 37;                                //0090 : 0F 19 01 08 F0 2A 26 05 00 04 01 80 86 31 16 AE 19 10 2C 02 01 A8 F2 2B 26 05 00 04 01 80 86 31 16 39 3F 2C 25 16 
      } else {                                                                  //00B6 : 06 F2 00 
        mOptions[3].SetVisible(True);                                           //00B9 : 19 10 2C 03 01 A8 F2 2B 26 07 00 00 1B 14 98 00 00 27 16 
        mAllColors.mTop = mOptions[3].mTop + 37;                                //00CC : 0F 19 01 08 F0 2A 26 05 00 04 01 80 86 31 16 AE 19 10 2C 03 01 A8 F2 2B 26 05 00 04 01 80 86 31 16 39 3F 2C 25 16 
      }
    }
    //1C 48 95 2C 26 00 F0 65 06 1B 16 07 F2 00 9A 00 F0 65 06 1B 26 16 0F 00 B8 36 04 1B 25 07 5C 00 
    //96 00 B8 36 04 1B 37 01 A8 F2 2B 26 16 19 10 00 B8 36 04 1B 01 A8 F2 2B 26 16 00 00 43 D0 2C 8A 
    //19 0F 97 00 00 10 00 B8 36 04 1B 01 A8 F2 2B 26 25 16 A3 00 B8 36 04 1B 16 06 1D 00 07 B9 00 9A 
    //39 3A 19 1B 41 98 00 00 16 06 00 01 1B 6C 0F 00 00 16 12 20 30 B3 5F 01 01 00 04 26 16 19 10 2C 
    //03 01 A8 F2 2B 26 07 00 00 1B 14 98 00 00 28 16 0F 19 01 08 F0 2A 26 05 00 04 01 80 86 31 16 AE 
    //19 10 2C 02 01 A8 F2 2B 26 05 00 04 01 80 86 31 16 39 3F 2C 25 16 06 F2 00 19 10 2C 03 01 A8 F2 
    //2B 26 07 00 00 1B 14 98 00 00 27 16 0F 19 01 08 F0 2A 26 05 00 04 01 80 86 31 16 AE 19 10 2C 03 
    //01 A8 F2 2B 26 05 00 04 01 80 86 31 16 39 3F 2C 25 16 04 0B 47 
  }


  event Initialize() {
    local int i;
    local int windowHandle;
    Super.Initialize();                                                         //0000 : 1C 48 DC 2A 26 16 
    SetIcon("header_clothing","SBGuiTX.CC_Styles","CC_Styles");                 //0006 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 63 6C 6F 74 68 69 6E 67 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    i = 0;                                                                      //003B : 0F 00 68 02 2B 26 25 
    while (i < 4) {                                                             //0042 : 07 5F 01 96 00 68 02 2B 26 2C 04 16 
      mOptions[i] = HUD_CC_Option(mMainPane.CreatePage("HUD_CC_Option",0,0,6,6 + i * 40,0,0));//004E : 0F 10 00 68 02 2B 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 01 88 51 EC 25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 92 2C 06 90 00 68 02 2B 26 2C 28 16 16 25 25 16 
      mOptions[i].mOwnerWindow = self;                                          //0090 : 0F 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 04 01 C8 9C 2B 26 17 
      mOptions[i].SetSides(False);                                              //00A6 : 19 10 00 68 02 2B 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 
      mOptions[i].SetColorPos(1);                                               //00BC : 19 10 00 68 02 2B 26 01 A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 01 16 
      mOptions[i].__OnNext__Delegate = OnNext;                                  //00D3 : 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 D0 2C 8A 19 44 0F 97 00 00 
      mOptions[i].__OnMirror__Delegate = OnMirror;                              //00ED : 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 20 29 05 1B 44 08 97 00 00 
      mOptions[i].__OnSetColor__Delegate = OnSetColor;                          //0107 : 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 60 FA 2C 26 44 21 97 00 00 
      mOptions[i].__OnOpenPicker__Delegate = OnOpenPicker;                      //0121 : 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 30 FD 2C 26 44 10 97 00 00 
      mOptions[i].__OnGetPalette__Delegate = OnGetPalette;                      //013B : 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 E0 2B 8A 19 44 F6 96 00 00 
      i++;                                                                      //0155 : A5 00 68 02 2B 26 16 
    }
    mAllColors = HUD_CC_AllColors(mMainPane.CreatePage("HUD_CC_AllColors",0,0,6,3 + i * 40,0,0));//015F : 0F 01 08 F0 2A 26 2E 38 4D 31 1D 19 01 88 51 EC 25 2B 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 41 6C 6C 43 6F 6C 6F 72 73 00 25 25 2C 06 92 2C 03 90 00 68 02 2B 26 2C 28 16 16 25 25 16 
    mAllColors.__OnSetColor__Delegate = OnSetAllColor;                          //019E : 45 19 01 08 F0 2A 26 05 00 08 01 60 FA 2C 26 44 DD 99 00 00 
    mAllColors.__OnGetPalette__Delegate = OnGetAllPalette;                      //01B2 : 45 19 01 08 F0 2A 26 05 00 08 01 E0 2B 8A 19 44 D9 99 00 00 
    mAllColors.__OnOpenPicker__Delegate = OnOpenPicker;                         //01C6 : 45 19 01 08 F0 2A 26 05 00 08 01 30 FD 2C 26 44 10 97 00 00 
    mAllColors.mOwnerWindow = self;                                             //01DA : 0F 19 01 08 F0 2A 26 05 00 04 01 C8 9C 2B 26 17 
    windowHandle = mDesktop.CreateWindow("HUD_CC_ItemInfo",0,0,1 | 4096,0,mTop,0,0,Class'SBGuiStrings'.default.Clothing_Info.Text);//01EA : 0F 00 90 67 06 1B 19 01 48 0C 9D 19 3E 00 04 1B 4C 2D 00 00 1F 48 55 44 5F 43 43 5F 49 74 65 6D 49 6E 66 6F 00 25 25 9E 26 1D 00 10 00 00 16 25 39 44 01 80 86 31 16 25 25 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 96 2F 16 16 
    mInfoWindow = HUD_CC_ItemInfo(mDesktop.GetWindow(windowHandle));            //0237 : 0F 01 78 EF EB 25 2E 98 42 31 1D 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 90 67 06 1B 16 
    mInfoWindow.SetDockingStyle(524288 | 65536);                                //0256 : 19 01 78 EF EB 25 12 00 00 1B 03 99 00 00 9E 1D 00 00 08 00 1D 00 00 01 00 16 16 
    mInfoWindow.SetIcon("header_clothing","SBGuiTX.CC_Styles","CC_Styles");     //0271 : 19 01 78 EF EB 25 35 00 00 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 63 6C 6F 74 68 69 6E 67 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    mOptions[0].SetTitle(Class'SBGuiStrings'.default.Torso.Text);               //02AF : 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 5F 98 19 16 
    mOptions[0].mPart = 0;                                                      //02D3 : 0F 19 10 25 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 00 
    mInfoWindow.AddItem(Class'SBGuiStrings'.default.Torso.Text,0);              //02E6 : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 5F 98 19 24 00 16 
    mOptions[1].SetTitle(Class'SBGuiStrings'.default.Gloves.Text);              //030A : 19 10 26 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 3E 98 19 16 
    mOptions[1].mPart = 1;                                                      //032E : 0F 19 10 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 01 
    mOptions[1].mPartRight = 2;                                                 //0341 : 0F 19 10 26 01 A8 F2 2B 26 05 00 01 01 E0 88 8A 19 24 02 
    mOptions[1].SetSides(True);                                                 //0354 : 19 10 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 27 16 
    mInfoWindow.AddItem(Class'SBGuiStrings'.default.Gloves.Text,1);             //0366 : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 3E 98 19 24 01 16 
    mInfoWindow.AddItem(Class'SBGuiStrings'.default.Gloves.Text,2);             //038A : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 3E 98 19 24 02 16 
    mOptions[2].SetTitle(Class'StringReferences'.default.Pants.Text);           //03AE : 19 10 2C 02 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 4E 1C 11 16 
    mOptions[2].mPart = 3;                                                      //03D3 : 0F 19 10 2C 02 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 03 
    mInfoWindow.AddItem(Class'StringReferences'.default.Pants.Text,3);          //03E7 : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 4E 1C 11 24 03 16 
    mOptions[3].SetTitle(Class'StringReferences'.default.Shoes.Text);           //040B : 19 10 2C 03 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 4F 1C 11 16 
    mOptions[3].mPart = 4;                                                      //0430 : 0F 19 10 2C 03 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 04 
    mInfoWindow.AddItem(Class'StringReferences'.default.Shoes.Text,4);          //0444 : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 4F 1C 11 24 04 16 
    //1C 48 DC 2A 26 16 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 63 6C 6F 74 68 69 6E 67 00 1F 53 42 47 
    //75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 0F 00 68 02 2B 
    //26 25 07 5F 01 96 00 68 02 2B 26 2C 04 16 0F 10 00 68 02 2B 26 01 A8 F2 2B 26 2E F8 47 31 1D 19 
    //01 88 51 EC 25 28 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 4F 70 74 69 6F 6E 00 25 25 2C 06 
    //92 2C 06 90 00 68 02 2B 26 2C 28 16 16 25 25 16 0F 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 04 
    //01 C8 9C 2B 26 17 19 10 00 68 02 2B 26 01 A8 F2 2B 26 07 00 00 1B 66 98 00 00 28 16 19 10 00 68 
    //02 2B 26 01 A8 F2 2B 26 08 00 00 1B 08 99 00 00 24 01 16 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 
    //05 00 08 01 D0 2C 8A 19 44 0F 97 00 00 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 20 29 
    //05 1B 44 08 97 00 00 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 60 FA 2C 26 44 21 97 00 
    //00 45 19 10 00 68 02 2B 26 01 A8 F2 2B 26 05 00 08 01 30 FD 2C 26 44 10 97 00 00 45 19 10 00 68 
    //02 2B 26 01 A8 F2 2B 26 05 00 08 01 E0 2B 8A 19 44 F6 96 00 00 A5 00 68 02 2B 26 16 06 42 00 0F 
    //01 08 F0 2A 26 2E 38 4D 31 1D 19 01 88 51 EC 25 2B 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 
    //41 6C 6C 43 6F 6C 6F 72 73 00 25 25 2C 06 92 2C 03 90 00 68 02 2B 26 2C 28 16 16 25 25 16 45 19 
    //01 08 F0 2A 26 05 00 08 01 60 FA 2C 26 44 DD 99 00 00 45 19 01 08 F0 2A 26 05 00 08 01 E0 2B 8A 
    //19 44 D9 99 00 00 45 19 01 08 F0 2A 26 05 00 08 01 30 FD 2C 26 44 10 97 00 00 0F 19 01 08 F0 2A 
    //26 05 00 04 01 C8 9C 2B 26 17 0F 00 90 67 06 1B 19 01 48 0C 9D 19 3E 00 04 1B 4C 2D 00 00 1F 48 
    //55 44 5F 43 43 5F 49 74 65 6D 49 6E 66 6F 00 25 25 9E 26 1D 00 10 00 00 16 25 39 44 01 80 86 31 
    //16 25 25 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 96 2F 16 16 0F 01 78 EF EB 25 2E 98 42 
    //31 1D 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 90 67 06 1B 16 19 01 78 EF EB 25 12 00 00 1B 
    //03 99 00 00 9E 1D 00 00 08 00 1D 00 00 01 00 16 16 19 01 78 EF EB 25 35 00 00 1B 28 98 00 00 1F 
    //68 65 61 64 65 72 5F 63 6C 6F 74 68 69 6E 67 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 
    //65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 19 10 25 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 5F 98 19 16 0F 19 10 25 01 A8 F2 2B 26 05 00 01 01 
    //F0 EF EB 25 24 00 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 08 5F 98 19 24 00 16 19 10 26 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 D0 3E 98 19 16 0F 19 10 26 01 A8 F2 2B 26 05 00 01 01 F0 EF EB 25 24 
    //01 0F 19 10 26 01 A8 F2 2B 26 05 00 01 01 E0 88 8A 19 24 02 19 10 26 01 A8 F2 2B 26 07 00 00 1B 
    //66 98 00 00 27 16 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 D0 3E 98 19 24 01 16 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 D0 3E 98 19 24 02 16 19 10 2C 02 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 4E 1C 11 16 0F 19 10 2C 02 01 A8 F2 2B 26 05 00 01 
    //01 F0 EF EB 25 24 03 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 C8 4E 1C 11 24 03 16 19 10 2C 03 01 A8 F2 2B 26 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 
    //0F 12 20 20 F7 60 01 05 00 0C 02 40 4F 1C 11 16 0F 19 10 2C 03 01 A8 F2 2B 26 05 00 01 01 F0 EF 
    //EB 25 24 04 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 40 4F 1C 11 24 04 16 04 0B 47 
  }



