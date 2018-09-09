//==============================================================================
//  EV_AIFollow
//==============================================================================

class EV_AIFollow extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_AIController,TargetComponent)
  ;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_AIController aI;
    aI = Game_AIController(aObject.Controller);                                 //0000 : 0F 00 98 DE FE 13 2E 68 86 A2 01 19 00 58 DD FE 13 05 00 04 01 00 6E 6C 0F 
    if (aSubject != None) {                                                     //0019 : 07 44 00 77 00 10 DF FE 13 2A 16 
      aI.mTargeting.SetPawn(aSubject);                                          //0024 : 19 19 00 98 DE FE 13 05 00 04 01 30 55 32 0F 0B 00 00 1B B7 0C 00 00 00 10 DF FE 13 16 
    } else {                                                                    //0041 : 06 5C 00 
      aI.mTargeting.SetNearestPawn();                                           //0044 : 19 19 00 98 DE FE 13 05 00 04 01 30 55 32 0F 06 00 00 1B ED 6F 00 00 16 
    }
    aI.StateSignal(46);                                                         //005C : 19 00 98 DE FE 13 08 00 00 1B E0 08 00 00 24 2E 16 
    //0F 00 98 DE FE 13 2E 68 86 A2 01 19 00 58 DD FE 13 05 00 04 01 00 6E 6C 0F 07 44 00 77 00 10 DF 
    //FE 13 2A 16 19 19 00 98 DE FE 13 05 00 04 01 30 55 32 0F 0B 00 00 1B B7 0C 00 00 00 10 DF FE 13 
    //16 06 5C 00 19 19 00 98 DE FE 13 05 00 04 01 30 55 32 0F 06 00 00 1B ED 6F 00 00 16 19 00 98 DE 
    //FE 13 08 00 00 1B E0 08 00 00 24 2E 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return Game_AIController(aObject.Controller) != None
      && aSubject != None;//0000 : 04 82 77 2E 68 86 A2 01 19 00 88 DF FE 13 05 00 04 01 00 6E 6C 0F 2A 16 18 09 00 77 00 60 E0 FE 13 2A 16 16 
    //04 82 77 2E 68 86 A2 01 19 00 88 DF FE 13 05 00 04 01 00 6E 6C 0F 2A 16 18 09 00 77 00 60 E0 FE 
    //13 2A 16 16 04 0B 47 
  }



