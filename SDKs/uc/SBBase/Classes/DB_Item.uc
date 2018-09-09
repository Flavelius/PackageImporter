//==============================================================================
//  DB_Item
//==============================================================================

class DB_Item extends Base_DBObject
    native
    dependsOn()
  ;

  var int Id;
  var int ItemTypeID;
  var int CharacterID;
  var byte LocationType;
  var int LocationID;
  var int LocationSlot;
  var int StackSize;
  var byte Attuned;
  var byte Color1;
  var byte Color2;
  var int Serial;



