//==============================================================================
//  Content_Inventory
//==============================================================================

class Content_Inventory extends Content_API
    native
    exportstructs
    collapsecategories
    editinlinenew
    dependsOn(Game_ActiveTextItem,Item_Type)
  ;

  struct ContentItem {
      var (ContentItem) export editinline Item_Type Item;
      var (ContentItem) int StackSize;
      var (ContentItem) byte Color1;
      var (ContentItem) byte Color2;

  };


  var (Items) editinline array<ContentItem> Items;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem == None) {                                                        //0000 : 07 15 00 72 00 80 65 31 11 2A 16 
      return Description();                                                     //000B : 04 1B 56 05 00 00 16 
    } else {                                                                    //0012 : 06 5D 00 
      if (aItem.Tag == "O") {                                                   //0015 : 07 5D 00 7A 19 00 80 65 31 11 05 00 00 01 08 9B 18 11 1F 4F 00 16 
        return Items[aItem.Ordinality].Item.GetActiveText(aItem.SubItem);       //002B : 04 19 36 30 67 31 11 10 19 00 80 65 31 11 05 00 04 01 08 9F 24 11 01 A8 67 31 11 14 00 00 1B 60 05 00 00 19 00 80 65 31 11 05 00 04 01 20 9D 18 11 16 
      }
    }
    //07 15 00 72 00 80 65 31 11 2A 16 04 1B 56 05 00 00 16 06 5D 00 07 5D 00 7A 19 00 80 65 31 11 05 
    //00 00 01 08 9B 18 11 1F 4F 00 16 04 19 36 30 67 31 11 10 19 00 80 65 31 11 05 00 04 01 08 9F 24 
    //11 01 A8 67 31 11 14 00 00 1B 60 05 00 00 19 00 80 65 31 11 05 00 04 01 20 9D 18 11 16 04 0B 47 
    //
  }


  native function AutoStack(bool aUseStackableAmount);


  event string Description() {
    local int i;
    local string ret;
    if (Empty()) {                                                              //0000 : 07 20 00 1C 70 0A 20 11 16 
      return Class'StringReferences'.default.EmptyContentInventoryText.Text;    //0009 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 B7 1B 11 
    } else {                                                                    //001D : 06 C0 00 
      i = 0;                                                                    //0020 : 0F 00 58 6C 31 11 25 
      while (i < Items.Length) {                                                //0027 : 07 BA 00 96 00 58 6C 31 11 37 01 A8 67 31 11 16 
        if (Items[i].Item != None) {                                            //0037 : 07 B0 00 77 36 30 67 31 11 10 00 58 6C 31 11 01 A8 67 31 11 2A 16 
          if (Items[i].StackSize == 1) {                                        //004D : 07 81 00 9A 36 D0 6C 31 11 10 00 58 6C 31 11 01 A8 67 31 11 26 16 
            return Items[i].Item.GetName();                                     //0063 : 04 19 36 30 67 31 11 10 00 58 6C 31 11 01 A8 67 31 11 06 00 00 1B F9 03 00 00 16 
            goto jl00B0;                                                        //007E : 06 B0 00 
          }
          return string(Items[i].StackSize) @ Items[i].Item.GetName();          //0081 : 04 A8 39 53 36 D0 6C 31 11 10 00 58 6C 31 11 01 A8 67 31 11 19 36 30 67 31 11 10 00 58 6C 31 11 01 A8 67 31 11 06 00 00 1B F9 03 00 00 16 16 
        }
        i++;                                                                    //00B0 : A5 00 58 6C 31 11 16 
      }
      return ret;                                                               //00BA : 04 00 48 6D 31 11 
    }
    //07 20 00 1C 70 0A 20 11 16 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 B7 1B 11 06 C0 00 
    //0F 00 58 6C 31 11 25 07 BA 00 96 00 58 6C 31 11 37 01 A8 67 31 11 16 07 B0 00 77 36 30 67 31 11 
    //10 00 58 6C 31 11 01 A8 67 31 11 2A 16 07 81 00 9A 36 D0 6C 31 11 10 00 58 6C 31 11 01 A8 67 31 
    //11 26 16 04 19 36 30 67 31 11 10 00 58 6C 31 11 01 A8 67 31 11 06 00 00 1B F9 03 00 00 16 06 B0 
    //00 04 A8 39 53 36 D0 6C 31 11 10 00 58 6C 31 11 01 A8 67 31 11 19 36 30 67 31 11 10 00 58 6C 31 
    //11 01 A8 67 31 11 06 00 00 1B F9 03 00 00 16 16 A5 00 58 6C 31 11 16 06 27 00 04 00 48 6D 31 11 
    //04 0B 47 
  }


  function bool HasItemsInInventory(Game_Pawn aPawn) {
    local int i;
    local int ii;
    local array<Item_Type> uniqueItem;
    local array<int> uniqueCount;
    i = 0;                                                                      //0000 : 0F 00 68 70 31 11 25 
    while (i < Items.Length) {                                                  //0007 : 07 9E 00 96 00 68 70 31 11 37 01 A8 67 31 11 16 
      ii = 0;                                                                   //0017 : 0F 00 E0 70 31 11 25 
      while (ii < uniqueItem.Length) {                                          //001E : 07 5B 00 96 00 E0 70 31 11 37 00 58 71 31 11 16 
        if (uniqueItem[ii] == Items[i].Item) {                                  //002E : 07 51 00 72 10 00 E0 70 31 11 00 58 71 31 11 36 30 67 31 11 10 00 68 70 31 11 01 A8 67 31 11 16 
          goto jl005B;                                                          //004E : 06 5B 00 
        }
        ii++;                                                                   //0051 : A5 00 E0 70 31 11 16 
      }
      uniqueItem[ii] = Items[i].Item;                                           //005B : 0F 10 00 E0 70 31 11 00 58 71 31 11 36 30 67 31 11 10 00 68 70 31 11 01 A8 67 31 11 
      uniqueCount[ii] += Items[i].StackSize;                                    //0077 : A1 10 00 E0 70 31 11 00 D0 71 31 11 36 D0 6C 31 11 10 00 68 70 31 11 01 A8 67 31 11 16 
      i++;                                                                      //0094 : A5 00 68 70 31 11 16 
    }
    ii = 0;                                                                     //009E : 0F 00 E0 70 31 11 25 
    while (ii < uniqueItem.Length) {                                            //00A5 : 07 F4 00 96 00 E0 70 31 11 37 00 58 71 31 11 16 
      if (aPawn.itemManager.CountItems(uniqueItem[ii]) < uniqueCount[ii]) {     //00B5 : 07 EA 00 96 19 19 00 70 6E 31 11 05 00 04 01 B0 2D 19 11 11 00 04 1C 08 4A 22 11 10 00 E0 70 31 11 00 58 71 31 11 16 10 00 E0 70 31 11 00 D0 71 31 11 16 
        return False;                                                           //00E8 : 04 28 
      }
      ii++;                                                                     //00EA : A5 00 E0 70 31 11 16 
    }
    return True;                                                                //00F4 : 04 27 
    //0F 00 68 70 31 11 25 07 9E 00 96 00 68 70 31 11 37 01 A8 67 31 11 16 0F 00 E0 70 31 11 25 07 5B 
    //00 96 00 E0 70 31 11 37 00 58 71 31 11 16 07 51 00 72 10 00 E0 70 31 11 00 58 71 31 11 36 30 67 
    //31 11 10 00 68 70 31 11 01 A8 67 31 11 16 06 5B 00 A5 00 E0 70 31 11 16 06 1E 00 0F 10 00 E0 70 
    //31 11 00 58 71 31 11 36 30 67 31 11 10 00 68 70 31 11 01 A8 67 31 11 A1 10 00 E0 70 31 11 00 D0 
    //71 31 11 36 D0 6C 31 11 10 00 68 70 31 11 01 A8 67 31 11 16 A5 00 68 70 31 11 16 06 07 00 0F 00 
    //E0 70 31 11 25 07 F4 00 96 00 E0 70 31 11 37 00 58 71 31 11 16 07 EA 00 96 19 19 00 70 6E 31 11 
    //05 00 04 01 B0 2D 19 11 11 00 04 1C 08 4A 22 11 10 00 E0 70 31 11 00 58 71 31 11 16 10 00 E0 70 
    //31 11 00 D0 71 31 11 16 04 28 A5 00 E0 70 31 11 16 06 A5 00 04 27 04 0B 47 
  }


  function bool RemoveFromInventory(Game_Pawn aPawn,optional SBDBAsyncCallback callback) {
    local int i;
    local export editinline Item_Type Type;
    local int Amount;
    local export editinline Game_PlayerItemManager itemManager;
    if (aPawn.itemManager == None) {                                            //0000 : 07 16 00 72 19 00 60 74 31 11 05 00 04 01 B0 2D 19 11 2A 16 
      return False;                                                             //0014 : 04 28 
    }
    itemManager = Game_PlayerItemManager(aPawn.itemManager);                    //0016 : 0F 00 48 76 31 11 2E F0 92 5F 01 19 00 60 74 31 11 05 00 04 01 B0 2D 19 11 
    if (itemManager == None) {                                                  //002F : 07 3C 00 72 00 48 76 31 11 2A 16 
      return False;                                                             //003A : 04 28 
    }
    i = 0;                                                                      //003C : 0F 00 C0 76 31 11 25 
    while (i < Items.Length) {                                                  //0043 : 07 D0 00 96 00 C0 76 31 11 37 01 A8 67 31 11 16 
      Type = Items[i].Item;                                                     //0053 : 0F 00 38 77 31 11 36 30 67 31 11 10 00 C0 76 31 11 01 A8 67 31 11 
      if (Type != None) {                                                       //0069 : 07 C6 00 77 00 38 77 31 11 2A 16 
        Amount = Items[i].StackSize;                                            //0074 : 0F 00 B0 77 31 11 36 D0 6C 31 11 10 00 C0 76 31 11 01 A8 67 31 11 
        if (CountItems(aPawn,Type) < Amount) {                                  //008A : 07 A6 00 96 1C 60 0E 20 11 00 60 74 31 11 00 38 77 31 11 16 00 B0 77 31 11 16 
          return False;                                                         //00A4 : 04 28 
        }
        if (!itemManager.sv_QueueRemoveByType(Type,Amount)) {                   //00A6 : 07 C6 00 81 19 00 48 76 31 11 10 00 04 1C 98 44 26 11 00 38 77 31 11 00 B0 77 31 11 16 16 
          return False;                                                         //00C4 : 04 28 
        }
      }
      i++;                                                                      //00C6 : A5 00 C0 76 31 11 16 
    }
    if (itemManager.sv_ExecuteRemoveByType(callback)) {                         //00D0 : 07 E7 00 19 00 48 76 31 11 0B 00 04 1C 80 40 26 11 00 28 78 31 11 16 
    }
    return True;                                                                //00E7 : 04 27 
    return False;                                                               //00E9 : 04 28 
    //07 16 00 72 19 00 60 74 31 11 05 00 04 01 B0 2D 19 11 2A 16 04 28 0F 00 48 76 31 11 2E F0 92 5F 
    //01 19 00 60 74 31 11 05 00 04 01 B0 2D 19 11 07 3C 00 72 00 48 76 31 11 2A 16 04 28 0F 00 C0 76 
    //31 11 25 07 D0 00 96 00 C0 76 31 11 37 01 A8 67 31 11 16 0F 00 38 77 31 11 36 30 67 31 11 10 00 
    //C0 76 31 11 01 A8 67 31 11 07 C6 00 77 00 38 77 31 11 2A 16 0F 00 B0 77 31 11 36 D0 6C 31 11 10 
    //00 C0 76 31 11 01 A8 67 31 11 07 A6 00 96 1C 60 0E 20 11 00 60 74 31 11 00 38 77 31 11 16 00 B0 
    //77 31 11 16 04 28 07 C6 00 81 19 00 48 76 31 11 10 00 04 1C 98 44 26 11 00 38 77 31 11 00 B0 77 
    //31 11 16 16 04 28 A5 00 C0 76 31 11 16 06 43 00 07 E7 00 19 00 48 76 31 11 0B 00 04 1C 80 40 26 
    //11 00 28 78 31 11 16 04 27 04 28 04 0B 47 
  }


  event AddToInventory(Game_Pawn aPawn) {
    local int i;
    local export editinline Item_Type Type;
    local export editinline Game_PlayerItemManager itemManager;
    if (aPawn.itemManager == None) {                                            //0000 : 07 16 00 72 19 00 C8 79 31 11 05 00 04 01 B0 2D 19 11 2A 16 
      return;                                                                   //0014 : 04 0B 
    }
    itemManager = Game_PlayerItemManager(aPawn.itemManager);                    //0016 : 0F 00 A8 7B 31 11 2E F0 92 5F 01 19 00 C8 79 31 11 05 00 04 01 B0 2D 19 11 
    if (itemManager == None) {                                                  //002F : 07 3C 00 72 00 A8 7B 31 11 2A 16 
      return;                                                                   //003A : 04 0B 
    }
    AutoStack(False);                                                           //003C : 1B 71 0D 00 00 28 16 
    i = 0;                                                                      //0043 : 0F 00 20 7C 31 11 25 
    while (i < Items.Length) {                                                  //004A : 07 D1 00 96 00 20 7C 31 11 37 01 A8 67 31 11 16 
      Type = Items[i].Item;                                                     //005A : 0F 00 98 7C 31 11 36 30 67 31 11 10 00 20 7C 31 11 01 A8 67 31 11 
      if (Type != None) {                                                       //0070 : 07 C7 00 77 00 98 7C 31 11 2A 16 
        if (!itemManager.sv_QueueAddItem(Type,Items[i].StackSize,0,Items[i].Color1,Items[i].Color2)) {//007B : 07 C7 00 81 19 00 A8 7B 31 11 3C 00 04 1C 40 49 26 11 00 98 7C 31 11 36 D0 6C 31 11 10 00 20 7C 31 11 01 A8 67 31 11 25 36 10 7D 31 11 10 00 20 7C 31 11 01 A8 67 31 11 36 88 7D 31 11 10 00 20 7C 31 11 01 A8 67 31 11 16 16 
          return;                                                               //00C5 : 04 0B 
        }
      }
      i++;                                                                      //00C7 : A5 00 20 7C 31 11 16 
    }
    itemManager.sv_ExecuteAddItems(1);                                          //00D1 : 19 00 A8 7B 31 11 08 00 04 1C 70 46 26 11 24 01 16 
    //07 16 00 72 19 00 C8 79 31 11 05 00 04 01 B0 2D 19 11 2A 16 04 0B 0F 00 A8 7B 31 11 2E F0 92 5F 
    //01 19 00 C8 79 31 11 05 00 04 01 B0 2D 19 11 07 3C 00 72 00 A8 7B 31 11 2A 16 04 0B 1B 71 0D 00 
    //00 28 16 0F 00 20 7C 31 11 25 07 D1 00 96 00 20 7C 31 11 37 01 A8 67 31 11 16 0F 00 98 7C 31 11 
    //36 30 67 31 11 10 00 20 7C 31 11 01 A8 67 31 11 07 C7 00 77 00 98 7C 31 11 2A 16 07 C7 00 81 19 
    //00 A8 7B 31 11 3C 00 04 1C 40 49 26 11 00 98 7C 31 11 36 D0 6C 31 11 10 00 20 7C 31 11 01 A8 67 
    //31 11 25 36 10 7D 31 11 10 00 20 7C 31 11 01 A8 67 31 11 36 88 7D 31 11 10 00 20 7C 31 11 01 A8 
    //67 31 11 16 16 04 0B A5 00 20 7C 31 11 16 06 4A 00 19 00 A8 7B 31 11 08 00 04 1C 70 46 26 11 24 
    //01 16 04 0B 47 
  }


  final native function int GetStackSize(int aIndex);


  function byte GetColor2(int aIndex) {
    return Items[aIndex].Color2;                                                //0000 : 04 36 88 7D 31 11 10 00 88 80 31 11 01 A8 67 31 11 
    //04 36 88 7D 31 11 10 00 88 80 31 11 01 A8 67 31 11 04 0B 47 
  }


  function byte GetColor1(int aIndex) {
    return Items[aIndex].Color1;                                                //0000 : 04 36 10 7D 31 11 10 00 70 82 31 11 01 A8 67 31 11 
    //04 36 10 7D 31 11 10 00 70 82 31 11 01 A8 67 31 11 04 0B 47 
  }


  final native function Item_Type GetItem(int aIndex);


  function int SlotCount() {
    AutoStack(True);                                                            //0000 : 1B 71 0D 00 00 27 16 
    return Items.Length;                                                        //0007 : 04 37 01 A8 67 31 11 
    //1B 71 0D 00 00 27 16 04 37 01 A8 67 31 11 04 0B 47 
  }


  function bool AddItem(export editinline Item_Type aType,int aStack,byte aColor1,byte aColor2) {
    local ContentItem newItem;
    newItem.Item = aType;                                                       //0000 : 0F 36 30 67 31 11 00 C0 87 31 11 00 A8 86 31 11 
    newItem.StackSize = aStack;                                                 //0010 : 0F 36 D0 6C 31 11 00 C0 87 31 11 00 38 88 31 11 
    newItem.Color1 = aColor1;                                                   //0020 : 0F 36 10 7D 31 11 00 C0 87 31 11 00 B0 88 31 11 
    newItem.Color2 = aColor2;                                                   //0030 : 0F 36 88 7D 31 11 00 C0 87 31 11 00 28 89 31 11 
    Items[Items.Length] = newItem;                                              //0040 : 0F 10 37 01 A8 67 31 11 01 A8 67 31 11 00 C0 87 31 11 
    return True;                                                                //0052 : 04 27 
    //0F 36 30 67 31 11 00 C0 87 31 11 00 A8 86 31 11 0F 36 D0 6C 31 11 00 C0 87 31 11 00 38 88 31 11 
    //0F 36 10 7D 31 11 00 C0 87 31 11 00 B0 88 31 11 0F 36 88 7D 31 11 00 C0 87 31 11 00 28 89 31 11 
    //0F 10 37 01 A8 67 31 11 01 A8 67 31 11 00 C0 87 31 11 04 27 04 0B 47 
  }


  final native function bool Empty();


  final native function int Count();



