//==============================================================================
//  GUI_MessageBox
//==============================================================================

class GUI_MessageBox extends GUI_Window
    native
    dependsOn(GUI_Component,GUI_TextCtrl)
    Transient
    Config(User)
  ;

  var int mMessageBoxStyle;
  var array<GUI_Button> mButtons;
  var GUI_Component mOwner;
  var GUI_Page mMessagePage;
  var GUI_Page mButtonPage;
  var GUI_TextCtrl mTextCtrl;
  var int mMinMessageHeight;
  var bool mWasDesktopActive;


  event bool HandleKeyEvent(GUI_Component component,out byte Key,out byte State,float delta) {
    local int i;
    if (State == 3 && Key == 13) {                                              //0000 : 07 77 00 82 9A 39 3A 00 E0 A7 A6 19 2C 03 16 18 0C 00 9A 39 3A 00 58 A8 A6 19 2C 0D 16 16 
      i = 0;                                                                    //001E : 0F 00 D0 A8 A6 19 25 
      while (i < mButtons.Length) {                                             //0025 : 07 77 00 96 00 D0 A8 A6 19 37 01 48 A9 A6 19 16 
        switch (mButtons[i].mIntTag) {                                          //0035 : 05 04 19 10 00 D0 A8 A6 19 01 48 A9 A6 19 05 00 04 01 58 90 31 16 
          case 4 :                                                              //004B : 0A 50 00 2C 04 
          case 1 :                                                              //0050 : 0A 67 00 26 
            ClickHandler(mButtons[i]);                                          //0054 : 1B 21 98 00 00 10 00 D0 A8 A6 19 01 48 A9 A6 19 16 
            return True;                                                        //0065 : 04 27 
          default:                                                              //0067 : 0A FF FF 
            break;                                                              //006A : 06 6D 00 
        }
        ++i;                                                                    //006D : A3 00 D0 A8 A6 19 16 
      }
    }
    return False;                                                               //0077 : 04 28 
    //07 77 00 82 9A 39 3A 00 E0 A7 A6 19 2C 03 16 18 0C 00 9A 39 3A 00 58 A8 A6 19 2C 0D 16 16 0F 00 
    //D0 A8 A6 19 25 07 77 00 96 00 D0 A8 A6 19 37 01 48 A9 A6 19 16 05 04 19 10 00 D0 A8 A6 19 01 48 
    //A9 A6 19 05 00 04 01 58 90 31 16 0A 50 00 2C 04 0A 67 00 26 1B 21 98 00 00 10 00 D0 A8 A6 19 01 
    //48 A9 A6 19 16 04 27 0A FF FF 06 6D 00 A3 00 D0 A8 A6 19 16 06 25 00 04 28 04 0B 47 
  }


  event bool TryCloseWindow() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 88 AC A6 19 25 
    while (i < mButtons.Length) {                                               //0007 : 07 59 00 96 00 88 AC A6 19 37 01 48 A9 A6 19 16 
      switch (mButtons[i].mIntTag) {                                            //0017 : 05 04 19 10 00 88 AC A6 19 01 48 A9 A6 19 05 00 04 01 58 90 31 16 
        case 8 :                                                                //002D : 0A 32 00 2C 08 
        case 2 :                                                                //0032 : 0A 49 00 2C 02 
          return ClickHandler(mButtons[i]);                                     //0037 : 04 1B 21 98 00 00 10 00 88 AC A6 19 01 48 A9 A6 19 16 
        default:                                                                //0049 : 0A FF FF 
          break;                                                                //004C : 06 4F 00 
      }
      ++i;                                                                      //004F : A3 00 88 AC A6 19 16 
    }
    return False;                                                               //0059 : 04 28 
    //0F 00 88 AC A6 19 25 07 59 00 96 00 88 AC A6 19 37 01 48 A9 A6 19 16 05 04 19 10 00 88 AC A6 19 
    //01 48 A9 A6 19 05 00 04 01 58 90 31 16 0A 32 00 2C 08 0A 49 00 2C 02 04 1B 21 98 00 00 10 00 88 
    //AC A6 19 01 48 A9 A6 19 16 0A FF FF 06 4F 00 A3 00 88 AC A6 19 16 06 07 00 04 28 04 0B 47 
  }


  function OnComponentShown() {
    mDesktop.SetTempActive(True);                                               //0000 : 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 
    //19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 27 16 04 0B 47 
  }


  function OnComponentHidden() {
    mDesktop.SetTempActive(False);                                              //0000 : 19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 28 16 
    //19 01 48 0C 9D 19 07 00 00 1B 02 0F 00 00 28 16 04 0B 47 
  }


  function bool ClickHandler(GUI_Component clickedButton) {
    mOwner.OnMBClick(self,mIntTag,clickedButton.mIntTag);                       //0000 : 19 01 C8 B0 A6 19 1E 00 04 43 B8 E9 9D 19 06 97 00 00 17 01 58 90 31 16 19 00 A0 AF A6 19 05 00 04 01 58 90 31 16 16 
    mDesktop.ShowWindow(mWindowHandle,Class'GUI_BaseDesktop'.2);                //0027 : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
    mDesktop.DestroyWindow(mWindowHandle);                                      //0046 : 19 01 48 0C 9D 19 0B 00 00 1B 54 2D 00 00 01 E8 77 9E 19 16 
    return True;                                                                //005A : 04 27 
    //19 01 C8 B0 A6 19 1E 00 04 43 B8 E9 9D 19 06 97 00 00 17 01 58 90 31 16 19 00 A0 AF A6 19 05 00 
    //04 01 58 90 31 16 16 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 
    //02 00 04 2C 02 16 19 01 48 0C 9D 19 0B 00 00 1B 54 2D 00 00 01 E8 77 9E 19 16 04 27 04 0B 47 
  }


  function AddButton(string Text,int Style) {
    if (mButtonPage == None) {                                                  //0000 : 07 3E 00 72 01 58 B4 A6 19 2A 16 
      mButtonPage = CreatePage("GUI_Page",0,0,6,0,382,42);                      //000B : 0F 01 58 B4 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 25 1D 7E 01 00 00 2C 2A 16 
      mButtonPage.SetStdBackground(7);                                          //002D : 19 01 58 B4 A6 19 08 00 00 1B 22 98 00 00 2C 07 16 
    }
    mButtons.Length = mButtons.Length + 1;                                      //003E : 0F 37 01 48 A9 A6 19 92 37 01 48 A9 A6 19 26 16 
    mButtons[mButtons.Length - 1] = mButtonPage.CreateButton("GUI_Button",Class'GUI_BaseDesktop'.4194304,Class'GUI_BaseDesktop'.2,0,6);//004E : 0F 10 93 37 01 48 A9 A6 19 26 16 01 48 A9 A6 19 19 01 58 B4 A6 19 2E 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 12 20 00 68 D7 00 02 00 04 2C 02 25 2C 06 16 
    mButtons[mButtons.Length - 1].mIntTag = Style;                              //0095 : 0F 19 10 93 37 01 48 A9 A6 19 26 16 01 48 A9 A6 19 05 00 04 01 58 90 31 16 00 D0 B4 A6 19 
    mButtons[mButtons.Length - 1].SetText(Text);                                //00B3 : 19 10 93 37 01 48 A9 A6 19 26 16 01 48 A9 A6 19 0B 00 00 1B 13 98 00 00 00 68 B2 A6 19 16 
    mButtons[mButtons.Length - 1].__OnClick__Delegate = ClickHandler;           //00D1 : 45 19 10 93 37 01 48 A9 A6 19 26 16 01 48 A9 A6 19 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    //07 3E 00 72 01 58 B4 A6 19 2A 16 0F 01 58 B4 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 
    //25 25 2C 06 25 1D 7E 01 00 00 2C 2A 16 19 01 58 B4 A6 19 08 00 00 1B 22 98 00 00 2C 07 16 0F 37 
    //01 48 A9 A6 19 92 37 01 48 A9 A6 19 26 16 0F 10 93 37 01 48 A9 A6 19 26 16 01 48 A9 A6 19 19 01 
    //58 B4 A6 19 2E 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 05 00 
    //04 1D 00 00 40 00 12 20 00 68 D7 00 02 00 04 2C 02 25 2C 06 16 0F 19 10 93 37 01 48 A9 A6 19 26 
    //16 01 48 A9 A6 19 05 00 04 01 58 90 31 16 00 D0 B4 A6 19 19 10 93 37 01 48 A9 A6 19 26 16 01 48 
    //A9 A6 19 0B 00 00 1B 13 98 00 00 00 68 B2 A6 19 16 45 19 10 93 37 01 48 A9 A6 19 26 16 01 48 A9 
    //A6 19 05 00 08 01 98 EB 9D 19 44 21 98 00 00 04 0B 47 
  }


  function SetText(string aText) {
    mTextCtrl.SetText(aText);                                                   //0000 : 19 01 C0 B6 A6 19 0B 00 00 1B 13 98 00 00 00 F8 B5 A6 19 16 
    Invalidate();                                                               //0014 : 1B 1D 98 00 00 16 
    //19 01 C0 B6 A6 19 0B 00 00 1B 13 98 00 00 00 F8 B5 A6 19 16 1B 1D 98 00 00 16 04 0B 47 
  }


  function SetFont(string FontName) {
    mTextCtrl.SetFont(FontName);                                                //0000 : 19 01 C0 B6 A6 19 0B 00 00 1B 25 98 00 00 00 E8 B7 A6 19 16 
    //19 01 C0 B6 A6 19 0B 00 00 1B 25 98 00 00 00 E8 B7 A6 19 16 04 0B 47 
  }


  event Initialize() {
    mWidth = 400.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 C8 43 
    Super.Initialize();                                                         //000B : 1C 28 9E 9E 19 16 
    mMessagePage = CreatePage("GUI_Page",0,0,6,21,382,0);                       //0011 : 0F 01 48 BC A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 7E 01 00 00 25 16 
    mMessagePage.SetStdBackground(7);                                           //0033 : 19 01 48 BC A6 19 08 00 00 1B 22 98 00 00 2C 07 16 
    mTextCtrl = GUI_TextCtrl(mMessagePage.CreatePage("GUI_TextCtrl",0,0,6,6,mMessagePage.GetClientWidth() - 12,0));//0044 : 0F 01 C0 B6 A6 19 2E 20 79 2F 1D 19 01 48 BC A6 19 32 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 2C 06 2C 06 39 44 AF 19 01 48 BC A6 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 0C 16 25 16 
    mTextCtrl.mLabelStyle = mTextCtrl.mLabelStyle | 4096 | 2048 | 512;          //008A : 0F 19 01 C0 B6 A6 19 05 00 04 01 20 CC A2 19 9E 9E 9E 19 01 C0 B6 A6 19 05 00 04 01 20 CC A2 19 1D 00 10 00 00 16 1D 00 08 00 00 16 1D 00 02 00 00 16 
    mTextCtrl.SetFont("SBFontsTX.Verdana11");                                   //00BC : 19 01 C0 B6 A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    if ((mMessageBoxStyle & Class'GUI_BaseDesktop'.4) != 0) {                   //00E0 : 07 23 01 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 
      AddButton(Class'SBGuiStrings'.default.Yes.Text,mMessageBoxStyle & Class'GUI_BaseDesktop'.4);//00F8 : 1B 5A 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 43 98 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 04 16 16 
    }
    if ((mMessageBoxStyle & Class'GUI_BaseDesktop'.8) != 0) {                   //0123 : 07 66 01 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 08 16 25 16 
      AddButton(Class'SBGuiStrings'.default.No.Text,mMessageBoxStyle & Class'GUI_BaseDesktop'.8);//013B : 1B 5A 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 44 98 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 08 16 16 
    }
    if ((mMessageBoxStyle & Class'GUI_BaseDesktop'.1) != 0) {                   //0166 : 07 98 01 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 01 00 04 26 16 25 16 
      AddButton("OK",mMessageBoxStyle & Class'GUI_BaseDesktop'.1);              //017D : 1B 5A 98 00 00 1F 4F 4B 00 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 01 00 04 26 16 16 
    }
    if ((mMessageBoxStyle & Class'GUI_BaseDesktop'.2) != 0) {                   //0198 : 07 DB 01 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 
      AddButton(Class'SBGuiStrings'.default.Cancel.Text,mMessageBoxStyle & Class'GUI_BaseDesktop'.2);//01B0 : 1B 5A 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 02 16 16 
    }
    if ((mMessageBoxStyle & Class'GUI_BaseDesktop'.16) != 0) {                  //01DB : 07 1E 02 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 10 16 25 16 
      AddButton(Class'SBGuiStrings'.default.help.Text,mMessageBoxStyle & Class'GUI_BaseDesktop'.16);//01F3 : 1B 5A 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 34 97 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 10 16 16 
    }
    __OnKeyEvent__Delegate = HandleKeyEvent;                                    //021E : 45 01 30 EA 9D 19 44 C9 96 00 00 
    //0F 01 60 87 31 16 1E 00 00 C8 43 1C 28 9E 9E 19 16 0F 01 48 BC A6 19 1B 16 98 00 00 1F 47 55 49 
    //5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 7E 01 00 00 25 16 19 01 48 BC A6 19 08 00 00 1B 22 98 00 
    //00 2C 07 16 0F 01 C0 B6 A6 19 2E 20 79 2F 1D 19 01 48 BC A6 19 32 00 04 1B 16 98 00 00 1F 47 55 
    //49 5F 54 65 78 74 43 74 72 6C 00 25 25 2C 06 2C 06 39 44 AF 19 01 48 BC A6 19 06 00 04 1B 17 98 
    //00 00 16 39 3F 2C 0C 16 25 16 0F 19 01 C0 B6 A6 19 05 00 04 01 20 CC A2 19 9E 9E 9E 19 01 C0 B6 
    //A6 19 05 00 04 01 20 CC A2 19 1D 00 10 00 00 16 1D 00 08 00 00 16 1D 00 02 00 00 16 19 01 C0 B6 
    //A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    //07 23 01 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 1B 5A 98 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 43 98 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 
    //04 16 16 07 66 01 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 08 16 25 16 1B 5A 98 00 00 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 44 98 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 
    //00 04 2C 08 16 16 07 98 01 9B 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 01 00 04 26 16 25 16 1B 5A 98 
    //00 00 1F 4F 4B 00 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 01 00 04 26 16 16 07 DB 01 9B 9C 01 A8 B8 
    //A6 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 1B 5A 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 08 43 98 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 02 16 16 07 1E 02 9B 9C 
    //01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 10 16 25 16 1B 5A 98 00 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 80 34 97 19 9C 01 A8 B8 A6 19 12 20 00 68 D7 00 02 00 04 2C 10 16 16 45 01 
    //30 EA 9D 19 44 C9 96 00 00 04 0B 47 
  }



