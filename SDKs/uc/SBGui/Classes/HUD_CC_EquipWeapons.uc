//==============================================================================
//  HUD_CC_EquipWeapons
//==============================================================================

class HUD_CC_EquipWeapons extends HUD_CC_Window
    dependsOn(HUD_CC_RangedWeaponSelection,HUD_CC_MainWeaponSelection,HUD_CC_ShieldSelection,Character_Pawn,Appearance_MainWeapon,Appearance_SecondaryWeapon,GUI_Rotator,GUI_RotatableMesh,StringReferences)
    Transient
    Config(User)
  ;

  var HUD_CC_MainWeaponSelection mMainWeaponPage;
  var HUD_CC_ShieldSelection mOffhandWeaponPage;
  var HUD_CC_RangedWeaponSelection mRangedWeaponPage;
  var GUI_Window mMainWeaponWindow;
  var GUI_Window mOffhandWeaponWindow;
  var GUI_Window mRangedWeaponWindow;
  var Character_Pawn mDressUpPawn;
  var GUI_RotatableMesh mCharacterMeshPage;
  var Appearance_MainWeapon mSelectedMainWeapon;
  var int mMainWeaponID;
  var Appearance_SecondaryWeapon mSelectedSecondaryWeapon;
  var int mPreviousOffhandID;
  var int mRangedWeaponID;
  var Appearance_MainWeapon mRangedWeapon;
  var private GUI_Rotator mMeleeRotator;
  var private GUI_Rotator mShieldRotator;
  var private GUI_Rotator mRangedRotator;
  var array<string> mComponentReferences;
  var array<string> mGEDfiles;
  var array<GUI_Component> mComponents;
  var bool mWasOffhandVisible;
  var (null);


  function bool Randomize(GUI_Component aButton) {
    mRangedWeaponPage.Randomize();                                              //0000 : 19 01 A0 70 2C 26 06 00 00 1B AE 98 00 00 16 
    mMainWeaponPage.Randomize();                                                //000F : 19 01 E8 B1 2B 26 06 00 00 1B AE 98 00 00 16 
    mOffhandWeaponPage.Randomize();                                             //001E : 19 01 28 01 8B 19 06 00 00 1B AE 98 00 00 16 
    return True;                                                                //002D : 04 27 
    //19 01 A0 70 2C 26 06 00 00 1B AE 98 00 00 16 19 01 E8 B1 2B 26 06 00 00 1B AE 98 00 00 16 19 01 
    //28 01 8B 19 06 00 00 1B AE 98 00 00 16 04 27 04 0B 47 
  }


  function bool ResetValues(GUI_Component aButton) {
    Super.ResetValues(aButton);                                                 //0000 : 1C 88 F8 2A 26 00 18 1A 33 26 16 
    mDressUpPawn = None;                                                        //000B : 0F 01 B0 22 05 1B 2A 
    mMainWeaponPage.ChangeMeshSelection(0);                                     //0012 : 19 01 E8 B1 2B 26 07 00 00 1B B0 98 00 00 25 16 
    mOffhandWeaponPage.ChangeMeshSelection(0);                                  //0022 : 19 01 28 01 8B 19 07 00 00 1B B0 98 00 00 25 16 
    mRangedWeaponPage.ChangeMeshSelection(0);                                   //0032 : 19 01 A0 70 2C 26 07 00 00 1B B0 98 00 00 25 16 
    return True;                                                                //0042 : 04 27 
    //1C 88 F8 2A 26 00 18 1A 33 26 16 0F 01 B0 22 05 1B 2A 19 01 E8 B1 2B 26 07 00 00 1B B0 98 00 00 
    //25 16 19 01 28 01 8B 19 07 00 00 1B B0 98 00 00 25 16 19 01 A0 70 2C 26 07 00 00 1B B0 98 00 00 
    //25 16 04 27 04 0B 47 
  }


  function EquipWeapon(byte aPart,int anID) {
    local export editinline Game_EquippedAppearance characterAppearance;
    local export editinline Item_Type ItemType;
    if (GetDressUpPawn() != None) {                                             //0000 : 07 58 00 77 1B 0E 9A 00 00 16 2A 16 
      characterAppearance = Game_EquippedAppearance(GetDressUpPawn().Appearance.GetCurrent());//000C : 0F 00 88 B3 07 1B 2E 70 B8 5F 01 19 19 1B 0E 9A 00 00 16 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
      characterAppearance.SetValue(aPart,anID);                                 //0030 : 19 00 88 B3 07 1B 10 00 00 1B 37 0C 00 00 00 00 B4 07 1B 00 20 4B 06 1B 16 
      characterAppearance.Apply();                                              //0049 : 19 00 88 B3 07 1B 06 00 00 1C A0 3B 21 11 16 
    }
    if (anID != 0) {                                                            //0058 : 07 C1 00 9B 00 20 4B 06 1B 25 16 
      switch (aPart) {                                                          //0063 : 05 01 00 00 B4 07 1B 
        case 16 :                                                               //006A : 0A 86 00 24 10 
          ItemType = mSelectedMainWeapon._IT;                                   //006F : 0F 00 78 15 05 1B 19 01 F0 98 04 1B 05 00 04 01 D8 73 21 11 
          break;                                                                //0083 : 06 C1 00 
        case 17 :                                                               //0086 : 0A A2 00 24 11 
          ItemType = mSelectedSecondaryWeapon._IT;                              //008B : 0F 00 78 15 05 1B 19 01 90 56 06 1B 05 00 04 01 D8 73 21 11 
          break;                                                                //009F : 06 C1 00 
        case 19 :                                                               //00A2 : 0A BE 00 24 13 
          ItemType = mRangedWeapon._IT;                                         //00A7 : 0F 00 78 15 05 1B 19 01 A0 55 06 1B 05 00 04 01 D8 73 21 11 
          break;                                                                //00BB : 06 C1 00 
        default:                                                                //00BE : 0A FF FF 
      }
    }
    mInfoWindow.SetItem(aPart,ItemType,0,0);                                    //00C1 : 19 01 78 EF EB 25 12 00 00 1B 4A 97 00 00 00 00 B4 07 1B 00 78 15 05 1B 25 25 16 
    //07 58 00 77 1B 0E 9A 00 00 16 2A 16 0F 00 88 B3 07 1B 2E 70 B8 5F 01 19 19 1B 0E 9A 00 00 16 05 
    //00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 19 00 88 B3 07 1B 10 00 00 1B 37 0C 00 00 00 00 
    //B4 07 1B 00 20 4B 06 1B 16 19 00 88 B3 07 1B 06 00 00 1C A0 3B 21 11 16 07 C1 00 9B 00 20 4B 06 
    //1B 25 16 05 01 00 00 B4 07 1B 0A 86 00 24 10 0F 00 78 15 05 1B 19 01 F0 98 04 1B 05 00 04 01 D8 
    //73 21 11 06 C1 00 0A A2 00 24 11 0F 00 78 15 05 1B 19 01 90 56 06 1B 05 00 04 01 D8 73 21 11 06 
    //C1 00 0A BE 00 24 13 0F 00 78 15 05 1B 19 01 A0 55 06 1B 05 00 04 01 D8 73 21 11 06 C1 00 0A FF 
    //FF 19 01 78 EF EB 25 12 00 00 1B 4A 97 00 00 00 00 B4 07 1B 00 78 15 05 1B 25 25 16 04 0B 47 
  }


  function RangedWeaponSelectionChanged(StaticMesh selectedMesh,string Name,int Id) {
    mRangedWeaponID = Id;                                                       //0000 : 0F 01 A0 64 04 1B 00 B8 49 06 1B 
    mRangedWeapon = mRangedWeaponPage.mWeaponAppearances[Id];                   //000B : 0F 01 A0 55 06 1B 10 00 B8 49 06 1B 19 01 A0 70 2C 26 05 00 00 01 C0 D2 06 1B 
    EquipWeapon(19,mRangedWeaponID);                                            //0025 : 1B C0 98 00 00 24 13 01 A0 64 04 1B 16 
    OnWeaponChanged(mMainWeaponID,mRangedWeaponID);                             //0032 : 43 18 B6 07 1B 0D 9A 00 00 01 78 98 04 1B 01 A0 64 04 1B 16 
    //0F 01 A0 64 04 1B 00 B8 49 06 1B 0F 01 A0 55 06 1B 10 00 B8 49 06 1B 19 01 A0 70 2C 26 05 00 00 
    //01 C0 D2 06 1B 1B C0 98 00 00 24 13 01 A0 64 04 1B 16 43 18 B6 07 1B 0D 9A 00 00 01 78 98 04 1B 
    //01 A0 64 04 1B 16 04 0B 47 
  }


  function OffhandWeaponSelectionChanged(StaticMesh selectedMesh,string Name,int Id) {
    if (mSelectedMainWeapon == None
      || mSelectedMainWeapon.WeaponType == 1) {//0000 : 07 58 00 84 72 01 F0 98 04 1B 2A 16 18 17 00 9A 39 3A 19 01 F0 98 04 1B 05 00 01 01 90 B8 34 11 39 3A 24 01 16 16 
      mSelectedSecondaryWeapon = mOffhandWeaponPage.mWeaponAppearances[Id];     //0026 : 0F 01 90 56 06 1B 10 00 40 B7 07 1B 19 01 28 01 8B 19 05 00 00 01 38 EB 06 1B 
      EquipWeapon(17,Id);                                                       //0040 : 1B C0 98 00 00 24 11 00 40 B7 07 1B 16 
      mPreviousOffhandID = Id;                                                  //004D : 0F 01 18 56 06 1B 00 40 B7 07 1B 
    }
    //07 58 00 84 72 01 F0 98 04 1B 2A 16 18 17 00 9A 39 3A 19 01 F0 98 04 1B 05 00 01 01 90 B8 34 11 
    //39 3A 24 01 16 16 0F 01 90 56 06 1B 10 00 40 B7 07 1B 19 01 28 01 8B 19 05 00 00 01 38 EB 06 1B 
    //1B C0 98 00 00 24 11 00 40 B7 07 1B 16 0F 01 18 56 06 1B 00 40 B7 07 1B 04 0B 47 
  }


  function MainWeaponSelectionChanged(StaticMesh selectedMesh,string Name,int Id) {
    mMainWeaponID = Id;                                                         //0000 : 0F 01 78 98 04 1B 00 38 46 06 1B 
    mSelectedMainWeapon = mMainWeaponPage.mWeaponAppearances[Id];               //000B : 0F 01 F0 98 04 1B 10 00 38 46 06 1B 19 01 E8 B1 2B 26 05 00 00 01 48 D9 06 1B 
    EquipWeapon(16,mMainWeaponID);                                              //0025 : 1B C0 98 00 00 24 10 01 78 98 04 1B 16 
    if (mSelectedMainWeapon.WeaponType == 1
      && IsVisible()) {             //0032 : 07 76 00 82 9A 39 3A 19 01 F0 98 04 1B 05 00 01 01 90 B8 34 11 39 3A 24 01 16 18 07 00 1C C0 E6 88 19 16 16 
      mShieldRotator.SetVisible(True);                                          //0056 : 19 01 88 32 04 1B 07 00 00 1B 14 98 00 00 27 16 
      EquipWeapon(17,mPreviousOffhandID);                                       //0066 : 1B C0 98 00 00 24 11 01 18 56 06 1B 16 
    } else {                                                                    //0073 : 06 8F 00 
      mShieldRotator.SetVisible(False);                                         //0076 : 19 01 88 32 04 1B 07 00 00 1B 14 98 00 00 28 16 
      EquipWeapon(17,0);                                                        //0086 : 1B C0 98 00 00 24 11 25 16 
    }
    OnWeaponChanged(mMainWeaponID,mRangedWeaponID);                             //008F : 43 18 B6 07 1B 0D 9A 00 00 01 78 98 04 1B 01 A0 64 04 1B 16 
    //0F 01 78 98 04 1B 00 38 46 06 1B 0F 01 F0 98 04 1B 10 00 38 46 06 1B 19 01 E8 B1 2B 26 05 00 00 
    //01 48 D9 06 1B 1B C0 98 00 00 24 10 01 78 98 04 1B 16 07 76 00 82 9A 39 3A 19 01 F0 98 04 1B 05 
    //00 01 01 90 B8 34 11 39 3A 24 01 16 18 07 00 1C C0 E6 88 19 16 16 19 01 88 32 04 1B 07 00 00 1B 
    //14 98 00 00 27 16 1B C0 98 00 00 24 11 01 18 56 06 1B 16 06 8F 00 19 01 88 32 04 1B 07 00 00 1B 
    //14 98 00 00 28 16 1B C0 98 00 00 24 11 25 16 43 18 B6 07 1B 0D 9A 00 00 01 78 98 04 1B 01 A0 64 
    //04 1B 16 04 0B 47 
  }


  function Character_Pawn GetDressUpPawn() {
    if (mDressUpPawn == None) {                                                 //0000 : 07 24 00 72 01 B0 22 05 1B 2A 16 
      mDressUpPawn = Character_Pawn(mCharacterMeshPage.mMeshActor);             //000B : 0F 01 B0 22 05 1B 2E 90 2D 5B 01 19 01 08 57 06 1B 05 00 04 01 08 0C A3 19 
    }
    return mDressUpPawn;                                                        //0024 : 04 01 B0 22 05 1B 
    //07 24 00 72 01 B0 22 05 1B 2A 16 0F 01 B0 22 05 1B 2E 90 2D 5B 01 19 01 08 57 06 1B 05 00 04 01 
    //08 0C A3 19 04 01 B0 22 05 1B 04 0B 47 
  }


  function LoadGEDData() {
    local GED_Editor Editor;
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0000 : 0F 00 60 0D 08 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor.ResolveComponents(mGEDfiles,mComponentReferences,mComponents)) { //0025 : 07 35 01 19 00 60 0D 08 1B 15 00 04 1B FD 98 00 00 01 B8 1B 33 26 01 30 1C 33 26 01 30 93 2C 26 16 
      mMainWeaponPage = HUD_CC_MainWeaponSelection(mComponents[0]);             //0046 : 0F 01 E8 B1 2B 26 2E F8 54 2C 26 10 25 01 30 93 2C 26 
      mMainWeaponPage.__OnSelectionChanged__Delegate = MainWeaponSelectionChanged;//0058 : 45 19 01 E8 B1 2B 26 05 00 08 01 C8 A7 05 1B 44 8B 9A 00 00 
      mMainWeaponPage.SetVisible(False);                                        //006C : 19 01 E8 B1 2B 26 07 00 00 1B 14 98 00 00 28 16 
      mOffhandWeaponPage = HUD_CC_ShieldSelection(mComponents[1]);              //007C : 0F 01 28 01 8B 19 2E F8 22 31 1D 10 26 01 30 93 2C 26 
      mOffhandWeaponPage.__OnSelectionChanged__Delegate = OffhandWeaponSelectionChanged;//008E : 45 19 01 28 01 8B 19 05 00 08 01 C8 A7 05 1B 44 8A 9A 00 00 
      mOffhandWeaponPage.SetVisible(False);                                     //00A2 : 19 01 28 01 8B 19 07 00 00 1B 14 98 00 00 28 16 
      mOffhandWeaponWindow = GUI_Window(mComponents[2]);                        //00B2 : 0F 01 20 1D 33 26 2E 38 EB 2E 1D 10 2C 02 01 30 93 2C 26 
      mCharacterMeshPage = GUI_RotatableMesh(mComponents[3]);                   //00C5 : 0F 01 08 57 06 1B 2E 38 2A 2F 1D 10 2C 03 01 30 93 2C 26 
      mRangedWeaponPage = HUD_CC_RangedWeaponSelection(mComponents[4]);         //00D8 : 0F 01 A0 70 2C 26 2E F0 5F 2C 26 10 2C 04 01 30 93 2C 26 
      mRangedWeaponPage.__OnSelectionChanged__Delegate = RangedWeaponSelectionChanged;//00EB : 45 19 01 A0 70 2C 26 05 00 08 01 C8 A7 05 1B 44 89 9A 00 00 
      mRangedWeaponPage.SetVisible(False);                                      //00FF : 19 01 A0 70 2C 26 07 00 00 1B 14 98 00 00 28 16 
      mMainWeaponWindow = GUI_Window(mComponents[5]);                           //010F : 0F 01 98 1D 33 26 2E 38 EB 2E 1D 10 2C 05 01 30 93 2C 26 
      mRangedWeaponWindow = GUI_Window(mComponents[6]);                         //0122 : 0F 01 A8 1C 33 26 2E 38 EB 2E 1D 10 2C 06 01 30 93 2C 26 
    }
    //0F 00 60 0D 08 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 
    //00 04 2C 2D 16 07 35 01 19 00 60 0D 08 1B 15 00 04 1B FD 98 00 00 01 B8 1B 33 26 01 30 1C 33 26 
    //01 30 93 2C 26 16 0F 01 E8 B1 2B 26 2E F8 54 2C 26 10 25 01 30 93 2C 26 45 19 01 E8 B1 2B 26 05 
    //00 08 01 C8 A7 05 1B 44 8B 9A 00 00 19 01 E8 B1 2B 26 07 00 00 1B 14 98 00 00 28 16 0F 01 28 01 
    //8B 19 2E F8 22 31 1D 10 26 01 30 93 2C 26 45 19 01 28 01 8B 19 05 00 08 01 C8 A7 05 1B 44 8A 9A 
    //00 00 19 01 28 01 8B 19 07 00 00 1B 14 98 00 00 28 16 0F 01 20 1D 33 26 2E 38 EB 2E 1D 10 2C 02 
    //01 30 93 2C 26 0F 01 08 57 06 1B 2E 38 2A 2F 1D 10 2C 03 01 30 93 2C 26 0F 01 A0 70 2C 26 2E F0 
    //5F 2C 26 10 2C 04 01 30 93 2C 26 45 19 01 A0 70 2C 26 05 00 08 01 C8 A7 05 1B 44 89 9A 00 00 19 
    //01 A0 70 2C 26 07 00 00 1B 14 98 00 00 28 16 0F 01 98 1D 33 26 2E 38 EB 2E 1D 10 2C 05 01 30 93 
    //2C 26 0F 01 A8 1C 33 26 2E 38 EB 2E 1D 10 2C 06 01 30 93 2C 26 04 0B 47 
  }


  event DoShowWindow(int flags) {
    local int i;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 48 95 2C 26 00 78 0F 08 1B 16 
    if (flags == 1) {                                                           //000B : 07 5C 00 9A 00 78 0F 08 1B 26 16 
      i = 0;                                                                    //0016 : 0F 00 70 FB 04 1B 25 
      while (i < mOptions.Length) {                                             //001D : 07 5C 00 96 00 70 FB 04 1B 37 01 A8 F2 2B 26 16 
        mOptions[i].OnNext(mOptions[i],0);                                      //002D : 19 10 00 70 FB 04 1B 01 A8 F2 2B 26 16 00 00 43 D0 2C 8A 19 0F 97 00 00 10 00 70 FB 04 1B 01 A8 F2 2B 26 25 16 
        ++i;                                                                    //0052 : A3 00 70 FB 04 1B 16 
      }
    }
    //1C 48 95 2C 26 00 78 0F 08 1B 16 07 5C 00 9A 00 78 0F 08 1B 26 16 0F 00 70 FB 04 1B 25 07 5C 00 
    //96 00 70 FB 04 1B 37 01 A8 F2 2B 26 16 19 10 00 70 FB 04 1B 01 A8 F2 2B 26 16 00 00 43 D0 2C 8A 
    //19 0F 97 00 00 10 00 70 FB 04 1B 01 A8 F2 2B 26 25 16 A3 00 70 FB 04 1B 16 06 1D 00 04 0B 47 
  }


  function Initialize() {
    local int i;
    local int windowHandle;
    Super.Initialize();                                                         //0000 : 1C 48 DC 2A 26 16 
    SetIcon("header_weapons","SBGuiTX.CC_Styles","CC_Styles");                  //0006 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 77 65 61 70 6F 6E 73 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    mMeleeRotator = GUI_Rotator(mMainPane.CreatePage("GUI_Rotator",0,0,6,6 + 0 * 40,180,24));//003A : 0F 01 E8 AD 07 1B 2E 78 CD 2F 1D 19 01 88 51 EC 25 24 00 04 1B 16 98 00 00 1F 47 55 49 5F 52 6F 74 61 74 6F 72 00 25 25 2C 06 92 2C 06 90 25 2C 28 16 16 2C B4 2C 18 16 
    mShieldRotator = GUI_Rotator(mMainPane.CreatePage("GUI_Rotator",0,0,6,6 + 1 * 40,180,24));//0072 : 0F 01 88 32 04 1B 2E 78 CD 2F 1D 19 01 88 51 EC 25 24 00 04 1B 16 98 00 00 1F 47 55 49 5F 52 6F 74 61 74 6F 72 00 25 25 2C 06 92 2C 06 90 26 2C 28 16 16 2C B4 2C 18 16 
    mRangedRotator = GUI_Rotator(mMainPane.CreatePage("GUI_Rotator",0,0,6,6 + 2 * 40,180,24));//00AA : 0F 01 60 AE 07 1B 2E 78 CD 2F 1D 19 01 88 51 EC 25 25 00 04 1B 16 98 00 00 1F 47 55 49 5F 52 6F 74 61 74 6F 72 00 25 25 2C 06 92 2C 06 90 2C 02 2C 28 16 16 2C B4 2C 18 16 
    LoadGEDData();                                                              //00E3 : 1B 61 98 00 00 16 
    windowHandle = mDesktop.CreateWindow("HUD_CC_ItemInfo",0,0,1 | 4096,0,mTop,0,0,Class'SBGuiStrings'.default.Weapon_Info.Text);//00E9 : 0F 00 28 47 06 1B 19 01 48 0C 9D 19 3E 00 04 1B 4C 2D 00 00 1F 48 55 44 5F 43 43 5F 49 74 65 6D 49 6E 66 6F 00 25 25 9E 26 1D 00 10 00 00 16 25 39 44 01 80 86 31 16 25 25 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 97 2F 16 16 
    mInfoWindow = HUD_CC_ItemInfo(mDesktop.GetWindow(windowHandle));            //0136 : 0F 01 78 EF EB 25 2E 98 42 31 1D 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 28 47 06 1B 16 
    mInfoWindow.SetDockingStyle(524288 | 65536);                                //0155 : 19 01 78 EF EB 25 12 00 00 1B 03 99 00 00 9E 1D 00 00 08 00 1D 00 00 01 00 16 16 
    mInfoWindow.SetIcon("header_weapons","SBGuiTX.CC_Styles","CC_Styles");      //0170 : 19 01 78 EF EB 25 34 00 00 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 77 65 61 70 6F 6E 73 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    mInfoWindow.AddItem(Class'SBGuiStrings'.default.Melee.Text,16);             //01AD : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 D5 98 19 24 10 16 
    mInfoWindow.AddItem(Class'StringReferences'.default.Shield.Text,17);        //01D1 : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 53 1C 11 24 11 16 
    mInfoWindow.AddItem(Class'SBGuiStrings'.default.Ranged.Text,19);            //01F5 : 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 C6 98 19 24 13 16 
    i = 0;                                                                      //0219 : 0F 00 E8 2E 8A 19 25 
    while (i < mMainWeaponPage.Meshes.Length) {                                 //0220 : 07 65 02 96 00 E8 2E 8A 19 37 19 01 E8 B1 2B 26 05 00 00 01 90 A3 89 19 16 
      mMeleeRotator.AddSelection(Class'SBGuiStrings'.default.Melee.Text);       //0239 : 19 01 E8 AD 07 1B 19 00 00 1B E9 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 D5 98 19 16 
      ++i;                                                                      //025B : A3 00 E8 2E 8A 19 16 
    }
    mMeleeRotator.__OnItemChange__Delegate = mMainWeaponPage.MeshSelectionChanged;//0265 : 45 19 01 E8 AD 07 1B 05 00 08 01 50 FD 04 1B 19 01 E8 B1 2B 26 05 00 08 44 FC 98 00 00 
    i = 0;                                                                      //0282 : 0F 00 E8 2E 8A 19 25 
    while (i < mOffhandWeaponPage.Meshes.Length) {                              //0289 : 07 CE 02 96 00 E8 2E 8A 19 37 19 01 28 01 8B 19 05 00 00 01 90 A3 89 19 16 
      mShieldRotator.AddSelection(Class'StringReferences'.default.Shield.Text); //02A2 : 19 01 88 32 04 1B 19 00 00 1B E9 98 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 53 1C 11 16 
      ++i;                                                                      //02C4 : A3 00 E8 2E 8A 19 16 
    }
    mShieldRotator.__OnItemChange__Delegate = mOffhandWeaponPage.MeshSelectionChanged;//02CE : 45 19 01 88 32 04 1B 05 00 08 01 50 FD 04 1B 19 01 28 01 8B 19 05 00 08 44 FC 98 00 00 
    i = 0;                                                                      //02EB : 0F 00 E8 2E 8A 19 25 
    while (i < mRangedWeaponPage.Meshes.Length) {                               //02F2 : 07 37 03 96 00 E8 2E 8A 19 37 19 01 A0 70 2C 26 05 00 00 01 90 A3 89 19 16 
      mRangedRotator.AddSelection(Class'SBGuiStrings'.default.Ranged.Text);     //030B : 19 01 60 AE 07 1B 19 00 00 1B E9 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 C6 98 19 16 
      ++i;                                                                      //032D : A3 00 E8 2E 8A 19 16 
    }
    mRangedRotator.__OnItemChange__Delegate = mRangedWeaponPage.MeshSelectionChanged;//0337 : 45 19 01 60 AE 07 1B 05 00 08 01 50 FD 04 1B 19 01 A0 70 2C 26 05 00 08 44 FC 98 00 00 
    //1C 48 DC 2A 26 16 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 77 65 61 70 6F 6E 73 00 1F 53 42 47 75 
    //69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 0F 01 E8 AD 07 1B 
    //2E 78 CD 2F 1D 19 01 88 51 EC 25 24 00 04 1B 16 98 00 00 1F 47 55 49 5F 52 6F 74 61 74 6F 72 00 
    //25 25 2C 06 92 2C 06 90 25 2C 28 16 16 2C B4 2C 18 16 0F 01 88 32 04 1B 2E 78 CD 2F 1D 19 01 88 
    //51 EC 25 24 00 04 1B 16 98 00 00 1F 47 55 49 5F 52 6F 74 61 74 6F 72 00 25 25 2C 06 92 2C 06 90 
    //26 2C 28 16 16 2C B4 2C 18 16 0F 01 60 AE 07 1B 2E 78 CD 2F 1D 19 01 88 51 EC 25 25 00 04 1B 16 
    //98 00 00 1F 47 55 49 5F 52 6F 74 61 74 6F 72 00 25 25 2C 06 92 2C 06 90 2C 02 2C 28 16 16 2C B4 
    //2C 18 16 1B 61 98 00 00 16 0F 00 28 47 06 1B 19 01 48 0C 9D 19 3E 00 04 1B 4C 2D 00 00 1F 48 55 
    //44 5F 43 43 5F 49 74 65 6D 49 6E 66 6F 00 25 25 9E 26 1D 00 10 00 00 16 25 39 44 01 80 86 31 16 
    //25 25 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 97 2F 16 16 0F 01 78 EF EB 25 2E 98 42 31 
    //1D 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 28 47 06 1B 16 19 01 78 EF EB 25 12 00 00 1B 03 
    //99 00 00 9E 1D 00 00 08 00 1D 00 00 01 00 16 16 19 01 78 EF EB 25 34 00 00 1B 28 98 00 00 1F 68 
    //65 61 64 65 72 5F 77 65 61 70 6F 6E 73 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 
    //00 1F 43 43 5F 53 74 79 6C 65 73 00 16 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 60 D5 98 19 24 10 16 19 01 78 EF EB 25 1B 00 00 1B 52 10 00 00 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 53 1C 11 24 11 16 19 01 78 EF EB 25 1B 00 00 1B 52 
    //10 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 C6 98 19 24 13 16 0F 00 E8 2E 8A 19 25 
    //07 65 02 96 00 E8 2E 8A 19 37 19 01 E8 B1 2B 26 05 00 00 01 90 A3 89 19 16 19 01 E8 AD 07 1B 19 
    //00 00 1B E9 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 D5 98 19 16 A3 00 E8 2E 8A 
    //19 16 06 20 02 45 19 01 E8 AD 07 1B 05 00 08 01 50 FD 04 1B 19 01 E8 B1 2B 26 05 00 08 44 FC 98 
    //00 00 0F 00 E8 2E 8A 19 25 07 CE 02 96 00 E8 2E 8A 19 37 19 01 28 01 8B 19 05 00 00 01 90 A3 89 
    //19 16 19 01 88 32 04 1B 19 00 00 1B E9 98 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 
    //53 1C 11 16 A3 00 E8 2E 8A 19 16 06 89 02 45 19 01 88 32 04 1B 05 00 08 01 50 FD 04 1B 19 01 28 
    //01 8B 19 05 00 08 44 FC 98 00 00 0F 00 E8 2E 8A 19 25 07 37 03 96 00 E8 2E 8A 19 37 19 01 A0 70 
    //2C 26 05 00 00 01 90 A3 89 19 16 19 01 60 AE 07 1B 19 00 00 1B E9 98 00 00 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 D8 C6 98 19 16 A3 00 E8 2E 8A 19 16 06 F2 02 45 19 01 60 AE 07 1B 05 00 
    //08 01 50 FD 04 1B 19 01 A0 70 2C 26 05 00 08 44 FC 98 00 00 04 0B 47 
  }


  delegate OnWeaponChanged(int aMainWeaponID,int aRangedWeaponID);



