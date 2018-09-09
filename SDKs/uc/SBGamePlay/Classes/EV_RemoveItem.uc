//==============================================================================
//  EV_RemoveItem
//==============================================================================

class EV_RemoveItem extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const editinline Content_Inventory Items;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    RemoveItems(aSubject,Items);                                                //0000 : 1B FE 0F 00 00 00 58 9C FF 13 01 D0 9C FF 13 16 
    //1B FE 0F 00 00 00 58 9C FF 13 01 D0 9C FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (HasItems(aSubject,Items)) {                                             //0000 : 07 15 00 1B 6C 10 00 00 00 10 9E FF 13 01 D0 9C FF 13 16 
      return True;                                                              //0013 : 04 27 
    }
    return False;                                                               //0015 : 04 28 
    //07 15 00 1B 6C 10 00 00 00 10 9E FF 13 01 D0 9C FF 13 16 04 27 04 28 04 0B 47 
  }



