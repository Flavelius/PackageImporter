//==============================================================================
//  FSkill_EffectClass_DirectDamage
//==============================================================================

class FSkill_EffectClass_DirectDamage extends FSkill_EffectClass_Direct
    native
    dependsOn(Class,StringReferences)
  ;

  var (Damage) const export editinline FSkill_ValueSpecifier Damage;
  var (Damage) const bool IgnoreResist;
  var (Damage) const float RearIncrease;
  var (Damage) const Vector Momentum;
  var (aI) const float AggroMultiplier;


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    local string prefix;
    local string Message;
    prefix = Class'StringReferences'.default.EffectSourceText.Text;             //0000 : 0F 00 50 0D 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
    if (aDuffEvent != None) {                                                   //0019 : 07 40 00 77 00 C8 0D 35 19 2A 16 
      Message = Class'StringReferences'.default.EffectDirectDamageOverTimeText.Text;//0024 : 0F 00 08 40 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 BC 1B 11 
    } else {                                                                    //003D : 06 59 00 
      Message = Class'StringReferences'.default.EffectDirectDamageText.Text;    //0040 : 0F 00 08 40 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 30 1C 11 
    }
    cl_CombatLogMessage(prefix,Message,aSkill,aDuffEvent,aSource,aTarget,aAmount,aAmount2,aAmount3);//0059 : 1B 2B 05 00 00 00 50 0D 35 19 00 08 40 35 19 00 A0 0B 35 19 00 C8 0D 35 19 00 80 40 35 19 00 F8 40 35 19 00 70 41 35 19 00 E8 41 35 19 00 60 42 35 19 16 
    if (aTarget != None) {                                                      //008C : 07 AF 00 77 00 F8 40 35 19 2A 16 
      aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                       //0097 : 19 00 F8 40 35 19 0F 00 00 1B 26 05 00 00 24 03 8F 00 70 41 35 19 16 16 
    }
    CheckAutoTarget(aSource,aTarget);                                           //00AF : 1B 80 0C 00 00 00 80 40 35 19 00 F8 40 35 19 16 
    //0F 00 50 0D 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 07 40 00 77 00 C8 0D 
    //35 19 2A 16 0F 00 08 40 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 BC 1B 11 06 59 00 
    //0F 00 08 40 35 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 30 1C 11 1B 2B 05 00 00 00 50 
    //0D 35 19 00 08 40 35 19 00 A0 0B 35 19 00 C8 0D 35 19 00 80 40 35 19 00 F8 40 35 19 00 70 41 35 
    //19 00 E8 41 35 19 00 60 42 35 19 16 07 AF 00 77 00 F8 40 35 19 2A 16 19 00 F8 40 35 19 0F 00 00 
    //1B 26 05 00 00 24 03 8F 00 70 41 35 19 16 16 1B 80 0C 00 00 00 80 40 35 19 00 F8 40 35 19 16 04 
    //0B 47 
  }



