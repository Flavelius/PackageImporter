//==============================================================================
//  Game_Actor
//==============================================================================

class Game_Actor extends Actor
    native
    exportstructs
    dependsOn(Game_Effects,Class,FSkill_EffectClass_AudioVisual)
    Placeable
  ;

  enum CollisionType {
    COL_NoCollision ,
    COL_Colliding ,
    COL_Blocking 
  };

  var private transient int d_relevance_object_vtbl;
  var private transient int d_relevance_object_mRelevanceObjectID;
  var private transient int d_relevance_object_mpRelevance;
  var private transient int d_relevance_object_mBlockIndexX;
  var private transient int d_relevance_object_mBlockIndexY;
  var private transient int d_relevance_object_mVisibilityLevel;
  var private transient int d_relevance_object_mbVisible;
  var private transient int d_relevance_object_mbGM;
  var Vector mNetLocation;
  var Vector mNetRotation;
  var (Game_Actor) bool IsEnabled;
  var (Game_Actor) byte mCollisionType;
  var float mFadeFactor;
  var (Appearance) editinline array<FSkill_EffectClass_AudioVisual> EnabledEffects;
  var (Appearance) editinline array<FSkill_EffectClass_AudioVisual> DisabledEffects;
  var private array<int> RunningEffects;
  var transient Game_Pawn mTargetPawn;
  var export editinline Game_Effects Effects;


  function cl_UpdateEnabledEffects() {
    local int i;
    local int H;
    i = 0;                                                                      //0000 : 0F 00 48 F0 1E 11 25 
    while (i < RunningEffects.Length) {                                         //0007 : 07 4C 00 96 00 48 F0 1E 11 37 01 40 F3 1E 11 16 
      if (RunningEffects[i] != 0) {                                             //0017 : 07 42 00 9B 10 00 48 F0 1E 11 01 40 F3 1E 11 25 16 
        Effects.cl_Stop(RunningEffects[i]);                                     //0028 : 19 01 B8 F3 1E 11 11 00 04 1C D8 65 34 0F 10 00 48 F0 1E 11 01 40 F3 1E 11 16 
      }
      i++;                                                                      //0042 : A5 00 48 F0 1E 11 16 
    }
    RunningEffects.Length = 0;                                                  //004C : 0F 37 01 40 F3 1E 11 25 
    if (IsEnabled) {                                                            //0054 : 07 FB 00 2D 01 30 F4 1E 11 
      i = 0;                                                                    //005D : 0F 00 48 F0 1E 11 25 
      while (i < EnabledEffects.Length) {                                       //0064 : 07 F8 00 96 00 48 F0 1E 11 37 01 A8 F4 1E 11 16 
        if (EnabledEffects[i] != None) {                                        //0074 : 07 EE 00 77 10 00 48 F0 1E 11 01 A8 F4 1E 11 2A 16 
          H = Effects.cl_Start(EnabledEffects[i],Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0085 : 0F 00 20 F5 1E 11 19 01 B8 F3 1E 11 49 00 04 1C 28 65 34 0F 10 00 48 F0 1E 11 01 A8 F4 1E 11 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
          RunningEffects[i] = H;                                                //00DD : 0F 10 00 48 F0 1E 11 01 40 F3 1E 11 00 20 F5 1E 11 
        }
        i++;                                                                    //00EE : A5 00 48 F0 1E 11 16 
      }
    } else {                                                                    //00F8 : 06 B0 01 
      i = 0;                                                                    //00FB : 0F 00 48 F0 1E 11 25 
      while (i < DisabledEffects.Length) {                                      //0102 : 07 96 01 96 00 48 F0 1E 11 37 01 98 F5 1E 11 16 
        if (DisabledEffects[i] != None) {                                       //0112 : 07 8C 01 77 10 00 48 F0 1E 11 01 98 F5 1E 11 2A 16 
          H = Effects.cl_Start(DisabledEffects[i],Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0123 : 0F 00 20 F5 1E 11 19 01 B8 F3 1E 11 49 00 04 1C 28 65 34 0F 10 00 48 F0 1E 11 01 98 F5 1E 11 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
          RunningEffects[i] = H;                                                //017B : 0F 10 00 48 F0 1E 11 01 40 F3 1E 11 00 20 F5 1E 11 
        }
        i++;                                                                    //018C : A5 00 48 F0 1E 11 16 
      }
      Effects.cl_SetInteractionEffect(Class'Game_Effects'.0);                   //0196 : 19 01 B8 F3 1E 11 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 00 16 
    }
    //0F 00 48 F0 1E 11 25 07 4C 00 96 00 48 F0 1E 11 37 01 40 F3 1E 11 16 07 42 00 9B 10 00 48 F0 1E 
    //11 01 40 F3 1E 11 25 16 19 01 B8 F3 1E 11 11 00 04 1C D8 65 34 0F 10 00 48 F0 1E 11 01 40 F3 1E 
    //11 16 A5 00 48 F0 1E 11 16 06 07 00 0F 37 01 40 F3 1E 11 25 07 FB 00 2D 01 30 F4 1E 11 0F 00 48 
    //F0 1E 11 25 07 F8 00 96 00 48 F0 1E 11 37 01 A8 F4 1E 11 16 07 EE 00 77 10 00 48 F0 1E 11 01 A8 
    //F4 1E 11 2A 16 0F 00 20 F5 1E 11 19 01 B8 F3 1E 11 49 00 04 1C 28 65 34 0F 10 00 48 F0 1E 11 01 
    //A8 F4 1E 11 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 
    //12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 0F 10 00 
    //48 F0 1E 11 01 40 F3 1E 11 00 20 F5 1E 11 A5 00 48 F0 1E 11 16 06 64 00 06 B0 01 0F 00 48 F0 1E 
    //11 25 07 96 01 96 00 48 F0 1E 11 37 01 98 F5 1E 11 16 07 8C 01 77 10 00 48 F0 1E 11 01 98 F5 1E 
    //11 2A 16 0F 00 20 F5 1E 11 19 01 B8 F3 1E 11 49 00 04 1C 28 65 34 0F 10 00 48 F0 1E 11 01 98 F5 
    //1E 11 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 
    //10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 0F 10 00 48 F0 
    //1E 11 01 40 F3 1E 11 00 20 F5 1E 11 A5 00 48 F0 1E 11 16 06 02 01 19 01 B8 F3 1E 11 11 00 00 1B 
    //5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 00 16 04 0B 47 
  }


  function cl_SetEnabled(bool Enable) {
    local bool updateeffects;
    updateeffects = IsEnabled != Enable;                                        //0000 : 14 2D 00 A8 F7 1E 11 F3 2D 01 30 F4 1E 11 2D 00 C0 F6 1E 11 16 
    IsEnabled = Enable;                                                         //0015 : 14 2D 01 30 F4 1E 11 2D 00 C0 F6 1E 11 
    if (updateeffects) {                                                        //0022 : 07 31 00 2D 00 A8 F7 1E 11 
      cl_UpdateEnabledEffects();                                                //002B : 1B CF 0C 00 00 16 
    }
    //14 2D 00 A8 F7 1E 11 F3 2D 01 30 F4 1E 11 2D 00 C0 F6 1E 11 16 14 2D 01 30 F4 1E 11 2D 00 C0 F6 
    //1E 11 07 31 00 2D 00 A8 F7 1E 11 1B CF 0C 00 00 16 04 0B 47 
  }


  protected native function sv2clrel_SetEnabled_CallStub();


  private event sv2clrel_SetEnabled(bool Enable) {
    cl_SetEnabled(Enable);                                                      //0000 : 1B DE 0D 00 00 2D 00 80 F9 1E 11 16 
    //1B DE 0D 00 00 2D 00 80 F9 1E 11 16 04 0B 47 
  }


  native function sv_SetEnabled(bool Enable);


  function Show(bool aShowFlag,optional float aTimeToShow) {
    bHidden = !aShowFlag;                                                       //0000 : 14 2D 01 48 5E 6E 0F 81 2D 00 48 FC 1E 11 16 
    //14 2D 01 48 5E 6E 0F 81 2D 00 48 FC 1E 11 16 04 0B 47 
  }


  protected native function sv2clrel_Show_CallStub();


  private event sv2clrel_Show(bool aShowFlag,optional float aFadeTimer) {
    Show(aShowFlag,aFadeTimer);                                                 //0000 : 1B BF 0C 00 00 2D 00 D8 FE 1E 11 00 08 80 2A 11 16 
    //1B BF 0C 00 00 2D 00 D8 FE 1E 11 00 08 80 2A 11 16 04 0B 47 
  }


  function sv_Show(bool aShowFlag,optional float aFadeTimer) {
    sv2clrel_Show_CallStub(aShowFlag,aFadeTimer);                               //0000 : 1B DC 0D 00 00 2D 00 30 81 2A 11 00 A8 81 2A 11 16 
    Show(aShowFlag,aFadeTimer);                                                 //0011 : 1B BF 0C 00 00 2D 00 30 81 2A 11 00 A8 81 2A 11 16 
    //1B DC 0D 00 00 2D 00 30 81 2A 11 00 A8 81 2A 11 16 1B BF 0C 00 00 2D 00 30 81 2A 11 00 A8 81 2A 
    //11 16 04 0B 47 
  }


  private function SetCollisionType(byte aCollisionType) {
    mCollisionType = aCollisionType;                                            //0000 : 0F 01 C8 83 2A 11 00 D0 82 2A 11 
    switch (aCollisionType) {                                                   //000B : 05 01 00 D0 82 2A 11 
      case 0 :                                                                  //0012 : 0A 1F 00 24 00 
        SetCollision(False,False);                                              //0017 : 61 06 28 28 16 
        break;                                                                  //001C : 06 3C 00 
      case 1 :                                                                  //001F : 0A 2C 00 24 01 
        SetCollision(True,False);                                               //0024 : 61 06 27 28 16 
        break;                                                                  //0029 : 06 3C 00 
      case 2 :                                                                  //002C : 0A 39 00 24 02 
        SetCollision(True,True);                                                //0031 : 61 06 27 27 16 
        break;                                                                  //0036 : 06 3C 00 
      default:                                                                  //0039 : 0A FF FF 
    }
    //0F 01 C8 83 2A 11 00 D0 82 2A 11 05 01 00 D0 82 2A 11 0A 1F 00 24 00 61 06 28 28 16 06 3C 00 0A 
    //2C 00 24 01 61 06 27 28 16 06 3C 00 0A 39 00 24 02 61 06 27 27 16 06 3C 00 0A FF FF 04 0B 47 
  }


  protected native function sv2clrel_SetCollisionType_CallStub();


  private event sv2clrel_SetCollisionType(byte aCollisionType) {
    SetCollisionType(aCollisionType);                                           //0000 : 1B 54 0C 00 00 00 F0 85 2A 11 16 
    //1B 54 0C 00 00 00 F0 85 2A 11 16 04 0B 47 
  }


  function sv_SetCollision(bool aBlocking,optional bool aColliding) {
    if (aBlocking) {                                                            //0000 : 07 14 00 2D 00 58 87 2A 11 
      SetCollisionType(2);                                                      //0009 : 1B 54 0C 00 00 24 02 16 
    } else {                                                                    //0011 : 06 30 00 
      if (aColliding) {                                                         //0014 : 07 28 00 2D 00 50 88 2A 11 
        SetCollisionType(1);                                                    //001D : 1B 54 0C 00 00 24 01 16 
      } else {                                                                  //0025 : 06 30 00 
        SetCollisionType(0);                                                    //0028 : 1B 54 0C 00 00 24 00 16 
      }
    }
    sv2clrel_SetCollisionType_CallStub(mCollisionType);                         //0030 : 1B DA 0D 00 00 01 C8 83 2A 11 16 
    //07 14 00 2D 00 58 87 2A 11 1B 54 0C 00 00 24 02 16 06 30 00 07 28 00 2D 00 50 88 2A 11 1B 54 0C 
    //00 00 24 01 16 06 30 00 1B 54 0C 00 00 24 00 16 1B DA 0D 00 00 01 C8 83 2A 11 16 04 0B 47 
  }


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    Super.UnTrigger(Other,EventInstigator);                                     //0000 : 1C 10 45 6D 0F 00 78 89 2A 11 00 48 8A 2A 11 16 
    if (IsServer()) {                                                           //0010 : 07 20 00 1B FF 0B 00 00 16 
      sv_SetEnabled(False);                                                     //0019 : 1B 96 0C 00 00 28 16 
    }
    //1C 10 45 6D 0F 00 78 89 2A 11 00 48 8A 2A 11 16 07 20 00 1B FF 0B 00 00 16 1B 96 0C 00 00 28 16 
    //04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    Super.Trigger(Other,EventInstigator);                                       //0000 : 1C F0 45 6D 0F 00 70 8B 2A 11 00 40 8C 2A 11 16 
    if (IsServer()) {                                                           //0010 : 07 20 00 1B FF 0B 00 00 16 
      sv_SetEnabled(True);                                                      //0019 : 1B 96 0C 00 00 27 16 
    }
    //1C F0 45 6D 0F 00 70 8B 2A 11 00 40 8C 2A 11 16 07 20 00 1B FF 0B 00 00 16 1B 96 0C 00 00 27 16 
    //04 0B 47 
  }


  function PostBeginPlay() {
    Effects = new (self) Class'Game_Effects';                                   //0000 : 0F 01 B8 F3 1E 11 11 17 0B 0B 20 10 43 5F 01 
    if (bBlockActors) {                                                         //000F : 07 23 00 2D 01 F8 97 6C 0F 
      mCollisionType = 2;                                                       //0018 : 0F 01 C8 83 2A 11 24 02 
    } else {                                                                    //0020 : 06 3F 00 
      if (bCollideActors) {                                                     //0023 : 07 37 00 2D 01 08 97 6C 0F 
        mCollisionType = 1;                                                     //002C : 0F 01 C8 83 2A 11 24 01 
      } else {                                                                  //0034 : 06 3F 00 
        mCollisionType = 0;                                                     //0037 : 0F 01 C8 83 2A 11 24 00 
      }
    }
    if (SBRole == 9 || SBRole == 1) {                                           //003F : 07 6D 00 84 9A 39 3A 01 40 B2 6C 0F 39 3A 24 09 16 18 0E 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 16 
      sv_SetEnabled(IsEnabled);                                                 //0061 : 1B 96 0C 00 00 2D 01 30 F4 1E 11 16 
    }
    if (IsClient()) {                                                           //006D : 07 9A 00 1B 1C 0C 00 00 16 
      cl_UpdateEnabledEffects();                                                //0076 : 1B CF 0C 00 00 16 
      SetCollisionType(mCollisionType);                                         //007C : 1B 54 0C 00 00 01 C8 83 2A 11 16 
      Show(!bHidden,0.00000000);                                                //0087 : 1B BF 0C 00 00 81 2D 01 48 5E 6E 0F 16 1E 00 00 00 00 16 
    }
    //0F 01 B8 F3 1E 11 11 17 0B 0B 20 10 43 5F 01 07 23 00 2D 01 F8 97 6C 0F 0F 01 C8 83 2A 11 24 02 
    //06 3F 00 07 37 00 2D 01 08 97 6C 0F 0F 01 C8 83 2A 11 24 01 06 3F 00 0F 01 C8 83 2A 11 24 00 07 
    //6D 00 84 9A 39 3A 01 40 B2 6C 0F 39 3A 24 09 16 18 0E 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
    //16 1B 96 0C 00 00 2D 01 30 F4 1E 11 16 07 9A 00 1B 1C 0C 00 00 16 1B CF 0C 00 00 16 1B 54 0C 00 
    //00 01 C8 83 2A 11 16 1B BF 0C 00 00 81 2D 01 48 5E 6E 0F 16 1E 00 00 00 00 16 04 0B 47 
  }


  event cl_OnTick(float aDeltaTime) {
    if (Effects != None) {                                                      //0000 : 07 1F 00 77 01 B8 F3 1E 11 2A 16 
      Effects.cl_OnTick(aDeltaTime);                                            //000B : 19 01 B8 F3 1E 11 0B 00 00 1B 07 0C 00 00 00 18 8E 2A 11 16 
    }
    //07 1F 00 77 01 B8 F3 1E 11 2A 16 19 01 B8 F3 1E 11 0B 00 00 1B 07 0C 00 00 00 18 8E 2A 11 16 04 
    //0B 47 
  }


  event cl_OnUpdate() {
    Super.cl_OnUpdate();                                                        //0000 : 1C 60 28 6E 0F 16 
    //1C 60 28 6E 0F 16 04 0B 47 
  }


  event cl_OnBaseline() {
    Super.cl_OnBaseline();                                                      //0000 : 1C B8 29 6E 0F 16 
    if (Effects != None) {                                                      //0006 : 07 20 00 77 01 B8 F3 1E 11 2A 16 
      Effects.cl_OnBaseline();                                                  //0011 : 19 01 B8 F3 1E 11 06 00 00 1B 63 07 00 00 16 
    }
    cl_UpdateEnabledEffects();                                                  //0020 : 1B CF 0C 00 00 16 
    SetCollisionType(mCollisionType);                                           //0026 : 1B 54 0C 00 00 01 C8 83 2A 11 16 
    //1C B8 29 6E 0F 16 07 20 00 77 01 B8 F3 1E 11 2A 16 19 01 B8 F3 1E 11 06 00 00 1B 63 07 00 00 16 
    //1B CF 0C 00 00 16 1B 54 0C 00 00 01 C8 83 2A 11 16 04 0B 47 
  }



