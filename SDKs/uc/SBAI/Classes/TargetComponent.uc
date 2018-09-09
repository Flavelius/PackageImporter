//==============================================================================
//  TargetComponent
//==============================================================================

class TargetComponent extends Base_Component within Game_AIController
    native
    exportstructs
    dependsOn()
  ;

  enum EPrecitionMethod {
    EPM_Unknown ,
    EPM_Dead ,
    EPM_Path ,
    EPM_Destination ,
    EPM_Now ,
    EPM_History ,
    EPM_Velocity 
  };

  enum EFilterResult {
    EFR_None ,
    EFR_Ok ,
    EFR_Precondition ,
    EFR_Invalid ,
    EFR_Dead ,
    EFR_Class ,
    EFR_Filtered ,
    EFR_Unreachable ,
    EFR_OutOfRange ,
    EFR_Invulnerable ,
    EFR_Deselected 
  };

  enum ETargettingMode {
    ETM_None ,
    ETM_Location ,
    ETM_Fixed ,
    ETM_Nearest ,
    ETM_Random ,
    ETM_Combat 
  };

  struct VisualMemoryStruct {
      var float LastSeen;
      var bool CurrentlyDetected;

  };


  struct PredictionStruct {
      var byte Method;
      var Game_Pawn Pawn;
      var float ServerTime;
      var float DeltaTime;
      var float Certainty;
      var Vector Result;

  };


  struct UnreachableStruct {
      var Game_Pawn Pawn;
      var float Range;
      var float Area;
      var Vector Location;
      var float Time;

  };


  struct TargetConfigStruct {
      var Object mOwner;
      var byte Mode;
      var Vector TargetLocation;
      var Actor TargetActor;
      var class<Object> TargetClass;
      var float TargetRange;
      var bool Detection;
      var float RetargetSlack;
      var float DistanceSlack;
      var float UnreachableSlack;
      var transient int FilterFunction;
      var Object FilterDelegateObject;
      var name FilterDelegateName;

  };


  struct DetectedStruct {
      var Actor Detected;
      var float SqrDistance;
      var byte Status;
      var bool Enemy;
      var bool Ally;

  };


  var bool Initialized;
  var byte Mode;
  var Vector TargetLocation;
  var Actor TargetActor;
  var class<Object> TargetClass;
  var float TargetRange;
  var bool Detection;
  var float VisualRange;
  var float LineOfSightRange;
  var array<UnreachableStruct> Unreachable;
  var bool AllEnemiesUnreachable;
  var bool HadTarget;
  var Actor Target;
  var Vector Location;
  var array<DetectedStruct> Detected;
  var array<DetectedStruct> OldDetected;
  var transient int VisualMemory;
  var int Enemies;
  var int Allies;
  var int UnreachableEnemies;
  var int UnreachableAllies;
  var int DetectedEnemies;
  var int DetectedAllies;
  var float AimedTime;
  var export editinline FSkill_Type Skill;
  var float MinBattleZone;
  var float MaxBattleZone;
  var float NoTargetCombatTime;
  var float RetargetSlack;
  var float DistanceSlack;
  var float UnreachableSlack;
  var float VisualMemoryTime;
  var float RecomputeTimer;
  var float PreviousDistance;
  var array<TargetConfigStruct> ConfigStack;
  var bool AnalyzePrediction;
  var array<PredictionStruct> PredictionResults;
  var transient int FilterFunction;
  var (null);


  function float SetDistanceSlack(float aNewSlack) {
    local float ret;
    ret = DistanceSlack;                                                        //0000 : 0F 00 08 75 FC 13 01 80 75 FC 13 
    DistanceSlack = aNewSlack;                                                  //000B : 0F 01 80 75 FC 13 00 80 6B FC 13 
    return ret;                                                                 //0016 : 04 00 08 75 FC 13 
    //0F 00 08 75 FC 13 01 80 75 FC 13 0F 01 80 75 FC 13 00 80 6B FC 13 04 00 08 75 FC 13 04 0B 47 
  }


  function float SetTargetSlack(float aNewSlack) {
    local float ret;
    ret = RetargetSlack;                                                        //0000 : 0F 00 18 78 FC 13 01 90 78 FC 13 
    RetargetSlack = aNewSlack;                                                  //000B : 0F 01 90 78 FC 13 00 48 77 FC 13 
    return ret;                                                                 //0016 : 04 00 18 78 FC 13 
    //0F 00 18 78 FC 13 01 90 78 FC 13 0F 01 90 78 FC 13 00 48 77 FC 13 04 00 18 78 FC 13 04 0B 47 
  }


  native function SetLineOfSight(float aLineOfSightRange);


  native function SetVisualRange(float aVisualRange);


  native function SetDetection(bool aOn);


  native function SetCombat();


  native function SetRandomPawn(optional Actor aOrigin,optional float aRange);


  native function SetRandomActor(optional class<Object> aClass,optional float aRange,optional Actor aOrigin);


  native function SetNearestPawn(optional float aRange,optional Actor aOrigin);


  native function SetNearestActor(optional class<Object> aClass,optional float aRange,optional Actor aOrigin);


  native function SetPawn(Game_Pawn aPawn);


  native function SetActor(Actor aActor);


  native function SetLocation(Vector aLocation);


  native function SetDisabled();


  function bool DetectingAllies() {
    return Allies > 0;                                                          //0000 : 04 97 01 50 8D FC 13 25 16 
    //04 97 01 50 8D FC 13 25 16 04 0B 47 
  }


  function bool DetectingEnemies() {
    return Enemies > 0;                                                         //0000 : 04 97 01 28 8F FC 13 25 16 
    //04 97 01 28 8F FC 13 25 16 04 0B 47 
  }


  function bool IsDetecting() {
    return Detection;                                                           //0000 : 04 2D 01 00 91 FC 13 
    //04 2D 01 00 91 FC 13 04 0B 47 
  }


  native function GetAllies(out array<Game_Pawn> oEnemies);


  native function GetEnemies(out array<Game_Pawn> oEnemies);


  native function GetCandidates(out array<Game_Pawn> oEnemies);


  native function GetDetected(out array<Game_Pawn> oDetected);


  function Game_Pawn GetPawn() {
    return Game_Pawn(GetTarget());                                              //0000 : 04 2E 18 38 5B 01 1B D2 6F 00 00 16 
    //04 2E 18 38 5B 01 1B D2 6F 00 00 16 04 0B 47 
  }


  function Actor GetTarget() {
    return Target;                                                              //0000 : 04 01 A0 9B FC 13 
    //04 01 A0 9B FC 13 04 0B 47 
  }


  function Vector GetTargetLocation() {
    return Location;                                                            //0000 : 04 01 78 9D FC 13 
    //04 01 78 9D FC 13 04 0B 47 
  }


  delegate byte FilterTarget(Actor aActor);



