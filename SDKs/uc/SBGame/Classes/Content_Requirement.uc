//==============================================================================
//  Content_Requirement
//==============================================================================

class Content_Requirement extends Content_Type
    native
    abstract
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var int ControlLocationX;
  var int ControlLocationY;
  var transient int ControlRef;
  var bool ValidForPlayer;
  var bool ValidForRelevant;


  event string ToString();


  native function GetActorRelations(Actor aSource,out array<ActorRelation> oRelations);


  final native function bool cl_IsValidFor(Game_Pawn aPawn);


  final native function bool CheckPawn(Game_Pawn aPawn);



