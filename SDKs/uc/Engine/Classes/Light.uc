//==============================================================================
//  Light
//==============================================================================

class Light extends Actor
    native
    dependsOn()
    Placeable
  ;

  enum ELightIndex {
    LI_NONE ,
    LI_LIGHT0 ,
    LI_LIGHT1 ,
    LI_LIGHT2 ,
    LI_LIGHT3 ,
    LI_LIGHT4 ,
    LI_LIGHT5 ,
    LI_LIGHT6 ,
    LI_LIGHT7 
  };

  enum ELightShadingEffect {
    LSE_Default ,
    LSE_NoShadows ,
    LSE_NoShading 
  };

  var (Corona) float MinCoronaSize;
  var (Corona) float MaxCoronaSize;
  var (Corona) float CoronaRotation;
  var (Corona) float CoronaRotationOffset;
  var (Corona) bool UseOwnFinalBlend;
  var (Lighting) byte LightShadingEffect;
  var byte DayLightCycleLightIndex;
  var (Environment) byte EnvironmentIndex;
  var (Lightmap) float ProjectorBrightness;
  var (Lightmap) float LightmapBlur;
  var const transient SBShadowMap ShadowMap;



