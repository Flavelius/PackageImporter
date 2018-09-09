//==============================================================================
//  AvoidMarker
//==============================================================================

class AvoidMarker extends Triggers
    native
    dependsOn(Pawn,AIController,Controller)
    NotPlaceable
  ;

  var byte TeamNum;


  function StartleBots() {
    local Pawn P;
    foreach CollidingActors(Class'Pawn',P,CollisionRadius) {                    //0000 : 2F 61 41 20 50 31 D4 00 00 30 E0 7B 0F 01 C8 89 6C 0F 16 42 00 
      if (RelevantTo(P)) {                                                      //0015 : 07 41 00 1B 53 2B 00 00 00 30 E0 7B 0F 16 
        AIController(P.Controller).Startle(self);                               //0023 : 19 2E 18 2F C2 00 19 00 30 E0 7B 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B F9 2B 00 00 17 16 
      }
    }
    //2F 61 41 20 50 31 D4 00 00 30 E0 7B 0F 01 C8 89 6C 0F 16 42 00 07 41 00 1B 53 2B 00 00 00 30 E0 
    //7B 0F 16 19 2E 18 2F C2 00 19 00 30 E0 7B 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B F9 2B 00 00 17 
    //16 31 30 04 0B 47 
  }


  function bool RelevantTo(Pawn P) {
    return AIController(P.Controller) != None;                                  //0000 : 04 77 2E 18 2F C2 00 19 00 58 E1 7B 0F 05 00 04 01 00 6E 6C 0F 2A 16 
    //04 77 2E 18 2F C2 00 19 00 58 E1 7B 0F 05 00 04 01 00 6E 6C 0F 2A 16 04 0B 47 
  }


  function Touch(Actor Other) {
    if (Pawn(Other) != None && RelevantTo(Pawn(Other))) {                       //0000 : 07 43 00 82 77 2E 50 31 D4 00 00 10 E3 7B 0F 2A 16 18 11 00 1B 53 2B 00 00 2E 50 31 D4 00 00 10 E3 7B 0F 16 16 
      Pawn(Other).Controller.FearThisSpot(self);                                //0025 : 19 19 2E 50 31 D4 00 00 10 E3 7B 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 1C 2C 00 00 17 16 
    }
    //07 43 00 82 77 2E 50 31 D4 00 00 10 E3 7B 0F 2A 16 18 11 00 1B 53 2B 00 00 2E 50 31 D4 00 00 10 
    //E3 7B 0F 16 16 19 19 2E 50 31 D4 00 00 10 E3 7B 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 1C 2C 00 
    //00 17 16 04 0B 47 
  }



