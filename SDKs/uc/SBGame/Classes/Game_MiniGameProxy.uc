//==============================================================================
//  Game_MiniGameProxy
//==============================================================================

class Game_MiniGameProxy extends Base_Component within Game_Pawn
    native
    dependsOn()
  ;


  event bool IsPlaying() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool IsInviting() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function sv_PlayerDied() {
    //04 0B 47 
  }


  event cl_OnFrame(float DeltaTime) {
    //04 0B 47 
  }


  event cl_StartMiniGame(Game_PlayerPawn Opponent) {
    //04 0B 47 
  }



