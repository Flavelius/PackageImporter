//==============================================================================
//  WetTexture
//==============================================================================

class WetTexture extends WaterTexture
    native
    noexport
    SafeReplace
    dependsOn()
  ;

  var (WaterPaint) Texture SourceTexture;
  var transient Texture OldSourceTex;
  var transient int LocalSourceBitmap;



