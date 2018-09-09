//==============================================================================
//  EV_TriggerEvent
//==============================================================================

class EV_TriggerEvent extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn)
  ;

  var (Action) const name EventTag;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (aObject != None) {                                                      //0000 : 07 2C 00 77 00 20 E0 FD 13 2A 16 
      aObject.TriggerEvent(EventTag,aObject,aObject);                           //000B : 19 00 20 E0 FD 13 15 00 00 1C F8 B1 34 0F 01 08 31 FF 13 00 20 E0 FD 13 00 20 E0 FD 13 16 
    } else {                                                                    //0029 : 06 55 00 
      if (aSubject != None) {                                                   //002C : 07 55 00 77 00 80 31 FF 13 2A 16 
        aSubject.TriggerEvent(EventTag,aSubject,aSubject);                      //0037 : 19 00 80 31 FF 13 15 00 00 1C F8 B1 34 0F 01 08 31 FF 13 00 80 31 FF 13 00 80 31 FF 13 16 
      }
    }
    //07 2C 00 77 00 20 E0 FD 13 2A 16 19 00 20 E0 FD 13 15 00 00 1C F8 B1 34 0F 01 08 31 FF 13 00 20 
    //E0 FD 13 00 20 E0 FD 13 16 06 55 00 07 55 00 77 00 80 31 FF 13 2A 16 19 00 80 31 FF 13 15 00 00 
    //1C F8 B1 34 0F 01 08 31 FF 13 00 80 31 FF 13 00 80 31 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return aObject != None || aSubject != None;                                 //0000 : 04 84 77 00 F8 31 FF 13 2A 16 18 09 00 77 00 C0 32 FF 13 2A 16 16 
    //04 84 77 00 F8 31 FF 13 2A 16 18 09 00 77 00 C0 32 FF 13 2A 16 16 04 0B 47 
  }



