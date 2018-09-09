//==============================================================================
//  SBAudio_Base
//==============================================================================

class SBAudio_Base extends Actor
    native
    dependsOn()
  ;

  const SB_AUDIO_INACTIVE_UPDATE_FREQY =  2.3f;
  const SB_AUDIO_ACTIVE_UPDATE_FREQY =  15.0f;
  enum SBAudioState {
    SBAudioState_Idle ,
    SBAudioState_Active ,
    SBAudioState_Dead 
  };

  enum SBAudioInitializer {
    SBAudioInit_Proximity ,
    SBAudioInit_Event ,
    SBAudioInit_Timer 
  };

  var (DefaultVolume) float MaximumRadius;
  var (DefaultVolume) float HotspotFactor;
  var (DefaultVolume) bool AlwaysUseDefault;
  var transient SBInfluenceVolume DefaultVolume;
  var (Trigger) byte TriggeredOn;
  var (Trigger) float TriggerTimer;
  var (Trigger) float UnTriggerTimer;
  var transient float CurrentTriggerTimer;
  var (Influences) array<name> InfluenceVolumeTags;
  var transient array<SBInfluenceVolume> InfluenceVolumes;
  var (Influences) bool ShowInfluenceBounds;
  var transient Actor LocalListener;
  var transient Box InfluenceBoundingBox;
  var transient float TimeToNextUpdate;
  var transient float UpdateTimeDelta;
  var transient byte CurrentState;


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    AudioUntrigger(Other,EventInstigator);                                      //0000 : 1C 78 9E 67 0F 00 B8 9D 67 0F 00 28 9F 67 0F 16 
    //1C 78 9E 67 0F 00 B8 9D 67 0F 00 28 9F 67 0F 16 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    AudioTrigger(Other,EventInstigator);                                        //0000 : 1C E8 EC 2F 0F 00 70 EC 2F 0F 00 98 ED 2F 0F 16 
    //1C E8 EC 2F 0F 00 70 EC 2F 0F 00 98 ED 2F 0F 16 04 0B 47 
  }


  final native function AudioUntrigger(Actor Other,Pawn EventInstigator);


  final native function AudioTrigger(Actor Other,Pawn EventInstigator);



