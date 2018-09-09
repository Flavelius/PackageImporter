//==============================================================================
//  HUD_Shop_Selling_Page
//==============================================================================

class HUD_Shop_Selling_Page extends GUI_Page
    dependsOn(Game_Pawn,Game_Trading,GUI_ListView,HUD_Shop_SellItemDescription,HUD_ShopSellItemContainer,HUD_ItemContainer,GUI_Desktop,Class,GUI_Sounds,Game_Item,Item_Type,Game_PlayerItemManager,HUD_MoneyPageSmall)
    Transient
    Config(User)
  ;

  var private GUI_ListView mListView;
  var private int mSellCounter;
  var private bool mResetting;
  var (null);


  event OnComponentDestroyed() {
    GetPawn().Trading.__OnSellComplete__Delegate = None;                        //0000 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 05 00 08 01 10 90 22 11 44 00 00 00 00 
    Super.OnComponentDestroyed();                                               //001E : 1C E0 DA 9D 19 16 
    //45 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 05 00 08 01 10 90 22 11 44 00 00 00 00 1C E0 
    //DA 9D 19 16 04 0B 47 
  }


  function AddToSellList(Game_Item aItem,HUD_ItemContainer aSourceContainer,bool aSellImmediately) {
    local int i;
    local Game_Item Item;
    local HUD_Shop_SellItemDescription itemPage;
    local HUD_ShopSellItemContainer sellContainer;
    i = 0;                                                                      //0000 : 0F 00 90 09 06 1B 25 
    while (i < mListView.GetRowCount()) {                                       //0007 : 07 E1 00 96 00 90 09 06 1B 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
      itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,i));       //0020 : 0F 00 08 0A 06 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 90 09 06 1B 16 
      if (itemPage != None) {                                                   //0040 : 07 D7 00 77 00 08 0A 06 1B 2A 16 
        Item = itemPage.GetItem();                                              //004B : 0F 00 C8 9C 33 26 19 00 08 0A 06 1B 06 00 04 1B C1 0C 00 00 16 
        if (Item == None) {                                                     //0060 : 07 D7 00 72 00 C8 9C 33 26 2A 16 
          sellContainer = HUD_ShopSellItemContainer(itemPage.GetItemContainer());//006B : 0F 00 18 5C 07 1B 2E B0 B4 30 1D 19 00 08 0A 06 1B 06 00 04 1B 2C 98 00 00 16 
          sellContainer.PlaceItem(aSourceContainer,aItem);                      //0085 : 19 00 18 5C 07 1B 10 00 04 1B 2F 97 00 00 00 38 01 33 26 00 C0 00 33 26 16 
          if (aSellImmediately) {                                               //009E : 07 D4 00 2D 00 B0 01 33 26 
            GetPawn().Trading.__OnSellComplete__Delegate = OnSellCompleteHandler;//00A7 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 05 00 08 01 10 90 22 11 44 A1 99 00 00 
            sellContainer.SellItem();                                           //00C5 : 19 00 18 5C 07 1B 06 00 00 1B 3A 97 00 00 16 
          }
          goto jl00E1;                                                          //00D4 : 06 E1 00 
        }
      }
      ++i;                                                                      //00D7 : A3 00 90 09 06 1B 16 
    }
    //0F 00 90 09 06 1B 25 07 E1 00 96 00 90 09 06 1B 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
    //0F 00 08 0A 06 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 90 09 06 1B 16 
    //07 D7 00 77 00 08 0A 06 1B 2A 16 0F 00 C8 9C 33 26 19 00 08 0A 06 1B 06 00 04 1B C1 0C 00 00 16 
    //07 D7 00 72 00 C8 9C 33 26 2A 16 0F 00 18 5C 07 1B 2E B0 B4 30 1D 19 00 08 0A 06 1B 06 00 04 1B 
    //2C 98 00 00 16 19 00 18 5C 07 1B 10 00 04 1B 2F 97 00 00 00 38 01 33 26 00 C0 00 33 26 16 07 D4 
    //00 2D 00 B0 01 33 26 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 05 00 08 01 10 90 22 11 
    //44 A1 99 00 00 19 00 18 5C 07 1B 06 00 00 1B 3A 97 00 00 16 06 E1 00 A3 00 90 09 06 1B 16 06 07 
    //00 04 0B 47 
  }


  function OnSellCompleteHandler(bool aSuccess) {
    local int i;
    local HUD_Shop_SellItemDescription itemPage;
    if (!aSuccess) {                                                            //0000 : 07 7D 00 81 2D 00 48 00 33 26 16 
      i = 0;                                                                    //000B : 0F 00 48 03 06 1B 25 
      while (i < mListView.GetRowCount()) {                                     //0012 : 07 7A 00 96 00 48 03 06 1B 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
        itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,i));     //002B : 0F 00 58 58 07 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 48 03 06 1B 16 
        if (itemPage != None) {                                                 //004B : 07 70 00 77 00 58 58 07 1B 2A 16 
          itemPage.GetItemContainer().SetDBLocked(False);                       //0056 : 19 19 00 58 58 07 1B 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 43 97 00 00 28 16 
        }
        ++i;                                                                    //0070 : A3 00 48 03 06 1B 16 
      }
    } else {                                                                    //007A : 06 9A 00 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.Sell);                       //007D : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 E0 2E A6 19 16 
    }
    //07 7D 00 81 2D 00 48 00 33 26 16 0F 00 48 03 06 1B 25 07 7A 00 96 00 48 03 06 1B 19 01 D8 24 EC 
    //25 06 00 04 1B 43 98 00 00 16 16 0F 00 58 58 07 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 
    //37 98 00 00 25 00 48 03 06 1B 16 07 70 00 77 00 58 58 07 1B 2A 16 19 19 00 58 58 07 1B 06 00 04 
    //1B 2C 98 00 00 16 07 00 00 1B 43 97 00 00 28 16 A3 00 48 03 06 1B 16 06 12 00 06 9A 00 19 01 48 
    //0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 E0 2E A6 19 16 04 0B 47 
  }


  function SaleConfirmed() {
    local int i;
    local Game_Item Item;
    local array<int> itemIDs;
    local HUD_Shop_SellItemDescription itemPage;
    i = 0;                                                                      //0000 : 0F 00 08 00 06 1B 25 
    while (i < mListView.GetRowCount()) {                                       //0007 : 07 C4 00 96 00 08 00 06 1B 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
      itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,i));       //0020 : 0F 00 C8 B5 04 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 08 00 06 1B 16 
      if (itemPage != None) {                                                   //0040 : 07 BA 00 77 00 C8 B5 04 1B 2A 16 
        Item = itemPage.GetItem();                                              //004B : 0F 00 10 55 07 1B 19 00 C8 B5 04 1B 06 00 04 1B C1 0C 00 00 16 
        if (Item != None) {                                                     //0060 : 07 BA 00 77 00 10 55 07 1B 2A 16 
          itemIDs[itemIDs.Length] = Item.DBID;                                  //006B : 0F 10 37 00 88 55 07 1B 00 88 55 07 1B 19 00 10 55 07 1B 05 00 04 01 18 1F 22 11 
          itemPage.GetItemContainer().SetGUILocked(False);                      //0086 : 19 19 00 C8 B5 04 1B 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 47 97 00 00 28 16 
          itemPage.GetItemContainer().SetDBLocked(True);                        //00A0 : 19 19 00 C8 B5 04 1B 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 43 97 00 00 27 16 
        }
      }
      ++i;                                                                      //00BA : A3 00 08 00 06 1B 16 
    }
    GetPawn().Trading.__OnSellComplete__Delegate = OnSellCompleteHandler;       //00C4 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 05 00 08 01 10 90 22 11 44 A1 99 00 00 
    GetPawn().Trading.cl_SellItems(itemIDs);                                    //00E2 : 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 0B 00 00 1B 46 1B 00 00 00 88 55 07 1B 16 
    //0F 00 08 00 06 1B 25 07 C4 00 96 00 08 00 06 1B 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
    //0F 00 C8 B5 04 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 08 00 06 1B 16 
    //07 BA 00 77 00 C8 B5 04 1B 2A 16 0F 00 10 55 07 1B 19 00 C8 B5 04 1B 06 00 04 1B C1 0C 00 00 16 
    //07 BA 00 77 00 10 55 07 1B 2A 16 0F 10 37 00 88 55 07 1B 00 88 55 07 1B 19 00 10 55 07 1B 05 00 
    //04 01 18 1F 22 11 19 19 00 C8 B5 04 1B 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 47 97 00 00 28 16 
    //19 19 00 C8 B5 04 1B 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 43 97 00 00 27 16 A3 00 08 00 06 1B 
    //16 06 07 00 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 05 00 08 01 10 90 22 11 44 A1 99 
    //00 00 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 0B 00 00 1B 46 1B 00 00 00 88 55 07 1B 16 
    //04 0B 47 
  }


  function bool MBClickHandler(GUI_MessageBox messageBox,int boxTag,int buttonTag) {
    local int i;
    local HUD_Shop_SellItemDescription itemPage;
    if (boxTag == 1) {                                                          //0000 : 07 AE 00 9A 00 08 6C 35 26 26 16 
      switch (buttonTag) {                                                      //000B : 05 04 00 80 6C 35 26 
        case 1 :                                                                //0012 : 0A 1F 00 26 
          SaleConfirmed();                                                      //0016 : 1B 2E 99 00 00 16 
          break;                                                                //001C : 06 AE 00 
        case 2 :                                                                //001F : 0A AB 00 2C 02 
          i = 0;                                                                //0024 : 0F 00 10 FF 05 1B 25 
          while (i < mListView.GetRowCount()) {                                 //002B : 07 A8 00 96 00 10 FF 05 1B 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
            itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,i)); //0044 : 0F 00 88 FF 05 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 10 FF 05 1B 16 
            if (itemPage != None) {                                             //0064 : 07 9E 00 77 00 88 FF 05 1B 2A 16 
              if (itemPage.GetItem() != None) {                                 //006F : 07 9E 00 77 19 00 88 FF 05 1B 06 00 04 1B C1 0C 00 00 16 2A 16 
                itemPage.GetItemContainer().SetGUILocked(False);                //0084 : 19 19 00 88 FF 05 1B 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 47 97 00 00 28 16 
              }
            }
            ++i;                                                                //009E : A3 00 10 FF 05 1B 16 
          }
          break;                                                                //00A8 : 06 AE 00 
        default:                                                                //00AB : 0A FF FF 
      }
    }
    return True;                                                                //00AE : 04 27 
    //07 AE 00 9A 00 08 6C 35 26 26 16 05 04 00 80 6C 35 26 0A 1F 00 26 1B 2E 99 00 00 16 06 AE 00 0A 
    //AB 00 2C 02 0F 00 10 FF 05 1B 25 07 A8 00 96 00 10 FF 05 1B 19 01 D8 24 EC 25 06 00 04 1B 43 98 
    //00 00 16 16 0F 00 88 FF 05 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 10 
    //FF 05 1B 16 07 9E 00 77 00 88 FF 05 1B 2A 16 07 9E 00 77 19 00 88 FF 05 1B 06 00 04 1B C1 0C 00 
    //00 16 2A 16 19 19 00 88 FF 05 1B 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 47 97 00 00 28 16 A3 00 
    //10 FF 05 1B 16 06 2B 00 06 AE 00 0A FF FF 04 27 04 0B 47 
  }


  function SellItems() {
    local int i;
    local int Handle;
    local int worth;
    local int meleeCount;
    local int rangedCount;
    local Game_Item Item;
    local HUD_Shop_SellItemDescription itemPage;
    i = 0;                                                                      //0000 : 0F 00 B0 8C 2C 26 25 
    while (i < mListView.GetRowCount()) {                                       //0007 : 07 B9 00 96 00 B0 8C 2C 26 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
      itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,i));       //0020 : 0F 00 B8 FC 2C 26 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 B0 8C 2C 26 16 
      if (itemPage != None) {                                                   //0040 : 07 AF 00 77 00 B8 FC 2C 26 2A 16 
        Item = itemPage.GetItem();                                              //004B : 0F 00 50 FB 2C 26 19 00 B8 FC 2C 26 06 00 04 1B C1 0C 00 00 16 
        if (Item != None) {                                                     //0060 : 07 AF 00 77 00 50 FB 2C 26 2A 16 
          switch (Item.Type.ItemType) {                                         //006B : 05 01 19 19 00 50 FB 2C 26 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 
            case 11 :                                                           //0084 : 0A 89 00 24 0B 
            case 12 :                                                           //0089 : 0A 8E 00 24 0C 
            case 13 :                                                           //008E : 0A 9D 00 24 0D 
              meleeCount++;                                                     //0093 : A5 00 88 68 33 26 16 
              break;                                                            //009A : 06 AF 00 
            case 14 :                                                           //009D : 0A AC 00 24 0E 
              rangedCount++;                                                    //00A2 : A5 00 58 6B 33 26 16 
              break;                                                            //00A9 : 06 AF 00 
            default:                                                            //00AC : 0A FF FF 
          }
        }
      }
      ++i;                                                                      //00AF : A3 00 B0 8C 2C 26 16 
    }
    if (!Game_PlayerItemManager(GetPawn().itemManager).cl_CanRemoveWeapons(meleeCount,rangedCount)) {//00B9 : 07 E8 00 81 19 2E F0 92 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 19 11 10 00 04 1B A0 1B 00 00 00 88 68 33 26 00 58 6B 33 26 16 16 
      return;                                                                   //00E6 : 04 0B 
    }
    i = 0;                                                                      //00E8 : 0F 00 B0 8C 2C 26 25 
    while (i < mListView.GetRowCount()) {                                       //00EF : 07 A6 01 96 00 B0 8C 2C 26 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
      itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,i));       //0108 : 0F 00 B8 FC 2C 26 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 B0 8C 2C 26 16 
      if (itemPage != None) {                                                   //0128 : 07 9C 01 77 00 B8 FC 2C 26 2A 16 
        Item = itemPage.GetItem();                                              //0133 : 0F 00 50 FB 2C 26 19 00 B8 FC 2C 26 06 00 04 1B C1 0C 00 00 16 
        if (Item != None) {                                                     //0148 : 07 9C 01 77 00 50 FB 2C 26 2A 16 
          itemPage.GetItemContainer().SetGUILocked(True);                       //0153 : 19 19 00 B8 FC 2C 26 06 00 04 1B 2C 98 00 00 16 07 00 00 1B 47 97 00 00 27 16 
          worth += Item.Type.GetSellValue() * Item.StackSize;                   //016D : A1 00 50 68 35 26 90 19 19 00 50 FB 2C 26 05 00 04 01 98 2F 22 11 06 00 04 1C 28 D7 2B 11 16 19 00 50 FB 2C 26 05 00 04 01 E8 CB 22 11 16 16 
        }
      }
      ++i;                                                                      //019C : A3 00 B0 8C 2C 26 16 
    }
    Handle = mDesktop.CreateMessageBox("GUI_MessageBox","Sell items","Are you sure you want to sell these items?",1 | 2,1,self);//01A6 : 0F 00 D8 67 35 26 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 1F 53 65 6C 6C 20 69 74 65 6D 73 00 1F 41 72 65 20 79 6F 75 20 73 75 72 65 20 79 6F 75 20 77 61 6E 74 20 74 6F 20 73 65 6C 6C 20 74 68 65 73 65 20 69 74 65 6D 73 3F 00 9E 26 2C 02 16 26 17 16 
    //0F 00 B0 8C 2C 26 25 07 B9 00 96 00 B0 8C 2C 26 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 16 
    //0F 00 B8 FC 2C 26 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 B0 8C 2C 26 16 
    //07 AF 00 77 00 B8 FC 2C 26 2A 16 0F 00 50 FB 2C 26 19 00 B8 FC 2C 26 06 00 04 1B C1 0C 00 00 16 
    //07 AF 00 77 00 50 FB 2C 26 2A 16 05 01 19 19 00 50 FB 2C 26 05 00 04 01 98 2F 22 11 05 00 01 01 
    //10 30 22 11 0A 89 00 24 0B 0A 8E 00 24 0C 0A 9D 00 24 0D A5 00 88 68 33 26 16 06 AF 00 0A AC 00 
    //24 0E A5 00 58 6B 33 26 16 06 AF 00 0A FF FF A3 00 B0 8C 2C 26 16 06 07 00 07 E8 00 81 19 2E F0 
    //92 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 19 11 10 00 04 1B A0 1B 00 00 00 88 68 33 26 00 
    //58 6B 33 26 16 16 04 0B 0F 00 B0 8C 2C 26 25 07 A6 01 96 00 B0 8C 2C 26 19 01 D8 24 EC 25 06 00 
    //04 1B 43 98 00 00 16 16 0F 00 B8 FC 2C 26 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 
    //00 25 00 B0 8C 2C 26 16 07 9C 01 77 00 B8 FC 2C 26 2A 16 0F 00 50 FB 2C 26 19 00 B8 FC 2C 26 06 
    //00 04 1B C1 0C 00 00 16 07 9C 01 77 00 50 FB 2C 26 2A 16 19 19 00 B8 FC 2C 26 06 00 04 1B 2C 98 
    //00 00 16 07 00 00 1B 47 97 00 00 27 16 A1 00 50 68 35 26 90 19 19 00 50 FB 2C 26 05 00 04 01 98 
    //2F 22 11 06 00 04 1C 28 D7 2B 11 16 19 00 50 FB 2C 26 05 00 04 01 E8 CB 22 11 16 16 A3 00 B0 8C 
    //2C 26 16 06 EF 00 0F 00 D8 67 35 26 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 
    //65 73 73 61 67 65 42 6F 78 00 1F 53 65 6C 6C 20 69 74 65 6D 73 00 1F 41 72 65 20 79 6F 75 20 73 
    //75 72 65 20 79 6F 75 20 77 61 6E 74 20 74 6F 20 73 65 6C 6C 20 74 68 65 73 65 20 69 74 65 6D 73 
    //3F 00 9E 26 2C 02 16 26 17 16 04 0B 47 
  }


  function OnItemContainerClicked(HUD_Shop_ItemDescription aDescription) {
    //04 0B 47 
  }


  function OnItemSetHandler(int aRowId,Game_Item aItem) {
    local int itemLevel;
    local int itemWorth;
    local int rowIndex;
    local HUD_Shop_SellItemDescription itemPage;
    local HUD_MoneyPageSmall moneyPage;
    if (mResetting) {                                                           //0000 : 07 0B 00 2D 01 88 36 07 1B 
      return;                                                                   //0009 : 04 0B 
    }
    rowIndex = mListView.GetRowIndex(aRowId);                                   //000B : 0F 00 D8 EB 2B 26 19 01 D8 24 EC 25 0B 00 04 1B B2 98 00 00 00 48 65 35 26 16 
    if (aItem != None) {                                                        //0025 : 07 AA 01 77 00 E0 B0 04 1B 2A 16 
      itemLevel = aItem.Type.GetItemLevel();                                    //0030 : 0F 00 F0 43 07 1B 39 3A 19 19 00 E0 B0 04 1B 05 00 04 01 98 2F 22 11 06 00 01 1C 00 E4 2B 11 16 
      mListView.SetText(1,rowIndex,"" $ string(itemLevel));                     //0050 : 19 01 D8 24 EC 25 17 00 00 1B 13 98 00 00 26 00 D8 EB 2B 26 70 1F 00 39 53 00 F0 43 07 1B 16 16 
      mListView.SetSortable(1,rowIndex,itemLevel,False);                        //0070 : 19 01 D8 24 EC 25 12 00 00 1B ED 98 00 00 26 00 D8 EB 2B 26 00 F0 43 07 1B 28 16 
      itemWorth = aItem.Type.GetSellValue() * aItem.StackSize;                  //008B : 0F 00 58 B1 04 1B 90 19 19 00 E0 B0 04 1B 05 00 04 01 98 2F 22 11 06 00 04 1C 28 D7 2B 11 16 19 00 E0 B0 04 1B 05 00 04 01 E8 CB 22 11 16 
      moneyPage = HUD_MoneyPageSmall(mListView.GetRowPage(2,rowIndex));         //00B9 : 0F 00 D0 B1 04 1B 2E F0 7A 30 1D 19 01 D8 24 EC 25 0D 00 04 1B 37 98 00 00 2C 02 00 D8 EB 2B 26 16 
      moneyPage.SetMoney(itemWorth);                                            //00DA : 19 00 D0 B1 04 1B 0B 00 00 1B 4B 97 00 00 00 58 B1 04 1B 16 
      moneyPage.SetComponentsVisible(True);                                     //00EE : 19 00 D0 B1 04 1B 07 00 00 1B 8E 99 00 00 27 16 
      mListView.SetSortable(2,rowIndex,itemWorth,False);                        //00FE : 19 01 D8 24 EC 25 13 00 00 1B ED 98 00 00 2C 02 00 D8 EB 2B 26 00 58 B1 04 1B 28 16 
      mListView.SetSortable(0,rowIndex,0,False);                                //011A : 19 01 D8 24 EC 25 0E 00 00 1B ED 98 00 00 25 00 D8 EB 2B 26 25 28 16 
      itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,rowIndex));//0131 : 0F 00 30 F3 05 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 D8 EB 2B 26 16 
      itemPage.SetComponentTitle(aItem.Type.Name.Text);                         //0151 : 19 00 30 F3 05 1B 22 00 00 1B 42 97 00 00 36 58 C6 6B 0F 19 19 00 E0 B0 04 1B 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 16 
      if (!itemPage.mItemSet) {                                                 //017C : 07 A7 01 81 19 00 30 F3 05 1B 06 00 04 2D 01 80 3B 06 1B 16 
        AddSellRow();                                                           //0190 : 1B A5 99 00 00 16 
        itemPage.mItemSet = True;                                               //0196 : 14 19 00 30 F3 05 1B 06 00 04 2D 01 80 3B 06 1B 27 
      }
    } else {                                                                    //01A7 : 06 05 02 
      moneyPage = HUD_MoneyPageSmall(mListView.GetRowPage(2,rowIndex));         //01AA : 0F 00 D0 B1 04 1B 2E F0 7A 30 1D 19 01 D8 24 EC 25 0D 00 04 1B 37 98 00 00 2C 02 00 D8 EB 2B 26 16 
      itemWorth = -moneyPage.GetMoney();                                        //01CB : 0F 00 58 B1 04 1B 8F 19 00 D0 B1 04 1B 06 00 04 1B 76 0F 00 00 16 16 
      mListView.RemoveRow(rowIndex);                                            //01E2 : 19 01 D8 24 EC 25 0B 00 00 1B 3F 99 00 00 00 D8 EB 2B 26 16 
      mListView.ScrollToLastItem();                                             //01F6 : 19 01 D8 24 EC 25 06 00 00 1B E1 98 00 00 16 
    }
    OnSellItemUpdate(mListView.GetRowCount() - 1,itemWorth);                    //0205 : 43 10 2B 08 1B 94 9B 00 00 93 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 26 16 00 58 B1 04 1B 16 
    Invalidate();                                                               //0226 : 1B 1D 98 00 00 16 
    //07 0B 00 2D 01 88 36 07 1B 04 0B 0F 00 D8 EB 2B 26 19 01 D8 24 EC 25 0B 00 04 1B B2 98 00 00 00 
    //48 65 35 26 16 07 AA 01 77 00 E0 B0 04 1B 2A 16 0F 00 F0 43 07 1B 39 3A 19 19 00 E0 B0 04 1B 05 
    //00 04 01 98 2F 22 11 06 00 01 1C 00 E4 2B 11 16 19 01 D8 24 EC 25 17 00 00 1B 13 98 00 00 26 00 
    //D8 EB 2B 26 70 1F 00 39 53 00 F0 43 07 1B 16 16 19 01 D8 24 EC 25 12 00 00 1B ED 98 00 00 26 00 
    //D8 EB 2B 26 00 F0 43 07 1B 28 16 0F 00 58 B1 04 1B 90 19 19 00 E0 B0 04 1B 05 00 04 01 98 2F 22 
    //11 06 00 04 1C 28 D7 2B 11 16 19 00 E0 B0 04 1B 05 00 04 01 E8 CB 22 11 16 0F 00 D0 B1 04 1B 2E 
    //F0 7A 30 1D 19 01 D8 24 EC 25 0D 00 04 1B 37 98 00 00 2C 02 00 D8 EB 2B 26 16 19 00 D0 B1 04 1B 
    //0B 00 00 1B 4B 97 00 00 00 58 B1 04 1B 16 19 00 D0 B1 04 1B 07 00 00 1B 8E 99 00 00 27 16 19 01 
    //D8 24 EC 25 13 00 00 1B ED 98 00 00 2C 02 00 D8 EB 2B 26 00 58 B1 04 1B 28 16 19 01 D8 24 EC 25 
    //0E 00 00 1B ED 98 00 00 25 00 D8 EB 2B 26 25 28 16 0F 00 30 F3 05 1B 2E 88 48 EC 25 19 01 D8 24 
    //EC 25 0C 00 04 1B 37 98 00 00 25 00 D8 EB 2B 26 16 19 00 30 F3 05 1B 22 00 00 1B 42 97 00 00 36 
    //58 C6 6B 0F 19 19 00 E0 B0 04 1B 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 16 07 A7 01 81 
    //19 00 30 F3 05 1B 06 00 04 2D 01 80 3B 06 1B 16 1B A5 99 00 00 16 14 19 00 30 F3 05 1B 06 00 04 
    //2D 01 80 3B 06 1B 27 06 05 02 0F 00 D0 B1 04 1B 2E F0 7A 30 1D 19 01 D8 24 EC 25 0D 00 04 1B 37 
    //98 00 00 2C 02 00 D8 EB 2B 26 16 0F 00 58 B1 04 1B 8F 19 00 D0 B1 04 1B 06 00 04 1B 76 0F 00 00 
    //16 16 19 01 D8 24 EC 25 0B 00 00 1B 3F 99 00 00 00 D8 EB 2B 26 16 19 01 D8 24 EC 25 06 00 00 1B 
    //E1 98 00 00 16 43 10 2B 08 1B 94 9B 00 00 93 19 01 D8 24 EC 25 06 00 04 1B 43 98 00 00 16 26 16 
    //00 58 B1 04 1B 16 1B 1D 98 00 00 16 04 0B 47 
  }


  function AddSellRow() {
    local array<ListViewItem> newRow;
    local int rowIndex;
    local HUD_Shop_SellItemDescription itemPage;
    local HUD_MoneyPageSmall moneyPage;
    Class'GUI_ListView'.PackRowItem(newRow,"HUD_Shop_SellItemDescription","",0);//0000 : 12 20 08 64 2F 1D 2C 00 00 1B 40 98 00 00 00 50 F1 05 1B 1F 48 55 44 5F 53 68 6F 70 5F 53 65 6C 6C 49 74 65 6D 44 65 73 63 72 69 70 74 69 6F 6E 00 1F 00 25 16 
    Class'GUI_ListView'.PackRowItem(newRow,"","",0);                            //0035 : 12 20 08 64 2F 1D 10 00 00 1B 40 98 00 00 00 50 F1 05 1B 1F 00 1F 00 25 16 
    Class'GUI_ListView'.PackRowItem(newRow,"HUD_MoneyPageSmall","",0);          //004E : 12 20 08 64 2F 1D 22 00 00 1B 40 98 00 00 00 50 F1 05 1B 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 53 6D 61 6C 6C 00 1F 00 25 16 
    rowIndex = mListView.AddRowItems(++mSellCounter,newRow);                    //0079 : 0F 00 C8 F1 05 1B 19 01 D8 24 EC 25 12 00 04 1B 86 98 00 00 A3 01 10 36 07 1B 16 00 50 F1 05 1B 16 
    itemPage = HUD_Shop_SellItemDescription(mListView.GetRowPage(0,rowIndex));  //009A : 0F 00 68 B0 04 1B 2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 C8 F1 05 1B 16 
    itemPage.SetItem(None);                                                     //00BA : 19 00 68 B0 04 1B 07 00 00 1B 4A 97 00 00 2A 16 
    itemPage.__OnSetSelected__Delegate = OnItemContainerClicked;                //00CA : 45 19 00 68 B0 04 1B 05 00 08 01 08 3B 06 1B 44 D3 98 00 00 
    itemPage.__OnItemSet__Delegate = OnItemSetHandler;                          //00DE : 45 19 00 68 B0 04 1B 05 00 08 01 18 3A 06 1B 44 78 98 00 00 
    itemPage.GetItemContainer().SetItemLocation(12,mSellCounter,0);             //00F2 : 19 19 00 68 B0 04 1B 06 00 04 1B 2C 98 00 00 16 0E 00 00 1B 1B 06 00 00 24 0C 01 10 36 07 1B 25 16 
    moneyPage = HUD_MoneyPageSmall(mListView.GetRowPage(2,rowIndex));           //0113 : 0F 00 18 91 2C 26 2E F0 7A 30 1D 19 01 D8 24 EC 25 0D 00 04 1B 37 98 00 00 2C 02 00 C8 F1 05 1B 16 
    moneyPage.SetMoney(0);                                                      //0134 : 19 00 18 91 2C 26 07 00 00 1B 4B 97 00 00 25 16 
    moneyPage.SetBorder(0,4,0,0);                                               //0144 : 19 00 18 91 2C 26 0B 00 00 1B 2B 98 00 00 25 2C 04 25 25 16 
    moneyPage.mHeight = 44.00000000;                                            //0158 : 0F 19 00 18 91 2C 26 05 00 04 01 40 88 31 16 1E 00 00 30 42 
    moneyPage.mComponentStyle = moneyPage.mComponentStyle | 524288;             //016C : 0F 19 00 18 91 2C 26 05 00 04 01 80 DC 9D 19 9E 19 00 18 91 2C 26 05 00 04 01 80 DC 9D 19 1D 00 00 08 00 16 
    moneyPage.SetCheckPurse(False);                                             //0190 : 19 00 18 91 2C 26 07 00 00 1B 41 97 00 00 28 16 
    moneyPage.SetComponentsVisible(False);                                      //01A0 : 19 00 18 91 2C 26 07 00 00 1B 8E 99 00 00 28 16 
    mListView.SetSortable(0,rowIndex,1,False);                                  //01B0 : 19 01 D8 24 EC 25 0E 00 00 1B ED 98 00 00 25 00 C8 F1 05 1B 26 28 16 
    mListView.ScrollToLastItem();                                               //01C7 : 19 01 D8 24 EC 25 06 00 00 1B E1 98 00 00 16 
    Invalidate();                                                               //01D6 : 1B 1D 98 00 00 16 
    //12 20 08 64 2F 1D 2C 00 00 1B 40 98 00 00 00 50 F1 05 1B 1F 48 55 44 5F 53 68 6F 70 5F 53 65 6C 
    //6C 49 74 65 6D 44 65 73 63 72 69 70 74 69 6F 6E 00 1F 00 25 16 12 20 08 64 2F 1D 10 00 00 1B 40 
    //98 00 00 00 50 F1 05 1B 1F 00 1F 00 25 16 12 20 08 64 2F 1D 22 00 00 1B 40 98 00 00 00 50 F1 05 
    //1B 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 53 6D 61 6C 6C 00 1F 00 25 16 0F 00 C8 F1 05 1B 19 
    //01 D8 24 EC 25 12 00 04 1B 86 98 00 00 A3 01 10 36 07 1B 16 00 50 F1 05 1B 16 0F 00 68 B0 04 1B 
    //2E 88 48 EC 25 19 01 D8 24 EC 25 0C 00 04 1B 37 98 00 00 25 00 C8 F1 05 1B 16 19 00 68 B0 04 1B 
    //07 00 00 1B 4A 97 00 00 2A 16 45 19 00 68 B0 04 1B 05 00 08 01 08 3B 06 1B 44 D3 98 00 00 45 19 
    //00 68 B0 04 1B 05 00 08 01 18 3A 06 1B 44 78 98 00 00 19 19 00 68 B0 04 1B 06 00 04 1B 2C 98 00 
    //00 16 0E 00 00 1B 1B 06 00 00 24 0C 01 10 36 07 1B 25 16 0F 00 18 91 2C 26 2E F0 7A 30 1D 19 01 
    //D8 24 EC 25 0D 00 04 1B 37 98 00 00 2C 02 00 C8 F1 05 1B 16 19 00 18 91 2C 26 07 00 00 1B 4B 97 
    //00 00 25 16 19 00 18 91 2C 26 0B 00 00 1B 2B 98 00 00 25 2C 04 25 25 16 0F 19 00 18 91 2C 26 05 
    //00 04 01 40 88 31 16 1E 00 00 30 42 0F 19 00 18 91 2C 26 05 00 04 01 80 DC 9D 19 9E 19 00 18 91 
    //2C 26 05 00 04 01 80 DC 9D 19 1D 00 00 08 00 16 19 00 18 91 2C 26 07 00 00 1B 41 97 00 00 28 16 
    //19 00 18 91 2C 26 07 00 00 1B 8E 99 00 00 28 16 19 01 D8 24 EC 25 0E 00 00 1B ED 98 00 00 25 00 
    //C8 F1 05 1B 26 28 16 19 01 D8 24 EC 25 06 00 00 1B E1 98 00 00 16 1B 1D 98 00 00 16 04 0B 47 
  }


  function ResetState() {
    mResetting = True;                                                          //0000 : 14 2D 01 88 36 07 1B 27 
    mListView.RemoveAllRows();                                                  //0008 : 19 01 D8 24 EC 25 06 00 00 1B 54 98 00 00 16 
    mResetting = False;                                                         //0017 : 14 2D 01 88 36 07 1B 28 
    mSellCounter = -1;                                                          //001F : 0F 01 10 36 07 1B 1D FF FF FF FF 
    AddSellRow();                                                               //002A : 1B A5 99 00 00 16 
    //14 2D 01 88 36 07 1B 27 19 01 D8 24 EC 25 06 00 00 1B 54 98 00 00 16 14 2D 01 88 36 07 1B 28 0F 
    //01 10 36 07 1B 1D FF FF FF FF 1B A5 99 00 00 16 04 0B 47 
  }


  function InitializeSelling() {
    ResetState();                                                               //0000 : 1B 5F 98 00 00 16 
    //1B 5F 98 00 00 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mListView = GUI_ListView(CreatePage("GUI_ListView",0,0,0,0,GetClientWidth(),GetClientHeight() - 32));//0006 : 0F 01 D8 24 EC 25 2E 08 64 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 4C 69 73 74 56 69 65 77 00 25 25 25 25 39 44 1B 17 98 00 00 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 20 16 16 
    mListView.mRowHeight = 44;                                                  //003F : 0F 19 01 D8 24 EC 25 05 00 04 01 D0 B4 A4 19 2C 2C 
    mListView.AddColumn("Item",0,mListView.GetClientWidth() - 47 - 74 - mListView.mHorizMargin * 2 - 21);//0050 : 19 01 D8 24 EC 25 46 00 04 1B 30 98 00 00 1F 49 74 65 6D 00 25 39 44 AF AF AF AF 19 01 D8 24 EC 25 06 00 04 1B 17 98 00 00 16 39 3F 2C 2F 16 39 3F 2C 4A 16 39 3F 90 19 01 D8 24 EC 25 05 00 04 01 38 B6 A4 19 2C 02 16 16 39 3F 2C 15 16 16 
    mListView.AddColumn("Lvl",1,47);                                            //009F : 19 01 D8 24 EC 25 0E 00 04 1B 30 98 00 00 1F 4C 76 6C 00 26 2C 2F 16 
    mListView.AddColumn("Worth",0,74);                                          //00B6 : 19 01 D8 24 EC 25 10 00 04 1B 30 98 00 00 1F 57 6F 72 74 68 00 25 2C 4A 16 
    __OnMBClick__Delegate = MBClickHandler;                                     //00CF : 45 01 B8 E9 9D 19 44 2D 98 00 00 
    //1C 40 5B 9E 19 16 0F 01 D8 24 EC 25 2E 08 64 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 4C 69 73 74 56 
    //69 65 77 00 25 25 25 25 39 44 1B 17 98 00 00 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 20 16 16 0F 
    //19 01 D8 24 EC 25 05 00 04 01 D0 B4 A4 19 2C 2C 19 01 D8 24 EC 25 46 00 04 1B 30 98 00 00 1F 49 
    //74 65 6D 00 25 39 44 AF AF AF AF 19 01 D8 24 EC 25 06 00 04 1B 17 98 00 00 16 39 3F 2C 2F 16 39 
    //3F 2C 4A 16 39 3F 90 19 01 D8 24 EC 25 05 00 04 01 38 B6 A4 19 2C 02 16 16 39 3F 2C 15 16 16 19 
    //01 D8 24 EC 25 0E 00 04 1B 30 98 00 00 1F 4C 76 6C 00 26 2C 2F 16 19 01 D8 24 EC 25 10 00 04 1B 
    //30 98 00 00 1F 57 6F 72 74 68 00 25 2C 4A 16 45 01 B8 E9 9D 19 44 2D 98 00 00 04 0B 47 
  }


  delegate OnSellItemUpdate(int aItemCount,int aWorth);



