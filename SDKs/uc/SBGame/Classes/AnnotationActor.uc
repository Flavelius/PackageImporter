//==============================================================================
//  AnnotationActor
//==============================================================================

class AnnotationActor extends SBPoint
    native
    exportstructs
    dependsOn()
  ;

  var (Annotation) byte AnnotationType;
  var (Annotation) bool CreateNode;
  var (Annotation) Vector Extent;
  var (Annotation) bool FitNode;
  var (Annotation) array<byte> AnnotationMask;
  var native transient int OriginCell;
  var transient bool AccessmapLinked;
  var transient int mInstances;



