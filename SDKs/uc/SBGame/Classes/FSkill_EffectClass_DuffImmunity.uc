//==============================================================================
//  FSkill_EffectClass_DuffImmunity
//==============================================================================

class FSkill_EffectClass_DuffImmunity extends FSkill_EffectClass_Duff
    native
    dependsOn()
  ;

  var (Immunity) const byte ByAttackType;
  var (Immunity) const byte ByMagicType;
  var (Immunity) const byte ByEffectType;
  var (SharingFX) const export editinline FSkill_EffectClass_AudioVisual_Emitter SourceFX;
  var const export editinline FSkill_ValueSpecifier _ImmunityValue;


  final native function bool MatchImmunity(byte aAttackType,byte aMagicType,byte aEffectType);



