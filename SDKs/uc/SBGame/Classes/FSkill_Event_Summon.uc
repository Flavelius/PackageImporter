//==============================================================================
//  FSkill_Event_Summon
//==============================================================================

class FSkill_Event_Summon extends FSkill_Event_FX
    native
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  var const export editinline FSkill_EffectClass_AudioVisual_Emitter SummonEmitter;
  var (Pet) const export editinline NPC_Type NPC;
  var bool SpawnedPet;



