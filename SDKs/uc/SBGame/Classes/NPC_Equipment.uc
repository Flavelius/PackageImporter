//==============================================================================
//  NPC_Equipment
//==============================================================================

class NPC_Equipment extends Content_API
    native
    collapsecategories
    dependsOn()
  ;


  event Apply(Game_Pawn aPawn) {
    //04 0B 47 
  }


  native function ApplyToAppearance(export editinline Game_EquippedAppearance app);



