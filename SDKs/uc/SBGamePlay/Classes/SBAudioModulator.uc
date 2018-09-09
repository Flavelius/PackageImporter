//==============================================================================
//  SBAudioModulator
//==============================================================================

class SBAudioModulator extends SBAudioModifier
    native
    dependsOn()
  ;

  const MIN_MOD_DAMP_VARIATION =  0.001f;
  const MIN_MOD_TIME_DELTA =  0.001f;
  enum ESBAudioModulationShape {
    SBModShape_Linear ,
    SBModShape_Sinusoidal 
  };

  var (SBAudioModulator) float ModTime;
  var (SBAudioModulator) float ModTimeDelta;
  var (SBAudioModulator) float ModTimeVariation;
  var (SBAudioModulator) float ModDamping;
  var (SBAudioModulator) float ModDampingVariation;
  var (SBAudioModulator) byte ModShape;
  var transient float ModulationFactor;
  var transient float DampTarget;
  var transient float ModulationTimerStart;
  var transient float ModulationTimerEnd;
  var transient float ModulationHelperFactor;
  var transient float lastUpdateTime;



