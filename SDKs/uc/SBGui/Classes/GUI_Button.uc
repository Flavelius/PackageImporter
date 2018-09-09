//==============================================================================
//  GUI_Button
//==============================================================================

class GUI_Button extends GUI_Label
    native
    dependsOn(Class,GUI_BaseDesktop,GUI_Desktop,GUI_Sounds)
    Transient
    Config(User)
  ;

  var int mButtonStyle;
  var GUI_Image mCheckImage;
  var private float mEnabledBackgroundColors[4];
  var private float mEnabledTextColors[4];
  var private float mDisabledColors[4];
  var private bool mChecked;
  var (null);


  native function SetChecked(bool aChecked);


  function bool isChecked() {
    return mChecked;                                                            //0000 : 04 2D 01 F0 E3 A1 19 
    //04 2D 01 F0 E3 A1 19 04 0B 47 
  }


  native function bool IsPressed();


  native function SetDisabledColors(float R,float G,float B,optional float A);


  function bool PostDrawHandler(Canvas aCanvas) {
    if ((mButtonStyle & Class'GUI_BaseDesktop'.4) != 0
      && mChecked) {     //0000 : 07 3D 00 82 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 18 07 00 2D 01 F0 E3 A1 19 16 
      DrawImage(aCanvas,mCheckImage,0.00000000,-1.00000000);                    //0023 : 1B A7 9B 00 00 00 48 E9 A1 19 01 38 EA A1 19 1E 00 00 00 00 1E 00 00 80 BF 16 
    }
    return False;                                                               //003D : 04 28 
    //07 3D 00 82 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 18 07 00 2D 01 F0 E3 
    //A1 19 16 1B A7 9B 00 00 00 48 E9 A1 19 01 38 EA A1 19 1E 00 00 00 00 1E 00 00 80 BF 16 04 28 04 
    //0B 47 
  }


  event PlayButtonSound() {
    if ((mButtonStyle & Class'GUI_BaseDesktop'.4) != 0) {                       //0000 : 07 38 00 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.BoxCheck);                   //0018 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 80 EC A1 19 16 
    } else {                                                                    //0035 : 06 55 00 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.ButtonPress);                //0038 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 F8 EC A1 19 16 
    }
    //07 38 00 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 19 01 48 0C 9D 19 14 00 
    //00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 80 EC A1 19 16 06 55 00 19 01 48 0C 9D 19 14 00 
    //00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 F8 EC A1 19 16 04 0B 47 
  }


  event Initialize() {
    local GUI_Component topLevelOwner;
    mLabelStyle = mLabelStyle | Class'GUI_BaseDesktop'.512 | Class'GUI_BaseDesktop'.2048;//0000 : 0F 01 08 DA A1 19 9E 9E 01 08 DA A1 19 12 20 00 68 D7 00 05 00 04 1D 00 02 00 00 16 12 20 00 68 D7 00 05 00 04 1D 00 08 00 00 16 
    if ((mButtonStyle & Class'GUI_BaseDesktop'.65536) != 0
      || (mButtonStyle & Class'GUI_BaseDesktop'.2) != 0) {//002B : 07 7B 00 84 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 05 00 04 1D 00 00 01 00 16 25 16 18 16 00 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 16 
      mLabelStyle = mLabelStyle | Class'GUI_BaseDesktop'.4096;                  //0060 : 0F 01 08 DA A1 19 9E 01 08 DA A1 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 16 
    }
    if ((mButtonStyle & Class'GUI_BaseDesktop'.2) != 0) {                       //007B : 07 D7 00 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 
      SetBackground("normalbutton","SBGuiTX.GUI_Styles","GUI_Styles");          //0093 : 1B 1A 98 00 00 1F 6E 6F 72 6D 61 6C 62 75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
      SetTextBorder(5.00000000,3.00000000);                                     //00C7 : 1B 49 98 00 00 1E 00 00 A0 40 1E 00 00 40 40 16 
    }
    if ((mButtonStyle & Class'GUI_BaseDesktop'.4) != 0) {                       //00D7 : 07 56 01 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 
      SetBackground("checkbox","SBGuiTX.GUI_Styles","GUI_Styles");              //00EF : 1B 1A 98 00 00 1F 63 68 65 63 6B 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
      mCheckImage = CreateImage("checkboxv","SBGuiTX.GUI_Styles","GUI_Styles"); //011F : 0F 01 38 EA A1 19 1B 26 98 00 00 1F 63 68 65 63 6B 62 6F 78 76 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    }
    Super.Initialize();                                                         //0156 : 1C A8 D8 A1 19 16 
    topLevelOwner = GetTopLevelOwner();                                         //015C : 0F 00 20 EE A1 19 1B CB 9B 00 00 16 
    __OnPostDraw__Delegate = PostDrawHandler;                                   //0168 : 45 01 F8 E5 9D 19 44 49 99 00 00 
    if ((mComponentStyle & Class'GUI_BaseDesktop'.2097152) > 0) {               //0173 : 07 A1 01 97 9C 01 80 DC 9D 19 12 20 00 68 D7 00 05 00 04 1D 00 00 20 00 16 25 16 
      mMouseOverCursor = 8;                                                     //018E : 0F 01 20 7D 9D 19 2C 08 
      mMouseDownCursor = 9;                                                     //0196 : 0F 01 A0 E3 9D 19 2C 09 
    } else {                                                                    //019E : 06 AF 01 
      mMouseOverCursor = 0;                                                     //01A1 : 0F 01 20 7D 9D 19 25 
      mMouseDownCursor = 0;                                                     //01A8 : 0F 01 A0 E3 9D 19 25 
    }
    //0F 01 08 DA A1 19 9E 9E 01 08 DA A1 19 12 20 00 68 D7 00 05 00 04 1D 00 02 00 00 16 12 20 00 68 
    //D7 00 05 00 04 1D 00 08 00 00 16 07 7B 00 84 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 05 00 04 1D 
    //00 00 01 00 16 25 16 18 16 00 9B 9C 01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 16 
    //0F 01 08 DA A1 19 9E 01 08 DA A1 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 16 07 D7 00 9B 9C 
    //01 C0 E9 A1 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 1B 1A 98 00 00 1F 6E 6F 72 6D 61 6C 62 
    //75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 
    //74 79 6C 65 73 00 16 1B 49 98 00 00 1E 00 00 A0 40 1E 00 00 40 40 16 07 56 01 9B 9C 01 C0 E9 A1 
    //19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 1B 1A 98 00 00 1F 63 68 65 63 6B 62 6F 78 00 1F 53 
    //42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 
    //01 38 EA A1 19 1B 26 98 00 00 1F 63 68 65 63 6B 62 6F 78 76 00 1F 53 42 47 75 69 54 58 2E 47 55 
    //49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1C A8 D8 A1 19 16 0F 00 20 EE 
    //A1 19 1B CB 9B 00 00 16 45 01 F8 E5 9D 19 44 49 99 00 00 07 A1 01 97 9C 01 80 DC 9D 19 12 20 00 
    //68 D7 00 05 00 04 1D 00 00 20 00 16 25 16 0F 01 20 7D 9D 19 2C 08 0F 01 A0 E3 9D 19 2C 09 06 AF 
    //01 0F 01 20 7D 9D 19 25 0F 01 A0 E3 9D 19 25 04 0B 47 
  }


  delegate bool OnCheck(GUI_Button clickedButton,bool checkState);



