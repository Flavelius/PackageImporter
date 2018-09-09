//==============================================================================
//  MaterialSequence
//==============================================================================

class MaterialSequence extends Modifier
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum EMaterialSequenceTriggerActon {
    MSTA_Ignore ,
    MSTA_Reset ,
    MSTA_Pause ,
    MSTA_Stop 
  };

  enum EMaterialSequenceAction {
    MSA_ShowMaterial ,
    MSA_FadeToMaterial 
  };

  struct MaterialSequenceItem {
      var (MaterialSequenceItem) editinline Material Material;
      var (MaterialSequenceItem) float Time;
      var (MaterialSequenceItem) byte Action;

  };


  var (MaterialSequence) array<MaterialSequenceItem> SequenceItems;
  var (MaterialSequence) byte TriggerAction;
  var (MaterialSequence) bool LoopSequence;
  var (MaterialSequence) bool Paused;
  var transient float CurrentTime;
  var transient float LastTime;
  var float TotalTime;


  function Trigger(Actor Other,Actor EventInstigator) {
    switch (TriggerAction) {                                                    //0000 : 05 01 01 28 C9 3A 19 
      case 1 :                                                                  //0007 : 0A 25 00 24 01 
        CurrentTime = 0.00000000;                                               //000C : 0F 01 A0 C9 3A 19 1E 00 00 00 00 
        LastTime = 0.00000000;                                                  //0017 : 0F 01 18 CA 3A 19 1E 00 00 00 00 
        break;                                                                  //0022 : 06 4F 00 
      case 2 :                                                                  //0025 : 0A 3C 00 24 02 
        Paused = !Paused;                                                       //002A : 14 2D 01 90 CA 3A 19 81 2D 01 90 CA 3A 19 16 
        break;                                                                  //0039 : 06 4F 00 
      case 3 :                                                                  //003C : 0A 4C 00 24 03 
        Paused = True;                                                          //0041 : 14 2D 01 90 CA 3A 19 27 
        break;                                                                  //0049 : 06 4F 00 
      default:                                                                  //004C : 0A FF FF 
    }
    //05 01 01 28 C9 3A 19 0A 25 00 24 01 0F 01 A0 C9 3A 19 1E 00 00 00 00 0F 01 18 CA 3A 19 1E 00 00 
    //00 00 06 4F 00 0A 3C 00 24 02 14 2D 01 90 CA 3A 19 81 2D 01 90 CA 3A 19 16 06 4F 00 0A 4C 00 24 
    //03 14 2D 01 90 CA 3A 19 27 06 4F 00 0A FF FF 04 0B 47 
  }


  function Reset() {
    CurrentTime = 0.00000000;                                                   //0000 : 0F 01 A0 C9 3A 19 1E 00 00 00 00 
    LastTime = 0.00000000;                                                      //000B : 0F 01 18 CA 3A 19 1E 00 00 00 00 
    Paused = default.Paused;                                                    //0016 : 14 2D 01 90 CA 3A 19 2D 02 90 CA 3A 19 
    //0F 01 A0 C9 3A 19 1E 00 00 00 00 0F 01 18 CA 3A 19 1E 00 00 00 00 14 2D 01 90 CA 3A 19 2D 02 90 
    //CA 3A 19 04 0B 47 
  }



