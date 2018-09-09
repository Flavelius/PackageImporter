//==============================================================================
//  FSkill_EffectClass_Direct
//==============================================================================

class FSkill_EffectClass_Direct extends FSkill_EffectClass
    native
    abstract
    dependsOn(Game_Pawn,Game_PlayerController,Game_PlayerInput)
  ;


  protected function CheckAutoTarget(Game_Pawn aSource,Game_Pawn aTarget) {
    if (aSource != None && aTarget != None
      && aSource.IsLocalPlayer()
      && aSource != aTarget) {//0000 : 07 68 00 82 82 82 77 00 40 29 38 11 2A 16 18 09 00 77 00 78 2A 38 11 2A 16 16 18 10 00 19 00 40 29 38 11 06 00 04 1C 18 1A 76 0F 16 16 18 0D 00 77 00 40 29 38 11 00 78 2A 38 11 16 16 
      Game_PlayerController(aSource.Controller).Input.AutoTarget(aTarget);      //003D : 19 19 2E 90 18 5B 01 19 00 40 29 38 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 0B 00 00 1B CC 0C 00 00 00 78 2A 38 11 16 
    }
    //07 68 00 82 82 82 77 00 40 29 38 11 2A 16 18 09 00 77 00 78 2A 38 11 2A 16 16 18 10 00 19 00 40 
    //29 38 11 06 00 04 1C 18 1A 76 0F 16 16 18 0D 00 77 00 40 29 38 11 00 78 2A 38 11 16 16 19 19 2E 
    //90 18 5B 01 19 00 40 29 38 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 0B 00 00 1B CC 0C 
    //00 00 00 78 2A 38 11 16 04 0B 47 
  }



