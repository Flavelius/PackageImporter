//==============================================================================
//  MeshEmitter
//==============================================================================

class MeshEmitter extends ParticleEmitter
    native
    editinlinenew
    dependsOn()
  ;

  var (Mesh) StaticMesh StaticMesh;
  var (Mesh) bool UseMeshBlendMode;
  var (Mesh) bool RenderTwoSided;
  var (Mesh) bool UseParticleColor;
  var (Rotation) bool GetOrientationFromVelocity;
  var transient Vector MeshExtent;



