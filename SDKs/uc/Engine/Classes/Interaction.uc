//==============================================================================
//  Interaction
//==============================================================================

class Interaction extends Interactions
    native
    dependsOn(InteractionMaster)
  ;

  var bool bActive;
  var bool bVisible;
  var bool bRequiresTick;
  var bool bNativeEvents;
  var Player ViewportOwner;
  var InteractionMaster Master;


  event NotifyMusicChange();


  function StreamFinished(int Handle,byte Reason);


  function Tick(float DeltaTime);


  function SetFocus() {
    Master.SetFocusTo(self,ViewportOwner);                                      //0000 : 19 01 F8 B6 71 0F 0C 00 00 1B 93 2B 00 00 17 01 70 B7 71 0F 16 
    //19 01 F8 B6 71 0F 0C 00 00 1B 93 2B 00 00 17 01 70 B7 71 0F 16 04 0B 47 
  }


  function PostRender(Canvas Canvas);


  function PreRender(Canvas Canvas);


  function bool KeyEvent(out byte Key,out byte Action,float delta) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool KeyType(out byte Key,optional string Unicode) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function Message(coerce string Msg,float MsgLife) {
    //04 0B 47 
  }


  event NotifyLevelChange();


  event Initialized();


  native function Vector ScreenToWorld(Vector Location,optional Vector CameraLocation,optional Rotator CameraRotation);


  native function Vector WorldToScreen(Vector Location,optional Vector CameraLocation,optional Rotator CameraRotation);


  native function bool ConsoleCommand(coerce string s);


  native function Initialize();



