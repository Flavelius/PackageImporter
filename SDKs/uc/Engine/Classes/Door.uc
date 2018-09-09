//==============================================================================
//  Door
//==============================================================================

class Door extends NavigationPoint
    native
    dependsOn(Mover,Pawn,Controller)
    Placeable
  ;

  var (Door) name DoorTag;
  var Mover MyDoor;
  var (Door) name DoorTrigger;
  var Actor RecommendedTrigger;
  var (Door) bool bInitiallyClosed;
  var (Door) bool bBlockedWhenClosed;
  var bool bDoorOpen;
  var bool bTempNoCollide;


  event bool SuggestMovePreparation(Pawn Other) {
    if (bDoorOpen) {                                                            //0000 : 07 0B 00 2D 01 90 6E 3B 19 
      return False;                                                             //0009 : 04 28 
    }
    if (MyDoor.bOpening || MyDoor.bDelaying) {                                  //000B : 07 50 00 84 19 01 08 6F 3B 19 06 00 04 2D 01 B0 41 78 0F 18 10 00 19 01 08 6F 3B 19 06 00 04 2D 01 28 42 78 0F 16 
      Other.Controller.WaitForMover(MyDoor);                                    //0031 : 19 19 00 D0 AC 37 0F 05 00 04 01 00 6E 6C 0F 0B 00 00 1B 9A 2A 00 00 01 08 6F 3B 19 16 
      return True;                                                              //004E : 04 27 
    }
    if (MyDoor.bDamageTriggered) {                                              //0050 : 07 9A 00 19 01 08 6F 3B 19 06 00 04 2D 01 E0 F4 78 0F 
      MyDoor.Trigger(Other,Other);                                              //0062 : 19 01 08 6F 3B 19 10 00 00 1B 32 01 00 00 00 D0 AC 37 0F 00 D0 AC 37 0F 16 
      Other.Controller.WaitForMover(MyDoor);                                    //007B : 19 19 00 D0 AC 37 0F 05 00 04 01 00 6E 6C 0F 0B 00 00 1B 9A 2A 00 00 01 08 6F 3B 19 16 
      return True;                                                              //0098 : 04 27 
    }
    return False;                                                               //009A : 04 28 
    //07 0B 00 2D 01 90 6E 3B 19 04 28 07 50 00 84 19 01 08 6F 3B 19 06 00 04 2D 01 B0 41 78 0F 18 10 
    //00 19 01 08 6F 3B 19 06 00 04 2D 01 28 42 78 0F 16 19 19 00 D0 AC 37 0F 05 00 04 01 00 6E 6C 0F 
    //0B 00 00 1B 9A 2A 00 00 01 08 6F 3B 19 16 04 27 07 9A 00 19 01 08 6F 3B 19 06 00 04 2D 01 E0 F4 
    //78 0F 19 01 08 6F 3B 19 10 00 00 1B 32 01 00 00 00 D0 AC 37 0F 00 D0 AC 37 0F 16 19 19 00 D0 AC 
    //37 0F 05 00 04 01 00 6E 6C 0F 0B 00 00 1B 9A 2A 00 00 01 08 6F 3B 19 16 04 27 04 28 04 0B 47 
  }


  function bool ProceedWithMove(Pawn Other) {
    if (bDoorOpen || !MyDoor.bDamageTriggered) {                                //0000 : 07 21 00 84 2D 01 90 6E 3B 19 18 12 00 81 19 01 08 6F 3B 19 06 00 04 2D 01 E0 F4 78 0F 16 16 
      return True;                                                              //001F : 04 27 
    }
    MyDoor.Trigger(Other,Other);                                                //0021 : 19 01 08 6F 3B 19 10 00 00 1B 32 01 00 00 00 B8 BD 37 0F 00 B8 BD 37 0F 16 
    Other.Controller.WaitForMover(MyDoor);                                      //003A : 19 19 00 B8 BD 37 0F 05 00 04 01 00 6E 6C 0F 0B 00 00 1B 9A 2A 00 00 01 08 6F 3B 19 16 
    return False;                                                               //0057 : 04 28 
    //07 21 00 84 2D 01 90 6E 3B 19 18 12 00 81 19 01 08 6F 3B 19 06 00 04 2D 01 E0 F4 78 0F 16 16 04 
    //27 19 01 08 6F 3B 19 10 00 00 1B 32 01 00 00 00 B8 BD 37 0F 00 B8 BD 37 0F 16 19 19 00 B8 BD 37 
    //0F 05 00 04 01 00 6E 6C 0F 0B 00 00 1B 9A 2A 00 00 01 08 6F 3B 19 16 04 28 04 0B 47 
  }


  function Actor SpecialHandling(Pawn Other) {
    if (MyDoor == None) {                                                       //0000 : 07 0D 00 72 01 08 6F 3B 19 2A 16 
      return self;                                                              //000B : 04 17 
    }
    if (MyDoor.BumpType == 0 && !Other.IsPlayerPawn()) {                        //000D : 07 3E 00 82 9A 39 3A 19 01 08 6F 3B 19 05 00 01 01 F0 64 78 0F 39 3A 24 00 16 18 12 00 81 19 00 00 C0 37 0F 06 00 04 1B B9 0C 00 00 16 16 16 
      return None;                                                              //003C : 04 2A 
    }
    if (bInitiallyClosed == (bDoorOpen || MyDoor.bOpening || MyDoor.bDelaying)) {//003E : 07 79 00 F2 2D 01 E0 C1 37 0F 84 84 2D 01 90 6E 3B 19 18 10 00 19 01 08 6F 3B 19 06 00 04 2D 01 B0 41 78 0F 16 18 10 00 19 01 08 6F 3B 19 06 00 04 2D 01 28 42 78 0F 16 16 
      return self;                                                              //0077 : 04 17 
    }
    if (RecommendedTrigger != None) {                                           //0079 : 07 AF 00 77 01 58 C2 37 0F 2A 16 
      if (Trigger(RecommendedTrigger) != None) {                                //0084 : 07 A9 00 77 2E 98 0F C2 00 01 58 C2 37 0F 2A 16 
        return RecommendedTrigger.SpecialHandling(Other);                       //0094 : 04 19 01 58 C2 37 0F 0B 00 04 1B 5A 01 00 00 00 00 C0 37 0F 16 
      }
      return RecommendedTrigger;                                                //00A9 : 04 01 58 C2 37 0F 
    }
    return self;                                                                //00AF : 04 17 
    //07 0D 00 72 01 08 6F 3B 19 2A 16 04 17 07 3E 00 82 9A 39 3A 19 01 08 6F 3B 19 05 00 01 01 F0 64 
    //78 0F 39 3A 24 00 16 18 12 00 81 19 00 00 C0 37 0F 06 00 04 1B B9 0C 00 00 16 16 16 04 2A 07 79 
    //00 F2 2D 01 E0 C1 37 0F 84 84 2D 01 90 6E 3B 19 18 10 00 19 01 08 6F 3B 19 06 00 04 2D 01 B0 41 
    //78 0F 16 18 10 00 19 01 08 6F 3B 19 06 00 04 2D 01 28 42 78 0F 16 16 04 17 07 AF 00 77 01 58 C2 
    //37 0F 2A 16 07 A9 00 77 2E 98 0F C2 00 01 58 C2 37 0F 2A 16 04 19 01 58 C2 37 0F 0B 00 04 1B 5A 
    //01 00 00 00 00 C0 37 0F 16 04 01 58 C2 37 0F 04 17 04 0B 47 
  }


  function MoverClosed() {
    bBlocked = bInitiallyClosed && bBlockedWhenClosed;                          //0000 : 14 2D 01 00 E2 79 0F 82 2D 01 E0 C1 37 0F 18 07 00 2D 01 F8 C3 37 0F 16 
    bDoorOpen = !bInitiallyClosed;                                              //0018 : 14 2D 01 90 6E 3B 19 81 2D 01 E0 C1 37 0F 16 
    //14 2D 01 00 E2 79 0F 82 2D 01 E0 C1 37 0F 18 07 00 2D 01 F8 C3 37 0F 16 14 2D 01 90 6E 3B 19 81 
    //2D 01 E0 C1 37 0F 16 04 0B 47 
  }


  function MoverOpened() {
    bBlocked = !bInitiallyClosed && bBlockedWhenClosed;                         //0000 : 14 2D 01 00 E2 79 0F 82 81 2D 01 E0 C1 37 0F 16 18 07 00 2D 01 F8 C3 37 0F 16 
    bDoorOpen = bInitiallyClosed;                                               //001A : 14 2D 01 90 6E 3B 19 2D 01 E0 C1 37 0F 
    //14 2D 01 00 E2 79 0F 82 81 2D 01 E0 C1 37 0F 16 18 07 00 2D 01 F8 C3 37 0F 16 14 2D 01 90 6E 3B 
    //19 2D 01 E0 C1 37 0F 04 0B 47 
  }


  function PostBeginPlay() {
    local Vector dist;
    if (DoorTrigger != 'None') {                                                //0000 : 07 9F 00 FF 01 40 71 3B 19 21 00 00 00 00 16 
      foreach AllActors(Class'Actor',RecommendedTrigger,DoorTrigger) {          //000F : 2F 61 30 20 F8 8B C1 00 01 58 C2 37 0F 01 40 71 3B 19 16 28 00 
        goto jl0028;                                                            //0024 : 06 28 00 
      }
      if (RecommendedTrigger != None) {                                         //0029 : 07 9F 00 77 01 58 C2 37 0F 2A 16 
        dist = Location - RecommendedTrigger.Location;                          //0034 : 0F 00 00 C6 37 0F D8 01 30 81 6C 0F 19 01 58 C2 37 0F 05 00 0C 01 30 81 6C 0F 16 
        if (Abs(dist.Z) < RecommendedTrigger.CollisionHeight) {                 //004F : 07 9F 00 B0 BA 36 38 C5 69 0F 00 00 C6 37 0F 16 19 01 58 C2 37 0F 05 00 04 01 40 8A 6C 0F 16 
          dist.Z = 0.00000000;                                                  //006E : 0F 36 38 C5 69 0F 00 00 C6 37 0F 1E 00 00 00 00 
          if (VSize(dist) < RecommendedTrigger.CollisionRadius) {               //007E : 07 9F 00 B0 E1 00 00 C6 37 0F 16 19 01 58 C2 37 0F 05 00 04 01 C8 89 6C 0F 16 
            RecommendedTrigger = None;                                          //0098 : 0F 01 58 C2 37 0F 2A 
          }
        }
      }
    }
    bBlocked = bInitiallyClosed && bBlockedWhenClosed;                          //009F : 14 2D 01 00 E2 79 0F 82 2D 01 E0 C1 37 0F 18 07 00 2D 01 F8 C3 37 0F 16 
    bDoorOpen = !bInitiallyClosed;                                              //00B7 : 14 2D 01 90 6E 3B 19 81 2D 01 E0 C1 37 0F 16 
    Super.PostBeginPlay();                                                      //00C6 : 1C A8 DA 79 0F 16 
    //07 9F 00 FF 01 40 71 3B 19 21 00 00 00 00 16 2F 61 30 20 F8 8B C1 00 01 58 C2 37 0F 01 40 71 3B 
    //19 16 28 00 06 28 00 31 30 07 9F 00 77 01 58 C2 37 0F 2A 16 0F 00 00 C6 37 0F D8 01 30 81 6C 0F 
    //19 01 58 C2 37 0F 05 00 0C 01 30 81 6C 0F 16 07 9F 00 B0 BA 36 38 C5 69 0F 00 00 C6 37 0F 16 19 
    //01 58 C2 37 0F 05 00 04 01 40 8A 6C 0F 16 0F 36 38 C5 69 0F 00 00 C6 37 0F 1E 00 00 00 00 07 9F 
    //00 B0 E1 00 00 C6 37 0F 16 19 01 58 C2 37 0F 05 00 04 01 C8 89 6C 0F 16 0F 01 58 C2 37 0F 2A 14 
    //2D 01 00 E2 79 0F 82 2D 01 E0 C1 37 0F 18 07 00 2D 01 F8 C3 37 0F 16 14 2D 01 90 6E 3B 19 81 2D 
    //01 E0 C1 37 0F 16 1C A8 DA 79 0F 16 04 0B 47 
  }



