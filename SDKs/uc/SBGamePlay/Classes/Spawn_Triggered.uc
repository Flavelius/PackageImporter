//==============================================================================
//  Spawn_Triggered
//==============================================================================

class Spawn_Triggered extends Spawn_Area
    native
    exportstructs
    dependsOn(Game_NPCController)
    Config(charstats)
  ;

  struct SpawnConfig {
      var (SpawnConfig) export editinline NPC_Type NPCType;
      var (SpawnConfig) export editinline NPC_Taxonomy Faction;
      var (SpawnConfig) int Chance;
      var (SpawnConfig) int MinLevel;
      var (SpawnConfig) int MaxLevel;
      var (SpawnConfig) int PePRank;

  };


  var transient Vector SpawnerLocation;
  var transient SpawnConfig CurrentlySpawning;
  var transient int WaveCount;
  var (Spawn) editinline array<SpawnConfig> SpawnerConfig;
  var (Spawn) float MinSpawnsPerWave;
  var (Spawn) float MaxSpawnsPerWave;
  var (Spawn) float MaxSpawnsAlive;
  var (Spawn) float MaxWaves;
  var (Spawn) bool UseChanceAsCount;
  var (aI) class<AIStateMachine> StateMachine;


  function sv_Despawn() {
    local int is;
    is = 0;                                                                     //0000 : 0F 00 38 DF 30 0F 25 
    while (is < Spawns.Length) {                                                //0007 : 07 43 00 96 00 38 DF 30 0F 37 01 08 A1 38 11 16 
      Spawns[is].sv_Despawn();                                                  //0017 : 19 10 00 38 DF 30 0F 01 08 A1 38 11 06 00 00 1C E0 41 34 0F 16 
      Spawns[is] = None;                                                        //002C : 0F 10 00 38 DF 30 0F 01 08 A1 38 11 2A 
      is++;                                                                     //0039 : A5 00 38 DF 30 0F 16 
    }
    Spawns.Length = 0;                                                          //0043 : 0F 37 01 08 A1 38 11 25 
    //0F 00 38 DF 30 0F 25 07 43 00 96 00 38 DF 30 0F 37 01 08 A1 38 11 16 19 10 00 38 DF 30 0F 01 08 
    //A1 38 11 06 00 00 1C E0 41 34 0F 16 0F 10 00 38 DF 30 0F 01 08 A1 38 11 2A A5 00 38 DF 30 0F 16 
    //06 07 00 0F 37 01 08 A1 38 11 25 04 0B 47 
  }


  function PostBeginPlay() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 E8 E0 30 0F 25 
    while (i < SpawnerConfig.Length) {                                          //0007 : 07 21 00 96 00 E8 E0 30 0F 37 01 C8 E1 30 0F 16 
      i++;                                                                      //0017 : A5 00 E8 E0 30 0F 16 
    }
    Super.PostBeginPlay();                                                      //0021 : 1C D0 02 38 0F 16 
    //0F 00 E8 E0 30 0F 25 07 21 00 96 00 E8 E0 30 0F 37 01 C8 E1 30 0F 16 A5 00 E8 E0 30 0F 16 06 07 
    //00 1C D0 02 38 0F 16 04 0B 47 
  }



