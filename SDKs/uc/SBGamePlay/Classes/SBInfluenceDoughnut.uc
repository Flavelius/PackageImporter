//==============================================================================
//  SBInfluenceDoughnut
//==============================================================================

class SBInfluenceDoughnut extends SBInfluenceVolume
    native
    dependsOn()
    Placeable
  ;

  var (SBInfluenceDoughnut) float DoughnutRadius;
  var (SBInfluenceDoughnut) float MaximumRadius;
  var (SBInfluenceDoughnut) float HotspotFactor;
  var transient float HsRadiusSquared;
  var transient float MaxRadiusSquared;
  var transient float InvFactor;
  var transient float DoughnutRadiusSquared;
  var transient Vector planeNormal;



