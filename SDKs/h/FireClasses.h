#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName FIRE_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  FractalTexture
//------------------------------------------------------------------------------

// UFractalTexture 153 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed CLASS_SafeReplace CLASS_NoExport )
class DLL_IMPORT UFractalTexture : public UTexture {
  public:
    INT UMask;  // CC 2000 CPF_Transient
    INT VMask;  // D0 2000 CPF_Transient
    INT LightOutput;  // D4 2000 CPF_Transient
    INT SoundOutput;  // D8 2000 CPF_Transient
    INT GlobalPhase;  // DC 2000 CPF_Transient
    BYTE DrawPhase;  // E0 2000 CPF_Transient
    BYTE AuxPhase;  // E1 2000 CPF_Transient
    virtual ~UFractalTexture(void);
    virtual void PostLoad(void);
    virtual void PostEditChange(void);
    virtual void Init(int,int);
    virtual void Prime(void);
    virtual void TouchTexture(int,int,float);
    UFractalTexture(class UFractalTexture const &);
    UFractalTexture(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFractalTexture & operator=(class UFractalTexture const &);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  IceTexture
//------------------------------------------------------------------------------

enum TimingType {
  TIME_FrameRateSync = 0,
  TIME_RealTimeScroll = 1
};

enum PanningType {
  SLIDE_Linear = 0,
  SLIDE_Circular = 1,
  SLIDE_Gestation = 2,
  SLIDE_WavyX = 3,
  SLIDE_WavyY = 4
};

// UIceTexture 152 ( CLASS_Compiled CLASS_Parsed CLASS_SafeReplace CLASS_NoExport )
class DLL_IMPORT UIceTexture : public UFractalTexture {
  public:
    class UTexture* GlassTexture;  // E4 1 CPF_Edit
    class UTexture* SourceTexture;  // E8 1 CPF_Edit
    BYTE PanningStyle;  // EC 1 CPF_Edit
    BYTE TimeMethod;  // ED 1 CPF_Edit
    BYTE HorizPanSpeed;  // EE 1 CPF_Edit
    BYTE VertPanSpeed;  // EF 1 CPF_Edit
    BYTE Frequency;  // F0 1 CPF_Edit
    BYTE Amplitude;  // F1 1 CPF_Edit
    BITFIELD MoveIce : 1;  // F4 1 CPF_Edit
    FLOAT MasterCount;  // F8 0
    FLOAT UDisplace;  // FC 0
    FLOAT VDisplace;  // 100 0
    FLOAT UPosition;  // 104 0
    FLOAT VPosition;  // 108 0
    FLOAT TickAccu;  // 10C 2000 CPF_Transient
    INT OldUDisplace;  // 110 2000 CPF_Transient
    INT OldVDisplace;  // 114 2000 CPF_Transient
    class UTexture* OldGlassTex;  // 118 2000 CPF_Transient
    class UTexture* OldSourceTex;  // 11C 2000 CPF_Transient
    INT LocalSource;  // 120 2000 CPF_Transient
    INT ForceRefresh;  // 124 2000 CPF_Transient
    virtual ~UIceTexture(void);
    virtual void PostLoad(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Clear(unsigned long);
    virtual void Init(int,int);
    virtual void Tick(float);
    virtual void ConstantTimeTick(void);
    virtual void MousePosition(unsigned long,float,float);
    virtual void Click(unsigned long,float,float);
    UIceTexture(class UIceTexture const &);
    UIceTexture(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UIceTexture & operator=(class UIceTexture const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    void BlitIceTex(void);
    void BlitTexIce(void);
    void MoveIcePosition(float);
    static class UClass PrivateStaticClass;
    void RenderIce(float);
};


//------------------------------------------------------------------------------
//  WaterTexture
//------------------------------------------------------------------------------

enum WDrop {
  DROP_FixedDepth = 0,
  DROP_PhaseSpot = 1,
  DROP_ShallowSpot = 2,
  DROP_HalfAmpl = 3,
  DROP_RandomMover = 4,
  DROP_FixedRandomSpot = 5,
  DROP_WhirlyThing = 6,
  DROP_BigWhirly = 7,
  DROP_HorizontalLine = 8,
  DROP_VerticalLine = 9,
  DROP_DiagonalLine1 = 10,
  DROP_DiagonalLine2 = 11,
  DROP_HorizontalOsc = 12,
  DROP_VerticalOsc = 13,
  DROP_DiagonalOsc1 = 14,
  DROP_DiagonalOsc2 = 15,
  DROP_RainDrops = 16,
  DROP_AreaClamp = 17,
  DROP_LeakyTap = 18,
  DROP_DrippyTap = 19
};

// FADrop 0 ( )
struct DLL_IMPORT FADrop {
  public:
    BYTE Type;  // 0 0
    BYTE depth;  // 1 0
    BYTE X;  // 2 0
    BYTE Y;  // 3 0
    BYTE ByteA;  // 4 0
    BYTE ByteB;  // 5 0
    BYTE ByteC;  // 6 0
    BYTE ByteD;  // 7 0
};

// UWaterTexture 153 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed CLASS_SafeReplace CLASS_NoExport )
class DLL_IMPORT UWaterTexture : public UFractalTexture {
  public:
    BYTE DropType;  // E4 1 CPF_Edit
    BYTE WaveAmp;  // E5 1 CPF_Edit
    BYTE FX_Frequency;  // E6 1 CPF_Edit
    BYTE FX_Phase;  // E7 1 CPF_Edit
    BYTE FX_Amplitude;  // E8 1 CPF_Edit
    BYTE FX_Speed;  // E9 1 CPF_Edit
    BYTE FX_Radius;  // EA 1 CPF_Edit
    BYTE FX_Size;  // EB 1 CPF_Edit
    BYTE FX_Depth;  // EC 1 CPF_Edit
    BYTE FX_Time;  // ED 1 CPF_Edit
    INT NumDrops;  // F0 0
    struct FADrop Drops[256];  // F4 0
    INT SourceFields;  // 8F4 2000 CPF_Transient
    BYTE RenderTable[1028];  // 8F8 2000 CPF_Transient
    BYTE WaterTable[1536];  // CFC 2000 CPF_Transient
    BYTE WaterParity;  // 12FC 2000 CPF_Transient
    INT OldWaveAmp;  // 1300 2000 CPF_Transient
    virtual ~UWaterTexture(void);
    virtual void PostLoad(void);
    virtual void Destroy(void);
    virtual void Clear(unsigned long);
    virtual void Init(int,int);
    virtual void MousePosition(unsigned long,float,float);
    virtual void Click(unsigned long,float,float);
    virtual void TouchTexture(int,int,float);
    UWaterTexture(class UWaterTexture const &);
    UWaterTexture(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UWaterTexture & operator=(class UWaterTexture const &);
    void CalculateWater(void);
    static class UClass * CDECL StaticClass(void);
    void WaterRedrawDrops(void);
  private:
    void AddDrop(int,int);
    void DeleteDrops(int,int,int);
    static class UClass PrivateStaticClass;
    void WaterPaint(int,int,unsigned long);
};


//------------------------------------------------------------------------------
//  WetTexture
//------------------------------------------------------------------------------

// UWetTexture 152 ( CLASS_Compiled CLASS_Parsed CLASS_SafeReplace CLASS_NoExport )
class DLL_IMPORT UWetTexture : public UWaterTexture {
  public:
    class UTexture* SourceTexture;  // 1304 1 CPF_Edit
    class UTexture* OldSourceTex;  // 1308 2000 CPF_Transient
    DWORD LocalSourceBitmap;  // 130C 2000 CPF_Transient
    virtual ~UWetTexture(void);
    virtual void PostLoad(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Clear(unsigned long);
    virtual void Init(int,int);
    virtual void ConstantTimeTick(void);
    UWetTexture(class UWetTexture const &);
    UWetTexture(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UWetTexture & operator=(class UWetTexture const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    void ApplyWetTexture(void);
    static class UClass PrivateStaticClass;
    void SetRefractionTable(void);
};


//------------------------------------------------------------------------------
//  FluidTexture
//------------------------------------------------------------------------------

// UFluidTexture 152 ( CLASS_Compiled CLASS_Parsed CLASS_SafeReplace CLASS_NoExport )
class DLL_IMPORT UFluidTexture : public UWaterTexture {
  public:
    virtual ~UFluidTexture(void);
    virtual void PostLoad(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Clear(unsigned long);
    virtual void Init(int,int);
    virtual void ConstantTimeTick(void);
    UFluidTexture(class UFluidTexture const &);
    UFluidTexture(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFluidTexture & operator=(class UFluidTexture const &);
    void CalculateFluid(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  WaveTexture
//------------------------------------------------------------------------------

// UWaveTexture 152 ( CLASS_Compiled CLASS_Parsed CLASS_SafeReplace CLASS_NoExport )
class DLL_IMPORT UWaveTexture : public UWaterTexture {
  public:
    BYTE BumpMapLight;  // 1304 1 CPF_Edit
    BYTE BumpMapAngle;  // 1305 1 CPF_Edit
    BYTE PhongRange;  // 1306 1 CPF_Edit
    BYTE PhongSize;  // 1307 1 CPF_Edit
    virtual ~UWaveTexture(void);
    virtual void PostLoad(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Clear(unsigned long);
    virtual void Init(int,int);
    virtual void ConstantTimeTick(void);
    UWaveTexture(class UWaveTexture const &);
    UWaveTexture(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UWaveTexture & operator=(class UWaveTexture const &);
    static void CDECL InternalConstructor(void *);
    void SetWaveLight(void);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  FireTexture
//------------------------------------------------------------------------------

enum DMode {
  DRAW_Normal = 0,
  DRAW_Lathe = 1,
  DRAW_Lathe_2 = 2,
  DRAW_Lathe_3 = 3,
  DRAW_Lathe_4 = 4
};

enum ESpark {
  SPARK_Burn = 0,
  SPARK_Sparkle = 1,
  SPARK_Pulse = 2,
  SPARK_Signal = 3,
  SPARK_Blaze = 4,
  SPARK_OzHasSpoken = 5,
  SPARK_Cone = 6,
  SPARK_BlazeRight = 7,
  SPARK_BlazeLeft = 8,
  SPARK_Cylinder = 9,
  SPARK_Cylinder3D = 10,
  SPARK_Lissajous = 11,
  SPARK_Jugglers = 12,
  SPARK_Emit = 13,
  SPARK_Fountain = 14,
  SPARK_Flocks = 15,
  SPARK_Eels = 16,
  SPARK_Organic = 17,
  SPARK_WanderOrganic = 18,
  SPARK_RandomCloud = 19,
  SPARK_CustomCloud = 20,
  SPARK_LocalCloud = 21,
  SPARK_Stars = 22,
  SPARK_LineLightning = 23,
  SPARK_RampLightning = 24,
  SPARK_SphereLightning = 25,
  SPARK_Wheel = 26,
  SPARK_Gametes = 27,
  SPARK_Sprinkler = 28
};

// FSpark 0 ( )
class DLL_IMPORT FSpark {
  public:
    BYTE Type;  // 0 0
    BYTE Heat;  // 1 0
    BYTE X;  // 2 0
    BYTE Y;  // 3 0
    BYTE ByteA;  // 4 0
    BYTE ByteB;  // 5 0
    BYTE ByteC;  // 6 0
    BYTE ByteD;  // 7 0
    class FSpark & operator=(class FSpark const &);
};

// UFireTexture 152 ( CLASS_Compiled CLASS_Parsed CLASS_SafeReplace CLASS_NoExport )
class DLL_IMPORT UFireTexture : public UFractalTexture {
  public:
    BYTE SparkType;  // E4 1 CPF_Edit
    BYTE RenderHeat;  // E5 1 CPF_Edit
    BITFIELD bRising : 1;  // E8 1 CPF_Edit
    BYTE FX_Heat;  // EC 1 CPF_Edit
    BYTE FX_Size;  // ED 1 CPF_Edit
    BYTE FX_AuxSize;  // EE 1 CPF_Edit
    BYTE FX_Area;  // EF 1 CPF_Edit
    BYTE FX_Frequency;  // F0 1 CPF_Edit
    BYTE FX_Phase;  // F1 1 CPF_Edit
    BYTE FX_HorizSpeed;  // F2 1 CPF_Edit
    BYTE FX_VertSpeed;  // F3 1 CPF_Edit
    BYTE DrawMode;  // F4 1 CPF_Edit
    INT SparksLimit;  // F8 1 CPF_Edit
    INT NumSparks;  // FC 0
    TArray<class FSpark> Sparks;  // 100 402000 CPF_Transient CPF_NeedCtorLink
    INT OldRenderHeat;  // 10C 2000 CPF_Transient
    BYTE RenderTable[1028];  // 110 2000 CPF_Transient
    BYTE StarStatus;  // 514 2000 CPF_Transient
    BYTE PenDownX;  // 515 2000 CPF_Transient
    BYTE PenDownY;  // 516 2000 CPF_Transient
    virtual ~UFireTexture(void);
    virtual void PostLoad(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Clear(unsigned long);
    virtual void Init(int,int);
    virtual void ConstantTimeTick(void);
    virtual void MousePosition(unsigned long,float,float);
    virtual void Click(unsigned long,float,float);
    virtual void TouchTexture(int,int,float);
    UFireTexture(class UFireTexture const &);
    UFireTexture(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFireTexture & operator=(class UFireTexture const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    void AddSpark(int,int);
    void CloseSpark(int,int);
    void DeleteSparks(int,int,int);
    void DrawFlashRamp(struct LineSeg,unsigned char,unsigned char);
    void DrawSparkLine(int,int,int,int,int);
    void FirePaint(int,int,unsigned long);
    void MoveSpark(class FSpark *);
    void MoveSparkAngle(class FSpark *,unsigned char);
    void MoveSparkTwo(class FSpark *);
    void MoveSparkXY(class FSpark *,signed char,signed char);
    void PostDrawSparks(void);
    static class UClass PrivateStaticClass;
    void RedrawSparks(void);
    void TempDrawSpark(int,int,int);
};



//------------------------------------------------------------------------------
//  FDrop
//------------------------------------------------------------------------------

struct DLL_IMPORT FDrop {
  public:
    struct FDrop & operator=(struct FDrop const &);
};

//------------------------------------------------------------------------------
//  KeyPoint
//------------------------------------------------------------------------------

struct DLL_IMPORT KeyPoint {
  public:
    struct KeyPoint & operator=(struct KeyPoint const &);
};


AUTOGENERATE_CLASS(UFireTexture)
AUTOGENERATE_CLASS(UFluidTexture)
AUTOGENERATE_CLASS(UFractalTexture)
AUTOGENERATE_CLASS(UIceTexture)
AUTOGENERATE_CLASS(UWaterTexture)
AUTOGENERATE_CLASS(UWaveTexture)
AUTOGENERATE_CLASS(UWetTexture)

AUTOGENERATE_PACKAGE(Fire)


//_DllMain@12 fd325d0

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

