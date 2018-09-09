//==============================================================================
//  Mover
//==============================================================================

class Mover extends Actor
    native
    dependsOn(Controller,NavigationPoint)
  ;

  const MOVER_PERSISTENT_SOUND_MASK = 240;
  const MOVER_TRIGGERED_SOUND_MASK = 15;
  const MOVER_SOUND_LOOPING = 32;
  const MOVER_SOUND_AMBIENT = 16;
  const MOVER_SOUND_CLOSED = 8;
  const MOVER_SOUND_CLOSING = 4;
  const MOVER_SOUND_OPENED = 2;
  const MOVER_SOUND_OPENING = 1;
  const MOVER_MAXIMUM_MOVE_TIME_INV =  0.001;
  const MOVER_MAXIMUM_MOVE_TIME =  10000;
  enum EBumpType {
    BT_PlayerBump ,
    BT_PawnBump ,
    BT_AnyBump 
  };

  enum EMoverGlideType {
    MV_MoveByTime ,
    MV_GlideByTime 
  };

  enum EMoverEncroachType {
    ME_StopWhenEncroach ,
    ME_ReturnWhenEncroach ,
    ME_CrushWhenEncroach ,
    ME_IgnoreWhenEncroach 
  };

  var (Mover) byte MoverEncroachType;
  var (Mover) byte MoverGlideType;
  var (Mover) byte BumpType;
  var (Mover) byte KeyNum;
  var byte PrevKeyNum;
  var (Mover) const byte NumKeys;
  var (Mover) const byte WorldRaytraceKey;
  var (Mover) const byte BrushRaytraceKey;
  var byte StartKeyNum;
  var (Mover) float MoveTime;
  var (Mover) float StayOpenTime;
  var (Mover) float OtherTime;
  var (Mover) int EncroachDamage;
  var (Mover) bool bToggleDirection;
  var (Mover) bool bTriggerOnceOnly;
  var (Mover) bool bSlave;
  var (Mover) bool bUseTriggered;
  var (Mover) bool bDamageTriggered;
  var (Mover) bool bDynamicLightMover;
  var (Mover) bool bUseShortestRotation;
  var (ReturnGroup) bool bIsLeader;
  var (Mover) name PlayerBumpEvent;
  var (Mover) name BumpEvent;
  var Actor SavedTrigger;
  var (Mover) float DamageThreshold;
  var int numTriggerEvents;
  var Mover Leader;
  var Mover Follower;
  var (ReturnGroup) name ReturnGroup;
  var (Mover) float DelayTime;
  var (MoverSounds) Sound OpeningSound;
  var (MoverSounds) Sound OpenedSound;
  var (MoverSounds) Sound ClosingSound;
  var (MoverSounds) Sound ClosedSound;
  var (MoverSounds) Sound MoveAmbientSound;
  var (MoverSounds) Sound LoopSound;
  var (MoverEvents) name OpeningEvent;
  var (MoverEvents) name OpenedEvent;
  var (MoverEvents) name ClosingEvent;
  var (MoverEvents) name ClosedEvent;
  var (MoverEvents) name LoopEvent;
  var Vector KeyPos[24];
  var Rotator KeyRot[24];
  var Vector BasePos;
  var Vector OldPos;
  var Vector OldPrePivot;
  var Vector SavedPos;
  var Rotator BaseRot;
  var Rotator OldRot;
  var Rotator SavedRot;
  var float PhysAlpha;
  var float PhysRate;
  var NavigationPoint myMarker;
  var bool bOpening;
  var bool bDelaying;
  var bool bClientPause;
  var bool bClosed;
  var bool bPlayerOnly;
  var (aI) bool bAutoDoor;
  var (aI) bool bNoAIRelevance;
  var bool bJumpLift;
  var (Mover) bool bOscillatingLoop;
  var int StepDirection;
  var array<AntiPortalActor> AntiPortals;
  var (Mover) name AntiPortalTag;
  var bool bResetting;
  var bool BACKUP_bHidden;
  var name Backup_InitialState;
  var transient byte mActiveSounds;
  var transient int mAmbientSoundHandle;
  var transient int mLoopingSoundHandle;


  function UpdatePrecacheStaticMeshes() {
    if (DrawType == 8 && StaticMesh != None) {                                  //0000 : 07 31 00 82 9A 39 3A 01 60 99 6C 0F 39 3A 24 08 16 18 09 00 77 01 30 01 38 0F 2A 16 16 
      Level.AddPrecacheStaticMesh(StaticMesh);                                  //001D : 19 01 D8 7E 6C 0F 0B 00 00 1B 57 2B 00 00 01 30 01 38 0F 16 
    }
    //07 31 00 82 9A 39 3A 01 60 99 6C 0F 39 3A 24 08 16 18 09 00 77 01 30 01 38 0F 2A 16 16 19 01 D8 
    //7E 6C 0F 0B 00 00 1B 57 2B 00 00 01 30 01 38 0F 16 04 0B 47 
  }


  function BaseFinished();


  function BaseStarted();


  function MoverLooped() {
    TriggerEvent(LoopEvent,self,Instigator);                                    //0000 : 1C F8 B1 34 0F 01 10 4D 78 0F 17 01 B8 80 6C 0F 16 
    if (LoopSound != None) {                                                    //0011 : 07 24 00 77 01 88 4D 78 0F 2A 16 
      StartSound(32);                                                           //001C : 1B 85 2A 00 00 24 20 16 
    }
    //1C F8 B1 34 0F 01 10 4D 78 0F 17 01 B8 80 6C 0F 16 07 24 00 77 01 88 4D 78 0F 2A 16 1B 85 2A 00 
    //00 24 20 16 04 0B 47 
  }


  function SetStoppedPosition(byte NewPos);


  function EnableTrigger();


  function DisableTrigger();


  function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    if (bDamageTriggered && Damage >= DamageThreshold) {                        //0000 : 07 2D 00 82 2D 01 E0 F4 78 0F 18 0F 00 B3 39 3F 00 F8 F3 78 0F 01 58 F5 78 0F 16 16 
      self.Trigger(self,instigatedBy);                                          //001C : 19 17 0C 00 00 1B 32 01 00 00 17 00 D0 F5 78 0F 16 
    }
    //07 2D 00 82 2D 01 E0 F4 78 0F 18 0F 00 B3 39 3F 00 F8 F3 78 0F 01 58 F5 78 0F 16 16 19 17 0C 00 
    //00 1B 32 01 00 00 17 00 D0 F5 78 0F 16 04 0B 47 
  }


  function Bump(Actor Other) {
    local Pawn P;
    P = Pawn(Other);                                                            //0000 : 0F 00 00 64 78 0F 2E 50 31 D4 00 00 A0 61 78 0F 
    if (bUseTriggered && P != None && !P.IsHumanControlled()
      && P.IsPlayerPawn()
      && !bDelaying
      && !bOpening) {//0010 : 07 93 00 82 82 82 82 82 2D 01 78 64 78 0F 18 09 00 77 00 00 64 78 0F 2A 16 16 18 12 00 81 19 00 00 64 78 0F 06 00 04 1B A7 2A 00 00 16 16 16 18 10 00 19 00 00 64 78 0F 06 00 04 1B B9 0C 00 00 16 16 18 09 00 81 2D 01 28 42 78 0F 16 16 18 09 00 81 2D 01 B0 41 78 0F 16 16 
      Trigger(P,P);                                                             //006A : 1B 32 01 00 00 00 00 64 78 0F 00 00 64 78 0F 16 
      P.Controller.WaitForMover(self);                                          //007A : 19 19 00 00 64 78 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 9A 2A 00 00 17 16 
    }
    if (BumpType != 2 && P == None) {                                           //0093 : 07 B2 00 82 9B 39 3A 01 F0 64 78 0F 39 3A 24 02 16 18 09 00 72 00 00 64 78 0F 2A 16 16 
      return;                                                                   //00B0 : 04 0B 
    }
    if (BumpType == 0 && !P.IsPlayerPawn()) {                                   //00B2 : 07 DA 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 00 16 18 12 00 81 19 00 00 64 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 
      return;                                                                   //00D8 : 04 0B 
    }
    if (BumpType == 1 && P.bAmbientCreature) {                                  //00DA : 07 00 01 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 01 16 18 10 00 19 00 00 64 78 0F 06 00 04 2D 01 B8 86 76 0F 16 
      return;                                                                   //00FE : 04 0B 
    }
    TriggerEvent(BumpEvent,self,P);                                             //0100 : 1C F8 B1 34 0F 01 68 65 78 0F 17 00 00 64 78 0F 16 
    if (P != None && P.IsPlayerPawn()) {                                        //0111 : 07 41 01 82 77 00 00 64 78 0F 2A 16 18 10 00 19 00 00 64 78 0F 06 00 04 1B B9 0C 00 00 16 16 
      TriggerEvent(PlayerBumpEvent,self,P);                                     //0130 : 1C F8 B1 34 0F 01 E0 65 78 0F 17 00 00 64 78 0F 16 
    }
    //0F 00 00 64 78 0F 2E 50 31 D4 00 00 A0 61 78 0F 07 93 00 82 82 82 82 82 2D 01 78 64 78 0F 18 09 
    //00 77 00 00 64 78 0F 2A 16 16 18 12 00 81 19 00 00 64 78 0F 06 00 04 1B A7 2A 00 00 16 16 16 18 
    //10 00 19 00 00 64 78 0F 06 00 04 1B B9 0C 00 00 16 16 18 09 00 81 2D 01 28 42 78 0F 16 16 18 09 
    //00 81 2D 01 B0 41 78 0F 16 16 1B 32 01 00 00 00 00 64 78 0F 00 00 64 78 0F 16 19 19 00 00 64 78 
    //0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 9A 2A 00 00 17 16 07 B2 00 82 9B 39 3A 01 F0 64 78 0F 39 
    //3A 24 02 16 18 09 00 72 00 00 64 78 0F 2A 16 16 04 0B 07 DA 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 
    //24 00 16 18 12 00 81 19 00 00 64 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 04 0B 07 00 01 82 9A 39 
    //3A 01 F0 64 78 0F 39 3A 24 01 16 18 10 00 19 00 00 64 78 0F 06 00 04 2D 01 B8 86 76 0F 16 04 0B 
    //1C F8 B1 34 0F 01 68 65 78 0F 17 00 00 64 78 0F 16 07 41 01 82 77 00 00 64 78 0F 2A 16 18 10 00 
    //19 00 00 64 78 0F 06 00 04 1B B9 0C 00 00 16 16 1C F8 B1 34 0F 01 E0 65 78 0F 17 00 00 64 78 0F 
    //16 04 0B 47 
  }


  function bool EncroachingOn(Actor Other) {
    local Pawn P;
    if (Other == None) {                                                        //0000 : 07 0D 00 72 00 68 F8 78 0F 2A 16 
      return False;                                                             //000B : 04 28 
    }
    if (Pawn(Other) != None && Pawn(Other).Controller == None
      || Other.IsA('Decoration')) {//000D : 07 85 00 84 82 77 2E 50 31 D4 00 00 68 F8 78 0F 2A 16 18 17 00 72 19 2E 50 31 D4 00 00 68 F8 78 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 12 00 19 00 68 F8 78 0F 08 00 04 61 2F 21 B3 0B 00 00 16 16 
      Other.TakeDamage(10000,None,Other.Location,vect(0.000000, 0.000000, 0.000000),Class'Crushed');//004E : 19 00 68 F8 78 0F 2C 00 00 1B 5C 0C 00 00 1D 10 27 00 00 2A 19 00 68 F8 78 0F 05 00 0C 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 FD 78 0F 16 
      return False;                                                             //0083 : 04 28 
    }
    if (Other.IsA('Pickup')) {                                                  //0085 : 07 D1 00 19 00 68 F8 78 0F 08 00 04 61 2F 21 B3 2D 00 00 16 
      if (!Other.bAlwaysRelevant && Other.Owner == None) {                      //0099 : 07 CF 00 82 81 19 00 68 F8 78 0F 06 00 04 2D 01 68 75 6E 0F 16 18 12 00 72 19 00 68 F8 78 0F 05 00 04 01 B0 9F 6C 0F 2A 16 16 
        Other.Destroy();                                                        //00C3 : 19 00 68 F8 78 0F 03 00 04 61 17 16 
      }
      return False;                                                             //00CF : 04 28 
    }
    if (Other.IsA('Fragment') || Other.IsA('Gib')
      || Other.IsA('Projectile')) {//00D1 : 07 1F 01 84 84 19 00 68 F8 78 0F 08 00 04 61 2F 21 BD 2A 00 00 16 18 12 00 19 00 68 F8 78 0F 08 00 04 61 2F 21 B9 2D 00 00 16 16 18 12 00 19 00 68 F8 78 0F 08 00 04 61 2F 21 12 0C 00 00 16 16 
      Other.Destroy();                                                          //0111 : 19 00 68 F8 78 0F 03 00 04 61 17 16 
      return False;                                                             //011D : 04 28 
    }
    if (EncroachDamage != 0) {                                                  //011F : 07 63 01 9B 01 58 02 79 0F 25 16 
      Other.TakeDamage(EncroachDamage,Instigator,Other.Location,vect(0.000000, 0.000000, 0.000000),Class'Crushed');//012A : 19 00 68 F8 78 0F 30 00 00 1B 5C 0C 00 00 01 58 02 79 0F 01 B8 80 6C 0F 19 00 68 F8 78 0F 05 00 0C 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 FD 78 0F 16 
    }
    P = Pawn(Other);                                                            //0163 : 0F 00 D0 02 79 0F 2E 50 31 D4 00 00 68 F8 78 0F 
    if (P != None && P.Controller != None
      && P.IsPlayerPawn()) {          //0173 : 07 31 02 82 82 77 00 D0 02 79 0F 2A 16 18 12 00 77 19 00 D0 02 79 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 10 00 19 00 D0 02 79 0F 06 00 04 1B B9 0C 00 00 16 16 
      if (PlayerBumpEvent != 'None') {                                          //01A8 : 07 C2 01 FF 01 E0 65 78 0F 21 00 00 00 00 16 
        Bump(Other);                                                            //01B7 : 1B 3B 01 00 00 00 68 F8 78 0F 16 
      }
      if (P != None && P.Controller != None
        && P.Base != self
        && P.Controller.PendingMover == self) {//01C2 : 07 31 02 82 82 82 77 00 D0 02 79 0F 2A 16 18 12 00 77 19 00 D0 02 79 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 12 00 77 19 00 D0 02 79 0F 05 00 04 01 B0 94 6C 0F 17 16 16 18 1B 00 72 19 19 00 D0 02 79 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 B4 70 0F 17 16 16 
        P.Controller.UnderLift(self);                                           //0218 : 19 19 00 D0 02 79 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 19 2C 00 00 17 16 
      }
    }
    if (Leader == None) {                                                       //0231 : 07 43 02 72 01 48 03 79 0F 2A 16 
      Leader = self;                                                            //023C : 0F 01 48 03 79 0F 17 
    }
    if (MoverEncroachType == 0) {                                               //0243 : 07 67 02 9A 39 3A 01 C0 03 79 0F 39 3A 24 00 16 
      Leader.MakeGroupStop();                                                   //0253 : 19 01 48 03 79 0F 06 00 00 1B 2D 2B 00 00 16 
      return True;                                                              //0262 : 04 27 
    } else {                                                                    //0264 : 06 EE 02 
      if (MoverEncroachType == 1) {                                             //0267 : 07 B3 02 9A 39 3A 01 C0 03 79 0F 39 3A 24 01 16 
        Leader.MakeGroupReturn();                                               //0277 : 19 01 48 03 79 0F 06 00 00 1B 30 2B 00 00 16 
        if (Other.IsA('Pawn')) {                                                //0286 : 07 AE 02 19 00 68 F8 78 0F 08 00 04 61 2F 21 4C 08 00 00 16 
          Pawn(Other).PlayMoverHitSound();                                      //029A : 19 2E 50 31 D4 00 00 68 F8 78 0F 06 00 00 1B 84 2B 00 00 16 
        }
        return True;                                                            //02AE : 04 27 
      } else {                                                                  //02B0 : 06 EE 02 
        if (MoverEncroachType == 2) {                                           //02B3 : 07 DC 02 9A 39 3A 01 C0 03 79 0F 39 3A 24 02 16 
          Other.KilledBy(Instigator);                                           //02C3 : 19 00 68 F8 78 0F 0B 00 00 1B 7C 2B 00 00 01 B8 80 6C 0F 16 
          return False;                                                         //02D7 : 04 28 
        } else {                                                                //02D9 : 06 EE 02 
          if (MoverEncroachType == 3) {                                         //02DC : 07 EE 02 9A 39 3A 01 C0 03 79 0F 39 3A 24 03 16 
            return False;                                                       //02EC : 04 28 
          }
        }
      }
    }
    //07 0D 00 72 00 68 F8 78 0F 2A 16 04 28 07 85 00 84 82 77 2E 50 31 D4 00 00 68 F8 78 0F 2A 16 18 
    //17 00 72 19 2E 50 31 D4 00 00 68 F8 78 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 12 00 19 00 68 F8 
    //78 0F 08 00 04 61 2F 21 B3 0B 00 00 16 16 19 00 68 F8 78 0F 2C 00 00 1B 5C 0C 00 00 1D 10 27 00 
    //00 2A 19 00 68 F8 78 0F 05 00 0C 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 FD 
    //78 0F 16 04 28 07 D1 00 19 00 68 F8 78 0F 08 00 04 61 2F 21 B3 2D 00 00 16 07 CF 00 82 81 19 00 
    //68 F8 78 0F 06 00 04 2D 01 68 75 6E 0F 16 18 12 00 72 19 00 68 F8 78 0F 05 00 04 01 B0 9F 6C 0F 
    //2A 16 16 19 00 68 F8 78 0F 03 00 04 61 17 16 04 28 07 1F 01 84 84 19 00 68 F8 78 0F 08 00 04 61 
    //2F 21 BD 2A 00 00 16 18 12 00 19 00 68 F8 78 0F 08 00 04 61 2F 21 B9 2D 00 00 16 16 18 12 00 19 
    //00 68 F8 78 0F 08 00 04 61 2F 21 12 0C 00 00 16 16 19 00 68 F8 78 0F 03 00 04 61 17 16 04 28 07 
    //63 01 9B 01 58 02 79 0F 25 16 19 00 68 F8 78 0F 30 00 00 1B 5C 0C 00 00 01 58 02 79 0F 01 B8 80 
    //6C 0F 19 00 68 F8 78 0F 05 00 0C 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 FD 
    //78 0F 16 0F 00 D0 02 79 0F 2E 50 31 D4 00 00 68 F8 78 0F 07 31 02 82 82 77 00 D0 02 79 0F 2A 16 
    //18 12 00 77 19 00 D0 02 79 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 10 00 19 00 D0 02 79 0F 06 00 
    //04 1B B9 0C 00 00 16 16 07 C2 01 FF 01 E0 65 78 0F 21 00 00 00 00 16 1B 3B 01 00 00 00 68 F8 78 
    //0F 16 07 31 02 82 82 82 77 00 D0 02 79 0F 2A 16 18 12 00 77 19 00 D0 02 79 0F 05 00 04 01 00 6E 
    //6C 0F 2A 16 16 18 12 00 77 19 00 D0 02 79 0F 05 00 04 01 B0 94 6C 0F 17 16 16 18 1B 00 72 19 19 
    //00 D0 02 79 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 B4 70 0F 17 16 16 19 19 00 D0 02 79 0F 05 
    //00 04 01 00 6E 6C 0F 07 00 00 1B 19 2C 00 00 17 16 07 43 02 72 01 48 03 79 0F 2A 16 0F 01 48 03 
    //79 0F 17 07 67 02 9A 39 3A 01 C0 03 79 0F 39 3A 24 00 16 19 01 48 03 79 0F 06 00 00 1B 2D 2B 00 
    //00 16 04 27 06 EE 02 07 B3 02 9A 39 3A 01 C0 03 79 0F 39 3A 24 01 16 19 01 48 03 79 0F 06 00 00 
    //1B 30 2B 00 00 16 07 AE 02 19 00 68 F8 78 0F 08 00 04 61 2F 21 4C 08 00 00 16 19 2E 50 31 D4 00 
    //00 68 F8 78 0F 06 00 00 1B 84 2B 00 00 16 04 27 06 EE 02 07 DC 02 9A 39 3A 01 C0 03 79 0F 39 3A 
    //24 02 16 19 00 68 F8 78 0F 0B 00 00 1B 7C 2B 00 00 01 B8 80 6C 0F 16 04 28 06 EE 02 07 EE 02 9A 
    //39 3A 01 C0 03 79 0F 39 3A 24 03 16 04 28 04 0B 47 
  }


  function MakeGroupReturn() {
    bInterpolating = False;                                                     //0000 : 14 2D 01 D8 E8 35 0F 28 
    StopSound(16);                                                              //0008 : 1B A9 0D 00 00 24 10 16 
    if (bIsLeader || Leader == self) {                                          //0010 : 07 54 00 84 2D 01 28 06 79 0F 18 09 00 72 01 48 03 79 0F 17 16 16 
      if (KeyNum < PrevKeyNum) {                                                //0026 : 07 48 00 96 39 3A 01 80 34 78 0F 39 3A 01 08 34 78 0F 16 
        SBGotoState('Open');                                                    //0039 : 1B 11 06 00 00 0B 21 6C 2A 00 00 16 
      } else {                                                                  //0045 : 06 54 00 
        SBGotoState('Close');                                                   //0048 : 1B 11 06 00 00 0B 21 6E 2A 00 00 16 
      }
    }
    if (Follower != None) {                                                     //0054 : 07 6E 00 77 01 A0 06 79 0F 2A 16 
      Follower.MakeGroupReturn();                                               //005F : 19 01 A0 06 79 0F 06 00 00 1B 30 2B 00 00 16 
    }
    //14 2D 01 D8 E8 35 0F 28 1B A9 0D 00 00 24 10 16 07 54 00 84 2D 01 28 06 79 0F 18 09 00 72 01 48 
    //03 79 0F 17 16 16 07 48 00 96 39 3A 01 80 34 78 0F 39 3A 01 08 34 78 0F 16 1B 11 06 00 00 0B 21 
    //6C 2A 00 00 16 06 54 00 1B 11 06 00 00 0B 21 6E 2A 00 00 16 07 6E 00 77 01 A0 06 79 0F 2A 16 19 
    //01 A0 06 79 0F 06 00 00 1B 30 2B 00 00 16 04 0B 47 
  }


  function MakeGroupStop() {
    bInterpolating = False;                                                     //0000 : 14 2D 01 D8 E8 35 0F 28 
    StopSound(16);                                                              //0008 : 1B A9 0D 00 00 24 10 16 
    SBGotoState('None');                                                        //0010 : 1B 11 06 00 00 0B 21 00 00 00 00 16 
    if (Follower != None) {                                                     //001C : 07 36 00 77 01 A0 06 79 0F 2A 16 
      Follower.MakeGroupStop();                                                 //0027 : 19 01 A0 06 79 0F 06 00 00 1B 2D 2B 00 00 16 
    }
    //14 2D 01 D8 E8 35 0F 28 1B A9 0D 00 00 24 10 16 1B 11 06 00 00 0B 21 00 00 00 00 16 07 36 00 77 
    //01 A0 06 79 0F 2A 16 19 01 A0 06 79 0F 06 00 00 1B 2D 2B 00 00 16 04 0B 47 
  }


  function Reset() {
    SetResetStatus(True);                                                       //0000 : 1B 6D 2A 00 00 27 16 
    DoClose();                                                                  //0007 : 1B 91 2A 00 00 16 
    SetResetStatus(False);                                                      //000D : 1B 6D 2A 00 00 28 16 
    EnableTrigger();                                                            //0014 : 1B A9 2A 00 00 16 
    SBGotoState(Backup_InitialState,'None');                                    //001A : 1B 11 06 00 00 01 48 55 78 0F 21 00 00 00 00 16 
    //1B 6D 2A 00 00 27 16 1B 91 2A 00 00 16 1B 6D 2A 00 00 28 16 1B A9 2A 00 00 16 1B 11 06 00 00 01 
    //48 55 78 0F 21 00 00 00 00 16 04 0B 47 
  }


  function SetResetStatus(bool bNewStatus) {
    bHidden = BACKUP_bHidden;                                                   //0000 : 14 2D 01 48 5E 6E 0F 2D 01 38 09 79 0F 
    bResetting = bNewStatus;                                                    //000D : 14 2D 01 B0 CE 78 0F 2D 00 40 08 79 0F 
    if (Follower != None) {                                                     //001A : 07 3A 00 77 01 A0 06 79 0F 2A 16 
      Follower.SetResetStatus(bNewStatus);                                      //0025 : 19 01 A0 06 79 0F 0C 00 00 1B 6D 2A 00 00 2D 00 40 08 79 0F 16 
    }
    //14 2D 01 48 5E 6E 0F 2D 01 38 09 79 0F 14 2D 01 B0 CE 78 0F 2D 00 40 08 79 0F 07 3A 00 77 01 A0 
    //06 79 0F 2A 16 19 01 A0 06 79 0F 0C 00 00 1B 6D 2A 00 00 2D 00 40 08 79 0F 16 04 0B 47 
  }


  function PostBeginPlay() {
    local Mover M;
    Backup_InitialState = InitialState;                                         //0000 : 0F 01 48 55 78 0F 01 F8 03 38 0F 
    BACKUP_bHidden = bHidden;                                                   //000B : 14 2D 01 38 09 79 0F 2D 01 48 5E 6E 0F 
    if (!bSlave) {                                                              //0018 : 07 6D 00 81 2D 01 D8 5D 78 0F 16 
      foreach DynamicActors(Class'Mover',M,Tag) {                               //0023 : 2F 61 39 20 30 1B D4 00 00 60 0A 79 0F 01 C0 9E 6C 0F 16 6C 00 
        if (M.bSlave) {                                                         //0038 : 07 6B 00 19 00 60 0A 79 0F 06 00 04 2D 01 D8 5D 78 0F 
          M.SBGotoState('None');                                                //004A : 19 00 60 0A 79 0F 0B 00 00 1B 11 06 00 00 21 00 00 00 00 16 
          M.SetBase(self);                                                      //005E : 19 00 60 0A 79 0F 04 00 00 61 2A 17 16 
        }
      }
    }
    if (bIsLeader) {                                                            //006D : 07 E6 00 2D 01 28 06 79 0F 
      Leader = self;                                                            //0076 : 0F 01 48 03 79 0F 17 
      foreach DynamicActors(Class'Mover',M) {                                   //007D : 2F 61 39 20 30 1B D4 00 00 60 0A 79 0F 16 E2 00 
        if (M != self && M.ReturnGroup == ReturnGroup) {                        //008D : 07 E1 00 82 77 00 60 0A 79 0F 17 16 18 16 00 FE 19 00 60 0A 79 0F 05 00 04 01 A8 0C 79 0F 01 A8 0C 79 0F 16 16 
          M.Leader = self;                                                      //00B2 : 0F 19 00 60 0A 79 0F 05 00 04 01 48 03 79 0F 17 
          M.Follower = Follower;                                                //00C2 : 0F 19 00 60 0A 79 0F 05 00 04 01 A0 06 79 0F 01 A0 06 79 0F 
          Follower = M;                                                         //00D6 : 0F 01 A0 06 79 0F 00 60 0A 79 0F 
        }
      }
      goto jl0132;                                                              //00E3 : 06 32 01 
    }
    if (Leader == None) {                                                       //00E6 : 07 32 01 72 01 48 03 79 0F 2A 16 
      foreach DynamicActors(Class'Mover',M) {                                   //00F1 : 2F 61 39 20 30 1B D4 00 00 60 0A 79 0F 16 2A 01 
        if (M != self && M.ReturnGroup == ReturnGroup) {                        //0101 : 07 29 01 82 77 00 60 0A 79 0F 17 16 18 16 00 FE 19 00 60 0A 79 0F 05 00 04 01 A8 0C 79 0F 01 A8 0C 79 0F 16 16 
          return;                                                               //0127 : 04 0B 
        }
      }
      Leader = self;                                                            //012B : 0F 01 48 03 79 0F 17 
    }
    //0F 01 48 55 78 0F 01 F8 03 38 0F 14 2D 01 38 09 79 0F 2D 01 48 5E 6E 0F 07 6D 00 81 2D 01 D8 5D 
    //78 0F 16 2F 61 39 20 30 1B D4 00 00 60 0A 79 0F 01 C0 9E 6C 0F 16 6C 00 07 6B 00 19 00 60 0A 79 
    //0F 06 00 04 2D 01 D8 5D 78 0F 19 00 60 0A 79 0F 0B 00 00 1B 11 06 00 00 21 00 00 00 00 16 19 00 
    //60 0A 79 0F 04 00 00 61 2A 17 16 31 30 07 E6 00 2D 01 28 06 79 0F 0F 01 48 03 79 0F 17 2F 61 39 
    //20 30 1B D4 00 00 60 0A 79 0F 16 E2 00 07 E1 00 82 77 00 60 0A 79 0F 17 16 18 16 00 FE 19 00 60 
    //0A 79 0F 05 00 04 01 A8 0C 79 0F 01 A8 0C 79 0F 16 16 0F 19 00 60 0A 79 0F 05 00 04 01 48 03 79 
    //0F 17 0F 19 00 60 0A 79 0F 05 00 04 01 A0 06 79 0F 01 A0 06 79 0F 0F 01 A0 06 79 0F 00 60 0A 79 
    //0F 31 30 06 32 01 07 32 01 72 01 48 03 79 0F 2A 16 2F 61 39 20 30 1B D4 00 00 60 0A 79 0F 16 2A 
    //01 07 29 01 82 77 00 60 0A 79 0F 17 16 18 16 00 FE 19 00 60 0A 79 0F 05 00 04 01 A8 0C 79 0F 01 
    //A8 0C 79 0F 16 16 30 04 0B 31 30 0F 01 48 03 79 0F 17 04 0B 47 
  }


  function BeginPlay() {
    local AntiPortalActor AntiPortalA;
    if (AntiPortalTag != 'None') {                                              //0000 : 07 4B 00 FF 01 A8 0F 79 0F 21 00 00 00 00 16 
      foreach AllActors(Class'AntiPortalActor',AntiPortalA,AntiPortalTag) {     //000F : 2F 61 30 20 18 83 C2 00 00 D0 0D 79 0F 01 A8 0F 79 0F 16 4A 00 
        AntiPortals.Length = AntiPortals.Length + 1;                            //0024 : 0F 37 01 E0 B8 37 0F 92 37 01 E0 B8 37 0F 26 16 
        AntiPortals[AntiPortals.Length - 1] = AntiPortalA;                      //0034 : 0F 10 93 37 01 E0 B8 37 0F 26 16 01 E0 B8 37 0F 00 D0 0D 79 0F 
      }
    }
    Super.BeginPlay();                                                          //004B : 1C F0 E4 6C 0F 16 
    KeyNum = Clamp(KeyNum,0,24 - 1);                                            //0051 : 0F 01 80 34 78 0F 39 3D FB 39 3A 01 80 34 78 0F 25 93 2C 18 26 16 16 
    PhysAlpha = 0.00000000;                                                     //0068 : 0F 01 F8 34 78 0F 1E 00 00 00 00 
    StartKeyNum = KeyNum;                                                       //0073 : 0F 01 58 B9 37 0F 01 80 34 78 0F 
    Move(BasePos + KeyPos[KeyNum] - Location);                                  //007E : 61 0A D8 D7 01 D0 B9 37 0F 1A 39 3A 01 80 34 78 0F 01 48 BA 37 0F 16 01 30 81 6C 0F 16 16 
    SetRotation(BaseRot + KeyRot[KeyNum]);                                      //009C : 1C 70 01 6E 0F 61 3C 01 C0 BA 37 0F 1A 39 3A 01 80 34 78 0F 01 38 BB 37 0F 16 16 
    if (ReturnGroup == 'None') {                                                //00B7 : 07 D1 00 FE 01 A8 0C 79 0F 21 00 00 00 00 16 
      ReturnGroup = Tag;                                                        //00C6 : 0F 01 A8 0C 79 0F 01 C0 9E 6C 0F 
    }
    Leader = None;                                                              //00D1 : 0F 01 48 03 79 0F 2A 
    Follower = None;                                                            //00D8 : 0F 01 A0 06 79 0F 2A 
    //07 4B 00 FF 01 A8 0F 79 0F 21 00 00 00 00 16 2F 61 30 20 18 83 C2 00 00 D0 0D 79 0F 01 A8 0F 79 
    //0F 16 4A 00 0F 37 01 E0 B8 37 0F 92 37 01 E0 B8 37 0F 26 16 0F 10 93 37 01 E0 B8 37 0F 26 16 01 
    //E0 B8 37 0F 00 D0 0D 79 0F 31 30 1C F0 E4 6C 0F 16 0F 01 80 34 78 0F 39 3D FB 39 3A 01 80 34 78 
    //0F 25 93 2C 18 26 16 16 0F 01 F8 34 78 0F 1E 00 00 00 00 0F 01 58 B9 37 0F 01 80 34 78 0F 61 0A 
    //D8 D7 01 D0 B9 37 0F 1A 39 3A 01 80 34 78 0F 01 48 BA 37 0F 16 01 30 81 6C 0F 16 16 1C 70 01 6E 
    //0F 61 3C 01 C0 BA 37 0F 1A 39 3A 01 80 34 78 0F 01 38 BB 37 0F 16 16 07 D1 00 FE 01 A8 0C 79 0F 
    //21 00 00 00 00 16 0F 01 A8 0C 79 0F 01 C0 9E 6C 0F 0F 01 48 03 79 0F 2A 0F 01 A0 06 79 0F 2A 04 
    //0B 47 
  }


  function DoClose() {
    bOpening = False;                                                           //0000 : 14 2D 01 B0 41 78 0F 28 
    bDelaying = False;                                                          //0008 : 14 2D 01 28 42 78 0F 28 
    InterpolateTo(Max(0,KeyNum - 1),MoveTime);                                  //0010 : 1B 78 2A 00 00 39 3D FA 25 93 39 3A 01 80 34 78 0F 26 16 16 01 70 35 78 0F 16 
    MakeNoise(1.00000000);                                                      //002A : 62 00 1E 00 00 80 3F 16 
    UntriggerEvent(Event,self,Instigator);                                      //0032 : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 01 B8 80 6C 0F 16 
    StartSound(4);                                                              //0043 : 1B 85 2A 00 00 24 04 16 
    StartSound(16);                                                             //004B : 1B 85 2A 00 00 24 10 16 
    TriggerEvent(ClosingEvent,self,Instigator);                                 //0053 : 1C F8 B1 34 0F 01 60 BC 37 0F 17 01 B8 80 6C 0F 16 
    if (Follower != None) {                                                     //0064 : 07 7E 00 77 01 A0 06 79 0F 2A 16 
      Follower.DoClose();                                                       //006F : 19 01 A0 06 79 0F 06 00 00 1B 91 2A 00 00 16 
    }
    //14 2D 01 B0 41 78 0F 28 14 2D 01 28 42 78 0F 28 1B 78 2A 00 00 39 3D FA 25 93 39 3A 01 80 34 78 
    //0F 26 16 16 01 70 35 78 0F 16 62 00 1E 00 00 80 3F 16 1C 80 AF 34 0F 01 38 9F 6C 0F 17 01 B8 80 
    //6C 0F 16 1B 85 2A 00 00 24 04 16 1B 85 2A 00 00 24 10 16 1C F8 B1 34 0F 01 60 BC 37 0F 17 01 B8 
    //80 6C 0F 16 07 7E 00 77 01 A0 06 79 0F 2A 16 19 01 A0 06 79 0F 06 00 00 1B 91 2A 00 00 16 04 0B 
    //47 
  }


  function DoOpen() {
    bOpening = True;                                                            //0000 : 14 2D 01 B0 41 78 0F 27 
    bDelaying = False;                                                          //0008 : 14 2D 01 28 42 78 0F 28 
    InterpolateTo(1,MoveTime);                                                  //0010 : 1B 78 2A 00 00 24 01 01 70 35 78 0F 16 
    MakeNoise(1.00000000);                                                      //001D : 62 00 1E 00 00 80 3F 16 
    StartSound(1);                                                              //0025 : 1B 85 2A 00 00 24 01 16 
    StartSound(16);                                                             //002D : 1B 85 2A 00 00 24 10 16 
    TriggerEvent(OpeningEvent,self,Instigator);                                 //0035 : 1C F8 B1 34 0F 01 60 12 79 0F 17 01 B8 80 6C 0F 16 
    if (Follower != None) {                                                     //0046 : 07 60 00 77 01 A0 06 79 0F 2A 16 
      Follower.DoOpen();                                                        //0051 : 19 01 A0 06 79 0F 06 00 00 1B A1 2A 00 00 16 
    }
    //14 2D 01 B0 41 78 0F 27 14 2D 01 28 42 78 0F 28 1B 78 2A 00 00 24 01 01 70 35 78 0F 16 62 00 1E 
    //00 00 80 3F 16 1B 85 2A 00 00 24 01 16 1B 85 2A 00 00 24 10 16 1C F8 B1 34 0F 01 60 12 79 0F 17 
    //01 B8 80 6C 0F 16 07 60 00 77 01 A0 06 79 0F 2A 16 19 01 A0 06 79 0F 06 00 00 1B A1 2A 00 00 16 
    //04 0B 47 
  }


  function FinishedOpening() {
    StartSound(2);                                                              //0000 : 1B 85 2A 00 00 24 02 16 
    TriggerEvent(Event,self,Instigator);                                        //0008 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 01 B8 80 6C 0F 16 
    TriggerEvent(OpenedEvent,self,Instigator);                                  //0019 : 1C F8 B1 34 0F 01 20 14 79 0F 17 01 B8 80 6C 0F 16 
    if (myMarker != None) {                                                     //002A : 07 44 00 77 01 98 14 79 0F 2A 16 
      myMarker.MoverOpened();                                                   //0035 : 19 01 98 14 79 0F 06 00 00 1B 58 2B 00 00 16 
    }
    FinishNotify();                                                             //0044 : 1B FD 2A 00 00 16 
    //1B 85 2A 00 00 24 02 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 01 B8 80 6C 0F 16 1C F8 B1 34 0F 01 20 
    //14 79 0F 17 01 B8 80 6C 0F 16 07 44 00 77 01 98 14 79 0F 2A 16 19 01 98 14 79 0F 06 00 00 1B 58 
    //2B 00 00 16 1B FD 2A 00 00 16 04 0B 47 
  }


  function FinishedClosing() {
    local Mover M;
    StartSound(8);                                                              //0000 : 1B 85 2A 00 00 24 08 16 
    TriggerEvent(ClosedEvent,self,Instigator);                                  //0008 : 1C F8 B1 34 0F 01 68 17 79 0F 17 01 B8 80 6C 0F 16 
    if (SavedTrigger != None) {                                                 //0019 : 07 33 00 77 01 18 68 78 0F 2A 16 
      SavedTrigger.EndEvent();                                                  //0024 : 19 01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 
    }
    SavedTrigger = None;                                                        //0033 : 0F 01 18 68 78 0F 2A 
    Instigator = None;                                                          //003A : 0F 01 B8 80 6C 0F 2A 
    if (myMarker != None) {                                                     //0041 : 07 5B 00 77 01 98 14 79 0F 2A 16 
      myMarker.MoverClosed();                                                   //004C : 19 01 98 14 79 0F 06 00 00 1B 67 2B 00 00 16 
    }
    bClosed = True;                                                             //005B : 14 2D 01 E8 5C 78 0F 27 
    FinishNotify();                                                             //0063 : 1B FD 2A 00 00 16 
    M = Leader;                                                                 //0069 : 0F 00 C0 15 79 0F 01 48 03 79 0F 
    while (M != None) {                                                         //0074 : 07 AC 00 77 00 C0 15 79 0F 2A 16 
      if (!M.bClosed) {                                                         //007F : 07 95 00 81 19 00 C0 15 79 0F 06 00 04 2D 01 E8 5C 78 0F 16 
        return;                                                                 //0093 : 04 0B 
      }
      M = M.Follower;                                                           //0095 : 0F 00 C0 15 79 0F 19 00 C0 15 79 0F 05 00 04 01 A0 06 79 0F 
    }
    UntriggerEvent(OpeningEvent,self,Instigator);                               //00AC : 1C 80 AF 34 0F 01 60 12 79 0F 17 01 B8 80 6C 0F 16 
    //1B 85 2A 00 00 24 08 16 1C F8 B1 34 0F 01 68 17 79 0F 17 01 B8 80 6C 0F 16 07 33 00 77 01 18 68 
    //78 0F 2A 16 19 01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 0F 01 18 68 78 0F 2A 0F 01 B8 80 6C 0F 
    //2A 07 5B 00 77 01 98 14 79 0F 2A 16 19 01 98 14 79 0F 06 00 00 1B 67 2B 00 00 16 14 2D 01 E8 5C 
    //78 0F 27 1B FD 2A 00 00 16 0F 00 C0 15 79 0F 01 48 03 79 0F 07 AC 00 77 00 C0 15 79 0F 2A 16 07 
    //95 00 81 19 00 C0 15 79 0F 06 00 04 2D 01 E8 5C 78 0F 16 04 0B 0F 00 C0 15 79 0F 19 00 C0 15 79 
    //0F 05 00 04 01 A0 06 79 0F 06 74 00 1C 80 AF 34 0F 01 60 12 79 0F 17 01 B8 80 6C 0F 16 04 0B 47 
    //
  }


  function FinishNotify() {
    local Controller C;
    C = Level.ControllerList;                                                   //0000 : 0F 00 E0 17 79 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 
    while (C != None) {                                                         //0014 : 07 6F 00 77 00 E0 17 79 0F 2A 16 
      if (C.Pawn != None && C.PendingMover == self) {                           //001F : 07 58 00 82 77 19 00 E0 17 79 0F 05 00 04 01 88 83 6C 0F 2A 16 18 12 00 72 19 00 E0 17 79 0F 05 00 04 01 40 B4 70 0F 17 16 16 
        C.MoverFinished();                                                      //0049 : 19 00 E0 17 79 0F 06 00 00 1B 37 2B 00 00 16 
      }
      C = C.nextController;                                                     //0058 : 0F 00 E0 17 79 0F 19 00 E0 17 79 0F 05 00 04 01 08 F5 70 0F 
    }
    //0F 00 E0 17 79 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 07 6F 00 77 00 E0 17 79 0F 2A 16 07 
    //58 00 82 77 19 00 E0 17 79 0F 05 00 04 01 88 83 6C 0F 2A 16 18 12 00 72 19 00 E0 17 79 0F 05 00 
    //04 01 40 B4 70 0F 17 16 16 19 00 E0 17 79 0F 06 00 00 1B 37 2B 00 00 16 0F 00 E0 17 79 0F 19 00 
    //E0 17 79 0F 05 00 04 01 08 F5 70 0F 06 14 00 04 0B 47 
  }


  event KeyFrameReached() {
    local byte OldKeyNum;
    local Mover M;
    OldKeyNum = PrevKeyNum;                                                     //0000 : 0F 00 18 32 78 0F 01 08 34 78 0F 
    PrevKeyNum = KeyNum;                                                        //000B : 0F 01 08 34 78 0F 01 80 34 78 0F 
    PhysAlpha = 0.00000000;                                                     //0016 : 0F 01 F8 34 78 0F 1E 00 00 00 00 
    if (KeyNum > 0 && KeyNum < OldKeyNum) {                                     //0021 : 07 5D 00 82 97 39 3A 01 80 34 78 0F 25 16 18 11 00 96 39 3A 01 80 34 78 0F 39 3A 00 18 32 78 0F 16 16 
      InterpolateTo(KeyNum - 1,MoveTime);                                       //0043 : 1B 78 2A 00 00 39 3D 93 39 3A 01 80 34 78 0F 26 16 01 70 35 78 0F 16 
    } else {                                                                    //005A : 06 F2 00 
      if (KeyNum < NumKeys - 1 && KeyNum > OldKeyNum) {                         //005D : 07 A2 00 82 96 39 3A 01 80 34 78 0F 93 39 3A 01 E8 35 78 0F 26 16 16 18 11 00 97 39 3A 01 80 34 78 0F 39 3A 00 18 32 78 0F 16 16 
        InterpolateTo(KeyNum + 1,MoveTime);                                     //0088 : 1B 78 2A 00 00 39 3D 92 39 3A 01 80 34 78 0F 26 16 01 70 35 78 0F 16 
      } else {                                                                  //009F : 06 F2 00 
        StopSound(16);                                                          //00A2 : 1B A9 0D 00 00 24 10 16 
        if (bJumpLift && KeyNum == 1) {                                         //00AA : 07 C8 00 82 2D 01 60 36 78 0F 18 0B 00 9A 39 3A 01 80 34 78 0F 26 16 16 
          FinishNotify();                                                       //00C2 : 1B FD 2A 00 00 16 
        }
        if (IsServer()) {                                                       //00C8 : 07 F2 00 1B FF 0B 00 00 16 
          foreach BasedActors(Class'Mover',M) {                                 //00D1 : 2F 61 32 20 30 1B D4 00 00 D8 36 78 0F 16 F1 00 
            M.BaseFinished();                                                   //00E1 : 19 00 D8 36 78 0F 06 00 00 1B 61 2B 00 00 16 
          }
        }
      }
    }
    //0F 00 18 32 78 0F 01 08 34 78 0F 0F 01 08 34 78 0F 01 80 34 78 0F 0F 01 F8 34 78 0F 1E 00 00 00 
    //00 07 5D 00 82 97 39 3A 01 80 34 78 0F 25 16 18 11 00 96 39 3A 01 80 34 78 0F 39 3A 00 18 32 78 
    //0F 16 16 1B 78 2A 00 00 39 3D 93 39 3A 01 80 34 78 0F 26 16 01 70 35 78 0F 16 06 F2 00 07 A2 00 
    //82 96 39 3A 01 80 34 78 0F 93 39 3A 01 E8 35 78 0F 26 16 16 18 11 00 97 39 3A 01 80 34 78 0F 39 
    //3A 00 18 32 78 0F 16 16 1B 78 2A 00 00 39 3D 92 39 3A 01 80 34 78 0F 26 16 01 70 35 78 0F 16 06 
    //F2 00 1B A9 0D 00 00 24 10 16 07 C8 00 82 2D 01 60 36 78 0F 18 0B 00 9A 39 3A 01 80 34 78 0F 26 
    //16 16 1B FD 2A 00 00 16 07 F2 00 1B FF 0B 00 00 16 2F 61 32 20 30 1B D4 00 00 D8 36 78 0F 16 F1 
    //00 19 00 D8 36 78 0F 06 00 00 1B 61 2B 00 00 16 31 30 04 0B 47 
  }


  final function SetKeyframe(byte NewKeyNum,Vector NewLocation,Rotator NewRotation) {
    KeyNum = Clamp(NewKeyNum,0,24 - 1);                                         //0000 : 0F 01 80 34 78 0F 39 3D FB 39 3A 00 D0 19 79 0F 25 93 2C 18 26 16 16 
    KeyPos[KeyNum] = NewLocation;                                               //0017 : 0F 1A 39 3A 01 80 34 78 0F 01 48 BA 37 0F 00 C8 1A 79 0F 
    KeyRot[KeyNum] = NewRotation;                                               //002A : 0F 1A 39 3A 01 80 34 78 0F 01 38 BB 37 0F 00 40 1B 79 0F 
    //0F 01 80 34 78 0F 39 3D FB 39 3A 00 D0 19 79 0F 25 93 2C 18 26 16 16 0F 1A 39 3A 01 80 34 78 0F 
    //01 48 BA 37 0F 00 C8 1A 79 0F 0F 1A 39 3A 01 80 34 78 0F 01 38 BB 37 0F 00 40 1B 79 0F 04 0B 47 
    //
  }


  function InterpolateTo(byte NewKeyNum,float Seconds) {
    local Mover M;
    foreach BasedActors(Class'Mover',M) {                                       //0000 : 2F 61 32 20 30 1B D4 00 00 B8 1E 79 0F 16 20 00 
      M.BaseStarted();                                                          //0010 : 19 00 B8 1E 79 0F 06 00 00 1B 59 2B 00 00 16 
    }
    NewKeyNum = Clamp(NewKeyNum,0,24 - 1);                                      //0021 : 0F 00 68 1C 79 0F 39 3D FB 39 3A 00 68 1C 79 0F 25 93 2C 18 26 16 16 
    if (NewKeyNum == PrevKeyNum && KeyNum != PrevKeyNum) {                      //0038 : 07 AA 00 82 9A 39 3A 00 68 1C 79 0F 39 3A 01 08 34 78 0F 16 18 11 00 9B 39 3A 01 80 34 78 0F 39 3A 01 08 34 78 0F 16 16 
      PhysAlpha = 1.00000000 - PhysAlpha;                                       //0060 : 0F 01 F8 34 78 0F AF 1E 00 00 80 3F 01 F8 34 78 0F 16 
      OldPos = BasePos + KeyPos[KeyNum];                                        //0072 : 0F 01 30 1F 79 0F D7 01 D0 B9 37 0F 1A 39 3A 01 80 34 78 0F 01 48 BA 37 0F 16 
      OldRot = BaseRot + KeyRot[KeyNum];                                        //008C : 0F 01 A8 1F 79 0F 61 3C 01 C0 BA 37 0F 1A 39 3A 01 80 34 78 0F 01 38 BB 37 0F 16 
    } else {                                                                    //00A7 : 06 CB 00 
      OldPos = Location;                                                        //00AA : 0F 01 30 1F 79 0F 01 30 81 6C 0F 
      OldRot = Rotation;                                                        //00B5 : 0F 01 A8 1F 79 0F 01 00 84 6C 0F 
      PhysAlpha = 0.00000000;                                                   //00C0 : 0F 01 F8 34 78 0F 1E 00 00 00 00 
    }
    if (bResetting) {                                                           //00CB : 07 DF 00 2D 01 B0 CE 78 0F 
      Seconds = 0.00500000;                                                     //00D4 : 0F 00 20 20 79 0F 1E 0A D7 A3 3B 
    }
    SetPhysics(8);                                                              //00DF : 6F 82 24 08 16 
    bInterpolating = True;                                                      //00E4 : 14 2D 01 D8 E8 35 0F 27 
    PrevKeyNum = KeyNum;                                                        //00EC : 0F 01 08 34 78 0F 01 80 34 78 0F 
    KeyNum = NewKeyNum;                                                         //00F7 : 0F 01 80 34 78 0F 00 68 1C 79 0F 
    PhysRate = 1.00000000 / FMax(Seconds,0.00500000);                           //0102 : 0F 01 98 20 79 0F AC 1E 00 00 80 3F F5 00 20 20 79 0F 1E 0A D7 A3 3B 16 16 
    if (PhysRate < 0.00100000) {                                                //011B : 07 35 01 B0 01 98 20 79 0F 1E 6F 12 83 3A 16 
      PhysRate = 0.00100000;                                                    //012A : 0F 01 98 20 79 0F 1E 6F 12 83 3A 
    }
    //2F 61 32 20 30 1B D4 00 00 B8 1E 79 0F 16 20 00 19 00 B8 1E 79 0F 06 00 00 1B 59 2B 00 00 16 31 
    //30 0F 00 68 1C 79 0F 39 3D FB 39 3A 00 68 1C 79 0F 25 93 2C 18 26 16 16 07 AA 00 82 9A 39 3A 00 
    //68 1C 79 0F 39 3A 01 08 34 78 0F 16 18 11 00 9B 39 3A 01 80 34 78 0F 39 3A 01 08 34 78 0F 16 16 
    //0F 01 F8 34 78 0F AF 1E 00 00 80 3F 01 F8 34 78 0F 16 0F 01 30 1F 79 0F D7 01 D0 B9 37 0F 1A 39 
    //3A 01 80 34 78 0F 01 48 BA 37 0F 16 0F 01 A8 1F 79 0F 61 3C 01 C0 BA 37 0F 1A 39 3A 01 80 34 78 
    //0F 01 38 BB 37 0F 16 06 CB 00 0F 01 30 1F 79 0F 01 30 81 6C 0F 0F 01 A8 1F 79 0F 01 00 84 6C 0F 
    //0F 01 F8 34 78 0F 1E 00 00 00 00 07 DF 00 2D 01 B0 CE 78 0F 0F 00 20 20 79 0F 1E 0A D7 A3 3B 6F 
    //82 24 08 16 14 2D 01 D8 E8 35 0F 27 0F 01 08 34 78 0F 01 80 34 78 0F 0F 01 80 34 78 0F 00 68 1C 
    //79 0F 0F 01 98 20 79 0F AC 1E 00 00 80 3F F5 00 20 20 79 0F 1E 0A D7 A3 3B 16 16 07 35 01 B0 01 
    //98 20 79 0F 1E 6F 12 83 3A 16 0F 01 98 20 79 0F 1E 6F 12 83 3A 04 0B 47 
  }


  function StartInterpolation() {
    SBGotoState('None');                                                        //0000 : 1B 11 06 00 00 21 00 00 00 00 16 
    bInterpolating = True;                                                      //000B : 14 2D 01 D8 E8 35 0F 27 
    SetPhysics(0);                                                              //0013 : 6F 82 24 00 16 
    //1B 11 06 00 00 21 00 00 00 00 16 14 2D 01 D8 E8 35 0F 27 6F 82 24 00 16 04 0B 47 
  }


  function Actor SpecialHandling(Pawn Other) {
    local Actor A;
    if (myMarker != None) {                                                     //0000 : 07 3C 00 77 01 98 14 79 0F 2A 16 
      A = myMarker.SpecialHandling(Other);                                      //000B : 0F 00 10 23 79 0F 19 01 98 14 79 0F 0B 00 04 1B 5A 01 00 00 00 10 22 79 0F 16 
      if (A == None) {                                                          //0025 : 07 36 00 72 00 10 23 79 0F 2A 16 
        return myMarker;                                                        //0030 : 04 01 98 14 79 0F 
      }
      return A;                                                                 //0036 : 04 00 10 23 79 0F 
    }
    return self;                                                                //003C : 04 17 
    //07 3C 00 77 01 98 14 79 0F 2A 16 0F 00 10 23 79 0F 19 01 98 14 79 0F 0B 00 04 1B 5A 01 00 00 00 
    //10 22 79 0F 16 07 36 00 72 00 10 23 79 0F 2A 16 04 01 98 14 79 0F 04 00 10 23 79 0F 04 17 04 0B 
    //47 
  }


  function bool SelfTriggered() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function SBGotoState(optional name aNewState,optional name aLabel) {
    GotoState(aNewState,aLabel);                                                //0000 : 71 00 B0 24 79 0F 00 68 25 79 0F 16 
    //71 00 B0 24 79 0F 00 68 25 79 0F 16 04 0B 47 
  }


  native function StopSound(byte aSoundType);


  native function StartSound(byte aSoundType);


  state() RotatingMover {

      function BaseFinished() {
        local Actor OldBase;
        OldBase = Base;                                                         //0000 : 0F 00 78 D2 71 0F 01 B0 94 6C 0F 
        SetPhysics(0);                                                          //000B : 6F 82 24 00 16 
        SetBase(OldBase);                                                       //0010 : 61 2A 00 78 D2 71 0F 16 
        if (bToggleDirection) {                                                 //0018 : 07 5A 00 2D 01 50 25 78 0F 
          RotationRate.Yaw *= -1;                                               //0021 : 9F 36 20 BF 69 0F 01 30 E8 6E 0F 39 3F 1D FF FF FF FF 16 
          RotationRate.Pitch *= -1;                                             //0034 : 9F 36 A8 BE 69 0F 01 30 E8 6E 0F 39 3F 1D FF FF FF FF 16 
          RotationRate.Roll *= -1;                                              //0047 : 9F 36 98 BF 69 0F 01 30 E8 6E 0F 39 3F 1D FF FF FF FF 16 
        }
        //0F 00 78 D2 71 0F 01 B0 94 6C 0F 6F 82 24 00 16 61 2A 00 78 D2 71 0F 16 07 5A 00 2D 01 50 25 78 
        //0F 9F 36 20 BF 69 0F 01 30 E8 6E 0F 39 3F 1D FF FF FF FF 16 9F 36 A8 BE 69 0F 01 30 E8 6E 0F 39 
        //3F 1D FF FF FF FF 16 9F 36 98 BF 69 0F 01 30 E8 6E 0F 39 3F 1D FF FF FF FF 16 04 0B 47 
      }


      function BaseStarted() {
        local Actor OldBase;
        bFixedRotationDir = True;                                               //0000 : 14 2D 01 28 E2 6E 0F 27 
        OldBase = Base;                                                         //0008 : 0F 00 68 2A 78 0F 01 B0 94 6C 0F 
        SetPhysics(5);                                                          //0013 : 6F 82 24 05 16 
        SetBase(OldBase);                                                       //0018 : 61 2A 00 68 2A 78 0F 16 
        //14 2D 01 28 E2 6E 0F 27 0F 00 68 2A 78 0F 01 B0 94 6C 0F 6F 82 24 05 16 61 2A 00 68 2A 78 0F 16 
        //04 0B 47 
      }


    //08 47 

  }


  state LeadInOutLooping {

      event KeyFrameReached() {
        if (bOscillatingLoop) {                                                 //0000 : 07 63 00 2D 01 08 39 78 0F 
          if (KeyNum == 1 || KeyNum == NumKeys - 1) {                           //0009 : 07 42 00 84 9A 39 3A 01 80 34 78 0F 26 16 18 14 00 9A 39 3A 01 80 34 78 0F 93 39 3A 01 E8 35 78 0F 26 16 16 16 
            StepDirection *= -1;                                                //002E : 9F 01 80 39 78 0F 39 3F 1D FF FF FF FF 16 
            MoverLooped();                                                      //003C : 1B E3 2A 00 00 16 
          }
          KeyNum += StepDirection;                                              //0042 : 87 01 80 34 78 0F 39 3D 01 80 39 78 0F 16 
          InterpolateTo(KeyNum,MoveTime);                                       //0050 : 1B 78 2A 00 00 01 80 34 78 0F 01 70 35 78 0F 16 
        } else {                                                                //0060 : 06 9B 00 
          KeyNum++;                                                             //0063 : 8B 01 80 34 78 0F 16 
          if (KeyNum == NumKeys) {                                              //006A : 07 8B 00 9A 39 3A 01 80 34 78 0F 39 3A 01 E8 35 78 0F 16 
            KeyNum = 1;                                                         //007D : 0F 01 80 34 78 0F 24 01 
            MoverLooped();                                                      //0085 : 1B E3 2A 00 00 16 
          }
          InterpolateTo(KeyNum,MoveTime);                                       //008B : 1B 78 2A 00 00 01 80 34 78 0F 01 70 35 78 0F 16 
        }
        //07 63 00 2D 01 08 39 78 0F 07 42 00 84 9A 39 3A 01 80 34 78 0F 26 16 18 14 00 9A 39 3A 01 80 34 
        //78 0F 93 39 3A 01 E8 35 78 0F 26 16 16 16 9F 01 80 39 78 0F 39 3F 1D FF FF FF FF 16 1B E3 2A 00 
        //00 16 87 01 80 34 78 0F 39 3D 01 80 39 78 0F 16 1B 78 2A 00 00 01 80 34 78 0F 01 70 35 78 0F 16 
        //06 9B 00 8B 01 80 34 78 0F 16 07 8B 00 9A 39 3A 01 80 34 78 0F 39 3A 01 E8 35 78 0F 16 0F 01 80 
        //34 78 0F 24 01 1B E3 2A 00 00 16 1B 78 2A 00 00 01 80 34 78 0F 01 70 35 78 0F 16 04 0B 47 
      }


      function Trigger(Actor Other,Pawn EventInstigator) {
        InterpolateTo(0,MoveTime);                                              //0000 : 1B 78 2A 00 00 24 00 01 70 35 78 0F 16 
        SBGotoState('LeadInOutLooper');                                         //000D : 1B 11 06 00 00 21 ED 2A 00 00 16 
        //1B 78 2A 00 00 24 00 01 70 35 78 0F 16 1B 11 06 00 00 21 ED 2A 00 00 16 04 0B 47 
      }


    //08 47 

  }


  state() LeadInOutLooper {

      function BeginState() {
        bOpening = False;                                                       //0000 : 14 2D 01 B0 41 78 0F 28 
        bDelaying = False;                                                      //0008 : 14 2D 01 28 42 78 0F 28 
        //14 2D 01 B0 41 78 0F 28 14 2D 01 28 42 78 0F 28 04 0B 47 
      }


      event KeyFrameReached() {
        if (KeyNum != 0) {                                                      //0000 : 07 25 00 9B 39 3A 01 80 34 78 0F 25 16 
          InterpolateTo(2,MoveTime);                                            //000D : 1B 78 2A 00 00 24 02 01 70 35 78 0F 16 
          SBGotoState('LeadInOutLooping');                                      //001A : 1B 11 06 00 00 21 EE 2A 00 00 16 
        }
        //07 25 00 9B 39 3A 01 80 34 78 0F 25 16 1B 78 2A 00 00 24 02 01 70 35 78 0F 16 1B 11 06 00 00 21 
        //EE 2A 00 00 16 04 0B 47 
      }


      function Trigger(Actor Other,Pawn EventInstigator) {
        if (NumKeys < 3) {                                                      //0000 : 07 42 00 96 39 3A 01 E8 35 78 0F 2C 03 16 
          Log("LeadInOutLooper detected with <3 movement keys");                //000E : E7 1F 4C 65 61 64 49 6E 4F 75 74 4C 6F 6F 70 65 72 20 64 65 74 65 63 74 65 64 20 77 69 74 68 20 3C 33 20 6D 6F 76 65 6D 65 6E 74 20 6B 65 79 73 00 16 
          return;                                                               //0040 : 04 0B 
        }
        InterpolateTo(1,MoveTime);                                              //0042 : 1B 78 2A 00 00 24 01 01 70 35 78 0F 16 
        //07 42 00 96 39 3A 01 E8 35 78 0F 2C 03 16 E7 1F 4C 65 61 64 49 6E 4F 75 74 4C 6F 6F 70 65 72 20 
        //64 65 74 65 63 74 65 64 20 77 69 74 68 20 3C 33 20 6D 6F 76 65 6D 65 6E 74 20 6B 65 79 73 00 16 
        //04 0B 1B 78 2A 00 00 24 01 01 70 35 78 0F 16 04 0B 47 
      }


    //08 47 

  }


  state() ConstantLoop {

      function BeginState() {
        bOpening = False;                                                       //0000 : 14 2D 01 B0 41 78 0F 28 
        bDelaying = False;                                                      //0008 : 14 2D 01 28 42 78 0F 28 
        //14 2D 01 B0 41 78 0F 28 14 2D 01 28 42 78 0F 28 04 0B 47 
      }


      event KeyFrameReached() {
        if (bOscillatingLoop) {                                                 //0000 : 07 63 00 2D 01 08 39 78 0F 
          if (KeyNum == 0 || KeyNum == NumKeys - 1) {                           //0009 : 07 42 00 84 9A 39 3A 01 80 34 78 0F 25 16 18 14 00 9A 39 3A 01 80 34 78 0F 93 39 3A 01 E8 35 78 0F 26 16 16 16 
            StepDirection *= -1;                                                //002E : 9F 01 80 39 78 0F 39 3F 1D FF FF FF FF 16 
            MoverLooped();                                                      //003C : 1B E3 2A 00 00 16 
          }
          KeyNum += StepDirection;                                              //0042 : 87 01 80 34 78 0F 39 3D 01 80 39 78 0F 16 
          InterpolateTo(KeyNum,MoveTime);                                       //0050 : 1B 78 2A 00 00 01 80 34 78 0F 01 70 35 78 0F 16 
        } else {                                                                //0060 : 06 9A 00 
          InterpolateTo((KeyNum + 1) % NumKeys,MoveTime);                       //0063 : 1B 78 2A 00 00 39 43 AD 39 3C 39 3D 92 39 3A 01 80 34 78 0F 26 16 39 3C 01 E8 35 78 0F 16 01 70 35 78 0F 16 
          if (KeyNum == 0) {                                                    //0087 : 07 9A 00 9A 39 3A 01 80 34 78 0F 25 16 
            MoverLooped();                                                      //0094 : 1B E3 2A 00 00 16 
          }
        }
        //07 63 00 2D 01 08 39 78 0F 07 42 00 84 9A 39 3A 01 80 34 78 0F 25 16 18 14 00 9A 39 3A 01 80 34 
        //78 0F 93 39 3A 01 E8 35 78 0F 26 16 16 16 9F 01 80 39 78 0F 39 3F 1D FF FF FF FF 16 1B E3 2A 00 
        //00 16 87 01 80 34 78 0F 39 3D 01 80 39 78 0F 16 1B 78 2A 00 00 01 80 34 78 0F 01 70 35 78 0F 16 
        //06 9A 00 1B 78 2A 00 00 39 43 AD 39 3C 39 3D 92 39 3A 01 80 34 78 0F 26 16 39 3C 01 E8 35 78 0F 
        //16 01 70 35 78 0F 16 07 9A 00 9A 39 3A 01 80 34 78 0F 25 16 1B E3 2A 00 00 16 04 0B 47 
      }


  Begin:
    InterpolateTo(1,MoveTime);                                                  //0000 : 1B 78 2A 00 00 24 01 01 70 35 78 0F 16 
  Running:
    FinishInterpolation();                                                      //000D : 61 2D 16 
    SBGotoState('ConstantLoop','Running');                                      //0010 : 1B 11 06 00 00 21 E9 2A 00 00 21 23 26 00 00 16 
    //1B 78 2A 00 00 24 01 01 70 35 78 0F 16 61 2D 16 1B 11 06 00 00 21 E9 2A 00 00 21 23 26 00 00 16 
    //08 0B 0B 0C 23 26 00 00 0D 00 00 00 64 00 00 00 00 00 00 00 00 00 00 00 FF FF 00 00 47 

  }


  state WasBumpButton {

      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        SetResetStatus(True);                                                   //0006 : 1B 6D 2A 00 00 27 16 
        SBGotoState('BumpButton','Close');                                      //000D : 1B 11 06 00 00 21 C6 2A 00 00 21 6E 2A 00 00 16 
        //1C A8 B4 34 0F 16 1B 6D 2A 00 00 27 16 1B 11 06 00 00 21 C6 2A 00 00 21 6E 2A 00 00 16 04 0B 47 
        //
      }


    //08 47 

  }


  state() BumpButton {

      function EndEvent() {
        bSlave = False;                                                         //0000 : 14 2D 01 D8 5D 78 0F 28 
        Instigator = None;                                                      //0008 : 0F 01 B8 80 6C 0F 2A 
        SBGotoState('BumpButton','Close');                                      //000F : 1B 11 06 00 00 21 C6 2A 00 00 21 6E 2A 00 00 16 
        //14 2D 01 D8 5D 78 0F 28 0F 01 B8 80 6C 0F 2A 1B 11 06 00 00 21 C6 2A 00 00 21 6E 2A 00 00 16 04 
        //0B 47 
      }


      function BeginEvent() {
        bSlave = True;                                                          //0000 : 14 2D 01 D8 5D 78 0F 27 
        //14 2D 01 D8 5D 78 0F 27 04 0B 47 
      }


      function Bump(Actor Other) {
        if (BumpType != 2 && Pawn(Other) == None) {                             //0000 : 07 24 00 82 9B 39 3A 01 F0 64 78 0F 39 3A 24 02 16 18 0E 00 72 2E 50 31 D4 00 00 58 66 78 0F 2A 16 16 
          return;                                                               //0022 : 04 0B 
        }
        if (BumpType == 0 && !Pawn(Other).IsPlayerPawn()) {                     //0024 : 07 51 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 00 16 18 17 00 81 19 2E 50 31 D4 00 00 58 66 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 
          return;                                                               //004F : 04 0B 
        }
        if (BumpType == 1 && Other.Mass < 10) {                                 //0051 : 07 7C 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 01 16 18 15 00 B0 19 00 58 66 78 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 0A 16 16 
          return;                                                               //007A : 04 0B 
        }
        Global.Bump(Other);                                                     //007C : 38 3B 01 00 00 00 58 66 78 0F 16 
        SavedTrigger = Other;                                                   //0087 : 0F 01 18 68 78 0F 00 58 66 78 0F 
        Instigator = Pawn(Other);                                               //0092 : 0F 01 B8 80 6C 0F 2E 50 31 D4 00 00 58 66 78 0F 
        Instigator.Controller.WaitForMover(self);                               //00A2 : 19 19 01 B8 80 6C 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 9A 2A 00 00 17 16 
        SBGotoState('BumpButton','Open');                                       //00BB : 1B 11 06 00 00 21 C6 2A 00 00 21 6C 2A 00 00 16 
        //07 24 00 82 9B 39 3A 01 F0 64 78 0F 39 3A 24 02 16 18 0E 00 72 2E 50 31 D4 00 00 58 66 78 0F 2A 
        //16 16 04 0B 07 51 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 00 16 18 17 00 81 19 2E 50 31 D4 00 00 
        //58 66 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 04 0B 07 7C 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 
        //01 16 18 15 00 B0 19 00 58 66 78 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 0A 16 16 04 0B 38 3B 01 00 
        //00 00 58 66 78 0F 16 0F 01 18 68 78 0F 00 58 66 78 0F 0F 01 B8 80 6C 0F 2E 50 31 D4 00 00 58 66 
        //78 0F 19 19 01 B8 80 6C 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 9A 2A 00 00 17 16 1B 11 06 00 00 
        //21 C6 2A 00 00 21 6C 2A 00 00 16 04 0B 47 
      }


  Open:
    if (bTriggerOnceOnly) {                                                     //0000 : 07 10 00 2D 01 70 5C 78 0F 
      Disable('Trigger');                                                       //0009 : 76 21 32 01 00 00 16 
    }
    bClosed = False;                                                            //0010 : 14 2D 01 E8 5C 78 0F 28 
    Disable('Bump');                                                            //0018 : 76 21 3B 01 00 00 16 
    if (DelayTime > 0) {                                                        //001F : 07 3C 00 B1 01 60 5D 78 0F 39 3F 25 16 
      bDelaying = True;                                                         //002C : 14 2D 01 28 42 78 0F 27 
      Sleep(DelayTime);                                                         //0034 : 61 00 01 60 5D 78 0F 16 
    }
    DoOpen();                                                                   //003C : 1B A1 2A 00 00 16 
    FinishInterpolation();                                                      //0042 : 61 2D 16 
    FinishedOpening();                                                          //0045 : 1B A8 2A 00 00 16 
    if (bTriggerOnceOnly) {                                                     //004B : 07 5F 00 2D 01 70 5C 78 0F 
      SBGotoState('WasBumpButton');                                             //0054 : 1B 11 06 00 00 21 E8 2A 00 00 16 
    }
    if (bSlave) {                                                               //005F : 07 69 00 2D 01 D8 5D 78 0F 
    }
  Close:
    DoClose();                                                                  //0069 : 1B 91 2A 00 00 16 
    FinishInterpolation();                                                      //006F : 61 2D 16 
    FinishedClosing();                                                          //0072 : 1B C2 2A 00 00 16 
    SetResetStatus(False);                                                      //0078 : 1B 6D 2A 00 00 28 16 
    Enable('Bump');                                                             //007F : 75 21 3B 01 00 00 16 
    //07 10 00 2D 01 70 5C 78 0F 76 21 32 01 00 00 16 14 2D 01 E8 5C 78 0F 28 76 21 3B 01 00 00 16 07 
    //3C 00 B1 01 60 5D 78 0F 39 3F 25 16 14 2D 01 28 42 78 0F 27 61 00 01 60 5D 78 0F 16 1B A1 2A 00 
    //00 16 61 2D 16 1B A8 2A 00 00 16 07 5F 00 2D 01 70 5C 78 0F 1B 11 06 00 00 21 E8 2A 00 00 16 07 
    //69 00 2D 01 D8 5D 78 0F 08 1B 91 2A 00 00 16 61 2D 16 1B C2 2A 00 00 16 1B 6D 2A 00 00 28 16 75 
    //21 3B 01 00 00 16 08 0C 6E 2A 00 00 69 00 00 00 6C 2A 00 00 00 00 00 00 00 00 00 00 FF FF 00 00 
    //47 

  }


  state WasTriggerAdvance {

      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        SetResetStatus(True);                                                   //0006 : 1B 6D 2A 00 00 27 16 
        SBGotoState('TriggerAdvance','Close');                                  //000D : 1B 11 06 00 00 21 98 2A 00 00 21 6E 2A 00 00 16 
        //1C A8 B4 34 0F 16 1B 6D 2A 00 00 27 16 1B 11 06 00 00 21 98 2A 00 00 21 6E 2A 00 00 16 04 0B 47 
        //
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


    //08 47 

  }


  state() TriggerAdvance {

      function EndState() {
        StopSound(16);                                                          //0000 : 1B A9 0D 00 00 24 10 16 
        //1B A9 0D 00 00 24 10 16 04 0B 47 
      }


      function BeginState() {
        numTriggerEvents = 0;                                                   //0000 : 0F 01 58 76 78 0F 25 
        //0F 01 58 76 78 0F 25 04 0B 47 
      }


      function UnTrigger(Actor Other,Pawn EventInstigator) {
        numTriggerEvents--;                                                     //0000 : A6 01 58 76 78 0F 16 
        if (numTriggerEvents <= 0) {                                            //0007 : 07 5E 00 98 01 58 76 78 0F 25 16 
          StopSound(16);                                                        //0012 : 1B A9 0D 00 00 24 10 16 
          numTriggerEvents = 0;                                                 //001A : 0F 01 58 76 78 0F 25 
          SavedTrigger = Other;                                                 //0021 : 0F 01 18 68 78 0F 00 80 77 78 0F 
          Instigator = EventInstigator;                                         //002C : 0F 01 B8 80 6C 0F 00 A8 78 78 0F 
          if (SavedTrigger != None) {                                           //0037 : 07 51 00 77 01 18 68 78 0F 2A 16 
            SavedTrigger.BeginEvent();                                          //0042 : 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 
          }
          SetStoppedPosition(1);                                                //0051 : 1B CC 2A 00 00 24 01 16 
          SetPhysics(0);                                                        //0059 : 6F 82 24 00 16 
        }
        //A6 01 58 76 78 0F 16 07 5E 00 98 01 58 76 78 0F 25 16 1B A9 0D 00 00 24 10 16 0F 01 58 76 78 0F 
        //25 0F 01 18 68 78 0F 00 80 77 78 0F 0F 01 B8 80 6C 0F 00 A8 78 78 0F 07 51 00 77 01 18 68 78 0F 
        //2A 16 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 1B CC 2A 00 00 24 01 16 6F 82 24 00 16 04 0B 
        //47 
      }


      function Trigger(Actor Other,Pawn EventInstigator) {
        numTriggerEvents++;                                                     //0000 : A5 01 58 76 78 0F 16 
        SavedTrigger = Other;                                                   //0007 : 0F 01 18 68 78 0F 00 D0 79 78 0F 
        Instigator = EventInstigator;                                           //0012 : 0F 01 B8 80 6C 0F 00 08 7B 78 0F 
        if (SavedTrigger != None) {                                             //001D : 07 37 00 77 01 18 68 78 0F 2A 16 
          SavedTrigger.BeginEvent();                                            //0028 : 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 
        }
        SetStoppedPosition(0);                                                  //0037 : 1B CC 2A 00 00 24 00 16 
        SetPhysics(8);                                                          //003F : 6F 82 24 08 16 
        StartSound(16);                                                         //0044 : 1B 85 2A 00 00 24 10 16 
        if (!bOpening) {                                                        //004C : 07 67 00 81 2D 01 B0 41 78 0F 16 
          SBGotoState('TriggerAdvance','Open');                                 //0057 : 1B 11 06 00 00 21 98 2A 00 00 21 6C 2A 00 00 16 
        }
        //A5 01 58 76 78 0F 16 0F 01 18 68 78 0F 00 D0 79 78 0F 0F 01 B8 80 6C 0F 00 08 7B 78 0F 07 37 00 
        //77 01 18 68 78 0F 2A 16 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 1B CC 2A 00 00 24 00 16 6F 
        //82 24 08 16 1B 85 2A 00 00 24 10 16 07 67 00 81 2D 01 B0 41 78 0F 16 1B 11 06 00 00 21 98 2A 00 
        //00 21 6C 2A 00 00 16 04 0B 47 
      }


      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        SetResetStatus(True);                                                   //0006 : 1B 6D 2A 00 00 27 16 
        numTriggerEvents = 0;                                                   //000D : 0F 01 58 76 78 0F 25 
        SBGotoState('TriggerAdvance','Close');                                  //0014 : 1B 11 06 00 00 21 98 2A 00 00 21 6E 2A 00 00 16 
        //1C A8 B4 34 0F 16 1B 6D 2A 00 00 27 16 0F 01 58 76 78 0F 25 1B 11 06 00 00 21 98 2A 00 00 21 6E 
        //2A 00 00 16 04 0B 47 
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


  Open:
    if (Physics == 0) {                                                         //0000 : 07 20 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 
      SBGotoState('TriggerAdvance','None');                                     //0010 : 1B 11 06 00 00 21 98 2A 00 00 21 00 00 00 00 16 
    }
    bClosed = False;                                                            //0020 : 14 2D 01 E8 5C 78 0F 28 
    if (DelayTime > 0) {                                                        //0028 : 07 45 00 B1 01 60 5D 78 0F 39 3F 25 16 
      bDelaying = True;                                                         //0035 : 14 2D 01 28 42 78 0F 27 
      Sleep(DelayTime);                                                         //003D : 61 00 01 60 5D 78 0F 16 
    }
    if (Physics == 0) {                                                         //0045 : 07 65 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 
      SBGotoState('TriggerAdvance','None');                                     //0055 : 1B 11 06 00 00 21 98 2A 00 00 21 00 00 00 00 16 
    }
    SetStoppedPosition(0);                                                      //0065 : 1B CC 2A 00 00 24 00 16 
    DoOpen();                                                                   //006D : 1B A1 2A 00 00 16 
    FinishInterpolation();                                                      //0073 : 61 2D 16 
    FinishedOpening();                                                          //0076 : 1B A8 2A 00 00 16 
    if (SavedTrigger != None) {                                                 //007C : 07 96 00 77 01 18 68 78 0F 2A 16 
      SavedTrigger.EndEvent();                                                  //0087 : 19 01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 
    }
    SBGotoState('WasTriggerAdvance');                                           //0096 : 1B 11 06 00 00 21 16 2B 00 00 16 
  Close:
    SetStoppedPosition(0);                                                      //00A2 : 1B CC 2A 00 00 24 00 16 
    SetPhysics(8);                                                              //00AA : 6F 82 24 08 16 
    DoClose();                                                                  //00AF : 1B 91 2A 00 00 16 
    FinishInterpolation();                                                      //00B5 : 61 2D 16 
    FinishedClosing();                                                          //00B8 : 1B C2 2A 00 00 16 
    SetResetStatus(False);                                                      //00BE : 1B 6D 2A 00 00 28 16 
    //07 20 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 1B 11 06 00 00 21 98 2A 00 00 21 00 00 00 00 16 
    //14 2D 01 E8 5C 78 0F 28 07 45 00 B1 01 60 5D 78 0F 39 3F 25 16 14 2D 01 28 42 78 0F 27 61 00 01 
    //60 5D 78 0F 16 07 65 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 1B 11 06 00 00 21 98 2A 00 00 21 
    //00 00 00 00 16 1B CC 2A 00 00 24 00 16 1B A1 2A 00 00 16 61 2D 16 1B A8 2A 00 00 16 07 96 00 77 
    //01 18 68 78 0F 2A 16 19 01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 1B 11 06 00 00 21 16 2B 00 00 
    //16 08 1B CC 2A 00 00 24 00 16 6F 82 24 08 16 1B 91 2A 00 00 16 61 2D 16 1B C2 2A 00 00 16 1B 6D 
    //2A 00 00 28 16 08 08 0C 6E 2A 00 00 A2 00 00 00 6C 2A 00 00 00 00 00 00 00 00 00 00 FF FF 00 00 
    //47 

  }


  state WasTriggerPound {

      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        SetResetStatus(True);                                                   //0006 : 1B 6D 2A 00 00 27 16 
        SBGotoState('TriggerPound','Open');                                     //000D : 1B 11 06 00 00 21 CB 2A 00 00 21 6C 2A 00 00 16 
        //1C A8 B4 34 0F 16 1B 6D 2A 00 00 27 16 1B 11 06 00 00 21 CB 2A 00 00 21 6C 2A 00 00 16 04 0B 47 
        //
      }


    //08 47 

  }


  state() TriggerPound {

      function BeginState() {
        numTriggerEvents = 0;                                                   //0000 : 0F 01 58 76 78 0F 25 
        //0F 01 58 76 78 0F 25 04 0B 47 
      }


      function UnTrigger(Actor Other,Pawn EventInstigator) {
        numTriggerEvents--;                                                     //0000 : A6 01 58 76 78 0F 16 
        if (numTriggerEvents <= 0) {                                            //0007 : 07 37 00 98 01 58 76 78 0F 25 16 
          numTriggerEvents = 0;                                                 //0012 : 0F 01 58 76 78 0F 25 
          SavedTrigger = None;                                                  //0019 : 0F 01 18 68 78 0F 2A 
          Instigator = None;                                                    //0020 : 0F 01 B8 80 6C 0F 2A 
          SBGotoState('TriggerPound','Close');                                  //0027 : 1B 11 06 00 00 21 CB 2A 00 00 21 6E 2A 00 00 16 
        }
        //A6 01 58 76 78 0F 16 07 37 00 98 01 58 76 78 0F 25 16 0F 01 58 76 78 0F 25 0F 01 18 68 78 0F 2A 
        //0F 01 B8 80 6C 0F 2A 1B 11 06 00 00 21 CB 2A 00 00 21 6E 2A 00 00 16 04 0B 47 
      }


      function Trigger(Actor Other,Pawn EventInstigator) {
        numTriggerEvents++;                                                     //0000 : A5 01 58 76 78 0F 16 
        SavedTrigger = Other;                                                   //0007 : 0F 01 18 68 78 0F 00 50 93 78 0F 
        Instigator = EventInstigator;                                           //0012 : 0F 01 B8 80 6C 0F 00 38 94 78 0F 
        SBGotoState('TriggerPound','Open');                                     //001D : 1B 11 06 00 00 21 CB 2A 00 00 21 6C 2A 00 00 16 
        //A5 01 58 76 78 0F 16 0F 01 18 68 78 0F 00 50 93 78 0F 0F 01 B8 80 6C 0F 00 38 94 78 0F 1B 11 06 
        //00 00 21 CB 2A 00 00 21 6C 2A 00 00 16 04 0B 47 
      }


      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        if (numTriggerEvents > 0) {                                             //0006 : 07 27 00 97 01 58 76 78 0F 25 16 
          SetResetStatus(True);                                                 //0011 : 1B 6D 2A 00 00 27 16 
          numTriggerEvents = 0;                                                 //0018 : 0F 01 58 76 78 0F 25 
          UnTrigger(None,None);                                                 //001F : 1B 33 01 00 00 2A 2A 16 
        }
        //1C A8 B4 34 0F 16 07 27 00 97 01 58 76 78 0F 25 16 1B 6D 2A 00 00 27 16 0F 01 58 76 78 0F 25 1B 
        //33 01 00 00 2A 2A 16 04 0B 47 
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


  Open:
    if (bTriggerOnceOnly) {                                                     //0000 : 07 10 00 2D 01 70 5C 78 0F 
      Disable('Trigger');                                                       //0009 : 76 21 32 01 00 00 16 
    }
    bClosed = False;                                                            //0010 : 14 2D 01 E8 5C 78 0F 28 
    if (DelayTime > 0) {                                                        //0018 : 07 35 00 B1 01 60 5D 78 0F 39 3F 25 16 
      bDelaying = True;                                                         //0025 : 14 2D 01 28 42 78 0F 27 
      Sleep(DelayTime);                                                         //002D : 61 00 01 60 5D 78 0F 16 
    }
    DoOpen();                                                                   //0035 : 1B A1 2A 00 00 16 
    FinishInterpolation();                                                      //003B : 61 2D 16 
    Sleep(OtherTime);                                                           //003E : 61 00 01 B0 8E 78 0F 16 
  Close:
    DoClose();                                                                  //0046 : 1B 91 2A 00 00 16 
    FinishInterpolation();                                                      //004C : 61 2D 16 
    Sleep(StayOpenTime);                                                        //004F : 61 00 01 28 8F 78 0F 16 
    SetResetStatus(False);                                                      //0057 : 1B 6D 2A 00 00 28 16 
    if (bTriggerOnceOnly) {                                                     //005E : 07 72 00 2D 01 70 5C 78 0F 
      SBGotoState('WasTriggerPound');                                           //0067 : 1B 11 06 00 00 21 EC 2A 00 00 16 
    }
    if (SavedTrigger != None) {                                                 //0072 : 07 83 00 77 01 18 68 78 0F 2A 16 
      goto ('Open');                                                            //007D : 0D 21 6C 2A 00 00 
    }
    //07 10 00 2D 01 70 5C 78 0F 76 21 32 01 00 00 16 14 2D 01 E8 5C 78 0F 28 07 35 00 B1 01 60 5D 78 
    //0F 39 3F 25 16 14 2D 01 28 42 78 0F 27 61 00 01 60 5D 78 0F 16 1B A1 2A 00 00 16 61 2D 16 61 00 
    //01 B0 8E 78 0F 16 1B 91 2A 00 00 16 61 2D 16 61 00 01 28 8F 78 0F 16 1B 6D 2A 00 00 28 16 07 72 
    //00 2D 01 70 5C 78 0F 1B 11 06 00 00 21 EC 2A 00 00 16 07 83 00 77 01 18 68 78 0F 2A 16 0D 21 6C 
    //2A 00 00 08 0B 0B 0B 0C 6E 2A 00 00 46 00 00 00 6C 2A 00 00 00 00 00 00 00 00 00 00 FF FF 00 00 
    //47 

  }


  state WasTriggerControl {

      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        SetResetStatus(True);                                                   //0006 : 1B 6D 2A 00 00 27 16 
        SBGotoState('TriggerControl','Close');                                  //000D : 1B 11 06 00 00 21 AD 2A 00 00 21 6E 2A 00 00 16 
        //1C A8 B4 34 0F 16 1B 6D 2A 00 00 27 16 1B 11 06 00 00 21 AD 2A 00 00 21 6E 2A 00 00 16 04 0B 47 
        //
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


    //08 47 

  }


  state() TriggerControl {

      function BeginState() {
        numTriggerEvents = 0;                                                   //0000 : 0F 01 58 76 78 0F 25 
        //0F 01 58 76 78 0F 25 04 0B 47 
      }


      function UnTrigger(Actor Other,Pawn EventInstigator) {
        numTriggerEvents--;                                                     //0000 : A6 01 58 76 78 0F 16 
        if (numTriggerEvents <= 0) {                                            //0007 : 07 59 00 98 01 58 76 78 0F 25 16 
          numTriggerEvents = 0;                                                 //0012 : 0F 01 58 76 78 0F 25 
          SavedTrigger = Other;                                                 //0019 : 0F 01 18 68 78 0F 00 88 A4 78 0F 
          Instigator = EventInstigator;                                         //0024 : 0F 01 B8 80 6C 0F 00 A8 A5 78 0F 
          if (SavedTrigger != None) {                                           //002F : 07 49 00 77 01 18 68 78 0F 2A 16 
            SavedTrigger.BeginEvent();                                          //003A : 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 
          }
          SBGotoState('TriggerControl','Close');                                //0049 : 1B 11 06 00 00 21 AD 2A 00 00 21 6E 2A 00 00 16 
        }
        //A6 01 58 76 78 0F 16 07 59 00 98 01 58 76 78 0F 25 16 0F 01 58 76 78 0F 25 0F 01 18 68 78 0F 00 
        //88 A4 78 0F 0F 01 B8 80 6C 0F 00 A8 A5 78 0F 07 49 00 77 01 18 68 78 0F 2A 16 19 01 18 68 78 0F 
        //06 00 00 1B 90 2A 00 00 16 1B 11 06 00 00 21 AD 2A 00 00 21 6E 2A 00 00 16 04 0B 47 
      }


      function Trigger(Actor Other,Pawn EventInstigator) {
        numTriggerEvents++;                                                     //0000 : A5 01 58 76 78 0F 16 
        SavedTrigger = Other;                                                   //0007 : 0F 01 18 68 78 0F 00 D0 A6 78 0F 
        Instigator = EventInstigator;                                           //0012 : 0F 01 B8 80 6C 0F 00 E8 A7 78 0F 
        if (SavedTrigger != None) {                                             //001D : 07 37 00 77 01 18 68 78 0F 2A 16 
          SavedTrigger.BeginEvent();                                            //0028 : 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 
        }
        if (!bOpening) {                                                        //0037 : 07 52 00 81 2D 01 B0 41 78 0F 16 
          SBGotoState('TriggerControl','Open');                                 //0042 : 1B 11 06 00 00 21 AD 2A 00 00 21 6C 2A 00 00 16 
        }
        //A5 01 58 76 78 0F 16 0F 01 18 68 78 0F 00 D0 A6 78 0F 0F 01 B8 80 6C 0F 00 E8 A7 78 0F 07 37 00 
        //77 01 18 68 78 0F 2A 16 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 07 52 00 81 2D 01 B0 41 78 
        //0F 16 1B 11 06 00 00 21 AD 2A 00 00 21 6C 2A 00 00 16 04 0B 47 
      }


      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        if (numTriggerEvents > 0) {                                             //0006 : 07 27 00 97 01 58 76 78 0F 25 16 
          SetResetStatus(True);                                                 //0011 : 1B 6D 2A 00 00 27 16 
          numTriggerEvents = 0;                                                 //0018 : 0F 01 58 76 78 0F 25 
          UnTrigger(None,None);                                                 //001F : 1B 33 01 00 00 2A 2A 16 
        }
        //1C A8 B4 34 0F 16 07 27 00 97 01 58 76 78 0F 25 16 1B 6D 2A 00 00 27 16 0F 01 58 76 78 0F 25 1B 
        //33 01 00 00 2A 2A 16 04 0B 47 
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


  Open:
    bClosed = False;                                                            //0000 : 14 2D 01 E8 5C 78 0F 28 
    if (DelayTime > 0) {                                                        //0008 : 07 25 00 B1 01 60 5D 78 0F 39 3F 25 16 
      bDelaying = True;                                                         //0015 : 14 2D 01 28 42 78 0F 27 
      Sleep(DelayTime);                                                         //001D : 61 00 01 60 5D 78 0F 16 
    }
    if (!bOpening) {                                                            //0025 : 07 36 00 81 2D 01 B0 41 78 0F 16 
      DoOpen();                                                                 //0030 : 1B A1 2A 00 00 16 
    }
    FinishInterpolation();                                                      //0036 : 61 2D 16 
    FinishedOpening();                                                          //0039 : 1B A8 2A 00 00 16 
    if (SavedTrigger != None) {                                                 //003F : 07 59 00 77 01 18 68 78 0F 2A 16 
      SavedTrigger.EndEvent();                                                  //004A : 19 01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 
    }
    if (bTriggerOnceOnly) {                                                     //0059 : 07 6D 00 2D 01 70 5C 78 0F 
      SBGotoState('WasTriggerControl');                                         //0062 : 1B 11 06 00 00 21 F0 2A 00 00 16 
    }
  Close:
    if (bOpening) {                                                             //006E : 07 7D 00 2D 01 B0 41 78 0F 
      DoClose();                                                                //0077 : 1B 91 2A 00 00 16 
    }
    FinishInterpolation();                                                      //007D : 61 2D 16 
    FinishedClosing();                                                          //0080 : 1B C2 2A 00 00 16 
    SetResetStatus(False);                                                      //0086 : 1B 6D 2A 00 00 28 16 
    //14 2D 01 E8 5C 78 0F 28 07 25 00 B1 01 60 5D 78 0F 39 3F 25 16 14 2D 01 28 42 78 0F 27 61 00 01 
    //60 5D 78 0F 16 07 36 00 81 2D 01 B0 41 78 0F 16 1B A1 2A 00 00 16 61 2D 16 1B A8 2A 00 00 16 07 
    //59 00 77 01 18 68 78 0F 2A 16 19 01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 07 6D 00 2D 01 70 5C 
    //78 0F 1B 11 06 00 00 21 F0 2A 00 00 16 08 07 7D 00 2D 01 B0 41 78 0F 1B 91 2A 00 00 16 61 2D 16 
    //1B C2 2A 00 00 16 1B 6D 2A 00 00 28 16 08 0B 0C 6E 2A 00 00 6E 00 00 00 6C 2A 00 00 00 00 00 00 
    //00 00 00 00 FF FF 00 00 47 

  }


  state() TriggerToggle {

      function Trigger(Actor Other,Pawn EventInstigator) {
        SavedTrigger = Other;                                                   //0000 : 0F 01 18 68 78 0F 00 30 72 77 0F 
        Instigator = EventInstigator;                                           //000B : 0F 01 B8 80 6C 0F 00 78 73 77 0F 
        if (SavedTrigger != None) {                                             //0016 : 07 30 00 77 01 18 68 78 0F 2A 16 
          SavedTrigger.BeginEvent();                                            //0021 : 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 
        }
        if (KeyNum == 0 || KeyNum < PrevKeyNum) {                               //0030 : 07 65 00 84 9A 39 3A 01 80 34 78 0F 25 16 18 11 00 96 39 3A 01 80 34 78 0F 39 3A 01 08 34 78 0F 16 16 
          SBGotoState('TriggerToggle','Open');                                  //0052 : 1B 11 06 00 00 21 B0 2A 00 00 21 6C 2A 00 00 16 
        } else {                                                                //0062 : 06 75 00 
          SBGotoState('TriggerToggle','Close');                                 //0065 : 1B 11 06 00 00 21 B0 2A 00 00 21 6E 2A 00 00 16 
        }
        //0F 01 18 68 78 0F 00 30 72 77 0F 0F 01 B8 80 6C 0F 00 78 73 77 0F 07 30 00 77 01 18 68 78 0F 2A 
        //16 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 07 65 00 84 9A 39 3A 01 80 34 78 0F 25 16 18 11 
        //00 96 39 3A 01 80 34 78 0F 39 3A 01 08 34 78 0F 16 16 1B 11 06 00 00 21 B0 2A 00 00 21 6C 2A 00 
        //00 16 06 75 00 1B 11 06 00 00 21 B0 2A 00 00 21 6E 2A 00 00 16 04 0B 47 
      }


      function Reset() {
        Reset();                                                                //0000 : 1C A8 B4 34 0F 16 
        if (bOpening || bDelaying) {                                            //0006 : 07 31 00 84 2D 01 B0 41 78 0F 18 07 00 2D 01 28 42 78 0F 16 
          SetResetStatus(True);                                                 //001A : 1B 6D 2A 00 00 27 16 
          SBGotoState('TriggerToggle','Close');                                 //0021 : 1B 11 06 00 00 21 B0 2A 00 00 21 6E 2A 00 00 16 
        }
        //1C A8 B4 34 0F 16 07 31 00 84 2D 01 B0 41 78 0F 18 07 00 2D 01 28 42 78 0F 16 1B 6D 2A 00 00 27 
        //16 1B 11 06 00 00 21 B0 2A 00 00 21 6E 2A 00 00 16 04 0B 47 
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


  Open:
    bClosed = False;                                                            //0000 : 14 2D 01 E8 5C 78 0F 28 
    if (DelayTime > 0) {                                                        //0008 : 07 25 00 B1 01 60 5D 78 0F 39 3F 25 16 
      bDelaying = True;                                                         //0015 : 14 2D 01 28 42 78 0F 27 
      Sleep(DelayTime);                                                         //001D : 61 00 01 60 5D 78 0F 16 
    }
    DoOpen();                                                                   //0025 : 1B A1 2A 00 00 16 
    FinishInterpolation();                                                      //002B : 61 2D 16 
    FinishedOpening();                                                          //002E : 1B A8 2A 00 00 16 
    if (SavedTrigger != None) {                                                 //0034 : 07 4E 00 77 01 18 68 78 0F 2A 16 
      SavedTrigger.EndEvent();                                                  //003F : 19 01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 
    }
  Close:
    DoClose();                                                                  //004F : 1B 91 2A 00 00 16 
    FinishInterpolation();                                                      //0055 : 61 2D 16 
    FinishedClosing();                                                          //0058 : 1B C2 2A 00 00 16 
    SetResetStatus(False);                                                      //005E : 1B 6D 2A 00 00 28 16 
    //14 2D 01 E8 5C 78 0F 28 07 25 00 B1 01 60 5D 78 0F 39 3F 25 16 14 2D 01 28 42 78 0F 27 61 00 01 
    //60 5D 78 0F 16 1B A1 2A 00 00 16 61 2D 16 1B A8 2A 00 00 16 07 4E 00 77 01 18 68 78 0F 2A 16 19 
    //01 18 68 78 0F 06 00 00 1B C7 2A 00 00 16 08 1B 91 2A 00 00 16 61 2D 16 1B C2 2A 00 00 16 1B 6D 
    //2A 00 00 28 16 08 0B 0C 6E 2A 00 00 4F 00 00 00 6C 2A 00 00 00 00 00 00 00 00 00 00 FF FF 00 00 
    //47 

  }


  state() LoopMove {

      function BeginState() {
        bOpening = False;                                                       //0000 : 14 2D 01 B0 41 78 0F 28 
        bDelaying = False;                                                      //0008 : 14 2D 01 28 42 78 0F 28 
        //14 2D 01 B0 41 78 0F 28 14 2D 01 28 42 78 0F 28 04 0B 47 
      }


      event KeyFrameReached() {
        //04 0B 47 
      }


      event UnTrigger(Actor Other,Pawn EventInstigator) {
        Disable('UnTrigger');                                                   //0000 : 76 21 33 01 00 00 16 
        Enable('Trigger');                                                      //0007 : 75 21 32 01 00 00 16 
        SavedTrigger = Other;                                                   //000E : 0F 01 18 68 78 0F 00 80 C7 78 0F 
        Instigator = EventInstigator;                                           //0019 : 0F 01 B8 80 6C 0F 00 70 C8 78 0F 
        SBGotoState('LoopMove','Stopping');                                     //0024 : 1B 11 06 00 00 21 C8 2A 00 00 21 EF 2A 00 00 16 
        //76 21 33 01 00 00 16 75 21 32 01 00 00 16 0F 01 18 68 78 0F 00 80 C7 78 0F 0F 01 B8 80 6C 0F 00 
        //70 C8 78 0F 1B 11 06 00 00 21 C8 2A 00 00 21 EF 2A 00 00 16 04 0B 47 
      }


      event Trigger(Actor Other,Pawn EventInstigator) {
        Disable('Trigger');                                                     //0000 : 76 21 32 01 00 00 16 
        Enable('UnTrigger');                                                    //0007 : 75 21 33 01 00 00 16 
        SavedTrigger = Other;                                                   //000E : 0F 01 18 68 78 0F 00 98 C9 78 0F 
        Instigator = EventInstigator;                                           //0019 : 0F 01 B8 80 6C 0F 00 C8 CA 78 0F 
        if (SavedTrigger != None) {                                             //0024 : 07 3E 00 77 01 18 68 78 0F 2A 16 
          SavedTrigger.BeginEvent();                                            //002F : 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 
        }
        bOpening = True;                                                        //003E : 14 2D 01 B0 41 78 0F 27 
        StartSound(1);                                                          //0046 : 1B 85 2A 00 00 24 01 16 
        StartSound(16);                                                         //004E : 1B 85 2A 00 00 24 10 16 
        SBGotoState('LoopMove','Running');                                      //0056 : 1B 11 06 00 00 21 C8 2A 00 00 21 23 26 00 00 16 
        //76 21 32 01 00 00 16 75 21 33 01 00 00 16 0F 01 18 68 78 0F 00 98 C9 78 0F 0F 01 B8 80 6C 0F 00 
        //C8 CA 78 0F 07 3E 00 77 01 18 68 78 0F 2A 16 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 14 2D 
        //01 B0 41 78 0F 27 1B 85 2A 00 00 24 01 16 1B 85 2A 00 00 24 10 16 1B 11 06 00 00 21 C8 2A 00 00 
        //21 23 26 00 00 16 04 0B 47 
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


  Running:
    FinishInterpolation();                                                      //0000 : 61 2D 16 
    InterpolateTo((KeyNum + 1) % NumKeys,MoveTime);                             //0003 : 1B 78 2A 00 00 39 43 AD 39 3C 39 3D 92 39 3A 01 80 34 78 0F 26 16 39 3C 01 E8 35 78 0F 16 01 70 35 78 0F 16 
    SBGotoState('LoopMove','Running');                                          //0027 : 1B 11 06 00 00 21 C8 2A 00 00 21 23 26 00 00 16 
  Stopping:
    FinishInterpolation();                                                      //0037 : 61 2D 16 
    FinishedOpening();                                                          //003A : 1B A8 2A 00 00 16 
    UntriggerEvent(Event,self,Instigator);                                      //0040 : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 01 B8 80 6C 0F 16 
    bOpening = False;                                                           //0051 : 14 2D 01 B0 41 78 0F 28 
    //61 2D 16 1B 78 2A 00 00 39 43 AD 39 3C 39 3D 92 39 3A 01 80 34 78 0F 26 16 39 3C 01 E8 35 78 0F 
    //16 01 70 35 78 0F 16 1B 11 06 00 00 21 C8 2A 00 00 21 23 26 00 00 16 61 2D 16 1B A8 2A 00 00 16 
    //1C 80 AF 34 0F 01 38 9F 6C 0F 17 01 B8 80 6C 0F 16 14 2D 01 B0 41 78 0F 28 08 08 0C EF 2A 00 00 
    //37 00 00 00 23 26 00 00 00 00 00 00 00 00 00 00 FF FF 00 00 47 

  }


  state() TriggerOpenTimed extends OpenTimedMover {

      function EnableTrigger() {
        Enable('Trigger');                                                      //0000 : 75 21 32 01 00 00 16 
        //75 21 32 01 00 00 16 04 0B 47 
      }


      function DisableTrigger() {
        Disable('Trigger');                                                     //0000 : 76 21 32 01 00 00 16 
        //76 21 32 01 00 00 16 04 0B 47 
      }


      function Trigger(Actor Other,Pawn EventInstigator) {
        SavedTrigger = Other;                                                   //0000 : 0F 01 18 68 78 0F 00 78 DB 78 0F 
        Instigator = EventInstigator;                                           //000B : 0F 01 B8 80 6C 0F 00 78 DC 78 0F 
        if (SavedTrigger != None) {                                             //0016 : 07 30 00 77 01 18 68 78 0F 2A 16 
          SavedTrigger.BeginEvent();                                            //0021 : 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 
        }
        SBGotoState('TriggerOpenTimed','Open');                                 //0030 : 1B 11 06 00 00 21 F1 2A 00 00 21 6C 2A 00 00 16 
        //0F 01 18 68 78 0F 00 78 DB 78 0F 0F 01 B8 80 6C 0F 00 78 DC 78 0F 07 30 00 77 01 18 68 78 0F 2A 
        //16 19 01 18 68 78 0F 06 00 00 1B 90 2A 00 00 16 1B 11 06 00 00 21 F1 2A 00 00 21 6C 2A 00 00 16 
        //04 0B 47 
      }


      function bool SelfTriggered() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


    //08 47 

  }


  state() BumpOpenTimed extends OpenTimedMover {

      function EnableTrigger() {
        Enable('Bump');                                                         //0000 : 75 21 3B 01 00 00 16 
        //75 21 3B 01 00 00 16 04 0B 47 
      }


      function DisableTrigger() {
        Disable('Bump');                                                        //0000 : 76 21 3B 01 00 00 16 
        //76 21 3B 01 00 00 16 04 0B 47 
      }


      function Bump(Actor Other) {
        if (BumpType != 2 && Pawn(Other) == None) {                             //0000 : 07 24 00 82 9B 39 3A 01 F0 64 78 0F 39 3A 24 02 16 18 0E 00 72 2E 50 31 D4 00 00 E8 E4 78 0F 2A 16 16 
          return;                                                               //0022 : 04 0B 
        }
        if (BumpType == 0 && !Pawn(Other).IsPlayerPawn()) {                     //0024 : 07 51 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 00 16 18 17 00 81 19 2E 50 31 D4 00 00 E8 E4 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 
          return;                                                               //004F : 04 0B 
        }
        if (BumpType == 1 && Other.Mass < 10) {                                 //0051 : 07 7C 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 01 16 18 15 00 B0 19 00 E8 E4 78 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 0A 16 16 
          return;                                                               //007A : 04 0B 
        }
        Global.Bump(Other);                                                     //007C : 38 3B 01 00 00 00 E8 E4 78 0F 16 
        SavedTrigger = None;                                                    //0087 : 0F 01 18 68 78 0F 2A 
        Instigator = Pawn(Other);                                               //008E : 0F 01 B8 80 6C 0F 2E 50 31 D4 00 00 E8 E4 78 0F 
        Instigator.Controller.WaitForMover(self);                               //009E : 19 19 01 B8 80 6C 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 9A 2A 00 00 17 16 
        SBGotoState('BumpOpenTimed','Open');                                    //00B7 : 1B 11 06 00 00 21 DC 2A 00 00 21 6C 2A 00 00 16 
        //07 24 00 82 9B 39 3A 01 F0 64 78 0F 39 3A 24 02 16 18 0E 00 72 2E 50 31 D4 00 00 E8 E4 78 0F 2A 
        //16 16 04 0B 07 51 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 00 16 18 17 00 81 19 2E 50 31 D4 00 00 
        //E8 E4 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 04 0B 07 7C 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 
        //01 16 18 15 00 B0 19 00 E8 E4 78 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 0A 16 16 04 0B 38 3B 01 00 
        //00 00 E8 E4 78 0F 16 0F 01 18 68 78 0F 2A 0F 01 B8 80 6C 0F 2E 50 31 D4 00 00 E8 E4 78 0F 19 19 
        //01 B8 80 6C 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 9A 2A 00 00 17 16 1B 11 06 00 00 21 DC 2A 00 
        //00 21 6C 2A 00 00 16 04 0B 47 
      }


    //08 47 

  }


  state() StandOpenTimed extends OpenTimedMover {

      function EnableTrigger() {
        Enable('Attach');                                                       //0000 : 75 21 3F 01 00 00 16 
        //75 21 3F 01 00 00 16 04 0B 47 
      }


      function DisableTrigger() {
        Disable('Attach');                                                      //0000 : 76 21 3F 01 00 00 16 
        //76 21 3F 01 00 00 16 04 0B 47 
      }


      function Attach(Actor Other) {
        if (!CanTrigger(Other)) {                                               //0000 : 07 12 00 81 1B E2 2A 00 00 00 60 ED 78 0F 16 16 
          return;                                                               //0010 : 04 0B 
        }
        SavedTrigger = None;                                                    //0012 : 0F 01 18 68 78 0F 2A 
        SBGotoState('StandOpenTimed','Open');                                   //0019 : 1B 11 06 00 00 21 DB 2A 00 00 21 6C 2A 00 00 16 
        //07 12 00 81 1B E2 2A 00 00 00 60 ED 78 0F 16 16 04 0B 0F 01 18 68 78 0F 2A 1B 11 06 00 00 21 DB 
        //2A 00 00 21 6C 2A 00 00 16 04 0B 47 
      }


      function bool CanTrigger(Actor Other) {
        local Pawn P;
        P = Pawn(Other);                                                        //0000 : 0F 00 68 F0 78 0F 2E 50 31 D4 00 00 F0 EE 78 0F 
        if (BumpType != 2 && P == None) {                                       //0010 : 07 2F 00 82 9B 39 3A 01 F0 64 78 0F 39 3A 24 02 16 18 09 00 72 00 68 F0 78 0F 2A 16 16 
          return False;                                                         //002D : 04 28 
        }
        if (BumpType == 0 && !P.IsPlayerPawn()) {                               //002F : 07 57 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 00 16 18 12 00 81 19 00 68 F0 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 
          return False;                                                         //0055 : 04 28 
        }
        if (BumpType == 1 && Other.Mass < 10) {                                 //0057 : 07 82 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 01 16 18 15 00 B0 19 00 F0 EE 78 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 0A 16 16 
          return False;                                                         //0080 : 04 28 
        }
        TriggerEvent(BumpEvent,self,P);                                         //0082 : 1C F8 B1 34 0F 01 68 65 78 0F 17 00 68 F0 78 0F 16 
        return True;                                                            //0093 : 04 27 
        //0F 00 68 F0 78 0F 2E 50 31 D4 00 00 F0 EE 78 0F 07 2F 00 82 9B 39 3A 01 F0 64 78 0F 39 3A 24 02 
        //16 18 09 00 72 00 68 F0 78 0F 2A 16 16 04 28 07 57 00 82 9A 39 3A 01 F0 64 78 0F 39 3A 24 00 16 
        //18 12 00 81 19 00 68 F0 78 0F 06 00 04 1B B9 0C 00 00 16 16 16 04 28 07 82 00 82 9A 39 3A 01 F0 
        //64 78 0F 39 3A 24 01 16 18 15 00 B0 19 00 F0 EE 78 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 0A 16 16 
        //04 28 1C F8 B1 34 0F 01 68 65 78 0F 17 00 68 F0 78 0F 16 04 27 04 0B 47 
      }


      function bool ShouldReTrigger() {
        local int i;
        i = 0;                                                                  //0000 : 0F 00 50 F2 78 0F 25 
        while (i < Attached.Length) {                                           //0007 : 07 37 00 96 00 50 F2 78 0F 37 01 68 9F 6E 0F 16 
          if (CanTrigger(Attached[i])) {                                        //0017 : 07 2D 00 1B E2 2A 00 00 10 00 50 F2 78 0F 01 68 9F 6E 0F 16 
            return True;                                                        //002B : 04 27 
          }
          i++;                                                                  //002D : A5 00 50 F2 78 0F 16 
        }
        return False;                                                           //0037 : 04 28 
        //0F 00 50 F2 78 0F 25 07 37 00 96 00 50 F2 78 0F 37 01 68 9F 6E 0F 16 07 2D 00 1B E2 2A 00 00 10 
        //00 50 F2 78 0F 01 68 9F 6E 0F 16 04 27 A5 00 50 F2 78 0F 16 06 07 00 04 28 04 0B 47 
      }


    //08 47 

  }


  state WasOpenTimedMover {

      function Reset() {
        SetResetStatus(True);                                                   //0000 : 1B 6D 2A 00 00 27 16 
        SBGotoState(Backup_InitialState,'Close');                               //0007 : 1B 11 06 00 00 01 48 55 78 0F 21 6E 2A 00 00 16 
        //1B 6D 2A 00 00 27 16 1B 11 06 00 00 01 48 55 78 0F 21 6E 2A 00 00 16 04 0B 47 
      }


    //08 47 

  }


  state OpenTimedMover {

      function BeginState() {
        EnableTrigger();                                                        //0000 : 1B A9 2A 00 00 16 
        //1B A9 2A 00 00 16 04 0B 47 
      }


      function Reset() {
        SetResetStatus(True);                                                   //0000 : 1B 6D 2A 00 00 27 16 
        SBGotoState(Backup_InitialState,'Close');                               //0007 : 1B 11 06 00 00 01 48 55 78 0F 21 6E 2A 00 00 16 
        //1B 6D 2A 00 00 27 16 1B 11 06 00 00 01 48 55 78 0F 21 6E 2A 00 00 16 04 0B 47 
      }


      function bool ShouldReTrigger() {
        return False;                                                           //0000 : 04 28 
        //04 28 04 0B 47 
      }


  Open:
    if (bTriggerOnceOnly) {                                                     //0000 : 07 10 00 2D 01 70 5C 78 0F 
      Disable('Trigger');                                                       //0009 : 76 21 32 01 00 00 16 
    }
    bClosed = False;                                                            //0010 : 14 2D 01 E8 5C 78 0F 28 
    DisableTrigger();                                                           //0018 : 1B D8 2A 00 00 16 
    if (DelayTime > 0) {                                                        //001E : 07 3B 00 B1 01 60 5D 78 0F 39 3F 25 16 
      bDelaying = True;                                                         //002B : 14 2D 01 28 42 78 0F 27 
      Sleep(DelayTime);                                                         //0033 : 61 00 01 60 5D 78 0F 16 
    }
    DoOpen();                                                                   //003B : 1B A1 2A 00 00 16 
    FinishInterpolation();                                                      //0041 : 61 2D 16 
    FinishedOpening();                                                          //0044 : 1B A8 2A 00 00 16 
    Sleep(StayOpenTime);                                                        //004A : 61 00 01 28 8F 78 0F 16 
    if (bTriggerOnceOnly) {                                                     //0052 : 07 6B 00 2D 01 70 5C 78 0F 
      SBGotoState('WasOpenTimedMover','None');                                  //005B : 1B 11 06 00 00 21 F5 2A 00 00 21 00 00 00 00 16 
    }
  Close:
    DoClose();                                                                  //006B : 1B 91 2A 00 00 16 
    FinishInterpolation();                                                      //0071 : 61 2D 16 
    FinishedClosing();                                                          //0074 : 1B C2 2A 00 00 16 
    EnableTrigger();                                                            //007A : 1B A9 2A 00 00 16 
    if (bResetting) {                                                           //0080 : 07 A1 00 2D 01 B0 CE 78 0F 
      SetResetStatus(False);                                                    //0089 : 1B 6D 2A 00 00 28 16 
      SBGotoState(Backup_InitialState,'None');                                  //0090 : 1B 11 06 00 00 01 48 55 78 0F 21 00 00 00 00 16 
    }
    Sleep(StayOpenTime);                                                        //00A1 : 61 00 01 28 8F 78 0F 16 
    if (ShouldReTrigger()) {                                                    //00A9 : 07 C9 00 1B 3A 2B 00 00 16 
      SavedTrigger = None;                                                      //00B2 : 0F 01 18 68 78 0F 2A 
      SBGotoState('StandOpenTimed','Open');                                     //00B9 : 1B 11 06 00 00 21 DB 2A 00 00 21 6C 2A 00 00 16 
    }
    //07 10 00 2D 01 70 5C 78 0F 76 21 32 01 00 00 16 14 2D 01 E8 5C 78 0F 28 1B D8 2A 00 00 16 07 3B 
    //00 B1 01 60 5D 78 0F 39 3F 25 16 14 2D 01 28 42 78 0F 27 61 00 01 60 5D 78 0F 16 1B A1 2A 00 00 
    //16 61 2D 16 1B A8 2A 00 00 16 61 00 01 28 8F 78 0F 16 07 6B 00 2D 01 70 5C 78 0F 1B 11 06 00 00 
    //21 F5 2A 00 00 21 00 00 00 00 16 1B 91 2A 00 00 16 61 2D 16 1B C2 2A 00 00 16 1B A9 2A 00 00 16 
    //07 A1 00 2D 01 B0 CE 78 0F 1B 6D 2A 00 00 28 16 1B 11 06 00 00 01 48 55 78 0F 21 00 00 00 00 16 
    //08 61 00 01 28 8F 78 0F 16 07 C9 00 1B 3A 2B 00 00 16 0F 01 18 68 78 0F 2A 1B 11 06 00 00 21 DB 
    //2A 00 00 21 6C 2A 00 00 16 08 0B 0C 6E 2A 00 00 6B 00 00 00 6C 2A 00 00 00 00 00 00 00 00 00 00 
    //FF FF 00 00 47 

  }



