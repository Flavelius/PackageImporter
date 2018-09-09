//==============================================================================
//  TexOscillatorTriggered
//==============================================================================

class TexOscillatorTriggered extends TexOscillator
    native
    collapsecategories
    editinlinenew
    dependsOn(Actor,LevelInfo)
  ;

  enum ERetriggerAction {
    RTA_Reverse ,
    RTA_Reset ,
    RTA_Ignore ,
    RTA_Retrigger 
  };

  var (TexOscillatorTriggered) byte RetriggerAction;
  var (TexOscillatorTriggered) float StopAfterPeriod;
  var transient float TriggeredTime;
  var transient bool Reverse;
  var transient bool Triggered;


  function Reset() {
    Triggered = False;                                                          //0000 : 14 2D 01 D0 E2 3A 19 28 
    TriggeredTime = -1.00000000;                                                //0008 : 0F 01 60 E5 3A 19 1E 00 00 80 BF 
    Reverse = False;                                                            //0013 : 14 2D 01 D8 E5 3A 19 28 
    //14 2D 01 D0 E2 3A 19 28 0F 01 60 E5 3A 19 1E 00 00 80 BF 14 2D 01 D8 E5 3A 19 28 04 0B 47 
  }


  function Trigger(Actor Other,Actor EventInstigator) {
    if (Triggered) {                                                            //0000 : 07 6E 00 2D 01 D0 E2 3A 19 
      switch (RetriggerAction) {                                                //0009 : 05 01 01 50 E6 3A 19 
        case 0 :                                                                //0010 : 0A 45 00 24 00 
          Triggered = False;                                                    //0015 : 14 2D 01 D0 E2 3A 19 28 
          TriggeredTime = Other.Level.TimeSeconds;                              //001D : 0F 01 60 E5 3A 19 19 19 00 C8 E6 3A 19 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
          Reverse = True;                                                       //003A : 14 2D 01 D8 E5 3A 19 27 
          break;                                                                //0042 : 06 6B 00 
        case 1 :                                                                //0045 : 0A 68 00 24 01 
          Triggered = False;                                                    //004A : 14 2D 01 D0 E2 3A 19 28 
          TriggeredTime = -1.00000000;                                          //0052 : 0F 01 60 E5 3A 19 1E 00 00 80 BF 
          Reverse = True;                                                       //005D : 14 2D 01 D8 E5 3A 19 27 
          break;                                                                //0065 : 06 6B 00 
        default:                                                                //0068 : 0A FF FF 
      }
    } else {                                                                    //006B : 06 AB 00 
      if (RetriggerAction != 3) {                                               //006E : 07 86 00 9B 39 3A 01 50 E6 3A 19 39 3A 24 03 16 
        Triggered = True;                                                       //007E : 14 2D 01 D0 E2 3A 19 27 
      }
      TriggeredTime = Other.Level.TimeSeconds;                                  //0086 : 0F 01 60 E5 3A 19 19 19 00 C8 E6 3A 19 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      Reverse = False;                                                          //00A3 : 14 2D 01 D8 E5 3A 19 28 
    }
    //07 6E 00 2D 01 D0 E2 3A 19 05 01 01 50 E6 3A 19 0A 45 00 24 00 14 2D 01 D0 E2 3A 19 28 0F 01 60 
    //E5 3A 19 19 19 00 C8 E6 3A 19 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 14 2D 01 D8 E5 3A 
    //19 27 06 6B 00 0A 68 00 24 01 14 2D 01 D0 E2 3A 19 28 0F 01 60 E5 3A 19 1E 00 00 80 BF 14 2D 01 
    //D8 E5 3A 19 27 06 6B 00 0A FF FF 06 AB 00 07 86 00 9B 39 3A 01 50 E6 3A 19 39 3A 24 03 16 14 2D 
    //01 D0 E2 3A 19 27 0F 01 60 E5 3A 19 19 19 00 C8 E6 3A 19 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 
    //81 6C 0F 14 2D 01 D8 E5 3A 19 28 04 0B 47 
  }



