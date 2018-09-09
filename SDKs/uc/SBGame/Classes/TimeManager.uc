//==============================================================================
//  TimeManager
//==============================================================================

class TimeManager extends TimedEnvironmentEffect
    native
    exportstructs
    dependsOn()
  ;

  var export array<DayNightCycleKeyframe> mKeyFrames;
  var EnvironmentSettings mCurrentEnvironmentSettings;


  event PostBeginPlay() {
    if (IsServer() || IsEditor()) {                                             //0000 : 07 16 00 84 1B FF 0B 00 00 16 18 07 00 1B 63 0C 00 00 16 16 
      return;                                                                   //0014 : 04 0B 
    }
    SetDrawType(0);                                                             //0016 : 1C 48 93 6B 0F 24 00 16 
    //07 16 00 84 1B FF 0B 00 00 16 18 07 00 1B 63 0C 00 00 16 16 04 0B 1C 48 93 6B 0F 24 00 16 04 0B 
    //47 
  }


  native event cl_OnFrame(float delta);



