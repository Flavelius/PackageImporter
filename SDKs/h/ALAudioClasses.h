#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName ALAUDIO_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  ALAudioSubsystem
//------------------------------------------------------------------------------

// UALAudioSubsystem 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UALAudioSubsystem : public UAudioSubsystem/*,FExec*/  {
  public:
    char Unknown0[72];
    FLOAT DopplerFactor;  // 190 4000 CPF_Config
    FLOAT TimeBetweenHWUpdates;  // 194 4000 CPF_Config
    FLOAT RollOff;  // 198 4000 CPF_Config
    FLOAT SpatializedVoiceRadius;  // 19C 4000 CPF_Config
    FLOAT LocalZOffset;  // 1A0 4000 CPF_Config
    INT Channels;  // 1A4 4000 CPF_Config
    INT MaxEAXVersion;  // 1A8 4000 CPF_Config
    BITFIELD ReverseStereo : 1;  // 1AC 4000 CPF_Config
    BITFIELD UsePrecache : 1;  // 1B0 4000 CPF_Config
    BITFIELD UseEAX : 1;  // 1B4 4000 CPF_Config
    BITFIELD Use3DSound : 1;  // 1B8 4000 CPF_Config
    BITFIELD CompatibilityMode : 1;  // 1BC 4000 CPF_Config
    BITFIELD UseDefaultDriver : 1;  // 1C0 4000 CPF_Config
    BITFIELD DisablePitch : 1;  // 1C4 4000 CPF_Config
    BITFIELD LowQualitySound : 1;  // 1C8 4000 CPF_Config
    BITFIELD UseVAD : 1;  // 1CC 4000 CPF_Config
    BITFIELD EnhancedDenoiser : 1;  // 1D0 4000 CPF_Config
    BITFIELD UseSpatializedVoice : 1;  // 1D4 4000 CPF_Config
    char Unknown1[12];
    //virtual int Exec(unsigned short const *,class FOutputDevice &);
    virtual ~UALAudioSubsystem(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual void ShutdownAfterError(void);
    virtual void PostEditChange(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Init(void);
    virtual void SetViewport(class UViewport *);
    virtual void Flush(int);
    virtual int Update(class FSceneNode *);
    virtual void PlaySound(class FSoundSource *);
    virtual int StopSound(class AActor const *,class USound *,int);
    virtual int PlayVoicePacket(struct FVoiceInfo *);
    virtual void NoteDestroy(class USound *,class AActor *,int);
    virtual void NoteDestroy(class USound *,int);
    virtual void NoteDestroy(class AActor *);
    virtual void SetTransientSource(class FSoundSource *);
    virtual class FSoundSource * GetSource(int);
    virtual class FSoundSource * GetTransientSource(void);
    virtual int GetNumSources(void);
    virtual class FSoundSource * GetOwnedSource(int,class AActor *);
    virtual int LinkSource(int,class AActor *);
    virtual class FSoundSource * GetSourceById(int);
    virtual void CheckActiveSources(void);
    virtual float GetSoundDuration(class USound *);
    virtual int LowQualitySound(void);
    virtual int SeekStream(int,float);
    virtual int Seek(int,float);
    virtual int ReverseStereoSelected(void);
    virtual void UseReverseStereo(int);
    virtual void DrawSourceInfo(class UViewport *);
    virtual void UpdateStats(void);
    virtual void SetEAXEffect(void);
    UALAudioSubsystem(class UALAudioSubsystem const &);
    UALAudioSubsystem(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UALAudioSubsystem & operator=(class UALAudioSubsystem const &);
    int FindExt(unsigned short const *,int);
    void FindProc(void * &,char *,char *,int &,int,int);
    void FindProcs(int);
    int GetEnumValue(unsigned short const *,int);
    static void CDECL InternalConstructor(void *);
    static int SUPPORTS_AL;
    static int SUPPORTS_ALC;
    static int SUPPORTS_ALC_EXT_capture;
    int Seek(class FALSoundSource *,float);
    void Shutdown(void);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
    void StopSound(int);
    typedef void (__cdecl* alBufferData)(unsigned int,int,void *,unsigned int,unsigned int);
    typedef void (__cdecl* alDeleteBuffers)(unsigned int,unsigned int *);
    typedef void (__cdecl* alDeleteSources)(unsigned int,unsigned int *);
    typedef void (__cdecl* alDisable)(int);
    typedef void (__cdecl* alDistanceModel)(int);
    typedef void (__cdecl* alDopplerFactor)(float);
    typedef void (__cdecl* alDopplerVelocity)(float);
    typedef int (__cdecl* alEAXGet)(struct _GUID const *,unsigned int,unsigned int,void *,unsigned int);
    typedef int (__cdecl* alEAXSet)(struct _GUID const *,unsigned int,unsigned int,void *,unsigned int);
    typedef void (__cdecl* alEnable)(int);
    static int CDECL alError(unsigned short *,int);
    typedef void (__cdecl* alGenBuffers)(unsigned int,unsigned int *);
    typedef void (__cdecl* alGenSources)(unsigned int,unsigned int *);
    typedef char (__cdecl* alGetBoolean)(int);
    typedef void (__cdecl* alGetBooleanv)(int,char *);
    typedef void (__cdecl* alGetBufferf)(unsigned int,int,float *);
    typedef void (__cdecl* alGetBufferi)(unsigned int,int,int *);
    typedef double (__cdecl* alGetDouble)(int);
    typedef void (__cdecl* alGetDoublev)(int,double *);
    typedef int (__cdecl* alGetEnumValue)(unsigned char *);
    typedef int (__cdecl* alGetError)(void);
    typedef float (__cdecl* alGetFloat)(int);
    typedef void (__cdecl* alGetFloatv)(int,float *);
    typedef int (__cdecl* alGetInteger)(int);
    typedef void (__cdecl* alGetIntegerv)(int,int *);
    typedef void (__cdecl* alGetListener3f)(int,float *,float *,float *);
    typedef void (__cdecl* alGetListenerf)(int,float *);
    typedef void (__cdecl* alGetListenerfv)(int,float *);
    typedef void (__cdecl* alGetListeneri)(int,int *);
    typedef void * (__cdecl* alGetProcAddress)(unsigned char *);
    typedef void (__cdecl* alGetSourcef)(unsigned int,int,float *);
    typedef void (__cdecl* alGetSourcefv)(unsigned int,int,float *);
    typedef void (__cdecl* alGetSourcei)(unsigned int,int,int *);
    typedef unsigned char * (__cdecl* alGetString)(int);
    typedef char (__cdecl* alIsBuffer)(unsigned int);
    typedef char (__cdecl* alIsEnabled)(int);
    typedef char (__cdecl* alIsExtensionPresent)(unsigned char *);
    typedef char (__cdecl* alIsSource)(unsigned int);
    typedef void (__cdecl* alListener3f)(int,float,float,float);
    typedef void (__cdecl* alListenerf)(int,float);
    typedef void (__cdecl* alListenerfv)(int,float *);
    typedef void (__cdecl* alListeneri)(int,int);
    typedef void (__cdecl* alSource3f)(unsigned int,int,float,float,float);
    typedef void (__cdecl* alSourcePause)(unsigned int);
    typedef void (__cdecl* alSourcePausev)(unsigned int,unsigned int *);
    typedef void (__cdecl* alSourcePlay)(unsigned int);
    typedef void (__cdecl* alSourcePlayv)(unsigned int,unsigned int *);
    typedef void (__cdecl* alSourceQueueBuffers)(unsigned int,unsigned int,unsigned int *);
    typedef void (__cdecl* alSourceRewind)(unsigned int);
    typedef void (__cdecl* alSourceRewindv)(unsigned int,unsigned int *);
    typedef void (__cdecl* alSourceStop)(unsigned int);
    typedef void (__cdecl* alSourceStopv)(unsigned int,unsigned int *);
    typedef void (__cdecl* alSourceUnqueueBuffers)(unsigned int,unsigned int,unsigned int *);
    typedef void (__cdecl* alSourcef)(unsigned int,int,float);
    typedef void (__cdecl* alSourcefv)(unsigned int,int,float *);
    typedef void (__cdecl* alSourcei)(unsigned int,int,int);
    typedef void (__cdecl* alcCaptureCloseDevice)(struct ALCdevice_struct *);
    typedef struct ALCdevice_struct * (__cdecl* alcCaptureOpenDevice)(unsigned char const *,unsigned int,int,unsigned int);
    typedef void (__cdecl* alcCaptureSamples)(struct ALCdevice_struct *,void *,unsigned int);
    typedef void (__cdecl* alcCaptureStart)(struct ALCdevice_struct *);
    typedef void (__cdecl* alcCaptureStop)(struct ALCdevice_struct *);
    typedef void (__cdecl* alcCloseDevice)(struct ALCdevice_struct *);
    typedef struct ALCcontext_struct * (__cdecl* alcCreateContext)(struct ALCdevice_struct *,int *);
    typedef void (__cdecl* alcDestroyContext)(struct ALCcontext_struct *);
    typedef struct ALCdevice_struct * (__cdecl* alcGetContextsDevice)(struct ALCcontext_struct *);
    typedef struct ALCcontext_struct * (__cdecl* alcGetCurrentContext)(void);
    typedef int (__cdecl* alcGetEnumValue)(struct ALCdevice_struct *,unsigned char *);
    typedef int (__cdecl* alcGetError)(struct ALCdevice_struct *);
    typedef void (__cdecl* alcGetIntegerv)(struct ALCdevice_struct *,int,unsigned int,int *);
    typedef void * (__cdecl* alcGetProcAddress)(struct ALCdevice_struct *,unsigned char *);
    typedef unsigned char * (__cdecl* alcGetString)(struct ALCdevice_struct *,int);
    typedef char (__cdecl* alcIsExtensionPresent)(struct ALCdevice_struct *,unsigned char *);
    typedef char (__cdecl* alcMakeContextCurrent)(struct ALCcontext_struct *);
    typedef struct ALCdevice_struct * (__cdecl* alcOpenDevice)(unsigned char *);
    typedef void (__cdecl* alcProcessContext)(struct ALCcontext_struct *);
    typedef void (__cdecl* alcSuspendContext)(struct ALCcontext_struct *);
  private:
    static class UClass PrivateStaticClass;
};



//------------------------------------------------------------------------------
//  FALAudioStream
//------------------------------------------------------------------------------

class DLL_IMPORT FALAudioStream {
  public:
    virtual ~FALAudioStream(void);
    virtual int Init(unsigned short const *,void *,enum EAudioStreamType);
    FALAudioStream(class FALAudioStream const &);
    FALAudioStream(class FALAudioStream *,class FCriticalSection *);
    class FALAudioStream & operator=(class FALAudioStream const &);
    int GetChunkSize(void);
    float GetDuration(void);
    int GetFormat(void);
    class FALAudioStream * GetNext(void);
    class FALAudioStream * GetPrevious(void);
    int GetRate(void);
    int QueryStream(int &);
    void RequestChunks(int,void *);
    void SetPrevious(class FALAudioStream *);
};

//------------------------------------------------------------------------------
//  FALAudioStreamManager
//------------------------------------------------------------------------------

class DLL_IMPORT FALAudioStreamManager {
  public:
    FALAudioStreamManager(void);
    ~FALAudioStreamManager(void);
    class FALAudioStreamManager & operator=(class FALAudioStreamManager const &);
    void AddStream(class FALAudioStream *);
    class FALAudioStream * CreateStream(unsigned short const *,int,void *,enum EAudioStreamType,float);
    void Destroy(void);
    void DestroyStream(class FALAudioStream *,int);
    void Init(void);
    void RemoveStream(class FALAudioStream *);
};

//------------------------------------------------------------------------------
//  FALAudioStreamOgg
//------------------------------------------------------------------------------

class DLL_IMPORT FALAudioStreamOgg {
  public:
    virtual ~FALAudioStreamOgg(void);
    virtual int Seek(float);
    virtual int Init(unsigned short const *,void *,enum EAudioStreamType);
    virtual int ReadChunks(int);
    FALAudioStreamOgg(class FALAudioStreamOgg const &);
    FALAudioStreamOgg(class FALAudioStream *,class FCriticalSection *);
    class FALAudioStreamOgg & operator=(class FALAudioStreamOgg const &);
    static float CDECL GetOggDuration(unsigned short const *);
};

//------------------------------------------------------------------------------
//  FALSoundSource
//------------------------------------------------------------------------------

class DLL_IMPORT FALSoundSource {
  public:
    virtual ~FALSoundSource(void);
    virtual int Update(float);
    virtual void Play(void);
    virtual void Stop(void);
    virtual void Pause(void);
    virtual int IsPaused(void);
    virtual int IsStopped(void);
    virtual int IsFinished(float);
    virtual float GetDuration(void);
    virtual int Seek(float);
    virtual void DumpInfo(class FString &);
    FALSoundSource(class FALSoundSource const &);
    FALSoundSource(class UALAudioSubsystem *);
    class FALSoundSource & operator=(class FALSoundSource const &);
  private:
    void StopStream(void);
};


AUTOGENERATE_CLASS(UALAudioSubsystem)

AUTOGENERATE_PACKAGE(ALAudio)


//_DllMain@12 1951000

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

