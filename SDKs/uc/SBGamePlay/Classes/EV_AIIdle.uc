//==============================================================================
//  EV_AIIdle
//==============================================================================

class EV_AIIdle extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_AIController,TargetComponent)
  ;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_AIController aI;
    aI = Game_AIController(aObject.Controller);                                 //0000 : 0F 00 D0 20 FC 13 2E 68 86 A2 01 19 00 D0 1F FC 13 05 00 04 01 00 6E 6C 0F 
    aI.mTargeting.SetDisabled();                                                //0019 : 19 19 00 D0 20 FC 13 05 00 04 01 30 55 32 0F 06 00 00 1B EC 6F 00 00 16 
    aI.StateSignal(41);                                                         //0031 : 19 00 D0 20 FC 13 08 00 00 1B E0 08 00 00 24 29 16 
    //0F 00 D0 20 FC 13 2E 68 86 A2 01 19 00 D0 1F FC 13 05 00 04 01 00 6E 6C 0F 19 19 00 D0 20 FC 13 
    //05 00 04 01 30 55 32 0F 06 00 00 1B EC 6F 00 00 16 19 00 D0 20 FC 13 08 00 00 1B E0 08 00 00 24 
    //29 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return Game_AIController(aObject.Controller) != None;                       //0000 : 04 77 2E 68 86 A2 01 19 00 20 56 32 0F 05 00 04 01 00 6E 6C 0F 2A 16 
    //04 77 2E 68 86 A2 01 19 00 20 56 32 0F 05 00 04 01 00 6E 6C 0F 2A 16 04 0B 47 
  }



