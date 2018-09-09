//==============================================================================
//  HUD_CC_SelectSkills
//==============================================================================

class HUD_CC_SelectSkills extends HUD_CC_Window
    dependsOn(HUD_CC_SkillButton,Game_CharacterStats,Game_PlayerPawn,Game_Skills,GUI_TitleBar,FSkill_Type,GUI_Label)
    Transient
    Config(User)
  ;

  const CC_MAX_SKILLS =  5;
  const CC_NUM_SKILLS =  7;
  var array<HUD_CC_SkillButton> mSkillPages;
  var int mSelectedNum;
  var int mSelectedSkills[5];
  var array<FSkill_Type> mAvailableSkills;
  var int mDefaultSkillCount;
  var private array<LocalizedString> mSkillsRemainingText;
  var private Game_PlayerPawn mPlayerPawn;
  var private int mMaxSkills;
  var (null);


  function SetInfoText() {
    OnSkillSelectionChange(True,0,mMaxSkills - mSelectedNum);                   //0000 : 43 60 3D 06 1B 7B 99 00 00 27 25 93 01 18 51 2B 26 01 60 28 2C 26 16 16 
    //43 60 3D 06 1B 7B 99 00 00 27 25 93 01 18 51 2B 26 01 60 28 2C 26 16 16 04 0B 47 
  }


  function EnableUnselectedSkills(bool State) {
    local int i;
    local int Begin;
    if (mPlayerPawn != None) {                                                  //0000 : 07 15 00 77 01 08 0E 05 1B 2A 16 
      Begin = 0;                                                                //000B : 0F 00 F8 94 07 1B 25 
    } else {                                                                    //0012 : 06 20 00 
      Begin = mDefaultSkillCount;                                               //0015 : 0F 00 F8 94 07 1B 01 98 15 2B 26 
    }
    i = Begin;                                                                  //0020 : 0F 00 90 9E 2C 26 00 F8 94 07 1B 
    while (i < mSkillPages.Length) {                                            //002B : 07 B5 00 96 00 90 9E 2C 26 37 01 B8 9C 8A 19 16 
      if (!mSkillPages[i].mChecked
        && mSkillPages[i].IsEnabled() != State) {//003B : 07 AB 00 82 81 19 10 00 90 9E 2C 26 01 B8 9C 8A 19 06 00 04 2D 01 F8 68 06 1B 16 18 1E 00 F3 19 10 00 90 9E 2C 26 01 B8 9C 8A 19 06 00 04 1C 10 83 9D 19 16 2D 00 D8 96 07 1B 16 16 
        if (mPlayerPawn != None && State) {                                     //0077 : 07 90 00 82 77 01 08 0E 05 1B 2A 16 18 07 00 2D 00 D8 96 07 1B 16 
          goto jl00AB;                                                          //008D : 06 AB 00 
        }
        mSkillPages[i].SetEnabled(State);                                       //0090 : 19 10 00 90 9E 2C 26 01 B8 9C 8A 19 0C 00 00 1B 5F 32 00 00 2D 00 D8 96 07 1B 16 
      }
      i++;                                                                      //00AB : A5 00 90 9E 2C 26 16 
    }
    //07 15 00 77 01 08 0E 05 1B 2A 16 0F 00 F8 94 07 1B 25 06 20 00 0F 00 F8 94 07 1B 01 98 15 2B 26 
    //0F 00 90 9E 2C 26 00 F8 94 07 1B 07 B5 00 96 00 90 9E 2C 26 37 01 B8 9C 8A 19 16 07 AB 00 82 81 
    //19 10 00 90 9E 2C 26 01 B8 9C 8A 19 06 00 04 2D 01 F8 68 06 1B 16 18 1E 00 F3 19 10 00 90 9E 2C 
    //26 01 B8 9C 8A 19 06 00 04 1C 10 83 9D 19 16 2D 00 D8 96 07 1B 16 16 07 90 00 82 77 01 08 0E 05 
    //1B 2A 16 18 07 00 2D 00 D8 96 07 1B 16 06 AB 00 19 10 00 90 9E 2C 26 01 B8 9C 8A 19 0C 00 00 1B 
    //5F 32 00 00 2D 00 D8 96 07 1B 16 A5 00 90 9E 2C 26 16 06 2B 00 04 0B 47 
  }


  function SetSelectableSkillCount(int aCount) {
    if (aCount > 0) {                                                           //0000 : 07 1C 00 97 00 C0 1D 08 1B 25 16 
      mMaxSkills = aCount;                                                      //000B : 0F 01 18 51 2B 26 00 C0 1D 08 1B 
      UpdateLabelText();                                                        //0016 : 1C A8 79 06 1B 16 
    }
    //07 1C 00 97 00 C0 1D 08 1B 25 16 0F 01 18 51 2B 26 00 C0 1D 08 1B 1C A8 79 06 1B 16 04 0B 47 
  }


  function bool ResetValues(GUI_Component aButton) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 20 63 2B 26 25 
    while (i < 7) {                                                             //0007 : 07 3E 00 96 00 20 63 2B 26 2C 07 16 
      mSkillPages[i].SetEnabled(False);                                         //0013 : 19 10 00 20 63 2B 26 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 28 16 
      DeselectSkillPage(i);                                                     //0029 : 1C C8 6E 06 1B 00 20 63 2B 26 16 
      i++;                                                                      //0034 : A5 00 20 63 2B 26 16 
    }
    i = 0;                                                                      //003E : 0F 00 20 63 2B 26 25 
    while (i < mDefaultSkillCount) {                                            //0045 : 07 6F 00 96 00 20 63 2B 26 01 98 15 2B 26 16 
      mSelectedSkills[i] = i;                                                   //0054 : 0F 1A 00 20 63 2B 26 01 E8 BA 2C 26 00 20 63 2B 26 
      ++i;                                                                      //0065 : A3 00 20 63 2B 26 16 
    }
    mSelectedNum = mDefaultSkillCount;                                          //006F : 0F 01 60 28 2C 26 01 98 15 2B 26 
    UpdateLabelText();                                                          //007A : 1C A8 79 06 1B 16 
    return True;                                                                //0080 : 04 27 
    //0F 00 20 63 2B 26 25 07 3E 00 96 00 20 63 2B 26 2C 07 16 19 10 00 20 63 2B 26 01 B8 9C 8A 19 07 
    //00 00 1B 5F 32 00 00 28 16 1C C8 6E 06 1B 00 20 63 2B 26 16 A5 00 20 63 2B 26 16 06 07 00 0F 00 
    //20 63 2B 26 25 07 6F 00 96 00 20 63 2B 26 01 98 15 2B 26 16 0F 1A 00 20 63 2B 26 01 E8 BA 2C 26 
    //00 20 63 2B 26 A3 00 20 63 2B 26 16 06 45 00 0F 01 60 28 2C 26 01 98 15 2B 26 1C A8 79 06 1B 16 
    //04 27 04 0B 47 
  }


  delegate OnSkillSelectionChange(bool wasSelected,int aSkill,int selectedCount);


  function bool OnSkillSelect(HUD_CC_SkillButton clickedButton,bool checkState) {
    local int i;
    local int j;
    if (checkState) {                                                           //0000 : 07 92 00 2D 00 20 24 33 26 
      if (mSelectedNum == mMaxSkills) {                                         //0009 : 07 1A 00 9A 01 60 28 2C 26 01 18 51 2B 26 16 
        return False;                                                           //0018 : 04 28 
      }
      mSelectedSkills[mSelectedNum] = clickedButton.mIntTag;                    //001A : 0F 1A 01 60 28 2C 26 01 E8 BA 2C 26 19 00 38 49 04 1B 05 00 04 01 58 90 31 16 
      mSelectedNum++;                                                           //0034 : A5 01 60 28 2C 26 16 
      OnSkillSelectionChange(True,clickedButton.mIntTag,mMaxSkills - mSelectedNum);//003B : 43 60 3D 06 1B 7B 99 00 00 27 19 00 38 49 04 1B 05 00 04 01 58 90 31 16 93 01 18 51 2B 26 01 60 28 2C 26 16 16 
      if (mSelectedNum == mMaxSkills) {                                         //0060 : 07 76 00 9A 01 60 28 2C 26 01 18 51 2B 26 16 
        EnableUnselectedSkills(False);                                          //006F : 1B 11 9A 00 00 28 16 
      }
      clickedButton.mSkillSelectionLabelPage.SetVisible(False);                 //0076 : 19 19 00 38 49 04 1B 05 00 04 01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 28 16 
    } else {                                                                    //008F : 06 76 01 
      i = mDefaultSkillCount;                                                   //0092 : 0F 00 A8 CD 04 1B 01 98 15 2B 26 
      while (i < mSelectedNum) {                                                //009D : 07 76 01 96 00 A8 CD 04 1B 01 60 28 2C 26 16 
        if (mSelectedSkills[i] == clickedButton.mIntTag) {                      //00AC : 07 6C 01 9A 1A 00 A8 CD 04 1B 01 E8 BA 2C 26 19 00 38 49 04 1B 05 00 04 01 58 90 31 16 16 
          j = i;                                                                //00CA : 0F 00 78 C9 04 1B 00 A8 CD 04 1B 
          while (j < mSelectedNum - 1) {                                        //00D5 : 07 0B 01 96 00 78 C9 04 1B 93 01 60 28 2C 26 26 16 16 
            mSelectedSkills[j] = mSelectedSkills[j + 1];                        //00E7 : 0F 1A 00 78 C9 04 1B 01 E8 BA 2C 26 1A 92 00 78 C9 04 1B 26 16 01 E8 BA 2C 26 
            ++j;                                                                //0101 : A3 00 78 C9 04 1B 16 
          }
          mSelectedNum--;                                                       //010B : A6 01 60 28 2C 26 16 
          OnSkillSelectionChange(False,clickedButton.mIntTag,mMaxSkills - mSelectedNum);//0112 : 43 60 3D 06 1B 7B 99 00 00 28 19 00 38 49 04 1B 05 00 04 01 58 90 31 16 93 01 18 51 2B 26 01 60 28 2C 26 16 16 
          if (mSelectedNum == mMaxSkills - 1) {                                 //0137 : 07 50 01 9A 01 60 28 2C 26 93 01 18 51 2B 26 26 16 16 
            EnableUnselectedSkills(True);                                       //0149 : 1B 11 9A 00 00 27 16 
          }
          clickedButton.mSkillSelectionLabelPage.SetVisible(True);              //0150 : 19 19 00 38 49 04 1B 05 00 04 01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 27 16 
          goto jl0176;                                                          //0169 : 06 76 01 
        }
        ++i;                                                                    //016C : A3 00 A8 CD 04 1B 16 
      }
    }
    UpdateLabelText();                                                          //0176 : 1C A8 79 06 1B 16 
    return False;                                                               //017C : 04 28 
    //07 92 00 2D 00 20 24 33 26 07 1A 00 9A 01 60 28 2C 26 01 18 51 2B 26 16 04 28 0F 1A 01 60 28 2C 
    //26 01 E8 BA 2C 26 19 00 38 49 04 1B 05 00 04 01 58 90 31 16 A5 01 60 28 2C 26 16 43 60 3D 06 1B 
    //7B 99 00 00 27 19 00 38 49 04 1B 05 00 04 01 58 90 31 16 93 01 18 51 2B 26 01 60 28 2C 26 16 16 
    //07 76 00 9A 01 60 28 2C 26 01 18 51 2B 26 16 1B 11 9A 00 00 28 16 19 19 00 38 49 04 1B 05 00 04 
    //01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 28 16 06 76 01 0F 00 A8 CD 04 1B 01 98 15 2B 26 07 76 01 
    //96 00 A8 CD 04 1B 01 60 28 2C 26 16 07 6C 01 9A 1A 00 A8 CD 04 1B 01 E8 BA 2C 26 19 00 38 49 04 
    //1B 05 00 04 01 58 90 31 16 16 0F 00 78 C9 04 1B 00 A8 CD 04 1B 07 0B 01 96 00 78 C9 04 1B 93 01 
    //60 28 2C 26 26 16 16 0F 1A 00 78 C9 04 1B 01 E8 BA 2C 26 1A 92 00 78 C9 04 1B 26 16 01 E8 BA 2C 
    //26 A3 00 78 C9 04 1B 16 06 D5 00 A6 01 60 28 2C 26 16 43 60 3D 06 1B 7B 99 00 00 28 19 00 38 49 
    //04 1B 05 00 04 01 58 90 31 16 93 01 18 51 2B 26 01 60 28 2C 26 16 16 07 50 01 9A 01 60 28 2C 26 
    //93 01 18 51 2B 26 26 16 16 1B 11 9A 00 00 27 16 19 19 00 38 49 04 1B 05 00 04 01 B8 F5 2C 26 07 
    //00 00 1B 14 98 00 00 27 16 06 76 01 A3 00 A8 CD 04 1B 16 06 9D 00 1C A8 79 06 1B 16 04 28 04 0B 
    //47 
  }


  function SetSkillSelectMode(Game_PlayerPawn playerPawn) {
    local export editinline Game_CharacterStats Stats;
    local int i;
    local int j;
    if (playerPawn != None) {                                                   //0000 : 07 5E 01 77 00 30 79 06 1B 2A 16 
      mPlayerPawn = playerPawn;                                                 //000B : 0F 01 08 0E 05 1B 00 30 79 06 1B 
      Stats = GetPawn().CharacterStats;                                         //0016 : 0F 00 98 9A 07 1B 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 
      if (Stats != None) {                                                      //002B : 07 4B 00 77 00 98 9A 07 1B 2A 16 
        OnCharacterClassChange(Stats.GetCharacterClass());                      //0036 : 1B 0F 9A 00 00 19 00 98 9A 07 1B 06 00 01 1B 59 0C 00 00 16 16 
      }
      i = 0;                                                                    //004B : 0F 00 10 45 06 1B 25 
      while (i < playerPawn.Skills.CharacterSkills.Length) {                    //0052 : 07 14 01 96 00 10 45 06 1B 37 19 19 00 30 79 06 1B 05 00 04 01 08 28 18 11 05 00 00 01 C0 E7 21 11 16 
        j = 0;                                                                  //0074 : 0F 00 28 EC 2C 26 25 
        while (j < 7) {                                                         //007B : 07 0A 01 96 00 28 EC 2C 26 2C 07 16 
          if (mSkillPages[j].GetSkill() == playerPawn.Skills.CharacterSkills[i]) {//0087 : 07 00 01 72 19 10 00 28 EC 2C 26 01 B8 9C 8A 19 06 00 04 1B 90 98 00 00 16 10 00 10 45 06 1B 19 19 00 30 79 06 1B 05 00 04 01 08 28 18 11 05 00 00 01 C0 E7 21 11 16 
            mSkillPages[j].SetVisible(False);                                   //00BE : 19 10 00 28 EC 2C 26 01 B8 9C 8A 19 07 00 00 1B 14 98 00 00 28 16 
            mSkillPages[j].SetEnabled(False);                                   //00D4 : 19 10 00 28 EC 2C 26 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 28 16 
            mSkillPages[j].SetSkill(None);                                      //00EA : 19 10 00 28 EC 2C 26 01 B8 9C 8A 19 07 00 00 1B 74 98 00 00 2A 16 
          }
          ++j;                                                                  //0100 : A3 00 28 EC 2C 26 16 
        }
        i++;                                                                    //010A : A5 00 10 45 06 1B 16 
      }
      mComponentStyle = mComponentStyle & ~Class'GUI_Desktop'.2;                //0114 : 0F 01 80 DC 9D 19 9C 01 80 DC 9D 19 8D 12 20 48 DB 2E 1D 02 00 04 2C 02 16 16 
      mComponentStyle = mComponentStyle | Class'GUI_Desktop'.4;                 //012E : 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 48 DB 2E 1D 02 00 04 2C 04 16 
      mComponentStyle = mComponentStyle | Class'GUI_Desktop'.8;                 //0146 : 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 48 DB 2E 1D 02 00 04 2C 08 16 
    }
    //07 5E 01 77 00 30 79 06 1B 2A 16 0F 01 08 0E 05 1B 00 30 79 06 1B 0F 00 98 9A 07 1B 19 1B 2B 0C 
    //00 00 16 05 00 04 01 08 43 34 0F 07 4B 00 77 00 98 9A 07 1B 2A 16 1B 0F 9A 00 00 19 00 98 9A 07 
    //1B 06 00 01 1B 59 0C 00 00 16 16 0F 00 10 45 06 1B 25 07 14 01 96 00 10 45 06 1B 37 19 19 00 30 
    //79 06 1B 05 00 04 01 08 28 18 11 05 00 00 01 C0 E7 21 11 16 0F 00 28 EC 2C 26 25 07 0A 01 96 00 
    //28 EC 2C 26 2C 07 16 07 00 01 72 19 10 00 28 EC 2C 26 01 B8 9C 8A 19 06 00 04 1B 90 98 00 00 16 
    //10 00 10 45 06 1B 19 19 00 30 79 06 1B 05 00 04 01 08 28 18 11 05 00 00 01 C0 E7 21 11 16 19 10 
    //00 28 EC 2C 26 01 B8 9C 8A 19 07 00 00 1B 14 98 00 00 28 16 19 10 00 28 EC 2C 26 01 B8 9C 8A 19 
    //07 00 00 1B 5F 32 00 00 28 16 19 10 00 28 EC 2C 26 01 B8 9C 8A 19 07 00 00 1B 74 98 00 00 2A 16 
    //A3 00 28 EC 2C 26 16 06 7B 00 A5 00 10 45 06 1B 16 06 52 00 0F 01 80 DC 9D 19 9C 01 80 DC 9D 19 
    //8D 12 20 48 DB 2E 1D 02 00 04 2C 02 16 16 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 48 DB 2E 1D 
    //02 00 04 2C 04 16 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 48 DB 2E 1D 02 00 04 2C 08 16 04 0B 
    //47 
  }


  function int GetSkillsLeft() {
    return mMaxSkills - mSelectedNum;                                           //0000 : 04 93 01 18 51 2B 26 01 60 28 2C 26 16 
    //04 93 01 18 51 2B 26 01 60 28 2C 26 16 04 0B 47 
  }


  final function DeselectSkillPage(int Index) {
    mSkillPages[Index].ClickSkillHandler(mSkillPages[Index].mIconButton,False); //0000 : 19 10 00 78 6F 06 1B 01 B8 9C 8A 19 1B 00 04 1B 64 99 00 00 19 10 00 78 6F 06 1B 01 B8 9C 8A 19 05 00 04 01 B8 5E 2B 26 28 16 
    //19 10 00 78 6F 06 1B 01 B8 9C 8A 19 1B 00 04 1B 64 99 00 00 19 10 00 78 6F 06 1B 01 B8 9C 8A 19 
    //05 00 04 01 B8 5E 2B 26 28 16 04 0B 47 
  }


  final function UpdateLabelText() {
    mTitleBar.SetTitle(mSkillsRemainingText[mMaxSkills - mSelectedNum].Text);   //0000 : 19 01 D8 63 9E 19 1D 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 10 93 01 18 51 2B 26 01 60 28 2C 26 16 01 78 1F 33 26 16 
    //19 01 D8 63 9E 19 1D 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 10 93 01 18 51 2B 26 01 60 28 2C 26 16 
    //01 78 1F 33 26 16 04 0B 47 
  }


  function OnCharacterClassChange(byte aSelectedArcheType) {
    local int i;
    local int j;
    if (mPlayerPawn == None) {                                                  //0000 : 07 19 00 72 01 08 0E 05 1B 2A 16 
      j = mDefaultSkillCount;                                                   //000B : 0F 00 E8 29 8A 19 01 98 15 2B 26 
    } else {                                                                    //0016 : 06 20 00 
      j = 0;                                                                    //0019 : 0F 00 E8 29 8A 19 25 
    }
    i = 0;                                                                      //0020 : 0F 00 E8 7D 04 1B 25 
    while (i < mAvailableSkills.Length) {                                       //0027 : 07 FE 00 96 00 E8 7D 04 1B 37 01 A8 CA 2B 26 16 
      if (mAvailableSkills[i].MinSkillTier == 1
        && mAvailableSkills[i].SupportsClass(aSelectedArcheType)) {//0037 : 07 F4 00 82 9A 19 10 00 E8 7D 04 1B 01 A8 CA 2B 26 05 00 04 01 F0 B2 20 11 26 16 18 1B 00 19 10 00 E8 7D 04 1B 01 A8 CA 2B 26 0B 00 04 1C 88 9F 20 11 00 68 20 33 26 16 16 
        if (j <= 7) {                                                           //0070 : 07 F1 00 98 00 E8 29 8A 19 2C 07 16 
          mSkillPages[j].SetSkill(mAvailableSkills[i]);                         //007C : 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 11 00 00 1B 74 98 00 00 10 00 E8 7D 04 1B 01 A8 CA 2B 26 16 
          mSkillPages[j].SetEnabled(True);                                      //009C : 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 27 16 
          mSkillPages[j].SetVisible(True);                                      //00B2 : 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 00 1B 14 98 00 00 27 16 
          mSkillPages[j].mSkillSelectionLabelPage.SetVisible(True);             //00C8 : 19 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 05 00 04 01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 27 16 
          j++;                                                                  //00E7 : A5 00 E8 29 8A 19 16 
          goto jl00F4;                                                          //00EE : 06 F4 00 
        }
        break;                                                                  //00F1 : 06 FE 00 
      }
      ++i;                                                                      //00F4 : A3 00 E8 7D 04 1B 16 
    }
    j = j;                                                                      //00FE : 0F 00 E8 29 8A 19 00 E8 29 8A 19 
    while (j < 7) {                                                             //0109 : 07 80 01 96 00 E8 29 8A 19 2C 07 16 
      mSkillPages[j].SetSkill(None);                                            //0115 : 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 00 1B 74 98 00 00 2A 16 
      mSkillPages[j].SetEnabled(False);                                         //012B : 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 28 16 
      mSkillPages[j].SetVisible(False);                                         //0141 : 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 00 1B 14 98 00 00 28 16 
      mSkillPages[j].mSkillSelectionLabelPage.SetVisible(False);                //0157 : 19 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 05 00 04 01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 28 16 
      ++j;                                                                      //0176 : A3 00 E8 29 8A 19 16 
    }
    while (mSelectedNum > mDefaultSkillCount) {                                 //0180 : 07 A6 01 97 01 60 28 2C 26 01 98 15 2B 26 16 
      DeselectSkillPage(mSelectedSkills[mSelectedNum - 1]);                     //018F : 1C C8 6E 06 1B 1A 93 01 60 28 2C 26 26 16 01 E8 BA 2C 26 16 
    }
    //07 19 00 72 01 08 0E 05 1B 2A 16 0F 00 E8 29 8A 19 01 98 15 2B 26 06 20 00 0F 00 E8 29 8A 19 25 
    //0F 00 E8 7D 04 1B 25 07 FE 00 96 00 E8 7D 04 1B 37 01 A8 CA 2B 26 16 07 F4 00 82 9A 19 10 00 E8 
    //7D 04 1B 01 A8 CA 2B 26 05 00 04 01 F0 B2 20 11 26 16 18 1B 00 19 10 00 E8 7D 04 1B 01 A8 CA 2B 
    //26 0B 00 04 1C 88 9F 20 11 00 68 20 33 26 16 16 07 F1 00 98 00 E8 29 8A 19 2C 07 16 19 10 00 E8 
    //29 8A 19 01 B8 9C 8A 19 11 00 00 1B 74 98 00 00 10 00 E8 7D 04 1B 01 A8 CA 2B 26 16 19 10 00 E8 
    //29 8A 19 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 27 16 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 
    //00 1B 14 98 00 00 27 16 19 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 05 00 04 01 B8 F5 2C 26 07 00 00 
    //1B 14 98 00 00 27 16 A5 00 E8 29 8A 19 16 06 F4 00 06 FE 00 A3 00 E8 7D 04 1B 16 06 27 00 0F 00 
    //E8 29 8A 19 00 E8 29 8A 19 07 80 01 96 00 E8 29 8A 19 2C 07 16 19 10 00 E8 29 8A 19 01 B8 9C 8A 
    //19 07 00 00 1B 74 98 00 00 2A 16 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 28 
    //16 19 10 00 E8 29 8A 19 01 B8 9C 8A 19 07 00 00 1B 14 98 00 00 28 16 19 19 10 00 E8 29 8A 19 01 
    //B8 9C 8A 19 05 00 04 01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 28 16 A3 00 E8 29 8A 19 16 06 09 01 
    //07 A6 01 97 01 60 28 2C 26 01 98 15 2B 26 16 1C C8 6E 06 1B 1A 93 01 60 28 2C 26 26 16 01 E8 BA 
    //2C 26 16 06 80 01 04 0B 47 
  }


  function array<FSkill_Type> GetSelectedSkills() {
    local array<FSkill_Type> Result;
    local int i;
    i = 0;                                                                      //0000 : 0F 00 B0 D3 04 1B 25 
    while (i < mMaxSkills) {                                                    //0007 : 07 4C 00 96 00 B0 D3 04 1B 01 18 51 2B 26 16 
      Result[i] = FSkill_Type(mSkillPages[mSelectedSkills[i]].GetObject());     //0016 : 0F 10 00 B0 D3 04 1B 00 70 69 06 1B 2E 40 36 5D 01 19 10 1A 00 B0 D3 04 1B 01 E8 BA 2C 26 01 B8 9C 8A 19 06 00 04 1B 65 98 00 00 16 
      i++;                                                                      //0042 : A5 00 B0 D3 04 1B 16 
    }
    return Result;                                                              //004C : 04 00 70 69 06 1B 
    //0F 00 B0 D3 04 1B 25 07 4C 00 96 00 B0 D3 04 1B 01 18 51 2B 26 16 0F 10 00 B0 D3 04 1B 00 70 69 
    //06 1B 2E 40 36 5D 01 19 10 1A 00 B0 D3 04 1B 01 E8 BA 2C 26 01 B8 9C 8A 19 06 00 04 1B 65 98 00 
    //00 16 A5 00 B0 D3 04 1B 16 06 07 00 04 00 70 69 06 1B 04 0B 47 
  }


  event Initialize() {
    local int i;
    Super.Initialize();                                                         //0000 : 1C 48 DC 2A 26 16 
    SetIcon("header_skills","SBGuiTX.CC_Styles","CC_Styles");                   //0006 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 73 6B 69 6C 6C 73 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    mButtonPage.SetVisible(False);                                              //0039 : 19 01 D8 FA 2C 26 07 00 00 1B 14 98 00 00 28 16 
    mMainPane.mWidth = 392.00000000;                                            //0049 : 0F 19 01 88 51 EC 25 05 00 04 01 60 87 31 16 1E 00 00 C4 43 
    mMainPane.mHeight = 519.00000000;                                           //005D : 0F 19 01 88 51 EC 25 05 00 04 01 40 88 31 16 1E 00 C0 01 44 
    mMainPane.Invalidate();                                                     //0071 : 19 01 88 51 EC 25 06 00 00 1B 1D 98 00 00 16 
    i = 0;                                                                      //0080 : 0F 00 F8 DC 2A 26 25 
    while (i < 7) {                                                             //0087 : 07 6A 01 96 00 F8 DC 2A 26 2C 07 16 
      mSkillPages[i] = HUD_CC_SkillButton(mMainPane.CreatePage("HUD_CC_SkillButton",0,0,0,i * 72,400,72));//0093 : 0F 10 00 F8 DC 2A 26 01 B8 9C 8A 19 2E F8 37 31 1D 19 01 88 51 EC 25 2D 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 53 6B 69 6C 6C 42 75 74 74 6F 6E 00 25 25 25 90 00 F8 DC 2A 26 2C 48 16 1D 90 01 00 00 2C 48 16 
      mSkillPages[i].mIntTag = i;                                               //00DA : 0F 19 10 00 F8 DC 2A 26 01 B8 9C 8A 19 05 00 04 01 58 90 31 16 00 F8 DC 2A 26 
      if (i > 1) {                                                              //00F4 : 07 19 01 97 00 F8 DC 2A 26 26 16 
        mSkillPages[i].__OnCheck__Delegate = OnSkillSelect;                     //00FF : 45 19 10 00 F8 DC 2A 26 01 B8 9C 8A 19 05 00 08 01 D0 7D 06 1B 44 BD 98 00 00 
      }
      mSkillPages[i].mSkillSelectionLabel.SetText(Class'SBGuiStrings'.default.Learnable.Text);//0119 : 19 19 10 00 F8 DC 2A 26 01 B8 9C 8A 19 05 00 04 01 C0 53 34 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 72 99 19 16 
      mSkillPages[i].SetEnabled(False);                                         //014A : 19 10 00 F8 DC 2A 26 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 28 16 
      i++;                                                                      //0160 : A5 00 F8 DC 2A 26 16 
    }
    Class'FSkill_Type'.static.GetAllSkills(mAvailableSkills);                   //016A : 12 20 40 36 5D 01 0B 00 00 1C B0 9D 20 11 01 A8 CA 2B 26 16 
    mDefaultSkillCount = 0;                                                     //017E : 0F 01 98 15 2B 26 25 
    i = 0;                                                                      //0185 : 0F 00 F8 DC 2A 26 25 
    while (i < mAvailableSkills.Length) {                                       //018C : 07 31 02 96 00 F8 DC 2A 26 37 01 A8 CA 2B 26 16 
      if (mAvailableSkills[i].MinSkillTier == 1
        && mAvailableSkills[i].SupportsClass(31)) {//019C : 07 27 02 82 9A 19 10 00 F8 DC 2A 26 01 A8 CA 2B 26 05 00 04 01 F0 B2 20 11 26 16 18 18 00 19 10 00 F8 DC 2A 26 01 A8 CA 2B 26 08 00 04 1C 88 9F 20 11 24 1F 16 16 
        if (mDefaultSkillCount < 5) {                                           //01D2 : 07 27 02 96 01 98 15 2B 26 2C 05 16 
          mSkillPages[mDefaultSkillCount].SetSkill(mAvailableSkills[i]);        //01DE : 19 10 01 98 15 2B 26 01 B8 9C 8A 19 11 00 00 1B 74 98 00 00 10 00 F8 DC 2A 26 01 A8 CA 2B 26 16 
          mSkillPages[mDefaultSkillCount].mSkillSelectionLabelPage.SetVisible(False);//01FE : 19 19 10 01 98 15 2B 26 01 B8 9C 8A 19 05 00 04 01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 28 16 
          mDefaultSkillCount++;                                                 //021D : A5 01 98 15 2B 26 16 
          goto jl0227;                                                          //0224 : 06 27 02 
        }
      }
      ++i;                                                                      //0227 : A3 00 F8 DC 2A 26 16 
    }
    i = 0;                                                                      //0231 : 0F 00 F8 DC 2A 26 25 
    while (i < mDefaultSkillCount) {                                            //0238 : 07 62 02 96 00 F8 DC 2A 26 01 98 15 2B 26 16 
      mSelectedSkills[i] = i;                                                   //0247 : 0F 1A 00 F8 DC 2A 26 01 E8 BA 2C 26 00 F8 DC 2A 26 
      ++i;                                                                      //0258 : A3 00 F8 DC 2A 26 16 
    }
    mSelectedNum = mDefaultSkillCount;                                          //0262 : 0F 01 60 28 2C 26 01 98 15 2B 26 
    mMaxSkills = 5;                                                             //026D : 0F 01 18 51 2B 26 2C 05 
    UpdateLabelText();                                                          //0275 : 1C A8 79 06 1B 16 
    //1C 48 DC 2A 26 16 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 73 6B 69 6C 6C 73 00 1F 53 42 47 75 69 
    //54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 19 01 D8 FA 2C 26 07 
    //00 00 1B 14 98 00 00 28 16 0F 19 01 88 51 EC 25 05 00 04 01 60 87 31 16 1E 00 00 C4 43 0F 19 01 
    //88 51 EC 25 05 00 04 01 40 88 31 16 1E 00 C0 01 44 19 01 88 51 EC 25 06 00 00 1B 1D 98 00 00 16 
    //0F 00 F8 DC 2A 26 25 07 6A 01 96 00 F8 DC 2A 26 2C 07 16 0F 10 00 F8 DC 2A 26 01 B8 9C 8A 19 2E 
    //F8 37 31 1D 19 01 88 51 EC 25 2D 00 04 1B 16 98 00 00 1F 48 55 44 5F 43 43 5F 53 6B 69 6C 6C 42 
    //75 74 74 6F 6E 00 25 25 25 90 00 F8 DC 2A 26 2C 48 16 1D 90 01 00 00 2C 48 16 0F 19 10 00 F8 DC 
    //2A 26 01 B8 9C 8A 19 05 00 04 01 58 90 31 16 00 F8 DC 2A 26 07 19 01 97 00 F8 DC 2A 26 26 16 45 
    //19 10 00 F8 DC 2A 26 01 B8 9C 8A 19 05 00 08 01 D0 7D 06 1B 44 BD 98 00 00 19 19 10 00 F8 DC 2A 
    //26 01 B8 9C 8A 19 05 00 04 01 C0 53 34 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 00 72 99 19 16 19 10 00 F8 DC 2A 26 01 B8 9C 8A 19 07 00 00 1B 5F 32 00 00 28 16 
    //A5 00 F8 DC 2A 26 16 06 87 00 12 20 40 36 5D 01 0B 00 00 1C B0 9D 20 11 01 A8 CA 2B 26 16 0F 01 
    //98 15 2B 26 25 0F 00 F8 DC 2A 26 25 07 31 02 96 00 F8 DC 2A 26 37 01 A8 CA 2B 26 16 07 27 02 82 
    //9A 19 10 00 F8 DC 2A 26 01 A8 CA 2B 26 05 00 04 01 F0 B2 20 11 26 16 18 18 00 19 10 00 F8 DC 2A 
    //26 01 A8 CA 2B 26 08 00 04 1C 88 9F 20 11 24 1F 16 16 07 27 02 96 01 98 15 2B 26 2C 05 16 19 10 
    //01 98 15 2B 26 01 B8 9C 8A 19 11 00 00 1B 74 98 00 00 10 00 F8 DC 2A 26 01 A8 CA 2B 26 16 19 19 
    //10 01 98 15 2B 26 01 B8 9C 8A 19 05 00 04 01 B8 F5 2C 26 07 00 00 1B 14 98 00 00 28 16 A5 01 98 
    //15 2B 26 16 06 27 02 A3 00 F8 DC 2A 26 16 06 8C 01 0F 00 F8 DC 2A 26 25 07 62 02 96 00 F8 DC 2A 
    //26 01 98 15 2B 26 16 0F 1A 00 F8 DC 2A 26 01 E8 BA 2C 26 00 F8 DC 2A 26 A3 00 F8 DC 2A 26 16 06 
    //38 02 0F 01 60 28 2C 26 01 98 15 2B 26 0F 01 18 51 2B 26 2C 05 1C A8 79 06 1B 16 04 0B 47 
  }



