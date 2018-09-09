//==============================================================================
//  SparkEmitter
//==============================================================================

class SparkEmitter extends ParticleEmitter
    native
    editinlinenew
    dependsOn()
  ;

  struct ParticleSparkData {
      var float TimeBeforeVisible;
      var float TimeBetweenSegments;
      var Vector StartLocation;
      var Vector StartVelocity;

  };


  var (Spark) Range LineSegmentsRange;
  var (Spark) Range TimeBeforeVisibleRange;
  var (Spark) Range TimeBetweenSegmentsRange;
  var transient array<ParticleSparkData> SparkData;
  var transient VertexBuffer VertexBuffer;
  var transient IndexBuffer IndexBuffer;
  var transient int NumSegments;
  var transient int VerticesPerParticle;
  var transient int IndicesPerParticle;
  var transient int PrimitivesPerParticle;



