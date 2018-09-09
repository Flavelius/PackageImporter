//==============================================================================
//  FSkill_EffectClass_AudioVisual
//==============================================================================

class FSkill_EffectClass_AudioVisual extends FSkill_EffectClass
    native
    exportstructs
    dependsOn()
  ;

  const INFINITE_EFFECT_DURATION =  -1;
  enum EAVEffectState {
    AVES_Init ,
    AVES_InitialDelay ,
    AVES_Intro ,
    AVES_Running ,
    AVES_Outro ,
    AVES_DeInit 
  };

  struct RunningEffectData {
      var int Handle;
      var int ServerSideHandle;
      var float RunningTime;
      var float StateRunningTime;
      var export editinline FSkill_EffectClass_AudioVisual effect;
      var float InitialDelayDuration;
      var float IntroDuration;
      var float RunningDuration;
      var float OutroDuration;
      var byte EffectState;
      var float ProceduralAmplitude;
      var float SequenceAmplitude;
      var float Amplitude;
      var int Priority;
      var int UserData;
      var int InstanceData;
      var Object InstanceDataObject;
      var bool WantsClientTick;
      var transient int Next;

  };


  var (DefaultTiming) const float InitialDelayDuration;
  var (DefaultTiming) const float IntroDuration;
  var (DefaultTiming) const float OutroDuration;
  var (DefaultTiming) const float RunningDuration;
  var (DefaultPriority) const int Priority;



