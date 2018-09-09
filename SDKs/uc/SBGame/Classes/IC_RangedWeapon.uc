//==============================================================================
//  IC_RangedWeapon
//==============================================================================

class IC_RangedWeapon extends IC_Appearance
    native
    editinlinenew
    dependsOn(Class,SBAnimationFlags,Game_Pawn,Game_ShiftableAppearance,Game_EquippedAppearance)
  ;


  event byte GetWeaponType() {
    return Class'SBAnimationFlags'.5;                                           //0000 : 04 12 20 10 BA D6 00 02 00 01 24 05 
    //04 12 20 10 BA D6 00 02 00 01 24 05 04 0B 47 
  }


  event OnSheathe(Game_Pawn aPawn) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //0000 : 0F 00 98 29 36 19 2E 70 B8 5F 01 19 19 00 70 28 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0023 : 07 5B 00 77 00 98 29 36 19 2A 16 
      pawnAppearance.SneakySetValue(Appearance.Part,0);                         //002E : 19 00 98 29 36 19 15 00 00 1B 20 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 25 16 
      pawnAppearance.Apply();                                                   //004C : 19 00 98 29 36 19 06 00 00 1C A0 3B 21 11 16 
    }
    //0F 00 98 29 36 19 2E 70 B8 5F 01 19 19 00 70 28 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 
    //00 00 16 07 5B 00 77 00 98 29 36 19 2A 16 19 00 98 29 36 19 15 00 00 1B 20 0C 00 00 19 01 A0 5F 
    //22 11 05 00 01 01 A0 6F 21 11 25 16 19 00 98 29 36 19 06 00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  event OnDraw(Game_Pawn aPawn) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //0000 : 0F 00 38 2B 36 19 2E 70 B8 5F 01 19 19 00 C0 2A 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0023 : 07 68 00 77 00 38 2B 36 19 2A 16 
      pawnAppearance.SneakySetValue(Appearance.Part,Appearance._AS_Index);      //002E : 19 00 38 2B 36 19 22 00 00 1B 20 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 
      pawnAppearance.Apply();                                                   //0059 : 19 00 38 2B 36 19 06 00 00 1C A0 3B 21 11 16 
    }
    //0F 00 38 2B 36 19 2E 70 B8 5F 01 19 19 00 C0 2A 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 
    //00 00 16 07 68 00 77 00 38 2B 36 19 2A 16 19 00 38 2B 36 19 22 00 00 1B 20 0C 00 00 19 01 A0 5F 
    //22 11 05 00 01 01 A0 6F 21 11 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 19 00 38 2B 36 19 06 
    //00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  event OnUnequip(Game_Pawn aPawn,Game_Item aItem) {
    //04 0B 47 
  }


  event OnEquip(Game_Pawn aPawn,Game_Item aItem) {
    //04 0B 47 
  }



