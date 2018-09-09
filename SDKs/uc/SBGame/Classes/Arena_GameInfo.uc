//==============================================================================
//  Arena_GameInfo
//==============================================================================

class Arena_GameInfo extends Game_GameInfo
    native
    exportstructs
    dependsOn()
  ;

  const COUNTDOWN_TIME =  10.0f;
  const CONNECTION_TIME =  60.0f;
  enum EGameState {
    GS_INIT ,
    GS_WAITING_FOR_SETUP ,
    GS_WAITING_FOR_LOGINS ,
    GS_COUNTING_DOWN ,
    GS_FIGHTING ,
    GS_SENDING_RESULT 
  };

  enum ECommunicationState {
    CS_NOT_CONNECTED ,
    CS_CONNECTED 
  };

  enum EArenaPawnState {
    APS_Connecting ,
    APS_Disconnected ,
    APS_Alive ,
    APS_Dead 
  };

  enum EArenaFightResult {
    AFR_Cancelled ,
    AFR_Team0Won ,
    AFR_Team1Won 
  };

  enum EArenaGameType {
    AGT_DeathMatch ,
    AGT_TimeTrial ,
    AGT_LastManStanding 
  };

  struct ArenaGameInfoPlayer {
      var int Id;
      var Game_PlayerController Controller;
      var bool Connected;
      var string Name;
      var int UserData;

  };


  struct ArenaGameInfoTeam {
      var PlayerStart Start;
      var array<ArenaGameInfoPlayer> Players;

  };


  var string mArenaTag;
  var string mArenaManagerTag;
  var string mArenaChannel;
  var float mConnectRetryTimer;
  var float mConnectionTimer;
  var byte mGameType;
  var int mReturnWorld;
  var int mReturnInstance;
  var float mCountDownLeft;
  var int mCountDownLastSecond;
  var byte mGameResult;
  var float mGameResultTimer;
  var ArenaGameInfoTeam mTeam[2];
  var byte mCommunicationState;
  var byte mGameState;
  var const bool TournamentFight;
  var const bool GuildFight;
  var const bool GroupFight;
  var const bool Challenge;
  var const int FightId;


  protected event sv_UpdateCountdownToClients() {
    //04 0B 47 
  }


  protected native function byte sv_GetPawnState(byte aTeam,int aPlayer);


  native function sv_PlayerStateUpdated(Game_PlayerPawn aPawn,optional byte aForcedState);


  protected native function sv_SendPlayerList(Game_PlayerPawn aPawn);


  protected native function sv_LogoutAllPlayers();


  protected native function int sv_SetCharacter(int CharacterID,Game_PlayerController aPC);


  protected native function bool sv_AllowCharacterToJoin(int CharacterID);


  protected native function string sv_GetCommandlineOptions();


  function int sv_GetUserData(Game_PlayerController aController) {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  function sv_SetUserData(Game_PlayerController aController,int aUserdata) {
    //04 0B 47 
  }


  native function int sv_GetTeamSize(int aTeam);


  event sv_StartGame() {
    //04 0B 47 
  }


  event sv_StartCountdown() {
    //04 0B 47 
  }


  event sv_StopGame(byte aResult) {
    //04 0B 47 
  }


  function bool PlayerRespawned(Controller aController) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool PlayerDied(Controller aController) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event sv_OnLogout(int aAccountID,Base_Pawn aPawn) {
    Super.sv_OnLogout(aAccountID,aPawn);                                        //0000 : 1C 48 AA 28 11 00 00 74 37 19 00 78 74 37 19 16 
    //1C 48 AA 28 11 00 00 74 37 19 00 78 74 37 19 16 04 0B 47 
  }


  event sv_OnInit() {
    local PlayerStart ps;
    Super.sv_OnInit();                                                          //0000 : 1C 48 B5 28 11 16 
    SetAllPropertyTexts(sv_GetCommandlineOptions());                            //0006 : 1C 58 E2 69 0F 1B 6B 0F 00 00 16 16 
    mArenaChannel = "_tournament_" $ mArenaManagerTag;                          //0012 : 0F 01 68 76 37 19 70 1F 5F 74 6F 75 72 6E 61 6D 65 6E 74 5F 00 01 E0 76 37 19 16 
    foreach AllActors(Class'PlayerStart',ps) {                                  //002D : 2F 61 30 20 98 FA C1 00 00 40 75 37 19 16 5F 00 
      mTeam[ps.TeamNumber].Start = ps;                                          //003D : 0F 36 E0 77 37 19 1A 39 3A 19 00 40 75 37 19 05 00 01 01 B8 E5 7F 0F 01 58 78 37 19 00 40 75 37 19 
    }
    //1C 48 B5 28 11 16 1C 58 E2 69 0F 1B 6B 0F 00 00 16 16 0F 01 68 76 37 19 70 1F 5F 74 6F 75 72 6E 
    //61 6D 65 6E 74 5F 00 01 E0 76 37 19 16 2F 61 30 20 98 FA C1 00 00 40 75 37 19 16 5F 00 0F 36 E0 
    //77 37 19 1A 39 3A 19 00 40 75 37 19 05 00 01 01 B8 E5 7F 0F 01 58 78 37 19 00 40 75 37 19 31 30 
    //04 0B 47 
  }



