//==============================================================================
//  Interaction_Rotate
//==============================================================================

class Interaction_Rotate extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,InteractiveLevelElement)
  ;

  var transient Rotator OriginalOrientation;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 28 6F F9 13 00 98 70 F9 13 2D 00 10 71 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 88 71 F9 13 2E F8 C7 5C 01 00 28 6F F9 13 
    if (aInstigator != None && ile != None) {                                   //0026 : 07 91 00 82 77 00 98 70 F9 13 2A 16 18 09 00 77 00 88 71 F9 13 2A 16 16 
      if (!aReverse) {                                                          //003E : 07 7D 00 81 2D 00 10 71 F9 13 16 
        OriginalOrientation = aInstigator.Rotation;                             //0049 : 0F 01 B0 6E F9 13 19 00 98 70 F9 13 05 00 0C 01 00 84 6C 0F 
        aInstigator.sv_RotateToOrientation(ile.AbsRotation);                    //005D : 19 00 98 70 F9 13 14 00 00 1B 1A 10 00 00 19 00 88 71 F9 13 05 00 0C 01 48 7E 32 13 16 
      } else {                                                                  //007A : 06 91 00 
        aInstigator.sv_RotateToOrientation(OriginalOrientation);                //007D : 19 00 98 70 F9 13 0B 00 00 1B 1A 10 00 00 01 B0 6E F9 13 16 
      }
    }
    //1C 60 AF 32 13 00 28 6F F9 13 00 98 70 F9 13 2D 00 10 71 F9 13 16 0F 00 88 71 F9 13 2E F8 C7 5C 
    //01 00 28 6F F9 13 07 91 00 82 77 00 98 70 F9 13 2A 16 18 09 00 77 00 88 71 F9 13 2A 16 16 07 7D 
    //00 81 2D 00 10 71 F9 13 16 0F 01 B0 6E F9 13 19 00 98 70 F9 13 05 00 0C 01 00 84 6C 0F 19 00 98 
    //70 F9 13 14 00 00 1B 1A 10 00 00 19 00 88 71 F9 13 05 00 0C 01 48 7E 32 13 16 06 91 00 19 00 98 
    //70 F9 13 0B 00 00 1B 1A 10 00 00 01 B0 6E F9 13 16 04 0B 47 
  }



