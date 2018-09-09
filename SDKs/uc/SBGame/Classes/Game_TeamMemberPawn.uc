//==============================================================================
//  Game_TeamMemberPawn
//==============================================================================

class Game_TeamMemberPawn extends Game_PlayerPawn
    dependsOn(Game_ShiftableAppearance)
    Config(User)
  ;


  function cl_OnFrame(float aDelta) {
    //04 0B 47 
  }


  function cl_OnInit() {
    Appearance.cl_OnInit();                                                     //0000 : 19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 
    SetCollision(False,False);                                                  //000F : 61 06 28 28 16 
    //19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 61 06 28 28 16 04 0B 47 
  }



