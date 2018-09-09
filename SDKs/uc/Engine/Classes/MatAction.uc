//==============================================================================
//  MatAction
//==============================================================================

class MatAction extends MatObject
    native
    abstract
    dependsOn()
  ;

  var (MatAction) InterpolationPoint IntPoint;
  var (MatAction) string Comment;
  var (Time) float Duration;
  var (Sub) export editinline array<MatSubAction> SubActions;
  var (Path) bool bSmoothCorner;
  var (Path) Vector StartControlPoint;
  var (Path) Vector EndControlPoint;
  var (Path) bool bConstantPathVelocity;
  var (Path) float PathVelocity;
  var float PathLength;
  var transient array<Vector> SampleLocations;
  var transient float PctStarting;
  var transient float PctEnding;
  var transient float PctDuration;



