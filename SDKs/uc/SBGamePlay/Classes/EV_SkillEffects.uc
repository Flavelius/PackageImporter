//==============================================================================
//  EV_SkillEffects
//==============================================================================

class EV_SkillEffects extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Skills)
  ;

  var (Action) const export editinline FSkill_Type Skill;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (aObject != None) {                                                      //0000 : 07 30 00 77 00 58 C2 FF 13 2A 16 
      aObject.Skills.sv_DirectSkillEffects(Skill,aObject);                      //000B : 19 19 00 58 C2 FF 13 05 00 04 01 08 28 18 11 10 00 00 1C D0 C5 21 11 01 70 C3 FF 13 00 58 C2 FF 13 16 
    } else {                                                                    //002D : 06 52 00 
      aSubject.Skills.sv_DirectSkillEffects(Skill,aSubject);                    //0030 : 19 19 00 E8 C3 FF 13 05 00 04 01 08 28 18 11 10 00 00 1C D0 C5 21 11 01 70 C3 FF 13 00 E8 C3 FF 13 16 
    }
    //07 30 00 77 00 58 C2 FF 13 2A 16 19 19 00 58 C2 FF 13 05 00 04 01 08 28 18 11 10 00 00 1C D0 C5 
    //21 11 01 70 C3 FF 13 00 58 C2 FF 13 16 06 52 00 19 19 00 E8 C3 FF 13 05 00 04 01 08 28 18 11 10 
    //00 00 1C D0 C5 21 11 01 70 C3 FF 13 00 E8 C3 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return Skill != None
      && (aObject != None || aSubject != None);        //0000 : 04 82 77 01 70 C3 FF 13 2A 16 18 16 00 84 77 00 60 C4 FF 13 2A 16 18 09 00 77 00 38 C5 FF 13 2A 16 16 16 
    //04 82 77 01 70 C3 FF 13 2A 16 18 16 00 84 77 00 60 C4 FF 13 2A 16 18 09 00 77 00 38 C5 FF 13 2A 
    //16 16 16 04 0B 47 
  }



