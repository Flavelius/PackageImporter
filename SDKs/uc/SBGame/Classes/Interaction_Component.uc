//==============================================================================
//  Interaction_Component
//==============================================================================

class Interaction_Component extends Content_API
    native
    dependsOn()
  ;

  var (Interaction) bool Reverse;
  var transient bool mCancel;


  function ClOnCancel(Game_Actor aOwner,Game_Pawn aInstigator) {
    //04 0B 47 
  }


  function ClOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    //04 0B 47 
  }


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    mCancel = False;                                                            //0000 : 14 2D 01 20 AC 32 13 28 
    //14 2D 01 20 AC 32 13 28 04 0B 47 
  }


  event SvOnCancel(Game_Actor aOwner,Game_Pawn aInstigator) {
    mCancel = True;                                                             //0000 : 14 2D 01 20 AC 32 13 27 
    //14 2D 01 20 AC 32 13 27 04 0B 47 
  }


  event SvOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    //04 0B 47 
  }


  event SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,optional bool aReverse) {
    mCancel = False;                                                            //0000 : 14 2D 01 20 AC 32 13 28 
    //14 2D 01 20 AC 32 13 28 04 0B 47 
  }



