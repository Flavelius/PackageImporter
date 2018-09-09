//==============================================================================
//  Game_CombatState
//==============================================================================

class Game_CombatState extends Base_Component within Game_Pawn
    native
    exportstructs
    dependsOn(Game_Pawn,Game_CharacterStats,SBAnimationFlags,Item_Type,SBDBSync,Game_Skills)
  ;

  enum ECombatMode {
    CBM_Idle ,
    CBM_Melee ,
    CBM_Ranged ,
    CBM_Cast 
  };

  var byte mCombatMode;
  var int mMainWeapon;
  var int mOffhandWeapon;
  var bool mDrawing;
  var bool mReDraw;
  var bool mSheathing;
  var bool mReSheathe;
  var byte mReDrawMode;
  var int mReDrawNewMainWeapon;
  var int mReDrawNewOffhandWeapon;
  var float mDrawSheatheTimer;
  var const float cDrawSheatheTime;
  var byte mWeaponFlag;
  var private bool mExecutingBodySlotSkill;
  var private bool mPreparedBonusGiven;
  var const bool CombatCollision;


  function RemovePreparedBonusConditional() {
    if (mPreparedBonusGiven) {                                                  //0000 : 07 68 00 2D 01 48 9D 26 11 
      mPreparedBonusGiven = False;                                              //0009 : 14 2D 01 48 9D 26 11 28 
      Outer.CharacterStats.IncreaseMeleeResistanceDelta(-0.05000000);           //0011 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 6B 0D 00 00 1E CD CC 4C BD 16 
      Outer.CharacterStats.IncreaseRangedResistanceDelta(-0.05000000);          //002E : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 6C 0D 00 00 1E CD CC 4C BD 16 
      Outer.CharacterStats.IncreaseMagicResistanceDelta(-0.05000000);           //004B : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 6D 0D 00 00 1E CD CC 4C BD 16 
    }
    //07 68 00 2D 01 48 9D 26 11 14 2D 01 48 9D 26 11 28 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 
    //0B 00 00 1B 6B 0D 00 00 1E CD CC 4C BD 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 
    //1B 6C 0D 00 00 1E CD CC 4C BD 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 6D 0D 
    //00 00 1E CD CC 4C BD 16 04 0B 47 
  }


  function GivePreparedBonusConditional() {
    if (!mPreparedBonusGiven) {                                                 //0000 : 07 6A 00 81 2D 01 48 9D 26 11 16 
      mPreparedBonusGiven = True;                                               //000B : 14 2D 01 48 9D 26 11 27 
      Outer.CharacterStats.IncreaseMeleeResistanceDelta(0.05000000);            //0013 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 6B 0D 00 00 1E CD CC 4C 3D 16 
      Outer.CharacterStats.IncreaseRangedResistanceDelta(0.05000000);           //0030 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 6C 0D 00 00 1E CD CC 4C 3D 16 
      Outer.CharacterStats.IncreaseMagicResistanceDelta(0.05000000);            //004D : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 6D 0D 00 00 1E CD CC 4C 3D 16 
    }
    //07 6A 00 81 2D 01 48 9D 26 11 16 14 2D 01 48 9D 26 11 27 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 
    //34 0F 0B 00 00 1B 6B 0D 00 00 1E CD CC 4C 3D 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 
    //00 00 1B 6C 0D 00 00 1E CD CC 4C 3D 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 0B 00 00 1B 
    //6D 0D 00 00 1E CD CC 4C 3D 16 04 0B 47 
  }


  function bool IsExecutingBodySlotSkill() {
    return mExecutingBodySlotSkill;                                             //0000 : 04 2D 01 20 A5 26 11 
    //04 2D 01 20 A5 26 11 04 0B 47 
  }


  protected native function sv2cl_SetExecutingBodySlotSkill_CallStub();


  event sv2cl_SetExecutingBodySlotSkill(bool aExecutingBodySlotSkill) {
    mExecutingBodySlotSkill = aExecutingBodySlotSkill;                          //0000 : 14 2D 01 20 A5 26 11 2D 00 F8 A6 26 11 
    //14 2D 01 20 A5 26 11 2D 00 F8 A6 26 11 04 0B 47 
  }


  event sv_SetExecutingBodySlotSkill(bool aExecutingBodySlotSkill) {
    mExecutingBodySlotSkill = aExecutingBodySlotSkill;                          //0000 : 14 2D 01 20 A5 26 11 2D 00 60 A8 26 11 
    sv2cl_SetExecutingBodySlotSkill_CallStub(mExecutingBodySlotSkill);          //000D : 1B D8 0D 00 00 2D 01 20 A5 26 11 16 
    //14 2D 01 20 A5 26 11 2D 00 60 A8 26 11 1B D8 0D 00 00 2D 01 20 A5 26 11 16 04 0B 47 
  }


  protected final event byte ResolveWeaponFlag(byte aMode,export editinline Item_Type aMainWeapon,export editinline Item_Type aOffhandWeapon) {
    if (aMode == 0) {                                                           //0000 : 07 1F 00 9A 39 3A 00 D8 A9 26 11 39 3A 24 00 16 
      return Class'SBAnimationFlags'.0;                                         //0010 : 04 12 20 10 BA D6 00 02 00 01 24 00 
    } else {                                                                    //001C : 06 CB 00 
      if (aMode == 1) {                                                         //001F : 07 71 00 9A 39 3A 00 D8 A9 26 11 39 3A 24 01 16 
        if (aOffhandWeapon != None) {                                           //002F : 07 4D 00 77 00 50 AA 26 11 2A 16 
          return aOffhandWeapon.GetWeaponType();                                //003A : 04 19 00 50 AA 26 11 06 00 01 1B 84 05 00 00 16 
        } else {                                                                //004A : 06 6E 00 
          if (aMainWeapon != None) {                                            //004D : 07 6B 00 77 00 C8 AA 26 11 2A 16 
            return aMainWeapon.GetWeaponType();                                 //0058 : 04 19 00 C8 AA 26 11 06 00 01 1B 84 05 00 00 16 
          } else {                                                              //0068 : 06 6E 00 
            return 1;                                                           //006B : 04 24 01 
          }
        }
      } else {                                                                  //006E : 06 CB 00 
        if (aMode == 2) {                                                       //0071 : 07 94 00 9A 39 3A 00 D8 A9 26 11 39 3A 24 02 16 
          return aMainWeapon.GetWeaponType();                                   //0081 : 04 19 00 C8 AA 26 11 06 00 01 1B 84 05 00 00 16 
        } else {                                                                //0091 : 06 CB 00 
          if (aMode == 3) {                                                     //0094 : 07 AA 00 9A 39 3A 00 D8 A9 26 11 39 3A 24 03 16 
            return 1;                                                           //00A4 : 04 24 01 
          } else {                                                              //00A7 : 06 CB 00 
            if (aMainWeapon != None) {                                          //00AA : 07 C8 00 77 00 C8 AA 26 11 2A 16 
              return aMainWeapon.GetWeaponType();                               //00B5 : 04 19 00 C8 AA 26 11 06 00 01 1B 84 05 00 00 16 
            } else {                                                            //00C5 : 06 CB 00 
              return 1;                                                         //00C8 : 04 24 01 
            }
          }
        }
      }
    }
    //07 1F 00 9A 39 3A 00 D8 A9 26 11 39 3A 24 00 16 04 12 20 10 BA D6 00 02 00 01 24 00 06 CB 00 07 
    //71 00 9A 39 3A 00 D8 A9 26 11 39 3A 24 01 16 07 4D 00 77 00 50 AA 26 11 2A 16 04 19 00 50 AA 26 
    //11 06 00 01 1B 84 05 00 00 16 06 6E 00 07 6B 00 77 00 C8 AA 26 11 2A 16 04 19 00 C8 AA 26 11 06 
    //00 01 1B 84 05 00 00 16 06 6E 00 04 24 01 06 CB 00 07 94 00 9A 39 3A 00 D8 A9 26 11 39 3A 24 02 
    //16 04 19 00 C8 AA 26 11 06 00 01 1B 84 05 00 00 16 06 CB 00 07 AA 00 9A 39 3A 00 D8 A9 26 11 39 
    //3A 24 03 16 04 24 01 06 CB 00 07 C8 00 77 00 C8 AA 26 11 2A 16 04 19 00 C8 AA 26 11 06 00 01 1B 
    //84 05 00 00 16 06 CB 00 04 24 01 04 0B 47 
  }


  protected native function ResolveWeapons(byte aMode,export out editinline Item_Type oMainWeapon,export out editinline Item_Type oOffhandWeapon);


  protected event Item_Type GetOffhandWeapon() {
    local export editinline Item_Type ret;
    if (mOffhandWeapon != 0) {                                                  //0000 : 07 33 00 9B 01 08 B0 26 11 25 16 
      ret = Item_Type(Class'SBDBSync'.GetResourceObject(mOffhandWeapon));       //000B : 0F 00 80 B0 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 01 08 B0 26 11 16 
      return ret;                                                               //002A : 04 00 80 B0 26 11 
    } else {                                                                    //0030 : 06 35 00 
      return None;                                                              //0033 : 04 2A 
    }
    //07 33 00 9B 01 08 B0 26 11 25 16 0F 00 80 B0 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B 
    //E5 0B 00 00 01 08 B0 26 11 16 04 00 80 B0 26 11 06 35 00 04 2A 04 0B 47 
  }


  protected event Item_Type GetMainWeapon() {
    local export editinline Item_Type ret;
    if (mMainWeapon != 0) {                                                     //0000 : 07 33 00 9B 01 98 B2 26 11 25 16 
      ret = Item_Type(Class'SBDBSync'.GetResourceObject(mMainWeapon));          //000B : 0F 00 10 B3 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 01 98 B2 26 11 16 
      return ret;                                                               //002A : 04 00 10 B3 26 11 
    } else {                                                                    //0030 : 06 35 00 
      return None;                                                              //0033 : 04 2A 
    }
    //07 33 00 9B 01 98 B2 26 11 25 16 0F 00 10 B3 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B 
    //E5 0B 00 00 01 98 B2 26 11 16 04 00 10 B3 26 11 06 35 00 04 2A 04 0B 47 
  }


  protected function cl_SheatheWeapon() {
    Outer.PlaySheatheWeaponAnim(mWeaponFlag,False);                             //0000 : 19 01 00 E4 6B 0F 0E 00 00 1B CD 0D 00 00 39 3A 01 38 B4 26 11 28 16 
    mCombatMode = 0;                                                            //0017 : 0F 01 B0 B4 26 11 24 00 
    mWeaponFlag = ResolveWeaponFlag(mCombatMode,None,None);                     //001F : 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 
    if (CombatCollision) {                                                      //0032 : 07 49 00 2D 01 28 B5 26 11 
      Outer.SetCollision(True,False);                                           //003B : 19 01 00 E4 6B 0F 05 00 00 61 06 27 28 16 
    }
    //19 01 00 E4 6B 0F 0E 00 00 1B CD 0D 00 00 39 3A 01 38 B4 26 11 28 16 0F 01 B0 B4 26 11 24 00 0F 
    //01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 07 49 00 2D 01 28 B5 26 11 19 01 00 E4 6B 
    //0F 05 00 00 61 06 27 28 16 04 0B 47 
  }


  protected native function sv2rel_SheatheWeapon_CallStub();


  protected event sv2rel_SheatheWeapon() {
    if (mDrawing) {                                                             //0000 : 07 14 00 2D 01 50 B7 26 11 
      mReSheathe = True;                                                        //0009 : 14 2D 01 C8 B7 26 11 27 
    } else {                                                                    //0011 : 06 1A 00 
      cl_SheatheWeapon();                                                       //0014 : 1B 33 0D 00 00 16 
    }
    //07 14 00 2D 01 50 B7 26 11 14 2D 01 C8 B7 26 11 27 06 1A 00 1B 33 0D 00 00 16 04 0B 47 
  }


  protected function cl_DrawWeapon(byte aMode,int aNewMainWeapon,int aNewOffhandWeapon) {
    local export editinline Item_Type newMainWeapon;
    local export editinline Item_Type newOffhandWeapon;
    if (aNewMainWeapon != 0) {                                                  //0000 : 07 2D 00 9B 00 68 B9 26 11 25 16 
      newMainWeapon = Item_Type(Class'SBDBSync'.GetResourceObject(aNewMainWeapon));//000B : 0F 00 E0 B9 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 68 B9 26 11 16 
    } else {                                                                    //002A : 06 34 00 
      newMainWeapon = None;                                                     //002D : 0F 00 E0 B9 26 11 2A 
    }
    if (aNewOffhandWeapon != 0) {                                               //0034 : 07 5E 00 9B 00 58 BA 26 11 25 16 
      newOffhandWeapon = Item_Type(Class'SBDBSync'.GetResourceObject(aNewOffhandWeapon));//003F : 0F 00 D0 BA 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 58 BA 26 11 16 
    }
    GetMainWeapon().OnSheathe(Outer);                                           //005E : 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    GetOffhandWeapon().OnSheathe(Outer);                                        //0073 : 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    mWeaponFlag = ResolveWeaponFlag(aMode,newMainWeapon,newOffhandWeapon);      //0088 : 0F 01 38 B4 26 11 1C B0 A7 26 11 00 F0 B8 26 11 00 E0 B9 26 11 00 D0 BA 26 11 16 
    if (aMode != 3 && mCombatMode == 0) {                                       //00A3 : 07 EE 00 82 9B 39 3A 00 F0 B8 26 11 39 3A 24 03 16 18 0E 00 9A 39 3A 01 B0 B4 26 11 39 3A 24 00 16 16 
      Outer.ClearPawnAnims();                                                   //00C5 : 19 01 00 E4 6B 0F 06 00 00 1B A3 0C 00 00 16 
      Outer.PlayDrawWeaponAnim(mWeaponFlag,True);                               //00D4 : 19 01 00 E4 6B 0F 0E 00 00 1B CE 0D 00 00 39 3A 01 38 B4 26 11 27 16 
    } else {                                                                    //00EB : 06 3B 01 
      Outer.ClearPawnAnims();                                                   //00EE : 19 01 00 E4 6B 0F 06 00 00 1B A3 0C 00 00 16 
      if (newMainWeapon != None) {                                              //00FD : 07 1C 01 77 00 E0 B9 26 11 2A 16 
        newMainWeapon.OnDraw(Outer);                                            //0108 : 19 00 E0 B9 26 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
      }
      if (newOffhandWeapon != None) {                                           //011C : 07 3B 01 77 00 D0 BA 26 11 2A 16 
        newOffhandWeapon.OnDraw(Outer);                                         //0127 : 19 00 D0 BA 26 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
      }
    }
    mCombatMode = aMode;                                                        //013B : 0F 01 B0 B4 26 11 00 F0 B8 26 11 
    if (newMainWeapon != None) {                                                //0146 : 07 69 01 77 00 E0 B9 26 11 2A 16 
      mMainWeapon = newMainWeapon.GetResourceId();                              //0151 : 0F 01 98 B2 26 11 19 00 E0 B9 26 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //0166 : 06 70 01 
      mMainWeapon = 0;                                                          //0169 : 0F 01 98 B2 26 11 25 
    }
    if (newOffhandWeapon != None) {                                             //0170 : 07 93 01 77 00 D0 BA 26 11 2A 16 
      mOffhandWeapon = newOffhandWeapon.GetResourceId();                        //017B : 0F 01 08 B0 26 11 19 00 D0 BA 26 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //0190 : 06 9A 01 
      mOffhandWeapon = 0;                                                       //0193 : 0F 01 08 B0 26 11 25 
    }
    Outer.ClearAnimsByType(1,0.30000001);                                       //019A : 19 01 00 E4 6B 0F 0D 00 00 1B B6 0C 00 00 24 01 1E 9A 99 99 3E 16 
    Outer.SetCollision(True,CombatCollision);                                   //01B0 : 19 01 00 E4 6B 0F 0A 00 00 61 06 27 2D 01 28 B5 26 11 16 
    //07 2D 00 9B 00 68 B9 26 11 25 16 0F 00 E0 B9 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B 
    //E5 0B 00 00 00 68 B9 26 11 16 06 34 00 0F 00 E0 B9 26 11 2A 07 5E 00 9B 00 58 BA 26 11 25 16 0F 
    //00 D0 BA 26 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 58 BA 26 11 16 19 1B 
    //72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 
    //00 00 01 00 E4 6B 0F 16 0F 01 38 B4 26 11 1C B0 A7 26 11 00 F0 B8 26 11 00 E0 B9 26 11 00 D0 BA 
    //26 11 16 07 EE 00 82 9B 39 3A 00 F0 B8 26 11 39 3A 24 03 16 18 0E 00 9A 39 3A 01 B0 B4 26 11 39 
    //3A 24 00 16 16 19 01 00 E4 6B 0F 06 00 00 1B A3 0C 00 00 16 19 01 00 E4 6B 0F 0E 00 00 1B CE 0D 
    //00 00 39 3A 01 38 B4 26 11 27 16 06 3B 01 19 01 00 E4 6B 0F 06 00 00 1B A3 0C 00 00 16 07 1C 01 
    //77 00 E0 B9 26 11 2A 16 19 00 E0 B9 26 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 07 3B 01 77 
    //00 D0 BA 26 11 2A 16 19 00 D0 BA 26 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 0F 01 B0 B4 26 
    //11 00 F0 B8 26 11 07 69 01 77 00 E0 B9 26 11 2A 16 0F 01 98 B2 26 11 19 00 E0 B9 26 11 06 00 04 
    //1C 08 90 20 11 16 06 70 01 0F 01 98 B2 26 11 25 07 93 01 77 00 D0 BA 26 11 2A 16 0F 01 08 B0 26 
    //11 19 00 D0 BA 26 11 06 00 04 1C 08 90 20 11 16 06 9A 01 0F 01 08 B0 26 11 25 19 01 00 E4 6B 0F 
    //0D 00 00 1B B6 0C 00 00 24 01 1E 9A 99 99 3E 16 19 01 00 E4 6B 0F 0A 00 00 61 06 27 2D 01 28 B5 
    //26 11 16 04 0B 47 
  }


  protected native function sv2rel_DrawWeapon_CallStub();


  protected event sv2rel_DrawWeapon(byte aMode,int aNewMainWeapon,int aNewOffhandWeapon) {
    if (mSheathing) {                                                           //0000 : 07 35 00 2D 01 E0 BD 26 11 
      mReDrawMode = aMode;                                                      //0009 : 0F 01 58 BE 26 11 00 A8 BC 26 11 
      mReDrawNewMainWeapon = aNewMainWeapon;                                    //0014 : 0F 01 D0 BE 26 11 00 48 BF 26 11 
      mReDrawNewOffhandWeapon = aNewOffhandWeapon;                              //001F : 0F 01 C0 BF 26 11 00 38 C0 26 11 
      mReDraw = True;                                                           //002A : 14 2D 01 B0 C0 26 11 27 
    } else {                                                                    //0032 : 06 69 00 
      if (mDrawing && mReSheathe) {                                             //0035 : 07 54 00 82 2D 01 50 B7 26 11 18 07 00 2D 01 C8 B7 26 11 16 
        mReSheathe = False;                                                     //0049 : 14 2D 01 C8 B7 26 11 28 
      } else {                                                                  //0051 : 06 69 00 
        cl_DrawWeapon(aMode,aNewMainWeapon,aNewOffhandWeapon);                  //0054 : 1B 4B 0D 00 00 00 A8 BC 26 11 00 48 BF 26 11 00 38 C0 26 11 16 
      }
    }
    //07 35 00 2D 01 E0 BD 26 11 0F 01 58 BE 26 11 00 A8 BC 26 11 0F 01 D0 BE 26 11 00 48 BF 26 11 0F 
    //01 C0 BF 26 11 00 38 C0 26 11 14 2D 01 B0 C0 26 11 27 06 69 00 07 54 00 82 2D 01 50 B7 26 11 18 
    //07 00 2D 01 C8 B7 26 11 16 14 2D 01 C8 B7 26 11 28 06 69 00 1B 4B 0D 00 00 00 A8 BC 26 11 00 48 
    //BF 26 11 00 38 C0 26 11 16 04 0B 47 
  }


  function bool IsDrawing() {
    return mDrawing;                                                            //0000 : 04 2D 01 50 B7 26 11 
    //04 2D 01 50 B7 26 11 04 0B 47 
  }


  function bool IsSheathing() {
    return mSheathing;                                                          //0000 : 04 2D 01 E0 BD 26 11 
    //04 2D 01 E0 BD 26 11 04 0B 47 
  }


  function bool CheckWeaponType(byte aWeaponType) {
    switch (aWeaponType) {                                                      //0000 : 05 01 00 10 19 27 11 
      case 0 :                                                                  //0007 : 0A 0E 00 24 00 
        return True;                                                            //000C : 04 27 
      case 1 :                                                                  //000E : 0A 21 00 24 01 
        return mCombatMode == 1;                                                //0013 : 04 9A 39 3A 01 B0 B4 26 11 39 3A 24 01 16 
      case 2 :                                                                  //0021 : 0A 34 00 24 02 
        return mCombatMode == 2;                                                //0026 : 04 9A 39 3A 01 B0 B4 26 11 39 3A 24 02 16 
      case 3 :                                                                  //0034 : 0A 47 00 24 03 
        return mCombatMode == 3;                                                //0039 : 04 9A 39 3A 01 B0 B4 26 11 39 3A 24 03 16 
      case 4 :                                                                  //0047 : 0A 6C 00 24 04 
        return mCombatMode == 1 || mCombatMode == 3;                            //004C : 04 84 9A 39 3A 01 B0 B4 26 11 39 3A 24 01 16 18 0E 00 9A 39 3A 01 B0 B4 26 11 39 3A 24 03 16 16 
      default:                                                                  //006C : 0A FF FF 
        return False;                                                           //006F : 04 28 
      }
    }
    //05 01 00 10 19 27 11 0A 0E 00 24 00 04 27 0A 21 00 24 01 04 9A 39 3A 01 B0 B4 26 11 39 3A 24 01 
    //16 0A 34 00 24 02 04 9A 39 3A 01 B0 B4 26 11 39 3A 24 02 16 0A 47 00 24 03 04 9A 39 3A 01 B0 B4 
    //26 11 39 3A 24 03 16 0A 6C 00 24 04 04 84 9A 39 3A 01 B0 B4 26 11 39 3A 24 01 16 18 0E 00 9A 39 
    //3A 01 B0 B4 26 11 39 3A 24 03 16 16 0A FF FF 04 28 04 0B 47 
  }


  function byte GetWeaponFlag() {
    if (mExecutingBodySlotSkill) {                                              //0000 : 07 0F 00 2D 01 20 A5 26 11 
      return 1;                                                                 //0009 : 04 24 01 
    } else {                                                                    //000C : 06 15 00 
      return mWeaponFlag;                                                       //000F : 04 01 38 B4 26 11 
    }
    //07 0F 00 2D 01 20 A5 26 11 04 24 01 06 15 00 04 01 38 B4 26 11 04 0B 47 
  }


  function OnDoneSheathing(bool aMainHand) {
    if (aMainHand) {                                                            //0000 : 07 30 00 2D 00 28 1C 27 11 
      GetMainWeapon().OnSheathe(Outer);                                         //0009 : 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
      mMainWeapon = 0;                                                          //001E : 0F 01 98 B2 26 11 25 
      mSheathing = False;                                                       //0025 : 14 2D 01 E0 BD 26 11 28 
    } else {                                                                    //002D : 06 4C 00 
      GetOffhandWeapon().OnSheathe(Outer);                                      //0030 : 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
      mOffhandWeapon = 0;                                                       //0045 : 0F 01 08 B0 26 11 25 
    }
    Outer.ClearAnimsByType(1,0.00000000);                                       //004C : 19 01 00 E4 6B 0F 0D 00 00 1B B6 0C 00 00 24 01 1E 00 00 00 00 16 
    if (mReDraw) {                                                              //0062 : 07 88 00 2D 01 B0 C0 26 11 
      mReDraw = False;                                                          //006B : 14 2D 01 B0 C0 26 11 28 
      cl_DrawWeapon(mReDrawMode,mReDrawNewMainWeapon,mReDrawNewOffhandWeapon);  //0073 : 1B 4B 0D 00 00 01 58 BE 26 11 01 D0 BE 26 11 01 C0 BF 26 11 16 
    }
    //07 30 00 2D 00 28 1C 27 11 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 0F 01 
    //98 B2 26 11 25 14 2D 01 E0 BD 26 11 28 06 4C 00 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 
    //00 E4 6B 0F 16 0F 01 08 B0 26 11 25 19 01 00 E4 6B 0F 0D 00 00 1B B6 0C 00 00 24 01 1E 00 00 00 
    //00 16 07 88 00 2D 01 B0 C0 26 11 14 2D 01 B0 C0 26 11 28 1B 4B 0D 00 00 01 58 BE 26 11 01 D0 BE 
    //26 11 01 C0 BF 26 11 16 04 0B 47 
  }


  function OnDoneDrawing(bool aMainHand) {
    if (aMainHand) {                                                            //0000 : 07 29 00 2D 00 50 1D 27 11 
      GetMainWeapon().OnDraw(Outer);                                            //0009 : 19 1B 72 05 00 00 16 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
      mDrawing = False;                                                         //001E : 14 2D 01 50 B7 26 11 28 
    } else {                                                                    //0026 : 06 3E 00 
      GetOffhandWeapon().OnDraw(Outer);                                         //0029 : 19 1B 76 05 00 00 16 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
    }
    Outer.ClearAnimsByType(1,0.00000000);                                       //003E : 19 01 00 E4 6B 0F 0D 00 00 1B B6 0C 00 00 24 01 1E 00 00 00 00 16 
    if (mReSheathe) {                                                           //0054 : 07 6B 00 2D 01 C8 B7 26 11 
      mReSheathe = False;                                                       //005D : 14 2D 01 C8 B7 26 11 28 
      cl_SheatheWeapon();                                                       //0065 : 1B 33 0D 00 00 16 
    }
    //07 29 00 2D 00 50 1D 27 11 19 1B 72 05 00 00 16 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 14 2D 
    //01 50 B7 26 11 28 06 3E 00 19 1B 76 05 00 00 16 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 19 01 
    //00 E4 6B 0F 0D 00 00 1B B6 0C 00 00 24 01 1E 00 00 00 00 16 07 6B 00 2D 01 C8 B7 26 11 14 2D 01 
    //C8 B7 26 11 28 1B 33 0D 00 00 16 04 0B 47 
  }


  native function bool sv_CanSwitchToWeapon(byte aWeaponType);


  event bool sv_SwitchToWeaponType(byte aWeaponType) {
    switch (aWeaponType) {                                                      //0000 : 05 01 00 10 21 27 11 
      case 0 :                                                                  //0007 : 0A 0E 00 24 00 
        return True;                                                            //000C : 04 27 
      case 1 :                                                                  //000E : 0A 1C 00 24 01 
        return sv_SwitchToMode(1);                                              //0013 : 04 1B 5E 0C 00 00 24 01 16 
      case 2 :                                                                  //001C : 0A 2A 00 24 02 
        return sv_SwitchToMode(2);                                              //0021 : 04 1B 5E 0C 00 00 24 02 16 
      case 3 :                                                                  //002A : 0A 38 00 24 03 
        return sv_SwitchToMode(3);                                              //002F : 04 1B 5E 0C 00 00 24 03 16 
      case 4 :                                                                  //0038 : 0A 6D 00 24 04 
        if (mCombatMode != 1 && mCombatMode != 3) {                             //003D : 07 6B 00 82 9B 39 3A 01 B0 B4 26 11 39 3A 24 01 16 18 0E 00 9B 39 3A 01 B0 B4 26 11 39 3A 24 03 16 16 
          return sv_SwitchToMode(3);                                            //005F : 04 1B 5E 0C 00 00 24 03 16 
        } else {                                                                //0068 : 06 6D 00 
          return True;                                                          //006B : 04 27 
        }
      default:                                                                  //006D : 0A FF FF 
      }
    }
    //05 01 00 10 21 27 11 0A 0E 00 24 00 04 27 0A 1C 00 24 01 04 1B 5E 0C 00 00 24 01 16 0A 2A 00 24 
    //02 04 1B 5E 0C 00 00 24 02 16 0A 38 00 24 03 04 1B 5E 0C 00 00 24 03 16 0A 6D 00 24 04 07 6B 00 
    //82 9B 39 3A 01 B0 B4 26 11 39 3A 24 01 16 18 0E 00 9B 39 3A 01 B0 B4 26 11 39 3A 24 03 16 16 04 
    //1B 5E 0C 00 00 24 03 16 06 6D 00 04 27 0A FF FF 04 0B 47 
  }


  function bool sv_SwitchToMode(byte aMode) {
    local export editinline Item_Type newMainWeapon;
    local export editinline Item_Type newOffhandWeapon;
    ResolveWeapons(aMode,newMainWeapon,newOffhandWeapon);                       //0000 : 1B 9D 0C 00 00 00 78 23 27 11 00 30 26 27 11 00 A8 26 27 11 16 
    if (mCombatMode != aMode) {                                                 //0015 : 07 81 01 9B 39 3A 01 B0 B4 26 11 39 3A 00 78 23 27 11 16 
      if (mCombatMode != 0) {                                                   //0028 : 07 72 01 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 
        if (aMode != 0) {                                                       //0038 : 07 68 01 9B 39 3A 00 78 23 27 11 39 3A 24 00 16 
          if (aMode == 3 || newMainWeapon != None) {                            //0048 : 07 63 01 84 9A 39 3A 00 78 23 27 11 39 3A 24 03 16 18 09 00 77 00 30 26 27 11 2A 16 16 
            if (GetMainWeapon() != None) {                                      //0065 : 07 86 00 77 1B 72 05 00 00 16 2A 16 
              GetMainWeapon().OnSheathe(Outer);                                 //0071 : 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
            }
            if (GetOffhandWeapon() != None) {                                   //0086 : 07 A7 00 77 1B 76 05 00 00 16 2A 16 
              GetOffhandWeapon().OnSheathe(Outer);                              //0092 : 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
            }
            mCombatMode = aMode;                                                //00A7 : 0F 01 B0 B4 26 11 00 78 23 27 11 
            mWeaponFlag = ResolveWeaponFlag(mCombatMode,newMainWeapon,newOffhandWeapon);//00B2 : 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 00 30 26 27 11 00 A8 26 27 11 16 
            if (newMainWeapon != None) {                                        //00CD : 07 04 01 77 00 30 26 27 11 2A 16 
              newMainWeapon.OnDraw(Outer);                                      //00D8 : 19 00 30 26 27 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
              mMainWeapon = newMainWeapon.GetResourceId();                      //00EC : 0F 01 98 B2 26 11 19 00 30 26 27 11 06 00 04 1C 08 90 20 11 16 
            } else {                                                            //0101 : 06 0B 01 
              mMainWeapon = 0;                                                  //0104 : 0F 01 98 B2 26 11 25 
            }
            if (newOffhandWeapon != None) {                                     //010B : 07 42 01 77 00 A8 26 27 11 2A 16 
              newOffhandWeapon.OnDraw(Outer);                                   //0116 : 19 00 A8 26 27 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
              mOffhandWeapon = newOffhandWeapon.GetResourceId();                //012A : 0F 01 08 B0 26 11 19 00 A8 26 27 11 06 00 04 1C 08 90 20 11 16 
            } else {                                                            //013F : 06 49 01 
              mOffhandWeapon = 0;                                               //0142 : 0F 01 08 B0 26 11 25 
            }
            sv2rel_DrawWeapon_CallStub(mCombatMode,mMainWeapon,mOffhandWeapon); //0149 : 1B 51 0D 00 00 01 B0 B4 26 11 01 98 B2 26 11 01 08 B0 26 11 16 
            return True;                                                        //015E : 04 27 
          } else {                                                              //0160 : 06 65 01 
            return False;                                                       //0163 : 04 28 
          }
        } else {                                                                //0165 : 06 6F 01 
          return sv_SheatheWeapon();                                            //0168 : 04 1B 3B 07 00 00 16 
        }
      } else {                                                                  //016F : 06 7E 01 
        return sv_DrawWeapon(aMode);                                            //0172 : 04 1B 09 07 00 00 00 78 23 27 11 16 
      }
    } else {                                                                    //017E : 06 83 01 
      return True;                                                              //0181 : 04 27 
    }
    //1B 9D 0C 00 00 00 78 23 27 11 00 30 26 27 11 00 A8 26 27 11 16 07 81 01 9B 39 3A 01 B0 B4 26 11 
    //39 3A 00 78 23 27 11 16 07 72 01 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 07 68 01 9B 39 3A 00 78 
    //23 27 11 39 3A 24 00 16 07 63 01 84 9A 39 3A 00 78 23 27 11 39 3A 24 03 16 18 09 00 77 00 30 26 
    //27 11 2A 16 16 07 86 00 77 1B 72 05 00 00 16 2A 16 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 
    //01 00 E4 6B 0F 16 07 A7 00 77 1B 76 05 00 00 16 2A 16 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 
    //00 01 00 E4 6B 0F 16 0F 01 B0 B4 26 11 00 78 23 27 11 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 
    //26 11 00 30 26 27 11 00 A8 26 27 11 16 07 04 01 77 00 30 26 27 11 2A 16 19 00 30 26 27 11 0B 00 
    //00 1B C0 05 00 00 01 00 E4 6B 0F 16 0F 01 98 B2 26 11 19 00 30 26 27 11 06 00 04 1C 08 90 20 11 
    //16 06 0B 01 0F 01 98 B2 26 11 25 07 42 01 77 00 A8 26 27 11 2A 16 19 00 A8 26 27 11 0B 00 00 1B 
    //C0 05 00 00 01 00 E4 6B 0F 16 0F 01 08 B0 26 11 19 00 A8 26 27 11 06 00 04 1C 08 90 20 11 16 06 
    //49 01 0F 01 08 B0 26 11 25 1B 51 0D 00 00 01 B0 B4 26 11 01 98 B2 26 11 01 08 B0 26 11 16 04 27 
    //06 65 01 04 28 06 6F 01 04 1B 3B 07 00 00 16 06 7E 01 04 1B 09 07 00 00 00 78 23 27 11 16 06 83 
    //01 04 27 04 0B 47 
  }


  event bool sv_SheatheWeapon() {
    local export editinline Item_Type oldMainWeapon;
    local export editinline Item_Type oldOffhandWeapon;
    if (Outer.CharacterStats.IsMovementFrozen()
      || mCombatMode == 0
      || mSheathing) {//0000 : 07 3A 00 84 84 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 18 0E 00 9A 39 3A 01 B0 B4 26 11 39 3A 24 00 16 16 18 07 00 2D 01 E0 BD 26 11 16 
      return False;                                                             //0038 : 04 28 
    }
    if (mDrawing) {                                                             //003A : 07 54 00 2D 01 50 B7 26 11 
      mReSheathe = !mReSheathe;                                                 //0043 : 14 2D 01 C8 B7 26 11 81 2D 01 C8 B7 26 11 16 
      return False;                                                             //0052 : 04 28 
    }
    mCombatMode = 0;                                                            //0054 : 0F 01 B0 B4 26 11 24 00 
    mSheathing = True;                                                          //005C : 14 2D 01 E0 BD 26 11 27 
    mDrawSheatheTimer = cDrawSheatheTime;                                       //0064 : 0F 01 A8 2A 27 11 01 20 2B 27 11 
    oldMainWeapon = GetMainWeapon();                                            //006F : 0F 00 98 2B 27 11 1B 72 05 00 00 16 
    if (oldMainWeapon != None) {                                                //007B : 07 9A 00 77 00 98 2B 27 11 2A 16 
      oldMainWeapon.OnSheathe(Outer);                                           //0086 : 19 00 98 2B 27 11 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    }
    oldOffhandWeapon = GetOffhandWeapon();                                      //009A : 0F 00 10 2C 27 11 1B 76 05 00 00 16 
    if (oldOffhandWeapon != None) {                                             //00A6 : 07 C5 00 77 00 10 2C 27 11 2A 16 
      oldOffhandWeapon.OnSheathe(Outer);                                        //00B1 : 19 00 10 2C 27 11 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    }
    mMainWeapon = 0;                                                            //00C5 : 0F 01 98 B2 26 11 25 
    mOffhandWeapon = 0;                                                         //00CC : 0F 01 08 B0 26 11 25 
    mWeaponFlag = ResolveWeaponFlag(mCombatMode,None,None);                     //00D3 : 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 2A 2A 16 
    sv2rel_SheatheWeapon_CallStub();                                            //00E6 : 1B DF 0E 00 00 16 
    if (CombatCollision) {                                                      //00EC : 07 03 01 2D 01 28 B5 26 11 
      Outer.SetCollision(True,False);                                           //00F5 : 19 01 00 E4 6B 0F 05 00 00 61 06 27 28 16 
    }
    Outer.Skills.FireCondition(None,3);                                         //0103 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 03 16 
    RemovePreparedBonusConditional();                                           //011E : 1B 87 0D 00 00 16 
    Outer.CharacterStats.UnsetStatsState(1);                                    //0124 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 08 00 00 1B 6F 0D 00 00 24 01 16 
    return True;                                                                //013E : 04 27 
    //07 3A 00 84 84 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 18 0E 00 
    //9A 39 3A 01 B0 B4 26 11 39 3A 24 00 16 16 18 07 00 2D 01 E0 BD 26 11 16 04 28 07 54 00 2D 01 50 
    //B7 26 11 14 2D 01 C8 B7 26 11 81 2D 01 C8 B7 26 11 16 04 28 0F 01 B0 B4 26 11 24 00 14 2D 01 E0 
    //BD 26 11 27 0F 01 A8 2A 27 11 01 20 2B 27 11 0F 00 98 2B 27 11 1B 72 05 00 00 16 07 9A 00 77 00 
    //98 2B 27 11 2A 16 19 00 98 2B 27 11 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 0F 00 10 2C 27 11 
    //1B 76 05 00 00 16 07 C5 00 77 00 10 2C 27 11 2A 16 19 00 10 2C 27 11 0B 00 00 1B F4 05 00 00 01 
    //00 E4 6B 0F 16 0F 01 98 B2 26 11 25 0F 01 08 B0 26 11 25 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 
    //B4 26 11 2A 2A 16 1B DF 0E 00 00 16 07 03 01 2D 01 28 B5 26 11 19 01 00 E4 6B 0F 05 00 00 61 06 
    //27 28 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 03 16 1B 87 
    //0D 00 00 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 08 00 00 1B 6F 0D 00 00 24 01 16 04 27 
    //04 0B 47 
  }


  event bool sv_DrawWeapon(byte aInitialMode) {
    local export editinline Item_Type newMainWeapon;
    local export editinline Item_Type newOffhandWeapon;
    local export editinline Item_Type oldMainWeapon;
    local export editinline Item_Type oldOffhandWeapon;
    if (Outer.CharacterStats.IsMovementFrozen()) {                              //0000 : 07 1D 00 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 
      return False;                                                             //001B : 04 28 
    }
    if (mCombatMode != 0 || mDrawing) {                                         //001D : 07 3A 00 84 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 18 07 00 2D 01 50 B7 26 11 16 
      return False;                                                             //0038 : 04 28 
    }
    if (mSheathing) {                                                           //003A : 07 45 00 2D 01 E0 BD 26 11 
      return False;                                                             //0043 : 04 28 
    }
    if (Outer.sv_IsResting()) {                                                 //0045 : 07 67 00 19 01 00 E4 6B 0F 06 00 04 1B E7 0C 00 00 16 
      Outer.sv_Sit(False);                                                      //0057 : 19 01 00 E4 6B 0F 07 00 00 1B 94 0C 00 00 28 16 
    }
    ResolveWeapons(aInitialMode,newMainWeapon,newOffhandWeapon);                //0067 : 1B 9D 0C 00 00 00 38 2D 27 11 00 B0 2D 27 11 00 28 2E 27 11 16 
    if (newMainWeapon == None && aInitialMode != 3) {                           //007C : 07 9B 00 82 72 00 B0 2D 27 11 2A 16 18 0E 00 9B 39 3A 00 38 2D 27 11 39 3A 24 03 16 16 
      return False;                                                             //0099 : 04 28 
    }
    mCombatMode = aInitialMode;                                                 //009B : 0F 01 B0 B4 26 11 00 38 2D 27 11 
    oldMainWeapon = GetMainWeapon();                                            //00A6 : 0F 00 A0 2E 27 11 1B 72 05 00 00 16 
    if (oldMainWeapon != None) {                                                //00B2 : 07 D1 00 77 00 A0 2E 27 11 2A 16 
      oldMainWeapon.OnSheathe(Outer);                                           //00BD : 19 00 A0 2E 27 11 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    }
    oldOffhandWeapon = GetOffhandWeapon();                                      //00D1 : 0F 00 18 2F 27 11 1B 76 05 00 00 16 
    if (oldOffhandWeapon != None) {                                             //00DD : 07 FC 00 77 00 18 2F 27 11 2A 16 
      oldOffhandWeapon.OnSheathe(Outer);                                        //00E8 : 19 00 18 2F 27 11 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    }
    mDrawing = True;                                                            //00FC : 14 2D 01 50 B7 26 11 27 
    mDrawSheatheTimer = cDrawSheatheTime;                                       //0104 : 0F 01 A8 2A 27 11 01 20 2B 27 11 
    mWeaponFlag = ResolveWeaponFlag(mCombatMode,newMainWeapon,newOffhandWeapon);//010F : 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 00 B0 2D 27 11 00 28 2E 27 11 16 
    if (newMainWeapon != None) {                                                //012A : 07 61 01 77 00 B0 2D 27 11 2A 16 
      newMainWeapon.OnDraw(Outer);                                              //0135 : 19 00 B0 2D 27 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
      mMainWeapon = newMainWeapon.GetResourceId();                              //0149 : 0F 01 98 B2 26 11 19 00 B0 2D 27 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //015E : 06 68 01 
      mMainWeapon = 0;                                                          //0161 : 0F 01 98 B2 26 11 25 
    }
    if (newOffhandWeapon != None) {                                             //0168 : 07 9F 01 77 00 28 2E 27 11 2A 16 
      newOffhandWeapon.OnDraw(Outer);                                           //0173 : 19 00 28 2E 27 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
      mOffhandWeapon = newOffhandWeapon.GetResourceId();                        //0187 : 0F 01 08 B0 26 11 19 00 28 2E 27 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //019C : 06 A6 01 
      mOffhandWeapon = 0;                                                       //019F : 0F 01 08 B0 26 11 25 
    }
    sv2rel_DrawWeapon_CallStub(aInitialMode,mMainWeapon,mOffhandWeapon);        //01A6 : 1B 51 0D 00 00 00 38 2D 27 11 01 98 B2 26 11 01 08 B0 26 11 16 
    Outer.SetCollision(True,CombatCollision);                                   //01BB : 19 01 00 E4 6B 0F 0A 00 00 61 06 27 2D 01 28 B5 26 11 16 
    Outer.Skills.FireCondition(None,4);                                         //01CE : 19 19 01 00 E4 6B 0F 05 00 04 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 04 16 
    GivePreparedBonusConditional();                                             //01E9 : 1B 87 0E 00 00 16 
    Outer.CharacterStats.SetStatsState(1);                                      //01EF : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 08 00 00 1B 6E 0D 00 00 24 01 16 
    if (Outer.IsShifted()) {                                                    //0209 : 07 2A 02 19 01 00 E4 6B 0F 06 00 04 1B 2E 0C 00 00 16 
      Outer.Unshift();                                                          //021B : 19 01 00 E4 6B 0F 06 00 04 1B E5 0C 00 00 16 
    }
    return True;                                                                //022A : 04 27 
    //07 1D 00 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 04 28 07 3A 00 
    //84 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 18 07 00 2D 01 50 B7 26 11 16 04 28 07 45 00 2D 01 E0 
    //BD 26 11 04 28 07 67 00 19 01 00 E4 6B 0F 06 00 04 1B E7 0C 00 00 16 19 01 00 E4 6B 0F 07 00 00 
    //1B 94 0C 00 00 28 16 1B 9D 0C 00 00 00 38 2D 27 11 00 B0 2D 27 11 00 28 2E 27 11 16 07 9B 00 82 
    //72 00 B0 2D 27 11 2A 16 18 0E 00 9B 39 3A 00 38 2D 27 11 39 3A 24 03 16 16 04 28 0F 01 B0 B4 26 
    //11 00 38 2D 27 11 0F 00 A0 2E 27 11 1B 72 05 00 00 16 07 D1 00 77 00 A0 2E 27 11 2A 16 19 00 A0 
    //2E 27 11 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 0F 00 18 2F 27 11 1B 76 05 00 00 16 07 FC 00 
    //77 00 18 2F 27 11 2A 16 19 00 18 2F 27 11 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 14 2D 01 50 
    //B7 26 11 27 0F 01 A8 2A 27 11 01 20 2B 27 11 0F 01 38 B4 26 11 1C B0 A7 26 11 01 B0 B4 26 11 00 
    //B0 2D 27 11 00 28 2E 27 11 16 07 61 01 77 00 B0 2D 27 11 2A 16 19 00 B0 2D 27 11 0B 00 00 1B C0 
    //05 00 00 01 00 E4 6B 0F 16 0F 01 98 B2 26 11 19 00 B0 2D 27 11 06 00 04 1C 08 90 20 11 16 06 68 
    //01 0F 01 98 B2 26 11 25 07 9F 01 77 00 28 2E 27 11 2A 16 19 00 28 2E 27 11 0B 00 00 1B C0 05 00 
    //00 01 00 E4 6B 0F 16 0F 01 08 B0 26 11 19 00 28 2E 27 11 06 00 04 1C 08 90 20 11 16 06 A6 01 0F 
    //01 08 B0 26 11 25 1B 51 0D 00 00 00 38 2D 27 11 01 98 B2 26 11 01 08 B0 26 11 16 19 01 00 E4 6B 
    //0F 0A 00 00 61 06 27 2D 01 28 B5 26 11 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 28 18 11 09 00 00 
    //1C E8 89 18 11 2A 24 04 16 1B 87 0E 00 00 16 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 08 00 
    //00 1B 6E 0D 00 00 24 01 16 07 2A 02 19 01 00 E4 6B 0F 06 00 04 1B 2E 0C 00 00 16 19 01 00 E4 6B 
    //0F 06 00 04 1B E5 0C 00 00 16 04 27 04 0B 47 
  }


  native function bool CombatReady();


  event cl_OnFrame(float DeltaTime) {
    if (mDrawSheatheTimer > 0.00000000) {                                       //0000 : 07 4C 00 B1 01 A8 2A 27 11 1E 00 00 00 00 16 
      mDrawSheatheTimer -= DeltaTime;                                           //000F : B9 01 A8 2A 27 11 00 30 D0 23 11 16 
      if (mDrawSheatheTimer <= 0.00000000) {                                    //001B : 07 4C 00 B2 01 A8 2A 27 11 1E 00 00 00 00 16 
        if (mDrawing) {                                                         //002A : 07 3B 00 2D 01 50 B7 26 11 
          mDrawing = False;                                                     //0033 : 14 2D 01 50 B7 26 11 28 
        }
        if (mSheathing) {                                                       //003B : 07 4C 00 2D 01 E0 BD 26 11 
          mSheathing = False;                                                   //0044 : 14 2D 01 E0 BD 26 11 28 
        }
      }
    }
    //07 4C 00 B1 01 A8 2A 27 11 1E 00 00 00 00 16 B9 01 A8 2A 27 11 00 30 D0 23 11 16 07 4C 00 B2 01 
    //A8 2A 27 11 1E 00 00 00 00 16 07 3B 00 2D 01 50 B7 26 11 14 2D 01 50 B7 26 11 28 07 4C 00 2D 01 
    //E0 BD 26 11 14 2D 01 E0 BD 26 11 28 04 0B 47 
  }


  private final native function Init();


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    Init();                                                                     //0006 : 1C 80 CF 23 11 16 
    //1C E0 C4 19 11 16 1C 80 CF 23 11 16 04 0B 47 
  }



