//==============================================================================
//  EV_Swap
//==============================================================================

class EV_Swap extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const export editinline Content_Event SwappedAction;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    SwappedAction.sv_Execute(aSubject,aObject);                                 //0000 : 19 01 C8 4A FF 13 10 00 00 1B 23 0C 00 00 00 40 4B FF 13 00 00 4A FF 13 16 
    //19 01 C8 4A FF 13 10 00 00 1B 23 0C 00 00 00 40 4B FF 13 00 00 4A FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (SwappedAction != None) {                                                //0000 : 07 25 00 77 01 C8 4A FF 13 2A 16 
      return SwappedAction.sv_CanExecute(aSubject,aObject);                     //000B : 04 19 01 C8 4A FF 13 10 00 04 1B 22 0C 00 00 00 98 4C FF 13 00 B8 4B FF 13 16 
    }
    return False;                                                               //0025 : 04 28 
    //07 25 00 77 01 C8 4A FF 13 2A 16 04 19 01 C8 4A FF 13 10 00 04 1B 22 0C 00 00 00 98 4C FF 13 00 
    //B8 4B FF 13 16 04 28 04 0B 47 
  }



