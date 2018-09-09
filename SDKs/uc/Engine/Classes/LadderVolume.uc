//==============================================================================
//  LadderVolume
//==============================================================================

class LadderVolume extends PhysicsVolume
    native
    dependsOn(Ladder)
  ;

  var (LadderVolume) name ClimbingAnimation;
  var (LadderVolume) name TopAnimation;
  var (LadderVolume) Rotator WallDir;
  var Vector LookDir;
  var Vector ClimbDir;
  var const Ladder LadderList;
  var (LadderVolume) bool bNoPhysicalLadder;
  var (LadderVolume) bool bAutoPath;
  var (LadderVolume) bool bAllowLadderStrafing;
  var Pawn PendingClimber;


  simulated event PhysicsChangedFor(Actor Other) {
    if (Other.Physics == 2 || Other.Physics == 11
      || Other.bDeleteMe
      || Pawn(Other) == None
      || Pawn(Other).Controller == None) {//0000 : 07 77 00 84 84 84 84 9A 39 3A 19 00 50 9F 75 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 02 16 18 17 00 9A 39 3A 19 00 50 9F 75 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 10 00 19 00 50 9F 75 0F 06 00 04 2D 01 58 92 6C 0F 16 18 0E 00 72 2E 50 31 D4 00 00 50 9F 75 0F 2A 16 16 18 17 00 72 19 2E 50 31 D4 00 00 50 9F 75 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 
      return;                                                                   //0075 : 04 0B 
    }
    Spawn(Class'PotentialClimbWatcher',Other);                                  //0077 : 61 16 20 18 6E C2 00 00 50 9F 75 0F 16 
    //07 77 00 84 84 84 84 9A 39 3A 19 00 50 9F 75 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 02 16 18 17 00 
    //9A 39 3A 19 00 50 9F 75 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 10 00 19 00 50 9F 75 0F 
    //06 00 04 2D 01 58 92 6C 0F 16 18 0E 00 72 2E 50 31 D4 00 00 50 9F 75 0F 2A 16 16 18 17 00 72 19 
    //2E 50 31 D4 00 00 50 9F 75 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 04 0B 61 16 20 18 6E C2 00 00 50 
    //9F 75 0F 16 04 0B 47 
  }


  simulated event PawnLeavingVolume(Pawn P) {
    local Controller C;
    if (P.OnLadder != self) {                                                   //0000 : 07 16 00 77 19 00 A0 E3 35 0F 05 00 04 01 40 DD 75 0F 17 16 
      return;                                                                   //0014 : 04 0B 
    }
    Super.PawnLeavingVolume(P);                                                 //0016 : 1C 38 8A 79 0F 00 A0 E3 35 0F 16 
    P.OnLadder = None;                                                          //0021 : 0F 19 00 A0 E3 35 0F 05 00 04 01 40 DD 75 0F 2A 
    P.EndClimbLadder(self);                                                     //0031 : 19 00 A0 E3 35 0F 07 00 00 1B 11 2B 00 00 17 16 
    if (P == PendingClimber) {                                                  //0041 : 07 57 00 72 00 A0 E3 35 0F 01 18 E4 35 0F 16 
      PendingClimber = None;                                                    //0050 : 0F 01 18 E4 35 0F 2A 
    }
    if (!InUse(P)) {                                                            //0057 : 07 15 01 81 1B 6E 2B 00 00 00 A0 E3 35 0F 16 16 
      C = Level.ControllerList;                                                 //0067 : 0F 00 90 E4 35 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 
      while (C != None) {                                                       //007B : 07 15 01 77 00 90 E4 35 0F 2A 16 
        if (C.bPreparingMove && Ladder(C.MoveTarget) != None
          && Ladder(C.MoveTarget).MyLadder == self) {//0086 : 07 FE 00 82 82 19 00 90 E4 35 0F 06 00 04 2D 01 70 B1 70 0F 18 17 00 77 2E 98 39 C2 00 19 00 90 E4 35 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 18 20 00 72 19 2E 98 39 C2 00 19 00 90 E4 35 0F 05 00 04 01 C8 B3 70 0F 05 00 04 01 08 E5 35 0F 17 16 16 
          C.bPreparingMove = False;                                             //00D7 : 14 19 00 90 E4 35 0F 06 00 04 2D 01 70 B1 70 0F 28 
          PendingClimber = C.Pawn;                                              //00E8 : 0F 01 18 E4 35 0F 19 00 90 E4 35 0F 05 00 04 01 88 83 6C 0F 
          return;                                                               //00FC : 04 0B 
        }
        C = C.nextController;                                                   //00FE : 0F 00 90 E4 35 0F 19 00 90 E4 35 0F 05 00 04 01 08 F5 70 0F 
      }
    }
    //07 16 00 77 19 00 A0 E3 35 0F 05 00 04 01 40 DD 75 0F 17 16 04 0B 1C 38 8A 79 0F 00 A0 E3 35 0F 
    //16 0F 19 00 A0 E3 35 0F 05 00 04 01 40 DD 75 0F 2A 19 00 A0 E3 35 0F 07 00 00 1B 11 2B 00 00 17 
    //16 07 57 00 72 00 A0 E3 35 0F 01 18 E4 35 0F 16 0F 01 18 E4 35 0F 2A 07 15 01 81 1B 6E 2B 00 00 
    //00 A0 E3 35 0F 16 16 0F 00 90 E4 35 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 07 15 01 77 00 
    //90 E4 35 0F 2A 16 07 FE 00 82 82 19 00 90 E4 35 0F 06 00 04 2D 01 70 B1 70 0F 18 17 00 77 2E 98 
    //39 C2 00 19 00 90 E4 35 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 18 20 00 72 19 2E 98 39 C2 00 19 00 
    //90 E4 35 0F 05 00 04 01 C8 B3 70 0F 05 00 04 01 08 E5 35 0F 17 16 16 14 19 00 90 E4 35 0F 06 00 
    //04 2D 01 70 B1 70 0F 28 0F 01 18 E4 35 0F 19 00 90 E4 35 0F 05 00 04 01 88 83 6C 0F 04 0B 0F 00 
    //90 E4 35 0F 19 00 90 E4 35 0F 05 00 04 01 08 F5 70 0F 06 7B 00 04 0B 47 
  }


  simulated event PawnEnteredVolume(Pawn P) {
    local Rotator PawnRot;
    Super.PawnEnteredVolume(P);                                                 //0000 : 1C A8 8B 79 0F 00 30 E6 35 0F 16 
    if (!P.CanGrabLadder()) {                                                   //000B : 07 21 00 81 19 00 30 E6 35 0F 06 00 04 1B 8D 12 00 00 16 16 
      return;                                                                   //001F : 04 0B 
    }
    PawnRot = P.Rotation;                                                       //0021 : 0F 00 30 CD 37 0F 19 00 30 E6 35 0F 05 00 0C 01 00 84 6C 0F 
    PawnRot.Pitch = 0;                                                          //0035 : 0F 36 A8 BE 69 0F 00 30 CD 37 0F 25 
    if (vector(PawnRot) Dot LookDir > 0.89999998
      || AIController(P.Controller) != None
      && Ladder(P.Controller.MoveTarget) != None) {//0041 : 07 AB 00 84 B1 DB 39 39 00 30 CD 37 0F 01 00 EC 37 0F 16 1E 66 66 66 3F 16 18 3B 00 82 77 2E 18 2F C2 00 19 00 30 E6 35 0F 05 00 04 01 00 6E 6C 0F 2A 16 18 20 00 77 2E 98 39 C2 00 19 19 00 30 E6 35 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 16 
      P.ClimbLadder(self);                                                      //0098 : 19 00 30 E6 35 0F 07 00 00 1B 71 2B 00 00 17 16 
    } else {                                                                    //00A8 : 06 E2 00 
      if (!P.bDeleteMe && P.Controller != None) {                               //00AB : 07 E2 00 82 81 19 00 30 E6 35 0F 06 00 04 2D 01 58 92 6C 0F 16 18 12 00 77 19 00 30 E6 35 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 
        Spawn(Class'PotentialClimbWatcher',P);                                  //00D5 : 61 16 20 18 6E C2 00 00 30 E6 35 0F 16 
      }
    }
    //1C A8 8B 79 0F 00 30 E6 35 0F 16 07 21 00 81 19 00 30 E6 35 0F 06 00 04 1B 8D 12 00 00 16 16 04 
    //0B 0F 00 30 CD 37 0F 19 00 30 E6 35 0F 05 00 0C 01 00 84 6C 0F 0F 36 A8 BE 69 0F 00 30 CD 37 0F 
    //25 07 AB 00 84 B1 DB 39 39 00 30 CD 37 0F 01 00 EC 37 0F 16 1E 66 66 66 3F 16 18 3B 00 82 77 2E 
    //18 2F C2 00 19 00 30 E6 35 0F 05 00 04 01 00 6E 6C 0F 2A 16 18 20 00 77 2E 98 39 C2 00 19 19 00 
    //30 E6 35 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 16 19 00 30 E6 35 0F 07 00 
    //00 1B 71 2B 00 00 17 16 06 E2 00 07 E2 00 82 81 19 00 30 E6 35 0F 06 00 04 2D 01 58 92 6C 0F 16 
    //18 12 00 77 19 00 30 E6 35 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 61 16 20 18 6E C2 00 00 30 E6 35 
    //0F 16 04 0B 47 
  }


  function bool InUse(Pawn Ignored) {
    local Pawn StillClimbing;
    foreach TouchingActors(Class'Pawn',StillClimbing) {                         //0000 : 2F 61 33 20 50 31 D4 00 00 E0 8B 7D 0F 16 4B 00 
      if (StillClimbing != Ignored && StillClimbing.bCollideActors
        && StillClimbing.bBlockActors) {//0010 : 07 4A 00 82 82 77 00 E0 8B 7D 0F 00 58 CE 37 0F 16 18 10 00 19 00 E0 8B 7D 0F 06 00 04 2D 01 08 97 6C 0F 16 18 10 00 19 00 E0 8B 7D 0F 06 00 04 2D 01 F8 97 6C 0F 16 
        return True;                                                            //0048 : 04 27 
      }
    }
    if (PendingClimber != None) {                                               //004C : 07 EF 00 77 01 18 E4 35 0F 2A 16 
      if (PendingClimber.Controller == None
        || !PendingClimber.bCollideActors
        || !PendingClimber.bBlockActors
        || Ladder(PendingClimber.Controller.MoveTarget) == None
        || Ladder(PendingClimber.Controller.MoveTarget).MyLadder != self) {//0057 : 07 EF 00 84 84 84 84 72 19 01 18 E4 35 0F 05 00 04 01 00 6E 6C 0F 2A 16 18 12 00 81 19 01 18 E4 35 0F 06 00 04 2D 01 08 97 6C 0F 16 16 18 12 00 81 19 01 18 E4 35 0F 06 00 04 2D 01 F8 97 6C 0F 16 16 18 20 00 72 2E 98 39 C2 00 19 19 01 18 E4 35 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 18 29 00 77 19 2E 98 39 C2 00 19 19 01 18 E4 35 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 05 00 04 01 08 E5 35 0F 17 16 16 
        PendingClimber = None;                                                  //00E8 : 0F 01 18 E4 35 0F 2A 
      }
    }
    return PendingClimber != None && PendingClimber != Ignored;                 //00EF : 04 82 77 01 18 E4 35 0F 2A 16 18 0D 00 77 01 18 E4 35 0F 00 58 CE 37 0F 16 16 
    //2F 61 33 20 50 31 D4 00 00 E0 8B 7D 0F 16 4B 00 07 4A 00 82 82 77 00 E0 8B 7D 0F 00 58 CE 37 0F 
    //16 18 10 00 19 00 E0 8B 7D 0F 06 00 04 2D 01 08 97 6C 0F 16 18 10 00 19 00 E0 8B 7D 0F 06 00 04 
    //2D 01 F8 97 6C 0F 16 30 04 27 31 30 07 EF 00 77 01 18 E4 35 0F 2A 16 07 EF 00 84 84 84 84 72 19 
    //01 18 E4 35 0F 05 00 04 01 00 6E 6C 0F 2A 16 18 12 00 81 19 01 18 E4 35 0F 06 00 04 2D 01 08 97 
    //6C 0F 16 16 18 12 00 81 19 01 18 E4 35 0F 06 00 04 2D 01 F8 97 6C 0F 16 16 18 20 00 72 2E 98 39 
    //C2 00 19 19 01 18 E4 35 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 18 29 00 77 
    //19 2E 98 39 C2 00 19 19 01 18 E4 35 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 B3 70 0F 05 00 04 
    //01 08 E5 35 0F 17 16 16 0F 01 18 E4 35 0F 2A 04 82 77 01 18 E4 35 0F 2A 16 18 0D 00 77 01 18 E4 
    //35 0F 00 58 CE 37 0F 16 16 04 0B 47 
  }


  simulated function PostBeginPlay() {
    local Ladder L;
    local Ladder M;
    local Vector dir;
    Super.PostBeginPlay();                                                      //0000 : 1C 50 96 79 0F 16 
    LookDir = vector(WallDir);                                                  //0006 : 0F 01 00 EC 37 0F 39 39 01 B8 DD 75 0F 
    if (!bAutoPath && LookDir.Z != 0) {                                         //0013 : 07 39 01 82 81 2D 01 C0 8D 7D 0F 16 18 10 00 B5 36 38 C5 69 0F 01 00 EC 37 0F 39 3F 25 16 16 
      ClimbDir = vect(0.000000, 0.000000, 1.000000);                            //0032 : 0F 01 38 8E 7D 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 
      L = LadderList;                                                           //0045 : 0F 00 48 8D 7D 0F 01 B0 8E 7D 0F 
      while (L != None) {                                                       //0050 : 07 02 01 77 00 48 8D 7D 0F 2A 16 
        M = LadderList;                                                         //005B : 0F 00 28 8F 7D 0F 01 B0 8E 7D 0F 
        while (M != None) {                                                     //0066 : 07 EB 00 77 00 28 8F 7D 0F 2A 16 
          if (M != L) {                                                         //0071 : 07 D4 00 77 00 28 8F 7D 0F 00 48 8D 7D 0F 16 
            dir = Normal(M.Location - L.Location);                              //0080 : 0F 00 A0 8F 7D 0F E2 D8 19 00 28 8F 7D 0F 05 00 0C 01 30 81 6C 0F 19 00 48 8D 7D 0F 05 00 0C 01 30 81 6C 0F 16 16 
            if (dir Dot ClimbDir < 0) {                                         //00A6 : 07 C8 00 B0 DB 00 A0 8F 7D 0F 01 38 8E 7D 0F 16 39 3F 25 16 
              dir *= -1;                                                        //00BA : DD 00 A0 8F 7D 0F 39 3F 1D FF FF FF FF 16 
            }
            ClimbDir += dir;                                                    //00C8 : DF 01 38 8E 7D 0F 00 A0 8F 7D 0F 16 
          }
          M = M.LadderList;                                                     //00D4 : 0F 00 28 8F 7D 0F 19 00 28 8F 7D 0F 05 00 04 01 18 90 7D 0F 
        }
        L = L.LadderList;                                                       //00EB : 0F 00 48 8D 7D 0F 19 00 48 8D 7D 0F 05 00 04 01 18 90 7D 0F 
      }
      ClimbDir = Normal(ClimbDir);                                              //0102 : 0F 01 38 8E 7D 0F E2 01 38 8E 7D 0F 16 
      if (ClimbDir Dot vect(0.000000, 0.000000, 1.000000) < 0) {                //010F : 07 39 01 B0 DB 01 38 8E 7D 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 39 3F 25 16 
        ClimbDir *= -1;                                                         //012B : DD 01 38 8E 7D 0F 39 3F 1D FF FF FF FF 16 
      }
    }
    //1C 50 96 79 0F 16 0F 01 00 EC 37 0F 39 39 01 B8 DD 75 0F 07 39 01 82 81 2D 01 C0 8D 7D 0F 16 18 
    //10 00 B5 36 38 C5 69 0F 01 00 EC 37 0F 39 3F 25 16 16 0F 01 38 8E 7D 0F 23 00 00 00 00 00 00 00 
    //00 00 00 80 3F 0F 00 48 8D 7D 0F 01 B0 8E 7D 0F 07 02 01 77 00 48 8D 7D 0F 2A 16 0F 00 28 8F 7D 
    //0F 01 B0 8E 7D 0F 07 EB 00 77 00 28 8F 7D 0F 2A 16 07 D4 00 77 00 28 8F 7D 0F 00 48 8D 7D 0F 16 
    //0F 00 A0 8F 7D 0F E2 D8 19 00 28 8F 7D 0F 05 00 0C 01 30 81 6C 0F 19 00 48 8D 7D 0F 05 00 0C 01 
    //30 81 6C 0F 16 16 07 C8 00 B0 DB 00 A0 8F 7D 0F 01 38 8E 7D 0F 16 39 3F 25 16 DD 00 A0 8F 7D 0F 
    //39 3F 1D FF FF FF FF 16 DF 01 38 8E 7D 0F 00 A0 8F 7D 0F 16 0F 00 28 8F 7D 0F 19 00 28 8F 7D 0F 
    //05 00 04 01 18 90 7D 0F 06 66 00 0F 00 48 8D 7D 0F 19 00 48 8D 7D 0F 05 00 04 01 18 90 7D 0F 06 
    //50 00 0F 01 38 8E 7D 0F E2 01 38 8E 7D 0F 16 07 39 01 B0 DB 01 38 8E 7D 0F 23 00 00 00 00 00 00 
    //00 00 00 00 80 3F 16 39 3F 25 16 DD 01 38 8E 7D 0F 39 3F 1D FF FF FF FF 16 04 0B 47 
  }



