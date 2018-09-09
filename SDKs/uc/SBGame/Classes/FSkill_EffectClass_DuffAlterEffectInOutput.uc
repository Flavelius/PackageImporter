//==============================================================================
//  FSkill_EffectClass_DuffAlterEffectInOutput
//==============================================================================

class FSkill_EffectClass_DuffAlterEffectInOutput extends FSkill_EffectClass_Duff
    native
    dependsOn()
  ;

  var (AlterEffect) const byte Mode;
  var (AlterEffect) const byte AttackType;
  var (AlterEffect) const byte MagicType;
  var (AlterEffect) const byte EffectType;
  var (AlterEffect) const export editinline FSkill_ValueSpecifier Value;
  var (AlterEffect) const byte ValueMode;
  var (Uses) const float UseInterval;
  var (Uses) const int Uses;
  var (Uses) const float IncreasePerUse;
  var const export editinline FSkill_ValueSpecifier _AlterEffectValue;


  final native function float AlterEffect(float aSkillValue,float aStoredValue,int aNumUses);


  final native function bool MatchEffect(byte aMode,byte aAttackType,byte aMagicType,byte aEffectType);



