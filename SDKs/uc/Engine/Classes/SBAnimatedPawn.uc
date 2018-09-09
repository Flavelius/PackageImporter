//==============================================================================
//  SBAnimatedPawn
//==============================================================================

class SBAnimatedPawn extends Pawn
    native
    dependsOn(Trigger,NavigationPoint)
    Config(User)
  ;

  enum SBAnimationType {
    SBAnimType_None ,
    SBAnimType_Idle ,
    SBAnimType_Emote ,
    SBAnimType_Movement ,
    SBAnimType_LightWound ,
    SBAnimType_Action ,
    SBAnimType_SpecialAction ,
    SBAnimType_HeavyWound ,
    SBAnimType_Death ,
    SBAnimType_AlwaysPlayed ,
    SBAnimType_Turning ,
    SBAnimType_Emerging 
  };

  enum EPawnSound {
    EPS_Command_Enemies ,
    EPS_Command_GetReady ,
    EPS_Command_Charge ,
    EPS_Command_Attack ,
    EPS_Command_Retreat ,
    EPS_Command_Follow ,
    EPS_Command_Wait ,
    EPS_Command_ComeOn ,
    EPS_Command_Assistance ,
    EPS_Command_OverHere ,
    EPS_Command_BackOff ,
    EPS_Command_North ,
    EPS_Command_East ,
    EPS_Command_West ,
    EPS_Command_South ,
    EPS_Command_Flank ,
    EPS_Command_GoRound ,
    EPS_Action ,
    EPS_CriticalWound ,
    EPS_Death ,
    EPS_Interaction_No ,
    EPS_Interaction_Yes ,
    EPS_Interaction_Greet ,
    EPS_Interaction_Bye ,
    EPS_Interaction_Thanks ,
    EPS_Interaction_PwnieQues ,
    EPS_Interaction_PwnieExcl ,
    EPS_Interaction_Trade ,
    EPS_Interaction_Excuse ,
    EPS_Interaction_Wait ,
    EPS_Interaction_Veto ,
    EPS_Interaction_Sarcasm ,
    EPS_Interaction_Hey ,
    EPS_Interaction_Oldskool ,
    EPS_Interaction_Outfit ,
    EPS_Interaction_FashionPolice ,
    EPS_Interaction_Jazz ,
    EPS_Sound_Clap ,
    EPS_Sound_Kiss ,
    EPS_Sound_Sigh ,
    EPS_Sound_Bored ,
    EPS_Sound_Pain ,
    EPS_Sound_Pst ,
    EPS_Sound_Angry ,
    EPS_Sound_Cry ,
    EPS_Sound_Maniacal ,
    EPS_Sound_Laugh ,
    EPS_Sound_Cough ,
    EPS_Sound_Cheer ,
    EPS_Sound_WhistleHappy ,
    EPS_Sound_WhistleAttention ,
    EPS_Sound_WhistleMusic ,
    EPS_Sound_WhistleNote ,
    EPS_Sound_Ahh ,
    EPS_Sound_Gasp ,
    EPS_Sound_Stretch ,
    EPS_Sound_Huf ,
    EPS_Sound_Bah ,
    EPS_Sound_Dismiss ,
    EPS_Taunt_Oracle ,
    EPS_Taunt_Battle ,
    EPS_Taunt_Praise ,
    EPS_Taunt_Mock ,
    EPS_Taunt_Attention ,
    EPS_Taunt_Death ,
    EPS_Taunt_Stop ,
    EPS_Taunt_AdmireRoom ,
    EPS_Taunt_Victory ,
    EPS_Taunt_Survive ,
    EPS_Taunt_Again ,
    EPS_Taunt_Try ,
    EPS_Taunt_LetsGo ,
    EPS_Taunt_RTFM ,
    EPS_Taunt_Unique ,
    EPS_Wound ,
    EPS_Goodbye ,
    EPS_Greet ,
    EPS_Thanks ,
    EPS_Yay ,
    EPS_Weee ,
    EPS_NONE 
  };

  struct SBAttachmentInfo {
      var (SBAttachmentInfo) string AttachmentName;
      var (SBAttachmentInfo) string meshName;
      var (SBAttachmentInfo) name AttachmentBoneTag;
      var (SBAttachmentInfo) Vector ScaleFactor;
      var (SBAttachmentInfo) Rotator Orientation;
      var (SBAttachmentInfo) Vector PosOffset;
      var (SBAttachmentInfo) bool IgnoreParentRotation;

  };


  struct SBAnimationParameters {
      var float BlendFactor;
      var float BlendInTime;
      var float BlendOutTime;
      var float AnimSpeed;
      var float StartFrame;
      var bool Looped;
      var bool Reversed;

  };


  struct SBAnimationStackEntry {
      var name AnimationName;
      var array<int> ActionFlags;
      var byte directionFlag;
      var byte WeaponFlag;
      var byte VariationNumber;
      var SBAnimationParameters AnimParameters;
      var bool OverrideSequenceAnimTypes;
      var bool IgnoreNotifies;

  };


  struct SBAnimationTypeStack {
      var byte AnimType;
      var array<SBAnimationStackEntry> AnimationStack;

  };


  struct SBDirectionFlagSet {
      var int directionFlag;
      var float directionBlendFactor;

  };


  var private transient array<SBAttachmentInfo> Attachments;
  var private transient array<SBDirectionFlagSet> animDirectionSet;
  var private array<SBAnimationTypeStack> AnimTypeStacks;
  var private transient int xMovement;
  var private transient int yMovement;
  var private transient int zMovement;
  var private transient int oldXMovement;
  var private transient int oldYMovement;
  var private transient int oldZMovement;
  var private transient bool bSittingOnChair;
  var transient bool bAnimationPaused;
  var transient bool bPreviouslyRunning;


  native function RemoveAllAttachments();


  native function InitializeAttachmentModel(string attachmentType,string boneTag,Object MeshObject);


  native function PauseAnim(bool pause,optional byte AnimType);


  native function PlayAnimType(name animName,byte AnimType,float Rate,float TweenTime,bool loop,bool keepLastFrame);


  native function ClearAnimsByType(byte animationTypeId,float blendOutRate);


  native function ClearPawnAnims();


  function ClearAnims() {
    ClearPawnAnims();                                                           //0000 : 1B A3 0C 00 00 16 
    //1B A3 0C 00 00 16 04 0B 47 
  }


  native function bool AnimationFlagsActive(array<int> ActionFlags,optional int directionFlag,optional int WeaponFlag,optional int varNumber);


  native function bool AnimationPlaying(name AnimationName);


  native function FadeInQueuedAnimations(float FadeInTime,optional bool keepLastFrame);


  native function PlayQueuedAnimations(bool forceOverwrite,bool keepLastFrame,optional bool alowImmediateCull);


  native function QueueAnimation(array<int> ActionFlags,int variationNr,float AnimSpeed,float BlendInTime,float BlendOutTime,bool isLooping,optional coerce int AnimationType);


  native function Vector GetMovementDirectionVector();


  native function float GetAnimationDuration(array<int> ActionFlags,int variationNr,float AnimSpeed);


  event OnSheatheWeapon(byte WeaponFlag);


  event OnDrawWeapon(byte WeaponFlag);


  function PlayTopLevelAnim(name animName,float Rate,float TweenTime,bool loop,bool keepLastFrame) {
    PlayAnimType(animName,9,Rate,TweenTime,loop,keepLastFrame);                 //0000 : 1B C2 2B 00 00 00 38 FE 83 0F 24 09 00 10 FF 83 0F 00 88 FF 83 0F 2D 00 08 00 84 0F 2D 00 80 00 84 0F 16 
    //1B C2 2B 00 00 00 38 FE 83 0F 24 09 00 10 FF 83 0F 00 88 FF 83 0F 2D 00 08 00 84 0F 2D 00 80 00 
    //84 0F 16 04 0B 47 
  }


  event byte GetEquippedWeaponFlag() {
    return 0;                                                                   //0000 : 04 24 00 
    //04 24 00 04 0B 47 
  }


  function sv_HackDamageActions(float aDamageFactor);


  event FreezeRotation(bool aFreezeFlag);


  event FreezeMovement(bool aFreezeFlag);


  function ExecuteDeath(Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    local Controller Killer;
    if (DamageType.default.bCausedByWorld
      && (instigatedBy == None || instigatedBy == self)
      && LastHitBy != None) {//0000 : 07 47 00 82 82 12 00 B0 08 84 0F 06 00 04 2D 02 60 CE 74 0F 18 16 00 84 72 00 08 07 84 0F 2A 16 18 09 00 72 00 08 07 84 0F 17 16 16 16 18 09 00 77 01 D8 CE 74 0F 2A 16 16 
      Killer = LastHitBy;                                                       //0039 : 0F 00 30 09 84 0F 01 D8 CE 74 0F 
    } else {                                                                    //0044 : 06 67 00 
      if (instigatedBy != None) {                                               //0047 : 07 67 00 77 00 08 07 84 0F 2A 16 
        Killer = instigatedBy.GetKillerController();                            //0052 : 0F 00 30 09 84 0F 19 00 08 07 84 0F 06 00 04 1B 5E 2B 00 00 16 
      }
    }
    if (Killer == None
      && DamageType.default.bDelayedDamage) {            //0067 : 07 91 00 82 72 00 30 09 84 0F 2A 16 18 10 00 12 00 B0 08 84 0F 06 00 04 2D 02 90 CB 74 0F 16 
      Killer = DelayedDamageInstigatorController;                               //0086 : 0F 00 30 09 84 0F 01 D8 C4 74 0F 
    }
    if (bPhysicsAnimUpdate) {                                                   //0091 : 07 A5 00 2D 01 20 66 6C 0F 
      TearOffMomentum = Momentum;                                               //009A : 0F 01 98 74 6C 0F 00 A8 09 84 0F 
    }
    Died(Killer,DamageType,HitLocation);                                        //00A5 : 1B 13 0F 00 00 00 30 09 84 0F 00 B0 08 84 0F 00 20 0A 84 0F 16 
    //07 47 00 82 82 12 00 B0 08 84 0F 06 00 04 2D 02 60 CE 74 0F 18 16 00 84 72 00 08 07 84 0F 2A 16 
    //18 09 00 72 00 08 07 84 0F 17 16 16 16 18 09 00 77 01 D8 CE 74 0F 2A 16 16 0F 00 30 09 84 0F 01 
    //D8 CE 74 0F 06 67 00 07 67 00 77 00 08 07 84 0F 2A 16 0F 00 30 09 84 0F 19 00 08 07 84 0F 06 00 
    //04 1B 5E 2B 00 00 16 07 91 00 82 72 00 30 09 84 0F 2A 16 18 10 00 12 00 B0 08 84 0F 06 00 04 2D 
    //02 90 CB 74 0F 16 0F 00 30 09 84 0F 01 D8 C4 74 0F 07 A5 00 2D 01 20 66 6C 0F 0F 01 98 74 6C 0F 
    //00 A8 09 84 0F 1B 13 0F 00 00 00 30 09 84 0F 00 B0 08 84 0F 00 20 0A 84 0F 16 04 0B 47 
  }


  function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    local int actualDamage;
    if (Damage <= 0) {                                                          //0000 : 07 0D 00 98 00 48 0B 84 0F 25 16 
      return;                                                                   //000B : 04 0B 
    }
    if (DamageType == Class'Crushed') {                                         //000D : 07 1E 00 72 00 C0 0B 84 0F 20 18 FD 78 0F 16 
      return;                                                                   //001C : 04 0B 
    }
    if (DamageType == None) {                                                   //001E : 07 68 00 72 00 C0 0B 84 0F 2A 16 
      if (instigatedBy != None) {                                               //0029 : 07 5D 00 77 00 40 0C 84 0F 2A 16 
        Warn("No damagetype for damage by " $ string(instigatedBy));            //0034 : E8 70 1F 4E 6F 20 64 61 6D 61 67 65 74 79 70 65 20 66 6F 72 20 64 61 6D 61 67 65 20 62 79 20 00 39 56 00 40 0C 84 0F 16 16 
      }
      DamageType = Class'DamageType';                                           //005D : 0F 00 C0 0B 84 0F 20 18 44 C2 00 
    }
    if (SBRole != 1) {                                                          //0068 : 07 7A 00 9B 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
      return;                                                                   //0078 : 04 0B 
    }
    if (GetHealth() <= 0) {                                                     //007A : 07 8A 00 B2 1B 12 10 00 00 16 39 3F 25 16 
      return;                                                                   //0088 : 04 0B 
    }
    if ((instigatedBy == None
      || instigatedBy.Controller == None)
      && DamageType.default.bDelayedDamage
      && DelayedDamageInstigatorController != None) {//008A : 07 E0 00 82 82 84 72 00 40 0C 84 0F 2A 16 18 12 00 72 19 00 40 0C 84 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 10 00 12 00 C0 0B 84 0F 06 00 04 2D 02 90 CB 74 0F 16 18 09 00 77 01 D8 C4 74 0F 2A 16 16 
      instigatedBy = DelayedDamageInstigatorController.Pawn;                    //00CC : 0F 00 40 0C 84 0F 19 01 D8 C4 74 0F 05 00 04 01 88 83 6C 0F 
    }
    if (Physics == 1
      && DamageType.default.bExtraMomentumZ) {             //00E0 : 07 29 01 82 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 10 00 12 00 C0 0B 84 0F 06 00 04 2D 02 08 CC 74 0F 16 
      Momentum.Z = FMax(Momentum.Z,0.40000001 * VSize(Momentum));               //0104 : 0F 36 38 C5 69 0F 00 B8 0C 84 0F F5 36 38 C5 69 0F 00 B8 0C 84 0F AB 1E CD CC CC 3E E1 00 B8 0C 84 0F 16 16 16 
    }
    if (instigatedBy == self) {                                                 //0129 : 07 40 01 72 00 40 0C 84 0F 17 16 
      Momentum *= 0.60000002;                                                   //0134 : DD 00 B8 0C 84 0F 1E 9A 99 19 3F 16 
    }
    Momentum = Momentum / Mass;                                                 //0140 : 0F 00 B8 0C 84 0F D6 00 B8 0C 84 0F 01 A0 E6 6E 0F 16 
    actualDamage = Damage;                                                      //0152 : 0F 00 30 0D 84 0F 00 48 0B 84 0F 
    IncreaseHealth(-actualDamage);                                              //015D : 1B 31 10 00 00 39 3F 8F 00 30 0D 84 0F 16 16 
    if (HitLocation == vect(0.000000, 0.000000, 0.000000)) {                    //016C : 07 8E 01 D9 00 A8 0D 84 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      HitLocation = Location;                                                   //0183 : 0F 00 A8 0D 84 0F 01 30 81 6C 0F 
    }
    if (GetHealth() <= 0) {                                                     //018E : 07 B9 01 B2 1B 12 10 00 00 16 39 3F 25 16 
      ExecuteDeath(instigatedBy,HitLocation,Momentum,DamageType);               //019C : 1B B6 2B 00 00 00 40 0C 84 0F 00 A8 0D 84 0F 00 B8 0C 84 0F 00 C0 0B 84 0F 16 
    } else {                                                                    //01B6 : 06 30 02 
      AddVelocity(Momentum);                                                    //01B9 : 1B 68 2B 00 00 00 B8 0C 84 0F 16 
      if (Controller != None) {                                                 //01C4 : 07 F7 01 77 01 00 6E 6C 0F 2A 16 
        Controller.NotifyTakeHit(instigatedBy,HitLocation,actualDamage,DamageType,Momentum);//01CF : 19 01 00 6E 6C 0F 1F 00 00 1B AC 2B 00 00 00 40 0C 84 0F 00 A8 0D 84 0F 00 30 0D 84 0F 00 C0 0B 84 0F 00 B8 0C 84 0F 16 
      }
      if (instigatedBy != None && instigatedBy != self) {                       //01F7 : 07 23 02 82 77 00 40 0C 84 0F 2A 16 18 09 00 77 00 40 0C 84 0F 17 16 16 
        LastHitBy = instigatedBy.Controller;                                    //020F : 0F 01 D8 CE 74 0F 19 00 40 0C 84 0F 05 00 04 01 00 6E 6C 0F 
      }
      sv_HackDamageActions(actualDamage);                                       //0223 : 1B BA 2B 00 00 39 3F 00 30 0D 84 0F 16 
    }
    MakeNoise(1.00000000);                                                      //0230 : 62 00 1E 00 00 80 3F 16 
    //07 0D 00 98 00 48 0B 84 0F 25 16 04 0B 07 1E 00 72 00 C0 0B 84 0F 20 18 FD 78 0F 16 04 0B 07 68 
    //00 72 00 C0 0B 84 0F 2A 16 07 5D 00 77 00 40 0C 84 0F 2A 16 E8 70 1F 4E 6F 20 64 61 6D 61 67 65 
    //74 79 70 65 20 66 6F 72 20 64 61 6D 61 67 65 20 62 79 20 00 39 56 00 40 0C 84 0F 16 16 0F 00 C0 
    //0B 84 0F 20 18 44 C2 00 07 7A 00 9B 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 04 0B 07 8A 00 B2 1B 12 
    //10 00 00 16 39 3F 25 16 04 0B 07 E0 00 82 82 84 72 00 40 0C 84 0F 2A 16 18 12 00 72 19 00 40 0C 
    //84 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 18 10 00 12 00 C0 0B 84 0F 06 00 04 2D 02 90 CB 74 0F 16 
    //18 09 00 77 01 D8 C4 74 0F 2A 16 16 0F 00 40 0C 84 0F 19 01 D8 C4 74 0F 05 00 04 01 88 83 6C 0F 
    //07 29 01 82 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 10 00 12 00 C0 0B 84 0F 06 00 04 2D 02 08 
    //CC 74 0F 16 0F 36 38 C5 69 0F 00 B8 0C 84 0F F5 36 38 C5 69 0F 00 B8 0C 84 0F AB 1E CD CC CC 3E 
    //E1 00 B8 0C 84 0F 16 16 16 07 40 01 72 00 40 0C 84 0F 17 16 DD 00 B8 0C 84 0F 1E 9A 99 19 3F 16 
    //0F 00 B8 0C 84 0F D6 00 B8 0C 84 0F 01 A0 E6 6E 0F 16 0F 00 30 0D 84 0F 00 48 0B 84 0F 1B 31 10 
    //00 00 39 3F 8F 00 30 0D 84 0F 16 16 07 8E 01 D9 00 A8 0D 84 0F 23 00 00 00 00 00 00 00 00 00 00 
    //00 00 16 0F 00 A8 0D 84 0F 01 30 81 6C 0F 07 B9 01 B2 1B 12 10 00 00 16 39 3F 25 16 1B B6 2B 00 
    //00 00 40 0C 84 0F 00 A8 0D 84 0F 00 B8 0C 84 0F 00 C0 0B 84 0F 16 06 30 02 1B 68 2B 00 00 00 B8 
    //0C 84 0F 16 07 F7 01 77 01 00 6E 6C 0F 2A 16 19 01 00 6E 6C 0F 1F 00 00 1B AC 2B 00 00 00 40 0C 
    //84 0F 00 A8 0D 84 0F 00 30 0D 84 0F 00 C0 0B 84 0F 00 B8 0C 84 0F 16 07 23 02 82 77 00 40 0C 84 
    //0F 2A 16 18 09 00 77 00 40 0C 84 0F 17 16 16 0F 01 D8 CE 74 0F 19 00 40 0C 84 0F 05 00 04 01 00 
    //6E 6C 0F 1B BA 2B 00 00 39 3F 00 30 0D 84 0F 16 62 00 1E 00 00 80 3F 16 04 0B 47 
  }


  function Died(Controller Killer,class<DamageType> DamageType,Vector HitLocation) {
    local Trigger t;
    local NavigationPoint N;
    if (bDeleteMe || Level.bLevelChange
      || GetGameInfo() == None) {       //0000 : 07 2D 00 84 84 2D 01 58 92 6C 0F 18 10 00 19 01 D8 7E 6C 0F 06 00 04 2D 01 B0 36 71 0F 16 18 0A 00 72 1C 38 E1 6C 0F 16 2A 16 16 
      return;                                                                   //002B : 04 0B 
    }
    if (DamageType.default.bCausedByWorld
      && (Killer == None || Killer == Controller)
      && LastHitBy != None) {//002D : 07 75 00 82 82 12 00 10 0F 84 0F 06 00 04 2D 02 60 CE 74 0F 18 1A 00 84 72 00 98 0E 84 0F 2A 16 18 0D 00 72 00 98 0E 84 0F 01 00 6E 6C 0F 16 16 16 18 09 00 77 01 D8 CE 74 0F 2A 16 16 
      Killer = LastHitBy;                                                       //006A : 0F 00 98 0E 84 0F 01 D8 CE 74 0F 
    }
    SetHealth(Min(0,GetHealth()));                                              //0075 : 1B AC 0F 00 00 39 3F F9 25 39 44 1B 12 10 00 00 16 16 16 
    if (Controller != None) {                                                   //0088 : 07 AA 00 77 01 00 6E 6C 0F 2A 16 
      Controller.WasKilledBy(Killer);                                           //0093 : 19 01 00 6E 6C 0F 0B 00 00 1B 12 2C 00 00 00 98 0E 84 0F 16 
      goto jl00AA;                                                              //00A7 : 06 AA 00 
    }
    if (Killer != None) {                                                       //00AA : 07 D2 00 77 00 98 0E 84 0F 2A 16 
      TriggerEvent(Event,self,Killer.Pawn);                                     //00B5 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 19 00 98 0E 84 0F 05 00 04 01 88 83 6C 0F 16 
    } else {                                                                    //00CF : 06 DF 00 
      TriggerEvent(Event,self,None);                                            //00D2 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2A 16 
    }
    if (IsPlayerPawn() || WasPlayerPawn()) {                                    //00DF : 07 59 01 84 1B B9 0C 00 00 16 18 07 00 1B 70 2B 00 00 16 16 
      PhysicsVolume.PlayerPawnDiedInVolume(self);                               //00F3 : 19 01 38 94 6C 0F 07 00 00 1B B9 2B 00 00 17 16 
      foreach TouchingActors(Class'Trigger',t) {                                //0103 : 2F 61 33 20 98 0F C2 00 00 90 0F 84 0F 16 24 01 
        t.PlayerToucherDied(self);                                              //0113 : 19 00 90 0F 84 0F 07 00 00 1B F6 2A 00 00 17 16 
      }
      foreach TouchingActors(Class'NavigationPoint',N) {                        //0125 : 2F 61 33 20 D8 D5 C1 00 00 08 10 84 0F 16 58 01 
        if (N.bReceivePlayerToucherDiedNotify) {                                //0135 : 07 57 01 19 00 08 10 84 0F 06 00 04 2D 01 D8 F3 79 0F 
          N.PlayerToucherDied(self);                                            //0147 : 19 00 08 10 84 0F 07 00 00 1B F6 2A 00 00 17 16 
        }
      }
    }
    Velocity.Z *= 1.29999995;                                                   //0159 : B6 36 38 C5 69 0F 01 A0 95 6C 0F 1E 66 66 A6 3F 16 
    if (IsHumanControlled()) {                                                  //016A : 07 8A 01 1B A7 2A 00 00 16 
      PlayerController(Controller).ForceDeathUpdate();                          //0173 : 19 2E 58 34 C2 00 01 00 6E 6C 0F 06 00 00 1B 38 2C 00 00 16 
    } else {                                                                    //0187 : 06 9A 01 
      PlayDying(DamageType,HitLocation);                                        //018A : 1B 95 2B 00 00 00 10 0F 84 0F 00 80 10 84 0F 16 
    }
    //07 2D 00 84 84 2D 01 58 92 6C 0F 18 10 00 19 01 D8 7E 6C 0F 06 00 04 2D 01 B0 36 71 0F 16 18 0A 
    //00 72 1C 38 E1 6C 0F 16 2A 16 16 04 0B 07 75 00 82 82 12 00 10 0F 84 0F 06 00 04 2D 02 60 CE 74 
    //0F 18 1A 00 84 72 00 98 0E 84 0F 2A 16 18 0D 00 72 00 98 0E 84 0F 01 00 6E 6C 0F 16 16 16 18 09 
    //00 77 01 D8 CE 74 0F 2A 16 16 0F 00 98 0E 84 0F 01 D8 CE 74 0F 1B AC 0F 00 00 39 3F F9 25 39 44 
    //1B 12 10 00 00 16 16 16 07 AA 00 77 01 00 6E 6C 0F 2A 16 19 01 00 6E 6C 0F 0B 00 00 1B 12 2C 00 
    //00 00 98 0E 84 0F 16 06 AA 00 07 D2 00 77 00 98 0E 84 0F 2A 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 
    //19 00 98 0E 84 0F 05 00 04 01 88 83 6C 0F 16 06 DF 00 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2A 16 07 
    //59 01 84 1B B9 0C 00 00 16 18 07 00 1B 70 2B 00 00 16 16 19 01 38 94 6C 0F 07 00 00 1B B9 2B 00 
    //00 17 16 2F 61 33 20 98 0F C2 00 00 90 0F 84 0F 16 24 01 19 00 90 0F 84 0F 07 00 00 1B F6 2A 00 
    //00 17 16 31 30 2F 61 33 20 D8 D5 C1 00 00 08 10 84 0F 16 58 01 07 57 01 19 00 08 10 84 0F 06 00 
    //04 2D 01 D8 F3 79 0F 19 00 08 10 84 0F 07 00 00 1B F6 2A 00 00 17 16 31 30 B6 36 38 C5 69 0F 01 
    //A0 95 6C 0F 1E 66 66 A6 3F 16 07 8A 01 1B A7 2A 00 00 16 19 2E 58 34 C2 00 01 00 6E 6C 0F 06 00 
    //00 1B 38 2C 00 00 16 06 9A 01 1B 95 2B 00 00 00 10 0F 84 0F 00 80 10 84 0F 16 04 0B 47 
  }



