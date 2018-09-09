//==============================================================================
//  SBPath
//==============================================================================

class SBPath extends Object
    native
    exportstructs
    dependsOn()
  ;

  var array<Vector> Path;
  var array<AnnotationActor> Annotations;
  var AnnotationActor ControlPoint;
  var bool Complete;
  var transient int PathIndex;



