//==============================================================================
//  Texture
//==============================================================================

class Texture extends BitmapMaterial
    native
    noexport
    SafeReplace
    dependsOn()
  ;

  enum ELODSet {
    LODSET_None ,
    LODSET_World ,
    LODSET_PlayerSkin ,
    LODSET_WeaponSkin ,
    LODSET_Terrain ,
    LODSET_Interface ,
    LODSET_RenderMap ,
    LODSET_Lightmap 
  };

  enum EEnvMapTransformType {
    EMTT_ViewSpace ,
    EMTT_WorldSpace ,
    EMTT_LightSpace 
  };

  var (Texture) Palette Palette;
  var (Texture) Material Detail;
  var (Texture) float DetailScale;
  var const Color MipZero;
  var const Color MaxColor;
  var const int InternalTime[2];
  var deprecated Texture DetailTexture;
  var deprecated Texture EnvironmentMap;
  var deprecated byte EnvMapTransformType;
  var deprecated float Specular;
  var (Surface) bool bMasked;
  var (Surface) bool bAlphaTexture;
  var (Surface) bool bTwoSided;
  var (Quality) private bool bHighColorQuality;
  var (Quality) private bool bHighTextureQuality;
  var private bool bRealtime;
  var private bool bParametric;
  var private transient bool bRealtimeChanged;
  var private const editconst bool bHasComp;
  var (Texture) byte LODSet;
  var (Texture) int NormalLOD;
  var int MinLOD;
  var transient int MaxLOD;
  var (Animation) Texture AnimNext;
  var transient Texture AnimCurrent;
  var (Animation) byte PrimeCount;
  var transient byte PrimeCurrent;
  var (Animation) float MinFrameRate;
  var (Animation) float MaxFrameRate;
  var transient float Accumulator;
  var private const native array<int> Mips;
  var const editconst byte CompFormat;
  var byte PS2FirstMip;
  var byte PS2NumMips;
  var const transient int RenderInterface;
  var const transient int __LastUpdateTime[2];


  native function Color GetPalColorAtIndex(byte PixelIndex);



