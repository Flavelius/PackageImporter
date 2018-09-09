//==============================================================================
//  PotentialClimbWatcher
//==============================================================================

class PotentialClimbWatcher extends Info
    native
    dependsOn(Pawn,LadderVolume)
  ;


  function Tick(float DeltaTime) {
    local Rotator PawnRot;
    local LadderVolume L;
    local bool bFound;
    if (Owner == None || Owner.bDeleteMe
      || !Pawn(Owner).CanGrabLadder()) {//0000 : 07 3F 00 84 84 72 01 B0 9F 6C 0F 2A 16 18 10 00 19 01 B0 9F 6C 0F 06 00 04 2D 01 58 92 6C 0F 16 18 17 00 81 19 2E 50 31 D4 00 01 B0 9F 6C 0F 06 00 04 1B 8D 12 00 00 16 16 16 
      Destroy();                                                                //003A : 61 17 16 
      return;                                                                   //003D : 04 0B 
    }
    PawnRot = Owner.Rotation;                                                   //003F : 0F 00 E0 21 80 0F 19 01 B0 9F 6C 0F 05 00 0C 01 00 84 6C 0F 
    PawnRot.Pitch = 0;                                                          //0053 : 0F 36 A8 BE 69 0F 00 E0 21 80 0F 25 
    foreach Owner.TouchingActors(Class'LadderVolume',L) {                       //005F : 2F 19 01 B0 9F 6C 0F 0D 00 00 61 33 20 D8 68 C2 00 00 58 22 80 0F 16 DB 00 
      if (L.Encompasses(Owner)) {                                               //0078 : 07 DA 00 19 00 58 22 80 0F 0B 00 04 1B EE 2B 00 00 01 B0 9F 6C 0F 16 
        if (vector(PawnRot) Dot L.LookDir > 0.89999998) {                       //008F : 07 D2 00 B1 DB 39 39 00 E0 21 80 0F 19 00 58 22 80 0F 05 00 0C 01 00 EC 37 0F 16 1E 66 66 66 3F 16 
          Pawn(Owner).ClimbLadder(L);                                           //00B0 : 19 2E 50 31 D4 00 01 B0 9F 6C 0F 0B 00 00 1B 71 2B 00 00 00 58 22 80 0F 16 
          Destroy();                                                            //00C9 : 61 17 16 
          return;                                                               //00CD : 04 0B 
        } else {                                                                //00CF : 06 DA 00 
          bFound = True;                                                        //00D2 : 14 2D 00 D0 22 80 0F 27 
        }
      }
    }
    if (!bFound) {                                                              //00DC : 07 EA 00 81 2D 00 D0 22 80 0F 16 
      Destroy();                                                                //00E7 : 61 17 16 
    }
    //07 3F 00 84 84 72 01 B0 9F 6C 0F 2A 16 18 10 00 19 01 B0 9F 6C 0F 06 00 04 2D 01 58 92 6C 0F 16 
    //18 17 00 81 19 2E 50 31 D4 00 01 B0 9F 6C 0F 06 00 04 1B 8D 12 00 00 16 16 16 61 17 16 04 0B 0F 
    //00 E0 21 80 0F 19 01 B0 9F 6C 0F 05 00 0C 01 00 84 6C 0F 0F 36 A8 BE 69 0F 00 E0 21 80 0F 25 2F 
    //19 01 B0 9F 6C 0F 0D 00 00 61 33 20 D8 68 C2 00 00 58 22 80 0F 16 DB 00 07 DA 00 19 00 58 22 80 
    //0F 0B 00 04 1B EE 2B 00 00 01 B0 9F 6C 0F 16 07 D2 00 B1 DB 39 39 00 E0 21 80 0F 19 00 58 22 80 
    //0F 05 00 0C 01 00 EC 37 0F 16 1E 66 66 66 3F 16 19 2E 50 31 D4 00 01 B0 9F 6C 0F 0B 00 00 1B 71 
    //2B 00 00 00 58 22 80 0F 16 61 17 16 30 04 0B 06 DA 00 14 2D 00 D0 22 80 0F 27 31 30 07 EA 00 81 
    //2D 00 D0 22 80 0F 16 61 17 16 04 0B 47 
  }


  function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    if (IsClient()) {                                                           //0006 : 07 17 00 1B 1C 0C 00 00 16 
      SBRole = 10;                                                              //000F : 0F 01 40 B2 6C 0F 24 0A 
    }
    //1C D0 02 38 0F 16 07 17 00 1B 1C 0C 00 00 16 0F 01 40 B2 6C 0F 24 0A 04 0B 47 
  }



