//==============================================================================
//  FSkill_EffectClass_AudioVisual_ColorModifier
//==============================================================================

class FSkill_EffectClass_AudioVisual_ColorModifier extends FSkill_EffectClass_AudioVisual
    native
    dependsOn()
  ;

  var (ColorModifier) Color MultipliedColor;
  var (ColorModifier) float PulseDuration;
  var (AmbientGlow) bool PulseStartsAtPeak;



