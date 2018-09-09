//==============================================================================
//  NE_Standard
//==============================================================================

class NE_Standard extends NPC_Equipment
    native
    collapsecategories
    dependsOn(Game_Pawn,Game_NPCItemManager)
  ;

  var (Equipment) editinline array<Item_Type> Items;
  var (Equipment) byte Color1;
  var (Equipment) byte Color2;


  function Apply(Game_Pawn aPawn) {
    local export editinline Game_NPCItemManager itemManager;
    itemManager = Game_NPCItemManager(aPawn.itemManager);                       //0000 : 0F 00 A0 5C E9 14 2E A0 60 60 01 19 00 28 5C E9 14 05 00 04 01 B0 2D 19 11 
    if (itemManager != None) {                                                  //0019 : 07 4C 00 77 00 A0 5C E9 14 2A 16 
      itemManager.InitializeArray(Items,Color1,Color2,Color1,Color2);           //0024 : 19 00 A0 5C E9 14 1F 00 00 1C 88 CF 35 11 01 B0 5B E9 14 01 18 5D E9 14 01 90 5D E9 14 01 18 5D E9 14 01 90 5D E9 14 16 
    }
    //0F 00 A0 5C E9 14 2E A0 60 60 01 19 00 28 5C E9 14 05 00 04 01 B0 2D 19 11 07 4C 00 77 00 A0 5C 
    //E9 14 2A 16 19 00 A0 5C E9 14 1F 00 00 1C 88 CF 35 11 01 B0 5B E9 14 01 18 5D E9 14 01 90 5D E9 
    //14 01 18 5D E9 14 01 90 5D E9 14 16 04 0B 47 
  }



