//==============================================================================
//  Loot_Manager
//==============================================================================

class Loot_Manager extends Actor
    native
    dependsOn()
  ;

  var transient int mLastID;
  var transient array<Loot_Transaction> mTransactions;


  final native function sv_CreateTransaction(array<LootTable> aLootTables,array<Game_Pawn> aReceivers,float aTimer,optional byte aLootMode);


  final static native function Loot_Manager sv_GetInstance();



