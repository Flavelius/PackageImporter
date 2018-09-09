//==============================================================================
//  HUD_SkillDeck
//==============================================================================

class HUD_SkillDeck extends GUI_Window
    dependsOn(HUD_CombatBar,HUD_SkillDeckPage,FSkill_Type,Game_Pawn,Game_PlayerSkills,GUI_Mesh,Actor,Game_Skills,Game_CombatState,Game_CombatStats,Game_PlayerController,Game_PlayerInput,ConstantColor)
    Transient
    Config(User)
  ;

  const ROTATION_ANGLE =  10922.66667;
  const BAR_FOV =  35;
  const BAR_OFFSET_Z =  250;
  const BAR_OFFSET_Y =  -40;
  const BAR_OFFSET_X =  0;
  const BUTTON_HEIGHT =  24;
  const BUTTON_WIDTH =  115;
  const BUTTON_COUNT =  3;
  const TIER_COUNT =  6;
  const WINDOW_WIDTH =  410;
  const WINDOW_HEIGHT =  578;
  var GUI_Page mTierPage;
  var array<HUD_SkillDeckPage> mSkillPages;
  var GUI_Page mDeckPage;
  var array<GUI_Button> mDeckButtons;
  var private GUI_Mesh mCombatBarComponent01;
  var private GUI_Mesh mCombatBarComponent03;
  var private GUI_Mesh mCombatBarComponent04;
  var private GUI_Mesh mCombatBarComponent05;
  var private GUI_Mesh mCombatBarComponent06;
  var private Combiner mSlotMaterials[30];
  var private ConstantColor mConstantColor;
  var private float mCurrentRoll;
  var private float mTargetRoll;


  function UpdateMeshMaterials() {
    local HUD_CombatBar combatbar;
    combatbar = HUD_CombatBar(mDesktop.GetStdWindow(3));                        //0000 : 0F 00 10 F8 A2 19 2E 48 DD 2F 1D 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 03 16 
    combatbar.AssignIconMaterials();                                            //001C : 19 00 10 F8 A2 19 06 00 00 1B 70 99 00 00 16 
    //0F 00 10 F8 A2 19 2E 48 DD 2F 1D 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 03 16 19 00 10 F8 
    //A2 19 06 00 00 1B 70 99 00 00 16 04 0B 47 
  }


  function ClearSlotHandler(int aRow,int aSlot) {
    local array<int> SkilldeckSkills;
    local int R;
    local int s;
    SkilldeckSkills.Length = 30;                                                //0000 : 0F 37 00 48 FE A2 19 2C 1E 
    R = 0;                                                                      //0009 : 0F 00 C0 FE A2 19 25 
    while (R < 6) {                                                             //0010 : 07 9E 00 96 00 C0 FE A2 19 2C 06 16 
      s = 0;                                                                    //001C : 0F 00 38 FF A2 19 25 
      while (s < 5) {                                                           //0023 : 07 94 00 96 00 38 FF A2 19 2C 05 16 
        if (mSkillPages[R].mSkills[s] != None) {                                //002F : 07 8A 00 77 10 00 38 FF A2 19 19 10 00 C0 FE A2 19 01 60 D2 8A 19 05 00 00 01 18 D8 8A 19 2A 16 
          SkilldeckSkills[R * 5 + s] = mSkillPages[R].mSkills[s].GetResourceId();//004F : 0F 10 92 90 00 C0 FE A2 19 2C 05 16 00 38 FF A2 19 16 00 48 FE A2 19 19 10 00 38 FF A2 19 19 10 00 C0 FE A2 19 01 60 D2 8A 19 05 00 00 01 18 D8 8A 19 06 00 04 1C 08 90 20 11 16 
        }
        ++s;                                                                    //008A : A3 00 38 FF A2 19 16 
      }
      ++R;                                                                      //0094 : A3 00 C0 FE A2 19 16 
    }
    Game_PlayerSkills(GetPawn().Skills).cl_SaveSkilldeckSkills(SkilldeckSkills);//009E : 19 2E C8 9D 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 0B 00 00 1C 38 16 2B 11 00 48 FE A2 19 16 
    UpdateSkillPages();                                                         //00C1 : 1B 9F 98 00 00 16 
    //0F 37 00 48 FE A2 19 2C 1E 0F 00 C0 FE A2 19 25 07 9E 00 96 00 C0 FE A2 19 2C 06 16 0F 00 38 FF 
    //A2 19 25 07 94 00 96 00 38 FF A2 19 2C 05 16 07 8A 00 77 10 00 38 FF A2 19 19 10 00 C0 FE A2 19 
    //01 60 D2 8A 19 05 00 00 01 18 D8 8A 19 2A 16 0F 10 92 90 00 C0 FE A2 19 2C 05 16 00 38 FF A2 19 
    //16 00 48 FE A2 19 19 10 00 38 FF A2 19 19 10 00 C0 FE A2 19 01 60 D2 8A 19 05 00 00 01 18 D8 8A 
    //19 06 00 04 1C 08 90 20 11 16 A3 00 38 FF A2 19 16 06 23 00 A3 00 C0 FE A2 19 16 06 10 00 19 2E 
    //C8 9D 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 0B 00 00 1C 38 16 2B 11 00 48 FE A2 19 
    //16 1B 9F 98 00 00 16 04 0B 47 
  }


  function SetSlotHandler(int aRow,int aSlot,export editinline FSkill_Type aSkillType) {
    local array<int> SkilldeckSkills;
    local int R;
    local int s;
    SkilldeckSkills.Length = 30;                                                //0000 : 0F 37 00 90 02 A3 19 2C 1E 
    R = 0;                                                                      //0009 : 0F 00 08 03 A3 19 25 
    while (R < 6) {                                                             //0010 : 07 9E 00 96 00 08 03 A3 19 2C 06 16 
      s = 0;                                                                    //001C : 0F 00 80 03 A3 19 25 
      while (s < 5) {                                                           //0023 : 07 94 00 96 00 80 03 A3 19 2C 05 16 
        if (mSkillPages[R].mSkills[s] != None) {                                //002F : 07 8A 00 77 10 00 80 03 A3 19 19 10 00 08 03 A3 19 01 60 D2 8A 19 05 00 00 01 18 D8 8A 19 2A 16 
          SkilldeckSkills[R * 5 + s] = mSkillPages[R].mSkills[s].GetResourceId();//004F : 0F 10 92 90 00 08 03 A3 19 2C 05 16 00 80 03 A3 19 16 00 90 02 A3 19 19 10 00 80 03 A3 19 19 10 00 08 03 A3 19 01 60 D2 8A 19 05 00 00 01 18 D8 8A 19 06 00 04 1C 08 90 20 11 16 
        }
        ++s;                                                                    //008A : A3 00 80 03 A3 19 16 
      }
      ++R;                                                                      //0094 : A3 00 08 03 A3 19 16 
    }
    Game_PlayerSkills(GetPawn().Skills).cl_SaveSkilldeckSkills(SkilldeckSkills);//009E : 19 2E C8 9D 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 0B 00 00 1C 38 16 2B 11 00 90 02 A3 19 16 
    UpdateSkillPages();                                                         //00C1 : 1B 9F 98 00 00 16 
    //0F 37 00 90 02 A3 19 2C 1E 0F 00 08 03 A3 19 25 07 9E 00 96 00 08 03 A3 19 2C 06 16 0F 00 80 03 
    //A3 19 25 07 94 00 96 00 80 03 A3 19 2C 05 16 07 8A 00 77 10 00 80 03 A3 19 19 10 00 08 03 A3 19 
    //01 60 D2 8A 19 05 00 00 01 18 D8 8A 19 2A 16 0F 10 92 90 00 08 03 A3 19 2C 05 16 00 80 03 A3 19 
    //16 00 90 02 A3 19 19 10 00 80 03 A3 19 19 10 00 08 03 A3 19 01 60 D2 8A 19 05 00 00 01 18 D8 8A 
    //19 06 00 04 1C 08 90 20 11 16 A3 00 80 03 A3 19 16 06 23 00 A3 00 08 03 A3 19 16 06 10 00 19 2E 
    //C8 9D 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 0B 00 00 1C 38 16 2B 11 00 90 02 A3 19 
    //16 1B 9F 98 00 00 16 04 0B 47 
  }


  function TickHandler(float aDelta) {
    static.SmoothBlendAngle(mCurrentRoll,mTargetRoll,aDelta,0.50000000,True);   //0000 : 1C D8 86 69 0F 01 48 07 A3 19 01 C0 07 A3 19 00 10 06 A3 19 1E 00 00 00 3F 27 16 
    if (mCombatBarComponent01 != None && mCombatBarComponent05 != None) {       //001B : 07 67 00 82 77 01 38 08 A3 19 2A 16 18 09 00 77 01 B0 08 A3 19 2A 16 16 
      mCombatBarComponent01.SetRoll(mCurrentRoll,-1.00000000,1);                //0033 : 19 01 38 08 A3 19 11 00 00 1B 06 9A 00 00 01 48 07 A3 19 1E 00 00 80 BF 26 16 
      mCombatBarComponent05.SetRoll(mCurrentRoll,-1.00000000,1);                //004D : 19 01 B0 08 A3 19 11 00 00 1B 06 9A 00 00 01 48 07 A3 19 1E 00 00 80 BF 26 16 
    }
    //1C D8 86 69 0F 01 48 07 A3 19 01 C0 07 A3 19 00 10 06 A3 19 1E 00 00 00 3F 27 16 07 67 00 82 77 
    //01 38 08 A3 19 2A 16 18 09 00 77 01 B0 08 A3 19 2A 16 16 19 01 38 08 A3 19 11 00 00 1B 06 9A 00 
    //00 01 48 07 A3 19 1E 00 00 80 BF 26 16 19 01 B0 08 A3 19 11 00 00 1B 06 9A 00 00 01 48 07 A3 19 
    //1E 00 00 80 BF 26 16 04 0B 47 
  }


  function HiliteSlotHandler(int aRow,int aSlot,bool aHilite) {
    local HUD_CombatBar combatbar;
    combatbar = HUD_CombatBar(mDesktop.GetStdWindow(3));                        //0000 : 0F 00 18 0B A3 19 2E 48 DD 2F 1D 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 03 16 
    combatbar.SetRowAndSlot(aRow,aSlot);                                        //001C : 19 00 18 0B A3 19 10 00 00 1B 8C 9A 00 00 00 D8 09 A3 19 00 90 0B A3 19 16 
    mCurrentRoll = mCombatBarComponent01.mMeshActor.Rotation.Roll;              //0035 : 0F 01 48 07 A3 19 39 3F 36 98 BF 69 0F 19 19 01 38 08 A3 19 05 00 04 01 08 0C A3 19 05 00 0C 01 00 84 6C 0F 
    mTargetRoll = 10922.66699219 * aRow;                                        //0059 : 0F 01 C0 07 A3 19 AB 1E AB AA 2A 46 39 3F 00 D8 09 A3 19 16 
    //0F 00 18 0B A3 19 2E 48 DD 2F 1D 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 03 16 19 00 18 0B 
    //A3 19 10 00 00 1B 8C 9A 00 00 00 D8 09 A3 19 00 90 0B A3 19 16 0F 01 48 07 A3 19 39 3F 36 98 BF 
    //69 0F 19 19 01 38 08 A3 19 05 00 04 01 08 0C A3 19 05 00 0C 01 00 84 6C 0F 0F 01 C0 07 A3 19 AB 
    //1E AB AA 2A 46 39 3F 00 D8 09 A3 19 16 04 0B 47 
  }


  function bool SelectDeckHandler(GUI_Component aClickedButton) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function UpdateSkillPages() {
    local int R;
    local int s;
    local Game_Pawn Pawn;
    Pawn = GetPawn();                                                           //0000 : 0F 00 E0 10 A3 19 1B 2B 0C 00 00 16 
    if (Pawn == None) {                                                         //000C : 07 19 00 72 00 E0 10 A3 19 2A 16 
      return;                                                                   //0017 : 04 0B 
    }
    R = 0;                                                                      //0019 : 0F 00 48 0F A3 19 25 
    while (R < 6) {                                                             //0020 : 07 AA 00 96 00 48 0F A3 19 2C 06 16 
      mSkillPages[R].UpdateSlotColors();                                        //002C : 19 10 00 48 0F A3 19 01 60 D2 8A 19 06 00 00 1B 51 9B 00 00 16 
      s = 0;                                                                    //0041 : 0F 00 58 11 A3 19 25 
      while (s < 5) {                                                           //0048 : 07 A0 00 96 00 58 11 A3 19 2C 05 16 
        mSkillPages[R].SetSkill(s,Pawn.Skills.SkilldeckSkills[R * 5 + s]);      //0054 : 19 10 00 48 0F A3 19 01 60 D2 8A 19 33 00 00 1B 74 98 00 00 00 58 11 A3 19 10 92 90 00 48 0F A3 19 2C 05 16 00 58 11 A3 19 16 19 19 00 E0 10 A3 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 16 
        ++s;                                                                    //0096 : A3 00 58 11 A3 19 16 
      }
      ++R;                                                                      //00A0 : A3 00 48 0F A3 19 16 
    }
    UpdateMeshMaterials();                                                      //00AA : 1B CB 9A 00 00 16 
    //0F 00 E0 10 A3 19 1B 2B 0C 00 00 16 07 19 00 72 00 E0 10 A3 19 2A 16 04 0B 0F 00 48 0F A3 19 25 
    //07 AA 00 96 00 48 0F A3 19 2C 06 16 19 10 00 48 0F A3 19 01 60 D2 8A 19 06 00 00 1B 51 9B 00 00 
    //16 0F 00 58 11 A3 19 25 07 A0 00 96 00 58 11 A3 19 2C 05 16 19 10 00 48 0F A3 19 01 60 D2 8A 19 
    //33 00 00 1B 74 98 00 00 00 58 11 A3 19 10 92 90 00 48 0F A3 19 2C 05 16 00 58 11 A3 19 16 19 19 
    //00 E0 10 A3 19 05 00 04 01 08 28 18 11 05 00 00 01 C8 3D 24 11 16 A3 00 58 11 A3 19 16 06 48 00 
    //A3 00 48 0F A3 19 16 06 20 00 1B CB 9A 00 00 16 04 0B 47 
  }


  event DoShowWindow(int aFlags) {
    local Game_Pawn Pawn;
    Super.DoShowWindow(aFlags);                                                 //0000 : 1C 20 7A 9E 19 00 80 12 A3 19 16 
    if (aFlags == Class'GUI_BaseDesktop'.1) {                                   //000B : 07 B9 00 9A 00 80 12 A3 19 12 20 00 68 D7 00 01 00 04 26 16 
      Pawn = GetPawn();                                                         //001F : 0F 00 28 14 A3 19 1B 2B 0C 00 00 16 
      if (Pawn != None) {                                                       //002B : 07 B9 00 77 00 28 14 A3 19 2A 16 
        if (Pawn.combatState.CombatReady() && !Pawn.CombatStats.InCombat()) {   //0036 : 07 96 00 82 19 19 00 28 14 A3 19 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 18 1B 00 81 19 19 00 28 14 A3 19 05 00 04 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 16 16 
          Game_PlayerController(Pawn.Controller).Input.DrawSheatheWeapon();     //0070 : 19 19 2E 90 18 5B 01 19 00 28 14 A3 19 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 00 1B AD 1B 00 00 16 
        }
        Pawn.Skills.__OnSkilldeckChanged__Delegate = UpdateSkillPages;          //0096 : 45 19 19 00 28 14 A3 19 05 00 04 01 08 28 18 11 05 00 08 01 88 58 24 11 44 9F 98 00 00 
        UpdateSkillPages();                                                     //00B3 : 1B 9F 98 00 00 16 
      }
    }
    //1C 20 7A 9E 19 00 80 12 A3 19 16 07 B9 00 9A 00 80 12 A3 19 12 20 00 68 D7 00 01 00 04 26 16 0F 
    //00 28 14 A3 19 1B 2B 0C 00 00 16 07 B9 00 77 00 28 14 A3 19 2A 16 07 96 00 82 19 19 00 28 14 A3 
    //19 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 18 1B 00 81 19 19 00 28 14 A3 19 05 00 04 
    //01 30 41 18 11 06 00 04 1B 93 05 00 00 16 16 16 19 19 2E 90 18 5B 01 19 00 28 14 A3 19 05 00 04 
    //01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 00 1B AD 1B 00 00 16 45 19 19 00 28 14 A3 19 05 00 
    //04 01 08 28 18 11 05 00 08 01 88 58 24 11 44 9F 98 00 00 1B 9F 98 00 00 16 04 0B 47 
  }


  function bool PostDrawHandler(Canvas aCanvas) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event Initialize() {
    local int idx;
    mTierPage = CreatePage("GUI_Page",0,0,6,21,392,519);                        //0000 : 0F 01 E0 1D A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 88 01 00 00 1D 07 02 00 00 16 
    mTierPage.SetStdBackground(7);                                              //0026 : 19 01 E0 1D A3 19 08 00 00 1B 22 98 00 00 2C 07 16 
    idx = 0;                                                                    //0037 : 0F 00 B8 16 A3 19 25 
    while (idx < 6) {                                                           //003E : 07 3B 01 96 00 B8 16 A3 19 2C 06 16 
      mSkillPages[idx] = HUD_SkillDeckPage(mTierPage.CreatePage("HUD_SkillDeckPage",Class'GUI_BaseDesktop'.2097152,0,0,0,0,0));//004A : 0F 10 00 B8 16 A3 19 01 60 D2 8A 19 2E D8 D2 8A 19 19 01 E0 1D A3 19 2C 00 04 1B 16 98 00 00 1F 48 55 44 5F 53 6B 69 6C 6C 44 65 63 6B 50 61 67 65 00 12 20 00 68 D7 00 05 00 04 1D 00 00 20 00 25 25 25 25 25 16 
      mSkillPages[idx].mTop = 10.00000000 + idx * mSkillPages[idx].mHeight;     //0090 : 0F 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 00 04 01 80 86 31 16 AE 1E 00 00 20 41 AB 39 3F 00 B8 16 A3 19 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 00 04 01 40 88 31 16 16 16 
      mSkillPages[idx].SetTier(idx);                                            //00C9 : 19 10 00 B8 16 A3 19 01 60 D2 8A 19 0B 00 00 1B 53 9B 00 00 00 B8 16 A3 19 16 
      mSkillPages[idx].__OnSetSlot__Delegate = SetSlotHandler;                  //00E3 : 45 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 00 08 01 58 1E A3 19 44 C9 9A 00 00 
      mSkillPages[idx].__OnClearSlot__Delegate = ClearSlotHandler;              //00FD : 45 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 00 08 01 D0 1E A3 19 44 CA 9A 00 00 
      mSkillPages[idx].__OnHiliteSlot__Delegate = HiliteSlotHandler;            //0117 : 45 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 00 08 01 48 1F A3 19 44 C8 9A 00 00 
      ++idx;                                                                    //0131 : A3 00 B8 16 A3 19 16 
    }
    mWidth = 410.00000000;                                                      //013B : 0F 01 60 87 31 16 1E 00 00 CD 43 
    mHeight = 578.00000000;                                                     //0146 : 0F 01 40 88 31 16 1E 00 80 10 44 
    mLeft = mDesktop.GetScreenWidth() / 2 - mWidth;                             //0151 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 01 60 87 31 16 16 
    mTop = mDesktop.GetScreenHeight() / 2 - mHeight / 2;                        //0173 : 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 
    Super.Initialize();                                                         //019B : 1C 28 9E 9E 19 16 
    SetIcon("header_skilldeck","SBGuiTX.GUI_Styles","GUI_Styles");              //01A1 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 73 6B 69 6C 6C 64 65 63 6B 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mCombatBarComponent04 = mTierPage.CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon04",0,(mSkillPages[0].mHeight + 10) * 6 + -40,392,139,16384,0,0,250.00000000,35.00000000,True);//01D9 : 0F 01 C0 1F A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 34 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 
    mCombatBarComponent03 = mTierPage.CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon03",0,(mSkillPages[0].mHeight + 10) * 6 + -40,392,139,16384,0,0,250.00000000,35.00000000,True);//0254 : 0F 01 38 20 A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 33 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 
    mCombatBarComponent06 = mTierPage.CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon06",0,(mSkillPages[0].mHeight + 10) * 6 + -40,392,139,16384,0,0,250.00000000,35.00000000,True);//02CF : 0F 01 B0 20 A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 36 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 
    mCombatBarComponent01 = mTierPage.CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon01",0,(mSkillPages[0].mHeight + 10) * 6 + -40,392,139,16384,0,0,250.00000000,35.00000000,True);//034A : 0F 01 38 08 A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 31 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 
    mCombatBarComponent05 = mTierPage.CreateMesh("GUI_Mesh",Class'GUI_BaseDesktop'.768,"hexSM.Hexagon05",0,(mSkillPages[0].mHeight + 10) * 6 + -40,392,139,16384,0,0,250.00000000,35.00000000,True);//03C5 : 0F 01 B0 08 A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 35 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 
    mConstantColor = new Class'ConstantColor';                                  //0440 : 0F 01 28 21 A3 19 11 0B 0B 0B 20 C0 97 C3 00 
    mConstantColor.Color.R = 0;                                                 //044F : 0F 36 D0 90 6A 0F 19 01 28 21 A3 19 05 00 04 01 78 23 2C 11 24 00 
    mConstantColor.Color.G = 0;                                                 //0465 : 0F 36 58 90 6A 0F 19 01 28 21 A3 19 05 00 04 01 78 23 2C 11 24 00 
    mConstantColor.Color.B = 0;                                                 //047B : 0F 36 E0 8F 6A 0F 19 01 28 21 A3 19 05 00 04 01 78 23 2C 11 24 00 
    mConstantColor.Color.A = 0;                                                 //0491 : 0F 36 48 91 6A 0F 19 01 28 21 A3 19 05 00 04 01 78 23 2C 11 24 00 
    __OnPostDraw__Delegate = PostDrawHandler;                                   //04A7 : 45 01 F8 E5 9D 19 44 49 99 00 00 
    __OnTick__Delegate = TickHandler;                                           //04B2 : 45 01 70 E6 9D 19 44 4B 98 00 00 
    //0F 01 E0 1D A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 88 01 00 00 
    //1D 07 02 00 00 16 19 01 E0 1D A3 19 08 00 00 1B 22 98 00 00 2C 07 16 0F 00 B8 16 A3 19 25 07 3B 
    //01 96 00 B8 16 A3 19 2C 06 16 0F 10 00 B8 16 A3 19 01 60 D2 8A 19 2E D8 D2 8A 19 19 01 E0 1D A3 
    //19 2C 00 04 1B 16 98 00 00 1F 48 55 44 5F 53 6B 69 6C 6C 44 65 63 6B 50 61 67 65 00 12 20 00 68 
    //D7 00 05 00 04 1D 00 00 20 00 25 25 25 25 25 16 0F 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 00 04 
    //01 80 86 31 16 AE 1E 00 00 20 41 AB 39 3F 00 B8 16 A3 19 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 
    //00 04 01 40 88 31 16 16 16 19 10 00 B8 16 A3 19 01 60 D2 8A 19 0B 00 00 1B 53 9B 00 00 00 B8 16 
    //A3 19 16 45 19 10 00 B8 16 A3 19 01 60 D2 8A 19 05 00 08 01 58 1E A3 19 44 C9 9A 00 00 45 19 10 
    //00 B8 16 A3 19 01 60 D2 8A 19 05 00 08 01 D0 1E A3 19 44 CA 9A 00 00 45 19 10 00 B8 16 A3 19 01 
    //60 D2 8A 19 05 00 08 01 48 1F A3 19 44 C8 9A 00 00 A3 00 B8 16 A3 19 16 06 3E 00 0F 01 60 87 31 
    //16 1E 00 00 CD 43 0F 01 40 88 31 16 1E 00 80 10 44 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 
    //00 04 1B 31 98 00 00 16 39 3F 2C 02 16 01 60 87 31 16 16 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 
    //19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 1C 28 9E 9E 19 
    //16 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 73 6B 69 6C 6C 64 65 63 6B 00 1F 53 42 47 75 69 54 58 
    //2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 C0 1F A3 19 19 
    //01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 
    //1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 34 00 25 92 90 39 44 AE 19 10 25 01 
    //60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 
    //8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 0F 01 38 20 A3 19 19 01 E0 1D A3 19 
    //6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 
    //1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 33 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 
    //00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 
    //00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 0F 01 B0 20 A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 
    //98 00 00 1F 47 55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 
    //4D 2E 48 65 78 61 67 6F 6E 30 36 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 
    //31 16 39 3F 2C 0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 
    //00 7A 43 1E 00 00 0C 42 27 16 0F 01 38 08 A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 
    //55 49 5F 4D 65 73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 
    //61 67 6F 6E 30 31 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 
    //0A 16 2C 06 16 1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 
    //00 0C 42 27 16 0F 01 B0 08 A3 19 19 01 E0 1D A3 19 6C 00 04 1B 62 98 00 00 1F 47 55 49 5F 4D 65 
    //73 68 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 1F 68 65 78 53 4D 2E 48 65 78 61 67 6F 6E 30 
    //35 00 25 92 90 39 44 AE 19 10 25 01 60 D2 8A 19 05 00 04 01 40 88 31 16 39 3F 2C 0A 16 2C 06 16 
    //1D D8 FF FF FF 16 1D 88 01 00 00 2C 8B 1D 00 40 00 00 25 25 1E 00 00 7A 43 1E 00 00 0C 42 27 16 
    //0F 01 28 21 A3 19 11 0B 0B 0B 20 C0 97 C3 00 0F 36 D0 90 6A 0F 19 01 28 21 A3 19 05 00 04 01 78 
    //23 2C 11 24 00 0F 36 58 90 6A 0F 19 01 28 21 A3 19 05 00 04 01 78 23 2C 11 24 00 0F 36 E0 8F 6A 
    //0F 19 01 28 21 A3 19 05 00 04 01 78 23 2C 11 24 00 0F 36 48 91 6A 0F 19 01 28 21 A3 19 05 00 04 
    //01 78 23 2C 11 24 00 45 01 F8 E5 9D 19 44 49 99 00 00 45 01 70 E6 9D 19 44 4B 98 00 00 04 0B 47 
    //
  }



