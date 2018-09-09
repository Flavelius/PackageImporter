//==============================================================================
//  MeshObject
//==============================================================================

class MeshObject extends Object
    native
    abstract
    dependsOn()
  ;

  enum EMeshSectionMethod {
    MSM_SmoothOnly ,
    MSM_RigidOnly ,
    MSM_Mixed ,
    MSM_SinglePiece ,
    MSM_ForcedRigid 
  };

  enum EImpLightMode {
    ILM_Unlit ,
    ILM_PseudoShaded ,
    ILM_Uniform 
  };

  enum EImpDrawMode {
    IDM_Normal ,
    IDM_Fading 
  };

  enum EImpSpaceMode {
    ISM_Sprite ,
    ISM_Fixed ,
    ISM_PivotVertical ,
    ISM_PivotHorizontal 
  };



