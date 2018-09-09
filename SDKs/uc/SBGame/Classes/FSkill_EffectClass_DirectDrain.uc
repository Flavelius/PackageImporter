//==============================================================================
//  FSkill_EffectClass_DirectDrain
//==============================================================================

class FSkill_EffectClass_DirectDrain extends FSkill_EffectClass_Direct
    native
    dependsOn(Class,StringReferences)
  ;

  var (Drain) const byte DrainedCharacterStat;
  var (Drain) const byte GainedCharacterStat;
  var (Drain) const export editinline FSkill_ValueSpecifier DrainedAmount;
  var (Drain) const float Multiplier;
  var (Drain) const export editinline FSkill_ValueSpecifier MultiplierVS;


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    local string prefix;
    local string Message;
    if (aSource != None && aSource.IsLocalPlayer()) {                           //0000 : 07 80 00 82 77 00 A8 03 35 19 2A 16 18 10 00 19 00 A8 03 35 19 06 00 04 1C 18 1A 76 0F 16 16 
      prefix = Class'StringReferences'.default.EffectYouText.Text;              //001F : 0F 00 20 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 
      if (DrainedCharacterStat == 3) {                                          //0038 : 07 64 00 9A 39 3A 01 70 00 35 19 39 3A 24 03 16 
        Message = Class'StringReferences'.default.EffectDrainHealthSelfText.Text;//0048 : 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 58 BA 1B 11 
      } else {                                                                  //0061 : 06 7D 00 
        Message = Class'StringReferences'.default.EffectDrainSelfText.Text;     //0064 : 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 BA 1B 11 
      }
    } else {                                                                    //007D : 06 FD 00 
      assert(aTarget != None && aTarget.IsLocalPlayer());                       //0080 : 09 33 00 82 77 00 10 05 35 19 2A 16 18 10 00 19 00 10 05 35 19 06 00 04 1C 18 1A 76 0F 16 16 
      prefix = Class'StringReferences'.default.EffectSourceText.Text;           //009F : 0F 00 20 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
      if (DrainedCharacterStat == 3) {                                          //00B8 : 07 E4 00 9A 39 3A 01 70 00 35 19 39 3A 24 03 16 
        Message = Class'StringReferences'.default.EffectDrainHealthTargetText.Text;//00C8 : 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 BB 1B 11 
      } else {                                                                  //00E1 : 06 FD 00 
        Message = Class'StringReferences'.default.EffectDrainTargetText.Text;   //00E4 : 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C0 BB 1B 11 
      }
    }
    cl_CombatLogMessage(prefix,Message,aSkill,None,aSource,aTarget,aAmount,aAmount2,aAmount3);//00FD : 1B 2B 05 00 00 00 20 04 35 19 00 98 04 35 19 00 E8 00 35 19 2A 00 A8 03 35 19 00 10 05 35 19 00 88 05 35 19 00 00 06 35 19 00 78 06 35 19 16 
    if (aTarget != None) {                                                      //012C : 07 52 01 77 00 10 05 35 19 2A 16 
      aTarget.cl_AddScrollingCombatTypeValue(DrainedCharacterStat,-aAmount);    //0137 : 19 00 10 05 35 19 12 00 00 1B 26 05 00 00 01 70 00 35 19 8F 00 88 05 35 19 16 16 
    }
    if (aSource != None) {                                                      //0152 : 07 76 01 77 00 A8 03 35 19 2A 16 
      aSource.cl_AddScrollingCombatTypeValue(GainedCharacterStat,aAmount3);     //015D : 19 00 A8 03 35 19 10 00 00 1B 26 05 00 00 01 F0 06 35 19 00 78 06 35 19 16 
    }
    CheckAutoTarget(aSource,aTarget);                                           //0176 : 1B 80 0C 00 00 00 A8 03 35 19 00 10 05 35 19 16 
    //07 80 00 82 77 00 A8 03 35 19 2A 16 18 10 00 19 00 A8 03 35 19 06 00 04 1C 18 1A 76 0F 16 16 0F 
    //00 20 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 07 64 00 9A 39 3A 01 70 
    //00 35 19 39 3A 24 03 16 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 58 BA 1B 
    //11 06 7D 00 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 BA 1B 11 06 FD 00 
    //09 33 00 82 77 00 10 05 35 19 2A 16 18 10 00 19 00 10 05 35 19 06 00 04 1C 18 1A 76 0F 16 16 0F 
    //00 20 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 07 E4 00 9A 39 3A 01 70 
    //00 35 19 39 3A 24 03 16 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 BB 1B 
    //11 06 FD 00 0F 00 98 04 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C0 BB 1B 11 1B 2B 05 
    //00 00 00 20 04 35 19 00 98 04 35 19 00 E8 00 35 19 2A 00 A8 03 35 19 00 10 05 35 19 00 88 05 35 
    //19 00 00 06 35 19 00 78 06 35 19 16 07 52 01 77 00 10 05 35 19 2A 16 19 00 10 05 35 19 12 00 00 
    //1B 26 05 00 00 01 70 00 35 19 8F 00 88 05 35 19 16 16 07 76 01 77 00 A8 03 35 19 2A 16 19 00 A8 
    //03 35 19 10 00 00 1B 26 05 00 00 01 F0 06 35 19 00 78 06 35 19 16 1B 80 0C 00 00 00 A8 03 35 19 
    //00 10 05 35 19 16 04 0B 47 
  }



