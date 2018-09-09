//==============================================================================
//  Ladder
//==============================================================================

class Ladder extends SmallNavigationPoint
    native
    dependsOn(LadderVolume,Pawn,Controller)
    Placeable
  ;

  var LadderVolume MyLadder;
  var Ladder LadderList;


  event bool SuggestMovePreparation(Pawn Other) {
    if (MyLadder == None) {                                                     //0000 : 07 0D 00 72 01 08 E5 35 0F 2A 16 
      return False;                                                             //000B : 04 28 
    }
    if (!MyLadder.InUse(Other)) {                                               //000D : 07 3C 00 81 19 01 08 E5 35 0F 0B 00 04 1B 6E 2B 00 00 00 60 1E 80 0F 16 16 
      MyLadder.PendingClimber = Other;                                          //0026 : 0F 19 01 08 E5 35 0F 05 00 04 01 18 E4 35 0F 00 60 1E 80 0F 
      return False;                                                             //003A : 04 28 
    }
    Other.Controller.bPreparingMove = True;                                     //003C : 14 19 19 00 60 1E 80 0F 05 00 04 01 00 6E 6C 0F 06 00 04 2D 01 70 B1 70 0F 27 
    Other.Acceleration = vect(0.000000, 0.000000, 0.000000);                    //0056 : 0F 19 00 60 1E 80 0F 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    return True;                                                                //0072 : 04 27 
    //07 0D 00 72 01 08 E5 35 0F 2A 16 04 28 07 3C 00 81 19 01 08 E5 35 0F 0B 00 04 1B 6E 2B 00 00 00 
    //60 1E 80 0F 16 16 0F 19 01 08 E5 35 0F 05 00 04 01 18 E4 35 0F 00 60 1E 80 0F 04 28 14 19 19 00 
    //60 1E 80 0F 05 00 04 01 00 6E 6C 0F 06 00 04 2D 01 70 B1 70 0F 27 0F 19 00 60 1E 80 0F 05 00 0C 
    //01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 04 27 04 0B 47 
  }



