//==============================================================================
//  TriggerableBarrier
//==============================================================================

class TriggerableBarrier extends Game_Actor
    dependsOn()
  ;

  var (TriggerableBarrier) bool bInitiallyOpen;
  var (TriggerableBarrier) bool bAutoInvisibleEffect;


  function SetOpened(bool Open) {
    if (IsServer()) {                                                           //0000 : 07 2D 00 1B FF 0B 00 00 16 
      sv_SetEnabled(!Open);                                                     //0009 : 1B 96 0C 00 00 81 2D 00 20 C3 3D 23 16 16 
      sv_SetCollision(!Open,!Open);                                             //0017 : 1B F4 0F 00 00 81 2D 00 20 C3 3D 23 16 81 2D 00 20 C3 3D 23 16 16 
    }
    //07 2D 00 1B FF 0B 00 00 16 1B 96 0C 00 00 81 2D 00 20 C3 3D 23 16 16 1B F4 0F 00 00 81 2D 00 20 
    //C3 3D 23 16 81 2D 00 20 C3 3D 23 16 16 04 0B 47 
  }


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    SetOpened(False);                                                           //0000 : 1B CD 6F 00 00 28 16 
    //1B CD 6F 00 00 28 16 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    SetOpened(True);                                                            //0000 : 1B CD 6F 00 00 27 16 
    //1B CD 6F 00 00 27 16 04 0B 47 
  }


  function PostBeginPlay() {
    local export editinline FSkill_EffectClass_AudioVisual_ColorModifier TransparentEffect;
    SetOpened(bInitiallyOpen);                                                  //0000 : 1B CD 6F 00 00 2D 01 F0 B9 6A 22 16 
    if (bAutoInvisibleEffect) {                                                 //000C : 07 72 00 2D 01 F0 5D 4C 23 
      TransparentEffect = FSkill_EffectClass_AudioVisual_ColorModifier(static.DynamicLoadObject("EffectsMiscGP.Transparent_Effect",Class'FSkill_EffectClass_AudioVisual_ColorModifier',True));//0015 : 0F 00 88 BE 3D 23 2E C0 D3 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 4D 69 73 63 47 50 2E 54 72 61 6E 73 70 61 72 65 6E 74 5F 45 66 66 65 63 74 00 20 C0 D3 5D 01 27 16 
      EnabledEffects[EnabledEffects.Length] = TransparentEffect;                //004E : 0F 10 37 01 A8 F4 1E 11 01 A8 F4 1E 11 00 88 BE 3D 23 
      DisabledEffects[DisabledEffects.Length] = TransparentEffect;              //0060 : 0F 10 37 01 98 F5 1E 11 01 98 F5 1E 11 00 88 BE 3D 23 
    }
    Super.PostBeginPlay();                                                      //0072 : 1C C0 8A 2A 11 16 
    //1B CD 6F 00 00 2D 01 F0 B9 6A 22 16 07 72 00 2D 01 F0 5D 4C 23 0F 00 88 BE 3D 23 2E C0 D3 5D 01 
    //1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 4D 69 73 63 47 50 2E 54 72 61 6E 73 70 61 72 65 6E 74 5F 
    //45 66 66 65 63 74 00 20 C0 D3 5D 01 27 16 0F 10 37 01 A8 F4 1E 11 01 A8 F4 1E 11 00 88 BE 3D 23 
    //0F 10 37 01 98 F5 1E 11 01 98 F5 1E 11 00 88 BE 3D 23 1C C0 8A 2A 11 16 04 0B 47 
  }



