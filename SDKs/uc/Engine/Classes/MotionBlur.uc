//==============================================================================
//  MotionBlur
//==============================================================================

class MotionBlur extends CameraEffect
    native
    noexport
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (MotionBlur) byte BlurAlpha;
  var const transient int RenderTargets[2];
  var const float LastFrameTime;



