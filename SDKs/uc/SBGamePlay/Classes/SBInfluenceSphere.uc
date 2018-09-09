//==============================================================================
//  SBInfluenceSphere
//==============================================================================

class SBInfluenceSphere extends SBInfluenceVolume
    native
    editinlinenew
    dependsOn()
    Placeable
  ;

  var (SBInfluenceSphere) float MaximumRadius;
  var (SBInfluenceSphere) float HotspotFactor;
  var transient float HsRadiusSquared;
  var transient float MaxRadiusSquared;
  var transient float InvFadeDistanceSqr;



