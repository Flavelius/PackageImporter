//==============================================================================
//  EV_Other
//==============================================================================

class EV_Other extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const export editinline Content_Event OtherAction;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    OtherAction.sv_Execute(aSubject,aSubject);                                  //0000 : 19 01 10 50 FF 13 10 00 00 1B 23 0C 00 00 00 88 50 FF 13 00 88 50 FF 13 16 
    //19 01 10 50 FF 13 10 00 00 1B 23 0C 00 00 00 88 50 FF 13 00 88 50 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (OtherAction != None) {                                                  //0000 : 07 25 00 77 01 10 50 FF 13 2A 16 
      return OtherAction.sv_CanExecute(aSubject,aSubject);                      //000B : 04 19 01 10 50 FF 13 10 00 04 1B 22 0C 00 00 00 E0 51 FF 13 00 E0 51 FF 13 16 
    }
    return False;                                                               //0025 : 04 28 
    //07 25 00 77 01 10 50 FF 13 2A 16 04 19 01 10 50 FF 13 10 00 04 1B 22 0C 00 00 00 E0 51 FF 13 00 
    //E0 51 FF 13 16 04 28 04 0B 47 
  }



