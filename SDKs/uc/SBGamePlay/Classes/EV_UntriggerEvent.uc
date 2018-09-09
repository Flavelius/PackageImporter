//==============================================================================
//  EV_UntriggerEvent
//==============================================================================

class EV_UntriggerEvent extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn)
  ;

  var (Action) const name EventTag;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (aObject != None) {                                                      //0000 : 07 2C 00 77 00 A0 DC FD 13 2A 16 
      aObject.UntriggerEvent(EventTag,aObject,aObject);                         //000B : 19 00 A0 DC FD 13 15 00 00 1C 80 AF 34 0F 01 18 DD FD 13 00 A0 DC FD 13 00 A0 DC FD 13 16 
    } else {                                                                    //0029 : 06 55 00 
      if (aSubject != None) {                                                   //002C : 07 55 00 77 00 90 DD FD 13 2A 16 
        aSubject.UntriggerEvent(EventTag,aSubject,aSubject);                    //0037 : 19 00 90 DD FD 13 15 00 00 1C 80 AF 34 0F 01 18 DD FD 13 00 90 DD FD 13 00 90 DD FD 13 16 
      }
    }
    //07 2C 00 77 00 A0 DC FD 13 2A 16 19 00 A0 DC FD 13 15 00 00 1C 80 AF 34 0F 01 18 DD FD 13 00 A0 
    //DC FD 13 00 A0 DC FD 13 16 06 55 00 07 55 00 77 00 90 DD FD 13 2A 16 19 00 90 DD FD 13 15 00 00 
    //1C 80 AF 34 0F 01 18 DD FD 13 00 90 DD FD 13 00 90 DD FD 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return aObject != None || aSubject != None;                                 //0000 : 04 84 77 00 08 DE FD 13 2A 16 18 09 00 77 00 D0 DE FD 13 2A 16 16 
    //04 84 77 00 08 DE FD 13 2A 16 18 09 00 77 00 D0 DE FD 13 2A 16 16 04 0B 47 
  }



