//==============================================================================
//  EV_Die
//==============================================================================

class EV_Die extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn)
  ;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    aObject.SetHealth(0.00000000);                                              //0000 : 19 00 08 0F 00 14 0B 00 00 1B AC 0F 00 00 1E 00 00 00 00 16 
    //19 00 08 0F 00 14 0B 00 00 1B AC 0F 00 00 1E 00 00 00 00 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



