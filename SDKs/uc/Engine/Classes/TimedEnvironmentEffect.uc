//==============================================================================
//  TimedEnvironmentEffect
//==============================================================================

class TimedEnvironmentEffect extends EnvironmentEffect
    native
    exportstructs
    dependsOn()
  ;

  struct EventRange {
      var (EventRange) name Event;
      var (EventRange) name InRangeEvent;
      var (EventRange) name OutOfRangeEvent;
      var (EventRange) float RangeBeginTime;
      var (EventRange) float RangeEndTime;
      var transient int WasInRange;

  };


  var (Preview) transient float PreviewSpeed;
  var (Preview) transient byte PreviewProgress;
  var float PreviewRelative;
  var (Preview) float UpdateSpeed;
  var float UpdateTimer;
  var (Events) array<EventRange> Events;
  var float mDefaultTime;



