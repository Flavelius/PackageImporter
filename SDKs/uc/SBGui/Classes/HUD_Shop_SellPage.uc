//==============================================================================
//  HUD_Shop_SellPage
//==============================================================================

class HUD_Shop_SellPage extends GUI_Page
    dependsOn(HUD_ShopSellItemContainer,HUD_MoneyPage,Game_Item,Item_Type,GUI_Button,Class,GUI_BaseDesktop,GUI_Desktop,GED_Editor)
    Transient
    Config(User)
  ;

  var HUD_ShopSellItemContainer mContainer;
  var GUI_Label mSellLabel;
  var HUD_MoneyPage mSalePrice;
  var GUI_Button mSellButton;


  function bool SellItem(GUI_Component clickedButton) {
    mContainer.SellItem();                                                      //0000 : 19 01 20 6B 04 1B 06 00 00 1B 3A 97 00 00 16 
    return True;                                                                //000F : 04 27 
    //19 01 20 6B 04 1B 06 00 00 1B 3A 97 00 00 16 04 27 04 0B 47 
  }


  function OnItemSet(Game_Item aItem,int aLocationSlot) {
    if (aItem != None) {                                                        //0000 : 07 55 00 77 00 48 EA 06 1B 2A 16 
      mSalePrice.SetMoney(aItem.Type.GetSellValue() * aItem.StackSize);         //000B : 19 01 90 35 04 1B 2E 00 00 1B 4B 97 00 00 90 19 19 00 48 EA 06 1B 05 00 04 01 98 2F 22 11 06 00 04 1C 28 D7 2B 11 16 19 00 48 EA 06 1B 05 00 04 01 E8 CB 22 11 16 16 
      mSellButton.SetEnabled(True);                                             //0042 : 19 01 98 72 04 1B 07 00 00 1B 5F 32 00 00 27 16 
    } else {                                                                    //0052 : 06 75 00 
      mSalePrice.SetMoney(0);                                                   //0055 : 19 01 90 35 04 1B 07 00 00 1B 4B 97 00 00 25 16 
      mSellButton.SetEnabled(False);                                            //0065 : 19 01 98 72 04 1B 07 00 00 1B 5F 32 00 00 28 16 
    }
    //07 55 00 77 00 48 EA 06 1B 2A 16 19 01 90 35 04 1B 2E 00 00 1B 4B 97 00 00 90 19 19 00 48 EA 06 
    //1B 05 00 04 01 98 2F 22 11 06 00 04 1C 28 D7 2B 11 16 19 00 48 EA 06 1B 05 00 04 01 E8 CB 22 11 
    //16 16 19 01 98 72 04 1B 07 00 00 1B 5F 32 00 00 27 16 06 75 00 19 01 90 35 04 1B 07 00 00 1B 4B 
    //97 00 00 25 16 19 01 98 72 04 1B 07 00 00 1B 5F 32 00 00 28 16 04 0B 47 
  }


  function Reset() {
    mContainer.RemoveItem();                                                    //0000 : 19 01 20 6B 04 1B 06 00 00 1B 81 0C 00 00 16 
    //19 01 20 6B 04 1B 06 00 00 1B 81 0C 00 00 16 04 0B 47 
  }


  event Initialize() {
    local GED_Editor Editor;
    mComponentStyle = mComponentStyle | Class'GUI_BaseDesktop'.2097152;         //0000 : 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 00 68 D7 00 05 00 04 1D 00 00 20 00 16 
    Super.Initialize();                                                         //001B : 1C 40 5B 9E 19 16 
    mSellLabel = CreateLabel("GUI_Label",0,512 | 2048 | 4096,0,0);              //0021 : 0F 01 E8 51 06 1B 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 02 00 00 1D 00 08 00 00 16 1D 00 10 00 00 16 25 25 16 
    mSalePrice = HUD_MoneyPage(CreatePage("HUD_MoneyPage",0,0,0,0,0,0));        //004E : 0F 01 90 35 04 1B 2E B0 75 30 1D 1B 16 98 00 00 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 00 25 25 25 25 25 25 16 
    mSalePrice.SetTextFont("SBFontsTX.Verdana10");                              //0074 : 19 01 90 35 04 1B 1B 00 00 1B 50 97 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mContainer = HUD_ShopSellItemContainer(CreateButton("HUD_ShopSellItemContainer",0,0,0,0,40,40));//0098 : 0F 01 20 6B 04 1B 2E B0 B4 30 1D 1B 18 98 00 00 1F 48 55 44 5F 53 68 6F 70 53 65 6C 6C 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 25 25 25 25 2C 28 2C 28 16 
    mContainer.SetItemLocation(12,0,0);                                         //00CC : 19 01 20 6B 04 1B 0A 00 00 1B 1B 06 00 00 24 0C 25 25 16 
    mContainer.__OnItemSet__Delegate = OnItemSet;                               //00DF : 45 19 01 20 6B 04 1B 05 00 08 01 80 FC 05 1B 44 02 97 00 00 
    mSellButton = CreateButton("GUI_Button",0,2,0,0,0,0);                       //00F3 : 0F 01 98 72 04 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 25 25 25 25 16 
    mSellButton.__OnClick__Delegate = SellItem;                                 //0112 : 45 19 01 98 72 04 1B 05 00 08 01 98 EB 9D 19 44 3A 97 00 00 
    mSellButton.SetEnabled(False);                                              //0126 : 19 01 98 72 04 1B 07 00 00 1B 5F 32 00 00 28 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0136 : 0F 00 30 B7 2C 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor != None) {                                                       //015B : 07 2C 02 77 00 30 B7 2C 26 2A 16 
      Editor.Register(self,"Sell_Main");                                        //0166 : 19 00 30 B7 2C 26 12 00 00 1B 39 98 00 00 17 1F 53 65 6C 6C 5F 4D 61 69 6E 00 16 
      Editor.Register(mSellLabel,"Sell_Label");                                 //0181 : 19 00 30 B7 2C 26 17 00 00 1B 39 98 00 00 01 E8 51 06 1B 1F 53 65 6C 6C 5F 4C 61 62 65 6C 00 16 
      Editor.Register(mSalePrice,"Sell_Price");                                 //01A1 : 19 00 30 B7 2C 26 17 00 00 1B 39 98 00 00 01 90 35 04 1B 1F 53 65 6C 6C 5F 50 72 69 63 65 00 16 
      Editor.Register(mContainer,"Sell_Container");                             //01C1 : 19 00 30 B7 2C 26 1B 00 00 1B 39 98 00 00 01 20 6B 04 1B 1F 53 65 6C 6C 5F 43 6F 6E 74 61 69 6E 65 72 00 16 
      Editor.Register(mSellButton,"Sell_Confirm");                              //01E5 : 19 00 30 B7 2C 26 19 00 00 1B 39 98 00 00 01 98 72 04 1B 1F 53 65 6C 6C 5F 43 6F 6E 66 69 72 6D 00 16 
      Editor.Attach(self,"Shops\Sell_Page.txt");                                //0207 : 19 00 30 B7 2C 26 1C 00 00 1B 3F 01 00 00 17 1F 53 68 6F 70 73 5C 53 65 6C 6C 5F 50 61 67 65 2E 74 78 74 00 16 
    }
    //0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 12 20 00 68 D7 00 05 00 04 1D 00 00 20 00 16 1C 40 5B 9E 19 
    //16 0F 01 E8 51 06 1B 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 02 00 00 1D 
    //00 08 00 00 16 1D 00 10 00 00 16 25 25 16 0F 01 90 35 04 1B 2E B0 75 30 1D 1B 16 98 00 00 1F 48 
    //55 44 5F 4D 6F 6E 65 79 50 61 67 65 00 25 25 25 25 25 25 16 19 01 90 35 04 1B 1B 00 00 1B 50 97 
    //00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 0F 01 20 6B 04 1B 2E B0 
    //B4 30 1D 1B 18 98 00 00 1F 48 55 44 5F 53 68 6F 70 53 65 6C 6C 49 74 65 6D 43 6F 6E 74 61 69 6E 
    //65 72 00 25 25 25 25 2C 28 2C 28 16 19 01 20 6B 04 1B 0A 00 00 1B 1B 06 00 00 24 0C 25 25 16 45 
    //19 01 20 6B 04 1B 05 00 08 01 80 FC 05 1B 44 02 97 00 00 0F 01 98 72 04 1B 1B 18 98 00 00 1F 47 
    //55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 25 25 25 25 16 45 19 01 98 72 04 1B 05 00 08 01 98 EB 9D 
    //19 44 3A 97 00 00 19 01 98 72 04 1B 07 00 00 1B 5F 32 00 00 28 16 0F 00 30 B7 2C 26 2E D8 2F 32 
    //1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 07 2C 02 77 00 
    //30 B7 2C 26 2A 16 19 00 30 B7 2C 26 12 00 00 1B 39 98 00 00 17 1F 53 65 6C 6C 5F 4D 61 69 6E 00 
    //16 19 00 30 B7 2C 26 17 00 00 1B 39 98 00 00 01 E8 51 06 1B 1F 53 65 6C 6C 5F 4C 61 62 65 6C 00 
    //16 19 00 30 B7 2C 26 17 00 00 1B 39 98 00 00 01 90 35 04 1B 1F 53 65 6C 6C 5F 50 72 69 63 65 00 
    //16 19 00 30 B7 2C 26 1B 00 00 1B 39 98 00 00 01 20 6B 04 1B 1F 53 65 6C 6C 5F 43 6F 6E 74 61 69 
    //6E 65 72 00 16 19 00 30 B7 2C 26 19 00 00 1B 39 98 00 00 01 98 72 04 1B 1F 53 65 6C 6C 5F 43 6F 
    //6E 66 69 72 6D 00 16 19 00 30 B7 2C 26 1C 00 00 1B 3F 01 00 00 17 1F 53 68 6F 70 73 5C 53 65 6C 
    //6C 5F 50 61 67 65 2E 74 78 74 00 16 04 0B 47 
  }



