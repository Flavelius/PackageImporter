//==============================================================================
//  SBWorld
//==============================================================================

class SBWorld extends Object
    native
    dependsOn()
  ;

  enum eZoneWorldTypes {
    eZoneWorldTypes_RESERVED_0 ,
    ZWT_PERSISTENT ,
    ZWT_INSTANCED ,
    eZoneWorldTypes_RESERVED_3 ,
    ZWT_SUBINSTANCED 
  };

  var int worldID;
  var (world) string WorldName;
  var (world) string WorldFile;
  var (world) editinline Base_GameInfo GameInfo;
  var (world) editinline SBWorldRules GameRules;
  var (world) byte WorldType;
  var (world) int InstanceMaxPlayers;
  var (world) int InstanceMaxInstances;
  var (world) int InstanceLingerTime;
  var (world) bool InstanceAutoDestroy;
  var (world) bool FreeToPlayAllowed;
  var array<SBRoute> ExitRoutes;
  var array<SBPortal> EntryPortals;
  var array<SBTravel> TravelNPCs;
  var string LoadingScreenTex;
  var string ExteriorMesh;
  var (world) float WorldWeight;



