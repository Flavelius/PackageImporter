//==============================================================================
//  TexOscillator
//==============================================================================

class TexOscillator extends TexModifier
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum ETexOscillationType {
    OT_Pan ,
    OT_Stretch ,
    OT_StretchRepeat ,
    OT_Jitter 
  };

  var (TexOscillator) float UOscillationRate;
  var (TexOscillator) float VOscillationRate;
  var (TexOscillator) float UOscillationPhase;
  var (TexOscillator) float VOscillationPhase;
  var (TexOscillator) float UOscillationAmplitude;
  var (TexOscillator) float VOscillationAmplitude;
  var (TexOscillator) byte UOscillationType;
  var (TexOscillator) byte VOscillationType;
  var (TexOscillator) float UOffset;
  var (TexOscillator) float VOffset;
  var Matrix M;
  var float LastSu;
  var float LastSv;
  var float CurrentUJitter;
  var float CurrentVJitter;



