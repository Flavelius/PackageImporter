//==============================================================================
//  Interaction_Enable
//==============================================================================

class Interaction_Enable extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(InteractiveLevelElement)
  ;

  var (Interaction_Enable) bool Enabled;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,optional bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 A8 58 F9 13 00 20 59 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0010 : 0F 00 98 59 F9 13 2E F8 C7 5C 01 00 A8 58 F9 13 
    if (ile != None) {                                                          //0020 : 07 65 00 77 00 98 59 F9 13 2A 16 
      if (!aReverse) {                                                          //002B : 07 4E 00 81 2D 00 10 5A F9 13 16 
        ile.sv_SetEnabled(Enabled);                                             //0036 : 19 00 98 59 F9 13 0C 00 00 1B 96 0C 00 00 2D 01 30 58 F9 13 16 
      } else {                                                                  //004B : 06 65 00 
        ile.sv_SetEnabled(!Enabled);                                            //004E : 19 00 98 59 F9 13 0E 00 00 1B 96 0C 00 00 81 2D 01 30 58 F9 13 16 16 
      }
    }
    //1C 60 AF 32 13 00 A8 58 F9 13 00 20 59 F9 13 16 0F 00 98 59 F9 13 2E F8 C7 5C 01 00 A8 58 F9 13 
    //07 65 00 77 00 98 59 F9 13 2A 16 07 4E 00 81 2D 00 10 5A F9 13 16 19 00 98 59 F9 13 0C 00 00 1B 
    //96 0C 00 00 2D 01 30 58 F9 13 16 06 65 00 19 00 98 59 F9 13 0E 00 00 1B 96 0C 00 00 81 2D 01 30 
    //58 F9 13 16 16 04 0B 47 
  }



