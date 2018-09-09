//==============================================================================
//  EV_Stand
//==============================================================================

class EV_Stand extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Controller)
  ;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    aObject.sv_Sit(False,False);                                                //0000 : 19 00 D8 59 FF 13 08 00 00 1B 94 0C 00 00 28 28 16 
    //19 00 D8 59 FF 13 08 00 00 1B 94 0C 00 00 28 28 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (!Game_Controller(aObject.Controller).IsSitting()) {                     //0000 : 07 24 00 81 19 2E 10 0E 5B 01 19 00 10 5B FF 13 05 00 04 01 00 6E 6C 0F 06 00 04 1B A3 05 00 00 16 16 
      return False;                                                             //0022 : 04 28 
    }
    return True;                                                                //0024 : 04 27 
    //07 24 00 81 19 2E 10 0E 5B 01 19 00 10 5B FF 13 05 00 04 01 00 6E 6C 0F 06 00 04 1B A3 05 00 00 
    //16 16 04 28 04 27 04 0B 47 
  }



