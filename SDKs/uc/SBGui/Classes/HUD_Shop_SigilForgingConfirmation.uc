//==============================================================================
//  HUD_Shop_SigilForgingConfirmation
//==============================================================================

class HUD_Shop_SigilForgingConfirmation extends HUD_Shop_ConfirmationBox
    dependsOn(GUI_TextCtrl)
    Transient
    Config(User)
  ;

  var GUI_TextCtrl mNoteTextCtrl;


  function SetNote(string aNote) {
    mNoteTextCtrl.SetText(aNote);                                               //0000 : 19 01 90 79 33 26 0B 00 00 1B 13 98 00 00 00 38 10 34 26 16 
    Invalidate();                                                               //0014 : 1B 1D 98 00 00 16 
    //19 01 90 79 33 26 0B 00 00 1B 13 98 00 00 00 38 10 34 26 16 1B 1D 98 00 00 16 04 0B 47 
  }


  function SetItem(Game_Item aItem) {
    Super.SetItem(aItem);                                                       //0000 : 1C 00 BD 2C 26 00 E8 0D 34 26 16 
    //1C 00 BD 2C 26 00 E8 0D 34 26 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 20 82 2B 26 16 
    mNoteTextCtrl = GUI_TextCtrl(mMessagePage.CreatePage("GUI_TextCtrl",0,0,12 + 40,6,mMessagePage.GetClientWidth() - 6 * 3 + 40,10));//0006 : 0F 01 90 79 33 26 2E 20 79 2F 1D 19 01 48 BC A6 19 3F 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 92 2C 0C 2C 28 16 2C 06 39 44 AF 19 01 48 BC A6 19 06 00 04 1B 17 98 00 00 16 39 3F 92 90 2C 06 2C 03 16 2C 28 16 16 2C 0A 16 
    //1C 20 82 2B 26 16 0F 01 90 79 33 26 2E 20 79 2F 1D 19 01 48 BC A6 19 3F 00 04 1B 16 98 00 00 1F 
    //47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 92 2C 0C 2C 28 16 2C 06 39 44 AF 19 01 48 BC A6 19 
    //06 00 04 1B 17 98 00 00 16 39 3F 92 90 2C 06 2C 03 16 2C 28 16 16 2C 0A 16 04 0B 47 
  }



