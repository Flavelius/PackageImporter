//==============================================================================
//  FSkill_EffectClass_DuffShare
//==============================================================================

class FSkill_EffectClass_DuffShare extends FSkill_EffectClass_Duff
    native
    dependsOn(Game_Pawn,Class,StringReferences)
  ;

  var (Sharing) const byte EffectType;
  var (Sharing) const byte AttackType;
  var (Sharing) const byte MagicType;
  var (Sharing) const byte Mode;
  var (Sharing) const float ShareRatio;
  var (Sharing) const byte Type;
  var (Sharing) const bool IsBloodLink;
  var (Uses) const float UseInterval;
  var (Uses) const int Uses;
  var (Uses) const float IncreasePerUse;
  var (SharingFX) const export editinline FSkill_EffectClass_AudioVisual_Emitter SourceFX;
  var (SharingFX) const export editinline FSkill_EffectClass_AudioVisual_Emitter TargetFX;
  var (Applicant) const Texture Icon;
  var (Applicant) const string Description;
  var const export editinline FSkill_ValueSpecifier _ShareValue;


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    local string prefix;
    local string Message;
    if (Type == 1) {                                                            //0000 : 07 22 01 9A 39 3A 01 20 19 35 11 39 3A 24 01 16 
      if (aTarget != None && aTarget.IsLocalPlayer()) {                         //0010 : 07 A3 00 82 77 00 98 19 35 11 2A 16 18 10 00 19 00 98 19 35 11 06 00 04 1C 18 1A 76 0F 16 16 
        prefix = Class'StringReferences'.default.EffectSourceText.Text;         //002F : 0F 00 10 1A 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
        if (aAmount3 == 0) {                                                    //0048 : 07 6F 00 9A 00 88 1A 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffShareReturnSelfEETText.Text;//0053 : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 BC 1B 11 
        } else {                                                                //006C : 06 88 00 
          Message = Class'StringReferences'.default.EffectDuffShareReturnSelfText.Text;//006F : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 BD 1B 11 
        }
        aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                     //0088 : 19 00 98 19 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 
      } else {                                                                  //00A0 : 06 1F 01 
        prefix = Class'StringReferences'.default.EffectYouText.Text;            //00A3 : 0F 00 10 1A 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 
        if (aAmount3 == 0) {                                                    //00BC : 07 E3 00 9A 00 88 1A 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffShareReturnTargetEETText.Text;//00C7 : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 2F 1C 11 
        } else {                                                                //00E0 : 06 FC 00 
          Message = Class'StringReferences'.default.EffectDuffShareReturnTargetText.Text;//00E3 : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 30 1C 11 
        }
        if (aTarget != None) {                                                  //00FC : 07 1F 01 77 00 98 19 35 11 2A 16 
          aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                   //0107 : 19 00 98 19 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 
        }
      }
    } else {                                                                    //011F : 06 31 02 
      if (aTarget != None && aTarget.IsLocalPlayer()) {                         //0122 : 07 B5 01 82 77 00 98 19 35 11 2A 16 18 10 00 19 00 98 19 35 11 06 00 04 1C 18 1A 76 0F 16 16 
        prefix = Class'StringReferences'.default.EffectSourceText.Text;         //0141 : 0F 00 10 1A 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
        if (aAmount3 == 0) {                                                    //015A : 07 81 01 9A 00 88 1A 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffShareDivideSelfEETText.Text;//0165 : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 31 1C 11 
        } else {                                                                //017E : 06 9A 01 
          Message = Class'StringReferences'.default.EffectDuffShareDivideSelfText.Text;//0181 : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 31 1C 11 
        }
        aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                     //019A : 19 00 98 19 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 
      } else {                                                                  //01B2 : 06 31 02 
        prefix = Class'StringReferences'.default.EffectYouText.Text;            //01B5 : 0F 00 10 1A 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 
        if (aAmount3 == 0) {                                                    //01CE : 07 F5 01 9A 00 88 1A 35 11 25 16 
          Message = Class'StringReferences'.default.EffectDuffShareDivideTargetEETText.Text;//01D9 : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 32 1C 11 
        } else {                                                                //01F2 : 06 0E 02 
          Message = Class'StringReferences'.default.EffectDuffShareDivideTargetText.Text;//01F5 : 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 34 1C 11 
        }
        if (aTarget != None) {                                                  //020E : 07 31 02 77 00 98 19 35 11 2A 16 
          aTarget.cl_AddScrollingCombatTypeValue(3,-aAmount);                   //0219 : 19 00 98 19 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 
        }
      }
    }
    cl_CombatLogMessage(prefix,Message,aSkill,aDuffEvent,aSource,aTarget,aAmount,aAmount2,aAmount3);//0231 : 1B 2B 05 00 00 00 10 1A 35 11 00 00 1B 35 11 00 A8 18 35 11 00 F0 1B 35 11 00 68 1C 35 11 00 98 19 35 11 00 78 1B 35 11 00 E0 1C 35 11 00 88 1A 35 11 16 
    //07 22 01 9A 39 3A 01 20 19 35 11 39 3A 24 01 16 07 A3 00 82 77 00 98 19 35 11 2A 16 18 10 00 19 
    //00 98 19 35 11 06 00 04 1C 18 1A 76 0F 16 16 0F 00 10 1A 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 90 B6 35 0F 07 6F 00 9A 00 88 1A 35 11 25 16 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 B0 BC 1B 11 06 88 00 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 28 BD 1B 11 19 00 98 19 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 
    //06 1F 01 0F 00 10 1A 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 07 E3 00 9A 
    //00 88 1A 35 11 25 16 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 2F 1C 11 
    //06 FC 00 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 30 1C 11 07 1F 01 77 
    //00 98 19 35 11 2A 16 19 00 98 19 35 11 0F 00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 06 
    //31 02 07 B5 01 82 77 00 98 19 35 11 2A 16 18 10 00 19 00 98 19 35 11 06 00 04 1C 18 1A 76 0F 16 
    //16 0F 00 10 1A 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 07 81 01 9A 00 88 
    //1A 35 11 25 16 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 31 1C 11 06 9A 
    //01 0F 00 00 1B 35 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 31 1C 11 19 00 98 19 35 11 
    //0F 00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 06 31 02 0F 00 10 1A 35 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 07 F5 01 9A 00 88 1A 35 11 25 16 0F 00 00 1B 35 11 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 32 1C 11 06 0E 02 0F 00 00 1B 35 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 10 34 1C 11 07 31 02 77 00 98 19 35 11 2A 16 19 00 98 19 35 11 0F 
    //00 00 1B 26 05 00 00 24 03 8F 00 78 1B 35 11 16 16 1B 2B 05 00 00 00 10 1A 35 11 00 00 1B 35 11 
    //00 A8 18 35 11 00 F0 1B 35 11 00 68 1C 35 11 00 98 19 35 11 00 78 1B 35 11 00 E0 1C 35 11 00 88 
    //1A 35 11 16 04 0B 47 
  }


  final native function float GetShareEffect(float aSkillValue,int aNumUses);


  final native function bool MatchEffect(byte aShareType,byte aAttackType,byte aMagicType,byte aEffectType);



