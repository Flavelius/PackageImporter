//==============================================================================
//  FSkill_PowerSystem
//==============================================================================

class FSkill_PowerSystem extends Object
    native
    exportstructs
    dependsOn()
    Config(skillpower)
  ;

  struct ConditionFireChance {
      var (ConditionFireChance) float MaxFiresPerSecond;
      var (ConditionFireChance) float MaxFires;
      var (ConditionFireChance) float FireChance_While_Avoiding;
      var (ConditionFireChance) float FireChance_While_Seeking;

  };


  var (targeting) config float NumPartyMembersInFight;
  var (targeting) config float NumPetsInFight;
  var (targeting) config float NumBloodLinksInFight;
  var (targeting) config float CollateralDamagePercentage;
  var (targeting) config float HitChance;
  var (targeting) config float RearHitChance;
  var (targeting) config float NonCombatReadyDamageIncrease;
  var (Stats) config CharacterStatsRecord TriggerPawnCharacterStats;
  var (Stats) config CharacterStatsRecord TargetPawnCharacterStats;
  var (Direct) config float HealPower;
  var (Direct) config float StatePhysiquePower;
  var (Direct) config float StateMoralePower;
  var (Direct) config float StateConcentrationPower;
  var (Direct) config float FrontDamageIncrease;
  var (Direct) config float RearDamageIncrease;
  var (Condition) config ConditionFireChance FireChance_OnHitBy;
  var (Condition) config ConditionFireChance FireChance_OnHitWith;
  var (Condition) config ConditionFireChance FireChance_OnMissWith;
  var (Condition) config ConditionFireChance FireChance_OnSheatheWeapon;
  var (Condition) config ConditionFireChance FireChance_OnDrawWeapon;
  var (Condition) config ConditionFireChance FireChance_OnMove;
  var (Condition) config ConditionFireChance FireChance_OnDeath;
  var (Condition) config ConditionFireChance FireChance_OnUnshift;
  var (Condition) config float FireChance_Melee;
  var (Condition) config float FireChance_Ranged;
  var (Condition) config float FireChance_Magic;
  var (Condition) config float FireChance_Rune;
  var (Condition) config float FireChance_Soul;
  var (Condition) config float FireChance_Spirit;
  var (Condition) config float FireChance_SpecificEffectType;
  var (DuffAffinity) config float SoulAffinityPowerPerSecond;
  var (DuffAffinity) config float RuneAffinityPowerPerSecond;
  var (DuffAffinity) config float SpiritAffinityPowerPerSecond;
  var (DuffAlter) config float AlterEffectAbsolutePowerPerUse;
  var (DuffAlter) config float AlterEffectRelativePowerPerUse;
  var (DuffAlter) config float OutgoingAllEffectsPerSecond;
  var (DuffAlter) config float OutgoingSpecificEffectsPerSecond;
  var (DuffAlter) config float IncomingAllEffectsPerSecond;
  var (DuffAlter) config float IncomingSpecificEffectsPerSecond;
  var (DuffAttribute) config float BodyPowerPerSecond;
  var (DuffAttribute) config float MindPowerPerSecond;
  var (DuffAttribute) config float FocusPowerPerSecond;
  var (DuffDegeneration) config float PhysiqueDegenerationPowerPerSecond;
  var (DuffDegeneration) config float MoraleDegenerationPowerPerSecond;
  var (DuffDegeneration) config float ConcentrationDegenerationPowerPerSecond;
  var (DuffRegeneration) config float PhysiqueRegenerationPowerPerSecond;
  var (DuffRegeneration) config float MoraleRegenerationPowerPerSecond;
  var (DuffRegeneration) config float ConcentrationRegenerationPowerPerSecond;
  var (DuffRegeneration) config float HealthRegenerationPowerPerSecond;
  var (DuffDirectionalDmg) config float DirectionalDamageRearPowerPerSecond;
  var (DuffDirectionalDmg) config float DirectionalDamageFrontPowerPerSecond;
  var (DuffDisableSkillUse) config float DisableAllSkillUsePowerPerSecond;
  var (DuffDisableSkillUse) config float DisableMagicSkillUsePowerPerSecond;
  var (DuffDisableSkillUse) config float DisableMeleeSkillUsePowerPerSecond;
  var (DuffDisableSkillUse) config float DisableRangedSkillUsePowerPerSecond;
  var (DuffDisableSkillUse) config float DisableNoneMagicSkillUsePowerPerSecond;
  var (DuffDisableSkillUse) config float DisableSoulMagicSkillUsePowerPerSecond;
  var (DuffDisableSkillUse) config float DisableRuneMagicSkillUsePowerPerSecond;
  var (DuffDisableSkillUse) config float DisableSpiritMagicSkillUsePowerPerSecond;
  var (DuffImmune) config float ImmuneForAllPowerPerSecond;
  var (DuffImmune) config float ImmuneForMagicPowerPerSecond;
  var (DuffImmune) config float ImmuneForMeleePowerPerSecond;
  var (DuffImmune) config float ImmuneForRangedPowerPerSecond;
  var (DuffImmune) config float ImmuneForNoneMagicPowerPerSecond;
  var (DuffImmune) config float ImmuneForSoulMagicPowerPerSecond;
  var (DuffImmune) config float ImmuneForRuneMagicPowerPerSecond;
  var (DuffImmune) config float ImmuneForSpiritMagicPowerPerSecond;
  var (DuffImmune) config float ImmuneForSpecificEffectPowerPerSecond;
  var (DuffMaxHealth) config float MaxHealthPowerPerSecond;
  var (DuffPePRank) config float PePRankPowerPerSecond;
  var (DuffResistance) config float AttackTypeMeleeResistancePowerPerSecond;
  var (DuffResistance) config float AttackTypeRangedResistancePowerPerSecond;
  var (DuffResistance) config float AttackTypeMagicResistancePowerPerSecond;
  var (DuffResistance) config float AttackTypeAllResistancePowerPerSecond;



