//==============================================================================
//  FSkill_Event_FX_Advanced
//==============================================================================

class FSkill_Event_FX_Advanced extends FSkill_Event_FX
    native
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  struct AdvancedEmitter {
      var export editinline FSkill_EffectClass_AudioVisual_Emitter Emitter;
      var (AdvancedEmitter) float Delay;
      var (AdvancedEmitter) byte Location;

  };


  var (FX) const editconst array<AdvancedEmitter> Emitters;
  var private transient array<FX_RunData> AdvRunData;
  var private int EmittersLeftToStart;



