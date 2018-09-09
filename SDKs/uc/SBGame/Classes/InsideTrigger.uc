//==============================================================================
//  InsideTrigger
//==============================================================================

class InsideTrigger extends Trigger
    native
    abstract
    exportstructs
    dependsOn()
  ;

  var array<Game_Pawn> PawnsInside;


  final native function bool Inside(Game_Pawn aPawn);


  event OnLeavePawn(Game_Pawn aPawn) {
    UntriggerEvent(Event,self,aPawn);                                           //0000 : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 00 18 C3 31 0F 16 
    //1C 80 AF 34 0F 01 38 9F 6C 0F 17 00 18 C3 31 0F 16 04 0B 47 
  }


  event OnEnterPawn(Game_Pawn aPawn) {
    TriggerEvent(Event,self,aPawn);                                             //0000 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 18 85 32 19 16 
    //1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 18 85 32 19 16 04 0B 47 
  }


  event bool CheckPawn(Game_Pawn aPawn) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



