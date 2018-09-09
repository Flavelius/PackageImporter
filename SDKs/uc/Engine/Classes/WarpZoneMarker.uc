//==============================================================================
//  WarpZoneMarker
//==============================================================================

class WarpZoneMarker extends SmallNavigationPoint
    native
    dependsOn(Pawn,WarpZoneInfo,ZoneTrigger)
  ;

  var WarpZoneInfo markedWarpZone;
  var Actor TriggerActor;
  var Actor TriggerActor2;


  function Actor SpecialHandling(Pawn Other) {
    if (Other.Region.Zone == markedWarpZone) {                                  //0000 : 07 31 00 72 36 58 43 6E 0F 19 00 C8 11 38 0F 05 00 0C 01 70 8A 6E 0F 01 B8 12 38 0F 16 
      markedWarpZone.ActorEntered(Other);                                       //001D : 19 01 B8 12 38 0F 0B 00 00 1B 41 01 00 00 00 C8 11 38 0F 16 
    }
    return self;                                                                //0031 : 04 17 
    //07 31 00 72 36 58 43 6E 0F 19 00 C8 11 38 0F 05 00 0C 01 70 8A 6E 0F 01 B8 12 38 0F 16 19 01 B8 
    //12 38 0F 0B 00 00 1B 41 01 00 00 00 C8 11 38 0F 16 04 17 04 0B 47 
  }


  function FindTriggerActor() {
    local ZoneTrigger Z;
    foreach AllActors(Class'ZoneTrigger',Z) {                                   //0000 : 2F 61 30 20 68 94 3B 19 00 58 14 38 0F 16 40 00 
      if (Z.Event == markedWarpZone.ZoneTag) {                                  //0010 : 07 3F 00 FE 19 00 58 14 38 0F 05 00 04 01 38 9F 6C 0F 19 01 B8 12 38 0F 05 00 04 01 E8 7C 72 0F 16 
        TriggerActor = Z;                                                       //0031 : 0F 01 A8 99 3B 19 00 58 14 38 0F 
        return;                                                                 //003D : 04 0B 
      }
    }
    //2F 61 30 20 68 94 3B 19 00 58 14 38 0F 16 40 00 07 3F 00 FE 19 00 58 14 38 0F 05 00 04 01 38 9F 
    //6C 0F 19 01 B8 12 38 0F 05 00 04 01 E8 7C 72 0F 16 0F 01 A8 99 3B 19 00 58 14 38 0F 30 04 0B 31 
    //30 04 0B 47 
  }


  function PostBeginPlay() {
    if (markedWarpZone.numDestinations > 1) {                                   //0000 : 07 1A 00 97 19 01 B8 12 38 0F 05 00 04 01 E8 29 38 0F 26 16 
      FindTriggerActor();                                                       //0014 : 1B 9E 2A 00 00 16 
    }
    Super.PostBeginPlay();                                                      //001A : 1C A8 DA 79 0F 16 
    //07 1A 00 97 19 01 B8 12 38 0F 05 00 04 01 E8 29 38 0F 26 16 1B 9E 2A 00 00 16 1C A8 DA 79 0F 16 
    //04 0B 47 
  }



