#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName D3D9DRV_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  D3D9RenderDevice
//------------------------------------------------------------------------------

// UD3D9RenderDevice 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UD3D9RenderDevice : public URenderDevice/*,FExec*/  {
  public:
    char Unknown0[16436];
    BITFIELD UsePrecaching : 1;  // 4124 4000 CPF_Config
    BITFIELD UseTrilinear : 1;  // 4128 4000 CPF_Config
    char Unknown1[4];
    BITFIELD UseVSync : 1;  // 4130 4000 CPF_Config
    BITFIELD UseHardwareTL : 1;  // 4134 4000 CPF_Config
    BITFIELD UseHardwareVS : 1;  // 4138 4000 CPF_Config
    BITFIELD UseCubemaps : 1;  // 413C 4000 CPF_Config
    char Unknown2[16];
    BITFIELD UseTripleBuffering : 1;  // 4150 4000 CPF_Config
    BITFIELD ReduceMouseLag : 1;  // 4154 4000 CPF_Config
    char Unknown3[16];
    BITFIELD CheckForOverflow : 1;  // 4168 4000 CPF_Config
    BITFIELD UseNPatches : 1;  // 416C 4000 CPF_Config
    BITFIELD DecompressTextures : 1;  // 4170 4000 CPF_Config
    char Unknown4[12];
    INT AdapterNumber;  // 4180 4000 CPF_Config
    char Unknown5[4];
    INT MaxPixelShaderVersion;  // 4188 4000 CPF_Config
    INT LevelOfAnisotropy;  // 418C 4000 CPF_Config
    FLOAT DetailTexMipBias;  // 4190 4000 CPF_Config
    FLOAT DefaultTexMipBias;  // 4194 4000 CPF_Config
    FLOAT TesselationFactor;  // 4198 4000 CPF_Config
    char Unknown6[4];
    INT DesiredRefreshRate;  // 41A0 4000 CPF_Config
    char Unknown7[215900];
    //virtual int Exec(unsigned short const *,class FOutputDevice &);
    virtual ~UD3D9RenderDevice(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Init(void);
    virtual int SetRes(class UViewport *,int,int,int,int,int);
    virtual void Exit(class UViewport *);
    virtual void Flush(enum EFlushType);
    virtual int FlushResource(unsigned __int64);
    virtual int FlushManagedResource(unsigned __int64);
    virtual void PreloadResource(unsigned __int64);
    virtual void DecreaseResourcePriority(unsigned __int64);
    virtual int ResourceCached(unsigned __int64);
    virtual int PreCacheTexture(class FBaseTexture *);
    virtual void EnableMultiPass(int);
    virtual int IsMultiPassEnabled(void)const ;
    virtual void UpdateGamma(class UViewport *);
    virtual void RestoreGamma(void);
    virtual class FRenderInterface * Lock(class UViewport *,unsigned char *,int *);
    virtual void Unlock(class FRenderInterface *);
    virtual void Present(class UViewport *);
    virtual void ReadPixels(class UViewport *,class FColor *,int);
    virtual void SetEmulationMode(enum EHardwareEmulationMode);
    virtual struct FRenderCaps * GetRenderCaps(void);
    virtual void OptimizeMesh(unsigned short *,unsigned short,unsigned short);
    virtual int UnwrapUVs(void *,int,int,unsigned short *,unsigned long,int *,float * *,unsigned short * *,unsigned short * *);
    virtual void HackPointFiltering(void);
    virtual void UnhackPointFiltering(void);
    virtual int SupportsCursor(void);
    virtual void ShowCursor(int);
    virtual void SetCursorPosition(int,int);
    virtual void SetCursorTexture(int,int,class UTexture *);
    virtual void PrintMemoryStats(class FOutputDevice &);
    virtual class FVideoMixer * GetVideoMixer(void);
    virtual int IsFullscreen(void);
    virtual int GetFullscreenWidth(void);
    virtual int GetFullscreenHeight(void);
    virtual int SupportsTextureFormat(enum ETextureFormat);
    virtual class FSBShader * GetSBShader(int,struct FSBShaderCreationParameters const &);
    UD3D9RenderDevice(class UD3D9RenderDevice const &);
    UD3D9RenderDevice(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UD3D9RenderDevice & operator=(class UD3D9RenderDevice const &);
    class FD3D9Resource * GetCachedResource(unsigned __int64);
    class FD3D9PixelShader * GetPixelShader(enum EPixelShader);
    class FD3D9VertexShader * GetVertexShader(enum EVertexShader,struct FShaderDeclaration &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
    int UnSetRes(unsigned short const *,long,int);
  private:
    class FD3D9Texture * CacheTexture(class FBaseTexture *);
    void DownloadCursor(void);
    void ForceResolutionTo1024x768(int &,int &);
    bool IsCursorEnabled(void);
    static class UClass PrivateStaticClass;
};




AUTOGENERATE_CLASS(UD3D9RenderDevice)

AUTOGENERATE_PACKAGE(D3D9Drv)


//_DllMain@12 10945550

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

