//==============================================================================
//  GUI_MinMaxEdit
//==============================================================================

class GUI_MinMaxEdit extends GUI_Page
    dependsOn(GUI_EditBox,GUI_Label)
    Transient
    Config(User)
  ;

  const GUI_MME_HORZ_MARGIN =  4;
  const GUI_MME_EDITBOX_HEIGHT =  25;
  const GUI_MME_EDITBOX_WIDTH =  50;
  const GUI_MME_LABEL_HEIGHT =  25;
  const GUI_MME_LABEL_WIDTH =  32;
  var GUI_Label mMinValueLabel;
  var GUI_EditBox mMinValueEditBox;
  var GUI_Label mMaxValueLabel;
  var GUI_EditBox mMaxValueEditBox;
  var (null);
  var (null);
  var (null);


  function bool OnMaxValueChanged(GUI_EditBox editBox) {
    OnMaxValueChange();                                                         //0000 : 43 A0 FD 35 26 33 9B 00 00 16 
    OnValueChange();                                                            //000A : 43 90 8A 33 26 EE 99 00 00 16 
    return True;                                                                //0014 : 04 27 
    //43 A0 FD 35 26 33 9B 00 00 16 43 90 8A 33 26 EE 99 00 00 16 04 27 04 0B 47 
  }


  function bool OnMinValueChanged(GUI_EditBox editBox) {
    OnMinValueChange();                                                         //0000 : 43 C8 FE 35 26 32 9B 00 00 16 
    OnValueChange();                                                            //000A : 43 90 8A 33 26 EE 99 00 00 16 
    return True;                                                                //0014 : 04 27 
    //43 C8 FE 35 26 32 9B 00 00 16 43 90 8A 33 26 EE 99 00 00 16 04 27 04 0B 47 
  }


  function SetMaxValue(int MaxValue) {
    mMaxValueEditBox.SetText("" $ string(MaxValue));                            //0000 : 19 01 68 EA 8A 19 11 00 00 1B 13 98 00 00 70 1F 00 39 53 00 D8 FA 35 26 16 16 
    //19 01 68 EA 8A 19 11 00 00 1B 13 98 00 00 70 1F 00 39 53 00 D8 FA 35 26 16 16 04 0B 47 
  }


  function SetMinValue(int MinValue) {
    mMinValueEditBox.SetText("" $ string(MinValue));                            //0000 : 19 01 78 E9 8A 19 11 00 00 1B 13 98 00 00 70 1F 00 39 53 00 78 FC 35 26 16 16 
    //19 01 78 E9 8A 19 11 00 00 1B 13 98 00 00 70 1F 00 39 53 00 78 FC 35 26 16 16 04 0B 47 
  }


  function int GetMaxValue() {
    return int(mMaxValueEditBox.GetText());                                     //0000 : 04 39 4A 19 01 68 EA 8A 19 06 00 00 1B 92 0C 00 00 16 
    //04 39 4A 19 01 68 EA 8A 19 06 00 00 1B 92 0C 00 00 16 04 0B 47 
  }


  function int GetMinValue() {
    return int(mMinValueEditBox.GetText());                                     //0000 : 04 39 4A 19 01 78 E9 8A 19 06 00 00 1B 92 0C 00 00 16 
    //04 39 4A 19 01 78 E9 8A 19 06 00 00 1B 92 0C 00 00 16 04 0B 47 
  }


  event SetEnabled(bool State) {
    mMinValueEditBox.SetEnabled(State);                                         //0000 : 19 01 78 E9 8A 19 0C 00 00 1B 5F 32 00 00 2D 00 38 88 33 26 16 
    mMaxValueEditBox.SetEnabled(State);                                         //0015 : 19 01 68 EA 8A 19 0C 00 00 1B 5F 32 00 00 2D 00 38 88 33 26 16 
    //19 01 78 E9 8A 19 0C 00 00 1B 5F 32 00 00 2D 00 38 88 33 26 16 19 01 68 EA 8A 19 0C 00 00 1B 5F 
    //32 00 00 2D 00 38 88 33 26 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mMinValueLabel = CreateLabel("GUI_Label",524288,256 | 2048,0,0,32,25);      //0006 : 0F 01 00 56 07 1B 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 01 00 00 1D 00 08 00 00 16 25 25 2C 20 2C 19 16 
    mMinValueLabel.SetAnchors(0.00000000,0.00000000,0.00000000,0.00000000);     //0034 : 19 01 00 56 07 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mMinValueLabel.SetText("Min:");                                             //0057 : 19 01 00 56 07 1B 0C 00 00 1B 13 98 00 00 1F 4D 69 6E 3A 00 16 
    mMinValueEditBox = CreateEditBox("GUI_EditBox",4194304,0,32 + 4,0,50,25);   //006C : 0F 01 78 E9 8A 19 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 25 92 2C 20 2C 04 16 25 2C 32 2C 19 16 
    mMinValueEditBox.SetAnchors(0.00000000,0.00000000,0.00000000,0.00000000);   //0096 : 19 01 78 E9 8A 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mMinValueEditBox.SetColor(255.00000000,255.00000000,255.00000000);          //00B9 : 19 01 78 E9 8A 19 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mMinValueEditBox.SetBorder(10,3,10,3,"windowsizableframe");                 //00D7 : 19 01 78 E9 8A 19 22 00 00 1B 2B 98 00 00 2C 0A 2C 03 2C 0A 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mMinValueEditBox.SetNumericalLimitation(True,False,False);                  //0102 : 19 01 78 E9 8A 19 09 00 00 1B B8 98 00 00 27 28 28 16 
    mMinValueEditBox.__OnTextChanged__Delegate = OnMinValueChanged;             //0114 : 45 19 01 78 E9 8A 19 05 00 08 01 10 CF A4 19 44 34 9B 00 00 
    mMaxValueLabel = CreateLabel("GUI_Label",524288,256 | 2048,32 + 50 + 2 * 4,0,32,25);//0128 : 0F 01 20 54 07 1B 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 01 00 00 1D 00 08 00 00 16 92 92 2C 20 2C 32 16 90 2C 02 2C 04 16 16 25 2C 20 2C 19 16 
    mMaxValueLabel.SetAnchors(0.00000000,0.00000000,0.00000000,0.00000000);     //0163 : 19 01 20 54 07 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mMaxValueLabel.SetText("Max:");                                             //0186 : 19 01 20 54 07 1B 0C 00 00 1B 13 98 00 00 1F 4D 61 78 3A 00 16 
    mMaxValueEditBox = CreateEditBox("GUI_EditBox",4194304,0,2 * 32 + 50 + 3 * 4,0,50,25);//019B : 0F 01 68 EA 8A 19 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 25 92 92 90 2C 02 2C 20 16 2C 32 16 90 2C 03 2C 04 16 16 25 2C 32 2C 19 16 
    mMaxValueEditBox.SetAnchors(0.00000000,0.00000000,0.00000000,0.00000000);   //01D1 : 19 01 68 EA 8A 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mMaxValueEditBox.SetColor(255.00000000,255.00000000,255.00000000);          //01F4 : 19 01 68 EA 8A 19 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mMaxValueEditBox.SetBorder(10,3,10,3,"windowsizableframe");                 //0212 : 19 01 68 EA 8A 19 22 00 00 1B 2B 98 00 00 2C 0A 2C 03 2C 0A 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mMaxValueEditBox.SetNumericalLimitation(True,False,False);                  //023D : 19 01 68 EA 8A 19 09 00 00 1B B8 98 00 00 27 28 28 16 
    mMaxValueEditBox.__OnTextChanged__Delegate = OnMaxValueChanged;             //024F : 45 19 01 68 EA 8A 19 05 00 08 01 10 CF A4 19 44 39 9B 00 00 
    //1C 40 5B 9E 19 16 0F 01 00 56 07 1B 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 
    //00 9E 1D 00 01 00 00 1D 00 08 00 00 16 25 25 2C 20 2C 19 16 19 01 00 56 07 1B 1A 00 00 1B 24 98 
    //00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 19 01 00 56 07 1B 0C 00 00 
    //1B 13 98 00 00 1F 4D 69 6E 3A 00 16 0F 01 78 E9 8A 19 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 
    //42 6F 78 00 1D 00 00 40 00 25 92 2C 20 2C 04 16 25 2C 32 2C 19 16 19 01 78 E9 8A 19 1A 00 00 1B 
    //24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 19 01 78 E9 8A 19 15 
    //00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 19 01 78 E9 8A 19 22 00 00 
    //1B 2B 98 00 00 2C 0A 2C 03 2C 0A 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 
    //00 16 19 01 78 E9 8A 19 09 00 00 1B B8 98 00 00 27 28 28 16 45 19 01 78 E9 8A 19 05 00 08 01 10 
    //CF A4 19 44 34 9B 00 00 0F 01 20 54 07 1B 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 
    //00 08 00 9E 1D 00 01 00 00 1D 00 08 00 00 16 92 92 2C 20 2C 32 16 90 2C 02 2C 04 16 16 25 2C 20 
    //2C 19 16 19 01 20 54 07 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 
    //1E 00 00 00 00 16 19 01 20 54 07 1B 0C 00 00 1B 13 98 00 00 1F 4D 61 78 3A 00 16 0F 01 68 EA 8A 
    //19 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 25 92 92 90 2C 02 2C 20 
    //16 2C 32 16 90 2C 03 2C 04 16 16 25 2C 32 2C 19 16 19 01 68 EA 8A 19 1A 00 00 1B 24 98 00 00 1E 
    //00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 19 01 68 EA 8A 19 15 00 00 1B 19 98 
    //00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 19 01 68 EA 8A 19 22 00 00 1B 2B 98 00 00 
    //2C 0A 2C 03 2C 0A 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 19 01 68 
    //EA 8A 19 09 00 00 1B B8 98 00 00 27 28 28 16 45 19 01 68 EA 8A 19 05 00 08 01 10 CF A4 19 44 39 
    //9B 00 00 04 0B 47 
  }


  delegate OnValueChange();


  delegate OnMaxValueChange();


  delegate OnMinValueChange();



