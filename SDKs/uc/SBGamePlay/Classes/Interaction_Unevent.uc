//==============================================================================
//  Interaction_Unevent
//==============================================================================

class Interaction_Unevent extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Actor)
  ;

  var (Interaction_Unevent) name EventTag;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 C8 4D F9 13 00 F0 4E F9 13 2D 00 68 4F F9 13 16 
    if (!aReverse) {                                                            //0016 : 07 42 00 81 2D 00 68 4F F9 13 16 
      aOwner.UntriggerEvent(EventTag,aOwner,aInstigator);                       //0021 : 19 00 C8 4D F9 13 15 00 00 1C 80 AF 34 0F 01 50 4D F9 13 00 C8 4D F9 13 00 F0 4E F9 13 16 
    } else {                                                                    //003F : 06 60 00 
      aOwner.TriggerEvent(EventTag,aOwner,aInstigator);                         //0042 : 19 00 C8 4D F9 13 15 00 00 1C F8 B1 34 0F 01 50 4D F9 13 00 C8 4D F9 13 00 F0 4E F9 13 16 
    }
    //1C 60 AF 32 13 00 C8 4D F9 13 00 F0 4E F9 13 2D 00 68 4F F9 13 16 07 42 00 81 2D 00 68 4F F9 13 
    //16 19 00 C8 4D F9 13 15 00 00 1C 80 AF 34 0F 01 50 4D F9 13 00 C8 4D F9 13 00 F0 4E F9 13 16 06 
    //60 00 19 00 C8 4D F9 13 15 00 00 1C F8 B1 34 0F 01 50 4D F9 13 00 C8 4D F9 13 00 F0 4E F9 13 16 
    //04 0B 47 
  }



