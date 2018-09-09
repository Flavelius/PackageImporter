//==============================================================================
//  Game_HUD
//==============================================================================

class Game_HUD extends Object within Game_Pawn
    native
    exportstructs
    dependsOn()
  ;


  native event Destroyed();


  final native function cl_OnInit();


  final native function cl_AddScrollingCombatMessage(string aText,byte aType,optional float aExtraScale);



