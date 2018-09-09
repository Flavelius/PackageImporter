//==============================================================================
//  WindowsClient
//==============================================================================

class WindowsClient extends Client
    native
    Transient
    Config(System)
  ;

  var config bool UseJoystick;
  var config bool StartupFullscreen;
  var config bool UseSpeechRecognition;
  var config float MouseXMultiplier;
  var config float MouseYMultiplier;
  var config bool UseHardwareCursor;



