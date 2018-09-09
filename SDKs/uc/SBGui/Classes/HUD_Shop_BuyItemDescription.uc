//==============================================================================
//  HUD_Shop_BuyItemDescription
//==============================================================================

class HUD_Shop_BuyItemDescription extends HUD_Shop_ItemDescription
    dependsOn()
    Transient
    Config(User)
  ;

  var private GUI_Page mEyeIcon;


  function SetItemShown(bool aShown) {
    mEyeIcon.SetVisible(aShown);                                                //0000 : 19 01 C8 21 06 1B 0C 00 00 1B 14 98 00 00 2D 00 18 69 34 26 16 
    //19 01 C8 21 06 1B 0C 00 00 1B 14 98 00 00 2D 00 18 69 34 26 16 04 0B 47 
  }


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 00 45 2B 26 16 
    mEyeIcon = CreatePage("GUI_Page",524288,0,mContainer.mLeft + 22,mContainer.mTop + 24,16,16);//0006 : 0F 01 C8 21 06 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 39 44 AE 19 01 78 76 89 19 05 00 04 01 08 86 31 16 39 3F 2C 16 16 39 44 AE 19 01 78 76 89 19 05 00 04 01 80 86 31 16 39 3F 2C 18 16 2C 10 2C 10 16 
    mEyeIcon.SetIconMaterial(Texture'SHOP_PREVIEW_EYE',0.00000000,0.00000000,16.00000000,16.00000000);//0052 : 19 01 C8 21 06 1B 1F 00 00 1B 34 98 00 00 20 28 A8 3C 26 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 41 1E 00 00 80 41 16 
    mEyeIcon.SetVisible(False);                                                 //007A : 19 01 C8 21 06 1B 07 00 00 1B 14 98 00 00 28 16 
    //1C 00 45 2B 26 16 0F 01 C8 21 06 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 
    //25 39 44 AE 19 01 78 76 89 19 05 00 04 01 08 86 31 16 39 3F 2C 16 16 39 44 AE 19 01 78 76 89 19 
    //05 00 04 01 80 86 31 16 39 3F 2C 18 16 2C 10 2C 10 16 19 01 C8 21 06 1B 1F 00 00 1B 34 98 00 00 
    //20 28 A8 3C 26 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 41 1E 00 00 80 41 16 19 01 C8 21 06 1B 
    //07 00 00 1B 14 98 00 00 28 16 04 0B 47 
  }



