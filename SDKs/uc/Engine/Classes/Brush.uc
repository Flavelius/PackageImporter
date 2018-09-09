//==============================================================================
//  Brush
//==============================================================================

class Brush extends Actor
    native
    dependsOn()
  ;

  enum ECsgOper {
    CSG_Active ,
    CSG_Add ,
    CSG_Subtract ,
    CSG_Intersect ,
    CSG_Deintersect 
  };

  var (Brush) byte CsgOper;
  var const Object UnusedLightMesh;
  var Vector PostPivot;
  var Scale MainScale;
  var Scale PostScale;
  var Scale TempScale;
  var (Brush) Color BrushColor;
  var (Brush) int PolyFlags;
  var (Brush) bool bColored;



