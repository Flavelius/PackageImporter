//==============================================================================
//  RenderDevice
//==============================================================================

class RenderDevice extends Subsystem
    native
    abstract
    Transient
    Config(System)
  ;

  var config int TerrainLOD;
  var config bool HighDetailActors;
  var config bool SuperHighDetailActors;
  var config bool DetailTextures;
  var config bool UseCompressedLightmaps;
  var config bool UseStencil;
  var config bool Use16bit;
  var config bool Use16bitTextures;
  var config bool LowQualityTerrain;
  var config bool SkyboxHack;
  var config bool UseSpellbornShaders;
  var config bool UseHQFog;



