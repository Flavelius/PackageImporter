//==============================================================================
//  Game_ItemManager
//==============================================================================

class Game_ItemManager extends Base_Component within Game_Pawn
    native
    exportstructs
    dependsOn()
  ;

  var transient int mItems;


  native event int GetFreeSlots(byte aLocationType,optional int aLocationID);


  final native function int CountItemsByType(byte aType,optional byte aLocationType);


  final native function int CountItems(export editinline Item_Type aItemType,optional byte aLocationType);


  native function bool IsValidSlot(byte aLocationType,int aLocationSlot,int aLocationID);


  native function Game_Item GetItemByID(int aDBID);


  native function Game_Item GetItem(byte aLocationType,int aLocationSlot,optional int aLocationID);


  native function array<Game_Item> GetItems(byte aLocationType,optional int aLocationID);



