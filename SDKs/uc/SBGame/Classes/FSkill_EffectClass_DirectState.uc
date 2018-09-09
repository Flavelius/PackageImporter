//==============================================================================
//  FSkill_EffectClass_DirectState
//==============================================================================

class FSkill_EffectClass_DirectState extends FSkill_EffectClass_Direct
    native
    dependsOn(Class,StringReferences)
  ;

  var (State) const byte State;
  var (State) const export editinline FSkill_ValueSpecifier Value;


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    local string prefix;
    local string Message;
    prefix = Class'StringReferences'.default.EffectSourceText.Text;             //0000 : 0F 00 10 EE 34 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 
    if (aDuffEvent != None) {                                                   //0019 : 07 40 00 77 00 88 EE 34 19 2A 16 
      Message = Class'StringReferences'.default.EffectDirectStateDuffText.Text; //0024 : 0F 00 00 EF 34 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 B8 1B 11 
    } else {                                                                    //003D : 06 94 00 
      if (aTarget != None && aTarget.IsLocalPlayer()) {                         //0040 : 07 7B 00 82 77 00 78 EF 34 19 2A 16 18 10 00 19 00 78 EF 34 19 06 00 04 1C 18 1A 76 0F 16 16 
        Message = Class'StringReferences'.default.EffectDirectStateSelfText.Text;//005F : 0F 00 00 EF 34 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 B8 1B 11 
      } else {                                                                  //0078 : 06 94 00 
        Message = Class'StringReferences'.default.EffectDirectStateTargetText.Text;//007B : 0F 00 00 EF 34 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 B8 1B 11 
      }
    }
    cl_CombatLogMessage(prefix,Message,aSkill,aDuffEvent,aSource,aTarget,aAmount,aAmount2,aAmount3);//0094 : 1B 2B 05 00 00 00 10 EE 34 19 00 00 EF 34 19 00 10 EC 34 19 00 88 EE 34 19 00 F0 EF 34 19 00 78 EF 34 19 00 68 F0 34 19 00 E0 F0 34 19 00 58 F1 34 19 16 
    if (aTarget != None) {                                                      //00C7 : 07 EB 00 77 00 78 EF 34 19 2A 16 
      aTarget.cl_AddScrollingCombatTypeValue(State,aAmount);                    //00D2 : 19 00 78 EF 34 19 10 00 00 1B 26 05 00 00 01 98 EB 34 19 00 68 F0 34 19 16 
    }
    CheckAutoTarget(aSource,aTarget);                                           //00EB : 1B 80 0C 00 00 00 F0 EF 34 19 00 78 EF 34 19 16 
    //0F 00 10 EE 34 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 07 40 00 77 00 88 EE 
    //34 19 2A 16 0F 00 00 EF 34 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 B8 1B 11 06 94 00 
    //07 7B 00 82 77 00 78 EF 34 19 2A 16 18 10 00 19 00 78 EF 34 19 06 00 04 1C 18 1A 76 0F 16 16 0F 
    //00 00 EF 34 19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 B8 1B 11 06 94 00 0F 00 00 EF 34 
    //19 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 B8 1B 11 1B 2B 05 00 00 00 10 EE 34 19 00 00 
    //EF 34 19 00 10 EC 34 19 00 88 EE 34 19 00 F0 EF 34 19 00 78 EF 34 19 00 68 F0 34 19 00 E0 F0 34 
    //19 00 58 F1 34 19 16 07 EB 00 77 00 78 EF 34 19 2A 16 19 00 78 EF 34 19 10 00 00 1B 26 05 00 00 
    //01 98 EB 34 19 00 68 F0 34 19 16 1B 80 0C 00 00 00 F0 EF 34 19 00 78 EF 34 19 16 04 0B 47 
  }



