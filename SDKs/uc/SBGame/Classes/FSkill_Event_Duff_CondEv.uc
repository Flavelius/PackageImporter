//==============================================================================
//  FSkill_Event_Duff_CondEv
//==============================================================================

class FSkill_Event_Duff_CondEv extends Object
    native
    dependsOn()
  ;

  var (CondEv) const export editinline FSkill_Event Event;
  var (CondEv) const int Uses;
  var (CondEv) const int MaximumTriggersPerUse;
  var (CondEv) const float Interval;
  var (CondEv) const float Delay;
  var (CondEv) const float IncreasePerUse;
  var (CondEv) const byte Condition;
  var (CondEv) const byte AttackType;
  var (CondEv) const byte MagicType;
  var (CondEv) const byte EffectType;
  var (CondEv) const byte Target;
  var transient bool Running;



