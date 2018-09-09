//==============================================================================
//  StaticMesh
//==============================================================================

class StaticMesh extends Primitive
    native
    SafeReplace
    collapsecategories
  ;

  var () editconstarray array<StaticMeshMaterial> Materials;
  var () bool AutoUnwrap;
  var () bool UseSimpleLineCollision;
  var () bool UseSimpleBoxCollision;
  var () bool UseVertexColor;
  var () bool UseSimpleKarmaCollision;



