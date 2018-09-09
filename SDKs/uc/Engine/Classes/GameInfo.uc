//==============================================================================
//  GameInfo
//==============================================================================

class GameInfo extends Info
    native
    abstract
    dependsOn(LevelInfo,NavigationPoint)
  ;


  function bool PlayerRespawned(Controller aContoller);


  function bool PlayerDied(Controller aContoller);


  function NavigationPoint FindPlayerStart() {
    local NavigationPoint N;
    N = Level.NavigationPointList;                                              //0000 : 0F 00 80 FD 74 0F 19 01 D8 7E 6C 0F 05 00 04 01 D8 E0 74 0F 
    while (N != None) {                                                         //0014 : 07 50 00 77 00 80 FD 74 0F 2A 16 
      if (N.IsA('PlayerStart')) {                                               //001F : 07 39 00 19 00 80 FD 74 0F 08 00 04 61 2F 21 AF 0B 00 00 16 
        return N;                                                               //0033 : 04 00 80 FD 74 0F 
      }
      N = N.nextNavigationPoint;                                                //0039 : 0F 00 80 FD 74 0F 19 00 80 FD 74 0F 05 00 04 01 F8 FD 74 0F 
    }
    return None;                                                                //0050 : 04 2A 
    //0F 00 80 FD 74 0F 19 01 D8 7E 6C 0F 05 00 04 01 D8 E0 74 0F 07 50 00 77 00 80 FD 74 0F 2A 16 07 
    //39 00 19 00 80 FD 74 0F 08 00 04 61 2F 21 AF 0B 00 00 16 04 00 80 FD 74 0F 0F 00 80 FD 74 0F 19 
    //00 80 FD 74 0F 05 00 04 01 F8 FD 74 0F 06 14 00 04 2A 04 0B 47 
  }


  event cl_OnUpdate() {
    //04 0B 47 
  }


  event cl_OnBaseline() {
    //04 0B 47 
  }


  event cl_OnShutdown();


  event cl_OnInit();


  event sv_OnShutdown();


  event sv_OnInit();



