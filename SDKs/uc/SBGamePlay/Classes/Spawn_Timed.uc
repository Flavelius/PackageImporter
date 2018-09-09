//==============================================================================
//  Spawn_Timed
//==============================================================================

class Spawn_Timed extends Spawn_Triggered
    native
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  var (Spawn) float SpawnInterval;
  var (Spawn) bool StopTimerIfWiped;
  var (Spawn) bool OnlyStopTimerOnDespawn;
  var float SpawnTimer;
  var bool TimerStarted;


  function sv_Despawn() {
    if (!OnlyStopTimerOnDespawn) {                                              //0000 : 07 11 00 81 2D 01 70 3E 00 14 16 
      Super.sv_Despawn();                                                       //000B : 1C D8 DD 30 0F 16 
    }
    TimerStarted = False;                                                       //0011 : 14 2D 01 E8 3E 00 14 28 
    SpawnTimer = 0.00000000;                                                    //0019 : 0F 01 60 3F 00 14 1E 00 00 00 00 
    //07 11 00 81 2D 01 70 3E 00 14 16 1C D8 DD 30 0F 16 14 2D 01 E8 3E 00 14 28 0F 01 60 3F 00 14 1E 
    //00 00 00 00 04 0B 47 
  }



