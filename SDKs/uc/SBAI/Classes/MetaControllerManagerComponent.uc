//==============================================================================
//  MetaControllerManagerComponent
//==============================================================================

class MetaControllerManagerComponent extends Base_Component within Game_AIController
    native
    dependsOn()
  ;

  var private array<AI_MetaController> mMetaControllers;
  var int mControllerMessageMask1;
  var int mControllerMessageMask2;


  protected final native function RecomputeControllerMask();


  final native function bool WantMetaControllerMessage(byte aMessage);


  function bool HasMetaController(NPC_AI aController) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 50 9C FD 13 25 
    while (i < mMetaControllers.Length) {                                       //0007 : 07 38 00 96 00 50 9C FD 13 37 01 C8 9C FD 13 16 
      if (aController == mMetaControllers[i]) {                                 //0017 : 07 2E 00 72 00 70 93 FD 13 10 00 50 9C FD 13 01 C8 9C FD 13 16 
        return True;                                                            //002C : 04 27 
      }
      i++;                                                                      //002E : A5 00 50 9C FD 13 16 
    }
    return False;                                                               //0038 : 04 28 
    //0F 00 50 9C FD 13 25 07 38 00 96 00 50 9C FD 13 37 01 C8 9C FD 13 16 07 2E 00 72 00 70 93 FD 13 
    //10 00 50 9C FD 13 01 C8 9C FD 13 16 04 27 A5 00 50 9C FD 13 16 06 07 00 04 28 04 0B 47 
  }


  native function RemoveMetaController(AI_MetaController aMetaController);


  native function AI_MetaController AddMetaController(AI_MetaController aMetaController);



