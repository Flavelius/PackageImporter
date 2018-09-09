//==============================================================================
//  TrailEmitter
//==============================================================================

class TrailEmitter extends ParticleEmitter
    native
    editinlinenew
    dependsOn()
  ;

  enum ETrailLocation {
    PTTL_AttachedToParticle ,
    PTTL_FollowEmitter 
  };

  enum ETrailShadeType {
    PTTST_None ,
    PTTST_RandomStatic ,
    PTTST_RandomDynamic ,
    PTTST_Linear ,
    PTTST_PointLife 
  };

  struct ParticleTrailInfo {
      var int TrailIndex;
      var int NumPoints;
      var Vector LastLocation;
      var Vector LastEmitterLocation;

  };


  struct ParticleTrailData {
      var Vector Location;
      var Color Color;
      var float Size;
      var int DoubleDummy1;
      var int DoubleDummy2;

  };


  var (Trail) byte TrailShadeType;
  var (Trail) byte TrailLocation;
  var (Trail) int MaxPointsPerTrail;
  var (Trail) float DistanceThreshold;
  var (Trail) bool UseCrossedSheets;
  var (Trail) int MaxTrailTwistAngle;
  var (Trail) float PointLifeTime;
  var transient array<ParticleTrailData> TrailData;
  var transient array<ParticleTrailInfo> TrailInfo;
  var transient VertexBuffer VertexBuffer;
  var transient IndexBuffer IndexBuffer;
  var transient int VerticesPerParticle;
  var transient int IndicesPerParticle;
  var transient int PrimitivesPerParticle;


  final native function ResetTrail();



