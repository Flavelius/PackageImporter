//==============================================================================
//  Game_Item
//==============================================================================

class Game_Item extends Object
    native
    dependsOn(Item_Type,Appearance_Base,ConstantColor,Texture,Combiner,TexScaler,Game_Pawn,LevelInfo,Game_PlayerItemManager)
  ;

  enum EItemLocationType {
    ILT_Unknown ,
    ILT_Inventory ,
    ILT_Equipment ,
    ILT_BodySlot ,
    ILT_Item ,
    ILT_Mail ,
    ILT_Auction ,
    ILT_Skill ,
    ILT_Trade ,
    ILT_BodySlotInventory ,
    ILT_SendMail ,
    ILT_ShopBuy ,
    ILT_ShopSell ,
    ILT_ShopPaint ,
    ILT_ShopCrafting 
  };

  struct ReplicatedItem {
      var int DBID;
      var int ItemTypeID;
      var int StackSize;
      var byte Color1;
      var byte Color2;

  };


  var transient int DBID;
  var export transient editinline Item_Type Type;
  var transient byte Color1;
  var transient byte Color2;
  var transient float UseTime;
  var transient int StackSize;
  var transient byte Attuned;
  var transient int CharacterID;
  var transient byte LocationType;
  var transient int LocationID;
  var transient int LocationSlot;
  var transient byte TempLocationType;
  var transient int TempLocationID;
  var transient int TempLocationSlot;
  var export transient editinline Game_ItemManager itemManager;
  var private transient int mTokens;


  function Material GetLogo(Game_Pawn aPawn,optional bool aDragLogo) {
    local Material itemMaterial;
    local Material typeMaterial;
    local Appearance_Base typeAppearance;
    local ConstantColor itemColor;
    local Combiner itemCombiner01;
    local Combiner itemCombiner02;
    local Combiner cooldownCombiner;
    local TexScaler cooldownScaler;
    local TexScaler itemScaler;
    if (Type != None) {                                                         //0000 : 07 53 05 77 01 98 2F 22 11 2A 16 
      if (aDragLogo) {                                                          //000B : 07 31 00 2D 00 98 21 2C 11 
        typeMaterial = Type.GetDragLogo(aPawn);                                 //0014 : 0F 00 10 22 2C 11 19 01 98 2F 22 11 0B 00 04 1B 6C 05 00 00 00 98 19 2C 11 16 
      } else {                                                                  //002E : 06 4B 00 
        typeMaterial = Type.GetLogo(aPawn);                                     //0031 : 0F 00 10 22 2C 11 19 01 98 2F 22 11 0B 00 04 1B 71 0C 00 00 00 98 19 2C 11 16 
      }
      typeAppearance = Type.GetAppearance();                                    //004B : 0F 00 88 22 2C 11 19 01 98 2F 22 11 06 00 04 1C 00 A1 1A 11 16 
      if (typeMaterial != None && typeAppearance != None
        && (Type.ItemType == 16 || Type.ItemType == 17
        || Type.ItemType == 18
        || Type.ItemType == 19
        || Type.ItemType == 20
        || Type.ItemType == 21
        || Type.ItemType == 22
        || Type.ItemType == 23
        || Type.ItemType == 24
        || Type.ItemType == 34
        || Type.ItemType == 35
        || Type.ItemType == 25
        || Type.ItemType == 26
        || Type.ItemType == 27
        || Type.ItemType == 28
        || Type.ItemType == 29)
        && (typeAppearance.ColorMode == 1 || typeAppearance.ColorMode == 2)) {//0060 : 07 C6 03 82 82 82 77 00 10 22 2C 11 2A 16 18 09 00 77 00 88 22 2C 11 2A 16 16 18 AC 01 84 84 84 84 84 84 84 84 84 84 84 84 84 84 84 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 10 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 11 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 12 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 13 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 14 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 15 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 16 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 17 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 18 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 22 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 23 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 19 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 1A 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 1B 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 1C 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 1D 16 16 16 18 32 00 84 9A 39 3A 19 00 88 22 2C 11 05 00 01 01 C0 06 2C 11 39 3A 24 01 16 18 17 00 9A 39 3A 19 00 88 22 2C 11 05 00 01 01 C0 06 2C 11 39 3A 24 02 16 16 16 
        itemColor = new Class'ConstantColor';                                   //025E : 0F 00 00 23 2C 11 11 0B 0B 0B 20 C0 97 C3 00 
        if (typeAppearance.ColorMode == 2) {                                    //026D : 07 B5 02 9A 39 3A 19 00 88 22 2C 11 05 00 01 01 C0 06 2C 11 39 3A 24 02 16 
          itemColor.Color = typeAppearance.Palette2.GetPalColorAtIndex(Color2); //0286 : 0F 19 00 00 23 2C 11 05 00 04 01 78 23 2C 11 19 19 00 88 22 2C 11 05 00 04 01 28 6F 21 11 0B 00 04 1B 55 0E 00 00 01 F8 CA 22 11 16 
        } else {                                                                //02B2 : 06 E1 02 
          itemColor.Color = typeAppearance.Palette1.GetPalColorAtIndex(Color1); //02B5 : 0F 19 00 00 23 2C 11 05 00 04 01 78 23 2C 11 19 19 00 88 22 2C 11 05 00 04 01 B0 6E 21 11 0B 00 04 1B 55 0E 00 00 01 08 CA 22 11 16 
        }
        itemCombiner01 = new Class'Combiner';                                   //02E1 : 0F 00 F0 23 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        itemCombiner01.CombineOperation = 2;                                    //02F0 : 0F 19 00 F0 23 2C 11 05 00 01 01 88 41 2C 11 24 02 
        itemCombiner01.AlphaOperation = 0;                                      //0301 : 0F 19 00 F0 23 2C 11 05 00 01 01 00 42 2C 11 24 00 
        itemCombiner01.Material1 = typeMaterial;                                //0312 : 0F 19 00 F0 23 2C 11 05 00 04 01 78 42 2C 11 00 10 22 2C 11 
        itemCombiner01.Material2 = itemColor;                                   //0326 : 0F 19 00 F0 23 2C 11 05 00 04 01 F0 42 2C 11 00 00 23 2C 11 
        itemCombiner02 = new Class'Combiner';                                   //033A : 0F 00 68 24 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        itemCombiner02.CombineOperation = 5;                                    //0349 : 0F 19 00 68 24 2C 11 05 00 01 01 88 41 2C 11 24 05 
        itemCombiner02.AlphaOperation = 0;                                      //035A : 0F 19 00 68 24 2C 11 05 00 01 01 00 42 2C 11 24 00 
        itemCombiner02.Material1 = itemCombiner01;                              //036B : 0F 19 00 68 24 2C 11 05 00 04 01 78 42 2C 11 00 F0 23 2C 11 
        itemCombiner02.Material2 = typeMaterial;                                //037F : 0F 19 00 68 24 2C 11 05 00 04 01 F0 42 2C 11 00 10 22 2C 11 
        itemCombiner02.Mask = typeMaterial;                                     //0393 : 0F 19 00 68 24 2C 11 05 00 04 01 68 43 2C 11 00 10 22 2C 11 
        itemCombiner02.InvertMask = True;                                       //03A7 : 14 19 00 68 24 2C 11 06 00 04 2D 01 E0 24 2C 11 27 
        itemMaterial = itemCombiner02;                                          //03B8 : 0F 00 58 25 2C 11 00 68 24 2C 11 
      } else {                                                                  //03C3 : 06 D1 03 
        itemMaterial = typeMaterial;                                            //03C6 : 0F 00 58 25 2C 11 00 10 22 2C 11 
      }
      if (Type.UseCooldown > 0 && !aDragLogo) {                                 //03D1 : 07 4D 05 82 B1 19 01 98 2F 22 11 05 00 04 01 F8 E0 2B 11 39 3F 25 16 18 09 00 81 2D 00 98 21 2C 11 16 16 
        cooldownScaler = new Class'TexScaler';                                  //03F4 : 0F 00 D0 25 2C 11 11 0B 0B 0B 20 80 BC C3 00 
        cooldownScaler.UScale = 8.00000000;                                     //0403 : 0F 19 00 D0 25 2C 11 05 00 04 01 48 26 2C 11 1E 00 00 00 41 
        cooldownScaler.VScale = 8.00000000;                                     //0417 : 0F 19 00 D0 25 2C 11 05 00 04 01 C0 26 2C 11 1E 00 00 00 41 
        cooldownScaler.UOffset = 224.00000000;                                  //042B : 0F 19 00 D0 25 2C 11 05 00 04 01 38 27 2C 11 1E 00 00 60 43 
        cooldownScaler.VOffset = 224.00000000;                                  //043F : 0F 19 00 D0 25 2C 11 05 00 04 01 B0 27 2C 11 1E 00 00 60 43 
        cooldownScaler.Material = Texture'BodyslotCooldown';                    //0453 : 0F 19 00 D0 25 2C 11 05 00 04 01 28 28 2C 11 20 A0 28 2C 11 
        cooldownCombiner = new Class'Combiner';                                 //0467 : 0F 00 78 29 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        cooldownCombiner.Material1 = itemMaterial;                              //0476 : 0F 19 00 78 29 2C 11 05 00 04 01 78 42 2C 11 00 58 25 2C 11 
        cooldownCombiner.Material2 = cooldownScaler;                            //048A : 0F 19 00 78 29 2C 11 05 00 04 01 F0 42 2C 11 00 D0 25 2C 11 
        cooldownCombiner.Mask = cooldownScaler;                                 //049E : 0F 19 00 78 29 2C 11 05 00 04 01 68 43 2C 11 00 D0 25 2C 11 
        cooldownCombiner.CombineOperation = 5;                                  //04B2 : 0F 19 00 78 29 2C 11 05 00 01 01 88 41 2C 11 24 05 
        cooldownCombiner.AlphaOperation = 0;                                    //04C3 : 0F 19 00 78 29 2C 11 05 00 01 01 00 42 2C 11 24 00 
        itemScaler = new Class'TexScaler';                                      //04D4 : 0F 00 F0 29 2C 11 11 0B 0B 0B 20 80 BC C3 00 
        itemScaler.UScale = 0.12500000;                                         //04E3 : 0F 19 00 F0 29 2C 11 05 00 04 01 48 26 2C 11 1E 00 00 00 3E 
        itemScaler.VScale = 0.12500000;                                         //04F7 : 0F 19 00 F0 29 2C 11 05 00 04 01 C0 26 2C 11 1E 00 00 00 3E 
        itemScaler.UOffset = 0.00000000;                                        //050B : 0F 19 00 F0 29 2C 11 05 00 04 01 38 27 2C 11 1E 00 00 00 00 
        itemScaler.VOffset = 0.00000000;                                        //051F : 0F 19 00 F0 29 2C 11 05 00 04 01 B0 27 2C 11 1E 00 00 00 00 
        itemScaler.Material = cooldownCombiner;                                 //0533 : 0F 19 00 F0 29 2C 11 05 00 04 01 28 28 2C 11 00 78 29 2C 11 
        return itemScaler;                                                      //0547 : 04 00 F0 29 2C 11 
      }
      return itemMaterial;                                                      //054D : 04 00 58 25 2C 11 
    }
    return None;                                                                //0553 : 04 2A 
    //07 53 05 77 01 98 2F 22 11 2A 16 07 31 00 2D 00 98 21 2C 11 0F 00 10 22 2C 11 19 01 98 2F 22 11 
    //0B 00 04 1B 6C 05 00 00 00 98 19 2C 11 16 06 4B 00 0F 00 10 22 2C 11 19 01 98 2F 22 11 0B 00 04 
    //1B 71 0C 00 00 00 98 19 2C 11 16 0F 00 88 22 2C 11 19 01 98 2F 22 11 06 00 04 1C 00 A1 1A 11 16 
    //07 C6 03 82 82 82 77 00 10 22 2C 11 2A 16 18 09 00 77 00 88 22 2C 11 2A 16 16 18 AC 01 84 84 84 
    //84 84 84 84 84 84 84 84 84 84 84 84 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 
    //10 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 11 16 16 18 17 00 9A 
    //39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 12 16 16 18 17 00 9A 39 3A 19 01 98 2F 
    //22 11 05 00 01 01 10 30 22 11 39 3A 24 13 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 
    //10 30 22 11 39 3A 24 14 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 
    //24 15 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 16 16 16 18 17 
    //00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 17 16 16 18 17 00 9A 39 3A 19 01 
    //98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 18 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 
    //01 01 10 30 22 11 39 3A 24 22 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 
    //39 3A 24 23 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 19 16 16 
    //18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 1A 16 16 18 17 00 9A 39 3A 
    //19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 1B 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 
    //05 00 01 01 10 30 22 11 39 3A 24 1C 16 16 18 17 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 
    //22 11 39 3A 24 1D 16 16 16 18 32 00 84 9A 39 3A 19 00 88 22 2C 11 05 00 01 01 C0 06 2C 11 39 3A 
    //24 01 16 18 17 00 9A 39 3A 19 00 88 22 2C 11 05 00 01 01 C0 06 2C 11 39 3A 24 02 16 16 16 0F 00 
    //00 23 2C 11 11 0B 0B 0B 20 C0 97 C3 00 07 B5 02 9A 39 3A 19 00 88 22 2C 11 05 00 01 01 C0 06 2C 
    //11 39 3A 24 02 16 0F 19 00 00 23 2C 11 05 00 04 01 78 23 2C 11 19 19 00 88 22 2C 11 05 00 04 01 
    //28 6F 21 11 0B 00 04 1B 55 0E 00 00 01 F8 CA 22 11 16 06 E1 02 0F 19 00 00 23 2C 11 05 00 04 01 
    //78 23 2C 11 19 19 00 88 22 2C 11 05 00 04 01 B0 6E 21 11 0B 00 04 1B 55 0E 00 00 01 08 CA 22 11 
    //16 0F 00 F0 23 2C 11 11 0B 0B 0B 20 40 8D C3 00 0F 19 00 F0 23 2C 11 05 00 01 01 88 41 2C 11 24 
    //02 0F 19 00 F0 23 2C 11 05 00 01 01 00 42 2C 11 24 00 0F 19 00 F0 23 2C 11 05 00 04 01 78 42 2C 
    //11 00 10 22 2C 11 0F 19 00 F0 23 2C 11 05 00 04 01 F0 42 2C 11 00 00 23 2C 11 0F 00 68 24 2C 11 
    //11 0B 0B 0B 20 40 8D C3 00 0F 19 00 68 24 2C 11 05 00 01 01 88 41 2C 11 24 05 0F 19 00 68 24 2C 
    //11 05 00 01 01 00 42 2C 11 24 00 0F 19 00 68 24 2C 11 05 00 04 01 78 42 2C 11 00 F0 23 2C 11 0F 
    //19 00 68 24 2C 11 05 00 04 01 F0 42 2C 11 00 10 22 2C 11 0F 19 00 68 24 2C 11 05 00 04 01 68 43 
    //2C 11 00 10 22 2C 11 14 19 00 68 24 2C 11 06 00 04 2D 01 E0 24 2C 11 27 0F 00 58 25 2C 11 00 68 
    //24 2C 11 06 D1 03 0F 00 58 25 2C 11 00 10 22 2C 11 07 4D 05 82 B1 19 01 98 2F 22 11 05 00 04 01 
    //F8 E0 2B 11 39 3F 25 16 18 09 00 81 2D 00 98 21 2C 11 16 16 0F 00 D0 25 2C 11 11 0B 0B 0B 20 80 
    //BC C3 00 0F 19 00 D0 25 2C 11 05 00 04 01 48 26 2C 11 1E 00 00 00 41 0F 19 00 D0 25 2C 11 05 00 
    //04 01 C0 26 2C 11 1E 00 00 00 41 0F 19 00 D0 25 2C 11 05 00 04 01 38 27 2C 11 1E 00 00 60 43 0F 
    //19 00 D0 25 2C 11 05 00 04 01 B0 27 2C 11 1E 00 00 60 43 0F 19 00 D0 25 2C 11 05 00 04 01 28 28 
    //2C 11 20 A0 28 2C 11 0F 00 78 29 2C 11 11 0B 0B 0B 20 40 8D C3 00 0F 19 00 78 29 2C 11 05 00 04 
    //01 78 42 2C 11 00 58 25 2C 11 0F 19 00 78 29 2C 11 05 00 04 01 F0 42 2C 11 00 D0 25 2C 11 0F 19 
    //00 78 29 2C 11 05 00 04 01 68 43 2C 11 00 D0 25 2C 11 0F 19 00 78 29 2C 11 05 00 01 01 88 41 2C 
    //11 24 05 0F 19 00 78 29 2C 11 05 00 01 01 00 42 2C 11 24 00 0F 00 F0 29 2C 11 11 0B 0B 0B 20 80 
    //BC C3 00 0F 19 00 F0 29 2C 11 05 00 04 01 48 26 2C 11 1E 00 00 00 3E 0F 19 00 F0 29 2C 11 05 00 
    //04 01 C0 26 2C 11 1E 00 00 00 3E 0F 19 00 F0 29 2C 11 05 00 04 01 38 27 2C 11 1E 00 00 00 00 0F 
    //19 00 F0 29 2C 11 05 00 04 01 B0 27 2C 11 1E 00 00 00 00 0F 19 00 F0 29 2C 11 05 00 04 01 28 28 
    //2C 11 00 78 29 2C 11 04 00 F0 29 2C 11 04 00 58 25 2C 11 04 2A 04 0B 47 
  }


  final native function bool CanRemoveSigils(out byte outErrorMessage,out int outRemovalCost);


  final native function bool CanForgeSigil(Game_Item aTokenItem,int aLocationSlot,out byte outErrorMessage,out int outForgeCost,out int outSlotTaken);


  final native function int GetSigilsRemovalCost();


  final native function AddToken(Game_Item aTokenItem,int aLocationSlot);


  final native function sv_StopTokens();


  final native event sv_StartTokens();


  final native function int GetTokenCount();


  final native function int GetTokenSlotCount();


  final native function Game_Item GetToken(int aLocationSlot);


  final native event int GetBreakdownValue();


  final native event int GetSellValue();


  event OnUnequip() {
    if (Type != None) {                                                         //0000 : 07 21 00 77 01 98 2F 22 11 2A 16 
      Type.OnUnequip(GetPawn(),self);                                           //000B : 19 01 98 2F 22 11 0D 00 00 1B FC 05 00 00 1C 38 33 2E 11 16 17 16 
    }
    //07 21 00 77 01 98 2F 22 11 2A 16 19 01 98 2F 22 11 0D 00 00 1B FC 05 00 00 1C 38 33 2E 11 16 17 
    //16 04 0B 47 
  }


  event OnEquip() {
    local Game_Pawn Pawn;
    if (Type != None) {                                                         //0000 : 07 2C 00 77 01 98 2F 22 11 2A 16 
      Pawn = GetPawn();                                                         //000B : 0F 00 98 34 2E 11 1C 38 33 2E 11 16 
      Type.OnEquip(Pawn,self);                                                  //0017 : 19 01 98 2F 22 11 0C 00 00 1B C3 05 00 00 00 98 34 2E 11 17 16 
    }
    //07 2C 00 77 01 98 2F 22 11 2A 16 0F 00 98 34 2E 11 1C 38 33 2E 11 16 19 01 98 2F 22 11 0C 00 00 
    //1B C3 05 00 00 00 98 34 2E 11 17 16 04 0B 47 
  }


  event OnItemUsed() {
    UseTime = GetPawn().Level.TimeSeconds;                                      //0000 : 0F 01 28 36 2E 11 19 19 1C 38 33 2E 11 16 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    if (GetPawn().SBRole == 1
      && Game_PlayerItemManager(itemManager) != None) {//001E : 07 63 00 82 9A 39 3A 19 1C 38 33 2E 11 16 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 18 0E 00 77 2E F0 92 5F 01 01 A0 36 2E 11 2A 16 16 
      Game_PlayerItemManager(itemManager).sv2cl_UsedItem_CallStub(DBID);        //004A : 19 2E F0 92 5F 01 01 A0 36 2E 11 0B 00 00 1B B4 0D 00 00 01 18 1F 22 11 16 
    }
    //0F 01 28 36 2E 11 19 19 1C 38 33 2E 11 16 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 07 63 
    //00 82 9A 39 3A 19 1C 38 33 2E 11 16 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 18 0E 00 77 2E F0 92 
    //5F 01 01 A0 36 2E 11 2A 16 16 19 2E F0 92 5F 01 01 A0 36 2E 11 0B 00 00 1B B4 0D 00 00 01 18 1F 
    //22 11 16 04 0B 47 
  }


  event OnUse() {
    local Game_Pawn Pawn;
    if (Type != None) {                                                         //0000 : 07 73 00 77 01 98 2F 22 11 2A 16 
      if (Type.ItemType == 37) {                                                //000B : 07 47 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 25 16 
        if (itemManager != None) {                                              //0024 : 07 44 00 77 01 A0 36 2E 11 2A 16 
          Game_PlayerItemManager(itemManager).sv_UseItem(self);                 //002F : 19 2E F0 92 5F 01 01 A0 36 2E 11 07 00 04 1C E0 37 26 11 17 16 
        }
      } else {                                                                  //0044 : 06 73 00 
        Pawn = GetPawn();                                                       //0047 : 0F 00 C8 37 2E 11 1C 38 33 2E 11 16 
        if (Pawn != None) {                                                     //0053 : 07 73 00 77 00 C8 37 2E 11 2A 16 
          Type.OnUse(Pawn,self);                                                //005E : 19 01 98 2F 22 11 0C 00 00 1B FF 05 00 00 00 C8 37 2E 11 17 16 
        }
      }
    }
    //07 73 00 77 01 98 2F 22 11 2A 16 07 47 00 9A 39 3A 19 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 
    //3A 24 25 16 07 44 00 77 01 A0 36 2E 11 2A 16 19 2E F0 92 5F 01 01 A0 36 2E 11 07 00 04 1C E0 37 
    //26 11 17 16 06 73 00 0F 00 C8 37 2E 11 1C 38 33 2E 11 16 07 73 00 77 00 C8 37 2E 11 2A 16 19 01 
    //98 2F 22 11 0C 00 00 1B FF 05 00 00 00 C8 37 2E 11 17 16 04 0B 47 
  }


  event bool CanEquip() {
    if (Type != None) {                                                         //0000 : 07 22 00 77 01 98 2F 22 11 2A 16 
      return Type.CanEquip(GetPawn(),self);                                     //000B : 04 19 01 98 2F 22 11 0D 00 04 1B 86 04 00 00 1C 38 33 2E 11 16 17 16 
    }
    return False;                                                               //0022 : 04 28 
    //07 22 00 77 01 98 2F 22 11 2A 16 04 19 01 98 2F 22 11 0D 00 04 1B 86 04 00 00 1C 38 33 2E 11 16 
    //17 16 04 28 04 0B 47 
  }


  event bool CanUse() {
    if (UseTime > 0
      && UseTime + Type.UseCooldown > GetPawn().Level.TimeSeconds) {//0000 : 07 43 00 82 B1 01 28 36 2E 11 39 3F 25 16 18 30 00 B1 AE 01 28 36 2E 11 19 01 98 2F 22 11 05 00 04 01 F8 E0 2B 11 16 19 19 1C 38 33 2E 11 16 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 16 
      return False;                                                             //0041 : 04 28 
    }
    if (Type != None) {                                                         //0043 : 07 65 00 77 01 98 2F 22 11 2A 16 
      return Type.sv_CanUse(GetPawn(),self);                                    //004E : 04 19 01 98 2F 22 11 0D 00 04 1B FF 06 00 00 1C 38 33 2E 11 16 17 16 
    }
    return False;                                                               //0065 : 04 28 
    //07 43 00 82 B1 01 28 36 2E 11 39 3F 25 16 18 30 00 B1 AE 01 28 36 2E 11 19 01 98 2F 22 11 05 00 
    //04 01 F8 E0 2B 11 16 19 19 1C 38 33 2E 11 16 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 
    //16 04 28 07 65 00 77 01 98 2F 22 11 2A 16 04 19 01 98 2F 22 11 0D 00 04 1B FF 06 00 00 1C 38 33 
    //2E 11 16 17 16 04 28 04 0B 47 
  }


  final native function ReplicatedItem GetReplicated();


  final native function Game_Pawn GetItemManager();


  final native function Game_Pawn GetPawn();



