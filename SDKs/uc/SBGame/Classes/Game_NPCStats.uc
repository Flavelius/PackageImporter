//==============================================================================
//  Game_NPCStats
//==============================================================================

class Game_NPCStats extends Game_CharacterStats within Game_Pawn
    native
    dependsOn()
    Config(charstats)
  ;

  var const globalconfig float mAggroLostHealthRestore;


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 88 85 1F 11 16 
    Outer.PauseAnim(IsAnimationFrozen());                                       //0006 : 19 01 00 E4 6B 0F 0C 00 00 1B 32 0D 00 00 1C A0 97 1C 11 16 16 
    //1C 88 85 1F 11 16 19 01 00 E4 6B 0F 0C 00 00 1B 32 0D 00 00 1C A0 97 1C 11 16 16 04 0B 47 
  }



