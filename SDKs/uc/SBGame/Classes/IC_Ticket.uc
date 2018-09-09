//==============================================================================
//  IC_Ticket
//==============================================================================

class IC_Ticket extends Item_Component
    native
    editinlinenew
    dependsOn()
  ;

  enum EAccessLevel {
    AL_ArenaPVP ,
    AL_ArenaPVE ,
    AL_DeadSpellTravel 
  };

  var (Ticket) const byte AccessLevel;
  var (Ticket) const bool TeleportOnUse;



