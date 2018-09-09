//==============================================================================
//  SBDecoration
//==============================================================================

class SBDecoration extends Actor
    dependsOn()
    Placeable
  ;

  var (SBDecoration) name Animation;
  var (SBDecoration) float speed;


  function PostBeginPlay() {
    if (IsClient()) {                                                           //0000 : 07 25 00 1B 1C 0C 00 00 16 
      if (Animation != 'None') {                                                //0009 : 07 25 00 FF 01 48 A7 F9 13 21 00 00 00 00 16 
        LoopAnim(Animation,speed);                                              //0018 : 61 04 01 48 A7 F9 13 01 28 A8 F9 13 16 
      }
    }
    Super.PostBeginPlay();                                                      //0025 : 1C D0 02 38 0F 16 
    //07 25 00 1B 1C 0C 00 00 16 07 25 00 FF 01 48 A7 F9 13 21 00 00 00 00 16 61 04 01 48 A7 F9 13 01 
    //28 A8 F9 13 16 1C D0 02 38 0F 16 04 0B 47 
  }



