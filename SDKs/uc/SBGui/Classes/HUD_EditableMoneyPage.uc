//==============================================================================
//  HUD_EditableMoneyPage
//==============================================================================

class HUD_EditableMoneyPage extends HUD_MoneyPage
    dependsOn(GUI_Component,GUI_Button)
    Transient
    Config(User)
  ;

  const MONEY_EDIT_SUNPLATES_VALUE =  10000;
  const MONEY_EDIT_QUARTERNAILS_VALUE =  100;
  const MONEY_EDIT_LODERINGS_VALUE =  1;
  const MONEY_EDIT_LODERINGS_MINUS_ID =  5;
  const MONEY_EDIT_LODERINGS_PLUS_ID =  4;
  const MONEY_EDIT_QUARTERNAILS_MINUS_ID =  3;
  const MONEY_EDIT_QUARTERNAILS_PLUS_ID =  2;
  const MONEY_EDIT_SUNPLATES_MINUS_ID =  1;
  const MONEY_EDIT_SUNPLATES_PLUS_ID =  0;
  var GUI_Button mSunplatesPlus;
  var GUI_Button mSunplatesMinus;
  var GUI_Button mQuarternailsPlus;
  var GUI_Button mQuarternailsMinus;
  var GUI_Button mLoderingsPlus;
  var GUI_Button mLoderingsMinus;
  var bool mFrozen;
  var bool mReadOnly;
  var (null);


  function ChangeLoderingsValue(bool aIncrease) {
    local int aMoneyDelta;
    if (aIncrease) {                                                            //0000 : 07 13 00 2D 00 60 DF 34 26 
      aMoneyDelta = 1;                                                          //0009 : 0F 00 28 8D 06 1B 26 
    } else {                                                                    //0010 : 06 1C 00 
      aMoneyDelta = -1;                                                         //0013 : 0F 00 28 8D 06 1B 8F 26 16 
    }
    OnAdjustMoney(aMoneyDelta);                                                 //001C : 43 10 95 06 1B 31 99 00 00 00 28 8D 06 1B 16 
    //07 13 00 2D 00 60 DF 34 26 0F 00 28 8D 06 1B 26 06 1C 00 0F 00 28 8D 06 1B 8F 26 16 43 10 95 06 
    //1B 31 99 00 00 00 28 8D 06 1B 16 04 0B 47 
  }


  function ChangeQuaternailsValue(bool aIncrease) {
    local int aMoneyDelta;
    if (aIncrease) {                                                            //0000 : 07 14 00 2D 00 E8 DE 34 26 
      aMoneyDelta = 100;                                                        //0009 : 0F 00 50 8E 06 1B 2C 64 
    } else {                                                                    //0011 : 06 1E 00 
      aMoneyDelta = -100;                                                       //0014 : 0F 00 50 8E 06 1B 8F 2C 64 16 
    }
    OnAdjustMoney(aMoneyDelta);                                                 //001E : 43 10 95 06 1B 31 99 00 00 00 50 8E 06 1B 16 
    //07 14 00 2D 00 E8 DE 34 26 0F 00 50 8E 06 1B 2C 64 06 1E 00 0F 00 50 8E 06 1B 8F 2C 64 16 43 10 
    //95 06 1B 31 99 00 00 00 50 8E 06 1B 16 04 0B 47 
  }


  function ChangeSunplateValue(bool aIncrease) {
    local int aMoneyDelta;
    if (aIncrease) {                                                            //0000 : 07 17 00 2D 00 48 DD 34 26 
      aMoneyDelta = 10000;                                                      //0009 : 0F 00 18 91 06 1B 1D 10 27 00 00 
    } else {                                                                    //0014 : 06 24 00 
      aMoneyDelta = -10000;                                                     //0017 : 0F 00 18 91 06 1B 8F 1D 10 27 00 00 16 
    }
    OnAdjustMoney(aMoneyDelta);                                                 //0024 : 43 10 95 06 1B 31 99 00 00 00 18 91 06 1B 16 
    //07 17 00 2D 00 48 DD 34 26 0F 00 18 91 06 1B 1D 10 27 00 00 06 24 00 0F 00 18 91 06 1B 8F 1D 10 
    //27 00 00 16 43 10 95 06 1B 31 99 00 00 00 18 91 06 1B 16 04 0B 47 
  }


  function bool ClickHandler(GUI_Component aButton) {
    if (aButton != None) {                                                      //0000 : 07 82 00 77 00 E0 30 08 1B 2A 16 
      switch (aButton.mIntTag) {                                                //000B : 05 04 19 00 E0 30 08 1B 05 00 04 01 58 90 31 16 
        case 0 :                                                                //001B : 0A 2B 00 25 
          ChangeSunplateValue(True);                                            //001F : 1B 90 99 00 00 27 16 
          return True;                                                          //0026 : 04 27 
          break;                                                                //0028 : 06 82 00 
        case 1 :                                                                //002B : 0A 3B 00 26 
          ChangeSunplateValue(False);                                           //002F : 1B 90 99 00 00 28 16 
          return True;                                                          //0036 : 04 27 
          break;                                                                //0038 : 06 82 00 
        case 2 :                                                                //003B : 0A 4C 00 2C 02 
          ChangeQuaternailsValue(True);                                         //0040 : 1B 92 99 00 00 27 16 
          return True;                                                          //0047 : 04 27 
          break;                                                                //0049 : 06 82 00 
        case 3 :                                                                //004C : 0A 5D 00 2C 03 
          ChangeQuaternailsValue(False);                                        //0051 : 1B 92 99 00 00 28 16 
          return True;                                                          //0058 : 04 27 
          break;                                                                //005A : 06 82 00 
        case 4 :                                                                //005D : 0A 6E 00 2C 04 
          ChangeLoderingsValue(True);                                           //0062 : 1B 93 99 00 00 27 16 
          return True;                                                          //0069 : 04 27 
          break;                                                                //006B : 06 82 00 
        case 5 :                                                                //006E : 0A 7F 00 2C 05 
          ChangeLoderingsValue(False);                                          //0073 : 1B 93 99 00 00 28 16 
          return True;                                                          //007A : 04 27 
          break;                                                                //007C : 06 82 00 
        default:                                                                //007F : 0A FF FF 
      }
    }
    return False;                                                               //0082 : 04 28 
    //07 82 00 77 00 E0 30 08 1B 2A 16 05 04 19 00 E0 30 08 1B 05 00 04 01 58 90 31 16 0A 2B 00 25 1B 
    //90 99 00 00 27 16 04 27 06 82 00 0A 3B 00 26 1B 90 99 00 00 28 16 04 27 06 82 00 0A 4C 00 2C 02 
    //1B 92 99 00 00 27 16 04 27 06 82 00 0A 5D 00 2C 03 1B 92 99 00 00 28 16 04 27 06 82 00 0A 6E 00 
    //2C 04 1B 93 99 00 00 27 16 04 27 06 82 00 0A 7F 00 2C 05 1B 93 99 00 00 28 16 04 27 06 82 00 0A 
    //FF FF 04 28 04 0B 47 
  }


  function UpdateButtonStatus() {
    mSunplatesPlus.SetEnabled(!mFrozen);                                        //0000 : 19 01 B8 A6 2C 26 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 
    mSunplatesMinus.SetEnabled(!mFrozen);                                       //0017 : 19 01 30 A7 2C 26 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 
    mQuarternailsPlus.SetEnabled(!mFrozen);                                     //002E : 19 01 70 50 04 1B 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 
    mQuarternailsMinus.SetEnabled(!mFrozen);                                    //0045 : 19 01 F0 9C 2C 26 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 
    mLoderingsPlus.SetEnabled(!mFrozen);                                        //005C : 19 01 B0 99 2C 26 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 
    mLoderingsMinus.SetEnabled(!mFrozen);                                       //0073 : 19 01 40 4C 04 1B 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 
    mSunplatesPlus.SetVisible(!mReadOnly);                                      //008A : 19 01 B8 A6 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 
    mSunplatesMinus.SetVisible(!mReadOnly);                                     //00A1 : 19 01 30 A7 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 
    mQuarternailsPlus.SetVisible(!mReadOnly);                                   //00B8 : 19 01 70 50 04 1B 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 
    mQuarternailsMinus.SetVisible(!mReadOnly);                                  //00CF : 19 01 F0 9C 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 
    mLoderingsPlus.SetVisible(!mReadOnly);                                      //00E6 : 19 01 B0 99 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 
    mLoderingsMinus.SetVisible(!mReadOnly);                                     //00FD : 19 01 40 4C 04 1B 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 
    //19 01 B8 A6 2C 26 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 19 01 30 A7 2C 26 0E 00 00 
    //1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 19 01 70 50 04 1B 0E 00 00 1B 5F 32 00 00 81 2D 01 40 
    //F9 8A 19 16 16 19 01 F0 9C 2C 26 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 19 01 B0 99 
    //2C 26 0E 00 00 1B 5F 32 00 00 81 2D 01 40 F9 8A 19 16 16 19 01 40 4C 04 1B 0E 00 00 1B 5F 32 00 
    //00 81 2D 01 40 F9 8A 19 16 16 19 01 B8 A6 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 
    //16 19 01 30 A7 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 19 01 70 50 04 1B 0E 00 
    //00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 19 01 F0 9C 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 
    //30 FA 8A 19 16 16 19 01 B0 99 2C 26 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 19 01 40 
    //4C 04 1B 0E 00 00 1B 14 98 00 00 81 2D 01 30 FA 8A 19 16 16 04 0B 47 
  }


  function SetFrozen(bool aFrozenFlag) {
    mFrozen = aFrozenFlag;                                                      //0000 : 14 2D 01 40 F9 8A 19 2D 00 D0 DC 34 26 
    UpdateButtonStatus();                                                       //000D : 1B 8F 99 00 00 16 
    //14 2D 01 40 F9 8A 19 2D 00 D0 DC 34 26 1B 8F 99 00 00 16 04 0B 47 
  }


  function SetReadOnly(bool aReadOnlyFlag) {
    mReadOnly = aReadOnlyFlag;                                                  //0000 : 14 2D 01 30 FA 8A 19 2D 00 08 DA 34 26 
    if (mReadOnly) {                                                            //000D : 07 1E 00 2D 01 30 FA 8A 19 
      mFrozen = True;                                                           //0016 : 14 2D 01 40 F9 8A 19 27 
    }
    UpdateButtonStatus();                                                       //001E : 1B 8F 99 00 00 16 
    //14 2D 01 30 FA 8A 19 2D 00 08 DA 34 26 07 1E 00 2D 01 30 FA 8A 19 14 2D 01 40 F9 8A 19 27 1B 8F 
    //99 00 00 16 04 0B 47 
  }


  function InitButtons() {
    local GED_Editor Editor;
    mSunplatesPlus = CreateButton("GUI_Button",0,0,0,0,0,0);                    //0000 : 0F 01 B8 A6 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 
    mSunplatesPlus.__OnClick__Delegate = ClickHandler;                          //001E : 45 19 01 B8 A6 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mSunplatesPlus.mIntTag = 0;                                                 //0032 : 0F 19 01 B8 A6 2C 26 05 00 04 01 58 90 31 16 25 
    mQuarternailsPlus = CreateButton("GUI_Button",0,0,0,0,0,0);                 //0042 : 0F 01 70 50 04 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 
    mQuarternailsPlus.__OnClick__Delegate = ClickHandler;                       //0060 : 45 19 01 70 50 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mQuarternailsPlus.mIntTag = 2;                                              //0074 : 0F 19 01 70 50 04 1B 05 00 04 01 58 90 31 16 2C 02 
    mLoderingsPlus = CreateButton("GUI_Button",0,0,0,0,0,0);                    //0085 : 0F 01 B0 99 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 
    mLoderingsPlus.__OnClick__Delegate = ClickHandler;                          //00A3 : 45 19 01 B0 99 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mLoderingsPlus.mIntTag = 4;                                                 //00B7 : 0F 19 01 B0 99 2C 26 05 00 04 01 58 90 31 16 2C 04 
    mSunplatesMinus = CreateButton("GUI_Button",0,0,0,0,0,0);                   //00C8 : 0F 01 30 A7 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 
    mSunplatesMinus.__OnClick__Delegate = ClickHandler;                         //00E6 : 45 19 01 30 A7 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mSunplatesMinus.mIntTag = 1;                                                //00FA : 0F 19 01 30 A7 2C 26 05 00 04 01 58 90 31 16 26 
    mQuarternailsMinus = CreateButton("GUI_Button",0,0,0,0,0,0);                //010A : 0F 01 F0 9C 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 
    mQuarternailsMinus.__OnClick__Delegate = ClickHandler;                      //0128 : 45 19 01 F0 9C 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mQuarternailsMinus.mIntTag = 3;                                             //013C : 0F 19 01 F0 9C 2C 26 05 00 04 01 58 90 31 16 2C 03 
    mLoderingsMinus = CreateButton("GUI_Button",0,0,0,0,0,0);                   //014D : 0F 01 40 4C 04 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 
    mLoderingsMinus.__OnClick__Delegate = ClickHandler;                         //016B : 45 19 01 40 4C 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mLoderingsMinus.mIntTag = 5;                                                //017F : 0F 19 01 40 4C 04 1B 05 00 04 01 58 90 31 16 2C 05 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0190 : 0F 00 E0 E4 2B 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor != None) {                                                       //01B5 : 07 CF 02 77 00 E0 E4 2B 26 2A 16 
      Editor.Register(mSunplatesPlus,"Sunplates_Plus");                         //01C0 : 19 00 E0 E4 2B 26 1B 00 00 1B 39 98 00 00 01 B8 A6 2C 26 1F 53 75 6E 70 6C 61 74 65 73 5F 50 6C 75 73 00 16 
      Editor.Register(mQuarternailsPlus,"Quarternails_Plus");                   //01E4 : 19 00 E0 E4 2B 26 1E 00 00 1B 39 98 00 00 01 70 50 04 1B 1F 51 75 61 72 74 65 72 6E 61 69 6C 73 5F 50 6C 75 73 00 16 
      Editor.Register(mLoderingsPlus,"Loderings_Plus");                         //020B : 19 00 E0 E4 2B 26 1B 00 00 1B 39 98 00 00 01 B0 99 2C 26 1F 4C 6F 64 65 72 69 6E 67 73 5F 50 6C 75 73 00 16 
      Editor.Register(mSunplatesMinus,"Sunplates_Minus");                       //022F : 19 00 E0 E4 2B 26 1C 00 00 1B 39 98 00 00 01 30 A7 2C 26 1F 53 75 6E 70 6C 61 74 65 73 5F 4D 69 6E 75 73 00 16 
      Editor.Register(mQuarternailsMinus,"Quarternails_Minus");                 //0254 : 19 00 E0 E4 2B 26 1F 00 00 1B 39 98 00 00 01 F0 9C 2C 26 1F 51 75 61 72 74 65 72 6E 61 69 6C 73 5F 4D 69 6E 75 73 00 16 
      Editor.Register(mLoderingsMinus,"Loderings_Minus");                       //027C : 19 00 E0 E4 2B 26 1C 00 00 1B 39 98 00 00 01 40 4C 04 1B 1F 4C 6F 64 65 72 69 6E 67 73 5F 4D 69 6E 75 73 00 16 
      Editor.Attach(self,"MoneyPageEditable_Medium.txt");                       //02A1 : 19 00 E0 E4 2B 26 25 00 00 1B 3F 01 00 00 17 1F 4D 6F 6E 65 79 50 61 67 65 45 64 69 74 61 62 6C 65 5F 4D 65 64 69 75 6D 2E 74 78 74 00 16 
    }
    //0F 01 B8 A6 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 45 19 
    //01 B8 A6 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 19 01 B8 A6 2C 26 05 00 04 01 58 90 31 
    //16 25 0F 01 70 50 04 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 25 25 16 
    //45 19 01 70 50 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 19 01 70 50 04 1B 05 00 04 01 58 
    //90 31 16 2C 02 0F 01 B0 99 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 
    //25 25 16 45 19 01 B0 99 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 19 01 B0 99 2C 26 05 00 
    //04 01 58 90 31 16 2C 04 0F 01 30 A7 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 
    //25 25 25 25 25 16 45 19 01 30 A7 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 19 01 30 A7 2C 
    //26 05 00 04 01 58 90 31 16 26 0F 01 F0 9C 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 
    //00 25 25 25 25 25 25 16 45 19 01 F0 9C 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 19 01 F0 
    //9C 2C 26 05 00 04 01 58 90 31 16 2C 03 0F 01 40 4C 04 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 
    //74 6F 6E 00 25 25 25 25 25 25 16 45 19 01 40 4C 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 
    //19 01 40 4C 04 1B 05 00 04 01 58 90 31 16 2C 05 0F 00 E0 E4 2B 26 2E D8 2F 32 1D 19 01 48 0C 9D 
    //19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 07 CF 02 77 00 E0 E4 2B 26 2A 16 
    //19 00 E0 E4 2B 26 1B 00 00 1B 39 98 00 00 01 B8 A6 2C 26 1F 53 75 6E 70 6C 61 74 65 73 5F 50 6C 
    //75 73 00 16 19 00 E0 E4 2B 26 1E 00 00 1B 39 98 00 00 01 70 50 04 1B 1F 51 75 61 72 74 65 72 6E 
    //61 69 6C 73 5F 50 6C 75 73 00 16 19 00 E0 E4 2B 26 1B 00 00 1B 39 98 00 00 01 B0 99 2C 26 1F 4C 
    //6F 64 65 72 69 6E 67 73 5F 50 6C 75 73 00 16 19 00 E0 E4 2B 26 1C 00 00 1B 39 98 00 00 01 30 A7 
    //2C 26 1F 53 75 6E 70 6C 61 74 65 73 5F 4D 69 6E 75 73 00 16 19 00 E0 E4 2B 26 1F 00 00 1B 39 98 
    //00 00 01 F0 9C 2C 26 1F 51 75 61 72 74 65 72 6E 61 69 6C 73 5F 4D 69 6E 75 73 00 16 19 00 E0 E4 
    //2B 26 1C 00 00 1B 39 98 00 00 01 40 4C 04 1B 1F 4C 6F 64 65 72 69 6E 67 73 5F 4D 69 6E 75 73 00 
    //16 19 00 E0 E4 2B 26 25 00 00 1B 3F 01 00 00 17 1F 4D 6F 6E 65 79 50 61 67 65 45 64 69 74 61 62 
    //6C 65 5F 4D 65 64 69 75 6D 2E 74 78 74 00 16 04 0B 47 
  }


  event Initialize() {
    mWidth = 180.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 34 43 
    mHeight = 50.00000000;                                                      //000B : 0F 01 40 88 31 16 1E 00 00 48 42 
    Super.Initialize();                                                         //0016 : 1C 50 41 33 26 16 
    SetTextColour(255,255,255);                                                 //001C : 1B 4F 97 00 00 2C FF 2C FF 2C FF 16 
    InitButtons();                                                              //0028 : 1B 79 9B 00 00 16 
    //0F 01 60 87 31 16 1E 00 00 34 43 0F 01 40 88 31 16 1E 00 00 48 42 1C 50 41 33 26 16 1B 4F 97 00 
    //00 2C FF 2C FF 2C FF 16 1B 79 9B 00 00 16 04 0B 47 
  }


  delegate OnAdjustMoney(int aDeltaAmount);



