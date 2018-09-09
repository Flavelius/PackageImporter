//==============================================================================
//  SBSettings
//==============================================================================

class SBSettings extends Object
    native
    dependsOn()
    Config(User)
  ;

  var globalconfig bool ShowPawnShadowsOnEnvironment;
  var globalconfig bool UsePostProcessing;
  var globalconfig bool UseBloomEffect;
  var globalconfig float BloomStrength;
  var globalconfig bool ShowSpecularOnCharacters;
  var globalconfig bool BakeCharacters;
  var globalconfig bool BakeCharacterTextures;
  var globalconfig float TerrainDecorationDetail;
  var globalconfig bool UseBoneLODding;


  native function NotifySettingsChanged();



