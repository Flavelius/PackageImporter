//==============================================================================
//  Interaction_RotateToFace
//==============================================================================

class Interaction_RotateToFace extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Actor)
  ;

  var transient Rotator OriginalOrientation;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local Rotator Orientation;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 10 25 F9 13 00 D8 26 F9 13 2D 00 50 27 F9 13 16 
    if (!aReverse) {                                                            //0016 : 07 B1 00 81 2D 00 50 27 F9 13 16 
      OriginalOrientation = aInstigator.Rotation;                               //0021 : 0F 01 98 24 F9 13 19 00 D8 26 F9 13 05 00 0C 01 00 84 6C 0F 
      Orientation = rotator(aOwner.Location - aInstigator.Location);            //0035 : 0F 00 C8 27 F9 13 39 50 D8 19 00 10 25 F9 13 05 00 0C 01 30 81 6C 0F 19 00 D8 26 F9 13 05 00 0C 01 30 81 6C 0F 16 
      if (aInstigator.Physics == 1) {                                           //005B : 07 8C 00 9A 39 3A 19 00 D8 26 F9 13 05 00 01 01 C0 93 6C 0F 39 3A 24 01 16 
        Orientation.Pitch = 0;                                                  //0074 : 0F 36 A8 BE 69 0F 00 C8 27 F9 13 25 
        Orientation.Roll = 0;                                                   //0080 : 0F 36 98 BF 69 0F 00 C8 27 F9 13 25 
      }
      aInstigator.sv_TeleportTo(aInstigator.Location,Orientation);              //008C : 19 00 D8 26 F9 13 19 00 04 1B 4A 07 00 00 19 00 D8 26 F9 13 05 00 0C 01 30 81 6C 0F 00 C8 27 F9 13 16 
    } else {                                                                    //00AE : 06 D3 00 
      aInstigator.sv_TeleportTo(aInstigator.Location,Orientation);              //00B1 : 19 00 D8 26 F9 13 19 00 04 1B 4A 07 00 00 19 00 D8 26 F9 13 05 00 0C 01 30 81 6C 0F 00 C8 27 F9 13 16 
    }
    //1C 60 AF 32 13 00 10 25 F9 13 00 D8 26 F9 13 2D 00 50 27 F9 13 16 07 B1 00 81 2D 00 50 27 F9 13 
    //16 0F 01 98 24 F9 13 19 00 D8 26 F9 13 05 00 0C 01 00 84 6C 0F 0F 00 C8 27 F9 13 39 50 D8 19 00 
    //10 25 F9 13 05 00 0C 01 30 81 6C 0F 19 00 D8 26 F9 13 05 00 0C 01 30 81 6C 0F 16 07 8C 00 9A 39 
    //3A 19 00 D8 26 F9 13 05 00 01 01 C0 93 6C 0F 39 3A 24 01 16 0F 36 A8 BE 69 0F 00 C8 27 F9 13 25 
    //0F 36 98 BF 69 0F 00 C8 27 F9 13 25 19 00 D8 26 F9 13 19 00 04 1B 4A 07 00 00 19 00 D8 26 F9 13 
    //05 00 0C 01 30 81 6C 0F 00 C8 27 F9 13 16 06 D3 00 19 00 D8 26 F9 13 19 00 04 1B 4A 07 00 00 19 
    //00 D8 26 F9 13 05 00 0C 01 30 81 6C 0F 00 C8 27 F9 13 16 04 0B 47 
  }



