//==============================================================================
//  TerrainInfo
//==============================================================================

class TerrainInfo extends Info
    native
    noexport
    dependsOn()
    Placeable
  ;

  enum ESortOrder {
    SORT_NoSort ,
    SORT_BackToFront ,
    SORT_FrontToBack 
  };

  enum ETexMapAxis {
    TEXMAPAXIS_XY ,
    TEXMAPAXIS_XZ ,
    TEXMAPAXIS_YZ 
  };

  struct DecoInfo {
      var Vector Location;
      var Rotator Rotation;
      var Vector Scale;
      var Vector TempScale;
      var Color Color;
      var int Distance;

  };


  struct DecoSectorInfo {
      var array<DecoInfo> DecoInfo;
      var Vector Location;
      var float Radius;
      var int VertexStreamNum;
      var int NumPrimitives;
      var float LastRenderTime;
      var float CoordinateScale;
      var byte VertexStreamOffsetLo;
      var byte VertexStreamOffsetHi;

  };


  struct DecorationLayerData {
      var array<DecoSectorInfo> DecoSectorInfos;

  };


  struct DecorationLayer {
      var (DecorationLayer) int ShowOnTerrain;
      var (DecorationLayer) Texture ScaleMap;
      var (DecorationLayer) Texture DensityMap;
      var (DecorationLayer) Texture ColorMap;
      var (DecorationLayer) StaticMesh StaticMesh;
      var (DecorationLayer) RangeVector ScaleMultiplier;
      var (DecorationLayer) Range FadeoutRadius;
      var (DecorationLayer) Range FadeinRadius;
      var (DecorationLayer) Range DensityMultiplier;
      var (DecorationLayer) int MaxPerQuad;
      var (DecorationLayer) int Seed;
      var (DecorationLayer) int AlignToTerrain;
      var (DecorationLayer) byte DrawOrder;
      var (DecorationLayer) int ShowOnInvisibleTerrain;
      var (DecorationLayer) int LitDirectional;
      var (DecorationLayer) int DisregardTerrainLighting;
      var (DecorationLayer) int RandomYaw;
      var (DecorationLayer) byte DetailMode;

  };


  struct TerrainLayer {
      var (TerrainLayer) Material Texture;
      var (TerrainLayer) Texture AlphaMap;
      var (TerrainLayer) float UScale;
      var (TerrainLayer) float VScale;
      var (TerrainLayer) float UPan;
      var (TerrainLayer) float VPan;
      var (TerrainLayer) byte TextureMapAxis;
      var (TerrainLayer) float TextureRotation;
      var (TerrainLayer) Rotator LayerRotation;
      var Matrix TerrainMatrix;
      var (TerrainLayer) float KFriction;
      var (TerrainLayer) float KRestitution;
      var transient Texture LayerWeightMap;

  };


  struct NormalPair {
      var Vector Normal1;
      var Vector Normal2;

  };


  var (TerrainInfo) int TerrainSectorSize;
  var (TerrainInfo) Texture TerrainMap;
  var (TerrainInfo) Texture VertexLightMap;
  var (TerrainInfo) Vector TerrainScale;
  var (TerrainInfo) TerrainLayer Layers[32];
  var (TerrainInfo) array<DecorationLayer> DecoLayers;
  var (TerrainInfo) float DecoLayerOffset;
  var (TerrainInfo) bool Inverted;
  var (TerrainInfo) bool bKCollisionHalfRes;
  var transient int JustLoaded;
  var const native array<DecorationLayerData> DecoLayerData;
  var const native array<TerrainSector> Sectors;
  var const native array<Vector> Vertices;
  var const native int HeightmapX;
  var const native int HeightmapY;
  var const native int SectorsX;
  var const native int SectorsY;
  var const native TerrainPrimitive Primitive;
  var const native array<NormalPair> FaceNormals;
  var const native Vector ToWorld[4];
  var const native Vector ToHeightmap[4];
  var const native array<int> SelectedVertices;
  var const native int ShowGrid;
  var const array<int> QuadVisibilityBitmap;
  var const array<int> EdgeTurnBitmap;
  var const array<Material> QuadDomMaterialBitmap;
  var const native array<int> RenderCombinations;
  var const native array<int> VertexStreams;
  var const native array<int> DecoVertexStreams;
  var const native array<Color> VertexColors;
  var const native array<Color> PaintedColor;
  var const native Texture CollapsedLayers;
  var const native transient int SectorProjectorsPtr;
  var const native Texture OldTerrainMap;
  var const native array<byte> OldHeightmap;


  final native function PokeTerrain(Vector WorldLocation,int Radius,int MaxDepth);



