//==============================================================================
//  HUD_NDAWindow
//==============================================================================

class HUD_NDAWindow extends GUI_Window
    native
    dependsOn(GUI_TextCtrl,GUI_Component,PlayerController,Player,LevelInfo,EnvironmentManager)
    Transient
    Config(User)
  ;

  const MAX_WIDTH =  680;
  var private GUI_Page mTextPage;
  var private GUI_TextCtrl mTextCtrl;
  var private GUI_Button mAcceptButton;
  var private GUI_Button mDenyButton;
  var private bool mHasAcceptedNDA;


  event ResolutionChanged(int ResX,int ResY) {
    local int newWidth;
    if (ResX > 0 && ResY > 0) {                                                 //0000 : 07 71 01 82 97 00 E8 4A B1 1C 25 16 18 09 00 97 00 48 E1 B6 1C 25 16 16 
      newWidth = ResX - 100;                                                    //0018 : 0F 00 C0 E1 B6 1C 93 00 E8 4A B1 1C 2C 64 16 
      if (newWidth > 680) {                                                     //0027 : 07 41 00 97 00 C0 E1 B6 1C 1D A8 02 00 00 16 
        newWidth = 680;                                                         //0036 : 0F 00 C0 E1 B6 1C 1D A8 02 00 00 
      }
      SetPosition(ResX / 2 - newWidth / 2,ResY / 2 - (ResY - 100) / 2,newWidth,ResY - 100);//0041 : 1B 23 98 00 00 39 3F 93 91 00 E8 4A B1 1C 2C 02 16 91 00 C0 E1 B6 1C 2C 02 16 16 39 3F 93 91 00 48 E1 B6 1C 2C 02 16 91 93 00 48 E1 B6 1C 2C 64 16 2C 02 16 16 39 3F 00 C0 E1 B6 1C 39 3F 93 00 48 E1 B6 1C 2C 64 16 16 
      mTextPage.SetPosition(6.00000000,21.00000000,GetClientWidth() - 12,GetClientHeight() - 64);//0089 : 19 01 38 E2 B6 1C 28 00 00 1B 23 98 00 00 1E 00 00 C0 40 1E 00 00 A8 41 AF 1B 17 98 00 00 16 39 3F 2C 0C 16 AF 1B 1F 98 00 00 16 39 3F 2C 40 16 16 
      mTextCtrl.SetPosition(3.00000000,0.00000000,mTextPage.GetClientWidth() - 24,mTextPage.GetClientHeight());//00BA : 19 01 B0 E2 B6 1C 34 00 00 1B 23 98 00 00 1E 00 00 40 40 1E 00 00 00 00 AF 19 01 38 E2 B6 1C 06 00 04 1B 17 98 00 00 16 39 3F 2C 18 16 19 01 38 E2 B6 1C 06 00 04 1B 1F 98 00 00 16 16 
      mAcceptButton.SetPosition(GetClientWidth() - 10 - 100,GetClientHeight() - 34,100.00000000,24.00000000);//00F7 : 19 01 28 E3 B6 1C 2E 00 00 1B 23 98 00 00 AF AF 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 64 16 AF 1B 1F 98 00 00 16 39 3F 2C 22 16 1E 00 00 C8 42 1E 00 00 C0 41 16 
      mDenyButton.SetPosition(GetClientWidth() - 10 - 100 - 10 - 100,GetClientHeight() - 34,100.00000000,24.00000000);//012E : 19 01 A0 E3 B6 1C 3A 00 00 1B 23 98 00 00 AF AF AF AF 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 64 16 39 3F 2C 0A 16 39 3F 2C 64 16 AF 1B 1F 98 00 00 16 39 3F 2C 22 16 1E 00 00 C8 42 1E 00 00 C0 41 16 
    }
    //07 71 01 82 97 00 E8 4A B1 1C 25 16 18 09 00 97 00 48 E1 B6 1C 25 16 16 0F 00 C0 E1 B6 1C 93 00 
    //E8 4A B1 1C 2C 64 16 07 41 00 97 00 C0 E1 B6 1C 1D A8 02 00 00 16 0F 00 C0 E1 B6 1C 1D A8 02 00 
    //00 1B 23 98 00 00 39 3F 93 91 00 E8 4A B1 1C 2C 02 16 91 00 C0 E1 B6 1C 2C 02 16 16 39 3F 93 91 
    //00 48 E1 B6 1C 2C 02 16 91 93 00 48 E1 B6 1C 2C 64 16 2C 02 16 16 39 3F 00 C0 E1 B6 1C 39 3F 93 
    //00 48 E1 B6 1C 2C 64 16 16 19 01 38 E2 B6 1C 28 00 00 1B 23 98 00 00 1E 00 00 C0 40 1E 00 00 A8 
    //41 AF 1B 17 98 00 00 16 39 3F 2C 0C 16 AF 1B 1F 98 00 00 16 39 3F 2C 40 16 16 19 01 B0 E2 B6 1C 
    //34 00 00 1B 23 98 00 00 1E 00 00 40 40 1E 00 00 00 00 AF 19 01 38 E2 B6 1C 06 00 04 1B 17 98 00 
    //00 16 39 3F 2C 18 16 19 01 38 E2 B6 1C 06 00 04 1B 1F 98 00 00 16 16 19 01 28 E3 B6 1C 2E 00 00 
    //1B 23 98 00 00 AF AF 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 64 16 AF 1B 1F 98 00 00 16 39 3F 
    //2C 22 16 1E 00 00 C8 42 1E 00 00 C0 41 16 19 01 A0 E3 B6 1C 3A 00 00 1B 23 98 00 00 AF AF AF AF 
    //1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 64 16 39 3F 2C 0A 16 39 3F 2C 64 16 AF 1B 1F 98 00 00 
    //16 39 3F 2C 22 16 1E 00 00 C8 42 1E 00 00 C0 41 16 04 0B 47 
  }


  function bool ClickHandler(GUI_Component clickedButton) {
    switch (clickedButton.mIntTag) {                                            //0000 : 05 04 19 00 C8 E4 B6 1C 05 00 04 01 58 90 31 16 
      case 1 :                                                                  //0010 : 0A 79 00 26 
        mHasAcceptedNDA = True;                                                 //0014 : 14 2D 01 40 E5 B6 1C 27 
        SetAcceptedEULA();                                                      //001C : 1B 27 9A 00 00 16 
        mDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.20,Class'GUI_BaseDesktop'.1);//0022 : 19 01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 14 12 20 00 68 D7 00 01 00 04 26 16 
        mTextCtrl.SetText("");                                                  //0046 : 19 01 B0 E2 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 
        mDesktop.ShowWindow(mWindowHandle,Class'GUI_BaseDesktop'.2);            //0057 : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
        break;                                                                  //0076 : 06 9B 00 
      case 2 :                                                                  //0079 : 0A 98 00 2C 02 
        break;                                                                  //0095 : 06 9B 00 
      default:                                                                  //0098 : 0A FF FF 
    }
    return True;                                                                //009B : 04 27 
    //05 04 19 00 C8 E4 B6 1C 05 00 04 01 58 90 31 16 0A 79 00 26 14 2D 01 40 E5 B6 1C 27 1B 27 9A 00 
    //00 16 19 01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 14 12 20 00 68 D7 
    //00 01 00 04 26 16 19 01 B0 E2 B6 1C 08 00 00 1B 13 98 00 00 1F 00 16 19 01 48 0C 9D 19 16 00 00 
    //1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 06 9B 00 0A 98 00 2C 02 0E 19 
    //1B 0E 2F 00 00 16 0C 00 00 1B 65 0C 00 00 1F 51 55 49 54 00 16 06 9B 00 0A FF FF 04 27 04 0B 47 
    //
  }


  function OnUpdate(optional int intParam,optional Object objParam,optional string stringParam,optional int intParam2) {
    if (stringParam == "NoSpellbornShaders") {                                  //0000 : 07 7C 00 7A 00 30 E8 B6 1C 1F 4E 6F 53 70 65 6C 6C 62 6F 72 6E 53 68 61 64 65 72 73 00 16 
      mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Warning.Text,Class'SBGuiStrings'.default.ShaderModelMsg.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,0,self);//001E : 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 E3 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 3C 99 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
    }
    //07 7C 00 7A 00 30 E8 B6 1C 1F 4E 6F 53 70 65 6C 6C 62 6F 72 6E 53 68 61 64 65 72 73 00 16 19 01 
    //48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 E8 E3 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 3C 
    //99 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 48 EA B6 1C 16 
    mTextCtrl.Empty();                                                          //000B : 19 01 B0 E2 B6 1C 06 00 00 1B BE 1A 00 00 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //001A : 07 E3 01 9A 00 48 EA B6 1C 12 20 00 68 D7 00 01 00 04 26 16 
      if (mHasAcceptedNDA) {                                                    //002E : 07 44 00 2D 01 40 E5 B6 1C 
        ClickHandler(mAcceptButton);                                            //0037 : 1B 21 98 00 00 01 28 E3 B6 1C 16 
        return;                                                                 //0042 : 04 0B 
      }
      mTextCtrl.mBufferSize = 50 * 1024;                                        //0044 : 0F 19 01 B0 E2 B6 1C 05 00 04 01 98 B2 A4 19 90 2C 32 1D 00 04 00 00 16 
      mTextCtrl.AddText("");                                                    //005C : 19 01 B0 E2 B6 1C 08 00 00 1B AE 96 00 00 1F 00 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_1.Text);          //006D : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 8B 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_2.Text);          //008F : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 8B 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_3.Text);          //00B1 : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 8C 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_4.Text);          //00D3 : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 8C 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_5.Text);          //00F5 : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 8D 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_6.Text);          //0117 : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 8D 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_7.Text);          //0139 : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 8E 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_8.Text);          //015B : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 8E 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_9.Text);          //017D : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 8F 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_10.Text);         //019F : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 8F 2F 16 16 
      mTextCtrl.AddText(Class'SBGuiStrings'.default.EULA_Part_11.Text);         //01C1 : 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 90 2F 16 16 
    }
    //1C 20 7A 9E 19 00 48 EA B6 1C 16 19 01 B0 E2 B6 1C 06 00 00 1B BE 1A 00 00 16 07 E3 01 9A 00 48 
    //EA B6 1C 12 20 00 68 D7 00 01 00 04 26 16 07 44 00 2D 01 40 E5 B6 1C 1B 21 98 00 00 01 28 E3 B6 
    //1C 16 04 0B 0F 19 01 B0 E2 B6 1C 05 00 04 01 98 B2 A4 19 90 2C 32 1D 00 04 00 00 16 19 01 B0 E2 
    //B6 1C 08 00 00 1B AE 96 00 00 1F 00 16 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 60 8B 2F 16 16 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 8B 2F 16 16 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 8C 2F 16 16 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 
    //00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 8C 2F 16 16 19 01 B0 E2 B6 1C 19 00 00 1B AE 
    //96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 8D 2F 16 16 19 01 B0 E2 B6 1C 19 00 00 
    //1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 8D 2F 16 16 19 01 B0 E2 B6 1C 19 
    //00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 8E 2F 16 16 19 01 B0 E2 B6 
    //1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 8E 2F 16 16 19 01 B0 
    //E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 8F 2F 16 16 19 
    //01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 8F 2F 16 
    //16 19 01 B0 E2 B6 1C 19 00 00 1B AE 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 90 
    //2F 16 16 04 0B 47 
  }


  event Initialize() {
    local Color DefaultColor;
    local int newWidth;
    DefaultColor.R = 224;                                                       //0000 : 0F 36 D0 90 6A 0F 00 38 EE B6 1C 24 E0 
    DefaultColor.G = 218;                                                       //000D : 0F 36 58 90 6A 0F 00 38 EE B6 1C 24 DA 
    DefaultColor.B = 182;                                                       //001A : 0F 36 E0 8F 6A 0F 00 38 EE B6 1C 24 B6 
    DefaultColor.A = 255.00000000;                                              //0027 : 0F 36 48 91 6A 0F 00 38 EE B6 1C 39 43 1E 00 00 7F 43 
    mDesktop.ViewportOwner.Actor.Level.GetEnvironmentManager().SetDefaultHUDColor(DefaultColor);//0039 : 19 19 19 19 19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 06 00 04 1B D4 12 00 00 16 0B 00 00 1C 98 9A 7C 0F 00 38 EE B6 1C 16 
    SetStdBackground(Class'GUI_BaseDesktop'.4);                                 //0072 : 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 04 16 
    newWidth = mDesktop.GetScreenWidth() - 100;                                 //0083 : 0F 00 10 F4 B6 1C 39 44 AF 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 64 16 
    if (newWidth > 680) {                                                       //00A0 : 07 BD 00 97 00 10 F4 B6 1C 1D A8 02 00 00 16 
      mWidth = 680.00000000;                                                    //00AF : 0F 01 60 87 31 16 1E 00 00 2A 44 
    } else {                                                                    //00BA : 06 CA 00 
      mWidth = newWidth;                                                        //00BD : 0F 01 60 87 31 16 39 3F 00 10 F4 B6 1C 
    }
    mHeight = mDesktop.GetScreenHeight() - 100;                                 //00CA : 0F 01 40 88 31 16 AF 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 64 16 
    mLeft = mDesktop.GetScreenWidth() / 2 - mWidth / 2;                         //00E5 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 
    mTop = mDesktop.GetScreenHeight() / 2 - mHeight / 2;                        //010D : 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 
    Super.Initialize();                                                         //0135 : 1C 28 9E 9E 19 16 
    mTextPage = CreatePage("GUI_Page",0,Class'GUI_BaseDesktop'.2,6,21,GetClientWidth() - 12,GetClientHeight() - 64);//013B : 0F 01 38 E2 B6 1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 12 20 00 68 D7 00 02 00 04 2C 02 2C 06 2C 15 39 44 AF 1B 17 98 00 00 16 39 3F 2C 0C 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 40 16 16 
    mTextPage.SetStdBackground(7);                                              //017D : 19 01 38 E2 B6 1C 08 00 00 1B 22 98 00 00 2C 07 16 
    mTextCtrl = GUI_TextCtrl(mTextPage.CreatePage("GUI_TextCtrl",0,0,3,0,mTextPage.GetClientWidth() - 24,mTextPage.GetClientHeight()));//018E : 0F 01 B0 E2 B6 1C 2E 20 79 2F 1D 19 01 38 E2 B6 1C 41 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 2C 03 25 39 44 AF 19 01 38 E2 B6 1C 06 00 04 1B 17 98 00 00 16 39 3F 2C 18 16 39 44 19 01 38 E2 B6 1C 06 00 04 1B 1F 98 00 00 16 16 
    mAcceptButton = CreateButton("GUI_Button",Class'GUI_BaseDesktop'.4194304,Class'GUI_BaseDesktop'.2 | Class'GUI_BaseDesktop'.4194304,GetClientWidth() - 10 - 100,GetClientHeight() - 34,100,24);//01E3 : 0F 01 28 E3 B6 1C 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 9E 12 20 00 68 D7 00 02 00 04 2C 02 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 16 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 64 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 22 16 2C 64 2C 18 16 
    mAcceptButton.mIntTag = 1;                                                  //024A : 0F 19 01 28 E3 B6 1C 05 00 04 01 58 90 31 16 26 
    mAcceptButton.__OnClick__Delegate = ClickHandler;                           //025A : 45 19 01 28 E3 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mAcceptButton.SetText(Class'SBGuiStrings'.default.Accept.Text);             //026E : 19 01 28 E3 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 8F 98 19 16 
    mAcceptButton.SetTextBorder(0.00000000,3.00000000);                         //0290 : 19 01 28 E3 B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mAcceptButton.__OnClick__Delegate = ClickHandler;                           //02A9 : 45 19 01 28 E3 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mDenyButton = CreateButton("GUI_Button",Class'GUI_BaseDesktop'.4194304,Class'GUI_BaseDesktop'.2,GetClientWidth() - 10 - 100 - 10 - 100,GetClientHeight() - 34,100,24);//02BD : 0F 01 A0 E3 B6 1C 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 12 20 00 68 D7 00 02 00 04 2C 02 39 44 AF AF AF AF 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 64 16 39 3F 2C 0A 16 39 3F 2C 64 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 22 16 2C 64 2C 18 16 
    mDenyButton.mIntTag = 2;                                                    //0320 : 0F 19 01 A0 E3 B6 1C 05 00 04 01 58 90 31 16 2C 02 
    mDenyButton.__OnClick__Delegate = ClickHandler;                             //0331 : 45 19 01 A0 E3 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mDenyButton.SetText(Class'SBGuiStrings'.default.Reject.Text);               //0345 : 19 01 A0 E3 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 9E 98 19 16 
    mDenyButton.SetTextBorder(0.00000000,3.00000000);                           //0367 : 19 01 A0 E3 B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mDenyButton.__OnClick__Delegate = ClickHandler;                             //0380 : 45 19 01 A0 E3 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mHasAcceptedNDA = GetAcceptedEULA();                                        //0394 : 14 2D 01 40 E5 B6 1C 1B 26 9A 00 00 16 
    ResolutionChanged(mDesktop.GetScreenWidth(),mDesktop.GetScreenHeight());    //03A1 : 1B 37 97 00 00 39 44 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 44 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 16 
    //0F 36 D0 90 6A 0F 00 38 EE B6 1C 24 E0 0F 36 58 90 6A 0F 00 38 EE B6 1C 24 DA 0F 36 E0 8F 6A 0F 
    //00 38 EE B6 1C 24 B6 0F 36 48 91 6A 0F 00 38 EE B6 1C 39 43 1E 00 00 7F 43 19 19 19 19 19 01 48 
    //0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 06 00 04 1B D4 
    //12 00 00 16 0B 00 00 1C 98 9A 7C 0F 00 38 EE B6 1C 16 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 
    //2C 04 16 0F 00 10 F4 B6 1C 39 44 AF 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 64 16 
    //07 BD 00 97 00 10 F4 B6 1C 1D A8 02 00 00 16 0F 01 60 87 31 16 1E 00 00 2A 44 06 CA 00 0F 01 60 
    //87 31 16 39 3F 00 10 F4 B6 1C 0F 01 40 88 31 16 AF 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 
    //39 3F 2C 64 16 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 
    //16 AC 01 60 87 31 16 39 3F 2C 02 16 16 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 
    //98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 1C 28 9E 9E 19 16 0F 01 38 E2 B6 
    //1C 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 12 20 00 68 D7 00 02 00 04 2C 02 2C 06 2C 15 
    //39 44 AF 1B 17 98 00 00 16 39 3F 2C 0C 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 40 16 16 19 01 38 
    //E2 B6 1C 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 B0 E2 B6 1C 2E 20 79 2F 1D 19 01 38 E2 B6 1C 41 
    //00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 2C 03 25 39 44 AF 19 01 38 
    //E2 B6 1C 06 00 04 1B 17 98 00 00 16 39 3F 2C 18 16 39 44 19 01 38 E2 B6 1C 06 00 04 1B 1F 98 00 
    //00 16 16 0F 01 28 E3 B6 1C 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 
    //05 00 04 1D 00 00 40 00 9E 12 20 00 68 D7 00 02 00 04 2C 02 12 20 00 68 D7 00 05 00 04 1D 00 00 
    //40 00 16 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 2C 64 16 39 44 AF 1B 1F 98 00 00 16 
    //39 3F 2C 22 16 2C 64 2C 18 16 0F 19 01 28 E3 B6 1C 05 00 04 01 58 90 31 16 26 45 19 01 28 E3 B6 
    //1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 19 01 28 E3 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 50 8F 98 19 16 19 01 28 E3 B6 1C 10 00 00 1B 49 98 00 00 1E 00 
    //00 00 00 1E 00 00 40 40 16 45 19 01 28 E3 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 01 A0 
    //E3 B6 1C 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 05 00 04 1D 00 00 
    //40 00 12 20 00 68 D7 00 02 00 04 2C 02 39 44 AF AF AF AF 1B 17 98 00 00 16 39 3F 2C 0A 16 39 3F 
    //2C 64 16 39 3F 2C 0A 16 39 3F 2C 64 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 22 16 2C 64 2C 18 16 
    //0F 19 01 A0 E3 B6 1C 05 00 04 01 58 90 31 16 2C 02 45 19 01 A0 E3 B6 1C 05 00 08 01 98 EB 9D 19 
    //44 21 98 00 00 19 01 A0 E3 B6 1C 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 
    //0C 02 C8 9E 98 19 16 19 01 A0 E3 B6 1C 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    //45 19 01 A0 E3 B6 1C 05 00 08 01 98 EB 9D 19 44 21 98 00 00 14 2D 01 40 E5 B6 1C 1B 26 9A 00 00 
    //16 1B 37 97 00 00 39 44 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 44 19 01 48 0C 9D 19 06 
    //00 04 1B 2E 98 00 00 16 16 04 0B 47 
  }


  native function SetAcceptedEULA();


  native function bool GetAcceptedEULA();



