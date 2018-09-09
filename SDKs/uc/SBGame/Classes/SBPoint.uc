//==============================================================================
//  SBPoint
//==============================================================================

class SBPoint extends Actor
    native
    exportstructs
    dependsOn()
    Placeable
  ;

  struct SBPathConnection {
      var (SBPathConnection) SBPoint ConnectedActor;
      var float MoveSpeed;
      var bool Walking;

  };


  var (Paths) array<SBPathConnection> Connections;



