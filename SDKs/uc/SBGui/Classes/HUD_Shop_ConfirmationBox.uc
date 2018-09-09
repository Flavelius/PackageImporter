//==============================================================================
//  HUD_Shop_ConfirmationBox
//==============================================================================

class HUD_Shop_ConfirmationBox extends GUI_MessageBox
    dependsOn(HUD_BaseItemContainer)
    Transient
    Config(User)
  ;

  var HUD_BaseItemContainer mContainer;


  function Game_Item GetItem() {
    if (mContainer != None) {                                                   //0000 : 07 1B 00 77 01 00 4F 2B 26 2A 16 
      return mContainer.GetItem();                                              //000B : 04 19 01 00 4F 2B 26 06 00 04 1B C1 0C 00 00 16 
    }
    return None;                                                                //001B : 04 2A 
    //07 1B 00 77 01 00 4F 2B 26 2A 16 04 19 01 00 4F 2B 26 06 00 04 1B C1 0C 00 00 16 04 2A 04 0B 47 
    //
  }


  function SetItem(Game_Item aItem) {
    if (mContainer != None) {                                                   //0000 : 07 1F 00 77 01 00 4F 2B 26 2A 16 
      mContainer.SetItem(aItem);                                                //000B : 19 01 00 4F 2B 26 0B 00 00 1B 4A 97 00 00 00 D0 08 34 26 16 
    }
    //07 1F 00 77 01 00 4F 2B 26 2A 16 19 01 00 4F 2B 26 0B 00 00 1B 4A 97 00 00 00 D0 08 34 26 16 04 
    //0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 38 B7 A6 19 16 
    mContainer = HUD_BaseItemContainer(mMessagePage.CreateButton("HUD_BaseItemContainer",0,0,6,6,40,40));//0006 : 0F 01 00 4F 2B 26 2E 70 85 30 1D 19 01 48 BC A6 19 27 00 04 1B 18 98 00 00 1F 48 55 44 5F 42 61 73 65 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 25 25 2C 06 2C 06 2C 28 2C 28 16 
    //1C 38 B7 A6 19 16 0F 01 00 4F 2B 26 2E 70 85 30 1D 19 01 48 BC A6 19 27 00 04 1B 18 98 00 00 1F 
    //48 55 44 5F 42 61 73 65 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 25 25 2C 06 2C 06 2C 28 2C 28 
    //16 04 0B 47 
  }



