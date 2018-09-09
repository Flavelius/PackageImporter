//==============================================================================
//  ShadowBitmapMaterial
//==============================================================================

class ShadowBitmapMaterial extends BitmapMaterial
    native
    collapsecategories
    dependsOn()
  ;

  var const transient int TextureInterfaces[2];
  var Actor ShadowActor;
  var Vector LightDirection;
  var float LightDistance;
  var float LightFOV;
  var bool Dirty;
  var bool Invalid;
  var bool bBlobShadow;
  var float CullDistance;
  var byte ShadowDarkness;
  var BitmapMaterial BlobShadow;



