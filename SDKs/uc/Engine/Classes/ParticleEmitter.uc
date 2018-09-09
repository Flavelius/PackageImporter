//==============================================================================
//  ParticleEmitter
//==============================================================================

class ParticleEmitter extends Object
    native
    abstract
    editinlinenew
    dependsOn()
  ;

  enum EEmitterChannel {
    EC_NONE ,
    EC_EMITTER0 ,
    EC_EMITTER1 ,
    EC_EMITTER2 ,
    EC_EMITTER3 ,
    EC_EMITTER4 ,
    EC_EMITTER5 ,
    EC_EMITTER6 ,
    EC_EMITTER7 
  };

  enum ESkelLocationUpdate {
    PTSU_None ,
    PTSU_SpawnOffset ,
    PTSU_Location 
  };

  enum EParticleMeshSpawning {
    PTMS_None ,
    PTMS_Linear ,
    PTMS_Random ,
    PTMS_LinearInverted 
  };

  enum EParticleCollisionSound {
    PTSC_None ,
    PTSC_LinearGlobal ,
    PTSC_LinearLocal ,
    PTSC_Random 
  };

  enum EParticleEffectAxis {
    PTEA_NegativeX ,
    PTEA_PositiveZ 
  };

  enum EParticleStartLocationShape {
    PTLS_Box ,
    PTLS_Sphere ,
    PTLS_Polar ,
    PTLS_All 
  };

  enum EParticleVelocityDirection {
    PTVD_None ,
    PTVD_StartPositionAndOwner ,
    PTVD_OwnerAndStartPosition ,
    PTVD_AddRadial 
  };

  enum EParticleRotationSource {
    PTRS_None ,
    PTRS_Actor ,
    PTRS_Offset ,
    PTRS_Normal 
  };

  enum EParticleCoordinateSystem {
    PTCS_Independent ,
    PTCS_Relative ,
    PTCS_Absolute 
  };

  enum EParticleDrawStyle {
    PTDS_Regular ,
    PTDS_AlphaBlend ,
    PTDS_Modulated ,
    PTDS_Translucent ,
    PTDS_AlphaModulate_MightNotFogCorrectly ,
    PTDS_Darken ,
    PTDS_Brighten 
  };

  enum EBlendMode {
    BM_MODULATE ,
    BM_MODULATE2X ,
    BM_MODULATE4X ,
    BM_ADD ,
    BM_ADDSIGNED ,
    BM_ADDSIGNED2X ,
    BM_SUBTRACT ,
    BM_ADDSMOOTH ,
    BM_BLENDDIFFUSEALPHA ,
    BM_BLENDTEXTUREALPHA ,
    BM_BLENDFACTORALPHA ,
    BM_BLENDTEXTUREALPHAPM ,
    BM_BLENDCURRENTALPHA ,
    BM_PREMODULATE ,
    BM_MODULATEALPHA_ADDCOLOR ,
    BM_MODULATEINVALPHA_ADDCOLOR ,
    BM_MODULATEINVCOLOR_ADDALPHA ,
    BM_HACK 
  };

  struct ParticleSound {
      var (ParticleSound) Sound Sound;
      var (ParticleSound) Range Radius;
      var (ParticleSound) Range Pitch;
      var (ParticleSound) int Weight;
      var (ParticleSound) Range Volume;
      var (ParticleSound) Range Probability;

  };


  struct Particle {
      var Vector Location;
      var Vector OldLocation;
      var Vector Velocity;
      var Vector StartSize;
      var Vector SpinsPerSecond;
      var Vector StartSpin;
      var Vector RevolutionCenter;
      var Vector RevolutionsPerSecond;
      var Vector RevolutionsMultiplier;
      var Vector Size;
      var Vector StartLocation;
      var Vector ColorMultiplier;
      var Vector VelocityMultiplier;
      var Vector OldMeshLocation;
      var Color Color;
      var float Time;
      var float MaxLifetime;
      var float Mass;
      var int HitCount;
      var int flags;
      var int Subdivision;
      var int BoneIndex;
      var Rotator OldRotation;

  };


  struct ParticleVelocityScale {
      var (ParticleVelocityScale) float RelativeTime;
      var (ParticleVelocityScale) Vector RelativeVelocity;

  };


  struct ParticleColorScale {
      var (ParticleColorScale) float RelativeTime;
      var (ParticleColorScale) Color Color;

  };


  struct ParticleRevolutionScale {
      var (ParticleRevolutionScale) float RelativeTime;
      var (ParticleRevolutionScale) Vector RelativeRevolution;

  };


  struct ParticleTimeScale {
      var (ParticleTimeScale) float RelativeTime;
      var (ParticleTimeScale) float RelativeSize;

  };


  var (Collision) bool UseCollision;
  var (Collision) bool UseCollisionPlanes;
  var (Collision) bool UseMaxCollisions;
  var (Collision) bool UseSpawnedVelocityScale;
  var (Color) bool UseColorScale;
  var (Fading) bool FadeOut;
  var (Fading) bool FadeIn;
  var (Force) bool UseActorForces;
  var (General) bool ResetAfterChange;
  var (Local) bool RespawnDeadParticles;
  var (Local) bool AutoDestroy;
  var (Local) bool AutoReset;
  var (Local) bool Disabled;
  var bool Backup_Disabled;
  var (Local) bool DisableFogging;
  var (MeshSpawning) bool VelocityFromMesh;
  var (MeshSpawning) bool UniformMeshScale;
  var (MeshSpawning) bool UniformVelocityScale;
  var (MeshSpawning) bool UseColorFromMesh;
  var (MeshSpawning) bool SpawnOnlyInDirectionOfNormal;
  var (Rendering) bool AlphaTest;
  var (Rendering) bool AcceptsProjectors;
  var (Rendering) bool ZTest;
  var (Rendering) bool ZWrite;
  var (Revolution) bool UseRevolution;
  var (Revolution) bool UseRevolutionScale;
  var (Rotation) bool SpinParticles;
  var (Rotation) bool DampRotation;
  var (Size) bool UseSizeScale;
  var (Size) bool UseAbsoluteTimeForSizeScale;
  var (Size) bool UseRegularSizeScale;
  var (Size) bool UniformSize;
  var (Size) bool DetermineVelocityByLocationDifference;
  var (Size) bool ScaleSizeXByVelocity;
  var (Size) bool ScaleSizeYByVelocity;
  var (Size) bool ScaleSizeZByVelocity;
  var (Size) float LocalDrawScale;
  var (Spawning) bool AutomaticInitialSpawning;
  var (Texture) bool BlendBetweenSubdivisions;
  var (Texture) bool UseSubdivisionScale;
  var (Texture) bool UseRandomSubdivision;
  var (Trigger) bool TriggerDisabled;
  var (Trigger) bool TriggerRespawnDeadParticles;
  var (Trigger) bool ResetOnTrigger;
  var (Velocity) bool UseVelocityScale;
  var (Velocity) bool AddVelocityFromOwner;
  var (Performance) float LowDetailFactor;
  var (Acceleration) Vector Acceleration;
  var (Collision) Vector ExtentMultiplier;
  var (Collision) RangeVector DampingFactorRange;
  var (Collision) array<Plane> CollisionPlanes;
  var (Collision) Range MaxCollisions;
  var (Collision) int SpawnFromOtherEmitter;
  var (Collision) int SpawnAmount;
  var (Collision) RangeVector SpawnedVelocityScaleRange;
  var (Color) array<ParticleColorScale> ColorScale;
  var (Color) float ColorScaleRepeats;
  var (Color) RangeVector ColorMultiplierRange;
  var (Color) float Opacity;
  var (Fading) Plane FadeOutFactor;
  var (Fading) float FadeOutStartTime;
  var (Fading) Plane FadeInFactor;
  var (Fading) float FadeInEndTime;
  var (General) byte CoordinateSystem;
  var (General) const int MaxParticles;
  var (General) bool SBEnforceMaxParticles;
  var (General) byte EffectAxis;
  var (Local) Range AutoResetTimeRange;
  var (Local) string Name;
  var (Local) byte DetailMode;
  var (Location) Vector StartLocationOffset;
  var (Location) RangeVector StartLocationRange;
  var (Location) int AddLocationFromOtherEmitter;
  var (Location) byte StartLocationShape;
  var (Location) Range SphereRadiusRange;
  var (Location) RangeVector StartLocationPolarRange;
  var (Mass) Range StartMassRange;
  var (MeshSpawning) StaticMesh MeshSpawningStaticMesh;
  var (MeshSpawning) byte MeshSpawning;
  var (MeshSpawning) RangeVector VelocityScaleRange;
  var (MeshSpawning) RangeVector MeshScaleRange;
  var (MeshSpawning) Vector MeshNormal;
  var (MeshSpawning) Range MeshNormalThresholdRange;
  var (Rendering) int AlphaRef;
  var (Revolution) RangeVector RevolutionCenterOffsetRange;
  var (Revolution) RangeVector RevolutionsPerSecondRange;
  var (Revolution) array<ParticleRevolutionScale> RevolutionScale;
  var (Revolution) float RevolutionScaleRepeats;
  var (Rotation) byte UseRotationFrom;
  var (Rotation) Rotator RotationOffset;
  var (Rotation) Vector SpinCCWorCW;
  var (Rotation) RangeVector SpinsPerSecondRange;
  var (Rotation) RangeVector StartSpinRange;
  var (Rotation) RangeVector RotationDampingFactorRange;
  var (Rotation) Vector RotationNormal;
  var (Size) array<ParticleTimeScale> SizeScale;
  var (Size) float SizeScaleRepeats;
  var (Size) RangeVector StartSizeRange;
  var (Size) Vector ScaleSizeByVelocityMultiplier;
  var (Size) float ScaleSizeByVelocityMax;
  var (SkeletalMesh) byte UseSkeletalLocationAs;
  var (SkeletalMesh) Actor SkeletalMeshActor;
  var (SkeletalMesh) Vector SkeletalScale;
  var (SkeletalMesh) Range RelativeBoneIndexRange;
  var (Sound) array<ParticleSound> Sounds;
  var (Sound) byte SpawningSound;
  var (Sound) Range SpawningSoundIndex;
  var (Sound) Range SpawningSoundProbability;
  var (Sound) byte CollisionSound;
  var (Sound) Range CollisionSoundIndex;
  var (Sound) Range CollisionSoundProbability;
  var (Spawning) float ParticlesPerSecond;
  var (Spawning) float InitialParticlesPerSecond;
  var (Texture) byte DrawStyle;
  var (Texture) Texture Texture;
  var (Texture) int TextureUSubdivisions;
  var (Texture) int TextureVSubdivisions;
  var (Texture) array<float> SubdivisionScale;
  var (Texture) int SubdivisionStart;
  var (Texture) int SubdivisionEnd;
  var (Tick) float SecondsBeforeInactive;
  var (Tick) float MinSquaredVelocity;
  var (Time) Range InitialTimeRange;
  var (Time) Range LifetimeRange;
  var (Time) Range InitialDelayRange;
  var (Trigger) Range SpawnOnTriggerRange;
  var (Trigger) float SpawnOnTriggerPPS;
  var (Velocity) RangeVector StartVelocityRange;
  var (Velocity) Range StartVelocityRadialRange;
  var (Velocity) Vector MaxAbsVelocity;
  var (Velocity) RangeVector VelocityLossRange;
  var (Velocity) bool RotateVelocityLossRange;
  var (Velocity) int AddVelocityFromOtherEmitter;
  var (Velocity) RangeVector AddVelocityMultiplierRange;
  var (Velocity) byte GetVelocityDirectionFrom;
  var (Velocity) array<ParticleVelocityScale> VelocityScale;
  var (Velocity) float VelocityScaleRepeats;
  var (Warmup) float WarmupTicksPerSecond;
  var (Warmup) float RelativeWarmupTime;
  var (Environment) byte EnvironmentIndex;
  var transient float DensityMultiplier;
  var transient float SizeMultiplier;
  var transient float VelocityMultiplier;
  var transient byte HueModifier;
  var transient float SaturationMultiplier;
  var transient float BrightnessMultiplier;
  var transient float OpacityMultiplier;
  var transient Range StoredMassRange;
  var transient RangeVector StoredVelocityRange;
  var transient Vector StoredMaxAbsVelocity;
  var transient float StoredParticlesPerSecond;
  var transient float StoredInitialParticlesPerSecond;
  var transient RangeVector StoredSizeRange;
  var transient Range StoredLifetimeRange;
  var transient int StoredMaxParticles;
  var transient int StoredMaxActiveParticles;
  var transient RangeVector StoredColorMultiplier;
  var transient float StoredOpacity;
  var transient Emitter Owner;
  var transient bool Initialized;
  var transient bool Inactive;
  var transient bool RealDisableFogging;
  var transient bool AllParticlesDead;
  var transient bool WarmedUp;
  var transient float InactiveTime;
  var transient array<Particle> Particles;
  var transient int ParticleIndex;
  var transient int ActiveParticles;
  var transient float PPSFraction;
  var transient Box BoundingBox;
  var transient Vector RealExtentMultiplier;
  var transient int OtherIndex;
  var transient float InitialDelay;
  var transient Vector GlobalOffset;
  var transient float TimeTillReset;
  var transient int PS2Data;
  var transient int MaxActiveParticles;
  var transient int CurrentCollisionSoundIndex;
  var transient int CurrentSpawningSoundIndex;
  var transient int CurrentMeshSpawningIndex;
  var transient float MaxSizeScale;
  var transient int KillPending;
  var transient int DeferredParticles;
  var transient Vector RealMeshNormal;
  var transient array<Vector> MeshVertsAndNormals;
  var transient int CurrentSpawnOnTrigger;
  var transient int RenderableParticles;
  var transient RangeVector RealVelocityLossRange;


  native function ScaleFactor(float aFactor);


  native function Reset();


  native function UnTrigger();


  native function Trigger();


  native function SpawnParticle(int Amount);



