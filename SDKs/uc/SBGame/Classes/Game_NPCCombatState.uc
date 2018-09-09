//==============================================================================
//  Game_NPCCombatState
//==============================================================================

class Game_NPCCombatState extends Game_CombatState within Game_NPCPawn
    native
    dependsOn()
  ;


  native function bool EnsureIdle();


  native function bool EnsureCombat(optional byte aPreferedMode);



