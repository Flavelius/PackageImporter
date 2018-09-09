//==============================================================================
//  EV_SetFaction
//==============================================================================

class EV_SetFaction extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Character)
  ;

  var (Action) const export editinline NPC_Taxonomy DesiredFaction;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (aSubject != None) {                                                     //0000 : 07 2B 00 77 00 70 81 FF 13 2A 16 
      aSubject.Character.sv_SetFaction(DesiredFaction);                         //000B : 19 19 00 70 81 FF 13 05 00 04 01 68 2E 34 0F 0B 00 00 1B 32 07 00 00 01 E8 81 FF 13 16 
    } else {                                                                    //0028 : 06 48 00 
      aObject.Character.sv_SetFaction(DesiredFaction);                          //002B : 19 19 00 68 80 FF 13 05 00 04 01 68 2E 34 0F 0B 00 00 1B 32 07 00 00 01 E8 81 FF 13 16 
    }
    //07 2B 00 77 00 70 81 FF 13 2A 16 19 19 00 70 81 FF 13 05 00 04 01 68 2E 34 0F 0B 00 00 1B 32 07 
    //00 00 01 E8 81 FF 13 16 06 48 00 19 19 00 68 80 FF 13 05 00 04 01 68 2E 34 0F 0B 00 00 1B 32 07 
    //00 00 01 E8 81 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return aSubject != None || aObject != None;                                 //0000 : 04 84 77 00 28 83 FF 13 2A 16 18 09 00 77 00 60 82 FF 13 2A 16 16 
    //04 84 77 00 28 83 FF 13 2A 16 18 09 00 77 00 60 82 FF 13 2A 16 16 04 0B 47 
  }



