//==============================================================================
//  DeadspellStormEffect
//==============================================================================

class DeadspellStormEffect extends TimedEnvironmentEffect
    native
    exportstructs
    dependsOn()
  ;

  enum EDeadSpellPhase {
    EDSP_None ,
    EDSP_Intro ,
    EDSP_Wait ,
    EDSP_Trip ,
    EDSP_Outro ,
    EDSP_Done 
  };

  struct DSProgressEvent {
      var (DSProgressEvent) float TimeFraction;
      var (DSProgressEvent) name Event;

  };


  var (DSIntro) editinline EnvironmentSettings StormStart;
  var (DSIntro) int IntroDurationSec;
  var (DSIntro) name IntroEvent;
  var (DSTrip) name StartEvent;
  var (DSTrip) array<DSProgressEvent> TripEvents;
  var (DSOutro) editinline EnvironmentSettings StormEnd;
  var (DSOutro) int OutroDurationSec;
  var (DSOutro) name OutroEvent;
  var (DSMusic) name MusicTag;
  var (DSMusic) float MusicDelaySec;
  var (Preview) transient byte mPhase;
  var transient EnvironmentSettings mCurrentEnvironmentSettings;
  var transient float mOutroIntroTimer;
  var transient bool bActivated;


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    bActivated = False;                                                         //0000 : 14 2D 01 00 8D 35 0F 28 
    //14 2D 01 00 8D 35 0F 28 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    bActivated = True;                                                          //0000 : 14 2D 01 00 8D 35 0F 27 
    //14 2D 01 00 8D 35 0F 27 04 0B 47 
  }



