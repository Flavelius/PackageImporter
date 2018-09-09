//==============================================================================
//  ZoneInfo
//==============================================================================

class ZoneInfo extends Info
    native
    dependsOn(LevelInfo,SkyZoneInfo)
    Placeable
  ;

  const CHECK_MUSIC_PLAYING_TIMER =  1.0f;
  var SkyZoneInfo SkyZone;
  var (ZoneInfo) name ZoneTag;
  var (ZoneInfo) localized string LocationName;
  var (ZoneInfo) float KillZ;
  var (ZoneInfo) byte KillZType;
  var (ZoneInfo) bool bSoftKillZ;
  var (ZoneInfo) bool bTerrainZone;
  var (ZoneInfo) bool bDistanceFog;
  var (ZoneInfo) bool bHeightFog;
  var (ZoneInfo) bool bClearToFogColor;
  var const array<TerrainInfo> Terrains;
  var Vector AmbientVector;
  var (ZoneLight) byte AmbientBrightness;
  var (ZoneLight) byte AmbientHue;
  var (ZoneLight) byte AmbientSaturation;
  var (ZoneLight) Color DistanceFogColor;
  var (ZoneLight) float DistanceFogStart;
  var (ZoneLight) float DistanceFogEnd;
  var transient float RealDistanceFogEnd;
  var (ZoneLight) float DistanceFogEndMin;
  var (ZoneLight) float DistanceFogBlendTime;
  var (ZoneLight) float DistanceFogUpperHeight;
  var (ZoneLight) float DistanceFogLowerHeight;
  var (ZoneLight) float FogUpperHeightLimit;
  var (ZoneLight) const Texture EnvironmentMap;
  var (ZoneLight) float TexUPanSpeed;
  var (ZoneLight) float TexVPanSpeed;
  var (ZoneLight) float DramaticLightingScale;
  var (ZoneSound) editinline I3DL2Listener ZoneEffect;
  var (ZoneVisibility) bool bLonelyZone;
  var (ZoneVisibility) editinline array<ZoneInfo> ManualExcludes;
  var (ZoneMap) string MapBlockTextureNamePrefix;
  var (ZoneMap) int MapBlockSize;
  var (ZoneMap) int MapUnitsPerPixel;
  var (ZoneMap) float MapMinX;
  var (ZoneMap) float MapMinY;
  var (ZoneMap) float MapMaxX;
  var (ZoneMap) float MapMaxY;
  var (ZoneMap) int MapMinZoomStep;
  var (ZoneMap) int MapMaxZoomStep;
  var (ZoneMap) int MapDefaultZoomStep;
  var (ZoneBloom) float BloomContrast;
  var (ZoneBloom) float OriginalScreenAmount;
  var (ZoneBloom) float BloomScreenAmount;
  var (ZoneBloom) float BlurScreenAmount;
  var (ZoneBloom) int NumBlurPasses;
  var (ZoneBloom) bool UseWideBlur;
  var transient float BackupBloomContrast;
  var transient float BackupBloomScreenAmount;
  var transient float BackupOriginalScreenAmount;
  var transient float BackupBlurScreenAmount;
  var transient Color BackupDistanceFogColor;
  var transient float BackupDistanceFogEnd;
  var transient float BackupDistanceFogEndMin;
  var transient float BackupDistanceFogStart;
  var transient byte BackupAmbientBrightness;
  var transient byte BackupAmbientHue;
  var transient byte BackupAmbientSaturation;
  var transient float BackupSunlightsBrightness;
  var transient float BackupSunlightsContrastAdjust;
  var transient float BackupLightmapContrastAdjust;
  var (LevelArea) LocalizedString LevelAreaName;
  var (PvP) editinline PvPSettings PvPSettings;
  var (LevelArea) string RespawnPoint;
  var (DayNightCycle) bool EnableDayLightCycle;
  var (ZoneMusic) string TrackName;
  var (ZoneMusic) float AmbientFadeOutDuration;
  var (ZoneMusic) float AmbientFadeInDuration;
  var (ZoneMusic) float StartAmbientFadeInTime;
  var private transient float mCheckMusicTimer;


  event ActorLeaving(Actor Other);


  event ActorEntered(Actor Other);


  simulated function PreBeginPlay() {
    Super.PreBeginPlay();                                                       //0000 : 1C 18 B5 6C 0F 16 
    LinkToSkybox();                                                             //0006 : 1B 81 2C 00 00 16 
    //1C 18 B5 6C 0F 16 1B 81 2C 00 00 16 04 0B 47 
  }


  simulated function LinkToSkybox() {
    local SkyZoneInfo TempSkyZone;
    foreach AllActors(Class'SkyZoneInfo',TempSkyZone,'None') {                  //0000 : 2F 61 30 20 18 C6 C1 00 00 08 79 72 0F 21 00 00 00 00 16 21 00 
      SkyZone = TempSkyZone;                                                    //0015 : 0F 01 30 7B 72 0F 00 08 79 72 0F 
    }
    if (Level.DetailMode == 0) {                                                //0022 : 07 8A 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 
      foreach AllActors(Class'SkyZoneInfo',TempSkyZone,'None') {                //003B : 2F 61 30 20 18 C6 C1 00 00 08 79 72 0F 21 00 00 00 00 16 86 00 
        if (!TempSkyZone.bHighDetail && !TempSkyZone.bSuperHighDetail) {        //0050 : 07 85 00 82 81 19 00 08 79 72 0F 06 00 04 2D 01 D8 62 6E 0F 16 18 12 00 81 19 00 08 79 72 0F 06 00 04 2D 01 98 63 6E 0F 16 16 
          SkyZone = TempSkyZone;                                                //007A : 0F 01 30 7B 72 0F 00 08 79 72 0F 
        }
      }
      goto jl0117;                                                              //0087 : 06 17 01 
    }
    if (Level.DetailMode == 1) {                                                //008A : 07 DC 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 01 16 
      foreach AllActors(Class'SkyZoneInfo',TempSkyZone,'None') {                //00A3 : 2F 61 30 20 18 C6 C1 00 00 08 79 72 0F 21 00 00 00 00 16 D8 00 
        if (!TempSkyZone.bSuperHighDetail) {                                    //00B8 : 07 D7 00 81 19 00 08 79 72 0F 06 00 04 2D 01 98 63 6E 0F 16 
          SkyZone = TempSkyZone;                                                //00CC : 0F 01 30 7B 72 0F 00 08 79 72 0F 
        }
      }
      goto jl0117;                                                              //00D9 : 06 17 01 
    }
    if (Level.DetailMode == 2) {                                                //00DC : 07 17 01 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 02 16 
      foreach AllActors(Class'SkyZoneInfo',TempSkyZone,'None') {                //00F5 : 2F 61 30 20 18 C6 C1 00 00 08 79 72 0F 21 00 00 00 00 16 16 01 
        SkyZone = TempSkyZone;                                                  //010A : 0F 01 30 7B 72 0F 00 08 79 72 0F 
      }
    }
    //2F 61 30 20 18 C6 C1 00 00 08 79 72 0F 21 00 00 00 00 16 21 00 0F 01 30 7B 72 0F 00 08 79 72 0F 
    //31 30 07 8A 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 2F 61 30 20 18 
    //C6 C1 00 00 08 79 72 0F 21 00 00 00 00 16 86 00 07 85 00 82 81 19 00 08 79 72 0F 06 00 04 2D 01 
    //D8 62 6E 0F 16 18 12 00 81 19 00 08 79 72 0F 06 00 04 2D 01 98 63 6E 0F 16 16 0F 01 30 7B 72 0F 
    //00 08 79 72 0F 31 30 06 17 01 07 DC 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 
    //24 01 16 2F 61 30 20 18 C6 C1 00 00 08 79 72 0F 21 00 00 00 00 16 D8 00 07 D7 00 81 19 00 08 79 
    //72 0F 06 00 04 2D 01 98 63 6E 0F 16 0F 01 30 7B 72 0F 00 08 79 72 0F 31 30 06 17 01 07 17 01 9A 
    //39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 02 16 2F 61 30 20 18 C6 C1 00 00 08 79 
    //72 0F 21 00 00 00 00 16 16 01 0F 01 30 7B 72 0F 00 08 79 72 0F 31 30 04 0B 47 
  }


  final native(308) iterator function ZoneActors(class<Actor> BaseClass,out Actor Actor);



