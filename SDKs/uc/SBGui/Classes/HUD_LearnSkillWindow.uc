//==============================================================================
//  HUD_LearnSkillWindow
//==============================================================================

class HUD_LearnSkillWindow extends HUD_SkillLibrary
    dependsOn(GUI_Sounds,HUD_CC_SkillButton,FSkill_Type,HUD_ConfirmSkillSelectionWindow,GUI_Page)
    Transient
    Config(User)
  ;

  var HUD_CC_SkillButton mSelectedSkill;
  var HUD_ConfirmSkillSelectionWindow mConfirmWindow;


  function InitializeFilters() {
    mShowLearned.SetChecked(False);                                             //0000 : 19 01 60 96 89 19 07 00 00 1B 40 97 00 00 28 16 
    mShowLearnable.SetChecked(True);                                            //0010 : 19 01 F8 94 89 19 07 00 00 1B 40 97 00 00 27 16 
    mShowUnknown.SetChecked(False);                                             //0020 : 19 01 58 93 89 19 07 00 00 1B 40 97 00 00 28 16 
    ToggleFilter(0,False);                                                      //0030 : 1B A8 98 00 00 24 00 28 16 
    ToggleFilter(1,True);                                                       //0039 : 1B A8 98 00 00 24 01 27 16 
    ToggleFilter(2,False);                                                      //0042 : 1B A8 98 00 00 24 02 28 16 
    //19 01 60 96 89 19 07 00 00 1B 40 97 00 00 28 16 19 01 F8 94 89 19 07 00 00 1B 40 97 00 00 27 16 
    //19 01 58 93 89 19 07 00 00 1B 40 97 00 00 28 16 1B A8 98 00 00 24 00 28 16 1B A8 98 00 00 24 01 
    //27 16 1B A8 98 00 00 24 02 28 16 04 0B 47 
  }


  function UpdateSkillCount() {
    local int availableSkills;
    if (GetPawn() != None) {                                                    //0000 : 07 F4 00 77 1B 2B 0C 00 00 16 2A 16 
      availableSkills = GetPawn().Skills.GetMaxSkillCount() - GetPawn().Skills.CharacterSkills.Length;//000C : 0F 00 68 4D 05 1B 93 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 1C D0 17 23 11 16 37 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 00 01 C0 E7 21 11 16 
      if (availableSkills < 1) {                                                //0046 : 07 6D 00 96 00 68 4D 05 1B 26 16 
        SetTitle(Class'SBGuiStrings'.default.Press_Learn_Button_To_Learn_Selected_Skills.Text);//0051 : 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 57 98 19 16 
      } else {                                                                  //006A : 06 F4 00 
        if (availableSkills == 1) {                                             //006D : 07 B3 00 9A 00 68 4D 05 1B 26 16 
          SetTitle(Class'SBGuiStrings'.default.Learn_a_new_skill.Text
            @ "("
            $ Class'SBGuiStrings'.default.One_Skill_Left.Text
            $ ")");//0078 : 1B 0A 2C 00 00 70 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 9A 97 19 1F 28 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 57 98 19 16 1F 29 00 16 16 
        } else {                                                                //00B0 : 06 F4 00 
          SetTitle(Class'SBGuiStrings'.default.Learn_a_new_skill.Text
            @ "("
            $ string(availableSkills)
            @ Class'SBGuiStrings'.default.Skills_Left.Text
            $ ")");//00B3 : 1B 0A 2C 00 00 70 A8 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 9A 97 19 1F 28 00 16 39 53 00 68 4D 05 1B 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 56 98 19 16 1F 29 00 16 16 
        }
      }
    }
    //07 F4 00 77 1B 2B 0C 00 00 16 2A 16 0F 00 68 4D 05 1B 93 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 
    //28 18 11 06 00 04 1C D0 17 23 11 16 37 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 00 
    //01 C0 E7 21 11 16 07 6D 00 96 00 68 4D 05 1B 26 16 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 88 57 98 19 16 06 F4 00 07 B3 00 9A 00 68 4D 05 1B 26 16 1B 0A 2C 00 00 70 70 A8 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 9A 97 19 1F 28 00 16 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 10 57 98 19 16 1F 29 00 16 16 06 F4 00 1B 0A 2C 00 00 70 A8 70 A8 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 F0 9A 97 19 1F 28 00 16 39 53 00 68 4D 05 1B 16 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 98 56 98 19 16 1F 29 00 16 16 04 0B 47 
  }


  function UpdateSkillSets() {
    local int i;
    UpdateSkillCount();                                                         //0000 : 1B BE 98 00 00 16 
    UpdateTabHeaderColors();                                                    //0006 : 1B 15 9A 00 00 16 
    i = 0;                                                                      //000C : 0F 00 18 9A 04 1B 25 
    while (i < 6) {                                                             //0013 : 07 53 00 96 00 18 9A 04 1B 2C 06 16 
      mSkillPages[i].ClearIteration();                                          //001F : 19 1A 00 18 9A 04 1B 01 78 45 7F 19 06 00 00 1B 6B 98 00 00 16 
      mSkillPages[i].UpdateIteration();                                         //0034 : 19 1A 00 18 9A 04 1B 01 78 45 7F 19 06 00 00 1B 68 98 00 00 16 
      ++i;                                                                      //0049 : A3 00 18 9A 04 1B 16 
    }
    //1B BE 98 00 00 16 1B 15 9A 00 00 16 0F 00 18 9A 04 1B 25 07 53 00 96 00 18 9A 04 1B 2C 06 16 19 
    //1A 00 18 9A 04 1B 01 78 45 7F 19 06 00 00 1B 6B 98 00 00 16 19 1A 00 18 9A 04 1B 01 78 45 7F 19 
    //06 00 00 1B 68 98 00 00 16 A3 00 18 9A 04 1B 16 06 13 00 04 0B 47 
  }


  function HandleConfirm(HUD_ConfirmSkillSelectionWindow aSource) {
    local Game_Pawn Pawn;
    Pawn = GetPawn();                                                           //0000 : 0F 00 E0 9C 04 1B 1B 2B 0C 00 00 16 
    if (Pawn == None) {                                                         //000C : 07 19 00 72 00 E0 9C 04 1B 2A 16 
      return;                                                                   //0017 : 04 0B 
    }
    mDesktop.PlaySound(Class'GUI_Sounds'.default.LearnSkill);                   //0019 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 30 28 A6 19 16 
    Pawn.Skills.cl2sv_LearnSkill_CallStub(mSelectedSkill.GetSkill().GetResourceId());//0036 : 19 19 00 E0 9C 04 1B 05 00 04 01 08 28 18 11 1F 00 00 1B F2 1B 00 00 19 19 01 E0 4D 04 1B 06 00 04 1B 90 98 00 00 16 06 00 04 1C 08 90 20 11 16 16 
    mDesktop.ShowWindow(mConfirmWindow.mWindowHandle,Class'GUI_Desktop'.2);     //0067 : 19 01 48 0C 9D 19 1F 00 00 1B 57 2D 00 00 19 01 20 98 2B 26 05 00 04 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
    mSelectedSkill.SetChecked(False);                                           //008F : 19 01 E0 4D 04 1B 07 00 00 1B 40 97 00 00 28 16 
    if (Pawn.Skills.GetMaxSkillCount() - Pawn.Skills.CharacterSkills.Length + 1 <= 0) {//009F : 07 F9 00 98 93 19 19 00 E0 9C 04 1B 05 00 04 01 08 28 18 11 06 00 04 1C D0 17 23 11 16 92 37 19 19 00 E0 9C 04 1B 05 00 04 01 08 28 18 11 05 00 00 01 C0 E7 21 11 26 16 16 25 16 
      mDesktop.ShowWindow(mWindowHandle,Class'GUI_Desktop'.2);                  //00DA : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
    }
    //0F 00 E0 9C 04 1B 1B 2B 0C 00 00 16 07 19 00 72 00 E0 9C 04 1B 2A 16 04 0B 19 01 48 0C 9D 19 14 
    //00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 30 28 A6 19 16 19 19 00 E0 9C 04 1B 05 00 04 
    //01 08 28 18 11 1F 00 00 1B F2 1B 00 00 19 19 01 E0 4D 04 1B 06 00 04 1B 90 98 00 00 16 06 00 04 
    //1C 08 90 20 11 16 16 19 01 48 0C 9D 19 1F 00 00 1B 57 2D 00 00 19 01 20 98 2B 26 05 00 04 01 E8 
    //77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 19 01 E0 4D 04 1B 07 00 00 1B 40 97 00 00 28 16 07 
    //F9 00 98 93 19 19 00 E0 9C 04 1B 05 00 04 01 08 28 18 11 06 00 04 1C D0 17 23 11 16 92 37 19 19 
    //00 E0 9C 04 1B 05 00 04 01 08 28 18 11 05 00 00 01 C0 E7 21 11 26 16 16 25 16 19 01 48 0C 9D 19 
    //16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 04 0B 47 
  }


  function handleCancel(HUD_ConfirmSkillSelectionWindow aSource) {
    mSelectedSkill.SetChecked(False);                                           //0000 : 19 01 E0 4D 04 1B 07 00 00 1B 40 97 00 00 28 16 
    //19 01 E0 4D 04 1B 07 00 00 1B 40 97 00 00 28 16 04 0B 47 
  }


  event DoShowWindow(int aFlags) {
    Super.DoShowWindow(aFlags);                                                 //0000 : 1C 10 C0 2B 26 00 40 DE 07 1B 16 
    if (aFlags == Class'GUI_BaseDesktop'.1) {                                   //000B : 07 53 00 9A 00 40 DE 07 1B 12 20 00 68 D7 00 01 00 04 26 16 
      UpdateSkillCount();                                                       //001F : 1B BE 98 00 00 16 
      mConfirmWindow.__OnConfirm__Delegate = HandleConfirm;                     //0025 : 45 19 01 20 98 2B 26 05 00 08 01 D0 F9 04 1B 44 18 9A 00 00 
      mConfirmWindow.__OnCancel__Delegate = handleCancel;                       //0039 : 45 19 01 20 98 2B 26 05 00 08 01 58 AF 05 1B 44 07 9A 00 00 
      UpdateSkillSets();                                                        //004D : 1B 19 9A 00 00 16 
    }
    //1C 10 C0 2B 26 00 40 DE 07 1B 16 07 53 00 9A 00 40 DE 07 1B 12 20 00 68 D7 00 01 00 04 26 16 1B 
    //BE 98 00 00 16 45 19 01 20 98 2B 26 05 00 08 01 D0 F9 04 1B 44 18 9A 00 00 45 19 01 20 98 2B 26 
    //05 00 08 01 58 AF 05 1B 44 07 9A 00 00 1B 19 9A 00 00 16 04 0B 47 
  }


  function bool OnSkillSelect(HUD_CC_SkillButton aClickedComponent,bool aCheckState) {
    mSelectedSkill = aClickedComponent;                                         //0000 : 0F 01 E0 4D 04 1B 00 B0 3F 34 26 
    if (mSelectedSkill != None) {                                               //000B : 07 8C 00 77 01 E0 4D 04 1B 2A 16 
      mConfirmWindow.ClearSkills();                                             //0016 : 19 01 20 98 2B 26 06 00 00 1B E5 99 00 00 16 
      mConfirmWindow.AddSkill(mSelectedSkill.GetSkill());                       //0025 : 19 01 20 98 2B 26 15 00 00 1B E3 99 00 00 19 01 E0 4D 04 1B 06 00 04 1B 90 98 00 00 16 16 
      mConfirmWindow.SetText(Class'SBGuiStrings'.default.Press_confirm_to_learn_this_skill.Text);//0043 : 19 01 20 98 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 72 99 19 16 
      mDesktop.ShowWindow(mConfirmWindow.mWindowHandle,Class'GUI_BaseDesktop'.1);//0065 : 19 01 48 0C 9D 19 1E 00 00 1B 57 2D 00 00 19 01 20 98 2B 26 05 00 04 01 E8 77 9E 19 12 20 00 68 D7 00 01 00 04 26 16 
    }
    return True;                                                                //008C : 04 27 
    //0F 01 E0 4D 04 1B 00 B0 3F 34 26 07 8C 00 77 01 E0 4D 04 1B 2A 16 19 01 20 98 2B 26 06 00 00 1B 
    //E5 99 00 00 16 19 01 20 98 2B 26 15 00 00 1B E3 99 00 00 19 01 E0 4D 04 1B 06 00 04 1B 90 98 00 
    //00 16 16 19 01 20 98 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //F0 72 99 19 16 19 01 48 0C 9D 19 1E 00 00 1B 57 2D 00 00 19 01 20 98 2B 26 05 00 04 01 E8 77 9E 
    //19 12 20 00 68 D7 00 01 00 04 26 16 04 27 04 0B 47 
  }


  function Initialize() {
    local GED_Editor Editor;
    local int i;
    local int j;
    Super.Initialize();                                                         //0000 : 1C 00 EA 2B 26 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0006 : 0F 00 A0 9A 06 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor != None) {                                                       //002B : 07 ED 01 77 00 A0 9A 06 1B 2A 16 
      i = 0;                                                                    //0036 : 0F 00 B0 EA 2B 26 25 
      while (i < 6) {                                                           //003D : 07 86 01 96 00 B0 EA 2B 26 2C 06 16 
        mSkillPages[i] = HUD_SkillIterationPage(Editor.RetrieveComponent("SkillSelectionSet" $ string(i + 1)));//0049 : 0F 1A 00 B0 EA 2B 26 01 78 45 7F 19 2E 48 F2 2F 1D 19 00 A0 9A 06 1B 25 00 04 1B 15 98 00 00 70 1F 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 53 65 74 00 39 53 92 00 B0 EA 2B 26 26 16 16 16 
        j = 0;                                                                  //0088 : 0F 00 58 44 04 1B 25 
        while (j < mSkillPages[i].mPages.Length) {                              //008F : 07 7C 01 96 00 58 44 04 1B 37 19 1A 00 B0 EA 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 16 
          HUD_CC_SkillButton(mSkillPages[i].mPages[j]).__OnCheck__Delegate = OnSkillSelect;//00AE : 45 19 2E F8 37 31 1D 10 00 58 44 04 1B 19 1A 00 B0 EA 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 08 01 D0 7D 06 1B 44 BD 98 00 00 
          HUD_CC_SkillButton(mSkillPages[i].mPages[j]).mSkillSelectionLabelPage.SetTooltipText("UpgradeSkillTooltip.txt");//00DC : 19 19 2E F8 37 31 1D 10 00 58 44 04 1B 19 1A 00 B0 EA 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 04 01 B8 F5 2C 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 2E 74 78 74 00 16 
          HUD_CC_SkillButton(mSkillPages[i].mPages[j]).mPaperImage.SetTooltipText("UpgradeSkillTooltip.txt");//0127 : 19 19 2E F8 37 31 1D 10 00 58 44 04 1B 19 1A 00 B0 EA 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 04 01 90 C8 2B 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 2E 74 78 74 00 16 
          ++j;                                                                  //0172 : A3 00 58 44 04 1B 16 
        }
        ++i;                                                                    //017C : A3 00 B0 EA 2B 26 16 
      }
      mConfirmWindow = HUD_ConfirmSkillSelectionWindow(mDesktop.GetWindow(mDesktop.ShowStdWindow(Class'GUI_Desktop'.59,Class'GUI_Desktop'.2)));//0186 : 0F 01 20 98 2B 26 2E 88 31 EC 25 19 01 48 0C 9D 19 2B 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 3B 12 20 48 DB 2E 1D 02 00 04 2C 02 16 16 
      mConfirmWindow.__OnConfirm__Delegate = HandleConfirm;                     //01C5 : 45 19 01 20 98 2B 26 05 00 08 01 D0 F9 04 1B 44 18 9A 00 00 
      mConfirmWindow.__OnCancel__Delegate = handleCancel;                       //01D9 : 45 19 01 20 98 2B 26 05 00 08 01 58 AF 05 1B 44 07 9A 00 00 
    }
    mOwnerPage = None;                                                          //01ED : 0F 01 08 B0 9D 19 2A 
    //1C 00 EA 2B 26 16 0F 00 A0 9A 06 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 
    //20 00 68 D7 00 02 00 04 2C 2D 16 07 ED 01 77 00 A0 9A 06 1B 2A 16 0F 00 B0 EA 2B 26 25 07 86 01 
    //96 00 B0 EA 2B 26 2C 06 16 0F 1A 00 B0 EA 2B 26 01 78 45 7F 19 2E 48 F2 2F 1D 19 00 A0 9A 06 1B 
    //25 00 04 1B 15 98 00 00 70 1F 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 53 65 74 00 39 53 92 00 
    //B0 EA 2B 26 26 16 16 16 0F 00 58 44 04 1B 25 07 7C 01 96 00 58 44 04 1B 37 19 1A 00 B0 EA 2B 26 
    //01 78 45 7F 19 05 00 00 01 88 0C 2B 26 16 45 19 2E F8 37 31 1D 10 00 58 44 04 1B 19 1A 00 B0 EA 
    //2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 08 01 D0 7D 06 1B 44 BD 98 00 00 19 19 2E F8 
    //37 31 1D 10 00 58 44 04 1B 19 1A 00 B0 EA 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 04 
    //01 B8 F5 2C 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 
    //70 2E 74 78 74 00 16 19 19 2E F8 37 31 1D 10 00 58 44 04 1B 19 1A 00 B0 EA 2B 26 01 78 45 7F 19 
    //05 00 00 01 88 0C 2B 26 05 00 04 01 90 C8 2B 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 72 61 64 65 
    //53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 2E 74 78 74 00 16 A3 00 58 44 04 1B 16 06 8F 00 A3 00 B0 EA 
    //2B 26 16 06 3D 00 0F 01 20 98 2B 26 2E 88 31 EC 25 19 01 48 0C 9D 19 2B 00 04 1B 1E 98 00 00 19 
    //01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 3B 12 20 48 DB 2E 1D 02 00 
    //04 2C 02 16 16 45 19 01 20 98 2B 26 05 00 08 01 D0 F9 04 1B 44 18 9A 00 00 45 19 01 20 98 2B 26 
    //05 00 08 01 58 AF 05 1B 44 07 9A 00 00 0F 01 08 B0 9D 19 2A 04 0B 47 
  }



