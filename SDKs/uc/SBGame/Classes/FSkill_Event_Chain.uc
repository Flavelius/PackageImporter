//==============================================================================
//  FSkill_Event_Chain
//==============================================================================

class FSkill_Event_Chain extends FSkill_Event_Target
    native
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  var (Jump) const int MaxJumps;
  var (Jump) const int TargetsPerJump;
  var (Jump) const int MaxHitsPerTarget;
  var const export editinline FSkill_EffectClass_Range Range;
  var (Jump) const float Interval;
  var (Jump) const float IncreasePerJump;
  var (Jump) const bool FairDistribution;
  var (Jump) const bool TargetsPerJumpIsPerTarget;
  var const export editinline FSkill_Event Event;
  var transient int JumpsLeft;
  var transient float NextJumpTime;
  var transient array<Game_Pawn> JumpSources;
  var transient int EventMode;
  var private const int TargetHitMap;
  var private const int TargetHitSet;



