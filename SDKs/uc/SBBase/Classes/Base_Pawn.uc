//==============================================================================
//  Base_Pawn
//==============================================================================

class Base_Pawn extends SBAnimatedPawn
    native
    dependsOn()
    Config(User)
  ;

  const IDEAL_JUMP_SPEED_FOR_ANIM =  350.f;
  var private transient int d_relevance_object_vtbl;
  var private transient int d_relevance_object_mRelevanceObjectID;
  var private transient int d_relevance_object_mpRelevance;
  var private transient int d_relevance_object_mBlockIndexX;
  var private transient int d_relevance_object_mBlockIndexY;
  var private transient int d_relevance_object_mVisibilityLevel;
  var private transient int d_relevance_object_mbVisible;
  var private transient int d_relevance_object_mbGM;
  var private transient int mFramer;
  var private transient bool bIsFalling;
  var private float mTimeToFall;
  var private transient float mFallTimer;


  event bool StandUp() {
    if (Physics == 19 || Physics == 20) {                                       //0000 : 07 47 00 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 
      Velocity = vect(0.000000, 0.000000, 0.000000);                            //0022 : 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
      Acceleration = Velocity;                                                  //0035 : 0F 01 18 96 6C 0F 01 A0 95 6C 0F 
      SetPhysics(1);                                                            //0040 : 6F 82 24 01 16 
      return True;                                                              //0045 : 04 27 
    }
    return False;                                                               //0047 : 04 28 
    //07 47 00 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 14 
    //16 16 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 01 18 96 6C 0F 01 A0 95 6C 0F 
    //6F 82 24 01 16 04 27 04 28 04 0B 47 
  }


  event bool SitDown(optional bool aOnChairFlag) {
    if (Physics == 1) {                                                         //0000 : 07 46 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 
      Velocity = vect(0.000000, 0.000000, 0.000000);                            //0010 : 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
      Acceleration = Velocity;                                                  //0023 : 0F 01 18 96 6C 0F 01 A0 95 6C 0F 
      if (aOnChairFlag) {                                                       //002E : 07 3F 00 2D 00 C8 47 84 0F 
        SetPhysics(20);                                                         //0037 : 6F 82 24 14 16 
      } else {                                                                  //003C : 06 44 00 
        SetPhysics(19);                                                         //003F : 6F 82 24 13 16 
      }
      return True;                                                              //0044 : 04 27 
    }
    return False;                                                               //0046 : 04 28 
    //07 46 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 
    //00 00 00 0F 01 18 96 6C 0F 01 A0 95 6C 0F 07 3F 00 2D 00 C8 47 84 0F 6F 82 24 14 16 06 44 00 6F 
    //82 24 13 16 04 27 04 28 04 0B 47 
  }


  event Landed(Vector aHitNormal) {
    ResetFallTimer();                                                           //0000 : 1B F1 3E 00 00 16 
    //1B F1 3E 00 00 16 04 0B 47 
  }


  native function PlayJumpTakeoff();


  native function PlayHitAnim(float aHitFactor);


  protected native function sv2clrel_QueueAnimation_CallStub();


  event sv2clrel_QueueAnimation(byte flag1,byte flag2,byte flag3,byte variation,optional bool isLooping) {
    local array<int> flags;
    flags.Length = 3;                                                           //0000 : 0F 37 00 E8 4E 84 0F 2C 03 
    flags[0] = flag1;                                                           //0009 : 0F 10 25 00 E8 4E 84 0F 39 3A 00 B8 4D 84 0F 
    flags[1] = flag2;                                                           //0018 : 0F 10 26 00 E8 4E 84 0F 39 3A 00 60 4F 84 0F 
    flags[2] = flag3;                                                           //0027 : 0F 10 2C 02 00 E8 4E 84 0F 39 3A 00 D8 4F 84 0F 
    QueueAnimation(flags,variation,1.00000000,0.20000000,0.20000000,isLooping); //0037 : 1B 0A 0F 00 00 00 E8 4E 84 0F 39 3A 00 50 50 84 0F 1E 00 00 80 3F 1E CD CC 4C 3E 1E CD CC 4C 3E 2D 00 C8 50 84 0F 16 
    PlayQueuedAnimations(True,False);                                           //005E : 1B 09 0F 00 00 27 28 16 
    //0F 37 00 E8 4E 84 0F 2C 03 0F 10 25 00 E8 4E 84 0F 39 3A 00 B8 4D 84 0F 0F 10 26 00 E8 4E 84 0F 
    //39 3A 00 60 4F 84 0F 0F 10 2C 02 00 E8 4E 84 0F 39 3A 00 D8 4F 84 0F 1B 0A 0F 00 00 00 E8 4E 84 
    //0F 39 3A 00 50 50 84 0F 1E 00 00 80 3F 1E CD CC 4C 3E 1E CD CC 4C 3E 2D 00 C8 50 84 0F 16 1B 09 
    //0F 00 00 27 28 16 04 0B 47 
  }


  function sv_ForwardAnimation(byte flag1,byte flag2,byte flag3,byte variation,optional bool isLooping) {
    sv2clrel_QueueAnimation_CallStub(flag1,flag2,flag3,variation,isLooping);    //0000 : 1B F0 3E 00 00 00 68 52 84 0F 00 38 53 84 0F 00 B0 53 84 0F 00 28 54 84 0F 2D 00 A0 54 84 0F 16 
    //1B F0 3E 00 00 00 68 52 84 0F 00 38 53 84 0F 00 B0 53 84 0F 00 28 54 84 0F 2D 00 A0 54 84 0F 16 
    //04 0B 47 
  }


  function sv_HackDamageActions(float aDamageFactor) {
    sv2clrel_DamageActions_CallStub(aDamageFactor);                             //0000 : 1B F6 3E 00 00 00 C8 55 84 0F 16 
    //1B F6 3E 00 00 00 C8 55 84 0F 16 04 0B 47 
  }


  protected native function sv2clrel_DamageActions_CallStub();


  event sv2clrel_DamageActions(float aDamageFactor) {
    PlayHitAnim(aDamageFactor);                                                 //0000 : 1B F4 3E 00 00 00 E0 57 84 0F 16 
    //1B F4 3E 00 00 00 E0 57 84 0F 16 04 0B 47 
  }


  native function ResetFallTimer();


  native function PlayIdle(optional bool aForce);


  native function PlaySubmergeAnim();


  native function PlayEmergeAnim();


  native function PlayStandAnim(bool aOnChairFlag);


  native function PlaySitAnim(bool aOnChairFlag);


  native function PlayEmote(int emoteNr,float AnimSpeed);


  native function PlayDrawWeaponAnim(int WeaponFlag,optional bool combatState);


  native function PlaySheatheWeaponAnim(int WeaponFlag,optional bool combatState);


  native function PlayDeathAnim(Vector damageDirection);


  exec function Emote(int emoteNr,optional float AnimSpeed) {
    if (AnimSpeed < 0.20000000) {                                               //0000 : 07 1A 00 B0 00 68 67 84 0F 1E CD CC 4C 3E 16 
      AnimSpeed = 0.20000000;                                                   //000F : 0F 00 68 67 84 0F 1E CD CC 4C 3E 
    }
    PlayEmote(emoteNr,AnimSpeed);                                               //001A : 1B F3 3E 00 00 00 F0 66 84 0F 00 68 67 84 0F 16 
    //07 1A 00 B0 00 68 67 84 0F 1E CD CC 4C 3E 16 0F 00 68 67 84 0F 1E CD CC 4C 3E 1B F3 3E 00 00 00 
    //F0 66 84 0F 00 68 67 84 0F 16 04 0B 47 
  }


  event bool IsInCombat() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  native function bool sv_CanReplicate();


  protected native function sv2cl_GotoState_CallStub();


  event sv2cl_GotoState(string aState) {
    GotoState(name(aState));                                                    //0000 : 71 39 5A 00 F0 6B 84 0F 16 
    //71 39 5A 00 F0 6B 84 0F 16 04 0B 47 
  }


  native event int GetWorldID();


  native event int GetUniverseID();


  event cl_OnBaseline();


  final native event sv_OnSpawn(Base_Controller aController);


  event cl_OnFrame(float delta);


  native event cl_OnTick(float delta);


  native event cl_OnShutdown();


  native event cl_OnInit();


  final native event sv_OnShutdown();


  final native event sv_OnInit();



