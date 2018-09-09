//==============================================================================
//  Game_StatueCharacter
//==============================================================================

class Game_StatueCharacter extends Game_Character within Game_StatuePawn
    native
    dependsOn(Game_StatuePawn)
  ;


  event string cl_GetBaseFullName() {
    return Outer.PlayerName;                                                    //0000 : 04 19 01 00 E4 6B 0F 05 00 00 01 C0 91 31 11 
    //04 19 01 00 E4 6B 0F 05 00 00 01 C0 91 31 11 04 0B 47 
  }


  event string cl_GetBaseName() {
    return Outer.PlayerName;                                                    //0000 : 04 19 01 00 E4 6B 0F 05 00 00 01 C0 91 31 11 
    //04 19 01 00 E4 6B 0F 05 00 00 01 C0 91 31 11 04 0B 47 
  }



