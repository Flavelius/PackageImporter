//==============================================================================
//  Actor
//==============================================================================

class Actor extends Object
    native
    abstract
    nativereplication
    dependsOn(LevelInfo,Pawn,PlayerController,PhysicsVolume,Canvas)
  ;

  const MINFLOORZ =  0.7;
  const MAXSTEPHEIGHT =  25.0;
  enum EOwningDepartmentType {
    ODT_None ,
    ODT_Level ,
    ODT_Sound ,
    EOwningDepartmentType_RESERVED_3 ,
    ODT_Gameplay 
  };

  enum eKillZType {
    KILLZ_None ,
    KILLZ_Lava ,
    KILLZ_Suicide 
  };

  enum ETravelType {
    TRAVEL_Absolute ,
    TRAVEL_Partial ,
    TRAVEL_Relative 
  };

  enum EForceType {
    FT_None ,
    FT_DragAlong ,
    FT_Constant 
  };

  enum EMusicTransition {
    MTRAN_None ,
    MTRAN_Instant ,
    MTRAN_Segue ,
    MTRAN_Fade ,
    MTRAN_FastFade ,
    MTRAN_SlowFade 
  };

  enum ESoundSlot {
    SLOT_None ,
    SLOT_Misc ,
    SLOT_Pain ,
    SLOT_Interact ,
    SLOT_Ambient ,
    SLOT_Talk ,
    SLOT_Interface 
  };

  enum ESoundOcclusion {
    OCCLUSION_Default ,
    OCCLUSION_None ,
    OCCLUSION_BSP ,
    OCCLUSION_StaticMeshes 
  };

  enum ERenderStyle {
    STY_None ,
    STY_Normal ,
    STY_Masked ,
    STY_Translucent ,
    STY_Modulated ,
    STY_Alpha ,
    STY_Additive ,
    STY_Subtractive ,
    STY_Particle ,
    STY_AlphaZ 
  };

  enum ESurfaceTypes {
    EST_Default ,
    EST_Rock ,
    EST_Dirt ,
    EST_Metal ,
    EST_Wood ,
    EST_Plant ,
    EST_Flesh ,
    EST_Ice ,
    EST_Snow ,
    EST_Water ,
    EST_Glass ,
    EST_CreakyWood ,
    EST_Grass ,
    EST_Gravel ,
    EST_HardRock ,
    EST_Mud ,
    EST_Stone ,
    EST_Hardwood ,
    EST_WoodRug ,
    EST_Custom08 ,
    EST_Custom09 ,
    EST_Custom10 ,
    EST_Custom11 ,
    EST_Custom12 ,
    EST_Custom13 ,
    EST_Custom14 ,
    EST_Custom15 ,
    EST_Custom16 ,
    EST_Custom17 ,
    EST_Custom18 ,
    EST_Custom19 ,
    EST_Custom20 ,
    EST_Custom21 ,
    EST_Custom22 ,
    EST_Custom23 ,
    EST_Custom24 ,
    EST_Custom25 ,
    EST_Custom26 ,
    EST_Custom27 ,
    EST_Custom28 ,
    EST_Custom29 ,
    EST_Custom30 ,
    EST_Custom31 
  };

  enum EUV2Mode {
    UVM_MacroTexture ,
    UVM_LightMap ,
    UVM_Skin 
  };

  enum ENetRole {
    ROLE_None ,
    ROLE_DumbProxy ,
    ROLE_SimulatedProxy ,
    ROLE_AutonomousProxy ,
    ROLE_Authority 
  };

  enum EPhysics {
    PHYS_None ,
    PHYS_Walking ,
    PHYS_Falling ,
    PHYS_Swimming ,
    PHYS_Flying ,
    PHYS_Rotating ,
    PHYS_Projectile ,
    PHYS_Interpolating ,
    PHYS_MovingBrush ,
    PHYS_Spider ,
    PHYS_Trailer ,
    PHYS_Ladder ,
    PHYS_RootMotion ,
    PHYS_Karma ,
    PHYS_KarmaRagDoll ,
    PHYS_Hovering ,
    PHYS_CinMotion ,
    PHYS_DragonFlying ,
    PHYS_Jumping ,
    PHYS_SitGround ,
    PHYS_SitChair ,
    PHYS_Submerged ,
    PHYS_Turret 
  };

  enum EResidence {
    RES_ServerClient ,
    RES_ClientOnly ,
    RES_ServerOnly 
  };

  enum EFilterState {
    FS_Maybe ,
    FS_Yes ,
    FS_No 
  };

  enum EDrawType {
    DT_None ,
    DT_Sprite ,
    DT_Mesh ,
    DT_Brush ,
    DT_RopeSprite ,
    DT_VerticalSprite ,
    DT_Terraform ,
    DT_SpriteAnimOnce ,
    DT_StaticMesh ,
    DT_DrawType ,
    DT_Particle ,
    DT_AntiPortal ,
    DT_FluidSurface 
  };

  enum ELightEffect {
    LE_None ,
    LE_TorchWaver ,
    LE_FireWaver ,
    LE_WateryShimmer ,
    LE_Searchlight ,
    LE_SlowWave ,
    LE_FastWave ,
    LE_CloudCast ,
    LE_StaticSpot ,
    LE_Shock ,
    LE_Disco ,
    LE_Warp ,
    LE_Spotlight ,
    LE_NonIncidence ,
    LE_Shell ,
    LE_OmniBumpMap ,
    LE_Interference ,
    LE_Cylinder ,
    LE_Rotor ,
    LE_Negative ,
    LE_Sunlight ,
    LE_QuadraticNonIncidence 
  };

  enum ELightType {
    LT_None ,
    LT_Steady ,
    LT_Pulse ,
    LT_Blink ,
    LT_Flicker ,
    LT_Strobe ,
    LT_BackdropLight ,
    LT_SubtlePulse ,
    LT_TexturePaletteOnce ,
    LT_TexturePaletteLoop ,
    LT_FadeOut 
  };

  enum eSBNetworkRoles {
    sbROLE_None ,
    sbROLE_Server ,
    sbROLE_Proxy ,
    sbROLE_DBProxy ,
    sbROLE_Client ,
    sbROLE_RelevantLod0 ,
    sbROLE_RelevantLod1 ,
    sbROLE_RelevantLod2 ,
    sbROLE_RelevantLod3 ,
    sbROLE_ServerLocal ,
    sbROLE_ClientLocal 
  };

  struct ActorRelation {
      var Actor mActor;
      var string mDescription;
      var Color mColour;

  };


  struct KRBVec {
      var float X;
      var float Y;
      var float Z;

  };


  struct KRigidBodyState {
      var KRBVec Position;
      var Quat Quaternion;
      var KRBVec LinVel;
      var KRBVec AngVel;

  };


  struct SBSoundTypeParams {
      var byte SoundType;
      var float RunningTime;
      var float TimeBetweenSounds;

  };


  struct SBSoundGroupParams {
      var name PropertyGroupName;
      var float RunningTime;
      var float TimeBetweenSounds;

  };


  struct SBProjectorRenderInfoPtr {
      var transient int Ptr;

  };


  struct StaticMeshProjectorRenderInfoPtr {
      var transient int Ptr;

  };


  struct ProjectorRenderInfoPtr {
      var transient int Ptr;

  };


  struct HashLink {
      var transient int HashNext;
      var transient int HashPrevious;
      var int NextIndex;
      var int PreviousIndex;

  };


  struct HashValues {
      var const transient array<HashLink> HashLinks;
      var int StartIndices;
      var int EndIndices;

  };


  struct PointRegion {
      var ZoneInfo Zone;
      var int iLeaf;
      var byte ZoneNumber;

  };


  struct BatchReference {
      var int BatchIndex;
      var int ElementIndex;

  };


  struct LightRenderDataPtr {
      var transient int Ptr;

  };


  struct ActorRenderDataPtr {
      var transient int Ptr;

  };


  struct ActorFrameDataPtr {
      var transient int Ptr;

  };


  var byte SBRole;
  var (Movement) const Vector Location;
  var SBSettings mSBSettings;
  var (Lighting) byte LightType;
  var (Lighting) byte LightEffect;
  var (LightColor) byte LightHue;
  var (LightColor) byte LightSaturation;
  var (LightColor) float LightBrightness;
  var (Lighting) float LightRadius;
  var (Lighting) byte LightPeriod;
  var (Lighting) byte LightPhase;
  var (Lighting) byte LightCone;
  var (Display) const byte DrawType;
  var const native byte StaticFilterState;
  var (Display) const StaticMesh StaticMesh;
  var const Actor Owner;
  var const Actor Base;
  var const native ActorFrameDataPtr ActorFrameData;
  var const native ActorRenderDataPtr ActorRenderData;
  var const native LightRenderDataPtr LightRenderData;
  var const native int RenderRevision;
  var const native array<BatchReference> StaticSectionBatches;
  var (Display) const name ForcedVisibilityZoneTag;
  var (Display) const name ForcedLightingZoneTag;
  var (Display) float CullDistance;
  var (Display) bool NeverCull;
  var (Lighting) bool bSpecialLit;
  var (Lighting) bool bActorShadows;
  var (Lighting) bool bCorona;
  var (Lighting) bool bDirectionalCorona;
  var (Lighting) bool bAttenByLife;
  var (Lighting) bool bLightingVisibility;
  var (Display) bool bUseDynamicLights;
  var bool bLightChanged;
  var bool bDramaticLighting;
  var const bool bStatic;
  var (Advanced) bool bHidden;
  var (Advanced) const bool bNoDelete;
  var const bool bDeleteMe;
  var const transient bool bTicked;
  var (Lighting) bool bDynamicLight;
  var bool bTimerLoop;
  var bool bOnlyOwnerSee;
  var (Advanced) bool bHighDetail;
  var (Advanced) bool bSuperHighDetail;
  var bool bOnlyDrawIfAttached;
  var (Advanced) bool bStasis;
  var bool bTrailerAllowRotation;
  var bool bTrailerSameRotation;
  var bool bTrailerPrePivot;
  var bool bWorldGeometry;
  var (Display) bool bAcceptsProjectors;
  var (Display) bool bAcceptsDynamicProjectors;
  var bool bOrientOnSlope;
  var const bool bOnlyAffectPawns;
  var (Display) bool bDisableSorting;
  var (Movement) bool bIgnoreEncroachers;
  var bool bShowOctreeNodes;
  var bool bWasSNFiltered;
  var const bool bDetailAttachment;
  var const bool bNetTemporary;
  var bool bOnlyRelevantToOwner;
  var const transient bool bNetDirty;
  var bool bAlwaysRelevant;
  var bool bReplicateInstigator;
  var bool bReplicateMovement;
  var bool bSkipActorPropertyReplication;
  var bool bUpdateSimulatedPosition;
  var bool bTearOff;
  var bool bOnlyDirtyReplication;
  var const bool bNetInitialRotation;
  var bool bCompressedPosition;
  var bool bAlwaysZeroBoneOffset;
  var bool bIgnoreVehicles;
  var (Display) bool bDeferRendering;
  var bool bBadStateCode;
  var (Advanced) bool bSkipOnMerge;
  var bool SkinsConverted;
  var const transient int MLURefCount;
  var (Advanced) byte Residence;
  var (Movement) const byte Physics;
  var byte Role;
  var Pawn Instigator;
  var (Sound) Sound AmbientSound;
  var const name AttachmentBone;
  var const LevelInfo Level;
  var const transient Level XLevel;
  var transient int Instance;
  var transient Actor InstanceOriginal;
  var (Advanced) float LifeSpan;
  var const PointRegion Region;
  var float TimerRate;
  var (Display) Material OverlayMaterial;
  var (Display) Color OverlayColor;
  var (Display) Mesh Mesh;
  var transient float LastRenderTime;
  var int IsChainableIndex;
  var (Events) name Tag;
  var transient array<int> Leaves;
  var (Events) name Event;
  var const float TimerCounter;
  var transient MeshInstance MeshInstance;
  var (Display) float LODBias;
  var (Object) name InitialState;
  var (Object) name Group;
  var (Object) array<ActorGroup> ActorGroups;
  var const array<Actor> Touching;
  var const transient array<int> OctreeNodes;
  var const transient Box OctreeBox;
  var const transient Vector OctreeBoxCenter;
  var const transient Vector OctreeBoxRadii;
  var const HashValues HashData;
  var const Actor Deleted;
  var const float LatentFloat;
  var const native int CollisionTag;
  var const transient int JoinedTag;
  var const PhysicsVolume PhysicsVolume;
  var (Movement) Vector Velocity;
  var (Movement) const Rotator Rotation;
  var Vector Acceleration;
  var const Vector CachedLocation;
  var const Rotator CachedRotation;
  var Matrix CachedLocalToWorld;
  var (Movement) name AttachTag;
  var const array<Actor> Attached;
  var const Vector RelativeLocation;
  var const Rotator RelativeRotation;
  var const Matrix HardRelMatrix;
  var const native array<ProjectorRenderInfoPtr> Projectors;
  var const native array<StaticMeshProjectorRenderInfoPtr> StaticMeshProjectors;
  var const native array<SBProjectorRenderInfoPtr> SBProjectors;
  var (Spellborn) bool bUseLightmap;
  var (Spellborn) bool bUseSunlights;
  var bool TakeSunlightingFromBase;
  var (Spellborn) float LightmapContrastAdjust;
  var (Spellborn) int LightmapSize;
  var (Spellborn) float LightmapBlurScale;
  var (Spellborn) float ZBias;
  var (Spellborn) float SunlightsContrastAdjust;
  var (Spellborn) float SunlightsBrightness;
  var (Spellborn) float StaticLightAmount;
  var (Display) Material Texture;
  var StaticMeshInstance StaticMeshInstance;
  var const export Model Brush;
  var (Display) const float DrawScale;
  var (Display) const Vector DrawScale3D;
  var (Display) Vector PrePivot;
  var (Display) array<Material> Skins;
  var Material RepSkin;
  var (Display) byte AmbientGlow;
  var (Display) byte MaxLights;
  var (Display) byte UV2Mode;
  var (Display) ConvexVolume AntiPortal;
  var (Display) Material UV2Texture;
  var (Display) float ScaleGlow;
  var (Collision) byte SurfaceType;
  var (Display) byte Style;
  var (Display) bool bUnlit;
  var (Display) bool bShadowCast;
  var (Display) bool bStaticLighting;
  var (Display) bool bUseLightingFromBase;
  var bool bHurtEntry;
  var (Advanced) bool bGameRelevant;
  var (Advanced) bool bCollideWhenPlacing;
  var bool bTravel;
  var (Advanced) bool bMovable;
  var bool bDestroyInPainVolume;
  var bool bCanBeDamaged;
  var (Advanced) bool bShouldBaseAtStartup;
  var bool bPendingDelete;
  var bool bAnimByOwner;
  var bool bOwnerNoSee;
  var (Advanced) bool bCanTeleport;
  var bool bClientAnim;
  var bool bDisturbFluidSurface;
  var const bool bAlwaysTick;
  var (Sound) bool bFullVolume;
  var bool bNotifyLocalPlayerTeamReceived;
  var (Movement) bool bHardAttach;
  var bool bForceSkelUpdate;
  var const bool bClientAuthoritative;
  var float FluidSurfaceShootStrengthMod;
  var (Sound) byte SoundVolume;
  var (Sound) byte SoundPitch;
  var (Sound) byte SoundOcclusion;
  var (Sound) float SoundRadius;
  var (Sound) float TransientSoundVolume;
  var (Sound) float TransientSoundRadius;
  var transient array<SBSoundGroupParams> SoundGroupsPlaying;
  var transient array<SBSoundTypeParams> SoundTypesPlaying;
  var (Collision) float CollisionRadius;
  var (Collision) float CollisionHeight;
  var (Collision) const bool bCollideActors;
  var bool bCollideWorld;
  var (Collision) bool bBlockActors;
  var bool bBlockProjectiles;
  var (Collision) bool bProjTarget;
  var (Collision) bool bBlockZeroExtentTraces;
  var (Collision) bool bBlockNonZeroExtentTraces;
  var (Collision) bool bAutoAlignToTerrain;
  var (Collision) bool bUseCylinderCollision;
  var (Collision) const bool bBlockKarma;
  var bool bBlocksTeleport;
  var (Display) bool bAlwaysFaceCamera;
  var bool bUseCollisionStaticMesh;
  var bool bIgnoreOutOfWorld;
  var (Movement) bool bBounce;
  var (Movement) bool bFixedRotationDir;
  var (Movement) bool bRotateToDesired;
  var (Movement) bool bIgnoreTerminalVelocity;
  var (Movement) bool bOrientToVelocity;
  var bool bInterpolating;
  var const bool bJustTeleported;
  var (Movement) float Mass;
  var (Movement) float Buoyancy;
  var (Movement) Rotator RotationRate;
  var (Movement) Rotator DesiredRotation;
  var Actor PendingTouch;
  var const Vector ColLocation;
  var (Events) name ExcludeTag[8];
  var transient Vector AlignmentNormalSum;
  var transient int NumberOfNormals;
  var transient int CurrentAlignmentCheck;
  var transient Vector AverageNormal;
  var deprecated bool bAlignToFloor;
  var bool bAlignToFloorRoll;
  var bool bAlignToFloorPitch;
  var (Force) byte ForceType;
  var (Force) float ForceRadius;
  var (Force) float ForceScale;
  var (Force) float ForceNoise;
  var const bool bNetInitial;
  var const bool bNetOwner;
  var const bool bNetRelevant;
  var const bool bDemoRecording;
  var const bool bClientDemoRecording;
  var const bool bRepClientDemo;
  var const bool bClientDemoNetFunc;
  var bool bNoRepMesh;
  var bool bNotOnDedServer;
  var bool bAlreadyPrecachedMaterials;
  var bool bAlreadyPrecachedMeshes;
  var (Advanced) bool bHiddenEd;
  var (Advanced) bool bHiddenEdGroup;
  var (Advanced) bool bDirectional;
  var const bool bSelected;
  var (Advanced) bool bEdShouldSnap;
  var transient bool bEdSnap;
  var const transient bool bTempEditor;
  var (Collision) bool bPathColliding;
  var transient bool bPathTemp;
  var bool bScriptInitialized;
  var (Advanced) bool bLockLocation;
  var bool bTraceWater;
  var (Debugging) bool ShowDebugInfo;
  var (Debugging) bool ShowActorRelations;
  var transient array<ActorRelation> ActorRelations;
  var bool SBWantServerFrame;
  var bool SBWantClientFrame;
  var bool SBWantClientTick;
  var bool SBTickDisabled;
  var Material HighDetailOverlay;
  var (Advanced) byte OwningDepartment;
  var string StatsGroups[10];


  final native function GetTaggedRelations(string aTag,Color aColour,string aDescription,out array<ActorRelation> oRelations);


  event cl_NotifyUnderCursor(bool aSetting);


  event RadialMenuSelect(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    //04 0B 47 
  }


  function Material RadialMenuImage(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  event RadialMenuCollect(Pawn aPlayerPawn,byte aMainOption,out array<byte> aMainOptions) {
    //04 0B 47 
  }


  event OnSettingsChanged();


  function bool BlocksShotAt(Actor Other) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function PawnBaseDied();


  function bool IsStationary() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function NotifyLocalPlayerTeamReceived();


  function NotifyLocalPlayerDead(PlayerController PC);


  function SetDelayedDamageInstigatorController(Controller C);


  function bool TeamLink(int TeamNum) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool SelfTriggered() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  simulated function bool EffectIsRelevant(Vector SpawnLocation,bool bForceDedicated) {
    local PlayerController P;
    local bool bResult;
    if (Level.NetMode == 1) {                                                   //0000 : 07 20 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 
      return bForceDedicated;                                                   //0019 : 04 2D 00 C8 7F 6C 0F 
    }
    if (Level.NetMode != 3) {                                                   //0020 : 07 44 00 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 
      bResult = True;                                                           //0039 : 14 2D 00 40 80 6C 0F 27 
    } else {                                                                    //0041 : 06 D8 00 
      if (Instigator != None && Instigator.IsHumanControlled()) {               //0044 : 07 68 00 82 77 01 B8 80 6C 0F 2A 16 18 10 00 19 01 B8 80 6C 0F 06 00 04 1B A7 2A 00 00 16 16 
        return True;                                                            //0063 : 04 27 
      } else {                                                                  //0065 : 06 D8 00 
        if (SpawnLocation == Location) {                                        //0068 : 07 9C 00 D9 00 60 7E 6C 0F 01 30 81 6C 0F 16 
          bResult = Level.TimeSeconds - LastRenderTime < 3;                     //0077 : 14 2D 00 40 80 6C 0F B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 20 82 6C 0F 16 39 3F 2C 03 16 
        } else {                                                                //0099 : 06 D8 00 
          if (Instigator != None
            && Level.TimeSeconds - Instigator.LastRenderTime < 3) {//009C : 07 D8 00 82 77 01 B8 80 6C 0F 2A 16 18 25 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 19 01 B8 80 6C 0F 05 00 04 01 20 82 6C 0F 16 39 3F 2C 03 16 16 
            bResult = True;                                                     //00D0 : 14 2D 00 40 80 6C 0F 27 
          }
        }
      }
    }
    if (bResult) {                                                              //00D8 : 07 D8 01 2D 00 40 80 6C 0F 
      P = Level.GetLocalPlayerController();                                     //00E1 : 0F 00 98 82 6C 0F 19 01 D8 7E 6C 0F 06 00 04 1B 55 2B 00 00 16 
      if (P == None || P.ViewTarget == None) {                                  //00F6 : 07 22 01 84 72 00 98 82 6C 0F 2A 16 18 12 00 72 19 00 98 82 6C 0F 05 00 04 01 10 83 6C 0F 2A 16 16 
        bResult = False;                                                        //0117 : 14 2D 00 40 80 6C 0F 28 
      } else {                                                                  //011F : 06 D8 01 
        if (P.Pawn == Instigator) {                                             //0122 : 07 54 01 72 19 00 98 82 6C 0F 05 00 04 01 88 83 6C 0F 01 B8 80 6C 0F 16 
          bResult = CheckMaxEffectDistance(P,SpawnLocation);                    //013A : 14 2D 00 40 80 6C 0F 1B 32 2B 00 00 00 98 82 6C 0F 00 60 7E 6C 0F 16 
        } else {                                                                //0151 : 06 D8 01 
          if (vector(P.Rotation) Dot (SpawnLocation - P.ViewTarget.Location) < 0.00000000) {//0154 : 07 C1 01 B0 DB 39 39 19 00 98 82 6C 0F 05 00 0C 01 00 84 6C 0F D8 00 60 7E 6C 0F 19 19 00 98 82 6C 0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 16 16 1E 00 00 00 00 16 
            bResult = VSize(P.ViewTarget.Location - SpawnLocation) < 1600;      //018E : 14 2D 00 40 80 6C 0F B0 E1 D8 19 19 00 98 82 6C 0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 00 60 7E 6C 0F 16 16 39 3F 1D 40 06 00 00 16 
          } else {                                                              //01BE : 06 D8 01 
            bResult = CheckMaxEffectDistance(P,SpawnLocation);                  //01C1 : 14 2D 00 40 80 6C 0F 1B 32 2B 00 00 00 98 82 6C 0F 00 60 7E 6C 0F 16 
          }
        }
      }
    }
    return bResult;                                                             //01D8 : 04 2D 00 40 80 6C 0F 
    //07 20 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 04 2D 00 C8 7F 6C 0F 
    //07 44 00 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 14 2D 00 40 80 6C 0F 
    //27 06 D8 00 07 68 00 82 77 01 B8 80 6C 0F 2A 16 18 10 00 19 01 B8 80 6C 0F 06 00 04 1B A7 2A 00 
    //00 16 16 04 27 06 D8 00 07 9C 00 D9 00 60 7E 6C 0F 01 30 81 6C 0F 16 14 2D 00 40 80 6C 0F B0 AF 
    //19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 20 82 6C 0F 16 39 3F 2C 03 16 06 D8 00 07 D8 00 82 
    //77 01 B8 80 6C 0F 2A 16 18 25 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 19 01 B8 80 6C 
    //0F 05 00 04 01 20 82 6C 0F 16 39 3F 2C 03 16 16 14 2D 00 40 80 6C 0F 27 07 D8 01 2D 00 40 80 6C 
    //0F 0F 00 98 82 6C 0F 19 01 D8 7E 6C 0F 06 00 04 1B 55 2B 00 00 16 07 22 01 84 72 00 98 82 6C 0F 
    //2A 16 18 12 00 72 19 00 98 82 6C 0F 05 00 04 01 10 83 6C 0F 2A 16 16 14 2D 00 40 80 6C 0F 28 06 
    //D8 01 07 54 01 72 19 00 98 82 6C 0F 05 00 04 01 88 83 6C 0F 01 B8 80 6C 0F 16 14 2D 00 40 80 6C 
    //0F 1B 32 2B 00 00 00 98 82 6C 0F 00 60 7E 6C 0F 16 06 D8 01 07 C1 01 B0 DB 39 39 19 00 98 82 6C 
    //0F 05 00 0C 01 00 84 6C 0F D8 00 60 7E 6C 0F 19 19 00 98 82 6C 0F 05 00 04 01 10 83 6C 0F 05 00 
    //0C 01 30 81 6C 0F 16 16 1E 00 00 00 00 16 14 2D 00 40 80 6C 0F B0 E1 D8 19 19 00 98 82 6C 0F 05 
    //00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 00 60 7E 6C 0F 16 16 39 3F 1D 40 06 00 00 16 06 D8 
    //01 14 2D 00 40 80 6C 0F 1B 32 2B 00 00 00 98 82 6C 0F 00 60 7E 6C 0F 16 04 2D 00 40 80 6C 0F 04 
    //0B 47 
  }


  simulated function bool CheckMaxEffectDistance(PlayerController P,Vector SpawnLocation) {
    return !P.BeyondViewDistance(SpawnLocation,0.00000000);                     //0000 : 04 81 19 00 A0 85 6C 0F 10 00 04 1B 78 2C 00 00 00 18 86 6C 0F 1E 00 00 00 00 16 16 
    //04 81 19 00 A0 85 6C 0F 10 00 04 1B 78 2C 00 00 00 18 86 6C 0F 1E 00 00 00 00 16 16 04 0B 47 
  }


  static function Crash() {
    assert(False);                                                              //0000 : 09 11 07 28 
    //09 11 07 28 04 0B 47 
  }


  function Vector GetCollisionExtent() {
    local Vector Extent;
    Extent = CollisionRadius * vect(1.000000, 1.000000, 0.000000);              //0000 : 0F 00 50 89 6C 0F D5 01 C8 89 6C 0F 23 00 00 80 3F 00 00 80 3F 00 00 00 00 16 
    Extent.Z = CollisionHeight;                                                 //001A : 0F 36 38 C5 69 0F 00 50 89 6C 0F 01 40 8A 6C 0F 
    return Extent;                                                              //002A : 04 00 50 89 6C 0F 
    //0F 00 50 89 6C 0F D5 01 C8 89 6C 0F 23 00 00 80 3F 00 00 80 3F 00 00 00 00 16 0F 36 38 C5 69 0F 
    //00 50 89 6C 0F 01 40 8A 6C 0F 04 00 50 89 6C 0F 04 0B 47 
  }


  simulated function bool CanSplash() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function PlayTeleportEffect(bool bOut,bool bSound);


  function bool IsInPain() {
    local PhysicsVolume V;
    foreach TouchingActors(Class'PhysicsVolume',V) {                            //0000 : 2F 61 33 20 58 5E C2 00 00 90 8F 6C 0F 16 3E 00 
      if (V.bPainCausing && V.DamagePerSec > 0) {                               //0010 : 07 3D 00 82 19 00 90 8F 6C 0F 06 00 04 2D 01 90 AE 34 0F 18 14 00 B1 19 00 90 8F 6C 0F 05 00 04 01 08 AF 34 0F 39 3F 25 16 16 
        return True;                                                            //003B : 04 27 
      }
    }
    return False;                                                               //003F : 04 28 
    //2F 61 33 20 58 5E C2 00 00 90 8F 6C 0F 16 3E 00 07 3D 00 82 19 00 90 8F 6C 0F 06 00 04 2D 01 90 
    //AE 34 0F 18 14 00 B1 19 00 90 8F 6C 0F 05 00 04 01 08 AF 34 0F 39 3F 25 16 16 30 04 27 31 30 04 
    //28 04 0B 47 
  }


  function bool IsInVolume(Volume aVolume) {
    local Volume V;
    foreach TouchingActors(Class'Volume',V) {                                   //0000 : 2F 61 33 20 18 59 C2 00 00 08 B1 34 0F 16 23 00 
      if (V == aVolume) {                                                       //0010 : 07 22 00 72 00 08 B1 34 0F 00 30 B0 34 0F 16 
        return True;                                                            //0020 : 04 27 
      }
    }
    return False;                                                               //0024 : 04 28 
    //2F 61 33 20 18 59 C2 00 00 08 B1 34 0F 16 23 00 07 22 00 72 00 08 B1 34 0F 00 30 B0 34 0F 16 30 
    //04 27 31 30 04 28 04 0B 47 
  }


  final native function UntriggerEvent(name EventName,Actor Other,Pawn EventInstigator);


  final native function TriggerEvent(name EventName,Actor Other,Pawn EventInstigator);


  function Reset();


  simulated function StartInterpolation() {
    GotoState('None');                                                          //0000 : 71 21 00 00 00 00 16 
    SetCollision(True,False);                                                   //0007 : 61 06 27 28 16 
    bCollideWorld = False;                                                      //000C : 14 2D 01 60 E8 35 0F 28 
    bInterpolating = True;                                                      //0014 : 14 2D 01 D8 E8 35 0F 27 
    SetPhysics(0);                                                              //001C : 6F 82 24 00 16 
    //71 21 00 00 00 00 16 61 06 27 28 16 14 2D 01 60 E8 35 0F 28 14 2D 01 D8 E8 35 0F 27 6F 82 24 00 
    //16 04 0B 47 
  }


  final simulated function bool TouchingActor(Actor A) {
    local Vector dir;
    dir = Location - A.Location;                                                //0000 : 0F 00 78 EA 35 0F D8 01 30 81 6C 0F 19 00 00 EA 35 0F 05 00 0C 01 30 81 6C 0F 16 
    if (Abs(dir.Z) > CollisionHeight + A.CollisionHeight) {                     //001B : 07 43 00 B1 BA 36 38 C5 69 0F 00 78 EA 35 0F 16 AE 01 40 8A 6C 0F 19 00 00 EA 35 0F 05 00 04 01 40 8A 6C 0F 16 16 
      return False;                                                             //0041 : 04 28 
    }
    dir.Z = 0.00000000;                                                         //0043 : 0F 36 38 C5 69 0F 00 78 EA 35 0F 1E 00 00 00 00 
    return VSize(dir) <= CollisionRadius + A.CollisionRadius;                   //0053 : 04 B2 E1 00 78 EA 35 0F 16 AE 01 C8 89 6C 0F 19 00 00 EA 35 0F 05 00 04 01 C8 89 6C 0F 16 16 
    //0F 00 78 EA 35 0F D8 01 30 81 6C 0F 19 00 00 EA 35 0F 05 00 0C 01 30 81 6C 0F 16 07 43 00 B1 BA 
    //36 38 C5 69 0F 00 78 EA 35 0F 16 AE 01 40 8A 6C 0F 19 00 00 EA 35 0F 05 00 04 01 40 8A 6C 0F 16 
    //16 04 28 0F 36 38 C5 69 0F 00 78 EA 35 0F 1E 00 00 00 00 04 B2 E1 00 78 EA 35 0F 16 AE 01 C8 89 
    //6C 0F 19 00 00 EA 35 0F 05 00 04 01 C8 89 6C 0F 16 16 04 0B 47 
  }


  final simulated function bool NearSpot(Vector Spot) {
    local Vector dir;
    dir = Location - Spot;                                                      //0000 : 0F 00 50 EF 6B 0F D8 01 30 81 6C 0F 00 18 EC 35 0F 16 
    if (Abs(dir.Z) > CollisionHeight) {                                         //0012 : 07 2A 00 B1 BA 36 38 C5 69 0F 00 50 EF 6B 0F 16 01 40 8A 6C 0F 16 
      return False;                                                             //0028 : 04 28 
    }
    dir.Z = 0.00000000;                                                         //002A : 0F 36 38 C5 69 0F 00 50 EF 6B 0F 1E 00 00 00 00 
    return VSize(dir) <= CollisionRadius;                                       //003A : 04 B2 E1 00 50 EF 6B 0F 16 01 C8 89 6C 0F 16 
    //0F 00 50 EF 6B 0F D8 01 30 81 6C 0F 00 18 EC 35 0F 16 07 2A 00 B1 BA 36 38 C5 69 0F 00 50 EF 6B 
    //0F 16 01 40 8A 6C 0F 16 04 28 0F 36 38 C5 69 0F 00 50 EF 6B 0F 1E 00 00 00 00 04 B2 E1 00 50 EF 
    //6B 0F 16 01 C8 89 6C 0F 16 04 0B 47 
  }


  simulated function DisplayDebug(Canvas Canvas,out float YL,out float YPos) {
    local string t;
    local float XL;
    local int i;
    local Actor A;
    local name Anim;
    local float frame;
    local float Rate;
    Canvas.Style = 1;                                                           //0000 : 0F 19 00 F0 F0 6B 0F 05 00 01 01 60 04 6C 0F 24 01 
    Canvas.StrLen("TEST",XL,YL);                                                //0011 : 19 00 F0 F0 6B 0F 13 00 00 61 D0 1F 54 45 53 54 00 00 D8 04 6C 0F 00 50 05 6C 0F 16 
    YPos = YPos + YL;                                                           //002D : 0F 00 08 90 6C 0F AE 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //003F : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.SetDrawColor(255,0,0);                                               //0058 : 19 00 F0 F0 6B 0F 0E 00 00 1C 30 91 6C 0F 39 3D 2C FF 24 00 24 00 16 
    t = "";                                                                     //006F : 0F 00 E0 91 6C 0F 1F 00 
    if (bDeleteMe) {                                                            //0077 : 07 AB 00 2D 01 58 92 6C 0F 
      t = t $ " DELETED (bDeleteMe == true)";                                   //0080 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 44 45 4C 45 54 45 44 20 28 62 44 65 6C 65 74 65 4D 65 20 3D 3D 20 74 72 75 65 29 00 16 
    }
    Canvas.DrawText(t,False);                                                   //00AB : 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 
    YPos += YL;                                                                 //00BD : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //00C9 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.SetDrawColor(255,255,255);                                           //00E2 : 19 00 F0 F0 6B 0F 12 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
    if (Level.NetMode != 0) {                                                   //00FD : 07 47 02 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 
      t = "ROLE ";                                                              //0116 : 0F 00 E0 91 6C 0F 1F 52 4F 4C 45 20 00 
      switch (Role) {                                                           //0123 : 05 01 01 D0 92 6C 0F 
        case 0 :                                                                //012A : 0A 45 01 24 00 
          t = t $ "None";                                                       //012F : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4E 6F 6E 65 00 16 
          break;                                                                //0142 : 06 D3 01 
        case 1 :                                                                //0145 : 0A 65 01 24 01 
          t = t $ "DumbProxy";                                                  //014A : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 44 75 6D 62 50 72 6F 78 79 00 16 
          break;                                                                //0162 : 06 D3 01 
        case 2 :                                                                //0165 : 0A 8A 01 24 02 
          t = t $ "SimulatedProxy";                                             //016A : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 53 69 6D 75 6C 61 74 65 64 50 72 6F 78 79 00 16 
          break;                                                                //0187 : 06 D3 01 
        case 3 :                                                                //018A : 0A B0 01 24 03 
          t = t $ "AutonomousProxy";                                            //018F : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 41 75 74 6F 6E 6F 6D 6F 75 73 50 72 6F 78 79 00 16 
          break;                                                                //01AD : 06 D3 01 
        case 4 :                                                                //01B0 : 0A D0 01 24 04 
          t = t $ "Authority";                                                  //01B5 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 41 75 74 68 6F 72 69 74 79 00 16 
          break;                                                                //01CD : 06 D3 01 
        default:                                                                //01D0 : 0A FF FF 
      }
      t = t $ " REMOTE ROLE ";                                                  //01D3 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 52 45 4D 4F 54 45 20 52 4F 4C 45 20 00 16 
      if (bTearOff) {                                                           //01EF : 07 10 02 2D 01 48 93 6C 0F 
        t = t $ " Tear Off";                                                    //01F8 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 54 65 61 72 20 4F 66 66 00 16 
      }
      Canvas.DrawText(t,False);                                                 //0210 : 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 
      YPos += YL;                                                               //0222 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
      Canvas.SetPos(4.00000000,YPos);                                           //022E : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    }
    t = "Physics ";                                                             //0247 : 0F 00 E0 91 6C 0F 1F 50 68 79 73 69 63 73 20 00 
    switch (Physics) {                                                          //0257 : 05 01 01 C0 93 6C 0F 
      case 0 :                                                                  //025E : 0A 79 02 24 00 
        t = t $ "None";                                                         //0263 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4E 6F 6E 65 00 16 
        break;                                                                  //0276 : 06 57 04 
      case 1 :                                                                  //0279 : 0A 97 02 24 01 
        t = t $ "Walking";                                                      //027E : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 57 61 6C 6B 69 6E 67 00 16 
        break;                                                                  //0294 : 06 57 04 
      case 2 :                                                                  //0297 : 0A B5 02 24 02 
        t = t $ "Falling";                                                      //029C : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 46 61 6C 6C 69 6E 67 00 16 
        break;                                                                  //02B2 : 06 57 04 
      case 3 :                                                                  //02B5 : 0A D4 02 24 03 
        t = t $ "Swimming";                                                     //02BA : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 53 77 69 6D 6D 69 6E 67 00 16 
        break;                                                                  //02D1 : 06 57 04 
      case 4 :                                                                  //02D4 : 0A F1 02 24 04 
        t = t $ "Flying";                                                       //02D9 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 46 6C 79 69 6E 67 00 16 
        break;                                                                  //02EE : 06 57 04 
      case 5 :                                                                  //02F1 : 0A 10 03 24 05 
        t = t $ "Rotating";                                                     //02F6 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 52 6F 74 61 74 69 6E 67 00 16 
        break;                                                                  //030D : 06 57 04 
      case 6 :                                                                  //0310 : 0A 31 03 24 06 
        t = t $ "Projectile";                                                   //0315 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 50 72 6F 6A 65 63 74 69 6C 65 00 16 
        break;                                                                  //032E : 06 57 04 
      case 7 :                                                                  //0331 : 0A 55 03 24 07 
        t = t $ "Interpolating";                                                //0336 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 49 6E 74 65 72 70 6F 6C 61 74 69 6E 67 00 16 
        break;                                                                  //0352 : 06 57 04 
      case 8 :                                                                  //0355 : 0A 77 03 24 08 
        t = t $ "MovingBrush";                                                  //035A : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4D 6F 76 69 6E 67 42 72 75 73 68 00 16 
        break;                                                                  //0374 : 06 57 04 
      case 9 :                                                                  //0377 : 0A 94 03 24 09 
        t = t $ "Spider";                                                       //037C : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 53 70 69 64 65 72 00 16 
        break;                                                                  //0391 : 06 57 04 
      case 10 :                                                                 //0394 : 0A B2 03 24 0A 
        t = t $ "Trailer";                                                      //0399 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 54 72 61 69 6C 65 72 00 16 
        break;                                                                  //03AF : 06 57 04 
      case 11 :                                                                 //03B2 : 0A CF 03 24 0B 
        t = t $ "Ladder";                                                       //03B7 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4C 61 64 64 65 72 00 16 
        break;                                                                  //03CC : 06 57 04 
      case 13 :                                                                 //03CF : 0A EB 03 24 0D 
        t = t $ "Karma";                                                        //03D4 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4B 61 72 6D 61 00 16 
        break;                                                                  //03E8 : 06 57 04 
      case 18 :                                                                 //03EB : 0A 09 04 24 12 
        t = t $ "Jumping";                                                      //03F0 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4A 75 6D 70 69 6E 67 00 16 
        break;                                                                  //0406 : 06 57 04 
      case 19 :                                                                 //0409 : 0A 2F 04 24 13 
        t = t $ "SittingOnGround";                                              //040E : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 53 69 74 74 69 6E 67 4F 6E 47 72 6F 75 6E 64 00 16 
        break;                                                                  //042C : 06 57 04 
      case 20 :                                                                 //042F : 0A 54 04 24 14 
        t = t $ "SittingOnChair";                                               //0434 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 53 69 74 74 69 6E 67 4F 6E 43 68 61 69 72 00 16 
        break;                                                                  //0451 : 06 57 04 
      default:                                                                  //0454 : 0A FF FF 
    }
    t = t $ " in physicsvolume "
      $ GetItemName(string(PhysicsVolume))
      $ " on base "
      $ GetItemName(string(Base));//0457 : 0F 00 E0 91 6C 0F 70 70 70 70 00 E0 91 6C 0F 1F 20 69 6E 20 70 68 79 73 69 63 73 76 6F 6C 75 6D 65 20 00 16 1B 46 29 00 00 39 56 01 38 94 6C 0F 16 16 1F 20 6F 6E 20 62 61 73 65 20 00 16 1B 46 29 00 00 39 56 01 B0 94 6C 0F 16 16 
    if (bBounce) {                                                              //04A3 : 07 C9 04 2D 01 28 95 6C 0F 
      t = t $ " - will bounce";                                                 //04AC : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 2D 20 77 69 6C 6C 20 62 6F 75 6E 63 65 00 16 
    }
    Canvas.DrawText(t,False);                                                   //04C9 : 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 
    YPos += YL;                                                                 //04DB : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //04E7 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawText("Location: " $ string(Location)
      $ " Rotation "
      $ string(Rotation),False);//0500 : 19 00 F0 F0 6B 0F 30 00 00 61 D1 70 70 70 1F 4C 6F 63 61 74 69 6F 6E 3A 20 00 39 58 01 30 81 6C 0F 16 1F 20 52 6F 74 61 74 69 6F 6E 20 00 16 39 59 01 00 84 6C 0F 16 28 16 
    YPos += YL;                                                                 //0539 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0545 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawText("Velocity: " $ string(Velocity)
      $ " Speed "
      $ string(VSize(Velocity))
      $ " Speed2D "
      $ string(VSize(Velocity - Velocity.Z * vect(0.000000, 0.000000, 1.000000))),False);//055E : 19 00 F0 F0 6B 0F 62 00 00 61 D1 70 70 70 70 70 1F 56 65 6C 6F 63 69 74 79 3A 20 00 39 58 01 A0 95 6C 0F 16 1F 20 53 70 65 65 64 20 00 16 39 55 E1 01 A0 95 6C 0F 16 16 1F 20 53 70 65 65 64 32 44 20 00 16 39 55 E1 D8 01 A0 95 6C 0F D5 36 38 C5 69 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 16 16 28 16 
    YPos += YL;                                                                 //05C9 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //05D5 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawText("Acceleration: " $ string(Acceleration),False);             //05EE : 19 00 F0 F0 6B 0F 1D 00 00 61 D1 70 1F 41 63 63 65 6C 65 72 61 74 69 6F 6E 3A 20 00 39 58 01 18 96 6C 0F 16 28 16 
    YPos += YL;                                                                 //0614 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0620 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawColor.B = 0;                                                     //0639 : 0F 36 E0 8F 6A 0F 19 00 F0 F0 6B 0F 05 00 04 01 90 96 6C 0F 24 00 
    Canvas.DrawText("Collision Radius " $ string(CollisionRadius)
      $ " Height "
      $ string(CollisionHeight));//064F : 19 00 F0 F0 6B 0F 34 00 00 61 D1 70 70 70 1F 43 6F 6C 6C 69 73 69 6F 6E 20 52 61 64 69 75 73 20 00 39 55 01 C8 89 6C 0F 16 1F 20 48 65 69 67 68 74 20 00 16 39 55 01 40 8A 6C 0F 16 16 
    YPos += YL;                                                                 //068C : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0698 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawText("Collides with Actors " $ string(bCollideActors)
      $ ", world "
      $ string(bCollideWorld)
      $ ", proj. target "
      $ string(bProjTarget));//06B1 : 19 00 F0 F0 6B 0F 57 00 00 61 D1 70 70 70 70 70 1F 43 6F 6C 6C 69 64 65 73 20 77 69 74 68 20 41 63 74 6F 72 73 20 00 39 54 2D 01 08 97 6C 0F 16 1F 2C 20 77 6F 72 6C 64 20 00 16 39 54 2D 01 60 E8 35 0F 16 1F 2C 20 70 72 6F 6A 2E 20 74 61 72 67 65 74 20 00 16 39 54 2D 01 80 97 6C 0F 16 16 
    YPos += YL;                                                                 //0711 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //071D : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawText("Blocks Actors " $ string(bBlockActors));                   //0736 : 19 00 F0 F0 6B 0F 1D 00 00 61 D1 70 1F 42 6C 6F 63 6B 73 20 41 63 74 6F 72 73 20 00 39 54 2D 01 F8 97 6C 0F 16 16 
    YPos += YL;                                                                 //075C : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0768 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    t = "Touching ";                                                            //0781 : 0F 00 E0 91 6C 0F 1F 54 6F 75 63 68 69 6E 67 20 00 
    foreach TouchingActors(Class'Actor',A) {                                    //0792 : 2F 61 33 20 F8 8B C1 00 00 70 98 6C 0F 16 C2 07 
      t = t $ GetItemName(string(A)) $ " ";                                     //07A2 : 0F 00 E0 91 6C 0F 70 70 00 E0 91 6C 0F 1B 46 29 00 00 39 56 00 70 98 6C 0F 16 16 1F 20 00 16 
    }
    if (t == "Touching ") {                                                     //07C3 : 07 F0 07 7A 00 E0 91 6C 0F 1F 54 6F 75 63 68 69 6E 67 20 00 16 
      t = "Touching nothing";                                                   //07D8 : 0F 00 E0 91 6C 0F 1F 54 6F 75 63 68 69 6E 67 20 6E 6F 74 68 69 6E 67 00 
    }
    Canvas.DrawText(t,False);                                                   //07F0 : 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 
    YPos += YL;                                                                 //0802 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //080E : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawColor.R = 0;                                                     //0827 : 0F 36 D0 90 6A 0F 19 00 F0 F0 6B 0F 05 00 04 01 90 96 6C 0F 24 00 
    t = "Rendered: ";                                                           //083D : 0F 00 E0 91 6C 0F 1F 52 65 6E 64 65 72 65 64 3A 20 00 
    switch (Style) {                                                            //084F : 05 01 01 E8 98 6C 0F 
      case 0 :                                                                  //0856 : 0A 69 08 24 00 
        t = t;                                                                  //085B : 0F 00 E0 91 6C 0F 00 E0 91 6C 0F 
        break;                                                                  //0866 : 06 04 09 
      case 1 :                                                                  //0869 : 0A 86 08 24 01 
        t = t $ "Normal";                                                       //086E : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4E 6F 72 6D 61 6C 00 16 
        break;                                                                  //0883 : 06 04 09 
      case 2 :                                                                  //0886 : 0A A3 08 24 02 
        t = t $ "Masked";                                                       //088B : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4D 61 73 6B 65 64 00 16 
        break;                                                                  //08A0 : 06 04 09 
      case 3 :                                                                  //08A3 : 0A C5 08 24 03 
        t = t $ "Translucent";                                                  //08A8 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 54 72 61 6E 73 6C 75 63 65 6E 74 00 16 
        break;                                                                  //08C2 : 06 04 09 
      case 4 :                                                                  //08C5 : 0A E5 08 24 04 
        t = t $ "Modulated";                                                    //08CA : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4D 6F 64 75 6C 61 74 65 64 00 16 
        break;                                                                  //08E2 : 06 04 09 
      case 5 :                                                                  //08E5 : 0A 01 09 24 05 
        t = t $ "Alpha";                                                        //08EA : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 41 6C 70 68 61 00 16 
        break;                                                                  //08FE : 06 04 09 
      default:                                                                  //0901 : 0A FF FF 
    }
    switch (DrawType) {                                                         //0904 : 05 01 01 60 99 6C 0F 
      case 0 :                                                                  //090B : 0A 27 09 24 00 
        t = t $ " None";                                                        //0910 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 4E 6F 6E 65 00 16 
        break;                                                                  //0924 : 06 3A 0A 
      case 1 :                                                                  //0927 : 0A 46 09 24 01 
        t = t $ " Sprite ";                                                     //092C : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 53 70 72 69 74 65 20 00 16 
        break;                                                                  //0943 : 06 3A 0A 
      case 2 :                                                                  //0946 : 0A 63 09 24 02 
        t = t $ " Mesh ";                                                       //094B : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 4D 65 73 68 20 00 16 
        break;                                                                  //0960 : 06 3A 0A 
      case 3 :                                                                  //0963 : 0A 81 09 24 03 
        t = t $ " Brush ";                                                      //0968 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 42 72 75 73 68 20 00 16 
        break;                                                                  //097E : 06 3A 0A 
      case 4 :                                                                  //0981 : 0A A4 09 24 04 
        t = t $ " RopeSprite ";                                                 //0986 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 52 6F 70 65 53 70 72 69 74 65 20 00 16 
        break;                                                                  //09A1 : 06 3A 0A 
      case 5 :                                                                  //09A4 : 0A CB 09 24 05 
        t = t $ " VerticalSprite ";                                             //09A9 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 56 65 72 74 69 63 61 6C 53 70 72 69 74 65 20 00 16 
        break;                                                                  //09C8 : 06 3A 0A 
      case 6 :                                                                  //09CB : 0A ED 09 24 06 
        t = t $ " Terraform ";                                                  //09D0 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 54 65 72 72 61 66 6F 72 6D 20 00 16 
        break;                                                                  //09EA : 06 3A 0A 
      case 7 :                                                                  //09ED : 0A 14 0A 24 07 
        t = t $ " SpriteAnimOnce ";                                             //09F2 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 53 70 72 69 74 65 41 6E 69 6D 4F 6E 63 65 20 00 16 
        break;                                                                  //0A11 : 06 3A 0A 
      case 8 :                                                                  //0A14 : 0A 37 0A 24 08 
        t = t $ " StaticMesh ";                                                 //0A19 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 53 74 61 74 69 63 4D 65 73 68 20 00 16 
        break;                                                                  //0A34 : 06 3A 0A 
      default:                                                                  //0A37 : 0A FF FF 
    }
    if (DrawType == 2) {                                                        //0A3A : 07 A0 0B 9A 39 3A 01 60 99 6C 0F 39 3A 24 02 16 
      t = t $ GetItemName(string(Mesh));                                        //0A4A : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1B 46 29 00 00 39 56 01 D8 99 6C 0F 16 16 
      if (Skins.Length > 0) {                                                   //0A64 : 07 E5 0A 97 37 01 50 9A 6C 0F 25 16 
        t = t $ " skins: ";                                                     //0A70 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 73 6B 69 6E 73 3A 20 00 16 
        i = 0;                                                                  //0A87 : 0F 00 C8 9A 6C 0F 25 
        while (i < Skins.Length) {                                              //0A8E : 07 E5 0A 96 00 C8 9A 6C 0F 37 01 50 9A 6C 0F 16 
          if (Skins[i] == None) {                                               //0A9E : 07 B5 0A 72 10 00 C8 9A 6C 0F 01 50 9A 6C 0F 2A 16 
            break;                                                              //0AAF : 06 E5 0A 
          } else {                                                              //0AB2 : 06 DB 0A 
            t = t $ GetItemName(string(Skins[i]))
              $ ", ";         //0AB5 : 0F 00 E0 91 6C 0F 70 70 00 E0 91 6C 0F 1B 46 29 00 00 39 56 10 00 C8 9A 6C 0F 01 50 9A 6C 0F 16 16 1F 2C 20 00 16 
          }
          i++;                                                                  //0ADB : A5 00 C8 9A 6C 0F 16 
        }
      }
      Canvas.DrawText(t,False);                                                 //0AE5 : 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 
      YPos += YL;                                                               //0AF7 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
      Canvas.SetPos(4.00000000,YPos);                                           //0B03 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
      GetAnimParams(0,Anim,frame,Rate);                                         //0B1C : 1C 40 9B 6C 0F 25 00 F0 9B 6C 0F 00 68 9C 6C 0F 00 E0 9C 6C 0F 16 
      t = "AnimSequence " $ string(Anim) $ " Frame "
        $ string(frame)
        $ " Rate "
        $ string(Rate);//0B32 : 0F 00 E0 91 6C 0F 70 70 70 70 70 1F 41 6E 69 6D 53 65 71 75 65 6E 63 65 20 00 39 57 00 F0 9B 6C 0F 16 1F 20 46 72 61 6D 65 20 00 16 39 55 00 68 9C 6C 0F 16 1F 20 52 61 74 65 20 00 16 39 55 00 E0 9C 6C 0F 16 
      if (bAnimByOwner) {                                                       //0B77 : 07 9D 0B 2D 01 58 9D 6C 0F 
        t = t $ " Anim by Owner";                                               //0B80 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 41 6E 69 6D 20 62 79 20 4F 77 6E 65 72 00 16 
      }
    } else {                                                                    //0B9D : 06 FD 0B 
      if (DrawType == 1 || DrawType == 7) {                                     //0BA0 : 07 D9 0B 84 9A 39 3A 01 60 99 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 60 99 6C 0F 39 3A 24 07 16 16 
        t = t $ string(Texture);                                                //0BC2 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 39 56 01 D0 9D 6C 0F 16 
      } else {                                                                  //0BD6 : 06 FD 0B 
        if (DrawType == 3) {                                                    //0BD9 : 07 FD 0B 9A 39 3A 01 60 99 6C 0F 39 3A 24 03 16 
          t = t $ string(Brush);                                                //0BE9 : 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 39 56 01 48 9E 6C 0F 16 
        }
      }
    }
    Canvas.DrawText(t,False);                                                   //0BFD : 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 
    YPos += YL;                                                                 //0C0F : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0C1B : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawColor.B = 255;                                                   //0C34 : 0F 36 E0 8F 6A 0F 19 00 F0 F0 6B 0F 05 00 04 01 90 96 6C 0F 39 3D 2C FF 
    Canvas.DrawText("Tag: " $ string(Tag) $ " Event: "
      $ string(Event)
      $ " STATE: "
      $ string(GetStateName()),False);//0C4C : 19 00 F0 F0 6B 0F 3C 00 00 61 D1 70 70 70 70 70 1F 54 61 67 3A 20 00 39 57 01 C0 9E 6C 0F 16 1F 20 45 76 65 6E 74 3A 20 00 16 39 57 01 38 9F 6C 0F 16 1F 20 53 54 41 54 45 3A 20 00 16 39 57 61 1C 16 16 28 16 
    YPos += YL;                                                                 //0C91 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0C9D : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawText("Instigator "
      $ GetItemName(string(Instigator))
      $ " Owner "
      $ GetItemName(string(Owner)));//0CB6 : 19 00 F0 F0 6B 0F 39 00 00 61 D1 70 70 70 1F 49 6E 73 74 69 67 61 74 6F 72 20 00 1B 46 29 00 00 39 56 01 B8 80 6C 0F 16 16 1F 20 4F 77 6E 65 72 20 00 16 1B 46 29 00 00 39 56 01 B0 9F 6C 0F 16 16 16 
    YPos += YL;                                                                 //0CF8 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0D04 : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    Canvas.DrawText("Timer: " $ string(TimerCounter)
      $ " LifeSpan "
      $ string(LifeSpan)
      $ " AmbientSound "
      $ string(AmbientSound)
      $ " volume "
      $ string(SoundVolume));//0D1D : 19 00 F0 F0 6B 0F 5C 00 00 61 D1 70 70 70 70 70 70 70 1F 54 69 6D 65 72 3A 20 00 39 55 01 28 A0 6C 0F 16 1F 20 4C 69 66 65 53 70 61 6E 20 00 16 39 55 01 A0 A0 6C 0F 16 1F 20 41 6D 62 69 65 6E 74 53 6F 75 6E 64 20 00 16 39 56 01 18 A1 6C 0F 16 1F 20 76 6F 6C 75 6D 65 20 00 16 39 52 01 90 A1 6C 0F 16 16 
    YPos += YL;                                                                 //0D82 : B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0D8E : 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    //0F 19 00 F0 F0 6B 0F 05 00 01 01 60 04 6C 0F 24 01 19 00 F0 F0 6B 0F 13 00 00 61 D0 1F 54 45 53 
    //54 00 00 D8 04 6C 0F 00 50 05 6C 0F 16 0F 00 08 90 6C 0F AE 00 08 90 6C 0F 00 50 05 6C 0F 16 19 
    //00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 19 00 F0 F0 6B 0F 0E 00 
    //00 1C 30 91 6C 0F 39 3D 2C FF 24 00 24 00 16 0F 00 E0 91 6C 0F 1F 00 07 AB 00 2D 01 58 92 6C 0F 
    //0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 44 45 4C 45 54 45 44 20 28 62 44 65 6C 65 74 65 4D 65 
    //20 3D 3D 20 74 72 75 65 29 00 16 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 B8 00 08 
    //90 6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 
    //0F 16 19 00 F0 F0 6B 0F 12 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 07 47 02 
    //9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 0F 00 E0 91 6C 0F 1F 52 4F 4C 
    //45 20 00 05 01 01 D0 92 6C 0F 0A 45 01 24 00 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4E 6F 6E 65 
    //00 16 06 D3 01 0A 65 01 24 01 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 44 75 6D 62 50 72 6F 78 79 
    //00 16 06 D3 01 0A 8A 01 24 02 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 53 69 6D 75 6C 61 74 65 64 
    //50 72 6F 78 79 00 16 06 D3 01 0A B0 01 24 03 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 41 75 74 6F 
    //6E 6F 6D 6F 75 73 50 72 6F 78 79 00 16 06 D3 01 0A D0 01 24 04 0F 00 E0 91 6C 0F 70 00 E0 91 6C 
    //0F 1F 41 75 74 68 6F 72 69 74 79 00 16 06 D3 01 0A FF FF 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 
    //20 52 45 4D 4F 54 45 20 52 4F 4C 45 20 00 16 07 10 02 2D 01 48 93 6C 0F 0F 00 E0 91 6C 0F 70 00 
    //E0 91 6C 0F 1F 20 54 65 61 72 20 4F 66 66 00 16 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 
    //28 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 
    //40 00 08 90 6C 0F 16 0F 00 E0 91 6C 0F 1F 50 68 79 73 69 63 73 20 00 05 01 01 C0 93 6C 0F 0A 79 
    //02 24 00 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4E 6F 6E 65 00 16 06 57 04 0A 97 02 24 01 0F 00 
    //E0 91 6C 0F 70 00 E0 91 6C 0F 1F 57 61 6C 6B 69 6E 67 00 16 06 57 04 0A B5 02 24 02 0F 00 E0 91 
    //6C 0F 70 00 E0 91 6C 0F 1F 46 61 6C 6C 69 6E 67 00 16 06 57 04 0A D4 02 24 03 0F 00 E0 91 6C 0F 
    //70 00 E0 91 6C 0F 1F 53 77 69 6D 6D 69 6E 67 00 16 06 57 04 0A F1 02 24 04 0F 00 E0 91 6C 0F 70 
    //00 E0 91 6C 0F 1F 46 6C 79 69 6E 67 00 16 06 57 04 0A 10 03 24 05 0F 00 E0 91 6C 0F 70 00 E0 91 
    //6C 0F 1F 52 6F 74 61 74 69 6E 67 00 16 06 57 04 0A 31 03 24 06 0F 00 E0 91 6C 0F 70 00 E0 91 6C 
    //0F 1F 50 72 6F 6A 65 63 74 69 6C 65 00 16 06 57 04 0A 55 03 24 07 0F 00 E0 91 6C 0F 70 00 E0 91 
    //6C 0F 1F 49 6E 74 65 72 70 6F 6C 61 74 69 6E 67 00 16 06 57 04 0A 77 03 24 08 0F 00 E0 91 6C 0F 
    //70 00 E0 91 6C 0F 1F 4D 6F 76 69 6E 67 42 72 75 73 68 00 16 06 57 04 0A 94 03 24 09 0F 00 E0 91 
    //6C 0F 70 00 E0 91 6C 0F 1F 53 70 69 64 65 72 00 16 06 57 04 0A B2 03 24 0A 0F 00 E0 91 6C 0F 70 
    //00 E0 91 6C 0F 1F 54 72 61 69 6C 65 72 00 16 06 57 04 0A CF 03 24 0B 0F 00 E0 91 6C 0F 70 00 E0 
    //91 6C 0F 1F 4C 61 64 64 65 72 00 16 06 57 04 0A EB 03 24 0D 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 
    //1F 4B 61 72 6D 61 00 16 06 57 04 0A 09 04 24 12 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4A 75 6D 
    //70 69 6E 67 00 16 06 57 04 0A 2F 04 24 13 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 53 69 74 74 69 
    //6E 67 4F 6E 47 72 6F 75 6E 64 00 16 06 57 04 0A 54 04 24 14 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 
    //1F 53 69 74 74 69 6E 67 4F 6E 43 68 61 69 72 00 16 06 57 04 0A FF FF 0F 00 E0 91 6C 0F 70 70 70 
    //70 00 E0 91 6C 0F 1F 20 69 6E 20 70 68 79 73 69 63 73 76 6F 6C 75 6D 65 20 00 16 1B 46 29 00 00 
    //39 56 01 38 94 6C 0F 16 16 1F 20 6F 6E 20 62 61 73 65 20 00 16 1B 46 29 00 00 39 56 01 B0 94 6C 
    //0F 16 16 07 C9 04 2D 01 28 95 6C 0F 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 2D 20 77 69 6C 6C 
    //20 62 6F 75 6E 63 65 00 16 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 B8 00 08 90 6C 
    //0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 
    //19 00 F0 F0 6B 0F 30 00 00 61 D1 70 70 70 1F 4C 6F 63 61 74 69 6F 6E 3A 20 00 39 58 01 30 81 6C 
    //0F 16 1F 20 52 6F 74 61 74 69 6F 6E 20 00 16 39 59 01 00 84 6C 0F 16 28 16 B8 00 08 90 6C 0F 00 
    //50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 19 00 
    //F0 F0 6B 0F 62 00 00 61 D1 70 70 70 70 70 1F 56 65 6C 6F 63 69 74 79 3A 20 00 39 58 01 A0 95 6C 
    //0F 16 1F 20 53 70 65 65 64 20 00 16 39 55 E1 01 A0 95 6C 0F 16 16 1F 20 53 70 65 65 64 32 44 20 
    //00 16 39 55 E1 D8 01 A0 95 6C 0F D5 36 38 C5 69 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 
    //00 80 3F 16 16 16 16 28 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 
    //90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 19 00 F0 F0 6B 0F 1D 00 00 61 D1 70 1F 41 63 63 65 6C 
    //65 72 61 74 69 6F 6E 3A 20 00 39 58 01 18 96 6C 0F 16 28 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 
    //19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 0F 36 E0 8F 6A 0F 19 
    //00 F0 F0 6B 0F 05 00 04 01 90 96 6C 0F 24 00 19 00 F0 F0 6B 0F 34 00 00 61 D1 70 70 70 1F 43 6F 
    //6C 6C 69 73 69 6F 6E 20 52 61 64 69 75 73 20 00 39 55 01 C8 89 6C 0F 16 1F 20 48 65 69 67 68 74 
    //20 00 16 39 55 01 40 8A 6C 0F 16 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 
    //00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 19 00 F0 F0 6B 0F 57 00 00 61 D1 70 70 70 70 
    //70 1F 43 6F 6C 6C 69 64 65 73 20 77 69 74 68 20 41 63 74 6F 72 73 20 00 39 54 2D 01 08 97 6C 0F 
    //16 1F 2C 20 77 6F 72 6C 64 20 00 16 39 54 2D 01 60 E8 35 0F 16 1F 2C 20 70 72 6F 6A 2E 20 74 61 
    //72 67 65 74 20 00 16 39 54 2D 01 80 97 6C 0F 16 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 
    //F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 19 00 F0 F0 6B 0F 1D 00 00 61 
    //D1 70 1F 42 6C 6F 63 6B 73 20 41 63 74 6F 72 73 20 00 39 54 2D 01 F8 97 6C 0F 16 16 B8 00 08 90 
    //6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 
    //16 0F 00 E0 91 6C 0F 1F 54 6F 75 63 68 69 6E 67 20 00 2F 61 33 20 F8 8B C1 00 00 70 98 6C 0F 16 
    //C2 07 0F 00 E0 91 6C 0F 70 70 00 E0 91 6C 0F 1B 46 29 00 00 39 56 00 70 98 6C 0F 16 16 1F 20 00 
    //16 31 30 07 F0 07 7A 00 E0 91 6C 0F 1F 54 6F 75 63 68 69 6E 67 20 00 16 0F 00 E0 91 6C 0F 1F 54 
    //6F 75 63 68 69 6E 67 20 6E 6F 74 68 69 6E 67 00 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 
    //28 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 
    //40 00 08 90 6C 0F 16 0F 36 D0 90 6A 0F 19 00 F0 F0 6B 0F 05 00 04 01 90 96 6C 0F 24 00 0F 00 E0 
    //91 6C 0F 1F 52 65 6E 64 65 72 65 64 3A 20 00 05 01 01 E8 98 6C 0F 0A 69 08 24 00 0F 00 E0 91 6C 
    //0F 00 E0 91 6C 0F 06 04 09 0A 86 08 24 01 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4E 6F 72 6D 61 
    //6C 00 16 06 04 09 0A A3 08 24 02 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4D 61 73 6B 65 64 00 16 
    //06 04 09 0A C5 08 24 03 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 54 72 61 6E 73 6C 75 63 65 6E 74 
    //00 16 06 04 09 0A E5 08 24 04 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 4D 6F 64 75 6C 61 74 65 64 
    //00 16 06 04 09 0A 01 09 24 05 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 41 6C 70 68 61 00 16 06 04 
    //09 0A FF FF 05 01 01 60 99 6C 0F 0A 27 09 24 00 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 4E 6F 
    //6E 65 00 16 06 3A 0A 0A 46 09 24 01 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 53 70 72 69 74 65 
    //20 00 16 06 3A 0A 0A 63 09 24 02 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 4D 65 73 68 20 00 16 
    //06 3A 0A 0A 81 09 24 03 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 42 72 75 73 68 20 00 16 06 3A 
    //0A 0A A4 09 24 04 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 52 6F 70 65 53 70 72 69 74 65 20 00 
    //16 06 3A 0A 0A CB 09 24 05 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 56 65 72 74 69 63 61 6C 53 
    //70 72 69 74 65 20 00 16 06 3A 0A 0A ED 09 24 06 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 54 65 
    //72 72 61 66 6F 72 6D 20 00 16 06 3A 0A 0A 14 0A 24 07 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 
    //53 70 72 69 74 65 41 6E 69 6D 4F 6E 63 65 20 00 16 06 3A 0A 0A 37 0A 24 08 0F 00 E0 91 6C 0F 70 
    //00 E0 91 6C 0F 1F 20 53 74 61 74 69 63 4D 65 73 68 20 00 16 06 3A 0A 0A FF FF 07 A0 0B 9A 39 3A 
    //01 60 99 6C 0F 39 3A 24 02 16 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1B 46 29 00 00 39 56 01 D8 99 
    //6C 0F 16 16 07 E5 0A 97 37 01 50 9A 6C 0F 25 16 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 73 6B 
    //69 6E 73 3A 20 00 16 0F 00 C8 9A 6C 0F 25 07 E5 0A 96 00 C8 9A 6C 0F 37 01 50 9A 6C 0F 16 07 B5 
    //0A 72 10 00 C8 9A 6C 0F 01 50 9A 6C 0F 2A 16 06 E5 0A 06 DB 0A 0F 00 E0 91 6C 0F 70 70 00 E0 91 
    //6C 0F 1B 46 29 00 00 39 56 10 00 C8 9A 6C 0F 01 50 9A 6C 0F 16 16 1F 2C 20 00 16 A5 00 C8 9A 6C 
    //0F 16 06 8E 0A 19 00 F0 F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 B8 00 08 90 6C 0F 00 50 05 
    //6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 1C 40 9B 6C 
    //0F 25 00 F0 9B 6C 0F 00 68 9C 6C 0F 00 E0 9C 6C 0F 16 0F 00 E0 91 6C 0F 70 70 70 70 70 1F 41 6E 
    //69 6D 53 65 71 75 65 6E 63 65 20 00 39 57 00 F0 9B 6C 0F 16 1F 20 46 72 61 6D 65 20 00 16 39 55 
    //00 68 9C 6C 0F 16 1F 20 52 61 74 65 20 00 16 39 55 00 E0 9C 6C 0F 16 07 9D 0B 2D 01 58 9D 6C 0F 
    //0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 1F 20 41 6E 69 6D 20 62 79 20 4F 77 6E 65 72 00 16 06 FD 0B 
    //07 D9 0B 84 9A 39 3A 01 60 99 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 60 99 6C 0F 39 3A 24 07 
    //16 16 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 39 56 01 D0 9D 6C 0F 16 06 FD 0B 07 FD 0B 9A 39 3A 01 
    //60 99 6C 0F 39 3A 24 03 16 0F 00 E0 91 6C 0F 70 00 E0 91 6C 0F 39 56 01 48 9E 6C 0F 16 19 00 F0 
    //F0 6B 0F 09 00 00 61 D1 00 E0 91 6C 0F 28 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 
    //0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 0F 36 E0 8F 6A 0F 19 00 F0 F0 6B 0F 
    //05 00 04 01 90 96 6C 0F 39 3D 2C FF 19 00 F0 F0 6B 0F 3C 00 00 61 D1 70 70 70 70 70 1F 54 61 67 
    //3A 20 00 39 57 01 C0 9E 6C 0F 16 1F 20 45 76 65 6E 74 3A 20 00 16 39 57 01 38 9F 6C 0F 16 1F 20 
    //53 54 41 54 45 3A 20 00 16 39 57 61 1C 16 16 28 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 
    //F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 19 00 F0 F0 6B 0F 39 00 00 61 
    //D1 70 70 70 1F 49 6E 73 74 69 67 61 74 6F 72 20 00 1B 46 29 00 00 39 56 01 B8 80 6C 0F 16 16 1F 
    //20 4F 77 6E 65 72 20 00 16 1B 46 29 00 00 39 56 01 B0 9F 6C 0F 16 16 16 B8 00 08 90 6C 0F 00 50 
    //05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 08 90 6C 0F 16 19 00 F0 
    //F0 6B 0F 5C 00 00 61 D1 70 70 70 70 70 70 70 1F 54 69 6D 65 72 3A 20 00 39 55 01 28 A0 6C 0F 16 
    //1F 20 4C 69 66 65 53 70 61 6E 20 00 16 39 55 01 A0 A0 6C 0F 16 1F 20 41 6D 62 69 65 6E 74 53 6F 
    //75 6E 64 20 00 16 39 56 01 18 A1 6C 0F 16 1F 20 76 6F 6C 75 6D 65 20 00 16 39 52 01 90 A1 6C 0F 
    //16 16 B8 00 08 90 6C 0F 00 50 05 6C 0F 16 19 00 F0 F0 6B 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 
    //40 00 08 90 6C 0F 16 04 0B 47 
  }


  function SetDefaultDisplayProperties() {
    Style = default.Style;                                                      //0000 : 0F 01 E8 98 6C 0F 02 E8 98 6C 0F 
    Texture = default.Texture;                                                  //000B : 0F 01 D0 9D 6C 0F 02 D0 9D 6C 0F 
    bUnlit = default.bUnlit;                                                    //0016 : 14 2D 01 18 A3 6C 0F 2D 02 18 A3 6C 0F 
    //0F 01 E8 98 6C 0F 02 E8 98 6C 0F 0F 01 D0 9D 6C 0F 02 D0 9D 6C 0F 14 2D 01 18 A3 6C 0F 2D 02 18 
    //A3 6C 0F 04 0B 47 
  }


  function SetDisplayProperties(byte NewStyle,Material NewTexture,bool bLighting) {
    Style = NewStyle;                                                           //0000 : 0F 01 E8 98 6C 0F 00 40 A4 6C 0F 
    Texture = NewTexture;                                                       //000B : 0F 01 D0 9D 6C 0F 00 18 A5 6C 0F 
    bUnlit = bLighting;                                                         //0016 : 14 2D 01 18 A3 6C 0F 2D 00 90 A5 6C 0F 
    //0F 01 E8 98 6C 0F 00 40 A4 6C 0F 0F 01 D0 9D 6C 0F 00 18 A5 6C 0F 14 2D 01 18 A3 6C 0F 2D 00 90 
    //A5 6C 0F 04 0B 47 
  }


  simulated function string GetHumanReadableName() {
    return GetItemName(string(Class));                                          //0000 : 04 1B 46 29 00 00 39 56 01 68 E5 6B 0F 16 
    //04 1B 46 29 00 00 39 56 01 68 E5 6B 0F 16 04 0B 47 
  }


  function POVChanged(PlayerController PC,bool bBehindViewChanged);


  function BecomeViewTarget();


  event TravelPostAccept();


  event TravelPreAccept();


  function bool CheckForErrors() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  simulated function HurtRadius(float DamageAmount,float DamageRadius,class<DamageType> DamageType,float Momentum,Vector HitLocation) {
    local Actor Victims;
    local float damageScale;
    local float dist;
    local Vector dir;
    if (bHurtEntry) {                                                           //0000 : 07 0B 00 2D 01 60 B0 6C 0F 
      return;                                                                   //0009 : 04 0B 
    }
    bHurtEntry = True;                                                          //000B : 14 2D 01 60 B0 6C 0F 27 
    foreach VisibleCollidingActors(Class'Actor',Victims,DamageRadius,HitLocation) {//0013 : 2F 61 38 20 F8 8B C1 00 00 D8 B0 6C 0F 00 50 B1 6C 0F 00 C8 B1 6C 0F 16 53 01 
      if (Victims != self && Victims.SBRole == 1
        && !Victims.IsA('FluidSurfaceInfo')) {//002D : 07 52 01 82 82 77 00 D8 B0 6C 0F 17 16 18 17 00 9A 39 3A 19 00 D8 B0 6C 0F 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 16 18 14 00 81 19 00 D8 B0 6C 0F 08 00 04 61 2F 21 7D 0B 00 00 16 16 16 
        dir = Victims.Location - HitLocation;                                   //006B : 0F 00 B8 B2 6C 0F D8 19 00 D8 B0 6C 0F 05 00 0C 01 30 81 6C 0F 00 C8 B1 6C 0F 16 
        dist = FMax(1.00000000,VSize(dir));                                     //0086 : 0F 00 30 B3 6C 0F F5 1E 00 00 80 3F E1 00 B8 B2 6C 0F 16 16 
        dir = dir / dist;                                                       //009A : 0F 00 B8 B2 6C 0F D6 00 B8 B2 6C 0F 00 30 B3 6C 0F 16 
        damageScale = 1.00000000 - FMax(0.00000000,(dist - Victims.CollisionRadius) / DamageRadius);//00AC : 0F 00 A8 B3 6C 0F AF 1E 00 00 80 3F F5 1E 00 00 00 00 AC AF 00 30 B3 6C 0F 19 00 D8 B0 6C 0F 05 00 04 01 C8 89 6C 0F 16 00 50 B1 6C 0F 16 16 16 
        Victims.TakeDamage(damageScale * DamageAmount,Instigator,Victims.Location - 0.50000000 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,damageScale * Momentum * dir,DamageType);//00DC : 19 00 D8 B0 6C 0F 6D 00 00 1B 5C 0C 00 00 39 44 AB 00 A8 B3 6C 0F 00 D8 AD 6C 0F 16 01 B8 80 6C 0F D8 19 00 D8 B0 6C 0F 05 00 0C 01 30 81 6C 0F D5 AB 1E 00 00 00 3F AE 19 00 D8 B0 6C 0F 05 00 04 01 40 8A 6C 0F 19 00 D8 B0 6C 0F 05 00 04 01 C8 89 6C 0F 16 16 00 B8 B2 6C 0F 16 16 D5 AB 00 A8 B3 6C 0F 00 20 B4 6C 0F 16 00 B8 B2 6C 0F 16 00 98 B4 6C 0F 16 
      }
    }
    bHurtEntry = False;                                                         //0154 : 14 2D 01 60 B0 6C 0F 28 
    //07 0B 00 2D 01 60 B0 6C 0F 04 0B 14 2D 01 60 B0 6C 0F 27 2F 61 38 20 F8 8B C1 00 00 D8 B0 6C 0F 
    //00 50 B1 6C 0F 00 C8 B1 6C 0F 16 53 01 07 52 01 82 82 77 00 D8 B0 6C 0F 17 16 18 17 00 9A 39 3A 
    //19 00 D8 B0 6C 0F 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 16 18 14 00 81 19 00 D8 B0 6C 0F 08 00 
    //04 61 2F 21 7D 0B 00 00 16 16 16 0F 00 B8 B2 6C 0F D8 19 00 D8 B0 6C 0F 05 00 0C 01 30 81 6C 0F 
    //00 C8 B1 6C 0F 16 0F 00 30 B3 6C 0F F5 1E 00 00 80 3F E1 00 B8 B2 6C 0F 16 16 0F 00 B8 B2 6C 0F 
    //D6 00 B8 B2 6C 0F 00 30 B3 6C 0F 16 0F 00 A8 B3 6C 0F AF 1E 00 00 80 3F F5 1E 00 00 00 00 AC AF 
    //00 30 B3 6C 0F 19 00 D8 B0 6C 0F 05 00 04 01 C8 89 6C 0F 16 00 50 B1 6C 0F 16 16 16 19 00 D8 B0 
    //6C 0F 6D 00 00 1B 5C 0C 00 00 39 44 AB 00 A8 B3 6C 0F 00 D8 AD 6C 0F 16 01 B8 80 6C 0F D8 19 00 
    //D8 B0 6C 0F 05 00 0C 01 30 81 6C 0F D5 AB 1E 00 00 00 3F AE 19 00 D8 B0 6C 0F 05 00 04 01 40 8A 
    //6C 0F 19 00 D8 B0 6C 0F 05 00 04 01 C8 89 6C 0F 16 16 00 B8 B2 6C 0F 16 16 D5 AB 00 A8 B3 6C 0F 
    //00 20 B4 6C 0F 16 00 B8 B2 6C 0F 16 00 98 B4 6C 0F 16 31 30 14 2D 01 60 B0 6C 0F 28 04 0B 47 
  }


  simulated function UpdatePrecacheStaticMeshes() {
    if (DrawType == 8 && !bStatic && !bNoDelete) {                              //0000 : 07 6D 00 82 82 9A 39 3A 01 60 99 6C 0F 39 3A 24 08 16 18 09 00 81 2D 01 40 00 38 0F 16 16 18 09 00 81 2D 01 B8 00 38 0F 16 16 
      Log("Calling AddPrecacheStaticMesh for "
        $ string(StaticMesh));   //002A : E7 70 1F 43 61 6C 6C 69 6E 67 20 41 64 64 50 72 65 63 61 63 68 65 53 74 61 74 69 63 4D 65 73 68 20 66 6F 72 20 00 39 56 01 30 01 38 0F 16 16 
      Level.AddPrecacheStaticMesh(StaticMesh);                                  //0059 : 19 01 D8 7E 6C 0F 0B 00 00 1B 57 2B 00 00 01 30 01 38 0F 16 
    }
    //07 6D 00 82 82 9A 39 3A 01 60 99 6C 0F 39 3A 24 08 16 18 09 00 81 2D 01 40 00 38 0F 16 16 18 09 
    //00 81 2D 01 B8 00 38 0F 16 16 E7 70 1F 43 61 6C 6C 69 6E 67 20 41 64 64 50 72 65 63 61 63 68 65 
    //53 74 61 74 69 63 4D 65 73 68 20 66 6F 72 20 00 39 56 01 30 01 38 0F 16 16 19 01 D8 7E 6C 0F 0B 
    //00 00 1B 57 2B 00 00 01 30 01 38 0F 16 04 0B 47 
  }


  simulated function UpdatePrecacheMaterials() {
    local int i;
    if (Skins.Length > 0) {                                                     //0000 : 07 58 00 97 37 01 50 9A 6C 0F 25 16 
      i = 0;                                                                    //000C : 0F 00 58 02 38 0F 25 
      while (i < Skins.Length) {                                                //0013 : 07 58 00 96 00 58 02 38 0F 37 01 50 9A 6C 0F 16 
        if (Skins[i] != None) {                                                 //0023 : 07 4E 00 77 10 00 58 02 38 0F 01 50 9A 6C 0F 2A 16 
          Level.AddPrecacheMaterial(Skins[i]);                                  //0034 : 19 01 D8 7E 6C 0F 11 00 00 1B 88 2A 00 00 10 00 58 02 38 0F 01 50 9A 6C 0F 16 
        }
        i++;                                                                    //004E : A5 00 58 02 38 0F 16 
      }
    }
    //07 58 00 97 37 01 50 9A 6C 0F 25 16 0F 00 58 02 38 0F 25 07 58 00 96 00 58 02 38 0F 37 01 50 9A 
    //6C 0F 16 07 4E 00 77 10 00 58 02 38 0F 01 50 9A 6C 0F 2A 16 19 01 D8 7E 6C 0F 11 00 00 1B 88 2A 
    //00 00 10 00 58 02 38 0F 01 50 9A 6C 0F 16 A5 00 58 02 38 0F 16 06 13 00 04 0B 47 
  }


  simulated event SetInitialState() {
    bScriptInitialized = True;                                                  //0000 : 14 2D 01 80 03 38 0F 27 
    if (InitialState != 'None') {                                               //0008 : 07 21 00 FF 01 F8 03 38 0F 21 00 00 00 00 16 
      GotoState(InitialState);                                                  //0017 : 71 01 F8 03 38 0F 16 
    } else {                                                                    //001E : 06 28 00 
      GotoState('Auto');                                                        //0021 : 71 21 B2 02 00 00 16 
    }
    //14 2D 01 80 03 38 0F 27 07 21 00 FF 01 F8 03 38 0F 21 00 00 00 00 16 71 01 F8 03 38 0F 16 06 28 
    //00 71 21 B2 02 00 00 16 04 0B 47 
  }


  event PostBeginPlay();


  event PreBeginPlay() {
    if (Level.DetailMode == 0
      && CullDistance == default.CullDistance) {  //0000 : 07 36 00 82 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 18 0D 00 B4 01 98 B7 6C 0F 02 98 B7 6C 0F 16 16 
      CullDistance *= 0.80000001;                                               //002A : B6 01 98 B7 6C 0F 1E CD CC 4C 3F 16 
    }
    //07 36 00 82 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 18 0D 00 B4 01 98 
    //B7 6C 0F 02 98 B7 6C 0F 16 16 B6 01 98 B7 6C 0F 1E CD CC 4C 3F 16 04 0B 47 
  }


  event RenderTexture(ScriptedTexture Tex);


  function RenderOverlays(Canvas Canvas);


  event RecoverFromBadStateCode();


  final static native(552) operator(16) Color *(Color A,float B);


  final static native(551) operator(20) Color +(Color A,Color B);


  final static native(550) operator(16) Color *(float A,Color B);


  final static native(549) operator(20) Color -(Color A,Color B);


  final native(321) iterator function CollidingActors(class<Actor> BaseClass,out Actor Actor,float Radius,optional Vector loc);


  final native(312) iterator function VisibleCollidingActors(class<Actor> BaseClass,out Actor Actor,float Radius,optional Vector loc,optional bool bIgnoreHidden);


  final native(311) iterator function VisibleActors(class<Actor> BaseClass,out Actor Actor,optional float Radius,optional Vector loc);


  final native(310) iterator function RadiusActors(class<Actor> BaseClass,out Actor Actor,float Radius,optional Vector loc);


  final native(309) iterator function TraceActors(class<Actor> BaseClass,out Actor Actor,out Vector HitLoc,out Vector HitNorm,Vector End,optional Vector Start,optional Vector Extent);


  final native(307) iterator function TouchingActors(class<Actor> BaseClass,out Actor Actor);


  final native(306) iterator function BasedActors(class<Actor> BaseClass,out Actor Actor);


  final native(305) iterator function ChildActors(class<Actor> BaseClass,out Actor Actor);


  final native(313) iterator function DynamicActors(class<Actor> BaseClass,out Actor Actor,optional name MatchTag);


  final native(304) iterator function AllActors(class<Actor> BaseClass,out Actor Actor,optional name MatchTag);


  final native function GameInfo GetGameInfo();


  final native function ResetStaticFilterState();


  event BeginPlay();


  event PostTeleport(Teleporter OutTeleporter);


  event bool PreTeleport(Teleporter InTeleporter);


  final native function Vector SuggestFallVelocity(Vector Destination,Vector Start,float MaxZ,float MaxXYSpeed);


  final native(532) function bool PlayerCanSeeMe();


  final native(512) function MakeNoise(float Loudness);


  final native function bool ForceFeedbackSupported(optional bool Enable);


  final native(569) function ChangeBaseParamsFeedbackEffect(string EffectName,optional float DirectionX,optional float DirectionY,optional float Gain);


  final native(568) function ChangeSpringFeedbackEffect(string EffectName,float CenterX,float CenterY);


  final native(567) function StopFeedbackEffect(optional string EffectName);


  final native(566) function PlayFeedbackEffect(string EffectName);


  final native function float GetSoundDuration(Sound Sound);


  native simulated event DemoPlaySound(Sound Sound,optional byte Slot,optional float Volume,optional bool bNoOverride,optional float Radius,optional float Pitch,optional bool Attenuate);


  final native function PlayOwnedSound(Sound Sound,optional byte Slot,optional float Volume,optional bool bNoOverride,optional float Radius,optional float Pitch,optional bool Attenuate);


  final native(264) function PlaySound(Sound Sound,optional byte Slot,optional float Volume,optional bool bNoOverride,optional float Radius,optional float Pitch,optional bool Attenuate);


  native function StopSBSoundTypes(byte aSoundType);


  native function StopAudio(int aTrackHandle,optional Actor aOwner,optional float aFadeOutTime);


  native function int PlaySBSound(Sound Sound,float Volume,float Pitch,float Radius,optional Vector SoundSourceOffset,optional byte AudioType);


  event PostLoadSavedGame();


  event PreSaveGame();


  final native(280) function SetTimer(float NewTimerRate,bool bLoop);


  event TornOff();


  final native(279) function bool Destroy();


  final native(278) function Actor Spawn(class<Actor> SpawnClass,optional Actor SpawnOwner,optional name SpawnTag,optional Vector SpawnLocation,optional Rotator SpawnRotation,optional int InstanceID);


  final native function bool TraceThisActor(out Vector HitLocation,out Vector HitNormal,Vector TraceEnd,Vector TraceStart,optional Vector Extent);


  final native(548) function bool FastTrace(Vector TraceEnd,optional Vector TraceStart);


  final native(277) function Actor Trace(out Vector HitLocation,out Vector HitNormal,Vector TraceEnd,optional Vector TraceStart,optional bool bTraceActors,optional Vector Extent,optional out Material Material);


  function bool HealDamage(int Amount,Controller Healer,class<DamageType> DamageType);


  event TakeDamage(int Damage,Pawn EventInstigator,Vector HitLocation,Vector Momentum,class<DamageType> DamageType);


  event KilledBy(Pawn EventInstigator);


  simulated event FellOutOfWorld(byte KillType) {
    SetPhysics(0);                                                              //0000 : 6F 82 24 00 16 
    Destroy();                                                                  //0005 : 61 17 16 
    //6F 82 24 00 16 61 17 16 04 0B 47 
  }


  event UsedBy(Pawn User);


  event EndedRotation();


  event FinishedInterpolation() {
    bInterpolating = False;                                                     //0000 : 14 2D 01 D8 E8 35 0F 28 
    //14 2D 01 D8 E8 35 0F 28 04 0B 47 
  }


  event RanInto(Actor Other);


  event EncroachedBy(Actor Other);


  event bool EncroachingOn(Actor Other);


  event Actor SpecialHandling(Pawn Other);


  event Detach(Actor Other);


  event Attach(Actor Other);


  event BaseChange();


  event Bump(Actor Other);


  event UnTouch(Actor Other);


  event PostTouch(Actor Other);


  event Touch(Actor Other);


  event PhysicsVolumeChange(PhysicsVolume NewVolume);


  event ZoneChange(ZoneInfo NewZone);


  event Landed(Vector HitNormal);


  event Falling();


  event HitWall(Vector HitNormal,Actor HitWall);


  event Timer();


  simulated function TimerPop(VolumeTimer t);


  event EndEvent();


  event BeginEvent();


  event UnTrigger(Actor Other,Pawn EventInstigator);


  event Trigger(Actor Other,Pawn EventInstigator);


  event PostNetReceive();


  event Tick(float DeltaTime);


  event LostChild(Actor Other);


  event GainedChild(Actor Other);


  event Destroyed();


  final native event float GetAllowedAudioRepeatTime(int aSoundType);


  final native event NotifySoundStopped(Sound aSoundStopped);


  final native function StopAllMusic(optional float FadeOutTime);


  final native function StopMusic(int SongHandle,optional float FadeOutTime);


  final native function int PlayMusic(string Song,optional float FadeInTime);


  final native function bool PauseStream(int Handle);


  final native function bool AdjustVolume(int Handle,float NewVolume);


  final native function int SeekStream(int Handle,float Seconds);


  final native function StopStream(int Handle,optional float FadeOutTime);


  final native function int PlayStream(string Song,optional bool UseMusicVolume,optional float Volume,optional float FadeInTime,optional float SeekTime);


  final native function AllowMusicPlayback(bool Allow);


  final native function UnClock(out float Time);


  final native function Clock(out float Time);


  final native function OnlyAffectPawns(bool B);


  final native(3970) function SetPhysics(byte newPhysics);


  final native(301) latent function FinishInterpolation();


  final native function DebugUnclock();


  final native function DebugClock();


  final native function ClearStayingDebugLines();


  final native function DrawDebugCapsule(Vector Base,float AxisLength,float Radius,byte R,byte G,byte B);


  final native function DrawDebugSphere(Vector Base,float Radius,int NumDivisions,byte R,byte G,byte B);


  final native function DrawDebugCircle(Vector Base,Vector X,Vector Y,float Radius,int NumSides,byte R,byte G,byte B);


  final native function DrawStayingDebugLine(Vector LineStart,Vector LineEnd,byte R,byte G,byte B);


  final native function DrawDebugLine(Vector LineStart,Vector LineEnd,byte R,byte G,byte B);


  final native function Plane GetRenderBoundingSphere();


  final native function string GetUrlOption(string Option);


  final native function UpdateURL(string NewOption,string NewValue,bool bSaveDefault);


  final native function name GetClosestBone(Vector loc,Vector ray,out float boneDist,optional name BiasBone,optional float BiasDistance);


  final native function bool AnimIsInGroup(int Channel,name GroupName);


  final native function GetAnimParams(int Channel,out name OutSeqName,out float OutAnimFrame,out float OutAnimRate);


  final native function SetBoneRotation(name BoneName,optional Rotator BoneTurn,optional int Space,optional float Alpha);


  final native function SetBoneLocation(name BoneName,optional Vector BoneTrans,optional float Alpha);


  final native function SetBoneDirection(name BoneName,Rotator BoneTurn,optional Vector BoneTrans,optional float Alpha,optional int Space);


  final native function SetBoneScale(int Slot,optional float BoneScale,optional name BoneName);


  final native function LockRootMotion(int Lock);


  final native function Actor FindAttachment(name ActorName,name BoneName);


  final native function bool DetachFromBone(Actor Attachment);


  final native function bool AttachToBone(Actor Attachment,name BoneName);


  final native function Rotator GetRootRotationDelta();


  final native function Vector GetRootLocationDelta();


  final native function Rotator GetRootRotation();


  final native function Vector GetRootLocation();


  final native function Rotator GetBoneRotation(name BoneName,optional int Space);


  final native function Coords GetBoneCoords(name BoneName);


  final native function AnimBlendToAlpha(int Stage,float TargetAlpha,float TimeInterval);


  final native function AnimBlendParams(int Stage,optional float BlendAlpha,optional float InTime,optional float OutTime,optional name BoneName,optional bool bGlobalPose);


  final native function BoneRefresh();


  final native function LinkMesh(Mesh NewMesh,optional bool bKeepAnim);


  final native function LinkSkelAnim(MeshAnimation Anim,optional Mesh NewMesh);


  final native function int GetNotifyChannel();


  final native function EnableChannelNotify(int Channel,int Switch);


  event AnimEnd(int Channel);


  event LIPSincAnimEnd();


  final native function string CurrentLIPSincAnim();


  final native function bool IsPlayingLIPSincAnim();


  final native function bool HasLIPSincAnim(name LIPSincAnimName);


  final native function StopLIPSincAnim();


  final native function PlayLIPSincAnim(name LIPSincAnimName,optional float Volume,optional float Radius,optional float Pitch);


  final native function AnimStopLooping(optional int Channel);


  final native function bool IsTweening(int Channel);


  final native function SetAnimFrame(float Time,optional int Channel,optional int UnitFlag);


  final native function FreezeAnimAt(float Time,optional int Channel);


  final native function StopAnimating(optional bool ClearAllButBase);


  final native(263) function bool HasAnim(name Sequence);


  final native(261) latent function FinishAnim(optional int Channel);


  final native(282) function bool IsAnimating(optional int Channel);


  final native(294) function bool TweenAnim(name Sequence,float Time,optional int Channel);


  final native(260) function bool LoopAnim(name Sequence,optional float Rate,optional float TweenTime,optional int Channel);


  final native(259) function bool PlayAnim(name Sequence,optional float Rate,optional float TweenTime,optional int Channel);


  final native function string GetMeshName();


  native function bool IsBehind(Actor Other,optional int MinYaw,optional int MaxYaw);


  final native function bool IsJoinedTo(Actor Other);


  final native(272) function SetOwner(Actor NewOwner);


  final native(298) function SetBase(Actor NewBase,optional Vector NewFloor);


  native function bool IsGrounded();


  native function MoveNoChecks(Vector DeltaLocation);


  final native(3971) function AutonomousPhysics(float DeltaSeconds);


  final native(3969) function bool MoveSmooth(Vector delta);


  final native function bool SetRelativeLocation(Vector NewLocation);


  final native function bool SetRelativeRotation(Rotator NewRotation);


  final native event bool SetRotation(Rotator NewRotation);


  final native(267) function bool SetLocation(Vector NewLocation);


  final native(266) function bool Move(Vector delta);


  final native function SetSkeletalMesh(Mesh NewSkeletalMesh);


  final native function SetDrawType(byte NewDrawType);


  final native function SetStaticMesh(StaticMesh NewStaticMesh);


  final native function SetDrawScale3D(Vector NewScale3D);


  final native function SetDrawScale(float NewScale);


  final native(283) function bool SetCollisionSize(float NewRadius,float NewHeight);


  final native(262) function SetCollision(optional bool NewColActors,optional bool NewBlockActors);


  final native function EndLatentFunction();


  final native(256) latent function Sleep(float Seconds);


  final static native function bool ShouldBeHidden();


  final native(233) function Error(coerce string s);


  native function SetAmbientGlow(int aNewGlow);


  native function TextToSpeech(string Text,float Volume);


  native function CopyObjectToClipboard(Object Obj);


  native function string ConsoleCommand(string Command,optional bool bWriteToLog);


  function bool IsValidActor() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  event bool ShouldTickPhysics() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  event OnCreateComponents();


  event cl_OnGroupChange(int newGroupFlags);


  event cl_OnUpdate();


  event cl_OnBaseline();


  event cl_OnTick(float delta);


  final static native function GameEngine GetGameEngine();


  final native(265) function TickStatsGroup();


  final native(268) function InitStatsGroup();



