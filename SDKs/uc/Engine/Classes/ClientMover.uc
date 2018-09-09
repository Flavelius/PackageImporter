//==============================================================================
//  ClientMover
//==============================================================================

class ClientMover extends Mover
    dependsOn()
  ;


  function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C 90 07 79 0F 16 
    if (Level.NetMode == 1) {                                                   //0006 : 07 34 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 
      GotoState('ServerIdle');                                                  //001F : 71 21 AD 2B 00 00 16 
      SetTimer(0.00000000,False);                                               //0026 : 61 18 1E 00 00 00 00 28 16 
      SetPhysics(0);                                                            //002F : 6F 82 24 00 16 
    }
    //1C 90 07 79 0F 16 07 34 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 71 
    //21 AD 2B 00 00 16 61 18 1E 00 00 00 00 28 16 6F 82 24 00 16 04 0B 47 
  }


  state ServerIdle {

    //08 47 

  }



