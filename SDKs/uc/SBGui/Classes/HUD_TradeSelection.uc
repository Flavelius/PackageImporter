//==============================================================================
//  HUD_TradeSelection
//==============================================================================

class HUD_TradeSelection extends GUI_Page
    dependsOn(HUD_TradeItemContainer,Game_Item,Item_Type,Game_Pawn,Game_PlayerItemManager)
    Transient
    Config(User)
  ;

  const ITEM_Y_SLOTS =  2;
  const ITEM_X_SLOTS =  8;
  var private array<HUD_TradeItemContainer> mButtons;
  var private int mSelectedButtonIndex;
  var private bool mReadOnly;
  var (null);
  var (null);


  function bool ButtonClickHandler(GUI_Component aButton) {
    local HUD_TradeItemContainer container;
    if (mReadOnly) {                                                            //0000 : 07 0B 00 2D 01 38 56 05 1B 
      return False;                                                             //0009 : 04 28 
    }
    if (mSelectedButtonIndex >= 0) {                                            //000B : 07 2C 00 99 01 60 CE 2B 26 25 16 
      mButtons[mSelectedButtonIndex].SetSelected(False);                        //0016 : 19 10 01 60 CE 2B 26 01 18 9B 8A 19 07 00 00 1B 4E 0D 00 00 28 16 
    }
    container = HUD_TradeItemContainer(aButton);                                //002C : 0F 00 B0 56 04 1B 2E 70 AF 30 1D 00 D0 E0 35 26 
    if (container != None
      && mSelectedButtonIndex != container.GetLocationSlot()) {//003C : 07 AD 00 82 77 00 B0 56 04 1B 2A 16 18 17 00 9B 01 60 CE 2B 26 19 00 B0 56 04 1B 06 00 04 1B C3 96 00 00 16 16 16 
      mSelectedButtonIndex = container.GetLocationSlot();                       //0062 : 0F 01 60 CE 2B 26 19 00 B0 56 04 1B 06 00 04 1B C3 96 00 00 16 
      if (container.GetItem() != None) {                                        //0077 : 07 AD 00 77 19 00 B0 56 04 1B 06 00 04 1B C1 0C 00 00 16 2A 16 
        container.SetSelected(True);                                            //008C : 19 00 B0 56 04 1B 07 00 00 1B 4E 0D 00 00 27 16 
        OnSelect(mSelectedButtonIndex);                                         //009C : 43 90 C4 07 1B F9 99 00 00 01 60 CE 2B 26 16 
        return False;                                                           //00AB : 04 28 
      }
    }
    mSelectedButtonIndex = -1;                                                  //00AD : 0F 01 60 CE 2B 26 1D FF FF FF FF 
    OnSelect(mSelectedButtonIndex);                                             //00B8 : 43 90 C4 07 1B F9 99 00 00 01 60 CE 2B 26 16 
    return True;                                                                //00C7 : 04 27 
    //07 0B 00 2D 01 38 56 05 1B 04 28 07 2C 00 99 01 60 CE 2B 26 25 16 19 10 01 60 CE 2B 26 01 18 9B 
    //8A 19 07 00 00 1B 4E 0D 00 00 28 16 0F 00 B0 56 04 1B 2E 70 AF 30 1D 00 D0 E0 35 26 07 AD 00 82 
    //77 00 B0 56 04 1B 2A 16 18 17 00 9B 01 60 CE 2B 26 19 00 B0 56 04 1B 06 00 04 1B C3 96 00 00 16 
    //16 16 0F 01 60 CE 2B 26 19 00 B0 56 04 1B 06 00 04 1B C3 96 00 00 16 07 AD 00 77 19 00 B0 56 04 
    //1B 06 00 04 1B C1 0C 00 00 16 2A 16 19 00 B0 56 04 1B 07 00 00 1B 4E 0D 00 00 27 16 43 90 C4 07 
    //1B F9 99 00 00 01 60 CE 2B 26 16 04 28 0F 01 60 CE 2B 26 1D FF FF FF FF 43 90 C4 07 1B F9 99 00 
    //00 01 60 CE 2B 26 16 04 27 04 0B 47 
  }


  function bool CheckForLastWeapons(Game_Pawn aPawn) {
    local int i;
    local int meleeCount;
    local int rangedCount;
    local Game_Item Item;
    i = 0;                                                                      //0000 : 0F 00 00 38 05 1B 25 
    while (i < mButtons.Length) {                                               //0007 : 07 8B 00 96 00 00 38 05 1B 37 01 18 9B 8A 19 16 
      Item = mButtons[i].GetItem();                                             //0017 : 0F 00 C8 8E 06 1B 19 10 00 00 38 05 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 
      if (Item != None) {                                                       //0032 : 07 81 00 77 00 C8 8E 06 1B 2A 16 
        switch (Item.Type.ItemType) {                                           //003D : 05 01 19 19 00 C8 8E 06 1B 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 
          case 11 :                                                             //0056 : 0A 5B 00 24 0B 
          case 12 :                                                             //005B : 0A 60 00 24 0C 
          case 13 :                                                             //0060 : 0A 6F 00 24 0D 
            meleeCount++;                                                       //0065 : A5 00 28 C3 07 1B 16 
            break;                                                              //006C : 06 81 00 
          case 14 :                                                             //006F : 0A 7E 00 24 0E 
            rangedCount++;                                                      //0074 : A5 00 18 C4 07 1B 16 
            break;                                                              //007B : 06 81 00 
          default:                                                              //007E : 0A FF FF 
        }
      }
      ++i;                                                                      //0081 : A3 00 00 38 05 1B 16 
    }
    return Game_PlayerItemManager(aPawn.itemManager).cl_CanRemoveWeapons(meleeCount,rangedCount);//008B : 04 19 2E F0 92 5F 01 19 00 48 E1 35 26 05 00 04 01 B0 2D 19 11 10 00 04 1B A0 1B 00 00 00 28 C3 07 1B 00 18 C4 07 1B 16 
    //0F 00 00 38 05 1B 25 07 8B 00 96 00 00 38 05 1B 37 01 18 9B 8A 19 16 0F 00 C8 8E 06 1B 19 10 00 
    //00 38 05 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 07 81 00 77 00 C8 8E 06 1B 2A 16 05 01 19 
    //19 00 C8 8E 06 1B 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 0A 5B 00 24 0B 0A 60 00 24 0C 
    //0A 6F 00 24 0D A5 00 28 C3 07 1B 16 06 81 00 0A 7E 00 24 0E A5 00 18 C4 07 1B 16 06 81 00 0A FF 
    //FF A3 00 00 38 05 1B 16 06 07 00 04 19 2E F0 92 5F 01 19 00 48 E1 35 26 05 00 04 01 B0 2D 19 11 
    //10 00 04 1B A0 1B 00 00 00 28 C3 07 1B 00 18 C4 07 1B 16 04 0B 47 
  }


  function HUD_TradeItemContainer GetGetContainerForItem(Game_Item aItem) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 68 2A 04 1B 25 
    while (i < mButtons.Length) {                                               //0007 : 07 4C 00 96 00 68 2A 04 1B 37 01 18 9B 8A 19 16 
      if (mButtons[i].GetItem() == aItem) {                                     //0017 : 07 42 00 72 19 10 00 68 2A 04 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 00 C0 E1 35 26 16 
        return mButtons[i];                                                     //0036 : 04 10 00 68 2A 04 1B 01 18 9B 8A 19 
      }
      ++i;                                                                      //0042 : A3 00 68 2A 04 1B 16 
    }
    return None;                                                                //004C : 04 2A 
    //0F 00 68 2A 04 1B 25 07 4C 00 96 00 68 2A 04 1B 37 01 18 9B 8A 19 16 07 42 00 72 19 10 00 68 2A 
    //04 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 00 C0 E1 35 26 16 04 10 00 68 2A 04 1B 01 18 9B 
    //8A 19 A3 00 68 2A 04 1B 16 06 07 00 04 2A 04 0B 47 
  }


  function int GetNumberOfFilledSlots() {
    local int i;
    local int Result;
    Result = 0;                                                                 //0000 : 0F 00 80 92 06 1B 25 
    i = 0;                                                                      //0007 : 0F 00 A0 39 05 1B 25 
    while (i < mButtons.Length) {                                               //000E : 07 4A 00 96 00 A0 39 05 1B 37 01 18 9B 8A 19 16 
      if (mButtons[i].GetItem() != None) {                                      //001E : 07 40 00 77 19 10 00 A0 39 05 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 2A 16 
        ++Result;                                                               //0039 : A3 00 80 92 06 1B 16 
      }
      ++i;                                                                      //0040 : A3 00 A0 39 05 1B 16 
    }
    return Result;                                                              //004A : 04 00 80 92 06 1B 
    //0F 00 80 92 06 1B 25 0F 00 A0 39 05 1B 25 07 4A 00 96 00 A0 39 05 1B 37 01 18 9B 8A 19 16 07 40 
    //00 77 19 10 00 A0 39 05 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 2A 16 A3 00 80 92 06 1B 16 
    //A3 00 A0 39 05 1B 16 06 0E 00 04 00 80 92 06 1B 04 0B 47 
  }


  function int GetSelectedButtonIndex() {
    return mSelectedButtonIndex;                                                //0000 : 04 01 60 CE 2B 26 
    //04 01 60 CE 2B 26 04 0B 47 
  }


  function bool IsTradingItem(Game_Item aItem) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 B8 3B 05 1B 25 
    while (i < mButtons.Length) {                                               //0007 : 07 42 00 96 00 B8 3B 05 1B 37 01 18 9B 8A 19 16 
      if (mButtons[i].GetItem() == aItem) {                                     //0017 : 07 38 00 72 19 10 00 B8 3B 05 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 00 B0 E2 35 26 16 
        return True;                                                            //0036 : 04 27 
      }
      i++;                                                                      //0038 : A5 00 B8 3B 05 1B 16 
    }
    return False;                                                               //0042 : 04 28 
    //0F 00 B8 3B 05 1B 25 07 42 00 96 00 B8 3B 05 1B 37 01 18 9B 8A 19 16 07 38 00 72 19 10 00 B8 3B 
    //05 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 00 B0 E2 35 26 16 04 27 A5 00 B8 3B 05 1B 16 06 
    //07 00 04 28 04 0B 47 
  }


  function Game_Item GetTradeItem(int aLocationSlot) {
    if (aLocationSlot >= 0
      && aLocationSlot < mButtons.Length) {          //0000 : 07 33 00 82 99 00 38 96 06 1B 25 16 18 0E 00 96 00 38 96 06 1B 37 01 18 9B 8A 19 16 16 
      return mButtons[aLocationSlot].GetItem();                                 //001D : 04 19 10 00 38 96 06 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 
    }
    return None;                                                                //0033 : 04 2A 
    //07 33 00 82 99 00 38 96 06 1B 25 16 18 0E 00 96 00 38 96 06 1B 37 01 18 9B 8A 19 16 16 04 19 10 
    //00 38 96 06 1B 01 18 9B 8A 19 06 00 04 1B C1 0C 00 00 16 04 2A 04 0B 47 
  }


  function RemoveTradeItem(int aLocationSlot) {
    if (aLocationSlot >= 0
      && aLocationSlot < mButtons.Length) {          //0000 : 07 32 00 82 99 00 68 9D 06 1B 25 16 18 0E 00 96 00 68 9D 06 1B 37 01 18 9B 8A 19 16 16 
      mButtons[aLocationSlot].RemoveItem();                                     //001D : 19 10 00 68 9D 06 1B 01 18 9B 8A 19 06 00 00 1B 81 0C 00 00 16 
    }
    //07 32 00 82 99 00 68 9D 06 1B 25 16 18 0E 00 96 00 68 9D 06 1B 37 01 18 9B 8A 19 16 16 19 10 00 
    //68 9D 06 1B 01 18 9B 8A 19 06 00 00 1B 81 0C 00 00 16 04 0B 47 
  }


  function SetTradeItem(Game_Item aItem,int aLocationSlot) {
    if (aLocationSlot >= 0
      && aLocationSlot < mButtons.Length) {          //0000 : 07 37 00 82 99 00 30 A0 06 1B 25 16 18 0E 00 96 00 30 A0 06 1B 37 01 18 9B 8A 19 16 16 
      mButtons[aLocationSlot].SetItem(aItem);                                   //001D : 19 10 00 30 A0 06 1B 01 18 9B 8A 19 0B 00 00 1B 4A 97 00 00 00 90 E4 35 26 16 
    }
    //07 37 00 82 99 00 30 A0 06 1B 25 16 18 0E 00 96 00 30 A0 06 1B 37 01 18 9B 8A 19 16 16 19 10 00 
    //30 A0 06 1B 01 18 9B 8A 19 0B 00 00 1B 4A 97 00 00 00 90 E4 35 26 16 04 0B 47 
  }


  function Reset() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 28 64 04 1B 25 
    while (i < mButtons.Length) {                                               //0007 : 07 68 00 96 00 28 64 04 1B 37 01 18 9B 8A 19 16 
      mButtons[i].SetGUILocked(mReadOnly);                                      //0017 : 19 10 00 28 64 04 1B 01 18 9B 8A 19 0C 00 00 1B 47 97 00 00 2D 01 38 56 05 1B 16 
      mButtons[i].SetSelected(False);                                           //0032 : 19 10 00 28 64 04 1B 01 18 9B 8A 19 07 00 00 1B 4E 0D 00 00 28 16 
      mButtons[i].SetItem(None);                                                //0048 : 19 10 00 28 64 04 1B 01 18 9B 8A 19 07 00 00 1B 4A 97 00 00 2A 16 
      ++i;                                                                      //005E : A3 00 28 64 04 1B 16 
    }
    mSelectedButtonIndex = -1;                                                  //0068 : 0F 01 60 CE 2B 26 1D FF FF FF FF 
    //0F 00 28 64 04 1B 25 07 68 00 96 00 28 64 04 1B 37 01 18 9B 8A 19 16 19 10 00 28 64 04 1B 01 18 
    //9B 8A 19 0C 00 00 1B 47 97 00 00 2D 01 38 56 05 1B 16 19 10 00 28 64 04 1B 01 18 9B 8A 19 07 00 
    //00 1B 4E 0D 00 00 28 16 19 10 00 28 64 04 1B 01 18 9B 8A 19 07 00 00 1B 4A 97 00 00 2A 16 A3 00 
    //28 64 04 1B 16 06 07 00 0F 01 60 CE 2B 26 1D FF FF FF FF 04 0B 47 
  }


  private function SetButtonsLocked(bool aLocked) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 60 40 05 1B 25 
    while (i < mButtons.Length) {                                               //0007 : 07 3C 00 96 00 60 40 05 1B 37 01 18 9B 8A 19 16 
      mButtons[i].SetGUILocked(aLocked);                                        //0017 : 19 10 00 60 40 05 1B 01 18 9B 8A 19 0C 00 00 1B 47 97 00 00 2D 00 08 E5 35 26 16 
      ++i;                                                                      //0032 : A3 00 60 40 05 1B 16 
    }
    //0F 00 60 40 05 1B 25 07 3C 00 96 00 60 40 05 1B 37 01 18 9B 8A 19 16 19 10 00 60 40 05 1B 01 18 
    //9B 8A 19 0C 00 00 1B 47 97 00 00 2D 00 08 E5 35 26 16 A3 00 60 40 05 1B 16 06 07 00 04 0B 47 
  }


  function SetReadOnly(bool aReadOnly) {
    local int i;
    mReadOnly = aReadOnly;                                                      //0000 : 14 2D 01 38 56 05 1B 2D 00 20 B9 07 1B 
    SetButtonsLocked(mReadOnly);                                                //000D : 1B 57 9B 00 00 2D 01 38 56 05 1B 16 
    if (!aReadOnly) {                                                           //0019 : 07 62 00 81 2D 00 20 B9 07 1B 16 
      i = 0;                                                                    //0024 : 0F 00 48 2F 04 1B 25 
      while (i < mButtons.Length) {                                             //002B : 07 62 00 96 00 48 2F 04 1B 37 01 18 9B 8A 19 16 
        mButtons[i].SetItemLocation(8,i,0);                                     //003B : 19 10 00 48 2F 04 1B 01 18 9B 8A 19 0E 00 00 1B 1B 06 00 00 24 08 00 48 2F 04 1B 25 16 
        ++i;                                                                    //0058 : A3 00 48 2F 04 1B 16 
      }
    }
    //14 2D 01 38 56 05 1B 2D 00 20 B9 07 1B 1B 57 9B 00 00 2D 01 38 56 05 1B 16 07 62 00 81 2D 00 20 
    //B9 07 1B 16 0F 00 48 2F 04 1B 25 07 62 00 96 00 48 2F 04 1B 37 01 18 9B 8A 19 16 19 10 00 48 2F 
    //04 1B 01 18 9B 8A 19 0E 00 00 1B 1B 06 00 00 24 08 00 48 2F 04 1B 25 16 A3 00 48 2F 04 1B 16 06 
    //2B 00 04 0B 47 
  }


  function OnSetTradeItemHandler(Game_Item aItem,int aLocationSlot) {
    OnSetTradeItem(aItem,aLocationSlot);                                        //0000 : 43 68 BF 07 1B 54 9B 00 00 00 20 E7 35 26 00 30 E6 35 26 16 
    //43 68 BF 07 1B 54 9B 00 00 00 20 E7 35 26 00 30 E6 35 26 16 04 0B 47 
  }


  function Initialize() {
    local int i;
    local int X;
    local int Y;
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mButtons.Length = 8 * 2;                                                    //0006 : 0F 37 01 18 9B 8A 19 90 2C 08 2C 02 16 
    Y = 0;                                                                      //0013 : 0F 00 70 30 04 1B 25 
    while (Y < 2) {                                                             //001A : 07 DE 00 96 00 70 30 04 1B 2C 02 16 
      X = 0;                                                                    //0026 : 0F 00 E8 30 04 1B 25 
      while (X < 8) {                                                           //002D : 07 D4 00 96 00 E8 30 04 1B 2C 08 16 
        i = 8 * Y + X;                                                          //0039 : 0F 00 38 49 05 1B 92 90 2C 08 00 70 30 04 1B 16 00 E8 30 04 1B 16 
        mButtons[i] = HUD_TradeItemContainer(CreateButton("HUD_TradeItemContainer",0,0,X * 40,Y * 40,40,40));//004F : 0F 10 00 38 49 05 1B 01 18 9B 8A 19 2E 70 AF 30 1D 1B 18 98 00 00 1F 48 55 44 5F 54 72 61 64 65 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 25 25 90 00 E8 30 04 1B 2C 28 16 90 00 70 30 04 1B 2C 28 16 2C 28 2C 28 16 
        mButtons[i].__OnClick__Delegate = ButtonClickHandler;                   //0096 : 45 19 10 00 38 49 05 1B 01 18 9B 8A 19 05 00 08 01 98 EB 9D 19 44 64 9B 00 00 
        mButtons[i].__OnItemSet__Delegate = OnSetTradeItemHandler;              //00B0 : 45 19 10 00 38 49 05 1B 01 18 9B 8A 19 05 00 08 01 80 FC 05 1B 44 57 99 00 00 
        ++X;                                                                    //00CA : A3 00 E8 30 04 1B 16 
      }
      ++Y;                                                                      //00D4 : A3 00 70 30 04 1B 16 
    }
    //1C 40 5B 9E 19 16 0F 37 01 18 9B 8A 19 90 2C 08 2C 02 16 0F 00 70 30 04 1B 25 07 DE 00 96 00 70 
    //30 04 1B 2C 02 16 0F 00 E8 30 04 1B 25 07 D4 00 96 00 E8 30 04 1B 2C 08 16 0F 00 38 49 05 1B 92 
    //90 2C 08 00 70 30 04 1B 16 00 E8 30 04 1B 16 0F 10 00 38 49 05 1B 01 18 9B 8A 19 2E 70 AF 30 1D 
    //1B 18 98 00 00 1F 48 55 44 5F 54 72 61 64 65 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 25 25 90 
    //00 E8 30 04 1B 2C 28 16 90 00 70 30 04 1B 2C 28 16 2C 28 2C 28 16 45 19 10 00 38 49 05 1B 01 18 
    //9B 8A 19 05 00 08 01 98 EB 9D 19 44 64 9B 00 00 45 19 10 00 38 49 05 1B 01 18 9B 8A 19 05 00 08 
    //01 80 FC 05 1B 44 57 99 00 00 A3 00 E8 30 04 1B 16 06 2D 00 A3 00 70 30 04 1B 16 06 1A 00 04 0B 
    //47 
  }


  delegate OnSetTradeItem(Game_Item aItem,int aLocationSlot);


  delegate OnSelect(int Index);



