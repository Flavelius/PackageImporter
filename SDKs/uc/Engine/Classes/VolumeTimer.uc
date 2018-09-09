//==============================================================================
//  VolumeTimer
//==============================================================================

class VolumeTimer extends Info
    dependsOn()
  ;

  var Actor A;
  var float TimerFrequency;


  function Timer() {
    A.TimerPop(self);                                                           //0000 : 19 01 E8 01 7C 0F 07 00 00 1B 28 2B 00 00 17 16 
    SetTimer(TimerFrequency,False);                                             //0010 : 61 18 01 60 02 7C 0F 28 16 
    //19 01 E8 01 7C 0F 07 00 00 1B 28 2B 00 00 17 16 61 18 01 60 02 7C 0F 28 16 04 0B 47 
  }


  function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    SetTimer(1.00000000,False);                                                 //0006 : 61 18 1E 00 00 80 3F 28 16 
    A = Owner;                                                                  //000F : 0F 01 E8 01 7C 0F 01 B0 9F 6C 0F 
    //1C D0 02 38 0F 16 61 18 1E 00 00 80 3F 28 16 0F 01 E8 01 7C 0F 01 B0 9F 6C 0F 04 0B 47 
  }



