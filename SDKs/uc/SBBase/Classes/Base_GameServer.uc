//==============================================================================
//  Base_GameServer
//==============================================================================

class Base_GameServer extends GameEngine
    native
    noexport
    dependsOn()
    Transient
    Config(System)
  ;

  var int ServerMode;
  var string ServerOptions;
  var bool IsPvPServer;
  var private int mGameServerData;


  event sv_OnCreateInstanceNAck(int InstanceID) {
    //04 0B 47 
  }


  event sv_OnCreateInstanceAck(int InstanceID,int zoneID) {
    //04 0B 47 
  }


  native function bool LoginToWorldByID(int _worldID,int _characterID,string _portalName,string _routeName);


  native function int GetPortalDestinationWorldID(Object _gamePortal);


  native function bool LoginToWorldByPortal(Object _gamePortal,int _characterID);



