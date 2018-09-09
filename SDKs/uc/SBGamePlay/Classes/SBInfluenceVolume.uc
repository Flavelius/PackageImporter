//==============================================================================
//  SBInfluenceVolume
//==============================================================================

class SBInfluenceVolume extends Actor
    native
    dependsOn()
  ;

  const SBVOLUME_MIN_DIMENSION =  0.0001f;
  enum SBInfluence_Falloff {
    SBIF_Linear ,
    SBIF_InvSquare ,
    SBIF_Logarithmic 
  };

  var (SBInfluenceVolume) byte InfluenceFalloff;
  var (SBInfluenceVolume) int NrRenderedSides;
  var transient Box BoundingBox;
  var transient int HighlightCount;
  var transient int ShowDebugCount;
  var transient int OverlapCount;
  var transient Vector LastCheckPosition;
  var transient float CachedInfluenceWeight;
  var transient Vector CachedInfluenceLocation;


  native function float GetInfluenceWeight(Vector positionToCheck);



