//==============================================================================
//  Content_Event
//==============================================================================

class Content_Event extends Content_Type
    native
    abstract
    collapsecategories
    editinlinenew
    dependsOn()
  ;


  native function GetActorRelations(Actor aSource,out array<ActorRelation> oRelations);


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    //04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



