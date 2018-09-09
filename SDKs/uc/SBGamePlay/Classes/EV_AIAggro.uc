//==============================================================================
//  EV_AIAggro
//==============================================================================

class EV_AIAggro extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_AIController,TargetComponent,Game_Pawn)
  ;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_AIController aI;
    if (aSubject != None) {                                                     //0000 : 07 28 00 77 00 98 D2 FD 13 2A 16 
      aI.mTargeting.SetPawn(aSubject);                                          //000B : 19 19 00 10 D3 FD 13 05 00 04 01 30 55 32 0F 0B 00 00 1B B7 0C 00 00 00 98 D2 FD 13 16 
    }
    aI.StateSignal(43);                                                         //0028 : 19 00 10 D3 FD 13 08 00 00 1B E0 08 00 00 24 2B 16 
    //07 28 00 77 00 98 D2 FD 13 2A 16 19 19 00 10 D3 FD 13 05 00 04 01 30 55 32 0F 0B 00 00 1B B7 0C 
    //00 00 00 98 D2 FD 13 16 19 00 10 D3 FD 13 08 00 00 1B E0 08 00 00 24 2B 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return Game_AIController(aObject.Controller) != None
      && aSubject != None;//0000 : 04 82 77 2E 68 86 A2 01 19 00 88 D3 FD 13 05 00 04 01 00 6E 6C 0F 2A 16 18 09 00 77 00 60 D4 FD 13 2A 16 16 
    //04 82 77 2E 68 86 A2 01 19 00 88 D3 FD 13 05 00 04 01 00 6E 6C 0F 2A 16 18 09 00 77 00 60 D4 FD 
    //13 2A 16 16 04 0B 47 
  }



