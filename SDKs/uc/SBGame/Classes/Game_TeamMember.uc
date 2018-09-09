//==============================================================================
//  Game_TeamMember
//==============================================================================

class Game_TeamMember extends Object
    native
    dependsOn()
  ;

  var int MemberHandle;
  var string Name;
  var bool IsFeminine;
  var int Archetype;
  var int Discipline;
  var float Health;
  var float MaxHealth;
  var int Pep;
  var int Fame;
  var float Physique;
  var float Morale;
  var float Concentration;
  var int StateRankShift;
  var array<FSkill_Event_Duff> Buffs;
  var float LastDuffUpdateTime;
  var Game_Pawn AppearancePawn;
  var array<byte> LastAppearanceUpdateLod;
  var bool IsLeader;
  var int worldID;
  var float LocationX;
  var float LocationY;



