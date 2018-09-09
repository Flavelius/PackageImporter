//==============================================================================
//  FadeColor
//==============================================================================

class FadeColor extends ConstantMaterial
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum EColorFadeType {
    FC_Linear ,
    FC_Sinusoidal 
  };

  var (FadeColor) Color Color1;
  var (FadeColor) Color Color2;
  var (FadeColor) float FadePeriod;
  var (FadeColor) float FadePhase;
  var (FadeColor) byte ColorFadeType;



