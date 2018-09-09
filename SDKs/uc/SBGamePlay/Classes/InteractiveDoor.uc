//==============================================================================
//  InteractiveDoor
//==============================================================================

class InteractiveDoor extends InteractiveLevelElement
    native
    dependsOn()
  ;

  var (InteractiveDoor) int DestinationWorld;
  var (InteractiveDoor) string Parameter;
  var deprecated string spawnPointTag;
  var (InteractiveDoor) LocalizedString DoorSign;
  var (InteractiveDoor) bool IsInstance;


  event string cl_GetToolTip() {
    return DoorSign.Text;                                                       //0000 : 04 36 58 C6 6B 0F 01 88 8E F9 13 
    //04 36 58 C6 6B 0F 01 88 8E F9 13 04 0B 47 
  }



