//==============================================================================
//  FSkill_EffectClass_DuffDrain
//==============================================================================

class FSkill_EffectClass_DuffDrain extends FSkill_EffectClass_Duff
    native
    dependsOn(Class,StringReferences,Game_Pawn)
  ;

  var (Drain) const byte DrainedCharacterStat;
  var (Drain) const byte GainedCharacterStat;
  var (Drain) const export editinline FSkill_ValueSpecifier DrainedAmount;
  var (Drain) const float Multiplier;
  var (Drain) const export editinline FSkill_ValueSpecifier MultiplierVS;


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    local string prefix;
    local string Message;
    prefix = Class'StringReferences'.default.EffectSourceText.Text;             //0000 : 0F 00 88 3D 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
    if (aSource != None && aSource.IsLocalPlayer()) {                           //0019 : 07 54 00 82 77 00 00 3E 35 19 2A 16 18 10 00 19 00 00 3E 35 19 06 00 04 1C 18 1A 76 0F 16 16 
      Message = Class'StringReferences'.default.EffectDuffDrainTargetText.Text; //0038 : 0F 00 78 3E 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 33 1C 11 
    } else {                                                                    //0051 : 06 6D 00 
      Message = Class'StringReferences'.default.EffectDuffDrainSelfText.Text;   //0054 : 0F 00 78 3E 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 35 1C 11 
    }
    cl_CombatLogMessage(prefix,Message,None,aDuffEvent,aSource,aTarget,aAmount,aAmount2,aAmount3);//006D : 1B 2B 05 00 00 00 88 3D 35 19 00 78 3E 35 19 2A 00 F0 3E 35 19 00 00 3E 35 19 00 68 3F 35 19 00 A0 E0 34 19 00 18 E1 34 19 00 90 E1 34 19 16 
    //0F 00 88 3D 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 07 54 00 82 77 00 00 
    //3E 35 19 2A 16 18 10 00 19 00 00 3E 35 19 06 00 04 1C 18 1A 76 0F 16 16 0F 00 78 3E 35 19 36 58 
    //C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 33 1C 11 06 6D 00 0F 00 78 3E 35 19 36 58 C6 6B 0F 12 
    //20 20 F7 60 01 05 00 0C 02 78 35 1C 11 1B 2B 05 00 00 00 88 3D 35 19 00 78 3E 35 19 2A 00 F0 3E 
    //35 19 00 00 3E 35 19 00 68 3F 35 19 00 A0 E0 34 19 00 18 E1 34 19 00 90 E1 34 19 16 04 0B 47 
  }



