//==============================================================================
//  AIStateMachine
//==============================================================================

class AIStateMachine extends AIState
    native
    dependsOn()
    Config(charstats)
  ;

  var AIState mCurrentState;
  var AIState mAbortedState;
  var AIState mNextState;
  var bool mDebugging;


  native event byte StateSignal(byte signal);



