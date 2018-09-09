//==============================================================================
//  LevelInfo
//==============================================================================

class LevelInfo extends ZoneInfo
    native
    nativereplication
    dependsOn(Actor)
    NotPlaceable
    Config(System)
  ;

  enum ENetMode {
    NM_Standalone ,
    NM_DedicatedServer ,
    NM_ListenServer ,
    NM_Client 
  };

  enum ELevelAction {
    LEVACT_None ,
    LEVACT_Loading ,
    LEVACT_Saving ,
    LEVACT_Connecting ,
    LEVACT_Precaching 
  };

  enum EMeshLODDetailLevel {
    MDL_Low ,
    MDL_Medium ,
    MDL_High ,
    MDL_Ultra 
  };

  enum EPhysicsDetailLevel {
    PDL_Low ,
    PDL_Medium ,
    PDL_High 
  };

  var float TimeDilation;
  var transient float TimeSeconds;
  var transient int Year;
  var transient int Month;
  var transient int Day;
  var transient int DayOfWeek;
  var transient int Hour;
  var transient int Minute;
  var transient int Second;
  var transient int Millisecond;
  var transient Actor SunLights[4];
  var transient int NumSunLights;
  var float PauseDelay;
  var const float RelativeTimeOfDay;
  var transient EnvironmentManager EnvironmentManager;
  var (LevelSummary) localized string Title;
  var (LevelSummary) string Author;
  var (LevelSummary) string Description;
  var (LevelSummary) Material Screenshot;
  var (LevelSummary) string DecoTextName;
  var (LevelSummary) int IdealPlayerCountMin;
  var (LevelSummary) int IdealPlayerCountMax;
  var (LevelSummary) string ExtraInfo;
  var (SinglePlayer) int SinglePlayerTeamSize;
  var (RadarMap) Material RadarMapImage;
  var (RadarMap) float CustomRadarRange;
  var (LevelInfo) config byte PhysicsDetailLevel;
  var (LevelInfo) config byte MeshLODDetailLevel;
  var (Karma) float KarmaTimeScale;
  var (Karma) float RagdollTimeScale;
  var (Karma) int MaxRagdolls;
  var (Karma) float KarmaGravScale;
  var (Karma) bool bKStaticFriction;
  var (LevelInfo) bool bKNoInit;
  var int LastTaunt[2];
  var config float DecalStayScale;
  var (LevelInfo) localized string LevelEnterText;
  var (LevelInfo) string LocalizedPkg;
  var LevelSummary Summary;
  var deprecated string VisibleGroups;
  var (LevelSummary) bool HideFromMenus;
  var (LevelInfo) bool bLonePlayer;
  var bool bBegunPlay;
  var bool bPlayersOnly;
  var bool bFreezeKarma;
  var const byte DetailMode;
  var bool bDropDetail;
  var bool bAggressiveLOD;
  var bool bStartup;
  var config bool bLowSoundDetail;
  var bool bPathsRebuilt;
  var bool bHasPathNodes;
  var bool bLevelChange;
  var globalconfig bool bShouldPreload;
  var globalconfig bool bDesireSkinPreload;
  var globalconfig bool bKickLiveIdlers;
  var bool bSkinsPreloaded;
  var bool bClassicView;
  var (RadarMap) bool bShowRadarMap;
  var (RadarMap) bool bUseTerrainForRadarRange;
  var bool bIsSaveGame;
  var (SaveGames) bool bSupportSaveGames;
  var config bool bNeverPrecache;
  var (LevelInfo) int LevelTextureLODBias;
  var float AnimMeshGlobalLOD;
  var (LevelInfo) Vector CameraLocationDynamic;
  var (LevelInfo) Vector CameraLocationTop;
  var (LevelInfo) Vector CameraLocationFront;
  var (LevelInfo) Vector CameraLocationSide;
  var (LevelInfo) Rotator CameraRotationDynamic;
  var (Audio) string Song;
  var (Audio) float PlayerDoppler;
  var (Audio) float MusicVolumeOverride;
  var (LevelInfo) float Brightness;
  var Texture DefaultTexture;
  var Texture WireframeTexture;
  var Texture WhiteSquareTexture;
  var Texture LargeVertex;
  var int HubStackLevel;
  var transient byte LevelAction;
  var byte NetMode;
  var string ComputerName;
  var string EngineVersion;
  var string MinNetVersion;
  var (LevelInfo) string DefaultGameType;
  var (LevelInfo) string PreCacheGame;
  var float DefaultGravity;
  var float LastVehicleCheck;
  var (LevelInfo) float StallZ;
  var const NavigationPoint NavigationPointList;
  var const Controller ControllerList;
  var (Headlights) bool bUseHeadlights;
  var (Headlights) float HeadlightScaling;
  var string NextURL;
  var bool bNextItems;
  var float NextSwitchCountdown;
  var transient ObjectPool ObjectPool;
  var transient array<Material> PrecacheMaterials;
  var transient array<StaticMesh> PrecacheStaticMeshes;
  var (Camouflage) StaticMesh IndoorCamouflageMesh;
  var (Camouflage) float IndoorMeshDrawscale;
  var (Camouflage) StaticMesh OutdoorCamouflageMesh;
  var (Camouflage) float OutdoorMeshDrawscale;
  var (DustColor) Color DustColor;
  var (DustColor) Color WaterDustColor;
  var float MoveRepSize;
  var globalconfig float MaxClientFrameRate;
  var globalconfig float MaxTimeMargin;
  var globalconfig float TimeMarginSlack;
  var globalconfig float MinTimeMargin;
  var const PlayerController ReplicationViewer;
  var const Actor ReplicationViewTarget;
  var const transient SBLightingCubemap LightingCubeMap;


  native function EnvironmentManager GetEnvironmentManager();


  function ObjectPool GetObjectPool() {
    if (ObjectPool == None) {                                                   //0000 : 07 1E 00 72 01 C0 7E 36 0F 2A 16 
      ObjectPool = new (XLevel) Class'ObjectPool';                              //000B : 0F 01 C0 7E 36 0F 11 01 E8 87 6E 0F 0B 0B 20 08 80 74 0F 
    }
    return ObjectPool;                                                          //001E : 04 01 C0 7E 36 0F 
    //07 1E 00 72 01 C0 7E 36 0F 2A 16 0F 01 C0 7E 36 0F 11 01 E8 87 6E 0F 0B 0B 20 08 80 74 0F 04 01 
    //C0 7E 36 0F 04 0B 47 
  }


  native function PlayerController GetLocalPlayerController();


  simulated event PreBeginPlay() {
    Super.PreBeginPlay();                                                       //0000 : 1C 10 76 72 0F 16 
    ObjectPool = new (XLevel) Class'ObjectPool';                                //0006 : 0F 01 C0 7E 36 0F 11 01 E8 87 6E 0F 0B 0B 20 08 80 74 0F 
    //1C 10 76 72 0F 16 0F 01 C0 7E 36 0F 11 01 E8 87 6E 0F 0B 0B 20 08 80 74 0F 04 0B 47 
  }


  function Reset() {
    DefaultGravity = default.DefaultGravity;                                    //0000 : 0F 01 48 85 74 0F 02 48 85 74 0F 
    Super.Reset();                                                              //001F : 1C A8 B4 34 0F 16 
    //0F 01 48 85 74 0F 02 48 85 74 0F 0E 1B 65 0C 00 00 1F 4F 42 4A 20 47 41 52 42 41 47 45 00 16 1C 
    //A8 B4 34 0F 16 04 0B 47 
  }


  function ThisIsNeverExecuted() {
    local DefaultPhysicsVolume P;
    P = None;                                                                   //0000 : 0F 00 70 86 74 0F 2A 
    //0F 00 70 86 74 0F 2A 04 0B 47 
  }


  event ServerTravel(string URL,bool bItems) {
    //04 0B 47 
  }


  native simulated function string GetAddressURL();


  final static native function bool IsSoftwareRendering();


  final static native function bool IsDemoBuild();


  native simulated function string GetLocalURL();


  simulated function AddPrecacheStaticMesh(StaticMesh stat) {
    local int Index;
    if (NetMode == 1) {                                                         //0000 : 07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 
      return;                                                                   //0010 : 04 0B 
    }
    if (stat == None) {                                                         //0012 : 07 1F 00 72 00 D0 89 74 0F 2A 16 
      return;                                                                   //001D : 04 0B 
    }
    Log("Adding static mesh to precache array: "
      $ string(stat));         //001F : E7 70 1F 41 64 64 69 6E 67 20 73 74 61 74 69 63 20 6D 65 73 68 20 74 6F 20 70 72 65 63 61 63 68 65 20 61 72 72 61 79 3A 20 00 39 56 00 D0 89 74 0F 16 16 
    Index = Level.PrecacheStaticMeshes.Length;                                  //0052 : 0F 00 30 8B 74 0F 37 19 01 D8 7E 6C 0F 05 00 00 01 A8 8B 74 0F 
    PrecacheStaticMeshes.Insert(Index,1);                                       //0067 : 40 01 A8 8B 74 0F 00 30 8B 74 0F 26 
    PrecacheStaticMeshes[Index] = stat;                                         //0073 : 0F 10 00 30 8B 74 0F 01 A8 8B 74 0F 00 D0 89 74 0F 
    //07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 04 0B 07 1F 00 72 00 D0 89 74 0F 2A 16 04 0B E7 
    //70 1F 41 64 64 69 6E 67 20 73 74 61 74 69 63 20 6D 65 73 68 20 74 6F 20 70 72 65 63 61 63 68 65 
    //20 61 72 72 61 79 3A 20 00 39 56 00 D0 89 74 0F 16 16 0F 00 30 8B 74 0F 37 19 01 D8 7E 6C 0F 05 
    //00 00 01 A8 8B 74 0F 40 01 A8 8B 74 0F 00 30 8B 74 0F 26 0F 10 00 30 8B 74 0F 01 A8 8B 74 0F 00 
    //D0 89 74 0F 04 0B 47 
  }


  simulated function AddPrecacheMaterial(Material mat) {
    local int Index;
    if (NetMode == 1) {                                                         //0000 : 07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 
      return;                                                                   //0010 : 04 0B 
    }
    if (mat == None) {                                                          //0012 : 07 1F 00 72 00 D0 8C 74 0F 2A 16 
      return;                                                                   //001D : 04 0B 
    }
    Index = Level.PrecacheMaterials.Length;                                     //001F : 0F 00 E8 8D 74 0F 37 19 01 D8 7E 6C 0F 05 00 00 01 60 8E 74 0F 
    PrecacheMaterials.Insert(Index,1);                                          //0034 : 40 01 60 8E 74 0F 00 E8 8D 74 0F 26 
    PrecacheMaterials[Index] = mat;                                             //0040 : 0F 10 00 E8 8D 74 0F 01 60 8E 74 0F 00 D0 8C 74 0F 
    //07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 04 0B 07 1F 00 72 00 D0 8C 74 0F 2A 16 04 0B 0F 
    //00 E8 8D 74 0F 37 19 01 D8 7E 6C 0F 05 00 00 01 60 8E 74 0F 40 01 60 8E 74 0F 00 E8 8D 74 0F 26 
    //0F 10 00 E8 8D 74 0F 01 60 8E 74 0F 00 D0 8C 74 0F 04 0B 47 
  }


  simulated event FillPrecacheStaticMeshesArray(bool FullPrecache) {
    local Actor A;
    if (NetMode == 1) {                                                         //0000 : 07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 
      return;                                                                   //0010 : 04 0B 
    }
    Log("Starting search for uncached static meshes");                          //0012 : E7 1F 53 74 61 72 74 69 6E 67 20 73 65 61 72 63 68 20 66 6F 72 20 75 6E 63 61 63 68 65 64 20 73 74 61 74 69 63 20 6D 65 73 68 65 73 00 16 
    foreach AllActors(Class'Actor',A) {                                         //0040 : 2F 61 30 20 F8 8B C1 00 00 08 90 74 0F 16 90 00 
      if (!A.bAlreadyPrecachedMeshes || FullPrecache) {                         //0050 : 07 8F 00 84 81 19 00 08 90 74 0F 06 00 04 2D 01 F8 09 6E 0F 16 18 07 00 2D 00 88 8F 74 0F 16 
        A.UpdatePrecacheStaticMeshes();                                         //006F : 19 00 08 90 74 0F 06 00 00 1B 2B 2B 00 00 16 
        A.bAlreadyPrecachedMeshes = True;                                       //007E : 14 19 00 08 90 74 0F 06 00 04 2D 01 F8 09 6E 0F 27 
      }
    }
    Log("Ending search");                                                       //0091 : E7 1F 45 6E 64 69 6E 67 20 73 65 61 72 63 68 00 16 
    //07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 04 0B E7 1F 53 74 61 72 74 69 6E 67 20 73 65 61 
    //72 63 68 20 66 6F 72 20 75 6E 63 61 63 68 65 64 20 73 74 61 74 69 63 20 6D 65 73 68 65 73 00 16 
    //2F 61 30 20 F8 8B C1 00 00 08 90 74 0F 16 90 00 07 8F 00 84 81 19 00 08 90 74 0F 06 00 04 2D 01 
    //F8 09 6E 0F 16 18 07 00 2D 00 88 8F 74 0F 16 19 00 08 90 74 0F 06 00 00 1B 2B 2B 00 00 16 14 19 
    //00 08 90 74 0F 06 00 04 2D 01 F8 09 6E 0F 27 31 30 E7 1F 45 6E 64 69 6E 67 20 73 65 61 72 63 68 
    //00 16 04 0B 47 
  }


  simulated function PrecacheAnnouncements();


  simulated event FillPrecacheMaterialsArray(bool FullPrecache) {
    local Actor A;
    if (NetMode == 1) {                                                         //0000 : 07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 
      return;                                                                   //0010 : 04 0B 
    }
    if (!bSkinsPreloaded || FullPrecache) {                                     //0012 : 07 28 00 84 81 2D 01 60 93 74 0F 16 18 07 00 2D 00 10 92 74 0F 16 
    }
    foreach AllActors(Class'Actor',A) {                                         //0028 : 2F 61 30 20 F8 8B C1 00 00 D8 93 74 0F 16 78 00 
      if (!A.bAlreadyPrecachedMaterials || FullPrecache) {                      //0038 : 07 77 00 84 81 19 00 D8 93 74 0F 06 00 04 2D 01 D8 08 6E 0F 16 18 07 00 2D 00 10 92 74 0F 16 
        A.UpdatePrecacheMaterials();                                            //0057 : 19 00 D8 93 74 0F 06 00 00 1B FA 2A 00 00 16 
        A.bAlreadyPrecachedMaterials = True;                                    //0066 : 14 19 00 D8 93 74 0F 06 00 04 2D 01 D8 08 6E 0F 27 
      }
    }
    //07 12 00 9A 39 3A 01 50 7F 6C 0F 39 3A 24 01 16 04 0B 07 28 00 84 81 2D 01 60 93 74 0F 16 18 07 
    //00 2D 00 10 92 74 0F 16 2F 61 30 20 F8 8B C1 00 00 D8 93 74 0F 16 78 00 07 77 00 84 81 19 00 D8 
    //93 74 0F 06 00 04 2D 01 D8 08 6E 0F 16 18 07 00 2D 00 10 92 74 0F 16 19 00 D8 93 74 0F 06 00 00 
    //1B FA 2A 00 00 16 14 19 00 D8 93 74 0F 06 00 04 2D 01 D8 08 6E 0F 27 31 30 04 0B 47 
  }


  simulated function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    DecalStayScale = Max(DecalStayScale,0);                                     //0006 : 0F 01 50 95 74 0F 39 3F FA 39 44 01 50 95 74 0F 25 16 
    //1C D0 02 38 0F 16 0F 01 50 95 74 0F 39 3F FA 39 44 01 50 95 74 0F 25 16 04 0B 47 
  }


  native simulated function PhysicsVolume GetPhysicsVolume(Vector loc);


  native simulated function ForceLoadTexture(Texture Texture);


  native simulated function UpdateDistanceFogLOD(float LOD);


  native simulated function byte GetDetailMode();


  native simulated function DetailChange(byte NewDetailMode);



