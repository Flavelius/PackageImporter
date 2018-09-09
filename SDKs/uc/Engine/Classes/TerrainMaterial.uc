//==============================================================================
//  TerrainMaterial
//==============================================================================

class TerrainMaterial extends RenderedMaterial
    native
    collapsecategories
    dependsOn()
  ;

  struct TerrainMaterialLayer {
      var Material Texture;
      var BitmapMaterial AlphaWeight;
      var Matrix TextureMatrix;

  };


  var const array<TerrainMaterialLayer> Layers;
  var const byte RenderMethod;
  var const bool FirstPass;



