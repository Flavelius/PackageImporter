//==============================================================================
//  Item_Type
//==============================================================================

class Item_Type extends Content_Type
    native
    exportstructs
    dependsOn(Combiner,Shader,Material,Texture,IC_Broken,IC_Recipe,Class,StringReferences,Item_Component,Game_Item,Content_Requirement,Game_Pawn,Game_CharacterStats)
  ;

  enum EItemType {
    IT_BodySlot ,
    IT_JewelryRing ,
    IT_JewelryNecklace ,
    IT_JewelryQualityToken ,
    IT_WeaponQualityToken ,
    IT_SkillToken ,
    IT_QuestItem ,
    IT_Trophy ,
    IT_ContainerSuitBag ,
    IT_ContainerExtraInventory ,
    IT_Resource ,
    IT_WeaponOneHanded ,
    IT_WeaponDoublehanded ,
    IT_WeaponDualWielding ,
    IT_WeaponRanged ,
    IT_WeaponShield ,
    IT_ArmorHeadGear ,
    IT_ArmorLeftShoulder ,
    IT_ArmorRightShoulder ,
    IT_ArmorLeftGauntlet ,
    IT_ArmorRightGauntlet ,
    IT_ArmorChest ,
    IT_ArmorBelt ,
    IT_ArmorLeftThigh ,
    IT_ArmorLeftShin ,
    IT_ClothChest ,
    IT_ClothLeftGlove ,
    IT_ClothRightGlove ,
    IT_ClothPants ,
    IT_ClothShoes ,
    IT_MiscellaneousTickets ,
    IT_MiscellaneousKey ,
    IT_MiscellaneousLabyrinthKey ,
    IT_Recipe ,
    IT_ArmorRightThigh ,
    IT_ArmorRightShin ,
    IT_ItemToken ,
    IT_Consumable ,
    IT_Broken 
  };

  enum EItemRarity {
    IR_Trash ,
    IR_Resource ,
    IR_Common ,
    IR_Uncommon ,
    IR_Rare ,
    IR_Ancestral ,
    IR_Mumian 
  };

  var const array<Item_Component> Components;
  var (ReadOnly) const editconst Texture Logo;
  var (ReadOnly) const editconst Texture SecondaryLogo;
  var private transient bool RequiresTicksValue;
  var private transient bool RequiresTicksDetermined;
  var (ReadOnly) const editconst byte ItemType;
  var (General) const int StackableAmount;
  var (General) const bool Tradable;
  var (General) const bool RecyclableIntoMoney;
  var (General) const bool Sellable;
  var (General) const byte EquipmentSlot;
  var (General) const bool Equipable;
  var (General) const bool BindOnPickup;
  var (General) const bool BindOnEquip;
  var (General) const byte ItemRarity;
  var (General) private const int BuyPriceValue;
  var (General) private const int SellPriceValue;
  var (General) private const int RecyclePriceValue;
  var (General) const byte MinLevel;
  var const array<Content_Requirement> Requirements;
  var (Info) const LocalizedString Name;
  var (Info) const LocalizedString Description;
  var (OnUse) const float UseCooldown;
  var const editinline deprecated array<Content_Event> UseEvents;


  final event int GetBreakdownValue() {
    return RecyclePriceValue;                                                   //0000 : 04 01 88 D8 2B 11 
    //04 01 88 D8 2B 11 04 0B 47 
  }


  final event int GetSellValue() {
    return SellPriceValue;                                                      //0000 : 04 01 B0 D9 2B 11 
    //04 01 B0 D9 2B 11 04 0B 47 
  }


  final event int GetBuyPrice() {
    return BuyPriceValue;                                                       //0000 : 04 01 88 DB 2B 11 
    //04 01 88 DB 2B 11 04 0B 47 
  }


  event Material GetDragLogo(Game_Pawn aPawn) {
    local Shader tempShader;
    local Combiner tempCombiner;
    if (ItemType == 5) {                                                        //0000 : 07 30 00 9A 39 3A 01 10 30 22 11 39 3A 24 05 16 
      if (ShouldUseSecondaryLogo(aPawn)) {                                      //0010 : 07 27 00 1C B0 DE 2B 11 00 B0 DC 2B 11 16 
        return SecondaryLogo;                                                   //001E : 04 01 60 DF 2B 11 
      } else {                                                                  //0024 : 06 2D 00 
        return Logo;                                                            //0027 : 04 01 08 40 2C 11 
      }
    } else {                                                                    //002D : 06 F9 00 
      if (ItemType == 36) {                                                     //0030 : 07 ED 00 9A 39 3A 01 10 30 22 11 39 3A 24 24 16 
        tempCombiner = new Class'Combiner';                                     //0040 : 0F 00 80 40 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        tempCombiner.CombineOperation = 5;                                      //004F : 0F 19 00 80 40 2C 11 05 00 01 01 88 41 2C 11 24 05 
        tempCombiner.AlphaOperation = 0;                                        //0060 : 0F 19 00 80 40 2C 11 05 00 01 01 00 42 2C 11 24 00 
        tempCombiner.Material1 = Logo;                                          //0071 : 0F 19 00 80 40 2C 11 05 00 04 01 78 42 2C 11 01 08 40 2C 11 
        tempCombiner.Material2 = SecondaryLogo;                                 //0085 : 0F 19 00 80 40 2C 11 05 00 04 01 F0 42 2C 11 01 60 DF 2B 11 
        tempCombiner.Mask = SecondaryLogo;                                      //0099 : 0F 19 00 80 40 2C 11 05 00 04 01 68 43 2C 11 01 60 DF 2B 11 
        tempShader = new Class'Shader';                                         //00AD : 0F 00 E0 43 2C 11 11 0B 0B 0B 20 00 88 C3 00 
        tempShader.Diffuse = tempCombiner;                                      //00BC : 0F 19 00 E0 43 2C 11 05 00 04 01 D0 5B 37 0F 00 80 40 2C 11 
        tempShader.Opacity = Logo;                                              //00D0 : 0F 19 00 E0 43 2C 11 05 00 04 01 58 44 2C 11 01 08 40 2C 11 
        return tempShader;                                                      //00E4 : 04 00 E0 43 2C 11 
      } else {                                                                  //00EA : 06 F9 00 
        return GetLogo(aPawn);                                                  //00ED : 04 1B 71 0C 00 00 00 B0 DC 2B 11 16 
      }
    }
    //07 30 00 9A 39 3A 01 10 30 22 11 39 3A 24 05 16 07 27 00 1C B0 DE 2B 11 00 B0 DC 2B 11 16 04 01 
    //60 DF 2B 11 06 2D 00 04 01 08 40 2C 11 06 F9 00 07 ED 00 9A 39 3A 01 10 30 22 11 39 3A 24 24 16 
    //0F 00 80 40 2C 11 11 0B 0B 0B 20 40 8D C3 00 0F 19 00 80 40 2C 11 05 00 01 01 88 41 2C 11 24 05 
    //0F 19 00 80 40 2C 11 05 00 01 01 00 42 2C 11 24 00 0F 19 00 80 40 2C 11 05 00 04 01 78 42 2C 11 
    //01 08 40 2C 11 0F 19 00 80 40 2C 11 05 00 04 01 F0 42 2C 11 01 60 DF 2B 11 0F 19 00 80 40 2C 11 
    //05 00 04 01 68 43 2C 11 01 60 DF 2B 11 0F 00 E0 43 2C 11 11 0B 0B 0B 20 00 88 C3 00 0F 19 00 E0 
    //43 2C 11 05 00 04 01 D0 5B 37 0F 00 80 40 2C 11 0F 19 00 E0 43 2C 11 05 00 04 01 58 44 2C 11 01 
    //08 40 2C 11 04 00 E0 43 2C 11 06 F9 00 04 1B 71 0C 00 00 00 B0 DC 2B 11 16 04 0B 47 
  }


  function Material GetLogo(Game_Pawn aPawn) {
    local Material itemMaterial;
    local export editinline IC_Broken componentBroken;
    local export editinline IC_Recipe componentRecipe;
    local Combiner Combiner01;
    local Combiner combiner02;
    if (aPawn != None) {                                                        //0000 : 07 E5 04 77 00 F8 45 2C 11 2A 16 
      if (ShouldUseSecondaryLogo(aPawn)) {                                      //000B : 07 27 00 1C B0 DE 2B 11 00 F8 45 2C 11 16 
        itemMaterial = SecondaryLogo;                                           //0019 : 0F 00 70 46 2C 11 01 60 DF 2B 11 
      } else {                                                                  //0024 : 06 32 00 
        itemMaterial = Logo;                                                    //0027 : 0F 00 70 46 2C 11 01 08 40 2C 11 
      }
      if (itemMaterial.IsA('Texture')) {                                        //0032 : 07 72 00 19 00 70 46 2C 11 08 00 04 61 2F 21 39 03 00 00 16 
        Texture(itemMaterial).UClampMode = 2;                                   //0046 : 0F 19 2E B8 3A D6 00 00 70 46 2C 11 05 00 01 01 D8 48 70 0F 24 02 
        Texture(itemMaterial).VClampMode = 2;                                   //005C : 0F 19 2E B8 3A D6 00 00 70 46 2C 11 05 00 01 01 A0 49 70 0F 24 02 
      }
      if (ItemType == 38) {                                                     //0072 : 07 8F 02 9A 39 3A 01 10 30 22 11 39 3A 24 26 16 
        componentBroken = IC_Broken(GetComponentByClass(Class'IC_Broken'));     //0082 : 0F 00 E8 46 2C 11 2E B8 44 5C 01 1C 00 31 22 11 20 B8 44 5C 01 16 
        if (componentBroken != None && componentBroken.Recipe != None) {        //0098 : 07 25 01 82 77 00 E8 46 2C 11 2A 16 18 12 00 77 19 00 E8 46 2C 11 05 00 04 01 B0 31 22 11 2A 16 16 
          componentRecipe = IC_Recipe(componentBroken.Recipe.GetComponentByClass(Class'IC_Recipe'));//00B9 : 0F 00 60 47 2C 11 2E B8 2F 5C 01 19 19 00 E8 46 2C 11 05 00 04 01 B0 31 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 
          if (componentRecipe != None
            && componentRecipe.ProducedItem != None) {//00E1 : 07 25 01 82 77 00 60 47 2C 11 2A 16 18 12 00 77 19 00 60 47 2C 11 05 00 04 01 D8 47 2C 11 2A 16 16 
            itemMaterial = componentRecipe.ProducedItem.GetLogo(aPawn);         //0102 : 0F 00 70 46 2C 11 19 19 00 60 47 2C 11 05 00 04 01 D8 47 2C 11 0B 00 04 1B 71 0C 00 00 00 F8 45 2C 11 16 
          }
        }
        Combiner01 = new Class'Combiner';                                       //0125 : 0F 00 50 48 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        Combiner01.CombineOperation = 2;                                        //0134 : 0F 19 00 50 48 2C 11 05 00 01 01 88 41 2C 11 24 02 
        Combiner01.AlphaOperation = 2;                                          //0145 : 0F 19 00 50 48 2C 11 05 00 01 01 00 42 2C 11 24 02 
        Combiner01.Material1 = itemMaterial;                                    //0156 : 0F 19 00 50 48 2C 11 05 00 04 01 78 42 2C 11 00 70 46 2C 11 
        switch (GetResourceId() % 8) {                                          //016A : 05 04 AD 39 3F 1C 08 90 20 11 16 39 3F 2C 08 16 
          case 0.00000000 :                                                     //017A : 0A 99 01 1E 00 00 00 00 
            Combiner01.Material2 = Texture'crack-01';                           //0182 : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 98 1D 2E 11 
            break;                                                              //0196 : 06 75 02 
          case 1.00000000 :                                                     //0199 : 0A B8 01 1E 00 00 80 3F 
            Combiner01.Material2 = Texture'crack-02';                           //01A1 : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 70 1E 2E 11 
            break;                                                              //01B5 : 06 75 02 
          case 2.00000000 :                                                     //01B8 : 0A D7 01 1E 00 00 00 40 
            Combiner01.Material2 = Texture'crack-03';                           //01C0 : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 48 1F 2E 11 
            break;                                                              //01D4 : 06 75 02 
          case 3.00000000 :                                                     //01D7 : 0A F6 01 1E 00 00 40 40 
            Combiner01.Material2 = Texture'crack-04';                           //01DF : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 20 2E 11 
            break;                                                              //01F3 : 06 75 02 
          case 4.00000000 :                                                     //01F6 : 0A 15 02 1E 00 00 80 40 
            Combiner01.Material2 = Texture'crack-05';                           //01FE : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 21 2E 11 
            break;                                                              //0212 : 06 75 02 
          case 5.00000000 :                                                     //0215 : 0A 34 02 1E 00 00 A0 40 
            Combiner01.Material2 = Texture'crack-06';                           //021D : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 22 2E 11 
            break;                                                              //0231 : 06 75 02 
          case 6.00000000 :                                                     //0234 : 0A 53 02 1E 00 00 C0 40 
            Combiner01.Material2 = Texture'crack-07';                           //023C : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 23 2E 11 
            break;                                                              //0250 : 06 75 02 
          case 7.00000000 :                                                     //0253 : 0A 72 02 1E 00 00 E0 40 
            Combiner01.Material2 = Texture'crack-08';                           //025B : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 24 2E 11 
            break;                                                              //026F : 06 75 02 
          default:                                                              //0272 : 0A FF FF 
        }
        Combiner01.Mask = itemMaterial;                                         //0275 : 0F 19 00 50 48 2C 11 05 00 04 01 68 43 2C 11 00 70 46 2C 11 
        return Combiner01;                                                      //0289 : 04 00 50 48 2C 11 
      }
      if (ItemType == 33) {                                                     //028F : 07 6C 03 9A 39 3A 01 10 30 22 11 39 3A 24 21 16 
        componentRecipe = IC_Recipe(GetComponentByClass(Class'IC_Recipe'));     //029F : 0F 00 60 47 2C 11 2E B8 2F 5C 01 1C 00 31 22 11 20 B8 2F 5C 01 16 
        if (componentRecipe != None
          && componentRecipe.ProducedItem != None) {//02B5 : 07 F9 02 82 77 00 60 47 2C 11 2A 16 18 12 00 77 19 00 60 47 2C 11 05 00 04 01 D8 47 2C 11 2A 16 16 
          itemMaterial = componentRecipe.ProducedItem.GetLogo(aPawn);           //02D6 : 0F 00 70 46 2C 11 19 19 00 60 47 2C 11 05 00 04 01 D8 47 2C 11 0B 00 04 1B 71 0C 00 00 00 F8 45 2C 11 16 
        }
        Combiner01 = new Class'Combiner';                                       //02F9 : 0F 00 50 48 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        Combiner01.CombineOperation = 5;                                        //0308 : 0F 19 00 50 48 2C 11 05 00 01 01 88 41 2C 11 24 05 
        Combiner01.AlphaOperation = 0;                                          //0319 : 0F 19 00 50 48 2C 11 05 00 01 01 00 42 2C 11 24 00 
        Combiner01.Material1 = itemMaterial;                                    //032A : 0F 19 00 50 48 2C 11 05 00 04 01 78 42 2C 11 00 70 46 2C 11 
        Combiner01.Material2 = Texture'Recipe_Overlay';                         //033E : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 25 2E 11 
        Combiner01.Mask = Texture'Recipe_Overlay';                              //0352 : 0F 19 00 50 48 2C 11 05 00 04 01 68 43 2C 11 20 20 25 2E 11 
        return Combiner01;                                                      //0366 : 04 00 50 48 2C 11 
      }
      if (ItemType == 5) {                                                      //036C : 07 EF 03 9A 39 3A 01 10 30 22 11 39 3A 24 05 16 
        Combiner01 = new Class'Combiner';                                       //037C : 0F 00 50 48 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        Combiner01.CombineOperation = 5;                                        //038B : 0F 19 00 50 48 2C 11 05 00 01 01 88 41 2C 11 24 05 
        Combiner01.AlphaOperation = 0;                                          //039C : 0F 19 00 50 48 2C 11 05 00 01 01 00 42 2C 11 24 00 
        Combiner01.Material1 = Texture'SigilSlot_B';                            //03AD : 0F 19 00 50 48 2C 11 05 00 04 01 78 42 2C 11 20 20 26 2E 11 
        Combiner01.Material2 = itemMaterial;                                    //03C1 : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 00 70 46 2C 11 
        Combiner01.Mask = itemMaterial;                                         //03D5 : 0F 19 00 50 48 2C 11 05 00 04 01 68 43 2C 11 00 70 46 2C 11 
        return Combiner01;                                                      //03E9 : 04 00 50 48 2C 11 
      }
      if (ItemType == 36) {                                                     //03EF : 07 DF 04 9A 39 3A 01 10 30 22 11 39 3A 24 24 16 
        Combiner01 = new Class'Combiner';                                       //03FF : 0F 00 50 48 2C 11 11 0B 0B 0B 20 40 8D C3 00 
        Combiner01.CombineOperation = 5;                                        //040E : 0F 19 00 50 48 2C 11 05 00 01 01 88 41 2C 11 24 05 
        Combiner01.AlphaOperation = 0;                                          //041F : 0F 19 00 50 48 2C 11 05 00 01 01 00 42 2C 11 24 00 
        Combiner01.Material1 = Logo;                                            //0430 : 0F 19 00 50 48 2C 11 05 00 04 01 78 42 2C 11 01 08 40 2C 11 
        Combiner01.Material2 = SecondaryLogo;                                   //0444 : 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 01 60 DF 2B 11 
        Combiner01.Mask = SecondaryLogo;                                        //0458 : 0F 19 00 50 48 2C 11 05 00 04 01 68 43 2C 11 01 60 DF 2B 11 
        combiner02 = new Class'Combiner';                                       //046C : 0F 00 20 27 2E 11 11 0B 0B 0B 20 40 8D C3 00 
        combiner02.CombineOperation = 5;                                        //047B : 0F 19 00 20 27 2E 11 05 00 01 01 88 41 2C 11 24 05 
        combiner02.AlphaOperation = 0;                                          //048C : 0F 19 00 20 27 2E 11 05 00 01 01 00 42 2C 11 24 00 
        combiner02.Material1 = Texture'SigilBackplate';                         //049D : 0F 19 00 20 27 2E 11 05 00 04 01 78 42 2C 11 20 98 27 2E 11 
        combiner02.Material2 = Combiner01;                                      //04B1 : 0F 19 00 20 27 2E 11 05 00 04 01 F0 42 2C 11 00 50 48 2C 11 
        combiner02.Mask = Logo;                                                 //04C5 : 0F 19 00 20 27 2E 11 05 00 04 01 68 43 2C 11 01 08 40 2C 11 
        return combiner02;                                                      //04D9 : 04 00 20 27 2E 11 
      }
      return itemMaterial;                                                      //04DF : 04 00 70 46 2C 11 
    }
    return None;                                                                //04E5 : 04 2A 
    //07 E5 04 77 00 F8 45 2C 11 2A 16 07 27 00 1C B0 DE 2B 11 00 F8 45 2C 11 16 0F 00 70 46 2C 11 01 
    //60 DF 2B 11 06 32 00 0F 00 70 46 2C 11 01 08 40 2C 11 07 72 00 19 00 70 46 2C 11 08 00 04 61 2F 
    //21 39 03 00 00 16 0F 19 2E B8 3A D6 00 00 70 46 2C 11 05 00 01 01 D8 48 70 0F 24 02 0F 19 2E B8 
    //3A D6 00 00 70 46 2C 11 05 00 01 01 A0 49 70 0F 24 02 07 8F 02 9A 39 3A 01 10 30 22 11 39 3A 24 
    //26 16 0F 00 E8 46 2C 11 2E B8 44 5C 01 1C 00 31 22 11 20 B8 44 5C 01 16 07 25 01 82 77 00 E8 46 
    //2C 11 2A 16 18 12 00 77 19 00 E8 46 2C 11 05 00 04 01 B0 31 22 11 2A 16 16 0F 00 60 47 2C 11 2E 
    //B8 2F 5C 01 19 19 00 E8 46 2C 11 05 00 04 01 B0 31 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 
    //16 07 25 01 82 77 00 60 47 2C 11 2A 16 18 12 00 77 19 00 60 47 2C 11 05 00 04 01 D8 47 2C 11 2A 
    //16 16 0F 00 70 46 2C 11 19 19 00 60 47 2C 11 05 00 04 01 D8 47 2C 11 0B 00 04 1B 71 0C 00 00 00 
    //F8 45 2C 11 16 0F 00 50 48 2C 11 11 0B 0B 0B 20 40 8D C3 00 0F 19 00 50 48 2C 11 05 00 01 01 88 
    //41 2C 11 24 02 0F 19 00 50 48 2C 11 05 00 01 01 00 42 2C 11 24 02 0F 19 00 50 48 2C 11 05 00 04 
    //01 78 42 2C 11 00 70 46 2C 11 05 04 AD 39 3F 1C 08 90 20 11 16 39 3F 2C 08 16 0A 99 01 1E 00 00 
    //00 00 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 98 1D 2E 11 06 75 02 0A B8 01 1E 00 00 80 
    //3F 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 70 1E 2E 11 06 75 02 0A D7 01 1E 00 00 00 40 
    //0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 48 1F 2E 11 06 75 02 0A F6 01 1E 00 00 40 40 0F 
    //19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 20 2E 11 06 75 02 0A 15 02 1E 00 00 80 40 0F 19 
    //00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 21 2E 11 06 75 02 0A 34 02 1E 00 00 A0 40 0F 19 00 
    //50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 22 2E 11 06 75 02 0A 53 02 1E 00 00 C0 40 0F 19 00 50 
    //48 2C 11 05 00 04 01 F0 42 2C 11 20 20 23 2E 11 06 75 02 0A 72 02 1E 00 00 E0 40 0F 19 00 50 48 
    //2C 11 05 00 04 01 F0 42 2C 11 20 20 24 2E 11 06 75 02 0A FF FF 0F 19 00 50 48 2C 11 05 00 04 01 
    //68 43 2C 11 00 70 46 2C 11 04 00 50 48 2C 11 07 6C 03 9A 39 3A 01 10 30 22 11 39 3A 24 21 16 0F 
    //00 60 47 2C 11 2E B8 2F 5C 01 1C 00 31 22 11 20 B8 2F 5C 01 16 07 F9 02 82 77 00 60 47 2C 11 2A 
    //16 18 12 00 77 19 00 60 47 2C 11 05 00 04 01 D8 47 2C 11 2A 16 16 0F 00 70 46 2C 11 19 19 00 60 
    //47 2C 11 05 00 04 01 D8 47 2C 11 0B 00 04 1B 71 0C 00 00 00 F8 45 2C 11 16 0F 00 50 48 2C 11 11 
    //0B 0B 0B 20 40 8D C3 00 0F 19 00 50 48 2C 11 05 00 01 01 88 41 2C 11 24 05 0F 19 00 50 48 2C 11 
    //05 00 01 01 00 42 2C 11 24 00 0F 19 00 50 48 2C 11 05 00 04 01 78 42 2C 11 00 70 46 2C 11 0F 19 
    //00 50 48 2C 11 05 00 04 01 F0 42 2C 11 20 20 25 2E 11 0F 19 00 50 48 2C 11 05 00 04 01 68 43 2C 
    //11 20 20 25 2E 11 04 00 50 48 2C 11 07 EF 03 9A 39 3A 01 10 30 22 11 39 3A 24 05 16 0F 00 50 48 
    //2C 11 11 0B 0B 0B 20 40 8D C3 00 0F 19 00 50 48 2C 11 05 00 01 01 88 41 2C 11 24 05 0F 19 00 50 
    //48 2C 11 05 00 01 01 00 42 2C 11 24 00 0F 19 00 50 48 2C 11 05 00 04 01 78 42 2C 11 20 20 26 2E 
    //11 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 00 70 46 2C 11 0F 19 00 50 48 2C 11 05 00 04 01 
    //68 43 2C 11 00 70 46 2C 11 04 00 50 48 2C 11 07 DF 04 9A 39 3A 01 10 30 22 11 39 3A 24 24 16 0F 
    //00 50 48 2C 11 11 0B 0B 0B 20 40 8D C3 00 0F 19 00 50 48 2C 11 05 00 01 01 88 41 2C 11 24 05 0F 
    //19 00 50 48 2C 11 05 00 01 01 00 42 2C 11 24 00 0F 19 00 50 48 2C 11 05 00 04 01 78 42 2C 11 01 
    //08 40 2C 11 0F 19 00 50 48 2C 11 05 00 04 01 F0 42 2C 11 01 60 DF 2B 11 0F 19 00 50 48 2C 11 05 
    //00 04 01 68 43 2C 11 01 60 DF 2B 11 0F 00 20 27 2E 11 11 0B 0B 0B 20 40 8D C3 00 0F 19 00 20 27 
    //2E 11 05 00 01 01 88 41 2C 11 24 05 0F 19 00 20 27 2E 11 05 00 01 01 00 42 2C 11 24 00 0F 19 00 
    //20 27 2E 11 05 00 04 01 78 42 2C 11 20 98 27 2E 11 0F 19 00 20 27 2E 11 05 00 04 01 F0 42 2C 11 
    //00 50 48 2C 11 0F 19 00 20 27 2E 11 05 00 04 01 68 43 2C 11 01 08 40 2C 11 04 00 20 27 2E 11 04 
    //00 70 46 2C 11 04 2A 04 0B 47 
  }


  function string GetTypeName() {
    switch (ItemType) {                                                         //0000 : 05 01 01 10 30 22 11 
      case 0 :                                                                  //0007 : 0A 20 00 24 00 
        return Class'StringReferences'.default.BodySlot.Text;                   //000C : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 47 1C 11 
      case 34 :                                                                 //0020 : 0A 39 00 24 22 
        return Class'StringReferences'.default.Right_Thigh_Armour.Text;         //0025 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 4B 1C 11 
      case 35 :                                                                 //0039 : 0A 52 00 24 23 
        return Class'StringReferences'.default.Right_Shin_Armour.Text;          //003E : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 4C 1C 11 
      case 16 :                                                                 //0052 : 0A 6B 00 24 10 
        return Class'StringReferences'.default.Head_Gear.Text;                  //0057 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 4C 1C 11 
      case 17 :                                                                 //006B : 0A 84 00 24 11 
        return Class'StringReferences'.default.Left_Shoulder_Armour.Text;       //0070 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 48 1C 11 
      case 18 :                                                                 //0084 : 0A 9D 00 24 12 
        return Class'StringReferences'.default.Right_Shoulder_Armour.Text;      //0089 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 49 1C 11 
      case 19 :                                                                 //009D : 0A B6 00 24 13 
        return Class'StringReferences'.default.Left_Gauntlet.Text;              //00A2 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 4A 1C 11 
      case 20 :                                                                 //00B6 : 0A CF 00 24 14 
        return Class'StringReferences'.default.Right_Gauntlet.Text;             //00BB : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 4A 1C 11 
      case 21 :                                                                 //00CF : 0A E8 00 24 15 
        return Class'StringReferences'.default.Chest_Armour.Text;               //00D4 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 49 1C 11 
      case 22 :                                                                 //00E8 : 0A 01 01 24 16 
        return Class'StringReferences'.default.Belt.Text;                       //00ED : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 53 1C 11 
      case 23 :                                                                 //0101 : 0A 1A 01 24 17 
        return Class'StringReferences'.default.Left_Thigh_Armour.Text;          //0106 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 4B 1C 11 
      case 24 :                                                                 //011A : 0A 33 01 24 18 
        return Class'StringReferences'.default.Left_Shin_Armour.Text;           //011F : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 4B 1C 11 
      case 25 :                                                                 //0133 : 0A 4C 01 24 19 
        return Class'StringReferences'.default.Chest_Clothing.Text;             //0138 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 60 4D 1C 11 
      case 26 :                                                                 //014C : 0A 65 01 24 1A 
        return Class'StringReferences'.default.Left_Glove.Text;                 //0151 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 4D 1C 11 
      case 27 :                                                                 //0165 : 0A 7E 01 24 1B 
        return Class'StringReferences'.default.Right_Glove.Text;                //016A : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 4E 1C 11 
      case 28 :                                                                 //017E : 0A 97 01 24 1C 
        return Class'StringReferences'.default.Pants.Text;                      //0183 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 4E 1C 11 
      case 29 :                                                                 //0197 : 0A B0 01 24 1D 
        return Class'StringReferences'.default.Shoes.Text;                      //019C : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 4F 1C 11 
      case 11 :                                                                 //01B0 : 0A C9 01 24 0B 
        return Class'StringReferences'.default.Single_Handed_Weapon.Text;       //01B5 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 4F 1C 11 
      case 12 :                                                                 //01C9 : 0A E2 01 24 0C 
        return Class'StringReferences'.default.Double_Handed_Weapon.Text;       //01CE : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 50 1C 11 
      case 13 :                                                                 //01E2 : 0A FB 01 24 0D 
        return Class'StringReferences'.default.Dual_Wielding_Weapon.Text;       //01E7 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 50 1C 11 
      case 14 :                                                                 //01FB : 0A 14 02 24 0E 
        return Class'StringReferences'.default.Ranged_Weapon.Text;              //0200 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 53 1C 11 
      case 15 :                                                                 //0214 : 0A 2D 02 24 0F 
        return Class'StringReferences'.default.Shield.Text;                     //0219 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 53 1C 11 
      case 1 :                                                                  //022D : 0A 46 02 24 01 
        return Class'StringReferences'.default.Ring.Text;                       //0232 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 51 1C 11 
      case 2 :                                                                  //0246 : 0A 5F 02 24 02 
        return Class'StringReferences'.default.Necklace.Text;                   //024B : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 51 1C 11 
      case 36 :                                                                 //025F : 0A 78 02 24 24 
        return Class'StringReferences'.default.Item_Sigil.Text;                 //0264 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 52 1C 11 
      case 5 :                                                                  //0278 : 0A 91 02 24 05 
        return Class'StringReferences'.default.Skill_Sigil.Text;                //027D : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 52 1C 11 
      case 3 :                                                                  //0291 : 0A 9E 02 24 03 
        return "Sigil";                                                         //0296 : 04 1F 53 69 67 69 6C 00 
      case 4 :                                                                  //029E : 0A AB 02 24 04 
        return "Sigil";                                                         //02A3 : 04 1F 53 69 67 69 6C 00 
      case 33 :                                                                 //02AB : 0A C4 02 24 21 
        return Class'StringReferences'.default.Recipe.Text;                     //02B0 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 68 54 1C 11 
      case 10 :                                                                 //02C4 : 0A 04 03 24 0A 
        if (ItemRarity == 0) {                                                  //02C9 : 07 F0 02 9A 39 3A 01 08 90 1A 11 39 3A 24 00 16 
          return Class'StringReferences'.default.Waste_Item.Text;               //02D9 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E0 54 1C 11 
        } else {                                                                //02ED : 06 04 03 
          return Class'StringReferences'.default.Resource.Text;                 //02F0 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 59 1C 11 
        }
      case 7 :                                                                  //0304 : 0A 1D 03 24 07 
        return Class'StringReferences'.default.Trophy.Text;                     //0309 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 58 55 1C 11 
      case 6 :                                                                  //031D : 0A 36 03 24 06 
        return Class'StringReferences'.default.Quest_Item.Text;                 //0322 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 55 1C 11 
      case 30 :                                                                 //0336 : 0A 4F 03 24 1E 
        return Class'StringReferences'.default.Ticket.Text;                     //033B : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 56 1C 11 
      case 31 :                                                                 //034F : 0A 68 03 24 1F 
        return Class'StringReferences'.default.Key.Text;                        //0354 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C0 56 1C 11 
      case 32 :                                                                 //0368 : 0A 81 03 24 20 
        return Class'StringReferences'.default.Labyrinth_Key.Text;              //036D : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 57 1C 11 
      case 37 :                                                                 //0381 : 0A 9A 03 24 25 
        return Class'StringReferences'.default.Consumable.Text;                 //0386 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 57 1C 11 
      case 8 :                                                                  //039A : 0A B3 03 24 08 
        return Class'StringReferences'.default.Bag.Text;                        //039F : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 58 1C 11 
      case 9 :                                                                  //03B3 : 0A CC 03 24 09 
        return Class'StringReferences'.default.Extra_Inventory.Text;            //03B8 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 58 1C 11 
      case 38 :                                                                 //03CC : 0A E5 03 24 26 
        return Class'StringReferences'.default.Broken_Item.Text;                //03D1 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 59 1C 11 
      default:                                                                  //03E5 : 0A FF FF 
        return "";                                                              //03E8 : 04 1F 00 
      }
    }
    //05 01 01 10 30 22 11 0A 20 00 24 00 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 47 1C 11 
    //0A 39 00 24 22 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 4B 1C 11 0A 52 00 24 23 04 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 4C 1C 11 0A 6B 00 24 10 04 36 58 C6 6B 0F 12 20 20 
    //F7 60 01 05 00 0C 02 E8 4C 1C 11 0A 84 00 24 11 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //B0 48 1C 11 0A 9D 00 24 12 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 49 1C 11 0A B6 00 
    //24 13 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 4A 1C 11 0A CF 00 24 14 04 36 58 C6 6B 
    //0F 12 20 20 F7 60 01 05 00 0C 02 90 4A 1C 11 0A E8 00 24 15 04 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 A0 49 1C 11 0A 01 01 24 16 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 53 1C 
    //11 0A 1A 01 24 17 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 4B 1C 11 0A 33 01 24 18 04 
    //36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 4B 1C 11 0A 4C 01 24 19 04 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 60 4D 1C 11 0A 65 01 24 1A 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 D8 4D 1C 11 0A 7E 01 24 1B 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 4E 1C 11 0A 97 
    //01 24 1C 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 4E 1C 11 0A B0 01 24 1D 04 36 58 C6 
    //6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 4F 1C 11 0A C9 01 24 0B 04 36 58 C6 6B 0F 12 20 20 F7 60 
    //01 05 00 0C 02 B8 4F 1C 11 0A E2 01 24 0C 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 50 
    //1C 11 0A FB 01 24 0D 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 50 1C 11 0A 14 02 24 0E 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 53 1C 11 0A 2D 02 24 0F 04 36 58 C6 6B 0F 12 
    //20 20 F7 60 01 05 00 0C 02 F0 53 1C 11 0A 46 02 24 01 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 
    //0C 02 20 51 1C 11 0A 5F 02 24 02 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 51 1C 11 0A 
    //78 02 24 24 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 52 1C 11 0A 91 02 24 05 04 36 58 
    //C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 52 1C 11 0A 9E 02 24 03 04 1F 53 69 67 69 6C 00 0A AB 
    //02 24 04 04 1F 53 69 67 69 6C 00 0A C4 02 24 21 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //68 54 1C 11 0A 04 03 24 0A 07 F0 02 9A 39 3A 01 08 90 1A 11 39 3A 24 00 16 04 36 58 C6 6B 0F 12 
    //20 20 F7 60 01 05 00 0C 02 E0 54 1C 11 06 04 03 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //90 59 1C 11 0A 1D 03 24 07 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 58 55 1C 11 0A 36 03 
    //24 06 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 55 1C 11 0A 4F 03 24 1E 04 36 58 C6 6B 
    //0F 12 20 20 F7 60 01 05 00 0C 02 48 56 1C 11 0A 68 03 24 1F 04 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 C0 56 1C 11 0A 81 03 24 20 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 57 1C 
    //11 0A 9A 03 24 25 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 57 1C 11 0A B3 03 24 08 04 
    //36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 58 1C 11 0A CC 03 24 09 04 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 A0 58 1C 11 0A E5 03 24 26 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 18 59 1C 11 0A FF FF 04 1F 00 04 0B 47 
  }


  final function string GetTooltipType() {
    switch (ItemType) {                                                         //0000 : 05 01 01 10 30 22 11 
      case 0 :                                                                  //0007 : 0A 26 00 24 00 
        return "HUD_ItemBodySlotTooltip";                                       //000C : 04 1F 48 55 44 5F 49 74 65 6D 42 6F 64 79 53 6C 6F 74 54 6F 6F 6C 74 69 70 00 
      case 16 :                                                                 //0026 : 0A 2B 00 24 10 
      case 21 :                                                                 //002B : 0A 4C 00 24 15 
        return "HUD_ItemWithSigilsTooltip";                                     //0030 : 04 1F 48 55 44 5F 49 74 65 6D 57 69 74 68 53 69 67 69 6C 73 54 6F 6F 6C 74 69 70 00 
      case 34 :                                                                 //004C : 0A 51 00 24 22 
      case 35 :                                                                 //0051 : 0A 56 00 24 23 
      case 17 :                                                                 //0056 : 0A 5B 00 24 11 
      case 18 :                                                                 //005B : 0A 60 00 24 12 
      case 19 :                                                                 //0060 : 0A 65 00 24 13 
      case 20 :                                                                 //0065 : 0A 6A 00 24 14 
      case 22 :                                                                 //006A : 0A 6F 00 24 16 
      case 23 :                                                                 //006F : 0A 74 00 24 17 
      case 24 :                                                                 //0074 : 0A 92 00 24 18 
        return "HUD_ItemAttunedTooltip";                                        //0079 : 04 1F 48 55 44 5F 49 74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 74 69 70 00 
      case 25 :                                                                 //0092 : 0A 97 00 24 19 
      case 26 :                                                                 //0097 : 0A 9C 00 24 1A 
      case 27 :                                                                 //009C : 0A A1 00 24 1B 
      case 28 :                                                                 //00A1 : 0A A6 00 24 1C 
      case 29 :                                                                 //00A6 : 0A C4 00 24 1D 
        return "HUD_ItemAttunedTooltip";                                        //00AB : 04 1F 48 55 44 5F 49 74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 74 69 70 00 
      case 36 :                                                                 //00C4 : 0A E0 00 24 24 
        return "HUD_ItemSigilTooltip";                                          //00C9 : 04 1F 48 55 44 5F 49 74 65 6D 53 69 67 69 6C 54 6F 6F 6C 74 69 70 00 
      case 5 :                                                                  //00E0 : 0A FE 00 24 05 
        return "HUD_ItemAttunedTooltip";                                        //00E5 : 04 1F 48 55 44 5F 49 74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 74 69 70 00 
      case 15 :                                                                 //00FE : 0A 1C 01 24 0F 
        return "HUD_ItemAttunedTooltip";                                        //0103 : 04 1F 48 55 44 5F 49 74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 74 69 70 00 
      case 14 :                                                                 //011C : 0A 21 01 24 0E 
      case 11 :                                                                 //0121 : 0A 26 01 24 0B 
      case 12 :                                                                 //0126 : 0A 2B 01 24 0C 
      case 13 :                                                                 //012B : 0A 4C 01 24 0D 
        return "HUD_ItemWithSigilsTooltip";                                     //0130 : 04 1F 48 55 44 5F 49 74 65 6D 57 69 74 68 53 69 67 69 6C 73 54 6F 6F 6C 74 69 70 00 
      case 1 :                                                                  //014C : 0A 51 01 24 01 
      case 2 :                                                                  //0151 : 0A 72 01 24 02 
        return "HUD_ItemWithSigilsTooltip";                                     //0156 : 04 1F 48 55 44 5F 49 74 65 6D 57 69 74 68 53 69 67 69 6C 73 54 6F 6F 6C 74 69 70 00 
      case 33 :                                                                 //0172 : 0A 8F 01 24 21 
        return "HUD_ItemRecipeTooltip";                                         //0177 : 04 1F 48 55 44 5F 49 74 65 6D 52 65 63 69 70 65 54 6F 6F 6C 74 69 70 00 
      case 38 :                                                                 //018F : 0A AC 01 24 26 
        return "HUD_ItemBrokenTooltip";                                         //0194 : 04 1F 48 55 44 5F 49 74 65 6D 42 72 6F 6B 65 6E 54 6F 6F 6C 74 69 70 00 
      case 10 :                                                                 //01AC : 0A B1 01 24 0A 
      case 7 :                                                                  //01B1 : 0A B6 01 24 07 
      case 6 :                                                                  //01B6 : 0A BB 01 24 06 
      case 30 :                                                                 //01BB : 0A C0 01 24 1E 
      case 31 :                                                                 //01C0 : 0A C5 01 24 1F 
      case 32 :                                                                 //01C5 : 0A CA 01 24 20 
      case 37 :                                                                 //01CA : 0A CF 01 24 25 
      case 8 :                                                                  //01CF : 0A D4 01 24 08 
      case 9 :                                                                  //01D4 : 0A D9 01 24 09 
      default:                                                                  //01D9 : 0A FF FF 
        return "HUD_ItemTooltip";                                               //01DC : 04 1F 48 55 44 5F 49 74 65 6D 54 6F 6F 6C 74 69 70 00 
      }
    }
    //05 01 01 10 30 22 11 0A 26 00 24 00 04 1F 48 55 44 5F 49 74 65 6D 42 6F 64 79 53 6C 6F 74 54 6F 
    //6F 6C 74 69 70 00 0A 2B 00 24 10 0A 4C 00 24 15 04 1F 48 55 44 5F 49 74 65 6D 57 69 74 68 53 69 
    //67 69 6C 73 54 6F 6F 6C 74 69 70 00 0A 51 00 24 22 0A 56 00 24 23 0A 5B 00 24 11 0A 60 00 24 12 
    //0A 65 00 24 13 0A 6A 00 24 14 0A 6F 00 24 16 0A 74 00 24 17 0A 92 00 24 18 04 1F 48 55 44 5F 49 
    //74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 74 69 70 00 0A 97 00 24 19 0A 9C 00 24 1A 0A A1 00 24 
    //1B 0A A6 00 24 1C 0A C4 00 24 1D 04 1F 48 55 44 5F 49 74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 
    //74 69 70 00 0A E0 00 24 24 04 1F 48 55 44 5F 49 74 65 6D 53 69 67 69 6C 54 6F 6F 6C 74 69 70 00 
    //0A FE 00 24 05 04 1F 48 55 44 5F 49 74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 74 69 70 00 0A 1C 
    //01 24 0F 04 1F 48 55 44 5F 49 74 65 6D 41 74 74 75 6E 65 64 54 6F 6F 6C 74 69 70 00 0A 21 01 24 
    //0E 0A 26 01 24 0B 0A 2B 01 24 0C 0A 4C 01 24 0D 04 1F 48 55 44 5F 49 74 65 6D 57 69 74 68 53 69 
    //67 69 6C 73 54 6F 6F 6C 74 69 70 00 0A 51 01 24 01 0A 72 01 24 02 04 1F 48 55 44 5F 49 74 65 6D 
    //57 69 74 68 53 69 67 69 6C 73 54 6F 6F 6C 74 69 70 00 0A 8F 01 24 21 04 1F 48 55 44 5F 49 74 65 
    //6D 52 65 63 69 70 65 54 6F 6F 6C 74 69 70 00 0A AC 01 24 26 04 1F 48 55 44 5F 49 74 65 6D 42 72 
    //6F 6B 65 6E 54 6F 6F 6C 74 69 70 00 0A B1 01 24 0A 0A B6 01 24 07 0A BB 01 24 06 0A C0 01 24 1E 
    //0A C5 01 24 1F 0A CA 01 24 20 0A CF 01 24 25 0A D4 01 24 08 0A D9 01 24 09 0A FF FF 04 1F 48 55 
    //44 5F 49 74 65 6D 54 6F 6F 6C 74 69 70 00 04 0B 47 
  }


  event Color GetRarityColor() {
    local Color Result;
    Result.A = 255;                                                             //0000 : 0F 36 48 91 6A 0F 00 00 98 1A 11 39 3D 2C FF 
    switch (ItemRarity) {                                                       //000F : 05 01 01 08 90 1A 11 
      case 0 :                                                                  //0016 : 0A 45 00 24 00 
        Result.R = 183;                                                         //001B : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 B7 
        Result.G = 183;                                                         //0028 : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 B7 
        Result.B = 183;                                                         //0035 : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 B7 
        break;                                                                  //0042 : 06 8C 01 
      case 1 :                                                                  //0045 : 0A 74 00 24 01 
        Result.R = 102;                                                         //004A : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 66 
        Result.G = 214;                                                         //0057 : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 D6 
        Result.B = 76;                                                          //0064 : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 4C 
        break;                                                                  //0071 : 06 8C 01 
      case 2 :                                                                  //0074 : 0A A3 00 24 02 
        Result.R = 184;                                                         //0079 : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 B8 
        Result.G = 182;                                                         //0086 : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 B6 
        Result.B = 189;                                                         //0093 : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 BD 
        break;                                                                  //00A0 : 06 8C 01 
      case 3 :                                                                  //00A3 : 0A D2 00 24 03 
        Result.R = 199;                                                         //00A8 : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 C7 
        Result.G = 218;                                                         //00B5 : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 DA 
        Result.B = 152;                                                         //00C2 : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 98 
        break;                                                                  //00CF : 06 8C 01 
      case 4 :                                                                  //00D2 : 0A 01 01 24 04 
        Result.R = 204;                                                         //00D7 : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 CC 
        Result.G = 135;                                                         //00E4 : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 87 
        Result.B = 75;                                                          //00F1 : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 4B 
        break;                                                                  //00FE : 06 8C 01 
      case 5 :                                                                  //0101 : 0A 30 01 24 05 
        Result.R = 212;                                                         //0106 : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 D4 
        Result.G = 63;                                                          //0113 : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 3F 
        Result.B = 63;                                                          //0120 : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 3F 
        break;                                                                  //012D : 06 8C 01 
      case 6 :                                                                  //0130 : 0A 5F 01 24 06 
        Result.R = 179;                                                         //0135 : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 B3 
        Result.G = 100;                                                         //0142 : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 64 
        Result.B = 182;                                                         //014F : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 B6 
        break;                                                                  //015C : 06 8C 01 
      default:                                                                  //015F : 0A FF FF 
        Result.R = 184;                                                         //0162 : 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 B8 
        Result.G = 182;                                                         //016F : 0F 36 58 90 6A 0F 00 00 98 1A 11 24 B6 
        Result.B = 189;                                                         //017C : 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 BD 
        break;                                                                  //0189 : 06 8C 01 
    }
    return Result;                                                              //018C : 04 00 00 98 1A 11 
    //0F 36 48 91 6A 0F 00 00 98 1A 11 39 3D 2C FF 05 01 01 08 90 1A 11 0A 45 00 24 00 0F 36 D0 90 6A 
    //0F 00 00 98 1A 11 24 B7 0F 36 58 90 6A 0F 00 00 98 1A 11 24 B7 0F 36 E0 8F 6A 0F 00 00 98 1A 11 
    //24 B7 06 8C 01 0A 74 00 24 01 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 66 0F 36 58 90 6A 0F 00 00 98 
    //1A 11 24 D6 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 4C 06 8C 01 0A A3 00 24 02 0F 36 D0 90 6A 0F 00 
    //00 98 1A 11 24 B8 0F 36 58 90 6A 0F 00 00 98 1A 11 24 B6 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 BD 
    //06 8C 01 0A D2 00 24 03 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 C7 0F 36 58 90 6A 0F 00 00 98 1A 11 
    //24 DA 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 98 06 8C 01 0A 01 01 24 04 0F 36 D0 90 6A 0F 00 00 98 
    //1A 11 24 CC 0F 36 58 90 6A 0F 00 00 98 1A 11 24 87 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 4B 06 8C 
    //01 0A 30 01 24 05 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 D4 0F 36 58 90 6A 0F 00 00 98 1A 11 24 3F 
    //0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 3F 06 8C 01 0A 5F 01 24 06 0F 36 D0 90 6A 0F 00 00 98 1A 11 
    //24 B3 0F 36 58 90 6A 0F 00 00 98 1A 11 24 64 0F 36 E0 8F 6A 0F 00 00 98 1A 11 24 B6 06 8C 01 0A 
    //FF FF 0F 36 D0 90 6A 0F 00 00 98 1A 11 24 B8 0F 36 58 90 6A 0F 00 00 98 1A 11 24 B6 0F 36 E0 8F 
    //6A 0F 00 00 98 1A 11 24 BD 06 8C 01 04 00 00 98 1A 11 04 0B 47 
  }


  event string GetActiveText(Game_ActiveTextItem aItem) {
    return GetName();                                                           //0000 : 04 1B F9 03 00 00 16 
    //04 1B F9 03 00 00 16 04 0B 47 
  }


  function bool IsNPCType() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 F8 9B 1A 11 25 
    while (i < Components.Length) {                                             //0007 : 07 3B 00 96 00 F8 9B 1A 11 37 01 70 9C 1A 11 16 
      if (Components[i].IsNPCItem()) {                                          //0017 : 07 31 00 19 10 00 F8 9B 1A 11 01 70 9C 1A 11 06 00 04 1B A1 05 00 00 16 
        return True;                                                            //002F : 04 27 
      }
      ++i;                                                                      //0031 : A3 00 F8 9B 1A 11 16 
    }
    return False;                                                               //003B : 04 28 
    //0F 00 F8 9B 1A 11 25 07 3B 00 96 00 F8 9B 1A 11 37 01 70 9C 1A 11 16 07 31 00 19 10 00 F8 9B 1A 
    //11 01 70 9C 1A 11 06 00 04 1B A1 05 00 00 16 04 27 A3 00 F8 9B 1A 11 16 06 07 00 04 28 04 0B 47 
    //
  }


  event string GetName() {
    if (Len(Name.Text) > 0) {                                                   //0000 : 07 20 00 97 7D 36 58 C6 6B 0F 01 88 9E 1A 11 16 25 16 
      return Name.Text;                                                         //0012 : 04 36 58 C6 6B 0F 01 88 9E 1A 11 
    } else {                                                                    //001D : 06 34 00 
      return Class'StringReferences'.default._Unknown_item_.Text;               //0020 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C0 47 1C 11 
    }
    //07 20 00 97 7D 36 58 C6 6B 0F 01 88 9E 1A 11 16 25 16 04 36 58 C6 6B 0F 01 88 9E 1A 11 06 34 00 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C0 47 1C 11 04 0B 47 
  }


  final native function IC_EquipEffects GetEquipEffectsTokenComponent();


  final native function IC_TokenItem GetItemTokenComponent();


  final native function IC_TokenSkill GetSkillTokenComponent();


  final native function Appearance_Base GetAppearance();


  event byte GetWeaponType() {
    return 0;                                                                   //0000 : 04 24 00 
    //04 24 00 04 0B 47 
  }


  event int GetComponent(class<Object> ComponentClass) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 38 A6 1A 11 25 
    while (i < Components.Length) {                                             //0007 : 07 45 00 96 00 38 A6 1A 11 37 01 70 9C 1A 11 16 
      if (Components[i].Class == ComponentClass) {                              //0017 : 07 3B 00 72 19 10 00 38 A6 1A 11 01 70 9C 1A 11 05 00 04 01 68 E5 6B 0F 00 B8 A5 1A 11 16 
        return i;                                                               //0035 : 04 00 38 A6 1A 11 
      }
      i++;                                                                      //003B : A5 00 38 A6 1A 11 16 
    }
    return -1;                                                                  //0045 : 04 1D FF FF FF FF 
    //0F 00 38 A6 1A 11 25 07 45 00 96 00 38 A6 1A 11 37 01 70 9C 1A 11 16 07 3B 00 72 19 10 00 38 A6 
    //1A 11 01 70 9C 1A 11 05 00 04 01 68 E5 6B 0F 00 B8 A5 1A 11 16 04 00 38 A6 1A 11 A5 00 38 A6 1A 
    //11 16 06 07 00 04 1D FF FF FF FF 04 0B 47 
  }


  event OnSheathe(Game_Pawn aPawn) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 08 AB 1A 11 25 
    while (i < Components.Length) {                                             //0007 : 07 3B 00 96 00 08 AB 1A 11 37 01 70 9C 1A 11 16 
      Components[i].OnSheathe(aPawn);                                           //0017 : 19 10 00 08 AB 1A 11 01 70 9C 1A 11 0B 00 00 1B F4 05 00 00 00 10 AA 1A 11 16 
      i++;                                                                      //0031 : A5 00 08 AB 1A 11 16 
    }
    //0F 00 08 AB 1A 11 25 07 3B 00 96 00 08 AB 1A 11 37 01 70 9C 1A 11 16 19 10 00 08 AB 1A 11 01 70 
    //9C 1A 11 0B 00 00 1B F4 05 00 00 00 10 AA 1A 11 16 A5 00 08 AB 1A 11 16 06 07 00 04 0B 47 
  }


  event OnDraw(Game_Pawn aPawn) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 28 AD 1A 11 25 
    while (i < Components.Length) {                                             //0007 : 07 3B 00 96 00 28 AD 1A 11 37 01 70 9C 1A 11 16 
      Components[i].OnDraw(aPawn);                                              //0017 : 19 10 00 28 AD 1A 11 01 70 9C 1A 11 0B 00 00 1B C0 05 00 00 00 30 AC 1A 11 16 
      i++;                                                                      //0031 : A5 00 28 AD 1A 11 16 
    }
    //0F 00 28 AD 1A 11 25 07 3B 00 96 00 28 AD 1A 11 37 01 70 9C 1A 11 16 19 10 00 28 AD 1A 11 01 70 
    //9C 1A 11 0B 00 00 1B C0 05 00 00 00 30 AC 1A 11 16 A5 00 28 AD 1A 11 16 06 07 00 04 0B 47 
  }


  event OnUnequip(Game_Pawn aPawn,Game_Item aItem) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 50 AF 1A 11 25 
    while (i < Components.Length) {                                             //0007 : 07 40 00 96 00 50 AF 1A 11 37 01 70 9C 1A 11 16 
      Components[i].OnUnequip(aPawn,aItem);                                     //0017 : 19 10 00 50 AF 1A 11 01 70 9C 1A 11 10 00 00 1B FC 05 00 00 00 50 AE 1A 11 00 C8 AF 1A 11 16 
      i++;                                                                      //0036 : A5 00 50 AF 1A 11 16 
    }
    //0F 00 50 AF 1A 11 25 07 40 00 96 00 50 AF 1A 11 37 01 70 9C 1A 11 16 19 10 00 50 AF 1A 11 01 70 
    //9C 1A 11 10 00 00 1B FC 05 00 00 00 50 AE 1A 11 00 C8 AF 1A 11 16 A5 00 50 AF 1A 11 16 06 07 00 
    //04 0B 47 
  }


  event OnEquip(Game_Pawn aPawn,Game_Item aItem) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 F0 B1 1A 11 25 
    while (i < Components.Length) {                                             //0007 : 07 40 00 96 00 F0 B1 1A 11 37 01 70 9C 1A 11 16 
      Components[i].OnEquip(aPawn,aItem);                                       //0017 : 19 10 00 F0 B1 1A 11 01 70 9C 1A 11 10 00 00 1B C3 05 00 00 00 F0 B0 1A 11 00 68 B2 1A 11 16 
      i++;                                                                      //0036 : A5 00 F0 B1 1A 11 16 
    }
    //0F 00 F0 B1 1A 11 25 07 40 00 96 00 F0 B1 1A 11 37 01 70 9C 1A 11 16 19 10 00 F0 B1 1A 11 01 70 
    //9C 1A 11 10 00 00 1B C3 05 00 00 00 F0 B0 1A 11 00 68 B2 1A 11 16 A5 00 F0 B1 1A 11 16 06 07 00 
    //04 0B 47 
  }


  event OnUse(Game_Pawn aPawn,Game_Item aItem) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 08 E0 2B 11 25 
    while (i < Components.Length) {                                             //0007 : 07 40 00 96 00 08 E0 2B 11 37 01 70 9C 1A 11 16 
      Components[i].OnUse(aPawn,aItem);                                         //0017 : 19 10 00 08 E0 2B 11 01 70 9C 1A 11 10 00 00 1B FF 05 00 00 00 90 B3 1A 11 00 80 E0 2B 11 16 
      i++;                                                                      //0036 : A5 00 08 E0 2B 11 16 
    }
    if (UseCooldown > 0) {                                                      //0040 : 07 5C 00 B1 01 F8 E0 2B 11 39 3F 25 16 
      aItem.OnItemUsed();                                                       //004D : 19 00 80 E0 2B 11 06 00 00 1B D3 05 00 00 16 
    }
    //0F 00 08 E0 2B 11 25 07 40 00 96 00 08 E0 2B 11 37 01 70 9C 1A 11 16 19 10 00 08 E0 2B 11 01 70 
    //9C 1A 11 10 00 00 1B FF 05 00 00 00 90 B3 1A 11 00 80 E0 2B 11 16 A5 00 08 E0 2B 11 16 06 07 00 
    //07 5C 00 B1 01 F8 E0 2B 11 39 3F 25 16 19 00 80 E0 2B 11 06 00 00 1B D3 05 00 00 16 04 0B 47 
  }


  event bool CanEquip(Game_Pawn aPawn,Game_Item aItem) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 98 E2 2B 11 25 
    while (i < Components.Length) {                                             //0007 : 07 47 00 96 00 98 E2 2B 11 37 01 70 9C 1A 11 16 
      if (!Components[i].CanEquip(aPawn,aItem)) {                               //0017 : 07 3D 00 81 19 10 00 98 E2 2B 11 01 70 9C 1A 11 10 00 04 1B 86 04 00 00 00 20 E2 2B 11 00 10 E3 2B 11 16 16 
        return False;                                                           //003B : 04 28 
      }
      i++;                                                                      //003D : A5 00 98 E2 2B 11 16 
    }
    return True;                                                                //0047 : 04 27 
    //0F 00 98 E2 2B 11 25 07 47 00 96 00 98 E2 2B 11 37 01 70 9C 1A 11 16 07 3D 00 81 19 10 00 98 E2 
    //2B 11 01 70 9C 1A 11 10 00 04 1B 86 04 00 00 00 20 E2 2B 11 00 10 E3 2B 11 16 16 04 28 A5 00 98 
    //E2 2B 11 16 06 07 00 04 27 04 0B 47 
  }


  event bool sv_CanUse(Game_Pawn aPawn,Game_Item aItem) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 28 E5 2B 11 25 
    while (i < Components.Length) {                                             //0007 : 07 47 00 96 00 28 E5 2B 11 37 01 70 9C 1A 11 16 
      if (!Components[i].CanUse(aPawn,aItem)) {                                 //0017 : 07 3D 00 81 19 10 00 28 E5 2B 11 01 70 9C 1A 11 10 00 04 1B 8B 04 00 00 00 B0 E4 2B 11 00 A0 E5 2B 11 16 16 
        return False;                                                           //003B : 04 28 
      }
      i++;                                                                      //003D : A5 00 28 E5 2B 11 16 
    }
    i = 0;                                                                      //0047 : 0F 00 28 E5 2B 11 25 
    while (i < Requirements.Length) {                                           //004E : 07 9C 00 96 00 28 E5 2B 11 37 01 18 E6 2B 11 16 
      if (Requirements[i] == None
        || !Requirements[i].CheckPawn(aPawn)) {//005E : 07 92 00 84 72 10 00 28 E5 2B 11 01 18 E6 2B 11 2A 16 18 1D 00 81 19 10 00 28 E5 2B 11 01 18 E6 2B 11 0B 00 04 1C 90 E6 2B 11 00 B0 E4 2B 11 16 16 16 
        return False;                                                           //0090 : 04 28 
      }
      i++;                                                                      //0092 : A5 00 28 E5 2B 11 16 
    }
    if (aPawn.CharacterStats.mRecord.FameLevel < MinLevel) {                    //009C : 07 C6 00 96 36 00 2D 34 0F 19 19 00 B0 E4 2B 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 39 3A 01 40 E7 2B 11 16 
      return False;                                                             //00C4 : 04 28 
    }
    return True;                                                                //00C6 : 04 27 
    //0F 00 28 E5 2B 11 25 07 47 00 96 00 28 E5 2B 11 37 01 70 9C 1A 11 16 07 3D 00 81 19 10 00 28 E5 
    //2B 11 01 70 9C 1A 11 10 00 04 1B 8B 04 00 00 00 B0 E4 2B 11 00 A0 E5 2B 11 16 16 04 28 A5 00 28 
    //E5 2B 11 16 06 07 00 0F 00 28 E5 2B 11 25 07 9C 00 96 00 28 E5 2B 11 37 01 18 E6 2B 11 16 07 92 
    //00 84 72 10 00 28 E5 2B 11 01 18 E6 2B 11 2A 16 18 1D 00 81 19 10 00 28 E5 2B 11 01 18 E6 2B 11 
    //0B 00 04 1C 90 E6 2B 11 00 B0 E4 2B 11 16 16 16 04 28 A5 00 28 E5 2B 11 16 06 4E 00 07 C6 00 96 
    //36 00 2D 34 0F 19 19 00 B0 E4 2B 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 39 3A 01 40 
    //E7 2B 11 16 04 28 04 27 04 0B 47 
  }


  final native function byte GetItemLevel();


  final native function bool ShouldUseSecondaryLogo(Game_Pawn aPawn);


  final native function Item_Component GetComponentByClass(class<Item_Component> aComponentClass);


  static native function LoadAllItems();



