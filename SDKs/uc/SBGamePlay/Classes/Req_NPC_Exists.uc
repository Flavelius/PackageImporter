//==============================================================================
//  Req_NPC_Exists
//==============================================================================

class Req_NPC_Exists extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Requirement) const export editinline NPC_Type NPCType;
  var (Requirement) const bool MustBeAlive;



