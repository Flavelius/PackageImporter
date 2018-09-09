//==============================================================================
//  FinalBlend
//==============================================================================

class FinalBlend extends Modifier
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum EFrameBufferBlending {
    FB_Overwrite ,
    FB_Modulate ,
    FB_AlphaBlend ,
    FB_AlphaModulate_MightNotFogCorrectly ,
    FB_Translucent ,
    FB_Darken ,
    FB_Brighten ,
    FB_Invisible 
  };

  var (FinalBlend) byte FrameBufferBlending;
  var (FinalBlend) bool ZWrite;
  var (FinalBlend) bool ZTest;
  var (FinalBlend) bool AlphaTest;
  var (FinalBlend) bool TwoSided;
  var (FinalBlend) byte AlphaRef;



