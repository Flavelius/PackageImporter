//==============================================================================
//  Interaction_TeleportToPosition
//==============================================================================

class Interaction_TeleportToPosition extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(InteractiveLevelElement,Game_Pawn)
  ;

  var transient Vector originalLocation;
  var transient Rotator OriginalOrientation;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local Vector Position;
    local Rotator Orientation;
    local float turntimer;
    local float MoveTimer;
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 F0 2F F9 13 00 40 32 F9 13 2D 00 B8 32 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 30 33 F9 13 2E F8 C7 5C 01 00 F0 2F F9 13 
    if (aInstigator != None && ile != None) {                                   //0026 : 07 33 01 82 77 00 40 32 F9 13 2A 16 18 09 00 77 00 30 33 F9 13 2A 16 16 
      if (!aReverse) {                                                          //003E : 07 1A 01 81 2D 00 B8 32 F9 13 16 
        Position = ile.AbsPosition;                                             //0049 : 0F 00 A8 33 F9 13 19 00 30 33 F9 13 05 00 0C 01 00 51 32 13 
        Orientation = ile.AbsRotation;                                          //005D : 0F 00 20 34 F9 13 19 00 30 33 F9 13 05 00 0C 01 48 7E 32 13 
        MoveTimer = VSize(Position - aInstigator.Location) / aInstigator.GroundSpeed;//0071 : 0F 00 98 34 F9 13 AC E1 D8 00 A8 33 F9 13 19 00 40 32 F9 13 05 00 0C 01 30 81 6C 0F 16 16 19 00 40 32 F9 13 05 00 04 01 18 A9 76 0F 16 
        turntimer = (Orientation - aInstigator.Rotation).Yaw / aInstigator.RotationRate.Yaw;//009E : 0F 00 10 35 F9 13 39 3F 91 36 20 BF 69 0F 61 3D 00 20 34 F9 13 19 00 40 32 F9 13 05 00 0C 01 00 84 6C 0F 16 36 20 BF 69 0F 19 00 40 32 F9 13 05 00 0C 01 30 E8 6E 0F 16 
        originalLocation = aInstigator.Location;                                //00D6 : 0F 01 78 2F F9 13 19 00 40 32 F9 13 05 00 0C 01 30 81 6C 0F 
        OriginalOrientation = aInstigator.Rotation;                             //00EA : 0F 01 88 35 F9 13 19 00 40 32 F9 13 05 00 0C 01 00 84 6C 0F 
        aInstigator.sv_TeleportTo(Position,Orientation);                        //00FE : 19 00 40 32 F9 13 10 00 04 1B 4A 07 00 00 00 A8 33 F9 13 00 20 34 F9 13 16 
      } else {                                                                  //0117 : 06 33 01 
        aInstigator.sv_TeleportTo(originalLocation,OriginalOrientation);        //011A : 19 00 40 32 F9 13 10 00 04 1B 4A 07 00 00 01 78 2F F9 13 01 88 35 F9 13 16 
      }
    }
    //1C 60 AF 32 13 00 F0 2F F9 13 00 40 32 F9 13 2D 00 B8 32 F9 13 16 0F 00 30 33 F9 13 2E F8 C7 5C 
    //01 00 F0 2F F9 13 07 33 01 82 77 00 40 32 F9 13 2A 16 18 09 00 77 00 30 33 F9 13 2A 16 16 07 1A 
    //01 81 2D 00 B8 32 F9 13 16 0F 00 A8 33 F9 13 19 00 30 33 F9 13 05 00 0C 01 00 51 32 13 0F 00 20 
    //34 F9 13 19 00 30 33 F9 13 05 00 0C 01 48 7E 32 13 0F 00 98 34 F9 13 AC E1 D8 00 A8 33 F9 13 19 
    //00 40 32 F9 13 05 00 0C 01 30 81 6C 0F 16 16 19 00 40 32 F9 13 05 00 04 01 18 A9 76 0F 16 0F 00 
    //10 35 F9 13 39 3F 91 36 20 BF 69 0F 61 3D 00 20 34 F9 13 19 00 40 32 F9 13 05 00 0C 01 00 84 6C 
    //0F 16 36 20 BF 69 0F 19 00 40 32 F9 13 05 00 0C 01 30 E8 6E 0F 16 0F 01 78 2F F9 13 19 00 40 32 
    //F9 13 05 00 0C 01 30 81 6C 0F 0F 01 88 35 F9 13 19 00 40 32 F9 13 05 00 0C 01 00 84 6C 0F 19 00 
    //40 32 F9 13 10 00 04 1B 4A 07 00 00 00 A8 33 F9 13 00 20 34 F9 13 16 06 33 01 19 00 40 32 F9 13 
    //10 00 04 1B 4A 07 00 00 01 78 2F F9 13 01 88 35 F9 13 16 04 0B 47 
  }



