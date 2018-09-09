//==============================================================================
//  GameEngine
//==============================================================================

class GameEngine extends Engine
    native
    noexport
    dependsOn()
    Transient
    Config(System)
  ;

  struct URL {
      var string Protocol;
      var string Host;
      var int Port;
      var string Map;
      var array<string> Op;
      var string Portal;
      var int Valid;

  };


  var string mGameType;
  var string mWorldFile;
  var URL LastURL;
  var config array<string> ServerActors;
  var config array<string> ServerPackages;
  var (Settings) config bool ColorHighDetailMeshes;
  var (Settings) config bool ColorSlowCollisionMeshes;
  var (Settings) config bool ColorNoCollisionMeshes;
  var (Settings) config bool ColorWorldTextures;
  var (Settings) config bool ColorPlayerAndWeaponTextures;
  var (Settings) config bool ColorInterfaceTextures;
  var (VoiceChat) globalconfig bool VoIPAllowVAD;
  var const LevelInfo LevelInfo;
  var const Level GLevel;
  var const GameInfo GGameInfo;
  var const int DetailMode;


  final native function int GetInstanceID();


  final native function bool IsInstance();


  final native function int GetUniverseID();


  final native function int GetWorldID();


  final native function PlayerController GetPlayerController();


  final native(1001) iterator function AllActors(class<Actor> BaseClass,out Actor Actor,optional name MatchTag);


  final native(1000) function Actor Spawn(class<Actor> SpawnClass,optional Actor SpawnOwner,optional name SpawnTag,optional Vector SpawnLocation,optional Rotator SpawnRotation,optional int InstanceID);



