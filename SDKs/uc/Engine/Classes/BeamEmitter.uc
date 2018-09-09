//==============================================================================
//  BeamEmitter
//==============================================================================

class BeamEmitter extends ParticleEmitter
    native
    editinlinenew
    dependsOn()
  ;

  enum EBeamEndPointType {
    PTEP_Velocity ,
    PTEP_Distance ,
    PTEP_Offset ,
    PTEP_Actor ,
    PTEP_TraceOffset ,
    PTEP_OffsetAsAbsolute ,
    PTEP_DynamicDistance 
  };

  struct ParticleBeamScale {
      var (ParticleBeamScale) Vector FrequencyScale;
      var (ParticleBeamScale) float RelativeLength;

  };


  struct ParticleBeamEndPoint {
      var (ParticleBeamEndPoint) name ActorTag;
      var (ParticleBeamEndPoint) RangeVector Offset;
      var (ParticleBeamEndPoint) float Weight;

  };


  struct ParticleBeamData {
      var Vector Location;
      var float t;

  };


  var (Beam) Range BeamDistanceRange;
  var (Beam) array<ParticleBeamEndPoint> BeamEndPoints;
  var (Beam) byte DetermineEndPointBy;
  var (Beam) float BeamTextureUScale;
  var (Beam) float BeamTextureVScale;
  var (Beam) int RotatingSheets;
  var (Beam) bool TriggerEndpoint;
  var (BeamNoise) RangeVector LowFrequencyNoiseRange;
  var (BeamNoise) int LowFrequencyPoints;
  var (BeamNoise) RangeVector HighFrequencyNoiseRange;
  var (BeamNoise) int HighFrequencyPoints;
  var (BeamNoise) array<ParticleBeamScale> LFScaleFactors;
  var (BeamNoise) array<ParticleBeamScale> HFScaleFactors;
  var (BeamNoise) float LFScaleRepeats;
  var (BeamNoise) float HFScaleRepeats;
  var (BeamNoise) bool UseHighFrequencyScale;
  var (BeamNoise) bool UseLowFrequencyScale;
  var (BeamNoise) bool NoiseDeterminesEndPoint;
  var (BeamNoise) RangeVector DynamicHFNoiseRange;
  var (BeamNoise) Range DynamicHFNoisePointsRange;
  var (BeamNoise) Range DynamicTimeBetweenNoiseRange;
  var (BeamBranching) bool UseBranching;
  var (BeamBranching) Range BranchProbability;
  var (BeamBranching) Range BranchHFPointsRange;
  var (BeamBranching) int BranchEmitter;
  var (BeamBranching) Range BranchSpawnAmountRange;
  var (BeamBranching) bool LinkupLifetime;
  var transient int SheetsUsed;
  var transient int VerticesPerParticle;
  var transient int IndicesPerParticle;
  var transient int PrimitivesPerParticle;
  var transient float BeamValueSum;
  var transient array<ParticleBeamData> HFPoints;
  var transient array<Vector> LFPoints;
  var transient array<Actor> HitActors;
  var transient float TimeSinceLastDynamicNoise;



