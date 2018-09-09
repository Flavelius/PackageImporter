//==============================================================================
//  HUD_Shop_PaintItemDescription
//==============================================================================

class HUD_Shop_PaintItemDescription extends HUD_Shop_ItemDescription
    dependsOn(HUD_ShopPaintItemContainer,HUD_ColourChoice,SBGuiStrings)
    Transient
    Config(User)
  ;

  var HUD_ColourChoice mColourChooser;
  var private GUI_Page mEyeIcon;
  var (null);
  var (null);


  function SetItemShown(bool aShown) {
    mEyeIcon.SetVisible(aShown);                                                //0000 : 19 01 60 20 06 1B 0C 00 00 1B 14 98 00 00 2D 00 20 6F 34 26 16 
    //19 01 60 20 06 1B 0C 00 00 1B 14 98 00 00 2D 00 20 6F 34 26 16 04 0B 47 
  }


  function ResetColours() {
    local HUD_ShopPaintItemContainer container;
    container = HUD_ShopPaintItemContainer(mContainer);                         //0000 : 0F 00 50 1A 06 1B 2E 70 C4 30 1D 01 78 76 89 19 
    if (container.HasChangedColours()) {                                        //0010 : 07 4C 00 19 00 50 1A 06 1B 06 00 04 1B E5 98 00 00 16 
      OnColourPicked(0,container.mOriginalColor1);                              //0022 : 1B 15 99 00 00 25 19 00 50 1A 06 1B 05 00 01 01 50 E6 04 1B 16 
      OnColourPicked(1,container.mOriginalColor2);                              //0037 : 1B 15 99 00 00 26 19 00 50 1A 06 1B 05 00 01 01 C8 E6 04 1B 16 
    }
    //0F 00 50 1A 06 1B 2E 70 C4 30 1D 01 78 76 89 19 07 4C 00 19 00 50 1A 06 1B 06 00 04 1B E5 98 00 
    //00 16 1B 15 99 00 00 25 19 00 50 1A 06 1B 05 00 01 01 50 E6 04 1B 16 1B 15 99 00 00 26 19 00 50 
    //1A 06 1B 05 00 01 01 C8 E6 04 1B 16 04 0B 47 
  }


  function OnColourPicked(int aColourOption,byte aColourIndex) {
    HUD_ShopPaintItemContainer(mContainer).SetItemColor(aColourOption,aColourIndex);//0000 : 19 2E 70 C4 30 1D 01 78 76 89 19 10 00 00 1B 54 9A 00 00 00 A0 2D 08 1B 00 40 2F 08 1B 16 
    mColourChooser.SetCurrentColour(aColourOption,aColourIndex);                //001E : 19 01 B0 5A 8A 19 10 00 00 1B 13 99 00 00 00 A0 2D 08 1B 00 40 2F 08 1B 16 
    OnColorSetForItem(mContainer.GetItem());                                    //0037 : 43 F8 28 08 1B ED 9A 00 00 19 01 78 76 89 19 06 00 04 1B C1 0C 00 00 16 16 
    //19 2E 70 C4 30 1D 01 78 76 89 19 10 00 00 1B 54 9A 00 00 00 A0 2D 08 1B 00 40 2F 08 1B 16 19 01 
    //B0 5A 8A 19 10 00 00 1B 13 99 00 00 00 A0 2D 08 1B 00 40 2F 08 1B 16 43 F8 28 08 1B ED 9A 00 00 
    //19 01 78 76 89 19 06 00 04 1B C1 0C 00 00 16 16 04 0B 47 
  }


  event Texture GetPalette(int aColour) {
    return Texture'ClothingArmor';                                              //0000 : 04 20 70 9C 26 11 
    //04 20 70 9C 26 11 04 0B 47 
  }


  function OpenPicker(HUD_ColourChoice aColourChoice,int aColourOption) {
    OnOpenPicker(self,aColourChoice,aColourOption);                             //0000 : 43 E0 26 08 1B 10 97 00 00 17 00 08 6D 34 26 00 F8 6D 34 26 16 
    //43 E0 26 08 1B 10 97 00 00 17 00 08 6D 34 26 00 F8 6D 34 26 16 04 0B 47 
  }


  function OnItemSetHandler(Game_Item aItem,int aLocationSlot) {
    if (aItem != None) {                                                        //0000 : 07 5A 00 77 00 58 1D 06 1B 2A 16 
      mColourChooser.SetCurrentColour(0,aItem.Color1);                          //000B : 19 01 B0 5A 8A 19 15 00 00 1B 13 99 00 00 25 19 00 58 1D 06 1B 05 00 01 01 08 CA 22 11 16 
      mColourChooser.SetCurrentColour(1,aItem.Color2);                          //0029 : 19 01 B0 5A 8A 19 15 00 00 1B 13 99 00 00 26 19 00 58 1D 06 1B 05 00 01 01 F8 CA 22 11 16 
      mColourChooser.SetVisible(True);                                          //0047 : 19 01 B0 5A 8A 19 07 00 00 1B 14 98 00 00 27 16 
    } else {                                                                    //0057 : 06 6A 00 
      mColourChooser.SetVisible(False);                                         //005A : 19 01 B0 5A 8A 19 07 00 00 1B 14 98 00 00 28 16 
    }
    Super.OnItemSetHandler(aItem,aLocationSlot);                                //006A : 1C B8 80 2C 26 00 58 1D 06 1B 00 E0 6B 34 26 16 
    //07 5A 00 77 00 58 1D 06 1B 2A 16 19 01 B0 5A 8A 19 15 00 00 1B 13 99 00 00 25 19 00 58 1D 06 1B 
    //05 00 01 01 08 CA 22 11 16 19 01 B0 5A 8A 19 15 00 00 1B 13 99 00 00 26 19 00 58 1D 06 1B 05 00 
    //01 01 F8 CA 22 11 16 19 01 B0 5A 8A 19 07 00 00 1B 14 98 00 00 27 16 06 6A 00 19 01 B0 5A 8A 19 
    //07 00 00 1B 14 98 00 00 28 16 1C B8 80 2C 26 00 58 1D 06 1B 00 E0 6B 34 26 16 04 0B 47 
  }


  function Initialize() {
    mComponentStyle = mComponentStyle | 768 | 2097152 | 524288;                 //0000 : 0F 01 80 DC 9D 19 9E 9E 9E 01 80 DC 9D 19 1D 00 03 00 00 16 1D 00 00 20 00 16 1D 00 00 08 00 16 
    SetEmptyDescription(Class'SBGuiStrings'.default.Place_item_to_dye_here.Text);//0020 : 1B 1C 99 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 13 99 19 16 
    Super.Initialize();                                                         //0039 : 1C 00 45 2B 26 16 
    mColourChooser = HUD_ColourChoice(CreatePage("HUD_ColourChoice",0,0,GetClientWidth() - 50 - 6,5,50,30));//003F : 0F 01 B0 5A 8A 19 2E A8 C6 31 1D 1B 16 98 00 00 1F 48 55 44 5F 43 6F 6C 6F 75 72 43 68 6F 69 63 65 00 25 25 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 32 16 39 3F 2C 06 16 2C 05 2C 32 2C 1E 16 
    mColourChooser.__OnOpenPicker__Delegate = OpenPicker;                       //007E : 45 19 01 B0 5A 8A 19 05 00 08 01 00 6F 07 1B 44 02 99 00 00 
    mColourChooser.__OnGetPalette__Delegate = GetPalette;                       //0092 : 45 19 01 B0 5A 8A 19 05 00 08 01 D8 19 06 1B 44 C5 96 00 00 
    mEyeIcon = CreatePage("GUI_Page",524288,0,mContainer.mLeft + 22,mContainer.mTop + 24,16,16);//00A6 : 0F 01 60 20 06 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 39 44 AE 19 01 78 76 89 19 05 00 04 01 08 86 31 16 39 3F 2C 16 16 39 44 AE 19 01 78 76 89 19 05 00 04 01 80 86 31 16 39 3F 2C 18 16 2C 10 2C 10 16 
    mEyeIcon.SetIconMaterial(Texture'SHOP_PREVIEW_EYE',0.00000000,0.00000000,16.00000000,16.00000000);//00F2 : 19 01 60 20 06 1B 1F 00 00 1B 34 98 00 00 20 28 A8 3C 26 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 41 1E 00 00 80 41 16 
    mEyeIcon.SetVisible(False);                                                 //011A : 19 01 60 20 06 1B 07 00 00 1B 14 98 00 00 28 16 
    //0F 01 80 DC 9D 19 9E 9E 9E 01 80 DC 9D 19 1D 00 03 00 00 16 1D 00 00 20 00 16 1D 00 00 08 00 16 
    //1B 1C 99 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 13 99 19 16 1C 00 45 2B 26 16 0F 
    //01 B0 5A 8A 19 2E A8 C6 31 1D 1B 16 98 00 00 1F 48 55 44 5F 43 6F 6C 6F 75 72 43 68 6F 69 63 65 
    //00 25 25 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 32 16 39 3F 2C 06 16 2C 05 2C 32 2C 1E 16 45 19 
    //01 B0 5A 8A 19 05 00 08 01 00 6F 07 1B 44 02 99 00 00 45 19 01 B0 5A 8A 19 05 00 08 01 D8 19 06 
    //1B 44 C5 96 00 00 0F 01 60 20 06 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 
    //25 39 44 AE 19 01 78 76 89 19 05 00 04 01 08 86 31 16 39 3F 2C 16 16 39 44 AE 19 01 78 76 89 19 
    //05 00 04 01 80 86 31 16 39 3F 2C 18 16 2C 10 2C 10 16 19 01 60 20 06 1B 1F 00 00 1B 34 98 00 00 
    //20 28 A8 3C 26 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 41 1E 00 00 80 41 16 19 01 60 20 06 1B 
    //07 00 00 1B 14 98 00 00 28 16 04 0B 47 
  }


  delegate OnColorSetForItem(Game_Item aItem);


  delegate OnOpenPicker(HUD_Shop_PaintItemDescription aDescription,HUD_ColourChoice aColourChoice,int aColourOption);



