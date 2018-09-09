//==============================================================================
//  EV_SkillEffectsTargeted
//==============================================================================

class EV_SkillEffectsTargeted extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Skills)
  ;

  var (Action) const export editinline FSkill_Type Skill;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Pawn executor;
    local Game_Pawn Target;
    if (aObject != None) {                                                      //0000 : 07 19 00 77 00 B8 BB FF 13 2A 16 
      executor = aObject;                                                       //000B : 0F 00 F0 BC FF 13 00 B8 BB FF 13 
    } else {                                                                    //0016 : 06 24 00 
      executor = aSubject;                                                      //0019 : 0F 00 F0 BC FF 13 00 68 BD FF 13 
    }
    if (aSubject != None) {                                                     //0024 : 07 3D 00 77 00 68 BD FF 13 2A 16 
      Target = aSubject;                                                        //002F : 0F 00 E0 BD FF 13 00 68 BD FF 13 
    } else {                                                                    //003A : 06 48 00 
      Target = aObject;                                                         //003D : 0F 00 E0 BD FF 13 00 B8 BB FF 13 
    }
    executor.Skills.sv_DirectSkillEffects(Skill,Target);                        //0048 : 19 19 00 F0 BC FF 13 05 00 04 01 08 28 18 11 10 00 00 1C D0 C5 21 11 01 58 BE FF 13 00 E0 BD FF 13 16 
    //07 19 00 77 00 B8 BB FF 13 2A 16 0F 00 F0 BC FF 13 00 B8 BB FF 13 06 24 00 0F 00 F0 BC FF 13 00 
    //68 BD FF 13 07 3D 00 77 00 68 BD FF 13 2A 16 0F 00 E0 BD FF 13 00 68 BD FF 13 06 48 00 0F 00 E0 
    //BD FF 13 00 B8 BB FF 13 19 19 00 F0 BC FF 13 05 00 04 01 08 28 18 11 10 00 00 1C D0 C5 21 11 01 
    //58 BE FF 13 00 E0 BD FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return Skill != None
      && (aObject != None || aSubject != None);        //0000 : 04 82 77 01 58 BE FF 13 2A 16 18 16 00 84 77 00 D0 BE FF 13 2A 16 18 09 00 77 00 A8 BF FF 13 2A 16 16 16 
    //04 82 77 01 58 BE FF 13 2A 16 18 16 00 84 77 00 D0 BE FF 13 2A 16 18 09 00 77 00 A8 BF FF 13 2A 
    //16 16 16 04 0B 47 
  }



