//==============================================================================
//  InteractiveChair
//==============================================================================

class InteractiveChair extends InteractiveLevelElement
    native
    dependsOn()
  ;

  var transient bool mCancelState;


  event sv_StopOptionActions() {
    Super.sv_StopOptionActions();                                               //0000 : 1C E0 4A 32 13 16 
    //1C E0 4A 32 13 16 04 0B 47 
  }


  function sv_StartOptionActions() {
    Super.sv_StartOptionActions();                                              //0000 : 1C 38 4D 32 13 16 
    //1C 38 4D 32 13 16 04 0B 47 
  }



