//==============================================================================
//  Controller
//==============================================================================

class Controller extends Actor
    native
    abstract
    nativereplication
    dependsOn(AvoidMarker)
    Config(User)
  ;

  const LATENT_MOVETOWARD =  503;
  var Pawn Pawn;
  var const int PlayerNum;
  var float SightCounter;
  var float FovAngle;
  var globalconfig float Handedness;
  var bool bIsPlayer;
  var bool bGodMode;
  var const bool bLOSflag;
  var bool bAdvancedTactics;
  var bool bCanOpenDoors;
  var bool bCanDoSpecial;
  var bool bAdjusting;
  var bool bPreparingMove;
  var bool bControlAnimations;
  var bool bEnemyInfoValid;
  var bool bNotifyApex;
  var bool bUsePlayerHearing;
  var bool bJumpOverWall;
  var bool bEnemyAcquired;
  var bool bSoaking;
  var bool bNotifyFallingHitWall;
  var bool bSlowerZAcquire;
  var bool bInDodgeMove;
  var bool bVehicleTransition;
  var bool bForceStrafe;
  var bool bNotifyPostLanded;
  var input byte bRun;
  var input byte bDuck;
  var input byte bFire;
  var input byte bAltFire;
  var input byte bVoiceTalk;
  var Vector AdjustLoc;
  var const Controller nextController;
  var float Stimulus;
  var float MoveTimer;
  var Actor MoveTarget;
  var Vector Destination;
  var Vector FocalPoint;
  var Actor Focus;
  var float FocusLead;
  var Mover PendingMover;
  var Actor GoalList[4];
  var NavigationPoint home;
  var float MinHitWall;
  var float RespawnPredictionTime;
  var float DodgeToGoalPct;
  var int AcquisitionYawRate;
  var float DodgeLandZ;
  var Pawn Enemy;
  var Actor Target;
  var Vector LastSeenPos;
  var Vector LastSeeingPos;
  var float LastSeenTime;
  var string VoiceType;
  var float OldMessageTime;
  var Actor RouteCache[16];
  var ReachSpec CurrentPath;
  var ReachSpec NextRoutePath;
  var Vector CurrentPathDir;
  var Actor RouteGoal;
  var float RouteDist;
  var float LastRouteFind;
  var Vector DirectionHint;
  var class<Pawn> PawnClass;
  var class<Pawn> PreviousPawnClass;
  var float GroundPitchTime;
  var Vector ViewX;
  var Vector ViewY;
  var Vector ViewZ;
  var NavigationPoint StartSpot;
  var AvoidMarker FearSpots[2];
  var float WarningDelay;
  var Pawn ShotTarget;
  var const Actor LastFailedReach;
  var const float FailedReachTime;
  var const Vector FailedReachLocation;


  event NotifyTakeHit(Pawn instigatedBy,Vector HitLocation,int actualDamage,class<DamageType> DamageType,Vector Momentum);


  event EnemyNotVisible();


  event SeeMonster(Pawn Seen);


  event SeePlayer(Pawn Seen);


  event HearNoise(float Loudness,Actor NoiseMaker);


  event SetupSpecialPathAbilities();


  function FearThisSpot(AvoidMarker aSpot) {
    local int i;
    if (Pawn == None) {                                                         //0000 : 07 0D 00 72 01 88 83 6C 0F 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    if (!LineOfSightTo(aSpot)) {                                                //000D : 07 1C 00 81 62 02 00 08 80 70 0F 16 16 
      return;                                                                   //001A : 04 0B 
    }
    i = 0;                                                                      //001C : 0F 00 D8 81 70 0F 25 
    while (i < 2) {                                                             //0023 : 07 5D 00 96 00 D8 81 70 0F 2C 02 16 
      if (FearSpots[i] == None) {                                               //002F : 07 53 00 72 1A 00 D8 81 70 0F 01 50 82 70 0F 2A 16 
        FearSpots[i] = aSpot;                                                   //0040 : 0F 1A 00 D8 81 70 0F 01 50 82 70 0F 00 08 80 70 0F 
        return;                                                                 //0051 : 04 0B 
      }
      i++;                                                                      //0053 : A5 00 D8 81 70 0F 16 
    }
    i = 0;                                                                      //005D : 0F 00 D8 81 70 0F 25 
    while (i < 2) {                                                             //0064 : 07 D8 00 96 00 D8 81 70 0F 2C 02 16 
      if (VSize(Pawn.Location - FearSpots[i].Location) > VSize(Pawn.Location - aSpot.Location)) {//0070 : 07 CE 00 B1 E1 D8 19 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 1A 00 D8 81 70 0F 01 50 82 70 0F 05 00 0C 01 30 81 6C 0F 16 16 E1 D8 19 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 00 08 80 70 0F 05 00 0C 01 30 81 6C 0F 16 16 16 
        FearSpots[i] = aSpot;                                                   //00BB : 0F 1A 00 D8 81 70 0F 01 50 82 70 0F 00 08 80 70 0F 
        return;                                                                 //00CC : 04 0B 
      }
      i++;                                                                      //00CE : A5 00 D8 81 70 0F 16 
    }
    //07 0D 00 72 01 88 83 6C 0F 2A 16 04 0B 07 1C 00 81 62 02 00 08 80 70 0F 16 16 04 0B 0F 00 D8 81 
    //70 0F 25 07 5D 00 96 00 D8 81 70 0F 2C 02 16 07 53 00 72 1A 00 D8 81 70 0F 01 50 82 70 0F 2A 16 
    //0F 1A 00 D8 81 70 0F 01 50 82 70 0F 00 08 80 70 0F 04 0B A5 00 D8 81 70 0F 16 06 23 00 0F 00 D8 
    //81 70 0F 25 07 D8 00 96 00 D8 81 70 0F 2C 02 16 07 CE 00 B1 E1 D8 19 01 88 83 6C 0F 05 00 0C 01 
    //30 81 6C 0F 19 1A 00 D8 81 70 0F 01 50 82 70 0F 05 00 0C 01 30 81 6C 0F 16 16 E1 D8 19 01 88 83 
    //6C 0F 05 00 0C 01 30 81 6C 0F 19 00 08 80 70 0F 05 00 0C 01 30 81 6C 0F 16 16 16 0F 1A 00 D8 81 
    //70 0F 01 50 82 70 0F 00 08 80 70 0F 04 0B A5 00 D8 81 70 0F 16 06 64 00 04 0B 47 
  }


  function UnderLift(Mover M);


  function MoverFinished();


  function WaitForMover(Mover M);


  event PrepareForMove(NavigationPoint Goal,ReachSpec Path);


  function Vector AdjustToss(float TSpeed,Vector Start,Vector End,bool bNormalize) {
    local Vector Dest2D;
    local Vector Result;
    local Vector Vel2D;
    local float Dist2D;
    if (Start.Z > End.Z + 64) {                                                 //0000 : 07 EA 00 B1 36 38 C5 69 0F 00 F8 B6 37 0F AE 36 38 C5 69 0F 00 70 B7 37 0F 39 3F 2C 40 16 16 
      Dest2D = End;                                                             //001F : 0F 00 E8 B7 37 0F 00 70 B7 37 0F 
      Dest2D.Z = Start.Z;                                                       //002A : 0F 36 38 C5 69 0F 00 E8 B7 37 0F 36 38 C5 69 0F 00 F8 B6 37 0F 
      Dist2D = VSize(Dest2D - Start);                                           //003F : 0F 00 48 8B 36 0F E1 D8 00 E8 B7 37 0F 00 F8 B6 37 0F 16 16 
      TSpeed *= Dist2D / VSize(End - Start);                                    //0053 : B6 00 80 B6 37 0F AC 00 48 8B 36 0F E1 D8 00 70 B7 37 0F 00 F8 B6 37 0F 16 16 16 16 
      Result = SuggestFallVelocity(Dest2D,Start,TSpeed,TSpeed);                 //006F : 0F 00 C0 8B 36 0F 1C D0 C1 34 0F 00 E8 B7 37 0F 00 F8 B6 37 0F 00 80 B6 37 0F 00 80 B6 37 0F 16 
      Vel2D = Result;                                                           //008F : 0F 00 38 8C 36 0F 00 C0 8B 36 0F 
      Vel2D.Z = 0.00000000;                                                     //009A : 0F 36 38 C5 69 0F 00 38 8C 36 0F 1E 00 00 00 00 
      Result.Z = Result.Z + (End.Z - Start.Z) * VSize(Vel2D) / Dist2D;          //00AA : 0F 36 38 C5 69 0F 00 C0 8B 36 0F AE 36 38 C5 69 0F 00 C0 8B 36 0F AC AB AF 36 38 C5 69 0F 00 70 B7 37 0F 36 38 C5 69 0F 00 F8 B6 37 0F 16 E1 00 38 8C 36 0F 16 16 00 48 8B 36 0F 16 16 
    } else {                                                                    //00E7 : 06 0A 01 
      Result = SuggestFallVelocity(End,Start,TSpeed,TSpeed);                    //00EA : 0F 00 C0 8B 36 0F 1C D0 C1 34 0F 00 70 B7 37 0F 00 F8 B6 37 0F 00 80 B6 37 0F 00 80 B6 37 0F 16 
    }
    if (bNormalize) {                                                           //010A : 07 25 01 2D 00 B0 8C 36 0F 
      return TSpeed * Normal(Result);                                           //0113 : 04 D5 00 80 B6 37 0F E2 00 C0 8B 36 0F 16 16 
    } else {                                                                    //0122 : 06 2B 01 
      return Result;                                                            //0125 : 04 00 C0 8B 36 0F 
    }
    //07 EA 00 B1 36 38 C5 69 0F 00 F8 B6 37 0F AE 36 38 C5 69 0F 00 70 B7 37 0F 39 3F 2C 40 16 16 0F 
    //00 E8 B7 37 0F 00 70 B7 37 0F 0F 36 38 C5 69 0F 00 E8 B7 37 0F 36 38 C5 69 0F 00 F8 B6 37 0F 0F 
    //00 48 8B 36 0F E1 D8 00 E8 B7 37 0F 00 F8 B6 37 0F 16 16 B6 00 80 B6 37 0F AC 00 48 8B 36 0F E1 
    //D8 00 70 B7 37 0F 00 F8 B6 37 0F 16 16 16 16 0F 00 C0 8B 36 0F 1C D0 C1 34 0F 00 E8 B7 37 0F 00 
    //F8 B6 37 0F 00 80 B6 37 0F 00 80 B6 37 0F 16 0F 00 38 8C 36 0F 00 C0 8B 36 0F 0F 36 38 C5 69 0F 
    //00 38 8C 36 0F 1E 00 00 00 00 0F 36 38 C5 69 0F 00 C0 8B 36 0F AE 36 38 C5 69 0F 00 C0 8B 36 0F 
    //AC AB AF 36 38 C5 69 0F 00 70 B7 37 0F 36 38 C5 69 0F 00 F8 B6 37 0F 16 E1 00 38 8C 36 0F 16 16 
    //00 48 8B 36 0F 16 16 06 0A 01 0F 00 C0 8B 36 0F 1C D0 C1 34 0F 00 70 B7 37 0F 00 F8 B6 37 0F 00 
    //80 B6 37 0F 00 80 B6 37 0F 16 07 25 01 2D 00 B0 8C 36 0F 04 D5 00 80 B6 37 0F E2 00 C0 8B 36 0F 
    //16 16 06 2B 01 04 00 C0 8B 36 0F 04 0B 47 
  }


  function bool WouldReactToSeeing(Pawn Seen) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool WouldReactToNoise(float Loudness,Actor NoiseMaker) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function byte GetMessageIndex(name PhraseName) {
    return 0;                                                                   //0000 : 04 24 00 
    //04 24 00 04 0B 47 
  }


  function int GetFacingDirection() {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  simulated event RenderOverlays(Canvas Canvas);


  function bool WantsSmoothedView() {
    return Pawn != None
      && (Pawn.Physics == 1 || Pawn.Physics == 9
      || Pawn.Physics == 19
      || Pawn.Physics == 20)
      && !Pawn.bJustLanded;//0000 : 04 82 82 77 01 88 83 6C 0F 2A 16 18 68 00 84 84 84 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 01 16 18 17 00 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 09 16 16 18 17 00 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 13 16 16 18 17 00 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 14 16 16 16 18 12 00 81 19 01 88 83 6C 0F 06 00 04 2D 01 30 89 70 0F 16 16 
    //04 82 82 77 01 88 83 6C 0F 2A 16 18 68 00 84 84 84 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 
    //6C 0F 39 3A 24 01 16 18 17 00 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 09 16 
    //16 18 17 00 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 13 16 16 18 17 00 9A 39 
    //3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 14 16 16 16 18 12 00 81 19 01 88 83 6C 0F 
    //06 00 04 2D 01 30 89 70 0F 16 16 04 0B 47 
  }


  event bool AllowDetourTo(NavigationPoint N) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  simulated event Destroyed() {
    if (Role < 4) {                                                             //0000 : 07 18 00 96 39 3A 01 D0 92 6C 0F 39 3A 24 04 16 
      Super.Destroyed();                                                        //0010 : 1C 30 8A 6D 0F 16 
      return;                                                                   //0016 : 04 0B 
    }
    RemoveController();                                                         //0018 : 62 12 16 
    Super.Destroyed();                                                          //001B : 1C 30 8A 6D 0F 16 
    //07 18 00 96 39 3A 01 D0 92 6C 0F 39 3A 24 04 16 1C 30 8A 6D 0F 16 04 0B 62 12 16 1C 30 8A 6D 0F 
    //16 04 0B 47 
  }


  event PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    //1C D0 02 38 0F 16 04 0B 47 
  }


  event PreBeginPlay() {
    AddController();                                                            //0000 : 62 11 16 
    Super.PreBeginPlay();                                                       //0003 : 1C 18 B5 6C 0F 16 
    if (bDeleteMe) {                                                            //0009 : 07 14 00 2D 01 58 92 6C 0F 
      return;                                                                   //0012 : 04 0B 
    }
    SightCounter = 0.20000000 * FRand();                                        //0014 : 0F 01 48 8E 70 0F AB 1E CD CC 4C 3E C3 16 16 
    //62 11 16 1C 18 B5 6C 0F 16 07 14 00 2D 01 58 92 6C 0F 04 0B 0F 01 48 8E 70 0F AB 1E CD CC 4C 3E 
    //C3 16 16 04 0B 47 
  }


  function PawnIsInPain(PhysicsVolume PainVolume);


  function SetFall();


  function SetDoubleJump();


  event NotifyMissedJump();


  event NotifyJumpApex();


  event NotifyHitMover(Vector HitNormal,Mover Wall);


  event bool NotifyBump(Actor Other);


  event NotifyFallingHitWall(Vector HitNormal,Actor Wall);


  event bool NotifyHitWall(Vector HitNormal,Actor Wall);


  event NotifyPostLanded();


  event bool NotifyLanded(Vector HitNormal);


  event bool NotifyHeadVolumeChange(PhysicsVolume NewVolume);


  event bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume);


  event LongFall();


  function WasKilledBy(Controller Other);


  event SoakStop(string problem);


  event int AIHearSBSound(Actor Actor,Sound s,Vector SoundLocation,float Volume,float Pitch,float Radius,bool Attenuate) {
    return -1;                                                                  //0000 : 04 1D FF FF FF FF 
    //04 1D FF FF FF FF 04 0B 47 
  }


  event AIHearSound(Actor Actor,int Id,Sound s,Vector SoundLocation,Vector Parameters,bool Attenuate);


  function bool AvoidCertainDeath() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function Reset() {
    Super.Reset();                                                              //0000 : 1C A8 B4 34 0F 16 
    Enemy = None;                                                               //0006 : 0F 01 90 AF 70 0F 2A 
    LastSeenTime = 0.00000000;                                                  //000D : 0F 01 08 B0 70 0F 1E 00 00 00 00 
    StartSpot = None;                                                           //0018 : 0F 01 80 B0 70 0F 2A 
    bAdjusting = False;                                                         //001F : 14 2D 01 F8 B0 70 0F 28 
    bPreparingMove = False;                                                     //0027 : 14 2D 01 70 B1 70 0F 28 
    bJumpOverWall = False;                                                      //002F : 14 2D 01 E8 B1 70 0F 28 
    bEnemyAcquired = False;                                                     //0037 : 14 2D 01 60 B2 70 0F 28 
    bInDodgeMove = False;                                                       //003F : 14 2D 01 D8 B2 70 0F 28 
    MoveTimer = -1.00000000;                                                    //0047 : 0F 01 50 B3 70 0F 1E 00 00 80 BF 
    MoveTarget = None;                                                          //0052 : 0F 01 C8 B3 70 0F 2A 
    PendingMover = None;                                                        //0059 : 0F 01 40 B4 70 0F 2A 
    CurrentPath = None;                                                         //0060 : 0F 01 B8 B4 70 0F 2A 
    RouteGoal = None;                                                           //0067 : 0F 01 30 B5 70 0F 2A 
    //1C A8 B4 34 0F 16 0F 01 90 AF 70 0F 2A 0F 01 08 B0 70 0F 1E 00 00 00 00 0F 01 80 B0 70 0F 2A 14 
    //2D 01 F8 B0 70 0F 28 14 2D 01 70 B1 70 0F 28 14 2D 01 E8 B1 70 0F 28 14 2D 01 60 B2 70 0F 28 14 
    //2D 01 D8 B2 70 0F 28 0F 01 50 B3 70 0F 1E 00 00 80 BF 0F 01 C8 B3 70 0F 2A 0F 01 40 B4 70 0F 2A 
    //0F 01 B8 B4 70 0F 2A 0F 01 30 B5 70 0F 2A 04 0B 47 
  }


  simulated function Rotator GetViewRotation() {
    return Rotation;                                                            //0000 : 04 01 00 84 6C 0F 
    //04 01 00 84 6C 0F 04 0B 47 
  }


  simulated function string GetHumanReadableName() {
    return GetItemName(string(self));                                           //0000 : 04 1B 46 29 00 00 39 56 17 16 
    //04 1B 46 29 00 00 39 56 17 16 04 0B 47 
  }


  function DisplayDebug(Canvas Canvas,out float YL,out float YPos) {
    local string DebugString;
    if (Pawn == None) {                                                         //0000 : 07 22 00 72 01 88 83 6C 0F 2A 16 
      Super.DisplayDebug(Canvas,YL,YPos);                                       //000B : 1C 68 EB 35 0F 00 E0 B8 70 0F 00 58 B9 70 0F 00 D0 B9 70 0F 16 
      return;                                                                   //0020 : 04 0B 
    }
    Canvas.SetDrawColor(255,0,0);                                               //0022 : 19 00 E0 B8 70 0F 0E 00 00 1C 30 91 6C 0F 39 3D 2C FF 24 00 24 00 16 
    Canvas.DrawText("CONTROLLER " $ GetItemName(string(self))
      $ " Pawn "
      $ GetItemName(string(Pawn))
      $ " viewpitch "
      $ string(Rotation.Pitch));//0039 : 19 00 E0 B8 70 0F 51 00 00 61 D1 70 70 70 70 70 1F 43 4F 4E 54 52 4F 4C 4C 45 52 20 00 1B 46 29 00 00 39 56 17 16 16 1F 20 50 61 77 6E 20 00 16 1B 46 29 00 00 39 56 01 88 83 6C 0F 16 16 1F 20 76 69 65 77 70 69 74 63 68 20 00 16 39 53 36 A8 BE 69 0F 01 00 84 6C 0F 16 16 
    YPos += YL;                                                                 //0093 : B8 00 D0 B9 70 0F 00 58 B9 70 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //009F : 19 00 E0 B8 70 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 D0 B9 70 0F 16 
    if (Enemy != None) {                                                        //00B8 : 07 19 01 77 01 90 AF 70 0F 2A 16 
      Canvas.DrawText("     STATE: " $ string(GetStateName())
        $ " Timer: "
        $ string(TimerCounter)
        $ " Enemy "
        $ Enemy.GetHumanReadableName(),False);//00C3 : 19 00 E0 B8 70 0F 4A 00 00 61 D1 70 70 70 70 70 1F 20 20 20 20 20 53 54 41 54 45 3A 20 00 39 57 61 1C 16 16 1F 20 54 69 6D 65 72 3A 20 00 16 39 55 01 28 A0 6C 0F 16 1F 20 45 6E 65 6D 79 20 00 16 19 01 90 AF 70 0F 06 00 00 1B F8 2A 00 00 16 16 28 16 
    } else {                                                                    //0116 : 06 5E 01 
      Canvas.DrawText("     STATE: " $ string(GetStateName())
        $ " Timer: "
        $ string(TimerCounter)
        $ " NO Enemy ",False);//0119 : 19 00 E0 B8 70 0F 3C 00 00 61 D1 70 70 70 70 1F 20 20 20 20 20 53 54 41 54 45 3A 20 00 39 57 61 1C 16 16 1F 20 54 69 6D 65 72 3A 20 00 16 39 55 01 28 A0 6C 0F 16 1F 20 4E 4F 20 45 6E 65 6D 79 20 00 16 28 16 
    }
    YPos += YL;                                                                 //015E : B8 00 D0 B9 70 0F 00 58 B9 70 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //016A : 19 00 E0 B8 70 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 D0 B9 70 0F 16 
    if (Target != None) {                                                       //0183 : 07 BA 01 77 01 48 BA 70 0F 2A 16 
    } else {                                                                    //01B7 : 06 D6 01 
    }
    Canvas.DrawText(DebugString);                                               //01D6 : 19 00 E0 B8 70 0F 08 00 00 61 D1 00 C0 BA 70 0F 16 
    YPos += YL;                                                                 //01E7 : B8 00 D0 B9 70 0F 00 58 B9 70 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //01F3 : 19 00 E0 B8 70 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 D0 B9 70 0F 16 
    YPos += YL;                                                                 //020C : B8 00 D0 B9 70 0F 00 58 B9 70 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0218 : 19 00 E0 B8 70 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 D0 B9 70 0F 16 
    //07 22 00 72 01 88 83 6C 0F 2A 16 1C 68 EB 35 0F 00 E0 B8 70 0F 00 58 B9 70 0F 00 D0 B9 70 0F 16 
    //04 0B 19 00 E0 B8 70 0F 0E 00 00 1C 30 91 6C 0F 39 3D 2C FF 24 00 24 00 16 19 00 E0 B8 70 0F 51 
    //00 00 61 D1 70 70 70 70 70 1F 43 4F 4E 54 52 4F 4C 4C 45 52 20 00 1B 46 29 00 00 39 56 17 16 16 
    //1F 20 50 61 77 6E 20 00 16 1B 46 29 00 00 39 56 01 88 83 6C 0F 16 16 1F 20 76 69 65 77 70 69 74 
    //63 68 20 00 16 39 53 36 A8 BE 69 0F 01 00 84 6C 0F 16 16 B8 00 D0 B9 70 0F 00 58 B9 70 0F 16 19 
    //00 E0 B8 70 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 D0 B9 70 0F 16 07 19 01 77 01 90 AF 70 
    //0F 2A 16 19 00 E0 B8 70 0F 4A 00 00 61 D1 70 70 70 70 70 1F 20 20 20 20 20 53 54 41 54 45 3A 20 
    //00 39 57 61 1C 16 16 1F 20 54 69 6D 65 72 3A 20 00 16 39 55 01 28 A0 6C 0F 16 1F 20 45 6E 65 6D 
    //79 20 00 16 19 01 90 AF 70 0F 06 00 00 1B F8 2A 00 00 16 16 28 16 06 5E 01 19 00 E0 B8 70 0F 3C 
    //00 00 61 D1 70 70 70 70 1F 20 20 20 20 20 53 54 41 54 45 3A 20 00 39 57 61 1C 16 16 1F 20 54 69 
    //6D 65 72 3A 20 00 16 39 55 01 28 A0 6C 0F 16 1F 20 4E 4F 20 45 6E 65 6D 79 20 00 16 28 16 B8 00 
    //D0 B9 70 0F 00 58 B9 70 0F 16 19 00 E0 B8 70 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 D0 B9 
    //70 0F 16 07 BA 01 77 01 48 BA 70 0F 2A 16 0E 61 42 00 C0 BA 70 0F A8 1F 20 20 20 20 20 54 61 72 
    //67 65 74 3A 20 00 19 01 48 BA 70 0F 06 00 00 1B F8 2A 00 00 16 16 16 06 D6 01 0E 61 42 00 C0 BA 
    //70 0F 1F 20 20 20 20 20 54 61 72 67 65 74 3A 20 4E 6F 6E 65 00 16 19 00 E0 B8 70 0F 08 00 00 61 
    //D1 00 C0 BA 70 0F 16 B8 00 D0 B9 70 0F 00 58 B9 70 0F 16 19 00 E0 B8 70 0F 10 00 00 1C 80 90 6C 
    //0F 1E 00 00 80 40 00 D0 B9 70 0F 16 B8 00 D0 B9 70 0F 00 58 B9 70 0F 16 19 00 E0 B8 70 0F 10 00 
    //00 1C 80 90 6C 0F 1E 00 00 80 40 00 D0 B9 70 0F 16 04 0B 47 
  }


  function PendingStasis() {
    bStasis = True;                                                             //0000 : 14 2D 01 48 65 6E 0F 27 
    Pawn = None;                                                                //0008 : 0F 01 88 83 6C 0F 2A 
    //14 2D 01 48 65 6E 0F 27 0F 01 88 83 6C 0F 2A 04 0B 47 
  }


  event MissedDodge();


  event MayDodgeToMoveTarget();


  event MayFall();


  final native function bool CanMakePathTo(Actor A);


  native function EndClimbLadder();


  native function StopWaiting();


  final native function bool InLatentExecution(int LatentActionNumber);


  final native(530) function RemoveController();


  final native(529) function AddController();


  final native(527) latent function WaitForLanding();


  final native(526) function bool PickWallAdjust(Vector HitNormal);


  final native(520) function bool ActorReachable(Actor anActor);


  final native(521) function bool PointReachable(Vector aPoint);


  final native(523) function Vector EAdjustJump(float BaseZ,float XYSpeed);


  final native(525) function NavigationPoint FindRandomDest();


  final native function Actor FindPathTowardNearest(class<NavigationPoint> GoalClass,optional bool bWeightDetours);


  final native function Actor FindPathToIntercept(Pawn P,Actor RouteGoal,optional bool bWeightDetours);


  final native(517) function Actor FindPathToward(Actor anActor,optional bool bWeightDetours);


  final native(518) function Actor FindPathTo(Vector aPoint);


  final native(533) function bool CanSee(Pawn Other);


  final native(514) function bool LineOfSightTo(Actor Other);


  final native(508) latent function FinishRotation();


  final native(502) latent function MoveToward(Actor NewTarget,optional Actor ViewFocus,optional float DestinationOffset,optional bool bUseStrafing,optional bool bShouldWalk);


  final native(500) latent function MoveTo(Vector NewDestination,optional Actor ViewFocus,optional bool bShouldWalk);



