//==============================================================================
//  EV_Emote
//==============================================================================

class EV_Emote extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Emotes)
  ;

  var (Action) byte Emote;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    aObject.Emotes.sv_PlayContentEmote(Emote);                                  //0000 : 19 19 00 C0 02 00 14 05 00 04 01 F0 51 18 11 0B 00 00 1C 90 B7 2A 11 01 90 03 00 14 16 
    //19 19 00 C0 02 00 14 05 00 04 01 F0 51 18 11 0B 00 00 1C 90 B7 2A 11 01 90 03 00 14 16 04 0B 47 
    //
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (aObject.Emotes != None) {                                               //0000 : 07 16 00 77 19 00 80 04 00 14 05 00 04 01 F0 51 18 11 2A 16 
      return True;                                                              //0014 : 04 27 
    }
    return False;                                                               //0016 : 04 28 
    //07 16 00 77 19 00 80 04 00 14 05 00 04 01 F0 51 18 11 2A 16 04 27 04 28 04 0B 47 
  }



