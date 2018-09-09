//==============================================================================
//  HUD_Shop_CraftItemDescription
//==============================================================================

class HUD_Shop_CraftItemDescription extends HUD_Shop_ItemDescription
    dependsOn(HUD_ShopCraftItemContainer,GUI_TextCtrl,IC_Recipe)
    Transient
    Config(User)
  ;

  const DESCRIPTION_OFFSET_2 =  164;
  const DESCRIPTION_OFFSET_1 =  46;
  var private HUD_BaseItemContainer mResultContainer;
  var private GUI_TextCtrl mResultText;


  function OnItemSetHandler(Game_Item aItem,int aLocationSlot) {
    local Game_Item resultItem;
    local HUD_ShopCraftItemContainer container;
    Super.OnItemSetHandler(aItem,aLocationSlot);                                //0000 : 1C B8 80 2C 26 00 90 69 34 26 00 08 6A 34 26 16 
    container = HUD_ShopCraftItemContainer(mContainer);                         //0010 : 0F 00 50 21 06 1B 2E B0 C9 30 1D 01 78 76 89 19 
    switch (container.GetCraftingType()) {                                      //0020 : 05 01 19 00 50 21 06 1B 06 00 01 1B B6 98 00 00 16 
      case 0 :                                                                  //0031 : 0A 36 00 24 00 
      case 3 :                                                                  //0036 : 0A 86 00 24 03 
        mDescriptionText.mLeft = 46.00000000;                                   //003B : 0F 19 01 E0 47 2B 26 05 00 04 01 08 86 31 16 1E 00 00 38 42 
        mDescriptionItemTypeText.mLeft = 46.00000000;                           //004F : 0F 19 01 70 DB 2B 26 05 00 04 01 08 86 31 16 1E 00 00 38 42 
        mResultText.SetVisible(False);                                          //0063 : 19 01 80 A2 2C 26 07 00 00 1B 14 98 00 00 28 16 
        mResultContainer.SetVisible(False);                                     //0073 : 19 01 D0 E9 04 1B 07 00 00 1B 14 98 00 00 28 16 
        break;                                                                  //0083 : 06 F4 01 
      case 2 :                                                                  //0086 : 0A 8B 00 24 02 
      case 1 :                                                                  //008B : 0A F1 01 24 01 
        mDescriptionText.mLeft = 164.00000000;                                  //0090 : 0F 19 01 E0 47 2B 26 05 00 04 01 08 86 31 16 1E 00 00 24 43 
        mDescriptionItemTypeText.mLeft = 164.00000000;                          //00A4 : 0F 19 01 70 DB 2B 26 05 00 04 01 08 86 31 16 1E 00 00 24 43 
        mResultText.SetVisible(True);                                           //00B8 : 19 01 80 A2 2C 26 07 00 00 1B 14 98 00 00 27 16 
        if (container.GetCraftingType() == 2) {                                 //00C8 : 07 0C 01 9A 39 3A 19 00 50 21 06 1B 06 00 01 1B B6 98 00 00 16 39 3A 24 02 16 
          mResultText.SetText("Results in recipe for:");                        //00E2 : 19 01 80 A2 2C 26 1E 00 00 1B 13 98 00 00 1F 52 65 73 75 6C 74 73 20 69 6E 20 72 65 63 69 70 65 20 66 6F 72 3A 00 16 
        } else {                                                                //0109 : 06 28 01 
          mResultText.SetText("Results in:");                                   //010C : 19 01 80 A2 2C 26 13 00 00 1B 13 98 00 00 1F 52 65 73 75 6C 74 73 20 69 6E 3A 00 16 
        }
        resultItem = new Class'Game_Item';                                      //0128 : 0F 00 68 81 2C 26 11 0B 0B 0B 20 30 E6 5B 01 
        resultItem.Type = container.GetRecipeComponent().ProducedItem;          //0137 : 0F 19 00 68 81 2C 26 05 00 04 01 98 2F 22 11 19 19 00 50 21 06 1B 06 00 04 1B 33 99 00 00 16 05 00 04 01 D8 47 2C 11 
        resultItem.Color1 = 0;                                                  //015E : 0F 19 00 68 81 2C 26 05 00 01 01 08 CA 22 11 24 00 
        resultItem.Color2 = 0;                                                  //016F : 0F 19 00 68 81 2C 26 05 00 01 01 F8 CA 22 11 24 00 
        resultItem.StackSize = 1;                                               //0180 : 0F 19 00 68 81 2C 26 05 00 04 01 E8 CB 22 11 26 
        mResultContainer.SetVisible(True);                                      //0190 : 19 01 D0 E9 04 1B 07 00 00 1B 14 98 00 00 27 16 
        mResultContainer.SetItem(resultItem);                                   //01A0 : 19 01 D0 E9 04 1B 0B 00 00 1B 4A 97 00 00 00 68 81 2C 26 16 
        SetDescription(resultItem.Type.Name.Text,resultItem.Type.GetTypeName());//01B4 : 1B 45 97 00 00 36 58 C6 6B 0F 19 19 00 68 81 2C 26 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 19 19 00 68 81 2C 26 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 16 
        break;                                                                  //01EE : 06 F4 01 
      default:                                                                  //01F1 : 0A FF FF 
    }
    Invalidate();                                                               //01F4 : 1B 1D 98 00 00 16 
    //1C B8 80 2C 26 00 90 69 34 26 00 08 6A 34 26 16 0F 00 50 21 06 1B 2E B0 C9 30 1D 01 78 76 89 19 
    //05 01 19 00 50 21 06 1B 06 00 01 1B B6 98 00 00 16 0A 36 00 24 00 0A 86 00 24 03 0F 19 01 E0 47 
    //2B 26 05 00 04 01 08 86 31 16 1E 00 00 38 42 0F 19 01 70 DB 2B 26 05 00 04 01 08 86 31 16 1E 00 
    //00 38 42 19 01 80 A2 2C 26 07 00 00 1B 14 98 00 00 28 16 19 01 D0 E9 04 1B 07 00 00 1B 14 98 00 
    //00 28 16 06 F4 01 0A 8B 00 24 02 0A F1 01 24 01 0F 19 01 E0 47 2B 26 05 00 04 01 08 86 31 16 1E 
    //00 00 24 43 0F 19 01 70 DB 2B 26 05 00 04 01 08 86 31 16 1E 00 00 24 43 19 01 80 A2 2C 26 07 00 
    //00 1B 14 98 00 00 27 16 07 0C 01 9A 39 3A 19 00 50 21 06 1B 06 00 01 1B B6 98 00 00 16 39 3A 24 
    //02 16 19 01 80 A2 2C 26 1E 00 00 1B 13 98 00 00 1F 52 65 73 75 6C 74 73 20 69 6E 20 72 65 63 69 
    //70 65 20 66 6F 72 3A 00 16 06 28 01 19 01 80 A2 2C 26 13 00 00 1B 13 98 00 00 1F 52 65 73 75 6C 
    //74 73 20 69 6E 3A 00 16 0F 00 68 81 2C 26 11 0B 0B 0B 20 30 E6 5B 01 0F 19 00 68 81 2C 26 05 00 
    //04 01 98 2F 22 11 19 19 00 50 21 06 1B 06 00 04 1B 33 99 00 00 16 05 00 04 01 D8 47 2C 11 0F 19 
    //00 68 81 2C 26 05 00 01 01 08 CA 22 11 24 00 0F 19 00 68 81 2C 26 05 00 01 01 F8 CA 22 11 24 00 
    //0F 19 00 68 81 2C 26 05 00 04 01 E8 CB 22 11 26 19 01 D0 E9 04 1B 07 00 00 1B 14 98 00 00 27 16 
    //19 01 D0 E9 04 1B 0B 00 00 1B 4A 97 00 00 00 68 81 2C 26 16 1B 45 97 00 00 36 58 C6 6B 0F 19 19 
    //00 68 81 2C 26 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 19 19 00 68 81 2C 26 05 00 04 01 
    //98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 16 06 F4 01 0A FF FF 1B 1D 98 00 00 16 04 0B 47 
  }


  function Initialize() {
    mComponentStyle = mComponentStyle | 768 | 2097152 | 524288;                 //0000 : 0F 01 80 DC 9D 19 9E 9E 9E 01 80 DC 9D 19 1D 00 03 00 00 16 1D 00 00 20 00 16 1D 00 00 08 00 16 
    mResultText = GUI_TextCtrl(CreatePage("GUI_TextCtrl",0,256,46,4,70,32));    //0020 : 0F 01 80 A2 2C 26 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 2C 2E 2C 04 2C 46 2C 20 16 
    mResultText.SetVisible(False);                                              //004D : 19 01 80 A2 2C 26 07 00 00 1B 14 98 00 00 28 16 
    mResultContainer = HUD_BaseItemContainer(CreateButton("HUD_BaseItemContainer",0,0,118,0,40,40));//005D : 0F 01 D0 E9 04 1B 2E 70 85 30 1D 1B 18 98 00 00 1F 48 55 44 5F 42 61 73 65 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 25 25 2C 76 25 2C 28 2C 28 16 
    mResultContainer.SetVisible(False);                                         //008E : 19 01 D0 E9 04 1B 07 00 00 1B 14 98 00 00 28 16 
    Super.Initialize();                                                         //009E : 1C 00 45 2B 26 16 
    //0F 01 80 DC 9D 19 9E 9E 9E 01 80 DC 9D 19 1D 00 03 00 00 16 1D 00 00 20 00 16 1D 00 00 08 00 16 
    //0F 01 80 A2 2C 26 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 
    //00 01 00 00 2C 2E 2C 04 2C 46 2C 20 16 19 01 80 A2 2C 26 07 00 00 1B 14 98 00 00 28 16 0F 01 D0 
    //E9 04 1B 2E 70 85 30 1D 1B 18 98 00 00 1F 48 55 44 5F 42 61 73 65 49 74 65 6D 43 6F 6E 74 61 69 
    //6E 65 72 00 25 25 2C 76 25 2C 28 2C 28 16 19 01 D0 E9 04 1B 07 00 00 1B 14 98 00 00 28 16 1C 00 
    //45 2B 26 16 04 0B 47 
  }



