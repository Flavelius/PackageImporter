//==============================================================================
//  TexModifier
//==============================================================================

class TexModifier extends Modifier
    native
    collapsecategories
    dependsOn()
  ;

  enum ETexCoordCount {
    TCN_2DCoords ,
    TCN_3DCoords ,
    TCN_4DCoords 
  };

  enum ETexCoordSrc {
    TCS_Stream0 ,
    TCS_Stream1 ,
    TCS_Stream2 ,
    TCS_Stream3 ,
    TCS_Stream4 ,
    TCS_Stream5 ,
    TCS_Stream6 ,
    TCS_Stream7 ,
    TCS_WorldCoords ,
    TCS_CameraCoords ,
    TCS_WorldEnvMapCoords ,
    TCS_CameraEnvMapCoords ,
    TCS_ProjectorCoords ,
    TCS_NoChange 
  };

  var byte TexCoordSource;
  var (TexModifier) byte TexCoordCount;
  var (TexModifier) bool TexCoordProjected;
  var int texmodifier_dummy;



