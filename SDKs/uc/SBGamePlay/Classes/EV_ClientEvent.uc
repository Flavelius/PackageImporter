//==============================================================================
//  EV_ClientEvent
//==============================================================================

class EV_ClientEvent extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_PlayerPawn)
  ;

  var (Action) const string EventTag;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (Game_PlayerPawn(aSubject) != None) {                                    //0000 : 07 31 00 77 2E F0 47 5B 01 00 38 D8 FD 13 2A 16 
      Game_PlayerPawn(aSubject).sv_ClientSideTrigger(EventTag,aObject);         //0010 : 19 2E F0 47 5B 01 00 38 D8 FD 13 10 00 00 1B 1B 10 00 00 01 B0 D8 FD 13 00 10 D7 FD 13 16 
    } else {                                                                    //002E : 06 5F 00 
      if (Game_PlayerPawn(aObject) != None) {                                   //0031 : 07 5F 00 77 2E F0 47 5B 01 00 10 D7 FD 13 2A 16 
        Game_PlayerPawn(aObject).sv_ClientSideTrigger(EventTag,aSubject);       //0041 : 19 2E F0 47 5B 01 00 10 D7 FD 13 10 00 00 1B 1B 10 00 00 01 B0 D8 FD 13 00 38 D8 FD 13 16 
      }
    }
    //07 31 00 77 2E F0 47 5B 01 00 38 D8 FD 13 2A 16 19 2E F0 47 5B 01 00 38 D8 FD 13 10 00 00 1B 1B 
    //10 00 00 01 B0 D8 FD 13 00 10 D7 FD 13 16 06 5F 00 07 5F 00 77 2E F0 47 5B 01 00 10 D7 FD 13 2A 
    //16 19 2E F0 47 5B 01 00 10 D7 FD 13 10 00 00 1B 1B 10 00 00 01 B0 D8 FD 13 00 38 D8 FD 13 16 04 
    //0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return aObject != None || aSubject != None;                                 //0000 : 04 84 77 00 28 D9 FD 13 2A 16 18 09 00 77 00 F0 D9 FD 13 2A 16 16 
    //04 84 77 00 28 D9 FD 13 2A 16 18 09 00 77 00 F0 D9 FD 13 2A 16 16 04 0B 47 
  }



