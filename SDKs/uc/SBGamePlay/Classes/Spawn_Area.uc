//==============================================================================
//  Spawn_Area
//==============================================================================

class Spawn_Area extends NPC_Spawner
    native
    abstract
    dependsOn()
    Config(charstats)
  ;

  var (Policy) float MaxSpawnDistance;
  var (Policy) bool LoSSpawning;
  var (Policy) float MaxSpawnHeight;



