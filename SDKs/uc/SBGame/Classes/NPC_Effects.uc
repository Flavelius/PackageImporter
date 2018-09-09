//==============================================================================
//  NPC_Effects
//==============================================================================

class NPC_Effects extends Content_API
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Effects,FSkill_EffectClass_AudioVisual)
  ;

  var (NPC_Effects) array<FSkill_EffectClass_AudioVisual> EffectList;


  function Apply(Game_Pawn aPawn) {
    local int i;
    if (IsClient()) {                                                           //0000 : 07 87 00 1B 1C 0C 00 00 16 
      if (aPawn.Effects != None) {                                              //0009 : 07 87 00 77 19 00 A8 8A 35 11 05 00 04 01 48 63 34 0F 2A 16 
        i = 0;                                                                  //001D : 0F 00 08 8C 35 11 25 
        while (i < EffectList.Length) {                                         //0024 : 07 87 00 96 00 08 8C 35 11 37 01 30 8A 35 11 16 
          aPawn.Effects.cl_Start(EffectList[i],Class'Game_Effects'.-1073741824,0.00000000,0.00000000,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0034 : 19 19 00 A8 8A 35 11 05 00 04 01 48 63 34 0F 37 00 04 1C 28 65 34 0F 10 00 08 8C 35 11 01 30 8A 35 11 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 1E 00 00 00 00 1E 00 00 00 00 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
          i++;                                                                  //007D : A5 00 08 8C 35 11 16 
        }
      }
    }
    //07 87 00 1B 1C 0C 00 00 16 07 87 00 77 19 00 A8 8A 35 11 05 00 04 01 48 63 34 0F 2A 16 0F 00 08 
    //8C 35 11 25 07 87 00 96 00 08 8C 35 11 37 01 30 8A 35 11 16 19 19 00 A8 8A 35 11 05 00 04 01 48 
    //63 34 0F 37 00 04 1C 28 65 34 0F 10 00 08 8C 35 11 01 30 8A 35 11 12 20 10 43 5F 01 05 00 04 1D 
    //00 00 00 C0 1E 00 00 00 00 1E 00 00 00 00 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 A5 00 08 
    //8C 35 11 16 06 24 00 04 0B 47 
  }



