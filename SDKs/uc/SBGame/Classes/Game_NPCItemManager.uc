//==============================================================================
//  Game_NPCItemManager
//==============================================================================

class Game_NPCItemManager extends Game_ItemManager within Game_Pawn
    native
    exportstructs
    dependsOn(Game_NPCPawn,NPC_Type,NPC_Equipment)
  ;


  final native function InitializeSingleItem(export editinline Item_Type aItem,byte aColor1,byte aColor2);


  final native function InitializeArray(array<Item_Type> aItems,byte aClothColor1,byte aClothColor2,byte aArmorColor1,byte aArmorColor2);


  function cl_OnInit() {
    local Game_NPCPawn NPC;
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    NPC = Game_NPCPawn(Outer);                                                  //0006 : 0F 00 60 D5 35 11 2E D0 32 5B 01 01 00 E4 6B 0F 
    if (NPC != None && NPC.NPCType.Equipment != None) {                         //0016 : 07 66 00 82 77 00 60 D5 35 11 2A 16 18 1B 00 77 19 19 00 60 D5 35 11 05 00 04 01 00 47 1B 11 05 00 04 01 98 BA 21 11 2A 16 16 
      NPC.NPCType.Equipment.Apply(Outer);                                       //0040 : 19 19 19 00 60 D5 35 11 05 00 04 01 00 47 1B 11 05 00 04 01 98 BA 21 11 0B 00 00 1B 80 04 00 00 01 00 E4 6B 0F 16 
    }
    //1C E0 C4 19 11 16 0F 00 60 D5 35 11 2E D0 32 5B 01 01 00 E4 6B 0F 07 66 00 82 77 00 60 D5 35 11 
    //2A 16 18 1B 00 77 19 19 00 60 D5 35 11 05 00 04 01 00 47 1B 11 05 00 04 01 98 BA 21 11 2A 16 16 
    //19 19 19 00 60 D5 35 11 05 00 04 01 00 47 1B 11 05 00 04 01 98 BA 21 11 0B 00 00 1B 80 04 00 00 
    //01 00 E4 6B 0F 16 04 0B 47 
  }



