//==============================================================================
//  InteractiveHatch
//==============================================================================

class InteractiveHatch extends InteractiveLevelElement
    native
    dependsOn()
  ;

  var (InteractiveHatch) const Vector DoorMovement;
  var (InteractiveHatch) const Rotator DoorRotation;
  var (InteractiveHatch) const bool Hide;
  var (InteractiveHatch) const float OpenSpeed;
  var (InteractiveHatch) const float PassableTime;
  var (InteractiveHatch) const string AnnotationTag;
  var (InteractiveHatch) LocalizedString DoorSign;
  var (InteractiveHatch) const editinline Sound DoorSound;


  event string cl_GetToolTip() {
    return DoorSign.Text;                                                       //0000 : 04 36 58 C6 6B 0F 01 18 7D 30 0F 
    //04 36 58 C6 6B 0F 01 18 7D 30 0F 04 0B 47 
  }



