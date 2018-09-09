//==============================================================================
//  Interaction_Sound
//==============================================================================

class Interaction_Sound extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Actor,InteractiveLevelElement)
  ;

  var (Interaction_Sound) Sound Sound;


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 10 DB F8 13 00 88 DB F8 13 2D 00 00 DC F8 13 16 
    aOwner.PlaySBSound(Sound,1.00000000,0.00000000,1024.00000000);              //0016 : 19 00 10 DB F8 13 1A 00 04 1B 2C 10 00 00 01 78 DC F8 13 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 80 44 16 
    //1C 78 A8 32 13 00 10 DB F8 13 00 88 DB F8 13 2D 00 00 DC F8 13 16 19 00 10 DB F8 13 1A 00 04 1B 
    //2C 10 00 00 01 78 DC F8 13 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 80 44 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 18 DD F8 13 00 90 DD F8 13 2D 00 08 DE F8 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 80 DE F8 13 2E F8 C7 5C 01 00 18 DD F8 13 
    if (ile != None) {                                                          //0026 : 07 4B 00 77 00 80 DE F8 13 2A 16 
      if (!aReverse) {                                                          //0031 : 07 4B 00 81 2D 00 08 DE F8 13 16 
        ile.sv_StartClientSubAction();                                          //003C : 19 00 80 DE F8 13 06 00 00 1B C3 0F 00 00 16 
      }
    }
    //1C 60 AF 32 13 00 18 DD F8 13 00 90 DD F8 13 2D 00 08 DE F8 13 16 0F 00 80 DE F8 13 2E F8 C7 5C 
    //01 00 18 DD F8 13 07 4B 00 77 00 80 DE F8 13 2A 16 07 4B 00 81 2D 00 08 DE F8 13 16 19 00 80 DE 
    //F8 13 06 00 00 1B C3 0F 00 00 16 04 0B 47 
  }



