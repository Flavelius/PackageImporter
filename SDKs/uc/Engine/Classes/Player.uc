//==============================================================================
//  Player
//==============================================================================

class Player extends Object
    native
    noexport
    dependsOn()
    Config(User)
  ;

  const IDC_WAIT = 6;
  const IDC_SIZEWE = 5;
  const IDC_SIZENWSE = 4;
  const IDC_SIZENS = 3;
  const IDC_SIZENESW = 2;
  const IDC_SIZEALL = 1;
  const IDC_ARROW = 0;
  var const native transient int vfOut;
  var const native transient int vfExec;
  var const transient PlayerController Actor;
  var const transient PlayerController OldActor;
  var transient Console Console;
  var const transient bool bWindowsMouseAvailable;
  var bool bShowWindowsMouse;
  var const transient float WindowsMouseX;
  var const transient float WindowsMouseY;
  var transient int CurrentVoiceBandwidth;
  var const int CurrentNetSpeed;
  var globalconfig int ConfiguredInternetSpeed;
  var globalconfig int ConfiguredLanSpeed;
  var byte SelectedCursor;
  var transient InteractionMaster InteractionMaster;
  var transient array<Interaction> LocalInteractions;
  var transient BaseGUIController GUIController;
  var transient GUI_BaseDesktop GUIDesktop;



