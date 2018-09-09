//==============================================================================
//  SBInfluenceCapsule
//==============================================================================

class SBInfluenceCapsule extends SBInfluenceVolume
    native
    dependsOn()
    Placeable
  ;

  var (SBInfluenceCapsule) float MaximumRadius;
  var (SBInfluenceCapsule) float AxisLength;
  var (SBInfluenceCapsule) float HotspotFactor;
  var transient float HsRadiusSquared;
  var transient float MaxRadiusSquared;
  var transient Vector AxisVector;
  var transient Vector AxisVectorStart;
  var transient float InvFactor;



