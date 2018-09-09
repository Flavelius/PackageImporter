//==============================================================================
//  NPC_AttackSheet_ConditionBased
//==============================================================================

class NPC_AttackSheet_ConditionBased extends NPC_AttackSheet
    native
    exportstructs
    editinlinenew
    dependsOn()
  ;

  struct SkillContext {
      var (SkillContext) export editinline FSkill_Type Skill;
      var (SkillContext) export editinline NPC_SkillCondition Condition;

  };


  var (Contexts) array<SkillContext> SkillContexts;



