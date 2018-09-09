//==============================================================================
//  EnvironmentSettings
//==============================================================================

class EnvironmentSettings extends Object
    native
    dependsOn()
  ;

  struct EmitterModifier {
      var (EmitterModifier) float DensityMultiplier;
      var (EmitterModifier) float SizeMultiplier;
      var (EmitterModifier) float VelocityMultiplier;
      var (EmitterModifier) byte HueModifier;
      var (EmitterModifier) float SaturationMultiplier;
      var (EmitterModifier) float BrightnessMultiplier;
      var (EmitterModifier) float OpacityMultiplier;

  };


  struct LightHSB {
      var (LightHSB) byte LightHue;
      var (LightHSB) byte LightSaturation;
      var (LightHSB) float LightBrightness;

  };


  var (ZoneInfo) float BloomContrast;
  var (ZoneInfo) float BloomScreenAmount;
  var (ZoneInfo) float OriginalScreenAmount;
  var (ZoneInfo) float BlurScreenAmount;
  var (ZoneInfo) Color DistanceFogColor;
  var (ZoneInfo) float DistanceFogEnd;
  var (ZoneInfo) float DistanceFogEndMin;
  var (ZoneInfo) float DistanceFogStart;
  var (ZoneInfo) byte AmbientBrightness;
  var (ZoneInfo) byte AmbientHue;
  var (ZoneInfo) byte AmbientSaturation;
  var (ZoneInfo) float SunlightsBrightness;
  var (ZoneInfo) float SunlightsContrastAdjust;
  var (ZoneInfo) float LightmapContrastAdjust;
  var (HUD) Color HUDColorModifier;
  var (Light) LightHSB LightColor[8];
  var (Emitter) EmitterModifier EmitterMod[8];



