//==============================================================================
//  IC_Equipment
//==============================================================================

class IC_Equipment extends IC_Appearance
    native
    editinlinenew
    dependsOn(Game_Pawn,Game_ShiftableAppearance,Game_EquippedAppearance,Game_Item)
  ;


  function ToConsole(Console C) {
    C.Message("        Appearance = " $ string(Appearance)
      @ string(Appearance.Part)
      @ string(Appearance._AS_Index)
      @ string(Appearance._AS_Set),0.00000000);//0000 : 19 00 A0 42 36 19 62 00 00 1B 37 03 00 00 A8 A8 A8 70 1F 20 20 20 20 20 20 20 20 41 70 70 65 61 72 61 6E 63 65 20 3D 20 00 39 56 01 A0 5F 22 11 16 39 52 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 16 39 53 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 39 54 19 01 A0 5F 22 11 06 00 04 2D 01 C8 74 21 11 16 1E 00 00 00 00 16 
    //19 00 A0 42 36 19 62 00 00 1B 37 03 00 00 A8 A8 A8 70 1F 20 20 20 20 20 20 20 20 41 70 70 65 61 
    //72 61 6E 63 65 20 3D 20 00 39 56 01 A0 5F 22 11 16 39 52 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 
    //11 16 39 53 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 39 54 19 01 A0 5F 22 11 06 00 04 2D 01 
    //C8 74 21 11 16 1E 00 00 00 00 16 04 0B 47 
  }


  event UpdateColours(Game_Pawn aPawn,Game_Item aItem) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    if (Appearance == None) {                                                   //0000 : 07 0D 00 72 01 A0 5F 22 11 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //000D : 0F 00 00 46 36 19 2E 70 B8 5F 01 19 19 00 88 44 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0030 : 07 95 00 77 00 00 46 36 19 2A 16 
      pawnAppearance.SetColorValue(Appearance.Part,aItem.Color1,0);             //003B : 19 00 00 46 36 19 24 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 00 78 46 36 19 05 00 01 01 08 CA 22 11 24 00 16 
      pawnAppearance.SetColorValue(Appearance.Part,aItem.Color2,1);             //0068 : 19 00 00 46 36 19 24 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 00 78 46 36 19 05 00 01 01 F8 CA 22 11 24 01 16 
    }
    //07 0D 00 72 01 A0 5F 22 11 2A 16 04 0B 0F 00 00 46 36 19 2E 70 B8 5F 01 19 19 00 88 44 36 19 05 
    //00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 95 00 77 00 00 46 36 19 2A 16 19 00 00 46 36 
    //19 24 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 00 78 46 36 19 05 00 01 
    //01 08 CA 22 11 24 00 16 19 00 00 46 36 19 24 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 
    //A0 6F 21 11 19 00 78 46 36 19 05 00 01 01 F8 CA 22 11 24 01 16 04 0B 47 
  }


  event OnUnequip(Game_Pawn aPawn,Game_Item aItem) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    if (Appearance == None) {                                                   //0000 : 07 0D 00 72 01 A0 5F 22 11 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //000D : 0F 00 20 49 36 19 2E 70 B8 5F 01 19 19 00 A0 47 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0030 : 07 9B 00 77 00 20 49 36 19 2A 16 
      pawnAppearance.SetValue(Appearance.Part,0);                               //003B : 19 00 20 49 36 19 15 00 00 1B 37 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 25 16 
      pawnAppearance.SetColorValue(Appearance.Part,0,0);                        //0059 : 19 00 20 49 36 19 18 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 24 00 24 00 16 
      pawnAppearance.SetColorValue(Appearance.Part,0,1);                        //007A : 19 00 20 49 36 19 18 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 24 00 24 01 16 
    }
    //07 0D 00 72 01 A0 5F 22 11 2A 16 04 0B 0F 00 20 49 36 19 2E 70 B8 5F 01 19 19 00 A0 47 36 19 05 
    //00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 9B 00 77 00 20 49 36 19 2A 16 19 00 20 49 36 
    //19 15 00 00 1B 37 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 25 16 19 00 20 49 36 19 18 
    //00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 24 00 24 00 16 19 00 20 49 36 19 
    //18 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 24 00 24 01 16 04 0B 47 
  }


  event OnEquip(Game_Pawn aPawn,Game_Item aItem) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    if (Appearance == None) {                                                   //0000 : 07 0D 00 72 01 A0 5F 22 11 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    pawnAppearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());       //000D : 0F 00 C0 4B 36 19 2E 70 B8 5F 01 19 19 00 10 4A 36 19 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (pawnAppearance != None) {                                               //0030 : 07 C0 00 77 00 C0 4B 36 19 2A 16 
      pawnAppearance.SetValue(Appearance.Part,Appearance._AS_Index);            //003B : 19 00 C0 4B 36 19 22 00 00 1B 37 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 
      pawnAppearance.SetColorValue(Appearance.Part,aItem.Color1,0);             //0066 : 19 00 C0 4B 36 19 24 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 00 38 4C 36 19 05 00 01 01 08 CA 22 11 24 00 16 
      pawnAppearance.SetColorValue(Appearance.Part,aItem.Color2,1);             //0093 : 19 00 C0 4B 36 19 24 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 00 38 4C 36 19 05 00 01 01 F8 CA 22 11 24 01 16 
    }
    //07 0D 00 72 01 A0 5F 22 11 2A 16 04 0B 0F 00 C0 4B 36 19 2E 70 B8 5F 01 19 19 00 10 4A 36 19 05 
    //00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 C0 00 77 00 C0 4B 36 19 2A 16 19 00 C0 4B 36 
    //19 22 00 00 1B 37 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 01 A0 5F 22 11 05 00 04 
    //01 50 74 21 11 16 19 00 C0 4B 36 19 24 00 00 1B 04 0C 00 00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 
    //21 11 19 00 38 4C 36 19 05 00 01 01 08 CA 22 11 24 00 16 19 00 C0 4B 36 19 24 00 00 1B 04 0C 00 
    //00 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 19 00 38 4C 36 19 05 00 01 01 F8 CA 22 11 24 01 16 
    //04 0B 47 
  }



