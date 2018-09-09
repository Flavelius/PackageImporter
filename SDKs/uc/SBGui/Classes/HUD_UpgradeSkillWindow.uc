//==============================================================================
//  HUD_UpgradeSkillWindow
//==============================================================================

class HUD_UpgradeSkillWindow extends HUD_SkillLibrary
    dependsOn(GUI_Sounds,HUD_CC_SkillButton,FSkill_Type,HUD_ConfirmSkillSelectionWindow,GUI_Page)
    Transient
    Config(User)
  ;

  const HUW_UPGRADE_SKILL =  42;
  var HUD_CC_SkillButton mSelectedSkill;
  var HUD_ConfirmSkillSelectionWindow mConfirmWindow;


  function RetrieveFilters(GED_Editor Editor) {
    //04 0B 47 
  }


  function InitializeFilters() {
    //04 0B 47 
  }


  function UpdateSkillCount() {
    local int availableUpgrades;
    availableUpgrades = GetPawn().Skills.GetMaxTotalSkillTokenCount() - GetPawn().Skills.GetTotalSkillTokenCount();//0000 : 0F 00 98 54 05 1B 93 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 1C A8 24 23 11 16 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 1C 80 26 23 11 16 16 
    if (GetPawn() != None) {                                                    //003A : 07 13 01 77 1B 2B 0C 00 00 16 2A 16 
      if (availableUpgrades < 1) {                                              //0046 : 07 8C 00 96 00 98 54 05 1B 26 16 
        SetTitle(Class'SBGuiStrings'.default.Upgrade_a_skill.Text
          @ "("
          $ Class'SBGuiStrings'.default.No_upgrade_left.Text
          $ ")");//0051 : 1B 0A 2C 00 00 70 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 30 97 19 1F 28 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 70 99 19 16 1F 29 00 16 16 
      } else {                                                                  //0089 : 06 13 01 
        if (availableUpgrades == 1) {                                           //008C : 07 D2 00 9A 00 98 54 05 1B 26 16 
          SetTitle(Class'SBGuiStrings'.default.Upgrade_a_skill.Text
            @ "("
            $ Class'SBGuiStrings'.default.One_upgrade_left.Text
            $ ")");//0097 : 1B 0A 2C 00 00 70 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 30 97 19 1F 28 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 70 99 19 16 1F 29 00 16 16 
        } else {                                                                //00CF : 06 13 01 
          SetTitle(Class'SBGuiStrings'.default.Upgrade_a_skill.Text
            @ "("
            $ string(availableUpgrades)
            @ Class'SBGuiStrings'.default.Upgrades_Left.Text
            $ ")");//00D2 : 1B 0A 2C 00 00 70 A8 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 30 97 19 1F 28 00 16 39 53 00 98 54 05 1B 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 71 99 19 16 1F 29 00 16 16 
        }
      }
    }
    //0F 00 98 54 05 1B 93 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 1C A8 24 23 11 16 
    //19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 1C 80 26 23 11 16 16 07 13 01 77 1B 2B 
    //0C 00 00 16 2A 16 07 8C 00 96 00 98 54 05 1B 26 16 1B 0A 2C 00 00 70 70 A8 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 C0 30 97 19 1F 28 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 
    //70 99 19 16 1F 29 00 16 16 06 13 01 07 D2 00 9A 00 98 54 05 1B 26 16 1B 0A 2C 00 00 70 70 A8 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 30 97 19 1F 28 00 16 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 98 70 99 19 16 1F 29 00 16 16 06 13 01 1B 0A 2C 00 00 70 A8 70 A8 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 C0 30 97 19 1F 28 00 16 39 53 00 98 54 05 1B 16 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 10 71 99 19 16 1F 29 00 16 16 04 0B 47 
  }


  function OnReceivedTokenSlotHandler(export editinline FSkill_Type aSkill,int aNewSlotCount) {
    local int i;
    local int availableUpgrades;
    UpdateSkillCount();                                                         //0000 : 1B BE 98 00 00 16 
    i = 0;                                                                      //0006 : 0F 00 D8 96 04 1B 25 
    while (i < 6) {                                                             //000D : 07 4D 00 96 00 D8 96 04 1B 2C 06 16 
      mSkillPages[i].ClearIteration();                                          //0019 : 19 1A 00 D8 96 04 1B 01 78 45 7F 19 06 00 00 1B 6B 98 00 00 16 
      mSkillPages[i].UpdateIteration();                                         //002E : 19 1A 00 D8 96 04 1B 01 78 45 7F 19 06 00 00 1B 68 98 00 00 16 
      ++i;                                                                      //0043 : A3 00 D8 96 04 1B 16 
    }
    availableUpgrades = GetPawn().Skills.GetMaxTotalSkillTokenCount() - GetPawn().Skills.GetTotalSkillTokenCount();//004D : 0F 00 E8 E6 07 1B 93 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 1C A8 24 23 11 16 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 1C 80 26 23 11 16 16 
    if (availableUpgrades <= 0) {                                               //0087 : 07 B1 00 98 00 E8 E6 07 1B 25 16 
      mDesktop.ShowWindow(mWindowHandle,Class'GUI_Desktop'.2);                  //0092 : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
    }
    //1B BE 98 00 00 16 0F 00 D8 96 04 1B 25 07 4D 00 96 00 D8 96 04 1B 2C 06 16 19 1A 00 D8 96 04 1B 
    //01 78 45 7F 19 06 00 00 1B 6B 98 00 00 16 19 1A 00 D8 96 04 1B 01 78 45 7F 19 06 00 00 1B 68 98 
    //00 00 16 A3 00 D8 96 04 1B 16 06 0D 00 0F 00 E8 E6 07 1B 93 19 19 1B 2B 0C 00 00 16 05 00 04 01 
    //08 28 18 11 06 00 04 1C A8 24 23 11 16 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 06 00 04 
    //1C 80 26 23 11 16 16 07 B1 00 98 00 E8 E6 07 1B 25 16 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 
    //01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 04 0B 47 
  }


  function OnConfirm(HUD_ConfirmSkillSelectionWindow Source) {
    if (GetPawn() == None) {                                                    //0000 : 07 0E 00 72 1B 2B 0C 00 00 16 2A 16 
      return;                                                                   //000C : 04 0B 
    }
    mDesktop.PlaySound(Class'GUI_Sounds'.default.UpgradeSkill);                 //000E : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 D0 28 A6 19 16 
    GetPawn().Skills.cl2sv_AddTokenSlot_CallStub(mSelectedSkill.GetSkill().GetResourceId());//002B : 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 1F 00 00 1B 50 1C 00 00 19 19 01 C0 20 04 1B 06 00 04 1B 90 98 00 00 16 06 00 04 1C 08 90 20 11 16 16 
    mDesktop.ShowWindow(mConfirmWindow.mWindowHandle,Class'GUI_Desktop'.2);     //005D : 19 01 48 0C 9D 19 1F 00 00 1B 57 2D 00 00 19 01 30 AC 2B 26 05 00 04 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
    mSelectedSkill.SetChecked(False);                                           //0085 : 19 01 C0 20 04 1B 07 00 00 1B 40 97 00 00 28 16 
    //07 0E 00 72 1B 2B 0C 00 00 16 2A 16 04 0B 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 
    //9E 19 05 00 04 02 D0 28 A6 19 16 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 1F 00 00 1B 50 
    //1C 00 00 19 19 01 C0 20 04 1B 06 00 04 1B 90 98 00 00 16 06 00 04 1C 08 90 20 11 16 16 19 01 48 
    //0C 9D 19 1F 00 00 1B 57 2D 00 00 19 01 30 AC 2B 26 05 00 04 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 
    //00 04 2C 02 16 19 01 C0 20 04 1B 07 00 00 1B 40 97 00 00 28 16 04 0B 47 
  }


  function OnCancel(HUD_ConfirmSkillSelectionWindow Source) {
    mSelectedSkill.SetChecked(False);                                           //0000 : 19 01 C0 20 04 1B 07 00 00 1B 40 97 00 00 28 16 
    //19 01 C0 20 04 1B 07 00 00 1B 40 97 00 00 28 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    local GED_Editor Editor;
    local int i;
    local int j;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 10 C0 2B 26 00 B0 E2 07 1B 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 AA 01 9A 00 B0 E2 07 1B 12 20 00 68 D7 00 01 00 04 26 16 
      UpdateSkillCount();                                                       //001F : 1B BE 98 00 00 16 
      mConfirmWindow.__OnConfirm__Delegate = OnConfirm;                         //0025 : 45 19 01 30 AC 2B 26 05 00 08 01 D0 F9 04 1B 44 14 99 00 00 
      UpdateTabHeaderColors();                                                  //0039 : 1B 15 9A 00 00 16 
      Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));    //003F : 0F 00 18 E4 07 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
      if (Editor != None) {                                                     //0064 : 07 AA 01 77 00 18 E4 07 1B 2A 16 
        i = 0;                                                                  //006F : 0F 00 C0 C0 2B 26 25 
        while (i < 6) {                                                         //0076 : 07 AA 01 96 00 C0 C0 2B 26 2C 06 16 
          mSkillPages[i].ClearIteration();                                      //0082 : 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 06 00 00 1B 6B 98 00 00 16 
          mSkillPages[i].UpdateIteration();                                     //0097 : 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 06 00 00 1B 68 98 00 00 16 
          j = 0;                                                                //00AC : 0F 00 50 F9 32 26 25 
          while (j < mSkillPages[i].mPages.Length) {                            //00B3 : 07 A0 01 96 00 50 F9 32 26 37 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 16 
            HUD_CC_SkillButton(mSkillPages[i].mPages[j]).__OnCheck__Delegate = OnSkillSelect;//00D2 : 45 19 2E F8 37 31 1D 10 00 50 F9 32 26 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 08 01 D0 7D 06 1B 44 BD 98 00 00 
            HUD_CC_SkillButton(mSkillPages[i].mPages[j]).mSkillSelectionLabelPage.SetTooltipText("UpgradeSkillTooltip.txt");//0100 : 19 19 2E F8 37 31 1D 10 00 50 F9 32 26 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 04 01 B8 F5 2C 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 2E 74 78 74 00 16 
            HUD_CC_SkillButton(mSkillPages[i].mPages[j]).mPaperImage.SetTooltipText("UpgradeSkillTooltip.txt");//014B : 19 19 2E F8 37 31 1D 10 00 50 F9 32 26 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 04 01 90 C8 2B 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 2E 74 78 74 00 16 
            ++j;                                                                //0196 : A3 00 50 F9 32 26 16 
          }
          ++i;                                                                  //01A0 : A3 00 C0 C0 2B 26 16 
        }
      }
    }
    //1C 10 C0 2B 26 00 B0 E2 07 1B 16 07 AA 01 9A 00 B0 E2 07 1B 12 20 00 68 D7 00 01 00 04 26 16 1B 
    //BE 98 00 00 16 45 19 01 30 AC 2B 26 05 00 08 01 D0 F9 04 1B 44 14 99 00 00 1B 15 9A 00 00 16 0F 
    //00 18 E4 07 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 
    //04 2C 2D 16 07 AA 01 77 00 18 E4 07 1B 2A 16 0F 00 C0 C0 2B 26 25 07 AA 01 96 00 C0 C0 2B 26 2C 
    //06 16 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 06 00 00 1B 6B 98 00 00 16 19 1A 00 C0 C0 2B 26 01 78 
    //45 7F 19 06 00 00 1B 68 98 00 00 16 0F 00 50 F9 32 26 25 07 A0 01 96 00 50 F9 32 26 37 19 1A 00 
    //C0 C0 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 16 45 19 2E F8 37 31 1D 10 00 50 F9 32 26 19 
    //1A 00 C0 C0 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 08 01 D0 7D 06 1B 44 BD 98 00 00 
    //19 19 2E F8 37 31 1D 10 00 50 F9 32 26 19 1A 00 C0 C0 2B 26 01 78 45 7F 19 05 00 00 01 88 0C 2B 
    //26 05 00 04 01 B8 F5 2C 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 
    //6F 6C 74 69 70 2E 74 78 74 00 16 19 19 2E F8 37 31 1D 10 00 50 F9 32 26 19 1A 00 C0 C0 2B 26 01 
    //78 45 7F 19 05 00 00 01 88 0C 2B 26 05 00 04 01 90 C8 2B 26 1F 00 00 1B 54 97 00 00 1F 55 70 67 
    //72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 2E 74 78 74 00 16 A3 00 50 F9 32 26 16 06 B3 00 
    //A3 00 C0 C0 2B 26 16 06 76 00 04 0B 47 
  }


  function bool OnSkillSelect(HUD_CC_SkillButton clickedComponent,bool checkState) {
    mSelectedSkill = clickedComponent;                                          //0000 : 0F 01 C0 20 04 1B 00 E0 48 34 26 
    if (mSelectedSkill != None) {                                               //000B : 07 9C 00 77 01 C0 20 04 1B 2A 16 
      mConfirmWindow.ClearSkills();                                             //0016 : 19 01 30 AC 2B 26 06 00 00 1B E5 99 00 00 16 
      mConfirmWindow.AddSkill(mSelectedSkill.GetSkill());                       //0025 : 19 01 30 AC 2B 26 15 00 00 1B E3 99 00 00 19 01 C0 20 04 1B 06 00 04 1B 90 98 00 00 16 16 
      mConfirmWindow.SetText(Class'SBGuiStrings'.default.Press_confirm_to_upgrade_this_skill.Text);//0043 : 19 01 30 AC 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 73 99 19 16 
      mDesktop.ShowWindow(mConfirmWindow.mWindowHandle,Class'GUI_BaseDesktop'.1);//0065 : 19 01 48 0C 9D 19 1E 00 00 1B 57 2D 00 00 19 01 30 AC 2B 26 05 00 04 01 E8 77 9E 19 12 20 00 68 D7 00 01 00 04 26 16 
      mConfirmWindow.SetUpgradeMode(True);                                      //008C : 19 01 30 AC 2B 26 07 00 00 1B A5 9A 00 00 27 16 
    }
    return True;                                                                //009C : 04 27 
    //0F 01 C0 20 04 1B 00 E0 48 34 26 07 9C 00 77 01 C0 20 04 1B 2A 16 19 01 30 AC 2B 26 06 00 00 1B 
    //E5 99 00 00 16 19 01 30 AC 2B 26 15 00 00 1B E3 99 00 00 19 01 C0 20 04 1B 06 00 04 1B 90 98 00 
    //00 16 16 19 01 30 AC 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //E0 73 99 19 16 19 01 48 0C 9D 19 1E 00 00 1B 57 2D 00 00 19 01 30 AC 2B 26 05 00 04 01 E8 77 9E 
    //19 12 20 00 68 D7 00 01 00 04 26 16 19 01 30 AC 2B 26 07 00 00 1B A5 9A 00 00 27 16 04 27 04 0B 
    //47 
  }


  event OnComponentDestroyed() {
    if (GetPawn() != None) {                                                    //0000 : 07 2A 00 77 1B 2B 0C 00 00 16 2A 16 
      GetPawn().Skills.__OnSkillReceivedTokenSlot__Delegate = None;             //000C : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 18 2C 23 11 44 00 00 00 00 
    }
    Super.OnComponentDestroyed();                                               //002A : 1C 68 3F 04 1B 16 
    //07 2A 00 77 1B 2B 0C 00 00 16 2A 16 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 
    //01 18 2C 23 11 44 00 00 00 00 1C 68 3F 04 1B 16 04 0B 47 
  }


  function SetDelegates() {
    Super.SetDelegates();                                                       //0000 : 1C A0 2F 05 1B 16 
    if (GetPawn() != None) {                                                    //0006 : 07 30 00 77 1B 2B 0C 00 00 16 2A 16 
      GetPawn().Skills.__OnSkillReceivedTokenSlot__Delegate = OnReceivedTokenSlotHandler;//0012 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 18 2C 23 11 44 7D 9A 00 00 
    }
    //1C A0 2F 05 1B 16 07 30 00 77 1B 2B 0C 00 00 16 2A 16 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 
    //28 18 11 05 00 08 01 18 2C 23 11 44 7D 9A 00 00 04 0B 47 
  }


  function Initialize() {
    local GED_Editor Editor;
    local int i;
    Super.Initialize();                                                         //0000 : 1C 00 EA 2B 26 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0006 : 0F 00 98 B9 06 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor != None) {                                                       //002B : 07 F9 00 77 00 98 B9 06 1B 2A 16 
      i = 0;                                                                    //0036 : 0F 00 00 98 04 1B 25 
      while (i < 6) {                                                           //003D : 07 92 00 96 00 00 98 04 1B 2C 06 16 
        mSkillPages[i] = HUD_SkillIterationPage(Editor.RetrieveComponent("SkillSelectionSet" $ string(i + 1)));//0049 : 0F 1A 00 00 98 04 1B 01 78 45 7F 19 2E 48 F2 2F 1D 19 00 98 B9 06 1B 25 00 04 1B 15 98 00 00 70 1F 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 53 65 74 00 39 53 92 00 00 98 04 1B 26 16 16 16 
        ++i;                                                                    //0088 : A3 00 00 98 04 1B 16 
      }
      mConfirmWindow = HUD_ConfirmSkillSelectionWindow(mDesktop.GetWindow(mDesktop.ShowStdWindow(Class'GUI_Desktop'.59,Class'GUI_Desktop'.2)));//0092 : 0F 01 30 AC 2B 26 2E 88 31 EC 25 19 01 48 0C 9D 19 2B 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 3B 12 20 48 DB 2E 1D 02 00 04 2C 02 16 16 
      mConfirmWindow.__OnConfirm__Delegate = OnConfirm;                         //00D1 : 45 19 01 30 AC 2B 26 05 00 08 01 D0 F9 04 1B 44 14 99 00 00 
      mConfirmWindow.__OnCancel__Delegate = OnCancel;                           //00E5 : 45 19 01 30 AC 2B 26 05 00 08 01 58 AF 05 1B 44 25 99 00 00 
    }
    mOwnerPage = None;                                                          //00F9 : 0F 01 08 B0 9D 19 2A 
    //1C 00 EA 2B 26 16 0F 00 98 B9 06 1B 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 
    //20 00 68 D7 00 02 00 04 2C 2D 16 07 F9 00 77 00 98 B9 06 1B 2A 16 0F 00 00 98 04 1B 25 07 92 00 
    //96 00 00 98 04 1B 2C 06 16 0F 1A 00 00 98 04 1B 01 78 45 7F 19 2E 48 F2 2F 1D 19 00 98 B9 06 1B 
    //25 00 04 1B 15 98 00 00 70 1F 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 53 65 74 00 39 53 92 00 
    //00 98 04 1B 26 16 16 16 A3 00 00 98 04 1B 16 06 3D 00 0F 01 30 AC 2B 26 2E 88 31 EC 25 19 01 48 
    //0C 9D 19 2B 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 
    //00 04 2C 3B 12 20 48 DB 2E 1D 02 00 04 2C 02 16 16 45 19 01 30 AC 2B 26 05 00 08 01 D0 F9 04 1B 
    //44 14 99 00 00 45 19 01 30 AC 2B 26 05 00 08 01 58 AF 05 1B 44 25 99 00 00 0F 01 08 B0 9D 19 2A 
    //04 0B 47 
  }



