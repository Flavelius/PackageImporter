//==============================================================================
//  NPC_Habitat
//==============================================================================

class NPC_Habitat extends Actor
    native
    abstract
    exportstructs
    dependsOn()
  ;

  struct WanderObstacle {
      var (WanderObstacle) Actor Obstacle;
      var (WanderObstacle) Vector Offset;
      var (WanderObstacle) float Size;
      var (WanderObstacle) float Range;

  };


  struct WanderSmell {
      var (WanderSmell) Vector Location;
      var (WanderSmell) float Strength;
      var (WanderSmell) float Size;

  };


  var (aI) float HabitatRange;
  var (Hormones) float DesolationRate;
  var (Habitat) array<NPC_Spawner> Prey;
  var (Habitat) array<WanderSmell> Smells;
  var (Habitat) int SmellSpawns;
  var (Habitat) array<WanderObstacle> Obstacles;
  var (Habitat) float IntruderAttraction;
  var (Habitat) float SocialAttraction;


  final native function bool CheckHabitat(Vector aLocation);



