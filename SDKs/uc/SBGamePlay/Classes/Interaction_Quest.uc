//==============================================================================
//  Interaction_Quest
//==============================================================================

class Interaction_Quest extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Controller,Class,Content_Type,InteractiveLevelElement)
  ;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 D8 08 F9 13 00 28 0A F9 13 16 
    if (aInstigator != None) {                                                  //0010 : 07 79 00 77 00 28 0A F9 13 2A 16 
      if (!aReverse) {                                                          //001B : 07 79 00 81 2D 00 A0 0A F9 13 16 
        ile = InteractiveLevelElement(aOwner);                                  //0026 : 0F 00 18 0B F9 13 2E F8 C7 5C 01 00 D8 08 F9 13 
        Game_Controller(aInstigator.Controller).sv_FireHook(Class'Content_Type'.3,ile,ile.GetActiveMenuOption(aInstigator));//0036 : 19 2E 10 0E 5B 01 19 00 28 0A F9 13 05 00 04 01 00 6E 6C 0F 2C 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 03 00 18 0B F9 13 39 3A 19 00 18 0B F9 13 0B 00 01 1B 64 10 00 00 00 28 0A F9 13 16 16 
      }
    }
    //1C 60 AF 32 13 00 D8 08 F9 13 00 28 0A F9 13 16 07 79 00 77 00 28 0A F9 13 2A 16 07 79 00 81 2D 
    //00 A0 0A F9 13 16 0F 00 18 0B F9 13 2E F8 C7 5C 01 00 D8 08 F9 13 19 2E 10 0E 5B 01 19 00 28 0A 
    //F9 13 05 00 04 01 00 6E 6C 0F 2C 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 03 00 18 0B 
    //F9 13 39 3A 19 00 18 0B F9 13 0B 00 01 1B 64 10 00 00 00 28 0A F9 13 16 16 04 0B 47 
  }



