//==============================================================================
//  Game_PlayerTeams
//==============================================================================

class Game_PlayerTeams extends Base_Component within Game_PlayerController
    native
    dependsOn(Game_PlayerController,Game_Team,Game_Pawn,Game_CombatStats,Game_PlayerPawn,Actor,Game_GameServer,Game_GUI,Game_TeamMember,Game_ShiftableAppearance,Game_PlayerAppearance,SBDBSync,Game_CharacterStats,Game_Skills,LevelInfo,Loot_Transaction,StringReferences,Player,Game_Desktop,EventNotification,GUI_BaseDesktop)
  ;

  const NOTIFY_HUD_CLOSE_ALL =  0;
  const NOTIFY_HUD_DISBAND =  3;
  const NOTIFY_HUD_KICK =  2;
  const NOTIFY_HUD_INVITE_REQ =  1;
  const TEAM_MEMBER_INFO_BASE_RATE =  10;
  const TEAM_MEMBER_INFO_UPDATE_TIME =  1.0f;
  enum eTeamRequestResult {
    TRR_NONE ,
    TRR_ACCEPT ,
    TRR_DECLINE ,
    TRR_BUSY ,
    TRR_FULL ,
    TRR_INVITE_SUCCESS ,
    TRR_MEMBER_IN_OTHER_TEAM ,
    TRR_MEMBER_ON_TRAVELING ,
    TRR_SELF_INVITE ,
    TRR_INSUFFICIENT_RIGHTS ,
    TRR_IGNORED_ME ,
    TRR_UNKNOWN_CHARACTER ,
    TRR_UNKNOWN_MEMBER_WORLD ,
    TRR_UNKNOWN_TEAM ,
    TRR_EMPTY_TEAM ,
    TRR_CREATE_FAILED ,
    TRR_INCORRECT_INVITER ,
    TRR_KICK_FAILED ,
    TRR_LEAVE_FAILED ,
    TRR_DISBAND_FAILED ,
    TRR_CHANGE_LEADER_FAILED ,
    TRR_CHANGE_LOOTMODE_FAILED ,
    TRR_GET_TEAM_INFO_FAILED 
  };

  enum eTeamRemoveMemberCode {
    TRMC_NONE ,
    TRMC_KICK ,
    TRMC_LEAVE ,
    TRMC_OFFLINE ,
    TRMC_DISBAND 
  };

  var int mTeamID;
  var byte mLootMode;
  var array<Game_TeamMember> mTeamMembers;
  var Game_Team mTeam;
  var EventNotification mTeamChanged;
  var int mLeaderID;
  var private int mLastTeamMemberInfoBase;
  var private float mLastTeamMemberInfoUpdate;
  var private array<byte> mLastLodData;
  var private float mPartyTravelTimeout;
  var private int mPartyTravelTargetWorld;
  var private string mPartyTravelPortalName;
  var bool mPartyTravelInProgress;
  var bool mIsJoiningPartyTravel;
  var (null);
  var (null);
  var (null);


  native function bool IsTeamLeader();


  native function bool InTeamWith(Game_Pawn aPawn);


  function sv_GetCreditTeam(out array<Game_Pawn> aMembers,Vector aCenterLocation) {
    local int ti;
    local Game_Pawn ownPawn;
    local Game_Pawn teamPawn;
    ownPawn = Game_Pawn(Outer.Pawn);                                            //0000 : 0F 00 A8 BF 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    aMembers.Length = 0;                                                        //0019 : 0F 37 00 A0 BD 27 11 25 
    if (mTeam != None) {                                                        //0021 : 07 F5 00 77 01 20 C0 27 11 2A 16 
      ti = 0;                                                                   //002C : 0F 00 98 C0 27 11 25 
      while (ti < mTeam.mMembers.Length) {                                      //0033 : 07 F2 00 96 00 98 C0 27 11 37 19 01 20 C0 27 11 05 00 00 01 10 C1 27 11 16 
        teamPawn = mTeam.mMembers[ti];                                          //004C : 0F 00 88 C1 27 11 10 00 98 C0 27 11 19 01 20 C0 27 11 05 00 00 01 10 C1 27 11 
        if (teamPawn == ownPawn) {                                              //0066 : 07 8A 00 72 00 88 C1 27 11 00 A8 BF 27 11 16 
          aMembers[aMembers.Length] = ownPawn;                                  //0075 : 0F 10 37 00 A0 BD 27 11 00 A0 BD 27 11 00 A8 BF 27 11 
        } else {                                                                //0087 : 06 E8 00 
          if (VSize(teamPawn.Location - aCenterLocation) < teamPawn.CombatStats.CreditRange) {//008A : 07 E8 00 B0 E1 D8 19 00 88 C1 27 11 05 00 0C 01 30 81 6C 0F 00 00 C2 27 11 16 16 19 19 00 88 C1 27 11 05 00 04 01 30 41 18 11 05 00 04 01 78 C2 27 11 16 
            if (!Game_PlayerPawn(teamPawn).sv_IsFreeToPlayCapped()) {           //00BD : 07 E8 00 81 19 2E F0 47 5B 01 00 88 C1 27 11 06 00 04 1C 58 E5 7E 0F 16 16 
              aMembers[aMembers.Length] = teamPawn;                             //00D6 : 0F 10 37 00 A0 BD 27 11 00 A0 BD 27 11 00 88 C1 27 11 
            }
          }
        }
        ti++;                                                                   //00E8 : A5 00 98 C0 27 11 16 
      }
    } else {                                                                    //00F2 : 06 02 01 
      aMembers[0] = ownPawn;                                                    //00F5 : 0F 10 25 00 A0 BD 27 11 00 A8 BF 27 11 
    }
    //0F 00 A8 BF 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0F 37 00 A0 BD 27 11 
    //25 07 F5 00 77 01 20 C0 27 11 2A 16 0F 00 98 C0 27 11 25 07 F2 00 96 00 98 C0 27 11 37 19 01 20 
    //C0 27 11 05 00 00 01 10 C1 27 11 16 0F 00 88 C1 27 11 10 00 98 C0 27 11 19 01 20 C0 27 11 05 00 
    //00 01 10 C1 27 11 07 8A 00 72 00 88 C1 27 11 00 A8 BF 27 11 16 0F 10 37 00 A0 BD 27 11 00 A0 BD 
    //27 11 00 A8 BF 27 11 06 E8 00 07 E8 00 B0 E1 D8 19 00 88 C1 27 11 05 00 0C 01 30 81 6C 0F 00 00 
    //C2 27 11 16 16 19 19 00 88 C1 27 11 05 00 04 01 30 41 18 11 05 00 04 01 78 C2 27 11 16 07 E8 00 
    //81 19 2E F0 47 5B 01 00 88 C1 27 11 06 00 04 1C 58 E5 7E 0F 16 16 0F 10 37 00 A0 BD 27 11 00 A0 
    //BD 27 11 00 88 C1 27 11 A5 00 98 C0 27 11 16 06 33 00 06 02 01 0F 10 25 00 A0 BD 27 11 00 A8 BF 
    //27 11 04 0B 47 
  }


  event sv_GetTeamMembersOrSolo(out array<Game_Pawn> oTeam) {
    if (mTeam != None) {                                                        //0000 : 07 22 00 77 01 20 C0 27 11 2A 16 
      oTeam = mTeam.mMembers;                                                   //000B : 0F 00 18 C4 27 11 19 01 20 C0 27 11 05 00 00 01 10 C1 27 11 
    } else {                                                                    //001F : 06 45 00 
      oTeam.Length = 1;                                                         //0022 : 0F 37 00 18 C4 27 11 26 
      oTeam[0] = Game_Pawn(Outer.Pawn);                                         //002A : 0F 10 25 00 18 C4 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    }
    //07 22 00 77 01 20 C0 27 11 2A 16 0F 00 18 C4 27 11 19 01 20 C0 27 11 05 00 00 01 10 C1 27 11 06 
    //45 00 0F 37 00 18 C4 27 11 26 0F 10 25 00 18 C4 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 
    //01 88 83 6C 0F 04 0B 47 
  }


  event sv_GetTeamMembers(out array<Game_Pawn> oTeam) {
    if (mTeam != None) {                                                        //0000 : 07 22 00 77 01 20 C0 27 11 2A 16 
      oTeam = mTeam.mMembers;                                                   //000B : 0F 00 B8 C5 27 11 19 01 20 C0 27 11 05 00 00 01 10 C1 27 11 
    } else {                                                                    //001F : 06 2A 00 
      oTeam.Length = 0;                                                         //0022 : 0F 37 00 B8 C5 27 11 25 
    }
    //07 22 00 77 01 20 C0 27 11 2A 16 0F 00 B8 C5 27 11 19 01 20 C0 27 11 05 00 00 01 10 C1 27 11 06 
    //2A 00 0F 37 00 B8 C5 27 11 25 04 0B 47 
  }


  private event sv_PartyTravel() {
    local array<Game_Pawn> team;
    local Game_PlayerPawn playerPawn;
    local Game_PlayerController PlayerController;
    local int idx;
    local Game_GameServer Engine;
    Engine = Game_GameServer(Class'Actor'.static.GetGameEngine());              //0000 : 0F 00 D8 C9 27 11 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    sv_GetTeamMembersOrSolo(team);                                              //001A : 1B 13 07 00 00 00 C0 C7 27 11 16 
    idx = 0;                                                                    //0025 : 0F 00 50 CA 27 11 25 
    while (idx < team.Length) {                                                 //002C : 07 F0 00 96 00 50 CA 27 11 37 00 C0 C7 27 11 16 
      playerPawn = Game_PlayerPawn(team[idx]);                                  //003C : 0F 00 C8 CA 27 11 2E F0 47 5B 01 10 00 50 CA 27 11 00 C0 C7 27 11 
      PlayerController = Game_PlayerController(playerPawn.Controller);          //0052 : 0F 00 40 CB 27 11 2E 90 18 5B 01 19 00 C8 CA 27 11 05 00 04 01 00 6E 6C 0F 
      if (PlayerController.GroupingTeams.mIsJoiningPartyTravel == True) {       //006B : 07 B2 00 F2 19 19 00 40 CB 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 B8 CB 27 11 27 16 
        Engine.LoginToWorldByID(mPartyTravelTargetWorld,PlayerController.CharacterID,mPartyTravelPortalName,"");//0089 : 19 00 D8 C9 27 11 20 00 04 1B C7 0C 00 00 01 30 CC 27 11 19 00 40 CB 27 11 05 00 04 01 68 3B 19 11 01 A8 CC 27 11 1F 00 16 
      }
      PlayerController.GroupingTeams.mPartyTravelInProgress = False;            //00B2 : 14 19 19 00 40 CB 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 20 CD 27 11 28 
      PlayerController.GroupingTeams.mIsJoiningPartyTravel = False;             //00CC : 14 19 19 00 40 CB 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 B8 CB 27 11 28 
      ++idx;                                                                    //00E6 : A3 00 50 CA 27 11 16 
    }
    mPartyTravelTargetWorld = 0;                                                //00F0 : 0F 01 30 CC 27 11 25 
    mPartyTravelPortalName = "";                                                //00F7 : 0F 01 A8 CC 27 11 1F 00 
    mPartyTravelTimeout = 0.00000000;                                           //00FF : 0F 01 98 CD 27 11 1E 00 00 00 00 
    //0F 00 D8 C9 27 11 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 1B 13 07 00 00 00 
    //C0 C7 27 11 16 0F 00 50 CA 27 11 25 07 F0 00 96 00 50 CA 27 11 37 00 C0 C7 27 11 16 0F 00 C8 CA 
    //27 11 2E F0 47 5B 01 10 00 50 CA 27 11 00 C0 C7 27 11 0F 00 40 CB 27 11 2E 90 18 5B 01 19 00 C8 
    //CA 27 11 05 00 04 01 00 6E 6C 0F 07 B2 00 F2 19 19 00 40 CB 27 11 05 00 04 01 48 C2 18 11 06 00 
    //04 2D 01 B8 CB 27 11 27 16 19 00 D8 C9 27 11 20 00 04 1B C7 0C 00 00 01 30 CC 27 11 19 00 40 CB 
    //27 11 05 00 04 01 68 3B 19 11 01 A8 CC 27 11 1F 00 16 14 19 19 00 40 CB 27 11 05 00 04 01 48 C2 
    //18 11 06 00 04 2D 01 20 CD 27 11 28 14 19 19 00 40 CB 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 
    //01 B8 CB 27 11 28 A3 00 50 CA 27 11 16 06 2C 00 0F 01 30 CC 27 11 25 0F 01 A8 CC 27 11 1F 00 0F 
    //01 98 CD 27 11 1E 00 00 00 00 04 0B 47 
  }


  protected native function sv2cl_CancelPartyTravel_CallStub();


  private event sv2cl_CancelPartyTravel() {
    OnPartyTravelCancel();                                                      //0000 : 43 E8 CF 27 11 DA 05 00 00 16 
    //43 E8 CF 27 11 DA 05 00 00 16 04 0B 47 
  }


  private function sv_CancelPartyTravelForOne() {
    mPartyTravelInProgress = False;                                             //0000 : 14 2D 01 20 CD 27 11 28 
    mIsJoiningPartyTravel = False;                                              //0008 : 14 2D 01 B8 CB 27 11 28 
    sv2cl_CancelPartyTravel_CallStub();                                         //0010 : 1B 2E 0E 00 00 16 
    //14 2D 01 20 CD 27 11 28 14 2D 01 B8 CB 27 11 28 1B 2E 0E 00 00 16 04 0B 47 
  }


  private function sv_CancelPartyTravelForAll() {
    local array<Game_Pawn> team;
    local Game_PlayerPawn playerPawn;
    local Game_PlayerController PlayerController;
    local int idx;
    sv_GetTeamMembersOrSolo(team);                                              //0000 : 1B 13 07 00 00 00 10 D2 27 11 16 
    idx = 0;                                                                    //000B : 0F 00 78 D3 27 11 25 
    while (idx < team.Length) {                                                 //0012 : 07 73 00 96 00 78 D3 27 11 37 00 10 D2 27 11 16 
      playerPawn = Game_PlayerPawn(team[idx]);                                  //0022 : 0F 00 F0 D3 27 11 2E F0 47 5B 01 10 00 78 D3 27 11 00 10 D2 27 11 
      PlayerController = Game_PlayerController(playerPawn.Controller);          //0038 : 0F 00 68 D4 27 11 2E 90 18 5B 01 19 00 F0 D3 27 11 05 00 04 01 00 6E 6C 0F 
      PlayerController.GroupingTeams.sv_CancelPartyTravelForOne();              //0051 : 19 19 00 68 D4 27 11 05 00 04 01 48 C2 18 11 06 00 00 1B AE 0F 00 00 16 
      ++idx;                                                                    //0069 : A3 00 78 D3 27 11 16 
    }
    mPartyTravelTargetWorld = 0;                                                //0073 : 0F 01 30 CC 27 11 25 
    mPartyTravelPortalName = "";                                                //007A : 0F 01 A8 CC 27 11 1F 00 
    mPartyTravelTimeout = 0.00000000;                                           //0082 : 0F 01 98 CD 27 11 1E 00 00 00 00 
    //1B 13 07 00 00 00 10 D2 27 11 16 0F 00 78 D3 27 11 25 07 73 00 96 00 78 D3 27 11 37 00 10 D2 27 
    //11 16 0F 00 F0 D3 27 11 2E F0 47 5B 01 10 00 78 D3 27 11 00 10 D2 27 11 0F 00 68 D4 27 11 2E 90 
    //18 5B 01 19 00 F0 D3 27 11 05 00 04 01 00 6E 6C 0F 19 19 00 68 D4 27 11 05 00 04 01 48 C2 18 11 
    //06 00 00 1B AE 0F 00 00 16 A3 00 78 D3 27 11 16 06 12 00 0F 01 30 CC 27 11 25 0F 01 A8 CC 27 11 
    //1F 00 0F 01 98 CD 27 11 1E 00 00 00 00 04 0B 47 
  }


  private event sv_CancelPartyTravel() {
    if (mPartyTravelTargetWorld != 0) {                                         //0000 : 07 11 00 9B 01 30 CC 27 11 25 16 
      sv_CancelPartyTravelForAll();                                             //000B : 1B 7D 0E 00 00 16 
    }
    if (mPartyTravelInProgress) {                                               //0011 : 07 21 00 2D 01 20 CD 27 11 
      sv_JoinPartyTravel(False);                                                //001A : 1B 8F 0D 00 00 28 16 
    }
    //07 11 00 9B 01 30 CC 27 11 25 16 1B 7D 0E 00 00 16 07 21 00 2D 01 20 CD 27 11 1B 8F 0D 00 00 28 
    //16 04 0B 47 
  }


  protected native function cl2sv_CancelPartyTravel_CallStub();


  event cl2sv_CancelPartyTravel() {
    sv_CancelPartyTravel();                                                     //0000 : 1B FE 06 00 00 16 
    //1B FE 06 00 00 16 04 0B 47 
  }


  protected native function sv2cl_JoinPartyTravel_CallStub();


  private event sv2cl_JoinPartyTravel(int aMember,bool aIsJoining) {
    OnPartyTravelJoin(aMember,aIsJoining);                                      //0000 : 43 28 DA 27 11 DB 05 00 00 00 60 D9 27 11 2D 00 A0 DA 27 11 16 
    //43 28 DA 27 11 DB 05 00 00 00 60 D9 27 11 2D 00 A0 DA 27 11 16 04 0B 47 
  }


  private function sv_JoinPartyTravel(bool aIsJoining) {
    local array<Game_Pawn> team;
    local Game_PlayerPawn playerPawn;
    local Game_PlayerController PlayerController;
    local int idx;
    if (mPartyTravelInProgress == False) {                                      //0000 : 07 0E 00 F2 2D 01 20 CD 27 11 28 16 
      return;                                                                   //000C : 04 0B 
    }
    mIsJoiningPartyTravel = aIsJoining;                                         //000E : 14 2D 01 B8 CB 27 11 2D 00 C8 DB 27 11 
    sv_GetTeamMembersOrSolo(team);                                              //001B : 1B 13 07 00 00 00 60 DD 27 11 16 
    idx = 0;                                                                    //0026 : 0F 00 D8 DD 27 11 25 
    while (idx < team.Length) {                                                 //002D : 07 B1 00 96 00 D8 DD 27 11 37 00 60 DD 27 11 16 
      playerPawn = Game_PlayerPawn(team[idx]);                                  //003D : 0F 00 50 DE 27 11 2E F0 47 5B 01 10 00 D8 DD 27 11 00 60 DD 27 11 
      PlayerController = Game_PlayerController(playerPawn.Controller);          //0053 : 0F 00 C8 DE 27 11 2E 90 18 5B 01 19 00 50 DE 27 11 05 00 04 01 00 6E 6C 0F 
      PlayerController.GroupingTeams.sv2cl_JoinPartyTravel_CallStub(Game_PlayerPawn(Outer.Pawn).GetCharacterID(),aIsJoining);//006C : 19 19 00 C8 DE 27 11 05 00 04 01 48 C2 18 11 29 00 00 1B BC 0E 00 00 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 2D 00 C8 DB 27 11 16 
      ++idx;                                                                    //00A7 : A3 00 D8 DD 27 11 16 
    }
    //07 0E 00 F2 2D 01 20 CD 27 11 28 16 04 0B 14 2D 01 B8 CB 27 11 2D 00 C8 DB 27 11 1B 13 07 00 00 
    //00 60 DD 27 11 16 0F 00 D8 DD 27 11 25 07 B1 00 96 00 D8 DD 27 11 37 00 60 DD 27 11 16 0F 00 50 
    //DE 27 11 2E F0 47 5B 01 10 00 D8 DD 27 11 00 60 DD 27 11 0F 00 C8 DE 27 11 2E 90 18 5B 01 19 00 
    //50 DE 27 11 05 00 04 01 00 6E 6C 0F 19 19 00 C8 DE 27 11 05 00 04 01 48 C2 18 11 29 00 00 1B BC 
    //0E 00 00 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 
    //2D 00 C8 DB 27 11 16 A3 00 D8 DD 27 11 16 06 2D 00 04 0B 47 
  }


  protected native function cl2sv_JoinPartyTravel_CallStub();


  event cl2sv_JoinPartyTravel(bool aIsJoining) {
    sv_JoinPartyTravel(aIsJoining);                                             //0000 : 1B 8F 0D 00 00 2D 00 18 E1 27 11 16 
    //1B 8F 0D 00 00 2D 00 18 E1 27 11 16 04 0B 47 
  }


  function sv_StartPartyTravel(int aTargetWorld,string aPortalName) {
    local array<Game_Pawn> team;
    local Game_PlayerPawn playerPawn;
    local Game_PlayerController PlayerController;
    local int idx;
    sv_GetTeamMembersOrSolo(team);                                              //0000 : 1B 13 07 00 00 00 F8 E2 27 11 16 
    idx = 0;                                                                    //000B : 0F 00 70 E3 27 11 25 
    while (idx < team.Length) {                                                 //0012 : 07 7B 00 96 00 70 E3 27 11 37 00 F8 E2 27 11 16 
      playerPawn = Game_PlayerPawn(team[idx]);                                  //0022 : 0F 00 E8 E3 27 11 2E F0 47 5B 01 10 00 70 E3 27 11 00 F8 E2 27 11 
      PlayerController = Game_PlayerController(playerPawn.Controller);          //0038 : 0F 00 60 E4 27 11 2E 90 18 5B 01 19 00 E8 E3 27 11 05 00 04 01 00 6E 6C 0F 
      if (PlayerController.GroupingTeams.mPartyTravelInProgress == True) {      //0051 : 07 71 00 F2 19 19 00 60 E4 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 20 CD 27 11 27 16 
        return;                                                                 //006F : 04 0B 
      }
      ++idx;                                                                    //0071 : A3 00 70 E3 27 11 16 
    }
    mPartyTravelTargetWorld = aTargetWorld;                                     //007B : 0F 01 30 CC 27 11 00 80 E2 27 11 
    mPartyTravelPortalName = aPortalName;                                       //0086 : 0F 01 A8 CC 27 11 00 D8 E4 27 11 
    mPartyTravelTimeout = 11.00000000;                                          //0091 : 0F 01 98 CD 27 11 1E 00 00 30 41 
    idx = 0;                                                                    //009C : 0F 00 70 E3 27 11 25 
    while (idx < team.Length) {                                                 //00A3 : 07 7C 01 96 00 70 E3 27 11 37 00 F8 E2 27 11 16 
      playerPawn = Game_PlayerPawn(team[idx]);                                  //00B3 : 0F 00 E8 E3 27 11 2E F0 47 5B 01 10 00 70 E3 27 11 00 F8 E2 27 11 
      PlayerController = Game_PlayerController(playerPawn.Controller);          //00C9 : 0F 00 60 E4 27 11 2E 90 18 5B 01 19 00 E8 E3 27 11 05 00 04 01 00 6E 6C 0F 
      PlayerController.GroupingTeams.mPartyTravelInProgress = True;             //00E2 : 14 19 19 00 60 E4 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 20 CD 27 11 27 
      if (PlayerController == Outer) {                                          //00FC : 07 40 01 72 00 60 E4 27 11 01 00 E4 6B 0F 16 
        PlayerController.GroupingTeams.mIsJoiningPartyTravel = True;            //010B : 14 19 19 00 60 E4 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 B8 CB 27 11 27 
        PlayerController.GUI.sv2cl_ShowPartyTravelOverview_CallStub();          //0125 : 19 19 00 60 E4 27 11 05 00 04 01 40 8A 1B 11 06 00 00 1B 14 0E 00 00 16 
      } else {                                                                  //013D : 06 72 01 
        PlayerController.GroupingTeams.mIsJoiningPartyTravel = False;           //0140 : 14 19 19 00 60 E4 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 B8 CB 27 11 28 
        PlayerController.GUI.sv2cl_ShowPartyTravelConfirmation_CallStub();      //015A : 19 19 00 60 E4 27 11 05 00 04 01 40 8A 1B 11 06 00 00 1B 15 0E 00 00 16 
      }
      ++idx;                                                                    //0172 : A3 00 70 E3 27 11 16 
    }
    //1B 13 07 00 00 00 F8 E2 27 11 16 0F 00 70 E3 27 11 25 07 7B 00 96 00 70 E3 27 11 37 00 F8 E2 27 
    //11 16 0F 00 E8 E3 27 11 2E F0 47 5B 01 10 00 70 E3 27 11 00 F8 E2 27 11 0F 00 60 E4 27 11 2E 90 
    //18 5B 01 19 00 E8 E3 27 11 05 00 04 01 00 6E 6C 0F 07 71 00 F2 19 19 00 60 E4 27 11 05 00 04 01 
    //48 C2 18 11 06 00 04 2D 01 20 CD 27 11 27 16 04 0B A3 00 70 E3 27 11 16 06 12 00 0F 01 30 CC 27 
    //11 00 80 E2 27 11 0F 01 A8 CC 27 11 00 D8 E4 27 11 0F 01 98 CD 27 11 1E 00 00 30 41 0F 00 70 E3 
    //27 11 25 07 7C 01 96 00 70 E3 27 11 37 00 F8 E2 27 11 16 0F 00 E8 E3 27 11 2E F0 47 5B 01 10 00 
    //70 E3 27 11 00 F8 E2 27 11 0F 00 60 E4 27 11 2E 90 18 5B 01 19 00 E8 E3 27 11 05 00 04 01 00 6E 
    //6C 0F 14 19 19 00 60 E4 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 20 CD 27 11 27 07 40 01 72 
    //00 60 E4 27 11 01 00 E4 6B 0F 16 14 19 19 00 60 E4 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 
    //B8 CB 27 11 27 19 19 00 60 E4 27 11 05 00 04 01 40 8A 1B 11 06 00 00 1B 14 0E 00 00 16 06 72 01 
    //14 19 19 00 60 E4 27 11 05 00 04 01 48 C2 18 11 06 00 04 2D 01 B8 CB 27 11 28 19 19 00 60 E4 27 
    //11 05 00 04 01 40 8A 1B 11 06 00 00 1B 15 0E 00 00 16 A3 00 70 E3 27 11 16 06 A3 00 04 0B 47 
  }


  delegate OnPartyTravelJoin(int aMember,bool aIsJoining);


  delegate OnPartyTravelCancel();


  event cl_ReceiveCharacterStatsUpdate(int CharacterID,float aHealth,float aPhysique,float aMorale,float aConcentration,int aStateRankShift,float aDuffUpdateTime,array<int> aDuffs,array<byte> aLodData) {
    local int i;
    local int j;
    local export editinline Game_PlayerAppearance Appearance;
    i = 0;                                                                      //0000 : 0F 00 A0 E9 27 11 25 
    while (i < mTeamMembers.Length) {                                           //0007 : 07 B7 02 96 00 A0 E9 27 11 37 01 18 EA 27 11 16 
      if (mTeamMembers[i].MemberHandle == CharacterID) {                        //0017 : 07 AD 02 9A 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 28 E9 27 11 16 
        mTeamMembers[i].Health = aHealth;                                       //0035 : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 98 EB 27 11 00 10 EC 27 11 
        mTeamMembers[i].Physique = aPhysique;                                   //004F : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 88 EC 27 11 00 00 ED 27 11 
        mTeamMembers[i].Morale = aMorale;                                       //0069 : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 78 ED 27 11 00 F0 ED 27 11 
        mTeamMembers[i].Concentration = aConcentration;                         //0083 : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 68 EE 27 11 00 E0 EE 27 11 
        mTeamMembers[i].StateRankShift = aStateRankShift;                       //009D : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 58 EF 27 11 00 D0 EF 27 11 
        if (mTeamMembers[i].AppearancePawn == None) {                           //00B7 : 07 15 01 72 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 2A 16 
          mTeamMembers[i].AppearancePawn = Outer.Spawn(Class'Game_TeamMemberPawn');//00D1 : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 19 01 00 E4 6B 0F 08 00 04 61 16 20 C0 F0 27 11 16 
          mTeamMembers[i].AppearancePawn.cl_OnInit();                           //00F7 : 19 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 06 00 00 1B 3F 05 00 00 16 
        }
        j = 0;                                                                  //0115 : 0F 00 00 F6 27 11 25 
        while (j < aLodData.Length) {                                           //011C : 07 FC 01 96 00 00 F6 27 11 37 00 78 F6 27 11 16 
          if (j >= mTeamMembers[i].LastAppearanceUpdateLod.Length
            || mTeamMembers[i].LastAppearanceUpdateLod[j] != aLodData[j]) {//012C : 07 F2 01 84 99 00 00 F6 27 11 37 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 00 01 F0 F6 27 11 16 18 2C 00 9B 39 3A 10 00 00 F6 27 11 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 00 01 F0 F6 27 11 39 3A 10 00 00 F6 27 11 00 78 F6 27 11 16 16 
            mTeamMembers[i].LastAppearanceUpdateLod = aLodData;                 //017B : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 00 01 F0 F6 27 11 00 78 F6 27 11 
            Appearance = Game_PlayerAppearance(Game_PlayerPawn(mTeamMembers[i].AppearancePawn).Appearance.GetBase());//0195 : 0F 00 68 F7 27 11 2E B0 BD 5F 01 19 19 2E F0 47 5B 01 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
            Appearance.mLODData3 = aLodData;                                    //01CC : 0F 19 00 68 F7 27 11 05 00 00 01 20 65 26 11 00 78 F6 27 11 
            Appearance.ConditionalUnpackLODData();                              //01E0 : 19 00 68 F7 27 11 06 00 00 1B 89 0C 00 00 16 
            goto jl01FC;                                                        //01EF : 06 FC 01 
          }
          ++j;                                                                  //01F2 : A3 00 00 F6 27 11 16 
        }
        if (mTeamMembers[i].LastDuffUpdateTime != aDuffUpdateTime) {            //01FC : 07 AB 02 B5 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 E0 F7 27 11 00 58 F8 27 11 16 
          mTeamMembers[i].LastDuffUpdateTime = aDuffUpdateTime;                 //021A : 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 E0 F7 27 11 00 58 F8 27 11 
          mTeamMembers[i].Buffs.Length = aDuffs.Length;                         //0234 : 0F 37 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 00 01 D0 F8 27 11 37 00 48 F9 27 11 
          j = 0;                                                                //0250 : 0F 00 00 F6 27 11 25 
          while (j < aDuffs.Length) {                                           //0257 : 07 AB 02 96 00 00 F6 27 11 37 00 48 F9 27 11 16 
            mTeamMembers[i].Buffs[j] = FSkill_Event_Duff(Class'SBDBSync'.GetResourceObject(aDuffs[j]));//0267 : 0F 10 00 00 F6 27 11 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 00 01 D0 F8 27 11 2E 80 65 5D 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 00 F6 27 11 00 48 F9 27 11 16 
            ++j;                                                                //02A1 : A3 00 00 F6 27 11 16 
          }
        }
        return;                                                                 //02AB : 04 0B 
      }
      ++i;                                                                      //02AD : A3 00 A0 E9 27 11 16 
    }
    //0F 00 A0 E9 27 11 25 07 B7 02 96 00 A0 E9 27 11 37 01 18 EA 27 11 16 07 AD 02 9A 19 10 00 A0 E9 
    //27 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 28 E9 27 11 16 0F 19 10 00 A0 E9 27 11 01 18 EA 
    //27 11 05 00 04 01 98 EB 27 11 00 10 EC 27 11 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 
    //88 EC 27 11 00 00 ED 27 11 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 78 ED 27 11 00 F0 
    //ED 27 11 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 68 EE 27 11 00 E0 EE 27 11 0F 19 10 
    //00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 58 EF 27 11 00 D0 EF 27 11 07 15 01 72 19 10 00 A0 E9 
    //27 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 2A 16 0F 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 
    //04 01 48 F0 27 11 19 01 00 E4 6B 0F 08 00 04 61 16 20 C0 F0 27 11 16 19 19 10 00 A0 E9 27 11 01 
    //18 EA 27 11 05 00 04 01 48 F0 27 11 06 00 00 1B 3F 05 00 00 16 0F 00 00 F6 27 11 25 07 FC 01 96 
    //00 00 F6 27 11 37 00 78 F6 27 11 16 07 F2 01 84 99 00 00 F6 27 11 37 19 10 00 A0 E9 27 11 01 18 
    //EA 27 11 05 00 00 01 F0 F6 27 11 16 18 2C 00 9B 39 3A 10 00 00 F6 27 11 19 10 00 A0 E9 27 11 01 
    //18 EA 27 11 05 00 00 01 F0 F6 27 11 39 3A 10 00 00 F6 27 11 00 78 F6 27 11 16 16 0F 19 10 00 A0 
    //E9 27 11 01 18 EA 27 11 05 00 00 01 F0 F6 27 11 00 78 F6 27 11 0F 00 68 F7 27 11 2E B0 BD 5F 01 
    //19 19 2E F0 47 5B 01 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 
    //83 18 11 06 00 04 1B 63 05 00 00 16 0F 19 00 68 F7 27 11 05 00 00 01 20 65 26 11 00 78 F6 27 11 
    //19 00 68 F7 27 11 06 00 00 1B 89 0C 00 00 16 06 FC 01 A3 00 00 F6 27 11 16 06 1C 01 07 AB 02 B5 
    //19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 04 01 E0 F7 27 11 00 58 F8 27 11 16 0F 19 10 00 A0 E9 
    //27 11 01 18 EA 27 11 05 00 04 01 E0 F7 27 11 00 58 F8 27 11 0F 37 19 10 00 A0 E9 27 11 01 18 EA 
    //27 11 05 00 00 01 D0 F8 27 11 37 00 48 F9 27 11 0F 00 00 F6 27 11 25 07 AB 02 96 00 00 F6 27 11 
    //37 00 48 F9 27 11 16 0F 10 00 00 F6 27 11 19 10 00 A0 E9 27 11 01 18 EA 27 11 05 00 00 01 D0 F8 
    //27 11 2E 80 65 5D 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 00 F6 27 11 00 48 F9 27 11 
    //16 A3 00 00 F6 27 11 16 06 57 02 04 0B A3 00 A0 E9 27 11 16 06 07 00 04 0B 47 
  }


  event cl_ReceiveCharacterStatsBase(int CharacterID,int worldID,float LocationX,float LocationY,bool aIsFeminine,int aArchetype,int aDiscipline,float aMaxHealth,int aPePRank,int aFameLevel) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 A8 FD 27 11 25 
    while (i < mTeamMembers.Length) {                                           //0007 : 07 2D 01 96 00 A8 FD 27 11 37 01 18 EA 27 11 16 
      if (mTeamMembers[i].MemberHandle == CharacterID) {                        //0017 : 07 23 01 9A 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 60 FB 27 11 16 
        mTeamMembers[i].worldID = worldID;                                      //0035 : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 20 FE 27 11 00 98 FE 27 11 
        mTeamMembers[i].LocationX = LocationX;                                  //004F : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 10 FF 27 11 00 88 FF 27 11 
        mTeamMembers[i].LocationY = LocationY;                                  //0069 : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 08 00 28 11 00 80 00 28 11 
        mTeamMembers[i].IsFeminine = aIsFeminine;                               //0083 : 14 19 10 00 A8 FD 27 11 01 18 EA 27 11 06 00 04 2D 01 F8 00 28 11 2D 00 70 01 28 11 
        mTeamMembers[i].Archetype = aArchetype;                                 //009F : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 E8 01 28 11 00 60 02 28 11 
        mTeamMembers[i].Discipline = aDiscipline;                               //00B9 : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 D8 02 28 11 00 50 03 28 11 
        mTeamMembers[i].MaxHealth = aMaxHealth;                                 //00D3 : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 C8 03 28 11 00 40 04 28 11 
        mTeamMembers[i].Pep = aPePRank;                                         //00ED : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 B8 04 28 11 00 30 05 28 11 
        mTeamMembers[i].Fame = aFameLevel;                                      //0107 : 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 A8 05 28 11 00 20 06 28 11 
        return;                                                                 //0121 : 04 0B 
      }
      ++i;                                                                      //0123 : A3 00 A8 FD 27 11 16 
    }
    //0F 00 A8 FD 27 11 25 07 2D 01 96 00 A8 FD 27 11 37 01 18 EA 27 11 16 07 23 01 9A 19 10 00 A8 FD 
    //27 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 60 FB 27 11 16 0F 19 10 00 A8 FD 27 11 01 18 EA 
    //27 11 05 00 04 01 20 FE 27 11 00 98 FE 27 11 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 
    //10 FF 27 11 00 88 FF 27 11 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 08 00 28 11 00 80 
    //00 28 11 14 19 10 00 A8 FD 27 11 01 18 EA 27 11 06 00 04 2D 01 F8 00 28 11 2D 00 70 01 28 11 0F 
    //19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 E8 01 28 11 00 60 02 28 11 0F 19 10 00 A8 FD 27 
    //11 01 18 EA 27 11 05 00 04 01 D8 02 28 11 00 50 03 28 11 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 
    //05 00 04 01 C8 03 28 11 00 40 04 28 11 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 B8 04 
    //28 11 00 30 05 28 11 0F 19 10 00 A8 FD 27 11 01 18 EA 27 11 05 00 04 01 A8 05 28 11 00 20 06 28 
    //11 04 0B A3 00 A8 FD 27 11 16 06 07 00 04 0B 47 
  }


  event sv_SendCharacterStats() {
    local export editinline Game_CharacterStats Stats;
    local export editinline Game_Skills Skills;
    local export editinline Game_PlayerAppearance Appearance;
    local Game_GameServer sv;
    sv = Game_GameServer(Class'Actor'.static.GetGameEngine());                  //0000 : 0F 00 28 0B 28 11 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    if (sv == None) {                                                           //001A : 07 27 00 72 00 28 0B 28 11 2A 16 
      return;                                                                   //0025 : 04 0B 
    }
    Stats = Game_Pawn(Outer.Pawn).CharacterStats;                               //0027 : 0F 00 48 07 28 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 
    Skills = Game_Pawn(Outer.Pawn).Skills;                                      //0049 : 0F 00 A0 0B 28 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 28 18 11 
    Appearance = Game_PlayerAppearance(Game_Pawn(Outer.Pawn).Appearance.GetCurrent());//006B : 0F 00 18 0C 28 11 2E B0 BD 5F 01 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
    Appearance.RepackLodDataAll();                                              //009C : 19 00 18 0C 28 11 06 00 00 1C 20 30 19 11 16 
    if (mLastTeamMemberInfoBase <= 0) {                                         //00AB : 07 A9 01 98 01 90 0C 28 11 25 16 
      sv_SendCharacterStatsBaseData(Outer.CharacterID,sv.GetWorldID(),Game_Pawn(Outer.Pawn).Location.X,Game_Pawn(Outer.Pawn).Location.Y,Game_Pawn(Outer.Pawn).Appearance.IsFeminine(),Stats.GetArchetype(),Stats.GetCharacterClass(),Stats.mRecord.MaxHealth,Stats.mRecord.PePRank,Stats.mRecord.FameLevel);//00B6 : 1B 9A 0E 00 00 19 01 00 E4 6B 0F 05 00 04 01 68 3B 19 11 19 00 28 0B 28 11 06 00 04 1C 08 3D 6C 0F 16 36 48 C4 69 0F 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 36 C0 C4 69 0F 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 39 3A 19 00 48 07 28 11 06 00 01 1C 70 9C 18 11 16 39 3A 19 00 48 07 28 11 06 00 01 1B 59 0C 00 00 16 39 3F 36 D8 91 18 11 19 00 48 07 28 11 05 00 68 01 78 2D 34 0F 36 78 96 1F 11 19 00 48 07 28 11 05 00 68 01 78 2D 34 0F 36 00 2D 34 0F 19 00 48 07 28 11 05 00 68 01 78 2D 34 0F 16 
      mLastTeamMemberInfoBase = 10;                                             //019E : 0F 01 90 0C 28 11 2C 0A 
    } else {                                                                    //01A6 : 06 B0 01 
      mLastTeamMemberInfoBase--;                                                //01A9 : A6 01 90 0C 28 11 16 
    }
    sv_SendCharacterStatsUpdateData(Outer.CharacterID,Stats.mHealth,Stats.mPhysiqueLevel,Stats.mMoraleLevel,Stats.mConcentrationLevel,Stats.mStateRankShift,Skills.mLastDuffUpdateTime,Skills.TeamDuffList,Appearance.mLODData3);//01B0 : 1B AB 0E 00 00 19 01 00 E4 6B 0F 05 00 04 01 68 3B 19 11 19 00 48 07 28 11 05 00 04 01 30 8E 1F 11 39 3F 19 00 48 07 28 11 05 00 04 01 40 A0 1F 11 39 3F 19 00 48 07 28 11 05 00 04 01 B8 A0 1F 11 39 3F 19 00 48 07 28 11 05 00 04 01 30 A1 1F 11 19 00 48 07 28 11 05 00 04 01 E8 9E 1F 11 19 00 A0 0B 28 11 05 00 04 01 60 9E 23 11 19 00 A0 0B 28 11 05 00 00 01 38 4E 24 11 19 00 18 0C 28 11 05 00 00 01 20 65 26 11 16 
    mLastTeamMemberInfoUpdate = Outer.Level.TimeSeconds;                        //023A : 0F 01 08 0D 28 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    //0F 00 28 0B 28 11 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 07 27 00 72 00 28 
    //0B 28 11 2A 16 04 0B 0F 00 48 07 28 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 
    //0F 05 00 04 01 08 43 34 0F 0F 00 A0 0B 28 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 
    //83 6C 0F 05 00 04 01 08 28 18 11 0F 00 18 0C 28 11 2E B0 BD 5F 01 19 19 2E 18 38 5B 01 19 01 00 
    //E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 19 00 18 0C 
    //28 11 06 00 00 1C 20 30 19 11 16 07 A9 01 98 01 90 0C 28 11 25 16 1B 9A 0E 00 00 19 01 00 E4 6B 
    //0F 05 00 04 01 68 3B 19 11 19 00 28 0B 28 11 06 00 04 1C 08 3D 6C 0F 16 36 48 C4 69 0F 19 2E 18 
    //38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 36 C0 C4 69 0F 19 2E 
    //18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 19 2E 18 38 5B 
    //01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 
    //39 3A 19 00 48 07 28 11 06 00 01 1C 70 9C 18 11 16 39 3A 19 00 48 07 28 11 06 00 01 1B 59 0C 00 
    //00 16 39 3F 36 D8 91 18 11 19 00 48 07 28 11 05 00 68 01 78 2D 34 0F 36 78 96 1F 11 19 00 48 07 
    //28 11 05 00 68 01 78 2D 34 0F 36 00 2D 34 0F 19 00 48 07 28 11 05 00 68 01 78 2D 34 0F 16 0F 01 
    //90 0C 28 11 2C 0A 06 B0 01 A6 01 90 0C 28 11 16 1B AB 0E 00 00 19 01 00 E4 6B 0F 05 00 04 01 68 
    //3B 19 11 19 00 48 07 28 11 05 00 04 01 30 8E 1F 11 39 3F 19 00 48 07 28 11 05 00 04 01 40 A0 1F 
    //11 39 3F 19 00 48 07 28 11 05 00 04 01 B8 A0 1F 11 39 3F 19 00 48 07 28 11 05 00 04 01 30 A1 1F 
    //11 19 00 48 07 28 11 05 00 04 01 E8 9E 1F 11 19 00 A0 0B 28 11 05 00 04 01 60 9E 23 11 19 00 A0 
    //0B 28 11 05 00 00 01 38 4E 24 11 19 00 18 0C 28 11 05 00 00 01 20 65 26 11 16 0F 01 08 0D 28 11 
    //19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 04 0B 47 
  }


  native function sv_SendCharacterStatsUpdateData(int CharacterID,float aHealth,float aPhysique,float aMorale,float aConcentration,int aStateRankShift,float aDuffUpdateTime,array<int> aDuffs,array<byte> aLodData);


  native function sv_SendCharacterStatsBaseData(int CharacterID,int worldID,float LocationX,float LocationY,bool aIsFeminine,int aArchetype,int aDiscipline,float aMaxHealth,int aPePRank,int aFameLevel);


  event sv_RemovedPawnFromTeam() {
    mTeamID = 0;                                                                //0000 : 0F 01 48 1A 28 11 25 
    mLeaderID = 0;                                                              //0007 : 0F 01 C0 1A 28 11 25 
    mLootMode = Class'Loot_Transaction'.0;                                      //000E : 0F 01 38 1B 28 11 12 20 38 0C 5D 01 02 00 01 24 00 
    mTeam.RemoveMember(Game_Pawn(Outer.Pawn));                                  //001F : 19 01 20 C0 27 11 19 00 00 1B 0B 06 00 00 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 16 
    mTeam = None;                                                               //0041 : 0F 01 20 C0 27 11 2A 
    //0F 01 48 1A 28 11 25 0F 01 C0 1A 28 11 25 0F 01 38 1B 28 11 12 20 38 0C 5D 01 02 00 01 24 00 19 
    //01 20 C0 27 11 19 00 00 1B 0B 06 00 00 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //16 0F 01 20 C0 27 11 2A 04 0B 47 
  }


  event sv_AddedPawnToTeam(int teamID) {
    local Game_PlayerController PlayerController;
    local Game_Team team;
    if (mTeamID != 0 && mTeamID != teamID) {                                    //0000 : 07 1E 00 82 9B 01 48 1A 28 11 25 16 18 0D 00 9B 01 48 1A 28 11 00 F0 1C 28 11 16 16 
      return;                                                                   //001C : 04 0B 
    }
    mTeamID = teamID;                                                           //001E : 0F 01 48 1A 28 11 00 F0 1C 28 11 
    team = None;                                                                //0029 : 0F 00 10 1F 28 11 2A 
    foreach Outer.DynamicActors(Class'Game_PlayerController',PlayerController,'None') {//0030 : 2F 19 01 00 E4 6B 0F 12 00 00 61 39 20 90 18 5B 01 00 88 1F 28 11 21 00 00 00 00 16 9C 00 
      if (PlayerController != Outer) {                                          //004E : 07 9B 00 77 00 88 1F 28 11 01 00 E4 6B 0F 16 
        if (PlayerController.GroupingTeams.mTeamID == mTeamID) {                //005D : 07 9B 00 9A 19 19 00 88 1F 28 11 05 00 04 01 48 C2 18 11 05 00 04 01 48 1A 28 11 01 48 1A 28 11 16 
          team = PlayerController.GroupingTeams.mTeam;                          //007E : 0F 00 10 1F 28 11 19 19 00 88 1F 28 11 05 00 04 01 48 C2 18 11 05 00 04 01 20 C0 27 11 
        }
      }
    }
    if (team == None) {                                                         //009D : 07 B7 00 72 00 10 1F 28 11 2A 16 
      team = new Class'Game_Team';                                              //00A8 : 0F 00 10 1F 28 11 11 0B 0B 0B 20 F8 A5 5E 01 
    }
    if (team.IsMember(Game_Pawn(Outer.Pawn)) == False) {                        //00B7 : 07 01 01 F2 19 00 10 1F 28 11 19 00 04 1B 66 0F 00 00 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 16 28 16 
      team.AddMember(Game_Pawn(Outer.Pawn));                                    //00DF : 19 00 10 1F 28 11 19 00 00 1B 7C 04 00 00 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 16 
    }
    mLastTeamMemberInfoUpdate = 0.00000000;                                     //0101 : 0F 01 08 0D 28 11 1E 00 00 00 00 
    mLastTeamMemberInfoBase = 0;                                                //010C : 0F 01 90 0C 28 11 25 
    //07 1E 00 82 9B 01 48 1A 28 11 25 16 18 0D 00 9B 01 48 1A 28 11 00 F0 1C 28 11 16 16 04 0B 0F 01 
    //48 1A 28 11 00 F0 1C 28 11 0F 00 10 1F 28 11 2A 2F 19 01 00 E4 6B 0F 12 00 00 61 39 20 90 18 5B 
    //01 00 88 1F 28 11 21 00 00 00 00 16 9C 00 07 9B 00 77 00 88 1F 28 11 01 00 E4 6B 0F 16 07 9B 00 
    //9A 19 19 00 88 1F 28 11 05 00 04 01 48 C2 18 11 05 00 04 01 48 1A 28 11 01 48 1A 28 11 16 0F 00 
    //10 1F 28 11 19 19 00 88 1F 28 11 05 00 04 01 48 C2 18 11 05 00 04 01 20 C0 27 11 31 30 07 B7 00 
    //72 00 10 1F 28 11 2A 16 0F 00 10 1F 28 11 11 0B 0B 0B 20 F8 A5 5E 01 07 01 01 F2 19 00 10 1F 28 
    //11 19 00 04 1B 66 0F 00 00 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 16 28 16 19 
    //00 10 1F 28 11 19 00 00 1B 7C 04 00 00 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //16 0F 01 08 0D 28 11 1E 00 00 00 00 0F 01 90 0C 28 11 25 04 0B 47 
  }


  event sv_SetLootMode(byte LootMode) {
    mLootMode = LootMode;                                                       //0000 : 0F 01 38 1B 28 11 00 B8 20 28 11 
    //0F 01 38 1B 28 11 00 B8 20 28 11 04 0B 47 
  }


  event sv_SetLeader(int leaderID) {
    mLeaderID = leaderID;                                                       //0000 : 0F 01 C0 1A 28 11 00 20 22 28 11 
    //0F 01 C0 1A 28 11 00 20 22 28 11 04 0B 47 
  }


  event TeamChangeLeader(int teamID,int leaderID,int newLeaderID) {
    local int i;
    local string newLeaderName;
    local string messageStr;
    if (mTeamID != teamID) {                                                    //0000 : 07 11 00 9B 01 48 1A 28 11 00 88 23 28 11 16 
      return;                                                                   //000F : 04 0B 
    }
    newLeaderName = Game_PlayerPawn(Outer.Pawn).GetCharacterName();             //0011 : 0F 00 D8 25 28 11 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 
    i = 0;                                                                      //0034 : 0F 00 50 26 28 11 25 
    while (i < mTeamMembers.Length) {                                           //003B : 07 BE 00 96 00 50 26 28 11 37 01 18 EA 27 11 16 
      if (mTeamMembers[i].MemberHandle == newLeaderID) {                        //004B : 07 9D 00 9A 19 10 00 50 26 28 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 C8 26 28 11 16 
        mTeamMembers[i].IsLeader = True;                                        //0069 : 14 19 10 00 50 26 28 11 01 18 EA 27 11 06 00 04 2D 01 40 27 28 11 27 
        newLeaderName = mTeamMembers[i].Name;                                   //0080 : 0F 00 D8 25 28 11 19 10 00 50 26 28 11 01 18 EA 27 11 05 00 00 01 B8 27 28 11 
      } else {                                                                  //009A : 06 B4 00 
        mTeamMembers[i].IsLeader = False;                                       //009D : 14 19 10 00 50 26 28 11 01 18 EA 27 11 06 00 04 2D 01 40 27 28 11 28 
      }
      ++i;                                                                      //00B4 : A3 00 50 26 28 11 16 
    }
    messageStr = Class'StringReferences'.default.LEADERNAME_is_now_party_leader_.Text;//00BE : 0F 00 30 28 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 62 1C 11 
    static.ReplaceText(messageStr,"[LEADERNAME]",newLeaderName);                //00D7 : 1C 30 80 69 0F 00 30 28 28 11 1F 5B 4C 45 41 44 45 52 4E 41 4D 45 5D 00 00 D8 25 28 11 16 
    Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//00F5 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 30 28 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    RefreshTeam();                                                              //012D : 1B 08 06 00 00 16 
    //07 11 00 9B 01 48 1A 28 11 00 88 23 28 11 16 04 0B 0F 00 D8 25 28 11 19 2E F0 47 5B 01 19 01 00 
    //E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 0F 00 50 26 28 11 25 07 BE 00 96 00 
    //50 26 28 11 37 01 18 EA 27 11 16 07 9D 00 9A 19 10 00 50 26 28 11 01 18 EA 27 11 05 00 04 01 20 
    //EB 27 11 00 C8 26 28 11 16 14 19 10 00 50 26 28 11 01 18 EA 27 11 06 00 04 2D 01 40 27 28 11 27 
    //0F 00 D8 25 28 11 19 10 00 50 26 28 11 01 18 EA 27 11 05 00 00 01 B8 27 28 11 06 B4 00 14 19 10 
    //00 50 26 28 11 01 18 EA 27 11 06 00 04 2D 01 40 27 28 11 28 A3 00 50 26 28 11 16 06 3B 00 0F 00 
    //30 28 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 62 1C 11 1C 30 80 69 0F 00 30 28 28 
    //11 1F 5B 4C 45 41 44 45 52 4E 41 4D 45 5D 00 00 D8 25 28 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 
    //6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 30 28 28 
    //11 12 20 60 CE 5A 01 02 00 04 2C 07 16 1B 08 06 00 00 16 04 0B 47 
  }


  event TeamDestroy(byte removeCode) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 00 2D 28 11 25 
    while (i < mTeamMembers.Length) {                                           //0007 : 07 63 00 96 00 00 2D 28 11 37 01 18 EA 27 11 16 
      mTeamMembers[i].AppearancePawn.Appearance.cl_OnShutdown();                //0017 : 19 19 19 10 00 00 2D 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 83 18 11 06 00 00 1B 66 07 00 00 16 
      mTeamMembers[i].AppearancePawn.Destroy();                                 //003E : 19 19 10 00 00 2D 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 03 00 04 61 17 16 
      i++;                                                                      //0059 : A5 00 00 2D 28 11 16 
    }
    mTeamMembers.Length = 0;                                                    //0063 : 0F 37 01 18 EA 27 11 25 
    mTeamID = 0;                                                                //006B : 0F 01 48 1A 28 11 25 
    mLootMode = Class'Loot_Transaction'.0;                                      //0072 : 0F 01 38 1B 28 11 12 20 38 0C 5D 01 02 00 01 24 00 
    mTeamChanged.Trigger();                                                     //0083 : 19 01 78 2D 28 11 06 00 00 1C 00 96 84 0F 16 
    switch (removeCode) {                                                       //0092 : 05 01 00 D0 29 28 11 
      case 1 :                                                                  //0099 : 0A EE 00 24 01 
        Outer.Player.GUIDesktop.ShowStdWindow(46,1);                            //009E : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 2E 26 16 
        Outer.Player.GUIDesktop.UpdateStdWindow(46,2,None,"",0);                //00C2 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0E 00 00 1B 02 0C 00 00 2C 2E 2C 02 2A 1F 00 25 16 
        break;                                                                  //00EB : 06 DA 01 
      case 2 :                                                                  //00EE : 0A 3C 01 24 02 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.You_have_left_the_party_.Text,Class'Game_Desktop'.7);//00F3 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E0 63 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0139 : 06 DA 01 
      case 4 :                                                                  //013C : 0A D7 01 24 04 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Your_party_has_been_disbanded_.Text,Class'Game_Desktop'.7);//0141 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 68 63 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        Outer.Player.GUIDesktop.ShowStdWindow(46,1);                            //0187 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 2E 26 16 
        Outer.Player.GUIDesktop.UpdateStdWindow(46,3,None,"",0);                //01AB : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0E 00 00 1B 02 0C 00 00 2C 2E 2C 03 2A 1F 00 25 16 
        break;                                                                  //01D4 : 06 DA 01 
      default:                                                                  //01D7 : 0A FF FF 
    }
    //0F 00 00 2D 28 11 25 07 63 00 96 00 00 2D 28 11 37 01 18 EA 27 11 16 19 19 19 10 00 00 2D 28 11 
    //01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 83 18 11 06 00 00 1B 66 07 00 00 16 19 19 
    //10 00 00 2D 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 03 00 04 61 17 16 A5 00 00 2D 28 11 16 
    //06 07 00 0F 37 01 18 EA 27 11 25 0F 01 48 1A 28 11 25 0F 01 38 1B 28 11 12 20 38 0C 5D 01 02 00 
    //01 24 00 19 01 78 2D 28 11 06 00 00 1C 00 96 84 0F 16 05 01 00 D0 29 28 11 0A EE 00 24 01 19 19 
    //19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 2E 
    //26 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0E 00 00 1B 02 0C 
    //00 00 2C 2E 2C 02 2A 1F 00 25 16 06 DA 01 0A 3C 01 24 02 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 
    //05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 
    //20 20 F7 60 01 05 00 0C 02 E0 63 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DA 01 0A D7 01 24 
    //04 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 
    //00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 68 63 1C 11 12 20 60 CE 5A 
    //01 02 00 04 2C 07 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 
    //00 04 1B DF 0B 00 00 2C 2E 26 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 
    //C0 79 0F 0E 00 00 1B 02 0C 00 00 2C 2E 2C 03 2A 1F 00 25 16 06 DA 01 0A FF FF 04 0B 47 
  }


  event TeamRemoveMember(int teamID,int removeMemberID,byte removeCode) {
    local int i;
    local string messageStr;
    if (mTeamID != teamID) {                                                    //0000 : 07 11 00 9B 01 48 1A 28 11 00 F0 2E 28 11 16 
      return;                                                                   //000F : 04 0B 
    }
    i = 0;                                                                      //0011 : 0F 00 08 33 28 11 25 
    while (i < mTeamMembers.Length) {                                           //0018 : 07 7A 02 96 00 08 33 28 11 37 01 18 EA 27 11 16 
      if (mTeamMembers[i].MemberHandle == removeMemberID) {                     //0028 : 07 70 02 9A 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 80 33 28 11 16 
        if (mTeamMembers[i].AppearancePawn != None) {                           //0046 : 07 C5 00 77 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 2A 16 
          if (mTeamMembers[i].AppearancePawn.Appearance != None) {              //0060 : 07 AA 00 77 19 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 83 18 11 2A 16 
            mTeamMembers[i].AppearancePawn.Appearance.cl_OnShutdown();          //0083 : 19 19 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 83 18 11 06 00 00 1B 66 07 00 00 16 
          }
          mTeamMembers[i].AppearancePawn.Destroy();                             //00AA : 19 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 03 00 04 61 17 16 
        }
        switch (removeCode) {                                                   //00C5 : 05 01 00 F8 33 28 11 
          case 1 :                                                              //00CC : 0A 52 01 24 01 
            messageStr = Class'StringReferences'.default.PLAYERNAME_has_been_kicked_from_the_party_.Text;//00D1 : 0F 00 70 34 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 58 64 1C 11 
            static.ReplaceText(messageStr,"[PLAYERNAME]",mTeamMembers[i].Name); //00EA : 1C 30 80 69 0F 00 70 34 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 00 01 B8 27 28 11 16 
            Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0117 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 70 34 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
            break;                                                              //014F : 06 61 02 
          case 2 :                                                              //0152 : 0A D8 01 24 02 
            messageStr = Class'StringReferences'.default.PLAYERNAME_has_left_the_party_.Text;//0157 : 0F 00 70 34 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 64 1C 11 
            static.ReplaceText(messageStr,"[PLAYERNAME]",mTeamMembers[i].Name); //0170 : 1C 30 80 69 0F 00 70 34 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 00 01 B8 27 28 11 16 
            Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//019D : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 70 34 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
            break;                                                              //01D5 : 06 61 02 
          case 3 :                                                              //01D8 : 0A 5E 02 24 03 
            messageStr = Class'StringReferences'.default.PLAYERNAME_has_gone_offline_.Text;//01DD : 0F 00 70 34 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 65 1C 11 
            static.ReplaceText(messageStr,"[PLAYERNAME]",mTeamMembers[i].Name); //01F6 : 1C 30 80 69 0F 00 70 34 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 00 01 B8 27 28 11 16 
            Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0223 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 70 34 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
            break;                                                              //025B : 06 61 02 
          default:                                                              //025E : 0A FF FF 
        }
        mTeamMembers.Remove(i,1);                                               //0261 : 41 01 18 EA 27 11 00 08 33 28 11 26 
        goto jl027A;                                                            //026D : 06 7A 02 
      }
      ++i;                                                                      //0270 : A3 00 08 33 28 11 16 
    }
    RefreshTeam();                                                              //027A : 1B 08 06 00 00 16 
    //07 11 00 9B 01 48 1A 28 11 00 F0 2E 28 11 16 04 0B 0F 00 08 33 28 11 25 07 7A 02 96 00 08 33 28 
    //11 37 01 18 EA 27 11 16 07 70 02 9A 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 
    //00 80 33 28 11 16 07 C5 00 77 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 2A 16 
    //07 AA 00 77 19 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 83 18 
    //11 2A 16 19 19 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 05 00 04 01 A8 83 18 
    //11 06 00 00 1B 66 07 00 00 16 19 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 04 01 48 F0 27 11 03 
    //00 04 61 17 16 05 01 00 F8 33 28 11 0A 52 01 24 01 0F 00 70 34 28 11 36 58 C6 6B 0F 12 20 20 F7 
    //60 01 05 00 0C 02 58 64 1C 11 1C 30 80 69 0F 00 70 34 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 
    //5D 00 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 00 01 B8 27 28 11 16 19 2E 60 CE 5A 01 19 19 01 
    //00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 70 
    //34 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 61 02 0A D8 01 24 02 0F 00 70 34 28 11 36 58 C6 
    //6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 64 1C 11 1C 30 80 69 0F 00 70 34 28 11 1F 5B 50 4C 41 59 
    //45 52 4E 41 4D 45 5D 00 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 00 01 B8 27 28 11 16 19 2E 60 
    //CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 
    //00 00 1F 00 00 70 34 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 61 02 0A 5E 02 24 03 0F 00 70 
    //34 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 65 1C 11 1C 30 80 69 0F 00 70 34 28 11 
    //1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 08 33 28 11 01 18 EA 27 11 05 00 00 01 B8 27 
    //28 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    //18 00 00 1B 7E 04 00 00 1F 00 00 70 34 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 61 02 0A FF 
    //FF 41 01 18 EA 27 11 00 08 33 28 11 26 06 7A 02 A3 00 08 33 28 11 16 06 18 00 1B 08 06 00 00 16 
    //04 0B 47 
  }


  event TeamAddMember(int teamID,int memberID,int memberWorld,string memberName,bool Leader) {
    local string messageStr;
    TeamSetMember(teamID,memberID,memberWorld,memberName,Leader);               //0000 : 1B 59 07 00 00 00 98 35 28 11 00 00 37 28 11 00 78 37 28 11 00 F0 37 28 11 2D 00 68 38 28 11 16 
    messageStr = Class'StringReferences'.default.PLAYERNAME_has_joined_your_party_.Text;//0020 : 0F 00 E0 38 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 66 1C 11 
    static.ReplaceText(messageStr,"[PLAYERNAME]",memberName);                   //0039 : 1C 30 80 69 0F 00 E0 38 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 37 28 11 16 
    Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0057 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 38 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    //1B 59 07 00 00 00 98 35 28 11 00 00 37 28 11 00 78 37 28 11 00 F0 37 28 11 2D 00 68 38 28 11 16 
    //0F 00 E0 38 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 66 1C 11 1C 30 80 69 0F 00 E0 
    //38 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 37 28 11 16 19 2E 60 CE 5A 01 19 19 01 
    //00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 
    //38 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 04 0B 47 
  }


  event TeamSetMember(int teamID,int memberID,int memberWorld,string memberName,bool Leader) {
    if (mTeamID == teamID) {                                                    //0000 : 07 CF 00 9A 01 48 1A 28 11 00 08 3A 28 11 16 
      mTeamMembers.Insert(mTeamMembers.Length,1);                               //000F : 40 01 18 EA 27 11 37 01 18 EA 27 11 26 
      mTeamMembers[mTeamMembers.Length - 1] = new Class'Game_TeamMember';       //001C : 0F 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 11 0B 0B 0B 20 F0 C4 60 01 
      mTeamMembers[mTeamMembers.Length - 1].MemberHandle = memberID;            //0035 : 0F 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 C8 3B 28 11 
      mTeamMembers[mTeamMembers.Length - 1].Name = memberName;                  //0053 : 0F 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 05 00 00 01 B8 27 28 11 00 40 3C 28 11 
      mTeamMembers[mTeamMembers.Length - 1].worldID = memberWorld;              //0071 : 0F 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 05 00 04 01 20 FE 27 11 00 B8 3C 28 11 
      mTeamMembers[mTeamMembers.Length - 1].IsLeader = Leader;                  //008F : 14 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 06 00 04 2D 01 40 27 28 11 2D 00 30 3D 28 11 
      mTeamMembers[mTeamMembers.Length - 1].AppearancePawn = None;              //00AF : 0F 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 05 00 04 01 48 F0 27 11 2A 
      RefreshTeam();                                                            //00C9 : 1B 08 06 00 00 16 
    }
    //07 CF 00 9A 01 48 1A 28 11 00 08 3A 28 11 16 40 01 18 EA 27 11 37 01 18 EA 27 11 26 0F 10 93 37 
    //01 18 EA 27 11 26 16 01 18 EA 27 11 11 0B 0B 0B 20 F0 C4 60 01 0F 19 10 93 37 01 18 EA 27 11 26 
    //16 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 C8 3B 28 11 0F 19 10 93 37 01 18 EA 27 11 26 16 01 
    //18 EA 27 11 05 00 00 01 B8 27 28 11 00 40 3C 28 11 0F 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 
    //27 11 05 00 04 01 20 FE 27 11 00 B8 3C 28 11 14 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 
    //06 00 04 2D 01 40 27 28 11 2D 00 30 3D 28 11 0F 19 10 93 37 01 18 EA 27 11 26 16 01 18 EA 27 11 
    //05 00 04 01 48 F0 27 11 2A 1B 08 06 00 00 16 04 0B 47 
  }


  event TeamInviteReq(int teamID,string fromPawnName) {
    Outer.Player.GUIDesktop.ShowStdWindow(46,1);                                //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 2E 26 16 
    Outer.Player.GUIDesktop.UpdateStdWindow(46,1,None,fromPawnName,teamID);     //0024 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 14 00 00 1B 02 0C 00 00 2C 2E 26 2A 00 70 3F 28 11 00 58 3E 28 11 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 
    //2C 2E 26 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 14 00 00 1B 
    //02 0C 00 00 2C 2E 26 2A 00 70 3F 28 11 00 58 3E 28 11 16 04 0B 47 
  }


  function HandleDeath() {
    sv_CancelPartyTravel();                                                     //0000 : 1B FE 06 00 00 16 
    Outer.Player.GUIDesktop.UpdateStdWindow(46,0,None,"",0);                    //0006 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0D 00 00 1B 02 0C 00 00 2C 2E 25 2A 1F 00 25 16 
    //1B FE 06 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0D 00 
    //00 1B 02 0C 00 00 2C 2E 25 2A 1F 00 25 16 04 0B 47 
  }


  event OnFailResult(byte Code,optional string pawnName) {
    local string messageStr;
    switch (Code) {                                                             //0000 : 05 01 00 B8 41 28 11 
      case 10 :                                                                 //0007 : 0A 7E 00 24 0A 
        messageStr = Class'StringReferences'.default.PLAYERNAME_ignored_you_.Text;//000C : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 66 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0025 : 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0043 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //007B : 06 30 06 
      case 2 :                                                                  //007E : 0A F5 00 24 02 
        messageStr = Class'StringReferences'.default.PLAYERNAME_declined_to_join_your_party_.Text;//0083 : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 67 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //009C : 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//00BA : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //00F2 : 06 30 06 
      case 3 :                                                                  //00F5 : 0A FA 00 24 03 
      case 7 :                                                                  //00FA : 0A 71 01 24 07 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_busy_try_again_later_.Text;//00FF : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 67 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0118 : 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0136 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //016E : 06 30 06 
      case 4 :                                                                  //0171 : 0A E8 01 24 04 
        messageStr = Class'StringReferences'.default.PLAYERNAME_cannot_join_your_party_because_it_is_full_.Text;//0176 : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 68 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //018F : 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//01AD : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //01E5 : 06 30 06 
      case 5 :                                                                  //01E8 : 0A 5F 02 24 05 
        messageStr = Class'StringReferences'.default.You_have_invited_PLAYERNAME_to_your_party_.Text;//01ED : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C0 65 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0206 : 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0224 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //025C : 06 30 06 
      case 6 :                                                                  //025F : 0A D6 02 24 06 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_already_in_a_party_.Text;//0264 : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 68 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //027D : 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//029B : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //02D3 : 06 30 06 
      case 8 :                                                                  //02D6 : 0A 24 03 24 08 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.You_mumble_to_yourself_.Text,Class'Game_Desktop'.7);//02DB : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 5A 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0321 : 06 30 06 
      case 11 :                                                                 //0324 : 0A 9B 03 24 0B 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_unknown__check_the_spelling_.Text;//0329 : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 69 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0342 : 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0360 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0398 : 06 30 06 
      case 9 :                                                                  //039B : 0A F4 03 24 09 
        messageStr = Class'StringReferences'.default.You_are_currently_not_allowed_to_do_that_.Text;//03A0 : 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 69 1C 11 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//03B9 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //03F1 : 06 30 06 
      case 16 :                                                                 //03F4 : 0A F9 03 24 10 
      case 12 :                                                                 //03F9 : 0A FE 03 24 0C 
      case 13 :                                                                 //03FE : 0A 03 04 24 0D 
      case 15 :                                                                 //0403 : 0A 51 04 24 0F 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Party_System_Error_.Text,Class'Game_Desktop'.7);//0408 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 6A 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //044E : 06 30 06 
      case 14 :                                                                 //0451 : 0A 59 04 24 0E 
        break;                                                                  //0456 : 06 30 06 
      case 20 :                                                                 //0459 : 0A A7 04 24 14 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_change_party_leader_.Text,Class'Game_Desktop'.7);//045E : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 6B 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //04A4 : 06 30 06 
      case 19 :                                                                 //04A7 : 0A F5 04 24 13 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Party_disband_failed_.Text,Class'Game_Desktop'.7);//04AC : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 6D 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //04F2 : 06 30 06 
      case 17 :                                                                 //04F5 : 0A 43 05 24 11 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_kick_party_member_.Text,Class'Game_Desktop'.7);//04FA : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 6E 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0540 : 06 30 06 
      case 18 :                                                                 //0543 : 0A 91 05 24 12 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_leave_the_Party_.Text,Class'Game_Desktop'.7);//0548 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 6F 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //058E : 06 30 06 
      case 21 :                                                                 //0591 : 0A DF 05 24 15 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_change_the_Party_Loot_Mode_.Text,Class'Game_Desktop'.7);//0596 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 6F 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //05DC : 06 30 06 
      case 22 :                                                                 //05DF : 0A 2D 06 24 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_get_party_member_information_.Text,Class'Game_Desktop'.7);//05E4 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 70 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //062A : 06 30 06 
      default:                                                                  //062D : 0A FF FF 
    }
    //05 01 00 B8 41 28 11 0A 7E 00 24 0A 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 B0 66 1C 11 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 
    //28 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    //18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A F5 
    //00 24 02 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 67 1C 11 1C 30 80 69 
    //0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 19 2E 60 CE 5A 01 
    //19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 
    //00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A FA 00 24 03 0A 71 01 24 07 0F 
    //00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 67 1C 11 1C 30 80 69 0F 00 E0 4A 
    //28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 19 2E 60 CE 5A 01 19 19 01 00 
    //E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 
    //28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A E8 01 24 04 0F 00 E0 4A 28 11 36 58 C6 6B 
    //0F 12 20 20 F7 60 01 05 00 0C 02 18 68 1C 11 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 
    //52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 
    //71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 
    //00 04 2C 07 16 06 30 06 0A 5F 02 24 05 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 
    //0C 02 C0 65 1C 11 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 
    //4B 28 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 18 00 00 1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A 
    //D6 02 24 06 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 68 1C 11 1C 30 80 
    //69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 19 2E 60 CE 5A 
    //01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 
    //1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A 24 03 24 08 19 2E 60 CE 5A 
    //01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 
    //1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 5A 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 
    //16 06 30 06 0A 9B 03 24 0B 0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 69 
    //1C 11 1C 30 80 69 0F 00 E0 4A 28 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 58 4B 28 11 16 
    //19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 
    //1B 7E 04 00 00 1F 00 00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A F4 03 24 09 
    //0F 00 E0 4A 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 69 1C 11 19 2E 60 CE 5A 01 19 
    //19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 
    //00 E0 4A 28 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A F9 03 24 10 0A FE 03 24 0C 0A 03 
    //04 24 0D 0A 51 04 24 0F 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 
    //01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 6A 
    //1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A 59 04 24 0E 06 30 06 0A A7 04 24 14 19 2E 
    //60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 
    //04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 6B 1C 11 12 20 60 CE 5A 01 02 00 
    //04 2C 07 16 06 30 06 0A F5 04 24 13 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 
    //0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 
    //0C 02 40 6D 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A 43 05 24 11 19 2E 60 CE 5A 01 
    //19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 
    //00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 6E 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    //06 30 06 0A 91 05 24 12 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 
    //01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 6F 
    //1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A DF 05 24 15 19 2E 60 CE 5A 01 19 19 01 00 
    //E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 
    //6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 6F 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A 
    //2D 06 24 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 70 1C 11 12 20 
    //60 CE 5A 01 02 00 04 2C 07 16 06 30 06 0A FF FF 04 0B 47 
  }


  event Offline(int pawnID) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 D0 4D 28 11 25 
    while (i < mTeamMembers.Length) {                                           //0007 : 07 42 00 96 00 D0 4D 28 11 37 01 18 EA 27 11 16 
      if (mTeamMembers[i].MemberHandle == pawnID) {                             //0017 : 07 38 00 9A 19 10 00 D0 4D 28 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 D0 4C 28 11 16 
        goto jl0042;                                                            //0035 : 06 42 00 
      }
      ++i;                                                                      //0038 : A3 00 D0 4D 28 11 16 
    }
    //0F 00 D0 4D 28 11 25 07 42 00 96 00 D0 4D 28 11 37 01 18 EA 27 11 16 07 38 00 9A 19 10 00 D0 4D 
    //28 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 D0 4C 28 11 16 06 42 00 A3 00 D0 4D 28 11 16 06 
    //07 00 04 0B 47 
  }


  event Online(int pawnID,int worldID) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 28 50 28 11 25 
    while (i < mTeamMembers.Length) {                                           //0007 : 07 62 00 96 00 28 50 28 11 37 01 18 EA 27 11 16 
      if (mTeamMembers[i].MemberHandle == pawnID) {                             //0017 : 07 58 00 9A 19 10 00 28 50 28 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 F8 4E 28 11 16 
        mTeamMembers[i].worldID = worldID;                                      //0035 : 0F 19 10 00 28 50 28 11 01 18 EA 27 11 05 00 04 01 20 FE 27 11 00 A0 50 28 11 
        RefreshTeam();                                                          //004F : 1B 08 06 00 00 16 
        goto jl0062;                                                            //0055 : 06 62 00 
      }
      ++i;                                                                      //0058 : A3 00 28 50 28 11 16 
    }
    //0F 00 28 50 28 11 25 07 62 00 96 00 28 50 28 11 37 01 18 EA 27 11 16 07 58 00 9A 19 10 00 28 50 
    //28 11 01 18 EA 27 11 05 00 04 01 20 EB 27 11 00 F8 4E 28 11 16 0F 19 10 00 28 50 28 11 01 18 EA 
    //27 11 05 00 04 01 20 FE 27 11 00 A0 50 28 11 1B 08 06 00 00 16 06 62 00 A3 00 28 50 28 11 16 06 
    //07 00 04 0B 47 
  }


  event RefreshTeam() {
    mTeamChanged.Trigger();                                                     //0000 : 19 01 78 2D 28 11 06 00 00 1C 00 96 84 0F 16 
    //19 01 78 2D 28 11 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  function byte GetTeamLootMode() {
    return mLootMode;                                                           //0000 : 04 01 38 1B 28 11 
    //04 01 38 1B 28 11 04 0B 47 
  }


  function int GetTeamID() {
    return mTeamID;                                                             //0000 : 04 01 48 1A 28 11 
    //04 01 48 1A 28 11 04 0B 47 
  }


  function int GetPlayerCharacterID() {
    return Game_Pawn(Outer.Pawn).GetCharacterID();                              //0000 : 04 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 
    //04 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 04 0B 
    //47 
  }


  native function TeamInviteAck(int teamID,string fromPawnName,byte _result);


  native function GetTeamInfo();


  native function TeamSetLootMode(byte LootMode);


  native function TeamDisband();


  native function TeamLeaderChange(int newLeaderPawnID);


  native function TeamKick(int kickPawnID);


  native function TeamLeave();


  native function TeamInvite(string toPawnName);


  event cl_SetLootMode(int aTeamID,byte aLootMode) {
    if (mTeamID == aTeamID) {                                                   //0000 : 07 34 00 9A 01 48 1A 28 11 00 70 61 28 11 16 
      OnSetLootMode(mLootMode,aLootMode);                                       //000F : 43 60 62 28 11 F0 05 00 00 01 38 1B 28 11 00 D8 62 28 11 16 
      mLootMode = aLootMode;                                                    //0023 : 0F 01 38 1B 28 11 00 D8 62 28 11 
      RefreshTeam();                                                            //002E : 1B 08 06 00 00 16 
    }
    //07 34 00 9A 01 48 1A 28 11 00 70 61 28 11 16 43 60 62 28 11 F0 05 00 00 01 38 1B 28 11 00 D8 62 
    //28 11 16 0F 01 38 1B 28 11 00 D8 62 28 11 1B 08 06 00 00 16 04 0B 47 
  }


  delegate OnSetLootMode(byte oldLootMode,byte newlootMode);


  function cl_OnShutdown() {
    Super.cl_OnShutdown();                                                      //0000 : 1C 00 C4 19 11 16 
    mTeamChanged.Delete();                                                      //0006 : 19 01 78 2D 28 11 06 00 00 1B 7B 0C 00 00 16 
    //1C 00 C4 19 11 16 19 01 78 2D 28 11 06 00 00 1B 7B 0C 00 00 16 04 0B 47 
  }


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    GetTeamInfo();                                                              //0006 : 1B 92 0E 00 00 16 
    //1C E0 C4 19 11 16 1B 92 0E 00 00 16 04 0B 47 
  }


  function Init() {
    mTeamChanged = new Class'EventNotification';                                //0000 : 0F 01 78 2D 28 11 11 0B 0B 0B 20 70 52 5B 01 
    //0F 01 78 2D 28 11 11 0B 0B 0B 20 70 52 5B 01 04 0B 47 
  }



