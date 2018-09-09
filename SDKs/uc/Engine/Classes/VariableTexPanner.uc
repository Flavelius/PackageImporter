//==============================================================================
//  VariableTexPanner
//==============================================================================

class VariableTexPanner extends TexModifier
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (VariableTexPanner) Rotator PanDirection;
  var (VariableTexPanner) float PanRate;
  var Matrix M;
  var float LastTime;
  var float PanOffset;



