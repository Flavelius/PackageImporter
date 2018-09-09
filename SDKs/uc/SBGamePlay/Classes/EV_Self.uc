//==============================================================================
//  EV_Self
//==============================================================================

class EV_Self extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const export editinline Content_Event SelfAction;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    SelfAction.sv_Execute(aObject,aObject);                                     //0000 : 19 01 58 55 FF 13 10 00 00 1B 23 0C 00 00 00 90 54 FF 13 00 90 54 FF 13 16 
    //19 01 58 55 FF 13 10 00 00 1B 23 0C 00 00 00 90 54 FF 13 00 90 54 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (SelfAction != None) {                                                   //0000 : 07 25 00 77 01 58 55 FF 13 2A 16 
      return SelfAction.sv_CanExecute(aObject,aObject);                         //000B : 04 19 01 58 55 FF 13 10 00 04 1B 22 0C 00 00 00 48 56 FF 13 00 48 56 FF 13 16 
    }
    return False;                                                               //0025 : 04 28 
    //07 25 00 77 01 58 55 FF 13 2A 16 04 19 01 58 55 FF 13 10 00 04 1B 22 0C 00 00 00 48 56 FF 13 00 
    //48 56 FF 13 16 04 28 04 0B 47 
  }



