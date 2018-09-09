//==============================================================================
//  Base_Notification
//==============================================================================

class Base_Notification extends Object
    native
    dependsOn()
  ;

  var int mNotificationData;


  final native function RemoveListener(Object Object);


  final native function AddListener(Object Object,name funcName);


  native function Delete();



