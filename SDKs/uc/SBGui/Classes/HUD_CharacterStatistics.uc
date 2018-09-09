//==============================================================================
//  HUD_CharacterStatistics
//==============================================================================

class HUD_CharacterStatistics extends GUI_Window
    dependsOn(GED_Editor,GED_PawnPage,GUI_Label,Game_Pawn,Game_PlayerStats,Game_PlayerPawn,GUI_Component)
    Transient
    Config(User)
  ;

  const HSB_DEFINITION_FILE =  "CharacterStatistics\\CharacterStatistics.txt";
  const ATTRIBUTE_PAGE_COUNT =  3;
  const FOCUS_INDEX =  2;
  const MIND_INDEX =  1;
  const BODY_INDEX =  0;
  enum CharacterStatistics_State {
    CS_NONE ,
    CS_UPDATING 
  };

  struct PlusMinusButtonTuple {
      var GUI_Button plusButton;
      var GUI_Button minusButton;

  };


  var private PlusMinusButtonTuple mChangeAttributeButtons[3];
  var private GUI_Button mAcceptChangesButton;
  var private GUI_Label mValueLabels[3];
  var private GUI_Label mAddPointsLabel;
  var private int mValues[3];
  var private int mMaxAvailableAttributePoints;
  var private int mAvailableAttributePoints;
  var private int mTextChanges;
  var private int mPrevBody;
  var private int mPrevMind;
  var private int mPrevFocus;
  var private GED_Editor mEditor;
  var private GUI_Component mPawnPage;
  var private byte mState;
  var (null);


  function CheckDefaults(GED_Editor Editor) {
    local GUI_Component pawnPage;
    pawnPage = Editor.RetrieveComponent("CharacterStatsPawnPage");              //0000 : 0F 00 E8 F9 06 1B 19 00 88 AA 33 26 1E 00 04 1B 15 98 00 00 1F 43 68 61 72 61 63 74 65 72 53 74 61 74 73 50 61 77 6E 50 61 67 65 00 16 
    if (GED_PawnPage(pawnPage) != None) {                                       //002D : 07 5A 00 77 2E D0 1A 32 1D 00 E8 F9 06 1B 2A 16 
      GED_PawnPage(pawnPage).SetObject(GetPawn());                              //003D : 19 2E D0 1A 32 1D 00 E8 F9 06 1B 0C 00 00 1B 4C 97 00 00 1B 2B 0C 00 00 16 16 
    } else {                                                                    //0057 : 06 69 00 
      Editor.DumpRegistry();                                                    //005A : 19 00 88 AA 33 26 06 00 00 1B 61 99 00 00 16 
    }
    //0F 00 E8 F9 06 1B 19 00 88 AA 33 26 1E 00 04 1B 15 98 00 00 1F 43 68 61 72 61 63 74 65 72 53 74 
    //61 74 73 50 61 77 6E 50 61 67 65 00 16 07 5A 00 77 2E D0 1A 32 1D 00 E8 F9 06 1B 2A 16 19 2E D0 
    //1A 32 1D 00 E8 F9 06 1B 0C 00 00 1B 4C 97 00 00 1B 2B 0C 00 00 16 16 06 69 00 19 00 88 AA 33 26 
    //06 00 00 1B 61 99 00 00 16 04 0B 47 
  }


  function UpdateValues() {
    local int i;
    local export editinline Game_PlayerStats playerStats;
    local string Message;
    Message = Class'SBGuiStrings'.default.Distribute_your_remaining_attribute_points_POINTS_left.Text;//0000 : 0F 00 B8 F5 06 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 6E 2F 16 
    static.ReplaceText(Message,"[POINTS]",""
      $ string(mAvailableAttributePoints));//0019 : 1C 30 80 69 0F 00 B8 F5 06 1B 1F 5B 50 4F 49 4E 54 53 5D 00 70 1F 00 39 53 01 A8 14 2B 26 16 16 
    mAddPointsLabel.SetText(Message);                                           //0039 : 19 01 58 4B 08 1B 0B 00 00 1B 13 98 00 00 00 B8 F5 06 1B 16 
    if (mAvailableAttributePoints > 0) {                                        //004D : 07 8B 00 97 01 A8 14 2B 26 25 16 
      mTitleBar.SetTitle(Class'SBGuiStrings'.default.Character_Statistics.Text
        @ "+"
        $ string(mAvailableAttributePoints));//0058 : 19 01 D8 63 9E 19 27 00 00 1B 0A 2C 00 00 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 94 97 19 1F 2B 00 16 39 53 01 A8 14 2B 26 16 16 
    } else {                                                                    //0088 : 06 AD 00 
      mTitleBar.SetTitle(Class'SBGuiStrings'.default.Character_Statistics.Text);//008B : 19 01 D8 63 9E 19 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 94 97 19 16 
    }
    playerStats = Game_PlayerStats(GetPawn().CharacterStats);                   //00AD : 0F 00 60 A3 05 1B 2E 10 A3 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 
    mValueLabels[0].SetText(string(playerStats.mRecord.Body + mValues[0]));     //00C7 : 19 1A 25 01 38 23 2B 26 24 00 00 1B 13 98 00 00 39 53 92 36 A8 93 1F 11 19 00 60 A3 05 1B 05 00 68 01 78 2D 34 0F 1A 25 01 70 26 8A 19 16 16 
    mValueLabels[1].SetText(string(playerStats.mRecord.Mind + mValues[1]));     //00F6 : 19 1A 26 01 38 23 2B 26 24 00 00 1B 13 98 00 00 39 53 92 36 20 94 1F 11 19 00 60 A3 05 1B 05 00 68 01 78 2D 34 0F 1A 26 01 70 26 8A 19 16 16 
    mValueLabels[2].SetText(string(playerStats.mRecord.Focus + mValues[2]));    //0125 : 19 1A 2C 02 01 38 23 2B 26 25 00 00 1B 13 98 00 00 39 53 92 36 98 94 1F 11 19 00 60 A3 05 1B 05 00 68 01 78 2D 34 0F 1A 2C 02 01 70 26 8A 19 16 16 
    i = 0;                                                                      //0156 : 0F 00 A0 27 04 1B 25 
    while (i < 3) {                                                             //015D : 07 C1 01 96 00 A0 27 04 1B 2C 03 16 
      if (mValues[i] > 0) {                                                     //0169 : 07 9A 01 97 1A 00 A0 27 04 1B 01 70 26 8A 19 25 16 
        mValueLabels[i].SetColor(182,172,224,255);                              //017A : 19 1A 00 A0 27 04 1B 01 38 23 2B 26 0E 00 00 1B 19 98 00 00 2C B6 2C AC 2C E0 2C FF 16 
      } else {                                                                  //0197 : 06 B7 01 
        mValueLabels[i].SetColor(255,255,255,255);                              //019A : 19 1A 00 A0 27 04 1B 01 38 23 2B 26 0E 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 2C FF 16 
      }
      i++;                                                                      //01B7 : A5 00 A0 27 04 1B 16 
    }
    //0F 00 B8 F5 06 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 6E 2F 16 1C 30 80 69 0F 00 B8 
    //F5 06 1B 1F 5B 50 4F 49 4E 54 53 5D 00 70 1F 00 39 53 01 A8 14 2B 26 16 16 19 01 58 4B 08 1B 0B 
    //00 00 1B 13 98 00 00 00 B8 F5 06 1B 16 07 8B 00 97 01 A8 14 2B 26 25 16 19 01 D8 63 9E 19 27 00 
    //00 1B 0A 2C 00 00 70 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 94 97 19 1F 2B 00 16 39 
    //53 01 A8 14 2B 26 16 16 06 AD 00 19 01 D8 63 9E 19 19 00 00 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 60 94 97 19 16 0F 00 60 A3 05 1B 2E 10 A3 5F 01 19 1B 2B 0C 00 00 16 05 
    //00 04 01 08 43 34 0F 19 1A 25 01 38 23 2B 26 24 00 00 1B 13 98 00 00 39 53 92 36 A8 93 1F 11 19 
    //00 60 A3 05 1B 05 00 68 01 78 2D 34 0F 1A 25 01 70 26 8A 19 16 16 19 1A 26 01 38 23 2B 26 24 00 
    //00 1B 13 98 00 00 39 53 92 36 20 94 1F 11 19 00 60 A3 05 1B 05 00 68 01 78 2D 34 0F 1A 26 01 70 
    //26 8A 19 16 16 19 1A 2C 02 01 38 23 2B 26 25 00 00 1B 13 98 00 00 39 53 92 36 98 94 1F 11 19 00 
    //60 A3 05 1B 05 00 68 01 78 2D 34 0F 1A 2C 02 01 70 26 8A 19 16 16 0F 00 A0 27 04 1B 25 07 C1 01 
    //96 00 A0 27 04 1B 2C 03 16 07 9A 01 97 1A 00 A0 27 04 1B 01 70 26 8A 19 25 16 19 1A 00 A0 27 04 
    //1B 01 38 23 2B 26 0E 00 00 1B 19 98 00 00 2C B6 2C AC 2C E0 2C FF 16 06 B7 01 19 1A 00 A0 27 04 
    //1B 01 38 23 2B 26 0E 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 2C FF 16 A5 00 A0 27 04 1B 16 06 5D 
    //01 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 28 AC 33 26 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 50 00 9A 00 28 AC 33 26 12 20 00 68 D7 00 01 00 04 26 16 
      CheckDefaults(GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45)));//001F : 1B A2 98 00 00 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 16 
      InvalidateFunctionPtrs();                                                 //0044 : 1B CE 96 00 00 16 
      UpdateValues();                                                           //004A : 1B 48 99 00 00 16 
    }
    //1C 20 7A 9E 19 00 28 AC 33 26 16 07 50 00 9A 00 28 AC 33 26 12 20 00 68 D7 00 01 00 04 26 16 1B 
    //A2 98 00 00 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 
    //2C 2D 16 16 1B CE 96 00 00 16 1B 48 99 00 00 16 04 0B 47 
  }


  function SetAttributePoints(int aMaxPoints) {
    mMaxAvailableAttributePoints = aMaxPoints;                                  //0000 : 0F 01 F8 7C 04 1B 00 80 B1 33 26 
    UpdateAttributePoints(aMaxPoints);                                          //000B : 1B 55 99 00 00 00 80 B1 33 26 16 
    //0F 01 F8 7C 04 1B 00 80 B1 33 26 1B 55 99 00 00 00 80 B1 33 26 16 04 0B 47 
  }


  function bool UpdateValueLabel(GUI_Button aButton,int delta) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 08 F1 2C 26 25 
    while (i < 3) {                                                             //0007 : 07 85 00 96 00 08 F1 2C 26 2C 03 16 
      if (mChangeAttributeButtons[i].minusButton == aButton
        || mChangeAttributeButtons[i].plusButton == aButton) {//0013 : 07 7B 00 84 72 36 20 D2 2C 26 1A 00 08 F1 2C 26 01 40 4F 2C 26 00 D8 B3 33 26 16 18 18 00 72 36 88 E7 2C 26 1A 00 08 F1 2C 26 01 40 4F 2C 26 00 D8 B3 33 26 16 16 
        if (delta < 0) {                                                        //0049 : 07 67 00 96 00 F8 B1 33 26 25 16 
          if (mValues[i] == 0) {                                                //0054 : 07 67 00 9A 1A 00 08 F1 2C 26 01 70 26 8A 19 25 16 
            return False;                                                       //0065 : 04 28 
          }
        }
        mValues[i] += delta;                                                    //0067 : A1 1A 00 08 F1 2C 26 01 70 26 8A 19 00 F8 B1 33 26 16 
        return True;                                                            //0079 : 04 27 
      }
      i++;                                                                      //007B : A5 00 08 F1 2C 26 16 
    }
    return False;                                                               //0085 : 04 28 
    //0F 00 08 F1 2C 26 25 07 85 00 96 00 08 F1 2C 26 2C 03 16 07 7B 00 84 72 36 20 D2 2C 26 1A 00 08 
    //F1 2C 26 01 40 4F 2C 26 00 D8 B3 33 26 16 18 18 00 72 36 88 E7 2C 26 1A 00 08 F1 2C 26 01 40 4F 
    //2C 26 00 D8 B3 33 26 16 16 07 67 00 96 00 F8 B1 33 26 25 16 07 67 00 9A 1A 00 08 F1 2C 26 01 70 
    //26 8A 19 25 16 04 28 A1 1A 00 08 F1 2C 26 01 70 26 8A 19 00 F8 B1 33 26 16 04 27 A5 00 08 F1 2C 
    //26 16 06 07 00 04 28 04 0B 47 
  }


  function UpdateAttributePoints(int aMaxPoints) {
    local string Message;
    mAvailableAttributePoints = aMaxPoints;                                     //0000 : 0F 01 A8 14 2B 26 00 28 1B 34 26 
    Message = Class'SBGuiStrings'.default.Distribute_your_remaining_attribute_points_POINTS_left.Text;//000B : 0F 00 F0 EE 06 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 6E 2F 16 
    static.ReplaceText(Message,"[POINTS]",""
      $ string(mAvailableAttributePoints));//0024 : 1C 30 80 69 0F 00 F0 EE 06 1B 1F 5B 50 4F 49 4E 54 53 5D 00 70 1F 00 39 53 01 A8 14 2B 26 16 16 
    mAddPointsLabel.SetText(Message);                                           //0044 : 19 01 58 4B 08 1B 0B 00 00 1B 13 98 00 00 00 F0 EE 06 1B 16 
    mAddPointsLabel.SetVisible(mMaxAvailableAttributePoints > 0);               //0058 : 19 01 58 4B 08 1B 0E 00 00 1B 14 98 00 00 97 01 F8 7C 04 1B 25 16 16 
    mAcceptChangesButton.SetVisible(mMaxAvailableAttributePoints > 0);          //006F : 19 01 38 ED 32 26 0E 00 00 1B 14 98 00 00 97 01 F8 7C 04 1B 25 16 16 
    mAcceptChangesButton.SetEnabled(mAvailableAttributePoints < mMaxAvailableAttributePoints);//0086 : 19 01 38 ED 32 26 12 00 00 1B 5F 32 00 00 96 01 A8 14 2B 26 01 F8 7C 04 1B 16 16 
    UpdateValues();                                                             //00A1 : 1B 48 99 00 00 16 
    //0F 01 A8 14 2B 26 00 28 1B 34 26 0F 00 F0 EE 06 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //50 6E 2F 16 1C 30 80 69 0F 00 F0 EE 06 1B 1F 5B 50 4F 49 4E 54 53 5D 00 70 1F 00 39 53 01 A8 14 
    //2B 26 16 16 19 01 58 4B 08 1B 0B 00 00 1B 13 98 00 00 00 F0 EE 06 1B 16 19 01 58 4B 08 1B 0E 00 
    //00 1B 14 98 00 00 97 01 F8 7C 04 1B 25 16 16 19 01 38 ED 32 26 0E 00 00 1B 14 98 00 00 97 01 F8 
    //7C 04 1B 25 16 16 19 01 38 ED 32 26 12 00 00 1B 5F 32 00 00 96 01 A8 14 2B 26 01 F8 7C 04 1B 16 
    //16 1B 48 99 00 00 16 04 0B 47 
  }


  function bool OnPlusClick(GUI_Component clickedButton) {
    if (mAvailableAttributePoints > 0) {                                        //0000 : 07 31 00 97 01 A8 14 2B 26 25 16 
      if (UpdateValueLabel(GUI_Button(clickedButton),1)) {                      //000B : 07 31 00 1B F3 99 00 00 2E 78 F0 2E 1D 00 B0 1A 34 26 26 16 
        mAvailableAttributePoints--;                                            //001F : A6 01 A8 14 2B 26 16 
        UpdateAttributePoints(mAvailableAttributePoints);                       //0026 : 1B 55 99 00 00 01 A8 14 2B 26 16 
      }
    }
    return True;                                                                //0031 : 04 27 
    //07 31 00 97 01 A8 14 2B 26 25 16 07 31 00 1B F3 99 00 00 2E 78 F0 2E 1D 00 B0 1A 34 26 26 16 A6 
    //01 A8 14 2B 26 16 1B 55 99 00 00 01 A8 14 2B 26 16 04 27 04 0B 47 
  }


  function bool OnMinusClick(GUI_Component clickedButton) {
    if (mAvailableAttributePoints < mMaxAvailableAttributePoints) {             //0000 : 07 39 00 96 01 A8 14 2B 26 01 F8 7C 04 1B 16 
      if (UpdateValueLabel(GUI_Button(clickedButton),-1)) {                     //000F : 07 39 00 1B F3 99 00 00 2E 78 F0 2E 1D 00 88 19 34 26 1D FF FF FF FF 16 
        mAvailableAttributePoints++;                                            //0027 : A5 01 A8 14 2B 26 16 
        UpdateAttributePoints(mAvailableAttributePoints);                       //002E : 1B 55 99 00 00 01 A8 14 2B 26 16 
      }
    }
    return True;                                                                //0039 : 04 27 
    //07 39 00 96 01 A8 14 2B 26 01 F8 7C 04 1B 16 07 39 00 1B F3 99 00 00 2E 78 F0 2E 1D 00 88 19 34 
    //26 1D FF FF FF FF 16 A5 01 A8 14 2B 26 16 1B 55 99 00 00 01 A8 14 2B 26 16 04 27 04 0B 47 
  }


  function ShowPointDistribution(bool aShow) {
    local int i;
    mAddPointsLabel.SetVisible(aShow);                                          //0000 : 19 01 58 4B 08 1B 0C 00 00 1B 14 98 00 00 2D 00 F0 98 05 1B 16 
    mAcceptChangesButton.SetVisible(aShow);                                     //0015 : 19 01 38 ED 32 26 0C 00 00 1B 14 98 00 00 2D 00 F0 98 05 1B 16 
    i = 0;                                                                      //002A : 0F 00 C8 34 8A 19 25 
    while (i < 3) {                                                             //0031 : 07 87 00 96 00 C8 34 8A 19 2C 03 16 
      mChangeAttributeButtons[i].minusButton.SetVisible(aShow);                 //003D : 19 36 20 D2 2C 26 1A 00 C8 34 8A 19 01 40 4F 2C 26 0C 00 00 1B 14 98 00 00 2D 00 F0 98 05 1B 16 
      mChangeAttributeButtons[i].plusButton.SetVisible(aShow);                  //005D : 19 36 88 E7 2C 26 1A 00 C8 34 8A 19 01 40 4F 2C 26 0C 00 00 1B 14 98 00 00 2D 00 F0 98 05 1B 16 
      i++;                                                                      //007D : A5 00 C8 34 8A 19 16 
    }
    //19 01 58 4B 08 1B 0C 00 00 1B 14 98 00 00 2D 00 F0 98 05 1B 16 19 01 38 ED 32 26 0C 00 00 1B 14 
    //98 00 00 2D 00 F0 98 05 1B 16 0F 00 C8 34 8A 19 25 07 87 00 96 00 C8 34 8A 19 2C 03 16 19 36 20 
    //D2 2C 26 1A 00 C8 34 8A 19 01 40 4F 2C 26 0C 00 00 1B 14 98 00 00 2D 00 F0 98 05 1B 16 19 36 88 
    //E7 2C 26 1A 00 C8 34 8A 19 01 40 4F 2C 26 0C 00 00 1B 14 98 00 00 2D 00 F0 98 05 1B 16 A5 00 C8 
    //34 8A 19 16 06 31 00 04 0B 47 
  }


  function bool AcceptChanges(GUI_Component clickedButton) {
    local int Body;
    local int Mind;
    local int Focus;
    local export editinline Game_PlayerStats playerStats;
    OnFinalizeAttributePoints(mValues[0],mValues[1],mValues[2]);                //0000 : 43 F8 16 34 26 96 9A 00 00 1A 25 01 70 26 8A 19 1A 26 01 70 26 8A 19 1A 2C 02 01 70 26 8A 19 16 
    if (Game_PlayerPawn(GetPawn()) != None) {                                   //0020 : 07 67 00 77 2E F0 47 5B 01 1B 2B 0C 00 00 16 2A 16 
      Game_PlayerPawn(GetPawn()).cl2sv_UpdateLevelUpAttributes_CallStub(mValues[0],mValues[1],mValues[2]);//0031 : 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 1C 00 00 1B 0B 13 00 00 1A 25 01 70 26 8A 19 1A 26 01 70 26 8A 19 1A 2C 02 01 70 26 8A 19 16 
      SetControlsEnabled(1);                                                    //005C : 1B 02 9A 00 00 24 01 16 
      goto jl0067;                                                              //0064 : 06 67 00 
    }
    if (mAvailableAttributePoints <= 0) {                                       //0067 : 07 79 00 98 01 A8 14 2B 26 25 16 
      ShowPointDistribution(False);                                             //0072 : 1B F5 99 00 00 28 16 
    }
    Body = mValues[0];                                                          //0079 : 0F 00 48 B8 33 26 1A 25 01 70 26 8A 19 
    Mind = mValues[1];                                                          //0086 : 0F 00 58 B7 33 26 1A 26 01 70 26 8A 19 
    Focus = mValues[2];                                                         //0093 : 0F 00 F0 B5 33 26 1A 2C 02 01 70 26 8A 19 
    playerStats = Game_PlayerStats(GetPawn().CharacterStats);                   //00A1 : 0F 00 00 98 05 1B 2E 10 A3 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 
    mValueLabels[0].SetText(string(playerStats.mRecord.Body + Body));           //00BB : 19 1A 25 01 38 23 2B 26 22 00 00 1B 13 98 00 00 39 53 92 36 A8 93 1F 11 19 00 00 98 05 1B 05 00 68 01 78 2D 34 0F 00 48 B8 33 26 16 16 
    mValueLabels[1].SetText(string(playerStats.mRecord.Mind + Mind));           //00E8 : 19 1A 26 01 38 23 2B 26 22 00 00 1B 13 98 00 00 39 53 92 36 20 94 1F 11 19 00 00 98 05 1B 05 00 68 01 78 2D 34 0F 00 58 B7 33 26 16 16 
    mValueLabels[2].SetText(string(playerStats.mRecord.Focus + Focus));         //0115 : 19 1A 2C 02 01 38 23 2B 26 22 00 00 1B 13 98 00 00 39 53 92 36 98 94 1F 11 19 00 00 98 05 1B 05 00 68 01 78 2D 34 0F 00 F0 B5 33 26 16 16 
    return True;                                                                //0143 : 04 27 
    //43 F8 16 34 26 96 9A 00 00 1A 25 01 70 26 8A 19 1A 26 01 70 26 8A 19 1A 2C 02 01 70 26 8A 19 16 
    //07 67 00 77 2E F0 47 5B 01 1B 2B 0C 00 00 16 2A 16 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 1C 00 00 
    //1B 0B 13 00 00 1A 25 01 70 26 8A 19 1A 26 01 70 26 8A 19 1A 2C 02 01 70 26 8A 19 16 1B 02 9A 00 
    //00 24 01 16 06 67 00 07 79 00 98 01 A8 14 2B 26 25 16 1B F5 99 00 00 28 16 0F 00 48 B8 33 26 1A 
    //25 01 70 26 8A 19 0F 00 58 B7 33 26 1A 26 01 70 26 8A 19 0F 00 F0 B5 33 26 1A 2C 02 01 70 26 8A 
    //19 0F 00 00 98 05 1B 2E 10 A3 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 19 1A 25 01 38 
    //23 2B 26 22 00 00 1B 13 98 00 00 39 53 92 36 A8 93 1F 11 19 00 00 98 05 1B 05 00 68 01 78 2D 34 
    //0F 00 48 B8 33 26 16 16 19 1A 26 01 38 23 2B 26 22 00 00 1B 13 98 00 00 39 53 92 36 20 94 1F 11 
    //19 00 00 98 05 1B 05 00 68 01 78 2D 34 0F 00 58 B7 33 26 16 16 19 1A 2C 02 01 38 23 2B 26 22 00 
    //00 1B 13 98 00 00 39 53 92 36 98 94 1F 11 19 00 00 98 05 1B 05 00 68 01 78 2D 34 0F 00 F0 B5 33 
    //26 16 16 04 27 04 0B 47 
  }


  function TickHandler(float aDeltaTime) {
    local Game_PlayerPawn Pawn;
    local export editinline Game_PlayerStats playerStats;
    Pawn = Game_PlayerPawn(GetPawn());                                          //0000 : 0F 00 68 E5 06 1B 2E F0 47 5B 01 1B 2B 0C 00 00 16 
    if (Pawn != None) {                                                         //0011 : 07 38 01 77 00 68 E5 06 1B 2A 16 
      playerStats = Game_PlayerStats(Pawn.CharacterStats);                      //001C : 0F 00 F8 83 2B 26 2E 10 A3 5F 01 19 00 68 E5 06 1B 05 00 04 01 08 43 34 0F 
      if (playerStats.mAvailableAttributePoints != mMaxAvailableAttributePoints) {//0035 : 07 8C 00 9B 39 3A 19 00 F8 83 2B 26 05 00 01 01 18 F9 7E 0F 01 F8 7C 04 1B 16 
        SetControlsEnabled(0);                                                  //004F : 1B 02 9A 00 00 24 00 16 
        SetAttributePoints(playerStats.mAvailableAttributePoints);              //0057 : 1B F1 99 00 00 39 3A 19 00 F8 83 2B 26 05 00 01 01 18 F9 7E 0F 16 
        ShowPointDistribution(playerStats.mAvailableAttributePoints > 0);       //006D : 1B F5 99 00 00 97 39 3A 19 00 F8 83 2B 26 05 00 01 01 18 F9 7E 0F 25 16 16 
        ResetTempAssignedValues();                                              //0086 : 1B FC 99 00 00 16 
      }
      if (mPrevBody != playerStats.mRecord.Body
        || mPrevMind != playerStats.mRecord.Mind
        || mPrevFocus != playerStats.mRecord.Focus) {//008C : 07 38 01 84 84 9B 01 88 BF 33 26 36 A8 93 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 16 18 1B 00 9B 01 10 BF 33 26 36 20 94 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 16 16 18 1B 00 9B 01 20 BE 33 26 36 98 94 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 16 16 
        UpdateValues();                                                         //00E7 : 1B 48 99 00 00 16 
        mPrevBody = playerStats.mRecord.Body;                                   //00ED : 0F 01 88 BF 33 26 36 A8 93 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 
        mPrevMind = playerStats.mRecord.Mind;                                   //0106 : 0F 01 10 BF 33 26 36 20 94 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 
        mPrevFocus = playerStats.mRecord.Focus;                                 //011F : 0F 01 20 BE 33 26 36 98 94 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 
      }
    }
    //0F 00 68 E5 06 1B 2E F0 47 5B 01 1B 2B 0C 00 00 16 07 38 01 77 00 68 E5 06 1B 2A 16 0F 00 F8 83 
    //2B 26 2E 10 A3 5F 01 19 00 68 E5 06 1B 05 00 04 01 08 43 34 0F 07 8C 00 9B 39 3A 19 00 F8 83 2B 
    //26 05 00 01 01 18 F9 7E 0F 01 F8 7C 04 1B 16 1B 02 9A 00 00 24 00 16 1B F1 99 00 00 39 3A 19 00 
    //F8 83 2B 26 05 00 01 01 18 F9 7E 0F 16 1B F5 99 00 00 97 39 3A 19 00 F8 83 2B 26 05 00 01 01 18 
    //F9 7E 0F 25 16 16 1B FC 99 00 00 16 07 38 01 84 84 9B 01 88 BF 33 26 36 A8 93 1F 11 19 00 F8 83 
    //2B 26 05 00 68 01 78 2D 34 0F 16 18 1B 00 9B 01 10 BF 33 26 36 20 94 1F 11 19 00 F8 83 2B 26 05 
    //00 68 01 78 2D 34 0F 16 16 18 1B 00 9B 01 20 BE 33 26 36 98 94 1F 11 19 00 F8 83 2B 26 05 00 68 
    //01 78 2D 34 0F 16 16 1B 48 99 00 00 16 0F 01 88 BF 33 26 36 A8 93 1F 11 19 00 F8 83 2B 26 05 00 
    //68 01 78 2D 34 0F 0F 01 10 BF 33 26 36 20 94 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 0F 
    //01 20 BE 33 26 36 98 94 1F 11 19 00 F8 83 2B 26 05 00 68 01 78 2D 34 0F 04 0B 47 
  }


  function AssignTooltip(string aComponentName,string aTooltipClass) {
    local GUI_Component tooltipArea;
    tooltipArea = mEditor.RetrieveComponent(aComponentName);                    //0000 : 0F 00 40 BC 33 26 19 01 10 32 2C 26 0B 00 04 1B 15 98 00 00 00 E8 17 34 26 16 
    tooltipArea.SetTooltipObject(GetPawn(),aTooltipClass);                      //001A : 19 00 40 BC 33 26 11 00 00 1B 52 97 00 00 1B 2B 0C 00 00 16 00 60 18 34 26 16 
    //0F 00 40 BC 33 26 19 01 10 32 2C 26 0B 00 04 1B 15 98 00 00 00 E8 17 34 26 16 19 00 40 BC 33 26 
    //11 00 00 1B 52 97 00 00 1B 2B 0C 00 00 16 00 60 18 34 26 16 04 0B 47 
  }


  function SetDelegates() {
    if (GetPawn() != None) {                                                    //0000 : 07 92 05 77 1B 2B 0C 00 00 16 2A 16 
      AssignTooltip("mFameTooltipArea","HUD_AvatarFameLevelTooltip");           //000C : 1B 46 98 00 00 1F 6D 46 61 6D 65 54 6F 6F 6C 74 69 70 41 72 65 61 00 1F 48 55 44 5F 41 76 61 74 61 72 46 61 6D 65 4C 65 76 65 6C 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mPepTooltipArea","HUD_AvatarPepLevelTooltip");             //0040 : 1B 46 98 00 00 1F 6D 50 65 70 54 6F 6F 6C 74 69 70 41 72 65 61 00 1F 48 55 44 5F 41 76 61 74 61 72 50 65 70 4C 65 76 65 6C 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mBodyTooltipArea","HUD_CharacterStatisticsBodyTooltip");   //0072 : 1B 46 98 00 00 1F 6D 42 6F 64 79 54 6F 6F 6C 74 69 70 41 72 65 61 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 42 6F 64 79 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mMindTooltipArea","HUD_CharacterStatisticsMindTooltip");   //00AE : 1B 46 98 00 00 1F 6D 4D 69 6E 64 54 6F 6F 6C 74 69 70 41 72 65 61 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 69 6E 64 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mFocusTooltipArea","HUD_CharacterStatisticsFocusTooltip"); //00EA : 1B 46 98 00 00 1F 6D 46 6F 63 75 73 54 6F 6F 6C 74 69 70 41 72 65 61 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 46 6F 63 75 73 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mResistanceLabel","HUD_CharacterStatisticsResistanceTooltip");//0128 : 1B 46 98 00 00 1F 6D 52 65 73 69 73 74 61 6E 63 65 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 65 73 69 73 74 61 6E 63 65 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mMeleeIcon","HUD_CharacterStatisticsMeleeTooltip");        //016A : 1B 46 98 00 00 1F 6D 4D 65 6C 65 65 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 65 6C 65 65 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mMeleeLabel","HUD_CharacterStatisticsMeleeTooltip");       //01A1 : 1B 46 98 00 00 1F 6D 4D 65 6C 65 65 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 65 6C 65 65 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mMeleeValue","HUD_CharacterStatisticsMeleeTooltip");       //01D9 : 1B 46 98 00 00 1F 6D 4D 65 6C 65 65 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 65 6C 65 65 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mMagicIcon","HUD_CharacterStatisticsMagicTooltip");        //0211 : 1B 46 98 00 00 1F 6D 4D 61 67 69 63 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 61 67 69 63 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mMagicLabel","HUD_CharacterStatisticsMagicTooltip");       //0248 : 1B 46 98 00 00 1F 6D 4D 61 67 69 63 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 61 67 69 63 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mMagicValue","HUD_CharacterStatisticsMagicTooltip");       //0280 : 1B 46 98 00 00 1F 6D 4D 61 67 69 63 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 61 67 69 63 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mRangedIcon","HUD_CharacterStatisticsRangedTooltip");      //02B8 : 1B 46 98 00 00 1F 6D 52 61 6E 67 65 64 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 61 6E 67 65 64 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mRangedLabel","HUD_CharacterStatisticsRangedTooltip");     //02F1 : 1B 46 98 00 00 1F 6D 52 61 6E 67 65 64 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 61 6E 67 65 64 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mRangedValue","HUD_CharacterStatisticsRangedTooltip");     //032B : 1B 46 98 00 00 1F 6D 52 61 6E 67 65 64 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 61 6E 67 65 64 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mAffinityLabel","HUD_CharacterStatisticsAffinityTooltip"); //0365 : 1B 46 98 00 00 1F 6D 41 66 66 69 6E 69 74 79 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 41 66 66 69 6E 69 74 79 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mRuneIcon","HUD_CharacterStatisticsRuneTooltip");          //03A3 : 1B 46 98 00 00 1F 6D 52 75 6E 65 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 75 6E 65 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mRuneLabel","HUD_CharacterStatisticsRuneTooltip");         //03D8 : 1B 46 98 00 00 1F 6D 52 75 6E 65 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 75 6E 65 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mRuneValue","HUD_CharacterStatisticsRuneTooltip");         //040E : 1B 46 98 00 00 1F 6D 52 75 6E 65 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 75 6E 65 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mSpiritIcon","HUD_CharacterStatisticsSpiritTooltip");      //0444 : 1B 46 98 00 00 1F 6D 53 70 69 72 69 74 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 70 69 72 69 74 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mSpiritLabel","HUD_CharacterStatisticsSpiritTooltip");     //047D : 1B 46 98 00 00 1F 6D 53 70 69 72 69 74 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 70 69 72 69 74 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mSpiritValue","HUD_CharacterStatisticsSpiritTooltip");     //04B7 : 1B 46 98 00 00 1F 6D 53 70 69 72 69 74 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 70 69 72 69 74 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mSoulIcon","HUD_CharacterStatisticsSoulTooltip");          //04F1 : 1B 46 98 00 00 1F 6D 53 6F 75 6C 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 6F 75 6C 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mSoulLabel","HUD_CharacterStatisticsSoulTooltip");         //0526 : 1B 46 98 00 00 1F 6D 53 6F 75 6C 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 6F 75 6C 54 6F 6F 6C 74 69 70 00 16 
      AssignTooltip("mSoulValue","HUD_CharacterStatisticsSoulTooltip");         //055C : 1B 46 98 00 00 1F 6D 53 6F 75 6C 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 6F 75 6C 54 6F 6F 6C 74 69 70 00 16 
    }
    __OnTick__Delegate = TickHandler;                                           //0592 : 45 01 70 E6 9D 19 44 4B 98 00 00 
    //07 92 05 77 1B 2B 0C 00 00 16 2A 16 1B 46 98 00 00 1F 6D 46 61 6D 65 54 6F 6F 6C 74 69 70 41 72 
    //65 61 00 1F 48 55 44 5F 41 76 61 74 61 72 46 61 6D 65 4C 65 76 65 6C 54 6F 6F 6C 74 69 70 00 16 
    //1B 46 98 00 00 1F 6D 50 65 70 54 6F 6F 6C 74 69 70 41 72 65 61 00 1F 48 55 44 5F 41 76 61 74 61 
    //72 50 65 70 4C 65 76 65 6C 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 42 6F 64 79 54 6F 6F 
    //6C 74 69 70 41 72 65 61 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 
    //73 42 6F 64 79 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 4D 69 6E 64 54 6F 6F 6C 74 69 70 
    //41 72 65 61 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 69 6E 
    //64 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 46 6F 63 75 73 54 6F 6F 6C 74 69 70 41 72 65 
    //61 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 46 6F 63 75 73 54 
    //6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 52 65 73 69 73 74 61 6E 63 65 4C 61 62 65 6C 00 1F 
    //48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 65 73 69 73 74 61 6E 63 
    //65 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 4D 65 6C 65 65 49 63 6F 6E 00 1F 48 55 44 5F 
    //43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 65 6C 65 65 54 6F 6F 6C 74 69 70 00 
    //16 1B 46 98 00 00 1F 6D 4D 65 6C 65 65 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 
    //72 53 74 61 74 69 73 74 69 63 73 4D 65 6C 65 65 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 
    //4D 65 6C 65 65 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 
    //69 63 73 4D 65 6C 65 65 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 4D 61 67 69 63 49 63 6F 
    //6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 61 67 69 63 54 
    //6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 4D 61 67 69 63 4C 61 62 65 6C 00 1F 48 55 44 5F 43 
    //68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 4D 61 67 69 63 54 6F 6F 6C 74 69 70 00 16 
    //1B 46 98 00 00 1F 6D 4D 61 67 69 63 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 
    //53 74 61 74 69 73 74 69 63 73 4D 61 67 69 63 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 52 
    //61 6E 67 65 64 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 
    //63 73 52 61 6E 67 65 64 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 52 61 6E 67 65 64 4C 61 
    //62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 61 6E 67 
    //65 64 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 52 61 6E 67 65 64 56 61 6C 75 65 00 1F 48 
    //55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 61 6E 67 65 64 54 6F 6F 6C 
    //74 69 70 00 16 1B 46 98 00 00 1F 6D 41 66 66 69 6E 69 74 79 4C 61 62 65 6C 00 1F 48 55 44 5F 43 
    //68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 41 66 66 69 6E 69 74 79 54 6F 6F 6C 74 69 
    //70 00 16 1B 46 98 00 00 1F 6D 52 75 6E 65 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 
    //72 53 74 61 74 69 73 74 69 63 73 52 75 6E 65 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 52 
    //75 6E 65 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 
    //73 52 75 6E 65 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 52 75 6E 65 56 61 6C 75 65 00 1F 
    //48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 52 75 6E 65 54 6F 6F 6C 74 
    //69 70 00 16 1B 46 98 00 00 1F 6D 53 70 69 72 69 74 49 63 6F 6E 00 1F 48 55 44 5F 43 68 61 72 61 
    //63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 70 69 72 69 74 54 6F 6F 6C 74 69 70 00 16 1B 46 98 
    //00 00 1F 6D 53 70 69 72 69 74 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 
    //61 74 69 73 74 69 63 73 53 70 69 72 69 74 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 53 70 
    //69 72 69 74 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 
    //63 73 53 70 69 72 69 74 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 53 6F 75 6C 49 63 6F 6E 
    //00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 6F 75 6C 54 6F 6F 
    //6C 74 69 70 00 16 1B 46 98 00 00 1F 6D 53 6F 75 6C 4C 61 62 65 6C 00 1F 48 55 44 5F 43 68 61 72 
    //61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 53 6F 75 6C 54 6F 6F 6C 74 69 70 00 16 1B 46 98 00 
    //00 1F 6D 53 6F 75 6C 56 61 6C 75 65 00 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 
    //73 74 69 63 73 53 6F 75 6C 54 6F 6F 6C 74 69 70 00 16 45 01 70 E6 9D 19 44 4B 98 00 00 04 0B 47 
    //
  }


  function ResetTempAssignedValues() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 98 93 05 1B 25 
    while (i < 3) {                                                             //0007 : 07 2A 00 96 00 98 93 05 1B 2C 03 16 
      mValues[i] = 0;                                                           //0013 : 0F 1A 00 98 93 05 1B 01 70 26 8A 19 25 
      i++;                                                                      //0020 : A5 00 98 93 05 1B 16 
    }
    //0F 00 98 93 05 1B 25 07 2A 00 96 00 98 93 05 1B 2C 03 16 0F 1A 00 98 93 05 1B 01 70 26 8A 19 25 
    //A5 00 98 93 05 1B 16 06 07 00 04 0B 47 
  }


  function SetControlsEnabled(byte aEnabled) {
    local bool newEnable;
    if (mPawnPage != None) {                                                    //0000 : 07 59 00 77 01 F8 91 05 1B 2A 16 
      mState = aEnabled;                                                        //000B : 0F 01 30 BD 33 26 00 70 17 34 26 
      newEnable = mState != 1;                                                  //0016 : 14 2D 00 88 E3 06 1B 9B 39 3A 01 30 BD 33 26 39 3A 24 01 16 
      if (mPawnPage.IsEnabled() != newEnable) {                                 //002A : 07 59 00 F3 19 01 F8 91 05 1B 06 00 04 1C 10 83 9D 19 16 2D 00 88 E3 06 1B 16 
        mPawnPage.SetEnabled(newEnable);                                        //0044 : 19 01 F8 91 05 1B 0C 00 00 1B 5F 32 00 00 2D 00 88 E3 06 1B 16 
      }
    }
    //07 59 00 77 01 F8 91 05 1B 2A 16 0F 01 30 BD 33 26 00 70 17 34 26 14 2D 00 88 E3 06 1B 9B 39 3A 
    //01 30 BD 33 26 39 3A 24 01 16 07 59 00 F3 19 01 F8 91 05 1B 06 00 04 1C 10 83 9D 19 16 2D 00 88 
    //E3 06 1B 16 19 01 F8 91 05 1B 0C 00 00 1B 5F 32 00 00 2D 00 88 E3 06 1B 16 04 0B 47 
  }


  event Initialize() {
    local int i;
    mTextChanges = 0;                                                           //0000 : 0F 01 D0 15 34 26 25 
    mWidth = 410.00000000;                                                      //0007 : 0F 01 60 87 31 16 1E 00 00 CD 43 
    mHeight = 578.00000000;                                                     //0012 : 0F 01 40 88 31 16 1E 00 80 10 44 
    mEditor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));     //001D : 0F 01 10 32 2C 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    mEditor.Attach(self,"CharacterStatistics\CharacterStatistics.txt");         //0042 : 19 01 10 32 2C 26 34 00 00 1B 3F 01 00 00 17 1F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 5C 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 2E 74 78 74 00 16 
    Super.Initialize();                                                         //007F : 1C 28 9E 9E 19 16 
    mPawnPage = mEditor.RetrieveComponent("CharacterStatsPawnPage");            //0085 : 0F 01 F8 91 05 1B 19 01 10 32 2C 26 1E 00 04 1B 15 98 00 00 1F 43 68 61 72 61 63 74 65 72 53 74 61 74 73 50 61 77 6E 50 61 67 65 00 16 
    CheckDefaults(mEditor);                                                     //00B2 : 1B A2 98 00 00 01 10 32 2C 26 16 
    mAcceptChangesButton = GUI_Button(mEditor.RetrieveComponent("mAcceptChangesButton"));//00BD : 0F 01 38 ED 32 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 1C 00 04 1B 15 98 00 00 1F 6D 41 63 63 65 70 74 43 68 61 6E 67 65 73 42 75 74 74 6F 6E 00 16 
    mAcceptChangesButton.SetVisible(False);                                     //00ED : 19 01 38 ED 32 26 07 00 00 1B 14 98 00 00 28 16 
    mAcceptChangesButton.SetEnabled(False);                                     //00FD : 19 01 38 ED 32 26 07 00 00 1B 5F 32 00 00 28 16 
    mAddPointsLabel = GUI_Label(mEditor.RetrieveComponent("mAddPointsLabel"));  //010D : 0F 01 58 4B 08 1B 2E 38 15 2F 1D 19 01 10 32 2C 26 17 00 04 1B 15 98 00 00 1F 6D 41 64 64 50 6F 69 6E 74 73 4C 61 62 65 6C 00 16 
    mAddPointsLabel.SetVisible(False);                                          //0138 : 19 01 58 4B 08 1B 07 00 00 1B 14 98 00 00 28 16 
    mChangeAttributeButtons[0].minusButton = GUI_Button(mEditor.RetrieveComponent("mDecBody"));//0148 : 0F 36 20 D2 2C 26 1A 25 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 10 00 04 1B 15 98 00 00 1F 6D 44 65 63 42 6F 64 79 00 16 
    mChangeAttributeButtons[0].plusButton = GUI_Button(mEditor.RetrieveComponent("mIncBody"));//0173 : 0F 36 88 E7 2C 26 1A 25 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 10 00 04 1B 15 98 00 00 1F 6D 49 6E 63 42 6F 64 79 00 16 
    mValueLabels[0] = GUI_Label(mEditor.RetrieveComponent("mValueBody"));       //019E : 0F 1A 25 01 38 23 2B 26 2E 38 15 2F 1D 19 01 10 32 2C 26 12 00 04 1B 15 98 00 00 1F 6D 56 61 6C 75 65 42 6F 64 79 00 16 
    mChangeAttributeButtons[1].minusButton = GUI_Button(mEditor.RetrieveComponent("mDecMind"));//01C6 : 0F 36 20 D2 2C 26 1A 26 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 10 00 04 1B 15 98 00 00 1F 6D 44 65 63 4D 69 6E 64 00 16 
    mChangeAttributeButtons[1].plusButton = GUI_Button(mEditor.RetrieveComponent("mIncMind"));//01F1 : 0F 36 88 E7 2C 26 1A 26 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 10 00 04 1B 15 98 00 00 1F 6D 49 6E 63 4D 69 6E 64 00 16 
    mValueLabels[1] = GUI_Label(mEditor.RetrieveComponent("mValueMind"));       //021C : 0F 1A 26 01 38 23 2B 26 2E 38 15 2F 1D 19 01 10 32 2C 26 12 00 04 1B 15 98 00 00 1F 6D 56 61 6C 75 65 4D 69 6E 64 00 16 
    mChangeAttributeButtons[2].minusButton = GUI_Button(mEditor.RetrieveComponent("mDecFocus"));//0244 : 0F 36 20 D2 2C 26 1A 2C 02 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 11 00 04 1B 15 98 00 00 1F 6D 44 65 63 46 6F 63 75 73 00 16 
    mChangeAttributeButtons[2].plusButton = GUI_Button(mEditor.RetrieveComponent("mIncFocus"));//0271 : 0F 36 88 E7 2C 26 1A 2C 02 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 11 00 04 1B 15 98 00 00 1F 6D 49 6E 63 46 6F 63 75 73 00 16 
    mValueLabels[2] = GUI_Label(mEditor.RetrieveComponent("mValueFocus"));      //029E : 0F 1A 2C 02 01 38 23 2B 26 2E 38 15 2F 1D 19 01 10 32 2C 26 13 00 04 1B 15 98 00 00 1F 6D 56 61 6C 75 65 46 6F 63 75 73 00 16 
    i = 0;                                                                      //02C8 : 0F 00 F0 EE 2C 26 25 
    while (i < 3) {                                                             //02CF : 07 59 03 96 00 F0 EE 2C 26 2C 03 16 
      mChangeAttributeButtons[i].minusButton.__OnClick__Delegate = OnMinusClick;//02DB : 45 19 36 20 D2 2C 26 1A 00 F0 EE 2C 26 01 40 4F 2C 26 05 00 08 01 98 EB 9D 19 44 9D 9A 00 00 
      mChangeAttributeButtons[i].plusButton.__OnClick__Delegate = OnPlusClick;  //02FA : 45 19 36 88 E7 2C 26 1A 00 F0 EE 2C 26 01 40 4F 2C 26 05 00 08 01 98 EB 9D 19 44 9E 9A 00 00 
      mChangeAttributeButtons[i].plusButton.SetVisible(False);                  //0319 : 19 36 88 E7 2C 26 1A 00 F0 EE 2C 26 01 40 4F 2C 26 07 00 00 1B 14 98 00 00 28 16 
      mChangeAttributeButtons[i].minusButton.SetVisible(False);                 //0334 : 19 36 20 D2 2C 26 1A 00 F0 EE 2C 26 01 40 4F 2C 26 07 00 00 1B 14 98 00 00 28 16 
      i++;                                                                      //034F : A5 00 F0 EE 2C 26 16 
    }
    mAcceptChangesButton.__OnClick__Delegate = AcceptChanges;                   //0359 : 45 19 01 38 ED 32 26 05 00 08 01 98 EB 9D 19 44 99 9A 00 00 
    SetAttributePoints(0);                                                      //036D : 1B F1 99 00 00 25 16 
    ResetTempAssignedValues();                                                  //0374 : 1B FC 99 00 00 16 
    //0F 01 D0 15 34 26 25 0F 01 60 87 31 16 1E 00 00 CD 43 0F 01 40 88 31 16 1E 00 80 10 44 0F 01 10 
    //32 2C 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 
    //2D 16 19 01 10 32 2C 26 34 00 00 1B 3F 01 00 00 17 1F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 
    //73 74 69 63 73 5C 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 2E 74 78 74 00 16 1C 
    //28 9E 9E 19 16 0F 01 F8 91 05 1B 19 01 10 32 2C 26 1E 00 04 1B 15 98 00 00 1F 43 68 61 72 61 63 
    //74 65 72 53 74 61 74 73 50 61 77 6E 50 61 67 65 00 16 1B A2 98 00 00 01 10 32 2C 26 16 0F 01 38 
    //ED 32 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 1C 00 04 1B 15 98 00 00 1F 6D 41 63 63 65 70 74 43 68 
    //61 6E 67 65 73 42 75 74 74 6F 6E 00 16 19 01 38 ED 32 26 07 00 00 1B 14 98 00 00 28 16 19 01 38 
    //ED 32 26 07 00 00 1B 5F 32 00 00 28 16 0F 01 58 4B 08 1B 2E 38 15 2F 1D 19 01 10 32 2C 26 17 00 
    //04 1B 15 98 00 00 1F 6D 41 64 64 50 6F 69 6E 74 73 4C 61 62 65 6C 00 16 19 01 58 4B 08 1B 07 00 
    //00 1B 14 98 00 00 28 16 0F 36 20 D2 2C 26 1A 25 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 
    //10 00 04 1B 15 98 00 00 1F 6D 44 65 63 42 6F 64 79 00 16 0F 36 88 E7 2C 26 1A 25 01 40 4F 2C 26 
    //2E 78 F0 2E 1D 19 01 10 32 2C 26 10 00 04 1B 15 98 00 00 1F 6D 49 6E 63 42 6F 64 79 00 16 0F 1A 
    //25 01 38 23 2B 26 2E 38 15 2F 1D 19 01 10 32 2C 26 12 00 04 1B 15 98 00 00 1F 6D 56 61 6C 75 65 
    //42 6F 64 79 00 16 0F 36 20 D2 2C 26 1A 26 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 10 00 
    //04 1B 15 98 00 00 1F 6D 44 65 63 4D 69 6E 64 00 16 0F 36 88 E7 2C 26 1A 26 01 40 4F 2C 26 2E 78 
    //F0 2E 1D 19 01 10 32 2C 26 10 00 04 1B 15 98 00 00 1F 6D 49 6E 63 4D 69 6E 64 00 16 0F 1A 26 01 
    //38 23 2B 26 2E 38 15 2F 1D 19 01 10 32 2C 26 12 00 04 1B 15 98 00 00 1F 6D 56 61 6C 75 65 4D 69 
    //6E 64 00 16 0F 36 20 D2 2C 26 1A 2C 02 01 40 4F 2C 26 2E 78 F0 2E 1D 19 01 10 32 2C 26 11 00 04 
    //1B 15 98 00 00 1F 6D 44 65 63 46 6F 63 75 73 00 16 0F 36 88 E7 2C 26 1A 2C 02 01 40 4F 2C 26 2E 
    //78 F0 2E 1D 19 01 10 32 2C 26 11 00 04 1B 15 98 00 00 1F 6D 49 6E 63 46 6F 63 75 73 00 16 0F 1A 
    //2C 02 01 38 23 2B 26 2E 38 15 2F 1D 19 01 10 32 2C 26 13 00 04 1B 15 98 00 00 1F 6D 56 61 6C 75 
    //65 46 6F 63 75 73 00 16 0F 00 F0 EE 2C 26 25 07 59 03 96 00 F0 EE 2C 26 2C 03 16 45 19 36 20 D2 
    //2C 26 1A 00 F0 EE 2C 26 01 40 4F 2C 26 05 00 08 01 98 EB 9D 19 44 9D 9A 00 00 45 19 36 88 E7 2C 
    //26 1A 00 F0 EE 2C 26 01 40 4F 2C 26 05 00 08 01 98 EB 9D 19 44 9E 9A 00 00 19 36 88 E7 2C 26 1A 
    //00 F0 EE 2C 26 01 40 4F 2C 26 07 00 00 1B 14 98 00 00 28 16 19 36 20 D2 2C 26 1A 00 F0 EE 2C 26 
    //01 40 4F 2C 26 07 00 00 1B 14 98 00 00 28 16 A5 00 F0 EE 2C 26 16 06 CF 02 45 19 01 38 ED 32 26 
    //05 00 08 01 98 EB 9D 19 44 99 9A 00 00 1B F1 99 00 00 25 16 1B FC 99 00 00 16 04 0B 47 
  }


  delegate OnFinalizeAttributePoints(int Body,int Mind,int Focus);



