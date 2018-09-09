//==============================================================================
//  LineOfSightTrigger
//==============================================================================

class LineOfSightTrigger extends Triggers
    native
    dependsOn(PlayerController)
  ;

  var (LineOfSightTrigger) float MaxViewDist;
  var float OldTickTime;
  var (LineOfSightTrigger) bool bEnabled;
  var bool bTriggered;
  var (LineOfSightTrigger) name SeenActorTag;
  var Actor SeenActor;
  var (LineOfSightTrigger) int MaxViewAngle;
  var float RequiredViewDir;


  function Trigger(Actor Other,Pawn EventInstigator) {
    bEnabled = True;                                                            //0000 : 14 2D 01 18 F8 37 0F 27 
    //14 2D 01 18 F8 37 0F 27 04 0B 47 
  }


  event PlayerSeesMe(PlayerController P) {
    TriggerEvent(Event,self,P.Pawn);                                            //0000 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 19 00 E0 F9 37 0F 05 00 04 01 88 83 6C 0F 16 
    bTriggered = True;                                                          //001A : 14 2D 01 78 89 3B 19 27 
    //1C F8 B1 34 0F 01 38 9F 6C 0F 17 19 00 E0 F9 37 0F 05 00 04 01 88 83 6C 0F 16 14 2D 01 78 89 3B 
    //19 27 04 0B 47 
  }


  function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    RequiredViewDir = Cos(MaxViewAngle * 3.14159274 / 180);                     //0006 : 0F 01 68 8A 3B 19 BC AC AB 39 3F 01 E0 8A 3B 19 1E DB 0F 49 40 16 39 3F 2C B4 16 16 
    if (SeenActorTag != 'None') {                                               //0022 : 07 4B 00 FF 01 58 8B 3B 19 21 00 00 00 00 16 
      foreach AllActors(Class'Actor',SeenActor,SeenActorTag) {                  //0031 : 2F 61 30 20 F8 8B C1 00 01 D0 8B 3B 19 01 58 8B 3B 19 16 4A 00 
        goto jl004A;                                                            //0046 : 06 4A 00 
      }
    }
    //1C D0 02 38 0F 16 0F 01 68 8A 3B 19 BC AC AB 39 3F 01 E0 8A 3B 19 1E DB 0F 49 40 16 39 3F 2C B4 
    //16 16 07 4B 00 FF 01 58 8B 3B 19 21 00 00 00 00 16 2F 61 30 20 F8 8B C1 00 01 D0 8B 3B 19 01 58 
    //8B 3B 19 16 4A 00 06 4A 00 31 30 04 0B 47 
  }



