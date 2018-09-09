//==============================================================================
//  Base_GameClient
//==============================================================================

class Base_GameClient extends GameEngine
    native
    noexport
    dependsOn()
    Transient
    Config(System)
  ;

  var int __LogoutState;
  var int __CurrentConnectedServer;
  var int __mUniverseDataPtr;
  var int mWorldID;
  var bool IsPvPServer;
  var int __mSplashScreenCloserPtr;
  var PlayerController GPlayerController;
  var const float CellUpdateTime;
  var const int CurrentCell;


  native function QueryUniverses();


  native function CancelConnectToUniverse();


  native function ConnectToUniverse(int universeID);


  native function CancelConnectToLogin();


  native function int ConnectToLoginServer(string aUsername,string aPassword);


  native function ForcedLogin(int Status);


  native function StopSceneDump();


  native function StartSceneDump();


  native function string GetUserName();


  native function ApplyPatch();


  native function ContentUpdateErrorOK();


  native function CancelContentUpdate();


  native function float GetContentUpdateProgress(out int peerCount,out float upSpeed,out float downSpeed,out string errorMessage);


  native function Logout(optional int forcedReason);



