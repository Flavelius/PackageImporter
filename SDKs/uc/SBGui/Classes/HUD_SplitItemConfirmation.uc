//==============================================================================
//  HUD_SplitItemConfirmation
//==============================================================================

class HUD_SplitItemConfirmation extends HUD_Shop_ConfirmationBox
    dependsOn(GUI_Component,GUI_EditBox,Game_Item)
    Transient
    Config(User)
  ;

  var GUI_EditBox mEditBox;
  var int mMaxSplitSize;


  function bool ClickHandler(GUI_Component clickedButton) {
    mOwner.SetProperty("SplitAmount",mEditBox.mText);                           //0000 : 19 01 C8 B0 A6 19 21 00 00 1B E2 98 00 00 1F 53 70 6C 69 74 41 6D 6F 75 6E 74 00 19 01 30 42 8A 19 05 00 00 01 80 D2 A4 19 16 
    return Super.ClickHandler(clickedButton);                                   //002A : 04 1C F8 AD A6 19 00 40 18 33 26 16 
    //19 01 C8 B0 A6 19 21 00 00 1B E2 98 00 00 1F 53 70 6C 69 74 41 6D 6F 75 6E 74 00 19 01 30 42 8A 
    //19 05 00 00 01 80 D2 A4 19 16 04 1C F8 AD A6 19 00 40 18 33 26 16 04 0B 47 
  }


  function bool OnValueChanged(GUI_EditBox editBox) {
    local int Value;
    Value = int(editBox.GetText());                                             //0000 : 0F 00 B8 1A 04 1B 39 4A 19 00 90 AD 33 26 06 00 00 1B 92 0C 00 00 16 
    if (Value <= 0) {                                                           //0017 : 07 55 00 98 00 B8 1A 04 1B 25 16 
      Value = 1;                                                                //0022 : 0F 00 B8 1A 04 1B 26 
      if (Len(editBox.GetText()) > 0) {                                         //0029 : 07 52 00 97 7D 19 00 90 AD 33 26 06 00 00 1B 92 0C 00 00 16 16 25 16 
        mEditBox.SetText("1");                                                  //0040 : 19 01 30 42 8A 19 09 00 00 1B 13 98 00 00 1F 31 00 16 
      }
    } else {                                                                    //0052 : 06 89 00 
      if (Value > mMaxSplitSize) {                                              //0055 : 07 89 00 97 00 B8 1A 04 1B 01 90 65 05 1B 16 
        Value = mMaxSplitSize;                                                  //0064 : 0F 00 B8 1A 04 1B 01 90 65 05 1B 
        mEditBox.SetText("" $ string(mMaxSplitSize));                           //006F : 19 01 30 42 8A 19 11 00 00 1B 13 98 00 00 70 1F 00 39 53 01 90 65 05 1B 16 16 
      }
    }
    mContainer.SetStackSize(Value);                                             //0089 : 19 01 00 4F 2B 26 0B 00 00 1B 4E 97 00 00 00 B8 1A 04 1B 16 
    return True;                                                                //009D : 04 27 
    //0F 00 B8 1A 04 1B 39 4A 19 00 90 AD 33 26 06 00 00 1B 92 0C 00 00 16 07 55 00 98 00 B8 1A 04 1B 
    //25 16 0F 00 B8 1A 04 1B 26 07 52 00 97 7D 19 00 90 AD 33 26 06 00 00 1B 92 0C 00 00 16 16 25 16 
    //19 01 30 42 8A 19 09 00 00 1B 13 98 00 00 1F 31 00 16 06 89 00 07 89 00 97 00 B8 1A 04 1B 01 90 
    //65 05 1B 16 0F 00 B8 1A 04 1B 01 90 65 05 1B 19 01 30 42 8A 19 11 00 00 1B 13 98 00 00 70 1F 00 
    //39 53 01 90 65 05 1B 16 16 19 01 00 4F 2B 26 0B 00 00 1B 4E 97 00 00 00 B8 1A 04 1B 16 04 27 04 
    //0B 47 
  }


  function SetItem(Game_Item aItem) {
    Super.SetItem(aItem);                                                       //0000 : 1C 00 BD 2C 26 00 60 C3 06 1B 16 
    if (aItem != None) {                                                        //000B : 07 2D 00 77 00 60 C3 06 1B 2A 16 
      mMaxSplitSize = aItem.StackSize - 1;                                      //0016 : 0F 01 90 65 05 1B 93 19 00 60 C3 06 1B 05 00 04 01 E8 CB 22 11 26 16 
    }
    if (mContainer != None) {                                                   //002D : 07 5A 00 77 01 00 4F 2B 26 2A 16 
      mContainer.SetStackSize(1);                                               //0038 : 19 01 00 4F 2B 26 07 00 00 1B 4E 97 00 00 26 16 
      mEditBox.SetText("1");                                                    //0048 : 19 01 30 42 8A 19 09 00 00 1B 13 98 00 00 1F 31 00 16 
    }
    //1C 00 BD 2C 26 00 60 C3 06 1B 16 07 2D 00 77 00 60 C3 06 1B 2A 16 0F 01 90 65 05 1B 93 19 00 60 
    //C3 06 1B 05 00 04 01 E8 CB 22 11 26 16 07 5A 00 77 01 00 4F 2B 26 2A 16 19 01 00 4F 2B 26 07 00 
    //00 1B 4E 97 00 00 26 16 19 01 30 42 8A 19 09 00 00 1B 13 98 00 00 1F 31 00 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 E8 7E 33 26 16 
    if (flags == 1) {                                                           //000B : 07 25 00 9A 00 E8 7E 33 26 26 16 
      mEditBox.SetFocus();                                                      //0016 : 19 01 30 42 8A 19 06 00 00 1B 3A 2D 00 00 16 
    }
    //1C 20 7A 9E 19 00 E8 7E 33 26 16 07 25 00 9A 00 E8 7E 33 26 26 16 19 01 30 42 8A 19 06 00 00 1B 
    //3A 2D 00 00 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 20 82 2B 26 16 
    mEditBox = mMessagePage.CreateEditBox("GUI_EditBox",0,0,12 + 40,6,60,28);   //0006 : 0F 01 30 42 8A 19 19 01 48 BC A6 19 21 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 25 25 92 2C 0C 2C 28 16 2C 06 2C 3C 2C 1C 16 
    mEditBox.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");      //0036 : 19 01 30 42 8A 19 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mEditBox.SetColor(255.00000000,255.00000000,255.00000000);                  //0070 : 19 01 30 42 8A 19 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mEditBox.__OnTextChanged__Delegate = OnValueChanged;                        //008E : 45 19 01 30 42 8A 19 05 00 08 01 10 CF A4 19 44 2B 97 00 00 
    mEditBox.__OnKeyEvent__Delegate = HandleKeyEvent;                           //00A2 : 45 19 01 30 42 8A 19 05 00 08 01 30 EA 9D 19 44 C9 96 00 00 
    //1C 20 82 2B 26 16 0F 01 30 42 8A 19 19 01 48 BC A6 19 21 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 
    //64 69 74 42 6F 78 00 25 25 92 2C 0C 2C 28 16 2C 06 2C 3C 2C 1C 16 19 01 30 42 8A 19 31 00 00 1B 
    //1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 
    //65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 19 01 30 42 8A 19 15 00 00 1B 19 98 00 00 1E 00 
    //00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 45 19 01 30 42 8A 19 05 00 08 01 10 CF A4 19 44 2B 97 
    //00 00 45 19 01 30 42 8A 19 05 00 08 01 30 EA 9D 19 44 C9 96 00 00 04 0B 47 
  }



