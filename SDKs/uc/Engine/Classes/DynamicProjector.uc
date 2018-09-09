//==============================================================================
//  DynamicProjector
//==============================================================================

class DynamicProjector extends Projector
    dependsOn()
  ;


  event cl_OnTick(float delta) {
    DetachProjector();                                                          //0000 : 1B DF 12 00 00 16 
    AttachProjector();                                                          //0006 : 1B 9F 2A 00 00 16 
    //1B DF 12 00 00 16 1B 9F 2A 00 00 16 04 0B 47 
  }



