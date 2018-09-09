//==============================================================================
//  SBTeamMember
//==============================================================================

class SBTeamMember extends Object
    native
    dependsOn()
  ;

  var int MemberHandle;
  var string Name;
  var float Health;
  var float MaxHealth;
  var int Pep;
  var int Fame;
  var float Physique;
  var float Morale;
  var float Concentration;
  var int StateRankShift;
  var array<int> Buffs;
  var int LastDuffUpdateTime;
  var Pawn AppearancePawn;
  var bool IsLeader;
  var int worldID;



