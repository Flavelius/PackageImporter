//==============================================================================
//  ReachSpec
//==============================================================================

class ReachSpec extends Object
    native
    dependsOn()
  ;

  var int Distance;
  var const NavigationPoint Start;
  var const NavigationPoint End;
  var int CollisionRadius;
  var int CollisionHeight;
  var int reachFlags;
  var int MaxLandingVelocity;
  var byte bPruned;
  var bool bForced;



