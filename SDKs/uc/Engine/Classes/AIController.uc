//==============================================================================
//  AIController
//==============================================================================

class AIController extends Controller
    native
    dependsOn(Mover,NavigationPoint,LevelInfo,AIScript)
    Transient
    Config(User)
  ;

  var bool bHunting;
  var bool bAdjustFromWalls;
  var bool bPlannedJump;
  var AIScript MyScript;
  var float Skill;


  function Startle(Actor A);


  function bool PriorityObjective() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function MoverFinished() {
    if (PendingMover.myMarker.ProceedWithMove(Pawn)) {                          //0000 : 07 2F 00 19 19 01 40 B4 70 0F 05 00 04 01 98 14 79 0F 0B 00 04 1B 5D 2B 00 00 01 88 83 6C 0F 16 
      PendingMover = None;                                                      //0020 : 0F 01 40 B4 70 0F 2A 
      bPreparingMove = False;                                                   //0027 : 14 2D 01 70 B1 70 0F 28 
    }
    //07 2F 00 19 19 01 40 B4 70 0F 05 00 04 01 98 14 79 0F 0B 00 04 1B 5D 2B 00 00 01 88 83 6C 0F 16 
    //0F 01 40 B4 70 0F 2A 14 2D 01 70 B1 70 0F 28 04 0B 47 
  }


  function WaitForMover(Mover M) {
    if (Enemy != None
      && Level.TimeSeconds - LastSeenTime < 3.00000000) { //0000 : 07 37 00 82 77 01 90 AF 70 0F 2A 16 18 1D 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 08 B0 70 0F 16 1E 00 00 40 40 16 16 
      Focus = Enemy;                                                            //002C : 0F 01 A0 F8 70 0F 01 90 AF 70 0F 
    }
    PendingMover = M;                                                           //0037 : 0F 01 40 B4 70 0F 00 E8 BE 7D 0F 
    bPreparingMove = True;                                                      //0042 : 14 2D 01 70 B1 70 0F 27 
    Pawn.Acceleration = vect(0.000000, 0.000000, 0.000000);                     //004A : 0F 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    //07 37 00 82 77 01 90 AF 70 0F 2A 16 18 1D 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 
    //08 B0 70 0F 16 1E 00 00 40 40 16 16 0F 01 A0 F8 70 0F 01 90 AF 70 0F 0F 01 40 B4 70 0F 00 E8 BE 
    //7D 0F 14 2D 01 70 B1 70 0F 27 0F 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 
    //00 00 00 00 00 00 04 0B 47 
  }


  event PrepareForMove(NavigationPoint Goal,ReachSpec Path);


  function name GetOrders() {
    return 'None';                                                              //0000 : 04 21 00 00 00 00 
    //04 21 00 00 00 00 04 0B 47 
  }


  function Actor GetOrderObject() {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  function SetOrders(name NewOrders,Controller OrderGiver);


  function int GetFacingDirection() {
    local float strafeMag;
    local Vector Focus2D;
    local Vector Loc2D;
    local Vector Dest2D;
    local Vector dir;
    local Vector LookDir;
    local Vector Y;
    Focus2D = FocalPoint;                                                       //0000 : 0F 00 60 C7 7D 0F 01 E0 F7 70 0F 
    Focus2D.Z = 0.00000000;                                                     //000B : 0F 36 38 C5 69 0F 00 60 C7 7D 0F 1E 00 00 00 00 
    Loc2D = Pawn.Location;                                                      //001B : 0F 00 D8 C7 7D 0F 19 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 
    Loc2D.Z = 0.00000000;                                                       //002F : 0F 36 38 C5 69 0F 00 D8 C7 7D 0F 1E 00 00 00 00 
    Dest2D = Destination;                                                       //003F : 0F 00 50 C8 7D 0F 01 20 F7 70 0F 
    Dest2D.Z = 0.00000000;                                                      //004A : 0F 36 38 C5 69 0F 00 50 C8 7D 0F 1E 00 00 00 00 
    LookDir = Normal(Focus2D - Loc2D);                                          //005A : 0F 00 C8 C8 7D 0F E2 D8 00 60 C7 7D 0F 00 D8 C7 7D 0F 16 16 
    dir = Normal(Dest2D - Loc2D);                                               //006E : 0F 00 40 C9 7D 0F E2 D8 00 50 C8 7D 0F 00 D8 C7 7D 0F 16 16 
    strafeMag = LookDir Dot dir;                                                //0082 : 0F 00 B8 C9 7D 0F DB 00 C8 C8 7D 0F 00 40 C9 7D 0F 16 
    Y = LookDir Cross vect(0.000000, 0.000000, 1.000000);                       //0094 : 0F 00 30 CA 7D 0F DC 00 C8 C8 7D 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 
    if (Y Dot (Dest2D - Loc2D) < 0) {                                           //00AE : 07 E6 00 B0 DB 00 30 CA 7D 0F D8 00 50 C8 7D 0F 00 D8 C7 7D 0F 16 16 39 3F 25 16 
      return 49152 + 16384 * strafeMag;                                         //00C9 : 04 39 44 AE 39 3F 1D 00 C0 00 00 AB 39 3F 1D 00 40 00 00 00 B8 C9 7D 0F 16 16 
    } else {                                                                    //00E3 : 06 00 01 
      return 16384 - 16384 * strafeMag;                                         //00E6 : 04 39 44 AF 39 3F 1D 00 40 00 00 AB 39 3F 1D 00 40 00 00 00 B8 C9 7D 0F 16 16 
    }
    //0F 00 60 C7 7D 0F 01 E0 F7 70 0F 0F 36 38 C5 69 0F 00 60 C7 7D 0F 1E 00 00 00 00 0F 00 D8 C7 7D 
    //0F 19 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 0F 36 38 C5 69 0F 00 D8 C7 7D 0F 1E 00 00 00 00 0F 
    //00 50 C8 7D 0F 01 20 F7 70 0F 0F 36 38 C5 69 0F 00 50 C8 7D 0F 1E 00 00 00 00 0F 00 C8 C8 7D 0F 
    //E2 D8 00 60 C7 7D 0F 00 D8 C7 7D 0F 16 16 0F 00 40 C9 7D 0F E2 D8 00 50 C8 7D 0F 00 D8 C7 7D 0F 
    //16 16 0F 00 B8 C9 7D 0F DB 00 C8 C8 7D 0F 00 40 C9 7D 0F 16 0F 00 30 CA 7D 0F DC 00 C8 C8 7D 0F 
    //23 00 00 00 00 00 00 00 00 00 00 80 3F 16 07 E6 00 B0 DB 00 30 CA 7D 0F D8 00 50 C8 7D 0F 00 D8 
    //C7 7D 0F 16 16 39 3F 25 16 04 39 44 AE 39 3F 1D 00 C0 00 00 AB 39 3F 1D 00 40 00 00 00 B8 C9 7D 
    //0F 16 16 06 00 01 04 39 44 AF 39 3F 1D 00 40 00 00 AB 39 3F 1D 00 40 00 00 00 B8 C9 7D 0F 16 16 
    //04 0B 47 
  }


  function DisplayDebug(Canvas Canvas,out float YL,out float YPos) {
    local int i;
    local string t;
    Super.DisplayDebug(Canvas,YL,YPos);                                         //0000 : 1C 08 B7 70 0F 00 58 CB 7D 0F 00 C8 D0 7D 0F 00 40 D1 7D 0F 16 
    Canvas.DrawColor.B = 255;                                                   //0015 : 0F 36 E0 8F 6A 0F 19 00 58 CB 7D 0F 05 00 04 01 90 96 6C 0F 39 3D 2C FF 
    if (Pawn != None && MoveTarget != None
      && Pawn.ReachedDestination(MoveTarget)) {//002D : 07 EA 00 82 82 77 01 88 83 6C 0F 2A 16 18 09 00 77 01 C8 B3 70 0F 2A 16 16 18 15 00 19 01 88 83 6C 0F 0B 00 04 1B 78 2B 00 00 01 C8 B3 70 0F 16 16 
      Canvas.DrawText("     Skill " $ string(Skill) $ " NAVIGATION MoveTarget "
        $ GetItemName(string(MoveTarget))
        $ "(REACHED) PendingMover "
        $ string(PendingMover)
        $ " MoveTimer "
        $ string(MoveTimer),False);//005E : 19 00 58 CB 7D 0F 80 00 00 61 D1 70 70 70 70 70 70 70 1F 20 20 20 20 20 53 6B 69 6C 6C 20 00 39 55 01 80 BB 75 0F 16 1F 20 4E 41 56 49 47 41 54 49 4F 4E 20 4D 6F 76 65 54 61 72 67 65 74 20 00 16 1B 46 29 00 00 39 56 01 C8 B3 70 0F 16 16 1F 28 52 45 41 43 48 45 44 29 20 50 65 6E 64 69 6E 67 4D 6F 76 65 72 20 00 16 39 56 01 40 B4 70 0F 16 1F 20 4D 6F 76 65 54 69 6D 65 72 20 00 16 39 55 01 50 B3 70 0F 16 28 16 
    } else {                                                                    //00E7 : 06 6A 01 
      Canvas.DrawText("     Skill " $ string(Skill) $ " NAVIGATION MoveTarget "
        $ GetItemName(string(MoveTarget))
        $ " PendingMover "
        $ string(PendingMover)
        $ " MoveTimer "
        $ string(MoveTimer),False);//00EA : 19 00 58 CB 7D 0F 77 00 00 61 D1 70 70 70 70 70 70 70 1F 20 20 20 20 20 53 6B 69 6C 6C 20 00 39 55 01 80 BB 75 0F 16 1F 20 4E 41 56 49 47 41 54 49 4F 4E 20 4D 6F 76 65 54 61 72 67 65 74 20 00 16 1B 46 29 00 00 39 56 01 C8 B3 70 0F 16 16 1F 20 50 65 6E 64 69 6E 67 4D 6F 76 65 72 20 00 16 39 56 01 40 B4 70 0F 16 1F 20 4D 6F 76 65 54 69 6D 65 72 20 00 16 39 55 01 50 B3 70 0F 16 28 16 
    }
    YPos += YL;                                                                 //016A : B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0176 : 19 00 58 CB 7D 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 40 D1 7D 0F 16 
    t = "      Destination " $ string(Destination)
      $ " Focus "
      $ GetItemName(string(Focus));//018F : 0F 00 B8 D1 7D 0F 70 70 70 1F 20 20 20 20 20 20 44 65 73 74 69 6E 61 74 69 6F 6E 20 00 39 58 01 20 F7 70 0F 16 1F 20 46 6F 63 75 73 20 00 16 1B 46 29 00 00 39 56 01 A0 F8 70 0F 16 16 
    if (bPreparingMove) {                                                       //01CC : 07 F5 01 2D 01 70 B1 70 0F 
      t = t $ " (Preparing Move)";                                              //01D5 : 0F 00 B8 D1 7D 0F 70 00 B8 D1 7D 0F 1F 20 28 50 72 65 70 61 72 69 6E 67 20 4D 6F 76 65 29 00 16 
    }
    Canvas.DrawText(t,False);                                                   //01F5 : 19 00 58 CB 7D 0F 09 00 00 61 D1 00 B8 D1 7D 0F 28 16 
    YPos += YL;                                                                 //0207 : B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0213 : 19 00 58 CB 7D 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 40 D1 7D 0F 16 
    Canvas.DrawText("      RouteGoal " $ GetItemName(string(RouteGoal))
      $ " RouteDist "
      $ string(RouteDist),False);//022C : 19 00 58 CB 7D 0F 3D 00 00 61 D1 70 70 70 1F 20 20 20 20 20 20 52 6F 75 74 65 47 6F 61 6C 20 00 1B 46 29 00 00 39 56 01 30 B5 70 0F 16 16 1F 20 52 6F 75 74 65 44 69 73 74 20 00 16 39 55 01 40 05 71 0F 16 28 16 
    YPos += YL;                                                                 //0272 : B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //027E : 19 00 58 CB 7D 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 40 D1 7D 0F 16 
    i = 0;                                                                      //0297 : 0F 00 30 D2 7D 0F 25 
    while (i < 16) {                                                            //029E : 07 31 03 96 00 30 D2 7D 0F 2C 10 16 
      if (RouteCache[i] == None) {                                              //02AA : 07 F6 02 72 1A 00 30 D2 7D 0F 01 80 03 71 0F 2A 16 
        if (i > 5) {                                                            //02BB : 07 F0 02 97 00 30 D2 7D 0F 2C 05 16 
          t = t $ "--"
            $ GetItemName(string(RouteCache[i - 1]));    //02C7 : 0F 00 B8 D1 7D 0F 70 70 00 B8 D1 7D 0F 1F 2D 2D 00 16 1B 46 29 00 00 39 56 1A 93 00 30 D2 7D 0F 26 16 01 80 03 71 0F 16 16 
        }
        break;                                                                  //02F0 : 06 31 03 
      } else {                                                                  //02F3 : 06 27 03 
        if (i < 5) {                                                            //02F6 : 07 27 03 96 00 30 D2 7D 0F 2C 05 16 
          t = t
            $ GetItemName(string(RouteCache[i]))
            $ "-";//0302 : 0F 00 B8 D1 7D 0F 70 70 00 B8 D1 7D 0F 1B 46 29 00 00 39 56 1A 00 30 D2 7D 0F 01 80 03 71 0F 16 16 1F 2D 00 16 
        }
      }
      i++;                                                                      //0327 : A5 00 30 D2 7D 0F 16 
    }
    Canvas.DrawText("RouteCache: " $ t,False);                                  //0331 : 19 00 58 CB 7D 0F 19 00 00 61 D1 70 1F 52 6F 75 74 65 43 61 63 68 65 3A 20 00 00 B8 D1 7D 0F 16 28 16 
    YPos += YL;                                                                 //0353 : B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //035F : 19 00 58 CB 7D 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 40 D1 7D 0F 16 
    //1C 08 B7 70 0F 00 58 CB 7D 0F 00 C8 D0 7D 0F 00 40 D1 7D 0F 16 0F 36 E0 8F 6A 0F 19 00 58 CB 7D 
    //0F 05 00 04 01 90 96 6C 0F 39 3D 2C FF 07 EA 00 82 82 77 01 88 83 6C 0F 2A 16 18 09 00 77 01 C8 
    //B3 70 0F 2A 16 16 18 15 00 19 01 88 83 6C 0F 0B 00 04 1B 78 2B 00 00 01 C8 B3 70 0F 16 16 19 00 
    //58 CB 7D 0F 80 00 00 61 D1 70 70 70 70 70 70 70 1F 20 20 20 20 20 53 6B 69 6C 6C 20 00 39 55 01 
    //80 BB 75 0F 16 1F 20 4E 41 56 49 47 41 54 49 4F 4E 20 4D 6F 76 65 54 61 72 67 65 74 20 00 16 1B 
    //46 29 00 00 39 56 01 C8 B3 70 0F 16 16 1F 28 52 45 41 43 48 45 44 29 20 50 65 6E 64 69 6E 67 4D 
    //6F 76 65 72 20 00 16 39 56 01 40 B4 70 0F 16 1F 20 4D 6F 76 65 54 69 6D 65 72 20 00 16 39 55 01 
    //50 B3 70 0F 16 28 16 06 6A 01 19 00 58 CB 7D 0F 77 00 00 61 D1 70 70 70 70 70 70 70 1F 20 20 20 
    //20 20 53 6B 69 6C 6C 20 00 39 55 01 80 BB 75 0F 16 1F 20 4E 41 56 49 47 41 54 49 4F 4E 20 4D 6F 
    //76 65 54 61 72 67 65 74 20 00 16 1B 46 29 00 00 39 56 01 C8 B3 70 0F 16 16 1F 20 50 65 6E 64 69 
    //6E 67 4D 6F 76 65 72 20 00 16 39 56 01 40 B4 70 0F 16 1F 20 4D 6F 76 65 54 69 6D 65 72 20 00 16 
    //39 55 01 50 B3 70 0F 16 28 16 B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 19 00 58 CB 7D 0F 10 00 00 1C 
    //80 90 6C 0F 1E 00 00 80 40 00 40 D1 7D 0F 16 0F 00 B8 D1 7D 0F 70 70 70 1F 20 20 20 20 20 20 44 
    //65 73 74 69 6E 61 74 69 6F 6E 20 00 39 58 01 20 F7 70 0F 16 1F 20 46 6F 63 75 73 20 00 16 1B 46 
    //29 00 00 39 56 01 A0 F8 70 0F 16 16 07 F5 01 2D 01 70 B1 70 0F 0F 00 B8 D1 7D 0F 70 00 B8 D1 7D 
    //0F 1F 20 28 50 72 65 70 61 72 69 6E 67 20 4D 6F 76 65 29 00 16 19 00 58 CB 7D 0F 09 00 00 61 D1 
    //00 B8 D1 7D 0F 28 16 B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 19 00 58 CB 7D 0F 10 00 00 1C 80 90 6C 
    //0F 1E 00 00 80 40 00 40 D1 7D 0F 16 19 00 58 CB 7D 0F 3D 00 00 61 D1 70 70 70 1F 20 20 20 20 20 
    //20 52 6F 75 74 65 47 6F 61 6C 20 00 1B 46 29 00 00 39 56 01 30 B5 70 0F 16 16 1F 20 52 6F 75 74 
    //65 44 69 73 74 20 00 16 39 55 01 40 05 71 0F 16 28 16 B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 19 00 
    //58 CB 7D 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 40 D1 7D 0F 16 0F 00 30 D2 7D 0F 25 07 31 
    //03 96 00 30 D2 7D 0F 2C 10 16 07 F6 02 72 1A 00 30 D2 7D 0F 01 80 03 71 0F 2A 16 07 F0 02 97 00 
    //30 D2 7D 0F 2C 05 16 0F 00 B8 D1 7D 0F 70 70 00 B8 D1 7D 0F 1F 2D 2D 00 16 1B 46 29 00 00 39 56 
    //1A 93 00 30 D2 7D 0F 26 16 01 80 03 71 0F 16 16 06 31 03 06 27 03 07 27 03 96 00 30 D2 7D 0F 2C 
    //05 16 0F 00 B8 D1 7D 0F 70 70 00 B8 D1 7D 0F 1B 46 29 00 00 39 56 1A 00 30 D2 7D 0F 01 80 03 71 
    //0F 16 16 1F 2D 00 16 A5 00 30 D2 7D 0F 16 06 9E 02 19 00 58 CB 7D 0F 19 00 00 61 D1 70 1F 52 6F 
    //75 74 65 43 61 63 68 65 3A 20 00 00 B8 D1 7D 0F 16 28 16 B8 00 40 D1 7D 0F 00 C8 D0 7D 0F 16 19 
    //00 58 CB 7D 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 40 D1 7D 0F 16 04 0B 47 
  }


  function bool TriggerScript(Actor Other,Pawn EventInstigator) {
    if (MyScript != None) {                                                     //0000 : 07 26 00 77 01 38 D4 7D 0F 2A 16 
      MyScript.Trigger(EventInstigator,Pawn);                                   //000B : 19 01 38 D4 7D 0F 10 00 00 1B 32 01 00 00 00 B0 D4 7D 0F 01 88 83 6C 0F 16 
      return True;                                                              //0024 : 04 27 
    }
    return False;                                                               //0026 : 04 28 
    //07 26 00 77 01 38 D4 7D 0F 2A 16 19 01 38 D4 7D 0F 10 00 00 1B 32 01 00 00 00 B0 D4 7D 0F 01 88 
    //83 6C 0F 16 04 27 04 28 04 0B 47 
  }


  function Trigger(Actor Other,Pawn EventInstigator) {
    TriggerScript(Other,EventInstigator);                                       //0000 : 1B FC 2B 00 00 00 50 D6 7D 0F 00 C8 D6 7D 0F 16 
    //1B FC 2B 00 00 00 50 D6 7D 0F 00 C8 D6 7D 0F 16 04 0B 47 
  }


  function Reset() {
    bHunting = False;                                                           //0000 : 14 2D 01 40 D8 7D 0F 28 
    bPlannedJump = False;                                                       //0008 : 14 2D 01 B8 D8 7D 0F 28 
    Super.Reset();                                                              //0010 : 1C 88 AD 70 0F 16 
    //14 2D 01 40 D8 7D 0F 28 14 2D 01 B8 D8 7D 0F 28 1C 88 AD 70 0F 16 04 0B 47 
  }


  event PreBeginPlay() {
    Super.PreBeginPlay();                                                       //0000 : 1C 88 8C 70 0F 16 
    Skill = 1.00000000;                                                         //0006 : 0F 01 80 BB 75 0F 1E 00 00 80 3F 
    //1C 88 8C 70 0F 16 0F 01 80 BB 75 0F 1E 00 00 80 3F 04 0B 47 
  }


  final native(510) latent function WaitToSeeEnemy();



