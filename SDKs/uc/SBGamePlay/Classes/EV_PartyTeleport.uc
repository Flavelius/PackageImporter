//==============================================================================
//  EV_PartyTeleport
//==============================================================================

class EV_PartyTeleport extends Content_Event
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_PlayerController,Game_PlayerTeams)
  ;

  var (Action) int TargetWorld;
  var (Action) string portalName;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Team team;
    team = aSubject.GetTeam();                                                  //0000 : 0F 00 B8 51 4C 23 19 00 98 87 A8 22 06 00 04 1B E0 0F 00 00 16 
    if (team == None) {                                                         //0015 : 07 38 00 72 00 B8 51 4C 23 2A 16 
      TeleportPawn(aSubject,TargetWorld,False,portalName);                      //0020 : 1B DB 0F 00 00 00 98 87 A8 22 01 50 50 4C 23 28 01 C8 50 4C 23 16 
      return;                                                                   //0036 : 04 0B 
    }
    Game_PlayerController(aSubject.Controller).GroupingTeams.sv_StartPartyTravel(TargetWorld,portalName);//0038 : 19 19 2E 90 18 5B 01 19 00 98 87 A8 22 05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 10 00 00 1B 14 10 00 00 01 50 50 4C 23 01 C8 50 4C 23 16 
    //0F 00 B8 51 4C 23 19 00 98 87 A8 22 06 00 04 1B E0 0F 00 00 16 07 38 00 72 00 B8 51 4C 23 2A 16 
    //1B DB 0F 00 00 00 98 87 A8 22 01 50 50 4C 23 28 01 C8 50 4C 23 16 04 0B 19 19 2E 90 18 5B 01 19 
    //00 98 87 A8 22 05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 10 00 00 1B 14 10 00 00 01 50 50 
    //4C 23 01 C8 50 4C 23 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



