//==============================================================================
//  PatrolPoint
//==============================================================================

class PatrolPoint extends AIPoint
    native
    exportstructs
    dependsOn()
  ;

  var (PatrolPoint) bool PausePatrolScript;
  var (PatrolPoint) bool bWalking;
  var (PatrolPoint) float MinimalPathHeight;
  var (Debugging) bool ShowPrecomputedPaths;
  var array<SBPath> PatrolPaths;



