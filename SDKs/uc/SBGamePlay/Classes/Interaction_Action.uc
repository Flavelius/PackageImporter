//==============================================================================
//  Interaction_Action
//==============================================================================

class Interaction_Action extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Content_Event)
  ;

  var (Interaction_Action) editinline array<Content_Event> Actions;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local int aI;
    local bool doExecute;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 70 69 F9 13 00 48 6B F9 13 16 
    if (!aReverse) {                                                            //0010 : 07 E0 00 81 2D 00 C0 6B F9 13 16 
      doExecute = True;                                                         //001B : 14 2D 00 38 6C F9 13 27 
      aI = 0;                                                                   //0023 : 0F 00 B0 6C F9 13 25 
      while (aI < Actions.Length) {                                             //002A : 07 86 00 96 00 B0 6C F9 13 37 01 F8 68 F9 13 16 
        if (Actions[aI] != None
          && !Actions[aI].sv_CanExecute(aInstigator,aInstigator)) {//003A : 07 7C 00 82 77 10 00 B0 6C F9 13 01 F8 68 F9 13 2A 16 18 22 00 81 19 10 00 B0 6C F9 13 01 F8 68 F9 13 10 00 04 1B 22 0C 00 00 00 48 6B F9 13 00 48 6B F9 13 16 16 16 
          doExecute = False;                                                    //0071 : 14 2D 00 38 6C F9 13 28 
          goto jl0086;                                                          //0079 : 06 86 00 
        }
        aI++;                                                                   //007C : A5 00 B0 6C F9 13 16 
      }
      if (doExecute) {                                                          //0086 : 07 E0 00 2D 00 38 6C F9 13 
        aI = 0;                                                                 //008F : 0F 00 B0 6C F9 13 25 
        while (aI < Actions.Length) {                                           //0096 : 07 E0 00 96 00 B0 6C F9 13 37 01 F8 68 F9 13 16 
          if (Actions[aI] != None) {                                            //00A6 : 07 D6 00 77 10 00 B0 6C F9 13 01 F8 68 F9 13 2A 16 
            Actions[aI].sv_Execute(aInstigator,aInstigator);                    //00B7 : 19 10 00 B0 6C F9 13 01 F8 68 F9 13 10 00 00 1B 23 0C 00 00 00 48 6B F9 13 00 48 6B F9 13 16 
          }
          aI++;                                                                 //00D6 : A5 00 B0 6C F9 13 16 
        }
      }
    }
    //1C 60 AF 32 13 00 70 69 F9 13 00 48 6B F9 13 16 07 E0 00 81 2D 00 C0 6B F9 13 16 14 2D 00 38 6C 
    //F9 13 27 0F 00 B0 6C F9 13 25 07 86 00 96 00 B0 6C F9 13 37 01 F8 68 F9 13 16 07 7C 00 82 77 10 
    //00 B0 6C F9 13 01 F8 68 F9 13 2A 16 18 22 00 81 19 10 00 B0 6C F9 13 01 F8 68 F9 13 10 00 04 1B 
    //22 0C 00 00 00 48 6B F9 13 00 48 6B F9 13 16 16 16 14 2D 00 38 6C F9 13 28 06 86 00 A5 00 B0 6C 
    //F9 13 16 06 2A 00 07 E0 00 2D 00 38 6C F9 13 0F 00 B0 6C F9 13 25 07 E0 00 96 00 B0 6C F9 13 37 
    //01 F8 68 F9 13 16 07 D6 00 77 10 00 B0 6C F9 13 01 F8 68 F9 13 2A 16 19 10 00 B0 6C F9 13 01 F8 
    //68 F9 13 10 00 00 1B 23 0C 00 00 00 48 6B F9 13 00 48 6B F9 13 16 A5 00 B0 6C F9 13 16 06 96 00 
    //04 0B 47 
  }



