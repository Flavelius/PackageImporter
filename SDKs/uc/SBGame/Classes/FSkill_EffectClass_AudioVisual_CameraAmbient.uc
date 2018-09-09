//==============================================================================
//  FSkill_EffectClass_AudioVisual_CameraAmbient
//==============================================================================

class FSkill_EffectClass_AudioVisual_CameraAmbient extends FSkill_EffectClass_AudioVisual_Camera
    native
    dependsOn()
  ;

  var (CameraAmbient) const float AmbientAmount;
  var (CameraAmbient) const byte AmbientBrightness;
  var (CameraAmbient) const byte AmbientHue;
  var (CameraAmbient) const byte AmbientSaturation;



