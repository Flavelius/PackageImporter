//==============================================================================
//  Game_AIController
//==============================================================================

class Game_AIController extends Game_NPCController
    native
    exportstructs
    dependsOn(Game_Pawn,MetaControllerManagerComponent,Game_Character,MovementComponent,TargetComponent,HormoneComponent)
    Config(System)
  ;

  const cSpawnInTimer = 2.0f;
  struct AITimerStruct {
      var Actor Instigator;
      var float Time;
      var float Timeout;
      var name Tag;

  };


  var private export editinline MetaControllerManagerComponent mMetaControl;
  var export editinline MovementComponent mMovement;
  var export editinline TargetComponent mTargeting;
  var export editinline HormoneComponent mHypothalamus;
  var float ChaseRange;
  var float VisualRange;
  var float LineOfSightRange;
  var float ThreatRange;
  var float FollowRange;
  var float AggressionFactor;
  var float FearFactor;
  var float SocialFactor;
  var float BoredomFactor;
  var Vector HomeLocation;
  var NPC_Habitat Habitat;
  var AIPoint ControlPoint;
  var private array<AITimerStruct> mTimer;
  var float mSpawnInTimer;
  var AIStateMachine mAbortedMachine;
  var AIStateMachine mStateMachine;
  var class<AIStateMachine> mMachineClass;
  var byte mTickResult;
  var config bool bProfileStateMachines;
  var config bool bProfileMovementModes;
  var array<Object> mPausers;
  var Game_Pawn mLastAttackPawn;
  var export editinline FSkill_EffectClass mLastAttackEffect;
  var (null);


  function bool HasMetaController(NPC_AI aController) {
    return mMetaControl.HasMetaController(aController);                         //0000 : 04 19 01 20 26 FC 13 0B 00 04 1B FF 72 00 00 00 58 25 FC 13 16 
    //04 19 01 20 26 FC 13 0B 00 04 1B FF 72 00 00 00 58 25 FC 13 16 04 0B 47 
  }


  native function bool MetaControllerMessage(byte aMessage,optional Actor aCollaborator,optional name aTag,optional Object aContext,optional float aValue,optional Vector aLocation);


  native function RemoveMetaController(AI_MetaController aMetaController);


  native function AI_MetaController AddMetaController(AI_MetaController aMetaController);


  native function bool IsAIPausedBy(Object aPauser);


  native function bool IsAIPaused();


  native function ContinueAI(Object aPauser);


  native function PauseAI(Object aPauser);


  native function AIState GetActiveAIState();


  native function AIStateMachine SetStateMachine(AIStateMachine aMachine);


  function RemoveTimer(name aTag) {
    local int ti;
    ti = 0;                                                                     //0000 : 0F 00 50 35 FC 13 25 
    while (ti < mTimer.Length) {                                                //0007 : 07 4E 00 96 00 50 35 FC 13 37 01 C8 35 FC 13 16 
      if (mTimer[ti].Tag == aTag) {                                             //0017 : 07 44 00 FE 36 C8 36 FC 13 10 00 50 35 FC 13 01 C8 35 FC 13 00 40 34 FC 13 16 
        mTimer.Remove(ti,1);                                                    //0031 : 41 01 C8 35 FC 13 00 50 35 FC 13 26 
        ti--;                                                                   //003D : A6 00 50 35 FC 13 16 
      }
      ti++;                                                                     //0044 : A5 00 50 35 FC 13 16 
    }
    //0F 00 50 35 FC 13 25 07 4E 00 96 00 50 35 FC 13 37 01 C8 35 FC 13 16 07 44 00 FE 36 C8 36 FC 13 
    //10 00 50 35 FC 13 01 C8 35 FC 13 00 40 34 FC 13 16 41 01 C8 35 FC 13 00 50 35 FC 13 26 A6 00 50 
    //35 FC 13 16 A5 00 50 35 FC 13 16 06 07 00 04 0B 47 
  }


  function SetTimerTimeout(Actor aInstigator,name aTag,float aDuration) {
    local AITimerStruct newTimer;
    newTimer.Instigator = aInstigator;                                          //0000 : 0F 36 08 39 FC 13 00 80 39 FC 13 00 F0 37 FC 13 
    newTimer.Tag = aTag;                                                        //0010 : 0F 36 C8 36 FC 13 00 80 39 FC 13 00 F8 39 FC 13 
    newTimer.Timeout = aDuration;                                               //0020 : 0F 36 70 3A FC 13 00 80 39 FC 13 00 E8 3A FC 13 
    newTimer.Time = 0.00000000;                                                 //0030 : 0F 36 60 3B FC 13 00 80 39 FC 13 1E 00 00 00 00 
    mTimer[mTimer.Length] = newTimer;                                           //0040 : 0F 10 37 01 C8 35 FC 13 01 C8 35 FC 13 00 80 39 FC 13 
    //0F 36 08 39 FC 13 00 80 39 FC 13 00 F0 37 FC 13 0F 36 C8 36 FC 13 00 80 39 FC 13 00 F8 39 FC 13 
    //0F 36 70 3A FC 13 00 80 39 FC 13 00 E8 3A FC 13 0F 36 60 3B FC 13 00 80 39 FC 13 1E 00 00 00 00 
    //0F 10 37 01 C8 35 FC 13 01 C8 35 FC 13 00 80 39 FC 13 04 0B 47 
  }


  function Trigger(Actor aTrigger,Pawn anInstigator) {
    MetaControllerMessage(17,aTrigger,,anInstigator);                           //0000 : 1B FE 72 00 00 24 11 00 88 3C FC 13 0B 00 00 3D FC 13 16 
    //1B FE 72 00 00 24 11 00 88 3C FC 13 0B 00 00 3D FC 13 16 04 0B 47 
  }


  function NPC_Taxonomy GetFaction() {
    return Game_Pawn(Pawn).Character.GetFaction();                              //0000 : 04 19 19 2E 18 38 5B 01 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 
    //04 19 19 2E 18 38 5B 01 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 04 0B 
    //47 
  }


  function SetControlPoint(AIPoint aControlPoint) {
    ControlPoint = aControlPoint;                                               //0000 : 0F 01 60 40 FC 13 00 A8 3F FC 13 
    //0F 01 60 40 FC 13 00 A8 3F FC 13 04 0B 47 
  }


  final native function Vector GetHomeLocation();


  final native function bool SetHomeLocation(Vector aLocation,optional bool aForce);


  final native function SetLineOfSightRange(float aLineOfSightRange);


  function float GetVisualRange() {
    return VisualRange;                                                         //0000 : 04 01 E8 42 FC 13 
    //04 01 E8 42 FC 13 04 0B 47 
  }


  final native function SetVisualRange(float aVisualRange);


  event bool sv_OnAttack(Game_Pawn aPawn,export editinline FSkill_EffectClass aEffect,bool WasNegativeEffect,float aValue) {
    if (SpawnedIn()) {                                                          //0000 : 07 0E 00 1C D0 46 FC 13 16 
      return True;                                                              //0009 : 04 27 
    } else {                                                                    //000B : 06 88 00 
      if (WasNegativeEffect) {                                                  //000E : 07 5C 00 2D 00 80 47 FC 13 
        mLastAttackPawn = aPawn;                                                //0017 : 0F 01 F8 47 FC 13 00 70 45 FC 13 
        mLastAttackEffect = aEffect;                                            //0022 : 0F 01 70 48 FC 13 00 E8 48 FC 13 
        if (!MetaControllerMessage(8,aPawn,,aEffect,aValue)) {                  //002D : 07 57 00 81 1B FE 72 00 00 24 08 00 70 45 FC 13 0B 00 E8 48 FC 13 00 60 49 FC 13 16 16 
          StateSignal(35);                                                      //004A : 1B E0 08 00 00 24 23 16 
          return False;                                                         //0052 : 04 28 
        } else {                                                                //0054 : 06 59 00 
          return True;                                                          //0057 : 04 27 
        }
      } else {                                                                  //0059 : 06 88 00 
        if (!MetaControllerMessage(7,aPawn,,aEffect,aValue)) {                  //005C : 07 86 00 81 1B FE 72 00 00 24 07 00 70 45 FC 13 0B 00 E8 48 FC 13 00 60 49 FC 13 16 16 
          StateSignal(36);                                                      //0079 : 1B E0 08 00 00 24 24 16 
          return False;                                                         //0081 : 04 28 
        } else {                                                                //0083 : 06 88 00 
          return True;                                                          //0086 : 04 27 
        }
      }
    }
    //07 0E 00 1C D0 46 FC 13 16 04 27 06 88 00 07 5C 00 2D 00 80 47 FC 13 0F 01 F8 47 FC 13 00 70 45 
    //FC 13 0F 01 70 48 FC 13 00 E8 48 FC 13 07 57 00 81 1B FE 72 00 00 24 08 00 70 45 FC 13 0B 00 E8 
    //48 FC 13 00 60 49 FC 13 16 16 1B E0 08 00 00 24 23 16 04 28 06 59 00 04 27 06 88 00 07 86 00 81 
    //1B FE 72 00 00 24 07 00 70 45 FC 13 0B 00 E8 48 FC 13 00 60 49 FC 13 16 16 1B E0 08 00 00 24 24 
    //16 04 28 06 88 00 04 27 04 0B 47 
  }


  event sv_OnOwnerAttack(bool WasNegativeEffect) {
    if (WasNegativeEffect) {                                                    //0000 : 07 14 00 2D 00 00 4B FC 13 
      StateSignal(37);                                                          //0009 : 1B E0 08 00 00 24 25 16 
    } else {                                                                    //0011 : 06 1C 00 
      StateSignal(38);                                                          //0014 : 1B E0 08 00 00 24 26 16 
    }
    //07 14 00 2D 00 00 4B FC 13 1B E0 08 00 00 24 25 16 06 1C 00 1B E0 08 00 00 24 26 16 04 0B 47 
  }


  event sv_OnOwnerAggression() {
    StateSignal(39);                                                            //0000 : 1B E0 08 00 00 24 27 16 
    //1B E0 08 00 00 24 27 16 04 0B 47 
  }


  event bool sv_OnDamage(Game_Pawn anEnemy,int aDamage) {
    if (!Super.sv_OnDamage(anEnemy,aDamage)) {                                  //0000 : 07 40 00 81 1C 70 01 1B 11 00 B8 4C FC 13 00 B8 4D FC 13 16 16 
      if (SpawnedIn()) {                                                        //0015 : 07 23 00 1C D0 46 FC 13 16 
        return True;                                                            //001E : 04 27 
      } else {                                                                  //0020 : 06 40 00 
        if (!MetaControllerMessage(6,anEnemy,,,aDamage)) {                      //0023 : 07 40 00 81 1B FE 72 00 00 24 06 00 B8 4C FC 13 0B 0B 39 3F 00 B8 4D FC 13 16 16 
          return False;                                                         //003E : 04 28 
        }
      }
    }
    return True;                                                                //0040 : 04 27 
    //07 40 00 81 1C 70 01 1B 11 00 B8 4C FC 13 00 B8 4D FC 13 16 16 07 23 00 1C D0 46 FC 13 16 04 27 
    //06 40 00 07 40 00 81 1B FE 72 00 00 24 06 00 B8 4C FC 13 0B 0B 39 3F 00 B8 4D FC 13 16 16 04 28 
    //04 27 04 0B 47 
  }


  final native function bool SpawnedIn();


  native function StateSignal(byte aSignal);


  event cl_OnShutdown() {
    Super.cl_OnShutdown();                                                      //0000 : 1C 40 03 1B 11 16 
    //1C 40 03 1B 11 16 04 0B 47 
  }


  event cl_OnTick(float DeltaTime) {
    Super.cl_OnTick(DeltaTime);                                                 //0000 : 1C 40 08 1B 11 00 A8 22 FC 13 16 
    //1C 40 08 1B 11 00 A8 22 FC 13 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 88 05 1B 11 16 
    //1C 88 05 1B 11 16 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C 20 0B 1B 11 16 
    mMetaControl = new (self) Class'MetaControllerManagerComponent';            //0006 : 0F 01 20 26 FC 13 11 17 0B 0B 20 A0 A7 A3 01 
    mMovement = new (self) Class'MovementComponent';                            //0015 : 0F 01 38 53 FC 13 11 17 0B 0B 20 E8 AC A3 01 
    mTargeting = new (self) Class'TargetComponent';                             //0024 : 0F 01 30 55 32 0F 11 17 0B 0B 20 48 B2 A3 01 
    mHypothalamus = new (self) Class'HormoneComponent';                         //0033 : 0F 01 B0 53 FC 13 11 17 0B 0B 20 60 A2 A3 01 
    mDebugUtilsClass = None;                                                    //0042 : 0F 01 10 0D 1B 11 2A 
    //1C 20 0B 1B 11 16 0F 01 20 26 FC 13 11 17 0B 0B 20 A0 A7 A3 01 0F 01 38 53 FC 13 11 17 0B 0B 20 
    //E8 AC A3 01 0F 01 30 55 32 0F 11 17 0B 0B 20 48 B2 A3 01 0F 01 B0 53 FC 13 11 17 0B 0B 20 60 A2 
    //A3 01 0F 01 10 0D 1B 11 2A 04 0B 47 
  }


  event sv_OnShutdown() {
    if (mMetaControl != None) {                                                 //0000 : 07 1A 00 77 01 20 26 FC 13 2A 16 
      mMetaControl.sv_OnShutdown();                                             //000B : 19 01 20 26 FC 13 06 00 00 1C 40 C6 19 11 16 
    }
    if (mMovement != None) {                                                    //001A : 07 34 00 77 01 38 53 FC 13 2A 16 
      mMovement.sv_OnShutdown();                                                //0025 : 19 01 38 53 FC 13 06 00 00 1C 40 C6 19 11 16 
    }
    if (mTargeting != None) {                                                   //0034 : 07 4E 00 77 01 30 55 32 0F 2A 16 
      mTargeting.sv_OnShutdown();                                               //003F : 19 01 30 55 32 0F 06 00 00 1C 40 C6 19 11 16 
    }
    if (mHypothalamus != None) {                                                //004E : 07 68 00 77 01 B0 53 FC 13 2A 16 
      mHypothalamus.sv_OnShutdown();                                            //0059 : 19 01 B0 53 FC 13 06 00 00 1C 40 C6 19 11 16 
    }
    Super.sv_OnShutdown();                                                      //0068 : 1C 90 09 1B 11 16 
    //07 1A 00 77 01 20 26 FC 13 2A 16 19 01 20 26 FC 13 06 00 00 1C 40 C6 19 11 16 07 34 00 77 01 38 
    //53 FC 13 2A 16 19 01 38 53 FC 13 06 00 00 1C 40 C6 19 11 16 07 4E 00 77 01 30 55 32 0F 2A 16 19 
    //01 30 55 32 0F 06 00 00 1C 40 C6 19 11 16 07 68 00 77 01 B0 53 FC 13 2A 16 19 01 B0 53 FC 13 06 
    //00 00 1C 40 C6 19 11 16 1C 90 09 1B 11 16 04 0B 47 
  }


  event sv_InitAI() {
    if (mStateMachine == None && mMachineClass != None) {                       //0000 : 07 27 00 82 72 01 D8 54 FC 13 2A 16 18 09 00 77 01 40 33 FB 13 2A 16 16 
      SetStateMachine(new mMachineClass);                                       //0018 : 1B 0A 73 00 00 11 0B 0B 0B 01 40 33 FB 13 16 
    }
    MetaControllerMessage(1);                                                   //0027 : 1B FE 72 00 00 24 01 16 
    mSpawnInTimer = 2.00000000;                                                 //002F : 0F 01 50 55 FC 13 1E 00 00 00 40 
    //07 27 00 82 72 01 D8 54 FC 13 2A 16 18 09 00 77 01 40 33 FB 13 2A 16 16 1B 0A 73 00 00 11 0B 0B 
    //0B 01 40 33 FB 13 16 1B FE 72 00 00 24 01 16 0F 01 50 55 FC 13 1E 00 00 00 40 04 0B 47 
  }


  delegate bool FollowFunction(Actor aActor);


  state PawnDead {

      event cl_OnTick(float DeltaTime) {
        cl_OnTick(DeltaTime);                                                   //0000 : 1C 40 08 1B 11 00 D0 23 FC 13 16 
        Game_Pawn(Pawn).StopMoving();                                           //000B : 19 2E 18 38 5B 01 01 88 83 6C 0F 06 00 00 1B 2D 06 00 00 16 
        //1C 40 08 1B 11 00 D0 23 FC 13 16 19 2E 18 38 5B 01 01 88 83 6C 0F 06 00 00 1B 2D 06 00 00 16 04 
        //0B 47 
      }


      function BeginState() {
        if (SBRole == 1) {                                                      //0000 : 07 23 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
          MetaControllerMessage(13,Pawn);                                       //0010 : 1B FE 72 00 00 24 0D 01 88 83 6C 0F 16 
          Super.BeginState();                                                   //001D : 1C F0 E1 1A 11 16 
        }
        //07 23 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 1B FE 72 00 00 24 0D 01 88 83 6C 0F 16 1C F0 E1 
        //1A 11 16 04 0B 47 
      }


    //08 47 

  }



