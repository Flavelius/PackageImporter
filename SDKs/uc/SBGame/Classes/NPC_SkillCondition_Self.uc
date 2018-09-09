//==============================================================================
//  NPC_SkillCondition_Self
//==============================================================================

class NPC_SkillCondition_Self extends NPC_SkillCondition
    native
    exportstructs
    dependsOn()
  ;

  var (PMC) bool PhysiqueCheck;
  var (PMC) bool MoraleCheck;
  var (PMC) bool ConcentrationCheck;
  var (BMF) bool BodyCheck;
  var (BMF) bool MindCheck;
  var (BMF) bool FocusCheck;
  var (Misc) bool HealthCheck;
  var (Misc) bool MovementFrozenCheck;
  var (Misc) bool RotationFrozenCheck;
  var (Misc) bool MovementFrozenValue;
  var (Misc) bool RotationFrozenValue;
  var (PMC) byte PhysiqueOperator;
  var (PMC) byte MoraleOperator;
  var (PMC) byte ConcentrationOperator;
  var (BMF) byte BodyOperator;
  var (BMF) byte MindOperator;
  var (BMF) byte FocusOperator;
  var (Misc) byte HealthOperator;
  var (PMC) float PhysiqueValue;
  var (PMC) float MoraleValue;
  var (PMC) float ConcentrationValue;
  var (BMF) float BodyValue;
  var (BMF) float MindValue;
  var (BMF) float FocusValue;
  var (Misc) float HealthValue;



