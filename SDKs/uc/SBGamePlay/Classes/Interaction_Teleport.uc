//==============================================================================
//  Interaction_Teleport
//==============================================================================

class Interaction_Teleport extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Interaction_Teleport) int DestinationWorld;
  var (Interaction_Teleport) string Parameter;
  var (Interaction_Teleport) bool IsInstance;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 60 11 F9 13 00 50 12 F9 13 16 
    if (!aReverse) {                                                            //0010 : 07 36 00 81 2D 00 C8 12 F9 13 16 
      TeleportPawn(aInstigator,DestinationWorld,IsInstance,Parameter);          //001B : 1B DB 0F 00 00 00 50 12 F9 13 01 E8 10 F9 13 2D 01 40 13 F9 13 01 B8 13 F9 13 16 
    }
    //1C 60 AF 32 13 00 60 11 F9 13 00 50 12 F9 13 16 07 36 00 81 2D 00 C8 12 F9 13 16 1B DB 0F 00 00 
    //00 50 12 F9 13 01 E8 10 F9 13 2D 01 40 13 F9 13 01 B8 13 F9 13 16 04 0B 47 
  }



