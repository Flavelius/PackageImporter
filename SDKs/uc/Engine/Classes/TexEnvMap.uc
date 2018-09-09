//==============================================================================
//  TexEnvMap
//==============================================================================

class TexEnvMap extends TexModifier
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum ETexEnvMapType {
    EM_WorldSpace ,
    EM_CameraSpace 
  };

  var (TexEnvMap) byte EnvMapType;



