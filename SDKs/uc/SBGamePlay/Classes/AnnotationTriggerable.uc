//==============================================================================
//  AnnotationTriggerable
//==============================================================================

class AnnotationTriggerable extends AnnotationActor
    native
    dependsOn()
  ;

  var (Annotation) bool Passable;


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    Super.UnTrigger(Other,EventInstigator);                                     //0000 : 1C 10 45 6D 0F 00 70 E9 31 13 00 38 EA 31 13 16 
    Passable = False;                                                           //0010 : 14 2D 01 B0 EA 31 13 28 
    //1C 10 45 6D 0F 00 70 E9 31 13 00 38 EA 31 13 16 14 2D 01 B0 EA 31 13 28 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    Super.Trigger(Other,EventInstigator);                                       //0000 : 1C F0 45 6D 0F 00 28 EB 31 13 00 F0 EB 31 13 16 
    Passable = True;                                                            //0010 : 14 2D 01 B0 EA 31 13 27 
    //1C F0 45 6D 0F 00 28 EB 31 13 00 F0 EB 31 13 16 14 2D 01 B0 EA 31 13 27 04 0B 47 
  }



