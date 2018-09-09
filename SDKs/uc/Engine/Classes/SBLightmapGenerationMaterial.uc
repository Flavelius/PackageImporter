//==============================================================================
//  SBLightmapGenerationMaterial
//==============================================================================

class SBLightmapGenerationMaterial extends SBMaterial
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (SBLightmapGenerationMaterial) float ZBias;
  var (SBLightmapGenerationMaterial) float PCFRadius;
  var (SBLightmapGenerationMaterial) float ProjectorBrightness;
  var (SBLightmapGenerationMaterial) Plane LightColor;
  var (SBLightmapGenerationMaterial) Vector LightPosition;
  var (SBLightmapGenerationMaterial) Vector LightDirection;
  var (SBLightmapGenerationMaterial) float LightRadius;
  var (SBLightmapGenerationMaterial) byte LightEffect;
  var (SBLightmapGenerationMaterial) byte LightShadingEffect;



