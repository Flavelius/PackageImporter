//==============================================================================
//  FSkill_Event_FX
//==============================================================================

class FSkill_Event_FX extends FSkill_Event
    native
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  struct Client_FX {
      var const export editinline FSkill_EffectClass_AudioVisual_Sound Sound;
      var const export editinline FSkill_EffectClass_AudioVisual_CameraShake CameraShake;
      var const export editinline FSkill_EffectClass_AudioVisual_Emitter Emitter;

  };


  struct FX_RunData {
      var bool ExecutedFX;
      var Actor EmitterActor;

  };


  var const Client_FX FX;
  var (FX) const byte EmitterLocation;
  var (FX) const bool ComboFinisherOnlyFX;
  var private transient FX_RunData RunData;



