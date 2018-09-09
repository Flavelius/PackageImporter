//==============================================================================
//  NPC_AttackSheet_ClassBased
//==============================================================================

class NPC_AttackSheet_ClassBased extends NPC_AttackSheet
    native
    exportstructs
    editinlinenew
    dependsOn()
  ;

  struct SkillWeight {
      var (SkillWeight) float Weight;
      var (SkillWeight) byte Tag;

  };


  var (HealPhase) float HealthFraction;
  var (TargetPhase) float WarriorPriority;
  var (TargetPhase) float CasterPriority;
  var (TargetPhase) float RoguePriority;
  var (TargetPhase) float FriendlyPriority;
  var (TargetPhase) float SocialAggroPriority;
  var (TargetPhase) float ThreatMultiplier;
  var (TargetPhase) float LoveMultiplier;
  var (TargetPhase) float LowLevelPriority;
  var (TargetPhase) float HighLevelPriority;
  var (TargetPhase) float PlayerPriority;
  var (SkillPhase) float RangePriority;
  var (SkillPhase) array<SkillWeight> WarriorPreferences;
  var (SkillPhase) array<SkillWeight> RoguePreferences;
  var (SkillPhase) array<SkillWeight> CasterPreferences;



