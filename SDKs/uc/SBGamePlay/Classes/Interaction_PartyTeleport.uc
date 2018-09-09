//==============================================================================
//  Interaction_PartyTeleport
//==============================================================================

class Interaction_PartyTeleport extends Interaction_Component
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_PlayerController,Game_PlayerTeams)
  ;

  var (Interaction_PartyTeleport) int TargetWorld;
  var (Interaction_PartyTeleport) string portalName;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local Game_Team team;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 88 B8 6A 22 00 88 32 3D 23 16 
    if (!aReverse) {                                                            //0010 : 07 83 00 81 2D 00 00 B9 6A 22 16 
      team = aInstigator.GetTeam();                                             //001B : 0F 00 40 68 87 22 19 00 88 32 3D 23 06 00 04 1B E0 0F 00 00 16 
      if (team == None) {                                                       //0030 : 07 53 00 72 00 40 68 87 22 2A 16 
        TeleportPawn(aInstigator,TargetWorld,False,portalName);                 //003B : 1B DB 0F 00 00 00 88 32 3D 23 01 D8 4F 4C 23 28 01 60 4F 4C 23 16 
        return;                                                                 //0051 : 04 0B 
      }
      Game_PlayerController(aInstigator.Controller).GroupingTeams.sv_StartPartyTravel(TargetWorld,portalName);//0053 : 19 19 2E 90 18 5B 01 19 00 88 32 3D 23 05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 10 00 00 1B 14 10 00 00 01 D8 4F 4C 23 01 60 4F 4C 23 16 
    }
    //1C 60 AF 32 13 00 88 B8 6A 22 00 88 32 3D 23 16 07 83 00 81 2D 00 00 B9 6A 22 16 0F 00 40 68 87 
    //22 19 00 88 32 3D 23 06 00 04 1B E0 0F 00 00 16 07 53 00 72 00 40 68 87 22 2A 16 1B DB 0F 00 00 
    //00 88 32 3D 23 01 D8 4F 4C 23 28 01 60 4F 4C 23 16 04 0B 19 19 2E 90 18 5B 01 19 00 88 32 3D 23 
    //05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 10 00 00 1B 14 10 00 00 01 D8 4F 4C 23 01 60 4F 
    //4C 23 16 04 0B 47 
  }



