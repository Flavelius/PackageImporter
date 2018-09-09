//==============================================================================
//  Spawn_NPC
//==============================================================================

class Spawn_NPC extends NPC_Spawner
    native
    dependsOn(Game_NPCController)
    Config(charstats)
  ;

  var (Spawn) const export editinline NPC_Type NPCType;
  var (Policy) float RespawnTimeout;
  var (aI) class<AIStateMachine> StateMachine;
  var float RespawnTimer;


  event sv_Despawn() {
    if (Spawns.Length > 0) {                                                    //0000 : 07 25 00 97 37 01 08 A1 38 11 25 16 
      Spawns[0].sv_Despawn();                                                   //000C : 19 10 25 01 08 A1 38 11 06 00 00 1C E0 41 34 0F 16 
      Spawns.Length = 0;                                                        //001D : 0F 37 01 08 A1 38 11 25 
    }
    //07 25 00 97 37 01 08 A1 38 11 25 16 19 10 25 01 08 A1 38 11 06 00 00 1C E0 41 34 0F 16 0F 37 01 
    //08 A1 38 11 25 04 0B 47 
  }



