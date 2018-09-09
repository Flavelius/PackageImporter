//==============================================================================
//  UseTrigger
//==============================================================================

class UseTrigger extends Triggers
    dependsOn(Pawn)
  ;

  var (UseTrigger) localized string Message;


  function Touch(Actor Other) {
    if (Pawn(Other) != None) {                                                  //0000 : 07 3E 00 77 2E 50 31 D4 00 00 D8 41 F2 1C 2A 16 
      if (AIController(Pawn(Other).Controller) != None) {                       //0010 : 07 3E 00 77 2E 18 2F C2 00 19 2E 50 31 D4 00 00 D8 41 F2 1C 05 00 04 01 00 6E 6C 0F 2A 16 
        UsedBy(Pawn(Other));                                                    //002E : 1B 79 2B 00 00 2E 50 31 D4 00 00 D8 41 F2 1C 16 
      }
    }
    //07 3E 00 77 2E 50 31 D4 00 00 D8 41 F2 1C 2A 16 07 3E 00 77 2E 18 2F C2 00 19 2E 50 31 D4 00 00 
    //D8 41 F2 1C 05 00 04 01 00 6E 6C 0F 2A 16 1B 79 2B 00 00 2E 50 31 D4 00 00 D8 41 F2 1C 16 04 0B 
    //47 
  }


  function UsedBy(Pawn User) {
    TriggerEvent(Event,self,User);                                              //0000 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 D8 CC 7C 19 16 
    //1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 D8 CC 7C 19 16 04 0B 47 
  }


  function bool SelfTriggered() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



