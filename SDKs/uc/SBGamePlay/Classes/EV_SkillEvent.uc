//==============================================================================
//  EV_SkillEvent
//==============================================================================

class EV_SkillEvent extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Skills)
  ;

  var (Action) const export editinline FSkill_Event_Duff duffEvent;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    aSubject.Skills.sv_AddSpecialDuffEvent(duffEvent);                          //0000 : 19 19 00 18 B2 FF 13 05 00 04 01 08 28 18 11 0B 00 00 1C F0 37 23 11 01 90 B2 FF 13 16 
    //19 19 00 18 B2 FF 13 05 00 04 01 08 28 18 11 0B 00 00 1C F0 37 23 11 01 90 B2 FF 13 16 04 0B 47 
    //
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return duffEvent != None && aSubject != None
      && aSubject.Skills != None;//0000 : 04 82 82 77 01 90 B2 FF 13 2A 16 18 09 00 77 00 E8 B3 FF 13 2A 16 16 18 12 00 77 19 00 E8 B3 FF 13 05 00 04 01 08 28 18 11 2A 16 16 
    //04 82 82 77 01 90 B2 FF 13 2A 16 18 09 00 77 00 E8 B3 FF 13 2A 16 16 18 12 00 77 19 00 E8 B3 FF 
    //13 05 00 04 01 08 28 18 11 2A 16 16 04 0B 47 
  }



