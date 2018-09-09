//==============================================================================
//  Teleporter
//==============================================================================

class Teleporter extends SmallNavigationPoint
    native
    dependsOn(ReachSpec,Pawn,Controller,Actor,LevelInfo)
    Placeable
  ;

  var (Teleporter) string URL;
  var (Teleporter) name ProductRequired;
  var (Teleporter) bool bChangesVelocity;
  var (Teleporter) bool bChangesYaw;
  var (Teleporter) bool bReversesX;
  var (Teleporter) bool bReversesY;
  var (Teleporter) bool bReversesZ;
  var (Teleporter) bool bEnabled;
  var (Teleporter) Vector TargetVelocity;
  var Actor TriggerActor;
  var Actor TriggerActor2;
  var float LastFired;


  event int SpecialCost(Pawn Other,ReachSpec Path) {
    if (Teleporter(Path.Start) == None || (Path.reachFlags & 32) == 0) {        //0000 : 07 35 00 84 72 2E 58 F5 C1 00 19 00 68 34 7B 0F 05 00 04 01 58 18 7A 0F 2A 16 18 16 00 9A 9C 19 00 68 34 7B 0F 05 00 04 01 38 1A 7A 0F 2C 20 16 25 16 16 
      return 0;                                                                 //0033 : 04 25 
    }
    return 0;                                                                   //0035 : 04 25 
    //07 35 00 84 72 2E 58 F5 C1 00 19 00 68 34 7B 0F 05 00 04 01 58 18 7A 0F 2A 16 18 16 00 9A 9C 19 
    //00 68 34 7B 0F 05 00 04 01 38 1A 7A 0F 2C 20 16 25 16 16 04 25 04 25 04 0B 47 
  }


  function Actor SpecialHandling(Pawn Other) {
    local Vector Dist2D;
    if (bEnabled
      && Teleporter(Other.Controller.RouteCache[1]) != None
      && string(Other.Controller.RouteCache[1].Tag) ~= URL) {//0000 : 07 F3 00 82 82 2D 01 A8 38 7B 0F 18 22 00 77 2E 58 F5 C1 00 1A 26 19 19 00 08 36 7B 0F 05 00 04 01 00 6E 6C 0F 05 00 40 01 80 03 71 0F 2A 16 16 18 2C 00 7C 39 57 19 1A 26 19 19 00 08 36 7B 0F 05 00 04 01 00 6E 6C 0F 05 00 40 01 80 03 71 0F 05 00 04 01 C0 9E 6C 0F 01 20 39 7B 0F 16 16 
      if (Abs(Location.Z - Other.Location.Z) < CollisionHeight + Other.CollisionHeight) {//005F : 07 F1 00 B0 BA AF 36 38 C5 69 0F 01 30 81 6C 0F 36 38 C5 69 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 6C 0F 16 16 AE 01 40 8A 6C 0F 19 00 08 36 7B 0F 05 00 04 01 40 8A 6C 0F 16 16 
        Dist2D = Location - Other.Location;                                     //009A : 0F 00 98 39 7B 0F D8 01 30 81 6C 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 6C 0F 16 
        Dist2D.Z = 0.00000000;                                                  //00B5 : 0F 36 38 C5 69 0F 00 98 39 7B 0F 1E 00 00 00 00 
        if (VSize(Dist2D) < CollisionRadius + Other.CollisionRadius) {          //00C5 : 07 F1 00 B0 E1 00 98 39 7B 0F 16 AE 01 C8 89 6C 0F 19 00 08 36 7B 0F 05 00 04 01 C8 89 6C 0F 16 16 
          PostTouch(Other);                                                     //00E6 : 1B 4B 01 00 00 00 08 36 7B 0F 16 
        }
      }
      return self;                                                              //00F1 : 04 17 
    }
    if (TriggerActor == None) {                                                 //00F3 : 07 11 01 72 01 10 3A 7B 0F 2A 16 
      FindTriggerActor();                                                       //00FE : 1B 9E 2A 00 00 16 
      if (TriggerActor == None) {                                               //0104 : 07 11 01 72 01 10 3A 7B 0F 2A 16 
        return None;                                                            //010F : 04 2A 
      }
    }
    if (TriggerActor2 != None
      && VSize(TriggerActor2.Location - Other.Location) < VSize(TriggerActor.Location - Other.Location)) {//0111 : 07 69 01 82 77 01 88 3A 7B 0F 2A 16 18 43 00 B0 E1 D8 19 01 88 3A 7B 0F 05 00 0C 01 30 81 6C 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 6C 0F 16 16 E1 D8 19 01 10 3A 7B 0F 05 00 0C 01 30 81 6C 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 6C 0F 16 16 16 16 
      return TriggerActor2;                                                     //0163 : 04 01 88 3A 7B 0F 
    }
    return TriggerActor;                                                        //0169 : 04 01 10 3A 7B 0F 
    //07 F3 00 82 82 2D 01 A8 38 7B 0F 18 22 00 77 2E 58 F5 C1 00 1A 26 19 19 00 08 36 7B 0F 05 00 04 
    //01 00 6E 6C 0F 05 00 40 01 80 03 71 0F 2A 16 16 18 2C 00 7C 39 57 19 1A 26 19 19 00 08 36 7B 0F 
    //05 00 04 01 00 6E 6C 0F 05 00 40 01 80 03 71 0F 05 00 04 01 C0 9E 6C 0F 01 20 39 7B 0F 16 16 07 
    //F1 00 B0 BA AF 36 38 C5 69 0F 01 30 81 6C 0F 36 38 C5 69 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 
    //6C 0F 16 16 AE 01 40 8A 6C 0F 19 00 08 36 7B 0F 05 00 04 01 40 8A 6C 0F 16 16 0F 00 98 39 7B 0F 
    //D8 01 30 81 6C 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 6C 0F 16 0F 36 38 C5 69 0F 00 98 39 7B 0F 
    //1E 00 00 00 00 07 F1 00 B0 E1 00 98 39 7B 0F 16 AE 01 C8 89 6C 0F 19 00 08 36 7B 0F 05 00 04 01 
    //C8 89 6C 0F 16 16 1B 4B 01 00 00 00 08 36 7B 0F 16 04 17 07 11 01 72 01 10 3A 7B 0F 2A 16 1B 9E 
    //2A 00 00 16 07 11 01 72 01 10 3A 7B 0F 2A 16 04 2A 07 69 01 82 77 01 88 3A 7B 0F 2A 16 18 43 00 
    //B0 E1 D8 19 01 88 3A 7B 0F 05 00 0C 01 30 81 6C 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 6C 0F 16 
    //16 E1 D8 19 01 10 3A 7B 0F 05 00 0C 01 30 81 6C 0F 19 00 08 36 7B 0F 05 00 0C 01 30 81 6C 0F 16 
    //16 16 16 04 01 88 3A 7B 0F 04 01 10 3A 7B 0F 04 0B 47 
  }


  simulated function PostTouch(Actor Other) {
    local Teleporter D;
    local Teleporter Dest[16];
    local int i;
    foreach AllActors(Class'Teleporter',D) {                                    //0000 : 2F 61 30 20 58 F5 C1 00 00 08 3E 7B 0F 16 5F 00 
      if (string(D.Tag) ~= URL && D != self) {                                  //0010 : 07 5E 00 82 7C 39 57 19 00 08 3E 7B 0F 05 00 04 01 C0 9E 6C 0F 01 20 39 7B 0F 16 18 09 00 77 00 08 3E 7B 0F 17 16 16 
        Dest[i] = D;                                                            //0037 : 0F 1A 00 80 3E 7B 0F 00 F8 3E 7B 0F 00 08 3E 7B 0F 
        i++;                                                                    //0048 : A5 00 80 3E 7B 0F 16 
        if (i > 16) {                                                           //004F : 07 5E 00 97 00 80 3E 7B 0F 2C 10 16 
        } else {                                                                //005B : 06 5F 00 
        }
      }
    }
    i = Rand(i);                                                                //0060 : 0F 00 80 3E 7B 0F A7 00 80 3E 7B 0F 16 
    if (Dest[i] != None) {                                                      //006D : 07 E4 00 77 1A 00 80 3E 7B 0F 00 F8 3E 7B 0F 2A 16 
      if (Other.IsA('Pawn')) {                                                  //007E : 07 A3 00 19 00 28 3C 7B 0F 08 00 04 61 2F 21 4C 08 00 00 16 
        Other.PlayTeleportEffect(False,True);                                   //0092 : 19 00 28 3C 7B 0F 08 00 00 1B CF 2A 00 00 28 27 16 
      }
      Dest[i].Accept(Other,self);                                               //00A3 : 19 1A 00 80 3E 7B 0F 00 F8 3E 7B 0F 0C 00 04 1B 50 2B 00 00 00 28 3C 7B 0F 17 16 
      if (Pawn(Other) != None) {                                                //00BE : 07 E4 00 77 2E 50 31 D4 00 00 28 3C 7B 0F 2A 16 
        TriggerEvent(Event,self,Pawn(Other));                                   //00CE : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2E 50 31 D4 00 00 28 3C 7B 0F 16 
      }
    }
    //2F 61 30 20 58 F5 C1 00 00 08 3E 7B 0F 16 5F 00 07 5E 00 82 7C 39 57 19 00 08 3E 7B 0F 05 00 04 
    //01 C0 9E 6C 0F 01 20 39 7B 0F 16 18 09 00 77 00 08 3E 7B 0F 17 16 16 0F 1A 00 80 3E 7B 0F 00 F8 
    //3E 7B 0F 00 08 3E 7B 0F A5 00 80 3E 7B 0F 16 07 5E 00 97 00 80 3E 7B 0F 2C 10 16 06 5F 00 31 30 
    //0F 00 80 3E 7B 0F A7 00 80 3E 7B 0F 16 07 E4 00 77 1A 00 80 3E 7B 0F 00 F8 3E 7B 0F 2A 16 07 A3 
    //00 19 00 28 3C 7B 0F 08 00 04 61 2F 21 4C 08 00 00 16 19 00 28 3C 7B 0F 08 00 00 1B CF 2A 00 00 
    //28 27 16 19 1A 00 80 3E 7B 0F 00 F8 3E 7B 0F 0C 00 04 1B 50 2B 00 00 00 28 3C 7B 0F 17 16 07 E4 
    //00 77 2E 50 31 D4 00 00 28 3C 7B 0F 2A 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2E 50 31 D4 00 00 28 
    //3C 7B 0F 16 04 0B 47 
  }


  event Touch(Actor Other) {
    if (!bEnabled || Other == None) {                                           //0000 : 07 1A 00 84 81 2D 01 A8 38 7B 0F 16 18 09 00 72 00 20 40 7B 0F 2A 16 16 
      return;                                                                   //0018 : 04 0B 
    }
    if (Other.bCanTeleport
      && Other.PreTeleport(self) == False) {         //001A : 07 68 00 82 19 00 20 40 7B 0F 06 00 04 2D 01 B8 C7 6E 0F 18 14 00 F2 19 00 20 40 7B 0F 07 00 04 1B 70 2C 00 00 17 16 28 16 16 
      PendingTouch = Other.PendingTouch;                                        //0044 : 0F 01 90 E9 6E 0F 19 00 20 40 7B 0F 05 00 04 01 90 E9 6E 0F 
      Other.PendingTouch = self;                                                //0058 : 0F 19 00 20 40 7B 0F 05 00 04 01 90 E9 6E 0F 17 
    }
    //07 1A 00 84 81 2D 01 A8 38 7B 0F 16 18 09 00 72 00 20 40 7B 0F 2A 16 16 04 0B 07 68 00 82 19 00 
    //20 40 7B 0F 06 00 04 2D 01 B8 C7 6E 0F 18 14 00 F2 19 00 20 40 7B 0F 07 00 04 1B 70 2C 00 00 17 
    //16 28 16 16 0F 01 90 E9 6E 0F 19 00 20 40 7B 0F 05 00 04 01 90 E9 6E 0F 0F 19 00 20 40 7B 0F 05 
    //00 04 01 90 E9 6E 0F 17 04 0B 47 
  }


  function Trigger(Actor Other,Pawn EventInstigator) {
    local Actor A;
    bEnabled = !bEnabled;                                                       //0000 : 14 2D 01 A8 38 7B 0F 81 2D 01 A8 38 7B 0F 16 
    if (bEnabled) {                                                             //000F : 07 35 00 2D 01 A8 38 7B 0F 
      foreach TouchingActors(Class'Actor',A) {                                  //0018 : 2F 61 33 20 F8 8B C1 00 00 F8 42 7B 0F 16 34 00 
        PostTouch(A);                                                           //0028 : 1B 4B 01 00 00 00 F8 42 7B 0F 16 
      }
    }
    //14 2D 01 A8 38 7B 0F 81 2D 01 A8 38 7B 0F 16 07 35 00 2D 01 A8 38 7B 0F 2F 61 33 20 F8 8B C1 00 
    //00 F8 42 7B 0F 16 34 00 1B 4B 01 00 00 00 F8 42 7B 0F 16 31 30 04 0B 47 
  }


  simulated function bool Accept(Actor Incoming,Actor Source) {
    local Rotator newRot;
    local Rotator OldRot;
    local float mag;
    local Vector oldDir;
    local Controller P;
    if (Incoming == None) {                                                     //0000 : 07 0D 00 72 00 98 44 7B 0F 2A 16 
      return False;                                                             //000B : 04 28 
    }
    Disable('Touch');                                                           //000D : 76 21 39 01 00 00 16 
    newRot = Incoming.Rotation;                                                 //0014 : 0F 00 70 4A 7B 0F 19 00 98 44 7B 0F 05 00 0C 01 00 84 6C 0F 
    if (bChangesYaw) {                                                          //0028 : 07 A0 00 2D 01 E8 4A 7B 0F 
      OldRot = Incoming.Rotation;                                               //0031 : 0F 00 60 4B 7B 0F 19 00 98 44 7B 0F 05 00 0C 01 00 84 6C 0F 
      newRot.Yaw = Rotation.Yaw;                                                //0045 : 0F 36 20 BF 69 0F 00 70 4A 7B 0F 36 20 BF 69 0F 01 00 84 6C 0F 
      if (Source != None) {                                                     //005A : 07 A0 00 77 00 D8 4B 7B 0F 2A 16 
        newRot.Yaw += 32768 + Incoming.Rotation.Yaw - Source.Rotation.Yaw;      //0065 : A1 36 20 BF 69 0F 00 70 4A 7B 0F 93 92 1D 00 80 00 00 36 20 BF 69 0F 19 00 98 44 7B 0F 05 00 0C 01 00 84 6C 0F 16 36 20 BF 69 0F 19 00 D8 4B 7B 0F 05 00 0C 01 00 84 6C 0F 16 16 
      }
    }
    if (Pawn(Incoming) != None) {                                               //00A0 : 07 5F 02 77 2E 50 31 D4 00 00 98 44 7B 0F 2A 16 
      if (SBRole == 1) {                                                        //00B0 : 07 1F 01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
        P = Level.ControllerList;                                               //00C0 : 0F 00 50 4C 7B 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 
        while (P != None) {                                                     //00D4 : 07 1F 01 77 00 50 4C 7B 0F 2A 16 
          if (P.Enemy == Incoming) {                                            //00DF : 07 08 01 72 19 00 50 4C 7B 0F 05 00 04 01 90 AF 70 0F 00 98 44 7B 0F 16 
            P.LineOfSightTo(Incoming);                                          //00F7 : 19 00 50 4C 7B 0F 08 00 04 62 02 00 98 44 7B 0F 16 
          }
          P = P.nextController;                                                 //0108 : 0F 00 50 4C 7B 0F 19 00 50 4C 7B 0F 05 00 04 01 08 F5 70 0F 
        }
      }
      if (!Pawn(Incoming).SetLocation(Location)) {                              //011F : 07 63 01 81 19 2E 50 31 D4 00 00 98 44 7B 0F 08 00 04 61 0B 01 30 81 6C 0F 16 16 
        Log(string(self) $ " Teleport failed for "
          $ string(Incoming));//013A : E7 70 70 39 56 17 1F 20 54 65 6C 65 70 6F 72 74 20 66 61 69 6C 65 64 20 66 6F 72 20 00 16 39 56 00 98 44 7B 0F 16 16 
        return False;                                                           //0161 : 04 28 
      }
      if (SBRole == 1
        || Level.TimeSeconds - LastFired > 0.50000000) {  //0163 : 07 E6 01 84 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 1D 00 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 C8 4C 7B 0F 16 1E 00 00 00 3F 16 16 
        newRot.Roll = 0;                                                        //0194 : 0F 36 98 BF 69 0F 00 70 4A 7B 0F 25 
        Pawn(Incoming).SetRotation(newRot);                                     //01A0 : 19 2E 50 31 D4 00 00 98 44 7B 0F 0B 00 04 1C 70 01 6E 0F 00 70 4A 7B 0F 16 
        Pawn(Incoming).SetViewRotation(newRot);                                 //01B9 : 19 2E 50 31 D4 00 00 98 44 7B 0F 0B 00 00 1B 14 2B 00 00 00 70 4A 7B 0F 16 
        LastFired = Level.TimeSeconds;                                          //01D2 : 0F 01 C8 4C 7B 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      }
      if (Pawn(Incoming).Controller != None) {                                  //01E6 : 07 4B 02 77 19 2E 50 31 D4 00 00 98 44 7B 0F 05 00 04 01 00 6E 6C 0F 2A 16 
        Pawn(Incoming).Controller.MoveTimer = -1.00000000;                      //01FF : 0F 19 19 2E 50 31 D4 00 00 98 44 7B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 50 B3 70 0F 1E 00 00 80 BF 
        Pawn(Incoming).Anchor = self;                                           //0221 : 0F 19 2E 50 31 D4 00 00 98 44 7B 0F 05 00 04 01 E0 1E 76 0F 17 
        Pawn(Incoming).SetMoveTarget(self);                                     //0236 : 19 2E 50 31 D4 00 00 98 44 7B 0F 07 00 00 1B 9D 2B 00 00 17 16 
      }
      Incoming.PlayTeleportEffect(False,True);                                  //024B : 19 00 98 44 7B 0F 08 00 00 1B CF 2A 00 00 28 27 16 
    } else {                                                                    //025C : 06 9B 02 
      if (!Incoming.SetLocation(Location)) {                                    //025F : 07 7E 02 81 19 00 98 44 7B 0F 08 00 04 61 0B 01 30 81 6C 0F 16 16 
        Enable('Touch');                                                        //0275 : 75 21 39 01 00 00 16 
        return False;                                                           //027C : 04 28 
      }
      if (bChangesYaw) {                                                        //027E : 07 9B 02 2D 01 E8 4A 7B 0F 
        Incoming.SetRotation(newRot);                                           //0287 : 19 00 98 44 7B 0F 0B 00 04 1C 70 01 6E 0F 00 70 4A 7B 0F 16 
      }
    }
    Enable('Touch');                                                            //029B : 75 21 39 01 00 00 16 
    if (bChangesVelocity) {                                                     //02A2 : 07 C2 02 2D 01 40 4D 7B 0F 
      Incoming.Velocity = TargetVelocity;                                       //02AB : 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 01 B8 4D 7B 0F 
    } else {                                                                    //02BF : 06 C5 03 
      if (bChangesYaw) {                                                        //02C2 : 07 5C 03 2D 01 E8 4A 7B 0F 
        if (Incoming.Physics == 1) {                                            //02CB : 07 F0 02 9A 39 3A 19 00 98 44 7B 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 01 16 
          OldRot.Pitch = 0;                                                     //02E4 : 0F 36 A8 BE 69 0F 00 60 4B 7B 0F 25 
        }
        oldDir = vector(OldRot);                                                //02F0 : 0F 00 30 4E 7B 0F 39 39 00 60 4B 7B 0F 
        mag = Incoming.Velocity Dot oldDir;                                     //02FD : 0F 00 A8 4E 7B 0F DB 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 00 30 4E 7B 0F 16 
        Incoming.Velocity = Incoming.Velocity - mag * oldDir + mag * vector(Incoming.Rotation);//0318 : 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F D7 D8 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F D5 00 A8 4E 7B 0F 00 30 4E 7B 0F 16 16 D5 00 A8 4E 7B 0F 39 39 19 00 98 44 7B 0F 05 00 0C 01 00 84 6C 0F 16 16 
      }
      if (bReversesX) {                                                         //035C : 07 7F 03 2D 01 20 4F 7B 0F 
        Incoming.Velocity.X *= -1.00000000;                                     //0365 : B6 36 48 C4 69 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 1E 00 00 80 BF 16 
      }
      if (bReversesY) {                                                         //037F : 07 A2 03 2D 01 98 4F 7B 0F 
        Incoming.Velocity.Y *= -1.00000000;                                     //0388 : B6 36 C0 C4 69 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 1E 00 00 80 BF 16 
      }
      if (bReversesZ) {                                                         //03A2 : 07 C5 03 2D 01 10 50 7B 0F 
        Incoming.Velocity.Z *= -1.00000000;                                     //03AB : B6 36 38 C5 69 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 1E 00 00 80 BF 16 
      }
    }
    return True;                                                                //03C5 : 04 27 
    //07 0D 00 72 00 98 44 7B 0F 2A 16 04 28 76 21 39 01 00 00 16 0F 00 70 4A 7B 0F 19 00 98 44 7B 0F 
    //05 00 0C 01 00 84 6C 0F 07 A0 00 2D 01 E8 4A 7B 0F 0F 00 60 4B 7B 0F 19 00 98 44 7B 0F 05 00 0C 
    //01 00 84 6C 0F 0F 36 20 BF 69 0F 00 70 4A 7B 0F 36 20 BF 69 0F 01 00 84 6C 0F 07 A0 00 77 00 D8 
    //4B 7B 0F 2A 16 A1 36 20 BF 69 0F 00 70 4A 7B 0F 93 92 1D 00 80 00 00 36 20 BF 69 0F 19 00 98 44 
    //7B 0F 05 00 0C 01 00 84 6C 0F 16 36 20 BF 69 0F 19 00 D8 4B 7B 0F 05 00 0C 01 00 84 6C 0F 16 16 
    //07 5F 02 77 2E 50 31 D4 00 00 98 44 7B 0F 2A 16 07 1F 01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
    //0F 00 50 4C 7B 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 07 1F 01 77 00 50 4C 7B 0F 2A 16 07 
    //08 01 72 19 00 50 4C 7B 0F 05 00 04 01 90 AF 70 0F 00 98 44 7B 0F 16 19 00 50 4C 7B 0F 08 00 04 
    //62 02 00 98 44 7B 0F 16 0F 00 50 4C 7B 0F 19 00 50 4C 7B 0F 05 00 04 01 08 F5 70 0F 06 D4 00 07 
    //63 01 81 19 2E 50 31 D4 00 00 98 44 7B 0F 08 00 04 61 0B 01 30 81 6C 0F 16 16 E7 70 70 39 56 17 
    //1F 20 54 65 6C 65 70 6F 72 74 20 66 61 69 6C 65 64 20 66 6F 72 20 00 16 39 56 00 98 44 7B 0F 16 
    //16 04 28 07 E6 01 84 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 1D 00 B1 AF 19 01 D8 7E 6C 0F 05 
    //00 04 01 A8 81 6C 0F 01 C8 4C 7B 0F 16 1E 00 00 00 3F 16 16 0F 36 98 BF 69 0F 00 70 4A 7B 0F 25 
    //19 2E 50 31 D4 00 00 98 44 7B 0F 0B 00 04 1C 70 01 6E 0F 00 70 4A 7B 0F 16 19 2E 50 31 D4 00 00 
    //98 44 7B 0F 0B 00 00 1B 14 2B 00 00 00 70 4A 7B 0F 16 0F 01 C8 4C 7B 0F 19 01 D8 7E 6C 0F 05 00 
    //04 01 A8 81 6C 0F 07 4B 02 77 19 2E 50 31 D4 00 00 98 44 7B 0F 05 00 04 01 00 6E 6C 0F 2A 16 0F 
    //19 19 2E 50 31 D4 00 00 98 44 7B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 50 B3 70 0F 1E 00 00 80 
    //BF 0F 19 2E 50 31 D4 00 00 98 44 7B 0F 05 00 04 01 E0 1E 76 0F 17 19 2E 50 31 D4 00 00 98 44 7B 
    //0F 07 00 00 1B 9D 2B 00 00 17 16 19 00 98 44 7B 0F 08 00 00 1B CF 2A 00 00 28 27 16 06 9B 02 07 
    //7E 02 81 19 00 98 44 7B 0F 08 00 04 61 0B 01 30 81 6C 0F 16 16 75 21 39 01 00 00 16 04 28 07 9B 
    //02 2D 01 E8 4A 7B 0F 19 00 98 44 7B 0F 0B 00 04 1C 70 01 6E 0F 00 70 4A 7B 0F 16 75 21 39 01 00 
    //00 16 07 C2 02 2D 01 40 4D 7B 0F 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 01 B8 4D 7B 0F 06 
    //C5 03 07 5C 03 2D 01 E8 4A 7B 0F 07 F0 02 9A 39 3A 19 00 98 44 7B 0F 05 00 01 01 C0 93 6C 0F 39 
    //3A 24 01 16 0F 36 A8 BE 69 0F 00 60 4B 7B 0F 25 0F 00 30 4E 7B 0F 39 39 00 60 4B 7B 0F 0F 00 A8 
    //4E 7B 0F DB 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 00 30 4E 7B 0F 16 0F 19 00 98 44 7B 0F 05 
    //00 0C 01 A0 95 6C 0F D7 D8 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F D5 00 A8 4E 7B 0F 00 30 4E 
    //7B 0F 16 16 D5 00 A8 4E 7B 0F 39 39 19 00 98 44 7B 0F 05 00 0C 01 00 84 6C 0F 16 16 07 7F 03 2D 
    //01 20 4F 7B 0F B6 36 48 C4 69 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 1E 00 00 80 BF 16 07 
    //A2 03 2D 01 98 4F 7B 0F B6 36 C0 C4 69 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 1E 00 00 80 
    //BF 16 07 C5 03 2D 01 10 50 7B 0F B6 36 38 C5 69 0F 19 00 98 44 7B 0F 05 00 0C 01 A0 95 6C 0F 1E 
    //00 00 80 BF 16 04 27 04 0B 47 
  }


  function FindTriggerActor() {
    local Actor A;
    TriggerActor = None;                                                        //0000 : 0F 01 10 3A 7B 0F 2A 
    TriggerActor2 = None;                                                       //0007 : 0F 01 88 3A 7B 0F 2A 
    foreach DynamicActors(Class'Actor',A) {                                     //000E : 2F 61 39 20 F8 8B C1 00 00 B0 51 7B 0F 16 5E 00 
      if (A.Event == Tag) {                                                     //001E : 07 5D 00 FE 19 00 B0 51 7B 0F 05 00 04 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 
        if (TriggerActor == None) {                                             //0036 : 07 4F 00 72 01 10 3A 7B 0F 2A 16 
          TriggerActor = A;                                                     //0041 : 0F 01 10 3A 7B 0F 00 B0 51 7B 0F 
        } else {                                                                //004C : 06 5D 00 
          TriggerActor2 = A;                                                    //004F : 0F 01 88 3A 7B 0F 00 B0 51 7B 0F 
          return;                                                               //005B : 04 0B 
        }
      }
    }
    //0F 01 10 3A 7B 0F 2A 0F 01 88 3A 7B 0F 2A 2F 61 39 20 F8 8B C1 00 00 B0 51 7B 0F 16 5E 00 07 5D 
    //00 FE 19 00 B0 51 7B 0F 05 00 04 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 07 4F 00 72 01 10 3A 7B 0F 2A 
    //16 0F 01 10 3A 7B 0F 00 B0 51 7B 0F 06 5D 00 0F 01 88 3A 7B 0F 00 B0 51 7B 0F 30 04 0B 31 30 04 
    //0B 47 
  }


  function PostBeginPlay() {
    local int i;
    if (URL ~= "") {                                                            //0000 : 07 11 00 7C 01 20 39 7B 0F 1F 00 16 
      SetCollision(False,False);                                                //000C : 61 06 28 28 16 
    }
    if (!bEnabled) {                                                            //0011 : 07 22 00 81 2D 01 A8 38 7B 0F 16 
      FindTriggerActor();                                                       //001C : 1B 9E 2A 00 00 16 
    }
    i = 0;                                                                      //0022 : 0F 00 D8 52 7B 0F 25 
    while (i < PathList.Length) {                                               //0029 : 07 A9 00 96 00 D8 52 7B 0F 37 01 70 DD 79 0F 16 
      if (Teleporter(PathList[i].End) != None) {                                //0039 : 07 9F 00 77 2E 58 F5 C1 00 19 10 00 D8 52 7B 0F 01 70 DD 79 0F 05 00 04 01 D0 18 7A 0F 2A 16 
        PathList[i].bForced = True;                                             //0058 : 14 19 10 00 D8 52 7B 0F 01 70 DD 79 0F 06 00 04 2D 01 A0 1B 7A 0F 27 
        PathList[i].reachFlags = PathList[i].reachFlags | 256;                  //006F : 0F 19 10 00 D8 52 7B 0F 01 70 DD 79 0F 05 00 04 01 38 1A 7A 0F 9E 19 10 00 D8 52 7B 0F 01 70 DD 79 0F 05 00 04 01 38 1A 7A 0F 1D 00 01 00 00 16 
      }
      i++;                                                                      //009F : A5 00 D8 52 7B 0F 16 
    }
    Super.PostBeginPlay();                                                      //00A9 : 1C A8 DA 79 0F 16 
    //07 11 00 7C 01 20 39 7B 0F 1F 00 16 61 06 28 28 16 07 22 00 81 2D 01 A8 38 7B 0F 16 1B 9E 2A 00 
    //00 16 0F 00 D8 52 7B 0F 25 07 A9 00 96 00 D8 52 7B 0F 37 01 70 DD 79 0F 16 07 9F 00 77 2E 58 F5 
    //C1 00 19 10 00 D8 52 7B 0F 01 70 DD 79 0F 05 00 04 01 D0 18 7A 0F 2A 16 14 19 10 00 D8 52 7B 0F 
    //01 70 DD 79 0F 06 00 04 2D 01 A0 1B 7A 0F 27 0F 19 10 00 D8 52 7B 0F 01 70 DD 79 0F 05 00 04 01 
    //38 1A 7A 0F 9E 19 10 00 D8 52 7B 0F 01 70 DD 79 0F 05 00 04 01 38 1A 7A 0F 1D 00 01 00 00 16 A5 
    //00 D8 52 7B 0F 16 06 29 00 1C A8 DA 79 0F 16 04 0B 47 
  }



