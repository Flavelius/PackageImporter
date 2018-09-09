//==============================================================================
//  HUD_SingleLoot
//==============================================================================

class HUD_SingleLoot extends GUI_AttachWindow
    dependsOn(Game_Pawn,HUD_ItemButton,GUI_Page,Game_Looting,GUI_ComboBox,Game_Item,Item_Type,GUI_Label,Loot_Transaction,SBGuiStrings)
    Transient
    Config(User)
  ;

  const IDC_SL_CONFIRM_END_LOOT =  1;
  const ITEM_PAGE_HEIGHT =  50;
  struct LootItemEntry {
      var HUD_ItemButton ItemButton;
      var GUI_Label ItemDescription;
      var GUI_Button NeedButton;
      var GUI_Button GreedButton;
      var GUI_ComboBox PlayerCombo;
      var float Timer;
      var bool Enabled;

  };


  var GUI_Page mMainPage;
  var array<LootItemEntry> mItems;
  var array<int> mTransactionIDs;
  var GUI_Button mConfirmButton;
  var GUI_Button mCancelButton;


  protected final function bool LootButtonItems(array<HUD_ItemButton> aButtons) {
    local array<Game_Item> gameItems;
    local Game_Item tempItem;
    local Game_Pawn gamePawn;
    local int nrButtons;
    local int nrItems;
    local int nrValidItems;
    local int i;
    nrButtons = aButtons.Length;                                                //0000 : 0F 00 10 06 06 1B 37 00 88 13 04 1B 
    if (nrButtons > 0) {                                                        //000C : 07 63 01 97 00 10 06 06 1B 25 16 
      gamePawn = GetPawn();                                                     //0017 : 0F 00 88 06 06 1B 1B 2B 0C 00 00 16 
      if (gamePawn != None && gamePawn.Looting != None) {                       //0023 : 07 60 01 82 77 00 88 06 06 1B 2A 16 18 12 00 77 19 00 88 06 06 1B 05 00 04 01 68 52 18 11 2A 16 16 
        i = 0;                                                                  //0044 : 0F 00 B8 83 2C 26 25 
        while (i < nrButtons) {                                                 //004B : 07 33 01 96 00 B8 83 2C 26 00 10 06 06 1B 16 
          if (aButtons[i] != None && aButtons[i].mOwnerPage != None
            && aButtons[i].IsEnabled()) {//005A : 07 29 01 82 82 77 10 00 B8 83 2C 26 00 88 13 04 1B 2A 16 18 18 00 77 19 10 00 B8 83 2C 26 00 88 13 04 1B 05 00 04 01 08 B0 9D 19 2A 16 16 18 16 00 19 10 00 B8 83 2C 26 00 88 13 04 1B 06 00 04 1C 10 83 9D 19 16 16 
            tempItem = Game_Item(aButtons[i].GetTooltipObject());               //00A1 : 0F 00 90 5C 07 1B 2E 30 E6 5B 01 19 10 00 B8 83 2C 26 00 88 13 04 1B 06 00 04 1B 20 99 00 00 16 
            if (tempItem != None) {                                             //00C1 : 07 26 01 77 00 90 5C 07 1B 2A 16 
              nrItems = gameItems.Length;                                       //00CC : 0F 00 48 59 07 1B 37 00 D0 0C 06 1B 
              gameItems.Length = nrItems + 1;                                   //00D8 : 0F 37 00 D0 0C 06 1B 92 00 48 59 07 1B 26 16 
              gameItems[nrItems] = tempItem;                                    //00E7 : 0F 10 00 48 59 07 1B 00 D0 0C 06 1B 00 90 5C 07 1B 
              ++nrValidItems;                                                   //00F8 : A3 00 20 98 33 26 16 
              EnableItemPage(aButtons[i].mOwnerPage.mIntTag,False);             //00FF : 1B 3E 99 00 00 19 19 10 00 B8 83 2C 26 00 88 13 04 1B 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 28 16 
              goto jl0126;                                                      //0123 : 06 26 01 
            }
            goto jl0129;                                                        //0126 : 06 29 01 
          }
          ++i;                                                                  //0129 : A3 00 B8 83 2C 26 16 
        }
        gamePawn.Looting.cl_SelectItems(gameItems);                             //0133 : 19 19 00 88 06 06 1B 05 00 04 01 68 52 18 11 0B 00 00 1C E8 70 2B 11 00 D0 0C 06 1B 16 
        return nrButtons == nrValidItems;                                       //0150 : 04 9A 00 10 06 06 1B 00 20 98 33 26 16 
        goto jl0160;                                                            //015D : 06 60 01 
      }
      goto jl0163;                                                              //0160 : 06 63 01 
    }
    return False;                                                               //0163 : 04 28 
    //0F 00 10 06 06 1B 37 00 88 13 04 1B 07 63 01 97 00 10 06 06 1B 25 16 0F 00 88 06 06 1B 1B 2B 0C 
    //00 00 16 07 60 01 82 77 00 88 06 06 1B 2A 16 18 12 00 77 19 00 88 06 06 1B 05 00 04 01 68 52 18 
    //11 2A 16 16 0F 00 B8 83 2C 26 25 07 33 01 96 00 B8 83 2C 26 00 10 06 06 1B 16 07 29 01 82 82 77 
    //10 00 B8 83 2C 26 00 88 13 04 1B 2A 16 18 18 00 77 19 10 00 B8 83 2C 26 00 88 13 04 1B 05 00 04 
    //01 08 B0 9D 19 2A 16 16 18 16 00 19 10 00 B8 83 2C 26 00 88 13 04 1B 06 00 04 1C 10 83 9D 19 16 
    //16 0F 00 90 5C 07 1B 2E 30 E6 5B 01 19 10 00 B8 83 2C 26 00 88 13 04 1B 06 00 04 1B 20 99 00 00 
    //16 07 26 01 77 00 90 5C 07 1B 2A 16 0F 00 48 59 07 1B 37 00 D0 0C 06 1B 0F 37 00 D0 0C 06 1B 92 
    //00 48 59 07 1B 26 16 0F 10 00 48 59 07 1B 00 D0 0C 06 1B 00 90 5C 07 1B A3 00 20 98 33 26 16 1B 
    //3E 99 00 00 19 19 10 00 B8 83 2C 26 00 88 13 04 1B 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 
    //16 28 16 06 26 01 06 29 01 A3 00 B8 83 2C 26 16 06 4B 00 19 19 00 88 06 06 1B 05 00 04 01 68 52 
    //18 11 0B 00 00 1C E8 70 2B 11 00 D0 0C 06 1B 16 04 9A 00 10 06 06 1B 00 20 98 33 26 16 06 60 01 
    //06 63 01 04 28 04 0B 47 
  }


  protected function EnableItemPage(int aPageIndex,bool aEnableFlag) {
    if (aPageIndex > -1 && aPageIndex < mItems.Length) {                        //0000 : 07 11 01 82 97 00 10 36 2B 26 1D FF FF FF FF 16 18 0E 00 96 00 10 36 2B 26 37 01 40 58 EC 25 16 16 
      if (mItems[aPageIndex].ItemButton != None) {                              //0021 : 07 57 00 77 36 78 4D 89 19 10 00 10 36 2B 26 01 40 58 EC 25 2A 16 
        mItems[aPageIndex].ItemButton.SetEnabled(aEnableFlag);                  //0037 : 19 36 78 4D 89 19 10 00 10 36 2B 26 01 40 58 EC 25 0C 00 00 1B 5F 32 00 00 2D 00 D8 BD 04 1B 16 
      }
      if (mItems[aPageIndex].NeedButton != None) {                              //0057 : 07 8D 00 77 36 E0 DE 04 1B 10 00 10 36 2B 26 01 40 58 EC 25 2A 16 
        mItems[aPageIndex].NeedButton.SetEnabled(aEnableFlag);                  //006D : 19 36 E0 DE 04 1B 10 00 10 36 2B 26 01 40 58 EC 25 0C 00 00 1B 5F 32 00 00 2D 00 D8 BD 04 1B 16 
      }
      if (mItems[aPageIndex].GreedButton != None) {                             //008D : 07 C3 00 77 36 F0 DD 04 1B 10 00 10 36 2B 26 01 40 58 EC 25 2A 16 
        mItems[aPageIndex].GreedButton.SetEnabled(aEnableFlag);                 //00A3 : 19 36 F0 DD 04 1B 10 00 10 36 2B 26 01 40 58 EC 25 0C 00 00 1B 5F 32 00 00 2D 00 D8 BD 04 1B 16 
      }
      if (mItems[aPageIndex].PlayerCombo != None) {                             //00C3 : 07 F9 00 77 36 98 76 2B 26 10 00 10 36 2B 26 01 40 58 EC 25 2A 16 
        mItems[aPageIndex].PlayerCombo.SetEnabled(aEnableFlag);                 //00D9 : 19 36 98 76 2B 26 10 00 10 36 2B 26 01 40 58 EC 25 0C 00 00 1B 5F 32 00 00 2D 00 D8 BD 04 1B 16 
      }
      mItems[aPageIndex].Enabled = aEnableFlag;                                 //00F9 : 14 2D 36 C8 3E 06 1B 10 00 10 36 2B 26 01 40 58 EC 25 2D 00 D8 BD 04 1B 
    }
    //07 11 01 82 97 00 10 36 2B 26 1D FF FF FF FF 16 18 0E 00 96 00 10 36 2B 26 37 01 40 58 EC 25 16 
    //16 07 57 00 77 36 78 4D 89 19 10 00 10 36 2B 26 01 40 58 EC 25 2A 16 19 36 78 4D 89 19 10 00 10 
    //36 2B 26 01 40 58 EC 25 0C 00 00 1B 5F 32 00 00 2D 00 D8 BD 04 1B 16 07 8D 00 77 36 E0 DE 04 1B 
    //10 00 10 36 2B 26 01 40 58 EC 25 2A 16 19 36 E0 DE 04 1B 10 00 10 36 2B 26 01 40 58 EC 25 0C 00 
    //00 1B 5F 32 00 00 2D 00 D8 BD 04 1B 16 07 C3 00 77 36 F0 DD 04 1B 10 00 10 36 2B 26 01 40 58 EC 
    //25 2A 16 19 36 F0 DD 04 1B 10 00 10 36 2B 26 01 40 58 EC 25 0C 00 00 1B 5F 32 00 00 2D 00 D8 BD 
    //04 1B 16 07 F9 00 77 36 98 76 2B 26 10 00 10 36 2B 26 01 40 58 EC 25 2A 16 19 36 98 76 2B 26 10 
    //00 10 36 2B 26 01 40 58 EC 25 0C 00 00 1B 5F 32 00 00 2D 00 D8 BD 04 1B 16 14 2D 36 C8 3E 06 1B 
    //10 00 10 36 2B 26 01 40 58 EC 25 2D 00 D8 BD 04 1B 04 0B 47 
  }


  function bool MBClickHandler(GUI_MessageBox aMessageBox,int aBoxTag,int aButtonTag) {
    switch (aBoxTag) {                                                          //0000 : 05 04 00 A0 02 33 26 
      case 1 :                                                                  //0007 : 0A 43 00 26 
        switch (aButtonTag) {                                                   //000B : 05 04 00 28 02 33 26 
          case Class'GUI_BaseDesktop'.4 :                                       //0012 : 0A 29 00 12 20 00 68 D7 00 02 00 04 2C 04 
            EndLooting();                                                       //0020 : 1B 34 99 00 00 16 
            break;                                                              //0026 : 06 40 00 
          case Class'GUI_BaseDesktop'.8 :                                       //0029 : 0A 3A 00 12 20 00 68 D7 00 02 00 04 2C 08 
            break;                                                              //0037 : 06 40 00 
          default:                                                              //003A : 0A FF FF 
            break;                                                              //003D : 06 40 00 
        }
        break;                                                                  //0040 : 06 49 00 
      default:                                                                  //0043 : 0A FF FF 
        break;                                                                  //0046 : 06 49 00 
        return True;                                                            //0049 : 04 27 
      }
    }
    //05 04 00 A0 02 33 26 0A 43 00 26 05 04 00 28 02 33 26 0A 29 00 12 20 00 68 D7 00 02 00 04 2C 04 
    //1B 34 99 00 00 16 06 40 00 0A 3A 00 12 20 00 68 D7 00 02 00 04 2C 08 06 40 00 0A FF FF 06 40 00 
    //06 49 00 0A FF FF 06 49 00 04 27 04 0B 47 
  }


  protected final function Game_Item GetItemPageItem(int aItemIndex) {
    if (aItemIndex > -1 && aItemIndex < mItems.Length) {                        //0000 : 07 57 00 82 97 00 70 0E 06 1B 1D FF FF FF FF 16 18 0E 00 96 00 70 0E 06 1B 37 01 40 58 EC 25 16 16 
      if (mItems[aItemIndex].ItemButton != None) {                              //0021 : 07 57 00 77 36 78 4D 89 19 10 00 70 0E 06 1B 01 40 58 EC 25 2A 16 
        return Game_Item(mItems[aItemIndex].ItemButton.GetTooltipObject());     //0037 : 04 2E 30 E6 5B 01 19 36 78 4D 89 19 10 00 70 0E 06 1B 01 40 58 EC 25 06 00 04 1B 20 99 00 00 16 
      }
    }
    return None;                                                                //0057 : 04 2A 
    //07 57 00 82 97 00 70 0E 06 1B 1D FF FF FF FF 16 18 0E 00 96 00 70 0E 06 1B 37 01 40 58 EC 25 16 
    //16 07 57 00 77 36 78 4D 89 19 10 00 70 0E 06 1B 01 40 58 EC 25 2A 16 04 2E 30 E6 5B 01 19 36 78 
    //4D 89 19 10 00 70 0E 06 1B 01 40 58 EC 25 06 00 04 1B 20 99 00 00 16 04 2A 04 0B 47 
  }


  protected final function int GetButtonItemPage(GUI_Button aButton) {
    local int Index;
    if (aButton != None && aButton.mOwnerPage != None) {                        //0000 : 07 B7 00 82 77 00 30 1E 04 1B 2A 16 18 12 00 77 19 00 30 1E 04 1B 05 00 04 01 08 B0 9D 19 2A 16 16 
      Index = aButton.mOwnerPage.mIntTag;                                       //0021 : 0F 00 58 06 2D 26 19 19 00 30 1E 04 1B 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 
      if (Index > -1 && Index < mItems.Length) {                                //003E : 07 B7 00 82 97 00 58 06 2D 26 1D FF FF FF FF 16 18 0E 00 96 00 58 06 2D 26 37 01 40 58 EC 25 16 16 
        if (aButton == mItems[Index].NeedButton
          || aButton == mItems[Index].GreedButton
          || aButton == mItems[Index].ItemButton) {//005F : 07 B7 00 84 84 72 00 30 1E 04 1B 36 E0 DE 04 1B 10 00 58 06 2D 26 01 40 58 EC 25 16 18 18 00 72 00 30 1E 04 1B 36 F0 DD 04 1B 10 00 58 06 2D 26 01 40 58 EC 25 16 16 18 18 00 72 00 30 1E 04 1B 36 78 4D 89 19 10 00 58 06 2D 26 01 40 58 EC 25 16 16 
          return Index;                                                         //00B1 : 04 00 58 06 2D 26 
        }
      }
    }
    return -1;                                                                  //00B7 : 04 1D FF FF FF FF 
    //07 B7 00 82 77 00 30 1E 04 1B 2A 16 18 12 00 77 19 00 30 1E 04 1B 05 00 04 01 08 B0 9D 19 2A 16 
    //16 0F 00 58 06 2D 26 19 19 00 30 1E 04 1B 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 07 B7 
    //00 82 97 00 58 06 2D 26 1D FF FF FF FF 16 18 0E 00 96 00 58 06 2D 26 37 01 40 58 EC 25 16 16 07 
    //B7 00 84 84 72 00 30 1E 04 1B 36 E0 DE 04 1B 10 00 58 06 2D 26 01 40 58 EC 25 16 18 18 00 72 00 
    //30 1E 04 1B 36 F0 DD 04 1B 10 00 58 06 2D 26 01 40 58 EC 25 16 16 18 18 00 72 00 30 1E 04 1B 36 
    //78 4D 89 19 10 00 58 06 2D 26 01 40 58 EC 25 16 16 04 00 58 06 2D 26 04 1D FF FF FF FF 04 0B 47 
    //
  }


  function bool ItemClickHandler(GUI_Component clickedButton) {
    local HUD_ItemButton tempButton;
    local array<HUD_ItemButton> itemButtons;
    tempButton = HUD_ItemButton(clickedButton);                                 //0000 : 0F 00 60 0F 06 1B 2E 20 6C EB 25 00 90 03 33 26 
    if (tempButton != None && tempButton.mOwnerPage != None) {                  //0010 : 07 59 00 82 77 00 60 0F 06 1B 2A 16 18 12 00 77 19 00 60 0F 06 1B 05 00 04 01 08 B0 9D 19 2A 16 16 
      itemButtons.Length = 1;                                                   //0031 : 0F 37 00 68 62 07 1B 26 
      itemButtons[0] = tempButton;                                              //0039 : 0F 10 25 00 68 62 07 1B 00 60 0F 06 1B 
      if (!LootButtonItems(itemButtons)) {                                      //0046 : 07 56 00 81 1C 08 83 2C 26 00 68 62 07 1B 16 16 
      }
      goto jl0059;                                                              //0056 : 06 59 00 
    }
    return True;                                                                //0059 : 04 27 
    //0F 00 60 0F 06 1B 2E 20 6C EB 25 00 90 03 33 26 07 59 00 82 77 00 60 0F 06 1B 2A 16 18 12 00 77 
    //19 00 60 0F 06 1B 05 00 04 01 08 B0 9D 19 2A 16 16 0F 37 00 68 62 07 1B 26 0F 10 25 00 68 62 07 
    //1B 00 60 0F 06 1B 07 56 00 81 1C 08 83 2C 26 00 68 62 07 1B 16 16 06 59 00 04 27 04 0B 47 
  }


  function CreateItemPage(int anIndex,Game_Item aGameItem) {
    local GUI_Page itemPage;
    local HUD_ItemButton itemIcon;
    local GUI_Label ItemDescription;
    local GUI_Label itemTypeLabel;
    local int tempX;
    local int tempY;
    itemPage = mMainPage.CreatePage("GUI_Page",0,0,0,50 * anIndex,mMainPage.mWidth - 22,50);//0000 : 0F 00 00 E9 8A 19 19 01 B0 AE 2C 26 34 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 90 2C 32 00 F8 5D 8A 19 16 39 44 AF 19 01 B0 AE 2C 26 05 00 04 01 60 87 31 16 39 3F 2C 16 16 2C 32 16 
    itemPage.mIntTag = anIndex;                                                 //0043 : 0F 19 00 00 E9 8A 19 05 00 04 01 58 90 31 16 00 F8 5D 8A 19 
    tempY = (50 - 40) * 0.50000000 + 0.50000000;                                //0057 : 0F 00 D8 96 89 19 39 44 AE 39 3F 39 44 AB 39 3F 93 2C 32 2C 28 16 1E 00 00 00 3F 16 1E 00 00 00 3F 16 
    itemIcon = HUD_ItemButton(itemPage.CreateButton("HUD_ItemButton",0,0,3,tempY,40,40));//0079 : 0F 00 80 30 2B 26 2E 20 6C EB 25 19 00 00 E9 8A 19 23 00 04 1B 18 98 00 00 1F 48 55 44 5F 49 74 65 6D 42 75 74 74 6F 6E 00 25 25 2C 03 00 D8 96 89 19 2C 28 2C 28 16 
    itemIcon.SetItemProperties(aGameItem.Type,aGameItem.StackSize);             //00B0 : 19 00 80 30 2B 26 22 00 00 1B A8 99 00 00 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 19 00 F0 E9 8A 19 05 00 04 01 E8 CB 22 11 16 
    itemIcon.SetBackground("dropbox","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");//00DB : 19 00 80 30 2B 26 3B 00 00 1B 1A 98 00 00 1F 64 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
    itemIcon.SetIconMaterial(aGameItem.GetLogo(GetPawn()),4.00000000,4.00000000);//011F : 19 00 80 30 2B 26 25 00 00 1B 34 98 00 00 19 00 F0 E9 8A 19 0C 00 04 1B 71 0C 00 00 1B 2B 0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 16 
    itemIcon.__OnClick__Delegate = ItemClickHandler;                            //014D : 45 19 00 80 30 2B 26 05 00 08 01 98 EB 9D 19 44 D8 99 00 00 
    itemIcon.SetTooltipObject(aGameItem,aGameItem.Type.GetTooltipType());       //0161 : 19 00 80 30 2B 26 23 00 00 1B 52 97 00 00 00 F0 E9 8A 19 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 06 00 00 1C 38 29 2E 11 16 16 
    itemIcon.mLabelStyle = itemIcon.mLabelStyle | 4096;                         //018D : 0F 19 00 80 30 2B 26 05 00 04 01 08 DA A1 19 9E 19 00 80 30 2B 26 05 00 04 01 08 DA A1 19 1D 00 10 00 00 16 
    tempX = itemIcon.mLeft + itemIcon.mWidth + 2;                               //01B1 : 0F 00 50 BE 04 1B 39 44 AE AE 19 00 80 30 2B 26 05 00 04 01 08 86 31 16 19 00 80 30 2B 26 05 00 04 01 60 87 31 16 16 39 3F 2C 02 16 
    tempY = itemIcon.mTop;                                                      //01DD : 0F 00 D8 96 89 19 39 44 19 00 80 30 2B 26 05 00 04 01 80 86 31 16 
    ItemDescription = itemPage.CreateLabel("GUI_Label",524288,0,tempX,tempY,itemPage.mWidth - 3 - tempX,itemPage.mHeight);//01F3 : 0F 00 78 11 06 1B 19 00 00 E9 8A 19 50 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 00 50 BE 04 1B 00 D8 96 89 19 39 44 AF AF 19 00 00 E9 8A 19 05 00 04 01 60 87 31 16 39 3F 2C 03 16 39 3F 00 50 BE 04 1B 16 39 44 19 00 00 E9 8A 19 05 00 04 01 40 88 31 16 16 
    if (Len(aGameItem.Type.Name.Text) > 28) {                                   //0252 : 07 B0 02 97 7D 36 58 C6 6B 0F 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 16 2C 1C 16 
      ItemDescription.SetText(Left(aGameItem.Type.Name.Text,28)
        $ "...");//0277 : 19 00 78 11 06 1B 2D 00 00 1B 13 98 00 00 70 80 36 58 C6 6B 0F 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 2C 1C 16 1F 2E 2E 2E 00 16 16 
    } else {                                                                    //02AD : 06 DB 02 
      ItemDescription.SetText(aGameItem.Type.Name.Text);                        //02B0 : 19 00 78 11 06 1B 22 00 00 1B 13 98 00 00 36 58 C6 6B 0F 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 16 
    }
    tempY = tempY + 22;                                                         //02DB : 0F 00 D8 96 89 19 92 00 D8 96 89 19 2C 16 16 
    itemTypeLabel = itemPage.CreateLabel("GUI_Label",524288,0,tempX,tempY,itemPage.mWidth - 3 - tempX,itemPage.mHeight);//02EA : 0F 00 00 11 06 1B 19 00 00 E9 8A 19 50 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 00 50 BE 04 1B 00 D8 96 89 19 39 44 AF AF 19 00 00 E9 8A 19 05 00 04 01 60 87 31 16 39 3F 2C 03 16 39 3F 00 50 BE 04 1B 16 39 44 19 00 00 E9 8A 19 05 00 04 01 40 88 31 16 16 
    itemTypeLabel.SetFont("SBFontsTX.Verdana10");                               //0349 : 19 00 00 11 06 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    itemTypeLabel.SetColor(151,147,164);                                        //036D : 19 00 00 11 06 1B 0C 00 00 1B 19 98 00 00 2C 97 2C 93 2C A4 16 
    itemTypeLabel.SetText(aGameItem.Type.GetTypeName());                        //0382 : 19 00 00 11 06 1B 1E 00 00 1B 13 98 00 00 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 16 
    mItems[anIndex].ItemButton = itemIcon;                                      //03A9 : 0F 36 78 4D 89 19 10 00 F8 5D 8A 19 01 40 58 EC 25 00 80 30 2B 26 
    mItems[anIndex].ItemDescription = ItemDescription;                          //03BF : 0F 36 88 9B 07 1B 10 00 F8 5D 8A 19 01 40 58 EC 25 00 78 11 06 1B 
    mItems[anIndex].NeedButton = None;                                          //03D5 : 0F 36 E0 DE 04 1B 10 00 F8 5D 8A 19 01 40 58 EC 25 2A 
    mItems[anIndex].GreedButton = None;                                         //03E7 : 0F 36 F0 DD 04 1B 10 00 F8 5D 8A 19 01 40 58 EC 25 2A 
    mItems[anIndex].PlayerCombo = None;                                         //03F9 : 0F 36 98 76 2B 26 10 00 F8 5D 8A 19 01 40 58 EC 25 2A 
    mItems[anIndex].Enabled = True;                                             //040B : 14 2D 36 C8 3E 06 1B 10 00 F8 5D 8A 19 01 40 58 EC 25 27 
    //0F 00 00 E9 8A 19 19 01 B0 AE 2C 26 34 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 
    //25 90 2C 32 00 F8 5D 8A 19 16 39 44 AF 19 01 B0 AE 2C 26 05 00 04 01 60 87 31 16 39 3F 2C 16 16 
    //2C 32 16 0F 19 00 00 E9 8A 19 05 00 04 01 58 90 31 16 00 F8 5D 8A 19 0F 00 D8 96 89 19 39 44 AE 
    //39 3F 39 44 AB 39 3F 93 2C 32 2C 28 16 1E 00 00 00 3F 16 1E 00 00 00 3F 16 0F 00 80 30 2B 26 2E 
    //20 6C EB 25 19 00 00 E9 8A 19 23 00 04 1B 18 98 00 00 1F 48 55 44 5F 49 74 65 6D 42 75 74 74 6F 
    //6E 00 25 25 2C 03 00 D8 96 89 19 2C 28 2C 28 16 19 00 80 30 2B 26 22 00 00 1B A8 99 00 00 19 00 
    //F0 E9 8A 19 05 00 04 01 98 2F 22 11 19 00 F0 E9 8A 19 05 00 04 01 E8 CB 22 11 16 19 00 80 30 2B 
    //26 3B 00 00 1B 1A 98 00 00 1F 64 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 
    //5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 19 
    //00 80 30 2B 26 25 00 00 1B 34 98 00 00 19 00 F0 E9 8A 19 0C 00 04 1B 71 0C 00 00 1B 2B 0C 00 00 
    //16 16 1E 00 00 80 40 1E 00 00 80 40 16 45 19 00 80 30 2B 26 05 00 08 01 98 EB 9D 19 44 D8 99 00 
    //00 19 00 80 30 2B 26 23 00 00 1B 52 97 00 00 00 F0 E9 8A 19 19 19 00 F0 E9 8A 19 05 00 04 01 98 
    //2F 22 11 06 00 00 1C 38 29 2E 11 16 16 0F 19 00 80 30 2B 26 05 00 04 01 08 DA A1 19 9E 19 00 80 
    //30 2B 26 05 00 04 01 08 DA A1 19 1D 00 10 00 00 16 0F 00 50 BE 04 1B 39 44 AE AE 19 00 80 30 2B 
    //26 05 00 04 01 08 86 31 16 19 00 80 30 2B 26 05 00 04 01 60 87 31 16 16 39 3F 2C 02 16 0F 00 D8 
    //96 89 19 39 44 19 00 80 30 2B 26 05 00 04 01 80 86 31 16 0F 00 78 11 06 1B 19 00 00 E9 8A 19 50 
    //00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 00 50 BE 04 1B 00 D8 96 
    //89 19 39 44 AF AF 19 00 00 E9 8A 19 05 00 04 01 60 87 31 16 39 3F 2C 03 16 39 3F 00 50 BE 04 1B 
    //16 39 44 19 00 00 E9 8A 19 05 00 04 01 40 88 31 16 16 07 B0 02 97 7D 36 58 C6 6B 0F 19 19 00 F0 
    //E9 8A 19 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 16 2C 1C 16 19 00 78 11 06 1B 2D 00 00 
    //1B 13 98 00 00 70 80 36 58 C6 6B 0F 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 05 00 0C 01 88 
    //9E 1A 11 2C 1C 16 1F 2E 2E 2E 00 16 16 06 DB 02 19 00 78 11 06 1B 22 00 00 1B 13 98 00 00 36 58 
    //C6 6B 0F 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 05 00 0C 01 88 9E 1A 11 16 0F 00 D8 96 89 
    //19 92 00 D8 96 89 19 2C 16 16 0F 00 00 11 06 1B 19 00 00 E9 8A 19 50 00 04 1B 20 98 00 00 1F 47 
    //55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 00 50 BE 04 1B 00 D8 96 89 19 39 44 AF AF 19 00 00 
    //E9 8A 19 05 00 04 01 60 87 31 16 39 3F 2C 03 16 39 3F 00 50 BE 04 1B 16 39 44 19 00 00 E9 8A 19 
    //05 00 04 01 40 88 31 16 16 19 00 00 11 06 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 
    //58 2E 56 65 72 64 61 6E 61 31 30 00 16 19 00 00 11 06 1B 0C 00 00 1B 19 98 00 00 2C 97 2C 93 2C 
    //A4 16 19 00 00 11 06 1B 1E 00 00 1B 13 98 00 00 19 19 00 F0 E9 8A 19 05 00 04 01 98 2F 22 11 06 
    //00 00 1B 0D 1A 00 00 16 16 0F 36 78 4D 89 19 10 00 F8 5D 8A 19 01 40 58 EC 25 00 80 30 2B 26 0F 
    //36 88 9B 07 1B 10 00 F8 5D 8A 19 01 40 58 EC 25 00 78 11 06 1B 0F 36 E0 DE 04 1B 10 00 F8 5D 8A 
    //19 01 40 58 EC 25 2A 0F 36 F0 DD 04 1B 10 00 F8 5D 8A 19 01 40 58 EC 25 2A 0F 36 98 76 2B 26 10 
    //00 F8 5D 8A 19 01 40 58 EC 25 2A 14 2D 36 C8 3E 06 1B 10 00 F8 5D 8A 19 01 40 58 EC 25 27 04 0B 
    //47 
  }


  function RemoveAllItemPages() {
    local int idx;
    idx = mItems.Length - 1;                                                    //0000 : 0F 00 C8 13 06 1B 93 37 01 40 58 EC 25 26 16 
    while (idx > -1) {                                                          //000F : 07 33 00 97 00 C8 13 06 1B 1D FF FF FF FF 16 
      RemoveItemPage(idx);                                                      //001E : 1B D1 99 00 00 00 C8 13 06 1B 16 
      --idx;                                                                    //0029 : A4 00 C8 13 06 1B 16 
    }
    //0F 00 C8 13 06 1B 93 37 01 40 58 EC 25 26 16 07 33 00 97 00 C8 13 06 1B 1D FF FF FF FF 16 1B D1 
    //99 00 00 00 C8 13 06 1B 16 A4 00 C8 13 06 1B 16 06 0F 00 04 0B 47 
  }


  function LootAllItems() {
    local array<HUD_ItemButton> buttons;
    local int nrButtons;
    local int i;
    local int j;
    nrButtons = mItems.Length;                                                  //0000 : 0F 00 08 17 06 1B 37 01 40 58 EC 25 
    if (nrButtons > 0) {                                                        //000C : 07 95 00 97 00 08 17 06 1B 25 16 
      j = 0;                                                                    //0017 : 0F 00 E8 DC 33 26 25 
      buttons.Length = nrButtons;                                               //001E : 0F 37 00 E0 69 07 1B 00 08 17 06 1B 
      i = nrButtons - 1;                                                        //002A : 0F 00 A0 C0 04 1B 93 00 08 17 06 1B 26 16 
      while (i > -1) {                                                          //0038 : 07 85 00 97 00 A0 C0 04 1B 1D FF FF FF FF 16 
        if (mItems[i].ItemButton != None) {                                     //0047 : 07 7B 00 77 36 78 4D 89 19 10 00 A0 C0 04 1B 01 40 58 EC 25 2A 16 
          buttons[++j] = mItems[i].ItemButton;                                  //005D : 0F 10 A3 00 E8 DC 33 26 16 00 E0 69 07 1B 36 78 4D 89 19 10 00 A0 C0 04 1B 01 40 58 EC 25 
        }
        --i;                                                                    //007B : A4 00 A0 C0 04 1B 16 
      }
      if (!LootButtonItems(buttons)) {                                          //0085 : 07 95 00 81 1C 08 83 2C 26 00 E0 69 07 1B 16 16 
      }
    }
    //0F 00 08 17 06 1B 37 01 40 58 EC 25 07 95 00 97 00 08 17 06 1B 25 16 0F 00 E8 DC 33 26 25 0F 37 
    //00 E0 69 07 1B 00 08 17 06 1B 0F 00 A0 C0 04 1B 93 00 08 17 06 1B 26 16 07 85 00 97 00 A0 C0 04 
    //1B 1D FF FF FF FF 16 07 7B 00 77 36 78 4D 89 19 10 00 A0 C0 04 1B 01 40 58 EC 25 2A 16 0F 10 A3 
    //00 E8 DC 33 26 16 00 E0 69 07 1B 36 78 4D 89 19 10 00 A0 C0 04 1B 01 40 58 EC 25 A4 00 A0 C0 04 
    //1B 16 06 38 00 07 95 00 81 1C 08 83 2C 26 00 E0 69 07 1B 16 16 04 0B 47 
  }


  function RemoveItemPage(int anIndex) {
    local GUI_Page page;
    local int idx;
    if (anIndex > -1 && anIndex < mItems.Length
      && mItems[anIndex].ItemButton != None) {//0000 : 07 E4 00 82 82 97 00 80 45 04 1B 1D FF FF FF FF 16 18 0E 00 96 00 80 45 04 1B 37 01 40 58 EC 25 16 16 18 14 00 77 36 78 4D 89 19 10 00 80 45 04 1B 01 40 58 EC 25 2A 16 16 
      page = mItems[anIndex].ItemButton.mOwnerPage;                             //0039 : 0F 00 90 C1 04 1B 19 36 78 4D 89 19 10 00 80 45 04 1B 01 40 58 EC 25 05 00 04 01 08 B0 9D 19 
      mMainPage.DestroyComponent(page);                                         //0058 : 19 01 B0 AE 2C 26 0B 00 00 1B 4D 98 00 00 00 90 C1 04 1B 16 
      mItems.Remove(anIndex,1);                                                 //006C : 41 01 40 58 EC 25 00 80 45 04 1B 26 
      idx = anIndex;                                                            //0078 : 0F 00 18 C1 04 1B 00 80 45 04 1B 
      while (idx < mItems.Length) {                                             //0083 : 07 E4 00 96 00 18 C1 04 1B 37 01 40 58 EC 25 16 
        page = mItems[idx].ItemButton.mOwnerPage;                               //0093 : 0F 00 90 C1 04 1B 19 36 78 4D 89 19 10 00 18 C1 04 1B 01 40 58 EC 25 05 00 04 01 08 B0 9D 19 
        if (page != None) {                                                     //00B2 : 07 DA 00 77 00 90 C1 04 1B 2A 16 
          page.mTop = 50.00000000 * idx;                                        //00BD : 0F 19 00 90 C1 04 1B 05 00 04 01 80 86 31 16 AB 1E 00 00 48 42 39 3F 00 18 C1 04 1B 16 
        }
        ++idx;                                                                  //00DA : A3 00 18 C1 04 1B 16 
      }
    }
    mMainPage.Invalidate();                                                     //00E4 : 19 01 B0 AE 2C 26 06 00 00 1B 1D 98 00 00 16 
    //07 E4 00 82 82 97 00 80 45 04 1B 1D FF FF FF FF 16 18 0E 00 96 00 80 45 04 1B 37 01 40 58 EC 25 
    //16 16 18 14 00 77 36 78 4D 89 19 10 00 80 45 04 1B 01 40 58 EC 25 2A 16 16 0F 00 90 C1 04 1B 19 
    //36 78 4D 89 19 10 00 80 45 04 1B 01 40 58 EC 25 05 00 04 01 08 B0 9D 19 19 01 B0 AE 2C 26 0B 00 
    //00 1B 4D 98 00 00 00 90 C1 04 1B 16 41 01 40 58 EC 25 00 80 45 04 1B 26 0F 00 18 C1 04 1B 00 80 
    //45 04 1B 07 E4 00 96 00 18 C1 04 1B 37 01 40 58 EC 25 16 0F 00 90 C1 04 1B 19 36 78 4D 89 19 10 
    //00 18 C1 04 1B 01 40 58 EC 25 05 00 04 01 08 B0 9D 19 07 DA 00 77 00 90 C1 04 1B 2A 16 0F 19 00 
    //90 C1 04 1B 05 00 04 01 80 86 31 16 AB 1E 00 00 48 42 39 3F 00 18 C1 04 1B 16 A3 00 18 C1 04 1B 
    //16 06 83 00 19 01 B0 AE 2C 26 06 00 00 1B 1D 98 00 00 16 04 0B 47 
  }


  function int AddItemPage(Game_Item aGameItem,float aTimerValue) {
    local int newIndex;
    newIndex = mItems.Length;                                                   //0000 : 0F 00 A8 C3 04 1B 37 01 40 58 EC 25 
    mItems.Length = newIndex + 1;                                               //000C : 0F 37 01 40 58 EC 25 92 00 A8 C3 04 1B 26 16 
    mItems[newIndex].Timer = aTimerValue;                                       //001B : 0F 36 88 6F 04 1B 10 00 A8 C3 04 1B 01 40 58 EC 25 00 00 0B 33 26 
    CreateItemPage(newIndex,aGameItem);                                         //0031 : 1B D7 99 00 00 00 A8 C3 04 1B 00 78 0B 33 26 16 
    return newIndex;                                                            //0041 : 04 00 A8 C3 04 1B 
    //0F 00 A8 C3 04 1B 37 01 40 58 EC 25 0F 37 01 40 58 EC 25 92 00 A8 C3 04 1B 26 16 0F 36 88 6F 04 
    //1B 10 00 A8 C3 04 1B 01 40 58 EC 25 00 00 0B 33 26 1B D7 99 00 00 00 A8 C3 04 1B 00 78 0B 33 26 
    //16 04 00 A8 C3 04 1B 04 0B 47 
  }


  function InitChoiceItems() {
    local int i;
    local int j;
    local int Index;
    local Game_Pawn gamePawn;
    local export editinline Game_Looting gameLooting;
    local ClientLootInfo lootInfo;
    RemoveAllItemPages();                                                       //0000 : 1B 3D 99 00 00 16 
    mTransactionIDs.Length = 0;                                                 //0006 : 0F 37 01 30 5F 2B 26 25 
    gamePawn = GetPawn();                                                       //000E : 0F 00 D0 22 06 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Looting != None) {                         //001A : 07 23 01 82 77 00 D0 22 06 1B 2A 16 18 12 00 77 19 00 D0 22 06 1B 05 00 04 01 68 52 18 11 2A 16 16 
      gameLooting = gamePawn.Looting;                                           //003B : 0F 00 20 82 07 1B 19 00 D0 22 06 1B 05 00 04 01 68 52 18 11 
      i = 0;                                                                    //004F : 0F 00 38 24 06 1B 25 
      while (i < gameLooting.ClientLoot.Length) {                               //0056 : 07 23 01 96 00 38 24 06 1B 37 19 00 20 82 07 1B 05 00 00 01 C0 7D 2B 11 16 
        lootInfo = gameLooting.ClientLoot[i];                                   //006F : 0F 00 C8 ED 2C 26 10 00 38 24 06 1B 19 00 20 82 07 1B 05 00 00 01 C0 7D 2B 11 
        if (IsValidLootItem(lootInfo)) {                                        //0089 : 07 19 01 1B E4 98 00 00 00 C8 ED 2C 26 16 
          AddTransactionID(lootInfo.TransactionID);                             //0097 : 1B CE 99 00 00 36 C0 99 2B 11 00 C8 ED 2C 26 16 
          j = 0;                                                                //00A7 : 0F 00 48 CF 04 1B 25 
          while (j < lootInfo.Items.Length) {                                   //00AE : 07 19 01 96 00 48 CF 04 1B 37 36 28 9B 2B 11 00 C8 ED 2C 26 16 
            Index = AddItemPage(lootInfo.Items[j].GameItem,lootInfo.Timer);     //00C3 : 0F 00 50 FF 33 26 1B 53 9A 00 00 36 08 9D 2B 11 10 00 48 CF 04 1B 36 28 9B 2B 11 00 C8 ED 2C 26 36 48 7D 2B 11 00 C8 ED 2C 26 16 
            OnItemChosen(Index,lootInfo.Items[j].Chosen);                       //00EE : 1B E7 98 00 00 00 50 FF 33 26 2D 36 80 9D 2B 11 10 00 48 CF 04 1B 36 28 9B 2B 11 00 C8 ED 2C 26 16 
            ++j;                                                                //010F : A3 00 48 CF 04 1B 16 
          }
        }
        ++i;                                                                    //0119 : A3 00 38 24 06 1B 16 
      }
    }
    mMainPage.Invalidate();                                                     //0123 : 19 01 B0 AE 2C 26 06 00 00 1B 1D 98 00 00 16 
    //1B 3D 99 00 00 16 0F 37 01 30 5F 2B 26 25 0F 00 D0 22 06 1B 1B 2B 0C 00 00 16 07 23 01 82 77 00 
    //D0 22 06 1B 2A 16 18 12 00 77 19 00 D0 22 06 1B 05 00 04 01 68 52 18 11 2A 16 16 0F 00 20 82 07 
    //1B 19 00 D0 22 06 1B 05 00 04 01 68 52 18 11 0F 00 38 24 06 1B 25 07 23 01 96 00 38 24 06 1B 37 
    //19 00 20 82 07 1B 05 00 00 01 C0 7D 2B 11 16 0F 00 C8 ED 2C 26 10 00 38 24 06 1B 19 00 20 82 07 
    //1B 05 00 00 01 C0 7D 2B 11 07 19 01 1B E4 98 00 00 00 C8 ED 2C 26 16 1B CE 99 00 00 36 C0 99 2B 
    //11 00 C8 ED 2C 26 16 0F 00 48 CF 04 1B 25 07 19 01 96 00 48 CF 04 1B 37 36 28 9B 2B 11 00 C8 ED 
    //2C 26 16 0F 00 50 FF 33 26 1B 53 9A 00 00 36 08 9D 2B 11 10 00 48 CF 04 1B 36 28 9B 2B 11 00 C8 
    //ED 2C 26 36 48 7D 2B 11 00 C8 ED 2C 26 16 1B E7 98 00 00 00 50 FF 33 26 2D 36 80 9D 2B 11 10 00 
    //48 CF 04 1B 36 28 9B 2B 11 00 C8 ED 2C 26 16 A3 00 48 CF 04 1B 16 06 AE 00 A3 00 38 24 06 1B 16 
    //06 56 00 19 01 B0 AE 2C 26 06 00 00 1B 1D 98 00 00 16 04 0B 47 
  }


  function AddTransactionID(int aNewTransactionID) {
    local int i;
    local int nrIDs;
    nrIDs = mTransactionIDs.Length;                                             //0000 : 0F 00 50 26 06 1B 37 01 30 5F 2B 26 
    i = 0;                                                                      //000C : 0F 00 C8 26 06 1B 25 
    while (i < nrIDs) {                                                         //0013 : 07 43 00 96 00 C8 26 06 1B 00 50 26 06 1B 16 
      if (mTransactionIDs[i] == aNewTransactionID) {                            //0022 : 07 39 00 9A 10 00 C8 26 06 1B 01 30 5F 2B 26 00 D8 FE 33 26 16 
        return;                                                                 //0037 : 04 0B 
      }
      ++i;                                                                      //0039 : A3 00 C8 26 06 1B 16 
    }
    mTransactionIDs.Length = nrIDs + 1;                                         //0043 : 0F 37 01 30 5F 2B 26 92 00 50 26 06 1B 26 16 
    mTransactionIDs[nrIDs] = aNewTransactionID;                                 //0052 : 0F 10 00 50 26 06 1B 01 30 5F 2B 26 00 D8 FE 33 26 
    //0F 00 50 26 06 1B 37 01 30 5F 2B 26 0F 00 C8 26 06 1B 25 07 43 00 96 00 C8 26 06 1B 00 50 26 06 
    //1B 16 07 39 00 9A 10 00 C8 26 06 1B 01 30 5F 2B 26 00 D8 FE 33 26 16 04 0B A3 00 C8 26 06 1B 16 
    //06 13 00 0F 37 01 30 5F 2B 26 92 00 50 26 06 1B 26 16 0F 10 00 50 26 06 1B 01 30 5F 2B 26 00 D8 
    //FE 33 26 04 0B 47 
  }


  function bool IsValidLootItem(ClientLootInfo aLootItemInfo) {
    return aLootItemInfo.LootMode == Class'Loot_Transaction'.0;                 //0000 : 04 9A 39 3A 36 38 9A 2B 11 00 90 0D 33 26 12 20 38 0C 5D 01 01 00 04 25 16 
    //04 9A 39 3A 36 38 9A 2B 11 00 90 0D 33 26 12 20 38 0C 5D 01 01 00 04 25 16 04 0B 47 
  }


  function OnItemChosen(int aIndex,bool aChosenFlag) {
    EnableItemPage(aIndex,!aChosenFlag);                                        //0000 : 1B 3E 99 00 00 00 30 0F 33 26 81 2D 00 B8 0E 33 26 16 16 
    //1B 3E 99 00 00 00 30 0F 33 26 81 2D 00 B8 0E 33 26 16 16 04 0B 47 
  }


  function EndLooting() {
    local Game_Pawn gamePawn;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 F0 27 06 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Looting != None) {                         //000C : 07 4A 00 82 77 00 F0 27 06 1B 2A 16 18 12 00 77 19 00 F0 27 06 1B 05 00 04 01 68 52 18 11 2A 16 16 
      gamePawn.Looting.cl_EndLootingForTransactions(mTransactionIDs);           //002D : 19 19 00 F0 27 06 1B 05 00 04 01 68 52 18 11 0B 00 00 1C B0 7E 2B 11 01 30 5F 2B 26 16 
    }
    HideWindow();                                                               //004A : 1B F7 98 00 00 16 
    //0F 00 F0 27 06 1B 1B 2B 0C 00 00 16 07 4A 00 82 77 00 F0 27 06 1B 2A 16 18 12 00 77 19 00 F0 27 
    //06 1B 05 00 04 01 68 52 18 11 2A 16 16 19 19 00 F0 27 06 1B 05 00 04 01 68 52 18 11 0B 00 00 1C 
    //B0 7E 2B 11 01 30 5F 2B 26 16 1B F7 98 00 00 16 04 0B 47 
  }


  function CheckStatus() {
    if (mItems.Length == 0) {                                                   //0000 : 07 12 00 9A 37 01 40 58 EC 25 25 16 
      EndLooting();                                                             //000C : 1B 34 99 00 00 16 
    }
    //07 12 00 9A 37 01 40 58 EC 25 25 16 1B 34 99 00 00 16 04 0B 47 
  }


  function bool OnClose(GUI_Component clickedButton) {
    ConfirmClose();                                                             //0000 : 1B EC 98 00 00 16 
    return False;                                                               //0006 : 04 28 
    //1B EC 98 00 00 16 04 28 04 0B 47 
  }


  function ConfirmClose() {
    mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.End_Looting.Text,Class'SBGuiStrings'.default.End_Loot_Confirm_Query.Text,Class'GUI_BaseDesktop'.4 | Class'GUI_BaseDesktop'.8 | Class'GUI_BaseDesktop'.32,1,self);//0000 : 19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 2C 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 26 17 16 
    //19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //08 2C 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 
    //68 D7 00 02 00 04 2C 20 16 26 17 16 04 0B 47 
  }


  function bool OnLootAll(GUI_Component clickedButton) {
    LootAllItems();                                                             //0000 : 1B 55 9A 00 00 16 
    return True;                                                                //0006 : 04 27 
    //1B 55 9A 00 00 16 04 27 04 0B 47 
  }


  function TickHandler(float aDeltaTime) {
    local int idx;
    local int minutes;
    local int tensSecs;
    local int secs;
    local Game_Pawn gamePawn;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 78 87 07 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Looting != None) {                         //000C : 07 40 01 82 77 00 78 87 07 1B 2A 16 18 12 00 77 19 00 78 87 07 1B 05 00 04 01 68 52 18 11 2A 16 16 
      idx = mItems.Length - 1;                                                  //002D : 0F 00 58 43 8A 19 93 37 01 40 58 EC 25 26 16 
      while (idx > -1) {                                                        //003C : 07 3D 01 97 00 58 43 8A 19 1D FF FF FF FF 16 
        if (mItems[idx].Enabled) {                                              //004B : 07 33 01 2D 36 C8 3E 06 1B 10 00 58 43 8A 19 01 40 58 EC 25 
          mItems[idx].Timer -= aDeltaTime;                                      //005F : B9 36 88 6F 04 1B 10 00 58 43 8A 19 01 40 58 EC 25 00 C0 11 33 26 16 
          minutes = mItems[idx].Timer / 60;                                     //0076 : 0F 00 40 F6 33 26 39 44 AC 36 88 6F 04 1B 10 00 58 43 8A 19 01 40 58 EC 25 39 3F 2C 3C 16 
          tensSecs = mItems[idx].Timer % 60;                                    //0094 : 0F 00 28 D4 04 1B 39 44 AD 36 88 6F 04 1B 10 00 58 43 8A 19 01 40 58 EC 25 39 3F 2C 3C 16 
          secs = tensSecs % 10;                                                 //00B2 : 0F 00 20 FB 33 26 39 44 AD 39 3F 00 28 D4 04 1B 39 3F 2C 0A 16 
          tensSecs = tensSecs / 10;                                             //00C7 : 0F 00 28 D4 04 1B 91 00 28 D4 04 1B 2C 0A 16 
          mItems[idx].ItemButton.SetText(string(minutes) $ ":" $ string(tensSecs)
            $ string(secs));//00D6 : 19 36 78 4D 89 19 10 00 58 43 8A 19 01 40 58 EC 25 24 00 00 1B 13 98 00 00 70 70 70 39 53 00 40 F6 33 26 1F 3A 00 16 39 53 00 28 D4 04 1B 16 39 53 00 20 FB 33 26 16 16 
          if (mItems[idx].Timer < 0.01000000) {                                 //010E : 07 33 01 B0 36 88 6F 04 1B 10 00 58 43 8A 19 01 40 58 EC 25 1E 0A D7 23 3C 16 
            RemoveItemPage(idx);                                                //0128 : 1B D1 99 00 00 00 58 43 8A 19 16 
          }
        }
        --idx;                                                                  //0133 : A4 00 58 43 8A 19 16 
      }
    } else {                                                                    //013D : 06 46 01 
      RemoveAllItemPages();                                                     //0140 : 1B 3D 99 00 00 16 
    }
    CheckStatus();                                                              //0146 : 1B C4 99 00 00 16 
    //0F 00 78 87 07 1B 1B 2B 0C 00 00 16 07 40 01 82 77 00 78 87 07 1B 2A 16 18 12 00 77 19 00 78 87 
    //07 1B 05 00 04 01 68 52 18 11 2A 16 16 0F 00 58 43 8A 19 93 37 01 40 58 EC 25 26 16 07 3D 01 97 
    //00 58 43 8A 19 1D FF FF FF FF 16 07 33 01 2D 36 C8 3E 06 1B 10 00 58 43 8A 19 01 40 58 EC 25 B9 
    //36 88 6F 04 1B 10 00 58 43 8A 19 01 40 58 EC 25 00 C0 11 33 26 16 0F 00 40 F6 33 26 39 44 AC 36 
    //88 6F 04 1B 10 00 58 43 8A 19 01 40 58 EC 25 39 3F 2C 3C 16 0F 00 28 D4 04 1B 39 44 AD 36 88 6F 
    //04 1B 10 00 58 43 8A 19 01 40 58 EC 25 39 3F 2C 3C 16 0F 00 20 FB 33 26 39 44 AD 39 3F 00 28 D4 
    //04 1B 39 3F 2C 0A 16 0F 00 28 D4 04 1B 91 00 28 D4 04 1B 2C 0A 16 19 36 78 4D 89 19 10 00 58 43 
    //8A 19 01 40 58 EC 25 24 00 00 1B 13 98 00 00 70 70 70 39 53 00 40 F6 33 26 1F 3A 00 16 39 53 00 
    //28 D4 04 1B 16 39 53 00 20 FB 33 26 16 16 07 33 01 B0 36 88 6F 04 1B 10 00 58 43 8A 19 01 40 58 
    //EC 25 1E 0A D7 23 3C 16 1B D1 99 00 00 00 58 43 8A 19 16 A4 00 58 43 8A 19 16 06 3C 00 06 46 01 
    //1B 3D 99 00 00 16 1B C4 99 00 00 16 04 0B 47 
  }


  function ResetTimer() {
    __OnTick__Delegate = None;                                                  //0000 : 45 01 70 E6 9D 19 44 00 00 00 00 
    //45 01 70 E6 9D 19 44 00 00 00 00 04 0B 47 
  }


  function InitTimer() {
    __OnTick__Delegate = TickHandler;                                           //0000 : 45 01 70 E6 9D 19 44 4B 98 00 00 
    //45 01 70 E6 9D 19 44 4B 98 00 00 04 0B 47 
  }


  function bool TryCloseWindow() {
    ConfirmClose();                                                             //0000 : 1B EC 98 00 00 16 
    return True;                                                                //0006 : 04 27 
    //1B EC 98 00 00 16 04 27 04 0B 47 
  }


  function HideWindow() {
    ResetTimer();                                                               //0000 : 1B AD 98 00 00 16 
    mTransactionIDs.Length = 0;                                                 //0006 : 0F 37 01 30 5F 2B 26 25 
    mDesktop.ShowStdWindow(40,2);                                               //000E : 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 28 2C 02 16 
    //1B AD 98 00 00 16 0F 37 01 30 5F 2B 26 25 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 28 2C 02 
    //16 04 0B 47 
  }


  function ShowWindow() {
    InitChoiceItems();                                                          //0000 : 1B CF 99 00 00 16 
    InitTimer();                                                                //0006 : 1B B4 98 00 00 16 
    if (!IsVisible()) {                                                         //000C : 07 29 00 81 1C C0 E6 88 19 16 16 
      mDesktop.ShowStdWindow(40,1);                                             //0017 : 19 01 48 0C 9D 19 09 00 04 1B DF 0B 00 00 2C 28 26 16 
    }
    //1B CF 99 00 00 16 1B B4 98 00 00 16 07 29 00 81 1C C0 E6 88 19 16 16 19 01 48 0C 9D 19 09 00 04 
    //1B DF 0B 00 00 2C 28 26 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 10 52 04 1B 00 D8 13 33 26 16 
    //1C 10 52 04 1B 00 D8 13 33 26 16 04 0B 47 
  }


  function OnUpdate(optional int intParam,optional Object objParam,optional string stringParam,optional int intParam2) {
    local Game_Pawn gamePawn;
    local int lootCount;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 E8 35 06 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Looting != None) {                         //000C : 07 6E 00 82 77 00 E8 35 06 1B 2A 16 18 12 00 77 19 00 E8 35 06 1B 05 00 04 01 68 52 18 11 2A 16 16 
      lootCount = gamePawn.Looting.ClientLoot.Length;                           //002D : 0F 00 98 F1 33 26 37 19 19 00 E8 35 06 1B 05 00 04 01 68 52 18 11 05 00 00 01 C0 7D 2B 11 
      if (lootCount > 0) {                                                      //004B : 07 5F 00 97 00 98 F1 33 26 25 16 
        ShowWindow();                                                           //0056 : 1B 57 2D 00 00 16 
      } else {                                                                  //005C : 06 6E 00 
        if (IsVisible()) {                                                      //005F : 07 6E 00 1C C0 E6 88 19 16 
          EndLooting();                                                         //0068 : 1B 34 99 00 00 16 
        }
      }
    }
    //0F 00 E8 35 06 1B 1B 2B 0C 00 00 16 07 6E 00 82 77 00 E8 35 06 1B 2A 16 18 12 00 77 19 00 E8 35 
    //06 1B 05 00 04 01 68 52 18 11 2A 16 16 0F 00 98 F1 33 26 37 19 19 00 E8 35 06 1B 05 00 04 01 68 
    //52 18 11 05 00 00 01 C0 7D 2B 11 07 5F 00 97 00 98 F1 33 26 25 16 1B 57 2D 00 00 16 06 6E 00 07 
    //6E 00 1C C0 E6 88 19 16 1B 34 99 00 00 16 04 0B 47 
  }


  event Initialize() {
    mTop = 100.00000000;                                                        //0000 : 0F 01 80 86 31 16 1E 00 00 C8 42 
    mLeft = 5.00000000;                                                         //000B : 0F 01 08 86 31 16 1E 00 00 A0 40 
    mWidth = 298.00000000;                                                      //0016 : 0F 01 60 87 31 16 1E 00 00 95 43 
    mHeight = 380.00000000;                                                     //0021 : 0F 01 40 88 31 16 1E 00 00 BE 43 
    Super.Initialize();                                                         //002C : 1C B0 E8 2C 26 16 
    mMainPage = CreatePage("GUI_Page",0,2,6,21,280,291);                        //0032 : 0F 01 B0 AE 2C 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 2C 02 2C 06 2C 15 1D 18 01 00 00 1D 23 01 00 00 16 
    mMainPage.SetStdBackground(7);                                              //0059 : 19 01 B0 AE 2C 26 08 00 00 1B 22 98 00 00 2C 07 16 
    mMainPage.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);          //006A : 19 01 B0 AE 2C 26 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    mConfirmButton = CreateButton("GUI_Button",0,2,6,318);                      //008D : 0F 01 40 5E 2B 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 06 1D 3E 01 00 00 16 
    mConfirmButton.__OnClick__Delegate = OnLootAll;                             //00AF : 45 19 01 40 5E 2B 26 05 00 08 01 98 EB 9D 19 44 4C 9A 00 00 
    mConfirmButton.SetText(Class'SBGuiStrings'.default.Loot_All.Text);          //00C3 : 19 01 40 5E 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 29 99 19 16 
    mCancelButton = CreateButton("GUI_Button",0,2,179,318);                     //00E5 : 0F 01 60 DC 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C B3 1D 3E 01 00 00 16 
    mCancelButton.__OnClick__Delegate = OnClose;                                //0107 : 45 19 01 60 DC 2C 26 05 00 08 01 98 EB 9D 19 44 DE 96 00 00 
    mCancelButton.SetText(Class'SBGuiStrings'.default.Pass_all.Text);           //011B : 19 01 60 DC 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 29 99 19 16 
    __OnMBClick__Delegate = MBClickHandler;                                     //013D : 45 01 B8 E9 9D 19 44 2D 98 00 00 
    //0F 01 80 86 31 16 1E 00 00 C8 42 0F 01 08 86 31 16 1E 00 00 A0 40 0F 01 60 87 31 16 1E 00 00 95 
    //43 0F 01 40 88 31 16 1E 00 00 BE 43 1C B0 E8 2C 26 16 0F 01 B0 AE 2C 26 1B 16 98 00 00 1F 47 55 
    //49 5F 50 61 67 65 00 25 2C 02 2C 06 2C 15 1D 18 01 00 00 1D 23 01 00 00 16 19 01 B0 AE 2C 26 08 
    //00 00 1B 22 98 00 00 2C 07 16 19 01 B0 AE 2C 26 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 
    //00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 0F 01 40 5E 2B 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 
    //74 6F 6E 00 25 2C 02 2C 06 1D 3E 01 00 00 16 45 19 01 40 5E 2B 26 05 00 08 01 98 EB 9D 19 44 4C 
    //9A 00 00 19 01 40 5E 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //B0 29 99 19 16 0F 01 60 DC 2C 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 
    //B3 1D 3E 01 00 00 16 45 19 01 60 DC 2C 26 05 00 08 01 98 EB 9D 19 44 DE 96 00 00 19 01 60 DC 2C 
    //26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 29 99 19 16 45 01 B8 
    //E9 9D 19 44 2D 98 00 00 04 0B 47 
  }



