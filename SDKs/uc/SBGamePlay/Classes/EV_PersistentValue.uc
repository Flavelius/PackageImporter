//==============================================================================
//  EV_PersistentValue
//==============================================================================

class EV_PersistentValue extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn)
  ;

  var export editinline Content_Type context;
  var (Action) int VariableID;
  var (Action) int Value;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    SetPersistentVariable(aSubject,VariableID,Value);                           //0000 : 1B 6A 10 00 00 00 D0 79 FF 13 01 48 7A FF 13 01 C0 7A FF 13 16 
    //1B 6A 10 00 00 00 D0 79 FF 13 01 48 7A FF 13 01 C0 7A FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (VariableID < 0) {                                                       //0000 : 07 0D 00 96 01 48 7A FF 13 25 16 
      return False;                                                             //000B : 04 28 
    }
    if (!aSubject.IsPlayerPawn()) {                                             //000D : 07 23 00 81 19 00 88 7C FF 13 06 00 04 1B B9 0C 00 00 16 16 
      return False;                                                             //0021 : 04 28 
    }
    return True;                                                                //0023 : 04 27 
    //07 0D 00 96 01 48 7A FF 13 25 16 04 28 07 23 00 81 19 00 88 7C FF 13 06 00 04 1B B9 0C 00 00 16 
    //16 04 28 04 27 04 0B 47 
  }



