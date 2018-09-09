//==============================================================================
//  Game_UnarmedCombatState
//==============================================================================

class Game_UnarmedCombatState extends Game_NPCCombatState within Game_NPCPawn
    native
    dependsOn(Game_NPCPawn,Game_CharacterStats,Game_Skills)
  ;


  protected native function sv2rel_SetMonsterMode_CallStub();


  protected event sv2rel_SetMonsterMode(byte aMode) {
    mCombatMode = aMode;                                                        //0000 : 0F 01 B0 B4 26 11 00 D0 9D 34 0F 
    if (mCombatMode != 0) {                                                     //000B : 07 31 00 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 
      Outer.SetCollision(True,CombatCollision);                                 //001B : 19 01 00 E4 6B 0F 0A 00 00 61 06 27 2D 01 28 B5 26 11 16 
    } else {                                                                    //002E : 06 48 00 
      if (CombatCollision) {                                                    //0031 : 07 48 00 2D 01 28 B5 26 11 
        Outer.SetCollision(True,False);                                         //003A : 19 01 00 E4 6B 0F 05 00 00 61 06 27 28 16 
      }
    }
    mSheathing = False;                                                         //0048 : 14 2D 01 E0 BD 26 11 28 
    mDrawing = False;                                                           //0050 : 14 2D 01 50 B7 26 11 28 
    mMainWeapon = 0;                                                            //0058 : 0F 01 98 B2 26 11 25 
    mOffhandWeapon = 0;                                                         //005F : 0F 01 08 B0 26 11 25 
    mWeaponFlag = ResolveWeaponFlag(mCombatMode,None,None);                     //0066 : 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 
    //0F 01 B0 B4 26 11 00 D0 9D 34 0F 07 31 00 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 19 01 00 E4 6B 
    //0F 0A 00 00 61 06 27 2D 01 28 B5 26 11 16 06 48 00 07 48 00 2D 01 28 B5 26 11 19 01 00 E4 6B 0F 
    //05 00 00 61 06 27 28 16 14 2D 01 E0 BD 26 11 28 14 2D 01 50 B7 26 11 28 0F 01 98 B2 26 11 25 0F 
    //01 08 B0 26 11 25 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 04 0B 47 
  }


  function bool sv_SwitchToMode(byte aMode) {
    if (mCombatMode != aMode) {                                                 //0000 : 07 88 00 9B 39 3A 01 B0 B4 26 11 39 3A 00 88 5D 31 0F 16 
      if (mCombatMode != 0) {                                                   //0013 : 07 79 00 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 
        if (aMode != 0) {                                                       //0023 : 07 6F 00 9B 39 3A 00 88 5D 31 0F 39 3A 24 00 16 
          mCombatMode = aMode;                                                  //0033 : 0F 01 B0 B4 26 11 00 88 5D 31 0F 
          mWeaponFlag = ResolveWeaponFlag(mCombatMode,None,None);               //003E : 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 
          mMainWeapon = 0;                                                      //0051 : 0F 01 98 B2 26 11 25 
          mOffhandWeapon = 0;                                                   //0058 : 0F 01 08 B0 26 11 25 
          sv2rel_SetMonsterMode_CallStub(mCombatMode);                          //005F : 1B 01 0D 00 00 01 B0 B4 26 11 16 
          return True;                                                          //006A : 04 27 
        } else {                                                                //006C : 06 76 00 
          return sv_SheatheWeapon();                                            //006F : 04 1B 3B 07 00 00 16 
        }
      } else {                                                                  //0076 : 06 85 00 
        return sv_DrawWeapon(aMode);                                            //0079 : 04 1B 09 07 00 00 00 88 5D 31 0F 16 
      }
    } else {                                                                    //0085 : 06 8A 00 
      return True;                                                              //0088 : 04 27 
    }
    //07 88 00 9B 39 3A 01 B0 B4 26 11 39 3A 00 88 5D 31 0F 16 07 79 00 9B 39 3A 01 B0 B4 26 11 39 3A 
    //24 00 16 07 6F 00 9B 39 3A 00 88 5D 31 0F 39 3A 24 00 16 0F 01 B0 B4 26 11 00 88 5D 31 0F 0F 01 
    //38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 0F 01 98 B2 26 11 25 0F 01 08 B0 26 11 25 1B 
    //01 0D 00 00 01 B0 B4 26 11 16 04 27 06 76 00 04 1B 3B 07 00 00 16 06 85 00 04 1B 09 07 00 00 00 
    //88 5D 31 0F 16 06 8A 00 04 27 04 0B 47 
  }


  event bool sv_SheatheWeapon() {
    if (Outer.CharacterStats.IsMovementFrozen()) {                              //0000 : 07 1D 00 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 
      return False;                                                             //001B : 04 28 
    }
    if (mCombatMode == 0 || mSheathing || mDrawing) {                           //001D : 07 45 00 84 84 9A 39 3A 01 B0 B4 26 11 39 3A 24 00 16 18 07 00 2D 01 E0 BD 26 11 16 18 07 00 2D 01 50 B7 26 11 16 
      return False;                                                             //0043 : 04 28 
    }
    mCombatMode = 0;                                                            //0045 : 0F 01 B0 B4 26 11 24 00 
    mSheathing = False;                                                         //004D : 14 2D 01 E0 BD 26 11 28 
    mMainWeapon = 0;                                                            //0055 : 0F 01 98 B2 26 11 25 
    mOffhandWeapon = 0;                                                         //005C : 0F 01 08 B0 26 11 25 
    mWeaponFlag = ResolveWeaponFlag(mCombatMode,None,None);                     //0063 : 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 
    sv2rel_SetMonsterMode_CallStub(mCombatMode);                                //0076 : 1B 01 0D 00 00 01 B0 B4 26 11 16 
    if (CombatCollision) {                                                      //0081 : 07 98 00 2D 01 28 B5 26 11 
      Outer.SetCollision(True,False);                                           //008A : 19 01 00 E4 6B 0F 05 00 00 61 06 27 28 16 
    }
    Outer.Skills.FireCondition(None,3);                                         //0098 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 03 16 
    return True;                                                                //00B3 : 04 27 
    //07 1D 00 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 04 28 07 45 00 
    //84 84 9A 39 3A 01 B0 B4 26 11 39 3A 24 00 16 18 07 00 2D 01 E0 BD 26 11 16 18 07 00 2D 01 50 B7 
    //26 11 16 04 28 0F 01 B0 B4 26 11 24 00 14 2D 01 E0 BD 26 11 28 0F 01 98 B2 26 11 25 0F 01 08 B0 
    //26 11 25 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 1B 01 0D 00 00 01 B0 B4 26 11 
    //16 07 98 00 2D 01 28 B5 26 11 19 01 00 E4 6B 0F 05 00 00 61 06 27 28 16 19 19 01 00 E4 6B 0F 05 
    //00 04 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 03 16 04 27 04 0B 47 
  }


  event bool sv_DrawWeapon(byte aInitialMode) {
    mCombatMode = aInitialMode;                                                 //0000 : 0F 01 B0 B4 26 11 00 90 60 31 0F 
    mDrawing = False;                                                           //000B : 14 2D 01 50 B7 26 11 28 
    mWeaponFlag = 0;                                                            //0013 : 0F 01 38 B4 26 11 24 00 
    mMainWeapon = 0;                                                            //001B : 0F 01 98 B2 26 11 25 
    mOffhandWeapon = 0;                                                         //0022 : 0F 01 08 B0 26 11 25 
    sv2rel_SetMonsterMode_CallStub(aInitialMode);                               //0029 : 1B 01 0D 00 00 00 90 60 31 0F 16 
    Outer.SetCollision(True,CombatCollision);                                   //0034 : 19 01 00 E4 6B 0F 0A 00 00 61 06 27 2D 01 28 B5 26 11 16 
    Outer.Skills.FireCondition(None,4);                                         //0047 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 04 16 
    mWeaponFlag = 1;                                                            //0062 : 0F 01 38 B4 26 11 24 01 
    return True;                                                                //006A : 04 27 
    //0F 01 B0 B4 26 11 00 90 60 31 0F 14 2D 01 50 B7 26 11 28 0F 01 38 B4 26 11 24 00 0F 01 98 B2 26 
    //11 25 0F 01 08 B0 26 11 25 1B 01 0D 00 00 00 90 60 31 0F 16 19 01 00 E4 6B 0F 0A 00 00 61 06 27 
    //2D 01 28 B5 26 11 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 
    //04 16 0F 01 38 B4 26 11 24 01 04 27 04 0B 47 
  }



