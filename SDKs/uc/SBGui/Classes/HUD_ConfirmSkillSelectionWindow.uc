//==============================================================================
//  HUD_ConfirmSkillSelectionWindow
//==============================================================================

class HUD_ConfirmSkillSelectionWindow extends GUI_Window
    dependsOn(HUD_SkillIterationPage,HUD_SkillBookPage,GUI_TextCtrl,GED_Editor)
    Transient
    Config(User)
  ;

  var private HUD_SkillIterationPage mConfirmSkillPage;
  var private GUI_TextCtrl mConfirmText;
  var private GUI_Button mConfirmButton;
  var private GUI_Button mCancelButton;
  var private bool mIsConfirmUpgradeMode;
  var (null);
  var (null);


  function SetUpgradeMode(bool Setting) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 68 DF 2C 26 25 
    while (i < mConfirmSkillPage.mPages.Length) {                               //0007 : 07 AB 00 96 00 68 DF 2C 26 37 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 16 
      if (mConfirmSkillPage.mPages[i] != None) {                                //0020 : 07 A1 00 77 10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 2A 16 
        if (HUD_SkillBookPage(mConfirmSkillPage.mPages[i]) != None) {           //003A : 07 A1 00 77 2E 08 ED 2F 1D 10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 2A 16 
          HUD_SkillBookPage(mConfirmSkillPage.mPages[i]).mUpdateTokenSlots = False;//0059 : 14 19 2E 08 ED 2F 1D 10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 06 00 04 2D 01 60 55 34 26 28 
          HUD_SkillBookPage(mConfirmSkillPage.mPages[i]).IncreaseActiveSigilSlots();//007E : 19 2E 08 ED 2F 1D 10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 06 00 00 1C C0 5A 34 26 16 
        }
      }
      ++i;                                                                      //00A1 : A3 00 68 DF 2C 26 16 
    }
    //0F 00 68 DF 2C 26 25 07 AB 00 96 00 68 DF 2C 26 37 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 16 
    //07 A1 00 77 10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 2A 16 07 A1 00 77 2E 08 
    //ED 2F 1D 10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 2A 16 14 19 2E 08 ED 2F 1D 
    //10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 06 00 04 2D 01 60 55 34 26 28 19 2E 
    //08 ED 2F 1D 10 00 68 DF 2C 26 19 01 F8 30 2B 26 05 00 00 01 88 0C 2B 26 06 00 00 1C C0 5A 34 26 
    //16 A3 00 68 DF 2C 26 16 06 07 00 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 F8 A0 33 26 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 4C 00 9A 00 F8 A0 33 26 12 20 00 68 D7 00 01 00 04 26 16 
      mConfirmSkillPage.ClearIteration();                                       //001F : 19 01 F8 30 2B 26 06 00 00 1B 6B 98 00 00 16 
      mConfirmSkillPage.UpdateIteration();                                      //002E : 19 01 F8 30 2B 26 06 00 00 1B 68 98 00 00 16 
      mConfirmSkillPage.InvalidateFunctionPtrs();                               //003D : 19 01 F8 30 2B 26 06 00 00 1B CE 96 00 00 16 
    }
    //1C 20 7A 9E 19 00 F8 A0 33 26 16 07 4C 00 9A 00 F8 A0 33 26 12 20 00 68 D7 00 01 00 04 26 16 19 
    //01 F8 30 2B 26 06 00 00 1B 6B 98 00 00 16 19 01 F8 30 2B 26 06 00 00 1B 68 98 00 00 16 19 01 F8 
    //30 2B 26 06 00 00 1B CE 96 00 00 16 04 0B 47 
  }


  function SetText(string aText) {
    mConfirmText.SetText(aText);                                                //0000 : 19 01 50 A3 33 26 0B 00 00 1B 13 98 00 00 00 28 1E 34 26 16 
    //19 01 50 A3 33 26 0B 00 00 1B 13 98 00 00 00 28 1E 34 26 16 04 0B 47 
  }


  function AddSkill(export editinline FSkill_Type aSkill) {
    if (aSkill != None) {                                                       //0000 : 07 1F 00 77 00 00 0F 08 1B 2A 16 
      mConfirmSkillPage.AddDefaultSkill(aSkill);                                //000B : 19 01 F8 30 2B 26 0B 00 00 1B 69 9B 00 00 00 00 0F 08 1B 16 
    }
    //07 1F 00 77 00 00 0F 08 1B 2A 16 19 01 F8 30 2B 26 0B 00 00 1B 69 9B 00 00 00 00 0F 08 1B 16 04 
    //0B 47 
  }


  function ClearSkills() {
    mConfirmSkillPage.ClearDefaultSkills();                                     //0000 : 19 01 F8 30 2B 26 06 00 00 1B 6A 9B 00 00 16 
    //19 01 F8 30 2B 26 06 00 00 1B 6A 9B 00 00 16 04 0B 47 
  }


  function bool OnConfirmClick(GUI_Component aButton) {
    OnConfirm(self);                                                            //0000 : 43 D0 F9 04 1B 14 99 00 00 17 16 
    return True;                                                                //000B : 04 27 
    //43 D0 F9 04 1B 14 99 00 00 17 16 04 27 04 0B 47 
  }


  function bool OnCancelClick(GUI_Component aButton) {
    OnCancel(self);                                                             //0000 : 43 58 AF 05 1B 25 99 00 00 17 16 
    mDesktop.ShowWindow(mWindowHandle,Class'GUI_Desktop'.2);                    //000B : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
    return True;                                                                //002A : 04 27 
    //43 58 AF 05 1B 25 99 00 00 17 16 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 
    //48 DB 2E 1D 02 00 04 2C 02 16 04 27 04 0B 47 
  }


  function Initialize() {
    local GED_Editor Editor;
    mWidth = 425.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 80 D4 43 
    mHeight = 300.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 96 43 
    Super.Initialize();                                                         //0016 : 1C 28 9E 9E 19 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //001C : 0F 00 F8 44 8A 19 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor != None) {                                                       //0041 : 07 B6 01 77 00 F8 44 8A 19 2A 16 
      Editor.mCurrentWindow = None;                                             //004C : 0F 19 00 F8 44 8A 19 05 00 04 01 10 8D A1 19 2A 
      Editor.mCurrentComponent = None;                                          //005C : 0F 19 00 F8 44 8A 19 05 00 04 01 38 8E A1 19 2A 
      Editor.mCurrentImage = None;                                              //006C : 0F 19 00 F8 44 8A 19 05 00 04 01 B0 8E A1 19 2A 
      Editor.Attach(self,"Leveling\ConfirmSkillSelectionPage.txt");             //007C : 19 00 F8 44 8A 19 2F 00 00 1B 3F 01 00 00 17 1F 4C 65 76 65 6C 69 6E 67 5C 43 6F 6E 66 69 72 6D 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 50 61 67 65 2E 74 78 74 00 16 
      mConfirmSkillPage = HUD_SkillIterationPage(Editor.RetrieveComponent("ConfirmSkillSelectionIterationPage"));//00B4 : 0F 01 F8 30 2B 26 2E 48 F2 2F 1D 19 00 F8 44 8A 19 2A 00 04 1B 15 98 00 00 1F 43 6F 6E 66 69 72 6D 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 49 74 65 72 61 74 69 6F 6E 50 61 67 65 00 16 
      mConfirmSkillPage.ShowLearnedLabel(False);                                //00F2 : 19 01 F8 30 2B 26 07 00 00 1B 8C 99 00 00 28 16 
      mConfirmText = GUI_TextCtrl(Editor.RetrieveComponent("ConfirmText"));     //0102 : 0F 01 50 A3 33 26 2E 20 79 2F 1D 19 00 F8 44 8A 19 13 00 04 1B 15 98 00 00 1F 43 6F 6E 66 69 72 6D 54 65 78 74 00 16 
      mConfirmButton = GUI_Button(Editor.RetrieveComponent("LearnSkillConfirmButton"));//0129 : 0F 01 D8 A2 33 26 2E 78 F0 2E 1D 19 00 F8 44 8A 19 1F 00 04 1B 15 98 00 00 1F 4C 65 61 72 6E 53 6B 69 6C 6C 43 6F 6E 66 69 72 6D 42 75 74 74 6F 6E 00 16 
      mConfirmButton.__OnClick__Delegate = OnConfirmClick;                      //015C : 45 19 01 D8 A2 33 26 05 00 08 01 98 EB 9D 19 44 A4 9A 00 00 
      mCancelButton = GUI_Button(Editor.RetrieveComponent("LearnSkillCancelButton"));//0170 : 0F 01 E8 A1 33 26 2E 78 F0 2E 1D 19 00 F8 44 8A 19 1E 00 04 1B 15 98 00 00 1F 4C 65 61 72 6E 53 6B 69 6C 6C 43 61 6E 63 65 6C 42 75 74 74 6F 6E 00 16 
      mCancelButton.__OnClick__Delegate = OnCancelClick;                        //01A2 : 45 19 01 E8 A1 33 26 05 00 08 01 98 EB 9D 19 44 A2 9A 00 00 
    }
    //0F 01 60 87 31 16 1E 00 80 D4 43 0F 01 40 88 31 16 1E 00 00 96 43 1C 28 9E 9E 19 16 0F 00 F8 44 
    //8A 19 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 
    //16 07 B6 01 77 00 F8 44 8A 19 2A 16 0F 19 00 F8 44 8A 19 05 00 04 01 10 8D A1 19 2A 0F 19 00 F8 
    //44 8A 19 05 00 04 01 38 8E A1 19 2A 0F 19 00 F8 44 8A 19 05 00 04 01 B0 8E A1 19 2A 19 00 F8 44 
    //8A 19 2F 00 00 1B 3F 01 00 00 17 1F 4C 65 76 65 6C 69 6E 67 5C 43 6F 6E 66 69 72 6D 53 6B 69 6C 
    //6C 53 65 6C 65 63 74 69 6F 6E 50 61 67 65 2E 74 78 74 00 16 0F 01 F8 30 2B 26 2E 48 F2 2F 1D 19 
    //00 F8 44 8A 19 2A 00 04 1B 15 98 00 00 1F 43 6F 6E 66 69 72 6D 53 6B 69 6C 6C 53 65 6C 65 63 74 
    //69 6F 6E 49 74 65 72 61 74 69 6F 6E 50 61 67 65 00 16 19 01 F8 30 2B 26 07 00 00 1B 8C 99 00 00 
    //28 16 0F 01 50 A3 33 26 2E 20 79 2F 1D 19 00 F8 44 8A 19 13 00 04 1B 15 98 00 00 1F 43 6F 6E 66 
    //69 72 6D 54 65 78 74 00 16 0F 01 D8 A2 33 26 2E 78 F0 2E 1D 19 00 F8 44 8A 19 1F 00 04 1B 15 98 
    //00 00 1F 4C 65 61 72 6E 53 6B 69 6C 6C 43 6F 6E 66 69 72 6D 42 75 74 74 6F 6E 00 16 45 19 01 D8 
    //A2 33 26 05 00 08 01 98 EB 9D 19 44 A4 9A 00 00 0F 01 E8 A1 33 26 2E 78 F0 2E 1D 19 00 F8 44 8A 
    //19 1E 00 04 1B 15 98 00 00 1F 4C 65 61 72 6E 53 6B 69 6C 6C 43 61 6E 63 65 6C 42 75 74 74 6F 6E 
    //00 16 45 19 01 E8 A1 33 26 05 00 08 01 98 EB 9D 19 44 A2 9A 00 00 04 0B 47 
  }


  delegate OnCancel(HUD_ConfirmSkillSelectionWindow Source);


  delegate OnConfirm(HUD_ConfirmSkillSelectionWindow Source);



