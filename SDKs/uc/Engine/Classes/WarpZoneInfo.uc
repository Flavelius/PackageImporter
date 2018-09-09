//==============================================================================
//  WarpZoneInfo
//==============================================================================

class WarpZoneInfo extends ZoneInfo
    native
    dependsOn(Controller,Pawn,Actor)
  ;

  var (WarpZoneInfo) string OtherSideURL;
  var (WarpZoneInfo) name ThisTag;
  var (WarpZoneInfo) bool bNoTeleFrag;
  var const int iWarpZone;
  var const Coords WarpCoords;
  var transient WarpZoneInfo OtherSideActor;
  var transient Object OtherSideLevel;
  var (WarpZoneInfo) string Destinations[8];
  var int numDestinations;


  event ActorLeaving(Actor Other) {
    if (Other.IsA('Pawn')) {                                                    //0000 : 07 2A 00 19 00 90 A4 3B 19 08 00 04 61 2F 21 4C 08 00 00 16 
      Pawn(Other).bWarping = False;                                             //0014 : 14 19 2E 50 31 D4 00 00 90 A4 3B 19 06 00 04 2D 01 D0 D3 75 0F 28 
    }
    //07 2A 00 19 00 90 A4 3B 19 08 00 04 61 2F 21 4C 08 00 00 16 14 19 2E 50 31 D4 00 00 90 A4 3B 19 
    //06 00 04 2D 01 D0 D3 75 0F 28 04 0B 47 
  }


  simulated function ActorEntered(Actor Other) {
    local Vector L;
    local Rotator R;
    local Controller P;
    if (!Other.bJustTeleported) {                                               //0000 : 07 26 02 81 19 00 20 A6 3B 19 06 00 04 2D 01 E0 E5 6E 0F 16 
      Generate();                                                               //0014 : 1B 54 2B 00 00 16 
      if (OtherSideActor != None) {                                             //001A : 07 26 02 77 01 B8 A9 3B 19 2A 16 
        Other.Disable('Touch');                                                 //0025 : 19 00 20 A6 3B 19 07 00 00 76 21 39 01 00 00 16 
        Other.Disable('UnTouch');                                               //0035 : 19 00 20 A6 3B 19 07 00 00 76 21 3A 01 00 00 16 
        L = Other.Location;                                                     //0045 : 0F 00 30 AA 3B 19 19 00 20 A6 3B 19 05 00 0C 01 30 81 6C 0F 
        if (Pawn(Other) != None) {                                              //0059 : 07 83 00 77 2E 50 31 D4 00 00 20 A6 3B 19 2A 16 
          R = Pawn(Other).GetViewRotation();                                    //0069 : 0F 00 A8 AA 3B 19 19 2E 50 31 D4 00 00 20 A6 3B 19 06 00 0C 1B BC 2A 00 00 16 
        }
        UnWarp(L,Other.Velocity,R);                                             //0083 : 61 3B 00 30 AA 3B 19 19 00 20 A6 3B 19 05 00 0C 01 A0 95 6C 0F 00 A8 AA 3B 19 16 
        OtherSideActor.Warp(L,Other.Velocity,R);                                //009E : 19 01 B8 A9 3B 19 1B 00 00 61 3A 00 30 AA 3B 19 19 00 20 A6 3B 19 05 00 0C 01 A0 95 6C 0F 00 A8 AA 3B 19 16 
        if (Other.IsA('Pawn')) {                                                //00C2 : 07 E1 01 19 00 20 A6 3B 19 08 00 04 61 2F 21 4C 08 00 00 16 
          Pawn(Other).bWarping = bNoTeleFrag;                                   //00D6 : 14 19 2E 50 31 D4 00 00 20 A6 3B 19 06 00 04 2D 01 D0 D3 75 0F 2D 01 20 AB 3B 19 
          if (Other.SetLocation(L)) {                                           //00F1 : 07 D7 01 19 00 20 A6 3B 19 08 00 04 61 0B 00 30 AA 3B 19 16 
            if (SBRole == 1) {                                                  //0105 : 07 74 01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
              P = Level.ControllerList;                                         //0115 : 0F 00 98 AB 3B 19 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 
              while (P != None) {                                               //0129 : 07 74 01 77 00 98 AB 3B 19 2A 16 
                if (P.Enemy == Other) {                                         //0134 : 07 5D 01 72 19 00 98 AB 3B 19 05 00 04 01 90 AF 70 0F 00 20 A6 3B 19 16 
                  P.LineOfSightTo(Other);                                       //014C : 19 00 98 AB 3B 19 08 00 04 62 02 00 20 A6 3B 19 16 
                }
                P = P.nextController;                                           //015D : 0F 00 98 AB 3B 19 19 00 98 AB 3B 19 05 00 04 01 08 F5 70 0F 
              }
            }
            R.Roll = 0;                                                         //0174 : 0F 36 98 BF 69 0F 00 A8 AA 3B 19 25 
            Pawn(Other).SetViewRotation(R);                                     //0180 : 19 2E 50 31 D4 00 00 20 A6 3B 19 0B 00 00 1B 14 2B 00 00 00 A8 AA 3B 19 16 
            if (Pawn(Other).Controller != None) {                               //0199 : 07 D4 01 77 19 2E 50 31 D4 00 00 20 A6 3B 19 05 00 04 01 00 6E 6C 0F 2A 16 
              Pawn(Other).Controller.MoveTimer = -1.00000000;                   //01B2 : 0F 19 19 2E 50 31 D4 00 00 20 A6 3B 19 05 00 04 01 00 6E 6C 0F 05 00 04 01 50 B3 70 0F 1E 00 00 80 BF 
            }
          } else {                                                              //01D4 : 06 DE 01 
            GotoState('DelayedWarp');                                           //01D7 : 71 21 7D 2C 00 00 16 
          }
        } else {                                                                //01DE : 06 06 02 
          Other.SetLocation(L);                                                 //01E1 : 19 00 20 A6 3B 19 08 00 04 61 0B 00 30 AA 3B 19 16 
          Other.SetRotation(R);                                                 //01F2 : 19 00 20 A6 3B 19 0B 00 04 1C 70 01 6E 0F 00 A8 AA 3B 19 16 
        }
        Other.Enable('Touch');                                                  //0206 : 19 00 20 A6 3B 19 07 00 00 75 21 39 01 00 00 16 
        Other.Enable('UnTouch');                                                //0216 : 19 00 20 A6 3B 19 07 00 00 75 21 3A 01 00 00 16 
      }
    }
    //07 26 02 81 19 00 20 A6 3B 19 06 00 04 2D 01 E0 E5 6E 0F 16 1B 54 2B 00 00 16 07 26 02 77 01 B8 
    //A9 3B 19 2A 16 19 00 20 A6 3B 19 07 00 00 76 21 39 01 00 00 16 19 00 20 A6 3B 19 07 00 00 76 21 
    //3A 01 00 00 16 0F 00 30 AA 3B 19 19 00 20 A6 3B 19 05 00 0C 01 30 81 6C 0F 07 83 00 77 2E 50 31 
    //D4 00 00 20 A6 3B 19 2A 16 0F 00 A8 AA 3B 19 19 2E 50 31 D4 00 00 20 A6 3B 19 06 00 0C 1B BC 2A 
    //00 00 16 61 3B 00 30 AA 3B 19 19 00 20 A6 3B 19 05 00 0C 01 A0 95 6C 0F 00 A8 AA 3B 19 16 19 01 
    //B8 A9 3B 19 1B 00 00 61 3A 00 30 AA 3B 19 19 00 20 A6 3B 19 05 00 0C 01 A0 95 6C 0F 00 A8 AA 3B 
    //19 16 07 E1 01 19 00 20 A6 3B 19 08 00 04 61 2F 21 4C 08 00 00 16 14 19 2E 50 31 D4 00 00 20 A6 
    //3B 19 06 00 04 2D 01 D0 D3 75 0F 2D 01 20 AB 3B 19 07 D7 01 19 00 20 A6 3B 19 08 00 04 61 0B 00 
    //30 AA 3B 19 16 07 74 01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 0F 00 98 AB 3B 19 19 01 D8 7E 6C 
    //0F 05 00 04 01 A8 E1 74 0F 07 74 01 77 00 98 AB 3B 19 2A 16 07 5D 01 72 19 00 98 AB 3B 19 05 00 
    //04 01 90 AF 70 0F 00 20 A6 3B 19 16 19 00 98 AB 3B 19 08 00 04 62 02 00 20 A6 3B 19 16 0F 00 98 
    //AB 3B 19 19 00 98 AB 3B 19 05 00 04 01 08 F5 70 0F 06 29 01 0F 36 98 BF 69 0F 00 A8 AA 3B 19 25 
    //19 2E 50 31 D4 00 00 20 A6 3B 19 0B 00 00 1B 14 2B 00 00 00 A8 AA 3B 19 16 07 D4 01 77 19 2E 50 
    //31 D4 00 00 20 A6 3B 19 05 00 04 01 00 6E 6C 0F 2A 16 0F 19 19 2E 50 31 D4 00 00 20 A6 3B 19 05 
    //00 04 01 00 6E 6C 0F 05 00 04 01 50 B3 70 0F 1E 00 00 80 BF 06 DE 01 71 21 7D 2C 00 00 16 06 06 
    //02 19 00 20 A6 3B 19 08 00 04 61 0B 00 30 AA 3B 19 16 19 00 20 A6 3B 19 0B 00 04 1C 70 01 6E 0F 
    //00 A8 AA 3B 19 16 19 00 20 A6 3B 19 07 00 00 75 21 39 01 00 00 16 19 00 20 A6 3B 19 07 00 00 75 
    //21 3A 01 00 00 16 04 0B 47 
  }


  simulated event ForceGenerate() {
    if (InStr(OtherSideURL,"/") >= 0) {                                         //0000 : 07 21 00 99 7E 01 80 AD 3B 19 1F 2F 00 16 25 16 
      OtherSideLevel = None;                                                    //0010 : 0F 01 F8 AD 3B 19 2A 
      OtherSideActor = None;                                                    //0017 : 0F 01 B8 A9 3B 19 2A 
    } else {                                                                    //001E : 06 68 00 
      OtherSideLevel = XLevel;                                                  //0021 : 0F 01 F8 AD 3B 19 01 E8 87 6E 0F 
      foreach AllActors(Class'WarpZoneInfo',OtherSideActor) {                   //002C : 2F 61 30 20 18 F0 C1 00 01 B8 A9 3B 19 16 67 00 
        if (string(OtherSideActor.ThisTag) ~= OtherSideURL
          && OtherSideActor != self) {//003C : 07 66 00 82 7C 39 57 19 01 B8 A9 3B 19 05 00 04 01 70 AE 3B 19 01 80 AD 3B 19 16 18 09 00 77 01 B8 A9 3B 19 17 16 16 
        } else {                                                                //0063 : 06 67 00 
        }
      }
    }
    //07 21 00 99 7E 01 80 AD 3B 19 1F 2F 00 16 25 16 0F 01 F8 AD 3B 19 2A 0F 01 B8 A9 3B 19 2A 06 68 
    //00 0F 01 F8 AD 3B 19 01 E8 87 6E 0F 2F 61 30 20 18 F0 C1 00 01 B8 A9 3B 19 16 67 00 07 66 00 82 
    //7C 39 57 19 01 B8 A9 3B 19 05 00 04 01 70 AE 3B 19 01 80 AD 3B 19 16 18 09 00 77 01 B8 A9 3B 19 
    //17 16 16 06 67 00 31 30 04 0B 47 
  }


  simulated event Generate() {
    if (OtherSideLevel != None) {                                               //0000 : 07 0D 00 77 01 F8 AD 3B 19 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    ForceGenerate();                                                            //000D : 1B 4F 2B 00 00 16 
    //07 0D 00 77 01 F8 AD 3B 19 2A 16 04 0B 1B 4F 2B 00 00 16 04 0B 47 
  }


  function Trigger(Actor Other,Pawn EventInstigator) {
    local int nextPick;
    if (numDestinations == 0) {                                                 //0000 : 07 0D 00 9A 01 E8 29 38 0F 25 16 
      return;                                                                   //000B : 04 0B 
    }
    nextPick = 0;                                                               //000D : 0F 00 A8 B1 3B 19 25 
    while (nextPick < 8
      && Destinations[nextPick] != OtherSideURL) {      //0014 : 07 41 00 82 96 00 A8 B1 3B 19 2C 08 16 18 13 00 7B 1A 00 A8 B1 3B 19 01 20 B2 3B 19 01 80 AD 3B 19 16 16 
      nextPick++;                                                               //0037 : A5 00 A8 B1 3B 19 16 
    }
    nextPick++;                                                                 //0041 : A5 00 A8 B1 3B 19 16 
    if (nextPick > 7 || Destinations[nextPick] == "") {                         //0048 : 07 6F 00 84 97 00 A8 B1 3B 19 2C 07 16 18 10 00 7A 1A 00 A8 B1 3B 19 01 20 B2 3B 19 1F 00 16 16 
      nextPick = 0;                                                             //0068 : 0F 00 A8 B1 3B 19 25 
    }
    OtherSideURL = Destinations[nextPick];                                      //006F : 0F 01 80 AD 3B 19 1A 00 A8 B1 3B 19 01 20 B2 3B 19 
    ForceGenerate();                                                            //0080 : 1B 4F 2B 00 00 16 
    //07 0D 00 9A 01 E8 29 38 0F 25 16 04 0B 0F 00 A8 B1 3B 19 25 07 41 00 82 96 00 A8 B1 3B 19 2C 08 
    //16 18 13 00 7B 1A 00 A8 B1 3B 19 01 20 B2 3B 19 01 80 AD 3B 19 16 16 A5 00 A8 B1 3B 19 16 06 14 
    //00 A5 00 A8 B1 3B 19 16 07 6F 00 84 97 00 A8 B1 3B 19 2C 07 16 18 10 00 7A 1A 00 A8 B1 3B 19 01 
    //20 B2 3B 19 1F 00 16 16 0F 00 A8 B1 3B 19 25 0F 01 80 AD 3B 19 1A 00 A8 B1 3B 19 01 20 B2 3B 19 
    //1B 4F 2B 00 00 16 04 0B 47 
  }


  function PreBeginPlay() {
    Super.PreBeginPlay();                                                       //0000 : 1C 10 76 72 0F 16 
    Generate();                                                                 //0006 : 1B 54 2B 00 00 16 
    numDestinations = 0;                                                        //000C : 0F 01 E8 29 38 0F 25 
    while (numDestinations < 8) {                                               //0013 : 07 46 00 96 01 E8 29 38 0F 2C 08 16 
      if (Destinations[numDestinations] != "") {                                //001F : 07 3B 00 7B 1A 01 E8 29 38 0F 01 20 B2 3B 19 1F 00 16 
        numDestinations++;                                                      //0031 : A5 01 E8 29 38 0F 16 
      } else {                                                                  //0038 : 06 43 00 
        numDestinations = 8;                                                    //003B : 0F 01 E8 29 38 0F 2C 08 
      }
    }
    if (numDestinations > 0 && OtherSideURL == "") {                            //0046 : 07 6C 00 82 97 01 E8 29 38 0F 25 16 18 0A 00 7A 01 80 AD 3B 19 1F 00 16 16 
      OtherSideURL = Destinations[0];                                           //005F : 0F 01 80 AD 3B 19 1A 25 01 20 B2 3B 19 
    }
    //1C 10 76 72 0F 16 1B 54 2B 00 00 16 0F 01 E8 29 38 0F 25 07 46 00 96 01 E8 29 38 0F 2C 08 16 07 
    //3B 00 7B 1A 01 E8 29 38 0F 01 20 B2 3B 19 1F 00 16 A5 01 E8 29 38 0F 16 06 43 00 0F 01 E8 29 38 
    //0F 2C 08 06 13 00 07 6C 00 82 97 01 E8 29 38 0F 25 16 18 0A 00 7A 01 80 AD 3B 19 1F 00 16 16 0F 
    //01 80 AD 3B 19 1A 25 01 20 B2 3B 19 04 0B 47 
  }


  final native(315) function UnWarp(out Vector loc,out Vector Vel,out Rotator R);


  final native(314) function Warp(out Vector loc,out Vector Vel,out Rotator R);


  state DelayedWarp {

      function Tick(float DeltaTime) {
        local Controller P;
        local bool bFound;
        P = Level.ControllerList;                                               //0000 : 0F 00 68 2E 38 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 
        while (P != None) {                                                     //0014 : 07 88 00 77 00 68 2E 38 0F 2A 16 
          if (P.Pawn.bWarping && P.Pawn.Region.Zone == self) {                  //001F : 07 71 00 82 19 19 00 68 2E 38 0F 05 00 04 01 88 83 6C 0F 06 00 04 2D 01 D0 D3 75 0F 18 20 00 72 36 58 43 6E 0F 19 19 00 68 2E 38 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 17 16 16 
            bFound = True;                                                      //005E : 14 2D 00 68 A3 3B 19 27 
            ActorEntered(P);                                                    //0066 : 1B 41 01 00 00 00 68 2E 38 0F 16 
          }
          P = P.nextController;                                                 //0071 : 0F 00 68 2E 38 0F 19 00 68 2E 38 0F 05 00 04 01 08 F5 70 0F 
        }
        if (!bFound) {                                                          //0088 : 07 9A 00 81 2D 00 68 A3 3B 19 16 
          GotoState('None');                                                    //0093 : 71 21 00 00 00 00 16 
        }
        //0F 00 68 2E 38 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 E1 74 0F 07 88 00 77 00 68 2E 38 0F 2A 16 07 
        //71 00 82 19 19 00 68 2E 38 0F 05 00 04 01 88 83 6C 0F 06 00 04 2D 01 D0 D3 75 0F 18 20 00 72 36 
        //58 43 6E 0F 19 19 00 68 2E 38 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 17 16 16 14 2D 
        //00 68 A3 3B 19 27 1B 41 01 00 00 00 68 2E 38 0F 16 0F 00 68 2E 38 0F 19 00 68 2E 38 0F 05 00 04 
        //01 08 F5 70 0F 06 14 00 07 9A 00 81 2D 00 68 A3 3B 19 16 71 21 00 00 00 00 16 04 0B 47 
      }


    //08 47 

  }



