//==============================================================================
//  FSkill_EffectClass_DuffDisableSkillUse
//==============================================================================

class FSkill_EffectClass_DuffDisableSkillUse extends FSkill_EffectClass_Duff
    native
    dependsOn()
  ;

  var (DisableSkillUse) const byte ByAttackType;
  var (DisableSkillUse) const byte ByMagicType;
  var const export editinline FSkill_ValueSpecifier _DisableSkillUseValue;


  final native function bool MatchDisableSkillUse(byte aAttackType,byte aMagicType);



