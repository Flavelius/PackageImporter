//==============================================================================
//  EV_GiveItem
//==============================================================================

class EV_GiveItem extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const editinline Content_Inventory Items;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    GiveItems(aSubject,Items);                                                  //0000 : 1C D8 07 20 11 00 48 97 FF 13 01 C0 97 FF 13 16 
    //1C D8 07 20 11 00 48 97 FF 13 01 C0 97 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (CanReceiveItems(aSubject,Items)) {                                      //0000 : 07 15 00 1B 89 04 00 00 00 00 99 FF 13 01 C0 97 FF 13 16 
      return True;                                                              //0013 : 04 27 
    }
    return False;                                                               //0015 : 04 28 
    //07 15 00 1B 89 04 00 00 00 00 99 FF 13 01 C0 97 FF 13 16 04 27 04 28 04 0B 47 
  }



