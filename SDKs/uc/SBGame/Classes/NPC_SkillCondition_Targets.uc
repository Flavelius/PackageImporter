//==============================================================================
//  NPC_SkillCondition_Targets
//==============================================================================

class NPC_SkillCondition_Targets extends NPC_SkillCondition_Self
    native
    exportstructs
    dependsOn()
  ;

  enum ETargetContext {
    ETC_AnyFriendlyTarget ,
    ETC_AnyEnemyTarget ,
    ETC_AverageFriendlyTargets ,
    ETC_AverageEnemyTargets 
  };

  var (Misc) bool DistanceCheck;
  var (Misc) bool AliveCheck;
  var (Misc) byte DistanceOperator;
  var (PMC) byte PhysiqueContext;
  var (PMC) byte MoraleContext;
  var (PMC) byte ConcentrationContext;
  var (BMF) byte BodyContext;
  var (BMF) byte MindContext;
  var (BMF) byte FocusContext;
  var (Misc) byte HealthContext;
  var (Misc) byte MovementFrozenContext;
  var (Misc) byte RotationFrozenContext;
  var (Misc) byte DistanceContext;
  var (Misc) float DistanceValue;



