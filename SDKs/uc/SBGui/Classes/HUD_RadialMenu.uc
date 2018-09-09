//==============================================================================
//  HUD_RadialMenu
//==============================================================================

class HUD_RadialMenu extends GUI_Window
    native
    exportstructs
    dependsOn(Game_Pawn,Game_CombatState,Game_PlayerController,Game_PlayerInput,Game_RadialMenuOptions,InteractiveLevelElement,Game_PlayerPawn,Game_QuestLog,GUI_Label)
    Transient
    Config(User)
  ;

  var Game_Pawn mTargetPawn;
  var InteractiveLevelElement mTargetInteractiveLevelElement;
  var array<byte> mOptions;
  var private GUI_Image mBackgroundMulti;
  var private GUI_Image mBackgroundSingle;
  var private float mCenterX;
  var private float mCenterY;
  var private float mButtonRadius;
  var private bool mRadialFadeIn;
  var private bool mRadialFadeOut;
  var private float mAnimationTime;
  var private GUI_Page mInfoPage;
  var private GUI_Label mInfoLabel;
  var int mRadialData;


  native function GetSelectedButtonOption(GUI_Button aButton,byte aOption);


  private native function UpdateButtons(array<Material> imageList);


  private native function UpdateTarget();


  private native function DoRadialMenuSelect(byte aOption);


  function bool OnButtonClick(GUI_Component aButton) {
    local byte aOption;
    GetSelectedButtonOption(GUI_Button(aButton),aOption);                       //0000 : 1B 72 9A 00 00 2E 78 F0 2E 1D 00 A0 F9 B8 1C 00 E0 09 B9 1C 16 
    DoRadialMenuSelect(aOption);                                                //0015 : 1B 6F 9A 00 00 00 E0 09 B9 1C 16 
    return True;                                                                //0020 : 04 27 
    //1B 72 9A 00 00 2E 78 F0 2E 1D 00 A0 F9 B8 1C 00 E0 09 B9 1C 16 1B 6F 9A 00 00 00 E0 09 B9 1C 16 
    //04 27 04 0B 47 
  }


  native function bool InteractionPossible();


  event DoShowWindow(int aFlags) {
    local array<Material> imageList;
    Super.DoShowWindow(aFlags);                                                 //0000 : 1C 20 7A 9E 19 00 A8 0C B9 1C 16 
    if (aFlags == Class'GUI_BaseDesktop'.1
      || mFadeOut) {                 //000B : 07 6D 01 84 9A 00 A8 0C B9 1C 12 20 00 68 D7 00 01 00 04 26 16 18 07 00 2D 01 38 92 31 16 16 
      if (!InteractionPossible()) {                                             //002A : 07 56 00 81 1B 6D 9A 00 00 16 16 
        mDesktop.ShowWindow(mWindowHandle,Class'GUI_BaseDesktop'.2);            //0035 : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
        return;                                                                 //0054 : 04 0B 
      }
      if (GetPawn().combatState.CombatReady()) {                                //0056 : 07 BA 00 19 19 1B 2B 0C 00 00 16 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 
        Game_PlayerController(GetPawn().Controller).Input.DrawSheatheWeapon();  //0072 : 19 19 2E 90 18 5B 01 19 1B 2B 0C 00 00 16 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 00 1B AD 1B 00 00 16 
        mDesktop.ShowWindow(mWindowHandle,Class'GUI_BaseDesktop'.2);            //0099 : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
        return;                                                                 //00B8 : 04 0B 
      }
      if (mDesktop.IsActive()) {                                                //00BA : 07 F9 00 19 01 48 0C 9D 19 06 00 04 1B 34 0C 00 00 16 
        mCenterX = mDesktop.GetMouseX();                                        //00CC : 0F 01 B0 0F B9 1C 19 01 48 0C 9D 19 06 00 04 1B BB 98 00 00 16 
        mCenterY = mDesktop.GetMouseY();                                        //00E1 : 0F 01 28 10 B9 1C 19 01 48 0C 9D 19 06 00 04 1B BC 98 00 00 16 
      } else {                                                                  //00F6 : 06 2F 01 
        mCenterX = mDesktop.GetScreenWidth() / 2;                               //00F9 : 0F 01 B0 0F B9 1C AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 
        mCenterY = mDesktop.GetScreenHeight() / 2;                              //0114 : 0F 01 28 10 B9 1C AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 
      }
      mDesktop.SetTempActive(True);                                             //012F : 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 
      mRadialFadeIn = True;                                                     //013F : 14 2D 01 08 77 B8 1C 27 
      mRadialFadeOut = False;                                                   //0147 : 14 2D 01 80 77 B8 1C 28 
      UpdateButtons(imageList);                                                 //014F : 1B 71 9A 00 00 00 F8 77 B8 1C 16 
      mDesktop.BringToTop(self);                                                //015A : 19 01 48 0C 9D 19 07 00 00 1B 3E 98 00 00 17 16 
    } else {                                                                    //016A : 06 B8 01 
      if (aFlags == Class'GUI_BaseDesktop'.2) {                                 //016D : 07 B8 01 9A 00 A8 0C B9 1C 12 20 00 68 D7 00 02 00 04 2C 02 16 
        if (mDesktop.IsTempActive()) {                                          //0182 : 07 A8 01 19 01 48 0C 9D 19 06 00 04 1B 35 0D 00 00 16 
          mDesktop.NativeTick(0.01000000);                                      //0194 : 19 01 48 0C 9D 19 0B 00 00 1B A0 9B 00 00 1E 0A D7 23 3C 16 
        }
        mDesktop.SetTempActive(False);                                          //01A8 : 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 28 16 
      }
    }
    //1C 20 7A 9E 19 00 A8 0C B9 1C 16 07 6D 01 84 9A 00 A8 0C B9 1C 12 20 00 68 D7 00 01 00 04 26 16 
    //18 07 00 2D 01 38 92 31 16 16 07 56 00 81 1B 6D 9A 00 00 16 16 19 01 48 0C 9D 19 16 00 00 1B 57 
    //2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 07 BA 00 19 19 1B 2B 0C 00 00 
    //16 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 19 19 2E 90 18 5B 01 19 1B 2B 0C 00 00 16 
    //05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 00 1B AD 1B 00 00 16 19 01 48 0C 9D 19 16 
    //00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 07 F9 00 19 01 48 
    //0C 9D 19 06 00 04 1B 34 0C 00 00 16 0F 01 B0 0F B9 1C 19 01 48 0C 9D 19 06 00 04 1B BB 98 00 00 
    //16 0F 01 28 10 B9 1C 19 01 48 0C 9D 19 06 00 04 1B BC 98 00 00 16 06 2F 01 0F 01 B0 0F B9 1C AC 
    //19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 0F 01 28 10 B9 1C AC 19 01 48 0C 9D 
    //19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 14 
    //2D 01 08 77 B8 1C 27 14 2D 01 80 77 B8 1C 28 1B 71 9A 00 00 00 F8 77 B8 1C 16 19 01 48 0C 9D 19 
    //07 00 00 1B 3E 98 00 00 17 16 06 B8 01 07 B8 01 9A 00 A8 0C B9 1C 12 20 00 68 D7 00 02 00 04 2C 
    //02 16 07 A8 01 19 01 48 0C 9D 19 06 00 04 1B 35 0D 00 00 16 19 01 48 0C 9D 19 0B 00 00 1B A0 9B 
    //00 00 1E 0A D7 23 3C 16 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 28 16 04 0B 47 
  }


  event CollectTargetOptions() {
    if (!IsVisible()) {                                                         //0000 : 07 AE 00 81 1C C0 E6 88 19 16 16 
      UpdateTarget();                                                           //000B : 1B 70 9A 00 00 16 
      mOptions.Length = 0;                                                      //0011 : 0F 37 01 B8 7A B8 1C 25 
      if (mTargetPawn != None) {                                                //0019 : 07 4C 00 77 01 30 7B B8 1C 2A 16 
        mTargetPawn.RadialMenuCollect(GetPawn(),Class'Game_RadialMenuOptions'.0,mOptions);//0024 : 19 01 30 7B B8 1C 1C 00 00 1B 05 06 00 00 1B 2B 0C 00 00 16 12 20 B0 D7 60 01 02 00 01 24 00 01 B8 7A B8 1C 16 
      } else {                                                                  //0049 : 06 AE 00 
        if (mTargetInteractiveLevelElement != None) {                           //004C : 07 7F 00 77 01 A8 7B B8 1C 2A 16 
          mTargetInteractiveLevelElement.RadialMenuCollect(GetPawn(),Class'Game_RadialMenuOptions'.0,mOptions);//0057 : 19 01 A8 7B B8 1C 1C 00 00 1B 05 06 00 00 1B 2B 0C 00 00 16 12 20 B0 D7 60 01 02 00 01 24 00 01 B8 7A B8 1C 16 
        } else {                                                                //007C : 06 AE 00 
          Game_PlayerPawn(GetPawn()).questLog.RadialMenuCollect(None,Class'Game_RadialMenuOptions'.0,mOptions);//007F : 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 17 00 00 1B 05 06 00 00 2A 12 20 B0 D7 60 01 02 00 01 24 00 01 B8 7A B8 1C 16 
        }
      }
    }
    //07 AE 00 81 1C C0 E6 88 19 16 16 1B 70 9A 00 00 16 0F 37 01 B8 7A B8 1C 25 07 4C 00 77 01 30 7B 
    //B8 1C 2A 16 19 01 30 7B B8 1C 1C 00 00 1B 05 06 00 00 1B 2B 0C 00 00 16 12 20 B0 D7 60 01 02 00 
    //01 24 00 01 B8 7A B8 1C 16 06 AE 00 07 7F 00 77 01 A8 7B B8 1C 2A 16 19 01 A8 7B B8 1C 1C 00 00 
    //1B 05 06 00 00 1B 2B 0C 00 00 16 12 20 B0 D7 60 01 02 00 01 24 00 01 B8 7A B8 1C 16 06 AE 00 19 
    //19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 17 00 00 1B 05 06 00 00 2A 12 20 B0 
    //D7 60 01 02 00 01 24 00 01 B8 7A B8 1C 16 04 0B 47 
  }


  native function bool ResetInfoText(GUI_Component aButton);


  native function bool SetInfoText(GUI_Component aButton);


  native function GUI_Button NativeCreateRadialButton(byte optionID,string imageName,string infoText);


  function CreateRadialButton(byte optionID,string imageName,string infoText) {
    local GUI_Button Button;
    Button = NativeCreateRadialButton(optionID,imageName,infoText);             //0000 : 0F 00 C0 EB B8 1C 1B 6B 9A 00 00 00 48 EB B8 1C 00 38 EC B8 1C 00 B0 EC B8 1C 16 
    Button.__OnClick__Delegate = OnButtonClick;                                 //001B : 45 19 00 C0 EB B8 1C 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 
    Button.__OnRightClick__Delegate = OnButtonClick;                            //002F : 45 19 00 C0 EB B8 1C 05 00 08 01 10 EC 9D 19 44 8D 98 00 00 
    Button.__OnHilite__Delegate = SetInfoText;                                  //0043 : 45 19 00 C0 EB B8 1C 05 00 08 01 E8 E6 9D 19 44 4A 98 00 00 
    Button.__OnDeHilite__Delegate = ResetInfoText;                              //0057 : 45 19 00 C0 EB B8 1C 05 00 08 01 60 E7 9D 19 44 6C 9A 00 00 
    //0F 00 C0 EB B8 1C 1B 6B 9A 00 00 00 48 EB B8 1C 00 38 EC B8 1C 00 B0 EC B8 1C 16 45 19 00 C0 EB 
    //B8 1C 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 45 19 00 C0 EB B8 1C 05 00 08 01 10 EC 9D 19 44 8D 
    //98 00 00 45 19 00 C0 EB B8 1C 05 00 08 01 E8 E6 9D 19 44 4A 98 00 00 45 19 00 C0 EB B8 1C 05 00 
    //08 01 60 E7 9D 19 44 6C 9A 00 00 04 0B 47 
  }


  event Initialize() {
    mWidth = 256.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 80 43 
    mHeight = 256.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 80 43 
    mButtonRadius = 75.00000000;                                                //0016 : 0F 01 80 9F B7 1C 1E 00 00 96 42 
    Super.Initialize();                                                         //0021 : 1C 28 9E 9E 19 16 
    mBackgroundMulti = CreateImage("SBIconsTX.Projectors.RadialShader","SBGuiTX","");//0027 : 0F 01 28 ED B8 1C 1B 26 98 00 00 1F 53 42 49 63 6F 6E 73 54 58 2E 50 72 6F 6A 65 63 74 6F 72 73 2E 52 61 64 69 61 6C 53 68 61 64 65 72 00 1F 53 42 47 75 69 54 58 00 1F 00 16 
    mBackgroundSingle = CreateImage("SBIconsTX.Projectors.RadialSingleShader","SBGuiTX","");//0061 : 0F 01 A0 ED B8 1C 1B 26 98 00 00 1F 53 42 49 63 6F 6E 73 54 58 2E 50 72 6F 6A 65 63 74 6F 72 73 2E 52 61 64 69 61 6C 53 69 6E 67 6C 65 53 68 61 64 65 72 00 1F 53 42 47 75 69 54 58 00 1F 00 16 
    mInfoPage = CreatePage("GUI_Page",524288,0,0,0,0,0);                        //00A1 : 0F 01 18 EE B8 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 25 25 25 25 16 
    mInfoPage.SetStdBackground(Class'GUI_BaseDesktop'.9);                       //00C1 : 19 01 18 EE B8 1C 11 00 00 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 09 16 
    mInfoPage.SetVisible(False);                                                //00DB : 19 01 18 EE B8 1C 07 00 00 1B 14 98 00 00 28 16 
    mInfoLabel = mInfoPage.CreateLabel("GUI_Label",0,512 | 2048,0,0,0,16);      //00EB : 0F 01 90 EE B8 1C 19 01 18 EE B8 1C 23 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 02 00 00 1D 00 08 00 00 16 25 25 25 2C 10 16 
    mInfoLabel.SetSolidBackground(158.00000000,154.00000000,168.00000000,255.00000000);//011D : 19 01 90 EE B8 1C 1A 00 00 1B 52 98 00 00 1E 00 00 1E 43 1E 00 00 1A 43 1E 00 00 28 43 1E 00 00 7F 43 16 
    mInfoLabel.SetTextBorder(4.00000000,0.00000000,4.00000000,2.00000000);      //0140 : 19 01 90 EE B8 1C 1A 00 00 1B 49 98 00 00 1E 00 00 80 40 1E 00 00 00 00 1E 00 00 80 40 1E 00 00 00 40 16 
    mInfoLabel.SetColor(0,0,0);                                                 //0163 : 19 01 90 EE B8 1C 09 00 00 1B 19 98 00 00 25 25 25 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.1,"SBIconsTX.Radial.Radial_Description_B",Class'SBGuiStrings'.default.Info.Text);//0175 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 01 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 44 65 73 63 72 69 70 74 69 6F 6E 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 61 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.3,"SBIconsTX.Radial.Radial_Description_B",Class'SBGuiStrings'.default.help.Text);//01C0 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 03 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 44 65 73 63 72 69 70 74 69 6F 6E 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 34 97 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.4,"SBIconsTX.Radial.Radial_Use_B",Class'SBGuiStrings'.default.Use.Text);//020B : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 04 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 55 73 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 62 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.5,"SBIconsTX.Radial.Radial_OpenDoor_B",Class'SBGuiStrings'.default.Open.Text);//024E : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 05 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4F 70 65 6E 44 6F 6F 72 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 63 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.6,"SBIconsTX.Radial.Radial_Sit_B",Class'SBGuiStrings'.default.Sit.Text);//0296 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 06 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 69 74 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 63 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.7,"SBIconsTX.Radial.Radial_Trade_B",Class'SBGuiStrings'.default.Trade.Text);//02D9 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 07 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 54 72 61 64 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 98 97 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.8,"SBIconsTX.Radial.Radial_Use_B",Class'SBGuiStrings'.default.Gather.Text);//031E : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 08 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 55 73 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 63 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.9,"SBIconsTX.Radial.Radial_Use_B",Class'SBGuiStrings'.default.Interact.Text);//0361 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 09 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 55 73 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 64 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.19,"SBIconsTX.Radial.Radial_Whisper_B",Class'SBGuiStrings'.default.Private.Text);//03A4 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 13 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 57 68 69 73 70 65 72 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 F9 98 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.10,"SBIconsTX.Radial.Radial_Whisper_B",Class'SBGuiStrings'.default.Talk.Text);//03EB : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0A 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 57 68 69 73 70 65 72 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 64 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.11,"SBIconsTX.Radial.Radial_Kick_From_Group_B",Class'SBGuiStrings'.default.Kick_Team_Member.Text);//0432 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0B 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4B 69 63 6B 5F 46 72 6F 6D 5F 47 72 6F 75 70 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 2E 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.12,"SBIconsTX.Radial.Radial_InviteToGroup_B",Class'SBGuiStrings'.default.Team_Invite.Text);//0481 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0C 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 49 6E 76 69 74 65 54 6F 47 72 6F 75 70 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 65 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.14,"SBIconsTX.Radial.Radial_InviteToGuild_B",Class'SBGuiStrings'.default.Guild_Invite.Text);//04CE : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0E 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 49 6E 76 69 74 65 54 6F 47 75 69 6C 64 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 65 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.13,"SBIconsTX.Radial.Radial_AddFriend_B",Class'SBGuiStrings'.default.Add_to_Friends.Text);//051B : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0D 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 41 64 64 46 72 69 65 6E 64 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 66 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.15,"SBIconsTX.Radial.Radial_Travel_B",Class'SBGuiStrings'.default.Travel.Text);//0564 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0F 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 54 72 61 76 65 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 66 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.16,"SBIconsTX.Radial.Radial_Mail_B",Class'SBGuiStrings'.default.mailbox.Text);//05AA : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 10 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4D 61 69 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 67 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.17,"SBIconsTX.Radial.Radial_Duel_B",Class'SBGuiStrings'.default.Arena_Master.Text);//05EE : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 11 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 44 75 65 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 67 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.18,"SBIconsTX.Radial.Radial_Minigame_B",Class'SBGuiStrings'.default.miniGame.Text);//0632 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 12 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4D 69 6E 69 67 61 6D 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 68 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.20,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Buy_Forge.Text);//067A : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 14 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 68 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.21,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Buy_Tailor.Text);//06C6 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 15 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 69 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.22,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Buy_Soul.Text);//0712 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 16 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 69 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.23,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Buy_Rune.Text);//075E : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 17 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 6A 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.24,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Buy_Spirit.Text);//07AA : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 18 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 6A 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.25,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Buy_Tavern.Text);//07F6 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 19 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 6A 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.26,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Buy_General.Text);//0842 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1A 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 6B 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.27,"SBIconsTX.Radial.Craft_Item_B",Class'SBGuiStrings'.default.Shop_Craft_Forge.Text);//088E : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1B 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 6B 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.28,"SBIconsTX.Radial.Craft_Item_B",Class'SBGuiStrings'.default.Shop_Craft_Soul.Text);//08D1 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1C 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 6C 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.29,"SBIconsTX.Radial.Craft_Item_B",Class'SBGuiStrings'.default.Shop_Craft_Rune.Text);//0914 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1D 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 6C 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.30,"SBIconsTX.Radial.Craft_Item_B",Class'SBGuiStrings'.default.Shop_Craft_Spirit.Text);//0957 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1E 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 6D 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.31,"SBIconsTX.Radial.Craft_Item_B",Class'SBGuiStrings'.default.Shop_Craft_Tavern.Text);//099A : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1F 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 6D 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.32,"SBIconsTX.Radial.Craft_Item_B",Class'SBGuiStrings'.default.Shop_Craft_General.Text);//09DD : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 20 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 6E 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.33,"SBIconsTX.Radial.Paint_Item_B",Class'SBGuiStrings'.default.Shop_Painting.Text);//0A20 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 21 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 50 61 69 6E 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 6E 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.34,"SBIconsTX.Radial.Craft_Item_B",Class'SBGuiStrings'.default.Shop_Sigil_Forging.Text);//0A63 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 22 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 6F 99 19 16 
    CreateRadialButton(Class'Game_RadialMenuOptions'.35,"SBIconsTX.Radial.Radial_Shop_BuySell_B",Class'SBGuiStrings'.default.Shop_Dragon.Text);//0AA6 : 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 23 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 6F 99 19 16 
    //0F 01 60 87 31 16 1E 00 00 80 43 0F 01 40 88 31 16 1E 00 00 80 43 0F 01 80 9F B7 1C 1E 00 00 96 
    //42 1C 28 9E 9E 19 16 0F 01 28 ED B8 1C 1B 26 98 00 00 1F 53 42 49 63 6F 6E 73 54 58 2E 50 72 6F 
    //6A 65 63 74 6F 72 73 2E 52 61 64 69 61 6C 53 68 61 64 65 72 00 1F 53 42 47 75 69 54 58 00 1F 00 
    //16 0F 01 A0 ED B8 1C 1B 26 98 00 00 1F 53 42 49 63 6F 6E 73 54 58 2E 50 72 6F 6A 65 63 74 6F 72 
    //73 2E 52 61 64 69 61 6C 53 69 6E 67 6C 65 53 68 61 64 65 72 00 1F 53 42 47 75 69 54 58 00 1F 00 
    //16 0F 01 18 EE B8 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 25 25 25 25 
    //16 19 01 18 EE B8 1C 11 00 00 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 09 16 19 01 18 EE B8 
    //1C 07 00 00 1B 14 98 00 00 28 16 0F 01 90 EE B8 1C 19 01 18 EE B8 1C 23 00 04 1B 20 98 00 00 1F 
    //47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 02 00 00 1D 00 08 00 00 16 25 25 25 2C 10 16 19 01 90 
    //EE B8 1C 1A 00 00 1B 52 98 00 00 1E 00 00 1E 43 1E 00 00 1A 43 1E 00 00 28 43 1E 00 00 7F 43 16 
    //19 01 90 EE B8 1C 1A 00 00 1B 49 98 00 00 1E 00 00 80 40 1E 00 00 00 00 1E 00 00 80 40 1E 00 00 
    //00 40 16 19 01 90 EE B8 1C 09 00 00 1B 19 98 00 00 25 25 25 16 1B 32 98 00 00 12 20 B0 D7 60 01 
    //02 00 01 24 01 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 44 65 
    //73 63 72 69 70 74 69 6F 6E 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 61 99 19 16 
    //1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 03 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 
    //6C 2E 52 61 64 69 61 6C 5F 44 65 73 63 72 69 70 74 69 6F 6E 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 80 34 97 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 04 1F 53 42 49 63 
    //6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 55 73 65 5F 42 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 10 62 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 05 1F 53 
    //42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4F 70 65 6E 44 6F 6F 72 5F 
    //42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 63 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 
    //01 02 00 01 24 06 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 
    //69 74 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 63 99 19 16 1B 32 98 00 00 12 20 
    //B0 D7 60 01 02 00 01 24 07 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 
    //6C 5F 54 72 61 64 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 98 97 19 16 1B 32 
    //98 00 00 12 20 B0 D7 60 01 02 00 01 24 08 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 
    //52 61 64 69 61 6C 5F 55 73 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 63 99 19 
    //16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 09 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 
    //61 6C 2E 52 61 64 69 61 6C 5F 55 73 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 
    //64 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 13 1F 53 42 49 63 6F 6E 73 54 58 2E 52 
    //61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 57 68 69 73 70 65 72 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 E0 F9 98 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0A 1F 53 42 49 63 
    //6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 57 68 69 73 70 65 72 5F 42 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 64 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 
    //24 0B 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4B 69 63 6B 5F 
    //46 72 6F 6D 5F 47 72 6F 75 70 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 2E 99 19 
    //16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0C 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 
    //61 6C 2E 52 61 64 69 61 6C 5F 49 6E 76 69 74 65 54 6F 47 72 6F 75 70 5F 42 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 58 65 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0E 1F 53 
    //42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 49 6E 76 69 74 65 54 6F 47 
    //75 69 6C 64 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 65 99 19 16 1B 32 98 00 00 
    //12 20 B0 D7 60 01 02 00 01 24 0D 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 
    //69 61 6C 5F 41 64 64 46 72 69 65 6E 64 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 
    //66 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 0F 1F 53 42 49 63 6F 6E 73 54 58 2E 52 
    //61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 54 72 61 76 65 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 C0 66 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 10 1F 53 42 49 63 6F 
    //6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4D 61 69 6C 5F 42 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 38 67 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 11 1F 53 
    //42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 44 75 65 6C 5F 42 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 67 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 
    //24 12 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 4D 69 6E 69 67 
    //61 6D 65 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 68 99 19 16 1B 32 98 00 00 12 
    //20 B0 D7 60 01 02 00 01 24 14 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 
    //61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 A0 68 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 15 1F 53 42 49 63 6F 6E 73 54 58 
    //2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 69 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 
    //24 16 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 
    //42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 69 99 19 16 1B 32 
    //98 00 00 12 20 B0 D7 60 01 02 00 01 24 17 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 
    //52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 08 6A 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 18 1F 53 42 49 63 6F 
    //6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 
    //42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 6A 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 
    //01 02 00 01 24 19 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 
    //68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 6A 99 
    //19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1A 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 
    //69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 70 6B 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 1B 1F 53 
    //42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 6B 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 
    //1C 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 6C 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 
    //00 01 24 1D 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 
    //5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 6C 99 19 16 1B 32 98 00 00 12 20 B0 D7 
    //60 01 02 00 01 24 1E 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 74 5F 49 
    //74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 6D 99 19 16 1B 32 98 00 00 12 
    //20 B0 D7 60 01 02 00 01 24 1F 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 72 61 66 
    //74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 6D 99 19 16 1B 32 98 
    //00 00 12 20 B0 D7 60 01 02 00 01 24 20 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 6C 2E 43 
    //72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 6E 99 19 16 
    //1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 21 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 64 69 61 
    //6C 2E 50 61 69 6E 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 6E 
    //99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 22 1F 53 42 49 63 6F 6E 73 54 58 2E 52 61 
    //64 69 61 6C 2E 43 72 61 66 74 5F 49 74 65 6D 5F 42 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 30 6F 99 19 16 1B 32 98 00 00 12 20 B0 D7 60 01 02 00 01 24 23 1F 53 42 49 63 6F 6E 73 54 58 
    //2E 52 61 64 69 61 6C 2E 52 61 64 69 61 6C 5F 53 68 6F 70 5F 42 75 79 53 65 6C 6C 5F 42 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 6F 99 19 16 04 0B 47 
  }



