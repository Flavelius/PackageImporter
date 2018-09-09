//==============================================================================
//  Interaction_EffectOff
//==============================================================================

class Interaction_EffectOff extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(InteractiveLevelElement)
  ;

  var (Interaction_EffectOff) name EffectTag;


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 C8 FA F8 13 00 E0 FB F8 13 2D 00 58 FC F8 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 D0 FC F8 13 2E F8 C7 5C 01 00 C8 FA F8 13 
    if (ile != None) {                                                          //0026 : 07 50 00 77 00 D0 FC F8 13 2A 16 
      if (!aReverse) {                                                          //0031 : 07 50 00 81 2D 00 58 FC F8 13 16 
        ile.cl_StopTaggedEffects(EffectTag);                                    //003C : 19 00 D0 FC F8 13 0B 00 00 1B F7 0F 00 00 01 48 FD F8 13 16 
      }
    }
    //1C 78 A8 32 13 00 C8 FA F8 13 00 E0 FB F8 13 2D 00 58 FC F8 13 16 0F 00 D0 FC F8 13 2E F8 C7 5C 
    //01 00 C8 FA F8 13 07 50 00 77 00 D0 FC F8 13 2A 16 07 50 00 81 2D 00 58 FC F8 13 16 19 00 D0 FC 
    //F8 13 0B 00 00 1B F7 0F 00 00 01 48 FD F8 13 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 C0 FD F8 13 00 B8 FE F8 13 16 
    if (!aReverse) {                                                            //0010 : 07 3A 00 81 2D 00 30 FF F8 13 16 
      ile = InteractiveLevelElement(aOwner);                                    //001B : 0F 00 A8 FF F8 13 2E F8 C7 5C 01 00 C0 FD F8 13 
      ile.sv_StartClientSubAction();                                            //002B : 19 00 A8 FF F8 13 06 00 00 1B C3 0F 00 00 16 
    }
    //1C 60 AF 32 13 00 C0 FD F8 13 00 B8 FE F8 13 16 07 3A 00 81 2D 00 30 FF F8 13 16 0F 00 A8 FF F8 
    //13 2E F8 C7 5C 01 00 C0 FD F8 13 19 00 A8 FF F8 13 06 00 00 1B C3 0F 00 00 16 04 0B 47 
  }



