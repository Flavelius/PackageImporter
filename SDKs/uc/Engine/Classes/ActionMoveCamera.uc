//==============================================================================
//  ActionMoveCamera
//==============================================================================

class ActionMoveCamera extends MatAction
    native
    dependsOn()
    Config(System)
  ;

  enum EPathStyle {
    PATHSTYLE_Linear ,
    PATHSTYLE_Bezier 
  };

  var (Path) config byte PathStyle;



