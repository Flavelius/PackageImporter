//==============================================================================
//  NPC_Taxonomy
//==============================================================================

class NPC_Taxonomy extends Content_Type
    native
    dependsOn(Game_ActiveTextItem)
  ;

  var (NPC_Taxonomy) string ClassesPackage;
  var (Description) LocalizedString prefix;
  var (Description) LocalizedString Description;
  var (Description) LocalizedString Postfix;
  var (Description) const string Note;
  var deprecated Color AlternativeMainColor;
  var deprecated Color AlternativeSecondaryColor;
  var (Overrides) Color ClothColor1;
  var (Overrides) Color ClothColor2;
  var (Overrides) Color ArmorColor1;
  var (Overrides) Color ArmorColor2;
  var (Overrides) editinline Texture PaletteArmor;
  var (Overrides) editinline Texture PaletteClothing;
  var int CachedColorCloth1;
  var int CachedColorCloth2;
  var int CachedColorArmor1;
  var int CachedColorArmor2;
  var editinline deprecated array<NPC_Taxonomy> Enemies;
  var editinline deprecated array<NPC_Taxonomy> Friendlies;
  var (Relations) editinline array<NPC_Taxonomy> Likes;
  var (Relations) editinline array<NPC_Taxonomy> Dislikes;
  var (Loot) editinline array<LootTable> Loot;
  var export editinline NPC_Taxonomy Parent;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem == None || aItem.Tag == "") {                                     //0000 : 07 2C 00 84 72 00 60 7D 26 11 2A 16 18 13 00 7A 19 00 60 7D 26 11 05 00 00 01 08 9B 18 11 1F 00 16 16 
      return GetDescription();                                                  //0022 : 04 1B 6B 05 00 00 16 
    } else {                                                                    //0029 : 06 38 00 
      return Super.GetActiveText(aItem);                                        //002C : 04 1C 60 3C 1F 11 00 60 7D 26 11 16 
    }
    //07 2C 00 84 72 00 60 7D 26 11 2A 16 18 13 00 7A 19 00 60 7D 26 11 05 00 00 01 08 9B 18 11 1F 00 
    //16 16 04 1B 6B 05 00 00 16 06 38 00 04 1C 60 3C 1F 11 00 60 7D 26 11 16 04 0B 47 
  }


  final native function AppendLoot(out array<LootTable> lootz);


  native function int GetArmorColor2();


  native function int GetArmorColor1();


  native function int GetClothColor2();


  native function int GetClothColor1();


  native function string GetDescription();


  final native function bool DoesntLike(export editinline NPC_Taxonomy aTaxonomyNode);


  final native function bool IsParent(export editinline NPC_Taxonomy aTaxonomyNode);


  function NPC_Taxonomy GetRoot() {
    local export editinline NPC_Taxonomy P;
    P = GetParent();                                                            //0000 : 0F 00 D0 8C 26 11 1B FD 0C 00 00 16 
    if (P != None) {                                                            //000C : 07 44 00 77 00 D0 8C 26 11 2A 16 
      while (P.GetParent() != None) {                                           //0017 : 07 44 00 77 19 00 D0 8C 26 11 06 00 04 1B FD 0C 00 00 16 2A 16 
        P = P.GetParent();                                                      //002C : 0F 00 D0 8C 26 11 19 00 D0 8C 26 11 06 00 04 1B FD 0C 00 00 16 
      }
    }
    return Parent;                                                              //0044 : 04 01 48 8D 26 11 
    //0F 00 D0 8C 26 11 1B FD 0C 00 00 16 07 44 00 77 00 D0 8C 26 11 2A 16 07 44 00 77 19 00 D0 8C 26 
    //11 06 00 04 1B FD 0C 00 00 16 2A 16 0F 00 D0 8C 26 11 19 00 D0 8C 26 11 06 00 04 1B FD 0C 00 00 
    //16 06 17 00 04 01 48 8D 26 11 04 0B 47 
  }


  function NPC_Taxonomy GetParent() {
    return Parent;                                                              //0000 : 04 01 48 8D 26 11 
    //04 01 48 8D 26 11 04 0B 47 
  }



