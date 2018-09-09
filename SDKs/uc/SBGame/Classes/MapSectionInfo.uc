//==============================================================================
//  MapSectionInfo
//==============================================================================

class MapSectionInfo extends Object
    native
    exportstructs
    dependsOn()
  ;

  const RESOLUTION_MAX_RANGE =  4096;
  const RESOLUTION_MIN_RANGE =  128;
  const RESOLUTION_BREAKOFF_POINT =  512;
  var float X;
  var float Y;
  var float Z;
  var float width;
  var float Height;
  var array<MapResolutionInfo> mapSectionMaterial;
  var string mapBaseName;
  var LocalizedString mapSectionName;
  var int Id;
  var int parentID;
  var float scaleStart;
  var float scaleEnd;
  var bool IsDiscovered;



