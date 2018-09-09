//==============================================================================
//  ALAudioSubsystem
//==============================================================================

class ALAudioSubsystem extends AudioSubsystem
    native
    Transient
    Config(System)
  ;

  var config float DopplerFactor;
  var config float TimeBetweenHWUpdates;
  var config float RollOff;
  var config float SpatializedVoiceRadius;
  var config float LocalZOffset;
  var config int Channels;
  var config int MaxEAXVersion;
  var config bool ReverseStereo;
  var config bool UsePrecache;
  var config bool UseEAX;
  var config bool Use3DSound;
  var config bool CompatibilityMode;
  var config bool UseDefaultDriver;
  var config bool DisablePitch;
  var config bool LowQualitySound;
  var config bool UseVAD;
  var config bool EnhancedDenoiser;
  var config bool UseSpatializedVoice;



