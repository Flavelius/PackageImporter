//==============================================================================
//  FSkill_EffectClass_DirectTeleport
//==============================================================================

class FSkill_EffectClass_DirectTeleport extends FSkill_EffectClass_Direct
    native
    abstract
    dependsOn(Class,StringReferences)
  ;

  const MAX_TELEPORT_RETRIES =  4;
  var (Teleport) const byte Mode;
  var (Teleport) const byte Rotation;
  var (Offset) const float Offset;
  var const export editinline FSkill_ValueSpecifier _TeleportValue;


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    assert(aTarget != None && aTarget.IsLocalPlayer());                         //0000 : 09 2C 00 82 77 00 60 68 33 19 2A 16 18 10 00 19 00 60 68 33 19 06 00 04 1C 18 1A 76 0F 16 16 
    cl_CombatLogMessage(Class'StringReferences'.default.EffectSourceText.Text,Class'StringReferences'.default.EffectTeleportText.Text,aSkill,aDuffEvent,aSource,aTarget,aAmount,aAmount2,aAmount3);//001F : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 B7 1B 11 00 08 67 33 19 00 D8 68 33 19 00 50 69 33 19 00 60 68 33 19 00 C8 69 33 19 00 40 6A 33 19 00 B8 6A 33 19 16 
    CheckAutoTarget(aSource,aTarget);                                           //006E : 1B 80 0C 00 00 00 50 69 33 19 00 60 68 33 19 16 
    //09 2C 00 82 77 00 60 68 33 19 2A 16 18 10 00 19 00 60 68 33 19 06 00 04 1C 18 1A 76 0F 16 16 1B 
    //2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 
    //60 01 05 00 0C 02 88 B7 1B 11 00 08 67 33 19 00 D8 68 33 19 00 50 69 33 19 00 60 68 33 19 00 C8 
    //69 33 19 00 40 6A 33 19 00 B8 6A 33 19 16 1B 80 0C 00 00 00 50 69 33 19 00 60 68 33 19 16 04 0B 
    //47 
  }



