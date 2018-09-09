//==============================================================================
//  NavigationPoint
//==============================================================================

class NavigationPoint extends Actor
    native
    dependsOn(ReachSpec)
  ;

  var transient bool bEndPoint;
  var transient bool bTransientEndPoint;
  var transient bool bHideEditorPaths;
  var transient bool bCanReach;
  var bool taken;
  var (NavigationPoint) bool bBlocked;
  var (NavigationPoint) bool bPropagatesSound;
  var (NavigationPoint) bool bOneWayPath;
  var (NavigationPoint) bool bNeverUseStrafing;
  var (NavigationPoint) bool bAlwaysUseStrafing;
  var const bool bForceNoStrafing;
  var const bool bAutoBuilt;
  var bool bSpecialMove;
  var bool bNoAutoConnect;
  var const bool bNotBased;
  var const bool bPathsChanged;
  var bool bDestinationOnly;
  var bool bSourceOnly;
  var bool bSpecialForced;
  var bool bMustBeReachable;
  var bool bBlockable;
  var bool bFlyingPreferred;
  var bool bMayCausePain;
  var bool bReceivePlayerToucherDiedNotify;
  var bool bAlreadyVisited;
  var (NavigationPoint) bool bVehicleDestination;
  var (NavigationPoint) bool bMakeSourceOnly;
  var (NavigationPoint) bool bNoSuperSize;
  var bool bForcedOnly;
  var const array<ReachSpec> PathList;
  var (NavigationPoint) name ProscribedPaths[4];
  var (NavigationPoint) name ForcedPaths[4];
  var int visitedWeight;
  var const int bestPathWeight;
  var const NavigationPoint nextNavigationPoint;
  var const NavigationPoint nextOrdered;
  var const NavigationPoint prevOrdered;
  var const NavigationPoint previousPath;
  var int cost;
  var (NavigationPoint) int ExtraCost;
  var transient int TransientCost;
  var transient int FearCost;
  var const float LastDetourWeight;
  var byte BaseVisible[2];
  var float BaseDist[2];
  var Vector MaxPathSize;


  function PlayerToucherDied(Pawn P);


  function MoverClosed();


  function MoverOpened();


  function bool ProceedWithMove(Pawn Other) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  event bool SuggestMovePreparation(Pawn Other) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event float DetourWeight(Pawn Other,float PathWeight);


  event bool Accept(Actor Incoming,Actor Source) {
    taken = Incoming.SetLocation(Location);                                     //0000 : 14 2D 01 E0 D4 79 0F 19 00 88 D3 79 0F 08 00 04 61 0B 01 30 81 6C 0F 16 
    if (taken) {                                                                //0018 : 07 51 00 2D 01 E0 D4 79 0F 
      Incoming.Velocity = vect(0.000000, 0.000000, 0.000000);                   //0021 : 0F 19 00 88 D3 79 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
      Incoming.SetRotation(Rotation);                                           //003D : 19 00 88 D3 79 0F 0B 00 04 1C 70 01 6E 0F 01 00 84 6C 0F 16 
    }
    Incoming.PlayTeleportEffect(True,False);                                    //0051 : 19 00 88 D3 79 0F 08 00 00 1B CF 2A 00 00 27 28 16 
    TriggerEvent(Event,self,Pawn(Incoming));                                    //0062 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2E 50 31 D4 00 00 88 D3 79 0F 16 
    return taken;                                                               //0078 : 04 2D 01 E0 D4 79 0F 
    //14 2D 01 E0 D4 79 0F 19 00 88 D3 79 0F 08 00 04 61 0B 01 30 81 6C 0F 16 07 51 00 2D 01 E0 D4 79 
    //0F 0F 19 00 88 D3 79 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 19 00 88 
    //D3 79 0F 0B 00 04 1C 70 01 6E 0F 01 00 84 6C 0F 16 19 00 88 D3 79 0F 08 00 00 1B CF 2A 00 00 27 
    //28 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2E 50 31 D4 00 00 88 D3 79 0F 16 04 2D 01 E0 D4 79 0F 04 
    //0B 47 
  }


  event int SpecialCost(Pawn Seeker,ReachSpec Path);


  function SetBaseVisibility(int BaseNum) {
    local NavigationPoint N;
    BaseVisible[BaseNum] = 1;                                                   //0000 : 0F 1A 00 40 D9 79 0F 01 B8 D9 79 0F 24 01 
    N = Level.NavigationPointList;                                              //000E : 0F 00 30 DA 79 0F 19 01 D8 7E 6C 0F 05 00 04 01 D8 E0 74 0F 
    while (N != None) {                                                         //0022 : 07 E8 00 77 00 30 DA 79 0F 2A 16 
      if (N.BaseVisible[BaseNum] == 0
        && FastTrace(N.Location + (88 - 2 * N.CollisionHeight) * vect(0.000000, 0.000000, 1.000000),Location + (88 - 2 * N.CollisionHeight) * vect(0.000000, 0.000000, 1.000000))) {//002D : 07 D1 00 82 9A 39 3A 1A 00 40 D9 79 0F 19 00 30 DA 79 0F 05 00 02 01 B8 D9 79 0F 25 16 18 6D 00 62 24 D7 19 00 30 DA 79 0F 05 00 0C 01 30 81 6C 0F D5 AF 39 3F 2C 58 AB 39 3F 2C 02 19 00 30 DA 79 0F 05 00 04 01 40 8A 6C 0F 16 16 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 D7 01 30 81 6C 0F D5 AF 39 3F 2C 58 AB 39 3F 2C 02 19 00 30 DA 79 0F 05 00 04 01 40 8A 6C 0F 16 16 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 16 16 
        N.BaseVisible[BaseNum] = 1;                                             //00BA : 0F 1A 00 40 D9 79 0F 19 00 30 DA 79 0F 05 00 02 01 B8 D9 79 0F 24 01 
      }
      N = N.nextNavigationPoint;                                                //00D1 : 0F 00 30 DA 79 0F 19 00 30 DA 79 0F 05 00 04 01 F8 FD 74 0F 
    }
    //0F 1A 00 40 D9 79 0F 01 B8 D9 79 0F 24 01 0F 00 30 DA 79 0F 19 01 D8 7E 6C 0F 05 00 04 01 D8 E0 
    //74 0F 07 E8 00 77 00 30 DA 79 0F 2A 16 07 D1 00 82 9A 39 3A 1A 00 40 D9 79 0F 19 00 30 DA 79 0F 
    //05 00 02 01 B8 D9 79 0F 25 16 18 6D 00 62 24 D7 19 00 30 DA 79 0F 05 00 0C 01 30 81 6C 0F D5 AF 
    //39 3F 2C 58 AB 39 3F 2C 02 19 00 30 DA 79 0F 05 00 04 01 40 8A 6C 0F 16 16 23 00 00 00 00 00 00 
    //00 00 00 00 80 3F 16 16 D7 01 30 81 6C 0F D5 AF 39 3F 2C 58 AB 39 3F 2C 02 19 00 30 DA 79 0F 05 
    //00 04 01 40 8A 6C 0F 16 16 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 16 16 0F 1A 00 40 D9 79 
    //0F 19 00 30 DA 79 0F 05 00 02 01 B8 D9 79 0F 24 01 0F 00 30 DA 79 0F 19 00 30 DA 79 0F 05 00 04 
    //01 F8 FD 74 0F 06 22 00 04 0B 47 
  }


  final native function SetBaseDistance(int BaseNum);


  function PostBeginPlay() {
    local int i;
    ExtraCost = Max(ExtraCost,0);                                               //0000 : 0F 01 F8 DC 79 0F FA 01 F8 DC 79 0F 25 16 
    i = 0;                                                                      //000E : 0F 00 80 DC 79 0F 25 
    while (i < PathList.Length) {                                               //0015 : 07 89 00 96 00 80 DC 79 0F 37 01 70 DD 79 0F 16 
      MaxPathSize.X = FMax(MaxPathSize.X,PathList[i].CollisionRadius);          //0025 : 0F 36 48 C4 69 0F 01 E8 DD 79 0F F5 36 48 C4 69 0F 01 E8 DD 79 0F 39 3F 19 10 00 80 DC 79 0F 01 70 DD 79 0F 05 00 04 01 60 DE 79 0F 16 
      MaxPathSize.Z = FMax(MaxPathSize.Z,PathList[i].CollisionHeight);          //0052 : 0F 36 38 C5 69 0F 01 E8 DD 79 0F F5 36 38 C5 69 0F 01 E8 DD 79 0F 39 3F 19 10 00 80 DC 79 0F 01 70 DD 79 0F 05 00 04 01 D8 DE 79 0F 16 
      i++;                                                                      //007F : A5 00 80 DC 79 0F 16 
    }
    MaxPathSize.Y = MaxPathSize.X;                                              //0089 : 0F 36 C0 C4 69 0F 01 E8 DD 79 0F 36 48 C4 69 0F 01 E8 DD 79 0F 
    Super.PostBeginPlay();                                                      //009E : 1C D0 02 38 0F 16 
    //0F 01 F8 DC 79 0F FA 01 F8 DC 79 0F 25 16 0F 00 80 DC 79 0F 25 07 89 00 96 00 80 DC 79 0F 37 01 
    //70 DD 79 0F 16 0F 36 48 C4 69 0F 01 E8 DD 79 0F F5 36 48 C4 69 0F 01 E8 DD 79 0F 39 3F 19 10 00 
    //80 DC 79 0F 01 70 DD 79 0F 05 00 04 01 60 DE 79 0F 16 0F 36 38 C5 69 0F 01 E8 DD 79 0F F5 36 38 
    //C5 69 0F 01 E8 DD 79 0F 39 3F 19 10 00 80 DC 79 0F 01 70 DD 79 0F 05 00 04 01 D8 DE 79 0F 16 A5 
    //00 80 DC 79 0F 16 06 15 00 0F 36 C0 C4 69 0F 01 E8 DD 79 0F 36 48 C4 69 0F 01 E8 DD 79 0F 1C D0 
    //02 38 0F 16 04 0B 47 
  }



