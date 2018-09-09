//==============================================================================
//  HUD_Shop_ForgingItemDescription
//==============================================================================

class HUD_Shop_ForgingItemDescription extends HUD_Shop_ItemDescription
    dependsOn(SBGuiStrings)
    Transient
    Config(User)
  ;


  function Initialize() {
    mComponentStyle = mComponentStyle | 768 | 2097152 | 524288;                 //0000 : 0F 01 80 DC 9D 19 9E 9E 9E 01 80 DC 9D 19 1D 00 03 00 00 16 1D 00 00 20 00 16 1D 00 00 08 00 16 
    SetEmptyDescription(Class'SBGuiStrings'.default.Empty_Sigil_Slot.Text);     //0020 : 1B 1C 99 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 5D 99 19 16 
    Super.Initialize();                                                         //0039 : 1C 00 45 2B 26 16 
    //0F 01 80 DC 9D 19 9E 9E 9E 01 80 DC 9D 19 1D 00 03 00 00 16 1D 00 00 20 00 16 1D 00 00 08 00 16 
    //1B 1C 99 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 5D 99 19 16 1C 00 45 2B 26 16 04 
    //0B 47 
  }



