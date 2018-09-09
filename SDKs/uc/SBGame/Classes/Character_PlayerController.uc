//==============================================================================
//  Character_PlayerController
//==============================================================================

class Character_PlayerController extends Game_PlayerController
    native
    dependsOn()
    Config(User)
  ;

  var private Vector mTargetLocation;


  event cl_OnShutdown() {
    //04 0B 47 
  }


  event cl_OnPlayerTick(float DeltaTime) {
    //04 0B 47 
  }


  function SetTargetRotation(Rotator aRotation) {
    mTargetRotation = aRotation;                                                //0000 : 0F 01 38 D7 84 0F 00 20 F9 35 0F 
    //0F 01 38 D7 84 0F 00 20 F9 35 0F 04 0B 47 
  }


  function SetTargetLocation(Vector aLocation) {
    mTargetLocation = aLocation;                                                //0000 : 0F 01 D8 F9 35 0F 00 50 FA 35 0F 
    //0F 01 D8 F9 35 0F 00 50 FA 35 0F 04 0B 47 
  }



