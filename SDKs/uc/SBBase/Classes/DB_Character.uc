//==============================================================================
//  DB_Character
//==============================================================================

class DB_Character extends Base_DBObject
    native
    dependsOn()
  ;

  var int Id;
  var byte Dead;
  var int AccountID;
  var Vector Location;
  var int worldID;
  var int Money;
  var int AppearancePart1;
  var int AppearancePart2;
  var Rotator Rotation;
  var int FactionId;
  var int LastUsedTimestamp;
  var string Name;



