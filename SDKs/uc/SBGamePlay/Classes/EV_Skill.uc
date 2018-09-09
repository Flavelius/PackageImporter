//==============================================================================
//  EV_Skill
//==============================================================================

class EV_Skill extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_CombatState,FSkill_Type,Game_Skills,LevelInfo)
  ;

  var (Action) const export editinline FSkill_Type Skill;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Pawn executor;
    local bool sheathe;
    if (aObject != None) {                                                      //0000 : 07 19 00 77 00 68 D1 FF 13 2A 16 
      executor = aObject;                                                       //000B : 0F 00 20 D3 FF 13 00 68 D1 FF 13 
    } else {                                                                    //0016 : 06 24 00 
      executor = aSubject;                                                      //0019 : 0F 00 20 D3 FF 13 00 98 D3 FF 13 
    }
    if (!executor.combatState.CheckWeaponType(Skill.RequiredWeapon)) {          //0024 : 07 94 00 81 19 19 00 20 D3 FF 13 05 00 04 01 B8 40 18 11 14 00 04 1B 13 10 00 00 19 01 10 D4 FF 13 05 00 01 01 10 B6 20 11 16 16 
      sheathe = executor.combatState.CombatReady();                             //004F : 14 2D 00 88 D4 FF 13 19 19 00 20 D3 FF 13 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 
      executor.combatState.sv_SwitchToWeaponType(Skill.RequiredWeapon);         //006E : 19 19 00 20 D3 FF 13 05 00 04 01 B8 40 18 11 14 00 04 1B 49 07 00 00 19 01 10 D4 FF 13 05 00 01 01 10 B6 20 11 16 
    }
    executor.Skills.Execute(Skill,executor.Level.TimeSeconds);                  //0094 : 19 19 00 20 D3 FF 13 05 00 04 01 08 28 18 11 22 00 00 1C A8 CD 21 11 01 10 D4 FF 13 19 19 00 20 D3 FF 13 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 
    //07 19 00 77 00 68 D1 FF 13 2A 16 0F 00 20 D3 FF 13 00 68 D1 FF 13 06 24 00 0F 00 20 D3 FF 13 00 
    //98 D3 FF 13 07 94 00 81 19 19 00 20 D3 FF 13 05 00 04 01 B8 40 18 11 14 00 04 1B 13 10 00 00 19 
    //01 10 D4 FF 13 05 00 01 01 10 B6 20 11 16 16 14 2D 00 88 D4 FF 13 19 19 00 20 D3 FF 13 05 00 04 
    //01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 19 19 00 20 D3 FF 13 05 00 04 01 B8 40 18 11 14 00 04 
    //1B 49 07 00 00 19 01 10 D4 FF 13 05 00 01 01 10 B6 20 11 16 19 19 00 20 D3 FF 13 05 00 04 01 08 
    //28 18 11 22 00 00 1C A8 CD 21 11 01 10 D4 FF 13 19 19 00 20 D3 FF 13 05 00 04 01 D8 7E 6C 0F 05 
    //00 04 01 A8 81 6C 0F 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return Skill != None
      && aObject.Skills.CanActivateSpecificSkill(Skill) == 0
      && (aObject != None || aSubject != None);//0000 : 04 82 82 77 01 10 D4 FF 13 2A 16 18 26 00 9A 39 3A 19 19 00 00 D5 FF 13 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 01 10 D4 FF 13 16 39 3A 24 00 16 16 18 16 00 84 77 00 00 D5 FF 13 2A 16 18 09 00 77 00 10 D6 FF 13 2A 16 16 16 
    //04 82 82 77 01 10 D4 FF 13 2A 16 18 26 00 9A 39 3A 19 19 00 00 D5 FF 13 05 00 04 01 08 28 18 11 
    //0B 00 01 1C 30 D4 21 11 01 10 D4 FF 13 16 39 3A 24 00 16 16 18 16 00 84 77 00 00 D5 FF 13 2A 16 
    //18 09 00 77 00 10 D6 FF 13 2A 16 16 16 04 0B 47 
  }



