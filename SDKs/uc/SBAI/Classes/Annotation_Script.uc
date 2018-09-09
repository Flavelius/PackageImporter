//==============================================================================
//  Annotation_Script
//==============================================================================

class Annotation_Script extends AI_MetaController
    native
    dependsOn(Game_AIController)
  ;


  event bool AnnotationDone(Game_AIController aController) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  event OnDetach(Game_AIController aController,AIPoint aPoint) {
    aController.RemoveMetaController(self);                                     //0000 : 19 00 E8 93 FD 13 07 00 00 1B 02 73 00 00 17 16 
    //19 00 E8 93 FD 13 07 00 00 1B 02 73 00 00 17 16 04 0B 47 
  }


  event OnAttach(Game_AIController aController,AIPoint aPoint) {
    aController.AddMetaController(self);                                        //0000 : 19 00 20 95 FD 13 07 00 04 1B 01 73 00 00 17 16 
    //19 00 20 95 FD 13 07 00 04 1B 01 73 00 00 17 16 04 0B 47 
  }



