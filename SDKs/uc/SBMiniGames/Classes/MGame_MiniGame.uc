//==============================================================================
//  MGame_MiniGame
//==============================================================================

class MGame_MiniGame extends Object
    native
    dependsOn(Game_Pawn,MGame_MiniGameProxy,MGame_Config)
  ;

  var string mConfigGUI;
  var string mBoardGUI;
  var MGame_Config Config;
  var array<Game_Pawn> mPlayers;
  var int mPlayerTurnID;
  var bool mIsTimedGame;
  var bool ThinkTimeOut;
  var bool Started;
  var (null);


  function Debug() {
    //04 0B 47 
  }


  function Game_Pawn GetCurrentPlayer() {
    return mPlayers[mPlayerTurnID];                                             //0000 : 04 10 01 60 58 83 0F 01 D8 58 83 0F 
    //04 10 01 60 58 83 0F 01 D8 58 83 0F 04 0B 47 
  }


  event Stop() {
    Started = False;                                                            //0000 : 14 2D 01 38 5A 83 0F 28 
    //14 2D 01 38 5A 83 0F 28 04 0B 47 
  }


  function Start() {
    local int Time;
    local int i;
    Started = True;                                                             //0000 : 14 2D 01 38 5A 83 0F 27 
    if (IsTimedGame()) {                                                        //0008 : 07 82 00 1B CF 6E 00 00 16 
      Time = GetMiniGameTime();                                                 //0011 : 0F 00 60 5B 83 0F 1B 83 6E 00 00 16 
      i = 0;                                                                    //001D : 0F 00 B8 5C 83 0F 25 
      while (i < mPlayers.Length) {                                             //0024 : 07 82 00 96 00 B8 5C 83 0F 37 01 D8 58 83 0F 16 
        MGame_MiniGameProxy(mPlayers[i].MiniGameProxy).SetThinkTime(Time);      //0034 : 19 2E 40 24 A7 01 19 10 00 B8 5C 83 0F 01 D8 58 83 0F 05 00 04 01 30 5D 83 0F 0D 00 00 1B 82 6E 00 00 39 3F 00 60 5B 83 0F 16 
        OnTimeUpdate(mPlayers[i],Time);                                         //005E : 43 A8 5D 83 0F 4A 04 00 00 10 00 B8 5C 83 0F 01 D8 58 83 0F 00 60 5B 83 0F 16 
        i++;                                                                    //0078 : A5 00 B8 5C 83 0F 16 
      }
    }
    //14 2D 01 38 5A 83 0F 27 07 82 00 1B CF 6E 00 00 16 0F 00 60 5B 83 0F 1B 83 6E 00 00 16 0F 00 B8 
    //5C 83 0F 25 07 82 00 96 00 B8 5C 83 0F 37 01 D8 58 83 0F 16 19 2E 40 24 A7 01 19 10 00 B8 5C 83 
    //0F 01 D8 58 83 0F 05 00 04 01 30 5D 83 0F 0D 00 00 1B 82 6E 00 00 39 3F 00 60 5B 83 0F 16 43 A8 
    //5D 83 0F 4A 04 00 00 10 00 B8 5C 83 0F 01 D8 58 83 0F 00 60 5B 83 0F 16 A5 00 B8 5C 83 0F 16 06 
    //24 00 04 0B 47 
  }


  function SetThinkTime(Game_Pawn aGamePawn,float aThinkTime) {
    MGame_MiniGameProxy(aGamePawn.MiniGameProxy).SetThinkTime(aThinkTime);      //0000 : 19 2E 40 24 A7 01 19 00 D0 5E 83 0F 05 00 04 01 30 5D 83 0F 0B 00 00 1B 82 6E 00 00 00 48 5F 83 0F 16 
    OnTimeUpdate(aGamePawn,aThinkTime);                                         //0022 : 43 A8 5D 83 0F 4A 04 00 00 00 D0 5E 83 0F 39 44 00 48 5F 83 0F 16 
    //19 2E 40 24 A7 01 19 00 D0 5E 83 0F 05 00 04 01 30 5D 83 0F 0B 00 00 1B 82 6E 00 00 00 48 5F 83 
    //0F 16 43 A8 5D 83 0F 4A 04 00 00 00 D0 5E 83 0F 39 44 00 48 5F 83 0F 16 04 0B 47 
  }


  function SwitchTurn() {
    //04 0B 47 
  }


  function SetPlayerTurnID(int PlayerID) {
    mPlayerTurnID = PlayerID;                                                   //0000 : 0F 01 60 58 83 0F 00 78 15 31 0F 
    //0F 01 60 58 83 0F 00 78 15 31 0F 04 0B 47 
  }


  function SetPlayerTurn(Game_Pawn Player) {
    local int i;
    local bool found;
    found = False;                                                              //0000 : 14 2D 00 08 18 31 0F 28 
    i = 0;                                                                      //0008 : 0F 00 80 18 31 0F 25 
    while (i < mPlayers.Length && !found) {                                     //000F : 07 5E 00 82 96 00 80 18 31 0F 37 01 D8 58 83 0F 16 18 09 00 81 2D 00 08 18 31 0F 16 16 
      if (mPlayers[i] == Player) {                                              //002C : 07 54 00 72 10 00 80 18 31 0F 01 D8 58 83 0F 00 E0 16 31 0F 16 
        found = True;                                                           //0041 : 14 2D 00 08 18 31 0F 27 
        SetPlayerTurnID(i);                                                     //0049 : 1B 7E 6E 00 00 00 80 18 31 0F 16 
      }
      i++;                                                                      //0054 : A5 00 80 18 31 0F 16 
    }
    //14 2D 00 08 18 31 0F 28 0F 00 80 18 31 0F 25 07 5E 00 82 96 00 80 18 31 0F 37 01 D8 58 83 0F 16 
    //18 09 00 81 2D 00 08 18 31 0F 16 16 07 54 00 72 10 00 80 18 31 0F 01 D8 58 83 0F 00 E0 16 31 0F 
    //16 14 2D 00 08 18 31 0F 27 1B 7E 6E 00 00 00 80 18 31 0F 16 A5 00 80 18 31 0F 16 06 0F 00 04 0B 
    //47 
  }


  function RemovePlayer(Game_Pawn Player) {
    local bool found;
    local int i;
    found = False;                                                              //0000 : 14 2D 00 20 1A 31 0F 28 
    MGame_MiniGameProxy(Player.MiniGameProxy).mGroupID = -1;                    //0008 : 0F 19 2E 40 24 A7 01 19 00 A8 19 31 0F 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 1D FF FF FF FF 
    i = 0;                                                                      //002A : 0F 00 10 1B 31 0F 25 
    while (i < mPlayers.Length - 1) {                                           //0031 : 07 8E 00 96 00 10 1B 31 0F 93 37 01 D8 58 83 0F 26 16 16 
      if (mPlayers[i] == Player) {                                              //0044 : 07 61 00 72 10 00 10 1B 31 0F 01 D8 58 83 0F 00 A8 19 31 0F 16 
        found = True;                                                           //0059 : 14 2D 00 20 1A 31 0F 27 
      }
      if (found) {                                                              //0061 : 07 84 00 2D 00 20 1A 31 0F 
        mPlayers[i] = mPlayers[i + 1];                                          //006A : 0F 10 00 10 1B 31 0F 01 D8 58 83 0F 10 92 00 10 1B 31 0F 26 16 01 D8 58 83 0F 
      }
      i++;                                                                      //0084 : A5 00 10 1B 31 0F 16 
    }
    if (found
      || !found
      && mPlayers[mPlayers.Length - 1] == Player) {//008E : 07 CF 00 84 2D 00 20 1A 31 0F 18 24 00 82 81 2D 00 20 1A 31 0F 16 18 17 00 72 10 93 37 01 D8 58 83 0F 26 16 01 D8 58 83 0F 00 A8 19 31 0F 16 16 16 
      mPlayers.Length = mPlayers.Length - 1;                                    //00BF : 0F 37 01 D8 58 83 0F 93 37 01 D8 58 83 0F 26 16 
    }
    //14 2D 00 20 1A 31 0F 28 0F 19 2E 40 24 A7 01 19 00 A8 19 31 0F 05 00 04 01 30 5D 83 0F 05 00 04 
    //01 98 1A 31 0F 1D FF FF FF FF 0F 00 10 1B 31 0F 25 07 8E 00 96 00 10 1B 31 0F 93 37 01 D8 58 83 
    //0F 26 16 16 07 61 00 72 10 00 10 1B 31 0F 01 D8 58 83 0F 00 A8 19 31 0F 16 14 2D 00 20 1A 31 0F 
    //27 07 84 00 2D 00 20 1A 31 0F 0F 10 00 10 1B 31 0F 01 D8 58 83 0F 10 92 00 10 1B 31 0F 26 16 01 
    //D8 58 83 0F A5 00 10 1B 31 0F 16 06 31 00 07 CF 00 84 2D 00 20 1A 31 0F 18 24 00 82 81 2D 00 20 
    //1A 31 0F 16 18 17 00 72 10 93 37 01 D8 58 83 0F 26 16 01 D8 58 83 0F 00 A8 19 31 0F 16 16 16 0F 
    //37 01 D8 58 83 0F 93 37 01 D8 58 83 0F 26 16 04 0B 47 
  }


  function AddPlayer(Game_Pawn Player) {
    mPlayers.Length = mPlayers.Length + 1;                                      //0000 : 0F 37 01 D8 58 83 0F 92 37 01 D8 58 83 0F 26 16 
    mPlayers[mPlayers.Length - 1] = Player;                                     //0010 : 0F 10 93 37 01 D8 58 83 0F 26 16 01 D8 58 83 0F 00 38 1C 31 0F 
    //0F 37 01 D8 58 83 0F 92 37 01 D8 58 83 0F 26 16 0F 10 93 37 01 D8 58 83 0F 26 16 01 D8 58 83 0F 
    //00 38 1C 31 0F 04 0B 47 
  }


  function Initialize() {
    Config.Initialize();                                                        //0000 : 19 01 A0 1D 31 0F 06 00 00 1B 38 04 00 00 16 
    //19 01 A0 1D 31 0F 06 00 00 1B 38 04 00 00 16 04 0B 47 
  }


  function int GetMiniGameTime() {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  function bool IsTimedGame() {
    return mIsTimedGame;                                                        //0000 : 04 2D 01 D0 20 31 0F 
    //04 2D 01 D0 20 31 0F 04 0B 47 
  }


  native function int GetPlayerTurnID();


  native function Game_Pawn GetWinner();


  native function int GetResult();


  native function OnFrame(float aDeltaTime);


  delegate OnTimeUpdate(Game_Pawn Player,int aSeconds);



