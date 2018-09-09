//==============================================================================
//  FadeBlackWhite
//==============================================================================

class FadeBlackWhite extends CameraEffect
    native
    noexport
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (FadeBlackWhite) float FadeTime;
  var (FadeBlackWhite) float FadeDir;
  var const float LastAlpha;
  var const float LastFrameTime;



