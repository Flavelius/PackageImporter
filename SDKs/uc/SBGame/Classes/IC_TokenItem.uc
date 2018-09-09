//==============================================================================
//  IC_TokenItem
//==============================================================================

class IC_TokenItem extends Item_Component
    native
    editinlinenew
    dependsOn(Game_Pawn,Game_Skills)
  ;

  var (IC_TokenItem) const int TokenRank;
  var (IC_TokenItem) const byte SlotType;
  var (IC_TokenItem) const int ForgePrice;
  var (IC_TokenItem) const int ForgeReplacePrice;
  var (IC_TokenItem) const int ForgeRemovePrice;
  var (IC_TokenItem) editinline array<FSkill_EffectClass_Duff> EquipEffects;
  var (IC_TokenItem) editinline array<FSkill_EffectClass_AudioVisual> WeaponTracers;


  private final native function int sv_GetNextTokenHandle();


  final event sv_StopToken(Game_Pawn aPawn,out int aHandle) {
    local int Count;
    if (aHandle != 0 && aPawn != None && aPawn.Skills != None) {                //0000 : 07 58 00 82 82 9B 00 58 5A 34 11 25 16 18 09 00 77 00 E0 59 34 11 2A 16 16 18 12 00 77 19 00 E0 59 34 11 05 00 04 01 08 28 18 11 2A 16 16 
      Count = aPawn.Skills.sv_RemoveSpecialDuffEffect(aHandle);                 //002E : 0F 00 D0 5A 34 11 19 19 00 E0 59 34 11 05 00 04 01 08 28 18 11 0B 00 04 1C B0 3C 23 11 00 58 5A 34 11 16 
      aHandle = 0;                                                              //0051 : 0F 00 58 5A 34 11 25 
    }
    //07 58 00 82 82 9B 00 58 5A 34 11 25 16 18 09 00 77 00 E0 59 34 11 2A 16 16 18 12 00 77 19 00 E0 
    //59 34 11 05 00 04 01 08 28 18 11 2A 16 16 0F 00 D0 5A 34 11 19 19 00 E0 59 34 11 05 00 04 01 08 
    //28 18 11 0B 00 04 1C B0 3C 23 11 00 58 5A 34 11 16 0F 00 58 5A 34 11 25 04 0B 47 
  }


  final event int sv_StartToken(Game_Pawn aPawn) {
    local int Handle;
    local int i;
    if (aPawn != None && aPawn.Skills != None) {                                //0000 : 07 7B 00 82 77 00 C0 5B 34 11 2A 16 18 12 00 77 19 00 C0 5B 34 11 05 00 04 01 08 28 18 11 2A 16 16 
      Handle = sv_GetNextTokenHandle();                                         //0021 : 0F 00 38 5C 34 11 1C 00 57 34 11 16 
      i = 0;                                                                    //002D : 0F 00 B0 5C 34 11 25 
      while (i < EquipEffects.Length) {                                         //0034 : 07 7B 00 96 00 B0 5C 34 11 37 01 28 5D 34 11 16 
        aPawn.Skills.sv_AddSpecialDuffEffect(EquipEffects[i],0.00000000,Handle);//0044 : 19 19 00 C0 5B 34 11 05 00 04 01 08 28 18 11 1B 00 00 1C C8 40 23 11 10 00 B0 5C 34 11 01 28 5D 34 11 1E 00 00 00 00 00 38 5C 34 11 16 
        ++i;                                                                    //0071 : A3 00 B0 5C 34 11 16 
      }
    }
    return Handle;                                                              //007B : 04 00 38 5C 34 11 
    //07 7B 00 82 77 00 C0 5B 34 11 2A 16 18 12 00 77 19 00 C0 5B 34 11 05 00 04 01 08 28 18 11 2A 16 
    //16 0F 00 38 5C 34 11 1C 00 57 34 11 16 0F 00 B0 5C 34 11 25 07 7B 00 96 00 B0 5C 34 11 37 01 28 
    //5D 34 11 16 19 19 00 C0 5B 34 11 05 00 04 01 08 28 18 11 1B 00 00 1C C8 40 23 11 10 00 B0 5C 34 
    //11 01 28 5D 34 11 1E 00 00 00 00 00 38 5C 34 11 16 A3 00 B0 5C 34 11 16 06 34 00 04 00 38 5C 34 
    //11 04 0B 47 
  }



