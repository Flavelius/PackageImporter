//==============================================================================
//  Spawn_Group
//==============================================================================

class Spawn_Group extends Spawn_Area
    native
    abstract
    dependsOn(Game_NPCController)
    Config(charstats)
  ;

  var (Spawn) export editinline NPC_Group ClassGroup;
  var (Spawn) export editinline NPC_Taxonomy Faction;
  var (Spawn) int MinLevel;
  var (Spawn) int MaxLevel;
  var (Spawn) int PePRank;
  var (Spawn) int rank;
  var (Policy) float RespawnTimeout;
  var (Policy) float RespawnVariation;
  var (Policy) bool SpawnImmediatly;
  var (aI) class<AIStateMachine> StateMachine;
  var (aI) class<NPC_AI> GroupMind;
  var private transient float mTimer;
  var private transient bool mAllDead;
  var private transient bool mSomeDead;
  var transient NPC_AI GroupAI;
  var transient array<NPC_Type> Configuration;
  var transient Vector SpawnerLocation;


  event sv_Despawn() {
    local int spawnI;
    spawnI = 0;                                                                 //0000 : 0F 00 38 F3 30 0F 25 
    while (spawnI < Spawns.Length) {                                            //0007 : 07 8C 00 96 00 38 F3 30 0F 37 01 08 A1 38 11 16 
      if (Spawns[spawnI] != None && !Spawns[spawnI].IsDead()
        && !Spawns[spawnI].IsDespawned()) {//0017 : 07 82 00 82 82 77 10 00 38 F3 30 0F 01 08 A1 38 11 2A 16 18 18 00 81 19 10 00 38 F3 30 0F 01 08 A1 38 11 06 00 04 1B 9B 05 00 00 16 16 16 18 18 00 81 19 10 00 38 F3 30 0F 01 08 A1 38 11 06 00 04 1B 2A 10 00 00 16 16 16 
        Spawns[spawnI].sv_Despawn();                                            //0060 : 19 10 00 38 F3 30 0F 01 08 A1 38 11 06 00 00 1C E0 41 34 0F 16 
        Spawns[spawnI] = None;                                                  //0075 : 0F 10 00 38 F3 30 0F 01 08 A1 38 11 2A 
      }
      spawnI++;                                                                 //0082 : A5 00 38 F3 30 0F 16 
    }
    Spawns.Length = 0;                                                          //008C : 0F 37 01 08 A1 38 11 25 
    //0F 00 38 F3 30 0F 25 07 8C 00 96 00 38 F3 30 0F 37 01 08 A1 38 11 16 07 82 00 82 82 77 10 00 38 
    //F3 30 0F 01 08 A1 38 11 2A 16 18 18 00 81 19 10 00 38 F3 30 0F 01 08 A1 38 11 06 00 04 1B 9B 05 
    //00 00 16 16 16 18 18 00 81 19 10 00 38 F3 30 0F 01 08 A1 38 11 06 00 04 1B 2A 10 00 00 16 16 16 
    //19 10 00 38 F3 30 0F 01 08 A1 38 11 06 00 00 1C E0 41 34 0F 16 0F 10 00 38 F3 30 0F 01 08 A1 38 
    //11 2A A5 00 38 F3 30 0F 16 06 07 00 0F 37 01 08 A1 38 11 25 04 0B 47 
  }



