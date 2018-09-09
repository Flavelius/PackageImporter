//==============================================================================
//  EV_RemoveMoney
//==============================================================================

class EV_RemoveMoney extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const int Amount;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    RemoveMoney(aSubject,Amount);                                               //0000 : 1B 6B 10 00 00 00 28 92 FF 13 01 A0 92 FF 13 16 
    //1B 6B 10 00 00 00 28 92 FF 13 01 A0 92 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (Amount < 0) {                                                           //0000 : 07 10 00 96 01 A0 92 FF 13 25 16 
      return False;                                                             //000B : 04 28 
    } else {                                                                    //000D : 06 23 00 
      return GetMoney(aSubject) >= Amount;                                      //0010 : 04 99 1C B0 03 20 11 00 F0 93 FF 13 16 01 A0 92 FF 13 16 
    }
    //07 10 00 96 01 A0 92 FF 13 25 16 04 28 06 23 00 04 99 1C B0 03 20 11 00 F0 93 FF 13 16 01 A0 92 
    //FF 13 16 04 0B 47 
  }



