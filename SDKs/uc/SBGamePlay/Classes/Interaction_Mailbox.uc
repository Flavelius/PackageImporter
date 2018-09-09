//==============================================================================
//  Interaction_Mailbox
//==============================================================================

class Interaction_Mailbox extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_PlayerController,Player,GUI_BaseDesktop,Class,InteractiveLevelElement)
  ;


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 20 38 F9 13 00 78 39 F9 13 2D 00 F0 39 F9 13 16 
    if (aInstigator != None) {                                                  //0016 : 07 82 00 77 00 78 39 F9 13 2A 16 
      if (!aReverse) {                                                          //0021 : 07 82 00 81 2D 00 F0 39 F9 13 16 
        if (aInstigator.IsLocalPlayer()) {                                      //002C : 07 82 00 19 00 78 39 F9 13 06 00 04 1C 18 1A 76 0F 16 
          Game_PlayerController(aInstigator.Controller).Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.52,Class'GUI_BaseDesktop'.1);//003E : 19 19 19 2E 90 18 5B 01 19 00 78 39 F9 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 34 12 20 00 68 D7 00 01 00 04 26 16 
        }
      }
    }
    //1C 78 A8 32 13 00 20 38 F9 13 00 78 39 F9 13 2D 00 F0 39 F9 13 16 07 82 00 77 00 78 39 F9 13 2A 
    //16 07 82 00 81 2D 00 F0 39 F9 13 16 07 82 00 19 00 78 39 F9 13 06 00 04 1C 18 1A 76 0F 16 19 19 
    //19 2E 90 18 5B 01 19 00 78 39 F9 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 
    //90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 34 12 20 00 68 D7 00 01 00 04 
    //26 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 68 3A F9 13 00 78 3B F9 13 2D 00 F0 3B F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 68 3C F9 13 2E F8 C7 5C 01 00 68 3A F9 13 
    if (ile != None) {                                                          //0026 : 07 4B 00 77 00 68 3C F9 13 2A 16 
      if (!aReverse) {                                                          //0031 : 07 4B 00 81 2D 00 F0 3B F9 13 16 
        ile.sv_StartClientSubAction();                                          //003C : 19 00 68 3C F9 13 06 00 00 1B C3 0F 00 00 16 
      }
    }
    //1C 60 AF 32 13 00 68 3A F9 13 00 78 3B F9 13 2D 00 F0 3B F9 13 16 0F 00 68 3C F9 13 2E F8 C7 5C 
    //01 00 68 3A F9 13 07 4B 00 77 00 68 3C F9 13 2A 16 07 4B 00 81 2D 00 F0 3B F9 13 16 19 00 68 3C 
    //F9 13 06 00 00 1B C3 0F 00 00 16 04 0B 47 
  }



