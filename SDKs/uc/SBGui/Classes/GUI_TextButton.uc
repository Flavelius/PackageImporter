//==============================================================================
//  GUI_TextButton
//==============================================================================

class GUI_TextButton extends GUI_TextCtrl
    native
    dependsOn(Class,GUI_BaseDesktop)
    Transient
    Config(User)
  ;

  var int mButtonStyle;
  var bool mHilited;
  var bool mChecked;
  var private GUI_Image mHiliteImage;
  var private GUI_Image mButtonImage;
  var private GUI_Image mButtonImage1;
  var private GUI_Image mButtonImage2;
  var private GUI_Image mButtonImage3;
  var private GUI_Image mButtonImage4;
  var private GUI_Image mButtonImage5;
  var private GUI_Image mButtonImage6;
  var private Color mSelectedColor;
  var private Color mUnselectedColor;
  var private Color mSelectedBackgroundColor;
  var private Color mUnselectedBackgroundColor;
  var private bool mPressed;
  var (null);


  function SetUnselectedSolidBackground(int R,int G,int B,int A) {
    mUnselectedBackgroundColor.R = R;                                           //0000 : 0F 36 D0 90 6A 0F 01 50 16 A5 19 39 3D 00 D8 15 A5 19 
    mUnselectedBackgroundColor.G = G;                                           //0012 : 0F 36 58 90 6A 0F 01 50 16 A5 19 39 3D 00 C8 16 A5 19 
    mUnselectedBackgroundColor.B = B;                                           //0024 : 0F 36 E0 8F 6A 0F 01 50 16 A5 19 39 3D 00 40 17 A5 19 
    mUnselectedBackgroundColor.A = A;                                           //0036 : 0F 36 48 91 6A 0F 01 50 16 A5 19 39 3D 00 B8 17 A5 19 
    //0F 36 D0 90 6A 0F 01 50 16 A5 19 39 3D 00 D8 15 A5 19 0F 36 58 90 6A 0F 01 50 16 A5 19 39 3D 00 
    //C8 16 A5 19 0F 36 E0 8F 6A 0F 01 50 16 A5 19 39 3D 00 40 17 A5 19 0F 36 48 91 6A 0F 01 50 16 A5 
    //19 39 3D 00 B8 17 A5 19 04 0B 47 
  }


  function SetSelectedSolidBackground(int R,int G,int B,int A) {
    mSelectedBackgroundColor.R = R;                                             //0000 : 0F 36 D0 90 6A 0F 01 58 19 A5 19 39 3D 00 E0 18 A5 19 
    mSelectedBackgroundColor.G = G;                                             //0012 : 0F 36 58 90 6A 0F 01 58 19 A5 19 39 3D 00 D0 19 A5 19 
    mSelectedBackgroundColor.B = B;                                             //0024 : 0F 36 E0 8F 6A 0F 01 58 19 A5 19 39 3D 00 48 1A A5 19 
    mSelectedBackgroundColor.A = A;                                             //0036 : 0F 36 48 91 6A 0F 01 58 19 A5 19 39 3D 00 C0 1A A5 19 
    //0F 36 D0 90 6A 0F 01 58 19 A5 19 39 3D 00 E0 18 A5 19 0F 36 58 90 6A 0F 01 58 19 A5 19 39 3D 00 
    //D0 19 A5 19 0F 36 E0 8F 6A 0F 01 58 19 A5 19 39 3D 00 48 1A A5 19 0F 36 48 91 6A 0F 01 58 19 A5 
    //19 39 3D 00 C0 1A A5 19 04 0B 47 
  }


  function SetColor(int R,int G,int B,int A) {
    mUnselectedColor.R = R;                                                     //0000 : 0F 36 D0 90 6A 0F 01 18 1D A5 19 39 3D 00 E8 1B A5 19 
    mUnselectedColor.G = G;                                                     //0012 : 0F 36 58 90 6A 0F 01 18 1D A5 19 39 3D 00 90 1D A5 19 
    mUnselectedColor.B = B;                                                     //0024 : 0F 36 E0 8F 6A 0F 01 18 1D A5 19 39 3D 00 08 1E A5 19 
    mUnselectedColor.A = A;                                                     //0036 : 0F 36 48 91 6A 0F 01 18 1D A5 19 39 3D 00 80 1E A5 19 
    Super.SetColor(R,G,B,A);                                                    //0048 : 1C 68 FF A4 19 00 E8 1B A5 19 00 90 1D A5 19 00 08 1E A5 19 00 80 1E A5 19 16 
    //0F 36 D0 90 6A 0F 01 18 1D A5 19 39 3D 00 E8 1B A5 19 0F 36 58 90 6A 0F 01 18 1D A5 19 39 3D 00 
    //90 1D A5 19 0F 36 E0 8F 6A 0F 01 18 1D A5 19 39 3D 00 08 1E A5 19 0F 36 48 91 6A 0F 01 18 1D A5 
    //19 39 3D 00 80 1E A5 19 1C 68 FF A4 19 00 E8 1B A5 19 00 90 1D A5 19 00 08 1E A5 19 00 80 1E A5 
    //19 16 04 0B 47 
  }


  function SetSelectedColor(int R,int G,int B,int A) {
    mSelectedColor.R = R;                                                       //0000 : 0F 36 D0 90 6A 0F 01 B0 20 A5 19 39 3D 00 A8 1F A5 19 
    mSelectedColor.G = G;                                                       //0012 : 0F 36 58 90 6A 0F 01 B0 20 A5 19 39 3D 00 28 21 A5 19 
    mSelectedColor.B = B;                                                       //0024 : 0F 36 E0 8F 6A 0F 01 B0 20 A5 19 39 3D 00 A0 21 A5 19 
    mSelectedColor.A = A;                                                       //0036 : 0F 36 48 91 6A 0F 01 B0 20 A5 19 39 3D 00 18 22 A5 19 
    //0F 36 D0 90 6A 0F 01 B0 20 A5 19 39 3D 00 A8 1F A5 19 0F 36 58 90 6A 0F 01 B0 20 A5 19 39 3D 00 
    //28 21 A5 19 0F 36 E0 8F 6A 0F 01 B0 20 A5 19 39 3D 00 A0 21 A5 19 0F 36 48 91 6A 0F 01 B0 20 A5 
    //19 39 3D 00 18 22 A5 19 04 0B 47 
  }


  function SetButtonImage(int num) {
    switch (num) {                                                              //0000 : 05 04 00 40 23 A5 19 
      case 0 :                                                                  //0007 : 0A 19 00 25 
        mButtonImage = mButtonImage1;                                           //000B : 0F 01 90 24 A5 19 01 08 25 A5 19 
        break;                                                                  //0016 : 06 7A 00 
      case 1 :                                                                  //0019 : 0A 2B 00 26 
        mButtonImage = mButtonImage2;                                           //001D : 0F 01 90 24 A5 19 01 80 25 A5 19 
        break;                                                                  //0028 : 06 7A 00 
      case 2 :                                                                  //002B : 0A 3E 00 2C 02 
        mButtonImage = mButtonImage3;                                           //0030 : 0F 01 90 24 A5 19 01 F8 25 A5 19 
        break;                                                                  //003B : 06 7A 00 
      case 3 :                                                                  //003E : 0A 51 00 2C 03 
        mButtonImage = mButtonImage4;                                           //0043 : 0F 01 90 24 A5 19 01 70 26 A5 19 
        break;                                                                  //004E : 06 7A 00 
      case 4 :                                                                  //0051 : 0A 64 00 2C 04 
        mButtonImage = mButtonImage5;                                           //0056 : 0F 01 90 24 A5 19 01 E8 26 A5 19 
        break;                                                                  //0061 : 06 7A 00 
      case 5 :                                                                  //0064 : 0A 77 00 2C 05 
        mButtonImage = mButtonImage6;                                           //0069 : 0F 01 90 24 A5 19 01 60 27 A5 19 
        break;                                                                  //0074 : 06 7A 00 
      default:                                                                  //0077 : 0A FF FF 
    }
    //05 04 00 40 23 A5 19 0A 19 00 25 0F 01 90 24 A5 19 01 08 25 A5 19 06 7A 00 0A 2B 00 26 0F 01 90 
    //24 A5 19 01 80 25 A5 19 06 7A 00 0A 3E 00 2C 02 0F 01 90 24 A5 19 01 F8 25 A5 19 06 7A 00 0A 51 
    //00 2C 03 0F 01 90 24 A5 19 01 70 26 A5 19 06 7A 00 0A 64 00 2C 04 0F 01 90 24 A5 19 01 E8 26 A5 
    //19 06 7A 00 0A 77 00 2C 05 0F 01 90 24 A5 19 01 60 27 A5 19 06 7A 00 0A FF FF 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 70 AF A4 19 16 
    if ((mButtonStyle & Class'GUI_BaseDesktop'.2) != 0) {                       //0006 : 07 63 00 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 
      SetBackground("normalbutton","SBGuiTX.GUI_Styles","GUI_Styles");          //001E : 1B 1A 98 00 00 1F 6E 6F 72 6D 61 6C 62 75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
      SetBorder(4,4,4,4);                                                       //0052 : 1B 2B 98 00 00 2C 04 2C 04 2C 04 2C 04 16 
    } else {                                                                    //0060 : 06 8D 04 
      if ((mButtonStyle & Class'GUI_BaseDesktop'.1048576) != 0) {               //0063 : 07 CE 00 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 05 00 04 1D 00 00 10 00 16 25 16 
        mLabelStyle = 0;                                                        //007E : 0F 01 20 CC A2 19 25 
        mHiliteImage = CreateImage("selecttext","SBGuiTX.GUI_Styles","GUI_Styles");//0085 : 0F 01 70 2F A5 19 1B 26 98 00 00 1F 73 65 6C 65 63 74 74 65 78 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
        SetBorder(30,4,14,4);                                                   //00BD : 1B 2B 98 00 00 2C 1E 2C 04 2C 0E 2C 04 16 
      } else {                                                                  //00CB : 06 8D 04 
        if ((mButtonStyle & Class'GUI_BaseDesktop'.2097152) != 0) {             //00CE : 07 82 01 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 05 00 04 1D 00 00 20 00 16 25 16 
          mLabelStyle = 0;                                                      //00E9 : 0F 01 20 CC A2 19 25 
          mHiliteImage = CreateImage("selecttext","SBGuiTX.GUI_Styles","GUI_Styles");//00F0 : 0F 01 70 2F A5 19 1B 26 98 00 00 1F 73 65 6C 65 63 74 74 65 78 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
          mButtonImage1 = CreateImage("ScrollArrowRight","SBGuiTX.GUI_Styles","GUI_Styles");//0128 : 0F 01 08 25 A5 19 1B 26 98 00 00 1F 53 63 72 6F 6C 6C 41 72 72 6F 77 52 69 67 68 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
          mButtonImage = mButtonImage1;                                         //0166 : 0F 01 90 24 A5 19 01 08 25 A5 19 
          SetBorder(30,4,14,4);                                                 //0171 : 1B 2B 98 00 00 2C 1E 2C 04 2C 0E 2C 04 16 
        } else {                                                                //017F : 06 8D 04 
          if ((mButtonStyle & Class'GUI_BaseDesktop'.4) != 0) {                 //0182 : 07 6F 02 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 
            mLabelStyle = Class'GUI_BaseDesktop'.4096;                          //019A : 0F 01 20 CC A2 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 
            mHiliteImage = CreateImage("selecttext","SBGuiTX.GUI_Styles","GUI_Styles");//01AE : 0F 01 70 2F A5 19 1B 26 98 00 00 1F 73 65 6C 65 63 74 74 65 78 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
            mButtonImage1 = CreateImage("checkbox","SBGuiTX.GUI_Styles","GUI_Styles");//01E6 : 0F 01 08 25 A5 19 1B 26 98 00 00 1F 63 68 65 63 6B 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
            mButtonImage2 = CreateImage("checkboxv","SBGuiTX.GUI_Styles","GUI_Styles");//021C : 0F 01 80 25 A5 19 1B 26 98 00 00 1F 63 68 65 63 6B 62 6F 78 76 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
            mButtonImage = mButtonImage1;                                       //0253 : 0F 01 90 24 A5 19 01 08 25 A5 19 
            SetBorder(30,4,14,4);                                               //025E : 1B 2B 98 00 00 2C 1E 2C 04 2C 0E 2C 04 16 
          } else {                                                              //026C : 06 8D 04 
            if ((mButtonStyle & Class'GUI_BaseDesktop'.16) != 0) {              //026F : 07 8D 04 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 02 00 04 2C 10 16 25 16 
              mLabelStyle = Class'GUI_BaseDesktop'.4096;                        //0287 : 0F 01 20 CC A2 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 
              mButtonImage1 = CreateImage("conversation_icons_accept","SBGuiTX.GUI_Styles","GUI_Styles");//029B : 0F 01 08 25 A5 19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 61 63 63 65 70 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
              mButtonImage2 = CreateImage("conversation_icons_decline","SBGuiTX.GUI_Styles","GUI_Styles");//02E2 : 0F 01 80 25 A5 19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 64 65 63 6C 69 6E 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
              mButtonImage3 = CreateImage("conversation_icons_scroll","SBGuiTX.GUI_Styles","GUI_Styles");//032A : 0F 01 F8 25 A5 19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 73 63 72 6F 6C 6C 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
              mButtonImage4 = CreateImage("conversation_icons_bubble","SBGuiTX.GUI_Styles","GUI_Styles");//0371 : 0F 01 70 26 A5 19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 62 75 62 62 6C 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
              mButtonImage5 = CreateImage("conversation_icons_leave","SBGuiTX.GUI_Styles","GUI_Styles");//03B8 : 0F 01 E8 26 A5 19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 6C 65 61 76 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
              mButtonImage6 = CreateImage("contextarrow","SBGuiTX.GUI_Styles","GUI_Styles");//03FE : 0F 01 60 27 A5 19 1B 26 98 00 00 1F 63 6F 6E 74 65 78 74 61 72 72 6F 77 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
              mButtonImage = mButtonImage1;                                     //0438 : 0F 01 90 24 A5 19 01 08 25 A5 19 
              mHiliteImage = CreateImage("RolloverWhiteBar","SBGuiTX.GUI_Styles","GUI_Styles");//0443 : 0F 01 70 2F A5 19 1B 26 98 00 00 1F 52 6F 6C 6C 6F 76 65 72 57 68 69 74 65 42 61 72 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
              SetBorder(30,0,0,3);                                              //0481 : 1B 2B 98 00 00 2C 1E 25 25 2C 03 16 
            }
          }
        }
      }
    }
    //1C 70 AF A4 19 16 07 63 00 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 1B 1A 
    //98 00 00 1F 6E 6F 72 6D 61 6C 62 75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 
    //79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1B 2B 98 00 00 2C 04 2C 04 2C 04 2C 04 16 
    //06 8D 04 07 CE 00 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 05 00 04 1D 00 00 10 00 16 25 16 0F 01 
    //20 CC A2 19 25 0F 01 70 2F A5 19 1B 26 98 00 00 1F 73 65 6C 65 63 74 74 65 78 74 00 1F 53 42 47 
    //75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1B 2B 98 
    //00 00 2C 1E 2C 04 2C 0E 2C 04 16 06 8D 04 07 82 01 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 05 00 
    //04 1D 00 00 20 00 16 25 16 0F 01 20 CC A2 19 25 0F 01 70 2F A5 19 1B 26 98 00 00 1F 73 65 6C 65 
    //63 74 74 65 78 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 
    //53 74 79 6C 65 73 00 16 0F 01 08 25 A5 19 1B 26 98 00 00 1F 53 63 72 6F 6C 6C 41 72 72 6F 77 52 
    //69 67 68 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 
    //79 6C 65 73 00 16 0F 01 90 24 A5 19 01 08 25 A5 19 1B 2B 98 00 00 2C 1E 2C 04 2C 0E 2C 04 16 06 
    //8D 04 07 6F 02 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 0F 01 20 CC A2 19 
    //12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 0F 01 70 2F A5 19 1B 26 98 00 00 1F 73 65 6C 65 63 74 
    //74 65 78 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 
    //79 6C 65 73 00 16 0F 01 08 25 A5 19 1B 26 98 00 00 1F 63 68 65 63 6B 62 6F 78 00 1F 53 42 47 75 
    //69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 80 25 
    //A5 19 1B 26 98 00 00 1F 63 68 65 63 6B 62 6F 78 76 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 
    //74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 90 24 A5 19 01 08 25 A5 19 1B 2B 
    //98 00 00 2C 1E 2C 04 2C 0E 2C 04 16 06 8D 04 07 8D 04 9B 9C 01 F8 2E A5 19 12 20 00 68 D7 00 02 
    //00 04 2C 10 16 25 16 0F 01 20 CC A2 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 0F 01 08 25 A5 
    //19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 61 63 63 65 70 74 
    //00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 
    //00 16 0F 01 80 25 A5 19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 
    //5F 64 65 63 6C 69 6E 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 
    //49 5F 53 74 79 6C 65 73 00 16 0F 01 F8 25 A5 19 1B 26 98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 
    //6F 6E 5F 69 63 6F 6E 73 5F 73 63 72 6F 6C 6C 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 
    //6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 70 26 A5 19 1B 26 98 00 00 1F 63 6F 6E 
    //76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 62 75 62 62 6C 65 00 1F 53 42 47 75 69 54 58 2E 
    //47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 E8 26 A5 19 1B 26 
    //98 00 00 1F 63 6F 6E 76 65 72 73 61 74 69 6F 6E 5F 69 63 6F 6E 73 5F 6C 65 61 76 65 00 1F 53 42 
    //47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 
    //60 27 A5 19 1B 26 98 00 00 1F 63 6F 6E 74 65 78 74 61 72 72 6F 77 00 1F 53 42 47 75 69 54 58 2E 
    //47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 90 24 A5 19 01 08 
    //25 A5 19 0F 01 70 2F A5 19 1B 26 98 00 00 1F 52 6F 6C 6C 6F 76 65 72 57 68 69 74 65 42 61 72 00 
    //1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 
    //16 1B 2B 98 00 00 2C 1E 25 25 2C 03 16 04 0B 47 
  }


  delegate bool OnCheck(GUI_TextButton clickedButton,bool checkState);



