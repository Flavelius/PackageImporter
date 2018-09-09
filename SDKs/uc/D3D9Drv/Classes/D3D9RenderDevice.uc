//==============================================================================
//  D3D9RenderDevice
//==============================================================================

class D3D9RenderDevice extends RenderDevice
    native
    Transient
    Config(System)
  ;

  var config bool UsePrecaching;
  var config bool UseTrilinear;
  var config bool UseVSync;
  var config bool UseHardwareTL;
  var config bool UseHardwareVS;
  var config bool UseCubemaps;
  var config bool UseTripleBuffering;
  var config bool ReduceMouseLag;
  var config bool CheckForOverflow;
  var config bool UseNPatches;
  var config bool DecompressTextures;
  var config int AdapterNumber;
  var config int MaxPixelShaderVersion;
  var config int LevelOfAnisotropy;
  var config float DetailTexMipBias;
  var config float DefaultTexMipBias;
  var config float TesselationFactor;
  var config int DesiredRefreshRate;



