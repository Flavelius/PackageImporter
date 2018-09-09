//==============================================================================
//  EV_GiveMoney
//==============================================================================

class EV_GiveMoney extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const int Amount;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    GiveMoney(aSubject,Amount);                                                 //0000 : 1C 78 FB 1F 11 00 18 8D FF 13 01 90 8D FF 13 16 
    //1C 78 FB 1F 11 00 18 8D FF 13 01 90 8D FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (Amount < 0) {                                                           //0000 : 07 10 00 96 01 90 8D FF 13 25 16 
      return False;                                                             //000B : 04 28 
    } else {                                                                    //000D : 06 12 00 
      return True;                                                              //0010 : 04 27 
    }
    //07 10 00 96 01 90 8D FF 13 25 16 04 28 06 12 00 04 27 04 0B 47 
  }



