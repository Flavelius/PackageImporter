//==============================================================================
//  FSkill_EffectClass_AudioVisual_CameraShake
//==============================================================================

class FSkill_EffectClass_AudioVisual_CameraShake extends FSkill_EffectClass_AudioVisual_LocalView
    native
    dependsOn(Game_Pawn,Game_PlayerController,Game_Camera)
  ;

  var (CameraShake) const Vector MinVect;
  var (CameraShake) const Vector MaxVect;
  var (CameraShake) const float Duration;
  var (CameraShake) const float TransitionTime;


  event DoShake(Game_Pawn Pawn) {
    local Game_PlayerController PC;
    if (IsClient() && Pawn != None && Pawn.Controller != None) {                //0000 : 07 7C 00 82 82 1B 1C 0C 00 00 16 18 09 00 77 00 A8 CD 2B 11 2A 16 16 18 12 00 77 19 00 A8 CD 2B 11 05 00 04 01 00 6E 6C 0F 2A 16 16 
      PC = Game_PlayerController(Pawn.Controller);                              //002C : 0F 00 F8 CE 2B 11 2E 90 18 5B 01 19 00 A8 CD 2B 11 05 00 04 01 00 6E 6C 0F 
      if (PC != None) {                                                         //0045 : 07 7C 00 77 00 F8 CE 2B 11 2A 16 
        PC.Camera.SetCameraShake(MinVect,MaxVect,Duration,TransitionTime);      //0050 : 19 19 00 F8 CE 2B 11 05 00 04 01 B0 6A 18 11 1A 00 00 1B 38 0F 00 00 01 30 CD 2B 11 01 70 CF 2B 11 01 E8 BD 2B 11 01 60 BE 2B 11 16 
      }
    }
    //07 7C 00 82 82 1B 1C 0C 00 00 16 18 09 00 77 00 A8 CD 2B 11 2A 16 16 18 12 00 77 19 00 A8 CD 2B 
    //11 05 00 04 01 00 6E 6C 0F 2A 16 16 0F 00 F8 CE 2B 11 2E 90 18 5B 01 19 00 A8 CD 2B 11 05 00 04 
    //01 00 6E 6C 0F 07 7C 00 77 00 F8 CE 2B 11 2A 16 19 19 00 F8 CE 2B 11 05 00 04 01 B0 6A 18 11 1A 
    //00 00 1B 38 0F 00 00 01 30 CD 2B 11 01 70 CF 2B 11 01 E8 BD 2B 11 01 60 BE 2B 11 16 04 0B 47 
  }



