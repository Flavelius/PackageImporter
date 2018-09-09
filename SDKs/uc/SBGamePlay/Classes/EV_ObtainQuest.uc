//==============================================================================
//  EV_ObtainQuest
//==============================================================================

class EV_ObtainQuest extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const export editinline Quest_Type quest;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    ObtainQuest(aObject,quest);                                                 //0000 : 1B F0 0F 00 00 00 A0 F8 FF 13 01 60 F9 FF 13 16 
    //1B F0 0F 00 00 00 A0 F8 FF 13 01 60 F9 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (MeetsRequirementsQuest(aObject,quest)) {                                //0000 : 07 15 00 1C 08 2F 20 11 00 50 FA FF 13 01 60 F9 FF 13 16 
      return True;                                                              //0013 : 04 27 
    }
    return False;                                                               //0015 : 04 28 
    //07 15 00 1C 08 2F 20 11 00 50 FA FF 13 01 60 F9 FF 13 16 04 27 04 28 04 0B 47 
  }



