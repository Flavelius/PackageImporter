//==============================================================================
//  Sound
//==============================================================================

class Sound extends Object
    native
    noexport
    dependsOn()
  ;

  var (Sound) native float Likelihood;
  var const native byte Data[48];
  var const native name FileType;
  var const native string fileName;
  var const native int OriginalSize;
  var const native float Duration;
  var const native transient int Handle;
  var const native int flags;
  var const native int VoiceCodec;
  var const native float InitialSeekTime;
  var (Sound) float BaseRadius;
  var (Sound) float VelocityScale;



