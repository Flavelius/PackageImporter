//==============================================================================
//  AIPoint
//==============================================================================

class AIPoint extends AnnotationActor
    native
    abstract
    dependsOn()
  ;

  var (Script) Annotation_Script AnnotationScript;
  var (Script) bool TriggerScript;
  var (Script) bool WaitForScript;


  event PointReached(Game_Pawn aPawn) {
    if (Event != 'None') {                                                      //0000 : 07 20 00 FF 01 38 9F 6C 0F 21 00 00 00 00 16 
      TriggerEvent(Event,self,aPawn);                                           //000F : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 48 53 FD 13 16 
    }
    //07 20 00 FF 01 38 9F 6C 0F 21 00 00 00 00 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 48 53 FD 13 16 
    //04 0B 47 
  }


  final native function bool GetWalking();


  final native function AIPoint GetControlDestination(Game_Pawn aPawn);



