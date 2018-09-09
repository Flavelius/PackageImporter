//==============================================================================
//  WaveTexture
//==============================================================================

class WaveTexture extends WaterTexture
    native
    noexport
    SafeReplace
    dependsOn()
  ;

  var (WaterPaint) byte BumpMapLight;
  var (WaterPaint) byte BumpMapAngle;
  var (WaterPaint) byte PhongRange;
  var (WaterPaint) byte PhongSize;



