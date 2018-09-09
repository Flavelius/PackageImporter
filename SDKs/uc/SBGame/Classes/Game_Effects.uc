//==============================================================================
//  Game_Effects
//==============================================================================

class Game_Effects extends Base_Component within Actor
    native
    exportstructs
    dependsOn(SBDBSync,FSkill_EffectClass_AudioVisual)
    Config(User)
  ;

  const MAX_NUM_REPLICATED_EFFECTS =  5;
  const USE_VALUE_FROM_START =  -1073741824;
  const USE_VALUE_FROM_EFFECT_CLASS =  -1073741824;
  enum ETargetInteractionEffect {
    TIE_None ,
    TIE_Selected 
  };

  enum EInteractionEffect {
    IE_None ,
    IE_Hover ,
    IE_Selected 
  };

  struct mTaggedEffect {
      var int ServerSideEffectHandle;
      var name Tag;

  };


  var globalconfig bool PulsatingSelection;
  var array<int> mReplicatedEffects;
  var private array<mTaggedEffect> mTaggedEffects;
  var private int mCurrentInteractionEffectHandle;
  var private export editinline FSkill_EffectClass_AudioVisual mSelectionGlowEffectClass;
  var private export editinline FSkill_EffectClass_AudioVisual mSelectionPulsatingGlowEffectClass;
  var private byte mCurrentInteractionEffect;
  var private byte mWantedInteractionEffect;
  var private int mCurrentTargetInteractionEffectHandle;
  var private export editinline FSkill_EffectClass_AudioVisual mTargetGlowEffectClass;
  var private byte mCurrentTargetInteractionEffect;
  var private byte mWantedTargetInteractionEffect;
  var private int mEffectQueueHack1;
  var private int mEffectQueueHack2;
  var private int mEffectQueueHack3;


  private final native function bool cl_StopReplicated(int aServerSideEffectHandle,optional float anOutroDuration);


  protected native function sv2clrel_StopReplicated_CallStub();


  private final event sv2clrel_StopReplicated(int ServerSideHandle) {
    cl_StopReplicated(ServerSideHandle);                                        //0000 : 1C 88 D9 20 11 00 10 DE 20 11 16 
    //1C 88 D9 20 11 00 10 DE 20 11 16 04 0B 47 
  }


  protected native function sv2clrel_StartReplicated_CallStub();


  private final event sv2clrel_StartReplicated(int effectResourceID,int ServerSideHandle) {
    local export editinline FSkill_EffectClass_AudioVisual effectResource;
    effectResource = FSkill_EffectClass_AudioVisual(Class'SBDBSync'.GetResourceObject(effectResourceID));//0000 : 0F 00 38 E1 20 11 2E 80 8F 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 28 E0 20 11 16 
    cl_Start(effectResource,-1073741824,-1073741824.00000000,-1073741824.00000000,-1073741824.00000000,-1073741824.00000000,1.00000000,ServerSideHandle,0);//001F : 1C 28 65 34 0F 00 38 E1 20 11 1D 00 00 00 C0 1E 00 00 80 CE 1E 00 00 80 CE 1E 00 00 80 CE 1E 00 00 80 CE 1E 00 00 80 3F 00 B0 E1 20 11 25 16 
    //0F 00 38 E1 20 11 2E 80 8F 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 28 E0 20 11 16 1C 
    //28 65 34 0F 00 38 E1 20 11 1D 00 00 00 C0 1E 00 00 80 CE 1E 00 00 80 CE 1E 00 00 80 CE 1E 00 00 
    //80 CE 1E 00 00 80 3F 00 B0 E1 20 11 25 16 04 0B 47 
  }


  private final native function int sv_GetNewEffectHandle();


  function cl_SetTargetInteractionEffect(byte aTargetInteractionEffect) {
    mWantedTargetInteractionEffect = aTargetInteractionEffect;                  //0000 : 0F 01 E8 E4 20 11 00 30 E4 20 11 
    //0F 01 E8 E4 20 11 00 30 E4 20 11 04 0B 47 
  }


  function cl_SetInteractionEffect(byte aInteractionEffect) {
    mWantedInteractionEffect = aInteractionEffect;                              //0000 : 0F 01 C8 E6 20 11 00 10 E6 20 11 
    //0F 01 C8 E6 20 11 00 10 E6 20 11 04 0B 47 
  }


  final event bool sv_StopReplicated(int aServerSideEffectHandle) {
    local int i;
    if (aServerSideEffectHandle != 0) {                                         //0000 : 07 B1 00 9B 00 40 E8 20 11 25 16 
      i = 0;                                                                    //000B : 0F 00 D8 E9 20 11 25 
      while (i < mReplicatedEffects.Length / 2) {                               //0012 : 07 AC 00 96 00 D8 E9 20 11 91 37 01 50 EA 20 11 2C 02 16 16 
        if (mReplicatedEffects[2 * i + 1] == aServerSideEffectHandle) {         //0026 : 07 A2 00 9A 10 92 90 2C 02 00 D8 E9 20 11 16 26 16 01 50 EA 20 11 00 40 E8 20 11 16 
          mReplicatedEffects[2 * i] = mReplicatedEffects[mReplicatedEffects.Length - 2];//0042 : 0F 10 90 2C 02 00 D8 E9 20 11 16 01 50 EA 20 11 10 93 37 01 50 EA 20 11 2C 02 16 01 50 EA 20 11 
          mReplicatedEffects[2 * i + 1] = mReplicatedEffects[mReplicatedEffects.Length - 1];//0062 : 0F 10 92 90 2C 02 00 D8 E9 20 11 16 26 16 01 50 EA 20 11 10 93 37 01 50 EA 20 11 26 16 01 50 EA 20 11 
          mReplicatedEffects.Length = mReplicatedEffects.Length - 2;            //0084 : 0F 37 01 50 EA 20 11 93 37 01 50 EA 20 11 2C 02 16 
          sv2clrel_StopReplicated_CallStub(aServerSideEffectHandle);            //0095 : 1B 55 0F 00 00 00 40 E8 20 11 16 
          return True;                                                          //00A0 : 04 27 
        }
        i++;                                                                    //00A2 : A5 00 D8 E9 20 11 16 
      }
      return False;                                                             //00AC : 04 28 
      goto jl00B1;                                                              //00AE : 06 B1 00 
    }
    //07 B1 00 9B 00 40 E8 20 11 25 16 0F 00 D8 E9 20 11 25 07 AC 00 96 00 D8 E9 20 11 91 37 01 50 EA 
    //20 11 2C 02 16 16 07 A2 00 9A 10 92 90 2C 02 00 D8 E9 20 11 16 26 16 01 50 EA 20 11 00 40 E8 20 
    //11 16 0F 10 90 2C 02 00 D8 E9 20 11 16 01 50 EA 20 11 10 93 37 01 50 EA 20 11 2C 02 16 01 50 EA 
    //20 11 0F 10 92 90 2C 02 00 D8 E9 20 11 16 26 16 01 50 EA 20 11 10 93 37 01 50 EA 20 11 26 16 01 
    //50 EA 20 11 0F 37 01 50 EA 20 11 93 37 01 50 EA 20 11 2C 02 16 1B 55 0F 00 00 00 40 E8 20 11 16 
    //04 27 A5 00 D8 E9 20 11 16 06 12 00 04 28 06 B1 00 04 0B 47 
  }


  final event int sv_StartReplicated(export editinline FSkill_EffectClass_AudioVisual anEffect) {
    local int Handle;
    if (mReplicatedEffects.Length != 2 * 5) {                                   //0000 : 07 94 00 9B 37 01 50 EA 20 11 90 2C 02 2C 05 16 16 
      if (anEffect != None) {                                                   //0011 : 07 8F 00 77 00 F0 EB 20 11 2A 16 
        Handle = sv_GetNewEffectHandle();                                       //001C : 0F 00 68 EC 20 11 1C 78 DF 20 11 16 
        mReplicatedEffects.Length = mReplicatedEffects.Length + 2;              //0028 : 0F 37 01 50 EA 20 11 92 37 01 50 EA 20 11 2C 02 16 
        mReplicatedEffects[mReplicatedEffects.Length - 2] = anEffect.ResourceId;//0039 : 0F 10 93 37 01 50 EA 20 11 2C 02 16 01 50 EA 20 11 19 00 F0 EB 20 11 05 00 04 01 58 92 20 11 
        mReplicatedEffects[mReplicatedEffects.Length - 1] = Handle;             //0058 : 0F 10 93 37 01 50 EA 20 11 26 16 01 50 EA 20 11 00 68 EC 20 11 
        sv2clrel_StartReplicated_CallStub(anEffect.ResourceId,Handle);          //006D : 1B 1D 0D 00 00 19 00 F0 EB 20 11 05 00 04 01 58 92 20 11 00 68 EC 20 11 16 
        return Handle;                                                          //0086 : 04 00 68 EC 20 11 
      } else {                                                                  //008C : 06 91 00 
        return 0;                                                               //008F : 04 25 
      }
    } else {                                                                    //0091 : 06 96 00 
      return 0;                                                                 //0094 : 04 25 
    }
    //07 94 00 9B 37 01 50 EA 20 11 90 2C 02 2C 05 16 16 07 8F 00 77 00 F0 EB 20 11 2A 16 0F 00 68 EC 
    //20 11 1C 78 DF 20 11 16 0F 37 01 50 EA 20 11 92 37 01 50 EA 20 11 2C 02 16 0F 10 93 37 01 50 EA 
    //20 11 2C 02 16 01 50 EA 20 11 19 00 F0 EB 20 11 05 00 04 01 58 92 20 11 0F 10 93 37 01 50 EA 20 
    //11 26 16 01 50 EA 20 11 00 68 EC 20 11 1B 1D 0D 00 00 19 00 F0 EB 20 11 05 00 04 01 58 92 20 11 
    //00 68 EC 20 11 16 04 00 68 EC 20 11 06 91 00 04 25 06 96 00 04 25 04 0B 47 
  }


  final event int sv_StartReplicatedOneShot(export editinline FSkill_EffectClass_AudioVisual anEffect) {
    local int Handle;
    if (anEffect != None) {                                                     //0000 : 07 39 00 77 00 08 EE 20 11 2A 16 
      Handle = sv_GetNewEffectHandle();                                         //000B : 0F 00 00 EF 20 11 1C 78 DF 20 11 16 
      sv2clrel_StartReplicated_CallStub(anEffect.ResourceId,Handle);            //0017 : 1B 1D 0D 00 00 19 00 08 EE 20 11 05 00 04 01 58 92 20 11 00 00 EF 20 11 16 
      return Handle;                                                            //0030 : 04 00 00 EF 20 11 
    } else {                                                                    //0036 : 06 3B 00 
      return 0;                                                                 //0039 : 04 25 
    }
    //07 39 00 77 00 08 EE 20 11 2A 16 0F 00 00 EF 20 11 1C 78 DF 20 11 16 1B 1D 0D 00 00 19 00 08 EE 
    //20 11 05 00 04 01 58 92 20 11 00 00 EF 20 11 16 04 00 00 EF 20 11 06 3B 00 04 25 04 0B 47 
  }


  final function int sv_StopTagged(name aTag) {
    local int Count;
    local int i;
    Count = 0;                                                                  //0000 : 0F 00 F0 F1 20 11 25 
    i = 0;                                                                      //0007 : 0F 00 68 F2 20 11 25 
    while (i < mTaggedEffects.Length) {                                         //000E : 07 75 00 96 00 68 F2 20 11 37 01 E0 F2 20 11 16 
      if (mTaggedEffects[i].Tag == aTag) {                                      //001E : 07 6B 00 FE 36 58 F3 20 11 10 00 68 F2 20 11 01 E0 F2 20 11 00 A0 F0 20 11 16 
        if (sv_StopReplicated(mTaggedEffects[i].ServerSideEffectHandle)) {      //0038 : 07 58 00 1C 60 E5 20 11 36 D0 F3 20 11 10 00 68 F2 20 11 01 E0 F2 20 11 16 
          Count++;                                                              //0051 : A5 00 F0 F1 20 11 16 
        }
        mTaggedEffects.Remove(i,1);                                             //0058 : 41 01 E0 F2 20 11 00 68 F2 20 11 26 
        i--;                                                                    //0064 : A6 00 68 F2 20 11 16 
      }
      i++;                                                                      //006B : A5 00 68 F2 20 11 16 
    }
    return Count;                                                               //0075 : 04 00 F0 F1 20 11 
    //0F 00 F0 F1 20 11 25 0F 00 68 F2 20 11 25 07 75 00 96 00 68 F2 20 11 37 01 E0 F2 20 11 16 07 6B 
    //00 FE 36 58 F3 20 11 10 00 68 F2 20 11 01 E0 F2 20 11 00 A0 F0 20 11 16 07 58 00 1C 60 E5 20 11 
    //36 D0 F3 20 11 10 00 68 F2 20 11 01 E0 F2 20 11 16 A5 00 F0 F1 20 11 16 41 01 E0 F2 20 11 00 68 
    //F2 20 11 26 A6 00 68 F2 20 11 16 A5 00 68 F2 20 11 16 06 0E 00 04 00 F0 F1 20 11 04 0B 47 
  }


  final function bool sv_StartTagged(export editinline FSkill_EffectClass_AudioVisual anEffect,name aTag) {
    local int Handle;
    if (aTag != 'None') {                                                       //0000 : 07 6E 00 FF 00 E8 F5 20 11 21 00 00 00 00 16 
      Handle = sv_StartReplicated(anEffect);                                    //000F : 0F 00 60 F6 20 11 1C 90 E7 20 11 00 70 F5 20 11 16 
      if (Handle > 0) {                                                         //0020 : 07 6E 00 97 00 60 F6 20 11 25 16 
        mTaggedEffects.Insert(mTaggedEffects.Length,1);                         //002B : 40 01 E0 F2 20 11 37 01 E0 F2 20 11 26 
        mTaggedEffects[mTaggedEffects.Length - 1].ServerSideEffectHandle = Handle;//0038 : 0F 36 D0 F3 20 11 10 93 37 01 E0 F2 20 11 26 16 01 E0 F2 20 11 00 60 F6 20 11 
        mTaggedEffects[mTaggedEffects.Length - 1].Tag = aTag;                   //0052 : 0F 36 58 F3 20 11 10 93 37 01 E0 F2 20 11 26 16 01 E0 F2 20 11 00 E8 F5 20 11 
        return True;                                                            //006C : 04 27 
      }
    }
    return False;                                                               //006E : 04 28 
    //07 6E 00 FF 00 E8 F5 20 11 21 00 00 00 00 16 0F 00 60 F6 20 11 1C 90 E7 20 11 00 70 F5 20 11 16 
    //07 6E 00 97 00 60 F6 20 11 25 16 40 01 E0 F2 20 11 37 01 E0 F2 20 11 26 0F 36 D0 F3 20 11 10 93 
    //37 01 E0 F2 20 11 26 16 01 E0 F2 20 11 00 60 F6 20 11 0F 36 58 F3 20 11 10 93 37 01 E0 F2 20 11 
    //26 16 01 E0 F2 20 11 00 E8 F5 20 11 04 27 04 28 04 0B 47 
  }


  final native function cl_StopAll();


  final native function bool cl_Stop(int aClientSideEffectHandle,optional float anOutroDuration);


  final native function int cl_Start(export editinline FSkill_EffectClass_AudioVisual anEffect,optional int aPriority,optional float aDelay,optional float anIntroDuration,optional float aDuration,optional float anOutroDuration,optional float aProceduralAmplitude,optional int aServerSideHandle,optional int aUserdata);


  native function cl_OnTick(float aDeltaTime);


  event cl_OnBaseline() {
    local export editinline FSkill_EffectClass_AudioVisual effectResource;
    local int ResourceId;
    local int ServerSideHandle;
    local int i;
    i = 0;                                                                      //0000 : 0F 00 C0 00 21 11 25 
    while (i < mReplicatedEffects.Length / 2) {                                 //0007 : 07 A0 00 96 00 C0 00 21 11 91 37 01 50 EA 20 11 2C 02 16 16 
      ResourceId = mReplicatedEffects[i * 2];                                   //001B : 0F 00 38 01 21 11 10 90 00 C0 00 21 11 2C 02 16 01 50 EA 20 11 
      ServerSideHandle = mReplicatedEffects[i * 2 + 1];                         //0030 : 0F 00 B0 01 21 11 10 92 90 00 C0 00 21 11 2C 02 16 26 16 01 50 EA 20 11 
      effectResource = FSkill_EffectClass_AudioVisual(Class'SBDBSync'.GetResourceObject(ResourceId));//0048 : 0F 00 48 00 21 11 2E 80 8F 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 38 01 21 11 16 
      cl_Start(effectResource,-1073741824,0.00000000,0.00000000,-1073741824.00000000,-1073741824.00000000,1.00000000,ServerSideHandle,0);//0067 : 1C 28 65 34 0F 00 48 00 21 11 1D 00 00 00 C0 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 CE 1E 00 00 80 CE 1E 00 00 80 3F 00 B0 01 21 11 25 16 
      i++;                                                                      //0096 : A5 00 C0 00 21 11 16 
    }
    //0F 00 C0 00 21 11 25 07 A0 00 96 00 C0 00 21 11 91 37 01 50 EA 20 11 2C 02 16 16 0F 00 38 01 21 
    //11 10 90 00 C0 00 21 11 2C 02 16 01 50 EA 20 11 0F 00 B0 01 21 11 10 92 90 00 C0 00 21 11 2C 02 
    //16 26 16 01 50 EA 20 11 0F 00 48 00 21 11 2E 80 8F 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 
    //00 00 38 01 21 11 16 1C 28 65 34 0F 00 48 00 21 11 1D 00 00 00 C0 1E 00 00 00 00 1E 00 00 00 00 
    //1E 00 00 80 CE 1E 00 00 80 CE 1E 00 00 80 3F 00 B0 01 21 11 25 16 A5 00 C0 00 21 11 16 06 07 00 
    //04 0B 47 
  }



