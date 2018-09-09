//==============================================================================
//  DB_Guild
//==============================================================================

class DB_Guild extends Base_DBObject
    native
    dependsOn()
  ;

  var int GroupId;
  var int MotdTextId;
  var int LogoId;
  var int Color1;
  var int Color2;
  var const array<DB_Character> mGuildMembers;
  var const bool mGuildMembersSet;



