//==============================================================================
//  Shop_Base
//==============================================================================

class Shop_Base extends Object
    native
    dependsOn(Game_Item,Item_Type,IC_Recipe,IC_BodySlot,Content_Requirement,Game_PlayerPawn,Game_Trading)
  ;

  var (Shop_Base) const array<Content_Requirement> Requirements;
  var (Shop_Base) const array<byte> ShopOptions;
  var (Shop_Base) editinline array<LootTable> Stock;
  var (Shop_Base) array<byte> BuyList;
  var (Shop_Base) string ShopName;
  var transient array<Game_Item> mStockItems;


  native function bool HasItemInStock(int aItemTypeID,int aAmount);


  function bool IsValidRecipeItem(Game_Item aItem,byte aShopOption,export out editinline IC_Recipe aOutRecipeComponent) {
    local export editinline IC_Recipe recipeComp;
    local export editinline IC_BodySlot bodyslotComp;
    if (aItem == None || aItem.Type.ItemType != 33) {                           //0000 : 07 31 00 84 72 00 70 37 31 11 2A 16 18 20 00 9B 39 3A 19 19 00 70 37 31 11 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 21 16 16 
      return False;                                                             //002F : 04 28 
    }
    recipeComp = IC_Recipe(aItem.Type.GetComponentByClass(Class'IC_Recipe'));   //0031 : 0F 00 28 3B 31 11 2E B8 2F 5C 01 19 19 00 70 37 31 11 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 
    if (recipeComp == None
      || recipeComp.ProducedItem == None) {          //0059 : 07 7C 00 84 72 00 28 3B 31 11 2A 16 18 12 00 72 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 2A 16 16 
      return False;                                                             //007A : 04 28 
    }
    aOutRecipeComponent = recipeComp;                                           //007C : 0F 00 A0 3B 31 11 00 28 3B 31 11 
    switch (aShopOption) {                                                      //0087 : 05 01 00 18 3C 31 11 
      case 32 :                                                                 //008E : 0A 95 00 24 20 
        return True;                                                            //0093 : 04 27 
      case 31 :                                                                 //0095 : 0A BA 00 24 1F 
        return recipeComp.ProducedItem.ItemType == 37;                          //009A : 04 9A 39 3A 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 11 39 3A 24 25 16 
      case 27 :                                                                 //00BA : 0A 52 01 24 1B 
        switch (recipeComp.ProducedItem.ItemType) {                             //00BF : 05 01 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 11 
          case 11 :                                                             //00D8 : 0A DD 00 24 0B 
          case 12 :                                                             //00DD : 0A E2 00 24 0C 
          case 13 :                                                             //00E2 : 0A E7 00 24 0D 
          case 14 :                                                             //00E7 : 0A EC 00 24 0E 
          case 15 :                                                             //00EC : 0A F1 00 24 0F 
          case 16 :                                                             //00F1 : 0A F6 00 24 10 
          case 17 :                                                             //00F6 : 0A FB 00 24 11 
          case 18 :                                                             //00FB : 0A 00 01 24 12 
          case 19 :                                                             //0100 : 0A 05 01 24 13 
          case 20 :                                                             //0105 : 0A 0A 01 24 14 
          case 21 :                                                             //010A : 0A 0F 01 24 15 
          case 22 :                                                             //010F : 0A 14 01 24 16 
          case 23 :                                                             //0114 : 0A 19 01 24 17 
          case 24 :                                                             //0119 : 0A 1E 01 24 18 
          case 34 :                                                             //011E : 0A 23 01 24 22 
          case 35 :                                                             //0123 : 0A 28 01 24 23 
          case 25 :                                                             //0128 : 0A 2D 01 24 19 
          case 26 :                                                             //012D : 0A 32 01 24 1A 
          case 27 :                                                             //0132 : 0A 37 01 24 1B 
          case 28 :                                                             //0137 : 0A 3C 01 24 1C 
          case 29 :                                                             //013C : 0A 41 01 24 1D 
          case 1 :                                                              //0141 : 0A 46 01 24 01 
          case 2 :                                                              //0146 : 0A 4D 01 24 02 
            return True;                                                        //014B : 04 27 
          default:                                                              //014D : 0A FF FF 
            return False;                                                       //0150 : 04 28 
          case 34 :                                                             //0152 : 0A 81 01 24 22 
            switch (recipeComp.ProducedItem.ItemType) {                         //0157 : 05 01 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 11 
              case 36 :                                                         //0170 : 0A 75 01 24 24 
              case 5 :                                                          //0175 : 0A 7C 01 24 05 
                return True;                                                    //017A : 04 27 
              default:                                                          //017C : 0A FF FF 
                return False;                                                   //017F : 04 28 
              default:                                                          //0181 : 0A FF FF 
                if (recipeComp.ProducedItem.ItemType == 0) {                    //0184 : 07 39 02 9A 39 3A 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 11 39 3A 24 00 16 
                  bodyslotComp = IC_BodySlot(recipeComp.ProducedItem.GetComponentByClass(Class'IC_BodySlot'));//01A6 : 0F 00 90 3C 31 11 2E 38 10 5C 01 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 0B 00 04 1C 00 31 22 11 20 38 10 5C 01 16 
                  if (bodyslotComp == None) {                                   //01CE : 07 DB 01 72 00 90 3C 31 11 2A 16 
                    return False;                                               //01D9 : 04 28 
                  }
                  switch (aShopOption) {                                        //01DB : 05 01 00 18 3C 31 11 
                    case 28 :                                                   //01E2 : 0A FE 01 24 1C 
                      return bodyslotComp.Type == 1;                            //01E7 : 04 9A 39 3A 19 00 90 3C 31 11 05 00 01 01 08 3D 31 11 39 3A 24 01 16 
                    case 29 :                                                   //01FE : 0A 1A 02 24 1D 
                      return bodyslotComp.Type == 2;                            //0203 : 04 9A 39 3A 19 00 90 3C 31 11 05 00 01 01 08 3D 31 11 39 3A 24 02 16 
                    case 30 :                                                   //021A : 0A 36 02 24 1E 
                      return bodyslotComp.Type == 0;                            //021F : 04 9A 39 3A 19 00 90 3C 31 11 05 00 01 01 08 3D 31 11 39 3A 24 00 16 
                    default:                                                    //0236 : 0A FF FF 
                  }
                  return False;                                                 //0239 : 04 28 
                }
              }
            }
          }
        }
      }
    }
    //07 31 00 84 72 00 70 37 31 11 2A 16 18 20 00 9B 39 3A 19 19 00 70 37 31 11 05 00 04 01 98 2F 22 
    //11 05 00 01 01 10 30 22 11 39 3A 24 21 16 16 04 28 0F 00 28 3B 31 11 2E B8 2F 5C 01 19 19 00 70 
    //37 31 11 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 07 7C 00 84 72 00 28 
    //3B 31 11 2A 16 18 12 00 72 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 2A 16 16 04 28 0F 00 A0 3B 
    //31 11 00 28 3B 31 11 05 01 00 18 3C 31 11 0A 95 00 24 20 04 27 0A BA 00 24 1F 04 9A 39 3A 19 19 
    //00 28 3B 31 11 05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 11 39 3A 24 25 16 0A 52 01 24 1B 05 
    //01 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 11 0A DD 00 24 0B 0A E2 00 
    //24 0C 0A E7 00 24 0D 0A EC 00 24 0E 0A F1 00 24 0F 0A F6 00 24 10 0A FB 00 24 11 0A 00 01 24 12 
    //0A 05 01 24 13 0A 0A 01 24 14 0A 0F 01 24 15 0A 14 01 24 16 0A 19 01 24 17 0A 1E 01 24 18 0A 23 
    //01 24 22 0A 28 01 24 23 0A 2D 01 24 19 0A 32 01 24 1A 0A 37 01 24 1B 0A 3C 01 24 1C 0A 41 01 24 
    //1D 0A 46 01 24 01 0A 4D 01 24 02 04 27 0A FF FF 04 28 0A 81 01 24 22 05 01 19 19 00 28 3B 31 11 
    //05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 11 0A 75 01 24 24 0A 7C 01 24 05 04 27 0A FF FF 04 
    //28 0A FF FF 07 39 02 9A 39 3A 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 05 00 01 01 10 30 22 
    //11 39 3A 24 00 16 0F 00 90 3C 31 11 2E 38 10 5C 01 19 19 00 28 3B 31 11 05 00 04 01 D8 47 2C 11 
    //0B 00 04 1C 00 31 22 11 20 38 10 5C 01 16 07 DB 01 72 00 90 3C 31 11 2A 16 04 28 05 01 00 18 3C 
    //31 11 0A FE 01 24 1C 04 9A 39 3A 19 00 90 3C 31 11 05 00 01 01 08 3D 31 11 39 3A 24 01 16 0A 1A 
    //02 24 1D 04 9A 39 3A 19 00 90 3C 31 11 05 00 01 01 08 3D 31 11 39 3A 24 02 16 0A 36 02 24 1E 04 
    //9A 39 3A 19 00 90 3C 31 11 05 00 01 01 08 3D 31 11 39 3A 24 00 16 0A FF FF 04 28 04 0B 47 
  }


  function bool CanBuyItem(byte aItemType) {
    local int i;
    if (BuyList.Length == 0) {                                                  //0000 : 07 0E 00 9A 37 01 B8 3F 31 11 25 16 
      return True;                                                              //000C : 04 27 
    }
    i = 0;                                                                      //000E : 0F 00 30 40 31 11 25 
    while (i < BuyList.Length) {                                                //0015 : 07 4A 00 96 00 30 40 31 11 37 01 B8 3F 31 11 16 
      if (BuyList[i] == aItemType) {                                            //0025 : 07 40 00 9A 39 3A 10 00 30 40 31 11 01 B8 3F 31 11 39 3A 00 A8 3E 31 11 16 
        return True;                                                            //003E : 04 27 
      }
      ++i;                                                                      //0040 : A3 00 30 40 31 11 16 
    }
    return False;                                                               //004A : 04 28 
    //07 0E 00 9A 37 01 B8 3F 31 11 25 16 04 27 0F 00 30 40 31 11 25 07 4A 00 96 00 30 40 31 11 37 01 
    //B8 3F 31 11 16 07 40 00 9A 39 3A 10 00 30 40 31 11 01 B8 3F 31 11 39 3A 00 A8 3E 31 11 16 04 27 
    //A3 00 30 40 31 11 16 06 15 00 04 28 04 0B 47 
  }


  native function array<Game_Item> GetItems();


  function bool CanEnterShop(Game_PlayerPawn aPlayerPawn,byte aSubOption) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 10 45 31 11 25 
    while (i < Requirements.Length) {                                           //0007 : 07 55 00 96 00 10 45 31 11 37 01 88 45 31 11 16 
      if (Requirements[i] != None
        && !Requirements[i].CheckPawn(aPlayerPawn)) {//0017 : 07 4B 00 82 77 10 00 10 45 31 11 01 88 45 31 11 2A 16 18 1D 00 81 19 10 00 10 45 31 11 01 88 45 31 11 0B 00 04 1C 90 E6 2B 11 00 A0 43 31 11 16 16 16 
        return False;                                                           //0049 : 04 28 
      }
      i++;                                                                      //004B : A5 00 10 45 31 11 16 
    }
    i = 0;                                                                      //0055 : 0F 00 10 45 31 11 25 
    while (i < ShopOptions.Length) {                                            //005C : 07 91 00 96 00 10 45 31 11 37 01 00 46 31 11 16 
      if (ShopOptions[i] == aSubOption) {                                       //006C : 07 87 00 9A 39 3A 10 00 10 45 31 11 01 00 46 31 11 39 3A 00 78 46 31 11 16 
        return True;                                                            //0085 : 04 27 
      }
      ++i;                                                                      //0087 : A3 00 10 45 31 11 16 
    }
    return False;                                                               //0091 : 04 28 
    //0F 00 10 45 31 11 25 07 55 00 96 00 10 45 31 11 37 01 88 45 31 11 16 07 4B 00 82 77 10 00 10 45 
    //31 11 01 88 45 31 11 2A 16 18 1D 00 81 19 10 00 10 45 31 11 01 88 45 31 11 0B 00 04 1C 90 E6 2B 
    //11 00 A0 43 31 11 16 16 16 04 28 A5 00 10 45 31 11 16 06 07 00 0F 00 10 45 31 11 25 07 91 00 96 
    //00 10 45 31 11 37 01 00 46 31 11 16 07 87 00 9A 39 3A 10 00 10 45 31 11 01 00 46 31 11 39 3A 00 
    //78 46 31 11 16 04 27 A3 00 10 45 31 11 16 06 5C 00 04 28 04 0B 47 
  }


  function sv_EnterShop(Game_PlayerPawn aPlayerPawn,byte aOption) {
    if (aPlayerPawn != None && aPlayerPawn.Trading != None
      && CanEnterShop(aPlayerPawn,aOption)) {//0000 : 07 54 00 82 82 77 00 18 48 31 11 2A 16 18 12 00 77 19 00 18 48 31 11 05 00 04 01 C0 43 32 0F 2A 16 16 18 11 00 1B 13 0D 00 00 00 18 48 31 11 00 30 49 31 11 16 16 
      aPlayerPawn.Trading.sv_EnterShop(self,aOption);                           //0036 : 19 19 00 18 48 31 11 05 00 04 01 C0 43 32 0F 0C 00 00 1B BC 0C 00 00 17 00 30 49 31 11 16 
    }
    //07 54 00 82 82 77 00 18 48 31 11 2A 16 18 12 00 77 19 00 18 48 31 11 05 00 04 01 C0 43 32 0F 2A 
    //16 16 18 11 00 1B 13 0D 00 00 00 18 48 31 11 00 30 49 31 11 16 16 19 19 00 18 48 31 11 05 00 04 
    //01 C0 43 32 0F 0C 00 00 1B BC 0C 00 00 17 00 30 49 31 11 16 04 0B 47 
  }


  event RadialMenuCollect(Pawn aPlayerPawn,byte aMainOption,out array<byte> aSubOptions) {
    local int i;
    local int Count;
    i = 0;                                                                      //0000 : 0F 00 50 4B 31 11 25 
    while (i < Requirements.Length) {                                           //0007 : 07 5A 00 96 00 50 4B 31 11 37 01 88 45 31 11 16 
      if (Requirements[i] != None
        && !Requirements[i].CheckPawn(Game_PlayerPawn(aPlayerPawn))) {//0017 : 07 50 00 82 77 10 00 50 4B 31 11 01 88 45 31 11 2A 16 18 22 00 81 19 10 00 50 4B 31 11 01 88 45 31 11 10 00 04 1C 90 E6 2B 11 2E F0 47 5B 01 00 A8 49 31 11 16 16 16 
        return;                                                                 //004E : 04 0B 
      }
      i++;                                                                      //0050 : A5 00 50 4B 31 11 16 
    }
    Count = aSubOptions.Length;                                                 //005A : 0F 00 C8 4B 31 11 37 00 40 4C 31 11 
    aSubOptions.Length = Count + ShopOptions.Length;                            //0066 : 0F 37 00 40 4C 31 11 92 00 C8 4B 31 11 37 01 00 46 31 11 16 
    i = 0;                                                                      //007A : 0F 00 50 4B 31 11 25 
    while (i < ShopOptions.Length) {                                            //0081 : 07 B9 00 96 00 50 4B 31 11 37 01 00 46 31 11 16 
      aSubOptions[Count + i] = ShopOptions[i];                                  //0091 : 0F 10 92 00 C8 4B 31 11 00 50 4B 31 11 16 00 40 4C 31 11 10 00 50 4B 31 11 01 00 46 31 11 
      ++i;                                                                      //00AF : A3 00 50 4B 31 11 16 
    }
    //0F 00 50 4B 31 11 25 07 5A 00 96 00 50 4B 31 11 37 01 88 45 31 11 16 07 50 00 82 77 10 00 50 4B 
    //31 11 01 88 45 31 11 2A 16 18 22 00 81 19 10 00 50 4B 31 11 01 88 45 31 11 10 00 04 1C 90 E6 2B 
    //11 2E F0 47 5B 01 00 A8 49 31 11 16 16 16 04 0B A5 00 50 4B 31 11 16 06 07 00 0F 00 C8 4B 31 11 
    //37 00 40 4C 31 11 0F 37 00 40 4C 31 11 92 00 C8 4B 31 11 37 01 00 46 31 11 16 0F 00 50 4B 31 11 
    //25 07 B9 00 96 00 50 4B 31 11 37 01 00 46 31 11 16 0F 10 92 00 C8 4B 31 11 00 50 4B 31 11 16 00 
    //40 4C 31 11 10 00 50 4B 31 11 01 00 46 31 11 A3 00 50 4B 31 11 16 06 81 00 04 0B 47 
  }



