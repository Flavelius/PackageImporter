//==============================================================================
//  FSkill_EffectClass_DuffFreeze
//==============================================================================

class FSkill_EffectClass_DuffFreeze extends FSkill_EffectClass_Duff
    native
    dependsOn()
  ;

  var (Freeze) const bool Movement;
  var (Freeze) const bool Rotation;
  var (Freeze) const bool Animation;
  var const export editinline FSkill_ValueSpecifier _FreezeValue;



