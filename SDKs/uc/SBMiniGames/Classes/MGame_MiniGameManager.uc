//==============================================================================
//  MGame_MiniGameManager
//==============================================================================

class MGame_MiniGameManager extends Game_MiniGameManager
    native
    dependsOn(Game_Pawn,MGame_MiniGameProxy,MGame_MiniGame,MGame_Chess,MGame_BoardGame,Class)
  ;

  var array<int> mFreeIDs;
  var int mLastID;
  var int mMiniGames;


  event sv_Debug(Game_Pawn aPlayer) {
    local int i;
    local Game_Pawn Opponent;
    local MGame_MiniGame miniGame;
    miniGame = MGame_BoardGame(GetGroup(MGame_MiniGameProxy(aPlayer.MiniGameProxy).mGroupID));//0000 : 0F 00 60 05 27 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 C0 03 27 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 
    if (miniGame != None) {                                                     //002D : 07 B7 00 77 00 60 05 27 11 2A 16 
      miniGame.Debug();                                                         //0038 : 19 00 60 05 27 11 06 00 00 1B 4B 03 00 00 16 
      i = 0;                                                                    //0047 : 0F 00 D8 05 27 11 25 
      while (i < miniGame.mPlayers.Length) {                                    //004E : 07 B7 00 96 00 D8 05 27 11 37 19 00 60 05 27 11 05 00 00 01 D8 58 83 0F 16 
        Opponent = miniGame.mPlayers[i];                                        //0067 : 0F 00 50 06 27 11 10 00 D8 05 27 11 19 00 60 05 27 11 05 00 00 01 D8 58 83 0F 
        if (Opponent != aPlayer) {                                              //0081 : 07 AD 00 77 00 50 06 27 11 00 C0 03 27 11 16 
          MGame_MiniGameProxy(Opponent.MiniGameProxy).sv2cl_DebugMinigame_CallStub();//0090 : 19 2E 40 24 A7 01 19 00 50 06 27 11 05 00 04 01 30 5D 83 0F 06 00 00 1B CC 6E 00 00 16 
        }
        i++;                                                                    //00AD : A5 00 D8 05 27 11 16 
      }
    }
    //0F 00 60 05 27 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 C0 03 27 11 05 00 04 01 
    //30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 07 B7 00 77 00 60 05 27 11 2A 16 19 00 60 05 27 11 06 00 
    //00 1B 4B 03 00 00 16 0F 00 D8 05 27 11 25 07 B7 00 96 00 D8 05 27 11 37 19 00 60 05 27 11 05 00 
    //00 01 D8 58 83 0F 16 0F 00 50 06 27 11 10 00 D8 05 27 11 19 00 60 05 27 11 05 00 00 01 D8 58 83 
    //0F 07 AD 00 77 00 50 06 27 11 00 C0 03 27 11 16 19 2E 40 24 A7 01 19 00 50 06 27 11 05 00 04 01 
    //30 5D 83 0F 06 00 00 1B CC 6E 00 00 16 A5 00 D8 05 27 11 16 06 4E 00 04 0B 47 
  }


  event sv_MakePromotion(Game_Pawn Player,int X,int Y,int Piece) {
    local int i;
    local Game_Pawn Opponent;
    local MGame_BoardGame miniGame;
    miniGame = MGame_BoardGame(GetGroup(MGame_MiniGameProxy(Player.MiniGameProxy).mGroupID));//0000 : 0F 00 40 09 27 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 78 07 27 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 
    MGame_Chess(miniGame).MakePromotion(X,Y,Piece,False);                       //002D : 19 2E 80 29 A7 01 00 40 09 27 11 16 00 00 1B 93 6E 00 00 00 B8 09 27 11 00 30 0A 27 11 00 A8 0A 27 11 28 16 
    i = 0;                                                                      //0051 : 0F 00 20 0B 27 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //0058 : 07 D0 00 96 00 20 0B 27 11 37 19 00 40 09 27 11 05 00 00 01 D8 58 83 0F 16 
      Opponent = miniGame.mPlayers[i];                                          //0071 : 0F 00 98 0B 27 11 10 00 20 0B 27 11 19 00 40 09 27 11 05 00 00 01 D8 58 83 0F 
      if (Opponent != Player) {                                                 //008B : 07 C6 00 77 00 98 0B 27 11 00 78 07 27 11 16 
        MGame_MiniGameProxy(Opponent.MiniGameProxy).sv2cl_MakePromotion_CallStub(X,Y,Piece);//009A : 19 2E 40 24 A7 01 19 00 98 0B 27 11 05 00 04 01 30 5D 83 0F 15 00 00 1B AA 6E 00 00 00 B8 09 27 11 00 30 0A 27 11 00 A8 0A 27 11 16 
      }
      i++;                                                                      //00C6 : A5 00 20 0B 27 11 16 
    }
    //0F 00 40 09 27 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 78 07 27 11 05 00 04 01 
    //30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 19 2E 80 29 A7 01 00 40 09 27 11 16 00 00 1B 93 6E 00 00 
    //00 B8 09 27 11 00 30 0A 27 11 00 A8 0A 27 11 28 16 0F 00 20 0B 27 11 25 07 D0 00 96 00 20 0B 27 
    //11 37 19 00 40 09 27 11 05 00 00 01 D8 58 83 0F 16 0F 00 98 0B 27 11 10 00 20 0B 27 11 19 00 40 
    //09 27 11 05 00 00 01 D8 58 83 0F 07 C6 00 77 00 98 0B 27 11 00 78 07 27 11 16 19 2E 40 24 A7 01 
    //19 00 98 0B 27 11 05 00 04 01 30 5D 83 0F 15 00 00 1B AA 6E 00 00 00 B8 09 27 11 00 30 0A 27 11 
    //00 A8 0A 27 11 16 A5 00 20 0B 27 11 16 06 58 00 04 0B 47 
  }


  event sv_AcceptDraw(Game_Pawn Player,bool Accepted) {
    local int i;
    local Game_Pawn receiver;
    local int GroupId;
    local MGame_MiniGame miniGame;
    GroupId = MGame_MiniGameProxy(Player.MiniGameProxy).mGroupID;               //0000 : 0F 00 30 0F 27 11 19 2E 40 24 A7 01 19 00 C0 0C 27 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
    MGame_MiniGameProxy(Player.MiniGameProxy).mOfferDrawAccepted = Accepted;    //0022 : 14 19 2E 40 24 A7 01 19 00 C0 0C 27 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 38 52 1A 11 2D 00 A8 0F 27 11 
    miniGame = GetGroup(GroupId);                                               //0046 : 0F 00 20 10 27 11 1B 77 6E 00 00 00 30 0F 27 11 16 
    if (Accepted) {                                                             //0057 : 07 D8 00 2D 00 A8 0F 27 11 
      if (sv_AllPlayersAcceptedDraw(GroupId)) {                                 //0060 : 07 D5 00 1B 62 04 00 00 00 30 0F 27 11 16 
        i = 0;                                                                  //006E : 0F 00 98 10 27 11 25 
        while (i < miniGame.mPlayers.Length) {                                  //0075 : 07 D5 00 96 00 98 10 27 11 37 19 00 20 10 27 11 05 00 00 01 D8 58 83 0F 16 
          receiver = miniGame.mPlayers[i];                                      //008E : 0F 00 10 11 27 11 10 00 98 10 27 11 19 00 20 10 27 11 05 00 00 01 D8 58 83 0F 
          MGame_MiniGameProxy(receiver.MiniGameProxy).sv2cl_OfferDrawAccepted_CallStub(Player,True);//00A8 : 19 2E 40 24 A7 01 19 00 10 11 27 11 05 00 04 01 30 5D 83 0F 0C 00 00 1B 99 6E 00 00 00 C0 0C 27 11 27 16 
          i++;                                                                  //00CB : A5 00 98 10 27 11 16 
        }
      }
    } else {                                                                    //00D5 : 06 4E 01 
      i = 0;                                                                    //00D8 : 0F 00 98 10 27 11 25 
      while (i < miniGame.mPlayers.Length) {                                    //00DF : 07 4E 01 96 00 98 10 27 11 37 19 00 20 10 27 11 05 00 00 01 D8 58 83 0F 16 
        receiver = miniGame.mPlayers[i];                                        //00F8 : 0F 00 10 11 27 11 10 00 98 10 27 11 19 00 20 10 27 11 05 00 00 01 D8 58 83 0F 
        if (receiver != Player) {                                               //0112 : 07 44 01 77 00 10 11 27 11 00 C0 0C 27 11 16 
          MGame_MiniGameProxy(receiver.MiniGameProxy).sv2cl_OfferDrawAccepted_CallStub(Player,False);//0121 : 19 2E 40 24 A7 01 19 00 10 11 27 11 05 00 04 01 30 5D 83 0F 0C 00 00 1B 99 6E 00 00 00 C0 0C 27 11 28 16 
        }
        i++;                                                                    //0144 : A5 00 98 10 27 11 16 
      }
    }
    //0F 00 30 0F 27 11 19 2E 40 24 A7 01 19 00 C0 0C 27 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 
    //31 0F 14 19 2E 40 24 A7 01 19 00 C0 0C 27 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 38 52 1A 11 
    //2D 00 A8 0F 27 11 0F 00 20 10 27 11 1B 77 6E 00 00 00 30 0F 27 11 16 07 D8 00 2D 00 A8 0F 27 11 
    //07 D5 00 1B 62 04 00 00 00 30 0F 27 11 16 0F 00 98 10 27 11 25 07 D5 00 96 00 98 10 27 11 37 19 
    //00 20 10 27 11 05 00 00 01 D8 58 83 0F 16 0F 00 10 11 27 11 10 00 98 10 27 11 19 00 20 10 27 11 
    //05 00 00 01 D8 58 83 0F 19 2E 40 24 A7 01 19 00 10 11 27 11 05 00 04 01 30 5D 83 0F 0C 00 00 1B 
    //99 6E 00 00 00 C0 0C 27 11 27 16 A5 00 98 10 27 11 16 06 75 00 06 4E 01 0F 00 98 10 27 11 25 07 
    //4E 01 96 00 98 10 27 11 37 19 00 20 10 27 11 05 00 00 01 D8 58 83 0F 16 0F 00 10 11 27 11 10 00 
    //98 10 27 11 19 00 20 10 27 11 05 00 00 01 D8 58 83 0F 07 44 01 77 00 10 11 27 11 00 C0 0C 27 11 
    //16 19 2E 40 24 A7 01 19 00 10 11 27 11 05 00 04 01 30 5D 83 0F 0C 00 00 1B 99 6E 00 00 00 C0 0C 
    //27 11 28 16 A5 00 98 10 27 11 16 06 DF 00 04 0B 47 
  }


  event bool sv_AllPlayersAcceptedDraw(int GroupId) {
    local int i;
    local MGame_MiniGame miniGame;
    miniGame = GetGroup(GroupId);                                               //0000 : 0F 00 B0 12 27 11 1B 77 6E 00 00 00 38 12 27 11 16 
    i = 0;                                                                      //0011 : 0F 00 28 13 27 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //0018 : 07 6E 00 96 00 28 13 27 11 37 19 00 B0 12 27 11 05 00 00 01 D8 58 83 0F 16 
      if (!MGame_MiniGameProxy(miniGame.mPlayers[i].MiniGameProxy).mOfferDrawAccepted) {//0031 : 07 64 00 81 19 2E 40 24 A7 01 19 10 00 28 13 27 11 19 00 B0 12 27 11 05 00 00 01 D8 58 83 0F 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 38 52 1A 11 16 
        return False;                                                           //0062 : 04 28 
      }
      i++;                                                                      //0064 : A5 00 28 13 27 11 16 
    }
    return True;                                                                //006E : 04 27 
    //0F 00 B0 12 27 11 1B 77 6E 00 00 00 38 12 27 11 16 0F 00 28 13 27 11 25 07 6E 00 96 00 28 13 27 
    //11 37 19 00 B0 12 27 11 05 00 00 01 D8 58 83 0F 16 07 64 00 81 19 2E 40 24 A7 01 19 10 00 28 13 
    //27 11 19 00 B0 12 27 11 05 00 00 01 D8 58 83 0F 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 38 52 1A 
    //11 16 04 28 A5 00 28 13 27 11 16 06 18 00 04 27 04 0B 47 
  }


  event sv_OfferDraw(Game_Pawn Player) {
    local int i;
    local Game_Pawn Opponent;
    local MGame_BoardGame miniGame;
    miniGame = MGame_BoardGame(GetGroup(MGame_MiniGameProxy(Player.MiniGameProxy).mGroupID));//0000 : 0F 00 68 61 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 C8 14 27 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 
    MGame_MiniGameProxy(Player.MiniGameProxy).mOfferDrawAccepted = True;        //002D : 14 19 2E 40 24 A7 01 19 00 C8 14 27 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 38 52 1A 11 27 
    i = 0;                                                                      //004C : 0F 00 E0 61 2C 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //0053 : 07 E0 00 96 00 E0 61 2C 11 37 19 00 68 61 2C 11 05 00 00 01 D8 58 83 0F 16 
      Opponent = miniGame.mPlayers[i];                                          //006C : 0F 00 58 62 2C 11 10 00 E0 61 2C 11 19 00 68 61 2C 11 05 00 00 01 D8 58 83 0F 
      if (Opponent != Player) {                                                 //0086 : 07 D6 00 77 00 58 62 2C 11 00 C8 14 27 11 16 
        MGame_MiniGameProxy(Opponent.MiniGameProxy).mOfferDrawAccepted = False; //0095 : 14 19 2E 40 24 A7 01 19 00 58 62 2C 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 38 52 1A 11 28 
        MGame_MiniGameProxy(Opponent.MiniGameProxy).sv2cl_OfferDraw_CallStub(Player);//00B4 : 19 2E 40 24 A7 01 19 00 58 62 2C 11 05 00 04 01 30 5D 83 0F 0B 00 00 1B AB 6E 00 00 00 C8 14 27 11 16 
      }
      i++;                                                                      //00D6 : A5 00 E0 61 2C 11 16 
    }
    //0F 00 68 61 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 C8 14 27 11 05 00 04 01 
    //30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 14 19 2E 40 24 A7 01 19 00 C8 14 27 11 05 00 04 01 30 5D 
    //83 0F 06 00 04 2D 01 38 52 1A 11 27 0F 00 E0 61 2C 11 25 07 E0 00 96 00 E0 61 2C 11 37 19 00 68 
    //61 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 58 62 2C 11 10 00 E0 61 2C 11 19 00 68 61 2C 11 05 00 
    //00 01 D8 58 83 0F 07 D6 00 77 00 58 62 2C 11 00 C8 14 27 11 16 14 19 2E 40 24 A7 01 19 00 58 62 
    //2C 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 38 52 1A 11 28 19 2E 40 24 A7 01 19 00 58 62 2C 11 
    //05 00 04 01 30 5D 83 0F 0B 00 00 1B AB 6E 00 00 00 C8 14 27 11 16 A5 00 E0 61 2C 11 16 06 53 00 
    //04 0B 47 
  }


  event sv_Resign(Game_Pawn Player) {
    local int i;
    local Game_Pawn Opponent;
    local MGame_BoardGame miniGame;
    miniGame = MGame_BoardGame(GetGroup(MGame_MiniGameProxy(Player.MiniGameProxy).mGroupID));//0000 : 0F 00 18 65 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 80 63 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 
    miniGame.Stop();                                                            //002D : 19 00 18 65 2C 11 06 00 00 1B 6F 02 00 00 16 
    i = 0;                                                                      //003C : 0F 00 90 65 2C 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //0043 : 07 B1 00 96 00 90 65 2C 11 37 19 00 18 65 2C 11 05 00 00 01 D8 58 83 0F 16 
      Opponent = miniGame.mPlayers[i];                                          //005C : 0F 00 08 66 2C 11 10 00 90 65 2C 11 19 00 18 65 2C 11 05 00 00 01 D8 58 83 0F 
      if (Opponent != Player) {                                                 //0076 : 07 A7 00 77 00 08 66 2C 11 00 80 63 2C 11 16 
        MGame_MiniGameProxy(Opponent.MiniGameProxy).sv2cl_Resign_CallStub(Player);//0085 : 19 2E 40 24 A7 01 19 00 08 66 2C 11 05 00 04 01 30 5D 83 0F 0B 00 00 1B AC 6E 00 00 00 80 63 2C 11 16 
      }
      i++;                                                                      //00A7 : A5 00 90 65 2C 11 16 
    }
    //0F 00 18 65 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 80 63 2C 11 05 00 04 01 
    //30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 19 00 18 65 2C 11 06 00 00 1B 6F 02 00 00 16 0F 00 90 65 
    //2C 11 25 07 B1 00 96 00 90 65 2C 11 37 19 00 18 65 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 08 66 
    //2C 11 10 00 90 65 2C 11 19 00 18 65 2C 11 05 00 00 01 D8 58 83 0F 07 A7 00 77 00 08 66 2C 11 00 
    //80 63 2C 11 16 19 2E 40 24 A7 01 19 00 08 66 2C 11 05 00 04 01 30 5D 83 0F 0B 00 00 1B AC 6E 00 
    //00 00 80 63 2C 11 16 A5 00 90 65 2C 11 16 06 43 00 04 0B 47 
  }


  event sv_SwitchTurn(Game_Pawn aCurrentPlayer) {
    local int i;
    local MGame_BoardGame miniGame;
    local Game_Pawn Player;
    local Game_Pawn winner;
    local int endStatus;
    local float thinkTimeLeft;
    thinkTimeLeft = MGame_MiniGameProxy(aCurrentPlayer.MiniGameProxy).GetThinkTime();//0000 : 0F 00 A0 69 2C 11 19 2E 40 24 A7 01 19 00 30 67 2C 11 05 00 04 01 30 5D 83 0F 06 00 04 1B DD 6E 00 00 16 
    miniGame = MGame_BoardGame(GetGroup(MGame_MiniGameProxy(aCurrentPlayer.MiniGameProxy).mGroupID));//0023 : 0F 00 18 6A 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 30 67 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 
    miniGame.SwitchTurn();                                                      //0050 : 19 00 18 6A 2C 11 06 00 00 1B 8D 6E 00 00 16 
    endStatus = miniGame.GetResult();                                           //005F : 0F 00 90 6A 2C 11 19 00 18 6A 2C 11 06 00 04 1B D1 6E 00 00 16 
    if (endStatus != Class'MGame_MiniGameProxy'.0) {                            //0074 : 07 9D 00 9B 00 90 6A 2C 11 12 20 40 24 A7 01 01 00 04 25 16 
      winner = miniGame.GetWinner();                                            //0088 : 0F 00 08 6B 2C 11 19 00 18 6A 2C 11 06 00 04 1B D0 6E 00 00 16 
    }
    i = 0;                                                                      //009D : 0F 00 80 6B 2C 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //00A4 : 07 4D 01 96 00 80 6B 2C 11 37 19 00 18 6A 2C 11 05 00 00 01 D8 58 83 0F 16 
      Player = miniGame.mPlayers[i];                                            //00BD : 0F 00 F8 6B 2C 11 10 00 80 6B 2C 11 19 00 18 6A 2C 11 05 00 00 01 D8 58 83 0F 
      MGame_MiniGameProxy(Player.MiniGameProxy).sv2cl_SwitchTurn_CallStub(miniGame.GetPlayerTurnID(),thinkTimeLeft);//00D7 : 19 2E 40 24 A7 01 19 00 F8 6B 2C 11 05 00 04 01 30 5D 83 0F 1A 00 00 1B 9B 6E 00 00 19 00 18 6A 2C 11 06 00 04 1B 8B 6E 00 00 16 00 A0 69 2C 11 16 
      if (endStatus != Class'MGame_MiniGameProxy'.0) {                          //0108 : 07 43 01 9B 00 90 6A 2C 11 12 20 40 24 A7 01 01 00 04 25 16 
        MGame_MiniGameProxy(Player.MiniGameProxy).sv2cl_GameEnd_CallStub(endStatus,winner);//011C : 19 2E 40 24 A7 01 19 00 F8 6B 2C 11 05 00 04 01 30 5D 83 0F 10 00 00 1B 8C 6E 00 00 00 90 6A 2C 11 00 08 6B 2C 11 16 
      }
      i++;                                                                      //0143 : A5 00 80 6B 2C 11 16 
    }
    //0F 00 A0 69 2C 11 19 2E 40 24 A7 01 19 00 30 67 2C 11 05 00 04 01 30 5D 83 0F 06 00 04 1B DD 6E 
    //00 00 16 0F 00 18 6A 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 30 67 2C 11 05 
    //00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 19 00 18 6A 2C 11 06 00 00 1B 8D 6E 00 00 16 0F 
    //00 90 6A 2C 11 19 00 18 6A 2C 11 06 00 04 1B D1 6E 00 00 16 07 9D 00 9B 00 90 6A 2C 11 12 20 40 
    //24 A7 01 01 00 04 25 16 0F 00 08 6B 2C 11 19 00 18 6A 2C 11 06 00 04 1B D0 6E 00 00 16 0F 00 80 
    //6B 2C 11 25 07 4D 01 96 00 80 6B 2C 11 37 19 00 18 6A 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 F8 
    //6B 2C 11 10 00 80 6B 2C 11 19 00 18 6A 2C 11 05 00 00 01 D8 58 83 0F 19 2E 40 24 A7 01 19 00 F8 
    //6B 2C 11 05 00 04 01 30 5D 83 0F 1A 00 00 1B 9B 6E 00 00 19 00 18 6A 2C 11 06 00 04 1B 8B 6E 00 
    //00 16 00 A0 69 2C 11 16 07 43 01 9B 00 90 6A 2C 11 12 20 40 24 A7 01 01 00 04 25 16 19 2E 40 24 
    //A7 01 19 00 F8 6B 2C 11 05 00 04 01 30 5D 83 0F 10 00 00 1B 8C 6E 00 00 00 90 6A 2C 11 00 08 6B 
    //2C 11 16 A5 00 80 6B 2C 11 16 06 A4 00 04 0B 47 
  }


  event sv_MakeMove(Game_Pawn Mover,int originX,int originY,int destinationX,int destinationY) {
    local int i;
    local Game_Pawn Player;
    local MGame_BoardGame miniGame;
    miniGame = MGame_BoardGame(GetGroup(MGame_MiniGameProxy(Mover.MiniGameProxy).mGroupID));//0000 : 0F 00 98 6D 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 20 6D 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 
    if (miniGame.ValidMove(originX,originY,destinationX,destinationY)) {        //002D : 07 FD 00 19 00 98 6D 2C 11 1A 00 04 1B 76 6E 00 00 00 10 6E 2C 11 00 88 6E 2C 11 00 00 6F 2C 11 00 78 6F 2C 11 16 
      miniGame.MakeMove(originX,originY,destinationX,destinationY);             //0053 : 19 00 98 6D 2C 11 1A 00 04 1B 88 6E 00 00 00 10 6E 2C 11 00 88 6E 2C 11 00 00 6F 2C 11 00 78 6F 2C 11 16 
      i = 0;                                                                    //0076 : 0F 00 F0 6F 2C 11 25 
      while (i < miniGame.mPlayers.Length) {                                    //007D : 07 FA 00 96 00 F0 6F 2C 11 37 19 00 98 6D 2C 11 05 00 00 01 D8 58 83 0F 16 
        Player = miniGame.mPlayers[i];                                          //0096 : 0F 00 68 70 2C 11 10 00 F0 6F 2C 11 19 00 98 6D 2C 11 05 00 00 01 D8 58 83 0F 
        if (Player != Mover) {                                                  //00B0 : 07 F0 00 77 00 68 70 2C 11 00 20 6D 2C 11 16 
          MGame_MiniGameProxy(Player.MiniGameProxy).sv2cl_MakeMove_CallStub(originX,originY,destinationX,destinationY);//00BF : 19 2E 40 24 A7 01 19 00 68 70 2C 11 05 00 04 01 30 5D 83 0F 1A 00 00 1B AD 6E 00 00 00 10 6E 2C 11 00 88 6E 2C 11 00 00 6F 2C 11 00 78 6F 2C 11 16 
        }
        i++;                                                                    //00F0 : A5 00 F0 6F 2C 11 16 
      }
      goto jl00FD;                                                              //00FA : 06 FD 00 
    }
    //0F 00 98 6D 2C 11 2E 80 14 A7 01 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 20 6D 2C 11 05 00 04 01 
    //30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 07 FD 00 19 00 98 6D 2C 11 1A 00 04 1B 76 6E 00 00 00 10 
    //6E 2C 11 00 88 6E 2C 11 00 00 6F 2C 11 00 78 6F 2C 11 16 19 00 98 6D 2C 11 1A 00 04 1B 88 6E 00 
    //00 00 10 6E 2C 11 00 88 6E 2C 11 00 00 6F 2C 11 00 78 6F 2C 11 16 0F 00 F0 6F 2C 11 25 07 FA 00 
    //96 00 F0 6F 2C 11 37 19 00 98 6D 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 68 70 2C 11 10 00 F0 6F 
    //2C 11 19 00 98 6D 2C 11 05 00 00 01 D8 58 83 0F 07 F0 00 77 00 68 70 2C 11 00 20 6D 2C 11 16 19 
    //2E 40 24 A7 01 19 00 68 70 2C 11 05 00 04 01 30 5D 83 0F 1A 00 00 1B AD 6E 00 00 00 10 6E 2C 11 
    //00 88 6E 2C 11 00 00 6F 2C 11 00 78 6F 2C 11 16 A5 00 F0 6F 2C 11 16 06 7D 00 06 FD 00 04 0B 47 
    //
  }


  event sv_Quickstart(int GroupId,int GameID) {
    local MGame_MiniGame miniGame;
    miniGame = GetGroup(GroupId);                                               //0000 : 0F 00 08 72 2C 11 1B 77 6E 00 00 00 90 71 2C 11 16 
    if (miniGame.mPlayers.Length == 2) {                                        //0011 : 07 A1 00 9A 37 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 2C 02 16 
      MGame_MiniGameProxy(miniGame.mPlayers[1].MiniGameProxy).sv2cl_Quickstart_CallStub(miniGame.mPlayers[0],GameID);//0027 : 19 2E 40 24 A7 01 19 10 26 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 05 00 04 01 30 5D 83 0F 1B 00 00 1B A5 6E 00 00 10 25 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 00 80 72 2C 11 16 
      MGame_MiniGameProxy(miniGame.mPlayers[0].MiniGameProxy).sv2cl_Quickstart_CallStub(miniGame.mPlayers[1],GameID);//0064 : 19 2E 40 24 A7 01 19 10 25 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 05 00 04 01 30 5D 83 0F 1B 00 00 1B A5 6E 00 00 10 26 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 00 80 72 2C 11 16 
    }
    //0F 00 08 72 2C 11 1B 77 6E 00 00 00 90 71 2C 11 16 07 A1 00 9A 37 19 00 08 72 2C 11 05 00 00 01 
    //D8 58 83 0F 2C 02 16 19 2E 40 24 A7 01 19 10 26 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 05 00 
    //04 01 30 5D 83 0F 1B 00 00 1B A5 6E 00 00 10 25 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 00 80 
    //72 2C 11 16 19 2E 40 24 A7 01 19 10 25 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 05 00 04 01 30 
    //5D 83 0F 1B 00 00 1B A5 6E 00 00 10 26 19 00 08 72 2C 11 05 00 00 01 D8 58 83 0F 00 80 72 2C 11 
    //16 04 0B 47 
  }


  event sv_StartMiniGame(int aGroupID) {
    local int i;
    local Game_Pawn Player;
    local MGame_MiniGame miniGame;
    miniGame = GetGroup(aGroupID);                                              //0000 : 0F 00 90 75 2C 11 1B 77 6E 00 00 00 A8 73 2C 11 16 
    miniGame.Start();                                                           //0011 : 19 00 90 75 2C 11 06 00 00 1B A9 1C 00 00 16 
    i = 0;                                                                      //0020 : 0F 00 08 76 2C 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //0027 : 07 EC 00 96 00 08 76 2C 11 37 19 00 90 75 2C 11 05 00 00 01 D8 58 83 0F 16 
      Player = miniGame.mPlayers[i];                                            //0040 : 0F 00 80 76 2C 11 10 00 08 76 2C 11 19 00 90 75 2C 11 05 00 00 01 D8 58 83 0F 
      MGame_MiniGameProxy(Player.MiniGameProxy).SetThinkTime(miniGame.GetMiniGameTime());//005A : 19 2E 40 24 A7 01 19 00 80 76 2C 11 05 00 04 01 30 5D 83 0F 17 00 00 1B 82 6E 00 00 39 3F 19 00 90 75 2C 11 06 00 04 1B 83 6E 00 00 16 16 
      MGame_MiniGameProxy(Player.MiniGameProxy).sv2cl_StartMiniGame_CallStub(); //0088 : 19 2E 40 24 A7 01 19 00 80 76 2C 11 05 00 04 01 30 5D 83 0F 06 00 00 1B AE 6E 00 00 16 
      MGame_MiniGameProxy(Player.MiniGameProxy).sv2cl_SwitchTurn_CallStub(miniGame.GetPlayerTurnID(),miniGame.GetMiniGameTime());//00A5 : 19 2E 40 24 A7 01 19 00 80 76 2C 11 05 00 04 01 30 5D 83 0F 26 00 00 1B 9B 6E 00 00 19 00 90 75 2C 11 06 00 04 1B 8B 6E 00 00 16 39 3F 19 00 90 75 2C 11 06 00 04 1B 83 6E 00 00 16 16 
      i++;                                                                      //00E2 : A5 00 08 76 2C 11 16 
    }
    //0F 00 90 75 2C 11 1B 77 6E 00 00 00 A8 73 2C 11 16 19 00 90 75 2C 11 06 00 00 1B A9 1C 00 00 16 
    //0F 00 08 76 2C 11 25 07 EC 00 96 00 08 76 2C 11 37 19 00 90 75 2C 11 05 00 00 01 D8 58 83 0F 16 
    //0F 00 80 76 2C 11 10 00 08 76 2C 11 19 00 90 75 2C 11 05 00 00 01 D8 58 83 0F 19 2E 40 24 A7 01 
    //19 00 80 76 2C 11 05 00 04 01 30 5D 83 0F 17 00 00 1B 82 6E 00 00 39 3F 19 00 90 75 2C 11 06 00 
    //04 1B 83 6E 00 00 16 16 19 2E 40 24 A7 01 19 00 80 76 2C 11 05 00 04 01 30 5D 83 0F 06 00 00 1B 
    //AE 6E 00 00 16 19 2E 40 24 A7 01 19 00 80 76 2C 11 05 00 04 01 30 5D 83 0F 26 00 00 1B 9B 6E 00 
    //00 19 00 90 75 2C 11 06 00 04 1B 8B 6E 00 00 16 39 3F 19 00 90 75 2C 11 06 00 04 1B 83 6E 00 00 
    //16 16 A5 00 08 76 2C 11 16 06 27 00 04 0B 47 
  }


  event sv_AcceptSettings(Game_Pawn sender) {
    local int i;
    local Game_Pawn receiver;
    local int GroupId;
    local MGame_MiniGame miniGame;
    GroupId = MGame_MiniGameProxy(sender.MiniGameProxy).mGroupID;               //0000 : 0F 00 A8 79 2C 11 19 2E 40 24 A7 01 19 00 A8 77 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
    MGame_MiniGameProxy(sender.MiniGameProxy).mSettingsAccepted = True;         //0022 : 14 19 2E 40 24 A7 01 19 00 A8 77 2C 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 B0 52 1A 11 27 
    miniGame = GetGroup(GroupId);                                               //0041 : 0F 00 20 7A 2C 11 1B 77 6E 00 00 00 A8 79 2C 11 16 
    if (sender == miniGame.mPlayers[0]) {                                       //0052 : 07 DF 00 72 00 A8 77 2C 11 10 25 19 00 20 7A 2C 11 05 00 00 01 D8 58 83 0F 16 
      i = 0;                                                                    //006C : 0F 00 98 7A 2C 11 25 
      while (i < miniGame.mPlayers.Length) {                                    //0073 : 07 DC 00 96 00 98 7A 2C 11 37 19 00 20 7A 2C 11 05 00 00 01 D8 58 83 0F 16 
        receiver = miniGame.mPlayers[i];                                        //008C : 0F 00 10 7B 2C 11 10 00 98 7A 2C 11 19 00 20 7A 2C 11 05 00 00 01 D8 58 83 0F 
        if (receiver != sender) {                                               //00A6 : 07 D2 00 77 00 10 7B 2C 11 00 A8 77 2C 11 16 
          MGame_MiniGameProxy(receiver.MiniGameProxy).sv2cl_AcceptSettings_CallStub();//00B5 : 19 2E 40 24 A7 01 19 00 10 7B 2C 11 05 00 04 01 30 5D 83 0F 06 00 00 1B AF 6E 00 00 16 
        }
        i++;                                                                    //00D2 : A5 00 98 7A 2C 11 16 
      }
    } else {                                                                    //00DC : 06 F8 00 
      if (sv_AllPlayersAcceptedSettings(GroupId)) {                             //00DF : 07 F8 00 1B 63 04 00 00 00 A8 79 2C 11 16 
        sv_StartMiniGame(GroupId);                                              //00ED : 1B 72 04 00 00 00 A8 79 2C 11 16 
      }
    }
    //0F 00 A8 79 2C 11 19 2E 40 24 A7 01 19 00 A8 77 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 
    //31 0F 14 19 2E 40 24 A7 01 19 00 A8 77 2C 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 B0 52 1A 11 
    //27 0F 00 20 7A 2C 11 1B 77 6E 00 00 00 A8 79 2C 11 16 07 DF 00 72 00 A8 77 2C 11 10 25 19 00 20 
    //7A 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 98 7A 2C 11 25 07 DC 00 96 00 98 7A 2C 11 37 19 00 20 
    //7A 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 10 7B 2C 11 10 00 98 7A 2C 11 19 00 20 7A 2C 11 05 00 
    //00 01 D8 58 83 0F 07 D2 00 77 00 10 7B 2C 11 00 A8 77 2C 11 16 19 2E 40 24 A7 01 19 00 10 7B 2C 
    //11 05 00 04 01 30 5D 83 0F 06 00 00 1B AF 6E 00 00 16 A5 00 98 7A 2C 11 16 06 73 00 06 F8 00 07 
    //F8 00 1B 63 04 00 00 00 A8 79 2C 11 16 1B 72 04 00 00 00 A8 79 2C 11 16 04 0B 47 
  }


  event bool sv_AllPlayersAcceptedSettings(int GroupId) {
    local int i;
    local Game_Pawn Player;
    local MGame_MiniGame miniGame;
    miniGame = GetGroup(GroupId);                                               //0000 : 0F 00 88 7D 2C 11 1B 77 6E 00 00 00 38 7C 2C 11 16 
    i = 0;                                                                      //0011 : 0F 00 00 7E 2C 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //0018 : 07 79 00 96 00 00 7E 2C 11 37 19 00 88 7D 2C 11 05 00 00 01 D8 58 83 0F 16 
      Player = miniGame.mPlayers[i];                                            //0031 : 0F 00 78 7E 2C 11 10 00 00 7E 2C 11 19 00 88 7D 2C 11 05 00 00 01 D8 58 83 0F 
      if (!MGame_MiniGameProxy(Player.MiniGameProxy).mSettingsAccepted) {       //004B : 07 6F 00 81 19 2E 40 24 A7 01 19 00 78 7E 2C 11 05 00 04 01 30 5D 83 0F 06 00 04 2D 01 B0 52 1A 11 16 
        return False;                                                           //006D : 04 28 
      }
      i++;                                                                      //006F : A5 00 00 7E 2C 11 16 
    }
    return True;                                                                //0079 : 04 27 
    //0F 00 88 7D 2C 11 1B 77 6E 00 00 00 38 7C 2C 11 16 0F 00 00 7E 2C 11 25 07 79 00 96 00 00 7E 2C 
    //11 37 19 00 88 7D 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 78 7E 2C 11 10 00 00 7E 2C 11 19 00 88 
    //7D 2C 11 05 00 00 01 D8 58 83 0F 07 6F 00 81 19 2E 40 24 A7 01 19 00 78 7E 2C 11 05 00 04 01 30 
    //5D 83 0F 06 00 04 2D 01 B0 52 1A 11 16 04 28 A5 00 00 7E 2C 11 16 06 18 00 04 27 04 0B 47 
  }


  event sv_CancelSettings(Game_Pawn sender) {
    local int i;
    local Game_Pawn receiver;
    local MGame_MiniGame miniGame;
    miniGame = GetGroup(MGame_MiniGameProxy(sender.MiniGameProxy).mGroupID);    //0000 : 0F 00 D8 81 2C 11 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 18 80 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 16 
    if (MGame_MiniGameProxy(sender.MiniGameProxy).mGroupID >= 0) {              //0028 : 07 CA 00 99 19 2E 40 24 A7 01 19 00 18 80 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 25 16 
      sv_LeaveGame(sender);                                                     //004A : 1B 69 04 00 00 00 18 80 2C 11 16 
      i = 0;                                                                    //0055 : 0F 00 50 82 2C 11 25 
      while (i < miniGame.mPlayers.Length) {                                    //005C : 07 CA 00 96 00 50 82 2C 11 37 19 00 D8 81 2C 11 05 00 00 01 D8 58 83 0F 16 
        receiver = miniGame.mPlayers[i];                                        //0075 : 0F 00 C8 82 2C 11 10 00 50 82 2C 11 19 00 D8 81 2C 11 05 00 00 01 D8 58 83 0F 
        if (receiver != sender) {                                               //008F : 07 C0 00 77 00 C8 82 2C 11 00 18 80 2C 11 16 
          MGame_MiniGameProxy(receiver.MiniGameProxy).sv2cl_CancelSettings_CallStub(sender);//009E : 19 2E 40 24 A7 01 19 00 C8 82 2C 11 05 00 04 01 30 5D 83 0F 0B 00 00 1B B2 6E 00 00 00 18 80 2C 11 16 
        }
        i++;                                                                    //00C0 : A5 00 50 82 2C 11 16 
      }
    }
    //0F 00 D8 81 2C 11 1B 77 6E 00 00 19 2E 40 24 A7 01 19 00 18 80 2C 11 05 00 04 01 30 5D 83 0F 05 
    //00 04 01 98 1A 31 0F 16 07 CA 00 99 19 2E 40 24 A7 01 19 00 18 80 2C 11 05 00 04 01 30 5D 83 0F 
    //05 00 04 01 98 1A 31 0F 25 16 1B 69 04 00 00 00 18 80 2C 11 16 0F 00 50 82 2C 11 25 07 CA 00 96 
    //00 50 82 2C 11 37 19 00 D8 81 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 C8 82 2C 11 10 00 50 82 2C 
    //11 19 00 D8 81 2C 11 05 00 00 01 D8 58 83 0F 07 C0 00 77 00 C8 82 2C 11 00 18 80 2C 11 16 19 2E 
    //40 24 A7 01 19 00 C8 82 2C 11 05 00 04 01 30 5D 83 0F 0B 00 00 1B B2 6E 00 00 00 18 80 2C 11 16 
    //A5 00 50 82 2C 11 16 06 5C 00 04 0B 47 
  }


  event sv_UpdateSetting(Game_Pawn sender,int Setting,int Option) {
    local int i;
    local Game_Pawn receiver;
    local int GroupId;
    local MGame_MiniGame miniGame;
    GroupId = MGame_MiniGameProxy(sender.MiniGameProxy).mGroupID;               //0000 : 0F 00 88 85 2C 11 19 2E 40 24 A7 01 19 00 F0 83 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
    miniGame = GetGroup(GroupId);                                               //0022 : 0F 00 00 86 2C 11 1B 77 6E 00 00 00 88 85 2C 11 16 
    i = 0;                                                                      //0033 : 0F 00 78 86 2C 11 25 
    while (i < miniGame.mPlayers.Length) {                                      //003A : 07 AD 00 96 00 78 86 2C 11 37 19 00 00 86 2C 11 05 00 00 01 D8 58 83 0F 16 
      receiver = miniGame.mPlayers[i];                                          //0053 : 0F 00 F0 86 2C 11 10 00 78 86 2C 11 19 00 00 86 2C 11 05 00 00 01 D8 58 83 0F 
      if (receiver != sender) {                                                 //006D : 07 A3 00 77 00 F0 86 2C 11 00 F0 83 2C 11 16 
        MGame_MiniGameProxy(receiver.MiniGameProxy).sv2cl_UpdateSetting_CallStub(Setting,Option);//007C : 19 2E 40 24 A7 01 19 00 F0 86 2C 11 05 00 04 01 30 5D 83 0F 10 00 00 1B B3 6E 00 00 00 68 87 2C 11 00 E0 87 2C 11 16 
      }
      i++;                                                                      //00A3 : A5 00 78 86 2C 11 16 
    }
    //0F 00 88 85 2C 11 19 2E 40 24 A7 01 19 00 F0 83 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 
    //31 0F 0F 00 00 86 2C 11 1B 77 6E 00 00 00 88 85 2C 11 16 0F 00 78 86 2C 11 25 07 AD 00 96 00 78 
    //86 2C 11 37 19 00 00 86 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 F0 86 2C 11 10 00 78 86 2C 11 19 
    //00 00 86 2C 11 05 00 00 01 D8 58 83 0F 07 A3 00 77 00 F0 86 2C 11 00 F0 83 2C 11 16 19 2E 40 24 
    //A7 01 19 00 F0 86 2C 11 05 00 04 01 30 5D 83 0F 10 00 00 1B B3 6E 00 00 00 68 87 2C 11 00 E0 87 
    //2C 11 16 A5 00 78 86 2C 11 16 06 3A 00 04 0B 47 
  }


  event sv_PlayerDied(Game_Pawn aDeadPlayer) {
    local int GroupId;
    local int i;
    local Game_Pawn Player;
    local MGame_MiniGame miniGame;
    GroupId = MGame_MiniGameProxy(aDeadPlayer.MiniGameProxy).mGroupID;          //0000 : 0F 00 00 8B 2C 11 19 2E 40 24 A7 01 19 00 08 89 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
    if (GroupId >= 0) {                                                         //0022 : 07 F6 00 99 00 00 8B 2C 11 25 16 
      miniGame = GetGroup(GroupId);                                             //002D : 0F 00 78 8B 2C 11 1B 77 6E 00 00 00 00 8B 2C 11 16 
      miniGame.Stop();                                                          //003E : 19 00 78 8B 2C 11 06 00 00 1B 6F 02 00 00 16 
      sv_RemoveFromGroup(aDeadPlayer);                                          //004D : 1B 70 04 00 00 00 08 89 2C 11 16 
      i = 0;                                                                    //0058 : 0F 00 F0 8B 2C 11 25 
      while (i < miniGame.mPlayers.Length) {                                    //005F : 07 C9 00 96 00 F0 8B 2C 11 37 19 00 78 8B 2C 11 05 00 00 01 D8 58 83 0F 16 
        Player = miniGame.mPlayers[i];                                          //0078 : 0F 00 68 8C 2C 11 10 00 F0 8B 2C 11 19 00 78 8B 2C 11 05 00 00 01 D8 58 83 0F 
        MGame_MiniGameProxy(Player.MiniGameProxy).sv2cl_GameEnd_CallStub(Class'MGame_MiniGameProxy'.4,aDeadPlayer);//0092 : 19 2E 40 24 A7 01 19 00 68 8C 2C 11 05 00 04 01 30 5D 83 0F 16 00 00 1B 8C 6E 00 00 12 20 40 24 A7 01 02 00 04 2C 04 00 08 89 2C 11 16 
        i++;                                                                    //00BF : A5 00 F0 8B 2C 11 16 
      }
      MGame_MiniGameProxy(aDeadPlayer.MiniGameProxy).sv2cl_GameEnd_CallStub(Class'MGame_MiniGameProxy'.4,aDeadPlayer);//00C9 : 19 2E 40 24 A7 01 19 00 08 89 2C 11 05 00 04 01 30 5D 83 0F 16 00 00 1B 8C 6E 00 00 12 20 40 24 A7 01 02 00 04 2C 04 00 08 89 2C 11 16 
    }
    //0F 00 00 8B 2C 11 19 2E 40 24 A7 01 19 00 08 89 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 
    //31 0F 07 F6 00 99 00 00 8B 2C 11 25 16 0F 00 78 8B 2C 11 1B 77 6E 00 00 00 00 8B 2C 11 16 19 00 
    //78 8B 2C 11 06 00 00 1B 6F 02 00 00 16 1B 70 04 00 00 00 08 89 2C 11 16 0F 00 F0 8B 2C 11 25 07 
    //C9 00 96 00 F0 8B 2C 11 37 19 00 78 8B 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 68 8C 2C 11 10 00 
    //F0 8B 2C 11 19 00 78 8B 2C 11 05 00 00 01 D8 58 83 0F 19 2E 40 24 A7 01 19 00 68 8C 2C 11 05 00 
    //04 01 30 5D 83 0F 16 00 00 1B 8C 6E 00 00 12 20 40 24 A7 01 02 00 04 2C 04 00 08 89 2C 11 16 A5 
    //00 F0 8B 2C 11 16 06 5F 00 19 2E 40 24 A7 01 19 00 08 89 2C 11 05 00 04 01 30 5D 83 0F 16 00 00 
    //1B 8C 6E 00 00 12 20 40 24 A7 01 02 00 04 2C 04 00 08 89 2C 11 16 04 0B 47 
  }


  event sv_LeaveGame(Game_Pawn aSender) {
    local int GroupId;
    local int i;
    local Game_Pawn receiver;
    local MGame_MiniGame miniGame;
    GroupId = MGame_MiniGameProxy(aSender.MiniGameProxy).mGroupID;              //0000 : 0F 00 40 8F 2C 11 19 2E 40 24 A7 01 19 00 90 8D 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
    if (GroupId >= 0) {                                                         //0022 : 07 BE 00 99 00 40 8F 2C 11 25 16 
      miniGame = GetGroup(GroupId);                                             //002D : 0F 00 B8 8F 2C 11 1B 77 6E 00 00 00 40 8F 2C 11 16 
      miniGame.Stop();                                                          //003E : 19 00 B8 8F 2C 11 06 00 00 1B 6F 02 00 00 16 
      sv_RemoveFromGroup(aSender);                                              //004D : 1B 70 04 00 00 00 90 8D 2C 11 16 
      i = 0;                                                                    //0058 : 0F 00 30 90 2C 11 25 
      while (i < miniGame.mPlayers.Length) {                                    //005F : 07 BE 00 96 00 30 90 2C 11 37 19 00 B8 8F 2C 11 05 00 00 01 D8 58 83 0F 16 
        receiver = miniGame.mPlayers[i];                                        //0078 : 0F 00 A8 90 2C 11 10 00 30 90 2C 11 19 00 B8 8F 2C 11 05 00 00 01 D8 58 83 0F 
        MGame_MiniGameProxy(receiver.MiniGameProxy).sv2cl_LeaveGame_CallStub(aSender);//0092 : 19 2E 40 24 A7 01 19 00 A8 90 2C 11 05 00 04 01 30 5D 83 0F 0B 00 00 1B B1 6E 00 00 00 90 8D 2C 11 16 
        i++;                                                                    //00B4 : A5 00 30 90 2C 11 16 
      }
    }
    //0F 00 40 8F 2C 11 19 2E 40 24 A7 01 19 00 90 8D 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 
    //31 0F 07 BE 00 99 00 40 8F 2C 11 25 16 0F 00 B8 8F 2C 11 1B 77 6E 00 00 00 40 8F 2C 11 16 19 00 
    //B8 8F 2C 11 06 00 00 1B 6F 02 00 00 16 1B 70 04 00 00 00 90 8D 2C 11 16 0F 00 30 90 2C 11 25 07 
    //BE 00 96 00 30 90 2C 11 37 19 00 B8 8F 2C 11 05 00 00 01 D8 58 83 0F 16 0F 00 A8 90 2C 11 10 00 
    //30 90 2C 11 19 00 B8 8F 2C 11 05 00 00 01 D8 58 83 0F 19 2E 40 24 A7 01 19 00 A8 90 2C 11 05 00 
    //04 01 30 5D 83 0F 0B 00 00 1B B1 6E 00 00 00 90 8D 2C 11 16 A5 00 30 90 2C 11 16 06 5F 00 04 0B 
    //47 
  }


  event bool sv_IsPlayerAvailable(Game_Pawn Player) {
    return MGame_MiniGameProxy(Player.MiniGameProxy).mGroupID == -1;            //0000 : 04 9A 19 2E 40 24 A7 01 19 00 D0 91 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 1D FF FF FF FF 16 
    //04 9A 19 2E 40 24 A7 01 19 00 D0 91 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 1D FF 
    //FF FF FF 16 04 0B 47 
  }


  event sv_RemoveFromGroup(Game_Pawn aPlayer) {
    local int Id;
    local MGame_MiniGame miniGame;
    Id = MGame_MiniGameProxy(aPlayer.MiniGameProxy).mGroupID;                   //0000 : 0F 00 C0 94 2C 11 19 2E 40 24 A7 01 19 00 70 93 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 
    miniGame = GetGroup(Id);                                                    //0022 : 0F 00 38 95 2C 11 1B 77 6E 00 00 00 C0 94 2C 11 16 
    if (miniGame != None) {                                                     //0033 : 07 7D 00 77 00 38 95 2C 11 2A 16 
      miniGame.RemovePlayer(aPlayer);                                           //003E : 19 00 38 95 2C 11 0B 00 00 1B 9C 6E 00 00 00 70 93 2C 11 16 
      if (miniGame.mPlayers.Length == 0) {                                      //0052 : 07 7D 00 9A 37 19 00 38 95 2C 11 05 00 00 01 D8 58 83 0F 25 16 
        RemoveGroup(Id);                                                        //0067 : 1B B0 6E 00 00 00 C0 94 2C 11 16 
        sv_FreeID(Id);                                                          //0072 : 1B 66 04 00 00 00 C0 94 2C 11 16 
      }
    }
    //0F 00 C0 94 2C 11 19 2E 40 24 A7 01 19 00 70 93 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 
    //31 0F 0F 00 38 95 2C 11 1B 77 6E 00 00 00 C0 94 2C 11 16 07 7D 00 77 00 38 95 2C 11 2A 16 19 00 
    //38 95 2C 11 0B 00 00 1B 9C 6E 00 00 00 70 93 2C 11 16 07 7D 00 9A 37 19 00 38 95 2C 11 05 00 00 
    //01 D8 58 83 0F 25 16 1B B0 6E 00 00 00 C0 94 2C 11 16 1B 66 04 00 00 00 C0 94 2C 11 16 04 0B 47 
    //
  }


  event sv_AddToGroup(int aGroupID,Game_Pawn aPlayer) {
    local MGame_MiniGame miniGame;
    miniGame = GetGroup(aGroupID);                                              //0000 : 0F 00 D8 96 2C 11 1B 77 6E 00 00 00 60 96 2C 11 16 
    miniGame.AddPlayer(aPlayer);                                                //0011 : 19 00 D8 96 2C 11 0B 00 00 1B 7C 6E 00 00 00 50 97 2C 11 16 
    MGame_MiniGameProxy(aPlayer.MiniGameProxy).mGroupID = aGroupID;             //0025 : 0F 19 2E 40 24 A7 01 19 00 50 97 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 31 0F 00 60 96 2C 11 
    //0F 00 D8 96 2C 11 1B 77 6E 00 00 00 60 96 2C 11 16 19 00 D8 96 2C 11 0B 00 00 1B 7C 6E 00 00 00 
    //50 97 2C 11 16 0F 19 2E 40 24 A7 01 19 00 50 97 2C 11 05 00 04 01 30 5D 83 0F 05 00 04 01 98 1A 
    //31 0F 00 60 96 2C 11 04 0B 47 
  }


  event sv_FreeID(int Id) {
    mFreeIDs[mFreeIDs.Length] = Id;                                             //0000 : 0F 10 37 01 38 99 2C 11 01 38 99 2C 11 00 78 98 2C 11 
    //0F 10 37 01 38 99 2C 11 01 38 99 2C 11 00 78 98 2C 11 04 0B 47 
  }


  event int sv_GrabID() {
    local int Id;
    Id = -1;                                                                    //0000 : 0F 00 80 9B 2C 11 1D FF FF FF FF 
    if (mFreeIDs.Length > 0) {                                                  //000B : 07 3F 00 97 37 01 38 99 2C 11 25 16 
      Id = mFreeIDs[mFreeIDs.Length - 1];                                       //0017 : 0F 00 80 9B 2C 11 10 93 37 01 38 99 2C 11 26 16 01 38 99 2C 11 
      mFreeIDs.Length = mFreeIDs.Length - 1;                                    //002C : 0F 37 01 38 99 2C 11 93 37 01 38 99 2C 11 26 16 
    } else {                                                                    //003C : 06 51 00 
      Id = mLastID;                                                             //003F : 0F 00 80 9B 2C 11 01 F8 9B 2C 11 
      mLastID++;                                                                //004A : A5 01 F8 9B 2C 11 16 
    }
    return Id;                                                                  //0051 : 04 00 80 9B 2C 11 
    //0F 00 80 9B 2C 11 1D FF FF FF FF 07 3F 00 97 37 01 38 99 2C 11 25 16 0F 00 80 9B 2C 11 10 93 37 
    //01 38 99 2C 11 26 16 01 38 99 2C 11 0F 37 01 38 99 2C 11 93 37 01 38 99 2C 11 26 16 06 51 00 0F 
    //00 80 9B 2C 11 01 F8 9B 2C 11 A5 01 F8 9B 2C 11 16 04 00 80 9B 2C 11 04 0B 47 
  }


  function sv_OnLogout(Game_PlayerPawn aPawn) {
    sv_LeaveGame(aPawn);                                                        //0000 : 1B 69 04 00 00 00 20 9D 2C 11 16 
    //1B 69 04 00 00 00 20 9D 2C 11 16 04 0B 47 
  }


  event sv_OnInit() {
    mLastID = 0;                                                                //0000 : 0F 01 F8 9B 2C 11 25 
    //0F 01 F8 9B 2C 11 25 04 0B 47 
  }


  native function RemoveGroup(int GroupId);


  native function AddGroup(int GroupId,MGame_MiniGame pMiniGame);


  native function MGame_MiniGame GetGroup(int GroupId);



