//==============================================================================
//  SBBloomEffect
//==============================================================================

class SBBloomEffect extends CameraEffect
    native
    noexport
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (SBBloomEffect) float BloomContrast;
  var (SBBloomEffect) float OriginalScreenAmount;
  var (SBBloomEffect) float BloomScreenAmount;
  var (SBBloomEffect) float BlurScreenAmount;
  var (SBBloomEffect) int NumBlurPasses;
  var const transient int RenderTargets[4];



