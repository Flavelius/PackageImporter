//==============================================================================
//  SBAudioPlayer
//==============================================================================

class SBAudioPlayer extends SBAudio_Base
    native
    dependsOn()
    Placeable
  ;

  enum AudioModifierType {
    Audio_VolumeModulator 
  };

  enum ESBTriggerBehaviour {
    SBTrigBehaviour_TimeDependant ,
    SBTrigBehaviour_Reset ,
    SBTrigBehaviour_None 
  };

  enum ESBSoundTimeOfDay {
    SoundTOD_Always ,
    SoundTOD_Day ,
    SoundTOD_Night 
  };

  struct SBPlayerActiveAudio {
      var int Index;
      var int TrackHandle;
      var bool bPlaying;

  };


  struct SBAudioModifierProps {
      var (SBAudioModifierProps) byte ModifierType;
      var (SBAudioModifierProps) byte ModulationShape;
      var (SBAudioModifierProps) float ModulationTime;
      var (SBAudioModifierProps) float ModulationTimeDelta;
      var (SBAudioModifierProps) float ModulationTimeVariation;
      var (SBAudioModifierProps) float ModulationDamping;
      var (SBAudioModifierProps) float ModulationDampingVariation;

  };


  struct SBExcludedAudio {
      var (SBExcludedAudio) name ActorName;
      var (SBExcludedAudio) byte AudioType;
      var transient bool Excluded;

  };


  struct SBSoundEditor {
      var (SBSoundEditor) string OggFilename;
      var (SBSoundEditor) Sound Sound;
      var (SBSoundEditor) byte WhenPlayed;

  };


  struct SBSound {
      var Sound Sound;
      var float StartTime;
      var float Duration;
      var bool IsOgg;
      var byte WhenPlayed;

  };


  var (SBAudioPlayer) byte MaximumVolume;
  var (SBAudioPlayer) bool Looping;
  var (SBAudioPlayer) bool Locational;
  var (SBAudioPlayer) int Pitch;
  var (SBAudioPlayer) byte AudioType;
  var (Trigger) byte InitialTrigger;
  var (Trigger) byte LaterTriggers;
  var (Trigger) float TriggerFadeTime;
  var (Trigger) float UnTriggerFadeTime;
  var (Sounds) array<SBSoundEditor> Sounds;
  var transient array<SBSound> CachedSounds;
  var transient bool bCachedSoundsDirty;
  var transient bool bTriggeredOnce;
  var transient bool bBaseVolumeCached;
  var transient bool bPreventNewAudio;
  var transient Vector MeanLocation;
  var transient SBAudioManager AudioManager;
  var (Modifiers) array<SBAudioModifierProps> ModifierProperties;
  var transient array<SBAudioModifier> ModifierInstances;
  var transient float ActualPitch;
  var transient int SoundFlags;
  var transient float ActualMaxVolume;
  var transient float CurrentVolume;
  var transient SBPlayerActiveAudio DayAudio;
  var transient SBPlayerActiveAudio NightAudio;
  var transient SBPlayerActiveAudio IndependantAudio;
  var private transient byte mCachedTriggerType;



