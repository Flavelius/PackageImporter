//==============================================================================
//  IC_Shield
//==============================================================================

class IC_Shield extends IC_Appearance
    native
    editinlinenew
    dependsOn(Game_Pawn,Game_ShiftableAppearance,Game_EquippedAppearance,Game_Item,Game_CombatState)
  ;


  event OnSheathe(Game_Pawn aPawn) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    local byte Part;
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //0000 : 0F 00 38 17 36 19 2E 70 B8 5F 01 19 19 00 C0 16 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0023 : 07 89 00 77 00 38 17 36 19 2A 16 
      Part = GetSheathPart();                                                   //002E : 0F 00 B0 17 36 19 1B 47 0C 00 00 16 
      pawnAppearance.SneakySetValue(Part,Appearance._AS_Index);                 //003A : 19 00 38 17 36 19 19 00 00 1B 20 0C 00 00 00 B0 17 36 19 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 
      pawnAppearance.SneakySetValue(Appearance.Part,0);                         //005C : 19 00 38 17 36 19 15 00 00 1B 20 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 25 16 
      pawnAppearance.Apply();                                                   //007A : 19 00 38 17 36 19 06 00 00 1C A0 3B 21 11 16 
    }
    //0F 00 38 17 36 19 2E 70 B8 5F 01 19 19 00 C0 16 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 
    //00 00 16 07 89 00 77 00 38 17 36 19 2A 16 0F 00 B0 17 36 19 1B 47 0C 00 00 16 19 00 38 17 36 19 
    //19 00 00 1B 20 0C 00 00 00 B0 17 36 19 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 19 00 38 17 
    //36 19 15 00 00 1B 20 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 25 16 19 00 38 17 36 19 
    //06 00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  event OnDraw(Game_Pawn aPawn) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    local byte Part;
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //0000 : 0F 00 38 1A 36 19 2E 70 B8 5F 01 19 19 00 D8 18 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0023 : 07 89 00 77 00 38 1A 36 19 2A 16 
      pawnAppearance.SneakySetValue(Appearance.Part,Appearance._AS_Index);      //002E : 19 00 38 1A 36 19 22 00 00 1B 20 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 
      Part = GetSheathPart();                                                   //0059 : 0F 00 B0 1A 36 19 1B 47 0C 00 00 16 
      pawnAppearance.SneakySetValue(Part,0);                                    //0065 : 19 00 38 1A 36 19 0C 00 00 1B 20 0C 00 00 00 B0 1A 36 19 25 16 
      pawnAppearance.Apply();                                                   //007A : 19 00 38 1A 36 19 06 00 00 1C A0 3B 21 11 16 
    }
    //0F 00 38 1A 36 19 2E 70 B8 5F 01 19 19 00 D8 18 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 
    //00 00 16 07 89 00 77 00 38 1A 36 19 2A 16 19 00 38 1A 36 19 22 00 00 1B 20 0C 00 00 19 01 A0 5F 
    //22 11 05 00 01 01 A0 6F 21 11 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 0F 00 B0 1A 36 19 1B 
    //47 0C 00 00 16 19 00 38 1A 36 19 0C 00 00 1B 20 0C 00 00 00 B0 1A 36 19 25 16 19 00 38 1A 36 19 
    //06 00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  event OnUnequip(Game_Pawn aPawn,Game_Item aItem) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    local byte Part;
    if (Appearance == None) {                                                   //0000 : 07 0D 00 72 01 A0 5F 22 11 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //000D : 0F 00 48 1D 36 19 2E 70 B8 5F 01 19 19 00 D8 1B 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0030 : 07 91 00 77 00 48 1D 36 19 2A 16 
      Part = GetAppearancePart(aPawn);                                          //003B : 0F 00 C0 1D 36 19 1B 55 0C 00 00 00 D8 1B 36 19 16 
      pawnAppearance.SetValue(Part,0);                                          //004C : 19 00 48 1D 36 19 0C 00 00 1B 37 0C 00 00 00 C0 1D 36 19 25 16 
      pawnAppearance.SetColorValue(Part,0,0);                                   //0061 : 19 00 48 1D 36 19 0F 00 00 1B 04 0C 00 00 00 C0 1D 36 19 24 00 24 00 16 
      pawnAppearance.SetColorValue(Part,0,1);                                   //0079 : 19 00 48 1D 36 19 0F 00 00 1B 04 0C 00 00 00 C0 1D 36 19 24 00 24 01 16 
    }
    //07 0D 00 72 01 A0 5F 22 11 2A 16 04 0B 0F 00 48 1D 36 19 2E 70 B8 5F 01 19 19 00 D8 1B 36 19 05 
    //00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 91 00 77 00 48 1D 36 19 2A 16 0F 00 C0 1D 36 
    //19 1B 55 0C 00 00 00 D8 1B 36 19 16 19 00 48 1D 36 19 0C 00 00 1B 37 0C 00 00 00 C0 1D 36 19 25 
    //16 19 00 48 1D 36 19 0F 00 00 1B 04 0C 00 00 00 C0 1D 36 19 24 00 24 00 16 19 00 48 1D 36 19 0F 
    //00 00 1B 04 0C 00 00 00 C0 1D 36 19 24 00 24 01 16 04 0B 47 
  }


  event OnEquip(Game_Pawn aPawn,Game_Item aItem) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    local byte Part;
    if (Appearance == None) {                                                   //0000 : 07 0D 00 72 01 A0 5F 22 11 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //000D : 0F 00 D8 1F 36 19 2E 70 B8 5F 01 19 19 00 60 1F 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0030 : 07 B6 00 77 00 D8 1F 36 19 2A 16 
      Part = GetAppearancePart(aPawn);                                          //003B : 0F 00 50 20 36 19 1B 55 0C 00 00 00 60 1F 36 19 16 
      pawnAppearance.SetValue(Part,Appearance._AS_Index);                       //004C : 19 00 D8 1F 36 19 19 00 00 1B 37 0C 00 00 00 50 20 36 19 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 
      pawnAppearance.SetColorValue(Part,aItem.Color1,0);                        //006E : 19 00 D8 1F 36 19 1B 00 00 1B 04 0C 00 00 00 50 20 36 19 19 00 C8 20 36 19 05 00 01 01 08 CA 22 11 24 00 16 
      pawnAppearance.SetColorValue(Part,aItem.Color2,1);                        //0092 : 19 00 D8 1F 36 19 1B 00 00 1B 04 0C 00 00 00 50 20 36 19 19 00 C8 20 36 19 05 00 01 01 F8 CA 22 11 24 01 16 
    }
    //07 0D 00 72 01 A0 5F 22 11 2A 16 04 0B 0F 00 D8 1F 36 19 2E 70 B8 5F 01 19 19 00 60 1F 36 19 05 
    //00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 B6 00 77 00 D8 1F 36 19 2A 16 0F 00 50 20 36 
    //19 1B 55 0C 00 00 00 60 1F 36 19 16 19 00 D8 1F 36 19 19 00 00 1B 37 0C 00 00 00 50 20 36 19 19 
    //01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 19 00 D8 1F 36 19 1B 00 00 1B 04 0C 00 00 00 50 20 36 
    //19 19 00 C8 20 36 19 05 00 01 01 08 CA 22 11 24 00 16 19 00 D8 1F 36 19 1B 00 00 1B 04 0C 00 00 
    //00 50 20 36 19 19 00 C8 20 36 19 05 00 01 01 F8 CA 22 11 24 01 16 04 0B 47 
  }


  protected function byte GetAppearancePart(Game_Pawn aPawn) {
    if (aPawn.combatState.CombatReady()) {                                      //0000 : 07 2D 00 19 19 00 F0 21 36 19 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 
      return Appearance.Part;                                                   //001B : 04 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 
    } else {                                                                    //002A : 06 34 00 
      return GetSheathPart();                                                   //002D : 04 1B 47 0C 00 00 16 
    }
    //07 2D 00 19 19 00 F0 21 36 19 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 04 19 01 A0 5F 
    //22 11 05 00 01 01 A0 6F 21 11 06 34 00 04 1B 47 0C 00 00 16 04 0B 47 
  }


  protected function byte GetSheathPart() {
    return 20;                                                                  //0000 : 04 24 14 
    //04 24 14 04 0B 47 
  }



