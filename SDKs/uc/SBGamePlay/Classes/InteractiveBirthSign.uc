//==============================================================================
//  InteractiveBirthSign
//==============================================================================

class InteractiveBirthSign extends InteractiveLevelElement
    native
    dependsOn(SBDecoration)
  ;

  var (InteractiveBirthSign) const SBDecoration BirthSignGlow;
  var (InteractiveBirthSign) const name Spawner_Event;
  var (InteractiveBirthSign) name DeactivationEvent;
  var (InteractiveBirthSign) const name SoundEvent;
  var (InteractiveBirthSign) const Trigger ProximityTrigger;
  var bool Activated;
  var bool Deactivated;


  protected native function sv2rel_PlaySoundEvent_CallStub();


  event sv2rel_PlaySoundEvent() {
    TriggerEvent(SoundEvent,self,None);                                         //0000 : 1C F8 B1 34 0F 01 A0 85 30 0F 17 2A 16 
    //1C F8 B1 34 0F 01 A0 85 30 0F 17 2A 16 04 0B 47 
  }


  protected native function sv2rel_ShowGlow_CallStub();


  event sv2rel_ShowGlow(bool val) {
    BirthSignGlow.bHidden = !val;                                               //0000 : 14 19 01 08 91 30 0F 06 00 04 2D 01 48 5E 6E 0F 81 2D 00 90 90 30 0F 16 
    //14 19 01 08 91 30 0F 06 00 04 2D 01 48 5E 6E 0F 81 2D 00 90 90 30 0F 16 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    sv_SetEnabled(True);                                                        //0000 : 1B 96 0C 00 00 27 16 
    //1B 96 0C 00 00 27 16 04 0B 47 
  }


  function ActivateBirthSign() {
    sv2rel_ShowGlow_CallStub(True);                                             //0000 : 1B E6 6F 00 00 27 16 
    sv2rel_PlaySoundEvent_CallStub();                                           //0007 : 1B E7 6F 00 00 16 
    TriggerEvent(Spawner_Event,self,None);                                      //000D : 1C F8 B1 34 0F 01 50 96 F9 13 17 2A 16 
    Activated = True;                                                           //001A : 14 2D 01 C8 96 F9 13 27 
    //1B E6 6F 00 00 27 16 1B E7 6F 00 00 16 1C F8 B1 34 0F 01 50 96 F9 13 17 2A 16 14 2D 01 C8 96 F9 
    //13 27 04 0B 47 
  }



