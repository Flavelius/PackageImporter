//==============================================================================
//  HUD_GroupLoot
//==============================================================================

class HUD_GroupLoot extends HUD_SingleLoot
    dependsOn()
    Transient
    Config(User)
  ;

  const GROUP_BUTTON_HEIGHT =  20;
  const GROUP_BUTTON_WIDTH =  68;

  function bool OnNeedHandler(GUI_Component clickedButton) {
    local int itemPageIndex;
    local Game_Item needItem;
    local array<Game_Item> needItemList;
    local Game_Pawn gamePawn;
    itemPageIndex = GetButtonItemPage(GUI_Button(clickedButton));               //0000 : 0F 00 38 EF 05 1B 1C A8 05 2D 26 2E 78 F0 2E 1D 00 40 62 35 26 16 
    if (itemPageIndex > -1) {                                                   //0016 : 07 AE 00 97 00 38 EF 05 1B 1D FF FF FF FF 16 
      needItem = GetItemPageItem(itemPageIndex);                                //0025 : 0F 00 08 3A 07 1B 1C C0 0D 06 1B 00 38 EF 05 1B 16 
      gamePawn = GetPawn();                                                     //0036 : 0F 00 C0 EE 05 1B 1B 2B 0C 00 00 16 
      if (needItem != None && gamePawn != None
        && gamePawn.Looting != None) {//0042 : 07 AE 00 82 82 77 00 08 3A 07 1B 2A 16 18 09 00 77 00 C0 EE 05 1B 2A 16 16 18 12 00 77 19 00 C0 EE 05 1B 05 00 04 01 68 52 18 11 2A 16 16 
        OnItemChosen(itemPageIndex,True);                                       //0070 : 1B E7 98 00 00 00 38 EF 05 1B 27 16 
        needItemList.Length = 0;                                                //007C : 0F 37 00 90 39 07 1B 25 
        needItemList[0] = needItem;                                             //0084 : 0F 10 25 00 90 39 07 1B 00 08 3A 07 1B 
        gamePawn.Looting.cl_NeedItems(needItemList);                            //0091 : 19 19 00 C0 EE 05 1B 05 00 04 01 68 52 18 11 0B 00 00 1C 28 6D 2B 11 00 90 39 07 1B 16 
      }
    }
    return True;                                                                //00AE : 04 27 
    //0F 00 38 EF 05 1B 1C A8 05 2D 26 2E 78 F0 2E 1D 00 40 62 35 26 16 07 AE 00 97 00 38 EF 05 1B 1D 
    //FF FF FF FF 16 0F 00 08 3A 07 1B 1C C0 0D 06 1B 00 38 EF 05 1B 16 0F 00 C0 EE 05 1B 1B 2B 0C 00 
    //00 16 07 AE 00 82 82 77 00 08 3A 07 1B 2A 16 18 09 00 77 00 C0 EE 05 1B 2A 16 16 18 12 00 77 19 
    //00 C0 EE 05 1B 05 00 04 01 68 52 18 11 2A 16 16 1B E7 98 00 00 00 38 EF 05 1B 27 16 0F 37 00 90 
    //39 07 1B 25 0F 10 25 00 90 39 07 1B 00 08 3A 07 1B 19 19 00 C0 EE 05 1B 05 00 04 01 68 52 18 11 
    //0B 00 00 1C 28 6D 2B 11 00 90 39 07 1B 16 04 27 04 0B 47 
  }


  function bool OnGreedHandler(GUI_Component clickedButton) {
    local int itemPageIndex;
    local Game_Item greedItem;
    local array<Game_Item> greedItemList;
    local Game_Pawn gamePawn;
    itemPageIndex = GetButtonItemPage(GUI_Button(clickedButton));               //0000 : 0F 00 B8 F2 05 1B 1C A8 05 2D 26 2E 78 F0 2E 1D 00 C0 65 35 26 16 
    if (itemPageIndex > -1) {                                                   //0016 : 07 AE 00 97 00 B8 F2 05 1B 1D FF FF FF FF 16 
      greedItem = GetItemPageItem(itemPageIndex);                               //0025 : 0F 00 00 43 07 1B 1C C0 0D 06 1B 00 B8 F2 05 1B 16 
      gamePawn = GetPawn();                                                     //0036 : 0F 00 60 F0 05 1B 1B 2B 0C 00 00 16 
      if (greedItem != None && gamePawn != None
        && gamePawn.Looting != None) {//0042 : 07 AE 00 82 82 77 00 00 43 07 1B 2A 16 18 09 00 77 00 60 F0 05 1B 2A 16 16 18 12 00 77 19 00 60 F0 05 1B 05 00 04 01 68 52 18 11 2A 16 16 
        OnItemChosen(itemPageIndex,True);                                       //0070 : 1B E7 98 00 00 00 B8 F2 05 1B 27 16 
        greedItemList.Length = 0;                                               //007C : 0F 37 00 E8 40 07 1B 25 
        greedItemList[0] = greedItem;                                           //0084 : 0F 10 25 00 E8 40 07 1B 00 00 43 07 1B 
        gamePawn.Looting.cl_GreedItems(greedItemList);                          //0091 : 19 19 00 60 F0 05 1B 05 00 04 01 68 52 18 11 0B 00 00 1C D8 6A 2B 11 00 E8 40 07 1B 16 
      }
    }
    return True;                                                                //00AE : 04 27 
    //0F 00 B8 F2 05 1B 1C A8 05 2D 26 2E 78 F0 2E 1D 00 C0 65 35 26 16 07 AE 00 97 00 B8 F2 05 1B 1D 
    //FF FF FF FF 16 0F 00 00 43 07 1B 1C C0 0D 06 1B 00 B8 F2 05 1B 16 0F 00 60 F0 05 1B 1B 2B 0C 00 
    //00 16 07 AE 00 82 82 77 00 00 43 07 1B 2A 16 18 09 00 77 00 60 F0 05 1B 2A 16 16 18 12 00 77 19 
    //00 60 F0 05 1B 05 00 04 01 68 52 18 11 2A 16 16 1B E7 98 00 00 00 B8 F2 05 1B 27 16 0F 37 00 E8 
    //40 07 1B 25 0F 10 25 00 E8 40 07 1B 00 00 43 07 1B 19 19 00 60 F0 05 1B 05 00 04 01 68 52 18 11 
    //0B 00 00 1C D8 6A 2B 11 00 E8 40 07 1B 16 04 27 04 0B 47 
  }


  function bool OnGreedAll(GUI_Component clickedButton) {
    local Game_Item greedItem;
    local array<Game_Item> greedItemList;
    local Game_Pawn gamePawn;
    local int i;
    local int tempSize;
    i = 0;                                                                      //0000 : 0F 00 58 0F 04 1B 25 
    while (i < mItems.Length) {                                                 //0007 : 07 89 00 96 00 58 0F 04 1B 37 01 40 58 EC 25 16 
      if (mItems[i].Enabled) {                                                  //0017 : 07 7F 00 2D 36 C8 3E 06 1B 10 00 58 0F 04 1B 01 40 58 EC 25 
        greedItem = GetItemPageItem(i);                                         //002B : 0F 00 C0 49 07 1B 1C C0 0D 06 1B 00 58 0F 04 1B 16 
        if (greedItem != None) {                                                //003C : 07 7F 00 77 00 C0 49 07 1B 2A 16 
          OnItemChosen(i,True);                                                 //0047 : 1B E7 98 00 00 00 58 0F 04 1B 27 16 
          tempSize = greedItemList.Length;                                      //0053 : 0F 00 E0 47 07 1B 37 00 D8 F7 05 1B 
          greedItemList.Length = tempSize + 1;                                  //005F : 0F 37 00 D8 F7 05 1B 92 00 E0 47 07 1B 26 16 
          greedItemList[tempSize] = greedItem;                                  //006E : 0F 10 00 E0 47 07 1B 00 D8 F7 05 1B 00 C0 49 07 1B 
        }
      }
      ++i;                                                                      //007F : A3 00 58 0F 04 1B 16 
    }
    gamePawn = GetPawn();                                                       //0089 : 0F 00 A8 F3 05 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Looting != None) {                         //0095 : 07 D3 00 82 77 00 A8 F3 05 1B 2A 16 18 12 00 77 19 00 A8 F3 05 1B 05 00 04 01 68 52 18 11 2A 16 16 
      gamePawn.Looting.cl_GreedItems(greedItemList);                            //00B6 : 19 19 00 A8 F3 05 1B 05 00 04 01 68 52 18 11 0B 00 00 1C D8 6A 2B 11 00 D8 F7 05 1B 16 
    }
    return True;                                                                //00D3 : 04 27 
    //0F 00 58 0F 04 1B 25 07 89 00 96 00 58 0F 04 1B 37 01 40 58 EC 25 16 07 7F 00 2D 36 C8 3E 06 1B 
    //10 00 58 0F 04 1B 01 40 58 EC 25 0F 00 C0 49 07 1B 1C C0 0D 06 1B 00 58 0F 04 1B 16 07 7F 00 77 
    //00 C0 49 07 1B 2A 16 1B E7 98 00 00 00 58 0F 04 1B 27 16 0F 00 E0 47 07 1B 37 00 D8 F7 05 1B 0F 
    //37 00 D8 F7 05 1B 92 00 E0 47 07 1B 26 16 0F 10 00 E0 47 07 1B 00 D8 F7 05 1B 00 C0 49 07 1B A3 
    //00 58 0F 04 1B 16 06 07 00 0F 00 A8 F3 05 1B 1B 2B 0C 00 00 16 07 D3 00 82 77 00 A8 F3 05 1B 2A 
    //16 18 12 00 77 19 00 A8 F3 05 1B 05 00 04 01 68 52 18 11 2A 16 16 19 19 00 A8 F3 05 1B 05 00 04 
    //01 68 52 18 11 0B 00 00 1C D8 6A 2B 11 00 D8 F7 05 1B 16 04 27 04 0B 47 
  }


  function ConfirmClose() {
    mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.End_Looting.Text,Class'SBGuiStrings'.default.End_Group_Loot_Confirm_Query.Text,Class'GUI_BaseDesktop'.4 | Class'GUI_BaseDesktop'.8 | Class'GUI_BaseDesktop'.32,1,self);//0000 : 19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 2C 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 26 17 16 
    //19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //80 2C 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 
    //68 D7 00 02 00 04 2C 20 16 26 17 16 04 0B 47 
  }


  function bool IsValidLootItem(ClientLootInfo aLootItemInfo) {
    return aLootItemInfo.LootMode == Class'Loot_Transaction'.1;                 //0000 : 04 9A 39 3A 36 38 9A 2B 11 00 68 6A 35 26 12 20 38 0C 5D 01 01 00 04 26 16 
    //04 9A 39 3A 36 38 9A 2B 11 00 68 6A 35 26 12 20 38 0C 5D 01 01 00 04 26 16 04 0B 47 
  }


  function HideWindow() {
    ResetTimer();                                                               //0000 : 1B AD 98 00 00 16 
    mTransactionIDs.Length = 0;                                                 //0006 : 0F 37 01 30 5F 2B 26 25 
    mDesktop.ShowStdWindow(41,2);                                               //000E : 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 29 2C 02 16 
    //1B AD 98 00 00 16 0F 37 01 30 5F 2B 26 25 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 29 2C 02 
    //16 04 0B 47 
  }


  function ShowWindow() {
    InitChoiceItems();                                                          //0000 : 1B CF 99 00 00 16 
    InitTimer();                                                                //0006 : 1B B4 98 00 00 16 
    if (!IsVisible()) {                                                         //000C : 07 29 00 81 1C C0 E6 88 19 16 16 
      mDesktop.ShowStdWindow(41,1);                                             //0017 : 19 01 48 0C 9D 19 09 00 04 1B DF 0B 00 00 2C 29 26 16 
    }
    //1B CF 99 00 00 16 1B B4 98 00 00 16 07 29 00 81 1C C0 E6 88 19 16 16 19 01 48 0C 9D 19 09 00 04 
    //1B DF 0B 00 00 2C 29 26 16 04 0B 47 
  }


  function CreateItemPage(int anIndex,Game_Item aGameItem) {
    local GUI_Page itemPage;
    local GUI_Button itemIcon;
    local GUI_Button NeedButton;
    local GUI_Button GreedButton;
    local GUI_Label Description;
    local int tempX;
    local int tempY;
    Super.CreateItemPage(anIndex,aGameItem);                                    //0000 : 1C 38 3F 2C 26 00 20 8A 2C 26 00 60 6E 35 26 16 
    if (anIndex > -1 && anIndex < mItems.Length) {                              //0010 : 07 7D 02 82 97 00 20 8A 2C 26 1D FF FF FF FF 16 18 0E 00 96 00 20 8A 2C 26 37 01 40 58 EC 25 16 16 
      itemIcon = mItems[anIndex].ItemButton;                                    //0031 : 0F 00 B0 B3 04 1B 36 78 4D 89 19 10 00 20 8A 2C 26 01 40 58 EC 25 
      if (itemIcon != None && itemIcon.mOwnerPage != None) {                    //0047 : 07 7D 02 82 77 00 B0 B3 04 1B 2A 16 18 12 00 77 19 00 B0 B3 04 1B 05 00 04 01 08 B0 9D 19 2A 16 16 
        itemPage = itemIcon.mOwnerPage;                                         //0068 : 0F 00 28 B4 04 1B 19 00 B0 B3 04 1B 05 00 04 01 08 B0 9D 19 
        tempX = itemPage.mWidth - 68 + 2;                                       //007C : 0F 00 C0 B2 04 1B 39 44 AF 19 00 28 B4 04 1B 05 00 04 01 60 87 31 16 39 3F 92 2C 44 2C 02 16 16 
        tempY = 2 + 2;                                                          //009C : 0F 00 F8 FC 05 1B 92 2C 02 2C 02 16 
        GreedButton = itemPage.CreateButton("GUI_Button",0,2,tempX,tempY,68,20);//00A8 : 0F 00 F0 FA 32 26 19 00 28 B4 04 1B 23 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 00 C0 B2 04 1B 00 F8 FC 05 1B 2C 44 2C 14 16 
        GreedButton.SetText(Class'SBGuiStrings'.default.Greed.Text);            //00DA : 19 00 F0 FA 32 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 87 99 19 16 
        GreedButton.__OnClick__Delegate = OnGreedHandler;                       //00FC : 45 19 00 F0 FA 32 26 05 00 08 01 98 EB 9D 19 44 5A 9A 00 00 
        GreedButton.SetEnabled(True);                                           //0110 : 19 00 F0 FA 32 26 07 00 00 1B 5F 32 00 00 27 16 
        GreedButton.SetVisible(True);                                           //0120 : 19 00 F0 FA 32 26 07 00 00 1B 14 98 00 00 27 16 
        tempY += 20 + 2;                                                        //0130 : A1 00 F8 FC 05 1B 92 2C 14 2C 02 16 16 
        NeedButton = itemPage.CreateButton("GUI_Button",0,2,tempX,tempY,68,20); //013D : 0F 00 E8 FD 05 1B 19 00 28 B4 04 1B 23 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 00 C0 B2 04 1B 00 F8 FC 05 1B 2C 44 2C 14 16 
        NeedButton.SetText(Class'SBGuiStrings'.default.Need.Text);              //016F : 19 00 E8 FD 05 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 88 99 19 16 
        NeedButton.__OnClick__Delegate = OnNeedHandler;                         //0191 : 45 19 00 E8 FD 05 1B 05 00 08 01 98 EB 9D 19 44 5C 9A 00 00 
        tempX = itemPage.mWidth - itemIcon.mWidth + 2 - 2 - 68 + 2;             //01A5 : 0F 00 C0 B2 04 1B 93 39 44 AF AF 19 00 28 B4 04 1B 05 00 04 01 60 87 31 16 AE 19 00 B0 B3 04 1B 05 00 04 01 60 87 31 16 39 3F 2C 02 16 16 39 3F 2C 02 16 92 2C 44 2C 02 16 16 
        mItems[anIndex].ItemButton.__OnClick__Delegate = None;                  //01DF : 45 19 36 78 4D 89 19 10 00 20 8A 2C 26 01 40 58 EC 25 05 00 08 01 98 EB 9D 19 44 00 00 00 00 
        mItems[anIndex].NeedButton = NeedButton;                                //01FE : 0F 36 E0 DE 04 1B 10 00 20 8A 2C 26 01 40 58 EC 25 00 E8 FD 05 1B 
        mItems[anIndex].GreedButton = GreedButton;                              //0214 : 0F 36 F0 DD 04 1B 10 00 20 8A 2C 26 01 40 58 EC 25 00 F0 FA 32 26 
        Description = mItems[anIndex].ItemDescription;                          //022A : 0F 00 38 B3 04 1B 36 88 9B 07 1B 10 00 20 8A 2C 26 01 40 58 EC 25 
        if (Description != None) {                                              //0240 : 07 7D 02 77 00 38 B3 04 1B 2A 16 
          Description.SetPosition(Description.mLeft,Description.mTop,tempX);    //024B : 19 00 38 B3 04 1B 29 00 00 1B 23 98 00 00 19 00 38 B3 04 1B 05 00 04 01 08 86 31 16 19 00 38 B3 04 1B 05 00 04 01 80 86 31 16 39 3F 00 C0 B2 04 1B 16 
        }
      }
    }
    //1C 38 3F 2C 26 00 20 8A 2C 26 00 60 6E 35 26 16 07 7D 02 82 97 00 20 8A 2C 26 1D FF FF FF FF 16 
    //18 0E 00 96 00 20 8A 2C 26 37 01 40 58 EC 25 16 16 0F 00 B0 B3 04 1B 36 78 4D 89 19 10 00 20 8A 
    //2C 26 01 40 58 EC 25 07 7D 02 82 77 00 B0 B3 04 1B 2A 16 18 12 00 77 19 00 B0 B3 04 1B 05 00 04 
    //01 08 B0 9D 19 2A 16 16 0F 00 28 B4 04 1B 19 00 B0 B3 04 1B 05 00 04 01 08 B0 9D 19 0F 00 C0 B2 
    //04 1B 39 44 AF 19 00 28 B4 04 1B 05 00 04 01 60 87 31 16 39 3F 92 2C 44 2C 02 16 16 0F 00 F8 FC 
    //05 1B 92 2C 02 2C 02 16 0F 00 F0 FA 32 26 19 00 28 B4 04 1B 23 00 04 1B 18 98 00 00 1F 47 55 49 
    //5F 42 75 74 74 6F 6E 00 25 2C 02 00 C0 B2 04 1B 00 F8 FC 05 1B 2C 44 2C 14 16 19 00 F0 FA 32 26 
    //19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 87 99 19 16 45 19 00 F0 
    //FA 32 26 05 00 08 01 98 EB 9D 19 44 5A 9A 00 00 19 00 F0 FA 32 26 07 00 00 1B 5F 32 00 00 27 16 
    //19 00 F0 FA 32 26 07 00 00 1B 14 98 00 00 27 16 A1 00 F8 FC 05 1B 92 2C 14 2C 02 16 16 0F 00 E8 
    //FD 05 1B 19 00 28 B4 04 1B 23 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 
    //00 C0 B2 04 1B 00 F8 FC 05 1B 2C 44 2C 14 16 19 00 E8 FD 05 1B 19 00 00 1B 13 98 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 88 99 19 16 45 19 00 E8 FD 05 1B 05 00 08 01 98 EB 9D 19 
    //44 5C 9A 00 00 0F 00 C0 B2 04 1B 93 39 44 AF AF 19 00 28 B4 04 1B 05 00 04 01 60 87 31 16 AE 19 
    //00 B0 B3 04 1B 05 00 04 01 60 87 31 16 39 3F 2C 02 16 16 39 3F 2C 02 16 92 2C 44 2C 02 16 16 45 
    //19 36 78 4D 89 19 10 00 20 8A 2C 26 01 40 58 EC 25 05 00 08 01 98 EB 9D 19 44 00 00 00 00 0F 36 
    //E0 DE 04 1B 10 00 20 8A 2C 26 01 40 58 EC 25 00 E8 FD 05 1B 0F 36 F0 DD 04 1B 10 00 20 8A 2C 26 
    //01 40 58 EC 25 00 F0 FA 32 26 0F 00 38 B3 04 1B 36 88 9B 07 1B 10 00 20 8A 2C 26 01 40 58 EC 25 
    //07 7D 02 77 00 38 B3 04 1B 2A 16 19 00 38 B3 04 1B 29 00 00 1B 23 98 00 00 19 00 38 B3 04 1B 05 
    //00 04 01 08 86 31 16 19 00 38 B3 04 1B 05 00 04 01 80 86 31 16 39 3F 00 C0 B2 04 1B 16 04 0B 47 
    //
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 50 37 06 1B 16 
    if (mConfirmButton != None) {                                               //0006 : 07 47 00 77 01 40 5E 2B 26 2A 16 
      mConfirmButton.SetText(Class'SBGuiStrings'.default.Greed_All.Text);       //0011 : 19 01 40 5E 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 2A 99 19 16 
      mConfirmButton.__OnClick__Delegate = OnGreedAll;                          //0033 : 45 19 01 40 5E 2B 26 05 00 08 01 98 EB 9D 19 44 59 9A 00 00 
    }
    //1C 50 37 06 1B 16 07 47 00 77 01 40 5E 2B 26 2A 16 19 01 40 5E 2B 26 19 00 00 1B 13 98 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 2A 99 19 16 45 19 01 40 5E 2B 26 05 00 08 01 98 EB 
    //9D 19 44 59 9A 00 00 04 0B 47 
  }



