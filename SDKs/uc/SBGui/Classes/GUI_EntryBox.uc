//==============================================================================
//  GUI_EntryBox
//==============================================================================

class GUI_EntryBox extends GUI_MessageBox
    dependsOn(GUI_EditBox)
    Transient
    Config(User)
  ;

  var GUI_EditBox mEditBox;


  function bool ClickHandler(GUI_Component clickedButton) {
    mOwner.SetProperty("GUI_EntryBox.mText",mEditBox.mText);                    //0000 : 19 01 C8 B0 A6 19 28 00 00 1B E2 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 6D 54 65 78 74 00 19 01 10 62 A2 19 05 00 00 01 80 D2 A4 19 16 
    return Super.ClickHandler(clickedButton);                                   //0031 : 04 1C F8 AD A6 19 00 D0 22 A8 19 16 
    //19 01 C8 B0 A6 19 28 00 00 1B E2 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 6D 54 65 78 
    //74 00 19 01 10 62 A2 19 05 00 00 01 80 D2 A4 19 16 04 1C F8 AD A6 19 00 D0 22 A8 19 16 04 0B 47 
    //
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 F0 24 A8 19 16 
    if (flags == 1) {                                                           //000B : 07 25 00 9A 00 F0 24 A8 19 26 16 
      mEditBox.SetFocus();                                                      //0016 : 19 01 10 62 A2 19 06 00 00 1B 3A 2D 00 00 16 
    }
    //1C 20 7A 9E 19 00 F0 24 A8 19 16 07 25 00 9A 00 F0 24 A8 19 26 16 19 01 10 62 A2 19 06 00 00 1B 
    //3A 2D 00 00 16 04 0B 47 
  }


  event Initialize() {
    mMessageBoxStyle = 1 | 2;                                                   //0000 : 0F 01 A8 B8 A6 19 9E 26 2C 02 16 
    Super.Initialize();                                                         //000B : 1C 38 B7 A6 19 16 
    mEditBox = mMessagePage.CreateEditBox("GUI_EditBox",0,0,25,6,mMessagePage.GetClientWidth() - 50,32);//0011 : 0F 01 10 62 A2 19 19 01 48 BC A6 19 32 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 25 25 2C 19 2C 06 39 44 AF 19 01 48 BC A6 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 32 16 2C 20 16 
    mEditBox.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");      //0052 : 19 01 10 62 A2 19 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mEditBox.SetColor(255.00000000,255.00000000,255.00000000);                  //008C : 19 01 10 62 A2 19 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mEditBox.__OnKeyEvent__Delegate = HandleKeyEvent;                           //00AA : 45 19 01 10 62 A2 19 05 00 08 01 30 EA 9D 19 44 C9 96 00 00 
    //0F 01 A8 B8 A6 19 9E 26 2C 02 16 1C 38 B7 A6 19 16 0F 01 10 62 A2 19 19 01 48 BC A6 19 32 00 04 
    //1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 25 25 2C 19 2C 06 39 44 AF 19 01 48 BC A6 
    //19 06 00 04 1B 17 98 00 00 16 39 3F 2C 32 16 2C 20 16 19 01 10 62 A2 19 31 00 00 1B 1A 98 00 00 
    //1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 
    //47 55 49 5F 53 74 79 6C 65 73 00 16 19 01 10 62 A2 19 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 
    //00 00 7F 43 1E 00 00 7F 43 16 45 19 01 10 62 A2 19 05 00 08 01 30 EA 9D 19 44 C9 96 00 00 04 0B 
    //47 
  }



