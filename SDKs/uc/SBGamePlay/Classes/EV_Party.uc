//==============================================================================
//  EV_Party
//==============================================================================

class EV_Party extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Content_Requirement,Game_Pawn,Game_Team)
  ;

  var (Action) const editinline float Range;
  var (Action) const editinline array<Content_Requirement> Requirements;
  var (Action) const export editinline Content_Event PartyAction;


  protected function bool MeetsRequirements(Game_Pawn aPawn) {
    local int ri;
    ri = 0;                                                                     //0000 : 0F 00 68 36 FF 13 25 
    while (ri < Requirements.Length) {                                          //0007 : 07 55 00 96 00 68 36 FF 13 37 01 E0 36 FF 13 16 
      if (Requirements[ri] != None
        && !Requirements[ri].CheckPawn(aPawn)) {//0017 : 07 4B 00 82 77 10 00 68 36 FF 13 01 E0 36 FF 13 2A 16 18 1D 00 81 19 10 00 68 36 FF 13 01 E0 36 FF 13 0B 00 04 1C 90 E6 2B 11 00 48 35 FF 13 16 16 16 
        return False;                                                           //0049 : 04 28 
      }
      ri++;                                                                     //004B : A5 00 68 36 FF 13 16 
    }
    return True;                                                                //0055 : 04 27 
    //0F 00 68 36 FF 13 25 07 55 00 96 00 68 36 FF 13 37 01 E0 36 FF 13 16 07 4B 00 82 77 10 00 68 36 
    //FF 13 01 E0 36 FF 13 2A 16 18 1D 00 81 19 10 00 68 36 FF 13 01 E0 36 FF 13 0B 00 04 1C 90 E6 2B 
    //11 00 48 35 FF 13 16 16 16 04 28 A5 00 68 36 FF 13 16 06 07 00 04 27 04 0B 47 
  }


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Team team;
    local Game_Pawn teamMember;
    local int ti;
    if (MeetsRequirements(aSubject)) {                                          //0000 : 07 27 00 1B DA 6F 00 00 00 B0 3A FF 13 16 
      PartyAction.sv_Execute(aObject,aSubject);                                 //000E : 19 01 28 3B FF 13 10 00 00 1B 23 0C 00 00 00 80 38 FF 13 00 B0 3A FF 13 16 
    }
    team = aSubject.GetTeam();                                                  //0027 : 0F 00 A0 3B FF 13 19 00 B0 3A FF 13 06 00 04 1B E0 0F 00 00 16 
    if (team != None) {                                                         //003C : 07 1C 01 77 00 A0 3B FF 13 2A 16 
      ti = 0;                                                                   //0047 : 0F 00 18 3C FF 13 25 
      while (ti < team.mMembers.Length) {                                       //004E : 07 1C 01 96 00 18 3C FF 13 37 19 00 A0 3B FF 13 05 00 00 01 10 C1 27 11 16 
        teamMember = team.mMembers[ti];                                         //0067 : 0F 00 90 3C FF 13 10 00 18 3C FF 13 19 00 A0 3B FF 13 05 00 00 01 10 C1 27 11 
        if (teamMember != aSubject
          && (Range < 0
          || VSize(teamMember.Location - aSubject.Location) <= Range)
          && MeetsRequirements(teamMember)
          && PartyAction.sv_CanExecute(aObject,aSubject)) {//0081 : 07 12 01 82 82 82 77 00 90 3C FF 13 00 B0 3A FF 13 16 18 37 00 84 B0 01 08 3D FF 13 39 3F 25 16 18 28 00 B2 E1 D8 19 00 90 3C FF 13 05 00 0C 01 30 81 6C 0F 19 00 B0 3A FF 13 05 00 0C 01 30 81 6C 0F 16 16 01 08 3D FF 13 16 16 16 18 0C 00 1B DA 6F 00 00 00 90 3C FF 13 16 16 18 1A 00 19 01 28 3B FF 13 10 00 04 1B 22 0C 00 00 00 80 38 FF 13 00 B0 3A FF 13 16 16 
          PartyAction.sv_Execute(aObject,teamMember);                           //00F9 : 19 01 28 3B FF 13 10 00 00 1B 23 0C 00 00 00 80 38 FF 13 00 90 3C FF 13 16 
        }
        ti++;                                                                   //0112 : A5 00 18 3C FF 13 16 
      }
    }
    //07 27 00 1B DA 6F 00 00 00 B0 3A FF 13 16 19 01 28 3B FF 13 10 00 00 1B 23 0C 00 00 00 80 38 FF 
    //13 00 B0 3A FF 13 16 0F 00 A0 3B FF 13 19 00 B0 3A FF 13 06 00 04 1B E0 0F 00 00 16 07 1C 01 77 
    //00 A0 3B FF 13 2A 16 0F 00 18 3C FF 13 25 07 1C 01 96 00 18 3C FF 13 37 19 00 A0 3B FF 13 05 00 
    //00 01 10 C1 27 11 16 0F 00 90 3C FF 13 10 00 18 3C FF 13 19 00 A0 3B FF 13 05 00 00 01 10 C1 27 
    //11 07 12 01 82 82 82 77 00 90 3C FF 13 00 B0 3A FF 13 16 18 37 00 84 B0 01 08 3D FF 13 39 3F 25 
    //16 18 28 00 B2 E1 D8 19 00 90 3C FF 13 05 00 0C 01 30 81 6C 0F 19 00 B0 3A FF 13 05 00 0C 01 30 
    //81 6C 0F 16 16 01 08 3D FF 13 16 16 16 18 0C 00 1B DA 6F 00 00 00 90 3C FF 13 16 16 18 1A 00 19 
    //01 28 3B FF 13 10 00 04 1B 22 0C 00 00 00 80 38 FF 13 00 B0 3A FF 13 16 16 19 01 28 3B FF 13 10 
    //00 00 1B 23 0C 00 00 00 80 38 FF 13 00 90 3C FF 13 16 A5 00 18 3C FF 13 16 06 4E 00 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (PartyAction == None) {                                                  //0000 : 07 0D 00 72 01 28 3B FF 13 2A 16 
      return False;                                                             //000B : 04 28 
    }
    if (aSubject == None) {                                                     //000D : 07 1A 00 72 00 78 3E FF 13 2A 16 
      return False;                                                             //0018 : 04 28 
    }
    if (!PartyAction.sv_CanExecute(aSubject,aObject)) {                         //001A : 07 3A 00 81 19 01 28 3B FF 13 10 00 04 1B 22 0C 00 00 00 78 3E FF 13 00 80 3D FF 13 16 16 
      return False;                                                             //0038 : 04 28 
    }
    return True;                                                                //003A : 04 27 
    //07 0D 00 72 01 28 3B FF 13 2A 16 04 28 07 1A 00 72 00 78 3E FF 13 2A 16 04 28 07 3A 00 81 19 01 
    //28 3B FF 13 10 00 04 1B 22 0C 00 00 00 78 3E FF 13 00 80 3D FF 13 16 16 04 28 04 27 04 0B 47 
  }



