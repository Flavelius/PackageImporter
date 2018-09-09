//==============================================================================
//  FSkill_EffectClass_DuffReturnReflect
//==============================================================================

class FSkill_EffectClass_DuffReturnReflect extends FSkill_EffectClass_Duff
    native
    dependsOn(Game_Pawn,Class,StringReferences)
  ;

  var (ReturnReflect) const byte Mode;
  var (ReturnReflect) const byte AttackType;
  var (ReturnReflect) const byte MagicType;
  var (ReturnReflect) const byte EffectType;
  var (ReturnReflect) const float Multiplier;
  var (Uses) const float UseInterval;
  var (Uses) const int Uses;
  var (Uses) const float IncreasePerUse;
  var (ReturnReflectFX) const export editinline FSkill_EffectClass_AudioVisual_Emitter SourceFX;
  var (ReturnReflectFX) const export editinline FSkill_EffectClass_AudioVisual_Emitter TargetFX;
  var const export editinline FSkill_ValueSpecifier _ReturnReflectValue;


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    local string prefix;
    local string Message;
    if (Mode == 0) {                                                            //0000 : 07 22 01 9A 39 3A 01 40 E9 35 11 39 3A 24 00 16 
      if (aTarget != None && aTarget.IsLocalPlayer()) {                         //0010 : 07 A3 00 82 77 00 B8 E9 35 11 2A 16 18 10 00 19 00 B8 E9 35 11 06 00 04 1C 18 1A 76 0F 16 16 
        prefix = Class'StringReferences'.default.EffectSourceText.Text;         //002F : 0F 00 30 EA 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
        if (aAmount3 == 0) {                                                    //0048 : 07 6F 00 9A 00 A8 EA 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffReturnSelfEETText.Text;//0053 : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 32 1C 11 
        } else {                                                                //006C : 06 88 00 
          Message = Class'StringReferences'.default.EffectDuffReturnSelfText.Text;//006F : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 33 1C 11 
        }
        aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                     //0088 : 19 00 B8 E9 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 
      } else {                                                                  //00A0 : 06 1F 01 
        prefix = Class'StringReferences'.default.EffectYouText.Text;            //00A3 : 0F 00 30 EA 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 
        if (aAmount3 == 0) {                                                    //00BC : 07 E3 00 9A 00 A8 EA 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffReturnTargetEETText.Text;//00C7 : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 34 1C 11 
        } else {                                                                //00E0 : 06 FC 00 
          Message = Class'StringReferences'.default.EffectDuffReturnTargetText.Text;//00E3 : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 35 1C 11 
        }
        if (aTarget != None) {                                                  //00FC : 07 1F 01 77 00 B8 E9 35 11 2A 16 
          aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                   //0107 : 19 00 B8 E9 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 
        }
      }
    } else {                                                                    //011F : 06 31 02 
      if (aTarget != None && aTarget.IsLocalPlayer()) {                         //0122 : 07 B5 01 82 77 00 B8 E9 35 11 2A 16 18 10 00 19 00 B8 E9 35 11 06 00 04 1C 18 1A 76 0F 16 16 
        prefix = Class'StringReferences'.default.EffectSourceText.Text;         //0141 : 0F 00 30 EA 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
        if (aAmount3 == 0) {                                                    //015A : 07 81 01 9A 00 A8 EA 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffReflectSelfEETText.Text;//0165 : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 35 1C 11 
        } else {                                                                //017E : 06 9A 01 
          Message = Class'StringReferences'.default.EffectDuffReflectSelfText.Text;//0181 : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 68 36 1C 11 
        }
        aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                     //019A : 19 00 B8 E9 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 
      } else {                                                                  //01B2 : 06 31 02 
        prefix = Class'StringReferences'.default.EffectYouText.Text;            //01B5 : 0F 00 30 EA 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 
        if (aAmount3 == 0) {                                                    //01CE : 07 F5 01 9A 00 A8 EA 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffReflectTargetEETText.Text;//01D9 : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E0 36 1C 11 
        } else {                                                                //01F2 : 06 0E 02 
          Message = Class'StringReferences'.default.EffectDuffReflectTargetText.Text;//01F5 : 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 58 37 1C 11 
        }
        if (aTarget != None) {                                                  //020E : 07 31 02 77 00 B8 E9 35 11 2A 16 
          aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                   //0219 : 19 00 B8 E9 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 
        }
      }
    }
    cl_CombatLogMessage(prefix,Message,aSkill,aDuffEvent,aSource,aTarget,aAmount,aAmount2,aAmount3);//0231 : 1B 2B 05 00 00 00 30 EA 35 11 00 20 EB 35 11 00 50 E5 35 11 00 10 EC 35 11 00 88 EC 35 11 00 B8 E9 35 11 00 98 EB 35 11 00 00 ED 35 11 00 A8 EA 35 11 16 
    //07 22 01 9A 39 3A 01 40 E9 35 11 39 3A 24 00 16 07 A3 00 82 77 00 B8 E9 35 11 2A 16 18 10 00 19 
    //00 B8 E9 35 11 06 00 04 1C 18 1A 76 0F 16 16 0F 00 30 EA 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 90 B6 35 0F 07 6F 00 9A 00 A8 EA 35 11 25 16 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 30 32 1C 11 06 88 00 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 20 33 1C 11 19 00 B8 E9 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 
    //06 1F 01 0F 00 30 EA 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 07 E3 00 9A 
    //00 A8 EA 35 11 25 16 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 34 1C 11 
    //06 FC 00 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 35 1C 11 07 1F 01 77 
    //00 B8 E9 35 11 2A 16 19 00 B8 E9 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 06 
    //31 02 07 B5 01 82 77 00 B8 E9 35 11 2A 16 18 10 00 19 00 B8 E9 35 11 06 00 04 1C 18 1A 76 0F 16 
    //16 0F 00 30 EA 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 07 81 01 9A 00 A8 
    //EA 35 11 25 16 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 35 1C 11 06 9A 
    //01 0F 00 20 EB 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 68 36 1C 11 19 00 B8 E9 35 11 
    //0F 00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 06 31 02 0F 00 30 EA 35 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 07 F5 01 9A 00 A8 EA 35 11 25 16 0F 00 20 EB 35 11 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E0 36 1C 11 06 0E 02 0F 00 20 EB 35 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 58 37 1C 11 07 31 02 77 00 B8 E9 35 11 2A 16 19 00 B8 E9 35 11 0F 
    //00 00 1B 26 05 00 00 24 03 8F 00 98 EB 35 11 16 16 1B 2B 05 00 00 00 30 EA 35 11 00 20 EB 35 11 
    //00 50 E5 35 11 00 10 EC 35 11 00 88 EC 35 11 00 B8 E9 35 11 00 98 EB 35 11 00 00 ED 35 11 00 A8 
    //EA 35 11 16 04 0B 47 
  }


  final native function float GetReturnReflectEffect(export editinline FSkill_Event aSkillEvent,float aSkillValue,int aNumUses);


  final native function bool MatchEffect(byte aMode,byte aAttackType,byte aMagicType,byte aEffectType);



