//==============================================================================
//  NA_Invisible
//==============================================================================

class NA_Invisible extends NPC_Appearance
    collapsecategories
    editinlinenew
    dependsOn()
  ;


  function Game_Appearance CreateAndApply(Game_Pawn aPawn,export editinline Game_Appearance aAppearance) {
    aPawn.bHidden = True;                                                       //0000 : 14 19 00 C8 67 87 22 06 00 04 2D 01 48 5E 6E 0F 27 
    aPawn.SetDrawType(0);                                                       //0011 : 19 00 C8 67 87 22 08 00 00 1C 48 93 6B 0F 24 00 16 
    return aAppearance;                                                         //0022 : 04 00 78 B9 6A 22 
    //14 19 00 C8 67 87 22 06 00 04 2D 01 48 5E 6E 0F 27 19 00 C8 67 87 22 08 00 00 1C 48 93 6B 0F 24 
    //00 16 04 00 78 B9 6A 22 04 0B 47 
  }



