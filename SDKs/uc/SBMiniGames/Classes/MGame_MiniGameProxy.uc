//==============================================================================
//  MGame_MiniGameProxy
//==============================================================================

class MGame_MiniGameProxy extends Game_MiniGameProxy within Game_Pawn
    native
    dependsOn(MGame_MiniGame,MGame_MiniGameManager,MGame_Chess,MGame_Config,Game_Pawn)
  ;

  const QUICKSTART =  false;
  const MINIGAME_INVITATION_TIMEOUT =  30;
  const MINIGAME_IGNORED_ME =  3;
  const MINIGAME_BUSY =  2;
  const MINIGAME_DECLINE =  1;
  const MINIGAME_ACCEPT =  0;
  const MINIGAME_STATUS_DIED =  4;
  const MINIGAME_STATUS_TIMEOUT =  3;
  const MINIGAME_STATUS_DRAW =  2;
  const MINIGAME_STATUS_WIN =  1;
  const MINIGAME_STATUS_UNDECIDED =  0;
  const MINIGAME_COUNT =  2;
  const MINIGAME_DRAUGHTS =  1;
  const MINIGAME_CHESS =  0;
  var MGame_MiniGameManager mMiniGameManager;
  var int mGroupID;
  var int mMiniGameID;
  var bool mSettingsAccepted;
  var bool mOfferDrawAccepted;
  var MGame_MiniGame mMiniGame;
  var private bool mInviting;
  var Game_Pawn mInvitingPlayer;
  var float mInvitationTimeLeft;
  var private float mThinkTime;
  var private int mPreviousThinkTime;
  var bool mGameStarted;
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);


  protected native function sv2cl_DebugMinigame_CallStub();


  event sv2cl_DebugMinigame() {
    mMiniGame.Debug();                                                          //0000 : 19 01 50 D5 19 11 06 00 00 1B 4B 03 00 00 16 
    //19 01 50 D5 19 11 06 00 00 1B 4B 03 00 00 16 04 0B 47 
  }


  protected native function cl2sv_DebugMinigame_CallStub();


  event cl2sv_DebugMinigame() {
    mMiniGameManager.sv_Debug(Outer);                                           //0000 : 19 01 70 D7 19 11 0B 00 00 1B 65 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 65 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function sv2cl_MakePromotion_CallStub();


  event sv2cl_MakePromotion(int X,int Y,int Piece) {
    MGame_Chess(mMiniGame).MakePromotion(X,Y,Piece,False);                      //0000 : 19 2E 80 29 A7 01 01 50 D5 19 11 16 00 00 1B 93 6E 00 00 00 48 D9 19 11 00 C0 D9 19 11 00 38 DA 19 11 28 16 
    //19 2E 80 29 A7 01 01 50 D5 19 11 16 00 00 1B 93 6E 00 00 00 48 D9 19 11 00 C0 D9 19 11 00 38 DA 
    //19 11 28 16 04 0B 47 
  }


  protected native function sv2cl_GameEnd_CallStub();


  event sv2cl_GameEnd(int aStatus,Game_Pawn aPlayer) {
    mGameStarted = False;                                                       //0000 : 14 2D 01 E0 DC 19 11 28 
    OnGameEnd(aStatus,aPlayer);                                                 //0008 : 43 58 DD 19 11 3D 04 00 00 00 10 DC 19 11 00 D0 DD 19 11 16 
    //14 2D 01 E0 DC 19 11 28 43 58 DD 19 11 3D 04 00 00 00 10 DC 19 11 00 D0 DD 19 11 16 04 0B 47 
  }


  protected native function sv2cl_OfferDrawAccepted_CallStub();


  event sv2cl_OfferDrawAccepted(Game_Pawn aPlayer,bool aAccepted) {
    OnOfferDrawAccepted(aPlayer,aAccepted);                                     //0000 : 43 20 E0 19 11 42 04 00 00 00 A8 DF 19 11 2D 00 98 E0 19 11 16 
    //43 20 E0 19 11 42 04 00 00 00 A8 DF 19 11 2D 00 98 E0 19 11 16 04 0B 47 
  }


  protected native function sv2cl_OfferDraw_CallStub();


  event sv2cl_OfferDraw(Game_Pawn aPlayer) {
    OnOfferDraw(aPlayer);                                                       //0000 : 43 28 E3 19 11 41 04 00 00 00 70 E2 19 11 16 
    //43 28 E3 19 11 41 04 00 00 00 70 E2 19 11 16 04 0B 47 
  }


  protected native function sv2cl_Resign_CallStub();


  event sv2cl_Resign(Game_Pawn aPlayer) {
    OnResign(aPlayer);                                                          //0000 : 43 B8 E5 19 11 46 04 00 00 00 00 E5 19 11 16 
    //43 B8 E5 19 11 46 04 00 00 00 00 E5 19 11 16 04 0B 47 
  }


  protected native function sv2cl_SwitchTurn_CallStub();


  event sv2cl_SwitchTurn(int aPlayerID,float aThinkTimeLeft) {
    mMiniGame.SetThinkTime(mMiniGame.GetCurrentPlayer(),aThinkTimeLeft);        //0000 : 19 01 50 D5 19 11 1A 00 00 1B 82 6E 00 00 19 01 50 D5 19 11 06 00 04 1B CE 6E 00 00 16 00 08 E8 19 11 16 
    mMiniGame.SetPlayerTurnID(aPlayerID);                                       //0023 : 19 01 50 D5 19 11 0B 00 00 1B 7E 6E 00 00 00 90 E7 19 11 16 
    OnSwitchTurn(aPlayerID);                                                    //0037 : 43 80 E8 19 11 48 04 00 00 00 90 E7 19 11 16 
    //19 01 50 D5 19 11 1A 00 00 1B 82 6E 00 00 19 01 50 D5 19 11 06 00 04 1B CE 6E 00 00 16 00 08 E8 
    //19 11 16 19 01 50 D5 19 11 0B 00 00 1B 7E 6E 00 00 00 90 E7 19 11 16 43 80 E8 19 11 48 04 00 00 
    //00 90 E7 19 11 16 04 0B 47 
  }


  protected native function sv2cl_MakeMove_CallStub();


  event sv2cl_MakeMove(int originX,int originY,int destinationX,int destinationY) {
    OnMakeMove(originX,originY,destinationX,destinationY);                      //0000 : 43 28 EB 19 11 3F 04 00 00 00 58 EA 19 11 00 A0 EB 19 11 00 18 EC 19 11 00 90 EC 19 11 16 
    //43 28 EB 19 11 3F 04 00 00 00 58 EA 19 11 00 A0 EB 19 11 00 18 EC 19 11 00 90 EC 19 11 16 04 0B 
    //47 
  }


  protected native function sv2cl_StartMiniGame_CallStub();


  event sv2cl_StartMiniGame() {
    mGameStarted = True;                                                        //0000 : 14 2D 01 E0 DC 19 11 27 
    OnStartMiniGame();                                                          //0008 : 43 C8 EE 19 11 47 04 00 00 16 
    mMiniGame.Start();                                                          //0012 : 19 01 50 D5 19 11 06 00 00 1B A9 1C 00 00 16 
    //14 2D 01 E0 DC 19 11 27 43 C8 EE 19 11 47 04 00 00 16 19 01 50 D5 19 11 06 00 00 1B A9 1C 00 00 
    //16 04 0B 47 
  }


  protected native function sv2cl_AcceptSettings_CallStub();


  event sv2cl_AcceptSettings() {
    OnAcceptSettings();                                                         //0000 : 43 E0 F0 19 11 3A 04 00 00 16 
    //43 E0 F0 19 11 3A 04 00 00 16 04 0B 47 
  }


  protected native function sv2cl_LeaveGame_CallStub();


  event sv2cl_LeaveGame(Game_Pawn Opponent) {
    mMiniGame.Stop();                                                           //0000 : 19 01 50 D5 19 11 06 00 00 1B 6F 02 00 00 16 
    mMiniGame.RemovePlayer(Opponent);                                           //000F : 19 01 50 D5 19 11 0B 00 00 1B 9C 6E 00 00 00 B8 F2 19 11 16 
    OnLeaveGame(Opponent);                                                      //0023 : 43 A0 F3 19 11 3E 04 00 00 00 B8 F2 19 11 16 
    //19 01 50 D5 19 11 06 00 00 1B 6F 02 00 00 16 19 01 50 D5 19 11 0B 00 00 1B 9C 6E 00 00 00 B8 F2 
    //19 11 16 43 A0 F3 19 11 3E 04 00 00 00 B8 F2 19 11 16 04 0B 47 
  }


  protected native function sv2cl_CancelSettings_CallStub();


  event sv2cl_CancelSettings(Game_Pawn Player) {
    OnCancelSettings(Player);                                                   //0000 : 43 30 F6 19 11 3C 04 00 00 00 78 F5 19 11 16 
    //43 30 F6 19 11 3C 04 00 00 00 78 F5 19 11 16 04 0B 47 
  }


  protected native function sv2cl_UpdateSetting_CallStub();


  event sv2cl_UpdateSetting(int SettingID,int Value) {
    mMiniGame.Config.SetConfig(SettingID,Value);                                //0000 : 19 19 01 50 D5 19 11 05 00 04 01 A0 1D 31 0F 10 00 00 1B 79 6E 00 00 00 08 F8 19 11 00 F8 F8 19 11 16 
    OnUpdateSetting(SettingID,Value);                                           //0022 : 43 70 F9 19 11 4C 04 00 00 00 08 F8 19 11 00 F8 F8 19 11 16 
    //19 19 01 50 D5 19 11 05 00 04 01 A0 1D 31 0F 10 00 00 1B 79 6E 00 00 00 08 F8 19 11 00 F8 F8 19 
    //11 16 43 70 F9 19 11 4C 04 00 00 00 08 F8 19 11 00 F8 F8 19 11 16 04 0B 47 
  }


  protected native function sv2cl_CancelInvitation_CallStub();


  event sv2cl_CancelInvitation() {
    OnCancelInvitation();                                                       //0000 : 43 88 FB 19 11 3B 04 00 00 16 
    //43 88 FB 19 11 3B 04 00 00 16 04 0B 47 
  }


  protected native function sv2cl_AcceptInvitation_CallStub();


  event sv2cl_AcceptInvitation(Game_Pawn Opponent,int Accept) {
    mInviting = False;                                                          //0000 : 14 2D 01 80 FE 19 11 28 
    if (Accept == 0) {                                                          //0008 : 07 41 00 9A 00 F8 FE 19 11 25 16 
      cl_LoadMiniGame();                                                        //0013 : 1B 31 04 00 00 16 
      mMiniGame.AddPlayer(Outer);                                               //0019 : 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 01 00 E4 6B 0F 16 
      mMiniGame.AddPlayer(Opponent);                                            //002D : 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 00 60 FD 19 11 16 
    }
    OnAcceptInvitation(Opponent,Accept);                                        //0041 : 43 70 FF 19 11 39 04 00 00 00 60 FD 19 11 00 F8 FE 19 11 16 
    //14 2D 01 80 FE 19 11 28 07 41 00 9A 00 F8 FE 19 11 25 16 1B 31 04 00 00 16 19 01 50 D5 19 11 0B 
    //00 00 1B 7C 6E 00 00 01 00 E4 6B 0F 16 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 00 60 FD 19 11 
    //16 43 70 FF 19 11 39 04 00 00 00 60 FD 19 11 00 F8 FE 19 11 16 04 0B 47 
  }


  protected native function sv2cl_InvitePlayer_CallStub();


  event sv2cl_InvitePlayer(Game_Pawn Player,int GameID) {
    OnPlayerInvitation(Player,GameID);                                          //0000 : 43 08 02 1A 11 44 04 00 00 00 48 01 1A 11 00 80 02 1A 11 16 
    //43 08 02 1A 11 44 04 00 00 00 48 01 1A 11 00 80 02 1A 11 16 04 0B 47 
  }


  protected native function sv2cl_Quickstart_CallStub();


  event sv2cl_Quickstart(Game_Pawn Player,int GameID) {
    mInviting = False;                                                          //0000 : 14 2D 01 80 FE 19 11 28 
    mMiniGameID = GameID;                                                       //0008 : 0F 01 78 05 1A 11 00 F0 05 1A 11 
    cl_LoadMiniGame();                                                          //0013 : 1B 31 04 00 00 16 
    mMiniGame.AddPlayer(Player);                                                //0019 : 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 00 58 04 1A 11 16 
    mMiniGame.AddPlayer(Outer);                                                 //002D : 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 01 00 E4 6B 0F 16 
    OnQuickstart(Player,GameID);                                                //0041 : 43 68 06 1A 11 45 04 00 00 00 58 04 1A 11 00 F0 05 1A 11 16 
    //14 2D 01 80 FE 19 11 28 0F 01 78 05 1A 11 00 F0 05 1A 11 1B 31 04 00 00 16 19 01 50 D5 19 11 0B 
    //00 00 1B 7C 6E 00 00 00 58 04 1A 11 16 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 01 00 E4 6B 0F 
    //16 43 68 06 1A 11 45 04 00 00 00 58 04 1A 11 00 F0 05 1A 11 16 04 0B 47 
  }


  protected native function sv2cl_PlayerAvailable_CallStub();


  event sv2cl_PlayerAvailable(Game_Pawn Opponent,bool Available) {
    OnPlayerAvailable(Opponent,Available);                                      //0000 : 43 08 09 1A 11 43 04 00 00 00 40 08 1A 11 2D 00 80 09 1A 11 16 
    //43 08 09 1A 11 43 04 00 00 00 40 08 1A 11 2D 00 80 09 1A 11 16 04 0B 47 
  }


  function sv_PlayerDied() {
    mMiniGameManager.sv_PlayerDied(Outer);                                      //0000 : 19 01 70 D7 19 11 0B 00 00 1B 6E 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 6E 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  function sv_IsPlayerAvailable(Game_Pawn Opponent) {
    local bool Available;
    Available = mMiniGameManager.sv_IsPlayerAvailable(Opponent);                //0000 : 14 2D 00 80 0C 1A 11 19 01 70 D7 19 11 0B 00 04 1B 68 04 00 00 00 A0 0B 1A 11 16 
    sv2cl_PlayerAvailable_CallStub(Opponent,Available);                         //001B : 1B B7 6E 00 00 00 A0 0B 1A 11 2D 00 80 0C 1A 11 16 
    //14 2D 00 80 0C 1A 11 19 01 70 D7 19 11 0B 00 04 1B 68 04 00 00 00 A0 0B 1A 11 16 1B B7 6E 00 00 
    //00 A0 0B 1A 11 2D 00 80 0C 1A 11 16 04 0B 47 
  }


  protected native function cl2sv_MakePromotion_CallStub();


  event cl2sv_MakePromotion(int X,int Y,int Piece) {
    mMiniGameManager.sv_MakePromotion(Outer,X,Y,Piece);                         //0000 : 19 01 70 D7 19 11 1A 00 00 1B 6C 04 00 00 01 00 E4 6B 0F 00 58 0E 1A 11 00 30 0F 1A 11 00 A8 0F 1A 11 16 
    //19 01 70 D7 19 11 1A 00 00 1B 6C 04 00 00 01 00 E4 6B 0F 00 58 0E 1A 11 00 30 0F 1A 11 00 A8 0F 
    //1A 11 16 04 0B 47 
  }


  protected native function cl2sv_AcceptDraw_CallStub();


  event cl2sv_AcceptDraw(bool Accepted) {
    mMiniGameManager.sv_AcceptDraw(Outer,Accepted);                             //0000 : 19 01 70 D7 19 11 11 00 00 1B 5F 04 00 00 01 00 E4 6B 0F 2D 00 80 11 1A 11 16 
    //19 01 70 D7 19 11 11 00 00 1B 5F 04 00 00 01 00 E4 6B 0F 2D 00 80 11 1A 11 16 04 0B 47 
  }


  protected native function cl2sv_OfferDraw_CallStub();


  event cl2sv_OfferDraw() {
    mMiniGameManager.sv_OfferDraw(Outer);                                       //0000 : 19 01 70 D7 19 11 0B 00 00 1B 6D 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 6D 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_Resign_CallStub();


  event cl2sv_Resign() {
    mMiniGameManager.sv_Resign(Outer);                                          //0000 : 19 01 70 D7 19 11 0B 00 00 1B 71 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 71 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_SwitchTurn_CallStub();


  event cl2sv_SwitchTurn() {
    mMiniGameManager.sv_SwitchTurn(Outer);                                      //0000 : 19 01 70 D7 19 11 0B 00 00 1B 73 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 73 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_MakeMove_CallStub();


  event cl2sv_MakeMove(int originX,int originY,int destinationX,int destinationY) {
    mMiniGameManager.sv_MakeMove(Outer,originX,originY,destinationX,destinationY);//0000 : 19 01 70 D7 19 11 1F 00 00 1B 6B 04 00 00 01 00 E4 6B 0F 00 A0 18 1A 11 00 80 19 1A 11 00 F8 19 1A 11 00 70 1A 1A 11 16 
    //19 01 70 D7 19 11 1F 00 00 1B 6B 04 00 00 01 00 E4 6B 0F 00 A0 18 1A 11 00 80 19 1A 11 00 F8 19 
    //1A 11 00 70 1A 1A 11 16 04 0B 47 
  }


  protected native function cl2sv_AcceptSettings_CallStub();


  event cl2sv_AcceptSettings() {
    mMiniGameManager.sv_AcceptSettings(Outer);                                  //0000 : 19 01 70 D7 19 11 0B 00 00 1B 60 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 60 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_LeaveGame_CallStub();


  event cl2sv_LeaveGame() {
    mMiniGameManager.sv_LeaveGame(Outer);                                       //0000 : 19 01 70 D7 19 11 0B 00 00 1B 69 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 69 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_CancelSettings_CallStub();


  event cl2sv_CancelSettings() {
    mMiniGameManager.sv_CancelSettings(Outer);                                  //0000 : 19 01 70 D7 19 11 0B 00 00 1B 64 04 00 00 01 00 E4 6B 0F 16 
    //19 01 70 D7 19 11 0B 00 00 1B 64 04 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_UpdateSetting_CallStub();


  event cl2sv_UpdateSetting(int SettingID,int Value) {
    local MGame_MiniGame miniGame;
    miniGame = mMiniGameManager.GetGroup(mGroupID);                             //0000 : 0F 00 60 22 1A 11 19 01 70 D7 19 11 0B 00 04 1B 77 6E 00 00 01 98 1A 31 0F 16 
    miniGame.Config.SetConfig(SettingID,Value);                                 //001A : 19 19 00 60 22 1A 11 05 00 04 01 A0 1D 31 0F 10 00 00 1B 79 6E 00 00 00 40 21 1A 11 00 D8 22 1A 11 16 
    mMiniGameManager.sv_UpdateSetting(Outer,SettingID,Value);                   //003C : 19 01 70 D7 19 11 15 00 00 1B 74 04 00 00 01 00 E4 6B 0F 00 40 21 1A 11 00 D8 22 1A 11 16 
    //0F 00 60 22 1A 11 19 01 70 D7 19 11 0B 00 04 1B 77 6E 00 00 01 98 1A 31 0F 16 19 19 00 60 22 1A 
    //11 05 00 04 01 A0 1D 31 0F 10 00 00 1B 79 6E 00 00 00 40 21 1A 11 00 D8 22 1A 11 16 19 01 70 D7 
    //19 11 15 00 00 1B 74 04 00 00 01 00 E4 6B 0F 00 40 21 1A 11 00 D8 22 1A 11 16 04 0B 47 
  }


  protected native function cl2sv_CancelInvitation_CallStub();


  event cl2sv_CancelInvitation(Game_Pawn Opponent) {
    MGame_MiniGameProxy(Opponent.MiniGameProxy).sv2cl_CancelInvitation_CallStub();//0000 : 19 2E 40 24 A7 01 19 00 B0 24 1A 11 05 00 04 01 30 5D 83 0F 06 00 00 1B B4 6E 00 00 16 
    //19 2E 40 24 A7 01 19 00 B0 24 1A 11 05 00 04 01 30 5D 83 0F 06 00 00 1B B4 6E 00 00 16 04 0B 47 
    //
  }


  protected native function cl2sv_AcceptInvitation_CallStub();


  event cl2sv_AcceptInvitation(Game_Pawn Opponent,int Accept) {
    if (Accept == 0) {                                                          //0000 : 07 89 00 9A 00 78 28 1A 11 25 16 
      mGroupID = MGame_MiniGameProxy(Opponent.MiniGameProxy).mGroupID;          //000B : 0F 01 98 1A 31 0F 19 2E 40 24 A7 01 19 00 E0 26 1A 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
      if (mGroupID == -1) {                                                     //002D : 07 70 00 9A 01 98 1A 31 0F 1D FF FF FF FF 16 
        mGroupID = mMiniGameManager.sv_GrabID();                                //003C : 0F 01 98 1A 31 0F 19 01 70 D7 19 11 06 00 04 1B 67 04 00 00 16 
        sv_LoadMiniGame();                                                      //0051 : 1B 6A 04 00 00 16 
        mMiniGameManager.sv_AddToGroup(mGroupID,Opponent);                      //0057 : 19 01 70 D7 19 11 10 00 00 1B 61 04 00 00 01 98 1A 31 0F 00 E0 26 1A 11 16 
      }
      mMiniGameManager.sv_AddToGroup(mGroupID,Outer);                           //0070 : 19 01 70 D7 19 11 10 00 00 1B 61 04 00 00 01 98 1A 31 0F 01 00 E4 6B 0F 16 
    }
    MGame_MiniGameProxy(Opponent.MiniGameProxy).sv2cl_AcceptInvitation_CallStub(Outer,Accept);//0089 : 19 2E 40 24 A7 01 19 00 E0 26 1A 11 05 00 04 01 30 5D 83 0F 10 00 00 1B B5 6E 00 00 01 00 E4 6B 0F 00 78 28 1A 11 16 
    //07 89 00 9A 00 78 28 1A 11 25 16 0F 01 98 1A 31 0F 19 2E 40 24 A7 01 19 00 E0 26 1A 11 05 00 04 
    //01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 07 70 00 9A 01 98 1A 31 0F 1D FF FF FF FF 16 0F 01 98 1A 
    //31 0F 19 01 70 D7 19 11 06 00 04 1B 67 04 00 00 16 1B 6A 04 00 00 16 19 01 70 D7 19 11 10 00 00 
    //1B 61 04 00 00 01 98 1A 31 0F 00 E0 26 1A 11 16 19 01 70 D7 19 11 10 00 00 1B 61 04 00 00 01 98 
    //1A 31 0F 01 00 E4 6B 0F 16 19 2E 40 24 A7 01 19 00 E0 26 1A 11 05 00 04 01 30 5D 83 0F 10 00 00 
    //1B B5 6E 00 00 01 00 E4 6B 0F 00 78 28 1A 11 16 04 0B 47 
  }


  protected native function cl2sv_Quickstart_CallStub();


  event cl2sv_Quickstart(Game_Pawn Opponent,int GameID) {
    mMiniGameID = GameID;                                                       //0000 : 0F 01 78 05 1A 11 00 C8 2A 1A 11 
    mGroupID = MGame_MiniGameProxy(Outer.MiniGameProxy).mGroupID;               //000B : 0F 01 98 1A 31 0F 19 2E 40 24 A7 01 19 01 00 E4 6B 0F 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
    if (mGroupID == -1) {                                                       //002D : 07 70 00 9A 01 98 1A 31 0F 1D FF FF FF FF 16 
      mGroupID = mMiniGameManager.sv_GrabID();                                  //003C : 0F 01 98 1A 31 0F 19 01 70 D7 19 11 06 00 04 1B 67 04 00 00 16 
      sv_LoadMiniGame();                                                        //0051 : 1B 6A 04 00 00 16 
      mMiniGameManager.sv_AddToGroup(mGroupID,Outer);                           //0057 : 19 01 70 D7 19 11 10 00 00 1B 61 04 00 00 01 98 1A 31 0F 01 00 E4 6B 0F 16 
    }
    mMiniGameManager.sv_AddToGroup(mGroupID,Opponent);                          //0070 : 19 01 70 D7 19 11 10 00 00 1B 61 04 00 00 01 98 1A 31 0F 00 50 2A 1A 11 16 
    mMiniGameManager.sv_Quickstart(mGroupID,GameID);                            //0089 : 19 01 70 D7 19 11 10 00 00 1B 6F 04 00 00 01 98 1A 31 0F 00 C8 2A 1A 11 16 
    //0F 01 78 05 1A 11 00 C8 2A 1A 11 0F 01 98 1A 31 0F 19 2E 40 24 A7 01 19 01 00 E4 6B 0F 05 00 04 
    //01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 07 70 00 9A 01 98 1A 31 0F 1D FF FF FF FF 16 0F 01 98 1A 
    //31 0F 19 01 70 D7 19 11 06 00 04 1B 67 04 00 00 16 1B 6A 04 00 00 16 19 01 70 D7 19 11 10 00 00 
    //1B 61 04 00 00 01 98 1A 31 0F 01 00 E4 6B 0F 16 19 01 70 D7 19 11 10 00 00 1B 61 04 00 00 01 98 
    //1A 31 0F 00 50 2A 1A 11 16 19 01 70 D7 19 11 10 00 00 1B 6F 04 00 00 01 98 1A 31 0F 00 C8 2A 1A 
    //11 16 04 0B 47 
  }


  protected native function cl2sv_InvitePlayer_CallStub();


  event cl2sv_InvitePlayer(Game_Pawn Opponent,int GameID) {
    mMiniGameID = GameID;                                                       //0000 : 0F 01 78 05 1A 11 00 C0 2D 1A 11 
    MGame_MiniGameProxy(Opponent.MiniGameProxy).mMiniGameID = GameID;           //000B : 0F 19 2E 40 24 A7 01 19 00 A0 2C 1A 11 05 00 04 01 30 5D 83 0F 05 00 04 01 78 05 1A 11 00 C0 2D 1A 11 
    MGame_MiniGameProxy(Opponent.MiniGameProxy).sv2cl_InvitePlayer_CallStub(Game_PlayerPawn(Outer),GameID);//002D : 19 2E 40 24 A7 01 19 00 A0 2C 1A 11 05 00 04 01 30 5D 83 0F 15 00 00 1B B6 6E 00 00 2E F0 47 5B 01 01 00 E4 6B 0F 00 C0 2D 1A 11 16 
    //0F 01 78 05 1A 11 00 C0 2D 1A 11 0F 19 2E 40 24 A7 01 19 00 A0 2C 1A 11 05 00 04 01 30 5D 83 0F 
    //05 00 04 01 78 05 1A 11 00 C0 2D 1A 11 19 2E 40 24 A7 01 19 00 A0 2C 1A 11 05 00 04 01 30 5D 83 
    //0F 15 00 00 1B B6 6E 00 00 2E F0 47 5B 01 01 00 E4 6B 0F 00 C0 2D 1A 11 16 04 0B 47 
  }


  protected native function cl2sv_IsPlayerAvailable_CallStub();


  event cl2sv_IsPlayerAvailable(Game_Pawn Opponent) {
    sv_IsPlayerAvailable(Opponent);                                             //0000 : 1B 68 04 00 00 00 98 2F 1A 11 16 
    //1B 68 04 00 00 00 98 2F 1A 11 16 04 0B 47 
  }


  event cl_MakePromotion(int X,int Y,int Piece) {
    cl2sv_MakePromotion_CallStub(X,Y,Piece);                                    //0000 : 1B B8 6E 00 00 00 00 31 1A 11 00 C8 31 1A 11 00 40 32 1A 11 16 
    //1B B8 6E 00 00 00 00 31 1A 11 00 C8 31 1A 11 00 40 32 1A 11 16 04 0B 47 
  }


  event cl_AcceptDraw(bool Accepted) {
    cl2sv_AcceptDraw_CallStub(Accepted);                                        //0000 : 1B B9 6E 00 00 2D 00 68 33 1A 11 16 
    //1B B9 6E 00 00 2D 00 68 33 1A 11 16 04 0B 47 
  }


  event cl_OfferDraw() {
    cl2sv_OfferDraw_CallStub();                                                 //0000 : 1B BA 6E 00 00 16 
    //1B BA 6E 00 00 16 04 0B 47 
  }


  event cl_Resign() {
    cl2sv_Resign_CallStub();                                                    //0000 : 1B BB 6E 00 00 16 
    //1B BB 6E 00 00 16 04 0B 47 
  }


  event cl_SwitchTurn() {
    cl2sv_SwitchTurn_CallStub();                                                //0000 : 1B BC 6E 00 00 16 
    //1B BC 6E 00 00 16 04 0B 47 
  }


  event cl_MakeMove(int originX,int originY,int destinationX,int destinationY) {
    cl2sv_MakeMove_CallStub(originX,originY,destinationX,destinationY);         //0000 : 1B BD 6E 00 00 00 88 37 1A 11 00 50 38 1A 11 00 C8 38 1A 11 00 40 39 1A 11 16 
    //1B BD 6E 00 00 00 88 37 1A 11 00 50 38 1A 11 00 C8 38 1A 11 00 40 39 1A 11 16 04 0B 47 
  }


  event cl_AcceptSettings() {
    cl2sv_AcceptSettings_CallStub();                                            //0000 : 1B D5 6E 00 00 16 
    //1B D5 6E 00 00 16 04 0B 47 
  }


  event cl_LeaveGame() {
    if (mMiniGame != None) {                                                    //0000 : 07 18 00 77 01 50 D5 19 11 2A 16 
      mMiniGame = None;                                                         //000B : 0F 01 50 D5 19 11 2A 
      cl2sv_LeaveGame_CallStub();                                               //0012 : 1B D6 6E 00 00 16 
    }
    //07 18 00 77 01 50 D5 19 11 2A 16 0F 01 50 D5 19 11 2A 1B D6 6E 00 00 16 04 0B 47 
  }


  event cl_CancelSettings() {
    if (mMiniGame != None) {                                                    //0000 : 07 12 00 77 01 50 D5 19 11 2A 16 
      mMiniGame = None;                                                         //000B : 0F 01 50 D5 19 11 2A 
    }
    cl2sv_CancelSettings_CallStub();                                            //0012 : 1B D7 6E 00 00 16 
    //07 12 00 77 01 50 D5 19 11 2A 16 0F 01 50 D5 19 11 2A 1B D7 6E 00 00 16 04 0B 47 
  }


  event cl_UpdateSetting(int SettingID,int Value) {
    mMiniGame.Config.SetConfig(SettingID,Value);                                //0000 : 19 19 01 50 D5 19 11 05 00 04 01 A0 1D 31 0F 10 00 00 1B 79 6E 00 00 00 50 3D 1A 11 00 38 3E 1A 11 16 
    cl2sv_UpdateSetting_CallStub(SettingID,Value);                              //0022 : 1B D8 6E 00 00 00 50 3D 1A 11 00 38 3E 1A 11 16 
    //19 19 01 50 D5 19 11 05 00 04 01 A0 1D 31 0F 10 00 00 1B 79 6E 00 00 00 50 3D 1A 11 00 38 3E 1A 
    //11 16 1B D8 6E 00 00 00 50 3D 1A 11 00 38 3E 1A 11 16 04 0B 47 
  }


  event cl_CancelInvitation() {
    cl2sv_CancelInvitation_CallStub(mInvitingPlayer);                           //0000 : 1B DA 6E 00 00 01 B0 3F 1A 11 16 
    mInviting = False;                                                          //000B : 14 2D 01 80 FE 19 11 28 
    mInvitingPlayer = None;                                                     //0013 : 0F 01 B0 3F 1A 11 2A 
    //1B DA 6E 00 00 01 B0 3F 1A 11 16 14 2D 01 80 FE 19 11 28 0F 01 B0 3F 1A 11 2A 04 0B 47 
  }


  event cl_AcceptInvitation(Game_Pawn Opponent,int GameID,int Accept) {
    mMiniGameID = GameID;                                                       //0000 : 0F 01 78 05 1A 11 00 E0 41 1A 11 
    cl_LoadMiniGame();                                                          //000B : 1B 31 04 00 00 16 
    mMiniGame.AddPlayer(Opponent);                                              //0011 : 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 00 D8 40 1A 11 16 
    mMiniGame.AddPlayer(Outer);                                                 //0025 : 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 01 00 E4 6B 0F 16 
    cl2sv_AcceptInvitation_CallStub(Opponent,Accept);                           //0039 : 1B DB 6E 00 00 00 D8 40 1A 11 00 58 42 1A 11 16 
    //0F 01 78 05 1A 11 00 E0 41 1A 11 1B 31 04 00 00 16 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 00 
    //D8 40 1A 11 16 19 01 50 D5 19 11 0B 00 00 1B 7C 6E 00 00 01 00 E4 6B 0F 16 1B DB 6E 00 00 00 D8 
    //40 1A 11 00 58 42 1A 11 16 04 0B 47 
  }


  event cl_InvitePlayer(Game_Pawn Opponent,int GameID) {
    mMiniGameID = GameID;                                                       //0000 : 0F 01 78 05 1A 11 00 F8 43 1A 11 
    mInviting = True;                                                           //000B : 14 2D 01 80 FE 19 11 27 
    mInvitationTimeLeft = 30.00000000;                                          //0013 : 0F 01 70 44 1A 11 1E 00 00 F0 41 
    mInvitingPlayer = Opponent;                                                 //001E : 0F 01 B0 3F 1A 11 00 80 43 1A 11 
    if (False) {                                                                //0029 : 07 40 00 28 
      cl2sv_Quickstart_CallStub(Opponent,GameID);                               //002D : 1B DC 6E 00 00 00 80 43 1A 11 00 F8 43 1A 11 16 
    } else {                                                                    //003D : 06 50 00 
      cl2sv_InvitePlayer_CallStub(Opponent,GameID);                             //0040 : 1B DE 6E 00 00 00 80 43 1A 11 00 F8 43 1A 11 16 
    }
    //0F 01 78 05 1A 11 00 F8 43 1A 11 14 2D 01 80 FE 19 11 27 0F 01 70 44 1A 11 1E 00 00 F0 41 0F 01 
    //B0 3F 1A 11 00 80 43 1A 11 07 40 00 28 1B DC 6E 00 00 00 80 43 1A 11 00 F8 43 1A 11 16 06 50 00 
    //1B DE 6E 00 00 00 80 43 1A 11 00 F8 43 1A 11 16 04 0B 47 
  }


  event cl_StartMiniGame(Game_PlayerPawn Opponent) {
    cl2sv_IsPlayerAvailable_CallStub(Opponent);                                 //0000 : 1B A8 6E 00 00 00 98 45 1A 11 16 
    //1B A8 6E 00 00 00 98 45 1A 11 16 04 0B 47 
  }


  event cl_OnFrame(float DeltaTime) {
    if (mInviting) {                                                            //0000 : 07 32 00 2D 01 80 FE 19 11 
      mInvitationTimeLeft -= DeltaTime;                                         //0009 : B9 01 70 44 1A 11 00 00 47 1A 11 16 
      if (mInvitationTimeLeft <= 0) {                                           //0015 : 07 32 00 B2 01 70 44 1A 11 39 3F 25 16 
        OnTimeoutInvitation();                                                  //0022 : 43 78 47 1A 11 49 04 00 00 16 
        cl_CancelInvitation();                                                  //002C : 1B 2D 04 00 00 16 
      }
    }
    if (mGameStarted) {                                                         //0032 : 07 4F 00 2D 01 E0 DC 19 11 
      mMiniGame.OnFrame(DeltaTime);                                             //003B : 19 01 50 D5 19 11 0B 00 00 1B D2 6E 00 00 00 00 47 1A 11 16 
    }
    //07 32 00 2D 01 80 FE 19 11 B9 01 70 44 1A 11 00 00 47 1A 11 16 07 32 00 B2 01 70 44 1A 11 39 3F 
    //25 16 43 78 47 1A 11 49 04 00 00 16 1B 2D 04 00 00 16 07 4F 00 2D 01 E0 DC 19 11 19 01 50 D5 19 
    //11 0B 00 00 1B D2 6E 00 00 00 00 47 1A 11 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    Initialize();                                                               //0006 : 1B 38 04 00 00 16 
    //1C E0 C4 19 11 16 1B 38 04 00 00 16 04 0B 47 
  }


  event cl_LoadMiniGame() {
    if (mMiniGame == None) {                                                    //0000 : 07 2B 00 72 01 50 D5 19 11 2A 16 
      mMiniGame = LoadMiniGame(mMiniGameID);                                    //000B : 0F 01 50 D5 19 11 1B 98 6E 00 00 01 78 05 1A 11 16 
      mMiniGame.Initialize();                                                   //001C : 19 01 50 D5 19 11 06 00 00 1B 38 04 00 00 16 
    }
    //07 2B 00 72 01 50 D5 19 11 2A 16 0F 01 50 D5 19 11 1B 98 6E 00 00 01 78 05 1A 11 16 19 01 50 D5 
    //19 11 06 00 00 1B 38 04 00 00 16 04 0B 47 
  }


  event sv_LoadMiniGame() {
    local MGame_MiniGame miniGame;
    miniGame = mMiniGameManager.GetGroup(mGroupID);                             //0000 : 0F 00 A8 4A 1A 11 19 01 70 D7 19 11 0B 00 04 1B 77 6E 00 00 01 98 1A 31 0F 16 
    if (miniGame == None) {                                                     //001A : 07 5E 00 72 00 A8 4A 1A 11 2A 16 
      miniGame = LoadMiniGame(mMiniGameID);                                     //0025 : 0F 00 A8 4A 1A 11 1B 98 6E 00 00 01 78 05 1A 11 16 
      miniGame.Initialize();                                                    //0036 : 19 00 A8 4A 1A 11 06 00 00 1B 38 04 00 00 16 
      mMiniGameManager.AddGroup(mGroupID,miniGame);                             //0045 : 19 01 70 D7 19 11 10 00 00 1B BE 6E 00 00 01 98 1A 31 0F 00 A8 4A 1A 11 16 
    }
    //0F 00 A8 4A 1A 11 19 01 70 D7 19 11 0B 00 04 1B 77 6E 00 00 01 98 1A 31 0F 16 07 5E 00 72 00 A8 
    //4A 1A 11 2A 16 0F 00 A8 4A 1A 11 1B 98 6E 00 00 01 78 05 1A 11 16 19 00 A8 4A 1A 11 06 00 00 1B 
    //38 04 00 00 16 19 01 70 D7 19 11 10 00 00 1B BE 6E 00 00 01 98 1A 31 0F 00 A8 4A 1A 11 16 04 0B 
    //47 
  }


  function MGame_MiniGame LoadMiniGame(int Id) {
    local MGame_MiniGame miniGame;
    switch (Id) {                                                               //0000 : 05 04 00 80 4C 1A 11 
      case 0 :                                                                  //0007 : 0A 1D 00 25 
        miniGame = new Class'MGame_Chess';                                      //000B : 0F 00 78 4D 1A 11 11 0B 0B 0B 20 80 29 A7 01 
        break;                                                                  //001A : 06 33 00 
      case 1 :                                                                  //001D : 0A 30 00 26 
        miniGame = new Class'MGame_Draughts';                                   //0021 : 0F 00 78 4D 1A 11 11 0B 0B 0B 20 C0 2E A7 01 
      default:                                                                  //0030 : 0A FF FF 
    }
    return miniGame;                                                            //0033 : 04 00 78 4D 1A 11 
    //05 04 00 80 4C 1A 11 0A 1D 00 25 0F 00 78 4D 1A 11 11 0B 0B 0B 20 80 29 A7 01 06 33 00 0A 30 00 
    //26 0F 00 78 4D 1A 11 11 0B 0B 0B 20 C0 2E A7 01 0A FF FF 04 00 78 4D 1A 11 04 0B 47 
  }


  function bool IsPlaying() {
    return mMiniGame != None;                                                   //0000 : 04 77 01 50 D5 19 11 2A 16 
    //04 77 01 50 D5 19 11 2A 16 04 0B 47 
  }


  function bool IsInviting() {
    return mInviting;                                                           //0000 : 04 2D 01 80 FE 19 11 
    //04 2D 01 80 FE 19 11 04 0B 47 
  }


  event Initialize() {
    mGroupID = -1;                                                              //0000 : 0F 01 98 1A 31 0F 1D FF FF FF FF 
    mOfferDrawAccepted = False;                                                 //000B : 14 2D 01 38 52 1A 11 28 
    mSettingsAccepted = False;                                                  //0013 : 14 2D 01 B0 52 1A 11 28 
    mGameStarted = False;                                                       //001B : 14 2D 01 E0 DC 19 11 28 
    //0F 01 98 1A 31 0F 1D FF FF FF FF 14 2D 01 38 52 1A 11 28 14 2D 01 B0 52 1A 11 28 14 2D 01 E0 DC 
    //19 11 28 04 0B 47 
  }


  native function SetThinkTime(float aThinkTime);


  native function float GetThinkTime();


  delegate OnOfferDrawAccepted(Game_Pawn Player,bool Accepted);


  delegate OnOfferDraw(Game_Pawn Player);


  delegate OnResign(Game_Pawn Player);


  delegate OnSwitchTurn(int PlayerID);


  delegate OnMakeMove(int sourceX,int sourceY,int targetX,int targetY);


  delegate OnGameEnd(int Status,Game_Pawn winner);


  delegate OnQuickstart(Game_Pawn Player,int GameID);


  delegate OnStartMiniGame();


  delegate OnLeaveGame(Game_Pawn Opponent);


  delegate OnAcceptSettings();


  delegate OnCancelSettings(Game_Pawn Player);


  delegate OnUpdateSetting(int SettingID,int Value);


  delegate OnTimeoutInvitation();


  delegate OnCancelInvitation();


  delegate OnAcceptInvitation(Game_Pawn Opponent,int Accept);


  delegate OnPlayerInvitation(Game_Pawn Player,int GameType);


  delegate OnPlayerAvailable(Game_Pawn Opponent,bool Available);



