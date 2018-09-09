//==============================================================================
//  Interaction_ShowTutorial
//==============================================================================

class Interaction_ShowTutorial extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_PlayerController,Game_GUI,Help_Article)
  ;

  var (Action) const export editinline Help_Article Article;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 B8 1D F9 13 00 30 1E F9 13 2D 00 A8 1E F9 13 16 
    if (!aReverse) {                                                            //0016 : 07 56 00 81 2D 00 A8 1E F9 13 16 
      Game_PlayerController(aInstigator.Controller).GUI.sv2cl_ShowTutorial_CallStub(Article.GetResourceId());//0021 : 19 19 2E 90 18 5B 01 19 00 30 1E F9 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 15 00 00 1B 19 10 00 00 19 01 40 1D F9 13 06 00 04 1C 08 90 20 11 16 16 
    }
    //1C 60 AF 32 13 00 B8 1D F9 13 00 30 1E F9 13 2D 00 A8 1E F9 13 16 07 56 00 81 2D 00 A8 1E F9 13 
    //16 19 19 2E 90 18 5B 01 19 00 30 1E F9 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 15 00 
    //00 1B 19 10 00 00 19 01 40 1D F9 13 06 00 04 1C 08 90 20 11 16 16 04 0B 47 
  }



