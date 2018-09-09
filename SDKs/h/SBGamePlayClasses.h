#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBGAMEPLAY_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif

AUTOGENERATE_NAME(ForwardEvents)
AUTOGENERATE_NAME(GetTooltipText)
AUTOGENERATE_NAME(sv2rel_PlaySoundEvent)
AUTOGENERATE_NAME(sv2rel_ShowGlow)

//------------------------------------------------------------------------------
//  SBGamePlayStrings
//------------------------------------------------------------------------------

// USBGamePlayStrings 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBGamePlayStrings : public UObject {
  public:
    struct FLocalizedString Unknown_Area;  // 28 400000 CPF_NeedCtorLink
    struct FLocalizedString Unknown_Shard;  // 34 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_invite_player_you_not_in_guild;  // 40 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_remove_member_you_not_in_guild;  // 4C 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_disband_guild_you_not_in_guild;  // 58 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_leave_guild_you_not_in_guild;  // 64 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_kick_member_you_not_in_party;  // 70 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_disband_party_you_not_in_party;  // 7C 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_leave_party_you_not_in_party;  // 88 400000 CPF_NeedCtorLink
    struct FLocalizedString Invite_whom_;  // 94 400000 CPF_NeedCtorLink
    struct FLocalizedString Friend_whom_;  // A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Ignore_whom_;  // AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Fame;  // B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Quest_Points;  // C4 400000 CPF_NeedCtorLink
    struct FLocalizedString No_help_found;  // D0 400000 CPF_NeedCtorLink
    virtual ~USBGamePlayStrings(void);
    virtual unsigned int GetCPPSize(void);
    USBGamePlayStrings(class USBGamePlayStrings const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBGamePlayStrings & operator=(class USBGamePlayStrings const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBGamePlayStrings(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBAudioModifier
//------------------------------------------------------------------------------

// USBAudioModifier 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBAudioModifier : public UObject {
  public:
    virtual ~USBAudioModifier(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Init(double);
    virtual void Update(double,class ASBAudioPlayer *);
    USBAudioModifier(class USBAudioModifier const &);
    USBAudioModifier(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBAudioModifier & operator=(class USBAudioModifier const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBAudioModulator
//------------------------------------------------------------------------------

#define UCONST_SBAudioModulator_MIN_MOD_DAMP_VARIATION  0.001f
#define UCONST_SBAudioModulator_MIN_MOD_TIME_DELTA  0.001f
enum ESBAudioModulationShape {
  SBModShape_Linear = 0,
  SBModShape_Sinusoidal = 1
};

// USBAudioModulator 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBAudioModulator : public USBAudioModifier {
  public:
    FLOAT ModTime;  // 28 1 CPF_Edit
    FLOAT ModTimeDelta;  // 2C 1 CPF_Edit
    FLOAT ModTimeVariation;  // 30 1 CPF_Edit
    FLOAT ModDamping;  // 34 1 CPF_Edit
    FLOAT ModDampingVariation;  // 38 1 CPF_Edit
    BYTE ModShape;  // 3C 1 CPF_Edit
    FLOAT ModulationFactor;  // 40 2000 CPF_Transient
    FLOAT DampTarget;  // 44 2000 CPF_Transient
    FLOAT ModulationTimerStart;  // 48 2000 CPF_Transient
    FLOAT ModulationTimerEnd;  // 4C 2000 CPF_Transient
    FLOAT ModulationHelperFactor;  // 50 2000 CPF_Transient
    FLOAT lastUpdateTime;  // 54 2000 CPF_Transient
    virtual ~USBAudioModulator(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual void Init(double);
    virtual void Update(double,class ASBAudioPlayer *);
    virtual void FinalizeUpdate(class ASBAudioPlayer *);
    USBAudioModulator(class USBAudioModulator const &);
    USBAudioModulator(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBAudioModulator & operator=(class USBAudioModulator const &);
    void CheckValues(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
    void UpdateLinearMod(double);
    void UpdateSinusoidalMod(double);
};


//------------------------------------------------------------------------------
//  SBVolumeModulator
//------------------------------------------------------------------------------

// USBVolumeModulator 1012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew )
class DLL_IMPORT USBVolumeModulator : public USBAudioModulator {
  public:
    virtual ~USBVolumeModulator(void);
    virtual unsigned int GetCPPSize(void);
    virtual void FinalizeUpdate(class ASBAudioPlayer *);
    USBVolumeModulator(class USBVolumeModulator const &);
    USBVolumeModulator(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBVolumeModulator & operator=(class USBVolumeModulator const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBAudio_Base
//------------------------------------------------------------------------------

#define UCONST_SBAudio_Base_SB_AUDIO_INACTIVE_UPDATE_FREQY  2.3f
#define UCONST_SBAudio_Base_SB_AUDIO_ACTIVE_UPDATE_FREQY  15.0f
enum SBAudioState {
  SBAudioState_Idle = 0,
  SBAudioState_Active = 1,
  SBAudioState_Dead = 2
};

enum SBAudioInitializer {
  SBAudioInit_Proximity = 0,
  SBAudioInit_Event = 1,
  SBAudioInit_Timer = 2
};

//  SBAudio_Base.UnTrigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ASBAudio_Base_eventUnTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


//  SBAudio_Base.Trigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ASBAudio_Base_eventTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


//  SBAudio_Base.AudioUntrigger 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct ASBAudio_Base_execAudioUntrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


//  SBAudio_Base.AudioTrigger 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct ASBAudio_Base_execAudioTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


// ASBAudio_Base 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT ASBAudio_Base : public AActor {
  public:
    FLOAT MaximumRadius;  // 420 1 CPF_Edit
    FLOAT HotspotFactor;  // 424 1 CPF_Edit
    BITFIELD AlwaysUseDefault : 1;  // 428 1 CPF_Edit
    class ASBInfluenceVolume* DefaultVolume;  // 42C 2000 CPF_Transient
    BYTE TriggeredOn;  // 430 1 CPF_Edit
    FLOAT TriggerTimer;  // 434 1 CPF_Edit
    FLOAT UnTriggerTimer;  // 438 1 CPF_Edit
    FLOAT CurrentTriggerTimer;  // 43C 2000 CPF_Transient
    TArray<FName> InfluenceVolumeTags;  // 440 400001 CPF_Edit CPF_NeedCtorLink
    TArray<class ASBInfluenceVolume*> InfluenceVolumes;  // 44C 402000 CPF_Transient CPF_NeedCtorLink
    BITFIELD ShowInfluenceBounds : 1;  // 458 1 CPF_Edit
    class AActor* LocalListener;  // 45C 2000 CPF_Transient
    class FBox InfluenceBoundingBox;  // 460 2000 CPF_Transient
    FLOAT TimeToNextUpdate;  // 47C 2002000 CPF_Transient CPF_EditorData
    FLOAT UpdateTimeDelta;  // 480 2002000 CPF_Transient CPF_EditorData
    BYTE CurrentState;  // 484 2000 CPF_Transient
    virtual ~ASBAudio_Base(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual int Tick(float,enum ELevelTick);
    virtual int ShouldDrawDebugInfo(void);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual void Update(float);
    virtual void UpdateActiveCount(void);
    virtual void Initialize(void);
    virtual bool EqualTo(class ASBAudio_Base *);
    virtual void StateBeginActions(void);
    ASBAudio_Base(class ASBAudio_Base const &);
    ASBAudio_Base(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBAudio_Base & operator=(class ASBAudio_Base const &);
    void AudioTrigger(class AActor *,class APawn *);
    void AudioUnTrigger(class AActor *,class APawn *);
    void BuildInfluenceBoundingBox(void);
    void BuildRenderData(void);
    void DestroyInfluenceList(void);
    class AActor * GetListener(void);
    float GetTotalInfluenceWeight(void);
    void GotoAudioState(enum SBAudioState,bool);
    bool HasInfluence(class FName &);
    bool InfluenceEncroached(void);
    void InitDefaultVolume(void);
    void InitInfluenceList(void);
    static void CDECL InternalConstructor(void *);
    bool IsActive(void);
    bool IsWaitingForTrigger(void);
    bool ListenerWithinBounds(void);
    int ShowBasicDebugInfo(void);
    static class UClass * CDECL StaticClass(void);
    void UpdateInfluenceList(void);
    void UpdateTimers(float);
    void execAudioTrigger(struct FFrame &,void * const);
    void execAudioUntrigger(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(ASBAudio_Base,0,execAudioTrigger)
AUTOGENERATE_FUNCTION(ASBAudio_Base,0,execAudioUntrigger)


//------------------------------------------------------------------------------
//  SBAudioPlayer
//------------------------------------------------------------------------------

enum AudioModifierType {
  Audio_VolumeModulator = 0
};

enum ESBTriggerBehaviour {
  SBTrigBehaviour_TimeDependant = 0,
  SBTrigBehaviour_Reset = 1,
  SBTrigBehaviour_None = 2
};

enum ESBSoundTimeOfDay {
  SoundTOD_Always = 0,
  SoundTOD_Day = 1,
  SoundTOD_Night = 2
};

// FSBPlayerActiveAudio 1 ( CLASS_Abstract )
struct DLL_IMPORT FSBPlayerActiveAudio {
  public:
    INT Index;  // 0 0
    INT TrackHandle;  // 4 0
    BITFIELD bPlaying : 1;  // 8 0
    struct FSBPlayerActiveAudio & operator=(struct FSBPlayerActiveAudio const &);
};

// FSBAudioModifierProps 1 ( CLASS_Abstract )
struct DLL_IMPORT FSBAudioModifierProps {
  public:
    BYTE ModifierType;  // 0 1 CPF_Edit
    BYTE ModulationShape;  // 1 1 CPF_Edit
    FLOAT ModulationTime;  // 4 1 CPF_Edit
    FLOAT ModulationTimeDelta;  // 8 1 CPF_Edit
    FLOAT ModulationTimeVariation;  // C 1 CPF_Edit
    FLOAT ModulationDamping;  // 10 1 CPF_Edit
    FLOAT ModulationDampingVariation;  // 14 1 CPF_Edit
    struct FSBAudioModifierProps & operator=(struct FSBAudioModifierProps const &);
};

// FSBExcludedAudio 1 ( CLASS_Abstract )
struct DLL_IMPORT FSBExcludedAudio {
  public:
    FName ActorName;  // 0 1 CPF_Edit
    BYTE AudioType;  // 4 1 CPF_Edit
    BITFIELD Excluded : 1;  // 8 2000 CPF_Transient
    FSBExcludedAudio(void);
    struct FSBExcludedAudio & operator=(struct FSBExcludedAudio const &);
};

// FSBSoundEditor 1 ( CLASS_Abstract )
struct DLL_IMPORT FSBSoundEditor {
  public:
    class FString OggFilename;  // 0 400001 CPF_Edit CPF_NeedCtorLink
    class USound* Sound;  // 8 1 CPF_Edit
    BYTE WhenPlayed;  // C 1 CPF_Edit
    FSBSoundEditor(struct FSBSoundEditor const &);
    FSBSoundEditor(void);
    ~FSBSoundEditor(void);
    struct FSBSoundEditor & operator=(struct FSBSoundEditor const &);
};

// FSBSound 1 ( CLASS_Abstract )
struct DLL_IMPORT FSBSound {
  public:
    class USound* Sound;  // 0 0
    FLOAT StartTime;  // 4 0
    FLOAT Duration;  // 8 0
    BITFIELD IsOgg : 1;  // C 0
    BYTE WhenPlayed;  // 10 0
    struct FSBSound & operator=(struct FSBSound const &);
};

// ASBAudioPlayer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASBAudioPlayer : public ASBAudio_Base {
  public:
    BYTE MaximumVolume;  // 488 1 CPF_Edit
    BITFIELD Looping : 1;  // 48C 1 CPF_Edit
    BITFIELD Locational : 1;  // 48C 1 CPF_Edit
    INT Pitch;  // 490 1 CPF_Edit
    BYTE AudioType;  // 494 1 CPF_Edit
    BYTE InitialTrigger;  // 495 1 CPF_Edit
    BYTE LaterTriggers;  // 496 1 CPF_Edit
    FLOAT TriggerFadeTime;  // 498 1 CPF_Edit
    FLOAT UnTriggerFadeTime;  // 49C 1 CPF_Edit
    TArray<struct FSBSoundEditor> Sounds;  // 4A0 400001 CPF_Edit CPF_NeedCtorLink
    TArray<struct FSBSound> CachedSounds;  // 4AC 402000 CPF_Transient CPF_NeedCtorLink
    BITFIELD bCachedSoundsDirty : 1;  // 4B8 2000 CPF_Transient
    BITFIELD bTriggeredOnce : 1;  // 4B8 2000 CPF_Transient
    BITFIELD bBaseVolumeCached : 1;  // 4B8 2000 CPF_Transient
    BITFIELD bPreventNewAudio : 1;  // 4B8 2000 CPF_Transient
    class FVector MeanLocation;  // 4BC 2000 CPF_Transient
    class USBAudioManager* AudioManager;  // 4C8 2000 CPF_Transient
    TArray<struct FSBAudioModifierProps> ModifierProperties;  // 4CC 400001 CPF_Edit CPF_NeedCtorLink
    TArray<class USBAudioModifier*> ModifierInstances;  // 4D8 402000 CPF_Transient CPF_NeedCtorLink
    FLOAT ActualPitch;  // 4E4 2000 CPF_Transient
    INT SoundFlags;  // 4E8 2000 CPF_Transient
    FLOAT ActualMaxVolume;  // 4EC 2000 CPF_Transient
    FLOAT CurrentVolume;  // 4F0 2000 CPF_Transient
    struct FSBPlayerActiveAudio DayAudio;  // 4F4 2000 CPF_Transient
    struct FSBPlayerActiveAudio NightAudio;  // 500 2000 CPF_Transient
    struct FSBPlayerActiveAudio IndependantAudio;  // 50C 2000 CPF_Transient
    BYTE mCachedTriggerType;  // 518 2000 CPF_Transient
    virtual ~ASBAudioPlayer(void);
    virtual void Destroy(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual void PostBeginPlay(void);
    virtual void SoundStopped(class USound *);
    virtual void Update(float);
    virtual void UpdateActiveCount(void);
    virtual void Initialize(void);
    virtual bool EqualTo(class ASBAudio_Base *);
    virtual void StateBeginActions(void);
    virtual void InitSoundFlags(struct FSBSound const &);
    virtual void InitSoundParameters(void);
    ASBAudioPlayer(class ASBAudioPlayer const &);
    ASBAudioPlayer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBAudioPlayer & operator=(class ASBAudioPlayer const &);
    bool AudioIsPlaying(struct FSBSound *);
    bool AudioShouldBePlaying(struct FSBSound *);
    void CheckAudioPrevention(void);
    void CheckModifierProperties(void);
    void CheckState(float);
    void CleanupCachedSounds(void);
    void CleanupModifiers(void);
    class USound * CreateOggSound(class FString &);
    struct FSBPlayerActiveAudio * GetActiveAudio(enum ESBSoundTimeOfDay);
    struct FSBSound * GetAudioAt(int);
    class USBAudioManager * GetAudioManager(void);
    float GetAudioSeekTime(struct FSBSound *);
    float GetLocationAndWeight(void);
    float GetSoundAmplitude(void);
    bool HasEqualModifier(struct FSBAudioModifierProps &);
    bool HasEqualSound(struct FSBSoundEditor &);
    bool HasTODSound(enum SBAM_DayNightPeriod);
    bool InitAudio(enum ESBSoundTimeOfDay);
    void InitCachedSounds(void);
    bool InitDayNightAudio(enum SBAM_DayNightPeriod);
    bool InitIndependantAudio(void);
    void InitModifiers(void);
    static void CDECL InternalConstructor(void *);
    bool PlayAudio(struct FSBSound *,struct FSBPlayerActiveAudio *);
    struct FSBSound * SelectAudio(enum ESBSoundTimeOfDay);
    void SetSoundLocation(int,class FVector &);
    void SetVolume(int,float);
    static class UClass * CDECL StaticClass(void);
    void Stop(void);
    void StopAudio(enum ESBSoundTimeOfDay);
    bool TimeFlagsCompatible(enum ESBSoundTimeOfDay,enum SBAM_DayNightPeriod);
    void UpdateActiveAudio(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBAudioDamper
//------------------------------------------------------------------------------

// FExemptActors 1 ( CLASS_Abstract )
struct DLL_IMPORT FExemptActors {
  public:
    FName ActorTagName;  // 0 1 CPF_Edit
    FExemptActors(void);
    struct FExemptActors & operator=(struct FExemptActors const &);
};

// FDamperInfo 1 ( CLASS_Abstract )
struct DLL_IMPORT FDamperInfo {
  public:
    BITFIELD Initialized : 1;  // 0 0
    INT FaderID;  // 4 0
    struct FDamperInfo & operator=(struct FDamperInfo const &);
};

// FAudioTypeDamper 1 ( CLASS_Abstract )
struct DLL_IMPORT FAudioTypeDamper {
  public:
    BYTE AudioType;  // 0 1 CPF_Edit
    struct FDamperInfo Info;  // 4 0
    struct FAudioTypeDamper & operator=(struct FAudioTypeDamper const &);
};

// FAudioNameDamper 1 ( CLASS_Abstract )
struct DLL_IMPORT FAudioNameDamper {
  public:
    FName ActorTagName;  // 0 1 CPF_Edit
    struct FDamperInfo Info;  // 4 0
    FAudioNameDamper(void);
    struct FAudioNameDamper & operator=(struct FAudioNameDamper const &);
};

// ASBAudioDamper 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASBAudioDamper : public ASBAudio_Base {
  public:
    FLOAT DampFactor;  // 488 1 CPF_Edit
    FLOAT TimeToDamp;  // 48C 1 CPF_Edit
    TArray<struct FAudioTypeDamper> AudioTypes;  // 490 400001 CPF_Edit CPF_NeedCtorLink
    TArray<struct FAudioNameDamper> ActorName;  // 49C 400001 CPF_Edit CPF_NeedCtorLink
    TArray<struct FExemptActors> Exemptions;  // 4A8 400001 CPF_Edit CPF_NeedCtorLink
    BITFIELD bIsDamping : 1;  // 4B4 2000 CPF_Transient
    virtual ~ASBAudioDamper(void);
    virtual void Destroy(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual void PostBeginPlay(void);
    virtual void Update(float);
    virtual void UpdateActiveCount(void);
    virtual bool EqualTo(class ASBAudio_Base *);
    ASBAudioDamper(class ASBAudioDamper const &);
    ASBAudioDamper(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBAudioDamper & operator=(class ASBAudioDamper const &);
    bool HasEqualActorDamper(struct FAudioNameDamper &);
    bool HasEqualExemption(struct FExemptActors &);
    bool HasEqualTypeDamper(struct FAudioTypeDamper &);
    void InitDamping(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StopDamping(void);
  private:
    void AddExemptions(class USBAudioManager &);
    void DampActors(class USBAudioManager &);
    void DampTypes(class USBAudioManager &);
    static class UClass PrivateStaticClass;
    void RemoveExemptions(class USBAudioManager &);
    void UndampActors(class USBAudioManager &);
    void UndampTypes(class USBAudioManager &);
};


//------------------------------------------------------------------------------
//  WildlifeCommandlet
//------------------------------------------------------------------------------

// UWildlifeCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UWildlifeCommandlet : public UCommandlet {
  public:
    char Unknown0[520];
    virtual ~UWildlifeCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UWildlifeCommandlet(class UWildlifeCommandlet const &);
    UWildlifeCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UWildlifeCommandlet & operator=(class UWildlifeCommandlet const &);
    void InitCommandlet(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SpawnGroupCommandlet
//------------------------------------------------------------------------------

// USpawnGroupCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT USpawnGroupCommandlet : public UCommandlet {
  public:
    char Unknown0[520];
    virtual ~USpawnGroupCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    USpawnGroupCommandlet(class USpawnGroupCommandlet const &);
    USpawnGroupCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USpawnGroupCommandlet & operator=(class USpawnGroupCommandlet const &);
    void InitCommandlet(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QuestImportCommandlet
//------------------------------------------------------------------------------

// UQuestImportCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UQuestImportCommandlet : public UCommandlet {
  public:
    char Unknown0[76];
};


//------------------------------------------------------------------------------
//  ObjectImExCommandlet
//------------------------------------------------------------------------------

// UObjectImExCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UObjectImExCommandlet : public UCommandlet {
  public:
    char Unknown0[120];
    virtual ~UObjectImExCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UObjectImExCommandlet(class UObjectImExCommandlet const &);
    UObjectImExCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UObjectImExCommandlet & operator=(class UObjectImExCommandlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  protected:
    void GetPackages(enum EPackageTypes,class std::vector<class UPackage *,class std::allocator<class UPackage *> > &);
    void InitCommandlet(void);
    void MarkPackageDirty(class UObject *);
    void SavePackages(class std::vector<class UPackage *,class std::allocator<class UPackage *> > &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  ItemEditCommandlet
//------------------------------------------------------------------------------

// UItemEditCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UItemEditCommandlet : public UCommandlet {
  public:
    char Unknown0[780];
    virtual ~UItemEditCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UItemEditCommandlet(class UItemEditCommandlet const &);
    UItemEditCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItemEditCommandlet & operator=(class UItemEditCommandlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  protected:
    bool AddAppearance(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    bool AddBodySlot(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    void AddBool(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,bool);
    bool AddBroken(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    bool AddConsumable(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    void AddEnum(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned char,class FString);
    bool AddEquipEffects(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    void AddFloat(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,float);
    void AddInt(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,int);
    void AddItem(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,class UItem_Type *);
    void AddLocalizedString(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,struct FLocalizedString);
    void AddName(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,class FName);
    void AddObject(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,class UObject *);
    bool AddRecipe(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    bool AddResource(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    void AddString(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,class FString);
    bool AddTokenItem(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    bool AddTokenSkill(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    bool AddTokenSlot(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    bool AddUse(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,class UItem_Type *);
    bool DoExport(void);
    void DoExportAndReset(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >);
    bool DoImport(void);
    void ExportHeader(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    bool ExportItem(class UItem_Type *);
    unsigned long GetBitfield(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &);
    unsigned char GetByte(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &);
    unsigned char GetEnum(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class FString);
    float GetFloat(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &);
    int GetInt(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &);
    bool GetItem(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *,class UItem_Type * &);
    enum EItemSets GetItemSet(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >);
    class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > GetItemSetFileName(enum EItemSets);
    bool GetPackages(void);
    bool ImportAppearance(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportBodySlot(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportBroken(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportConsumable(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportEquipEffects(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportItem(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &);
    bool ImportRecipe(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportResource(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportTokenItem(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportTokenSkill(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportTokenSlot(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    bool ImportUse(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,class UItem_Type *);
    void InitCommandlet(void);
    void LoadAllPackages(void);
    void MarkPackageDirty(class UObject *);
    void SavePackages(void);
    void SetLocalizedString(class std::deque<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &,struct FLocalizedString &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  ItemDoubleNameCheckCommandlet
//------------------------------------------------------------------------------

// UItemDoubleNameCheckCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UItemDoubleNameCheckCommandlet : public UCommandlet {
  public:
    virtual ~UItemDoubleNameCheckCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UItemDoubleNameCheckCommandlet(class UItemDoubleNameCheckCommandlet const &);
    UItemDoubleNameCheckCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItemDoubleNameCheckCommandlet & operator=(class UItemDoubleNameCheckCommandlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AppToItemCommandlet
//------------------------------------------------------------------------------

// UAppToItemCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UAppToItemCommandlet : public UCommandlet {
  public:
    virtual ~UAppToItemCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UAppToItemCommandlet(class UAppToItemCommandlet const &);
    UAppToItemCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAppToItemCommandlet & operator=(class UAppToItemCommandlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QuestAnalyzeCommandlet
//------------------------------------------------------------------------------

// UQuestAnalyzeCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UQuestAnalyzeCommandlet : public UCommandlet {
  public:
    char Unknown0[52];
    virtual ~UQuestAnalyzeCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UQuestAnalyzeCommandlet(class UQuestAnalyzeCommandlet const &);
    UQuestAnalyzeCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQuestAnalyzeCommandlet & operator=(class UQuestAnalyzeCommandlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    void AnalyzeObjectives(void);
    void AnalyzeQuestpoints(void);
    bool Initialize(unsigned short const *);
    bool OpenQuests(void);
    bool WriteTable(class std::map<class FString,float,struct my_first_less<class FString>,class std::allocator<struct std::pair<class FString const ,float> > > const &,class FString);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBInfluenceVolume
//------------------------------------------------------------------------------

#define UCONST_SBInfluenceVolume_SBVOLUME_MIN_DIMENSION  0.0001f
enum SBInfluence_Falloff {
  SBIF_Linear = 0,
  SBIF_InvSquare = 1,
  SBIF_Logarithmic = 2
};

//  SBInfluenceVolume.GetInfluenceWeight 20400 0 ( FUNC_Native FUNC_Public )
struct ASBInfluenceVolume_execGetInfluenceWeight_Parms {
  class FVector positionToCheck;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// ASBInfluenceVolume 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT ASBInfluenceVolume : public AActor {
  public:
    BYTE InfluenceFalloff;  // 420 1 CPF_Edit
    INT NrRenderedSides;  // 424 1 CPF_Edit
    class FBox BoundingBox;  // 428 2000 CPF_Transient
    INT HighlightCount;  // 444 2000 CPF_Transient
    INT ShowDebugCount;  // 448 2000 CPF_Transient
    INT OverlapCount;  // 44C 2000 CPF_Transient
    class FVector LastCheckPosition;  // 450 2000 CPF_Transient
    FLOAT CachedInfluenceWeight;  // 45C 2000 CPF_Transient
    class FVector CachedInfluenceLocation;  // 460 2000 CPF_Transient
    virtual ~ASBInfluenceVolume(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual int ShouldDrawDebugInfo(void);
    virtual void PostBeginPlay(void);
    virtual void InitParameters(void);
    virtual void BuildRenderData(void);
    virtual bool IsEncroachedBy(class FVector const &);
  protected:
    virtual void CalculateInfluenceParams(class FVector const &,bool);
  public:
    ASBInfluenceVolume(class ASBInfluenceVolume const &);
    ASBInfluenceVolume(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBInfluenceVolume & operator=(class ASBInfluenceVolume const &);
    void AdjustOverlapCount(int);
    void GetBoundingBox(class FBox &);
    class FVector GetInfluenceLocation(class FVector const &);
    float GetInfluenceWeight(class FVector const &);
    void InitBoundingBox(void);
    static void CDECL InternalConstructor(void *);
    void RequestDebugInfo(bool);
    void ResetOverlapCount(void);
    static class UClass * CDECL StaticClass(void);
    void execGetInfluenceWeight(struct FFrame &,void * const);
  protected:
    float GetAdjustedFalloff(float);
    bool ShouldUpdateInfluenceParams(class FVector const &);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(ASBInfluenceVolume,0,execGetInfluenceWeight)


//------------------------------------------------------------------------------
//  SBInfluenceSphere
//------------------------------------------------------------------------------

// ASBInfluenceSphere 1212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_EditInlineNew )
class DLL_IMPORT ASBInfluenceSphere : public ASBInfluenceVolume {
  public:
    FLOAT MaximumRadius;  // 46C 1 CPF_Edit
    FLOAT HotspotFactor;  // 470 1 CPF_Edit
    FLOAT HsRadiusSquared;  // 474 2000 CPF_Transient
    FLOAT MaxRadiusSquared;  // 478 2000 CPF_Transient
    FLOAT InvFadeDistanceSqr;  // 47C 2000 CPF_Transient
    virtual ~ASBInfluenceSphere(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual void InitParameters(void);
    virtual void BuildRenderData(void);
    virtual bool IsEncroachedBy(class FVector const &);
  private:
    virtual void CalculateInfluenceParams(class FVector const &,bool);
  public:
    ASBInfluenceSphere(class ASBInfluenceSphere const &);
    ASBInfluenceSphere(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBInfluenceSphere & operator=(class ASBInfluenceSphere const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBInfluenceDoughnut
//------------------------------------------------------------------------------

// ASBInfluenceDoughnut 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASBInfluenceDoughnut : public ASBInfluenceVolume {
  public:
    FLOAT DoughnutRadius;  // 46C 1 CPF_Edit
    FLOAT MaximumRadius;  // 470 1 CPF_Edit
    FLOAT HotspotFactor;  // 474 1 CPF_Edit
    FLOAT HsRadiusSquared;  // 478 2000 CPF_Transient
    FLOAT MaxRadiusSquared;  // 47C 2000 CPF_Transient
    FLOAT InvFactor;  // 480 2000 CPF_Transient
    FLOAT DoughnutRadiusSquared;  // 484 2000 CPF_Transient
    class FVector planeNormal;  // 488 2000 CPF_Transient
    virtual ~ASBInfluenceDoughnut(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual void InitParameters(void);
    virtual void BuildRenderData(void);
    virtual bool IsEncroachedBy(class FVector const &);
  private:
    virtual void CalculateInfluenceParams(class FVector const &,bool);
  public:
    ASBInfluenceDoughnut(class ASBInfluenceDoughnut const &);
    ASBInfluenceDoughnut(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBInfluenceDoughnut & operator=(class ASBInfluenceDoughnut const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBInfluenceCapsule
//------------------------------------------------------------------------------

// ASBInfluenceCapsule 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASBInfluenceCapsule : public ASBInfluenceVolume {
  public:
    FLOAT MaximumRadius;  // 46C 1 CPF_Edit
    FLOAT AxisLength;  // 470 1 CPF_Edit
    FLOAT HotspotFactor;  // 474 1 CPF_Edit
    FLOAT HsRadiusSquared;  // 478 2000 CPF_Transient
    FLOAT MaxRadiusSquared;  // 47C 2000 CPF_Transient
    class FVector AxisVector;  // 480 2000 CPF_Transient
    class FVector AxisVectorStart;  // 48C 2000 CPF_Transient
    FLOAT InvFactor;  // 498 2000 CPF_Transient
    virtual ~ASBInfluenceCapsule(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual void InitParameters(void);
    virtual void BuildRenderData(void);
    virtual bool IsEncroachedBy(class FVector const &);
  private:
    virtual void CalculateInfluenceParams(class FVector const &,bool);
  public:
    ASBInfluenceCapsule(class ASBInfluenceCapsule const &);
    ASBInfluenceCapsule(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBInfluenceCapsule & operator=(class ASBInfluenceCapsule const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Scenario
//------------------------------------------------------------------------------

//  Scenario.ForwardEvents 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UScenario_eventForwardEvents_Parms {
  class AActor* anActor;  // 0 80 CPF_Parm
};


//  Scenario.VerifyRequirements 20002 0 ( FUNC_Defined FUNC_Public )
struct UScenario_execVerifyRequirements_Parms {
  class AGame_Pawn* aContextPawn;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Scenario.CollectActors 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UScenario_execCollectActors_Parms {
  class AActor* anActor;  // 0 80 CPF_Parm
};


// UScenario 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UScenario : public UContent_Type {
  public:
    TArray<class AActor*> mParticipants;  // 30 402000 CPF_Transient CPF_NeedCtorLink
    class AActor* mOwner;  // 3C 2000 CPF_Transient
    TArray<class UContent_Requirement*> Requirements;  // 40 400001 CPF_Edit CPF_NeedCtorLink
    TArray<FName> ParticipantTags;  // 4C 400001 CPF_Edit CPF_NeedCtorLink
    virtual ~UScenario(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    UScenario(class UScenario const &);
    UScenario(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UScenario & operator=(class UScenario const &);
    void CollectActors(class AActor *);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventForwardEvents(class AActor *);
    void execCollectActors(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UScenario,0,execCollectActors)


//------------------------------------------------------------------------------
//  ScenarioManager
//------------------------------------------------------------------------------

// FEditorVisibilityInfoStruct 0 ( )
struct DLL_IMPORT FEditorVisibilityInfoStruct {
  public:
    class AActor* anActor;  // 0 0
    BITFIELD IsVisible : 1;  // 4 0
    struct FEditorVisibilityInfoStruct & operator=(struct FEditorVisibilityInfoStruct const &);
};

//  ScenarioManager.StartScenario 20002 0 ( FUNC_Defined FUNC_Public )
struct AScenarioManager_execStartScenario_Parms {
  class FString aScenarioName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aPawn;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// AScenarioManager 4212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT AScenarioManager : public AActor {
  public:
    TArray<struct FEditorVisibilityInfoStruct> mVisibilityInfo;  // 420 402000 CPF_Transient CPF_NeedCtorLink
    class UScenario* mScenarioInUse;  // 42C 4402008 CPF_ExportObject CPF_Transient CPF_NeedCtorLink CPF_EditInline
    BITFIELD mHasTriggered : 1;  // 430 0
    class UScenario* CurrentScenario;  // 434 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    BITFIELD TriggerOnLevelStart : 1;  // 438 1 CPF_Edit
    virtual ~AScenarioManager(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual void DrawDebugInfo(class FRenderInterface *);
    AScenarioManager(class AScenarioManager const &);
    AScenarioManager(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AScenarioManager & operator=(class AScenarioManager const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPCHackCommandlet
//------------------------------------------------------------------------------

// UNPCHackCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UNPCHackCommandlet : public UCommandlet {
  public:
    virtual ~UNPCHackCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UNPCHackCommandlet(class UNPCHackCommandlet const &);
    UNPCHackCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPCHackCommandlet & operator=(class UNPCHackCommandlet const &);
    void InitCommandlet(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AnnotationTriggerable
//------------------------------------------------------------------------------

//  AnnotationTriggerable.UnTrigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAnnotationTriggerable_eventUnTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


//  AnnotationTriggerable.Trigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAnnotationTriggerable_eventTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


// AAnnotationTriggerable 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAnnotationTriggerable : public AAnnotationActor {
  public:
    BITFIELD Passable : 1;  // 45C 2000001 CPF_Edit CPF_EditorData
    virtual ~AAnnotationTriggerable(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool CanPass(class AGame_Pawn *);
    AAnnotationTriggerable(class AAnnotationTriggerable const &);
    AAnnotationTriggerable(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AAnnotationTriggerable & operator=(class AAnnotationTriggerable const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CCom_Help
//------------------------------------------------------------------------------

//  CCom_Help.Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UCCom_Help_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_Help 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_Help : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_Help(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_Help(class UCCom_Help const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_Help & operator=(class UCCom_Help const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UCCom_Help(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CCom_FriendIgnore
//------------------------------------------------------------------------------

//  CCom_FriendIgnore.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_FriendIgnore_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_FriendIgnore 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_FriendIgnore : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_FriendIgnore(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_FriendIgnore(class UCCom_FriendIgnore const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_FriendIgnore & operator=(class UCCom_FriendIgnore const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_FriendIgnore(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_FriendIgnore,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_FriendInvite
//------------------------------------------------------------------------------

//  CCom_FriendInvite.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_FriendInvite_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_FriendInvite 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_FriendInvite : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_FriendInvite(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_FriendInvite(class UCCom_FriendInvite const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_FriendInvite & operator=(class UCCom_FriendInvite const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_FriendInvite(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_FriendInvite,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_TeamLeave
//------------------------------------------------------------------------------

//  CCom_TeamLeave.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_TeamLeave_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_TeamLeave 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_TeamLeave : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_TeamLeave(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_TeamLeave(class UCCom_TeamLeave const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_TeamLeave & operator=(class UCCom_TeamLeave const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_TeamLeave(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_TeamLeave,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_TeamDisband
//------------------------------------------------------------------------------

//  CCom_TeamDisband.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_TeamDisband_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_TeamDisband 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_TeamDisband : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_TeamDisband(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_TeamDisband(class UCCom_TeamDisband const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_TeamDisband & operator=(class UCCom_TeamDisband const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_TeamDisband(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_TeamDisband,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_TeamKick
//------------------------------------------------------------------------------

//  CCom_TeamKick.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_TeamKick_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_TeamKick 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_TeamKick : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_TeamKick(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_TeamKick(class UCCom_TeamKick const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_TeamKick & operator=(class UCCom_TeamKick const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_TeamKick(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_TeamKick,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_TeamInvite
//------------------------------------------------------------------------------

//  CCom_TeamInvite.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_TeamInvite_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_TeamInvite 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_TeamInvite : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_TeamInvite(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_TeamInvite(class UCCom_TeamInvite const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_TeamInvite & operator=(class UCCom_TeamInvite const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_TeamInvite(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_TeamInvite,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_GuildLeave
//------------------------------------------------------------------------------

//  CCom_GuildLeave.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_GuildLeave_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_GuildLeave 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_GuildLeave : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_GuildLeave(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_GuildLeave(class UCCom_GuildLeave const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_GuildLeave & operator=(class UCCom_GuildLeave const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_GuildLeave(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_GuildLeave,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_GuildDisband
//------------------------------------------------------------------------------

//  CCom_GuildDisband.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_GuildDisband_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_GuildDisband 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_GuildDisband : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_GuildDisband(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_GuildDisband(class UCCom_GuildDisband const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_GuildDisband & operator=(class UCCom_GuildDisband const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_GuildDisband(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_GuildDisband,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_GuildKick
//------------------------------------------------------------------------------

//  CCom_GuildKick.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_GuildKick_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_GuildKick 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_GuildKick : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_GuildKick(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_GuildKick(class UCCom_GuildKick const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_GuildKick & operator=(class UCCom_GuildKick const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_GuildKick(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_GuildKick,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_GuildInvite
//------------------------------------------------------------------------------

//  CCom_GuildInvite.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_GuildInvite_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_GuildInvite 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_GuildInvite : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_GuildInvite(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_GuildInvite(class UCCom_GuildInvite const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_GuildInvite & operator=(class UCCom_GuildInvite const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_GuildInvite(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_GuildInvite,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_Unstuck
//------------------------------------------------------------------------------

//  CCom_Unstuck.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_Unstuck_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_Unstuck 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_Unstuck : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_Unstuck(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_Unstuck(class UCCom_Unstuck const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_Unstuck & operator=(class UCCom_Unstuck const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_Unstuck(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_Unstuck,0,execExecute)


//------------------------------------------------------------------------------
//  CCom_Location
//------------------------------------------------------------------------------

//  CCom_Location.Execute 20400 0 ( FUNC_Native FUNC_Public )
struct UCCom_Location_execExecute_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  TArray<class FString> Params;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_Pawn* aTarget;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCCom_Location 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCCom_Location : public UGame_ConsoleCommand {
  public:
    virtual ~UCCom_Location(void);
    virtual unsigned int GetCPPSize(void);
    UCCom_Location(class UCCom_Location const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCCom_Location & operator=(class UCCom_Location const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execExecute(struct FFrame &,void * const);
  protected:
    UCCom_Location(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UCCom_Location,0,execExecute)


//------------------------------------------------------------------------------
//  WR_Wood
//------------------------------------------------------------------------------

// AWR_Wood 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWR_Wood : public AWorldResource {
  public:
    virtual ~AWR_Wood(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AWR_Wood(class AWR_Wood const &);
    AWR_Wood(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AWR_Wood & operator=(class AWR_Wood const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_WR_WOOD_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_WR_WOOD_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  WR_Stone
//------------------------------------------------------------------------------

// AWR_Stone 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWR_Stone : public AWorldResource {
  public:
    virtual ~AWR_Stone(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AWR_Stone(class AWR_Stone const &);
    AWR_Stone(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AWR_Stone & operator=(class AWR_Stone const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_WR_STONE_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_WR_STONE_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  WR_Flower
//------------------------------------------------------------------------------

// AWR_Flower 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWR_Flower : public AWorldResource {
  public:
    virtual ~AWR_Flower(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AWR_Flower(class AWR_Flower const &);
    AWR_Flower(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AWR_Flower & operator=(class AWR_Flower const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_WR_FLOWER_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_WR_FLOWER_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  WR_Gem
//------------------------------------------------------------------------------

// AWR_Gem 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWR_Gem : public AWorldResource {
  public:
    virtual ~AWR_Gem(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AWR_Gem(class AWR_Gem const &);
    AWR_Gem(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AWR_Gem & operator=(class AWR_Gem const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_WR_GEM_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_WR_GEM_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  WR_Metal
//------------------------------------------------------------------------------

// AWR_Metal 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWR_Metal : public AWorldResource {
  public:
    virtual ~AWR_Metal(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AWR_Metal(class AWR_Metal const &);
    AWR_Metal(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AWR_Metal & operator=(class AWR_Metal const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_WR_METAL_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_WR_METAL_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Progress
//------------------------------------------------------------------------------

//  Interaction_Progress.ClOnCancel 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Progress_execClOnCancel_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
};


//  Interaction_Progress.ClOnEnd 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Progress_execClOnEnd_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Progress.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Progress_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Progress.SvOnCancel 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Progress_execSvOnCancel_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
};


//  Interaction_Progress.SvOnEnd 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Progress_execSvOnEnd_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Progress.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Progress_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Progress 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Progress : public UInteraction_Component {
  public:
    class FString AnimationName;  // 2C 400001 CPF_Edit CPF_NeedCtorLink
    FLOAT speed;  // 34 3 CPF_Edit CPF_Const
    class UStaticMesh* Tool;  // 38 16000001 CPF_Edit CPF_EditorData CPF_EditInline CPF_Unk_10000000
    FLOAT ProgressSeconds;  // 3C 1 CPF_Edit
    FLOAT mTimer;  // 40 2000 CPF_Transient
    BITFIELD mAborted : 1;  // 44 2000 CPF_Transient
    class AGame_PlayerPawn* mInstigatorPawn;  // 48 2000 CPF_Transient
    class FVector mLocation;  // 4C 2002000 CPF_Transient CPF_EditorData
    FLOAT mHealth;  // 58 2002000 CPF_Transient CPF_EditorData
    BITFIELD mIsShifted : 1;  // 5C 2002000 CPF_Transient CPF_EditorData
    INT mActiveSkillsNum;  // 60 2002000 CPF_Transient CPF_EditorData
    FName mAttachmentName;  // 64 2000 CPF_Transient
    virtual ~UInteraction_Progress(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool SvOnUpdate(class AActor *,class AGame_Pawn *,float,bool);
    UInteraction_Progress(class UInteraction_Progress const &);
    UInteraction_Progress(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Progress & operator=(class UInteraction_Progress const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Attach
//------------------------------------------------------------------------------

//  Interaction_Attach.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Attach_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Attach.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Attach_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Attach 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Attach : public UInteraction_Component {
  public:
    class UStaticMesh* Attachment;  // 2C 1 CPF_Edit
    class FString Bone;  // 30 400001 CPF_Edit CPF_NeedCtorLink
    class FVector Offset;  // 38 1 CPF_Edit
    class FRotator Orientation;  // 44 1 CPF_Edit
    FName AttachmentName;  // 50 2000 CPF_Transient
    virtual ~UInteraction_Attach(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Attach(class UInteraction_Attach const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Attach & operator=(class UInteraction_Attach const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Attach(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Sound
//------------------------------------------------------------------------------

//  Interaction_Sound.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Sound_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Sound.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Sound_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Sound 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Sound : public UInteraction_Component {
  public:
    class USound* Sound;  // 2C 1 CPF_Edit
    virtual ~UInteraction_Sound(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Sound(class UInteraction_Sound const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Sound & operator=(class UInteraction_Sound const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Sound(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_ChangeMesh
//------------------------------------------------------------------------------

//  Interaction_ChangeMesh.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_ChangeMesh_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_ChangeMesh.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_ChangeMesh_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_ChangeMesh 1012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew )
class DLL_IMPORT UInteraction_ChangeMesh : public UInteraction_Component {
  public:
    class UStaticMesh* Mesh;  // 2C 1 CPF_Edit
    class UStaticMesh* originalMesh;  // 30 2000 CPF_Transient
    virtual ~UInteraction_ChangeMesh(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_ChangeMesh(class UInteraction_ChangeMesh const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_ChangeMesh & operator=(class UInteraction_ChangeMesh const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_ChangeMesh(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Move
//------------------------------------------------------------------------------

//  Interaction_Move.ClOnEnd 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Move_execClOnEnd_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Move.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Move_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Move.SvOnEnd 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Move_execSvOnEnd_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Move.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Move_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 90 CPF_OptionalParm CPF_Parm
};


// UInteraction_Move 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Move : public UInteraction_Component {
  public:
    class FVector Movement;  // 2C 3 CPF_Edit CPF_Const
    class FRotator Rotation;  // 38 3 CPF_Edit CPF_Const
    FLOAT TimeSec;  // 44 3 CPF_Edit CPF_Const
    class FVector OriginalPosition;  // 48 2000 CPF_Transient
    class FRotator OriginalOrientation;  // 54 2000 CPF_Transient
    FLOAT mTimer;  // 60 2000 CPF_Transient
    virtual ~UInteraction_Move(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool SvOnUpdate(class AActor *,class AGame_Pawn *,float,bool);
    UInteraction_Move(class UInteraction_Move const &);
    UInteraction_Move(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Move & operator=(class UInteraction_Move const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_EffectOff
//------------------------------------------------------------------------------

//  Interaction_EffectOff.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_EffectOff_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_EffectOff.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_EffectOff_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_EffectOff 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_EffectOff : public UInteraction_Component {
  public:
    FName EffectTag;  // 2C 1 CPF_Edit
    virtual ~UInteraction_EffectOff(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_EffectOff(class UInteraction_EffectOff const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_EffectOff & operator=(class UInteraction_EffectOff const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_EffectOff(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_EffectOn
//------------------------------------------------------------------------------

//  Interaction_EffectOn.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_EffectOn_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_EffectOn.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_EffectOn_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_EffectOn 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_EffectOn : public UInteraction_Component {
  public:
    FName EffectTag;  // 2C 1 CPF_Edit
    TArray<class UFSkill_EffectClass_AudioVisual*> Effects;  // 30 14400001 CPF_Edit CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UInteraction_EffectOn(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_EffectOn(class UInteraction_EffectOn const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_EffectOn & operator=(class UInteraction_EffectOn const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_EffectOn(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Quest
//------------------------------------------------------------------------------

//  Interaction_Quest.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Quest_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Quest 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Quest : public UInteraction_Component {
  public:
    virtual ~UInteraction_Quest(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Quest(class UInteraction_Quest const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Quest & operator=(class UInteraction_Quest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Quest(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Shop
//------------------------------------------------------------------------------

//  Interaction_Shop.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Shop_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Shop 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Shop : public UInteraction_Component {
  public:
    class UShop_Base* Shop;  // 2C 1 CPF_Edit
    BYTE ShopOption;  // 30 1 CPF_Edit
    virtual ~UInteraction_Shop(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Shop(class UInteraction_Shop const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Shop & operator=(class UInteraction_Shop const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Shop(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Teleport
//------------------------------------------------------------------------------

//  Interaction_Teleport.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Teleport_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Teleport 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Teleport : public UInteraction_Component {
  public:
    INT DestinationWorld;  // 2C 1 CPF_Edit
    class FString Parameter;  // 30 400001 CPF_Edit CPF_NeedCtorLink
    BITFIELD IsInstance : 1;  // 38 1 CPF_Edit
    virtual ~UInteraction_Teleport(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Teleport(class UInteraction_Teleport const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Teleport & operator=(class UInteraction_Teleport const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Teleport(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Sit
//------------------------------------------------------------------------------

//  Interaction_Sit.SvOnCancel 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Sit_execSvOnCancel_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
};


//  Interaction_Sit.SvOnEnd 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Sit_execSvOnEnd_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Sit.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Sit_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 90 CPF_OptionalParm CPF_Parm
};


// UInteraction_Sit 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Sit : public UInteraction_Component {
  public:
    FLOAT mSitTimer;  // 2C 2000 CPF_Transient
    virtual ~UInteraction_Sit(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool SvOnUpdate(class AActor *,class AGame_Pawn *,float,bool);
    UInteraction_Sit(class UInteraction_Sit const &);
    UInteraction_Sit(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Sit & operator=(class UInteraction_Sit const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_ShowTutorial
//------------------------------------------------------------------------------

//  Interaction_ShowTutorial.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_ShowTutorial_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_ShowTutorial 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_ShowTutorial : public UInteraction_Component {
  public:
    class UHelp_Article* Article;  // 2C 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UInteraction_ShowTutorial(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_ShowTutorial(class UInteraction_ShowTutorial const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_ShowTutorial & operator=(class UInteraction_ShowTutorial const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_ShowTutorial(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Show
//------------------------------------------------------------------------------

//  Interaction_Show.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Show_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Show 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Show : public UInteraction_Component {
  public:
    BITFIELD Show : 1;  // 2C 1 CPF_Edit
    virtual ~UInteraction_Show(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Show(class UInteraction_Show const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Show & operator=(class UInteraction_Show const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Show(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_RotateToFace
//------------------------------------------------------------------------------

//  Interaction_RotateToFace.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_RotateToFace_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_RotateToFace 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_RotateToFace : public UInteraction_Component {
  public:
    class FRotator OriginalOrientation;  // 2C 2000 CPF_Transient
    virtual ~UInteraction_RotateToFace(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_RotateToFace(class UInteraction_RotateToFace const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_RotateToFace & operator=(class UInteraction_RotateToFace const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_RotateToFace(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_RandomTimer
//------------------------------------------------------------------------------

//  Interaction_RandomTimer.SvOnCancel 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_RandomTimer_execSvOnCancel_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
};


//  Interaction_RandomTimer.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_RandomTimer_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_RandomTimer 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_RandomTimer : public UInteraction_Component {
  public:
    class FRange RangeSeconds;  // 2C 1 CPF_Edit
    FLOAT mTimer;  // 34 2000 CPF_Transient
    virtual ~UInteraction_RandomTimer(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool SvOnUpdate(class AActor *,class AGame_Pawn *,float,bool);
    UInteraction_RandomTimer(class UInteraction_RandomTimer const &);
    UInteraction_RandomTimer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_RandomTimer & operator=(class UInteraction_RandomTimer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_TeleportToPosition
//------------------------------------------------------------------------------

//  Interaction_TeleportToPosition.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_TeleportToPosition_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_TeleportToPosition 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_TeleportToPosition : public UInteraction_Component {
  public:
    class FVector originalLocation;  // 2C 2000 CPF_Transient
    class FRotator OriginalOrientation;  // 38 2000 CPF_Transient
    virtual ~UInteraction_TeleportToPosition(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_TeleportToPosition(class UInteraction_TeleportToPosition const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_TeleportToPosition & operator=(class UInteraction_TeleportToPosition const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_TeleportToPosition(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Mailbox
//------------------------------------------------------------------------------

//  Interaction_Mailbox.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Mailbox_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Mailbox.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Mailbox_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Mailbox 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Mailbox : public UInteraction_Component {
  public:
    virtual ~UInteraction_Mailbox(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Mailbox(class UInteraction_Mailbox const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Mailbox & operator=(class UInteraction_Mailbox const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Mailbox(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Loot
//------------------------------------------------------------------------------

//  Interaction_Loot.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Loot_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Loot 1012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew )
class DLL_IMPORT UInteraction_Loot : public UInteraction_Component {
  public:
    class ULootTable* AcquireItem;  // 2C 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    FLOAT LootTimerLimit;  // 30 1 CPF_Edit
    virtual ~UInteraction_Loot(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Loot(class UInteraction_Loot const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Loot & operator=(class UInteraction_Loot const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Loot(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Freeze
//------------------------------------------------------------------------------

//  Interaction_Freeze.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Freeze_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Freeze.DoFreeze 80002 0 ( FUNC_Defined FUNC_Protected )
struct UInteraction_Freeze_execDoFreeze_Parms {
  class AGame_Pawn* aInstigator;  // 0 80 CPF_Parm
  BITFIELD aFreeze : 1;  // 4 80 CPF_Parm
};


// UInteraction_Freeze 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Freeze : public UInteraction_Component {
  public:
    BITFIELD Freeze : 1;  // 2C 2000001 CPF_Edit CPF_EditorData
    BITFIELD FreezeMovement : 1;  // 2C 1 CPF_Edit
    BITFIELD FreezeRotation : 1;  // 2C 1 CPF_Edit
    BITFIELD FreezeAnimation : 1;  // 2C 1 CPF_Edit
    virtual ~UInteraction_Freeze(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Freeze(class UInteraction_Freeze const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Freeze & operator=(class UInteraction_Freeze const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Freeze(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Unevent
//------------------------------------------------------------------------------

//  Interaction_Unevent.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Unevent_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Unevent 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Unevent : public UInteraction_Component {
  public:
    FName EventTag;  // 2C 1 CPF_Edit
    virtual ~UInteraction_Unevent(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UInteraction_Unevent(class UInteraction_Unevent const &);
    UInteraction_Unevent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Unevent & operator=(class UInteraction_Unevent const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Event
//------------------------------------------------------------------------------

//  Interaction_Event.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Event_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Event 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Event : public UInteraction_Component {
  public:
    FName EventTag;  // 2C 1 CPF_Edit
    virtual ~UInteraction_Event(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UInteraction_Event(class UInteraction_Event const &);
    UInteraction_Event(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Event & operator=(class UInteraction_Event const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_EnableCollision
//------------------------------------------------------------------------------

//  Interaction_EnableCollision.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_EnableCollision_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_EnableCollision 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_EnableCollision : public UInteraction_Component {
  public:
    BITFIELD EnableCollision : 1;  // 2C 1 CPF_Edit
    virtual ~UInteraction_EnableCollision(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_EnableCollision(class UInteraction_EnableCollision const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_EnableCollision & operator=(class UInteraction_EnableCollision const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_EnableCollision(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Enable
//------------------------------------------------------------------------------

//  Interaction_Enable.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Enable_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 90 CPF_OptionalParm CPF_Parm
};


// UInteraction_Enable 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Enable : public UInteraction_Component {
  public:
    BITFIELD Enabled : 1;  // 2C 1 CPF_Edit
    virtual ~UInteraction_Enable(void);
    virtual unsigned int GetCPPSize(void);
    UInteraction_Enable(class UInteraction_Enable const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Enable & operator=(class UInteraction_Enable const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UInteraction_Enable(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Animation
//------------------------------------------------------------------------------

//  Interaction_Animation.ClOnEnd 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Animation_execClOnEnd_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Animation.ClOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Animation_execClOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Animation.SvOnEnd 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Animation_execSvOnEnd_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


//  Interaction_Animation.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Animation_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Animation 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Animation : public UInteraction_Component {
  public:
    class FString animName;  // 2C 400003 CPF_Edit CPF_Const CPF_NeedCtorLink
    FLOAT LoopDuration;  // 34 3 CPF_Edit CPF_Const
    FLOAT speed;  // 38 3 CPF_Edit CPF_Const
    FLOAT mTimer;  // 3C 2000 CPF_Transient
    virtual ~UInteraction_Animation(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool SvOnUpdate(class AActor *,class AGame_Pawn *,float,bool);
    UInteraction_Animation(class UInteraction_Animation const &);
    UInteraction_Animation(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Animation & operator=(class UInteraction_Animation const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Action
//------------------------------------------------------------------------------

//  Interaction_Action.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Action_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Action 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Action : public UInteraction_Component {
  public:
    TArray<class UContent_Event*> Actions;  // 2C 14400001 CPF_Edit CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UInteraction_Action(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UInteraction_Action(class UInteraction_Action const &);
    UInteraction_Action(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Action & operator=(class UInteraction_Action const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_Rotate
//------------------------------------------------------------------------------

//  Interaction_Rotate.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_Rotate_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_Rotate 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_Rotate : public UInteraction_Component {
  public:
    class FRotator OriginalOrientation;  // 2C 2000 CPF_Transient
    virtual ~UInteraction_Rotate(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool SvOnUpdate(class AActor *,class AGame_Pawn *,float,bool);
    UInteraction_Rotate(class UInteraction_Rotate const &);
    UInteraction_Rotate(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_Rotate & operator=(class UInteraction_Rotate const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Interaction_MovePlayer
//------------------------------------------------------------------------------

//  Interaction_MovePlayer.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_MovePlayer_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_MovePlayer 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_MovePlayer : public UInteraction_Component {
  public:
    FLOAT DistanceBeforeSnap;  // 2C 1 CPF_Edit
    class FVector mOriginalLocation;  // 30 2000 CPF_Transient
    class FVector mTargetLocation;  // 3C 2000 CPF_Transient
    virtual ~UInteraction_MovePlayer(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool SvOnUpdate(class AActor *,class AGame_Pawn *,float,bool);
    UInteraction_MovePlayer(class UInteraction_MovePlayer const &);
    UInteraction_MovePlayer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UInteraction_MovePlayer & operator=(class UInteraction_MovePlayer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  TooltipActor
//------------------------------------------------------------------------------

//  TooltipActor.GetTooltipText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ATooltipActor_eventGetTooltipText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// ATooltipActor 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATooltipActor : public AActor {
  public:
    struct FLocalizedString mTooltipText;  // 420 400001 CPF_Edit CPF_NeedCtorLink
    virtual ~ATooltipActor(void);
    virtual unsigned int GetCPPSize(void);
    ATooltipActor(class ATooltipActor const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ATooltipActor & operator=(class ATooltipActor const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    class FString eventGetTooltipText(void);
  protected:
    ATooltipActor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  InteractiveShop
//------------------------------------------------------------------------------

//  InteractiveShop.RadialMenuSelect 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveShop_eventRadialMenuSelect_Parms {
  class APawn* aPlayerPawn;  // 0 80 CPF_Parm
  BYTE aMainOption;  // 4 80 CPF_Parm
  BYTE aSubOption;  // 5 80 CPF_Parm
};


//  InteractiveShop.cl_GetToolTip 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveShop_eventcl_GetToolTip_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// AInteractiveShop 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInteractiveShop : public AInteractiveLevelElement {
  public:
    class UShop_Base* Shop;  // 540 14000001 CPF_Edit CPF_EditInline CPF_Unk_10000000
    struct FLocalizedString ShopSign;  // 544 400001 CPF_Edit CPF_NeedCtorLink
    virtual ~AInteractiveShop(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    AInteractiveShop(class AInteractiveShop const &);
    AInteractiveShop(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AInteractiveShop & operator=(class AInteractiveShop const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_INTERACTIVESHOP_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_INTERACTIVESHOP_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  InteractiveMailbox
//------------------------------------------------------------------------------

//  InteractiveMailbox.cl_GetToolTip 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveMailbox_eventcl_GetToolTip_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// AInteractiveMailbox 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInteractiveMailbox : public AInteractiveLevelElement {
  public:
    struct FLocalizedString MailTooltip;  // 540 400000 CPF_NeedCtorLink
    virtual ~AInteractiveMailbox(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AInteractiveMailbox(class AInteractiveMailbox const &);
    AInteractiveMailbox(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AInteractiveMailbox & operator=(class AInteractiveMailbox const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_INTERACTIVEMAILBOX_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_INTERACTIVEMAILBOX_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  InteractiveHatch
//------------------------------------------------------------------------------

//  InteractiveHatch.cl_GetToolTip 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveHatch_eventcl_GetToolTip_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// AInteractiveHatch 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInteractiveHatch : public AInteractiveLevelElement {
  public:
    class FVector DoorMovement;  // 540 2000003 CPF_Edit CPF_Const CPF_EditorData
    class FRotator DoorRotation;  // 54C 2000003 CPF_Edit CPF_Const CPF_EditorData
    BITFIELD Hide : 1;  // 558 2000003 CPF_Edit CPF_Const CPF_EditorData
    FLOAT OpenSpeed;  // 55C 2000003 CPF_Edit CPF_Const CPF_EditorData
    FLOAT PassableTime;  // 560 2000003 CPF_Edit CPF_Const CPF_EditorData
    class FString AnnotationTag;  // 564 2400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString DoorSign;  // 56C 2400001 CPF_Edit CPF_NeedCtorLink CPF_EditorData
    class USound* DoorSound;  // 578 16000003 CPF_Edit CPF_Const CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~AInteractiveHatch(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AInteractiveHatch(class AInteractiveHatch const &);
    AInteractiveHatch(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AInteractiveHatch & operator=(class AInteractiveHatch const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_INTERACTIVEHATCH_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_INTERACTIVEHATCH_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  InteractiveDoor
//------------------------------------------------------------------------------

//  InteractiveDoor.cl_GetToolTip 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveDoor_eventcl_GetToolTip_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// AInteractiveDoor 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInteractiveDoor : public AInteractiveLevelElement {
  public:
    INT DestinationWorld;  // 540 1 CPF_Edit
    class FString Parameter;  // 544 400001 CPF_Edit CPF_NeedCtorLink
    class FString spawnPointTag;  // 54C 20400000 CPF_NeedCtorLink CPF_Deprecated
    struct FLocalizedString DoorSign;  // 554 400001 CPF_Edit CPF_NeedCtorLink
    BITFIELD IsInstance : 1;  // 560 1 CPF_Edit
    virtual ~AInteractiveDoor(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AInteractiveDoor(class AInteractiveDoor const &);
    AInteractiveDoor(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AInteractiveDoor & operator=(class AInteractiveDoor const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_INTERACTIVEDOOR_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_INTERACTIVEDOOR_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  InteractiveChair
//------------------------------------------------------------------------------

//  InteractiveChair.sv_StopOptionActions 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveChair_eventsv_StopOptionActions_Parms {
};


//  InteractiveChair.sv_StartOptionActions 20002 0 ( FUNC_Defined FUNC_Public )
struct AInteractiveChair_execsv_StartOptionActions_Parms {
};


// AInteractiveChair 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInteractiveChair : public AInteractiveLevelElement {
  public:
    BITFIELD mCancelState : 1;  // 540 2000 CPF_Transient
    virtual ~AInteractiveChair(void);
    virtual void ConditionalPostLoad(void);
    virtual unsigned int GetCPPSize(void);
    AInteractiveChair(class AInteractiveChair const &);
    AInteractiveChair(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AInteractiveChair & operator=(class AInteractiveChair const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_INTERACTIVECHAIR_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_INTERACTIVECHAIR_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  InteractiveBirthSign
//------------------------------------------------------------------------------

//  InteractiveBirthSign.sv2rel_PlaySoundEvent_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct AInteractiveBirthSign_execsv2rel_PlaySoundEvent_CallStub_Parms {
};


//  InteractiveBirthSign.sv2rel_PlaySoundEvent 20802 1E80 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2REL )
struct AInteractiveBirthSign_eventsv2rel_PlaySoundEvent_Parms {
};


//  InteractiveBirthSign.sv2rel_ShowGlow_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct AInteractiveBirthSign_execsv2rel_ShowGlow_CallStub_Parms {
};


//  InteractiveBirthSign.sv2rel_ShowGlow 20802 1E80 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2REL )
struct AInteractiveBirthSign_eventsv2rel_ShowGlow_Parms {
  BITFIELD val : 1;  // 0 80 CPF_Parm
};


//  InteractiveBirthSign.Trigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveBirthSign_eventTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


//  InteractiveBirthSign.ActivateBirthSign 20002 0 ( FUNC_Defined FUNC_Public )
struct AInteractiveBirthSign_execActivateBirthSign_Parms {
};


// AInteractiveBirthSign 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInteractiveBirthSign : public AInteractiveLevelElement {
  public:
    class ASBDecoration* BirthSignGlow;  // 540 2000003 CPF_Edit CPF_Const CPF_EditorData
    FName Spawner_Event;  // 544 2000003 CPF_Edit CPF_Const CPF_EditorData
    FName DeactivationEvent;  // 548 2000001 CPF_Edit CPF_EditorData
    FName SoundEvent;  // 54C 2000003 CPF_Edit CPF_Const CPF_EditorData
    class ATrigger* ProximityTrigger;  // 550 2000003 CPF_Edit CPF_Const CPF_EditorData
    BITFIELD Activated : 1;  // 554 2000000 CPF_EditorData
    BITFIELD Deactivated : 1;  // 554 2000000 CPF_EditorData
    virtual ~AInteractiveBirthSign(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_SetEnabled(int);
    AInteractiveBirthSign(class AInteractiveBirthSign const &);
    AInteractiveBirthSign(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AInteractiveBirthSign & operator=(class AInteractiveBirthSign const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_INTERACTIVEBIRTHSIGN_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_INTERACTIVEBIRTHSIGN_LOGIN_STREAM const &);
    void eventsv2rel_PlaySoundEvent(void);
    void eventsv2rel_ShowGlow(unsigned long);
    void execsv2rel_PlaySoundEvent_CallStub(struct FFrame &,void * const);
    void execsv2rel_ShowGlow_CallStub(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(AInteractiveBirthSign,0,execsv2rel_PlaySoundEvent_CallStub)
AUTOGENERATE_FUNCTION(AInteractiveBirthSign,0,execsv2rel_ShowGlow_CallStub)


//------------------------------------------------------------------------------
//  Req_World
//------------------------------------------------------------------------------

// UReq_World 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_World : public UContent_Requirement {
  public:
    INT RequiredWorld;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_World(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_World(class UReq_World const &);
    UReq_World(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_World & operator=(class UReq_World const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_True
//------------------------------------------------------------------------------

// UReq_True 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_True : public UContent_Requirement {
  public:
    virtual ~UReq_True(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_True(class UReq_True const &);
    UReq_True(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_True & operator=(class UReq_True const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Time
//------------------------------------------------------------------------------

// UReq_Time 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Time : public UContent_Requirement {
  public:
    FLOAT BeginTime;  // 40 2000001 CPF_Edit CPF_EditorData
    FLOAT EndTime;  // 44 2000001 CPF_Edit CPF_EditorData
    virtual ~UReq_Time(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Time(class UReq_Time const &);
    UReq_Time(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Time & operator=(class UReq_Time const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Team
//------------------------------------------------------------------------------

// UReq_Team 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Team : public UContent_Requirement {
  public:
    INT RequiredSize;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    BYTE Operator;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Team(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Team(class UReq_Team const &);
    UReq_Team(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Team & operator=(class UReq_Team const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_TargetProgress
//------------------------------------------------------------------------------

// UReq_TargetProgress 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_TargetProgress : public UContent_Requirement {
  public:
    class UQuest_Type* quest;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    INT objective;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    INT Progress;  // 48 2000003 CPF_Edit CPF_Const CPF_EditorData
    BYTE Operator;  // 4C 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_TargetProgress(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_TargetProgress(class UReq_TargetProgress const &);
    UReq_TargetProgress(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_TargetProgress & operator=(class UReq_TargetProgress const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_TargetActive
//------------------------------------------------------------------------------

// UReq_TargetActive 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_TargetActive : public UContent_Requirement {
  public:
    class UQuest_Type* quest;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    INT objective;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_TargetActive(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_TargetActive(class UReq_TargetActive const &);
    UReq_TargetActive(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_TargetActive & operator=(class UReq_TargetActive const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Race
//------------------------------------------------------------------------------

// UReq_Race 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Race : public UContent_Requirement {
  public:
    BYTE RequiredRace;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Race(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Race(class UReq_Race const &);
    UReq_Race(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Race & operator=(class UReq_Race const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_QuestReq
//------------------------------------------------------------------------------

// UReq_QuestReq 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_QuestReq : public UContent_Requirement {
  public:
    class UQuest_Type* quest;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_QuestReq(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_QuestReq(class UReq_QuestReq const &);
    UReq_QuestReq(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_QuestReq & operator=(class UReq_QuestReq const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_QuestRepeatable
//------------------------------------------------------------------------------

// UReq_QuestRepeatable 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_QuestRepeatable : public UContent_Requirement {
  public:
    BITFIELD Repeatable : 1;  // 40 3 CPF_Edit CPF_Const
    class UQuest_Type* quest;  // 44 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_QuestRepeatable(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_QuestRepeatable(class UReq_QuestRepeatable const &);
    UReq_QuestRepeatable(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_QuestRepeatable & operator=(class UReq_QuestRepeatable const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_QuestFinished
//------------------------------------------------------------------------------

// UReq_QuestFinished 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_QuestFinished : public UContent_Requirement {
  public:
    class UQuest_Type* RequiredQuest;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    INT TimesFinished;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_QuestFinished(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_QuestFinished(class UReq_QuestFinished const &);
    UReq_QuestFinished(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_QuestFinished & operator=(class UReq_QuestFinished const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_QuestActive
//------------------------------------------------------------------------------

// UReq_QuestActive 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_QuestActive : public UContent_Requirement {
  public:
    class UQuest_Type* RequiredQuest;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_QuestActive(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_QuestActive(class UReq_QuestActive const &);
    UReq_QuestActive(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_QuestActive & operator=(class UReq_QuestActive const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Player
//------------------------------------------------------------------------------

// UReq_Player 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Player : public UContent_Requirement {
  public:
    virtual ~UReq_Player(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Player(class UReq_Player const &);
    UReq_Player(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Player & operator=(class UReq_Player const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_PersistentValue
//------------------------------------------------------------------------------

//  Req_PersistentValue.ApiTracing 20002 0 ( FUNC_Defined FUNC_Public )
struct UReq_PersistentValue_execApiTracing_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UReq_PersistentValue 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_PersistentValue : public UContent_Requirement {
  public:
    class UContent_Type* context;  // 40 6400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline
    INT VariableID;  // 44 2000001 CPF_Edit CPF_EditorData
    INT Value;  // 48 2000001 CPF_Edit CPF_EditorData
    BYTE Operator;  // 4C 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_PersistentValue(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_PersistentValue(class UReq_PersistentValue const &);
    UReq_PersistentValue(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_PersistentValue & operator=(class UReq_PersistentValue const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_PePRank
//------------------------------------------------------------------------------

//  Req_PePRank.ToString 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UReq_PePRank_eventToString_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UReq_PePRank 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_PePRank : public UContent_Requirement {
  public:
    INT RequiredPep;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    BYTE Operator;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_PePRank(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_PePRank(class UReq_PePRank const &);
    UReq_PePRank(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_PePRank & operator=(class UReq_PePRank const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Or
//------------------------------------------------------------------------------

// UReq_Or 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Or : public UContent_Requirement {
  public:
    TArray<class UContent_Requirement*> Requirements;  // 40 16400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_Or(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Or(class UReq_Or const &);
    UReq_Or(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Or & operator=(class UReq_Or const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_NPCType
//------------------------------------------------------------------------------

// UReq_NPCType 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_NPCType : public UContent_Requirement {
  public:
    class UNPC_Type* RequiredNPCType;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_NPCType(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_NPCType(class UReq_NPCType const &);
    UReq_NPCType(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_NPCType & operator=(class UReq_NPCType const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_NPC_Exists
//------------------------------------------------------------------------------

// UReq_NPC_Exists 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_NPC_Exists : public UContent_Requirement {
  public:
    class UNPC_Type* NPCType;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    BITFIELD MustBeAlive : 1;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_NPC_Exists(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_NPC_Exists(class UReq_NPC_Exists const &);
    UReq_NPC_Exists(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_NPC_Exists & operator=(class UReq_NPC_Exists const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_NPC
//------------------------------------------------------------------------------

// UReq_NPC 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_NPC : public UContent_Requirement {
  public:
    virtual ~UReq_NPC(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_NPC(class UReq_NPC const &);
    UReq_NPC(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_NPC & operator=(class UReq_NPC const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Not
//------------------------------------------------------------------------------

// UReq_Not 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Not : public UContent_Requirement {
  public:
    class UContent_Requirement* Requirement;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_Not(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Not(class UReq_Not const &);
    UReq_Not(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Not & operator=(class UReq_Not const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Money
//------------------------------------------------------------------------------

// UReq_Money 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Money : public UContent_Requirement {
  public:
    INT RequiredAmount;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    BYTE Operator;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Money(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Money(class UReq_Money const &);
    UReq_Money(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Money & operator=(class UReq_Money const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Level
//------------------------------------------------------------------------------

//  Req_Level.ToString 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UReq_Level_eventToString_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UReq_Level 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Level : public UContent_Requirement {
  public:
    INT RequiredLevel;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    BYTE Operator;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Level(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Level(class UReq_Level const &);
    UReq_Level(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Level & operator=(class UReq_Level const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Inventory
//------------------------------------------------------------------------------

// UReq_Inventory 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Inventory : public UContent_Requirement {
  public:
    class UItem_Type* Item;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    INT Amount;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    BYTE Operator;  // 48 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Inventory(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Inventory(class UReq_Inventory const &);
    UReq_Inventory(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Inventory & operator=(class UReq_Inventory const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Gender
//------------------------------------------------------------------------------

// UReq_Gender 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Gender : public UContent_Requirement {
  public:
    BYTE Gender;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Gender(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Gender(class UReq_Gender const &);
    UReq_Gender(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Gender & operator=(class UReq_Gender const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_GameActorEnabled
//------------------------------------------------------------------------------

// UReq_GameActorEnabled 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_GameActorEnabled : public UContent_Requirement {
  public:
    FName Tag;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    BITFIELD AllMustSucceed : 1;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    BITFIELD CheckForEnabled : 1;  // 44 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_GameActorEnabled(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_GameActorEnabled(class UReq_GameActorEnabled const &);
    UReq_GameActorEnabled(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_GameActorEnabled & operator=(class UReq_GameActorEnabled const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_False
//------------------------------------------------------------------------------

// UReq_False 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_False : public UContent_Requirement {
  public:
    virtual ~UReq_False(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_False(class UReq_False const &);
    UReq_False(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_False & operator=(class UReq_False const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Faction
//------------------------------------------------------------------------------

// UReq_Faction 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Faction : public UContent_Requirement {
  public:
    class UNPC_Taxonomy* RequiredTaxonomy;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_Faction(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Faction(class UReq_Faction const &);
    UReq_Faction(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Faction & operator=(class UReq_Faction const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Equipment
//------------------------------------------------------------------------------

// UReq_Equipment 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Equipment : public UContent_Requirement {
  public:
    class UItem_Type* Equipment;  // 40 640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline
    virtual ~UReq_Equipment(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Equipment(class UReq_Equipment const &);
    UReq_Equipment(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Equipment & operator=(class UReq_Equipment const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Distance
//------------------------------------------------------------------------------

// UReq_Distance 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Distance : public UContent_Requirement {
  public:
    class FString ActorTag;  // 40 2400001 CPF_Edit CPF_NeedCtorLink CPF_EditorData
    INT Distance;  // 48 2000001 CPF_Edit CPF_EditorData
    BYTE Operator;  // 4C 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Distance(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Distance(class UReq_Distance const &);
    UReq_Distance(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Distance & operator=(class UReq_Distance const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Conditional
//------------------------------------------------------------------------------

// UReq_Conditional 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Conditional : public UContent_Requirement {
  public:
    class UContent_Requirement* Condition;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    class UContent_Requirement* Requirement;  // 44 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_Conditional(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Conditional(class UReq_Conditional const &);
    UReq_Conditional(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Conditional & operator=(class UReq_Conditional const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Class
//------------------------------------------------------------------------------

// UReq_Class 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Class : public UContent_Requirement {
  public:
    BYTE RequiredClass;  // 40 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UReq_Class(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Class(class UReq_Class const &);
    UReq_Class(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Class & operator=(class UReq_Class const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Chance
//------------------------------------------------------------------------------

// UReq_Chance 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Chance : public UContent_Requirement {
  public:
    FLOAT Chance;  // 40 2000001 CPF_Edit CPF_EditorData
    virtual ~UReq_Chance(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Chance(class UReq_Chance const &);
    UReq_Chance(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Chance & operator=(class UReq_Chance const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_Area
//------------------------------------------------------------------------------

// UReq_Area 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_Area : public UContent_Requirement {
  public:
    class FString AreaTag;  // 40 2400001 CPF_Edit CPF_NeedCtorLink CPF_EditorData
    virtual ~UReq_Area(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_Area(class UReq_Area const &);
    UReq_Area(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_Area & operator=(class UReq_Area const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Req_And
//------------------------------------------------------------------------------

// UReq_And 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UReq_And : public UContent_Requirement {
  public:
    TArray<class UContent_Requirement*> Requirements;  // 40 16400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UReq_And(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *);
    UReq_And(class UReq_And const &);
    UReq_And(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReq_And & operator=(class UReq_And const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CR_Decline
//------------------------------------------------------------------------------

//  CR_Decline.sv_OnResponse 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCR_Decline_eventsv_OnResponse_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  CR_Decline.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UCR_Decline_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UCR_Decline 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UCR_Decline : public UConversation_Response {
  public:
    virtual ~UCR_Decline(void);
    virtual void PostLoad(void);
    virtual unsigned int GetCPPSize(void);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class TArray<struct UContent_Type::FGraphInput> GetInputs(void);
    virtual class FString GetControlDescription(int);
    virtual class FColor GetControlColor(void);
    virtual int AllowAssignment(int,class UContent_Type *);
    UCR_Decline(class UCR_Decline const &);
    UCR_Decline(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCR_Decline & operator=(class UCR_Decline const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CR_Accept
//------------------------------------------------------------------------------

//  CR_Accept.sv_OnResponse 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCR_Accept_eventsv_OnResponse_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  CR_Accept.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UCR_Accept_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UCR_Accept 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UCR_Accept : public UConversation_Response {
  public:
    virtual ~UCR_Accept(void);
    virtual void PostLoad(void);
    virtual unsigned int GetCPPSize(void);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class TArray<struct UContent_Type::FGraphInput> GetInputs(void);
    virtual class FString GetControlDescription(int);
    virtual class FColor GetControlColor(void);
    virtual int AllowAssignment(int,class UContent_Type *);
    UCR_Accept(class UCR_Accept const &);
    UCR_Accept(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCR_Accept & operator=(class UCR_Accept const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_Target
//------------------------------------------------------------------------------

//  CT_Target.GetContext 20002 0 ( FUNC_Defined FUNC_Public )
struct UCT_Target_execGetContext_Parms {
  class UContent_Type* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  CT_Target.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UCT_Target_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UCT_Target 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_Target : public UConversation_Topic {
  public:
    virtual ~UCT_Target(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *,class AGame_Pawn *);
    UCT_Target(class UCT_Target const &);
    UCT_Target(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_Target & operator=(class UCT_Target const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_Deliver
//------------------------------------------------------------------------------

//  CT_Deliver.sv_OnFinish 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCT_Deliver_eventsv_OnFinish_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCT_Deliver 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_Deliver : public UCT_Target {
  public:
    virtual ~UCT_Deliver(void);
    virtual unsigned int GetCPPSize(void);
    virtual int CheckPawn(class AGame_Pawn *,class AGame_Pawn *);
    UCT_Deliver(class UCT_Deliver const &);
    UCT_Deliver(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_Deliver & operator=(class UCT_Deliver const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_TalkTarget
//------------------------------------------------------------------------------

//  CT_TalkTarget.sv_OnFinish 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCT_TalkTarget_eventsv_OnFinish_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCT_TalkTarget 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_TalkTarget : public UCT_Target {
  public:
    virtual ~UCT_TalkTarget(void);
    virtual unsigned int GetCPPSize(void);
    UCT_TalkTarget(class UCT_TalkTarget const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_TalkTarget & operator=(class UCT_TalkTarget const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UCT_TalkTarget(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_LastWords
//------------------------------------------------------------------------------

//  CT_LastWords.sv_OnFinish 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCT_LastWords_eventsv_OnFinish_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCT_LastWords 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_LastWords : public UCT_Target {
  public:
    virtual ~UCT_LastWords(void);
    virtual unsigned int GetCPPSize(void);
    UCT_LastWords(class UCT_LastWords const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_LastWords & operator=(class UCT_LastWords const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UCT_LastWords(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_Victory
//------------------------------------------------------------------------------

// UCT_Victory 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_Victory : public UCT_Target {
  public:
    virtual ~UCT_Victory(void);
    virtual unsigned int GetCPPSize(void);
    UCT_Victory(class UCT_Victory const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_Victory & operator=(class UCT_Victory const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UCT_Victory(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_Thanks
//------------------------------------------------------------------------------

//  CT_Thanks.sv_OnFinish 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCT_Thanks_eventsv_OnFinish_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCT_Thanks 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_Thanks : public UCT_Target {
  public:
    virtual ~UCT_Thanks(void);
    virtual unsigned int GetCPPSize(void);
    UCT_Thanks(class UCT_Thanks const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_Thanks & operator=(class UCT_Thanks const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UCT_Thanks(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_Quest
//------------------------------------------------------------------------------

//  CT_Quest.GetContext 20002 0 ( FUNC_Defined FUNC_Public )
struct UCT_Quest_execGetContext_Parms {
  class UContent_Type* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  CT_Quest.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UCT_Quest_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UCT_Quest 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_Quest : public UConversation_Topic {
  public:
    virtual ~UCT_Quest(void);
    virtual unsigned int GetCPPSize(void);
    UCT_Quest(class UCT_Quest const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_Quest & operator=(class UCT_Quest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UCT_Quest(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_FinishQuest
//------------------------------------------------------------------------------

//  CT_FinishQuest.sv_OnFinish 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCT_FinishQuest_eventsv_OnFinish_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCT_FinishQuest 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_FinishQuest : public UCT_Quest {
  public:
    virtual ~UCT_FinishQuest(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FString GetControlDescription(int);
    virtual int CheckPawn(class AGame_Pawn *,class AGame_Pawn *);
    UCT_FinishQuest(class UCT_FinishQuest const &);
    UCT_FinishQuest(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_FinishQuest & operator=(class UCT_FinishQuest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_MidQuest
//------------------------------------------------------------------------------

// UCT_MidQuest 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_MidQuest : public UCT_Quest {
  public:
    virtual ~UCT_MidQuest(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FString GetControlDescription(int);
    virtual int CheckPawn(class AGame_Pawn *,class AGame_Pawn *);
    UCT_MidQuest(class UCT_MidQuest const &);
    UCT_MidQuest(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_MidQuest & operator=(class UCT_MidQuest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_ProvideQuest
//------------------------------------------------------------------------------

//  CT_ProvideQuest.sv_OnFinish 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UCT_ProvideQuest_eventsv_OnFinish_Parms {
  class AGame_Pawn* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCT_ProvideQuest 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_ProvideQuest : public UCT_Quest {
  public:
    class UConversation_Response* Accept;  // 9C 4400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class UConversation_Response* Decline;  // A0 4400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    virtual ~UCT_ProvideQuest(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FString GetControlDescription(int);
    virtual int CheckPawn(class AGame_Pawn *,class AGame_Pawn *);
    UCT_ProvideQuest(class UCT_ProvideQuest const &);
    UCT_ProvideQuest(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_ProvideQuest & operator=(class UCT_ProvideQuest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_Greeting
//------------------------------------------------------------------------------

//  CT_Greeting.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UCT_Greeting_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UCT_Greeting 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_Greeting : public UConversation_Topic {
  public:
    struct FLocalizedString DefaultText;  // 9C 400000 CPF_NeedCtorLink
    virtual ~UCT_Greeting(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FString GetControlDescription(int);
    UCT_Greeting(class UCT_Greeting const &);
    UCT_Greeting(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_Greeting & operator=(class UCT_Greeting const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  CT_Chat
//------------------------------------------------------------------------------

// UCT_Chat 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UCT_Chat : public UConversation_Topic {
  public:
    virtual ~UCT_Chat(void);
    virtual unsigned int GetCPPSize(void);
    UCT_Chat(class UCT_Chat const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCT_Chat & operator=(class UCT_Chat const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UCT_Chat(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_ShowTutorial
//------------------------------------------------------------------------------

//  EV_ShowTutorial.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_ShowTutorial_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_ShowTutorial.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_ShowTutorial_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_ShowTutorial 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_ShowTutorial : public UContent_Event {
  public:
    class UHelp_Article* Article;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_ShowTutorial(void);
    virtual unsigned int GetCPPSize(void);
    UEV_ShowTutorial(class UEV_ShowTutorial const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_ShowTutorial & operator=(class UEV_ShowTutorial const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_ShowTutorial(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_AIIdle
//------------------------------------------------------------------------------

//  EV_AIIdle.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_AIIdle_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_AIIdle.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_AIIdle_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_AIIdle 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_AIIdle : public UContent_Event {
  public:
    virtual ~UEV_AIIdle(void);
    virtual unsigned int GetCPPSize(void);
    UEV_AIIdle(class UEV_AIIdle const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_AIIdle & operator=(class UEV_AIIdle const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_AIIdle(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_AIFollow
//------------------------------------------------------------------------------

//  EV_AIFollow.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_AIFollow_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_AIFollow.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_AIFollow_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_AIFollow 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_AIFollow : public UContent_Event {
  public:
    virtual ~UEV_AIFollow(void);
    virtual unsigned int GetCPPSize(void);
    UEV_AIFollow(class UEV_AIFollow const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_AIFollow & operator=(class UEV_AIFollow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_AIFollow(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_AIAggro
//------------------------------------------------------------------------------

//  EV_AIAggro.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_AIAggro_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_AIAggro.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_AIAggro_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_AIAggro 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_AIAggro : public UContent_Event {
  public:
    virtual ~UEV_AIAggro(void);
    virtual unsigned int GetCPPSize(void);
    UEV_AIAggro(class UEV_AIAggro const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_AIAggro & operator=(class UEV_AIAggro const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_AIAggro(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_ClientEvent
//------------------------------------------------------------------------------

//  EV_ClientEvent.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_ClientEvent_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_ClientEvent.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_ClientEvent_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_ClientEvent 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_ClientEvent : public UContent_Event {
  public:
    class FString EventTag;  // 30 400003 CPF_Edit CPF_Const CPF_NeedCtorLink
    virtual ~UEV_ClientEvent(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_ClientEvent(class UEV_ClientEvent const &);
    UEV_ClientEvent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_ClientEvent & operator=(class UEV_ClientEvent const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_UntriggerEvent
//------------------------------------------------------------------------------

//  EV_UntriggerEvent.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_UntriggerEvent_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_UntriggerEvent.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_UntriggerEvent_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_UntriggerEvent 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_UntriggerEvent : public UContent_Event {
  public:
    FName EventTag;  // 30 3 CPF_Edit CPF_Const
    virtual ~UEV_UntriggerEvent(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_UntriggerEvent(class UEV_UntriggerEvent const &);
    UEV_UntriggerEvent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_UntriggerEvent & operator=(class UEV_UntriggerEvent const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_TriggerEvent
//------------------------------------------------------------------------------

//  EV_TriggerEvent.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_TriggerEvent_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_TriggerEvent.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_TriggerEvent_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_TriggerEvent 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_TriggerEvent : public UContent_Event {
  public:
    FName EventTag;  // 30 3 CPF_Edit CPF_Const
    virtual ~UEV_TriggerEvent(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_TriggerEvent(class UEV_TriggerEvent const &);
    UEV_TriggerEvent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_TriggerEvent & operator=(class UEV_TriggerEvent const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Party
//------------------------------------------------------------------------------

//  EV_Party.MeetsRequirements 80002 0 ( FUNC_Defined FUNC_Protected )
struct UEV_Party_execMeetsRequirements_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  EV_Party.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Party_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Party.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Party_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Party 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Party : public UContent_Event {
  public:
    FLOAT Range;  // 30 16000003 CPF_Edit CPF_Const CPF_EditorData CPF_EditInline CPF_Unk_10000000
    TArray<class UContent_Requirement*> Requirements;  // 34 16400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    class UContent_Event* PartyAction;  // 40 1640000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_Party(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_Party(class UEV_Party const &);
    UEV_Party(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Party & operator=(class UEV_Party const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_NPC
//------------------------------------------------------------------------------

//  EV_NPC.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_NPC_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_NPC.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_NPC_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_NPC 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_NPC : public UContent_Event {
  public:
    class UNPC_Type* NPC;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UContent_Event* NPCAction;  // 34 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    FLOAT Radius;  // 38 14000003 CPF_Edit CPF_Const CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_NPC(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_NPC(class UEV_NPC const &);
    UEV_NPC(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_NPC & operator=(class UEV_NPC const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Swap
//------------------------------------------------------------------------------

//  EV_Swap.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Swap_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Swap.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Swap_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Swap 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Swap : public UContent_Event {
  public:
    class UContent_Event* SwappedAction;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_Swap(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_Swap(class UEV_Swap const &);
    UEV_Swap(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Swap & operator=(class UEV_Swap const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Other
//------------------------------------------------------------------------------

//  EV_Other.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Other_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Other.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Other_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Other 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Other : public UContent_Event {
  public:
    class UContent_Event* OtherAction;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_Other(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_Other(class UEV_Other const &);
    UEV_Other(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Other & operator=(class UEV_Other const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Self
//------------------------------------------------------------------------------

//  EV_Self.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Self_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Self.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Self_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Self 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Self : public UContent_Event {
  public:
    class UContent_Event* SelfAction;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_Self(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_Self(class UEV_Self const &);
    UEV_Self(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Self & operator=(class UEV_Self const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Stand
//------------------------------------------------------------------------------

//  EV_Stand.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Stand_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Stand.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Stand_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Stand 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Stand : public UContent_Event {
  public:
    virtual ~UEV_Stand(void);
    virtual unsigned int GetCPPSize(void);
    UEV_Stand(class UEV_Stand const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Stand & operator=(class UEV_Stand const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_Stand(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Sit
//------------------------------------------------------------------------------

//  EV_Sit.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Sit_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Sit.ApiTracing 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Sit_execApiTracing_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  EV_Sit.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Sit_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Sit 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Sit : public UContent_Event {
  public:
    FName Chair;  // 30 1 CPF_Edit
    class FVector Offset;  // 34 1 CPF_Edit
    virtual ~UEV_Sit(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_Sit(class UEV_Sit const &);
    UEV_Sit(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Sit & operator=(class UEV_Sit const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Claustroport
//------------------------------------------------------------------------------

//  EV_Claustroport.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Claustroport_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Claustroport.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Claustroport_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Claustroport 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Claustroport : public UContent_Event {
  public:
    FName DestinationTag;  // 30 2000003 CPF_Edit CPF_Const CPF_EditorData
    FLOAT MaxDistance;  // 34 2000003 CPF_Edit CPF_Const CPF_EditorData
    BITFIELD UseOrientation : 1;  // 38 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UEV_Claustroport(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    UEV_Claustroport(class UEV_Claustroport const &);
    UEV_Claustroport(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Claustroport & operator=(class UEV_Claustroport const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Teleport
//------------------------------------------------------------------------------

//  EV_Teleport.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Teleport_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Teleport.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Teleport_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Teleport 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Teleport : public UContent_Event {
  public:
    INT TargetWorld;  // 30 1 CPF_Edit
    class FString Parameter;  // 34 2400001 CPF_Edit CPF_NeedCtorLink CPF_EditorData
    BITFIELD IsInstance : 1;  // 3C 1 CPF_Edit
    virtual ~UEV_Teleport(void);
    virtual unsigned int GetCPPSize(void);
    UEV_Teleport(class UEV_Teleport const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Teleport & operator=(class UEV_Teleport const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_Teleport(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_PersistentValue
//------------------------------------------------------------------------------

//  EV_PersistentValue.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PersistentValue_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_PersistentValue.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PersistentValue_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_PersistentValue 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_PersistentValue : public UContent_Event {
  public:
    class UContent_Type* context;  // 30 6400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline
    INT VariableID;  // 34 2000001 CPF_Edit CPF_EditorData
    INT Value;  // 38 2000001 CPF_Edit CPF_EditorData
    virtual ~UEV_PersistentValue(void);
    virtual unsigned int GetCPPSize(void);
    UEV_PersistentValue(class UEV_PersistentValue const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_PersistentValue & operator=(class UEV_PersistentValue const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_PersistentValue(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_SetFaction
//------------------------------------------------------------------------------

//  EV_SetFaction.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SetFaction_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_SetFaction.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SetFaction_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_SetFaction 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_SetFaction : public UContent_Event {
  public:
    class UNPC_Taxonomy* DesiredFaction;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_SetFaction(void);
    virtual unsigned int GetCPPSize(void);
    UEV_SetFaction(class UEV_SetFaction const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_SetFaction & operator=(class UEV_SetFaction const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_SetFaction(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_SetClass
//------------------------------------------------------------------------------

//  EV_SetClass.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SetClass_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_SetClass.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SetClass_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_SetClass 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_SetClass : public UContent_Event {
  public:
    BYTE DesiredClass;  // 30 3 CPF_Edit CPF_Const
    virtual ~UEV_SetClass(void);
    virtual unsigned int GetCPPSize(void);
    UEV_SetClass(class UEV_SetClass const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_SetClass & operator=(class UEV_SetClass const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_SetClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_GiveMoney
//------------------------------------------------------------------------------

//  EV_GiveMoney.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveMoney_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_GiveMoney.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveMoney_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_GiveMoney 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_GiveMoney : public UContent_Event {
  public:
    INT Amount;  // 30 3 CPF_Edit CPF_Const
    virtual ~UEV_GiveMoney(void);
    virtual unsigned int GetCPPSize(void);
    UEV_GiveMoney(class UEV_GiveMoney const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_GiveMoney & operator=(class UEV_GiveMoney const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_GiveMoney(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_RemoveMoney
//------------------------------------------------------------------------------

//  EV_RemoveMoney.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_RemoveMoney_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_RemoveMoney.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_RemoveMoney_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_RemoveMoney 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_RemoveMoney : public UContent_Event {
  public:
    INT Amount;  // 30 3 CPF_Edit CPF_Const
    virtual ~UEV_RemoveMoney(void);
    virtual unsigned int GetCPPSize(void);
    UEV_RemoveMoney(class UEV_RemoveMoney const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_RemoveMoney & operator=(class UEV_RemoveMoney const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_RemoveMoney(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_GiveItem
//------------------------------------------------------------------------------

//  EV_GiveItem.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveItem_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_GiveItem.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveItem_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_GiveItem 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_GiveItem : public UContent_Event {
  public:
    class UContent_Inventory* Items;  // 30 14000003 CPF_Edit CPF_Const CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_GiveItem(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UEV_GiveItem(class UEV_GiveItem const &);
    UEV_GiveItem(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_GiveItem & operator=(class UEV_GiveItem const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_RemoveItem
//------------------------------------------------------------------------------

//  EV_RemoveItem.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_RemoveItem_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_RemoveItem.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_RemoveItem_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_RemoveItem 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_RemoveItem : public UContent_Event {
  public:
    class UContent_Inventory* Items;  // 30 14000003 CPF_Edit CPF_Const CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_RemoveItem(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UEV_RemoveItem(class UEV_RemoveItem const &);
    UEV_RemoveItem(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_RemoveItem & operator=(class UEV_RemoveItem const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_EffectsRemove
//------------------------------------------------------------------------------

//  EV_EffectsRemove.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_EffectsRemove_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_EffectsRemove.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_EffectsRemove_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_EffectsRemove 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_EffectsRemove : public UContent_Event {
  public:
    BITFIELD RemoveFromObject : 1;  // 30 3 CPF_Edit CPF_Const
    BITFIELD RemoveFromSubject : 1;  // 30 3 CPF_Edit CPF_Const
    FName Tag;  // 34 3 CPF_Edit CPF_Const
    virtual ~UEV_EffectsRemove(void);
    virtual unsigned int GetCPPSize(void);
    UEV_EffectsRemove(class UEV_EffectsRemove const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_EffectsRemove & operator=(class UEV_EffectsRemove const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_EffectsRemove(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_EffectsApply
//------------------------------------------------------------------------------

//  EV_EffectsApply.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_EffectsApply_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_EffectsApply.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_EffectsApply_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_EffectsApply 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_EffectsApply : public UContent_Event {
  public:
    TArray<class UFSkill_EffectClass_AudioVisual*> Effects;  // 30 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    BITFIELD ApplyToObject : 1;  // 3C 3 CPF_Edit CPF_Const
    BITFIELD ApplyToSubject : 1;  // 3C 3 CPF_Edit CPF_Const
    FName Tag;  // 40 3 CPF_Edit CPF_Const
    BITFIELD SubjectEffectIsPermanent : 1;  // 44 3 CPF_Edit CPF_Const
    virtual ~UEV_EffectsApply(void);
    virtual unsigned int GetCPPSize(void);
    UEV_EffectsApply(class UEV_EffectsApply const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_EffectsApply & operator=(class UEV_EffectsApply const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_EffectsApply(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_SkillEvent
//------------------------------------------------------------------------------

//  EV_SkillEvent.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillEvent_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_SkillEvent.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillEvent_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_SkillEvent 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_SkillEvent : public UContent_Event {
  public:
    class UFSkill_Event_Duff* duffEvent;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_SkillEvent(void);
    virtual unsigned int GetCPPSize(void);
    UEV_SkillEvent(class UEV_SkillEvent const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_SkillEvent & operator=(class UEV_SkillEvent const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_SkillEvent(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_GiveSkill
//------------------------------------------------------------------------------

//  EV_GiveSkill.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveSkill_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_GiveSkill.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveSkill_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_GiveSkill 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_GiveSkill : public UContent_Event {
  public:
    class UFSkill_Type* Skill;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_GiveSkill(void);
    virtual unsigned int GetCPPSize(void);
    UEV_GiveSkill(class UEV_GiveSkill const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_GiveSkill & operator=(class UEV_GiveSkill const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_GiveSkill(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_SkillEffectsTargeted
//------------------------------------------------------------------------------

//  EV_SkillEffectsTargeted.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillEffectsTargeted_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_SkillEffectsTargeted.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillEffectsTargeted_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_SkillEffectsTargeted 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_SkillEffectsTargeted : public UContent_Event {
  public:
    class UFSkill_Type* Skill;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_SkillEffectsTargeted(void);
    virtual unsigned int GetCPPSize(void);
    UEV_SkillEffectsTargeted(class UEV_SkillEffectsTargeted const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_SkillEffectsTargeted & operator=(class UEV_SkillEffectsTargeted const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_SkillEffectsTargeted(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_SkillEffects
//------------------------------------------------------------------------------

//  EV_SkillEffects.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillEffects_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_SkillEffects.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillEffects_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_SkillEffects 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_SkillEffects : public UContent_Event {
  public:
    class UFSkill_Type* Skill;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_SkillEffects(void);
    virtual unsigned int GetCPPSize(void);
    UEV_SkillEffects(class UEV_SkillEffects const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_SkillEffects & operator=(class UEV_SkillEffects const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_SkillEffects(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_SkillTargeted
//------------------------------------------------------------------------------

//  EV_SkillTargeted.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillTargeted_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_SkillTargeted.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SkillTargeted_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_SkillTargeted 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_SkillTargeted : public UContent_Event {
  public:
    class UFSkill_Type* Skill;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_SkillTargeted(void);
    virtual unsigned int GetCPPSize(void);
    UEV_SkillTargeted(class UEV_SkillTargeted const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_SkillTargeted & operator=(class UEV_SkillTargeted const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_SkillTargeted(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Skill
//------------------------------------------------------------------------------

//  EV_Skill.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Skill_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Skill.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Skill_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Skill 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Skill : public UContent_Event {
  public:
    class UFSkill_Type* Skill;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_Skill(void);
    virtual unsigned int GetCPPSize(void);
    UEV_Skill(class UEV_Skill const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Skill & operator=(class UEV_Skill const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_Skill(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_PartyProgress
//------------------------------------------------------------------------------

//  EV_PartyProgress.FindObjective 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PartyProgress_execFindObjective_Parms {
  class UQuest_Type* aQuest;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  EV_PartyProgress.FindQuest 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PartyProgress_execFindQuest_Parms {
  class UQuest_Type* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  EV_PartyProgress.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PartyProgress_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_PartyProgress.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PartyProgress_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_PartyProgress 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_PartyProgress : public UContent_Event {
  public:
    class UQuest_Type* quest;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT ObjectiveNr;  // 34 3 CPF_Edit CPF_Const
    class UGame_Team* TeamLock;  // 38 2000 CPF_Transient
    virtual ~UEV_PartyProgress(void);
    virtual unsigned int GetCPPSize(void);
    UEV_PartyProgress(class UEV_PartyProgress const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_PartyProgress & operator=(class UEV_PartyProgress const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_PartyProgress(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_QuestProgress
//------------------------------------------------------------------------------

//  EV_QuestProgress.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_QuestProgress_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_QuestProgress.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_QuestProgress_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_QuestProgress 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_QuestProgress : public UContent_Event {
  public:
    class UQuest_Type* quest;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT TargetNr;  // 34 3 CPF_Edit CPF_Const
    INT Progress;  // 38 3 CPF_Edit CPF_Const
    virtual ~UEV_QuestProgress(void);
    virtual unsigned int GetCPPSize(void);
    UEV_QuestProgress(class UEV_QuestProgress const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_QuestProgress & operator=(class UEV_QuestProgress const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_QuestProgress(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_FinishQuest
//------------------------------------------------------------------------------

//  EV_FinishQuest.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_FinishQuest_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_FinishQuest.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_FinishQuest_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_FinishQuest 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_FinishQuest : public UContent_Event {
  public:
    class UQuest_Type* quest;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_FinishQuest(void);
    virtual unsigned int GetCPPSize(void);
    UEV_FinishQuest(class UEV_FinishQuest const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_FinishQuest & operator=(class UEV_FinishQuest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_FinishQuest(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_ObtainQuest
//------------------------------------------------------------------------------

//  EV_ObtainQuest.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_ObtainQuest_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_ObtainQuest.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_ObtainQuest_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_ObtainQuest 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_ObtainQuest : public UContent_Event {
  public:
    class UQuest_Type* quest;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_ObtainQuest(void);
    virtual unsigned int GetCPPSize(void);
    UEV_ObtainQuest(class UEV_ObtainQuest const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_ObtainQuest & operator=(class UEV_ObtainQuest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_ObtainQuest(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_GiveQuest
//------------------------------------------------------------------------------

//  EV_GiveQuest.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveQuest_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_GiveQuest.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_GiveQuest_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_GiveQuest 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_GiveQuest : public UContent_Event {
  public:
    class UQuest_Type* quest;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_GiveQuest(void);
    virtual unsigned int GetCPPSize(void);
    UEV_GiveQuest(class UEV_GiveQuest const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_GiveQuest & operator=(class UEV_GiveQuest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_GiveQuest(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Emote
//------------------------------------------------------------------------------

//  EV_Emote.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Emote_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Emote.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Emote_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Emote 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Emote : public UContent_Event {
  public:
    BYTE Emote;  // 30 1 CPF_Edit
    virtual ~UEV_Emote(void);
    virtual unsigned int GetCPPSize(void);
    UEV_Emote(class UEV_Emote const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Emote & operator=(class UEV_Emote const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_Emote(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_SetHealth
//------------------------------------------------------------------------------

enum EHealthMode {
  HM_ABSOLUTE = 0,
  HM_RELATIVE = 1,
  HM_ABSOLUTE_PERCENTAGE = 2,
  HM_RELATIVE_PERCENTAGE = 3
};

//  EV_SetHealth.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SetHealth_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_SetHealth.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_SetHealth_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_SetHealth 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_SetHealth : public UContent_Event {
  public:
    BYTE HealthMode;  // 30 3 CPF_Edit CPF_Const
    FLOAT HealthValue;  // 34 3 CPF_Edit CPF_Const
    virtual ~UEV_SetHealth(void);
    virtual unsigned int GetCPPSize(void);
    UEV_SetHealth(class UEV_SetHealth const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_SetHealth & operator=(class UEV_SetHealth const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_SetHealth(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Die
//------------------------------------------------------------------------------

//  EV_Die.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Die_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Die.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Die_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Die 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Die : public UContent_Event {
  public:
    virtual ~UEV_Die(void);
    virtual unsigned int GetCPPSize(void);
    UEV_Die(class UEV_Die const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Die & operator=(class UEV_Die const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEV_Die(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  EV_Conversation
//------------------------------------------------------------------------------

//  EV_Conversation.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Conversation_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Conversation.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Conversation_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Conversation 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Conversation : public UContent_Event {
  public:
    class UConversation_Topic* Conversation;  // 30 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UEV_Conversation(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UEV_Conversation(class UEV_Conversation const &);
    UEV_Conversation(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEV_Conversation & operator=(class UEV_Conversation const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Area
//------------------------------------------------------------------------------

// ASpawn_Area 217 ( CLASS_Abstract CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpawn_Area : public ANPC_Spawner {
  public:
    FLOAT MaxSpawnDistance;  // 4B0 2000001 CPF_Edit CPF_EditorData
    BITFIELD LoSSpawning : 1;  // 4B4 2000001 CPF_Edit CPF_EditorData
    FLOAT MaxSpawnHeight;  // 4B8 2000001 CPF_Edit CPF_EditorData
    virtual ~ASpawn_Area(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual float GetHabitatRange(void);
    virtual class FVector GetSpawnLocation(class UNPC_Type *);
    virtual class FRotator GetSpawnDirection(void);
    ASpawn_Area(class ASpawn_Area const &);
    ASpawn_Area(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Area & operator=(class ASpawn_Area const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Triggered
//------------------------------------------------------------------------------

// FSpawnConfig 0 ( )
struct DLL_IMPORT FSpawnConfig {
  public:
    class UNPC_Type* NPCType;  // 0 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UNPC_Taxonomy* Faction;  // 4 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT Chance;  // 8 1 CPF_Edit
    INT MinLevel;  // C 1 CPF_Edit
    INT MaxLevel;  // 10 1 CPF_Edit
    INT PePRank;  // 14 1 CPF_Edit
    struct FSpawnConfig & operator=(struct FSpawnConfig const &);
};

//  Spawn_Triggered.sv_Despawn 20002 0 ( FUNC_Defined FUNC_Public )
struct ASpawn_Triggered_execsv_Despawn_Parms {
};


//  Spawn_Triggered.PostBeginPlay 20002 0 ( FUNC_Defined FUNC_Public )
struct ASpawn_Triggered_execPostBeginPlay_Parms {
};


// ASpawn_Triggered 4216 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT ASpawn_Triggered : public ASpawn_Area {
  public:
    class FVector SpawnerLocation;  // 4BC 2002000 CPF_Transient CPF_EditorData
    struct FSpawnConfig CurrentlySpawning;  // 4C8 402000 CPF_Transient CPF_NeedCtorLink
    INT WaveCount;  // 4E0 2000 CPF_Transient
    TArray<struct FSpawnConfig> SpawnerConfig;  // 4E4 14400001 CPF_Edit CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    FLOAT MinSpawnsPerWave;  // 4F0 1 CPF_Edit
    FLOAT MaxSpawnsPerWave;  // 4F4 1 CPF_Edit
    FLOAT MaxSpawnsAlive;  // 4F8 1 CPF_Edit
    FLOAT MaxWaves;  // 4FC 1 CPF_Edit
    BITFIELD UseChanceAsCount : 1;  // 500 2000001 CPF_Edit CPF_EditorData
    class UClass* StateMachine;  // 504 1 CPF_Edit
    virtual ~ASpawn_Triggered(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual void RenderEditorInfo(class FLevelSceneNode *,class FRenderInterface *,class FDynamicActor *);
    virtual class FString GetDescription(void)const ;
    virtual void RefreshEditor(void);
    virtual class AGame_NPCController * sv_Spawn(class UNPC_Type *);
    virtual void sv_TriggeredSpawn(class AActor *);
    ASpawn_Triggered(class ASpawn_Triggered const &);
    ASpawn_Triggered(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Triggered & operator=(class ASpawn_Triggered const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Placed
//------------------------------------------------------------------------------

// ASpawn_Placed 216 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpawn_Placed : public ASpawn_Triggered {
  public:
    BITFIELD UseRandomLocation : 1;  // 508 2000001 CPF_Edit CPF_EditorData
    virtual ~ASpawn_Placed(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FString GetDescription(void)const ;
    virtual void sv_TriggeredSpawn(class AActor *);
    virtual class FVector GetSpawnLocation(class UNPC_Type *);
    ASpawn_Placed(class ASpawn_Placed const &);
    ASpawn_Placed(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Placed & operator=(class ASpawn_Placed const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Timed
//------------------------------------------------------------------------------

//  Spawn_Timed.sv_Despawn 20002 0 ( FUNC_Defined FUNC_Public )
struct ASpawn_Timed_execsv_Despawn_Parms {
};


// ASpawn_Timed 4216 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT ASpawn_Timed : public ASpawn_Triggered {
  public:
    FLOAT SpawnInterval;  // 508 1 CPF_Edit
    BITFIELD StopTimerIfWiped : 1;  // 50C 1 CPF_Edit
    BITFIELD OnlyStopTimerOnDespawn : 1;  // 50C 2000001 CPF_Edit CPF_EditorData
    FLOAT SpawnTimer;  // 510 0
    BITFIELD TimerStarted : 1;  // 514 0
    virtual ~ASpawn_Timed(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual class FString GetDescription(void)const ;
    virtual void sv_TriggeredSpawn(class AActor *);
    ASpawn_Timed(class ASpawn_Timed const &);
    ASpawn_Timed(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Timed & operator=(class ASpawn_Timed const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Wildlife
//------------------------------------------------------------------------------

//  Spawn_Wildlife.sv_Despawn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ASpawn_Wildlife_eventsv_Despawn_Parms {
};


// ASpawn_Wildlife 216 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpawn_Wildlife : public ASpawn_Area {
  public:
    class UNPC_Type* NPCType;  // 4BC 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT LevelMin;  // 4C0 1 CPF_Edit
    INT LevelMax;  // 4C4 1 CPF_Edit
    INT SpawnMin;  // 4C8 1 CPF_Edit
    INT SpawnMax;  // 4CC 1 CPF_Edit
    BITFIELD UseAbsoluteAmounts : 1;  // 4D0 1 CPF_Edit
    FLOAT RespawnTime;  // 4D4 1 CPF_Edit
    FLOAT RespawnVariation;  // 4D8 2000001 CPF_Edit CPF_EditorData
    class UClass* StateMachine;  // 4DC 1 CPF_Edit
    INT SpawnAmount;  // 4E0 2000 CPF_Transient
    FLOAT mTimer;  // 4E4 2000 CPF_Transient
    virtual ~ASpawn_Wildlife(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual void RenderEditorInfo(class FLevelSceneNode *,class FRenderInterface *,class FDynamicActor *);
    virtual class FString GetDescription(void)const ;
    virtual void RefreshEditor(void);
    virtual class AGame_NPCController * sv_Spawn(class UNPC_Type *);
    virtual void sv_TriggeredSpawn(class AActor *);
    ASpawn_Wildlife(class ASpawn_Wildlife const &);
    ASpawn_Wildlife(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Wildlife & operator=(class ASpawn_Wildlife const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    int ComputeSpawnAmount(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Group
//------------------------------------------------------------------------------

//  Spawn_Group.sv_Despawn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ASpawn_Group_eventsv_Despawn_Parms {
};


// ASpawn_Group 217 ( CLASS_Abstract CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpawn_Group : public ASpawn_Area {
  public:
    class UNPC_Group* ClassGroup;  // 4BC 16400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    class UNPC_Taxonomy* Faction;  // 4C0 16400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    INT MinLevel;  // 4C4 2000001 CPF_Edit CPF_EditorData
    INT MaxLevel;  // 4C8 2000001 CPF_Edit CPF_EditorData
    INT PePRank;  // 4CC 2000001 CPF_Edit CPF_EditorData
    INT rank;  // 4D0 2000001 CPF_Edit CPF_EditorData
    FLOAT RespawnTimeout;  // 4D4 2000001 CPF_Edit CPF_EditorData
    FLOAT RespawnVariation;  // 4D8 2000001 CPF_Edit CPF_EditorData
    BITFIELD SpawnImmediatly : 1;  // 4DC 2000001 CPF_Edit CPF_EditorData
    class UClass* StateMachine;  // 4E0 2000001 CPF_Edit CPF_EditorData
    class UClass* GroupMind;  // 4E4 2000001 CPF_Edit CPF_EditorData
    FLOAT mTimer;  // 4E8 2000 CPF_Transient
    BITFIELD mAllDead : 1;  // 4EC 2000 CPF_Transient
    BITFIELD mSomeDead : 1;  // 4EC 2000 CPF_Transient
    class ANPC_AI* GroupAI;  // 4F0 2000 CPF_Transient
    TArray<class UNPC_Type*> Configuration;  // 4F4 402000 CPF_Transient CPF_NeedCtorLink
    class FVector SpawnerLocation;  // 500 2002000 CPF_Transient CPF_EditorData
    virtual ~ASpawn_Group(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void PostEditLoad(void);
    virtual void sv_OnFrame(float);
    virtual void RenderEditorInfo(class FLevelSceneNode *,class FRenderInterface *,class FDynamicActor *);
    virtual void RefreshEditor(void);
    virtual void RespawnPawns(void);
    virtual void PostBeginPlay(void);
    virtual class AGame_NPCController * sv_Spawn(class UNPC_Type *);
    virtual void sv_TriggeredSpawn(class AActor *);
    virtual class FVector GetSpawnLocation(class UNPC_Type *);
    virtual void RenderEditorDescription(class FLevelSceneNode *);
    ASpawn_Group(class ASpawn_Group const &);
    ASpawn_Group(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Group & operator=(class ASpawn_Group const &);
    static void CDECL InternalConstructor(void *);
    void ResetSpawnTimer(void);
    void SpawnGroup(void);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Breeder
//------------------------------------------------------------------------------

// ASpawn_Breeder 216 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpawn_Breeder : public ASpawn_Group {
  public:
    virtual ~ASpawn_Breeder(void);
    virtual unsigned int GetCPPSize(void);
    ASpawn_Breeder(class ASpawn_Breeder const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Breeder & operator=(class ASpawn_Breeder const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    ASpawn_Breeder(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_Deployer
//------------------------------------------------------------------------------

// ASpawn_Deployer 216 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpawn_Deployer : public ASpawn_Group {
  public:
    TArray<class UNPC_Type*> Bosses;  // 50C 16400001 CPF_Edit CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~ASpawn_Deployer(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void RespawnPawns(void);
    virtual void RenderEditorDescription(class FLevelSceneNode *);
    ASpawn_Deployer(class ASpawn_Deployer const &);
    ASpawn_Deployer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_Deployer & operator=(class ASpawn_Deployer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Spawn_NPC
//------------------------------------------------------------------------------

//  Spawn_NPC.sv_Despawn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ASpawn_NPC_eventsv_Despawn_Parms {
};


// ASpawn_NPC 216 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpawn_NPC : public ANPC_Spawner {
  public:
    class UNPC_Type* NPCType;  // 4B0 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    FLOAT RespawnTimeout;  // 4B4 1 CPF_Edit
    class UClass* StateMachine;  // 4B8 1 CPF_Edit
    FLOAT RespawnTimer;  // 4BC 0
    virtual ~ASpawn_NPC(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnFrame(float);
    virtual void RenderEditorInfo(class FLevelSceneNode *,class FRenderInterface *,class FDynamicActor *);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual class FString GetDescription(void)const ;
    virtual void RefreshEditor(void);
    virtual class AGame_NPCController * sv_Spawn(class UNPC_Type *);
    virtual void sv_TriggeredSpawn(class AActor *);
    virtual class FVector GetSpawnLocation(class UNPC_Type *);
    ASpawn_NPC(class ASpawn_NPC const &);
    ASpawn_NPC(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASpawn_NPC & operator=(class ASpawn_NPC const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NG_Boss
//------------------------------------------------------------------------------

// UNG_Boss 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNG_Boss : public UNPC_Group {
  public:
    virtual ~UNG_Boss(void);
    virtual unsigned int GetCPPSize(void);
    UNG_Boss(class UNG_Boss const &);
    UNG_Boss(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNG_Boss & operator=(class UNG_Boss const &);
    void CreateSpawnConfiguration(class UNPC_Taxonomy *,int,class TArray<class UNPC_Type *> &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NA_RaceBodyGender
//------------------------------------------------------------------------------

//  NA_RaceBodyGender.GetGender 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UNA_RaceBodyGender_eventGetGender_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NA_RaceBodyGender.EditorVerify 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UNA_RaceBodyGender_eventEditorVerify_Parms {
};


// UNA_RaceBodyGender 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UNA_RaceBodyGender : public UNPC_Appearance {
  public:
    BYTE Gender;  // 30 3 CPF_Edit CPF_Const
    BYTE Race;  // 31 3 CPF_Edit CPF_Const
    BYTE Bodytype;  // 32 3 CPF_Edit CPF_Const
    virtual ~UNA_RaceBodyGender(void);
    virtual unsigned int GetCPPSize(void);
    UNA_RaceBodyGender(class UNA_RaceBodyGender const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNA_RaceBodyGender & operator=(class UNA_RaceBodyGender const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UNA_RaceBodyGender(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NA_Static
//------------------------------------------------------------------------------

//  NA_Static.CreateAppearance 20002 0 ( FUNC_Defined FUNC_Public )
struct UNA_Static_execCreateAppearance_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UGame_Appearance* aAppearance;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD aShifting : 1;  // 8 80 CPF_Parm
  class UGame_Appearance* ReturnValue;  // C 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


// UNA_Static 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UNA_Static : public UNPC_Appearance {
  public:
    class UStaticMesh* StatMesh;  // 30 1 CPF_Edit
    FLOAT Scale;  // 34 1 CPF_Edit
    BITFIELD Statue : 1;  // 38 1 CPF_Edit
    BITFIELD Ghostly : 1;  // 38 1 CPF_Edit
    FLOAT CollisionRadius;  // 3C 2000001 CPF_Edit CPF_EditorData
    FLOAT CollisionHeight;  // 40 2000001 CPF_Edit CPF_EditorData
    FLOAT SkillRadius;  // 44 2000001 CPF_Edit CPF_EditorData
    virtual ~UNA_Static(void);
    virtual unsigned int GetCPPSize(void);
    virtual void edApply(class AActor *);
    virtual float GetCollisionRadius(void);
    virtual float GetCollisionHeight(void);
    virtual float GetSkillRadius(void);
    virtual float GetIdealWalkSpeed(void);
    virtual float GetIdealRunSpeed(void);
    UNA_Static(class UNA_Static const &);
    UNA_Static(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNA_Static & operator=(class UNA_Static const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NA_Equipped
//------------------------------------------------------------------------------

//  NA_Equipped.GetHead 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UNA_Equipped_eventGetHead_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NA_Equipped.SetHead 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UNA_Equipped_eventSetHead_Parms {
  INT NewHead;  // 0 80 CPF_Parm
};


//  NA_Equipped.CreateAppearance 20002 0 ( FUNC_Defined FUNC_Public )
struct UNA_Equipped_execCreateAppearance_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UGame_Appearance* aAppearance;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD aShifting : 1;  // 8 80 CPF_Parm
  class UGame_Appearance* ReturnValue;  // C 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


// UNA_Equipped 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UNA_Equipped : public UNA_RaceBodyGender {
  public:
    INT Head;  // 34 3 CPF_Edit CPF_Const
    class UAppearance_Hair* Hair;  // 38 14000003 CPF_Edit CPF_Const CPF_EditInline CPF_Unk_10000000
    BYTE BodyColor;  // 3C 3 CPF_Edit CPF_Const
    BYTE HairColor;  // 3D 3 CPF_Edit CPF_Const
    BITFIELD Ghostly : 1;  // 40 1 CPF_Edit
    BITFIELD Statue : 1;  // 40 1 CPF_Edit
    virtual ~UNA_Equipped(void);
    virtual unsigned int GetCPPSize(void);
    virtual void edApply(class AActor *);
    virtual void edRandomize(class AActor *,unsigned int,unsigned int,unsigned int,bool,bool,bool,unsigned short const *,unsigned short const *,unsigned int);
    virtual float GetCollisionRadius(void);
    virtual float GetCollisionHeight(void);
    virtual float GetSkillRadius(void);
    virtual float GetIdealRunSpeed(void);
    virtual float GetIdealWalkSpeed(void);
    UNA_Equipped(class UNA_Equipped const &);
    UNA_Equipped(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNA_Equipped & operator=(class UNA_Equipped const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NA_Skeletal
//------------------------------------------------------------------------------

//  NA_Skeletal.CreateAppearance 20002 0 ( FUNC_Defined FUNC_Public )
struct UNA_Skeletal_execCreateAppearance_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UGame_Appearance* aAppearance;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD aShifting : 1;  // 8 80 CPF_Parm
  class UGame_Appearance* ReturnValue;  // C 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


// UNA_Skeletal 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UNA_Skeletal : public UNA_RaceBodyGender {
  public:
    class UMesh* SkeletalMesh;  // 34 1 CPF_Edit
    class UMesh* SkeletalMeshAddition;  // 38 1 CPF_Edit
    class UMaterial* SkinTexture;  // 3C 1 CPF_Edit
    BITFIELD Ghostly : 1;  // 40 1 CPF_Edit
    BITFIELD Statue : 1;  // 40 1 CPF_Edit
    FLOAT Scale;  // 44 1 CPF_Edit
    virtual ~UNA_Skeletal(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void edApply(class AActor *);
    virtual float GetCollisionRadius(void);
    virtual float GetCollisionHeight(void);
    virtual float GetSkillRadius(void);
    virtual float GetIdealRunSpeed(void);
    virtual float GetIdealWalkSpeed(void);
    UNA_Skeletal(class UNA_Skeletal const &);
    UNA_Skeletal(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNA_Skeletal & operator=(class UNA_Skeletal const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NE_SlotsBase
//------------------------------------------------------------------------------

// FNE_ItemColor 0 ( )
struct DLL_IMPORT FNE_ItemColor {
  public:
    INT Color1;  // 0 1 CPF_Edit
    INT Color2;  // 4 1 CPF_Edit
    struct FNE_ItemColor & operator=(struct FNE_ItemColor const &);
};

// UNE_SlotsBase 6012 ( CLASS_Compiled CLASS_Parsed CLASS_CollapseCategories CLASS_ExportStructs )
class DLL_IMPORT UNE_SlotsBase : public UNPC_Equipment {
  public:
    class UItem_Type* W01_MeleeWeapon;  // 28 16400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    class UItem_Type* W02_RangedWeapon;  // 2C 16400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    class UItem_WeaponShield* W03_Shield;  // 30 16400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline CPF_Unk_10000000
    class UItem_ClothChest* C01_Chest;  // 34 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ClothLeftGlove* C02_LeftGlove;  // 38 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ClothRightGlove* C03_RightGlove;  // 3C 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ClothPants* C04_Pants;  // 40 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ClothShoes* C05_Shoes;  // 44 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorHeadGear* A01_Helmet;  // 48 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorRightShoulder* A02_RightShoulder;  // 4C 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorLeftShoulder* A03_LeftShoulder;  // 50 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorRightGauntlet* A04_RightGauntlet;  // 54 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorLeftGauntlet* A05_LeftGauntlet;  // 58 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorChest* A06_ChestArmour;  // 5C 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorBelt* A07_Belt;  // 60 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorLeftThigh* A08_LeftThigh;  // 64 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorRightThigh* A09_RightThigh;  // 68 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorLeftShin* A10_LeftShin;  // 6C 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_ArmorRightShin* A11_RightShin;  // 70 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_JewelryRing* J01_LeftRing;  // 74 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_JewelryRing* J02_RightRing;  // 78 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_JewelryNecklace* J03_Necklace;  // 7C 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UNE_SlotsBase(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual bool HasWeapon(enum EWeaponCategory);
    UNE_SlotsBase(class UNE_SlotsBase const &);
    UNE_SlotsBase(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNE_SlotsBase & operator=(class UNE_SlotsBase const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NE_SlotsUniform
//------------------------------------------------------------------------------

//  NE_SlotsUniform.Apply 20002 0 ( FUNC_Defined FUNC_Public )
struct UNE_SlotsUniform_execApply_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


// UNE_SlotsUniform 2012 ( CLASS_Compiled CLASS_Parsed CLASS_CollapseCategories )
class DLL_IMPORT UNE_SlotsUniform : public UNE_SlotsBase {
  public:
    virtual ~UNE_SlotsUniform(void);
    virtual unsigned int GetCPPSize(void);
    virtual void edApply(class UGame_EquippedAppearance *);
    virtual void edUnApply(class UGame_EquippedAppearance *);
    UNE_SlotsUniform(class UNE_SlotsUniform const &);
    UNE_SlotsUniform(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNE_SlotsUniform & operator=(class UNE_SlotsUniform const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NE_SlotsFullColor
//------------------------------------------------------------------------------

//  NE_SlotsFullColor.Apply 20002 0 ( FUNC_Defined FUNC_Public )
struct UNE_SlotsFullColor_execApply_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


// UNE_SlotsFullColor 6012 ( CLASS_Compiled CLASS_Parsed CLASS_CollapseCategories CLASS_ExportStructs )
class DLL_IMPORT UNE_SlotsFullColor : public UNE_SlotsBase {
  public:
    struct FNE_ItemColor W01_MeleeWeaponColor;  // 80 1 CPF_Edit
    struct FNE_ItemColor W02_RangedWeaponColor;  // 88 1 CPF_Edit
    struct FNE_ItemColor W03_ShieldColor;  // 90 1 CPF_Edit
    struct FNE_ItemColor C01_ChestColor;  // 98 1 CPF_Edit
    struct FNE_ItemColor C02_LeftGloveColor;  // A0 1 CPF_Edit
    struct FNE_ItemColor C03_RightGloveColor;  // A8 1 CPF_Edit
    struct FNE_ItemColor C04_PantsColor;  // B0 1 CPF_Edit
    struct FNE_ItemColor C05_ShoesColor;  // B8 1 CPF_Edit
    struct FNE_ItemColor C_AllClothing;  // C0 2001 CPF_Edit CPF_Transient
    struct FNE_ItemColor A01_HelmetColor;  // C8 1 CPF_Edit
    struct FNE_ItemColor A02_RightShoulderColor;  // D0 1 CPF_Edit
    struct FNE_ItemColor A03_LeftShoulderColor;  // D8 1 CPF_Edit
    struct FNE_ItemColor A04_RightGauntletColor;  // E0 1 CPF_Edit
    struct FNE_ItemColor A05_LeftGauntletColor;  // E8 1 CPF_Edit
    struct FNE_ItemColor A06_ChestArmourColor;  // F0 1 CPF_Edit
    struct FNE_ItemColor A07_BeltColor;  // F8 1 CPF_Edit
    struct FNE_ItemColor A08_LeftThighColor;  // 100 1 CPF_Edit
    struct FNE_ItemColor A09_RightThighColor;  // 108 1 CPF_Edit
    struct FNE_ItemColor A10_LeftShinColor;  // 110 1 CPF_Edit
    struct FNE_ItemColor A11_RightShinColor;  // 118 1 CPF_Edit
    struct FNE_ItemColor A_AllArmour;  // 120 2001 CPF_Edit CPF_Transient
    virtual ~UNE_SlotsFullColor(void);
    virtual unsigned int GetCPPSize(void);
    virtual void edApply(class UGame_EquippedAppearance *);
    virtual void edUnApply(class UGame_EquippedAppearance *);
    UNE_SlotsFullColor(class UNE_SlotsFullColor const &);
    UNE_SlotsFullColor(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNE_SlotsFullColor & operator=(class UNE_SlotsFullColor const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NE_Slots
//------------------------------------------------------------------------------

//  NE_Slots.Apply 20002 0 ( FUNC_Defined FUNC_Public )
struct UNE_Slots_execApply_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  NE_Slots.PutItem 80002 0 ( FUNC_Defined FUNC_Protected )
struct UNE_Slots_execPutItem_Parms {
  class UItem_Type* aItem;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  TArray<class UItem_Type*> oItems;  // 4 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


// UNE_Slots 2012 ( CLASS_Compiled CLASS_Parsed CLASS_CollapseCategories )
class DLL_IMPORT UNE_Slots : public UNE_SlotsBase {
  public:
    BYTE ClothColor1;  // 80 1 CPF_Edit
    BYTE ClothColor2;  // 81 1 CPF_Edit
    BYTE ArmorColor1;  // 82 1 CPF_Edit
    BYTE ArmorColor2;  // 83 1 CPF_Edit
    virtual ~UNE_Slots(void);
    virtual unsigned int GetCPPSize(void);
    virtual void edApply(class UGame_EquippedAppearance *);
    virtual void edUnApply(class UGame_EquippedAppearance *);
    UNE_Slots(class UNE_Slots const &);
    UNE_Slots(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNE_Slots & operator=(class UNE_Slots const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NE_Standard
//------------------------------------------------------------------------------

//  NE_Standard.Apply 20002 0 ( FUNC_Defined FUNC_Public )
struct UNE_Standard_execApply_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


// UNE_Standard 2012 ( CLASS_Compiled CLASS_Parsed CLASS_CollapseCategories )
class DLL_IMPORT UNE_Standard : public UNPC_Equipment {
  public:
    TArray<class UItem_Type*> Items;  // 28 14400001 CPF_Edit CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    BYTE Color1;  // 34 1 CPF_Edit
    BYTE Color2;  // 35 1 CPF_Edit
    virtual ~UNE_Standard(void);
    virtual unsigned int GetCPPSize(void);
    virtual void edApply(class UGame_EquippedAppearance *);
    UNE_Standard(class UNE_Standard const &);
    UNE_Standard(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNE_Standard & operator=(class UNE_Standard const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_NPNCPawn
//------------------------------------------------------------------------------

// ANPC_NPNCPawn 236 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ANPC_NPNCPawn : public AGame_NPCPawn {
  public:
    virtual ~ANPC_NPNCPawn(void);
    virtual unsigned int GetCPPSize(void);
    ANPC_NPNCPawn(class ANPC_NPNCPawn const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ANPC_NPNCPawn & operator=(class ANPC_NPNCPawn const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_NPC_NPNCPAWN_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_NPC_NPNCPAWN_LOGIN_STREAM const &);
  protected:
    ANPC_NPNCPawn(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_CharacterPawn
//------------------------------------------------------------------------------

// ANPC_CharacterPawn 236 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ANPC_CharacterPawn : public AGame_NPCPawn {
  public:
    virtual ~ANPC_CharacterPawn(void);
    virtual unsigned int GetCPPSize(void);
    ANPC_CharacterPawn(class ANPC_CharacterPawn const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ANPC_CharacterPawn & operator=(class ANPC_CharacterPawn const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_NPC_CHARACTERPAWN_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_NPC_CHARACTERPAWN_LOGIN_STREAM const &);
  protected:
    ANPC_CharacterPawn(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_HumanoidPawn
//------------------------------------------------------------------------------

// ANPC_HumanoidPawn 236 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ANPC_HumanoidPawn : public AGame_NPCPawn {
  public:
    virtual ~ANPC_HumanoidPawn(void);
    virtual unsigned int GetCPPSize(void);
    ANPC_HumanoidPawn(class ANPC_HumanoidPawn const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ANPC_HumanoidPawn & operator=(class ANPC_HumanoidPawn const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_NPC_HUMANOIDPAWN_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_NPC_HUMANOIDPAWN_LOGIN_STREAM const &);
  protected:
    ANPC_HumanoidPawn(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_MonsterPawn
//------------------------------------------------------------------------------

//  NPC_MonsterPawn.cl_GetSecondaryDisplayName 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ANPC_MonsterPawn_eventcl_GetSecondaryDisplayName_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// ANPC_MonsterPawn 236 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ANPC_MonsterPawn : public AGame_NPCPawn {
  public:
    virtual ~ANPC_MonsterPawn(void);
    virtual unsigned int GetCPPSize(void);
    ANPC_MonsterPawn(class ANPC_MonsterPawn const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ANPC_MonsterPawn & operator=(class ANPC_MonsterPawn const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_NPC_MONSTERPAWN_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_NPC_MONSTERPAWN_LOGIN_STREAM const &);
  protected:
    ANPC_MonsterPawn(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_CivilianPawn
//------------------------------------------------------------------------------

// ANPC_CivilianPawn 236 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ANPC_CivilianPawn : public AGame_NPCPawn {
  public:
    virtual ~ANPC_CivilianPawn(void);
    virtual unsigned int GetCPPSize(void);
    ANPC_CivilianPawn(class ANPC_CivilianPawn const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ANPC_CivilianPawn & operator=(class ANPC_CivilianPawn const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_NPC_CIVILIANPAWN_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_NPC_CIVILIANPAWN_LOGIN_STREAM const &);
  protected:
    ANPC_CivilianPawn(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NS_Rotator
//------------------------------------------------------------------------------

enum ERotStatPriority {
  ERSP_Body = 0,
  ERSP_Focus = 1,
  ERSP_Mind = 2
};

//  NS_Rotator.GetPointsForStat 80002 0 ( FUNC_Defined FUNC_Protected )
struct UNS_Rotator_execGetPointsForStat_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  BYTE aStat;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Rotator.GetFocus 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Rotator_execGetFocus_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Rotator.GetMind 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Rotator_execGetMind_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Rotator.GetBody 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Rotator_execGetBody_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Rotator.GetHitpointsPerLevel 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Rotator_execGetHitpointsPerLevel_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Rotator.GetBaseHitpoints 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Rotator_execGetBaseHitpoints_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UNS_Rotator 201012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew )
class DLL_IMPORT UNS_Rotator : public UNPC_StatTable {
  public:
    TArray<BYTE> Rotation;  // 4C 400001 CPF_Edit CPF_NeedCtorLink
    INT DefaultBody;  // 58 2000001 CPF_Edit CPF_EditorData
    INT DefaultMind;  // 5C 2000001 CPF_Edit CPF_EditorData
    INT DefaultFocus;  // 60 2000001 CPF_Edit CPF_EditorData
    INT Hitpoints;  // 64 1 CPF_Edit
    INT HpPerLevel;  // 68 1 CPF_Edit
    virtual ~UNS_Rotator(void);
    virtual unsigned int GetCPPSize(void);
    UNS_Rotator(class UNS_Rotator const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNS_Rotator & operator=(class UNS_Rotator const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UNS_Rotator(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NS_Fixed
//------------------------------------------------------------------------------

//  NS_Fixed.GetFocus 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Fixed_execGetFocus_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Fixed.GetMind 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Fixed_execGetMind_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Fixed.GetBody 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Fixed_execGetBody_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Fixed.GetHitpointsPerLevel 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Fixed_execGetHitpointsPerLevel_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  NS_Fixed.GetBaseHitpoints 20002 0 ( FUNC_Defined FUNC_Public )
struct UNS_Fixed_execGetBaseHitpoints_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UNS_Fixed 201012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew )
class DLL_IMPORT UNS_Fixed : public UNPC_StatTable {
  public:
    INT Body;  // 4C 1 CPF_Edit
    INT Mind;  // 50 1 CPF_Edit
    INT Focus;  // 54 1 CPF_Edit
    INT Hitpoints;  // 58 1 CPF_Edit
    virtual ~UNS_Fixed(void);
    virtual unsigned int GetCPPSize(void);
    UNS_Fixed(class UNS_Fixed const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNS_Fixed & operator=(class UNS_Fixed const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UNS_Fixed(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_Humanoid
//------------------------------------------------------------------------------

// UNPC_Humanoid 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_Humanoid : public UNPC_Type {
  public:
    virtual ~UNPC_Humanoid(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UNPC_Humanoid(class UNPC_Humanoid const &);
    UNPC_Humanoid(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_Humanoid & operator=(class UNPC_Humanoid const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_Class
//------------------------------------------------------------------------------

// UNPC_Class 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_Class : public UNPC_Humanoid {
  public:
    TArray<BYTE> ClassTypes;  // 104 400001 CPF_Edit CPF_NeedCtorLink
    INT ClassRank;  // 110 1 CPF_Edit
    virtual ~UNPC_Class(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool MatchClassType(enum ENPCClassType);
    virtual int GetClassRank(void);
    UNPC_Class(class UNPC_Class const &);
    UNPC_Class(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_Class & operator=(class UNPC_Class const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_Boss
//------------------------------------------------------------------------------

// UNPC_Boss 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_Boss : public UNPC_Class {
  public:
    virtual ~UNPC_Boss(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UNPC_Boss(class UNPC_Boss const &);
    UNPC_Boss(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_Boss & operator=(class UNPC_Boss const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_Monster
//------------------------------------------------------------------------------

// UNPC_Monster 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_Monster : public UNPC_Type {
  public:
    virtual ~UNPC_Monster(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UNPC_Monster(class UNPC_Monster const &);
    UNPC_Monster(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_Monster & operator=(class UNPC_Monster const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_MonsterClass
//------------------------------------------------------------------------------

// UNPC_MonsterClass 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_MonsterClass : public UNPC_Monster {
  public:
    TArray<BYTE> ClassTypes;  // 104 400001 CPF_Edit CPF_NeedCtorLink
    INT ClassRank;  // 110 1 CPF_Edit
    virtual ~UNPC_MonsterClass(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool MatchClassType(enum ENPCClassType);
    virtual int GetClassRank(void);
    UNPC_MonsterClass(class UNPC_MonsterClass const &);
    UNPC_MonsterClass(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_MonsterClass & operator=(class UNPC_MonsterClass const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_Quest
//------------------------------------------------------------------------------

//  NPC_Quest.cl_OnInit 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UNPC_Quest_eventcl_OnInit_Parms {
  class AGame_NPCPawn* aPawn;  // 0 80 CPF_Parm
};


// UNPC_Quest 200013 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_Quest : public UNPC_Type {
  public:
    virtual ~UNPC_Quest(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UNPC_Quest(class UNPC_Quest const &);
    UNPC_Quest(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_Quest & operator=(class UNPC_Quest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_NPNC
//------------------------------------------------------------------------------

// UNPC_NPNC 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_NPNC : public UNPC_Quest {
  public:
    virtual ~UNPC_NPNC(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UNPC_NPNC(class UNPC_NPNC const &);
    UNPC_NPNC(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_NPNC & operator=(class UNPC_NPNC const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_Civilian
//------------------------------------------------------------------------------

// UNPC_Civilian 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_Civilian : public UNPC_Quest {
  public:
    virtual ~UNPC_Civilian(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UNPC_Civilian(class UNPC_Civilian const &);
    UNPC_Civilian(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_Civilian & operator=(class UNPC_Civilian const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NPC_Character
//------------------------------------------------------------------------------

// UNPC_Character 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNPC_Character : public UNPC_Quest {
  public:
    virtual ~UNPC_Character(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UNPC_Character(class UNPC_Character const &);
    UNPC_Character(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNPC_Character & operator=(class UNPC_Character const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBAppearance_Set
//------------------------------------------------------------------------------

//  SBAppearance_Set.OnInit 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct USBAppearance_Set_eventOnInit_Parms {
};


// USBAppearance_Set 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBAppearance_Set : public UAppearance_Set {
  public:
    virtual ~USBAppearance_Set(void);
    virtual unsigned int GetCPPSize(void);
    USBAppearance_Set(class USBAppearance_Set const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBAppearance_Set & operator=(class USBAppearance_Set const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBAppearance_Set(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_WeaponShield
//------------------------------------------------------------------------------

//  Item_WeaponShield.GetWeaponType 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UItem_WeaponShield_eventGetWeaponType_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UItem_WeaponShield 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_WeaponShield : public UItem_Type {
  public:
    virtual ~UItem_WeaponShield(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_WeaponShield(class UItem_WeaponShield const &);
    UItem_WeaponShield(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_WeaponShield & operator=(class UItem_WeaponShield const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_WeaponRanged
//------------------------------------------------------------------------------

//  Item_WeaponRanged.GetWeaponType 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UItem_WeaponRanged_eventGetWeaponType_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UItem_WeaponRanged 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_WeaponRanged : public UItem_Type {
  public:
    virtual ~UItem_WeaponRanged(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_WeaponRanged(class UItem_WeaponRanged const &);
    UItem_WeaponRanged(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_WeaponRanged & operator=(class UItem_WeaponRanged const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_WeaponQualityToken
//------------------------------------------------------------------------------

// UItem_WeaponQualityToken 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_WeaponQualityToken : public UItem_Type {
  public:
    virtual ~UItem_WeaponQualityToken(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_WeaponQualityToken(class UItem_WeaponQualityToken const &);
    UItem_WeaponQualityToken(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_WeaponQualityToken & operator=(class UItem_WeaponQualityToken const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_WeaponOneHanded
//------------------------------------------------------------------------------

//  Item_WeaponOneHanded.GetWeaponType 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UItem_WeaponOneHanded_eventGetWeaponType_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UItem_WeaponOneHanded 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_WeaponOneHanded : public UItem_Type {
  public:
    virtual ~UItem_WeaponOneHanded(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_WeaponOneHanded(class UItem_WeaponOneHanded const &);
    UItem_WeaponOneHanded(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_WeaponOneHanded & operator=(class UItem_WeaponOneHanded const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_WeaponDualWielding
//------------------------------------------------------------------------------

//  Item_WeaponDualWielding.GetWeaponType 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UItem_WeaponDualWielding_eventGetWeaponType_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UItem_WeaponDualWielding 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_WeaponDualWielding : public UItem_Type {
  public:
    virtual ~UItem_WeaponDualWielding(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_WeaponDualWielding(class UItem_WeaponDualWielding const &);
    UItem_WeaponDualWielding(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_WeaponDualWielding & operator=(class UItem_WeaponDualWielding const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_WeaponDoubleHanded
//------------------------------------------------------------------------------

//  Item_WeaponDoubleHanded.GetWeaponType 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UItem_WeaponDoubleHanded_eventGetWeaponType_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UItem_WeaponDoubleHanded 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_WeaponDoubleHanded : public UItem_Type {
  public:
    virtual ~UItem_WeaponDoubleHanded(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_WeaponDoubleHanded(class UItem_WeaponDoubleHanded const &);
    UItem_WeaponDoubleHanded(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_WeaponDoubleHanded & operator=(class UItem_WeaponDoubleHanded const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_Trophy
//------------------------------------------------------------------------------

// UItem_Trophy 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_Trophy : public UItem_Type {
  public:
    virtual ~UItem_Trophy(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_Trophy(class UItem_Trophy const &);
    UItem_Trophy(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_Trophy & operator=(class UItem_Trophy const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_SkillToken
//------------------------------------------------------------------------------

// UItem_SkillToken 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_SkillToken : public UItem_Type {
  public:
    virtual ~UItem_SkillToken(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_SkillToken(class UItem_SkillToken const &);
    UItem_SkillToken(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_SkillToken & operator=(class UItem_SkillToken const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_Resource
//------------------------------------------------------------------------------

// UItem_Resource 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_Resource : public UItem_Type {
  public:
    virtual ~UItem_Resource(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_Resource(class UItem_Resource const &);
    UItem_Resource(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_Resource & operator=(class UItem_Resource const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_Recipe
//------------------------------------------------------------------------------

// UItem_Recipe 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_Recipe : public UItem_Type {
  public:
    virtual ~UItem_Recipe(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_Recipe(class UItem_Recipe const &);
    UItem_Recipe(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_Recipe & operator=(class UItem_Recipe const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_QuestItem
//------------------------------------------------------------------------------

// UItem_QuestItem 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_QuestItem : public UItem_Type {
  public:
    virtual ~UItem_QuestItem(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_QuestItem(class UItem_QuestItem const &);
    UItem_QuestItem(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_QuestItem & operator=(class UItem_QuestItem const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_MiscellaneousTickets
//------------------------------------------------------------------------------

// UItem_MiscellaneousTickets 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_MiscellaneousTickets : public UItem_Type {
  public:
    virtual ~UItem_MiscellaneousTickets(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_MiscellaneousTickets(class UItem_MiscellaneousTickets const &);
    UItem_MiscellaneousTickets(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_MiscellaneousTickets & operator=(class UItem_MiscellaneousTickets const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_MiscellaneousLabyrinthKey
//------------------------------------------------------------------------------

// UItem_MiscellaneousLabyrinthKey 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_MiscellaneousLabyrinthKey : public UItem_Type {
  public:
    virtual ~UItem_MiscellaneousLabyrinthKey(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_MiscellaneousLabyrinthKey(class UItem_MiscellaneousLabyrinthKey const &);
    UItem_MiscellaneousLabyrinthKey(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_MiscellaneousLabyrinthKey & operator=(class UItem_MiscellaneousLabyrinthKey const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_MiscellaneousKey
//------------------------------------------------------------------------------

// UItem_MiscellaneousKey 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_MiscellaneousKey : public UItem_Type {
  public:
    virtual ~UItem_MiscellaneousKey(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_MiscellaneousKey(class UItem_MiscellaneousKey const &);
    UItem_MiscellaneousKey(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_MiscellaneousKey & operator=(class UItem_MiscellaneousKey const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_JewelryRing
//------------------------------------------------------------------------------

// UItem_JewelryRing 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_JewelryRing : public UItem_Type {
  public:
    virtual ~UItem_JewelryRing(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_JewelryRing(class UItem_JewelryRing const &);
    UItem_JewelryRing(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_JewelryRing & operator=(class UItem_JewelryRing const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_JewelryQualityToken
//------------------------------------------------------------------------------

// UItem_JewelryQualityToken 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_JewelryQualityToken : public UItem_Type {
  public:
    virtual ~UItem_JewelryQualityToken(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_JewelryQualityToken(class UItem_JewelryQualityToken const &);
    UItem_JewelryQualityToken(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_JewelryQualityToken & operator=(class UItem_JewelryQualityToken const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_JewelryNecklace
//------------------------------------------------------------------------------

// UItem_JewelryNecklace 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_JewelryNecklace : public UItem_Type {
  public:
    virtual ~UItem_JewelryNecklace(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_JewelryNecklace(class UItem_JewelryNecklace const &);
    UItem_JewelryNecklace(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_JewelryNecklace & operator=(class UItem_JewelryNecklace const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ItemToken
//------------------------------------------------------------------------------

// UItem_ItemToken 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ItemToken : public UItem_Type {
  public:
    virtual ~UItem_ItemToken(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ItemToken(class UItem_ItemToken const &);
    UItem_ItemToken(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ItemToken & operator=(class UItem_ItemToken const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ContainerSuitBag
//------------------------------------------------------------------------------

// UItem_ContainerSuitBag 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ContainerSuitBag : public UItem_Type {
  public:
    virtual ~UItem_ContainerSuitBag(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ContainerSuitBag(class UItem_ContainerSuitBag const &);
    UItem_ContainerSuitBag(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ContainerSuitBag & operator=(class UItem_ContainerSuitBag const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ContainerExtraInventory
//------------------------------------------------------------------------------

// UItem_ContainerExtraInventory 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ContainerExtraInventory : public UItem_Type {
  public:
    virtual ~UItem_ContainerExtraInventory(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ContainerExtraInventory(class UItem_ContainerExtraInventory const &);
    UItem_ContainerExtraInventory(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ContainerExtraInventory & operator=(class UItem_ContainerExtraInventory const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_Consumable
//------------------------------------------------------------------------------

// UItem_Consumable 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_Consumable : public UItem_Type {
  public:
    virtual ~UItem_Consumable(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_Consumable(class UItem_Consumable const &);
    UItem_Consumable(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_Consumable & operator=(class UItem_Consumable const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ClothShoes
//------------------------------------------------------------------------------

// UItem_ClothShoes 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ClothShoes : public UItem_Type {
  public:
    virtual ~UItem_ClothShoes(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ClothShoes(class UItem_ClothShoes const &);
    UItem_ClothShoes(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ClothShoes & operator=(class UItem_ClothShoes const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ClothRightGlove
//------------------------------------------------------------------------------

// UItem_ClothRightGlove 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ClothRightGlove : public UItem_Type {
  public:
    virtual ~UItem_ClothRightGlove(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ClothRightGlove(class UItem_ClothRightGlove const &);
    UItem_ClothRightGlove(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ClothRightGlove & operator=(class UItem_ClothRightGlove const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ClothPants
//------------------------------------------------------------------------------

// UItem_ClothPants 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ClothPants : public UItem_Type {
  public:
    virtual ~UItem_ClothPants(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ClothPants(class UItem_ClothPants const &);
    UItem_ClothPants(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ClothPants & operator=(class UItem_ClothPants const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ClothLeftGlove
//------------------------------------------------------------------------------

// UItem_ClothLeftGlove 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ClothLeftGlove : public UItem_Type {
  public:
    virtual ~UItem_ClothLeftGlove(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ClothLeftGlove(class UItem_ClothLeftGlove const &);
    UItem_ClothLeftGlove(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ClothLeftGlove & operator=(class UItem_ClothLeftGlove const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ClothChest
//------------------------------------------------------------------------------

// UItem_ClothChest 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ClothChest : public UItem_Type {
  public:
    virtual ~UItem_ClothChest(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ClothChest(class UItem_ClothChest const &);
    UItem_ClothChest(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ClothChest & operator=(class UItem_ClothChest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_Broken
//------------------------------------------------------------------------------

// UItem_Broken 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_Broken : public UItem_Type {
  public:
    virtual ~UItem_Broken(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_Broken(class UItem_Broken const &);
    UItem_Broken(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_Broken & operator=(class UItem_Broken const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_BodySlot
//------------------------------------------------------------------------------

// UItem_BodySlot 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_BodySlot : public UItem_Type {
  public:
    virtual ~UItem_BodySlot(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_BodySlot(class UItem_BodySlot const &);
    UItem_BodySlot(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_BodySlot & operator=(class UItem_BodySlot const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorRightThigh
//------------------------------------------------------------------------------

// UItem_ArmorRightThigh 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorRightThigh : public UItem_Type {
  public:
    virtual ~UItem_ArmorRightThigh(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorRightThigh(class UItem_ArmorRightThigh const &);
    UItem_ArmorRightThigh(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorRightThigh & operator=(class UItem_ArmorRightThigh const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorLeftThigh
//------------------------------------------------------------------------------

// UItem_ArmorLeftThigh 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorLeftThigh : public UItem_Type {
  public:
    virtual ~UItem_ArmorLeftThigh(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorLeftThigh(class UItem_ArmorLeftThigh const &);
    UItem_ArmorLeftThigh(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorLeftThigh & operator=(class UItem_ArmorLeftThigh const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorRightShin
//------------------------------------------------------------------------------

// UItem_ArmorRightShin 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorRightShin : public UItem_Type {
  public:
    virtual ~UItem_ArmorRightShin(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorRightShin(class UItem_ArmorRightShin const &);
    UItem_ArmorRightShin(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorRightShin & operator=(class UItem_ArmorRightShin const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorLeftShin
//------------------------------------------------------------------------------

// UItem_ArmorLeftShin 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorLeftShin : public UItem_Type {
  public:
    virtual ~UItem_ArmorLeftShin(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorLeftShin(class UItem_ArmorLeftShin const &);
    UItem_ArmorLeftShin(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorLeftShin & operator=(class UItem_ArmorLeftShin const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorRightShoulder
//------------------------------------------------------------------------------

// UItem_ArmorRightShoulder 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorRightShoulder : public UItem_Type {
  public:
    virtual ~UItem_ArmorRightShoulder(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorRightShoulder(class UItem_ArmorRightShoulder const &);
    UItem_ArmorRightShoulder(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorRightShoulder & operator=(class UItem_ArmorRightShoulder const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorRightGauntlet
//------------------------------------------------------------------------------

// UItem_ArmorRightGauntlet 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorRightGauntlet : public UItem_Type {
  public:
    virtual ~UItem_ArmorRightGauntlet(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorRightGauntlet(class UItem_ArmorRightGauntlet const &);
    UItem_ArmorRightGauntlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorRightGauntlet & operator=(class UItem_ArmorRightGauntlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorLeftShoulder
//------------------------------------------------------------------------------

// UItem_ArmorLeftShoulder 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorLeftShoulder : public UItem_Type {
  public:
    virtual ~UItem_ArmorLeftShoulder(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorLeftShoulder(class UItem_ArmorLeftShoulder const &);
    UItem_ArmorLeftShoulder(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorLeftShoulder & operator=(class UItem_ArmorLeftShoulder const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorLeftGauntlet
//------------------------------------------------------------------------------

// UItem_ArmorLeftGauntlet 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorLeftGauntlet : public UItem_Type {
  public:
    virtual ~UItem_ArmorLeftGauntlet(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorLeftGauntlet(class UItem_ArmorLeftGauntlet const &);
    UItem_ArmorLeftGauntlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorLeftGauntlet & operator=(class UItem_ArmorLeftGauntlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorHeadGear
//------------------------------------------------------------------------------

// UItem_ArmorHeadGear 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorHeadGear : public UItem_Type {
  public:
    virtual ~UItem_ArmorHeadGear(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorHeadGear(class UItem_ArmorHeadGear const &);
    UItem_ArmorHeadGear(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorHeadGear & operator=(class UItem_ArmorHeadGear const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorChest
//------------------------------------------------------------------------------

// UItem_ArmorChest 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorChest : public UItem_Type {
  public:
    virtual ~UItem_ArmorChest(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorChest(class UItem_ArmorChest const &);
    UItem_ArmorChest(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorChest & operator=(class UItem_ArmorChest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Item_ArmorBelt
//------------------------------------------------------------------------------

// UItem_ArmorBelt 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UItem_ArmorBelt : public UItem_Type {
  public:
    virtual ~UItem_ArmorBelt(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UItem_ArmorBelt(class UItem_ArmorBelt const &);
    UItem_ArmorBelt(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UItem_ArmorBelt & operator=(class UItem_ArmorBelt const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QC_CarryItem
//------------------------------------------------------------------------------

// UQC_CarryItem 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQC_CarryItem : public UQuest_Condition {
  public:
    class UContent_Inventory* Cargo;  // 64 20003 CPF_Edit CPF_Const CPF_EditConst
    virtual ~UQC_CarryItem(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    virtual int IsInvisible(void);
    UQC_CarryItem(class UQC_CarryItem const &);
    UQC_CarryItem(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQC_CarryItem & operator=(class UQC_CarryItem const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QC_Timed
//------------------------------------------------------------------------------

//  QC_Timed.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQC_Timed_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QC_Timed.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQC_Timed_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQC_Timed 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQC_Timed : public UQuest_Condition {
  public:
    INT Seconds;  // 64 3 CPF_Edit CPF_Const
    virtual ~UQC_Timed(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual void sv_Detach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int Failed(int);
    virtual int GetFailedProgressValue(void);
    UQC_Timed(class UQC_Timed const &);
    UQC_Timed(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQC_Timed & operator=(class UQC_Timed const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QC_Survival
//------------------------------------------------------------------------------

//  QC_Survival.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQC_Survival_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQC_Survival 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQC_Survival : public UQuest_Condition {
  public:
    FLOAT DefeatFraction;  // 64 3 CPF_Edit CPF_Const
    virtual ~UQC_Survival(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    UQC_Survival(class UQC_Survival const &);
    UQC_Survival(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQC_Survival & operator=(class UQC_Survival const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QC_Stealth
//------------------------------------------------------------------------------

//  QC_Stealth.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQC_Stealth_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQC_Stealth 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQC_Stealth : public UQuest_Condition {
  public:
    TArray<class UNPC_Type*> NamedTargets;  // 64 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    TArray<class UNPC_Taxonomy*> GroupedTargets;  // 70 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UQC_Stealth(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    UQC_Stealth(class UQC_Stealth const &);
    UQC_Stealth(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQC_Stealth & operator=(class UQC_Stealth const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QC_Protect
//------------------------------------------------------------------------------

//  QC_Protect.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQC_Protect_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QC_Protect.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQC_Protect_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQC_Protect 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQC_Protect : public UQuest_Condition {
  public:
    TArray<class UNPC_Type*> Targets;  // 64 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT Slack;  // 70 3 CPF_Edit CPF_Const
    virtual ~UQC_Protect(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int Failed(int);
    virtual int usesKilledHook(class UNPC_Type *);
    virtual int GetFailedProgressValue(void);
    UQC_Protect(class UQC_Protect const &);
    UQC_Protect(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQC_Protect & operator=(class UQC_Protect const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Wait
//------------------------------------------------------------------------------

//  QT_Wait.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Wait_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Wait.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Wait_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Wait 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Wait : public UQuest_Target {
  public:
    INT Seconds;  // 58 3 CPF_Edit CPF_Const
    virtual ~UQT_Wait(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    UQT_Wait(class UQT_Wait const &);
    UQT_Wait(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Wait & operator=(class UQT_Wait const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Subquest
//------------------------------------------------------------------------------

//  QT_Subquest.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Subquest_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Subquest.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Subquest_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Subquest 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Subquest : public UQuest_Target {
  public:
    class UQuest_Type* SubQuest;  // 58 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    virtual ~UQT_Subquest(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    UQT_Subquest(class UQT_Subquest const &);
    UQT_Subquest(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Subquest & operator=(class UQT_Subquest const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_UseOn
//------------------------------------------------------------------------------

//  QT_UseOn.GetTarget 80401 0 ( FUNC_Final FUNC_Native FUNC_Protected )
struct UQT_UseOn_execGetTarget_Parms {
  class UNPC_Type* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  QT_UseOn.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_UseOn_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_UseOn.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_UseOn_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_UseOn.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_UseOn_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_UseOn.RadialMenuCollect 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_UseOn_eventRadialMenuCollect_Parms {
  class AGame_Pawn* aPlayerPawn;  // 0 80 CPF_Parm
  class UObject* aObject;  // 4 80 CPF_Parm
  BYTE aMainOption;  // 8 80 CPF_Parm
  TArray<BYTE> aSubOptions;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


// UQT_UseOn 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_UseOn : public UQuest_Target {
  public:
    class UItem_Type* Item;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UNPC_Type* Target;  // 5C 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT Amount;  // 60 3 CPF_Edit CPF_Const
    BYTE Option;  // 64 1 CPF_Edit
    virtual ~UQT_UseOn(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_UseOn(class UQT_UseOn const &);
    UQT_UseOn(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_UseOn & operator=(class UQT_UseOn const &);
    class UNPC_Type * GetTarget(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetTarget(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UQT_UseOn,0,execGetTarget)


//------------------------------------------------------------------------------
//  QT_UseAt
//------------------------------------------------------------------------------

//  QT_UseAt.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_UseAt_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_UseAt.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_UseAt_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_UseAt.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_UseAt_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_UseAt.RadialMenuCollect 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_UseAt_eventRadialMenuCollect_Parms {
  class AGame_Pawn* aPlayerPawn;  // 0 80 CPF_Parm
  class UObject* aObject;  // 4 80 CPF_Parm
  BYTE aMainOption;  // 8 80 CPF_Parm
  TArray<BYTE> aSubOptions;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


// UQT_UseAt 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_UseAt : public UQuest_Target {
  public:
    class UItem_Type* Item;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    FName UseLocationTag;  // 5C 1 CPF_Edit
    struct FLocalizedString LocationDescription;  // 60 400001 CPF_Edit CPF_NeedCtorLink
    INT Amount;  // 6C 3 CPF_Edit CPF_Const
    BYTE Option;  // 70 1 CPF_Edit
    virtual ~UQT_UseAt(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_UseAt(class UQT_UseAt const &);
    UQT_UseAt(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_UseAt & operator=(class UQT_UseAt const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Use
//------------------------------------------------------------------------------

//  QT_Use.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Use_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Use.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Use_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Use.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Use_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Use.RadialMenuCollect 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Use_eventRadialMenuCollect_Parms {
  class AGame_Pawn* aPlayerPawn;  // 0 80 CPF_Parm
  class UObject* aObject;  // 4 80 CPF_Parm
  BYTE aMainOption;  // 8 80 CPF_Parm
  TArray<BYTE> aSubOptions;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


// UQT_Use 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Use : public UQuest_Target {
  public:
    class UItem_Type* Item;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    BYTE Option;  // 5C 1 CPF_Edit
    INT Amount;  // 60 3 CPF_Edit CPF_Const
    virtual ~UQT_Use(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_Use(class UQT_Use const &);
    UQT_Use(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Use & operator=(class UQT_Use const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Take
//------------------------------------------------------------------------------

//  QT_Take.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Take_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Take.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Take_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Take.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Take_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Take.RadialMenuCollect 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Take_eventRadialMenuCollect_Parms {
  class AGame_Pawn* aPlayerPawn;  // 0 80 CPF_Parm
  class UObject* aObject;  // 4 80 CPF_Parm
  BYTE aMainOption;  // 8 80 CPF_Parm
  TArray<BYTE> aSubOptions;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


// UQT_Take 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Take : public UQuest_Target {
  public:
    class UContent_Inventory* Cargo;  // 58 20003 CPF_Edit CPF_Const CPF_EditConst
    FName SourceTag;  // 5C 1 CPF_Edit
    struct FLocalizedString SourceDescription;  // 60 400001 CPF_Edit CPF_NeedCtorLink
    BYTE Option;  // 6C 1 CPF_Edit
    INT Amount;  // 70 3 CPF_Edit CPF_Const
    virtual ~UQT_Take(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_Take(class UQT_Take const &);
    UQT_Take(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Take & operator=(class UQT_Take const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Place
//------------------------------------------------------------------------------

//  QT_Place.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Place_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Place.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Place_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Place.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Place_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Place.RadialMenuCollect 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Place_eventRadialMenuCollect_Parms {
  class AGame_Pawn* aPlayerPawn;  // 0 80 CPF_Parm
  class UObject* aObject;  // 4 80 CPF_Parm
  BYTE aMainOption;  // 8 80 CPF_Parm
  TArray<BYTE> aSubOptions;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


// UQT_Place 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Place : public UQuest_Target {
  public:
    class UContent_Inventory* Cargo;  // 58 20003 CPF_Edit CPF_Const CPF_EditConst
    FName TargetTag;  // 5C 1 CPF_Edit
    struct FLocalizedString TargetDescription;  // 60 400001 CPF_Edit CPF_NeedCtorLink
    BYTE Option;  // 6C 1 CPF_Edit
    INT Amount;  // 70 3 CPF_Edit CPF_Const
    virtual ~UQT_Place(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_Place(class UQT_Place const &);
    UQT_Place(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Place & operator=(class UQT_Place const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Destroy
//------------------------------------------------------------------------------

//  QT_Destroy.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Destroy_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Destroy.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Destroy_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Destroy.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Destroy_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Destroy 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Destroy : public UQuest_Target {
  public:
    class UNPC_Type* Target;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT Amount;  // 5C 3 CPF_Edit CPF_Const
    virtual ~UQT_Destroy(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    UQT_Destroy(class UQT_Destroy const &);
    UQT_Destroy(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Destroy & operator=(class UQT_Destroy const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Deliver
//------------------------------------------------------------------------------

//  QT_Deliver.GetTarget 80401 0 ( FUNC_Final FUNC_Native FUNC_Protected )
struct UQT_Deliver_execGetTarget_Parms {
  class UNPC_Type* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  QT_Deliver.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Deliver_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Deliver.sv_OnComplete 20002 0 ( FUNC_Defined FUNC_Public )
struct UQT_Deliver_execsv_OnComplete_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class AGame_Pawn* aTargetPawn;  // 4 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  QT_Deliver.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Deliver_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Deliver.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Deliver_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Deliver 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Deliver : public UQuest_Target {
  public:
    class UNPC_Type* Address;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UItem_Type* Cargo;  // 5C 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT Amount;  // 60 3 CPF_Edit CPF_Const
    class UConversation_Topic* DeliveryConversation;  // 64 442000B CPF_Edit CPF_Const CPF_ExportObject CPF_EditConst CPF_NeedCtorLink CPF_EditInline
    virtual ~UQT_Deliver(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual class UConversation_Topic * GetConversation(void);
    virtual int GetCompletedProgressValue(void);
    virtual class UNPC_Type * GetConversator(void);
    virtual int Check(int);
    virtual int NearlyDone(int);
    virtual int ComputeValue(class AGame_Pawn *);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_Deliver(class UQT_Deliver const &);
    UQT_Deliver(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Deliver & operator=(class UQT_Deliver const &);
    class UNPC_Type * GetTarget(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetTarget(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UQT_Deliver,0,execGetTarget)


//------------------------------------------------------------------------------
//  QT_Challenge
//------------------------------------------------------------------------------

//  QT_Challenge.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Challenge_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Challenge 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Challenge : public UQuest_Target {
  public:
    INT TargetWorld;  // 58 1 CPF_Edit
    FName CompletionTag;  // 5C 2000001 CPF_Edit CPF_EditorData
    FName FailureTag;  // 60 2000001 CPF_Edit CPF_EditorData
    class UItem_Type* Pass;  // 64 6400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline
    virtual ~UQT_Challenge(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int Failed(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_Challenge(class UQT_Challenge const &);
    UQT_Challenge(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Challenge & operator=(class UQT_Challenge const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_BeDefeated
//------------------------------------------------------------------------------

// UQT_BeDefeated 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_BeDefeated : public UQuest_Target {
  public:
    TArray<class UNPC_Type*> NamedTargets;  // 58 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    TArray<class UNPC_Taxonomy*> GroupedTargets;  // 64 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UConversation_Topic* VictorySpeech;  // 70 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    FLOAT DefeatFraction;  // 74 3 CPF_Edit CPF_Const
    virtual ~UQT_BeDefeated(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual void GetLocalizedStrings(class localized_string_data_vector &,struct FQuestContextInfo *);
    UQT_BeDefeated(class UQT_BeDefeated const &);
    UQT_BeDefeated(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_BeDefeated & operator=(class UQT_BeDefeated const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Reach
//------------------------------------------------------------------------------

//  QT_Reach.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Reach_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Reach.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Reach_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Reach 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Reach : public UQuest_Target {
  public:
    FName GoalTag;  // 58 1 CPF_Edit
    struct FLocalizedString GoalDescription;  // 5C 400001 CPF_Edit CPF_NeedCtorLink
    virtual ~UQT_Reach(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    UQT_Reach(class UQT_Reach const &);
    UQT_Reach(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Reach & operator=(class UQT_Reach const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Escort
//------------------------------------------------------------------------------

// UQT_Escort 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Escort : public UQuest_Target {
  public:
    FName ScriptTag;  // 58 1 CPF_Edit
    virtual ~UQT_Escort(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int Failed(int);
    UQT_Escort(class UQT_Escort const &);
    UQT_Escort(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Escort & operator=(class UQT_Escort const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Exterminate
//------------------------------------------------------------------------------

//  QT_Exterminate.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Exterminate_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Exterminate.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Exterminate_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Exterminate.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Exterminate_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Exterminate 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Exterminate : public UQuest_Target {
  public:
    class UNPC_Taxonomy* Target;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT KillAmount;  // 5C 16000003 CPF_Edit CPF_Const CPF_EditorData CPF_EditInline CPF_Unk_10000000
    virtual ~UQT_Exterminate(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    UQT_Exterminate(class UQT_Exterminate const &);
    UQT_Exterminate(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Exterminate & operator=(class UQT_Exterminate const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Gather
//------------------------------------------------------------------------------

//  QT_Gather.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Gather_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Gather.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Gather_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Gather.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Gather_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Gather 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Gather : public UQuest_Target {
  public:
    class UItem_Type* Cargo;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    TArray<class UNPC_Type*> NamedDroppers;  // 5C 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    TArray<class UNPC_Taxonomy*> GroupedDroppers;  // 68 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT Amount;  // 74 3 CPF_Edit CPF_Const
    FLOAT DropChance;  // 78 3 CPF_Edit CPF_Const
    virtual ~UQT_Gather(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_Gather(class UQT_Gather const &);
    UQT_Gather(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Gather & operator=(class UQT_Gather const &);
    int CalcDropAmount(float);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void sv_Drop(class AGame_PlayerPawn *,class AGame_Pawn *);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Interactor
//------------------------------------------------------------------------------

//  QT_Interactor.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Interactor_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Interactor.RadialMenuCollect 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Interactor_eventRadialMenuCollect_Parms {
  class AGame_Pawn* aPlayerPawn;  // 0 80 CPF_Parm
  class UObject* aObject;  // 4 80 CPF_Parm
  BYTE aMainOption;  // 8 80 CPF_Parm
  TArray<BYTE> aSubOptions;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  QT_Interactor.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Interactor_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Interactor.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Interactor_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Interactor 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Interactor : public UQuest_Target {
  public:
    FName TargetTag;  // 58 1 CPF_Edit
    BYTE Option;  // 5C 1 CPF_Edit
    struct FLocalizedString TargetDescription;  // 60 400001 CPF_Edit CPF_NeedCtorLink
    INT Amount;  // 6C 3 CPF_Edit CPF_Const
    virtual ~UQT_Interactor(void);
    virtual void PostLoad(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    UQT_Interactor(class UQT_Interactor const &);
    UQT_Interactor(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Interactor & operator=(class UQT_Interactor const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Fedex
//------------------------------------------------------------------------------

//  QT_Fedex.GetTarget 80401 0 ( FUNC_Final FUNC_Native FUNC_Protected )
struct UQT_Fedex_execGetTarget_Parms {
  class UNPC_Type* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  QT_Fedex.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Fedex_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Fedex.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Fedex_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Fedex 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Fedex : public UQuest_Target {
  public:
    class UNPC_Type* Address;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UContent_Inventory* Cargo;  // 5C 20003 CPF_Edit CPF_Const CPF_EditConst
    INT Price;  // 60 2000003 CPF_Edit CPF_Const CPF_EditorData
    class UConversation_Topic* ThankYou;  // 64 442000B CPF_Edit CPF_Const CPF_ExportObject CPF_EditConst CPF_NeedCtorLink CPF_EditInline
    virtual ~UQT_Fedex(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual class UConversation_Topic * GetConversation(void);
    virtual class UNPC_Type * GetConversator(void);
    virtual void GetLocalizedStrings(class localized_string_data_vector &,struct FQuestContextInfo *);
    virtual int NearlyDone(int);
    virtual void GetQuestInventory(int,class TArray<struct FQuestInventory> &);
    UQT_Fedex(class UQT_Fedex const &);
    UQT_Fedex(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Fedex & operator=(class UQT_Fedex const &);
    class UNPC_Type * GetTarget(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetTarget(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UQT_Fedex,0,execGetTarget)


//------------------------------------------------------------------------------
//  QT_Hunt
//------------------------------------------------------------------------------

//  QT_Hunt.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Hunt_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Hunt.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Hunt_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Hunt.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Hunt_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Hunt 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Hunt : public UQuest_Target {
  public:
    class UNPC_Type* Target;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    INT Amount;  // 5C 3 CPF_Edit CPF_Const
    virtual ~UQT_Hunt(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual int Check(int);
    UQT_Hunt(class UQT_Hunt const &);
    UQT_Hunt(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Hunt & operator=(class UQT_Hunt const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Defeat
//------------------------------------------------------------------------------

//  QT_Defeat.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Defeat_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Defeat.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Defeat_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Defeat 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Defeat : public UQuest_Target {
  public:
    class UNPC_Type* Target;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    FLOAT DefeatFraction;  // 5C 3 CPF_Edit CPF_Const
    class UConversation_Topic* LastWords;  // 60 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UQT_Defeat(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual class UConversation_Topic * GetConversation(void);
    virtual class UNPC_Type * GetConversator(void);
    virtual void GetLocalizedStrings(class localized_string_data_vector &,struct FQuestContextInfo *);
    virtual int Failed(int);
    UQT_Defeat(class UQT_Defeat const &);
    UQT_Defeat(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Defeat & operator=(class UQT_Defeat const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Kill
//------------------------------------------------------------------------------

//  QT_Kill.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Kill_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Kill.AppendProgressText 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Kill_execAppendProgressText_Parms {
  class FString aDescription;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aProgress;  // 8 80 CPF_Parm
};


//  QT_Kill.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Kill_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Kill 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Kill : public UQuest_Target {
  public:
    TArray<class UNPC_Type*> Targets;  // 58 14400003 CPF_Edit CPF_Const CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UQT_Kill(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual int GetCompletedProgressValue(void);
    virtual void GetLocalizedStrings(class localized_string_data_vector &,struct FQuestContextInfo *);
    virtual int Check(int);
    UQT_Kill(class UQT_Kill const &);
    UQT_Kill(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Kill & operator=(class UQT_Kill const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QT_Talk
//------------------------------------------------------------------------------

//  QT_Talk.GetTarget 80401 0 ( FUNC_Final FUNC_Native FUNC_Protected )
struct UQT_Talk_execGetTarget_Parms {
  class UNPC_Type* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  QT_Talk.GetActiveText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UQT_Talk_eventGetActiveText_Parms {
  class UGame_ActiveTextItem* aItem;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  QT_Talk.GetDefaultDescription 80002 0 ( FUNC_Defined FUNC_Protected )
struct UQT_Talk_execGetDefaultDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQT_Talk 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQT_Talk : public UQuest_Target {
  public:
    class UNPC_Type* Person;  // 58 1440000B CPF_Edit CPF_Const CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    class UConversation_Topic* Topic;  // 5C 442000B CPF_Edit CPF_Const CPF_ExportObject CPF_EditConst CPF_NeedCtorLink CPF_EditInline
    virtual ~UQT_Talk(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnHook(class AGame_PlayerPawn *,enum EContentHook,class UObject *,int);
    virtual void sv_Attach(class AGame_Pawn *);
    virtual class WWindow * GetEditControl(class WWindow *,struct FPoint *,struct FPoint *,struct UContent_Type::FGraphRefreshCallback const &,struct UContent_Type::FGraphMsgCallback const &,class FNotifyHook *);
    virtual class FString GetControlDescription(int);
    virtual class UConversation_Topic * GetConversation(void);
    virtual class UNPC_Type * GetConversator(void);
    virtual void GetLocalizedStrings(class localized_string_data_vector &,struct FQuestContextInfo *);
    virtual int NearlyDone(int);
    UQT_Talk(class UQT_Talk const &);
    UQT_Talk(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQT_Talk & operator=(class UQT_Talk const &);
    class UNPC_Type * GetTarget(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetTarget(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UQT_Talk,0,execGetTarget)


//------------------------------------------------------------------------------
//  QR_Skill
//------------------------------------------------------------------------------

//  QR_Skill.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UQR_Skill_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQR_Skill 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQR_Skill : public UQuest_Reward {
  public:
    class UFSkill_Type* learnedSkill;  // 30 14400009 CPF_Edit CPF_ExportObject CPF_NeedCtorLink CPF_EditInline CPF_Unk_10000000
    virtual ~UQR_Skill(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual int sv_CanObtain(class AGame_Pawn *);
    virtual void sv_OnObtain(class AGame_Pawn *);
    UQR_Skill(class UQR_Skill const &);
    UQR_Skill(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQR_Skill & operator=(class UQR_Skill const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QR_Money
//------------------------------------------------------------------------------

//  QR_Money.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UQR_Money_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQR_Money 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQR_Money : public UQuest_Reward {
  public:
    INT Money;  // 30 1 CPF_Edit
    virtual ~UQR_Money(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual void sv_OnObtain(class AGame_Pawn *);
    UQR_Money(class UQR_Money const &);
    UQR_Money(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQR_Money & operator=(class UQR_Money const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QR_Item
//------------------------------------------------------------------------------

//  QR_Item.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UQR_Item_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQR_Item 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQR_Item : public UQuest_Reward {
  public:
    class UContent_Inventory* RewardItems;  // 30 1 CPF_Edit
    virtual ~UQR_Item(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual int sv_CanObtain(class AGame_Pawn *);
    virtual void sv_OnObtain(class AGame_Pawn *);
    UQR_Item(class UQR_Item const &);
    UQR_Item(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQR_Item & operator=(class UQR_Item const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QR_QuestPoints
//------------------------------------------------------------------------------

//  QR_QuestPoints.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UQR_QuestPoints_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQR_QuestPoints 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQR_QuestPoints : public UQuest_Reward {
  public:
    INT QP;  // 30 3 CPF_Edit CPF_Const
    INT QPFrac;  // 34 2000003 CPF_Edit CPF_Const CPF_EditorData
    virtual ~UQR_QuestPoints(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual void sv_OnObtain(class AGame_Pawn *);
    UQR_QuestPoints(class UQR_QuestPoints const &);
    UQR_QuestPoints(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQR_QuestPoints & operator=(class UQR_QuestPoints const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  QR_Fame
//------------------------------------------------------------------------------

//  QR_Fame.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UQR_Fame_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// UQR_Fame 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UQR_Fame : public UQuest_Reward {
  public:
    INT Fame;  // 30 3 CPF_Edit CPF_Const
    virtual ~UQR_Fame(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnObtain(class AGame_Pawn *);
    UQR_Fame(class UQR_Fame const &);
    UQR_Fame(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQR_Fame & operator=(class UQR_Fame const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Quest_Standard
//------------------------------------------------------------------------------

// UQuest_Standard 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UQuest_Standard : public UQuest_Type {
  public:
    virtual ~UQuest_Standard(void);
    virtual void PostConstructObject(void);
    virtual unsigned int GetCPPSize(void);
    UQuest_Standard(class UQuest_Standard const &);
    UQuest_Standard(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UQuest_Standard & operator=(class UQuest_Standard const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Quest_Trigger
//------------------------------------------------------------------------------

//  Quest_Trigger.OnLeavePawn 20002 0 ( FUNC_Defined FUNC_Public )
struct AQuest_Trigger_execOnLeavePawn_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  Quest_Trigger.OnEnterPawn 20002 0 ( FUNC_Defined FUNC_Public )
struct AQuest_Trigger_execOnEnterPawn_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


// AQuest_Trigger 4232 ( CLASS_Compiled CLASS_Parsed CLASS_Localized CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT AQuest_Trigger : public AInsideTrigger {
  public:
    virtual ~AQuest_Trigger(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FString GetDescription(void)const ;
    AQuest_Trigger(class AQuest_Trigger const &);
    AQuest_Trigger(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AQuest_Trigger & operator=(class AQuest_Trigger const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  InteractiveQuestElement
//------------------------------------------------------------------------------

//  InteractiveQuestElement.cl_GetToolTip 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AInteractiveQuestElement_eventcl_GetToolTip_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


// AInteractiveQuestElement 4212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT AInteractiveQuestElement : public AInteractiveLevelElement {
  public:
    virtual ~AInteractiveQuestElement(void);
    virtual void PostLoad(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FString GetDescription(void)const ;
    AInteractiveQuestElement(class AInteractiveQuestElement const &);
    AInteractiveQuestElement(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AInteractiveQuestElement & operator=(class AInteractiveQuestElement const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_INTERACTIVEQUESTELEMENT_ADD_STREAM const &);
    void UnpackLoginStream(struct S2C_INTERACTIVEQUESTELEMENT_LOGIN_STREAM const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  MessageFilter
//------------------------------------------------------------------------------

//  MessageFilter.HasFlag 20002 0 ( FUNC_Defined FUNC_Public )
struct UMessageFilter_execHasFlag_Parms {
  INT Flag;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MessageFilter.RemoveFlag 20002 0 ( FUNC_Defined FUNC_Public )
struct UMessageFilter_execRemoveFlag_Parms {
  INT oldFlag;  // 0 80 CPF_Parm
};


//  MessageFilter.AddFlag 20002 0 ( FUNC_Defined FUNC_Public )
struct UMessageFilter_execAddFlag_Parms {
  INT newFlag;  // 0 80 CPF_Parm
};


//  MessageFilter.GetTotalFlags 20002 0 ( FUNC_Defined FUNC_Public )
struct UMessageFilter_execGetTotalFlags_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MessageFilter.InitFlag 20002 0 ( FUNC_Defined FUNC_Public )
struct UMessageFilter_execInitFlag_Parms {
  INT NewValue;  // 0 80 CPF_Parm
};


// UMessageFilter 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMessageFilter : public UObject {
  public:
    INT flags;  // 28 0
};


//------------------------------------------------------------------------------
//  TargetProjector
//------------------------------------------------------------------------------

//  TargetProjector.LoadTargetTexture 20002 0 ( FUNC_Defined FUNC_Public )
struct ATargetProjector_execLoadTargetTexture_Parms {
};


//  TargetProjector.SetIsVisible 20002 0 ( FUNC_Defined FUNC_Public )
struct ATargetProjector_execSetIsVisible_Parms {
  BITFIELD B : 1;  // 0 80 CPF_Parm
};


//  TargetProjector.IsVisible 20002 0 ( FUNC_Defined FUNC_Public )
struct ATargetProjector_execIsVisible_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetProjector.ProjectOnToLocation 20002 0 ( FUNC_Defined FUNC_Public )
struct ATargetProjector_execProjectOnToLocation_Parms {
  class FVector projectionLocation;  // 0 80 CPF_Parm
  class FVector Origin;  // C 80 CPF_Parm
  FLOAT MinDistance;  // 18 80 CPF_Parm
  FLOAT MaxDistance;  // 1C 80 CPF_Parm
};


//  TargetProjector.ExecuteProjection 20002 0 ( FUNC_Defined FUNC_Public )
struct ATargetProjector_execExecuteProjection_Parms {
  class FVector projectionLocation;  // 0 80 CPF_Parm
};


// ATargetProjector 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATargetProjector : public ADynamicProjector {
  public:
    FLOAT currentRoll;  // 5B8 0
    class FRotator currentRotation;  // 5BC 0
    FLOAT Height;  // 5C8 0
    FLOAT targetScale;  // 5CC 0
    FLOAT currentScale;  // 5D0 0
};


//------------------------------------------------------------------------------
//  Interaction_PartyTeleport
//------------------------------------------------------------------------------

//  Interaction_PartyTeleport.SvOnStart 20002 0 ( FUNC_Defined FUNC_Public )
struct UInteraction_PartyTeleport_execSvOnStart_Parms {
  class AGame_Actor* aOwner;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  BITFIELD aReverse : 1;  // 8 80 CPF_Parm
};


// UInteraction_PartyTeleport 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UInteraction_PartyTeleport : public UInteraction_Component {
  public:
    INT TargetWorld;  // 2C 1 CPF_Edit
    class FString portalName;  // 30 400001 CPF_Edit CPF_NeedCtorLink
};


//------------------------------------------------------------------------------
//  TriggerableBarrier
//------------------------------------------------------------------------------

//  TriggerableBarrier.SetOpened 20002 0 ( FUNC_Defined FUNC_Public )
struct ATriggerableBarrier_execSetOpened_Parms {
  BITFIELD Open : 1;  // 0 80 CPF_Parm
};


//  TriggerableBarrier.UnTrigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ATriggerableBarrier_eventUnTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


//  TriggerableBarrier.Trigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ATriggerableBarrier_eventTrigger_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
  class APawn* EventInstigator;  // 4 80 CPF_Parm
};


//  TriggerableBarrier.PostBeginPlay 20002 0 ( FUNC_Defined FUNC_Public )
struct ATriggerableBarrier_execPostBeginPlay_Parms {
};


// ATriggerableBarrier 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATriggerableBarrier : public AGame_Actor {
  public:
    BITFIELD bInitiallyOpen : 1;  // 490 1 CPF_Edit
    BITFIELD bAutoInvisibleEffect : 1;  // 490 2000001 CPF_Edit CPF_EditorData
};


//------------------------------------------------------------------------------
//  SBDialogWindowTrigger
//------------------------------------------------------------------------------

enum windowType {
  SBDWT_EnterArena = 0
};

//  SBDialogWindowTrigger.Touch 20002 0 ( FUNC_Defined FUNC_Public )
struct ASBDialogWindowTrigger_execTouch_Parms {
  class AActor* Other;  // 0 80 CPF_Parm
};


// ASBDialogWindowTrigger 232 ( CLASS_Compiled CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ASBDialogWindowTrigger : public ATrigger {
  public:
    BYTE windowToTrigger;  // 450 1 CPF_Edit
};


//------------------------------------------------------------------------------
//  EV_Scenario
//------------------------------------------------------------------------------

//  EV_Scenario.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Scenario_execsv_Execute_Parms {
  class AGame_Pawn* anObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_Scenario.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_Scenario_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_Scenario 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_Scenario : public UContent_Event {
  public:
    class FString ScenarioTag;  // 30 400001 CPF_Edit CPF_NeedCtorLink
};


//------------------------------------------------------------------------------
//  EV_PartyTeleport
//------------------------------------------------------------------------------

//  EV_PartyTeleport.sv_Execute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PartyTeleport_execsv_Execute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
};


//  EV_PartyTeleport.sv_CanExecute 20002 0 ( FUNC_Defined FUNC_Public )
struct UEV_PartyTeleport_execsv_CanExecute_Parms {
  class AGame_Pawn* aObject;  // 0 80 CPF_Parm
  class AGame_Pawn* aSubject;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UEV_PartyTeleport 203012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UEV_PartyTeleport : public UContent_Event {
  public:
    INT TargetWorld;  // 30 1 CPF_Edit
    class FString portalName;  // 34 400001 CPF_Edit CPF_NeedCtorLink
};


//------------------------------------------------------------------------------
//  NA_Invisible
//------------------------------------------------------------------------------

//  NA_Invisible.CreateAndApply 20002 0 ( FUNC_Defined FUNC_Public )
struct UNA_Invisible_execCreateAndApply_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UGame_Appearance* aAppearance;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class UGame_Appearance* ReturnValue;  // 8 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


// UNA_Invisible 3012 ( CLASS_Compiled CLASS_Parsed CLASS_EditInlineNew CLASS_CollapseCategories )
class DLL_IMPORT UNA_Invisible : public UNPC_Appearance {
};


//------------------------------------------------------------------------------
//  MessageHandler
//------------------------------------------------------------------------------

#define UCONST_MessageHandler_HANDLER_NOT_FOUND  -1
// FCommandHandler 0 ( )
struct DLL_IMPORT FCommandHandler {
  public:
    class FString Command;  // 0 400000 CPF_NeedCtorLink
    class FString handlerClassName;  // 8 400000 CPF_NeedCtorLink
};

// UMessageHandler 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMessageHandler : public UObject {
  public:
    class AGame_PlayerController* PC;  // 28 0
    class UMessageFilter* filter;  // 2C 0
    TArray<struct FCommandHandler> handlers;  // 30 400000 CPF_NeedCtorLink
};


//------------------------------------------------------------------------------
//  SummonParticleEffect
//------------------------------------------------------------------------------

// ASummonParticleEffect 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASummonParticleEffect : public AEmitter {
};


//------------------------------------------------------------------------------
//  ShootBowEmitter
//------------------------------------------------------------------------------

// AShootBowEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShootBowEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SBBackgroundAudio
//------------------------------------------------------------------------------

// ASBBackgroundAudio 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT ASBBackgroundAudio : public AActor {
};


//------------------------------------------------------------------------------
//  NG_Hive
//------------------------------------------------------------------------------

// UNG_Hive 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UNG_Hive : public UNPC_Group {
};


//------------------------------------------------------------------------------
//  MoraleBuffEmitter
//------------------------------------------------------------------------------

// AMoraleBuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMoraleBuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MessageSender
//------------------------------------------------------------------------------

#define UCONST_MessageSender_RANGE_UNKNOWN 512
#define UCONST_MessageSender_RANGE_SYSTEM 256
#define UCONST_MessageSender_RANGE_ERROR 128
#define UCONST_MessageSender_RANGE_PRIVATE 64
#define UCONST_MessageSender_RANGE_LOCAL 32
#define UCONST_MessageSender_RANGE_BROADCAST 16
#define UCONST_MessageSender_RANGE_HOUSE 8
#define UCONST_MessageSender_RANGE_GUILD 4
#define UCONST_MessageSender_RANGE_TEAM 2
#define UCONST_MessageSender_RANGE_FRIENDS 1
// UMessageSender 32 ( CLASS_Compiled CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UMessageSender : public UObject {
  public:
    class AGame_PlayerController* PC;  // 28 0
    INT currentMessageRange;  // 2C 0
    FLOAT currentRadius;  // 30 2000000 CPF_EditorData
    class FString senderName;  // 34 400000 CPF_NeedCtorLink
    class FString receiverName;  // 3C 400000 CPF_NeedCtorLink
    class FString NO_PLAYER_MSG;  // 44 408000 CPF_Localized CPF_NeedCtorLink
};


//------------------------------------------------------------------------------
//  HitBloodCircleSmall
//------------------------------------------------------------------------------

// AHitBloodCircleSmall 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitBloodCircleSmall : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitBloodCircleLarge
//------------------------------------------------------------------------------

// AHitBloodCircleLarge 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitBloodCircleLarge : public AEmitter {
};



//------------------------------------------------------------------------------
//  `d_relevance
//------------------------------------------------------------------------------

struct DLL_IMPORT `d_relevance {
};


AUTOGENERATE_CLASS(AAnnotationTriggerable)
AUTOGENERATE_CLASS(AInteractiveBirthSign)
AUTOGENERATE_CLASS(AInteractiveChair)
AUTOGENERATE_CLASS(AInteractiveDoor)
AUTOGENERATE_CLASS(AInteractiveHatch)
AUTOGENERATE_CLASS(AInteractiveMailbox)
AUTOGENERATE_CLASS(AInteractiveQuestElement)
AUTOGENERATE_CLASS(AInteractiveShop)
AUTOGENERATE_CLASS(ANPC_CharacterPawn)
AUTOGENERATE_CLASS(ANPC_CivilianPawn)
AUTOGENERATE_CLASS(ANPC_HumanoidPawn)
AUTOGENERATE_CLASS(ANPC_MonsterPawn)
AUTOGENERATE_CLASS(ANPC_NPNCPawn)
AUTOGENERATE_CLASS(AQuest_Trigger)
AUTOGENERATE_CLASS(ASBAudioDamper)
AUTOGENERATE_CLASS(ASBAudioPlayer)
AUTOGENERATE_CLASS(ASBAudio_Base)
AUTOGENERATE_CLASS(ASBInfluenceCapsule)
AUTOGENERATE_CLASS(ASBInfluenceDoughnut)
AUTOGENERATE_CLASS(ASBInfluenceSphere)
AUTOGENERATE_CLASS(ASBInfluenceVolume)
AUTOGENERATE_CLASS(AScenarioManager)
AUTOGENERATE_CLASS(ASpawn_Area)
AUTOGENERATE_CLASS(ASpawn_Breeder)
AUTOGENERATE_CLASS(ASpawn_Deployer)
AUTOGENERATE_CLASS(ASpawn_Group)
AUTOGENERATE_CLASS(ASpawn_NPC)
AUTOGENERATE_CLASS(ASpawn_Placed)
AUTOGENERATE_CLASS(ASpawn_Timed)
AUTOGENERATE_CLASS(ASpawn_Triggered)
AUTOGENERATE_CLASS(ASpawn_Wildlife)
AUTOGENERATE_CLASS(ATooltipActor)
AUTOGENERATE_CLASS(AWR_Flower)
AUTOGENERATE_CLASS(AWR_Gem)
AUTOGENERATE_CLASS(AWR_Metal)
AUTOGENERATE_CLASS(AWR_Stone)
AUTOGENERATE_CLASS(AWR_Wood)
AUTOGENERATE_CLASS(UAppToItemCommandlet)
AUTOGENERATE_CLASS(UCCom_FriendIgnore)
AUTOGENERATE_CLASS(UCCom_FriendInvite)
AUTOGENERATE_CLASS(UCCom_GuildDisband)
AUTOGENERATE_CLASS(UCCom_GuildInvite)
AUTOGENERATE_CLASS(UCCom_GuildKick)
AUTOGENERATE_CLASS(UCCom_GuildLeave)
AUTOGENERATE_CLASS(UCCom_Help)
AUTOGENERATE_CLASS(UCCom_Location)
AUTOGENERATE_CLASS(UCCom_TeamDisband)
AUTOGENERATE_CLASS(UCCom_TeamInvite)
AUTOGENERATE_CLASS(UCCom_TeamKick)
AUTOGENERATE_CLASS(UCCom_TeamLeave)
AUTOGENERATE_CLASS(UCCom_Unstuck)
AUTOGENERATE_CLASS(UCR_Accept)
AUTOGENERATE_CLASS(UCR_Decline)
AUTOGENERATE_CLASS(UCT_Chat)
AUTOGENERATE_CLASS(UCT_Deliver)
AUTOGENERATE_CLASS(UCT_FinishQuest)
AUTOGENERATE_CLASS(UCT_Greeting)
AUTOGENERATE_CLASS(UCT_LastWords)
AUTOGENERATE_CLASS(UCT_MidQuest)
AUTOGENERATE_CLASS(UCT_ProvideQuest)
AUTOGENERATE_CLASS(UCT_Quest)
AUTOGENERATE_CLASS(UCT_TalkTarget)
AUTOGENERATE_CLASS(UCT_Target)
AUTOGENERATE_CLASS(UCT_Thanks)
AUTOGENERATE_CLASS(UCT_Victory)
AUTOGENERATE_CLASS(UEV_AIAggro)
AUTOGENERATE_CLASS(UEV_AIFollow)
AUTOGENERATE_CLASS(UEV_AIIdle)
AUTOGENERATE_CLASS(UEV_Claustroport)
AUTOGENERATE_CLASS(UEV_ClientEvent)
AUTOGENERATE_CLASS(UEV_Conversation)
AUTOGENERATE_CLASS(UEV_Die)
AUTOGENERATE_CLASS(UEV_EffectsApply)
AUTOGENERATE_CLASS(UEV_EffectsRemove)
AUTOGENERATE_CLASS(UEV_Emote)
AUTOGENERATE_CLASS(UEV_FinishQuest)
AUTOGENERATE_CLASS(UEV_GiveItem)
AUTOGENERATE_CLASS(UEV_GiveMoney)
AUTOGENERATE_CLASS(UEV_GiveQuest)
AUTOGENERATE_CLASS(UEV_GiveSkill)
AUTOGENERATE_CLASS(UEV_NPC)
AUTOGENERATE_CLASS(UEV_ObtainQuest)
AUTOGENERATE_CLASS(UEV_Other)
AUTOGENERATE_CLASS(UEV_Party)
AUTOGENERATE_CLASS(UEV_PartyProgress)
AUTOGENERATE_CLASS(UEV_PersistentValue)
AUTOGENERATE_CLASS(UEV_QuestProgress)
AUTOGENERATE_CLASS(UEV_RemoveItem)
AUTOGENERATE_CLASS(UEV_RemoveMoney)
AUTOGENERATE_CLASS(UEV_Self)
AUTOGENERATE_CLASS(UEV_SetClass)
AUTOGENERATE_CLASS(UEV_SetFaction)
AUTOGENERATE_CLASS(UEV_SetHealth)
AUTOGENERATE_CLASS(UEV_ShowTutorial)
AUTOGENERATE_CLASS(UEV_Sit)
AUTOGENERATE_CLASS(UEV_Skill)
AUTOGENERATE_CLASS(UEV_SkillEffects)
AUTOGENERATE_CLASS(UEV_SkillEffectsTargeted)
AUTOGENERATE_CLASS(UEV_SkillEvent)
AUTOGENERATE_CLASS(UEV_SkillTargeted)
AUTOGENERATE_CLASS(UEV_Stand)
AUTOGENERATE_CLASS(UEV_Swap)
AUTOGENERATE_CLASS(UEV_Teleport)
AUTOGENERATE_CLASS(UEV_TriggerEvent)
AUTOGENERATE_CLASS(UEV_UntriggerEvent)
AUTOGENERATE_CLASS(UInteraction_Action)
AUTOGENERATE_CLASS(UInteraction_Animation)
AUTOGENERATE_CLASS(UInteraction_Attach)
AUTOGENERATE_CLASS(UInteraction_ChangeMesh)
AUTOGENERATE_CLASS(UInteraction_EffectOff)
AUTOGENERATE_CLASS(UInteraction_EffectOn)
AUTOGENERATE_CLASS(UInteraction_Enable)
AUTOGENERATE_CLASS(UInteraction_EnableCollision)
AUTOGENERATE_CLASS(UInteraction_Event)
AUTOGENERATE_CLASS(UInteraction_Freeze)
AUTOGENERATE_CLASS(UInteraction_Loot)
AUTOGENERATE_CLASS(UInteraction_Mailbox)
AUTOGENERATE_CLASS(UInteraction_Move)
AUTOGENERATE_CLASS(UInteraction_MovePlayer)
AUTOGENERATE_CLASS(UInteraction_Progress)
AUTOGENERATE_CLASS(UInteraction_Quest)
AUTOGENERATE_CLASS(UInteraction_RandomTimer)
AUTOGENERATE_CLASS(UInteraction_Rotate)
AUTOGENERATE_CLASS(UInteraction_RotateToFace)
AUTOGENERATE_CLASS(UInteraction_Shop)
AUTOGENERATE_CLASS(UInteraction_Show)
AUTOGENERATE_CLASS(UInteraction_ShowTutorial)
AUTOGENERATE_CLASS(UInteraction_Sit)
AUTOGENERATE_CLASS(UInteraction_Sound)
AUTOGENERATE_CLASS(UInteraction_Teleport)
AUTOGENERATE_CLASS(UInteraction_TeleportToPosition)
AUTOGENERATE_CLASS(UInteraction_Unevent)
AUTOGENERATE_CLASS(UItemDoubleNameCheckCommandlet)
AUTOGENERATE_CLASS(UItemEditCommandlet)
AUTOGENERATE_CLASS(UItem_ArmorBelt)
AUTOGENERATE_CLASS(UItem_ArmorChest)
AUTOGENERATE_CLASS(UItem_ArmorHeadGear)
AUTOGENERATE_CLASS(UItem_ArmorLeftGauntlet)
AUTOGENERATE_CLASS(UItem_ArmorLeftShin)
AUTOGENERATE_CLASS(UItem_ArmorLeftShoulder)
AUTOGENERATE_CLASS(UItem_ArmorLeftThigh)
AUTOGENERATE_CLASS(UItem_ArmorRightGauntlet)
AUTOGENERATE_CLASS(UItem_ArmorRightShin)
AUTOGENERATE_CLASS(UItem_ArmorRightShoulder)
AUTOGENERATE_CLASS(UItem_ArmorRightThigh)
AUTOGENERATE_CLASS(UItem_BodySlot)
AUTOGENERATE_CLASS(UItem_Broken)
AUTOGENERATE_CLASS(UItem_ClothChest)
AUTOGENERATE_CLASS(UItem_ClothLeftGlove)
AUTOGENERATE_CLASS(UItem_ClothPants)
AUTOGENERATE_CLASS(UItem_ClothRightGlove)
AUTOGENERATE_CLASS(UItem_ClothShoes)
AUTOGENERATE_CLASS(UItem_Consumable)
AUTOGENERATE_CLASS(UItem_ContainerExtraInventory)
AUTOGENERATE_CLASS(UItem_ContainerSuitBag)
AUTOGENERATE_CLASS(UItem_ItemToken)
AUTOGENERATE_CLASS(UItem_JewelryNecklace)
AUTOGENERATE_CLASS(UItem_JewelryQualityToken)
AUTOGENERATE_CLASS(UItem_JewelryRing)
AUTOGENERATE_CLASS(UItem_MiscellaneousKey)
AUTOGENERATE_CLASS(UItem_MiscellaneousLabyrinthKey)
AUTOGENERATE_CLASS(UItem_MiscellaneousTickets)
AUTOGENERATE_CLASS(UItem_QuestItem)
AUTOGENERATE_CLASS(UItem_Recipe)
AUTOGENERATE_CLASS(UItem_Resource)
AUTOGENERATE_CLASS(UItem_SkillToken)
AUTOGENERATE_CLASS(UItem_Trophy)
AUTOGENERATE_CLASS(UItem_WeaponDoubleHanded)
AUTOGENERATE_CLASS(UItem_WeaponDualWielding)
AUTOGENERATE_CLASS(UItem_WeaponOneHanded)
AUTOGENERATE_CLASS(UItem_WeaponQualityToken)
AUTOGENERATE_CLASS(UItem_WeaponRanged)
AUTOGENERATE_CLASS(UItem_WeaponShield)
AUTOGENERATE_CLASS(UNA_Equipped)
AUTOGENERATE_CLASS(UNA_RaceBodyGender)
AUTOGENERATE_CLASS(UNA_Skeletal)
AUTOGENERATE_CLASS(UNA_Static)
AUTOGENERATE_CLASS(UNE_Slots)
AUTOGENERATE_CLASS(UNE_SlotsBase)
AUTOGENERATE_CLASS(UNE_SlotsFullColor)
AUTOGENERATE_CLASS(UNE_SlotsUniform)
AUTOGENERATE_CLASS(UNE_Standard)
AUTOGENERATE_CLASS(UNG_Boss)
AUTOGENERATE_CLASS(UNPCHackCommandlet)
AUTOGENERATE_CLASS(UNPC_Boss)
AUTOGENERATE_CLASS(UNPC_Character)
AUTOGENERATE_CLASS(UNPC_Civilian)
AUTOGENERATE_CLASS(UNPC_Class)
AUTOGENERATE_CLASS(UNPC_Humanoid)
AUTOGENERATE_CLASS(UNPC_Monster)
AUTOGENERATE_CLASS(UNPC_MonsterClass)
AUTOGENERATE_CLASS(UNPC_NPNC)
AUTOGENERATE_CLASS(UNPC_Quest)
AUTOGENERATE_CLASS(UNS_Fixed)
AUTOGENERATE_CLASS(UNS_Rotator)
AUTOGENERATE_CLASS(UObjectImExCommandlet)
AUTOGENERATE_CLASS(UQC_CarryItem)
AUTOGENERATE_CLASS(UQC_Protect)
AUTOGENERATE_CLASS(UQC_Stealth)
AUTOGENERATE_CLASS(UQC_Survival)
AUTOGENERATE_CLASS(UQC_Timed)
AUTOGENERATE_CLASS(UQR_Fame)
AUTOGENERATE_CLASS(UQR_Item)
AUTOGENERATE_CLASS(UQR_Money)
AUTOGENERATE_CLASS(UQR_QuestPoints)
AUTOGENERATE_CLASS(UQR_Skill)
AUTOGENERATE_CLASS(UQT_BeDefeated)
AUTOGENERATE_CLASS(UQT_Challenge)
AUTOGENERATE_CLASS(UQT_Defeat)
AUTOGENERATE_CLASS(UQT_Deliver)
AUTOGENERATE_CLASS(UQT_Destroy)
AUTOGENERATE_CLASS(UQT_Escort)
AUTOGENERATE_CLASS(UQT_Exterminate)
AUTOGENERATE_CLASS(UQT_Fedex)
AUTOGENERATE_CLASS(UQT_Gather)
AUTOGENERATE_CLASS(UQT_Hunt)
AUTOGENERATE_CLASS(UQT_Interactor)
AUTOGENERATE_CLASS(UQT_Kill)
AUTOGENERATE_CLASS(UQT_Place)
AUTOGENERATE_CLASS(UQT_Reach)
AUTOGENERATE_CLASS(UQT_Subquest)
AUTOGENERATE_CLASS(UQT_Take)
AUTOGENERATE_CLASS(UQT_Talk)
AUTOGENERATE_CLASS(UQT_Use)
AUTOGENERATE_CLASS(UQT_UseAt)
AUTOGENERATE_CLASS(UQT_UseOn)
AUTOGENERATE_CLASS(UQT_Wait)
AUTOGENERATE_CLASS(UQuestAnalyzeCommandlet)
AUTOGENERATE_CLASS(UQuestImportCommandlet)
AUTOGENERATE_CLASS(UQuest_Standard)
AUTOGENERATE_CLASS(UReq_And)
AUTOGENERATE_CLASS(UReq_Area)
AUTOGENERATE_CLASS(UReq_Chance)
AUTOGENERATE_CLASS(UReq_Class)
AUTOGENERATE_CLASS(UReq_Conditional)
AUTOGENERATE_CLASS(UReq_Distance)
AUTOGENERATE_CLASS(UReq_Equipment)
AUTOGENERATE_CLASS(UReq_Faction)
AUTOGENERATE_CLASS(UReq_False)
AUTOGENERATE_CLASS(UReq_GameActorEnabled)
AUTOGENERATE_CLASS(UReq_Gender)
AUTOGENERATE_CLASS(UReq_Inventory)
AUTOGENERATE_CLASS(UReq_Level)
AUTOGENERATE_CLASS(UReq_Money)
AUTOGENERATE_CLASS(UReq_NPC)
AUTOGENERATE_CLASS(UReq_NPCType)
AUTOGENERATE_CLASS(UReq_NPC_Exists)
AUTOGENERATE_CLASS(UReq_Not)
AUTOGENERATE_CLASS(UReq_Or)
AUTOGENERATE_CLASS(UReq_PePRank)
AUTOGENERATE_CLASS(UReq_PersistentValue)
AUTOGENERATE_CLASS(UReq_Player)
AUTOGENERATE_CLASS(UReq_QuestActive)
AUTOGENERATE_CLASS(UReq_QuestFinished)
AUTOGENERATE_CLASS(UReq_QuestRepeatable)
AUTOGENERATE_CLASS(UReq_QuestReq)
AUTOGENERATE_CLASS(UReq_Race)
AUTOGENERATE_CLASS(UReq_TargetActive)
AUTOGENERATE_CLASS(UReq_TargetProgress)
AUTOGENERATE_CLASS(UReq_Team)
AUTOGENERATE_CLASS(UReq_Time)
AUTOGENERATE_CLASS(UReq_True)
AUTOGENERATE_CLASS(UReq_World)
AUTOGENERATE_CLASS(USBAppearance_Set)
AUTOGENERATE_CLASS(USBAudioModifier)
AUTOGENERATE_CLASS(USBAudioModulator)
AUTOGENERATE_CLASS(USBGamePlayStrings)
AUTOGENERATE_CLASS(USBVolumeModulator)
AUTOGENERATE_CLASS(UScenario)
AUTOGENERATE_CLASS(USpawnGroupCommandlet)
AUTOGENERATE_CLASS(UWildlifeCommandlet)

AUTOGENERATE_PACKAGE(SBGamePlay)


//_DllMain@12 1812500
//SBGamePlay_InitPackage 1812520

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

