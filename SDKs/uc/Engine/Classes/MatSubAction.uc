//==============================================================================
//  MatSubAction
//==============================================================================

class MatSubAction extends MatObject
    native
    abstract
    editinlinenew
    dependsOn()
  ;

  enum ESAStatus {
    SASTATUS_Waiting ,
    SASTATUS_Running ,
    SASTATUS_Ending ,
    SASTATUS_Expired 
  };

  var (Time) float Delay;
  var (Time) float Duration;
  var Texture Icon;
  var byte Status;
  var localized string Desc;
  var transient float PctStarting;
  var transient float PctEnding;
  var transient float PctDuration;



