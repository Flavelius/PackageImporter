//==============================================================================
//  Client
//==============================================================================

class Client extends Object
    native
    abstract
    Config(System)
  ;

  var config bool CaptureMouse;
  var config bool ScreenFlashes;
  var config bool NoLighting;
  var config bool Decals;
  var config bool NoDynamicLights;
  var config bool NoFractalAnim;
  var config bool Coronas;
  var config bool DecoLayers;
  var config bool Projectors;
  var config bool ReportDynamicUploads;
  var config bool WeatherEffects;
  var config int WindowedViewportX;
  var config int WindowedViewportY;
  var config int FullscreenViewportX;
  var config int FullscreenViewportY;
  var config int MenuViewportX;
  var config int MenuViewportY;
  var config float Brightness;
  var config float Contrast;
  var config float Gamma;
  var config byte TextureDetailWorld;
  var config byte TextureDetailPlayerSkin;
  var config byte TextureDetailWeaponSkin;
  var config byte TextureDetailTerrain;
  var config byte TextureDetailInterface;
  var config byte TextureDetailRenderMap;
  var config byte TextureDetailLightmap;
  var config float MinDesiredFrameRate;
  var config float ScaleHUDX;
  var config float AnimMeshDynamicLOD;
  var config float DrawDistanceLOD;



