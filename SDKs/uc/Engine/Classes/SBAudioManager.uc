//==============================================================================
//  SBAudioManager
//==============================================================================

class SBAudioManager extends Object
    native
    dependsOn()
    Config(System)
  ;

  const SBMIN_ALLOWED_VOLUME =  0.001f;
  const SBFADER_INVALID =  -1;
  enum SBAM_DayNightPeriod {
    SBDNP_Day ,
    SBDNP_Dawn ,
    SBDNP_Night ,
    SBDNP_Dusk 
  };

  enum SBAM_CharacterType {
    SBCT_None ,
    SBCT_Player ,
    SBCT_Client ,
    SBCT_NPC 
  };

  enum SBAM_AudioType {
    SBAM_AmbientStream ,
    SBAM_AmbientFX ,
    SBAM_MonsterFX ,
    SBAM_WildlifeFX ,
    SBAM_CharacterFX ,
    SBAM_CharacterFootstep ,
    SBAM_CharacterVoice ,
    SBAM_Music ,
    SBAM_Interface ,
    SBAM_SpecialMusic 
  };

  struct FaderInfo {
      var bool GroupFader;
      var int FaderHandle;
      var int FaderID;
      var float FadeOutTime;
      var float FadeInTime;
      var float FadeOutDelay;
      var float FadeInDelay;

  };


  struct GroupFadeProperties {
      var byte AudioType;
      var float FadeOutTime;
      var float FadeInTime;
      var float FadeOutDelay;
      var float FadeInDelay;

  };


  struct MusicTrackInfo {
      var int MusicHandle;
      var array<FaderInfo> ActiveFaders;

  };


  struct SBExemptFromFade {
      var name ActorTagName;
      var bool TimerActive;
      var float RemoveExemptionTimer;

  };


  struct SBAudioTypeParams {
      var byte AudioType;
      var int Priority;
      var float MaximumVolumeFactor;
      var float CurrentVolumeFactor;
      var bool Mute;

  };


  struct SBAudioStream {
      var byte AudioType;
      var byte OwnerType;
      var float Volume;
      var float Pitch;
      var int StreamHandle;
      var int Priority;
      var Sound SoundObject;
      var Actor SoundOwner;
      var Vector Location;
      var float MaxRadius;
      var int SoundFlags;
      var float CurrentTime;
      var float TotalDuration;
      var int AudioStreamId;
      var bool Initialized;
      var bool Looped;

  };


  struct SBAudioFader {
      var int Handle;
      var name TrackOwnerTag;
      var int Id;
      var float CurrentFadeTime;
      var float TotalFadeTime;
      var float StartFactor;
      var float TargetFactor;
      var float FadeFactor;
      var bool CullAtTarget;

  };


  var array<SBAudioTypeParams> GroupParameters;
  var transient array<SBAudioStream> SBStream;
  var transient array<SBAudioFader> GroupFaders;
  var transient array<SBAudioFader> TrackFaders;
  var transient array<SBExemptFromFade> FadeExemptList;
  var private transient array<MusicTrackInfo> GlobalMusic;
  var private transient float mCachedRelativeTOD;
  var private transient float mDayAudioAmplitudeFactor;
  var private transient float mNightAudioAmplitudeFactor;
  var private transient float mDawnStart;
  var private transient float mDuskStart;
  var private transient byte mCurrentAudioTimePeriod;
  var config float DayNightFadeThreshold;
  var config float DawnDuration;
  var config float DuskDuration;
  var private config float ExplorationMusicTimeout;
  var private config float mCurrentExpMusicTimer;
  var config float SoundNotifierRadiusFactor;
  var config float MusicAmbientFadeOutDuration;
  var config float MusicAmbientFadeInDuration;
  var config float MusicAmbientFadeInBeforeEnd;
  var private array<GroupFadeProperties> DefaultMusicFades;
  var private transient Engine mOwner;
  var private transient AudioSubsystem mAudio;


  final native function OnShutdown();


  final native function ResetExplorationMusicTimer();


  final native function float GetExplorationMusicTimerValue();


  final native function SetDefaultExplorationMusicTimeout(float aNewValue);


  final native function float GetDefaultExplorationMusicTimeout();


  final native function StopMusicTrack(int aTrackHandle,optional float aFadeOutTime);


  final native function StopMusicFile(string anOggFilename,optional float aFadeOutTime);


  final native function int PlayMusic(string anOggFilename,float aVolume,bool aLooped,optional float aFadeInTime,optional bool aSpecialMusic,optional array<GroupFadeProperties> aGroupFaders);


  final native function int PlayInterfaceSound(Sound s,float Volume);


  final native function StopAudioTrack(int aTrackHandle,optional Actor aOwner,optional float aFadeOutTime);


  final native function StopAudioType(byte aAudioType,optional float FadeTime);



