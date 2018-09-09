//==============================================================================
//  TexRotator
//==============================================================================

class TexRotator extends TexModifier
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum ETexRotationType {
    TR_FixedRotation ,
    TR_ConstantlyRotating ,
    TR_OscillatingRotation 
  };

  var Matrix M;
  var (TexRotator) byte TexRotationType;
  var (TexRotator) Rotator Rotation;
  var deprecated bool ConstantRotation;
  var (TexRotator) float UOffset;
  var (TexRotator) float VOffset;
  var (TexRotator) Rotator OscillationRate;
  var (TexRotator) Rotator OscillationAmplitude;
  var (TexRotator) Rotator OscillationPhase;



