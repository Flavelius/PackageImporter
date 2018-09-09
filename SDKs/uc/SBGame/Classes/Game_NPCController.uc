//==============================================================================
//  Game_NPCController
//==============================================================================

class Game_NPCController extends Game_Controller
    native
    dependsOn()
    Config(User)
  ;

  var export editinline NPC_Type NPCType;
  var bool bDespawned;
  var bool BreakAI;


  function sv_InitInternal();


  function Game_NPCPawn GetNPCPawn() {
    return Game_NPCPawn(Pawn);                                                  //0000 : 04 2E D0 32 5B 01 01 88 83 6C 0F 
    //04 2E D0 32 5B 01 01 88 83 6C 0F 04 0B 47 
  }


  function LootTable sv_GetLootTable() {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  final native function sv_Despawn();


  native function sv_OnSpawn(int aFameLevel,int aPePRank,export editinline NPC_Taxonomy aFaction);



