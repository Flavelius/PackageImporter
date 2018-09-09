//==============================================================================
//  AudioSubsystem
//==============================================================================

class AudioSubsystem extends Subsystem
    native
    Transient
    Config(System)
  ;

  var config float AmbientStreamVolume;
  var config float SoundVolume;
  var config float VoiceVolume;
  var config float MusicVolume;
  var config float VolumeScaleRec;
  var config float InterfaceVolume;
  var config bool UseVoIP;
  var config int AmbientPriority;
  var config int MusicPriority;
  var config int SoundPriority;
  var config int VoicePriority;
  var config int InterfacePriority;
  var config float Own_FootstepsVolume;
  var config float Own_VoicesVolume;
  var config float Own_FXVolume;
  var config float Other_FootstepsVolume;
  var config float Other_VoicesVolume;
  var config float Other_FXVolume;
  var config float NPC_FootstepsVolume;
  var config float NPC_VoicesVolume;
  var config float NPC_FXVolume;
  var config float MonsterVolume;
  var config float WildlifeVolume;
  var config float AmbientFXVolume;
  var config int Own_VoiceRepeatTime;
  var config int Other_VoiceRepeatTime;
  var config int NPC_VoiceRepeatTime;
  var config int Wildlife_IdleFX_RepeatTime;
  var config int Wildlife_CombatFX_RepeatTime;
  var config int Monster_IdleFX_RepeatTime;
  var config int Monster_CombatFX_RepeatTime;
  var config float MainVolume;
  var config int CurrentPreferenceIndex;
  var config bool MuteAll;
  var config bool MuteMusic;
  var config bool MuteInterface;
  var config bool MuteAmbientStream;
  var config bool MuteAmbientFX;
  var config bool MuteFootsteps;
  var config bool MuteFX;
  var config bool MuteVoices;
  var config bool MuteMonsters;
  var config bool UseAmbientSound;



