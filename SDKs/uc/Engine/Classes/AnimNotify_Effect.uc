//==============================================================================
//  AnimNotify_Effect
//==============================================================================

class AnimNotify_Effect extends AnimNotify
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (AnimNotify_Effect) class<Actor> EffectClass;
  var (AnimNotify_Effect) name Bone;
  var (AnimNotify_Effect) Vector OffsetLocation;
  var (AnimNotify_Effect) Rotator OffsetRotation;
  var (AnimNotify_Effect) bool Attach;
  var (AnimNotify_Effect) name Tag;
  var (AnimNotify_Effect) float DrawScale;
  var (AnimNotify_Effect) Vector DrawScale3D;
  var private transient Actor LastSpawnedEffect;



