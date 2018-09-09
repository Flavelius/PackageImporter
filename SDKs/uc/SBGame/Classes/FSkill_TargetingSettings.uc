//==============================================================================
//  FSkill_TargetingSettings
//==============================================================================

class FSkill_TargetingSettings extends Object
    native
    dependsOn()
    Config(targeting)
  ;

  var (FSkill_TargetingSettings) config float MaxFOV;
  var (FSkill_TargetingSettings) config float DistanceWeight;
  var (FSkill_TargetingSettings) config bool AllowPreferredTarget;



