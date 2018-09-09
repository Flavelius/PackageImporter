//==============================================================================
//  Interaction_EnableCollision
//==============================================================================

class Interaction_EnableCollision extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Actor)
  ;

  var (Interaction_EnableCollision) bool EnableCollision;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 08 55 F9 13 00 30 56 F9 13 2D 00 A8 56 F9 13 16 
    if (aOwner != None) {                                                       //0016 : 07 5B 00 77 00 08 55 F9 13 2A 16 
      if (!aReverse) {                                                          //0021 : 07 44 00 81 2D 00 A8 56 F9 13 16 
        aOwner.sv_SetCollision(EnableCollision);                                //002C : 19 00 08 55 F9 13 0C 00 00 1B F4 0F 00 00 2D 01 90 54 F9 13 16 
      } else {                                                                  //0041 : 06 5B 00 
        aOwner.sv_SetCollision(!EnableCollision);                               //0044 : 19 00 08 55 F9 13 0E 00 00 1B F4 0F 00 00 81 2D 01 90 54 F9 13 16 16 
      }
    }
    //1C 60 AF 32 13 00 08 55 F9 13 00 30 56 F9 13 2D 00 A8 56 F9 13 16 07 5B 00 77 00 08 55 F9 13 2A 
    //16 07 44 00 81 2D 00 A8 56 F9 13 16 19 00 08 55 F9 13 0C 00 00 1B F4 0F 00 00 2D 01 90 54 F9 13 
    //16 06 5B 00 19 00 08 55 F9 13 0E 00 00 1B F4 0F 00 00 81 2D 01 90 54 F9 13 16 16 04 0B 47 
  }



