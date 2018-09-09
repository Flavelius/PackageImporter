//==============================================================================
//  NPC_MonsterPawn
//==============================================================================

class NPC_MonsterPawn extends Game_NPCPawn
    native
    dependsOn()
    Config(User)
  ;


  event string cl_GetSecondaryDisplayName() {
    return "";                                                                  //0000 : 04 1F 00 
    //04 1F 00 04 0B 47 
  }



