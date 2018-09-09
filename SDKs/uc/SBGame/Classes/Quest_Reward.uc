//==============================================================================
//  Quest_Reward
//==============================================================================

class Quest_Reward extends Content_Type
    native
    abstract
    collapsecategories
    editinlinenew
    dependsOn()
  ;


  function string GetText() {
    return "Unknown reward";                                                    //0000 : 04 1F 55 6E 6B 6E 6F 77 6E 20 72 65 77 61 72 64 00 
    //04 1F 55 6E 6B 6E 6F 77 6E 20 72 65 77 61 72 64 00 04 0B 47 
  }


  final native function bool sv_CanObtain(Game_Pawn aPawn);


  final native function sv_OnObtain(Game_Pawn aPawn);



