//==============================================================================
//  EV_GiveSkill
//==============================================================================

class EV_GiveSkill extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const export editinline FSkill_Type Skill;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    LearnSkill(aSubject,Skill);                                                 //0000 : 1C C0 F3 1F 11 00 68 B7 FF 13 01 E0 B7 FF 13 16 
    //1C C0 F3 1F 11 00 68 B7 FF 13 01 E0 B7 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (CanLearnSkill(aSubject,Skill)) {                                        //0000 : 07 15 00 1C D8 F6 1F 11 00 20 B9 FF 13 01 E0 B7 FF 13 16 
      return True;                                                              //0013 : 04 27 
    }
    return False;                                                               //0015 : 04 28 
    //07 15 00 1C D8 F6 1F 11 00 20 B9 FF 13 01 E0 B7 FF 13 16 04 27 04 28 04 0B 47 
  }



