//==============================================================================
//  Engine
//==============================================================================

class Engine extends Subsystem
    native
    noexport
    dependsOn()
    Transient
    Config(System)
  ;

  var Primitive Cylinder;
  var const Client Client;
  var const AudioSubsystem Audio;
  var const RenderDevice GRenDev;
  var const SBAudioManager AudioManager;
  var int bShowFrameRate;
  var int bShowRenderStats;
  var int bShowHardwareStats;
  var int bShowGameStats;
  var int bShowAnimStats;
  var int bShowLIPSincStats;
  var int bShowHistograph;
  var int bShowXboxMemStats;
  var int bShowMatineeStats;
  var int bShowAudioStats;
  var int bShowLightStats;
  var int bShowClothStats;
  var int bShowSkillStats;
  var int bShowCombatStats;
  var int bShowBacthStats;
  var int bShowRenDevStats;
  var int bShowStatWindow;
  var int bShowSBClock;
  var int TickCycles;
  var int GameCycles;
  var int ClientCycles;
  var int TickCounter;
  var config int DetectedVideoMemory;
  var (Settings) config int CacheSizeMegs;
  var (Settings) config int MultiSampleQL;
  var (Settings) config bool UseSound;
  var (Settings) config bool UseStaticMeshBatching;
  var (Settings) config bool ServerReadsStdin;
  var (Settings) config bool UseDynamicTicking;
  var (Settings) config bool RenderBSP;
  var (Settings) config bool UseHQSun;
  var (Settings) config bool UseLightmapping;
  var (Settings) config bool UseMultiSample;
  var (Settings) float CurrentTickRate;
  var (Colors) config Color C_WorldBox;
  var (Colors) config Color C_GroundPlane;
  var (Colors) config Color C_GroundHighlight;
  var (Colors) config Color C_BrushWire;
  var (Colors) config Color C_Pivot;
  var (Colors) config Color C_Select;
  var (Colors) config Color C_Current;
  var (Colors) config Color C_AddWire;
  var (Colors) config Color C_SubtractWire;
  var (Colors) config Color C_GreyWire;
  var (Colors) config Color C_BrushVertex;
  var (Colors) config Color C_BrushSnap;
  var (Colors) config Color C_Invalid;
  var (Colors) config Color C_ActorWire;
  var (Colors) config Color C_ActorHiWire;
  var (Colors) config Color C_Black;
  var (Colors) config Color C_White;
  var (Colors) config Color C_Mask;
  var (Colors) config Color C_SemiSolidWire;
  var (Colors) config Color C_NonSolidWire;
  var (Colors) config Color C_WireBackground;
  var (Colors) config Color C_WireGridAxis;
  var (Colors) config Color C_ActorArrow;
  var (Colors) config Color C_ScaleBox;
  var (Colors) config Color C_ScaleBoxHi;
  var (Colors) config Color C_ZoneWire;
  var (Colors) config Color C_Mover;
  var (Colors) config Color C_OrthoBackground;
  var (Colors) config Color C_StaticMesh;
  var (Colors) config Color C_VolumeBrush;
  var (Colors) config Color C_ConstraintLine;
  var (Colors) config Color C_AnimMesh;
  var (Colors) config Color C_TerrainWire;



