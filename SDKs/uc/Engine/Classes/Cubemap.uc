//==============================================================================
//  Cubemap
//==============================================================================

class Cubemap extends Texture
    native
    noexport
    SafeReplace
    dependsOn()
  ;

  var (Cubemap) Texture Faces[6];
  var transient int CubemapRenderInterface;



