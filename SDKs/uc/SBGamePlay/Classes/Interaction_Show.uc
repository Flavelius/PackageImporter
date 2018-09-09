//==============================================================================
//  Interaction_Show
//==============================================================================

class Interaction_Show extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(InteractiveLevelElement)
  ;

  var (Interaction_Show) bool Show;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 E8 20 F9 13 00 20 22 F9 13 2D 00 98 22 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 10 23 F9 13 2E F8 C7 5C 01 00 E8 20 F9 13 
    if (ile != None) {                                                          //0026 : 07 6B 00 77 00 10 23 F9 13 2A 16 
      if (!aReverse) {                                                          //0031 : 07 54 00 81 2D 00 98 22 F9 13 16 
        ile.sv_Show(Show);                                                      //003C : 19 00 10 23 F9 13 0C 00 00 1B F8 0F 00 00 2D 01 70 20 F9 13 16 
      } else {                                                                  //0051 : 06 6B 00 
        ile.sv_Show(!Show);                                                     //0054 : 19 00 10 23 F9 13 0E 00 00 1B F8 0F 00 00 81 2D 01 70 20 F9 13 16 16 
      }
    }
    //1C 60 AF 32 13 00 E8 20 F9 13 00 20 22 F9 13 2D 00 98 22 F9 13 16 0F 00 10 23 F9 13 2E F8 C7 5C 
    //01 00 E8 20 F9 13 07 6B 00 77 00 10 23 F9 13 2A 16 07 54 00 81 2D 00 98 22 F9 13 16 19 00 10 23 
    //F9 13 0C 00 00 1B F8 0F 00 00 2D 01 70 20 F9 13 16 06 6B 00 19 00 10 23 F9 13 0E 00 00 1B F8 0F 
    //00 00 81 2D 01 70 20 F9 13 16 16 04 0B 47 
  }



