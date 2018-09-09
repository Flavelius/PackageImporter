//==============================================================================
//  FractalTexture
//==============================================================================

class FractalTexture extends Texture
    native
    abstract
    noexport
    SafeReplace
    dependsOn()
  ;

  var transient int UMask;
  var transient int VMask;
  var transient int LightOutput;
  var transient int SoundOutput;
  var transient int GlobalPhase;
  var transient byte DrawPhase;
  var transient byte AuxPhase;



