//==============================================================================
//  AIFightState
//==============================================================================

class AIFightState extends AIState
    native
    abstract
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  var byte mTerminatingState;
  var string mDebugInfo;
  var string mOldDebugInfo;
  var string mDebugAction;
  var string mDebugSignal;



