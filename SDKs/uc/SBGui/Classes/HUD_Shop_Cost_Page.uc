//==============================================================================
//  HUD_Shop_Cost_Page
//==============================================================================

class HUD_Shop_Cost_Page extends GUI_Page
    dependsOn(HUD_MoneyPage,GUI_Button,GUI_Label,Class,SBGuiStrings)
    Transient
    Config(User)
  ;

  var private GUI_Label mLabel;
  var private HUD_MoneyPage mMoneyPage;
  var private GUI_Button mButton;


  function SetIsSelling(bool aIsSelling) {
    if (aIsSelling) {                                                           //0000 : 07 1C 00 2D 00 20 EA 35 26 
      mMoneyPage.SetCheckPurse(False);                                          //0009 : 19 01 A0 50 2B 26 07 00 00 1B 41 97 00 00 28 16 
    } else {                                                                    //0019 : 06 2C 00 
      mMoneyPage.SetCheckPurse(True);                                           //001C : 19 01 A0 50 2B 26 07 00 00 1B 41 97 00 00 27 16 
    }
    //07 1C 00 2D 00 20 EA 35 26 19 01 A0 50 2B 26 07 00 00 1B 41 97 00 00 28 16 06 2C 00 19 01 A0 50 
    //2B 26 07 00 00 1B 41 97 00 00 27 16 04 0B 47 
  }


  function AddCost(int aCost) {
    mMoneyPage.SetMoney(mMoneyPage.GetMoney() + aCost);                         //0000 : 19 01 A0 50 2B 26 1C 00 00 1B 4B 97 00 00 92 19 01 A0 50 2B 26 06 00 04 1B 76 0F 00 00 16 00 C0 EB 35 26 16 16 
    //19 01 A0 50 2B 26 1C 00 00 1B 4B 97 00 00 92 19 01 A0 50 2B 26 06 00 04 1B 76 0F 00 00 16 00 C0 
    //EB 35 26 16 16 04 0B 47 
  }


  function SetCost(int aCost) {
    mMoneyPage.SetMoney(aCost);                                                 //0000 : 19 01 A0 50 2B 26 0B 00 00 1B 4B 97 00 00 00 60 ED 35 26 16 
    //19 01 A0 50 2B 26 0B 00 00 1B 4B 97 00 00 00 60 ED 35 26 16 04 0B 47 
  }


  function SetButtonEnabled(bool aEnabled) {
    mButton.SetEnabled(aEnabled);                                               //0000 : 19 01 30 6A 04 1B 0C 00 00 1B 5F 32 00 00 2D 00 00 EF 35 26 16 
    //19 01 30 6A 04 1B 0C 00 00 1B 5F 32 00 00 2D 00 00 EF 35 26 16 04 0B 47 
  }


  function SetTexts(string aButtonText,string aLabelText) {
    mButton.SetText(aButtonText);                                               //0000 : 19 01 30 6A 04 1B 0B 00 00 1B 13 98 00 00 00 18 F1 35 26 16 
    mLabel.SetText(aLabelText);                                                 //0014 : 19 01 D8 EC 06 1B 0B 00 00 1B 13 98 00 00 00 A0 F0 35 26 16 
    //19 01 30 6A 04 1B 0B 00 00 1B 13 98 00 00 00 18 F1 35 26 16 19 01 D8 EC 06 1B 0B 00 00 1B 13 98 
    //00 00 00 A0 F0 35 26 16 04 0B 47 
  }


  function GUI_Button GetButton() {
    return mButton;                                                             //0000 : 04 01 30 6A 04 1B 
    //04 01 30 6A 04 1B 04 0B 47 
  }


  function Reset() {
    mButton.SetEnabled(False);                                                  //0000 : 19 01 30 6A 04 1B 07 00 00 1B 5F 32 00 00 28 16 
    mMoneyPage.SetMoney(0);                                                     //0010 : 19 01 A0 50 2B 26 07 00 00 1B 4B 97 00 00 25 16 
    //19 01 30 6A 04 1B 07 00 00 1B 5F 32 00 00 28 16 19 01 A0 50 2B 26 07 00 00 1B 4B 97 00 00 25 16 
    //04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    SetStdBackground(7);                                                        //0006 : 1B 22 98 00 00 2C 07 16 
    mButton = CreateButton("GUI_Button",0,2,6,(GetClientHeight() - 24) / 2,105,24);//000E : 0F 01 30 6A 04 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 06 91 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 18 16 2C 02 16 2C 69 2C 18 16 
    mButton.SetEnabled(False);                                                  //0041 : 19 01 30 6A 04 1B 07 00 00 1B 5F 32 00 00 28 16 
    mLabel = CreateLabel("GUI_Label",0,1024 | 2048 | 4096,GetClientWidth() - 161 - 6 - 80,11,80,20);//0051 : 0F 01 D8 EC 06 1B 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 04 00 00 1D 00 08 00 00 16 1D 00 10 00 00 16 39 44 AF AF AF 1B 17 98 00 00 16 39 3F 2C A1 16 39 3F 2C 06 16 39 3F 2C 50 16 2C 0B 2C 50 2C 14 16 
    mLabel.SetText(Class'SBGuiStrings'.default.cost.Text);                      //009C : 19 01 D8 EC 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 17 99 19 16 
    mMoneyPage = HUD_MoneyPage(CreatePage("HUD_MoneyPage",0,0,0,0,0,0));        //00BE : 0F 01 A0 50 2B 26 2E B0 75 30 1D 1B 16 98 00 00 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 00 25 25 25 25 25 25 16 
    mMoneyPage.SetTextFont("SBFontsTX.Verdana10");                              //00E4 : 19 01 A0 50 2B 26 1B 00 00 1B 50 97 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mMoneyPage.mTop = 5.00000000;                                               //0108 : 0F 19 01 A0 50 2B 26 05 00 04 01 80 86 31 16 1E 00 00 A0 40 
    mMoneyPage.mLeft = GetClientWidth() - 161;                                  //011C : 0F 19 01 A0 50 2B 26 05 00 04 01 08 86 31 16 AF 1B 17 98 00 00 16 39 3F 2C A1 16 
    mMoneyPage.SetCheckPurse(True);                                             //0137 : 19 01 A0 50 2B 26 07 00 00 1B 41 97 00 00 27 16 
    //1C 40 5B 9E 19 16 1B 22 98 00 00 2C 07 16 0F 01 30 6A 04 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 
    //74 74 6F 6E 00 25 2C 02 2C 06 91 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 18 16 2C 02 16 2C 69 2C 18 
    //16 19 01 30 6A 04 1B 07 00 00 1B 5F 32 00 00 28 16 0F 01 D8 EC 06 1B 1B 20 98 00 00 1F 47 55 49 
    //5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 04 00 00 1D 00 08 00 00 16 1D 00 10 00 00 16 39 44 AF AF AF 
    //1B 17 98 00 00 16 39 3F 2C A1 16 39 3F 2C 06 16 39 3F 2C 50 16 2C 0B 2C 50 2C 14 16 19 01 D8 EC 
    //06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 17 99 19 16 0F 01 
    //A0 50 2B 26 2E B0 75 30 1D 1B 16 98 00 00 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 00 25 25 25 
    //25 25 25 16 19 01 A0 50 2B 26 1B 00 00 1B 50 97 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 
    //64 61 6E 61 31 30 00 16 0F 19 01 A0 50 2B 26 05 00 04 01 80 86 31 16 1E 00 00 A0 40 0F 19 01 A0 
    //50 2B 26 05 00 04 01 08 86 31 16 AF 1B 17 98 00 00 16 39 3F 2C A1 16 19 01 A0 50 2B 26 07 00 00 
    //1B 41 97 00 00 27 16 04 0B 47 
  }



