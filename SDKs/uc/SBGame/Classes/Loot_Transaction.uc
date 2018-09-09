//==============================================================================
//  Loot_Transaction
//==============================================================================

class Loot_Transaction extends Object
    native
    exportstructs
    dependsOn()
  ;

  const MINIMUM_TIMER_VALUE =  0.5f;
  const LOOT_MODE_NR_OPTIONS =  3;
  const LOOT_MODE_MASTER =  2;
  const LOOT_MODE_GROUP =  1;
  const LOOT_MODE_FREE_FOR_ALL =  0;
  struct DroppedLootItem {
      var int LootItemID;
      var DroppedItem Item;
      var bool Given;

  };


  struct GroupLootSelection {
      var int DroppedItemIndex;
      var array<Game_Pawn> NeedList;
      var array<Game_Pawn> GreedList;

  };


  var transient int mTransactionID;
  var transient array<DroppedLootItem> lootItems;
  var transient array<Game_Pawn> mReceiverList;
  var transient array<GroupLootSelection> SelectedDroppedItems;
  var transient bool mTimedTransaction;
  var transient float mCurrentTimerValue;
  var transient byte mLootMode;


  final native function sv_GiveItemCompleted(int aErrorCode,int aLootItemID);



