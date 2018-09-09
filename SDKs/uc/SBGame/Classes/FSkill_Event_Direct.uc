//==============================================================================
//  FSkill_Event_Direct
//==============================================================================

class FSkill_Event_Direct extends FSkill_Event_Target
    native
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  var (Timing) const int RepeatCount;
  var (Timing) const float Interval;
  var (Timing) const bool KeepTargets;
  var (Timing) const int TargetsPerRepeat;
  var const export editinline FSkill_EffectClass_Range Range;
  var const export editinline FSkill_EffectClass_DirectDamage Damage;
  var const export editinline FSkill_EffectClass_DirectHeal Heal;
  var const export editinline FSkill_EffectClass_DirectState _State[3];
  var const export editinline FSkill_EffectClass_DirectDrain Drain;
  var const export editinline FSkill_Event_Duff Buff[4];
  var const export editinline FSkill_Event_Duff Debuff[4];
  var const export editinline FSkill_EffectClass_DirectTeleport Teleport;
  var const export editinline FSkill_EffectClass_DirectFireBodySlot FireBodySlot;
  var const export editinline FSkill_EffectClass_DirectShapeShift ShapeShift;
  var (Damage) const float DamageMoraleBonus;
  var (Sound) const bool PlayHurtSound;
  var (HitFx) const bool RepeatTargetFX;
  var const export editinline FSkill_Event_FX MissFXEvent;
  var const export editinline FSkill_Event_FX HitFXEvent;
  var private transient bool LeaveTargetsBe;
  var private transient int ActualRepeatCount;
  var private transient int ActualTargetCount;
  var private transient float NextDirectEventTime;
  var transient array<Game_Pawn> Targets;
  var private transient bool FirstExecute;
  var private transient Vector DetachedRangePosition;



