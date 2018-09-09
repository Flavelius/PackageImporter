//==============================================================================
//  HUD_Shop_CraftConfirmation
//==============================================================================

class HUD_Shop_CraftConfirmation extends HUD_Shop_ConfirmationBox
    dependsOn()
    Transient
    Config(User)
  ;


  function SetItem(Game_Item aItem) {
    Super.SetItem(aItem);                                                       //0000 : 1C 00 BD 2C 26 00 C0 0C 34 26 16 
    //1C 00 BD 2C 26 00 C0 0C 34 26 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 20 82 2B 26 16 
    //1C 20 82 2B 26 16 04 0B 47 
  }



