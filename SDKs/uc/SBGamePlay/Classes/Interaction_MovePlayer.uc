//==============================================================================
//  Interaction_MovePlayer
//==============================================================================

class Interaction_MovePlayer extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,InteractiveLevelElement)
  ;

  var (Interaction_MovePlayer) float DistanceBeforeSnap;
  var private transient Vector mOriginalLocation;
  var private transient Vector mTargetLocation;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 A0 73 F9 13 00 18 75 F9 13 2D 00 90 75 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 08 76 F9 13 2E F8 C7 5C 01 00 A0 73 F9 13 
    if (aInstigator != None && ile != None) {                                   //0026 : 07 99 00 82 77 00 18 75 F9 13 2A 16 18 09 00 77 00 08 76 F9 13 2A 16 16 
      if (!aReverse) {                                                          //003E : 07 74 00 81 2D 00 90 75 F9 13 16 
        mOriginalLocation = aInstigator.Location;                               //0049 : 0F 01 80 76 F9 13 19 00 18 75 F9 13 05 00 0C 01 30 81 6C 0F 
        mTargetLocation = ile.AbsPosition;                                      //005D : 0F 01 F8 76 F9 13 19 00 08 76 F9 13 05 00 0C 01 00 51 32 13 
      } else {                                                                  //0071 : 06 7F 00 
        mTargetLocation = mOriginalLocation;                                    //0074 : 0F 01 F8 76 F9 13 01 80 76 F9 13 
      }
      aInstigator.sv_MoveTo(mTargetLocation,None,DistanceBeforeSnap);           //007F : 19 00 18 75 F9 13 11 00 00 1C 40 55 18 11 01 F8 76 F9 13 2A 01 28 73 F9 13 16 
    }
    //1C 60 AF 32 13 00 A0 73 F9 13 00 18 75 F9 13 2D 00 90 75 F9 13 16 0F 00 08 76 F9 13 2E F8 C7 5C 
    //01 00 A0 73 F9 13 07 99 00 82 77 00 18 75 F9 13 2A 16 18 09 00 77 00 08 76 F9 13 2A 16 16 07 74 
    //00 81 2D 00 90 75 F9 13 16 0F 01 80 76 F9 13 19 00 18 75 F9 13 05 00 0C 01 30 81 6C 0F 0F 01 F8 
    //76 F9 13 19 00 08 76 F9 13 05 00 0C 01 00 51 32 13 06 7F 00 0F 01 F8 76 F9 13 01 80 76 F9 13 19 
    //00 18 75 F9 13 11 00 00 1C 40 55 18 11 01 F8 76 F9 13 2A 01 28 73 F9 13 16 04 0B 47 
  }



