//==============================================================================
//  FSkill_ValueSpecifier
//==============================================================================

class FSkill_ValueSpecifier extends Content_Type
    native
    exportstructs
    dependsOn()
  ;

  struct TaxonomyIncrease {
      var (TaxonomyIncrease) export editinline NPC_Taxonomy Node;
      var (TaxonomyIncrease) float Increase;

  };


  var (Base) const bool AddConstant;
  var (Base) const bool AddComboLength;
  var (Base) const bool AddCharStatRelated;
  var (Base) const bool AddTargetCountRelated;
  var (Base) const bool DivideValue;
  var (Base) const bool IgnoreFameModifier;
  var (Base) const float AbsoluteMinimum;
  var (Base) const float AbsoluteMaximum;
  var (Base) const float LinkedAttributeModifier;
  var (Constant) const float ConstantMinimum;
  var (Constant) const float ConstantMaximum;
  var (ComboLength) const float ComboLengthMinimum;
  var (ComboLength) const float ComboLengthMaximum;
  var (CharRelated) const byte CharacterStatistic;
  var (CharRelated) const byte Source;
  var (CharRelated) const float CharStatMinimumMultiplier;
  var (CharRelated) const float CharStatMaximumMultiplier;
  var (TargetCountRelated) const float TargetCountMinimumMultiplier;
  var (TargetCountRelated) const float TargetCountMaximumMultiplier;
  var (TargetType) const bool ApplyIncrease;
  var (TargetType) const float SpiritIncrease;
  var (TargetType) const float PlayerIncrease;
  var (TargetType) const float NPCIncrease;
  var (TargetType) const array<TaxonomyIncrease> TaxonomyIncreases;



