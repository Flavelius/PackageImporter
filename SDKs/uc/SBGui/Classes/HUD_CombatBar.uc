//==============================================================================
//  HUD_CombatBar
//==============================================================================

class HUD_CombatBar extends GUI_Window
    native
    dependsOn(GUI_Label,GUI_Mesh,Game_PlayerController,Game_PlayerInput,Combiner,Game_Pawn,Game_Skills,TexScaler,FSkill_Type,Texture,Shader)
    Transient
    Config(User)
  ;

  const BACKGROUND_OFFSET =  106;
  const COMBATBAR_HEIGHT =  128;
  const COMBATBAR_WIDTH =  370;
  const ICON_REFRESH_RATE =  0.333;
  const DEFAULT_YAW_ANGLE =  16834;
  const TIER_TIMEOUT_ANGLE =  32768;
  const ONE_TIER_ANGLE =  10922.66667;
  const CBB_RIGHT_BORDER =  0.17;
  const CBB_LEFT_BORDER =  0.17;
  const SLOT_COUNT =  5;
  const TIER_COUNT =  6;
  const BAR_OFFSET_Z =  530;
  const BAR_OFFSET_Y =  -20;
  const BAR_OFFSET_X =  7;
  enum eSlotMaterialTypes {
    SMT_NORMAL ,
    SMT_DISABLED ,
    SMT_SELECTED 
  };

  var private GUI_Label mBackgroundImage;
  var private GUI_Mesh mCombatBarComponent01;
  var private GUI_Mesh mCombatBarComponent03;
  var private GUI_Mesh mCombatBarComponent04;
  var private GUI_Mesh mCombatBarComponent05;
  var private GUI_Mesh mCombatBarComponent06;
  var private int mCurrentRow;
  var private int mCurrentSlot;
  var private Combiner mHighlightCombiner;
  var private Shader mHighlightShader;
  var private TexOscillator mAnimation;
  var private Texture mEmptySlotMaterial;
  var private Texture mClocksheet;
  var private Texture mHoverMaterial;
  var private Texture mNormalMaterial;
  var private Texture mPressedMaterial;
  var private Texture mDisabledMaterial;
  var private Material mSlotMaterials[30];
  var private Material mComboMaterials[30];
  var private Material mComboStringMaterial;
  var private Material mComboOpenerMaterial;
  var private Material mComboFollowUpMaterial;
  var private Material mComboEmptyMaterial;
  var private Material mComboFinisherMaterial;
  var private Material mComboDisabledMaterial;
  var private int mClockCoordinateX[64];
  var private int mClockCoordinateY[64];
  var private bool mIsMouseDown;
  var private GUI_Label mComboStringIcons[8];


  function OnComponentShown() {
    mDesktop.PlaySound(Class'GUI_Sounds'.default.CombatbarAppears);             //0000 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 D0 21 A6 19 16 
    //19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 D0 21 A6 19 16 04 0B 47 
    //
  }


  function HandleComboStringChanged(int aStringLength) {
    local int i;
    if (aStringLength == 1) {                                                   //0000 : 07 28 00 9A 00 B0 B4 A7 19 26 16 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.ComboStart);                 //000B : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 60 23 A6 19 16 
    }
    if (aStringLength > 1) {                                                    //0028 : 07 50 00 97 00 B0 B4 A7 19 26 16 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.ComboFollowUp);              //0033 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 00 24 A6 19 16 
    }
    if (aStringLength == 0) {                                                   //0050 : 07 78 00 9A 00 B0 B4 A7 19 25 16 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.ComboFinish);                //005B : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 A0 24 A6 19 16 
    }
    i = 0;                                                                      //0078 : 0F 00 50 B6 A7 19 25 
    while (i < 8) {                                                             //007F : 07 B6 00 96 00 50 B6 A7 19 2C 08 16 
      mComboStringIcons[i].SetVisible(i < aStringLength);                       //008B : 19 1A 00 50 B6 A7 19 01 C8 B6 A7 19 12 00 00 1B 14 98 00 00 96 00 50 B6 A7 19 00 B0 B4 A7 19 16 16 
      i++;                                                                      //00AC : A5 00 50 B6 A7 19 16 
    }
    //07 28 00 9A 00 B0 B4 A7 19 26 16 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 
    //00 04 02 60 23 A6 19 16 07 50 00 97 00 B0 B4 A7 19 26 16 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 
    //00 12 20 E0 7C 9E 19 05 00 04 02 00 24 A6 19 16 07 78 00 9A 00 B0 B4 A7 19 25 16 19 01 48 0C 9D 
    //19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 A0 24 A6 19 16 0F 00 50 B6 A7 19 25 07 
    //B6 00 96 00 50 B6 A7 19 2C 08 16 19 1A 00 50 B6 A7 19 01 C8 B6 A7 19 12 00 00 1B 14 98 00 00 96 
    //00 50 B6 A7 19 00 B0 B4 A7 19 16 16 A5 00 50 B6 A7 19 16 06 7F 00 04 0B 47 
  }


  function OnSkilldeckChanged() {
    AssignIconMaterials();                                                      //0000 : 1B 70 99 00 00 16 
    mDesktop.PlaySound(Class'GUI_Sounds'.default.CombatbarChange);              //0006 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 C0 22 A6 19 16 
    //1B 70 99 00 00 16 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 C0 22 
    //A6 19 16 04 0B 47 
  }


  function OnActivateSkillFailed() {
    mDesktop.PlaySound(Class'GUI_Sounds'.default.CannotActivateSkill);          //0000 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 00 20 A6 19 16 
    //19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 00 20 A6 19 16 04 0B 47 
    //
  }


  function OnRollToFirstTier() {
    mDesktop.PlaySound(Class'GUI_Sounds'.default.ResetCombatbar);               //0000 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 88 1F A6 19 16 
    //19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 88 1F A6 19 16 04 0B 47 
    //
  }


  function OnRollToNextTier() {
    mDesktop.PlaySound(Class'GUI_Sounds'.default.RollToNextTier);               //0000 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 10 1F A6 19 16 
    //19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 10 1F A6 19 16 04 0B 47 
    //
  }


  function bool MouseUpHandler(float MouseX,float MouseY,int buttons) {
    local int SelectedSkillIndex;
    local float leftBorder;
    local float rightBorder;
    leftBorder = mCombatBarComponent01.mWidth * 0.17000000;                     //0000 : 0F 00 F8 BD A7 19 AB 19 01 70 BE A7 19 05 00 04 01 60 87 31 16 1E 7B 14 2E 3E 16 
    rightBorder = mCombatBarComponent01.mWidth * 0.17000000;                    //001B : 0F 00 E8 BE A7 19 AB 19 01 70 BE A7 19 05 00 04 01 60 87 31 16 1E 7B 14 2E 3E 16 
    if (buttons == Class'GUI_BaseDesktop'.1) {                                  //0036 : 07 E3 00 9A 00 60 BF A7 19 12 20 00 68 D7 00 01 00 04 26 16 
      mIsMouseDown = False;                                                     //004A : 14 2D 01 D8 BF A7 19 28 
      if (MouseX > leftBorder && MouseX < mWidth - rightBorder) {               //0052 : 07 E3 00 82 B1 00 18 BC A7 19 00 F8 BD A7 19 16 18 14 00 B0 00 18 BC A7 19 AF 01 60 87 31 16 00 E8 BE A7 19 16 16 16 
        SelectedSkillIndex = (MouseX - leftBorder) / (mWidth - leftBorder - rightBorder) / 5;//0079 : 0F 00 50 C0 A7 19 39 44 AC 39 3F 39 44 AF 00 18 BC A7 19 00 F8 BD A7 19 16 AC AF AF 01 60 87 31 16 00 F8 BD A7 19 16 00 E8 BE A7 19 16 39 3F 2C 05 16 16 
        if (SelectedSkillIndex >= 0 && SelectedSkillIndex < 5) {                //00AC : 07 E3 00 82 99 00 50 C0 A7 19 25 16 18 0A 00 96 00 50 C0 A7 19 2C 05 16 16 
          GetGamePlayerController().Input.SelectAndExecuteSkill(SelectedSkillIndex);//00C5 : 19 19 1B 3A 98 00 00 16 05 00 04 01 B0 14 37 0F 0B 00 00 1B 90 1B 00 00 00 50 C0 A7 19 16 
        }
      }
    }
    return True;                                                                //00E3 : 04 27 
    //0F 00 F8 BD A7 19 AB 19 01 70 BE A7 19 05 00 04 01 60 87 31 16 1E 7B 14 2E 3E 16 0F 00 E8 BE A7 
    //19 AB 19 01 70 BE A7 19 05 00 04 01 60 87 31 16 1E 7B 14 2E 3E 16 07 E3 00 9A 00 60 BF A7 19 12 
    //20 00 68 D7 00 01 00 04 26 16 14 2D 01 D8 BF A7 19 28 07 E3 00 82 B1 00 18 BC A7 19 00 F8 BD A7 
    //19 16 18 14 00 B0 00 18 BC A7 19 AF 01 60 87 31 16 00 E8 BE A7 19 16 16 16 0F 00 50 C0 A7 19 39 
    //44 AC 39 3F 39 44 AF 00 18 BC A7 19 00 F8 BD A7 19 16 AC AF AF 01 60 87 31 16 00 F8 BD A7 19 16 
    //00 E8 BE A7 19 16 39 3F 2C 05 16 16 07 E3 00 82 99 00 50 C0 A7 19 25 16 18 0A 00 96 00 50 C0 A7 
    //19 2C 05 16 16 19 19 1B 3A 98 00 00 16 05 00 04 01 B0 14 37 0F 0B 00 00 1B 90 1B 00 00 00 50 C0 
    //A7 19 16 04 27 04 0B 47 
  }


  function OnMessage(Object aSender,optional int intParam,optional Object objParam,optional string stringParam) {
    //04 0B 47 
  }


  function AssignIconMaterials(optional int aHighlightTier) {
    local int Index;
    local Combiner radialCombiner;
    local TexScaler iconScaler;
    local TexScaler clockScaler;
    local Combiner skillBlendCombiner;
    local Combiner mainCombiner;
    local Combiner comboBlendCombiner;
    local Shader comboShader;
    local Game_Pawn gamePawn;
    local bool validSkill;
    local bool isTierEnabled;
    local int tier;
    local int Slot;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 48 CD A7 19 1B 2B 0C 00 00 16 
    if (gamePawn == None) {                                                     //000C : 07 19 00 72 00 48 CD A7 19 2A 16 
      return;                                                                   //0017 : 04 0B 
    }
    Index = 0;                                                                  //0019 : 0F 00 C0 CD A7 19 25 
    tier = 0;                                                                   //0020 : 0F 00 38 CE A7 19 25 
    while (tier < 6) {                                                          //0027 : 07 71 05 96 00 38 CE A7 19 2C 06 16 
      isTierEnabled = tier == 1;                                                //0033 : 14 2D 00 B0 CE A7 19 9A 00 38 CE A7 19 26 16 
      Slot = 0;                                                                 //0042 : 0F 00 28 CF A7 19 25 
      while (Slot < 5) {                                                        //0049 : 07 67 05 96 00 28 CF A7 19 2C 05 16 
        skillBlendCombiner = new Class'Combiner';                               //0055 : 0F 00 A0 CF A7 19 11 0B 0B 0B 20 40 8D C3 00 
        skillBlendCombiner.AlphaOperation = 3;                                  //0064 : 0F 19 00 A0 CF A7 19 05 00 01 01 00 42 2C 11 24 03 
        skillBlendCombiner.Material2 = mDisabledMaterial;                       //0075 : 0F 19 00 A0 CF A7 19 05 00 04 01 F0 42 2C 11 01 18 D0 A7 19 
        validSkill = Index < gamePawn.Skills.SkilldeckSkills.Length
          && gamePawn.Skills.SkilldeckSkills[Index] != None;//0089 : 14 2D 00 90 D0 A7 19 82 96 00 C0 CD A7 19 37 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 16 18 21 00 77 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 2A 16 16 
        if (validSkill) {                                                       //00D4 : 07 61 02 2D 00 90 D0 A7 19 
          iconScaler = new Class'TexScaler';                                    //00DD : 0F 00 08 D1 A7 19 11 0B 0B 0B 20 80 BC C3 00 
          iconScaler.UScale = 0.75999999;                                       //00EC : 0F 19 00 08 D1 A7 19 05 00 04 01 48 26 2C 11 1E 5C 8F 42 3F 
          iconScaler.VScale = 0.75999999;                                       //0100 : 0F 19 00 08 D1 A7 19 05 00 04 01 C0 26 2C 11 1E 5C 8F 42 3F 
          iconScaler.UOffset = -5.00000000;                                     //0114 : 0F 19 00 08 D1 A7 19 05 00 04 01 38 27 2C 11 1E 00 00 A0 C0 
          iconScaler.VOffset = -5.00000000;                                     //0128 : 0F 19 00 08 D1 A7 19 05 00 04 01 B0 27 2C 11 1E 00 00 A0 C0 
          iconScaler.Material = gamePawn.Skills.SkilldeckSkills[Index].Logo;    //013C : 0F 19 00 08 D1 A7 19 05 00 04 01 28 28 2C 11 19 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 05 00 04 01 68 B3 20 11 
          Texture(iconScaler.Material).UClampMode = 2;                          //0171 : 0F 19 2E B8 3A D6 00 19 00 08 D1 A7 19 05 00 04 01 28 28 2C 11 05 00 01 01 D8 48 70 0F 24 02 
          Texture(iconScaler.Material).VClampMode = 2;                          //0190 : 0F 19 2E B8 3A D6 00 19 00 08 D1 A7 19 05 00 04 01 28 28 2C 11 05 00 01 01 A0 49 70 0F 24 02 
          radialCombiner = new Class'Combiner';                                 //01AF : 0F 00 80 D1 A7 19 11 0B 0B 0B 20 40 8D C3 00 
          radialCombiner.CombineOperation = 5;                                  //01BE : 0F 19 00 80 D1 A7 19 05 00 01 01 88 41 2C 11 24 05 
          radialCombiner.AlphaOperation = 0;                                    //01CF : 0F 19 00 80 D1 A7 19 05 00 01 01 00 42 2C 11 24 00 
          radialCombiner.Material1 = iconScaler;                                //01E0 : 0F 19 00 80 D1 A7 19 05 00 04 01 78 42 2C 11 00 08 D1 A7 19 
          radialCombiner.Material2 = mNormalMaterial;                           //01F4 : 0F 19 00 80 D1 A7 19 05 00 04 01 F0 42 2C 11 01 F8 D1 A7 19 
          radialCombiner.Mask = mNormalMaterial;                                //0208 : 0F 19 00 80 D1 A7 19 05 00 04 01 68 43 2C 11 01 F8 D1 A7 19 
          skillBlendCombiner.Material1 = radialCombiner;                        //021C : 0F 19 00 A0 CF A7 19 05 00 04 01 78 42 2C 11 00 80 D1 A7 19 
          if (isTierEnabled) {                                                  //0230 : 07 4D 02 2D 00 B0 CE A7 19 
            skillBlendCombiner.CombineOperation = 0;                            //0239 : 0F 19 00 A0 CF A7 19 05 00 01 01 88 41 2C 11 24 00 
          } else {                                                              //024A : 06 5E 02 
            skillBlendCombiner.CombineOperation = 2;                            //024D : 0F 19 00 A0 CF A7 19 05 00 01 01 88 41 2C 11 24 02 
          }
        } else {                                                                //025E : 06 86 02 
          skillBlendCombiner.Material1 = mEmptySlotMaterial;                    //0261 : 0F 19 00 A0 CF A7 19 05 00 04 01 78 42 2C 11 01 70 D2 A7 19 
          skillBlendCombiner.CombineOperation = 2;                              //0275 : 0F 19 00 A0 CF A7 19 05 00 01 01 88 41 2C 11 24 02 
        }
        clockScaler = new Class'TexScaler';                                     //0286 : 0F 00 E8 D2 A7 19 11 0B 0B 0B 20 80 BC C3 00 
        clockScaler.UScale = 8.00000000;                                        //0295 : 0F 19 00 E8 D2 A7 19 05 00 04 01 48 26 2C 11 1E 00 00 00 41 
        clockScaler.VScale = 8.00000000;                                        //02A9 : 0F 19 00 E8 D2 A7 19 05 00 04 01 C0 26 2C 11 1E 00 00 00 41 
        clockScaler.UOffset = 224.00000000;                                     //02BD : 0F 19 00 E8 D2 A7 19 05 00 04 01 38 27 2C 11 1E 00 00 60 43 
        clockScaler.VOffset = 224.00000000;                                     //02D1 : 0F 19 00 E8 D2 A7 19 05 00 04 01 B0 27 2C 11 1E 00 00 60 43 
        clockScaler.Material = mClocksheet;                                     //02E5 : 0F 19 00 E8 D2 A7 19 05 00 04 01 28 28 2C 11 01 60 D3 A7 19 
        mainCombiner = new Class'Combiner';                                     //02F9 : 0F 00 D8 D3 A7 19 11 0B 0B 0B 20 40 8D C3 00 
        mainCombiner.Material1 = skillBlendCombiner;                            //0308 : 0F 19 00 D8 D3 A7 19 05 00 04 01 78 42 2C 11 00 A0 CF A7 19 
        mainCombiner.Material2 = clockScaler;                                   //031C : 0F 19 00 D8 D3 A7 19 05 00 04 01 F0 42 2C 11 00 E8 D2 A7 19 
        mainCombiner.Mask = clockScaler;                                        //0330 : 0F 19 00 D8 D3 A7 19 05 00 04 01 68 43 2C 11 00 E8 D2 A7 19 
        mainCombiner.CombineOperation = 5;                                      //0344 : 0F 19 00 D8 D3 A7 19 05 00 01 01 88 41 2C 11 24 05 
        mainCombiner.AlphaOperation = 3;                                        //0355 : 0F 19 00 D8 D3 A7 19 05 00 01 01 00 42 2C 11 24 03 
        mSlotMaterials[Index] = mainCombiner;                                   //0366 : 0F 1A 00 C0 CD A7 19 01 50 D4 A7 19 00 D8 D3 A7 19 
        mCombatBarComponent01.SetMeshMaterial(Index,mainCombiner);              //0377 : 19 01 70 BE A7 19 10 00 00 1B 03 9A 00 00 00 C0 CD A7 19 00 D8 D3 A7 19 16 
        comboBlendCombiner = new Class'Combiner';                               //0390 : 0F 00 C8 D4 A7 19 11 0B 0B 0B 20 40 8D C3 00 
        comboBlendCombiner.AlphaOperation = 3;                                  //039F : 0F 19 00 C8 D4 A7 19 05 00 01 01 00 42 2C 11 24 03 
        comboBlendCombiner.Material2 = mComboDisabledMaterial;                  //03B0 : 0F 19 00 C8 D4 A7 19 05 00 04 01 F0 42 2C 11 01 40 D5 A7 19 
        if (isTierEnabled && validSkill) {                                      //03C4 : 07 EC 03 82 2D 00 B0 CE A7 19 18 07 00 2D 00 90 D0 A7 19 16 
          comboBlendCombiner.CombineOperation = 0;                              //03D8 : 0F 19 00 C8 D4 A7 19 05 00 01 01 88 41 2C 11 24 00 
        } else {                                                                //03E9 : 06 FD 03 
          comboBlendCombiner.CombineOperation = 2;                              //03EC : 0F 19 00 C8 D4 A7 19 05 00 01 01 88 41 2C 11 24 02 
        }
        if (validSkill
          && gamePawn.Skills.SkilldeckSkills[Index].IsComboOpener()) {//03FD : 07 49 04 82 2D 00 90 D0 A7 19 18 28 00 19 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 06 00 04 1C D8 96 20 11 16 16 
          comboBlendCombiner.Material1 = mComboOpenerMaterial;                  //0432 : 0F 19 00 C8 D4 A7 19 05 00 04 01 78 42 2C 11 01 B8 D5 A7 19 
        } else {                                                                //0446 : 06 F5 04 
          if (validSkill
            && gamePawn.Skills.SkilldeckSkills[Index].IsComboFinisher()) {//0449 : 07 95 04 82 2D 00 90 D0 A7 19 18 28 00 19 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 06 00 04 1C 80 95 20 11 16 16 
            comboBlendCombiner.Material1 = mComboFinisherMaterial;              //047E : 0F 19 00 C8 D4 A7 19 05 00 04 01 78 42 2C 11 01 30 D6 A7 19 
            goto jl04F5;                                                        //0492 : 06 F5 04 
          }
          if (validSkill
            && gamePawn.Skills.SkilldeckSkills[Index].IsComboNormal()) {//0495 : 07 E1 04 82 2D 00 90 D0 A7 19 18 28 00 19 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 06 00 04 1C 28 94 20 11 16 16 
            comboBlendCombiner.Material1 = mComboFollowUpMaterial;              //04CA : 0F 19 00 C8 D4 A7 19 05 00 04 01 78 42 2C 11 01 A8 D6 A7 19 
            goto jl04F5;                                                        //04DE : 06 F5 04 
          }
          comboBlendCombiner.Material1 = mComboEmptyMaterial;                   //04E1 : 0F 19 00 C8 D4 A7 19 05 00 04 01 78 42 2C 11 01 20 D7 A7 19 
        }
        comboShader = new Class'Shader';                                        //04F5 : 0F 00 98 D7 A7 19 11 0B 0B 0B 20 00 88 C3 00 
        comboShader.Diffuse = comboBlendCombiner;                               //0504 : 0F 19 00 98 D7 A7 19 05 00 04 01 D0 5B 37 0F 00 C8 D4 A7 19 
        comboShader.Opacity = comboBlendCombiner;                               //0518 : 0F 19 00 98 D7 A7 19 05 00 04 01 58 44 2C 11 00 C8 D4 A7 19 
        mComboMaterials[Index] = comboShader;                                   //052C : 0F 1A 00 C0 CD A7 19 01 10 D8 A7 19 00 98 D7 A7 19 
        mCombatBarComponent05.SetMeshMaterial(Index,comboShader);               //053D : 19 01 88 D8 A7 19 10 00 00 1B 03 9A 00 00 00 C0 CD A7 19 00 98 D7 A7 19 16 
        ++Index;                                                                //0556 : A3 00 C0 CD A7 19 16 
        ++Slot;                                                                 //055D : A3 00 28 CF A7 19 16 
      }
      ++tier;                                                                   //0567 : A3 00 38 CE A7 19 16 
    }
    //0F 00 48 CD A7 19 1B 2B 0C 00 00 16 07 19 00 72 00 48 CD A7 19 2A 16 04 0B 0F 00 C0 CD A7 19 25 
    //0F 00 38 CE A7 19 25 07 71 05 96 00 38 CE A7 19 2C 06 16 14 2D 00 B0 CE A7 19 9A 00 38 CE A7 19 
    //26 16 0F 00 28 CF A7 19 25 07 67 05 96 00 28 CF A7 19 2C 05 16 0F 00 A0 CF A7 19 11 0B 0B 0B 20 
    //40 8D C3 00 0F 19 00 A0 CF A7 19 05 00 01 01 00 42 2C 11 24 03 0F 19 00 A0 CF A7 19 05 00 04 01 
    //F0 42 2C 11 01 18 D0 A7 19 14 2D 00 90 D0 A7 19 82 96 00 C0 CD A7 19 37 19 19 00 48 CD A7 19 05 
    //00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 16 18 21 00 77 10 00 C0 CD A7 19 19 19 00 48 CD A7 
    //19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 2A 16 16 07 61 02 2D 00 90 D0 A7 19 0F 00 08 
    //D1 A7 19 11 0B 0B 0B 20 80 BC C3 00 0F 19 00 08 D1 A7 19 05 00 04 01 48 26 2C 11 1E 5C 8F 42 3F 
    //0F 19 00 08 D1 A7 19 05 00 04 01 C0 26 2C 11 1E 5C 8F 42 3F 0F 19 00 08 D1 A7 19 05 00 04 01 38 
    //27 2C 11 1E 00 00 A0 C0 0F 19 00 08 D1 A7 19 05 00 04 01 B0 27 2C 11 1E 00 00 A0 C0 0F 19 00 08 
    //D1 A7 19 05 00 04 01 28 28 2C 11 19 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 
    //11 05 00 00 01 C8 3D 24 11 05 00 04 01 68 B3 20 11 0F 19 2E B8 3A D6 00 19 00 08 D1 A7 19 05 00 
    //04 01 28 28 2C 11 05 00 01 01 D8 48 70 0F 24 02 0F 19 2E B8 3A D6 00 19 00 08 D1 A7 19 05 00 04 
    //01 28 28 2C 11 05 00 01 01 A0 49 70 0F 24 02 0F 00 80 D1 A7 19 11 0B 0B 0B 20 40 8D C3 00 0F 19 
    //00 80 D1 A7 19 05 00 01 01 88 41 2C 11 24 05 0F 19 00 80 D1 A7 19 05 00 01 01 00 42 2C 11 24 00 
    //0F 19 00 80 D1 A7 19 05 00 04 01 78 42 2C 11 00 08 D1 A7 19 0F 19 00 80 D1 A7 19 05 00 04 01 F0 
    //42 2C 11 01 F8 D1 A7 19 0F 19 00 80 D1 A7 19 05 00 04 01 68 43 2C 11 01 F8 D1 A7 19 0F 19 00 A0 
    //CF A7 19 05 00 04 01 78 42 2C 11 00 80 D1 A7 19 07 4D 02 2D 00 B0 CE A7 19 0F 19 00 A0 CF A7 19 
    //05 00 01 01 88 41 2C 11 24 00 06 5E 02 0F 19 00 A0 CF A7 19 05 00 01 01 88 41 2C 11 24 02 06 86 
    //02 0F 19 00 A0 CF A7 19 05 00 04 01 78 42 2C 11 01 70 D2 A7 19 0F 19 00 A0 CF A7 19 05 00 01 01 
    //88 41 2C 11 24 02 0F 00 E8 D2 A7 19 11 0B 0B 0B 20 80 BC C3 00 0F 19 00 E8 D2 A7 19 05 00 04 01 
    //48 26 2C 11 1E 00 00 00 41 0F 19 00 E8 D2 A7 19 05 00 04 01 C0 26 2C 11 1E 00 00 00 41 0F 19 00 
    //E8 D2 A7 19 05 00 04 01 38 27 2C 11 1E 00 00 60 43 0F 19 00 E8 D2 A7 19 05 00 04 01 B0 27 2C 11 
    //1E 00 00 60 43 0F 19 00 E8 D2 A7 19 05 00 04 01 28 28 2C 11 01 60 D3 A7 19 0F 00 D8 D3 A7 19 11 
    //0B 0B 0B 20 40 8D C3 00 0F 19 00 D8 D3 A7 19 05 00 04 01 78 42 2C 11 00 A0 CF A7 19 0F 19 00 D8 
    //D3 A7 19 05 00 04 01 F0 42 2C 11 00 E8 D2 A7 19 0F 19 00 D8 D3 A7 19 05 00 04 01 68 43 2C 11 00 
    //E8 D2 A7 19 0F 19 00 D8 D3 A7 19 05 00 01 01 88 41 2C 11 24 05 0F 19 00 D8 D3 A7 19 05 00 01 01 
    //00 42 2C 11 24 03 0F 1A 00 C0 CD A7 19 01 50 D4 A7 19 00 D8 D3 A7 19 19 01 70 BE A7 19 10 00 00 
    //1B 03 9A 00 00 00 C0 CD A7 19 00 D8 D3 A7 19 16 0F 00 C8 D4 A7 19 11 0B 0B 0B 20 40 8D C3 00 0F 
    //19 00 C8 D4 A7 19 05 00 01 01 00 42 2C 11 24 03 0F 19 00 C8 D4 A7 19 05 00 04 01 F0 42 2C 11 01 
    //40 D5 A7 19 07 EC 03 82 2D 00 B0 CE A7 19 18 07 00 2D 00 90 D0 A7 19 16 0F 19 00 C8 D4 A7 19 05 
    //00 01 01 88 41 2C 11 24 00 06 FD 03 0F 19 00 C8 D4 A7 19 05 00 01 01 88 41 2C 11 24 02 07 49 04 
    //82 2D 00 90 D0 A7 19 18 28 00 19 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 
    //05 00 00 01 C8 3D 24 11 06 00 04 1C D8 96 20 11 16 16 0F 19 00 C8 D4 A7 19 05 00 04 01 78 42 2C 
    //11 01 B8 D5 A7 19 06 F5 04 07 95 04 82 2D 00 90 D0 A7 19 18 28 00 19 10 00 C0 CD A7 19 19 19 00 
    //48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 06 00 04 1C 80 95 20 11 16 16 0F 19 
    //00 C8 D4 A7 19 05 00 04 01 78 42 2C 11 01 30 D6 A7 19 06 F5 04 07 E1 04 82 2D 00 90 D0 A7 19 18 
    //28 00 19 10 00 C0 CD A7 19 19 19 00 48 CD A7 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 
    //06 00 04 1C 28 94 20 11 16 16 0F 19 00 C8 D4 A7 19 05 00 04 01 78 42 2C 11 01 A8 D6 A7 19 06 F5 
    //04 0F 19 00 C8 D4 A7 19 05 00 04 01 78 42 2C 11 01 20 D7 A7 19 0F 00 98 D7 A7 19 11 0B 0B 0B 20 
    //00 88 C3 00 0F 19 00 98 D7 A7 19 05 00 04 01 D0 5B 37 0F 00 C8 D4 A7 19 0F 19 00 98 D7 A7 19 05 
    //00 04 01 58 44 2C 11 00 C8 D4 A7 19 0F 1A 00 C0 CD A7 19 01 10 D8 A7 19 00 98 D7 A7 19 19 01 88 
    //D8 A7 19 10 00 00 1B 03 9A 00 00 00 C0 CD A7 19 00 98 D7 A7 19 16 A3 00 C0 CD A7 19 16 A3 00 28 
    //CF A7 19 16 06 49 00 A3 00 38 CE A7 19 16 06 27 00 04 0B 47 
  }


  event DoShowWindow(int aFlags) {
    Super.DoShowWindow(aFlags);                                                 //0000 : 1C 20 7A 9E 19 00 B0 D9 A7 19 16 
    if (aFlags == Class'GUI_BaseDesktop'.1
      && GetPawn() != None) {        //000B : 07 C9 00 82 9A 00 B0 D9 A7 19 12 20 00 68 D7 00 01 00 04 26 16 18 0A 00 77 1B 2B 0C 00 00 16 2A 16 16 
      AssignIconMaterials();                                                    //002D : 1B 70 99 00 00 16 
      GetGamePlayerController().Input.__OnActivateSkillFailed__Delegate = OnActivateSkillFailed;//0033 : 45 19 19 1B 3A 98 00 00 16 05 00 04 01 B0 14 37 0F 05 00 08 01 08 30 27 11 44 B0 05 00 00 
      GetPawn().Skills.__OnRollToNextTier__Delegate = OnRollToNextTier;         //0051 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 10 58 24 11 44 EB 05 00 00 
      GetPawn().Skills.__OnRollToFirstTier__Delegate = OnRollToFirstTier;       //006F : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 20 57 24 11 44 EA 05 00 00 
      GetPawn().Skills.__OnSkilldeckChanged__Delegate = OnSkilldeckChanged;     //008D : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 58 24 11 44 F6 05 00 00 
      GetPawn().Skills.__OnComboStringChanged__Delegate = HandleComboStringChanged;//00AB : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 B0 49 23 11 44 0B 9A 00 00 
    }
    //1C 20 7A 9E 19 00 B0 D9 A7 19 16 07 C9 00 82 9A 00 B0 D9 A7 19 12 20 00 68 D7 00 01 00 04 26 16 
    //18 0A 00 77 1B 2B 0C 00 00 16 2A 16 16 1B 70 99 00 00 16 45 19 19 1B 3A 98 00 00 16 05 00 04 01 
    //B0 14 37 0F 05 00 08 01 08 30 27 11 44 B0 05 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 
    //18 11 05 00 08 01 10 58 24 11 44 EB 05 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 
    //05 00 08 01 20 57 24 11 44 EA 05 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 
    //08 01 88 58 24 11 44 F6 05 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 
    //B0 49 23 11 44 0B 9A 00 00 04 0B 47 
  }


  event OnComponentDestroyed() {
    if (GetPawn() != None) {                                                    //0000 : 07 A2 00 77 1B 2B 0C 00 00 16 2A 16 
      GetGamePlayerController().Input.__OnActivateSkillFailed__Delegate = None; //000C : 45 19 19 1B 3A 98 00 00 16 05 00 04 01 B0 14 37 0F 05 00 08 01 08 30 27 11 44 00 00 00 00 
      GetPawn().Skills.__OnRollToNextTier__Delegate = None;                     //002A : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 10 58 24 11 44 00 00 00 00 
      GetPawn().Skills.__OnRollToFirstTier__Delegate = None;                    //0048 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 20 57 24 11 44 00 00 00 00 
      GetPawn().Skills.__OnSkilldeckChanged__Delegate = None;                   //0066 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 58 24 11 44 00 00 00 00 
      GetPawn().Skills.__OnComboStringChanged__Delegate = None;                 //0084 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 B0 49 23 11 44 00 00 00 00 
    }
    Super.OnComponentDestroyed();                                               //00A2 : 1C E0 DA 9D 19 16 
    //07 A2 00 77 1B 2B 0C 00 00 16 2A 16 45 19 19 1B 3A 98 00 00 16 05 00 04 01 B0 14 37 0F 05 00 08 
    //01 08 30 27 11 44 00 00 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 10 
    //58 24 11 44 00 00 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 20 57 24 
    //11 44 00 00 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 58 24 11 44 
    //00 00 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 B0 49 23 11 44 00 00 
    //00 00 1C E0 DA 9D 19 16 04 0B 47 
  }


  function SetDelegates() {
    __OnMouseUp__Delegate = MouseUpHandler;                                     //0000 : 45 01 C8 E8 9D 19 44 8D 9A 00 00 
    if (GetPawn() != None) {                                                    //000B : 07 8F 00 77 1B 2B 0C 00 00 16 2A 16 
      GetPawn().Skills.__OnRollToNextTier__Delegate = OnRollToNextTier;         //0017 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 10 58 24 11 44 EB 05 00 00 
      GetPawn().Skills.__OnRollToFirstTier__Delegate = OnRollToFirstTier;       //0035 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 20 57 24 11 44 EA 05 00 00 
      GetPawn().Skills.__OnSkilldeckChanged__Delegate = OnSkilldeckChanged;     //0053 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 58 24 11 44 F6 05 00 00 
      GetPawn().Skills.__OnComboStringChanged__Delegate = HandleComboStringChanged;//0071 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 B0 49 23 11 44 0B 9A 00 00 
    }
    //45 01 C8 E8 9D 19 44 8D 9A 00 00 07 8F 00 77 1B 2B 0C 00 00 16 2A 16 45 19 19 1B 2B 0C 00 00 16 
    //05 00 04 01 08 28 18 11 05 00 08 01 10 58 24 11 44 EB 05 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 
    //04 01 08 28 18 11 05 00 08 01 20 57 24 11 44 EA 05 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 
    //08 28 18 11 05 00 08 01 88 58 24 11 44 F6 05 00 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 
    //18 11 05 00 08 01 B0 49 23 11 44 0B 9A 00 00 04 0B 47 
  }


  event Initialize() {
    local int i;
    local Game_PlayerController PlayerController;
    PrecalculateClockCoordinates();                                             //0000 : 1B CC 98 00 00 16 
    mWidth = 370.00000000;                                                      //0006 : 0F 01 60 87 31 16 1E 00 00 B9 43 
    mHeight = 128.00000000;                                                     //0011 : 0F 01 40 88 31 16 1E 00 00 00 43 
    mWindowStyle = mWindowStyle | 16384;                                        //001C : 0F 01 70 61 9E 19 9E 01 70 61 9E 19 1D 00 40 00 00 16 
    Super.Initialize();                                                         //002E : 1C 28 9E 9E 19 16 
    PlayerController = GetGamePlayerController();                               //0034 : 0F 00 E8 E5 A7 19 1B 3A 98 00 00 16 
    SetComponentTitle("HUD_CombatBar");                                         //0040 : 1B 42 97 00 00 1F 48 55 44 5F 43 6F 6D 62 61 74 42 61 72 00 16 
    mCombatBarComponent04 = CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon04",7,-20,370,128,16834,0,0,530.00000000,15.00000000,True);//0055 : 0F 01 60 E6 A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 34 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 
    mCombatBarComponent03 = CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon03",7,-20,370,128,16834,0,0,530.00000000,15.00000000,True);//00AA : 0F 01 D8 E6 A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 33 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 
    mCombatBarComponent06 = CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon06",7,-20,370,128,16834,0,0,530.00000000,15.00000000,True);//00FF : 0F 01 50 E7 A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 36 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 
    mCombatBarComponent01 = CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon01",7,-20,370,128,16834,0,0,530.00000000,15.00000000,True);//0154 : 0F 01 70 BE A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 31 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 
    mCombatBarComponent05 = CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon05",7,-20,370,128,16834,0,0,530.00000000,15.00000000,True);//01A9 : 0F 01 88 D8 A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 35 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 
    mBackgroundImage = CreateLabel("GUI_Label",0,0,106,77,157,54);              //01FE : 0F 01 C8 E7 A7 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 25 2C 6A 2C 4D 2C 9D 2C 36 16 
    mBackgroundImage.SetBackground("combatbar_b","SBGuiTX.GUI_Styles","GUI_Styles");//021F : 19 01 C8 E7 A7 19 33 00 00 1B 1A 98 00 00 1F 63 6F 6D 62 61 74 62 61 72 5F 62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mHighlightCombiner = new Class'Combiner';                                   //025B : 0F 01 40 E8 A7 19 11 0B 0B 0B 20 40 8D C3 00 
    mHighlightCombiner.CombineOperation = 5;                                    //026A : 0F 19 01 40 E8 A7 19 05 00 01 01 88 41 2C 11 24 05 
    mHighlightCombiner.AlphaOperation = 0;                                      //027B : 0F 19 01 40 E8 A7 19 05 00 01 01 00 42 2C 11 24 00 
    mHighlightCombiner.Material1 = mEmptySlotMaterial;                          //028C : 0F 19 01 40 E8 A7 19 05 00 04 01 78 42 2C 11 01 70 D2 A7 19 
    mHighlightCombiner.Material2 = mAnimation;                                  //02A0 : 0F 19 01 40 E8 A7 19 05 00 04 01 F0 42 2C 11 01 B8 E8 A7 19 
    mHighlightCombiner.Mask = mAnimation;                                       //02B4 : 0F 19 01 40 E8 A7 19 05 00 04 01 68 43 2C 11 01 B8 E8 A7 19 
    mHighlightShader = new Class'Shader';                                       //02C8 : 0F 01 30 E9 A7 19 11 0B 0B 0B 20 00 88 C3 00 
    mHighlightShader.Diffuse = mHighlightCombiner;                              //02D7 : 0F 19 01 30 E9 A7 19 05 00 04 01 D0 5B 37 0F 01 40 E8 A7 19 
    mHighlightShader.SpecularityMask = mPressedMaterial;                        //02EB : 0F 19 01 30 E9 A7 19 05 00 04 01 30 11 3A 11 01 A8 E9 A7 19 
    mComboStringIcons[0] = GUI_Label(CreateComponent("GUI_Label",0,106 + 23,80,15,14));//02FF : 0F 1A 25 01 C8 B6 A7 19 2E 38 15 2F 1D 1B 79 99 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 92 2C 6A 2C 17 16 2C 50 2C 0F 2C 0E 16 
    mComboStringIcons[0].SetIcon("Combo_Opener","SBGuiTX.GUI_Styles","GUI_Styles");//032A : 19 1A 25 01 C8 B6 A7 19 34 00 00 1B 28 98 00 00 1F 43 6F 6D 62 6F 5F 4F 70 65 6E 65 72 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mComboStringIcons[0].SetVisible(False);                                     //0369 : 19 1A 25 01 C8 B6 A7 19 07 00 00 1B 14 98 00 00 28 16 
    i = 1;                                                                      //037B : 0F 00 80 DF A7 19 26 
    while (i < 8) {                                                             //0382 : 07 2D 04 96 00 80 DF A7 19 2C 08 16 
      mComboStringIcons[i] = GUI_Label(CreateComponent("GUI_Label",0,106 + 23 + i * 14,80,15,14));//038E : 0F 1A 00 80 DF A7 19 01 C8 B6 A7 19 2E 38 15 2F 1D 1B 79 99 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 92 92 2C 6A 2C 17 16 90 00 80 DF A7 19 2C 0E 16 16 2C 50 2C 0F 2C 0E 16 
      mComboStringIcons[i].SetIcon("Combo_FollowUp","SBGuiTX.GUI_Styles","GUI_Styles");//03C8 : 19 1A 00 80 DF A7 19 01 C8 B6 A7 19 36 00 00 1B 28 98 00 00 1F 43 6F 6D 62 6F 5F 46 6F 6C 6C 6F 77 55 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
      mComboStringIcons[i].SetVisible(False);                                   //040D : 19 1A 00 80 DF A7 19 01 C8 B6 A7 19 07 00 00 1B 14 98 00 00 28 16 
      ++i;                                                                      //0423 : A3 00 80 DF A7 19 16 
    }
    //1B CC 98 00 00 16 0F 01 60 87 31 16 1E 00 00 B9 43 0F 01 40 88 31 16 1E 00 00 00 43 0F 01 70 61 
    //9E 19 9E 01 70 61 9E 19 1D 00 40 00 00 16 1C 28 9E 9E 19 16 0F 00 E8 E5 A7 19 1B 3A 98 00 00 16 
    //1B 42 97 00 00 1F 48 55 44 5F 43 6F 6D 62 61 74 42 61 72 00 16 0F 01 60 E6 A7 19 1B 62 98 00 00 
    //1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 
    //65 78 61 67 6F 6E 30 34 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 
    //80 04 44 1E 00 00 70 41 27 16 0F 01 D8 E6 A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 
    //20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 33 00 2C 07 
    //1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 0F 
    //01 50 E7 A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 
    //00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 36 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 
    //80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 0F 01 70 BE A7 19 1B 62 98 00 00 1F 
    //47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 
    //78 61 67 6F 6E 30 31 00 2C 07 1D EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 
    //04 44 1E 00 00 70 41 27 16 0F 01 88 D8 A7 19 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 
    //00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 35 00 2C 07 1D 
    //EC FF FF FF 1D 72 01 00 00 2C 80 1D C2 41 00 00 25 25 1E 00 80 04 44 1E 00 00 70 41 27 16 0F 01 
    //C8 E7 A7 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 25 2C 6A 2C 4D 2C 9D 2C 36 16 19 
    //01 C8 E7 A7 19 33 00 00 1B 1A 98 00 00 1F 63 6F 6D 62 61 74 62 61 72 5F 62 00 1F 53 42 47 75 69 
    //54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 40 E8 A7 
    //19 11 0B 0B 0B 20 40 8D C3 00 0F 19 01 40 E8 A7 19 05 00 01 01 88 41 2C 11 24 05 0F 19 01 40 E8 
    //A7 19 05 00 01 01 00 42 2C 11 24 00 0F 19 01 40 E8 A7 19 05 00 04 01 78 42 2C 11 01 70 D2 A7 19 
    //0F 19 01 40 E8 A7 19 05 00 04 01 F0 42 2C 11 01 B8 E8 A7 19 0F 19 01 40 E8 A7 19 05 00 04 01 68 
    //43 2C 11 01 B8 E8 A7 19 0F 01 30 E9 A7 19 11 0B 0B 0B 20 00 88 C3 00 0F 19 01 30 E9 A7 19 05 00 
    //04 01 D0 5B 37 0F 01 40 E8 A7 19 0F 19 01 30 E9 A7 19 05 00 04 01 30 11 3A 11 01 A8 E9 A7 19 0F 
    //1A 25 01 C8 B6 A7 19 2E 38 15 2F 1D 1B 79 99 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 92 2C 6A 
    //2C 17 16 2C 50 2C 0F 2C 0E 16 19 1A 25 01 C8 B6 A7 19 34 00 00 1B 28 98 00 00 1F 43 6F 6D 62 6F 
    //5F 4F 70 65 6E 65 72 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 
    //5F 53 74 79 6C 65 73 00 16 19 1A 25 01 C8 B6 A7 19 07 00 00 1B 14 98 00 00 28 16 0F 00 80 DF A7 
    //19 26 07 2D 04 96 00 80 DF A7 19 2C 08 16 0F 1A 00 80 DF A7 19 01 C8 B6 A7 19 2E 38 15 2F 1D 1B 
    //79 99 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 92 92 2C 6A 2C 17 16 90 00 80 DF A7 19 2C 0E 16 
    //16 2C 50 2C 0F 2C 0E 16 19 1A 00 80 DF A7 19 01 C8 B6 A7 19 36 00 00 1B 28 98 00 00 1F 43 6F 6D 
    //62 6F 5F 46 6F 6C 6C 6F 77 55 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 
    //1F 47 55 49 5F 53 74 79 6C 65 73 00 16 19 1A 00 80 DF A7 19 01 C8 B6 A7 19 07 00 00 1B 14 98 00 
    //00 28 16 A3 00 80 DF A7 19 16 06 82 03 04 0B 47 
  }


  function PrecalculateClockCoordinates() {
    local int diagonal;
    local int diagonalCount;
    local int X;
    local int Y;
    local int clockIndex;
    clockIndex = 0;                                                             //0000 : 0F 00 B8 EC A7 19 25 
    while (clockIndex < 64) {                                                   //0007 : 07 E8 00 96 00 B8 EC A7 19 2C 40 16 
      if (diagonal < 8) {                                                       //0013 : 07 3F 00 96 00 D0 EA A7 19 2C 08 16 
        Y = diagonalCount;                                                      //001F : 0F 00 30 ED A7 19 00 A8 ED A7 19 
        X = diagonal - Y;                                                       //002A : 0F 00 20 EE A7 19 93 00 D0 EA A7 19 00 30 ED A7 19 16 
      } else {                                                                  //003C : 06 60 00 
        X = 7 - diagonalCount;                                                  //003F : 0F 00 20 EE A7 19 93 2C 07 00 A8 ED A7 19 16 
        Y = diagonal - X;                                                       //004E : 0F 00 30 ED A7 19 93 00 D0 EA A7 19 00 20 EE A7 19 16 
      }
      mClockCoordinateX[clockIndex] = X * 32;                                   //0060 : 0F 1A 00 B8 EC A7 19 01 98 EE A7 19 90 00 20 EE A7 19 2C 20 16 
      mClockCoordinateY[clockIndex] = Y * 32;                                   //0075 : 0F 1A 00 B8 EC A7 19 01 10 EF A7 19 90 00 30 ED A7 19 2C 20 16 
      diagonalCount++;                                                          //008A : A5 00 A8 ED A7 19 16 
      if (diagonal < 8) {                                                       //0091 : 07 BD 00 96 00 D0 EA A7 19 2C 08 16 
        if (diagonalCount > diagonal) {                                         //009D : 07 BA 00 97 00 A8 ED A7 19 00 D0 EA A7 19 16 
          diagonalCount = 0;                                                    //00AC : 0F 00 A8 ED A7 19 25 
          diagonal++;                                                           //00B3 : A5 00 D0 EA A7 19 16 
        }
      } else {                                                                  //00BA : 06 DE 00 
        if (diagonalCount > 14 - diagonal) {                                    //00BD : 07 DE 00 97 00 A8 ED A7 19 93 2C 0E 00 D0 EA A7 19 16 16 
          diagonalCount = 0;                                                    //00D0 : 0F 00 A8 ED A7 19 25 
          diagonal++;                                                           //00D7 : A5 00 D0 EA A7 19 16 
        }
      }
      clockIndex++;                                                             //00DE : A5 00 B8 EC A7 19 16 
    }
    //0F 00 B8 EC A7 19 25 07 E8 00 96 00 B8 EC A7 19 2C 40 16 07 3F 00 96 00 D0 EA A7 19 2C 08 16 0F 
    //00 30 ED A7 19 00 A8 ED A7 19 0F 00 20 EE A7 19 93 00 D0 EA A7 19 00 30 ED A7 19 16 06 60 00 0F 
    //00 20 EE A7 19 93 2C 07 00 A8 ED A7 19 16 0F 00 30 ED A7 19 93 00 D0 EA A7 19 00 20 EE A7 19 16 
    //0F 1A 00 B8 EC A7 19 01 98 EE A7 19 90 00 20 EE A7 19 2C 20 16 0F 1A 00 B8 EC A7 19 01 10 EF A7 
    //19 90 00 30 ED A7 19 2C 20 16 A5 00 A8 ED A7 19 16 07 BD 00 96 00 D0 EA A7 19 2C 08 16 07 BA 00 
    //97 00 A8 ED A7 19 00 D0 EA A7 19 16 0F 00 A8 ED A7 19 25 A5 00 D0 EA A7 19 16 06 DE 00 07 DE 00 
    //97 00 A8 ED A7 19 93 2C 0E 00 D0 EA A7 19 16 16 0F 00 A8 ED A7 19 25 A5 00 D0 EA A7 19 16 A5 00 
    //B8 EC A7 19 16 06 07 00 04 0B 47 
  }


  function SetRowAndSlot(int aRow,int aSlot) {
    mCurrentRow = aRow;                                                         //0000 : 0F 01 A0 F0 A7 19 00 D8 EF A7 19 
    mCurrentSlot = aSlot;                                                       //000B : 0F 01 18 F1 A7 19 00 90 F1 A7 19 
    //0F 01 A0 F0 A7 19 00 D8 EF A7 19 0F 01 18 F1 A7 19 00 90 F1 A7 19 04 0B 47 
  }



