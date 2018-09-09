//==============================================================================
//  LootTable
//==============================================================================

class LootTable extends Content_Type
    native
    dependsOn()
  ;

  enum ETableType {
    ETT_Loot ,
    ETT_Scavenge ,
    ETT_ShopStock 
  };

  struct DroppedItem {
      var export editinline Item_Type Item;
      var int Quantity;
      var int MinLevel;
      var int MaxLevel;

  };


  struct LootEntry {
      var export editinline Item_Type Item;
      var int MinQuantity;
      var int MaxQuantity;
      var int Chance;
      var int MinLevel;
      var int MaxLevel;

  };


  var array<LootEntry> Entries;
  var (LootTable) string Name;
  var (LootTable) byte TableType;
  var (LootTable) int MinDropQuantity;
  var (LootTable) int MaxDropQuantity;
  var (LootTable) int MoneyBase;
  var (LootTable) int MoneyPerLevel;


  native function InitDroppedItems(out array<DroppedItem> aResultItems);


  function bool HasScavengeItems() {
    return TableType == 1;                                                      //0000 : 04 9A 39 3A 01 88 88 32 11 39 3A 24 01 16 
    //04 9A 39 3A 01 88 88 32 11 39 3A 24 01 16 04 0B 47 
  }


  function bool HasLootItems() {
    return TableType == 0;                                                      //0000 : 04 9A 39 3A 01 88 88 32 11 39 3A 24 00 16 
    //04 9A 39 3A 01 88 88 32 11 39 3A 24 00 16 04 0B 47 
  }



