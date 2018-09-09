//==============================================================================
//  SkyZoneInfo
//==============================================================================

class SkyZoneInfo extends ZoneInfo
    native
    dependsOn()
  ;

  var (DayNightCycle) ConstantMaterial OverlaySkyColor;
  var (SkyZoneInfo) float RelativeOffsetDevider;
  var transient Vector mOriginalLocation;


  native event cl_OnTick(float aDeltaSeconds);



