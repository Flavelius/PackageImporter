//==============================================================================
//  EV_ShowTutorial
//==============================================================================

class EV_ShowTutorial extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_PlayerController,Game_GUI,Help_Article)
  ;

  var (Action) const export editinline Help_Article Article;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    Game_PlayerController(aSubject.Controller).GUI.sv2cl_ShowTutorial_CallStub(Article.GetResourceId());//0000 : 19 19 2E 90 18 5B 01 19 00 48 1B FC 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 15 00 00 1B 19 10 00 00 19 01 C0 1B FC 13 06 00 04 1C 08 90 20 11 16 16 
    //19 19 2E 90 18 5B 01 19 00 48 1B FC 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 15 00 00 
    //1B 19 10 00 00 19 01 C0 1B FC 13 06 00 04 1C 08 90 20 11 16 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



