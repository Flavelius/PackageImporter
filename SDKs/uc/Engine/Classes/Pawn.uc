//==============================================================================
//  Pawn
//==============================================================================

class Pawn extends Actor
    native
    nativereplication
    exportstructs
    dependsOn(Controller,Class,DamageType,LadderVolume,AIController,Projector)
    Placeable
    Config(User)
  ;

  struct HitFXData {
      var (HitFXData) name Bone;
      var (HitFXData) class<DamageType> damtype;
      var (HitFXData) bool bSever;
      var (HitFXData) Rotator rotDir;

  };


  var Controller Controller;
  var float NetRelevancyTime;
  var PlayerController LastRealViewer;
  var Actor LastViewer;
  var const float LastLocTime;
  var bool bJustLanded;
  var bool bLandRecovery;
  var bool bUpAndOut;
  var bool bIsWalking;
  var bool bWarping;
  var bool bWantsToCrouch;
  var const bool bIsCrouched;
  var const bool bTryToUncrouch;
  var (Pawn) bool bCanCrouch;
  var bool bCrawler;
  var const bool bReducedSpeed;
  var bool bJumpCapable;
  var bool bCanJump;
  var bool bCanWalk;
  var bool bCanSwim;
  var bool bCanFly;
  var bool bCanClimbLadders;
  var bool bCanStrafe;
  var bool bCanRest;
  var bool bCanWalkBackwards;
  var bool bAvoidLedges;
  var bool bStopAtLedges;
  var bool bNoJumpAdjust;
  var bool bCountJumps;
  var const bool bSimulateGravity;
  var bool bUpdateEyeheight;
  var bool bIgnoreForces;
  var const bool bNoVelocityUpdate;
  var bool bCanWalkOffLedges;
  var bool bCanBeBaseForPawns;
  var bool bClientCollision;
  var const bool bSimGravityDisabled;
  var bool bDirectHitWall;
  var bool bServerMoveSetPawnRot;
  var bool bDrawCorona;
  var globalconfig bool bNoCoronas;
  var bool bThumped;
  var bool bInvulnerableBody;
  var Vector desiredMovement;
  var float lastUpdateTime;
  var bool bIsFemale;
  var bool bAutoActivate;
  var bool bCanPickupInventory;
  var bool bUpdatingDisplay;
  var bool bAmbientCreature;
  var (aI) bool bLOSHearing;
  var (aI) bool bSameZoneHearing;
  var (aI) bool bAdjacentZoneHearing;
  var (aI) bool bMuffledHearing;
  var (aI) bool bAroundCornerHearing;
  var bool bRollToDesired;
  var bool bIgnorePlayFiring;
  var bool bStationary;
  var bool bCachedRelevant;
  var bool bUseCompressedPosition;
  var bool bHideRegularHUD;
  var bool bSpecialHUD;
  var bool bSpecialCrosshair;
  var bool bSpecialCalcView;
  var bool bIsTyping;
  var bool bScriptPostRender;
  var bool bCanUse;
  var bool bSuperSize;
  var byte FlashCount;
  var byte Visibility;
  var transient byte LastRelevantValue;
  var float DesiredSpeed;
  var float MaxDesiredSpeed;
  var (aI) name AIScriptTag;
  var (aI) float HearingThreshold;
  var (aI) float Alertness;
  var (aI) float SightRadius;
  var (aI) float PeripheralVision;
  var (Pawn) float SkillModifier;
  var const float AvgPhysicsTime;
  var float MeleeRange;
  var float NavigationPointRange;
  var NavigationPoint Anchor;
  var const NavigationPoint LastAnchor;
  var float FindAnchorFailedTime;
  var float LastValidAnchorTime;
  var float DestinationOffset;
  var float NextPathRadius;
  var Vector SerpentineDir;
  var float SerpentineDist;
  var float SerpentineTime;
  var const float UncrouchTime;
  var float SpawnTime;
  var transient int LastRelevantTick;
  var float GroundSpeed;
  var float WaterSpeed;
  var float AirSpeed;
  var float LadderSpeed;
  var float AccelRate;
  var float JumpZ;
  var float AirControl;
  var float WalkingPct;
  var float CrouchedPct;
  var float MaxFallSpeed;
  var Vector ConstantAcceleration;
  var (Pawn) int PitchUpLimitBehindView;
  var (Pawn) int PitchUpLimitFirstPersonView;
  var (Pawn) int PitchDownLimit;
  var string OwnerName;
  var float BaseEyeHeight;
  var float EyeHeight;
  var Vector Floor;
  var float SplashTime;
  var float CrouchHeight;
  var float CrouchRadius;
  var float OldZ;
  var PhysicsVolume HeadVolume;
  var float BreathTime;
  var float UnderWaterTime;
  var float LastPainTime;
  var class<DamageType> ReducedDamageType;
  var float HeadRadius;
  var float HeadHeight;
  var float HeadScale;
  var const Vector noise1spot;
  var const float noise1time;
  var const Pawn noise1other;
  var const float noise1loudness;
  var const Vector noise2spot;
  var const float noise2time;
  var const Pawn noise2other;
  var const float noise2loudness;
  var float LastPainSound;
  var globalconfig float Bob;
  var float LandBob;
  var float AppliedBob;
  var float bobtime;
  var Vector WalkBob;
  var float SoundDampening;
  var float DamageScaling;
  var globalconfig float AmbientSoundScaling;
  var localized string MenuName;
  var Projector Shadow;
  var class<Effects> BloodEffect;
  var class<Effects> LowGoreBlood;
  var class<AIController> ControllerClass;
  var LadderVolume OnLadder;
  var name LandMovementState;
  var name WaterMovementState;
  var PlayerStart LastStartSpot;
  var float LastStartTime;
  var Vector TakeHitLocation;
  var class<DamageType> HitDamageType;
  var Vector TearOffMomentum;
  var byte OldPhysics;
  var bool bPhysicsAnimUpdate;
  var bool bWasCrouched;
  var bool bWasWalking;
  var bool bWasOnGround;
  var bool bInitializeAnimation;
  var bool bPlayedDeath;
  var bool bIsIdle;
  var bool bWaitForAnim;
  var const bool bReverseRun;
  var bool bDoTorsoTwist;
  var const bool FootTurning;
  var const bool FootStill;
  var const byte ViewPitch;
  var int SmoothViewPitch;
  var int SmoothViewYaw;
  var int OldRotYaw;
  var Vector OldAcceleration;
  var (AnimTweaks) float BlendChangeTime;
  var float MovementBlendStartTime;
  var float ForwardStrafeBias;
  var float BackwardStrafeBias;
  var const int OldAnimDir;
  var const Vector OldVelocity;
  var float IdleTime;
  var const int FootRot;
  var const int TurnDir;
  var (Shield) transient float ShieldStrength;
  var (Pawn) HitFXData HitFx[8];
  var transient int HitFxTicker;
  var transient CompressedPosition PawnPosition;
  var Controller DelayedDamageInstigatorController;
  var Controller LastHitBy;
  var float MinFlySpeed;
  var float MaxRotation;
  var bool bIsPreviewPawn;
  var transient bool bIsJumping;


  simulated function ClientSetDesiredMovement(Vector aVector) {
    desiredMovement = aVector;                                                  //0000 : 0F 01 60 A3 75 0F 00 A8 A2 75 0F 
    //0F 01 60 A3 75 0F 00 A8 A2 75 0F 04 0B 47 
  }


  function SetDesiredMovement(Vector aVector) {
    desiredMovement = aVector;                                                  //0000 : 0F 01 60 A3 75 0F 00 B0 A4 75 0F 
    ClientSetDesiredMovement(aVector);                                          //000B : 1B 9F 2B 00 00 00 B0 A4 75 0F 16 
    //0F 01 60 A3 75 0F 00 B0 A4 75 0F 1B 9F 2B 00 00 00 B0 A4 75 0F 16 04 0B 47 
  }


  simulated function Vector GetTargetLocation() {
    return Location;                                                            //0000 : 04 01 30 81 6C 0F 
    //04 01 30 81 6C 0F 04 0B 47 
  }


  function float RangedAttackTime() {
    return 0.00000000;                                                          //0000 : 04 1E 00 00 00 00 
    //04 1E 00 00 00 00 04 0B 47 
  }


  function bool CheatFly() {
    UnderWaterTime = default.UnderWaterTime;                                    //0000 : 0F 01 40 0E 38 0F 02 40 0E 38 0F 
    SetCollision(True,True);                                                    //000B : 61 06 27 27 16 
    bCollideWorld = True;                                                       //0010 : 14 2D 01 60 E8 35 0F 27 
    return True;                                                                //0018 : 04 27 
    //0F 01 40 0E 38 0F 02 40 0E 38 0F 61 06 27 27 16 14 2D 01 60 E8 35 0F 27 04 27 04 0B 47 
  }


  function bool CheatGhost() {
    UnderWaterTime = -1.00000000;                                               //0000 : 0F 01 40 0E 38 0F 1E 00 00 80 BF 
    SetCollision(False,False);                                                  //000B : 61 06 28 28 16 
    bCollideWorld = False;                                                      //0010 : 14 2D 01 60 E8 35 0F 28 
    return True;                                                                //0018 : 04 27 
    //0F 01 40 0E 38 0F 1E 00 00 80 BF 61 06 28 28 16 14 2D 01 60 E8 35 0F 28 04 27 04 0B 47 
  }


  function bool CheatWalk() {
    UnderWaterTime = default.UnderWaterTime;                                    //0000 : 0F 01 40 0E 38 0F 02 40 0E 38 0F 
    SetCollision(True,True);                                                    //000B : 61 06 27 27 16 
    SetPhysics(1);                                                              //0010 : 6F 82 24 01 16 
    bCollideWorld = True;                                                       //0015 : 14 2D 01 60 E8 35 0F 27 
    return True;                                                                //001D : 04 27 
    //0F 01 40 0E 38 0F 02 40 0E 38 0F 61 06 27 27 16 6F 82 24 01 16 14 2D 01 60 E8 35 0F 27 04 27 04 
    //0B 47 
  }


  simulated function RawInput(float DeltaTime,float aBaseX,float aBaseY,float aBaseZ,float aMouseX,float aMouseY,float aForward,float aTurn,float aStrafe,float aUp,float aLookUp) {
    //04 0B 47 
  }


  function PlayVictoryAnimation();


  simulated event PlayLandingAnimation(float impactVel);


  function PlayLanded(float impactVel) {
    if (!bPhysicsAnimUpdate) {                                                  //0000 : 07 16 00 81 2D 01 20 66 6C 0F 16 
      PlayLandingAnimation(impactVel);                                          //000B : 1B 90 2B 00 00 00 58 65 6C 0F 16 
    }
    //07 16 00 81 2D 01 20 66 6C 0F 16 1B 90 2B 00 00 00 58 65 6C 0F 16 04 0B 47 
  }


  simulated function PlayWaiting();


  simulated function PlayMoving();


  simulated event PlayFalling();


  simulated event PlayJump();


  function bool CannotJumpNow() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  simulated event AnimEnd(int Channel) {
    if (Channel == 0) {                                                         //0000 : 07 11 00 9A 00 20 6C 6C 0F 25 16 
      PlayWaiting();                                                            //000B : 1B 66 2B 00 00 16 
    }
    //07 11 00 9A 00 20 6C 6C 0F 25 16 1B 66 2B 00 00 16 04 0B 47 
  }


  simulated event ChangeAnimation() {
    if (Controller != None && Controller.bControlAnimations) {                  //0000 : 07 21 00 82 77 01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 2D 01 10 EA 70 0F 16 
      return;                                                                   //001F : 04 0B 
    }
    PlayWaiting();                                                              //0021 : 1B 66 2B 00 00 16 
    PlayMoving();                                                               //0027 : 1B 8F 2B 00 00 16 
    //07 21 00 82 77 01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 2D 01 10 EA 70 0F 16 04 
    //0B 1B 66 2B 00 00 16 1B 8F 2B 00 00 16 04 0B 47 
  }


  function PlayTakeHit(Vector HitLoc,int Damage,class<DamageType> DamageType) {
    local Sound DesiredSound;
    if (Damage == 0) {                                                          //0000 : 07 0D 00 9A 00 A0 6F 6C 0F 25 16 
      return;                                                                   //000B : 04 0B 
    }
    DesiredSound = DamageType.GetPawnDamageSound();                             //000D : 0F 00 18 70 6C 0F 12 00 90 70 6C 0F 06 00 04 1B 9A 2B 00 00 16 
    if (DesiredSound != None) {                                                 //0022 : 07 3A 00 77 00 18 70 6C 0F 2A 16 
      PlayOwnedSound(DesiredSound,1);                                           //002D : 1C 90 ED 6C 0F 00 18 70 6C 0F 24 01 16 
    }
    //07 0D 00 9A 00 A0 6F 6C 0F 25 16 04 0B 0F 00 18 70 6C 0F 12 00 90 70 6C 0F 06 00 04 1B 9A 2B 00 
    //00 16 07 3A 00 77 00 18 70 6C 0F 2A 16 1C 90 ED 6C 0F 00 18 70 6C 0F 24 01 16 04 0B 47 
  }


  simulated function PlayFiring(optional float Rate,optional name FiringMode);


  simulated event PlayDying(class<DamageType> DamageType,Vector HitLoc) {
    AmbientSound = None;                                                        //0000 : 0F 01 18 A1 6C 0F 2A 
    GotoState('Dying');                                                         //0007 : 71 21 DD 2A 00 00 16 
    if (bPhysicsAnimUpdate) {                                                   //000E : 07 38 00 2D 01 20 66 6C 0F 
      bReplicateMovement = False;                                               //0017 : 14 2D 01 68 77 6E 0F 28 
      bTearOff = True;                                                          //001F : 14 2D 01 48 93 6C 0F 27 
      Velocity += TearOffMomentum;                                              //0027 : DF 01 A0 95 6C 0F 01 98 74 6C 0F 16 
      SetPhysics(2);                                                            //0033 : 6F 82 24 02 16 
    }
    bPlayedDeath = True;                                                        //0038 : 14 2D 01 10 75 6C 0F 27 
    //0F 01 18 A1 6C 0F 2A 71 21 DD 2A 00 00 16 07 38 00 2D 01 20 66 6C 0F 14 2D 01 68 77 6E 0F 28 14 
    //2D 01 48 93 6C 0F 27 DF 01 A0 95 6C 0F 01 98 74 6C 0F 16 6F 82 24 02 16 14 2D 01 10 75 6C 0F 27 
    //04 0B 47 
  }


  simulated event SetAnimAction(name NewAction);


  simulated function TurnOff() {
    SetCollision(True,False);                                                   //0000 : 61 06 27 28 16 
    AmbientSound = None;                                                        //0005 : 0F 01 18 A1 6C 0F 2A 
    Velocity = vect(0.000000, 0.000000, 0.000000);                              //000C : 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    SetPhysics(0);                                                              //001F : 6F 82 24 00 16 
    bPhysicsAnimUpdate = False;                                                 //0024 : 14 2D 01 20 66 6C 0F 28 
    bIsIdle = True;                                                             //002C : 14 2D 01 A0 78 6C 0F 27 
    bWaitForAnim = False;                                                       //0034 : 14 2D 01 18 79 6C 0F 28 
    StopAnimating();                                                            //003C : 1C B8 DE 6D 0F 16 
    bIgnoreForces = True;                                                       //0042 : 14 2D 01 90 79 6C 0F 27 
    //61 06 27 28 16 0F 01 18 A1 6C 0F 2A 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 6F 
    //82 24 00 16 14 2D 01 20 66 6C 0F 28 14 2D 01 A0 78 6C 0F 27 14 2D 01 18 79 6C 0F 28 1C B8 DE 6D 
    //0F 16 14 2D 01 90 79 6C 0F 27 04 0B 47 
  }


  function PlayHit(float Damage,Pawn instigatedBy,Vector HitLocation,class<DamageType> DamageType,Vector Momentum) {
    local Vector BloodOffset;
    local Vector Mo;
    local Vector HitNormal;
    local class<Effects> DesiredEffect;
    local class<Emitter> DesiredEmitter;
    local PlayerController Hearer;
    if (DamageType == None) {                                                   //0000 : 07 0D 00 72 00 48 AA 74 0F 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    if (Damage <= 0
      && (Controller == None || !Controller.bGodMode)) {    //000D : 07 3F 00 82 B2 00 B0 A5 74 0F 39 3F 25 16 18 1F 00 84 72 01 00 6E 6C 0F 2A 16 18 12 00 81 19 01 00 6E 6C 0F 06 00 04 2D 01 58 E6 70 0F 16 16 16 
      return;                                                                   //003D : 04 0B 
    }
    if (Damage > DamageType.default.DamageThreshold) {                          //003F : 07 CD 01 B1 00 B0 A5 74 0F 39 3F 12 00 48 AA 74 0F 05 00 04 02 C8 AA 74 0F 16 
      HitNormal = Normal(HitLocation - Location);                               //0059 : 0F 00 40 AB 74 0F E2 D8 00 B8 AB 74 0F 01 30 81 6C 0F 16 16 
      if (EffectIsRelevant(Location,True)) {                                    //006D : 07 CD 01 1B DA 2A 00 00 01 30 81 6C 0F 27 16 
        DesiredEffect = DamageType.GetPawnDamageEffect(HitLocation,Damage,Momentum,self,Level.bDropDetail || Level.DetailMode == 0);//007C : 0F 00 30 AC 74 0F 12 00 48 AA 74 0F 40 00 04 1B 94 2B 00 00 00 B8 AB 74 0F 00 B0 A5 74 0F 00 B0 AC 74 0F 17 84 19 01 D8 7E 6C 0F 06 00 04 2D 01 F8 31 71 0F 18 17 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 16 16 
        if (DesiredEffect != None) {                                            //00CB : 07 56 01 77 00 30 AC 74 0F 2A 16 
          BloodOffset = 0.20000000 * CollisionRadius * HitNormal;               //00D6 : 0F 00 28 AD 74 0F D5 AB 1E CD CC 4C 3E 01 C8 89 6C 0F 16 00 40 AB 74 0F 16 
          BloodOffset.Z = BloodOffset.Z * 0.50000000;                           //00EF : 0F 36 38 C5 69 0F 00 28 AD 74 0F AB 36 38 C5 69 0F 00 28 AD 74 0F 1E 00 00 00 3F 16 
          Mo = Momentum;                                                        //010B : 0F 00 A0 AD 74 0F 00 B0 AC 74 0F 
          if (Mo.Z > 0) {                                                       //0116 : 07 39 01 B1 36 38 C5 69 0F 00 A0 AD 74 0F 39 3F 25 16 
            Mo.Z *= 0.50000000;                                                 //0128 : B6 36 38 C5 69 0F 00 A0 AD 74 0F 1E 00 00 00 3F 16 
          }
          Spawn(DesiredEffect,self,,HitLocation + BloodOffset,rotator(Mo));     //0139 : 61 16 00 30 AC 74 0F 17 0B D7 00 B8 AB 74 0F 00 28 AD 74 0F 16 39 50 00 A0 AD 74 0F 16 
        }
        DesiredEmitter = DamageType.GetPawnDamageEmitter(HitLocation,Damage,Momentum,self,Level.bDropDetail || Level.DetailMode == 0);//0156 : 0F 00 18 AE 74 0F 12 00 48 AA 74 0F 40 00 04 1B 96 2B 00 00 00 B8 AB 74 0F 00 B0 A5 74 0F 00 B0 AC 74 0F 17 84 19 01 D8 7E 6C 0F 06 00 04 2D 01 F8 31 71 0F 18 17 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 16 16 
        if (DesiredEmitter != None) {                                           //01A5 : 07 CD 01 77 00 18 AE 74 0F 2A 16 
          Spawn(DesiredEmitter,,,HitLocation + HitNormal,rotator(HitNormal));   //01B0 : 61 16 00 18 AE 74 0F 0B 0B D7 00 B8 AB 74 0F 00 40 AB 74 0F 16 39 50 00 40 AB 74 0F 16 
        }
      }
    }
    if (GetHealth() <= 0) {                                                     //01CD : 07 16 02 B2 1B 12 10 00 00 16 39 3F 25 16 
      if (PhysicsVolume.bDestructive
        && PhysicsVolume.ExitActor != None) {//01DB : 07 14 02 82 19 01 38 94 6C 0F 06 00 04 2D 01 98 AE 74 0F 18 12 00 77 19 01 38 94 6C 0F 05 00 04 01 10 AF 74 0F 2A 16 16 
        Spawn(PhysicsVolume.ExitActor);                                         //0203 : 61 16 19 01 38 94 6C 0F 05 00 04 01 10 AF 74 0F 16 
      }
      return;                                                                   //0214 : 04 0B 
    }
    if (Level.TimeSeconds - LastPainTime > 0.10000000) {                        //0216 : 07 DD 02 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 90 AF 74 0F 16 1E CD CC CC 3D 16 
      if (instigatedBy != None && DamageType != None
        && DamageType.default.bDirectDamage) {//0235 : 07 7A 02 82 82 77 00 08 B0 74 0F 2A 16 18 09 00 77 00 48 AA 74 0F 2A 16 16 18 10 00 12 00 48 AA 74 0F 06 00 04 2D 02 80 B0 74 0F 16 
        Hearer = PlayerController(instigatedBy.Controller);                     //0261 : 0F 00 F8 B0 74 0F 2E 58 34 C2 00 19 00 08 B0 74 0F 05 00 04 01 00 6E 6C 0F 
      }
      if (Hearer != None) {                                                     //027A : 07 96 02 77 00 F8 B0 74 0F 2A 16 
        Hearer.bAcuteHearing = True;                                            //0285 : 14 19 00 F8 B0 74 0F 06 00 04 2D 01 90 29 72 0F 27 
      }
      PlayTakeHit(HitLocation,Damage,DamageType);                               //0296 : 1B 8E 2B 00 00 00 B8 AB 74 0F 39 44 00 B0 A5 74 0F 00 48 AA 74 0F 16 
      if (Hearer != None) {                                                     //02AD : 07 C9 02 77 00 F8 B0 74 0F 2A 16 
        Hearer.bAcuteHearing = False;                                           //02B8 : 14 19 00 F8 B0 74 0F 06 00 04 2D 01 90 29 72 0F 28 
      }
      LastPainTime = Level.TimeSeconds;                                         //02C9 : 0F 01 90 AF 74 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    }
    //07 0D 00 72 00 48 AA 74 0F 2A 16 04 0B 07 3F 00 82 B2 00 B0 A5 74 0F 39 3F 25 16 18 1F 00 84 72 
    //01 00 6E 6C 0F 2A 16 18 12 00 81 19 01 00 6E 6C 0F 06 00 04 2D 01 58 E6 70 0F 16 16 16 04 0B 07 
    //CD 01 B1 00 B0 A5 74 0F 39 3F 12 00 48 AA 74 0F 05 00 04 02 C8 AA 74 0F 16 0F 00 40 AB 74 0F E2 
    //D8 00 B8 AB 74 0F 01 30 81 6C 0F 16 16 07 CD 01 1B DA 2A 00 00 01 30 81 6C 0F 27 16 0F 00 30 AC 
    //74 0F 12 00 48 AA 74 0F 40 00 04 1B 94 2B 00 00 00 B8 AB 74 0F 00 B0 A5 74 0F 00 B0 AC 74 0F 17 
    //84 19 01 D8 7E 6C 0F 06 00 04 2D 01 F8 31 71 0F 18 17 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 
    //20 B7 6C 0F 39 3A 24 00 16 16 16 07 56 01 77 00 30 AC 74 0F 2A 16 0F 00 28 AD 74 0F D5 AB 1E CD 
    //CC 4C 3E 01 C8 89 6C 0F 16 00 40 AB 74 0F 16 0F 36 38 C5 69 0F 00 28 AD 74 0F AB 36 38 C5 69 0F 
    //00 28 AD 74 0F 1E 00 00 00 3F 16 0F 00 A0 AD 74 0F 00 B0 AC 74 0F 07 39 01 B1 36 38 C5 69 0F 00 
    //A0 AD 74 0F 39 3F 25 16 B6 36 38 C5 69 0F 00 A0 AD 74 0F 1E 00 00 00 3F 16 61 16 00 30 AC 74 0F 
    //17 0B D7 00 B8 AB 74 0F 00 28 AD 74 0F 16 39 50 00 A0 AD 74 0F 16 0F 00 18 AE 74 0F 12 00 48 AA 
    //74 0F 40 00 04 1B 96 2B 00 00 00 B8 AB 74 0F 00 B0 A5 74 0F 00 B0 AC 74 0F 17 84 19 01 D8 7E 6C 
    //0F 06 00 04 2D 01 F8 31 71 0F 18 17 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 
    //24 00 16 16 16 07 CD 01 77 00 18 AE 74 0F 2A 16 61 16 00 18 AE 74 0F 0B 0B D7 00 B8 AB 74 0F 00 
    //40 AB 74 0F 16 39 50 00 40 AB 74 0F 16 07 16 02 B2 1B 12 10 00 00 16 39 3F 25 16 07 14 02 82 19 
    //01 38 94 6C 0F 06 00 04 2D 01 98 AE 74 0F 18 12 00 77 19 01 38 94 6C 0F 05 00 04 01 10 AF 74 0F 
    //2A 16 16 61 16 19 01 38 94 6C 0F 05 00 04 01 10 AF 74 0F 16 04 0B 07 DD 02 B1 AF 19 01 D8 7E 6C 
    //0F 05 00 04 01 A8 81 6C 0F 01 90 AF 74 0F 16 1E CD CC CC 3D 16 07 7A 02 82 82 77 00 08 B0 74 0F 
    //2A 16 18 09 00 77 00 48 AA 74 0F 2A 16 16 18 10 00 12 00 48 AA 74 0F 06 00 04 2D 02 80 B0 74 0F 
    //16 0F 00 F8 B0 74 0F 2E 58 34 C2 00 19 00 08 B0 74 0F 05 00 04 01 00 6E 6C 0F 07 96 02 77 00 F8 
    //B0 74 0F 2A 16 14 19 00 F8 B0 74 0F 06 00 04 2D 01 90 29 72 0F 27 1B 8E 2B 00 00 00 B8 AB 74 0F 
    //39 44 00 B0 A5 74 0F 00 48 AA 74 0F 16 07 C9 02 77 00 F8 B0 74 0F 2A 16 14 19 00 F8 B0 74 0F 06 
    //00 04 2D 01 90 29 72 0F 28 0F 01 90 AF 74 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 04 0B 47 
    //
  }


  function PlayDyingSound();


  function PlayMoverHitSound();


  event bool DoJump() {
    if (!bIsCrouched && !bWantsToCrouch
      && (Physics == 1 || Physics == 11 || Physics == 9)) {//0000 : 07 35 01 82 82 81 2D 01 B0 B6 74 0F 16 18 09 00 81 2D 01 28 B7 74 0F 16 16 18 32 00 84 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 09 16 16 16 
      if (Physics == 9) {                                                       //004E : 07 74 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 09 16 
        Velocity = GetJumpZ() * Floor;                                          //005E : 0F 01 A0 95 6C 0F D5 1C 20 3D 37 0F 16 01 A0 B7 74 0F 16 
      } else {                                                                  //0071 : 06 EE 00 
        if (Physics == 11) {                                                    //0074 : 07 DD 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 
          if (PhysicsVolume.IsA('LadderVolume')) {                              //0084 : 07 CA 00 19 01 38 94 6C 0F 08 00 04 61 2F 21 A4 0B 00 00 16 
            Velocity = LadderVolume(PhysicsVolume).LookDir;                     //0098 : 0F 01 A0 95 6C 0F 19 2E D8 68 C2 00 01 38 94 6C 0F 05 00 0C 01 00 EC 37 0F 
            Velocity *= -GetJumpZ() * 0.50000000;                               //00B1 : DD 01 A0 95 6C 0F A9 AB 1C 20 3D 37 0F 16 1E 00 00 00 3F 16 16 16 
          } else {                                                              //00C7 : 06 DA 00 
            Velocity.Z = 0.00000000;                                            //00CA : 0F 36 38 C5 69 0F 01 A0 95 6C 0F 1E 00 00 00 00 
          }
        } else {                                                                //00DA : 06 EE 00 
          Velocity.Z = GetJumpZ();                                              //00DD : 0F 36 38 C5 69 0F 01 A0 95 6C 0F 1C 20 3D 37 0F 16 
        }
      }
      if (Base != None && !Base.bWorldGeometry) {                               //00EE : 07 2E 01 82 77 01 B0 94 6C 0F 2A 16 18 12 00 81 19 01 B0 94 6C 0F 06 00 04 2D 01 48 6A 6E 0F 16 16 
        Velocity.Z += Base.Velocity.Z;                                          //010F : B8 36 38 C5 69 0F 01 A0 95 6C 0F 36 38 C5 69 0F 19 01 B0 94 6C 0F 05 00 0C 01 A0 95 6C 0F 16 
      }
      SetPhysics(18);                                                           //012E : 6F 82 24 12 16 
      return True;                                                              //0133 : 04 27 
    }
    return False;                                                               //0135 : 04 28 
    //07 35 01 82 82 81 2D 01 B0 B6 74 0F 16 18 09 00 81 2D 01 28 B7 74 0F 16 16 18 32 00 84 84 9A 39 
    //3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 0E 00 9A 
    //39 3A 01 C0 93 6C 0F 39 3A 24 09 16 16 16 07 74 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 09 16 0F 01 
    //A0 95 6C 0F D5 1C 20 3D 37 0F 16 01 A0 B7 74 0F 16 06 EE 00 07 DD 00 9A 39 3A 01 C0 93 6C 0F 39 
    //3A 24 0B 16 07 CA 00 19 01 38 94 6C 0F 08 00 04 61 2F 21 A4 0B 00 00 16 0F 01 A0 95 6C 0F 19 2E 
    //D8 68 C2 00 01 38 94 6C 0F 05 00 0C 01 00 EC 37 0F DD 01 A0 95 6C 0F A9 AB 1C 20 3D 37 0F 16 1E 
    //00 00 00 3F 16 16 16 06 DA 00 0F 36 38 C5 69 0F 01 A0 95 6C 0F 1E 00 00 00 00 06 EE 00 0F 36 38 
    //C5 69 0F 01 A0 95 6C 0F 1C 20 3D 37 0F 16 07 2E 01 82 77 01 B0 94 6C 0F 2A 16 18 12 00 81 19 01 
    //B0 94 6C 0F 06 00 04 2D 01 48 6A 6E 0F 16 16 B8 36 38 C5 69 0F 01 A0 95 6C 0F 36 38 C5 69 0F 19 
    //01 B0 94 6C 0F 05 00 0C 01 A0 95 6C 0F 16 6F 82 24 12 16 04 27 04 28 04 0B 47 
  }


  final native event float GetJumpZ();


  function bool CheckWaterJump(out Vector WallNormal) {
    local Actor HitActor;
    local Vector HitLocation;
    local Vector HitNormal;
    local Vector checkpoint;
    local Vector Start;
    local Vector checkNorm;
    if (AIController(Controller) != None) {                                     //0000 : 07 2B 00 77 2E 18 2F C2 00 01 00 6E 6C 0F 2A 16 
      checkpoint = Acceleration;                                                //0010 : 0F 00 C8 EE 37 0F 01 18 96 6C 0F 
      checkpoint.Z = 0.00000000;                                                //001B : 0F 36 38 C5 69 0F 00 C8 EE 37 0F 1E 00 00 00 00 
    }
    if (checkpoint == vect(0.000000, 0.000000, 0.000000)) {                     //002B : 07 4F 00 D9 00 C8 EE 37 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      checkpoint = vector(Rotation);                                            //0042 : 0F 00 C8 EE 37 0F 39 39 01 00 84 6C 0F 
    }
    checkpoint.Z = 0.00000000;                                                  //004F : 0F 36 38 C5 69 0F 00 C8 EE 37 0F 1E 00 00 00 00 
    checkNorm = Normal(checkpoint);                                             //005F : 0F 00 40 EF 37 0F E2 00 C8 EE 37 0F 16 
    checkpoint = Location + 1.20000005 * CollisionRadius * checkNorm;           //006C : 0F 00 C8 EE 37 0F D7 01 30 81 6C 0F D5 AB 1E 9A 99 99 3F 01 C8 89 6C 0F 16 00 40 EF 37 0F 16 16 
    HitActor = Trace(HitLocation,HitNormal,checkpoint,Location,True,GetCollisionExtent());//008C : 0F 00 B8 EF 37 0F 61 15 00 30 F0 37 0F 00 A8 F0 37 0F 00 C8 EE 37 0F 01 30 81 6C 0F 27 1B 9C 2B 00 00 16 16 
    if (HitActor != None && Pawn(HitActor) == None) {                           //00B0 : 07 64 01 82 77 00 B8 EF 37 0F 2A 16 18 0E 00 72 2E 50 31 D4 00 00 B8 EF 37 0F 2A 16 16 
      WallNormal = -1 * HitNormal;                                              //00CD : 0F 00 50 EE 37 0F D5 39 3F 1D FF FF FF FF 00 A8 F0 37 0F 16 
      Start = Location;                                                         //00E1 : 0F 00 70 04 38 0F 01 30 81 6C 0F 
      Start.Z += 1.10000002 * 25.00000000;                                      //00EC : B8 36 38 C5 69 0F 00 70 04 38 0F AB 1E CD CC 8C 3F 1E 00 00 C8 41 16 16 
      checkpoint = Start + 2 * CollisionRadius * checkNorm;                     //0104 : 0F 00 C8 EE 37 0F D7 00 70 04 38 0F D5 AB 39 3F 2C 02 01 C8 89 6C 0F 16 00 40 EF 37 0F 16 16 
      HitActor = Trace(HitLocation,HitNormal,checkpoint,Start,True);            //0123 : 0F 00 B8 EF 37 0F 61 15 00 30 F0 37 0F 00 A8 F0 37 0F 00 C8 EE 37 0F 00 70 04 38 0F 27 16 
      if (HitActor == None || HitNormal.Z > 0.69999999) {                       //0141 : 07 64 01 84 72 00 B8 EF 37 0F 2A 16 18 12 00 B1 36 38 C5 69 0F 00 A8 F0 37 0F 1E 33 33 33 3F 16 16 
        return True;                                                            //0162 : 04 27 
      }
    }
    return False;                                                               //0164 : 04 28 
    //07 2B 00 77 2E 18 2F C2 00 01 00 6E 6C 0F 2A 16 0F 00 C8 EE 37 0F 01 18 96 6C 0F 0F 36 38 C5 69 
    //0F 00 C8 EE 37 0F 1E 00 00 00 00 07 4F 00 D9 00 C8 EE 37 0F 23 00 00 00 00 00 00 00 00 00 00 00 
    //00 16 0F 00 C8 EE 37 0F 39 39 01 00 84 6C 0F 0F 36 38 C5 69 0F 00 C8 EE 37 0F 1E 00 00 00 00 0F 
    //00 40 EF 37 0F E2 00 C8 EE 37 0F 16 0F 00 C8 EE 37 0F D7 01 30 81 6C 0F D5 AB 1E 9A 99 99 3F 01 
    //C8 89 6C 0F 16 00 40 EF 37 0F 16 16 0F 00 B8 EF 37 0F 61 15 00 30 F0 37 0F 00 A8 F0 37 0F 00 C8 
    //EE 37 0F 01 30 81 6C 0F 27 1B 9C 2B 00 00 16 16 07 64 01 82 77 00 B8 EF 37 0F 2A 16 18 0E 00 72 
    //2E 50 31 D4 00 00 B8 EF 37 0F 2A 16 16 0F 00 50 EE 37 0F D5 39 3F 1D FF FF FF FF 00 A8 F0 37 0F 
    //16 0F 00 70 04 38 0F 01 30 81 6C 0F B8 36 38 C5 69 0F 00 70 04 38 0F AB 1E CD CC 8C 3F 1E 00 00 
    //C8 41 16 16 0F 00 C8 EE 37 0F D7 00 70 04 38 0F D5 AB 39 3F 2C 02 01 C8 89 6C 0F 16 00 40 EF 37 
    //0F 16 16 0F 00 B8 EF 37 0F 61 15 00 30 F0 37 0F 00 A8 F0 37 0F 00 C8 EE 37 0F 00 70 04 38 0F 27 
    //16 07 64 01 84 72 00 B8 EF 37 0F 2A 16 18 12 00 B1 36 38 C5 69 0F 00 A8 F0 37 0F 1E 33 33 33 3F 
    //16 16 04 27 04 28 04 0B 47 
  }


  function TakeDrowningDamage();


  event BreathTimer() {
    TakeDrowningDamage();                                                       //0000 : 1B 85 2B 00 00 16 
    if (GetHealth() > 0) {                                                      //0006 : 07 1F 00 B1 1B 12 10 00 00 16 39 3F 25 16 
      BreathTime = 2.00000000;                                                  //0014 : 0F 01 C8 0D 38 0F 1E 00 00 00 40 
    }
    //1B 85 2B 00 00 16 07 1F 00 B1 1B 12 10 00 00 16 39 3F 25 16 0F 01 C8 0D 38 0F 1E 00 00 00 40 04 
    //0B 47 
  }


  function bool IsInPain() {
    local PhysicsVolume V;
    foreach TouchingActors(Class'PhysicsVolume',V) {                            //0000 : 2F 61 33 20 58 5E C2 00 00 F0 08 38 0F 16 58 00 
      if (V.bPainCausing
        && V.DamageType != ReducedDamageType
        && V.DamagePerSec > 0) {//0010 : 07 57 00 82 82 19 00 F0 08 38 0F 06 00 04 2D 01 90 AE 34 0F 18 16 00 77 19 00 F0 08 38 0F 05 00 04 01 68 09 38 0F 01 18 B8 74 0F 16 16 18 14 00 B1 19 00 F0 08 38 0F 05 00 04 01 08 AF 34 0F 39 3F 25 16 16 
        return True;                                                            //0055 : 04 27 
      }
    }
    return False;                                                               //0059 : 04 28 
    //2F 61 33 20 58 5E C2 00 00 F0 08 38 0F 16 58 00 07 57 00 82 82 19 00 F0 08 38 0F 06 00 04 2D 01 
    //90 AE 34 0F 18 16 00 77 19 00 F0 08 38 0F 05 00 04 01 68 09 38 0F 01 18 B8 74 0F 16 16 18 14 00 
    //B1 19 00 F0 08 38 0F 05 00 04 01 08 AF 34 0F 39 3F 25 16 16 30 04 27 31 30 04 28 04 0B 47 
  }


  function bool TouchingWaterVolume() {
    local PhysicsVolume V;
    foreach TouchingActors(Class'PhysicsVolume',V) {                            //0000 : 2F 61 33 20 58 5E C2 00 00 28 BA 74 0F 16 26 00 
      if (V.bWaterVolume) {                                                     //0010 : 07 25 00 19 00 28 BA 74 0F 06 00 04 2D 01 70 04 6F 0F 
        return True;                                                            //0023 : 04 27 
      }
    }
    return False;                                                               //0027 : 04 28 
    //2F 61 33 20 58 5E C2 00 00 28 BA 74 0F 16 26 00 07 25 00 19 00 28 BA 74 0F 06 00 04 2D 01 70 04 
    //6F 0F 30 04 27 31 30 04 28 04 0B 47 
  }


  event HeadVolumeChange(PhysicsVolume newHeadVolume) {
    if (Level.NetMode == 3 || Controller == None) {                             //0000 : 07 28 00 84 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 18 09 00 72 01 00 6E 6C 0F 2A 16 16 
      return;                                                                   //0026 : 04 0B 
    }
    if (HeadVolume != None && HeadVolume.bWaterVolume) {                        //0028 : 07 AD 00 82 77 01 50 0D 38 0F 2A 16 18 10 00 19 01 50 0D 38 0F 06 00 04 2D 01 70 04 6F 0F 16 
      if (newHeadVolume != None && !newHeadVolume.bWaterVolume) {               //0047 : 07 AA 00 82 77 00 50 BB 74 0F 2A 16 18 12 00 81 19 00 50 BB 74 0F 06 00 04 2D 01 70 04 6F 0F 16 16 
        if (Controller.bIsPlayer && BreathTime > 0
          && BreathTime < 8) {//0068 : 07 9F 00 82 82 19 01 00 6E 6C 0F 06 00 04 2D 01 E0 E5 70 0F 18 0B 00 B1 01 C8 0D 38 0F 39 3F 25 16 16 18 0C 00 B0 01 C8 0D 38 0F 39 3F 2C 08 16 16 
          Gasp();                                                               //0099 : 1B 8D 2B 00 00 16 
        }
        BreathTime = -1.00000000;                                               //009F : 0F 01 C8 0D 38 0F 1E 00 00 80 BF 
      }
    } else {                                                                    //00AA : 06 D7 00 
      if (newHeadVolume != None && newHeadVolume.bWaterVolume) {                //00AD : 07 D7 00 82 77 00 50 BB 74 0F 2A 16 18 10 00 19 00 50 BB 74 0F 06 00 04 2D 01 70 04 6F 0F 16 
        BreathTime = UnderWaterTime;                                            //00CC : 0F 01 C8 0D 38 0F 01 40 0E 38 0F 
      }
    }
    //07 28 00 84 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 18 09 00 72 01 00 
    //6E 6C 0F 2A 16 16 04 0B 07 AD 00 82 77 01 50 0D 38 0F 2A 16 18 10 00 19 01 50 0D 38 0F 06 00 04 
    //2D 01 70 04 6F 0F 16 07 AA 00 82 77 00 50 BB 74 0F 2A 16 18 12 00 81 19 00 50 BB 74 0F 06 00 04 
    //2D 01 70 04 6F 0F 16 16 07 9F 00 82 82 19 01 00 6E 6C 0F 06 00 04 2D 01 E0 E5 70 0F 18 0B 00 B1 
    //01 C8 0D 38 0F 39 3F 25 16 16 18 0C 00 B0 01 C8 0D 38 0F 39 3F 2C 08 16 16 1B 8D 2B 00 00 16 0F 
    //01 C8 0D 38 0F 1E 00 00 80 BF 06 D7 00 07 D7 00 82 77 00 50 BB 74 0F 2A 16 18 10 00 19 00 50 BB 
    //74 0F 06 00 04 2D 01 70 04 6F 0F 16 0F 01 C8 0D 38 0F 01 40 0E 38 0F 04 0B 47 
  }


  event HitWall(Vector HitNormal,Actor Wall);


  event Falling() {
    if (Controller != None) {                                                   //0000 : 07 1A 00 77 01 00 6E 6C 0F 2A 16 
      Controller.SetFall();                                                     //000B : 19 01 00 6E 6C 0F 06 00 00 1B 2F 2B 00 00 16 
    }
    //07 1A 00 77 01 00 6E 6C 0F 2A 16 19 01 00 6E 6C 0F 06 00 00 1B 2F 2B 00 00 16 04 0B 47 
  }


  function Died(Controller Killer,class<DamageType> DamageType,Vector HitLocation) {
    //04 0B 47 
  }


  function Controller GetKillerController() {
    return Controller;                                                          //0000 : 04 01 00 6E 6C 0F 
    //04 01 00 6E 6C 0F 04 0B 47 
  }


  function SetDelayedDamageInstigatorController(Controller C) {
    DelayedDamageInstigatorController = C;                                      //0000 : 0F 01 D8 C4 74 0F 00 20 C4 74 0F 
    //0F 01 D8 C4 74 0F 00 20 C4 74 0F 04 0B 47 
  }


  function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    local int actualDamage;
    local Controller Killer;
    if (DamageType == None) {                                                   //0000 : 07 4A 00 72 00 98 CA 74 0F 2A 16 
      if (instigatedBy != None) {                                               //000B : 07 3F 00 77 00 18 CB 74 0F 2A 16 
        Warn("No damagetype for damage by " $ string(instigatedBy));            //0016 : E8 70 1F 4E 6F 20 64 61 6D 61 67 65 74 79 70 65 20 66 6F 72 20 64 61 6D 61 67 65 20 62 79 20 00 39 56 00 18 CB 74 0F 16 16 
      }
      DamageType = Class'DamageType';                                           //003F : 0F 00 98 CA 74 0F 20 18 44 C2 00 
    }
    if (Role < 4) {                                                             //004A : 07 5C 00 96 39 3A 01 D0 92 6C 0F 39 3A 24 04 16 
      return;                                                                   //005A : 04 0B 
    }
    if (GetHealth() <= 0) {                                                     //005C : 07 6C 00 B2 1B 12 10 00 00 16 39 3F 25 16 
      return;                                                                   //006A : 04 0B 
    }
    if ((instigatedBy == None
      || instigatedBy.Controller == None)
      && DamageType.default.bDelayedDamage
      && DelayedDamageInstigatorController != None) {//006C : 07 C2 00 82 82 84 72 00 18 CB 74 0F 2A 16 18 12 00 72 19 00 18 CB 74 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 10 00 12 00 98 CA 74 0F 06 00 04 2D 02 90 CB 74 0F 16 18 09 00 77 01 D8 C4 74 0F 2A 16 16 
      instigatedBy = DelayedDamageInstigatorController.Pawn;                    //00AE : 0F 00 18 CB 74 0F 19 01 D8 C4 74 0F 05 00 04 01 88 83 6C 0F 
    }
    if (Physics == 0) {                                                         //00C2 : 07 D8 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 
      SetMovementPhysics();                                                     //00D2 : 1B 8C 2B 00 00 16 
    }
    if (Physics == 1
      && DamageType.default.bExtraMomentumZ) {             //00D8 : 07 21 01 82 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 10 00 12 00 98 CA 74 0F 06 00 04 2D 02 08 CC 74 0F 16 
      Momentum.Z = FMax(Momentum.Z,0.40000001 * VSize(Momentum));               //00FC : 0F 36 38 C5 69 0F 00 80 CC 74 0F F5 36 38 C5 69 0F 00 80 CC 74 0F AB 1E CD CC CC 3E E1 00 80 CC 74 0F 16 16 16 
    }
    if (instigatedBy == self) {                                                 //0121 : 07 38 01 72 00 18 CB 74 0F 17 16 
      Momentum *= 0.60000002;                                                   //012C : DD 00 80 CC 74 0F 1E 9A 99 19 3F 16 
    }
    Momentum = Momentum / Mass;                                                 //0138 : 0F 00 80 CC 74 0F D6 00 80 CC 74 0F 01 A0 E6 6E 0F 16 
    if (instigatedBy != None && instigatedBy.HasUDamage()) {                    //014A : 07 74 01 82 77 00 18 CB 74 0F 2A 16 18 10 00 19 00 18 CB 74 0F 06 00 04 1B 89 2B 00 00 16 16 
      Damage *= 2;                                                              //0169 : 9F 00 00 C6 74 0F 39 3F 2C 02 16 
    }
    actualDamage = Damage;                                                      //0174 : 0F 00 F8 CC 74 0F 00 00 C6 74 0F 
    if (DamageType.default.bArmorStops && actualDamage > 0) {                   //017F : 07 AF 01 82 12 00 98 CA 74 0F 06 00 04 2D 02 70 CD 74 0F 18 09 00 97 00 F8 CC 74 0F 25 16 16 
      actualDamage = ShieldAbsorb(actualDamage);                                //019E : 0F 00 F8 CC 74 0F 1B 88 2B 00 00 00 F8 CC 74 0F 16 
    }
    IncreaseHealth(-actualDamage);                                              //01AF : 1B 31 10 00 00 39 3F 8F 00 F8 CC 74 0F 16 16 
    if (HitLocation == vect(0.000000, 0.000000, 0.000000)) {                    //01BE : 07 E0 01 D9 00 E8 CD 74 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      HitLocation = Location;                                                   //01D5 : 0F 00 E8 CD 74 0F 01 30 81 6C 0F 
    }
    PlayHit(actualDamage,instigatedBy,HitLocation,DamageType,Momentum);         //01E0 : 1B 86 2B 00 00 39 3F 00 F8 CC 74 0F 00 18 CB 74 0F 00 E8 CD 74 0F 00 98 CA 74 0F 00 80 CC 74 0F 16 
    if (GetHealth() <= 0) {                                                     //0201 : 07 CC 02 B2 1B 12 10 00 00 16 39 3F 25 16 
      if (DamageType.default.bCausedByWorld
        && (instigatedBy == None || instigatedBy == self)
        && LastHitBy != None) {//020F : 07 56 02 82 82 12 00 98 CA 74 0F 06 00 04 2D 02 60 CE 74 0F 18 16 00 84 72 00 18 CB 74 0F 2A 16 18 09 00 72 00 18 CB 74 0F 17 16 16 16 18 09 00 77 01 D8 CE 74 0F 2A 16 16 
        Killer = LastHitBy;                                                     //0248 : 0F 00 50 CF 74 0F 01 D8 CE 74 0F 
      } else {                                                                  //0253 : 06 76 02 
        if (instigatedBy != None) {                                             //0256 : 07 76 02 77 00 18 CB 74 0F 2A 16 
          Killer = instigatedBy.GetKillerController();                          //0261 : 0F 00 50 CF 74 0F 19 00 18 CB 74 0F 06 00 04 1B 5E 2B 00 00 16 
        }
      }
      if (Killer == None
        && DamageType.default.bDelayedDamage) {        //0276 : 07 A0 02 82 72 00 50 CF 74 0F 2A 16 18 10 00 12 00 98 CA 74 0F 06 00 04 2D 02 90 CB 74 0F 16 
        Killer = DelayedDamageInstigatorController;                             //0295 : 0F 00 50 CF 74 0F 01 D8 C4 74 0F 
      }
      if (bPhysicsAnimUpdate) {                                                 //02A0 : 07 B4 02 2D 01 20 66 6C 0F 
        TearOffMomentum = Momentum;                                             //02A9 : 0F 01 98 74 6C 0F 00 80 CC 74 0F 
      }
      Died(Killer,DamageType,HitLocation);                                      //02B4 : 1B 13 0F 00 00 00 50 CF 74 0F 00 98 CA 74 0F 00 E8 CD 74 0F 16 
    } else {                                                                    //02C9 : 06 D7 02 
      AddVelocity(Momentum);                                                    //02CC : 1B 68 2B 00 00 00 80 CC 74 0F 16 
    }
    MakeNoise(1.00000000);                                                      //02D7 : 62 00 1E 00 00 80 3F 16 
    //07 4A 00 72 00 98 CA 74 0F 2A 16 07 3F 00 77 00 18 CB 74 0F 2A 16 E8 70 1F 4E 6F 20 64 61 6D 61 
    //67 65 74 79 70 65 20 66 6F 72 20 64 61 6D 61 67 65 20 62 79 20 00 39 56 00 18 CB 74 0F 16 16 0F 
    //00 98 CA 74 0F 20 18 44 C2 00 07 5C 00 96 39 3A 01 D0 92 6C 0F 39 3A 24 04 16 04 0B 07 6C 00 B2 
    //1B 12 10 00 00 16 39 3F 25 16 04 0B 07 C2 00 82 82 84 72 00 18 CB 74 0F 2A 16 18 12 00 72 19 00 
    //18 CB 74 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 10 00 12 00 98 CA 74 0F 06 00 04 2D 02 90 CB 74 
    //0F 16 18 09 00 77 01 D8 C4 74 0F 2A 16 16 0F 00 18 CB 74 0F 19 01 D8 C4 74 0F 05 00 04 01 88 83 
    //6C 0F 07 D8 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 1B 8C 2B 00 00 16 07 21 01 82 9A 39 3A 01 
    //C0 93 6C 0F 39 3A 24 01 16 18 10 00 12 00 98 CA 74 0F 06 00 04 2D 02 08 CC 74 0F 16 0F 36 38 C5 
    //69 0F 00 80 CC 74 0F F5 36 38 C5 69 0F 00 80 CC 74 0F AB 1E CD CC CC 3E E1 00 80 CC 74 0F 16 16 
    //16 07 38 01 72 00 18 CB 74 0F 17 16 DD 00 80 CC 74 0F 1E 9A 99 19 3F 16 0F 00 80 CC 74 0F D6 00 
    //80 CC 74 0F 01 A0 E6 6E 0F 16 07 74 01 82 77 00 18 CB 74 0F 2A 16 18 10 00 19 00 18 CB 74 0F 06 
    //00 04 1B 89 2B 00 00 16 16 9F 00 00 C6 74 0F 39 3F 2C 02 16 0F 00 F8 CC 74 0F 00 00 C6 74 0F 07 
    //AF 01 82 12 00 98 CA 74 0F 06 00 04 2D 02 70 CD 74 0F 18 09 00 97 00 F8 CC 74 0F 25 16 16 0F 00 
    //F8 CC 74 0F 1B 88 2B 00 00 00 F8 CC 74 0F 16 1B 31 10 00 00 39 3F 8F 00 F8 CC 74 0F 16 16 07 E0 
    //01 D9 00 E8 CD 74 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 0F 00 E8 CD 74 0F 01 30 81 6C 0F 
    //1B 86 2B 00 00 39 3F 00 F8 CC 74 0F 00 18 CB 74 0F 00 E8 CD 74 0F 00 98 CA 74 0F 00 80 CC 74 0F 
    //16 07 CC 02 B2 1B 12 10 00 00 16 39 3F 25 16 07 56 02 82 82 12 00 98 CA 74 0F 06 00 04 2D 02 60 
    //CE 74 0F 18 16 00 84 72 00 18 CB 74 0F 2A 16 18 09 00 72 00 18 CB 74 0F 17 16 16 16 18 09 00 77 
    //01 D8 CE 74 0F 2A 16 16 0F 00 50 CF 74 0F 01 D8 CE 74 0F 06 76 02 07 76 02 77 00 18 CB 74 0F 2A 
    //16 0F 00 50 CF 74 0F 19 00 18 CB 74 0F 06 00 04 1B 5E 2B 00 00 16 07 A0 02 82 72 00 50 CF 74 0F 
    //2A 16 18 10 00 12 00 98 CA 74 0F 06 00 04 2D 02 90 CB 74 0F 16 0F 00 50 CF 74 0F 01 D8 C4 74 0F 
    //07 B4 02 2D 01 20 66 6C 0F 0F 01 98 74 6C 0F 00 80 CC 74 0F 1B 13 0F 00 00 00 50 CF 74 0F 00 98 
    //CA 74 0F 00 E8 CD 74 0F 16 06 D7 02 1B 68 2B 00 00 00 80 CC 74 0F 16 62 00 1E 00 00 80 3F 16 04 
    //0B 47 
  }


  function int ShieldAbsorb(int Damage) {
    return Damage;                                                              //0000 : 04 00 78 D0 74 0F 
    //04 00 78 D0 74 0F 04 0B 47 
  }


  function bool HasUDamage() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool GiveHealth(int HealAmount,int HealMax) {
    if (GetHealth() < HealMax) {                                                //0000 : 07 34 00 B0 1B 12 10 00 00 16 39 3F 00 A0 B3 75 0F 16 
      SetHealth(Min(HealMax,GetHealth() + HealAmount));                         //0012 : 1B AC 0F 00 00 39 3F F9 00 A0 B3 75 0F 39 44 AE 1B 12 10 00 00 16 39 3F 00 B0 B2 75 0F 16 16 16 
      return True;                                                              //0032 : 04 27 
    }
    return False;                                                               //0034 : 04 28 
    //07 34 00 B0 1B 12 10 00 00 16 39 3F 00 A0 B3 75 0F 16 1B AC 0F 00 00 39 3F F9 00 A0 B3 75 0F 39 
    //44 AE 1B 12 10 00 00 16 39 3F 00 B0 B2 75 0F 16 16 16 04 27 04 28 04 0B 47 
  }


  function SetMovementPhysics();


  function Gasp();


  simulated function SetMesh() {
    if (Mesh != None) {                                                         //0000 : 07 0D 00 77 01 D8 99 6C 0F 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    LinkMesh(default.Mesh);                                                     //000D : 1C F0 C6 6D 0F 02 D8 99 6C 0F 16 
    //07 0D 00 77 01 D8 99 6C 0F 2A 16 04 0B 1C F0 C6 6D 0F 02 D8 99 6C 0F 16 04 0B 47 
  }


  event PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    SplashTime = 0.00000000;                                                    //0006 : 0F 01 20 B9 75 0F 1E 00 00 00 00 
    SpawnTime = Level.TimeSeconds;                                              //0011 : 0F 01 98 B9 75 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    EyeHeight = BaseEyeHeight;                                                  //0025 : 0F 01 D0 76 71 0F 01 10 BA 75 0F 
    OldRotYaw = Rotation.Yaw;                                                   //0030 : 0F 01 88 BA 75 0F 36 20 BF 69 0F 01 00 84 6C 0F 
    if (Level.bStartup && GetHealth() > 0) {                                    //0040 : 07 AD 00 82 19 01 D8 7E 6C 0F 06 00 04 2D 01 B8 33 71 0F 18 0C 00 B1 1B 12 10 00 00 16 39 3F 25 16 16 
      if (ControllerClass != None && Controller == None) {                      //0062 : 07 88 00 82 77 01 00 BB 75 0F 2A 16 18 09 00 72 01 00 6E 6C 0F 2A 16 16 
        Controller = Spawn(ControllerClass);                                    //007A : 0F 01 00 6E 6C 0F 61 16 01 00 BB 75 0F 16 
      }
      if (Controller != None) {                                                 //0088 : 07 AD 00 77 01 00 6E 6C 0F 2A 16 
        AIController(Controller).Skill += SkillModifier;                        //0093 : B8 19 2E 18 2F C2 00 01 00 6E 6C 0F 05 00 04 01 80 BB 75 0F 01 F8 BB 75 0F 16 
      }
    }
    //1C D0 02 38 0F 16 0F 01 20 B9 75 0F 1E 00 00 00 00 0F 01 98 B9 75 0F 19 01 D8 7E 6C 0F 05 00 04 
    //01 A8 81 6C 0F 0F 01 D0 76 71 0F 01 10 BA 75 0F 0F 01 88 BA 75 0F 36 20 BF 69 0F 01 00 84 6C 0F 
    //07 AD 00 82 19 01 D8 7E 6C 0F 06 00 04 2D 01 B8 33 71 0F 18 0C 00 B1 1B 12 10 00 00 16 39 3F 25 
    //16 16 07 88 00 82 77 01 00 BB 75 0F 2A 16 18 09 00 72 01 00 6E 6C 0F 2A 16 16 0F 01 00 6E 6C 0F 
    //61 16 01 00 BB 75 0F 16 07 AD 00 77 01 00 6E 6C 0F 2A 16 B8 19 2E 18 2F C2 00 01 00 6E 6C 0F 05 
    //00 04 01 80 BB 75 0F 01 F8 BB 75 0F 16 04 0B 47 
  }


  event PreBeginPlay() {
    Super.PreBeginPlay();                                                       //0000 : 1C 18 B5 6C 0F 16 
    Instigator = self;                                                          //0006 : 0F 01 B8 80 6C 0F 17 
    DesiredRotation = Rotation;                                                 //000D : 0F 01 D0 E8 6E 0F 01 00 84 6C 0F 
    if (bDeleteMe) {                                                            //0018 : 07 23 00 2D 01 58 92 6C 0F 
      return;                                                                   //0021 : 04 0B 
    }
    if (BaseEyeHeight == 0) {                                                   //0023 : 07 42 00 B4 01 10 BA 75 0F 39 3F 25 16 
      BaseEyeHeight = 0.80000001 * CollisionHeight;                             //0030 : 0F 01 10 BA 75 0F AB 1E CD CC 4C 3F 01 40 8A 6C 0F 16 
    }
    EyeHeight = BaseEyeHeight;                                                  //0042 : 0F 01 D0 76 71 0F 01 10 BA 75 0F 
    if (MenuName == "") {                                                       //004D : 07 6C 00 7A 01 E0 BD 75 0F 1F 00 16 
      MenuName = GetItemName(string(Class));                                    //0059 : 0F 01 E0 BD 75 0F 1B 46 29 00 00 39 56 01 68 E5 6B 0F 16 
    }
    //1C 18 B5 6C 0F 16 0F 01 B8 80 6C 0F 17 0F 01 D0 E8 6E 0F 01 00 84 6C 0F 07 23 00 2D 01 58 92 6C 
    //0F 04 0B 07 42 00 B4 01 10 BA 75 0F 39 3F 25 16 0F 01 10 BA 75 0F AB 1E CD CC 4C 3F 01 40 8A 6C 
    //0F 16 0F 01 D0 76 71 0F 01 10 BA 75 0F 07 6C 00 7A 01 E0 BD 75 0F 1F 00 16 0F 01 E0 BD 75 0F 1B 
    //46 29 00 00 39 56 01 68 E5 6B 0F 16 04 0B 47 
  }


  simulated event Destroyed() {
    if (Shadow != None) {                                                       //0000 : 07 17 00 77 01 60 BF 75 0F 2A 16 
      Shadow.Destroy();                                                         //000B : 19 01 60 BF 75 0F 03 00 04 61 17 16 
    }
    Super.Destroyed();                                                          //0017 : 1C 30 8A 6D 0F 16 
    //07 17 00 77 01 60 BF 75 0F 2A 16 19 01 60 BF 75 0F 03 00 04 61 17 16 1C 30 8A 6D 0F 16 04 0B 47 
    //
  }


  simulated function Vector EyePosition() {
    return EyeHeight * vect(0.000000, 0.000000, 1.000000) + WalkBob;            //0000 : 04 D7 D5 01 D0 76 71 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 01 C8 68 71 0F 16 
    //04 D7 D5 01 D0 76 71 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 01 C8 68 71 0F 16 04 0B 47 
  }


  singular event BaseChange() {
    if (bInterpolating) {                                                       //0000 : 07 0B 00 2D 01 D8 E8 35 0F 
      return;                                                                   //0009 : 04 0B 
    }
    if (Base == None && Physics == 0) {                                         //000B : 07 2D 00 82 72 01 B0 94 6C 0F 2A 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 16 
      SetPhysics(2);                                                            //0028 : 6F 82 24 02 16 
    }
    //07 0B 00 2D 01 D8 E8 35 0F 04 0B 07 2D 00 82 72 01 B0 94 6C 0F 2A 16 18 0E 00 9A 39 3A 01 C0 93 
    //6C 0F 39 3A 24 00 16 16 6F 82 24 02 16 04 0B 47 
  }


  function JumpOffPawn() {
    Velocity += (100 + CollisionRadius) * VRand();                              //0000 : DF 01 A0 95 6C 0F D5 AE 39 3F 2C 64 01 C8 89 6C 0F 16 FC 16 16 16 
    Velocity.Z = 200.00000000 + CollisionHeight;                                //0016 : 0F 36 38 C5 69 0F 01 A0 95 6C 0F AE 1E 00 00 48 43 01 40 8A 6C 0F 16 
    SetPhysics(2);                                                              //002D : 6F 82 24 02 16 
    bNoJumpAdjust = True;                                                       //0032 : 14 2D 01 C8 C3 75 0F 27 
    if (Controller != None) {                                                   //003A : 07 54 00 77 01 00 6E 6C 0F 2A 16 
      Controller.SetFall();                                                     //0045 : 19 01 00 6E 6C 0F 06 00 00 1B 2F 2B 00 00 16 
    }
    //DF 01 A0 95 6C 0F D5 AE 39 3F 2C 64 01 C8 89 6C 0F 16 FC 16 16 16 0F 36 38 C5 69 0F 01 A0 95 6C 
    //0F AE 1E 00 00 48 43 01 40 8A 6C 0F 16 6F 82 24 02 16 14 2D 01 C8 C3 75 0F 27 07 54 00 77 01 00 
    //6E 6C 0F 2A 16 19 01 00 6E 6C 0F 06 00 00 1B 2F 2B 00 00 16 04 0B 47 
  }


  function GibbedBy(Actor Other) {
    if (Role < 4) {                                                             //0000 : 07 12 00 96 39 3A 01 D0 92 6C 0F 39 3A 24 04 16 
      return;                                                                   //0010 : 04 0B 
    }
    if (Pawn(Other) != None) {                                                  //0012 : 07 48 00 77 2E 50 31 D4 00 00 F0 C4 75 0F 2A 16 
      Died(Pawn(Other).Controller,Class'DamTypeTelefragged',Location);          //0022 : 1B 13 0F 00 00 19 2E 50 31 D4 00 00 F0 C4 75 0F 05 00 04 01 00 6E 6C 0F 20 10 C6 75 0F 01 30 81 6C 0F 16 
    } else {                                                                    //0045 : 06 59 00 
      Died(None,Class'Gibbed',Location);                                        //0048 : 1B 13 0F 00 00 2A 20 50 CB 75 0F 01 30 81 6C 0F 16 
    }
    //07 12 00 96 39 3A 01 D0 92 6C 0F 39 3A 24 04 16 04 0B 07 48 00 77 2E 50 31 D4 00 00 F0 C4 75 0F 
    //2A 16 1B 13 0F 00 00 19 2E 50 31 D4 00 00 F0 C4 75 0F 05 00 04 01 00 6E 6C 0F 20 10 C6 75 0F 01 
    //30 81 6C 0F 16 06 59 00 1B 13 0F 00 00 2A 20 50 CB 75 0F 01 30 81 6C 0F 16 04 0B 47 
  }


  event EncroachedBy(Actor Other) {
    //04 0B 47 
  }


  event bool EncroachingOn(Actor Other) {
    if (Other.bWorldGeometry || Other.bBlocksTeleport) {                        //0000 : 07 28 00 84 19 00 98 D2 75 0F 06 00 04 2D 01 48 6A 6E 0F 18 10 00 19 00 98 D2 75 0F 06 00 04 2D 01 00 DF 6E 0F 16 
      return True;                                                              //0026 : 04 27 
    }
    if ((Controller == None || !Controller.bIsPlayer
      || bWarping)
      && Pawn(Other) != None) {//0028 : 07 68 00 82 84 84 72 01 00 6E 6C 0F 2A 16 18 12 00 81 19 01 00 6E 6C 0F 06 00 04 2D 01 E0 E5 70 0F 16 16 18 07 00 2D 01 D0 D3 75 0F 16 18 0E 00 77 2E 50 31 D4 00 00 98 D2 75 0F 2A 16 16 
      return True;                                                              //0066 : 04 27 
    }
    return False;                                                               //0068 : 04 28 
    //07 28 00 84 19 00 98 D2 75 0F 06 00 04 2D 01 48 6A 6E 0F 18 10 00 19 00 98 D2 75 0F 06 00 04 2D 
    //01 00 DF 6E 0F 16 04 27 07 68 00 82 84 84 72 01 00 6E 6C 0F 2A 16 18 12 00 81 19 01 00 6E 6C 0F 
    //06 00 04 2D 01 E0 E5 70 0F 16 16 18 07 00 2D 01 D0 D3 75 0F 16 18 0E 00 77 2E 50 31 D4 00 00 98 
    //D2 75 0F 2A 16 16 04 27 04 28 04 0B 47 
  }


  function int LimitPitchFirstPersonView(int Pitch) {
    Pitch = Pitch & 65535;                                                      //0000 : 0F 00 70 D5 75 0F 9C 00 70 D5 75 0F 1D FF FF 00 00 16 
    if (Pitch > PitchUpLimitFirstPersonView
      && Pitch < PitchDownLimit) {  //0012 : 07 68 00 82 97 00 70 D5 75 0F 01 B0 D6 75 0F 16 18 0D 00 96 00 70 D5 75 0F 01 28 D7 75 0F 16 16 
      if (Pitch - PitchUpLimitFirstPersonView < PitchDownLimit - Pitch) {       //0032 : 07 5D 00 96 93 00 70 D5 75 0F 01 B0 D6 75 0F 16 93 01 28 D7 75 0F 00 70 D5 75 0F 16 16 
        Pitch = PitchUpLimitFirstPersonView;                                    //004F : 0F 00 70 D5 75 0F 01 B0 D6 75 0F 
      } else {                                                                  //005A : 06 68 00 
        Pitch = PitchDownLimit;                                                 //005D : 0F 00 70 D5 75 0F 01 28 D7 75 0F 
      }
    }
    return Pitch;                                                               //0068 : 04 00 70 D5 75 0F 
    //0F 00 70 D5 75 0F 9C 00 70 D5 75 0F 1D FF FF 00 00 16 07 68 00 82 97 00 70 D5 75 0F 01 B0 D6 75 
    //0F 16 18 0D 00 96 00 70 D5 75 0F 01 28 D7 75 0F 16 16 07 5D 00 96 93 00 70 D5 75 0F 01 B0 D6 75 
    //0F 16 93 01 28 D7 75 0F 00 70 D5 75 0F 16 16 0F 00 70 D5 75 0F 01 B0 D6 75 0F 06 68 00 0F 00 70 
    //D5 75 0F 01 28 D7 75 0F 04 00 70 D5 75 0F 04 0B 47 
  }


  function int LimitPitchBehindView(int Pitch) {
    Pitch = Pitch & 65535;                                                      //0000 : 0F 00 C8 D8 75 0F 9C 00 C8 D8 75 0F 1D FF FF 00 00 16 
    if (Pitch > PitchUpLimitBehindView && Pitch < PitchDownLimit) {             //0012 : 07 68 00 82 97 00 C8 D8 75 0F 01 08 DA 75 0F 16 18 0D 00 96 00 C8 D8 75 0F 01 28 D7 75 0F 16 16 
      if (Pitch - PitchUpLimitBehindView < PitchDownLimit - Pitch) {            //0032 : 07 5D 00 96 93 00 C8 D8 75 0F 01 08 DA 75 0F 16 93 01 28 D7 75 0F 00 C8 D8 75 0F 16 16 
        Pitch = PitchUpLimitBehindView;                                         //004F : 0F 00 C8 D8 75 0F 01 08 DA 75 0F 
      } else {                                                                  //005A : 06 68 00 
        Pitch = PitchDownLimit;                                                 //005D : 0F 00 C8 D8 75 0F 01 28 D7 75 0F 
      }
    }
    return Pitch;                                                               //0068 : 04 00 C8 D8 75 0F 
    //0F 00 C8 D8 75 0F 9C 00 C8 D8 75 0F 1D FF FF 00 00 16 07 68 00 82 97 00 C8 D8 75 0F 01 08 DA 75 
    //0F 16 18 0D 00 96 00 C8 D8 75 0F 01 28 D7 75 0F 16 16 07 5D 00 96 93 00 C8 D8 75 0F 01 08 DA 75 
    //0F 16 93 01 28 D7 75 0F 00 C8 D8 75 0F 16 16 0F 00 C8 D8 75 0F 01 08 DA 75 0F 06 68 00 0F 00 C8 
    //D8 75 0F 01 28 D7 75 0F 04 00 C8 D8 75 0F 04 0B 47 
  }


  simulated function FaceRotation(Rotator NewRotation,float DeltaTime) {
    if (IsRotationFrozen() || Physics == 19
      || Physics == 20) {           //0000 : 07 2F 00 84 84 1B 4A 0F 00 00 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 
      return;                                                                   //002D : 04 0B 
    }
    if (Physics == 11 && OnLadder != None) {                                    //002F : 07 63 00 82 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 18 09 00 77 01 40 DD 75 0F 2A 16 16 
      SetRotation(OnLadder.WallDir);                                            //004C : 1C 70 01 6E 0F 19 01 40 DD 75 0F 05 00 0C 01 B8 DD 75 0F 16 
    } else {                                                                    //0060 : 06 AE 00 
      if (Physics == 1 || Physics == 2 || Physics == 18) {                      //0063 : 07 A3 00 84 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 12 16 16 
        NewRotation.Pitch = 0;                                                  //0097 : 0F 36 A8 BE 69 0F 00 A8 DB 75 0F 25 
      }
      SetRotation(NewRotation);                                                 //00A3 : 1C 70 01 6E 0F 00 A8 DB 75 0F 16 
    }
    //07 2F 00 84 84 1B 4A 0F 00 00 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 16 18 0E 00 9A 
    //39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 04 0B 07 63 00 82 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 
    //18 09 00 77 01 40 DD 75 0F 2A 16 16 1C 70 01 6E 0F 19 01 40 DD 75 0F 05 00 0C 01 B8 DD 75 0F 16 
    //06 AE 00 07 A3 00 84 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 
    //39 3A 24 02 16 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 12 16 16 0F 36 A8 BE 69 0F 00 A8 DB 
    //75 0F 25 1C 70 01 6E 0F 00 A8 DB 75 0F 16 04 0B 47 
  }


  event bool IsRotationFrozen() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function KilledBy(Pawn EventInstigator) {
    TakeDamage(99999,EventInstigator,Location,vect(0.000000, 0.000000, 0.000000),Class'DamageType');//0000 : 1B 5C 0C 00 00 1D 9F 86 01 00 00 B8 E0 75 0F 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 44 C2 00 16 
    //1B 5C 0C 00 00 1D 9F 86 01 00 00 B8 E0 75 0F 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 
    //00 20 18 44 C2 00 16 04 0B 47 
  }


  function AddVelocity(Vector newVelocity) {
    if (bIgnoreForces
      || newVelocity == vect(0.000000, 0.000000, 0.000000)) {//0000 : 07 24 00 84 2D 01 90 79 6C 0F 18 15 00 D9 00 48 E2 75 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 16 
      return;                                                                   //0022 : 04 0B 
    }
    if (Physics == 1 || Physics == 19 || Physics == 20
      || (Physics == 11 || Physics == 9)
      && newVelocity.Z > default.JumpZ) {//0024 : 07 97 00 84 84 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 18 36 00 82 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 09 16 16 18 12 00 B1 36 38 C5 69 0F 00 48 E2 75 0F 02 20 E4 75 0F 16 16 16 
      SetPhysics(2);                                                            //0092 : 6F 82 24 02 16 
    }
    if (Velocity.Z > 380 && newVelocity.Z > 0) {                                //0097 : 07 D2 00 82 B1 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 1D 7C 01 00 00 16 18 10 00 B1 36 38 C5 69 0F 00 48 E2 75 0F 39 3F 25 16 16 
      newVelocity.Z *= 0.50000000;                                              //00C1 : B6 36 38 C5 69 0F 00 48 E2 75 0F 1E 00 00 00 3F 16 
    }
    Velocity += newVelocity;                                                    //00D2 : DF 01 A0 95 6C 0F 00 48 E2 75 0F 16 
    //07 24 00 84 2D 01 90 79 6C 0F 18 15 00 D9 00 48 E2 75 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    //16 16 04 0B 07 97 00 84 84 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 
    //6C 0F 39 3A 24 13 16 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 18 36 00 82 84 9A 39 
    //3A 01 C0 93 6C 0F 39 3A 24 0B 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 09 16 16 18 12 00 B1 
    //36 38 C5 69 0F 00 48 E2 75 0F 02 20 E4 75 0F 16 16 16 6F 82 24 02 16 07 D2 00 82 B1 36 38 C5 69 
    //0F 01 A0 95 6C 0F 39 3F 1D 7C 01 00 00 16 18 10 00 B1 36 38 C5 69 0F 00 48 E2 75 0F 39 3F 25 16 
    //16 B6 36 38 C5 69 0F 00 48 E2 75 0F 1E 00 00 00 3F 16 DF 01 A0 95 6C 0F 00 48 E2 75 0F 16 04 0B 
    //47 
  }


  function RestartPlayer();


  event StartCrouch(float HeightAdjust) {
    EyeHeight += HeightAdjust;                                                  //0000 : B8 01 D0 76 71 0F 00 28 E6 75 0F 16 
    OldZ -= HeightAdjust;                                                       //000C : B9 01 18 E7 75 0F 00 28 E6 75 0F 16 
    BaseEyeHeight = FMin(0.80000001 * CrouchHeight,CrouchHeight - 10);          //0018 : 0F 01 10 BA 75 0F F4 AB 1E CD CC 4C 3F 01 90 E7 75 0F 16 AF 01 90 E7 75 0F 39 3F 2C 0A 16 16 
    //B8 01 D0 76 71 0F 00 28 E6 75 0F 16 B9 01 18 E7 75 0F 00 28 E6 75 0F 16 0F 01 10 BA 75 0F F4 AB 
    //1E CD CC 4C 3F 01 90 E7 75 0F 16 AF 01 90 E7 75 0F 39 3F 2C 0A 16 16 04 0B 47 
  }


  event EndCrouch(float HeightAdjust) {
    EyeHeight -= HeightAdjust;                                                  //0000 : B9 01 D0 76 71 0F 00 B8 E8 75 0F 16 
    OldZ += HeightAdjust;                                                       //000C : B8 01 18 E7 75 0F 00 B8 E8 75 0F 16 
    BaseEyeHeight = default.BaseEyeHeight;                                      //0018 : 0F 01 10 BA 75 0F 02 10 BA 75 0F 
    //B9 01 D0 76 71 0F 00 B8 E8 75 0F 16 B8 01 18 E7 75 0F 00 B8 E8 75 0F 16 0F 01 10 BA 75 0F 02 10 
    //BA 75 0F 04 0B 47 
  }


  function ShouldCrouch(bool Crouch) {
    if (bWantsToCrouch != Crouch) {                                             //0000 : 07 1E 00 F3 2D 01 28 B7 74 0F 2D 00 40 EA 75 0F 16 
      bWantsToCrouch = Crouch;                                                  //0011 : 14 2D 01 28 B7 74 0F 2D 00 40 EA 75 0F 
    }
    //07 1E 00 F3 2D 01 28 B7 74 0F 2D 00 40 EA 75 0F 16 14 2D 01 28 B7 74 0F 2D 00 40 EA 75 0F 04 0B 
    //47 
  }


  event FellOutOfWorld(byte KillType) {
    if (Level.NetMode == 3) {                                                   //0000 : 07 1B 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 
      return;                                                                   //0019 : 04 0B 
    }
    if (Controller != None && Controller.AvoidCertainDeath()) {                 //001B : 07 3C 00 82 77 01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 1B 09 2C 00 00 16 16 
      return;                                                                   //003A : 04 0B 
    }
    Died(None,Class'fell',Location);                                            //003C : 1B 13 0F 00 00 2A 20 D0 EC 75 0F 01 30 81 6C 0F 16 
    //07 1B 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 04 0B 07 3C 00 82 77 
    //01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 1B 09 2C 00 00 16 16 04 0B 1B 13 0F 00 
    //00 2A 20 D0 EC 75 0F 01 30 81 6C 0F 16 04 0B 47 
  }


  simulated event ModifyVelocity(float DeltaTime,Vector OldVelocity);


  function JumpOutOfWater(Vector jumpDir) {
    Falling();                                                                  //0000 : 1B 36 01 00 00 16 
    Velocity = jumpDir * WaterSpeed;                                            //0006 : 0F 01 A0 95 6C 0F D4 00 90 F4 75 0F 01 A0 F5 75 0F 16 
    SetAcceleration(jumpDir * AccelRate);                                       //0018 : 1B A5 2B 00 00 D4 00 90 F4 75 0F 01 18 F6 75 0F 16 16 
    Velocity.Z = FMax(380.00000000,GetJumpZ());                                 //002A : 0F 36 38 C5 69 0F 01 A0 95 6C 0F F5 1E 00 00 BE 43 1C 20 3D 37 0F 16 16 
    bUpAndOut = True;                                                           //0042 : 14 2D 01 90 F6 75 0F 27 
    //1B 36 01 00 00 16 0F 01 A0 95 6C 0F D4 00 90 F4 75 0F 01 A0 F5 75 0F 16 1B A5 2B 00 00 D4 00 90 
    //F4 75 0F 01 18 F6 75 0F 16 16 0F 36 38 C5 69 0F 01 A0 95 6C 0F F5 1E 00 00 BE 43 1C 20 3D 37 0F 
    //16 16 14 2D 01 90 F6 75 0F 27 04 0B 47 
  }


  function FinishedInterpolation() {
    DropToGround();                                                             //0000 : 1B A8 2B 00 00 16 
    //1B A8 2B 00 00 16 04 0B 47 
  }


  function SetDefaultDisplayProperties() {
    Style = default.Style;                                                      //0000 : 0F 01 E8 98 6C 0F 02 E8 98 6C 0F 
    Texture = default.Texture;                                                  //000B : 0F 01 D0 9D 6C 0F 02 D0 9D 6C 0F 
    bUnlit = default.bUnlit;                                                    //0016 : 14 2D 01 18 A3 6C 0F 2D 02 18 A3 6C 0F 
    bUpdatingDisplay = False;                                                   //0023 : 14 2D 01 08 F9 75 0F 28 
    //0F 01 E8 98 6C 0F 02 E8 98 6C 0F 0F 01 D0 9D 6C 0F 02 D0 9D 6C 0F 14 2D 01 18 A3 6C 0F 2D 02 18 
    //A3 6C 0F 14 2D 01 08 F9 75 0F 28 04 0B 47 
  }


  function SetDisplayProperties(byte NewStyle,Material NewTexture,bool bLighting) {
    Style = NewStyle;                                                           //0000 : 0F 01 E8 98 6C 0F 00 30 FA 75 0F 
    Texture = NewTexture;                                                       //000B : 0F 01 D0 9D 6C 0F 00 70 00 76 0F 
    bUnlit = bLighting;                                                         //0016 : 14 2D 01 18 A3 6C 0F 2D 00 E8 00 76 0F 
    bUpdatingDisplay = False;                                                   //0023 : 14 2D 01 08 F9 75 0F 28 
    //0F 01 E8 98 6C 0F 00 30 FA 75 0F 0F 01 D0 9D 6C 0F 00 70 00 76 0F 14 2D 01 18 A3 6C 0F 2D 00 E8 
    //00 76 0F 14 2D 01 08 F9 75 0F 28 04 0B 47 
  }


  function bool CanTrigger(Trigger t) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function Trigger(Actor Other,Pawn EventInstigator) {
    if (Controller != None) {                                                   //0000 : 07 24 00 77 01 00 6E 6C 0F 2A 16 
      Controller.Trigger(Other,EventInstigator);                                //000B : 19 01 00 6E 6C 0F 10 00 00 1B 32 01 00 00 00 B0 BC 31 0F 00 88 BD 31 0F 16 
    }
    //07 24 00 77 01 00 6E 6C 0F 2A 16 19 01 00 6E 6C 0F 10 00 00 1B 32 01 00 00 00 B0 BC 31 0F 00 88 
    //BD 31 0F 16 04 0B 47 
  }


  function float AdjustedStrength() {
    return 0.00000000;                                                          //0000 : 04 1E 00 00 00 00 
    //04 1E 00 00 00 00 04 0B 47 
  }


  function bool LineOfSightTo(Actor Other) {
    return Controller != None
      && Controller. Super.LineOfSightTo(Other);  //0000 : 04 82 77 01 00 6E 6C 0F 2A 16 18 12 00 19 01 00 6E 6C 0F 08 00 04 62 02 00 30 03 76 0F 16 16 
    //04 82 77 01 00 6E 6C 0F 2A 16 18 12 00 19 01 00 6E 6C 0F 08 00 04 62 02 00 30 03 76 0F 16 16 04 
    //0B 47 
  }


  function SetMoveTarget(Actor NewTarget) {
    if (Controller != None) {                                                   //0000 : 07 1F 00 77 01 00 6E 6C 0F 2A 16 
      Controller.MoveTarget = NewTarget;                                        //000B : 0F 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 00 28 05 76 0F 
    }
    //07 1F 00 77 01 00 6E 6C 0F 2A 16 0F 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 00 28 05 76 0F 04 
    //0B 47 
  }


  function Actor GetMoveTarget() {
    if (Controller == None) {                                                   //0000 : 07 0D 00 72 01 00 6E 6C 0F 2A 16 
      return None;                                                              //000B : 04 2A 
    }
    return Controller.MoveTarget;                                               //000D : 04 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 
    //07 0D 00 72 01 00 6E 6C 0F 2A 16 04 2A 04 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 04 0B 47 
  }


  final simulated function bool PressingAltFire() {
    return Controller != None && Controller.bAltFire != 0;                      //0000 : 04 82 77 01 00 6E 6C 0F 2A 16 18 14 00 9B 39 3A 19 01 00 6E 6C 0F 05 00 01 01 A0 F3 70 0F 25 16 16 
    //04 82 77 01 00 6E 6C 0F 2A 16 18 14 00 9B 39 3A 19 01 00 6E 6C 0F 05 00 01 01 A0 F3 70 0F 25 16 
    //16 04 0B 47 
  }


  final simulated function bool PressingFire() {
    return Controller != None && Controller.bFire != 0;                         //0000 : 04 82 77 01 00 6E 6C 0F 2A 16 18 14 00 9B 39 3A 19 01 00 6E 6C 0F 05 00 01 01 28 F3 70 0F 25 16 16 
    //04 82 77 01 00 6E 6C 0F 2A 16 18 14 00 9B 39 3A 19 01 00 6E 6C 0F 05 00 01 01 28 F3 70 0F 25 16 
    //16 04 0B 47 
  }


  function bool NearMoveTarget() {
    if (Controller == None || Controller.MoveTarget == None) {                  //0000 : 07 23 00 84 72 01 00 6E 6C 0F 2A 16 18 12 00 72 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 
      return False;                                                             //0021 : 04 28 
    }
    return ReachedDestination(Controller.MoveTarget);                           //0023 : 04 1B 78 2B 00 00 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 16 
    //07 23 00 84 72 01 00 6E 6C 0F 2A 16 18 12 00 72 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 2A 16 
    //16 04 28 04 1B 78 2B 00 00 19 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 16 04 0B 47 
  }


  final function bool InGodMode() {
    return Controller != None && Controller.bGodMode;                           //0000 : 04 82 77 01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 2D 01 58 E6 70 0F 16 
    //04 82 77 01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 2D 01 58 E6 70 0F 16 04 0B 47 
    //
  }


  simulated function SetViewRotation(Rotator NewRotation) {
    if (Controller != None) {                                                   //0000 : 07 1F 00 77 01 00 6E 6C 0F 2A 16 
      Controller.SetRotation(NewRotation);                                      //000B : 19 01 00 6E 6C 0F 0B 00 04 1C 70 01 6E 0F 00 60 0E 76 0F 16 
    }
    //07 1F 00 77 01 00 6E 6C 0F 2A 16 19 01 00 6E 6C 0F 0B 00 04 1C 70 01 6E 0F 00 60 0E 76 0F 16 04 
    //0B 47 
  }


  simulated function Rotator GetViewRotation() {
    if (Controller == None) {                                                   //0000 : 07 11 00 72 01 00 6E 6C 0F 2A 16 
      return Rotation;                                                          //000B : 04 01 00 84 6C 0F 
    }
    return Controller.GetViewRotation();                                        //0011 : 04 19 01 00 6E 6C 0F 06 00 0C 1B BC 2A 00 00 16 
    //07 11 00 72 01 00 6E 6C 0F 2A 16 04 01 00 84 6C 0F 04 19 01 00 6E 6C 0F 06 00 0C 1B BC 2A 00 00 
    //16 04 0B 47 
  }


  simulated function bool IsFirstPerson() {
    local PlayerController PC;
    PC = PlayerController(Controller);                                          //0000 : 0F 00 78 12 76 0F 2E 58 34 C2 00 01 00 6E 6C 0F 
    return PC != None && !PC.bBehindView && Viewport(PC.Player) != None;        //0010 : 04 82 82 77 00 78 12 76 0F 2A 16 18 12 00 81 19 00 78 12 76 0F 06 00 04 2D 01 A0 54 71 0F 16 16 18 17 00 77 2E 28 C2 C2 00 19 00 78 12 76 0F 05 00 04 01 28 25 71 0F 2A 16 16 
    //0F 00 78 12 76 0F 2E 58 34 C2 00 01 00 6E 6C 0F 04 82 82 77 00 78 12 76 0F 2A 16 18 12 00 81 19 
    //00 78 12 76 0F 06 00 04 2D 01 A0 54 71 0F 16 16 18 17 00 77 2E 28 C2 C2 00 19 00 78 12 76 0F 05 
    //00 04 01 28 25 71 0F 2A 16 16 04 0B 47 
  }


  simulated function bool IsLocallyControlled() {
    if (Level.NetMode == 0) {                                                   //0000 : 07 1B 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 
      return True;                                                              //0019 : 04 27 
    }
    if (Controller == None) {                                                   //001B : 07 28 00 72 01 00 6E 6C 0F 2A 16 
      return False;                                                             //0026 : 04 28 
    }
    if (PlayerController(Controller) == None) {                                 //0028 : 07 3A 00 72 2E 58 34 C2 00 01 00 6E 6C 0F 2A 16 
      return True;                                                              //0038 : 04 27 
    }
    return Viewport(PlayerController(Controller).Player) != None;               //003A : 04 77 2E 28 C2 C2 00 19 2E 58 34 C2 00 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 2A 16 
    //07 1B 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 04 27 07 28 00 72 01 
    //00 6E 6C 0F 2A 16 04 28 07 3A 00 72 2E 58 34 C2 00 01 00 6E 6C 0F 2A 16 04 27 04 77 2E 28 C2 C2 
    //00 19 2E 58 34 C2 00 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 2A 16 04 0B 47 
  }


  simulated function bool IsHumanControlled() {
    return PlayerController(Controller) != None;                                //0000 : 04 77 2E 58 34 C2 00 01 00 6E 6C 0F 2A 16 
    //04 77 2E 58 34 C2 00 01 00 6E 6C 0F 2A 16 04 0B 47 
  }


  simulated function bool WasPlayerPawn() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  simulated event bool IsPlayerPawn() {
    return Controller != None && Controller.bIsPlayer;                          //0000 : 04 82 77 01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 2D 01 E0 E5 70 0F 16 
    //04 82 77 01 00 6E 6C 0F 2A 16 18 10 00 19 01 00 6E 6C 0F 06 00 04 2D 01 E0 E5 70 0F 16 04 0B 47 
    //
  }


  final native function bool IsNPC();


  final native function bool IsRemotePlayer();


  final native function bool IsLocalPlayer();


  simulated function DisplayDebug(Canvas Canvas,out float YL,out float YPos) {
    local string t;
    Super.DisplayDebug(Canvas,YL,YPos);                                         //0000 : 1C 68 EB 35 0F 00 78 1D 76 0F 00 F0 1D 76 0F 00 68 1E 76 0F 16 
    Canvas.SetDrawColor(255,255,255);                                           //0015 : 19 00 78 1D 76 0F 12 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0030 : 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 
    Canvas.DrawText("Anchor " $ string(Anchor) $ " Serpentine Dist "
      $ string(SerpentineDist)
      $ " Time "
      $ string(SerpentineTime));//0049 : 19 00 78 1D 76 0F 46 00 00 61 D1 70 70 70 70 70 1F 41 6E 63 68 6F 72 20 00 39 56 01 E0 1E 76 0F 16 1F 20 53 65 72 70 65 6E 74 69 6E 65 20 44 69 73 74 20 00 16 39 55 01 58 1F 76 0F 16 1F 20 54 69 6D 65 20 00 16 39 55 01 D0 1F 76 0F 16 16 
    YPos += YL;                                                                 //0098 : B8 00 68 1E 76 0F 00 F0 1D 76 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //00A4 : 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 
    t = "Floor " $ string(Floor) $ " DesiredSpeed "
      $ string(DesiredSpeed)
      $ " Crouched "
      $ string(bIsCrouched)
      $ " Try to uncrouch "
      $ string(UncrouchTime);//00BD : 0F 00 48 20 76 0F 70 70 70 70 70 70 70 1F 46 6C 6F 6F 72 20 00 39 58 01 A0 B7 74 0F 16 1F 20 44 65 73 69 72 65 64 53 70 65 65 64 20 00 16 39 55 01 C0 20 76 0F 16 1F 20 43 72 6F 75 63 68 65 64 20 00 16 39 54 2D 01 B0 B6 74 0F 16 1F 20 54 72 79 20 74 6F 20 75 6E 63 72 6F 75 63 68 20 00 16 39 55 01 38 21 76 0F 16 
    if (OnLadder != None || Physics == 11) {                                    //0125 : 07 65 01 84 77 01 40 DD 75 0F 2A 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 16 
      t = t $ " on lAdder " $ string(OnLadder);                                 //0142 : 0F 00 48 20 76 0F 70 70 00 48 20 76 0F 1F 20 6F 6E 20 6C 41 64 64 65 72 20 00 16 39 56 01 40 DD 75 0F 16 
    }
    Canvas.DrawText(t);                                                         //0165 : 19 00 78 1D 76 0F 08 00 00 61 D1 00 48 20 76 0F 16 
    YPos += YL;                                                                 //0176 : B8 00 68 1E 76 0F 00 F0 1D 76 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0182 : 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 
    Canvas.DrawText("EyeHeight " $ string(EyeHeight)
      $ " BaseEyeHeight "
      $ string(BaseEyeHeight)
      $ " Physics Anim "
      $ string(bPhysicsAnimUpdate));//019B : 19 00 78 1D 76 0F 50 00 00 61 D1 70 70 70 70 70 1F 45 79 65 48 65 69 67 68 74 20 00 39 55 01 D0 76 71 0F 16 1F 20 42 61 73 65 45 79 65 48 65 69 67 68 74 20 00 16 39 55 01 10 BA 75 0F 16 1F 20 50 68 79 73 69 63 73 20 41 6E 69 6D 20 00 16 39 54 2D 01 20 66 6C 0F 16 16 
    YPos += YL;                                                                 //01F4 : B8 00 68 1E 76 0F 00 F0 1D 76 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0200 : 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 
    if (Controller == None) {                                                   //0219 : 07 7E 02 72 01 00 6E 6C 0F 2A 16 
      Canvas.SetDrawColor(255,0,0);                                             //0224 : 19 00 78 1D 76 0F 0E 00 00 1C 30 91 6C 0F 39 3D 2C FF 24 00 24 00 16 
      Canvas.DrawText("NO CONTROLLER");                                         //023B : 19 00 78 1D 76 0F 12 00 00 61 D1 1F 4E 4F 20 43 4F 4E 54 52 4F 4C 4C 45 52 00 16 
      YPos += YL;                                                               //0256 : B8 00 68 1E 76 0F 00 F0 1D 76 0F 16 
      Canvas.SetPos(4.00000000,YPos);                                           //0262 : 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 
    } else {                                                                    //027B : 06 9C 02 
      Controller.DisplayDebug(Canvas,YL,YPos);                                  //027E : 19 01 00 6E 6C 0F 15 00 00 1B 94 2A 00 00 00 78 1D 76 0F 00 F0 1D 76 0F 00 68 1E 76 0F 16 
    }
    //1C 68 EB 35 0F 00 78 1D 76 0F 00 F0 1D 76 0F 00 68 1E 76 0F 16 19 00 78 1D 76 0F 12 00 00 1C 30 
    //91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 
    //00 80 40 00 68 1E 76 0F 16 19 00 78 1D 76 0F 46 00 00 61 D1 70 70 70 70 70 1F 41 6E 63 68 6F 72 
    //20 00 39 56 01 E0 1E 76 0F 16 1F 20 53 65 72 70 65 6E 74 69 6E 65 20 44 69 73 74 20 00 16 39 55 
    //01 58 1F 76 0F 16 1F 20 54 69 6D 65 20 00 16 39 55 01 D0 1F 76 0F 16 16 B8 00 68 1E 76 0F 00 F0 
    //1D 76 0F 16 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 0F 00 48 
    //20 76 0F 70 70 70 70 70 70 70 1F 46 6C 6F 6F 72 20 00 39 58 01 A0 B7 74 0F 16 1F 20 44 65 73 69 
    //72 65 64 53 70 65 65 64 20 00 16 39 55 01 C0 20 76 0F 16 1F 20 43 72 6F 75 63 68 65 64 20 00 16 
    //39 54 2D 01 B0 B6 74 0F 16 1F 20 54 72 79 20 74 6F 20 75 6E 63 72 6F 75 63 68 20 00 16 39 55 01 
    //38 21 76 0F 16 07 65 01 84 77 01 40 DD 75 0F 2A 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 
    //16 16 0F 00 48 20 76 0F 70 70 00 48 20 76 0F 1F 20 6F 6E 20 6C 41 64 64 65 72 20 00 16 39 56 01 
    //40 DD 75 0F 16 19 00 78 1D 76 0F 08 00 00 61 D1 00 48 20 76 0F 16 B8 00 68 1E 76 0F 00 F0 1D 76 
    //0F 16 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 19 00 78 1D 76 
    //0F 50 00 00 61 D1 70 70 70 70 70 1F 45 79 65 48 65 69 67 68 74 20 00 39 55 01 D0 76 71 0F 16 1F 
    //20 42 61 73 65 45 79 65 48 65 69 67 68 74 20 00 16 39 55 01 10 BA 75 0F 16 1F 20 50 68 79 73 69 
    //63 73 20 41 6E 69 6D 20 00 16 39 54 2D 01 20 66 6C 0F 16 16 B8 00 68 1E 76 0F 00 F0 1D 76 0F 16 
    //19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 07 7E 02 72 01 00 6E 
    //6C 0F 2A 16 19 00 78 1D 76 0F 0E 00 00 1C 30 91 6C 0F 39 3D 2C FF 24 00 24 00 16 19 00 78 1D 76 
    //0F 12 00 00 61 D1 1F 4E 4F 20 43 4F 4E 54 52 4F 4C 4C 45 52 00 16 B8 00 68 1E 76 0F 00 F0 1D 76 
    //0F 16 19 00 78 1D 76 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 68 1E 76 0F 16 06 9C 02 19 01 
    //00 6E 6C 0F 15 00 00 1B 94 2A 00 00 00 78 1D 76 0F 00 F0 1D 76 0F 00 68 1E 76 0F 16 04 0B 47 
  }


  function ClimbLadder(LadderVolume L) {
    OnLadder = L;                                                               //0000 : 0F 01 40 DD 75 0F 00 60 22 76 0F 
    if (OnLadder == None) {                                                     //000B : 07 18 00 72 01 40 DD 75 0F 2A 16 
      return;                                                                   //0016 : 04 0B 
    }
    SetRotation(OnLadder.WallDir);                                              //0018 : 1C 70 01 6E 0F 19 01 40 DD 75 0F 05 00 0C 01 B8 DD 75 0F 16 
    SetPhysics(11);                                                             //002C : 6F 82 24 0B 16 
    //0F 01 40 DD 75 0F 00 60 22 76 0F 07 18 00 72 01 40 DD 75 0F 2A 16 04 0B 1C 70 01 6E 0F 19 01 40 
    //DD 75 0F 05 00 0C 01 B8 DD 75 0F 16 6F 82 24 0B 16 04 0B 47 
  }


  function EndClimbLadder(LadderVolume OldLadder) {
    if (Controller != None) {                                                   //0000 : 07 1A 00 77 01 00 6E 6C 0F 2A 16 
      Controller.EndClimbLadder();                                              //000B : 19 01 00 6E 6C 0F 06 00 00 1B 11 2B 00 00 16 
    }
    if (Physics == 11) {                                                        //001A : 07 2F 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 
      SetPhysics(2);                                                            //002A : 6F 82 24 02 16 
    }
    //07 1A 00 77 01 00 6E 6C 0F 2A 16 19 01 00 6E 6C 0F 06 00 00 1B 11 2B 00 00 16 07 2F 00 9A 39 3A 
    //01 C0 93 6C 0F 39 3A 24 0B 16 6F 82 24 02 16 04 0B 47 
  }


  simulated function AddAcceleration(Vector newAcceleration) {
    if (Acceleration != newAcceleration) {                                      //0000 : 07 1B 00 DA 01 18 96 6C 0F 00 90 25 76 0F 16 
      Acceleration += newAcceleration;                                          //000F : DF 01 18 96 6C 0F 00 90 25 76 0F 16 
    }
    //07 1B 00 DA 01 18 96 6C 0F 00 90 25 76 0F 16 DF 01 18 96 6C 0F 00 90 25 76 0F 16 04 0B 47 
  }


  simulated function SetVelocity(Vector newVelocity) {
    if (Velocity != newVelocity) {                                              //0000 : 07 1A 00 DA 01 A0 95 6C 0F 00 10 27 76 0F 16 
      Velocity = newVelocity;                                                   //000F : 0F 01 A0 95 6C 0F 00 10 27 76 0F 
    }
    //07 1A 00 DA 01 A0 95 6C 0F 00 10 27 76 0F 16 0F 01 A0 95 6C 0F 00 10 27 76 0F 04 0B 47 
  }


  simulated function SetAcceleration(Vector newAcceleration) {
    if (Acceleration != newAcceleration) {                                      //0000 : 07 1A 00 DA 01 18 96 6C 0F 00 88 28 76 0F 16 
      Acceleration = newAcceleration;                                           //000F : 0F 01 18 96 6C 0F 00 88 28 76 0F 
    }
    //07 1A 00 DA 01 18 96 6C 0F 00 88 28 76 0F 16 0F 01 18 96 6C 0F 00 88 28 76 0F 04 0B 47 
  }


  simulated function bool CanSplash() {
    if (Level.TimeSeconds - SplashTime > 0.15000001
      && (Physics == 2 || Physics == 4)
      && Abs(Velocity.Z) > 100) {//0000 : 07 70 00 82 82 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 20 B9 75 0F 16 1E 9A 99 19 3E 16 18 20 00 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 04 16 16 16 18 13 00 B1 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 2C 64 16 16 
      SplashTime = Level.TimeSeconds;                                           //005A : 0F 01 20 B9 75 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      return True;                                                              //006E : 04 27 
    }
    return False;                                                               //0070 : 04 28 
    //07 70 00 82 82 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 20 B9 75 0F 16 1E 9A 99 19 3E 
    //16 18 20 00 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 
    //04 16 16 16 18 13 00 B1 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 2C 64 16 16 0F 01 20 B9 75 0F 
    //19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 04 27 04 28 04 0B 47 
  }


  event SetWalking(bool bNewIsWalking) {
    if (bNewIsWalking != bIsWalking) {                                          //0000 : 07 24 00 F3 2D 00 F0 2B 76 0F 2D 01 C8 2C 76 0F 16 
      bIsWalking = bNewIsWalking;                                               //0011 : 14 2D 01 C8 2C 76 0F 2D 00 F0 2B 76 0F 
      ChangeAnimation();                                                        //001E : 1B DE 2B 00 00 16 
    }
    //07 24 00 F3 2D 00 F0 2B 76 0F 2D 01 C8 2C 76 0F 16 14 2D 01 C8 2C 76 0F 2D 00 F0 2B 76 0F 1B DE 
    //2B 00 00 16 04 0B 47 
  }


  function bool CanGrabLadder() {
    if (IsRemotePlayer()) {                                                     //0000 : 07 10 00 1C C0 18 76 0F 16 
      return bCanClimbLadders;                                                  //0009 : 04 2D 01 68 2E 76 0F 
    }
    return bCanClimbLadders && Controller != None
      && Physics != 11
      && (Physics != 2 || Abs(Velocity.Z) <= GetJumpZ());//0010 : 04 82 82 82 2D 01 68 2E 76 0F 18 09 00 77 01 00 6E 6C 0F 2A 16 16 18 0E 00 9B 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 27 00 84 9B 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 18 15 00 B2 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 1C 20 3D 37 0F 16 16 16 16 
    //07 10 00 1C C0 18 76 0F 16 04 2D 01 68 2E 76 0F 04 82 82 82 2D 01 68 2E 76 0F 18 09 00 77 01 00 
    //6E 6C 0F 2A 16 16 18 0E 00 9B 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 27 00 84 9B 39 3A 01 C0 
    //93 6C 0F 39 3A 24 02 16 18 15 00 B2 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 1C 20 3D 37 0F 16 16 16 
    //16 04 0B 47 
  }


  function DropToGround() {
    bCollideWorld = True;                                                       //0000 : 14 2D 01 60 E8 35 0F 27 
    bInterpolating = False;                                                     //0008 : 14 2D 01 D8 E8 35 0F 28 
    if (GetHealth() > 0) {                                                      //0010 : 07 48 00 B1 1B 12 10 00 00 16 39 3F 25 16 
      SetCollision(True,True);                                                  //001E : 61 06 27 27 16 
      SetPhysics(2);                                                            //0023 : 6F 82 24 02 16 
      AmbientSound = None;                                                      //0028 : 0F 01 18 A1 6C 0F 2A 
      if (IsHumanControlled()) {                                                //002F : 07 48 00 1B A7 2A 00 00 16 
        Controller.GotoState(LandMovementState);                                //0038 : 19 01 00 6E 6C 0F 07 00 00 71 01 B8 0E 38 0F 16 
      }
    }
    //14 2D 01 60 E8 35 0F 27 14 2D 01 D8 E8 35 0F 28 07 48 00 B1 1B 12 10 00 00 16 39 3F 25 16 61 06 
    //27 27 16 6F 82 24 02 16 0F 01 18 A1 6C 0F 2A 07 48 00 1B A7 2A 00 00 16 19 01 00 6E 6C 0F 07 00 
    //00 71 01 B8 0E 38 0F 16 04 0B 47 
  }


  function BecomeViewTarget() {
    bUpdateEyeheight = True;                                                    //0000 : 14 2D 01 78 30 76 0F 27 
    //14 2D 01 78 30 76 0F 27 04 0B 47 
  }


  simulated function bool PointOfView() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function PlayTeleportEffect(bool bOut,bool bSound) {
    MakeNoise(1.00000000);                                                      //0000 : 62 00 1E 00 00 80 3F 16 
    //62 00 1E 00 00 80 3F 16 04 0B 47 
  }


  function bool SpectatorSpecialCalcView(PlayerController Viewer,out Actor ViewActor,out Vector CameraLocation,out Rotator CameraRotation);


  function bool SpecialCalcView(out Actor ViewActor,out Vector CameraLocation,out Rotator CameraRotation);


  simulated function SpecialDrawCrosshair(Canvas C);


  function DrawHUD(Canvas Canvas);


  function float ModifyThreat(float current,Pawn Threat) {
    return current;                                                             //0000 : 04 00 78 3D 76 0F 
    //04 00 78 3D 76 0F 04 0B 47 
  }


  function bool NeedToTurn(Vector targ) {
    local Vector LookDir;
    local Vector AimDir;
    LookDir = vector(Rotation);                                                 //0000 : 0F 00 08 41 76 0F 39 39 01 00 84 6C 0F 
    LookDir.Z = 0.00000000;                                                     //000D : 0F 36 38 C5 69 0F 00 08 41 76 0F 1E 00 00 00 00 
    LookDir = Normal(LookDir);                                                  //001D : 0F 00 08 41 76 0F E2 00 08 41 76 0F 16 
    AimDir = targ - Location;                                                   //002A : 0F 00 80 41 76 0F D8 00 C8 3F 76 0F 01 30 81 6C 0F 16 
    AimDir.Z = 0.00000000;                                                      //003C : 0F 36 38 C5 69 0F 00 80 41 76 0F 1E 00 00 00 00 
    AimDir = Normal(AimDir);                                                    //004C : 0F 00 80 41 76 0F E2 00 80 41 76 0F 16 
    return LookDir Dot AimDir < 0.93000001;                                     //0059 : 04 B0 DB 00 08 41 76 0F 00 80 41 76 0F 16 1E 7B 14 6E 3F 16 
    //0F 00 08 41 76 0F 39 39 01 00 84 6C 0F 0F 36 38 C5 69 0F 00 08 41 76 0F 1E 00 00 00 00 0F 00 08 
    //41 76 0F E2 00 08 41 76 0F 16 0F 00 80 41 76 0F D8 00 C8 3F 76 0F 01 30 81 6C 0F 16 0F 36 38 C5 
    //69 0F 00 80 41 76 0F 1E 00 00 00 00 0F 00 80 41 76 0F E2 00 80 41 76 0F 16 04 B0 DB 00 08 41 76 
    //0F 00 80 41 76 0F 16 1E 7B 14 6E 3F 16 04 0B 47 
  }


  function bool FireOnRelease() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool IsFiring() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function float RefireRate() {
    return 0.00000000;                                                          //0000 : 04 1E 00 00 00 00 
    //04 1E 00 00 00 00 04 0B 47 
  }


  function bool TooCloseToAttack(Actor Other) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool CanAttack(Actor Other) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool RecommendLongRangedAttack() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  simulated function AltFire(optional float F) {
    //04 0B 47 
  }


  simulated function Fire(optional float F) {
    //04 0B 47 
  }


  function Actor GetPathTo(Actor Dest) {
    if (PlayerController(Controller) == None) {                                 //0000 : 07 16 00 72 2E 58 34 C2 00 01 00 6E 6C 0F 2A 16 
      return Dest;                                                              //0010 : 04 00 98 51 76 0F 
    }
    return PlayerController(Controller).GetPathTo(Dest);                        //0016 : 04 19 2E 58 34 C2 00 01 00 6E 6C 0F 0B 00 04 1B 75 2B 00 00 00 98 51 76 0F 16 
    //07 16 00 72 2E 58 34 C2 00 01 00 6E 6C 0F 2A 16 04 00 98 51 76 0F 04 19 2E 58 34 C2 00 01 00 6E 
    //6C 0F 0B 00 04 1B 75 2B 00 00 00 98 51 76 0F 16 04 0B 47 
  }


  function DeactivateSpawnProtection() {
    SpawnTime = -100000.00000000;                                               //0000 : 0F 01 98 B9 75 0F 1E 00 50 C3 C7 
    //0F 01 98 B9 75 0F 1E 00 50 C3 C7 04 0B 47 
  }


  function Pawn GetAimTarget() {
    return self;                                                                //0000 : 04 17 
    //04 17 04 0B 47 
  }


  simulated function SetBaseEyeheight() {
    if (!bIsCrouched) {                                                         //0000 : 07 19 00 81 2D 01 B0 B6 74 0F 16 
      BaseEyeHeight = default.BaseEyeHeight;                                    //000B : 0F 01 10 BA 75 0F 02 10 BA 75 0F 
    } else {                                                                    //0016 : 06 38 00 
      BaseEyeHeight = FMin(0.80000001 * CrouchHeight,CrouchHeight - 10);        //0019 : 0F 01 10 BA 75 0F F4 AB 1E CD CC 4C 3F 01 90 E7 75 0F 16 AF 01 90 E7 75 0F 39 3F 2C 0A 16 16 
    }
    EyeHeight = BaseEyeHeight;                                                  //0038 : 0F 01 D0 76 71 0F 01 10 BA 75 0F 
    //07 19 00 81 2D 01 B0 B6 74 0F 16 0F 01 10 BA 75 0F 02 10 BA 75 0F 06 38 00 0F 01 10 BA 75 0F F4 
    //AB 1E CD CC 4C 3F 01 90 E7 75 0F 16 AF 01 90 E7 75 0F 39 3F 2C 0A 16 16 0F 01 D0 76 71 0F 01 10 
    //BA 75 0F 04 0B 47 
  }


  native function ForceCrouch();


  native function bool ReachedDestination(Actor Goal);


  simulated event PostRender2D(Canvas C,float ScreenLocX,float ScreenLocY) {
    local PlayerController PC;
    PC = Level.GetLocalPlayerController();                                      //0000 : 0F 00 78 5A 76 0F 19 01 D8 7E 6C 0F 06 00 04 1B 55 2B 00 00 16 
    //0F 00 78 5A 76 0F 19 01 D8 7E 6C 0F 06 00 04 1B 55 2B 00 00 16 04 0B 47 
  }


  function SetHealth(float aHealth) {
    //04 0B 47 
  }


  function IncreaseHealth(float aDelta) {
    //04 0B 47 
  }


  function float GetHealth() {
    return 0.00000000;                                                          //0000 : 04 1E 00 00 00 00 
    //04 1E 00 00 00 00 04 0B 47 
  }


  simulated event SetHeadScale(float NewScale);


  native simulated function int Get4WayDirection();


  native simulated function SetTwistLook(int twist,int look);


  native simulated function SetViewPitch(int NewPitch);


  static function StaticPrecache(LevelInfo L);



