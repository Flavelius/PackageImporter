//==============================================================================
//  Game_Looting
//==============================================================================

class Game_Looting extends Base_Component within Game_Pawn
    native
    dependsOn(Game_Pawn,Game_PlayerController,Player,GUI_BaseDesktop,StringReferences,Loot_Transaction,Game_GUI)
  ;

  const LOOT_ITEM_REJECTED_INVENTORY_FULL =  1;
  const LOOT_ITEM_REJECTED_ALREADY_TAKEN =  0;
  struct LootItem {
      var Game_Item GameItem;
      var bool Chosen;

  };


  struct ReplicatedLootItem {
      var int ResourceId;
      var int LootItemID;
      var int Quantity;

  };


  struct ServerLootInfo {
      var Loot_Transaction Transaction;
      var array<ReplicatedLootItem> lootItems;

  };


  struct ClientLootInfo {
      var int TransactionID;
      var byte LootMode;
      var float Timer;
      var array<ReplicatedLootItem> lootItems;
      var array<LootItem> Items;
      var array<int> EligibleMembers;

  };


  var transient float mLootTimer;
  var transient array<ServerLootInfo> ServerLoot;
  var transient array<ClientLootInfo> ClientLoot;


  protected native function cl2sv_MasterLootChoice_CallStub();


  final native event cl2sv_MasterLootChoice(array<int> aTransactionIDs,array<int> aLootItemIds,int aTarget);


  protected native function cl2sv_GroupLootChoice_CallStub();


  final native event cl2sv_GroupLootChoice(array<int> aTransactionIDs,array<int> aLootItemIds,bool aNeedFlag);


  protected native function cl2sv_SelectItems_CallStub();


  final native event cl2sv_SelectItems(array<int> aTransactionIDs,array<int> aLootItemIds);


  protected native function cl2sv_EndTransaction_CallStub();


  final native event cl2sv_EndTransaction(int aTransactionID);


  protected native function cl2sv_EndTransactions_CallStub();


  final native event cl2sv_EndTransactions(array<int> aTransactionIDs);


  final native function cl_MasterLootChoice(array<Game_Item> aItems,int aTarget);


  final function cl_GreedItems(array<Game_Item> aItems) {
    cl_GroupLootChoice(aItems,False);                                           //0000 : 1C 90 6E 2B 11 00 D8 6D 2B 11 28 16 
    //1C 90 6E 2B 11 00 D8 6D 2B 11 28 16 04 0B 47 
  }


  final function cl_NeedItems(array<Game_Item> aItems) {
    cl_GroupLootChoice(aItems,True);                                            //0000 : 1C 90 6E 2B 11 00 B8 6F 2B 11 27 16 
    //1C 90 6E 2B 11 00 B8 6F 2B 11 27 16 04 0B 47 
  }


  private final native function cl_GroupLootChoice(array<Game_Item> aItems,bool aNeedFlag);


  final native function cl_SelectItems(array<Game_Item> aItems);


  final event cl_ItemRejectedMessage(byte aReason) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(Outer.Controller);                 //0000 : 0F 00 E0 77 2B 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
    if (PlayerController != None
      && PlayerController.Player != None
      && PlayerController.Player.GUIDesktop != None) {//0019 : 07 12 01 82 82 77 00 E0 77 2B 11 2A 16 18 12 00 77 19 00 E0 77 2B 11 05 00 04 01 28 25 71 0F 2A 16 16 18 1B 00 77 19 19 00 E0 77 2B 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 2A 16 16 
      PlayerController.Player.GUIDesktop.AddScreenMessage(Class'StringReferences'.default.Loot_Item_Rejected.Text);//0059 : 19 19 19 00 E0 77 2B 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 FF 1B 11 16 
      switch (aReason) {                                                        //008D : 05 01 00 C0 75 2B 11 
        case 0 :                                                                //0094 : 0A D0 00 24 00 
          PlayerController.Player.GUIDesktop.AddScreenMessage(Class'StringReferences'.default.Loot_Item_Already_Taken.Text);//0099 : 19 19 19 00 E0 77 2B 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 FF 1B 11 16 
          break;                                                                //00CD : 06 12 01 
        case 1 :                                                                //00D0 : 0A 0C 01 24 01 
          PlayerController.Player.GUIDesktop.AddScreenMessage(Class'StringReferences'.default.Inventory_Full.Text);//00D5 : 19 19 19 00 E0 77 2B 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 60 00 1C 11 16 
          break;                                                                //0109 : 06 12 01 
        default:                                                                //010C : 0A FF FF 
          break;                                                                //010F : 06 12 01 
      }
    }
    //0F 00 E0 77 2B 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 07 12 01 82 82 77 00 
    //E0 77 2B 11 2A 16 18 12 00 77 19 00 E0 77 2B 11 05 00 04 01 28 25 71 0F 2A 16 16 18 1B 00 77 19 
    //19 00 E0 77 2B 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 2A 16 16 19 19 19 00 E0 77 2B 
    //11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 70 FF 1B 11 16 05 01 00 C0 75 2B 11 0A D0 00 24 00 19 19 19 00 E0 77 2B 
    //11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 E8 FF 1B 11 16 06 12 01 0A 0C 01 24 01 19 19 19 00 E0 77 2B 11 05 00 04 
    //01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 60 00 1C 11 16 06 12 01 0A FF FF 06 12 01 04 0B 47 
  }


  final event cl_UpdateGUI(optional byte aLootMode) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(Outer.Controller);                 //0000 : 0F 00 B8 7A 2B 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
    if (PlayerController != None && PlayerController.GUI != None) {             //0019 : 07 BF 00 82 77 00 B8 7A 2B 11 2A 16 18 12 00 77 19 00 B8 7A 2B 11 05 00 04 01 40 8A 1B 11 2A 16 16 
      switch (aLootMode) {                                                      //003A : 05 01 00 08 79 2B 11 
        case Class'Loot_Transaction'.1 :                                        //0041 : 0A 6A 00 12 20 38 0C 5D 01 02 00 01 24 01 
          PlayerController.GUI.UpdateGroupLoot();                               //004F : 19 19 00 B8 7A 2B 11 05 00 04 01 40 8A 1B 11 06 00 00 1B CF 0E 00 00 16 
          break;                                                                //0067 : 06 BF 00 
        case Class'Loot_Transaction'.2 :                                        //006A : 0A 93 00 12 20 38 0C 5D 01 02 00 01 24 02 
          PlayerController.GUI.UpdateMasterLoot();                              //0078 : 19 19 00 B8 7A 2B 11 05 00 04 01 40 8A 1B 11 06 00 00 1B CE 0E 00 00 16 
          break;                                                                //0090 : 06 BF 00 
        case Class'Loot_Transaction'.0 :                                        //0093 : 0A A1 00 12 20 38 0C 5D 01 02 00 01 24 00 
        default:                                                                //00A1 : 0A FF FF 
          PlayerController.GUI.UpdateSingleLoot();                              //00A4 : 19 19 00 B8 7A 2B 11 05 00 04 01 40 8A 1B 11 06 00 00 1B D0 0E 00 00 16 
          break;                                                                //00BC : 06 BF 00 
      }
    }
    //0F 00 B8 7A 2B 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 07 BF 00 82 77 00 B8 
    //7A 2B 11 2A 16 18 12 00 77 19 00 B8 7A 2B 11 05 00 04 01 40 8A 1B 11 2A 16 16 05 01 00 08 79 2B 
    //11 0A 6A 00 12 20 38 0C 5D 01 02 00 01 24 01 19 19 00 B8 7A 2B 11 05 00 04 01 40 8A 1B 11 06 00 
    //00 1B CF 0E 00 00 16 06 BF 00 0A 93 00 12 20 38 0C 5D 01 02 00 01 24 02 19 19 00 B8 7A 2B 11 05 
    //00 04 01 40 8A 1B 11 06 00 00 1B CE 0E 00 00 16 06 BF 00 0A A1 00 12 20 38 0C 5D 01 02 00 01 24 
    //00 0A FF FF 19 19 00 B8 7A 2B 11 05 00 04 01 40 8A 1B 11 06 00 00 1B D0 0E 00 00 16 06 BF 00 04 
    //0B 47 
  }


  function float cl_GetTransactionTimer(int aTransactionID) {
    local int Index;
    Index = cl_GetTransaction(aTransactionID);                                  //0000 : 0F 00 D0 7C 2B 11 1C 30 7B 2B 11 00 E0 7B 2B 11 16 
    if (Index != -1) {                                                          //0011 : 07 31 00 9B 00 D0 7C 2B 11 1D FF FF FF FF 16 
      return ClientLoot[Index].Timer;                                           //0020 : 04 36 48 7D 2B 11 10 00 D0 7C 2B 11 01 C0 7D 2B 11 
    }
    return -1.00000000;                                                         //0031 : 04 1E 00 00 80 BF 
    //0F 00 D0 7C 2B 11 1C 30 7B 2B 11 00 E0 7B 2B 11 16 07 31 00 9B 00 D0 7C 2B 11 1D FF FF FF FF 16 
    //04 36 48 7D 2B 11 10 00 D0 7C 2B 11 01 C0 7D 2B 11 04 1E 00 00 80 BF 04 0B 47 
  }


  protected final native function int cl_GetTransaction(int aTransactionID);


  final native function cl_EndLootingForTransactions(array<int> aTransactionIDs);


  native function cl_OnFrame(float aDeltaSeconds);


  protected native function sv2cl_ChangeLootMode_CallStub();


  final native event sv2cl_ChangeLootMode(int aTransactionID,float aTimerValue,byte aLootMode,byte aBeforeLootMode);


  protected native function sv2cl_LootItemRejected_CallStub();


  final native event sv2cl_LootItemRejected(int aTransactionID,int aLootItemID,int aReason);


  protected native function sv2cl_RemoveItem_CallStub();


  final native event sv2cl_RemoveItem(int aTransactionID,int aLootItemID);


  protected native function sv2cl_EndTransaction_CallStub();


  final native event sv2cl_EndTransaction(int aTransactionID);


  protected native function sv2cl_InitLootOffer_CallStub();


  final native event sv2cl_InitLootOffer(int aTransactionID,float aTimerValue,byte aLootMode,array<ReplicatedLootItem> aLootItems,array<int> aEligibleMembers);



