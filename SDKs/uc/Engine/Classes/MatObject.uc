//==============================================================================
//  MatObject
//==============================================================================

class MatObject extends Object
    native
    abstract
    dependsOn()
  ;

  struct Orientation {
      var (Orientation) byte CamOrientation;
      var (Orientation) Actor LookAt;
      var (Orientation) Actor DollyWith;
      var (Orientation) float EaseIntime;
      var (Orientation) int bReversePitch;
      var (Orientation) int bReverseYaw;
      var (Orientation) int bReverseRoll;
      var transient int MA;
      var float PctInStart;
      var float PctInEnd;
      var float PctInDuration;
      var Rotator StartingRotation;

  };




