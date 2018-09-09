//==============================================================================
//  IC_BodySlot
//==============================================================================

class IC_BodySlot extends Item_Component
    native
    editinlinenew
    dependsOn(Game_Pawn,Game_Skills,LevelInfo,Game_CharacterStats,Game_CombatState)
  ;

  enum IC_BodySlotType {
    ICBS_Spirit ,
    ICBS_Soul ,
    ICBS_Rune 
  };

  var (Skill) const export editinline FSkill_Type_BodySlot FakeSkill;
  var (Skill) const bool UserStartable;
  var (BodySlot) const byte Type;
  var (BodySlot) const byte ForClass;


  event OnUse(Game_Pawn aPawn,Game_Item aItem) {
    local byte skillStartFailure;
    if (FakeSkill != None) {                                                    //0000 : 07 AF 00 77 01 20 4A 38 11 2A 16 
      if (aPawn.Skills != None) {                                               //000B : 07 AC 00 77 19 00 88 48 38 11 05 00 04 01 08 28 18 11 2A 16 
        skillStartFailure = aPawn.Skills.CanActivateSpecificSkill(FakeSkill,True);//001F : 0F 00 98 4A 38 11 19 19 00 88 48 38 11 05 00 04 01 08 28 18 11 0C 00 01 1C 30 D4 21 11 01 20 4A 38 11 27 16 
        if (skillStartFailure == 7 && !UserStartable
          || skillStartFailure == 0) {//0043 : 07 A9 00 84 82 9A 39 3A 00 98 4A 38 11 39 3A 24 07 16 18 09 00 81 2D 01 10 4B 38 11 16 16 18 0E 00 9A 39 3A 00 98 4A 38 11 39 3A 24 00 16 16 
          aPawn.Skills.Execute(FakeSkill,aPawn.Level.TimeSeconds);              //0072 : 19 19 00 88 48 38 11 05 00 04 01 08 28 18 11 22 00 00 1C A8 CD 21 11 01 20 4A 38 11 19 19 00 88 48 38 11 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 
          goto jl00A9;                                                          //00A6 : 06 A9 00 
        }
        goto jl00AC;                                                            //00A9 : 06 AC 00 
      }
      goto jl00AF;                                                              //00AC : 06 AF 00 
    }
    //07 AF 00 77 01 20 4A 38 11 2A 16 07 AC 00 77 19 00 88 48 38 11 05 00 04 01 08 28 18 11 2A 16 0F 
    //00 98 4A 38 11 19 19 00 88 48 38 11 05 00 04 01 08 28 18 11 0C 00 01 1C 30 D4 21 11 01 20 4A 38 
    //11 27 16 07 A9 00 84 82 9A 39 3A 00 98 4A 38 11 39 3A 24 07 16 18 09 00 81 2D 01 10 4B 38 11 16 
    //16 18 0E 00 9A 39 3A 00 98 4A 38 11 39 3A 24 00 16 16 19 19 00 88 48 38 11 05 00 04 01 08 28 18 
    //11 22 00 00 1C A8 CD 21 11 01 20 4A 38 11 19 19 00 88 48 38 11 05 00 04 01 D8 7E 6C 0F 05 00 04 
    //01 A8 81 6C 0F 16 06 A9 00 06 AC 00 06 AF 00 04 0B 47 
  }


  event bool CanUse(Game_Pawn aPawn,Game_Item aItem) {
    if (!UserStartable) {                                                       //0000 : 07 0D 00 81 2D 01 10 4B 38 11 16 
      return True;                                                              //000B : 04 27 
    }
    if (ForClass != aPawn.CharacterStats.GetCharacterClass()
      && ForClass != aPawn.CharacterStats.GetArchetype()) {//000D : 07 5D 00 82 9B 39 3A 01 00 4E 38 11 39 3A 19 19 00 00 4C 38 11 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 16 18 24 00 9B 39 3A 01 00 4E 38 11 39 3A 19 19 00 00 4C 38 11 05 00 04 01 08 43 34 0F 06 00 01 1C 70 9C 18 11 16 16 16 
      return False;                                                             //005B : 04 28 
    }
    if (FakeSkill != None) {                                                    //005D : 07 F8 00 77 01 20 4A 38 11 2A 16 
      if (aPawn.Skills != None) {                                               //0068 : 07 F8 00 77 19 00 00 4C 38 11 05 00 04 01 08 28 18 11 2A 16 
        if (aPawn.Skills.CanActivateSpecificSkill(FakeSkill) == 0) {            //007C : 07 F8 00 9A 39 3A 19 19 00 00 4C 38 11 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 01 20 4A 38 11 16 39 3A 24 00 16 
          if (ForClass == 5) {                                                  //00A4 : 07 E7 00 9A 39 3A 01 00 4E 38 11 39 3A 24 05 16 
            if (aPawn.combatState.CombatReady()) {                              //00B4 : 07 E7 00 19 19 00 00 4C 38 11 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 
              aPawn.combatState.sv_SheatheWeapon();                             //00CF : 19 19 00 00 4C 38 11 05 00 04 01 B8 40 18 11 06 00 04 1B 3B 07 00 00 16 
            }
          }
          return Super.CanUse(aPawn,aItem);                                     //00E7 : 04 1C 18 93 2E 11 00 00 4C 38 11 00 78 4E 38 11 16 
        }
      }
    }
    return False;                                                               //00F8 : 04 28 
    //07 0D 00 81 2D 01 10 4B 38 11 16 04 27 07 5D 00 82 9B 39 3A 01 00 4E 38 11 39 3A 19 19 00 00 4C 
    //38 11 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 16 18 24 00 9B 39 3A 01 00 4E 38 11 39 
    //3A 19 19 00 00 4C 38 11 05 00 04 01 08 43 34 0F 06 00 01 1C 70 9C 18 11 16 16 16 04 28 07 F8 00 
    //77 01 20 4A 38 11 2A 16 07 F8 00 77 19 00 00 4C 38 11 05 00 04 01 08 28 18 11 2A 16 07 F8 00 9A 
    //39 3A 19 19 00 00 4C 38 11 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 01 20 4A 38 11 16 39 
    //3A 24 00 16 07 E7 00 9A 39 3A 01 00 4E 38 11 39 3A 24 05 16 07 E7 00 19 19 00 00 4C 38 11 05 00 
    //04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 19 19 00 00 4C 38 11 05 00 04 01 B8 40 18 11 06 00 
    //04 1B 3B 07 00 00 16 04 1C 18 93 2E 11 00 00 4C 38 11 00 78 4E 38 11 16 04 28 04 0B 47 
  }



