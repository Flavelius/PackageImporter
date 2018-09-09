//==============================================================================
//  HormoneComponent
//==============================================================================

class HormoneComponent extends Base_Component within Game_AIController
    native
    exportstructs
    dependsOn()
  ;

  struct HormoneSynergy {
      var int FromIndex;
      var int ToIndex;
      var float Rate;

  };


  struct Hormone {
      var name Tag;
      var float mLevel;
      var float Rate;
      var float Intensity;
      var byte signal;

  };


  var array<Hormone> Hormones;
  var array<HormoneSynergy> Synergies;
  var const float cPulseTime;
  var float PulseTimer;
  var const float cPhaseTime;
  var bool bTrace;
  var array<float> TraceLevel;


  protected native function float DeltaValue(float aValue,float aRate);


  native function AdjustHormone(name aTag,float aRate);



