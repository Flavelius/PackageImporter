//==============================================================================
//  EV_FinishQuest
//==============================================================================

class EV_FinishQuest extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Quest_Type)
  ;

  var (Action) const export editinline Quest_Type quest;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    FinishQuest(aSubject,quest);                                                //0000 : 1C 38 23 20 11 00 20 F4 FF 13 01 98 F4 FF 13 16 
    //1C 38 23 20 11 00 20 F4 FF 13 01 98 F4 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (HasCompletedQuest(aSubject,quest)) {                                    //0000 : 07 2C 00 1C D8 27 20 11 00 F8 F5 FF 13 01 98 F4 FF 13 16 
      if (quest.sv_CanComplete(aSubject)) {                                     //0013 : 07 2C 00 19 01 98 F4 FF 13 0B 00 04 1C 78 51 2E 11 00 F8 F5 FF 13 16 
        return True;                                                            //002A : 04 27 
      }
    }
    return False;                                                               //002C : 04 28 
    //07 2C 00 1C D8 27 20 11 00 F8 F5 FF 13 01 98 F4 FF 13 16 07 2C 00 19 01 98 F4 FF 13 0B 00 04 1C 
    //78 51 2E 11 00 F8 F5 FF 13 16 04 27 04 28 04 0B 47 
  }



