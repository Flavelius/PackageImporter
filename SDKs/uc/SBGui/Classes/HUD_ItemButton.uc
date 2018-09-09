//==============================================================================
//  HUD_ItemButton
//==============================================================================

class HUD_ItemButton extends GUI_Button
    dependsOn()
    Transient
    Config(User)
  ;

  var export transient editinline Item_Type mItem;
  var transient int mQuantity;


  function UpdateDisplay() {
    //04 0B 47 
  }


  function Reset() {
    SetItemProperties(None,0);                                                  //0000 : 1B A8 99 00 00 2A 25 16 
    mIntTag = -1;                                                               //0008 : 0F 01 58 90 31 16 1D FF FF FF FF 
    //1B A8 99 00 00 2A 25 16 0F 01 58 90 31 16 1D FF FF FF FF 04 0B 47 
  }


  function SetItemProperties(export editinline Item_Type aItem,int aAmount) {
    mItem = aItem;                                                              //0000 : 0F 01 F8 92 06 1B 00 18 A5 35 26 
    if (aAmount > 0) {                                                          //000B : 07 24 00 97 00 18 67 06 1B 25 16 
      mQuantity = aAmount;                                                      //0016 : 0F 01 28 17 08 1B 00 18 67 06 1B 
    } else {                                                                    //0021 : 06 2B 00 
      mQuantity = 0;                                                            //0024 : 0F 01 28 17 08 1B 25 
    }
    //0F 01 F8 92 06 1B 00 18 A5 35 26 07 24 00 97 00 18 67 06 1B 25 16 0F 01 28 17 08 1B 00 18 67 06 
    //1B 06 2B 00 0F 01 28 17 08 1B 25 04 0B 47 
  }



