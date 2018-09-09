//==============================================================================
//  Game_CameraEnvironmentEffect
//==============================================================================

class Game_CameraEnvironmentEffect extends EnvironmentEffect
    native
    dependsOn()
  ;

  var private Game_PlayerController mController;


  function SetController(Game_PlayerController aController) {
    assert(mController == None);                                                //0000 : 09 21 00 72 01 70 B0 34 11 2A 16 
    mController = aController;                                                  //000B : 0F 01 70 B0 34 11 00 E8 B0 34 11 
    //09 21 00 72 01 70 B0 34 11 2A 16 0F 01 70 B0 34 11 00 E8 B0 34 11 04 0B 47 
  }



