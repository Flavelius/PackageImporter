//==============================================================================
//  AIScript
//==============================================================================

class AIScript extends Keypoint
    native
    dependsOn(Pawn,AIController)
  ;

  var (AIScript) class<AIController> ControllerClass;
  var bool bNavigate;
  var (AIScript) bool bLoggingEnabled;
  var AIMarker myMarker;


  function TakeOver(Pawn P);


  function Actor GetMoveTarget() {
    if (myMarker != None) {                                                     //0000 : 07 11 00 77 01 70 C9 77 0F 2A 16 
      return myMarker;                                                          //000B : 04 01 70 C9 77 0F 
    }
    return self;                                                                //0011 : 04 17 
    //07 11 00 77 01 70 C9 77 0F 2A 16 04 01 70 C9 77 0F 04 17 04 0B 47 
  }


  function SpawnControllerFor(Pawn P) {
    local AIController C;
    if (ControllerClass == None) {                                              //0000 : 07 59 00 72 01 70 BC 7F 0F 2A 16 
      if (P.ControllerClass == None) {                                          //000B : 07 21 00 72 19 00 E8 C9 77 0F 05 00 04 01 00 BB 75 0F 2A 16 
        return;                                                                 //001F : 04 0B 
      }
      C = Spawn(P.ControllerClass,,,P.Location,P.Rotation);                     //0021 : 0F 00 60 CA 77 0F 61 16 19 00 E8 C9 77 0F 05 00 04 01 00 BB 75 0F 0B 0B 19 00 E8 C9 77 0F 05 00 0C 01 30 81 6C 0F 19 00 E8 C9 77 0F 05 00 0C 01 00 84 6C 0F 16 
    } else {                                                                    //0056 : 06 85 00 
      C = Spawn(ControllerClass,,,P.Location,P.Rotation);                       //0059 : 0F 00 60 CA 77 0F 61 16 01 70 BC 7F 0F 0B 0B 19 00 E8 C9 77 0F 05 00 0C 01 30 81 6C 0F 19 00 E8 C9 77 0F 05 00 0C 01 00 84 6C 0F 16 
    }
    C.MyScript = self;                                                          //0085 : 0F 19 00 60 CA 77 0F 05 00 04 01 38 D4 7D 0F 17 
    //07 59 00 72 01 70 BC 7F 0F 2A 16 07 21 00 72 19 00 E8 C9 77 0F 05 00 04 01 00 BB 75 0F 2A 16 04 
    //0B 0F 00 60 CA 77 0F 61 16 19 00 E8 C9 77 0F 05 00 04 01 00 BB 75 0F 0B 0B 19 00 E8 C9 77 0F 05 
    //00 0C 01 30 81 6C 0F 19 00 E8 C9 77 0F 05 00 0C 01 00 84 6C 0F 16 06 85 00 0F 00 60 CA 77 0F 61 
    //16 01 70 BC 7F 0F 0B 0B 19 00 E8 C9 77 0F 05 00 0C 01 30 81 6C 0F 19 00 E8 C9 77 0F 05 00 0C 01 
    //00 84 6C 0F 16 0F 19 00 60 CA 77 0F 05 00 04 01 38 D4 7D 0F 17 04 0B 47 
  }



