//==============================================================================
//  DynamicCubemap
//==============================================================================

class DynamicCubemap extends Texture
    native
    noexport
    SafeReplace
    dependsOn()
  ;

  var (DynamicCubemap) Texture Faces[6];
  var transient int CubemapRenderInterface;



