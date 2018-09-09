//==============================================================================
//  Spawn_Wildlife
//==============================================================================

class Spawn_Wildlife extends Spawn_Area
    native
    dependsOn(Game_NPCController)
    Config(charstats)
  ;

  var (Spawn) const export editinline NPC_Type NPCType;
  var (Spawn) int LevelMin;
  var (Spawn) int LevelMax;
  var (Policy) int SpawnMin;
  var (Policy) int SpawnMax;
  var (Policy) bool UseAbsoluteAmounts;
  var (Policy) float RespawnTime;
  var (Policy) float RespawnVariation;
  var (aI) class<AIStateMachine> StateMachine;
  var transient int SpawnAmount;
  var transient float mTimer;


  event sv_Despawn() {
    local int spawnI;
    spawnI = 0;                                                                 //0000 : 0F 00 E0 EA 30 0F 25 
    while (spawnI < Spawns.Length) {                                            //0007 : 07 43 00 96 00 E0 EA 30 0F 37 01 08 A1 38 11 16 
      Spawns[spawnI].sv_Despawn();                                              //0017 : 19 10 00 E0 EA 30 0F 01 08 A1 38 11 06 00 00 1C E0 41 34 0F 16 
      Spawns[spawnI] = None;                                                    //002C : 0F 10 00 E0 EA 30 0F 01 08 A1 38 11 2A 
      spawnI++;                                                                 //0039 : A5 00 E0 EA 30 0F 16 
    }
    Spawns.Length = 0;                                                          //0043 : 0F 37 01 08 A1 38 11 25 
    SpawnAmount = 0;                                                            //004B : 0F 01 F8 EB 30 0F 25 
    //0F 00 E0 EA 30 0F 25 07 43 00 96 00 E0 EA 30 0F 37 01 08 A1 38 11 16 19 10 00 E0 EA 30 0F 01 08 
    //A1 38 11 06 00 00 1C E0 41 34 0F 16 0F 10 00 E0 EA 30 0F 01 08 A1 38 11 2A A5 00 E0 EA 30 0F 16 
    //06 07 00 0F 37 01 08 A1 38 11 25 0F 01 F8 EB 30 0F 25 04 0B 47 
  }



