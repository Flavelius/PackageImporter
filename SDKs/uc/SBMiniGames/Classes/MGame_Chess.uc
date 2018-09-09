//==============================================================================
//  MGame_Chess
//==============================================================================

class MGame_Chess extends MGame_BoardGame
    native
    exportstructs
    dependsOn(MGame_Config,Class,MGame_ChessConfig)
  ;

  const MOVE_HISTORY_LENGTH =  5;
  const CANT_CASTLE_BLACK = 12;
  const CANT_CASTLE_BLACK_LONG = 8;
  const CANT_CASTLE_BLACK_SHORT = 4;
  const CANT_CASTLE_WHITE = 3;
  const CANT_CASTLE_WHITE_LONG = 2;
  const CANT_CASTLE_WHITE_SHORT = 1;
  const BOARD_G8 =  6;
  const BOARD_E8 =  4;
  const BOARD_C8 =  2;
  const BOARD_G1 =  62;
  const BOARD_E1 =  60;
  const BOARD_C1 =  58;
  const PIECE_CHESS_TYPE_KING = 32;
  const PIECE_CHESS_TYPE_QUEEN = 16;
  const PIECE_CHESS_TYPE_ROOK = 8;
  const PIECE_CHESS_TYPE_BISHOP = 4;
  const PIECE_CHESS_TYPE_KNIGHT = 2;
  const PIECE_CHESS_TYPE_PAWN = 1;
  const PIECE_CHESS_TYPE_EMPTY = 0;
  const CHESS_PIECE_COLOR = 128;
  const CHESS_PIECE_TYPE = 63;
  struct BoardPosition {
      var int X;
      var int Y;
      var int t;

  };


  struct Move {
      var BoardPosition Source;
      var int sourceType;
      var int sourceColor;
      var BoardPosition Target;
      var int TargetType;
      var int targetColor;
      var bool White;
      var int Status;
      var int LastPawnTarget;
      var int EnPassantTarget;

  };


  var byte Status;
  var int LastPawnTarget;
  var int EnPassantTarget;
  var bool MovesPossible;
  var bool WhiteIsMoving;
  var bool CheckMate;
  var bool StallMate;
  var array<Move> moveHistory;


  function Debug() {
    local int X;
    local int Y;
    local int Value;
    local string boardLine;
    Y = 0;                                                                      //0000 : 0F 00 B8 B2 2C 11 25 
    while (Y < 8) {                                                             //0007 : 07 B1 00 96 00 B8 B2 2C 11 2C 08 16 
      boardLine = "";                                                           //0013 : 0F 00 30 B3 2C 11 1F 00 
      X = 0;                                                                    //001B : 0F 00 20 B1 2C 11 25 
      while (X < 8) {                                                           //0022 : 07 A7 00 96 00 20 B1 2C 11 2C 08 16 
        Value = BoardData[X + (Y << 3)];                                        //002E : 0F 00 A8 B3 2C 11 39 3A 10 92 00 20 B1 2C 11 94 00 B8 B2 2C 11 2C 03 16 16 01 F8 73 83 0F 
        if (Value < 10) {                                                       //004C : 07 68 00 96 00 A8 B3 2C 11 2C 0A 16 
          boardLine = boardLine $ " ";                                          //0058 : 0F 00 30 B3 2C 11 70 00 30 B3 2C 11 1F 20 00 16 
        }
        if (Value < 100) {                                                      //0068 : 07 84 00 96 00 A8 B3 2C 11 2C 64 16 
          boardLine = boardLine $ " ";                                          //0074 : 0F 00 30 B3 2C 11 70 00 30 B3 2C 11 1F 20 00 16 
        }
        boardLine = boardLine $ string(Value) $ ",";                            //0084 : 0F 00 30 B3 2C 11 70 70 00 30 B3 2C 11 39 53 00 A8 B3 2C 11 16 1F 2C 00 16 
        X++;                                                                    //009D : A5 00 20 B1 2C 11 16 
      }
      Y++;                                                                      //00A7 : A5 00 B8 B2 2C 11 16 
    }
    //0F 00 B8 B2 2C 11 25 07 B1 00 96 00 B8 B2 2C 11 2C 08 16 0F 00 30 B3 2C 11 1F 00 0F 00 20 B1 2C 
    //11 25 07 A7 00 96 00 20 B1 2C 11 2C 08 16 0F 00 A8 B3 2C 11 39 3A 10 92 00 20 B1 2C 11 94 00 B8 
    //B2 2C 11 2C 03 16 16 01 F8 73 83 0F 07 68 00 96 00 A8 B3 2C 11 2C 0A 16 0F 00 30 B3 2C 11 70 00 
    //30 B3 2C 11 1F 20 00 16 07 84 00 96 00 A8 B3 2C 11 2C 64 16 0F 00 30 B3 2C 11 70 00 30 B3 2C 11 
    //1F 20 00 16 0F 00 30 B3 2C 11 70 70 00 30 B3 2C 11 39 53 00 A8 B3 2C 11 16 1F 2C 00 16 A5 00 20 
    //B1 2C 11 16 06 22 00 A5 00 B8 B2 2C 11 16 06 07 00 04 0B 47 
  }


  function bool IsValidKingMove(Move Move) {
    local bool check1;
    local bool check2;
    local bool check3;
    local bool check4;
    local bool check5;
    check1 = BaseCheck(Move);                                                   //0000 : 14 2D 00 88 B6 2C 11 1B 81 6E 00 00 00 D0 B4 2C 11 16 
    check2 = Abs(Move.Source.X - Move.Target.X) <= 1;                           //0012 : 14 2D 00 00 B7 2C 11 B2 BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 00 D0 B4 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 D0 B4 2C 11 16 16 39 3F 26 16 
    check3 = Abs(Move.Source.Y - Move.Target.Y) <= 1;                           //0042 : 14 2D 00 F0 B9 2C 11 B2 BA 39 3F 93 36 68 BA 2C 11 36 00 B9 2C 11 00 D0 B4 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 D0 B4 2C 11 16 16 39 3F 26 16 
    check4 = IsValidCastleLong(Move);                                           //0072 : 14 2D 00 E0 BA 2C 11 1B C0 6E 00 00 00 D0 B4 2C 11 16 
    check5 = IsValidCastleShort(Move);                                          //0084 : 14 2D 00 58 BB 2C 11 1B C1 6E 00 00 00 D0 B4 2C 11 16 
    return check1
      && (check2 && check3 || check4 || check5);              //0096 : 04 82 2D 00 88 B6 2C 11 18 28 00 84 82 2D 00 00 B7 2C 11 18 07 00 2D 00 F0 B9 2C 11 16 18 12 00 84 2D 00 E0 BA 2C 11 18 07 00 2D 00 58 BB 2C 11 16 16 16 
    //14 2D 00 88 B6 2C 11 1B 81 6E 00 00 00 D0 B4 2C 11 16 14 2D 00 00 B7 2C 11 B2 BA 39 3F 93 36 00 
    //B8 2C 11 36 00 B9 2C 11 00 D0 B4 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 D0 B4 2C 11 16 16 39 3F 
    //26 16 14 2D 00 F0 B9 2C 11 B2 BA 39 3F 93 36 68 BA 2C 11 36 00 B9 2C 11 00 D0 B4 2C 11 36 68 BA 
    //2C 11 36 78 B9 2C 11 00 D0 B4 2C 11 16 16 39 3F 26 16 14 2D 00 E0 BA 2C 11 1B C0 6E 00 00 00 D0 
    //B4 2C 11 16 14 2D 00 58 BB 2C 11 1B C1 6E 00 00 00 D0 B4 2C 11 16 04 82 2D 00 88 B6 2C 11 18 28 
    //00 84 82 2D 00 00 B7 2C 11 18 07 00 2D 00 F0 B9 2C 11 16 18 12 00 84 2D 00 E0 BA 2C 11 18 07 00 
    //2D 00 58 BB 2C 11 16 16 16 04 0B 47 
  }


  function bool IsValidCastleLong(Move Move) {
    if (Move.White) {                                                           //0000 : 07 95 00 2D 36 18 BF 2C 11 00 A8 C1 2C 11 
      return Move.Source.t == 60 && Move.Target.t == 58
        && (Status & 2) == 0
        && IsClearPathCoords(4,7,0,7)
        && !AttackedByBlack(4,7) && !AttackedByBlack(3,7)
        && !AttackedByBlack(2,7);//000E : 04 82 82 82 82 9A 36 38 BD 2C 11 36 00 B9 2C 11 00 A8 C1 2C 11 2C 3C 16 18 14 00 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 A8 C1 2C 11 2C 3A 16 16 18 0F 00 9A 9C 39 3A 01 C0 BC 2C 11 2C 02 16 25 16 16 18 0E 00 1B 85 6E 00 00 2C 04 2C 07 25 2C 07 16 16 18 2F 00 82 82 81 1B 7B 6E 00 00 2C 04 2C 07 16 16 18 0D 00 81 1B 7B 6E 00 00 2C 03 2C 07 16 16 16 18 0D 00 81 1B 7B 6E 00 00 2C 02 2C 07 16 16 16 16 
    } else {                                                                    //0092 : 06 14 01 
      return Move.Source.t == 4 && Move.Target.t == 2
        && (Status & 8) == 0
        && IsClearPathCoords(4,0,0,0)
        && !AttackedByWhite(4,0) && !AttackedByWhite(3,0)
        && !AttackedByWhite(2,0);//0095 : 04 82 82 82 82 9A 36 38 BD 2C 11 36 00 B9 2C 11 00 A8 C1 2C 11 2C 04 16 18 14 00 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 A8 C1 2C 11 2C 02 16 16 18 0F 00 9A 9C 39 3A 01 C0 BC 2C 11 2C 08 16 25 16 16 18 0C 00 1B 85 6E 00 00 2C 04 25 25 25 16 16 18 2C 00 82 82 81 1B 7D 6E 00 00 2C 04 25 16 16 18 0C 00 81 1B 7D 6E 00 00 2C 03 25 16 16 16 18 0C 00 81 1B 7D 6E 00 00 2C 02 25 16 16 16 16 
    }
    //07 95 00 2D 36 18 BF 2C 11 00 A8 C1 2C 11 04 82 82 82 82 9A 36 38 BD 2C 11 36 00 B9 2C 11 00 A8 
    //C1 2C 11 2C 3C 16 18 14 00 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 A8 C1 2C 11 2C 3A 16 16 18 0F 00 
    //9A 9C 39 3A 01 C0 BC 2C 11 2C 02 16 25 16 16 18 0E 00 1B 85 6E 00 00 2C 04 2C 07 25 2C 07 16 16 
    //18 2F 00 82 82 81 1B 7B 6E 00 00 2C 04 2C 07 16 16 18 0D 00 81 1B 7B 6E 00 00 2C 03 2C 07 16 16 
    //16 18 0D 00 81 1B 7B 6E 00 00 2C 02 2C 07 16 16 16 16 06 14 01 04 82 82 82 82 9A 36 38 BD 2C 11 
    //36 00 B9 2C 11 00 A8 C1 2C 11 2C 04 16 18 14 00 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 A8 C1 2C 11 
    //2C 02 16 16 18 0F 00 9A 9C 39 3A 01 C0 BC 2C 11 2C 08 16 25 16 16 18 0C 00 1B 85 6E 00 00 2C 04 
    //25 25 25 16 16 18 2C 00 82 82 81 1B 7D 6E 00 00 2C 04 25 16 16 18 0C 00 81 1B 7D 6E 00 00 2C 03 
    //25 16 16 16 18 0C 00 81 1B 7D 6E 00 00 2C 02 25 16 16 16 16 04 0B 47 
  }


  function bool IsValidCastleShort(Move Move) {
    local bool check1;
    local bool check2;
    local bool check3;
    local bool check4;
    local bool check5;
    if (Move.White) {                                                           //0000 : 07 D6 00 2D 36 18 BF 2C 11 00 F0 C4 2C 11 
      check1 = Move.Source.t == 60;                                             //000E : 14 2D 00 70 C7 2C 11 9A 36 38 BD 2C 11 36 00 B9 2C 11 00 F0 C4 2C 11 2C 3C 16 
      check2 = Move.Target.t == 62;                                             //0028 : 14 2D 00 E8 C7 2C 11 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 F0 C4 2C 11 2C 3E 16 
      check3 = (Status & 1) == 0;                                               //0042 : 14 2D 00 60 C8 2C 11 9A 9C 39 3A 01 C0 BC 2C 11 26 16 25 16 
      check4 = IsClearPathCoords(4,7,7,7);                                      //0056 : 14 2D 00 D8 C8 2C 11 1B 85 6E 00 00 2C 04 2C 07 2C 07 2C 07 16 
      check5 = !AttackedByBlack(4,7) && !AttackedByBlack(5,7)
        && !AttackedByBlack(6,7);//006B : 14 2D 00 50 C9 2C 11 82 82 81 1B 7B 6E 00 00 2C 04 2C 07 16 16 18 0D 00 81 1B 7B 6E 00 00 2C 05 2C 07 16 16 16 18 0D 00 81 1B 7B 6E 00 00 2C 06 2C 07 16 16 16 
      return check1 && check2 && check3 && check4
        && check5;            //00A0 : 04 82 82 82 82 2D 00 70 C7 2C 11 18 07 00 2D 00 E8 C7 2C 11 16 18 07 00 2D 00 60 C8 2C 11 16 18 07 00 2D 00 D8 C8 2C 11 16 18 07 00 2D 00 50 C9 2C 11 16 
    } else {                                                                    //00D3 : 06 56 01 
      return Move.Source.t == 4 && Move.Target.t == 6
        && (Status & 4) == 0
        && IsClearPathCoords(4,0,7,0)
        && !AttackedByWhite(4,0) && !AttackedByWhite(5,0)
        && !AttackedByWhite(6,0);//00D6 : 04 82 82 82 82 9A 36 38 BD 2C 11 36 00 B9 2C 11 00 F0 C4 2C 11 2C 04 16 18 14 00 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 F0 C4 2C 11 2C 06 16 16 18 0F 00 9A 9C 39 3A 01 C0 BC 2C 11 2C 04 16 25 16 16 18 0D 00 1B 85 6E 00 00 2C 04 25 2C 07 25 16 16 18 2C 00 82 82 81 1B 7D 6E 00 00 2C 04 25 16 16 18 0C 00 81 1B 7D 6E 00 00 2C 05 25 16 16 16 18 0C 00 81 1B 7D 6E 00 00 2C 06 25 16 16 16 16 
    }
    //07 D6 00 2D 36 18 BF 2C 11 00 F0 C4 2C 11 14 2D 00 70 C7 2C 11 9A 36 38 BD 2C 11 36 00 B9 2C 11 
    //00 F0 C4 2C 11 2C 3C 16 14 2D 00 E8 C7 2C 11 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 F0 C4 2C 11 2C 
    //3E 16 14 2D 00 60 C8 2C 11 9A 9C 39 3A 01 C0 BC 2C 11 26 16 25 16 14 2D 00 D8 C8 2C 11 1B 85 6E 
    //00 00 2C 04 2C 07 2C 07 2C 07 16 14 2D 00 50 C9 2C 11 82 82 81 1B 7B 6E 00 00 2C 04 2C 07 16 16 
    //18 0D 00 81 1B 7B 6E 00 00 2C 05 2C 07 16 16 16 18 0D 00 81 1B 7B 6E 00 00 2C 06 2C 07 16 16 16 
    //04 82 82 82 82 2D 00 70 C7 2C 11 18 07 00 2D 00 E8 C7 2C 11 16 18 07 00 2D 00 60 C8 2C 11 16 18 
    //07 00 2D 00 D8 C8 2C 11 16 18 07 00 2D 00 50 C9 2C 11 16 06 56 01 04 82 82 82 82 9A 36 38 BD 2C 
    //11 36 00 B9 2C 11 00 F0 C4 2C 11 2C 04 16 18 14 00 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 F0 C4 2C 
    //11 2C 06 16 16 18 0F 00 9A 9C 39 3A 01 C0 BC 2C 11 2C 04 16 25 16 16 18 0D 00 1B 85 6E 00 00 2C 
    //04 25 2C 07 25 16 16 18 2C 00 82 82 81 1B 7D 6E 00 00 2C 04 25 16 16 18 0C 00 81 1B 7D 6E 00 00 
    //2C 05 25 16 16 16 18 0C 00 81 1B 7D 6E 00 00 2C 06 25 16 16 16 16 04 0B 47 
  }


  function bool IsValidQueenMove(Move Move) {
    return BaseCheck(Move)
      && (Move.Source.X == Move.Target.X || Move.Source.Y == Move.Target.Y
      || Abs(Move.Source.X - Move.Target.X) == Abs(Move.Source.Y - Move.Target.Y))
      && IsClearPath(Move.Source,Move.Target);//0000 : 04 82 82 1B 81 6E 00 00 00 F0 CA 2C 11 16 18 95 00 84 84 9A 36 00 B8 2C 11 36 00 B9 2C 11 00 F0 CA 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 18 21 00 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 F0 CA 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 16 18 4B 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 00 F0 CA 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 16 BA 39 3F 93 36 68 BA 2C 11 36 00 B9 2C 11 00 F0 CA 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 16 16 16 16 18 1B 00 1B 8E 6E 00 00 36 00 B9 2C 11 00 F0 CA 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 16 
    //04 82 82 1B 81 6E 00 00 00 F0 CA 2C 11 16 18 95 00 84 84 9A 36 00 B8 2C 11 36 00 B9 2C 11 00 F0 
    //CA 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 18 21 00 9A 36 68 BA 2C 11 36 00 B9 2C 
    //11 00 F0 CA 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 16 18 4B 00 B4 BA 39 3F 93 36 
    //00 B8 2C 11 36 00 B9 2C 11 00 F0 CA 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 F0 CA 2C 11 16 16 BA 
    //39 3F 93 36 68 BA 2C 11 36 00 B9 2C 11 00 F0 CA 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 F0 CA 2C 
    //11 16 16 16 16 16 18 1B 00 1B 8E 6E 00 00 36 00 B9 2C 11 00 F0 CA 2C 11 36 78 B9 2C 11 00 F0 CA 
    //2C 11 16 16 04 0B 47 
  }


  function bool IsValidRookMove(Move Move) {
    local bool check1;
    local bool check2;
    local bool check3;
    local bool check4;
    local bool Result;
    check1 = BaseCheck(Move);                                                   //0000 : 14 2D 00 D0 CF 2C 11 1B 81 6E 00 00 00 D0 CD 2C 11 16 
    if (!check1) {                                                              //0012 : 07 1D 00 81 2D 00 D0 CF 2C 11 16 
    }
    check2 = Move.Source.X == Move.Target.X;                                    //001D : 14 2D 00 48 D0 2C 11 9A 36 00 B8 2C 11 36 00 B9 2C 11 00 D0 CD 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 D0 CD 2C 11 16 
    check3 = Move.Source.Y == Move.Target.Y;                                    //0044 : 14 2D 00 C0 D0 2C 11 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 D0 CD 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 D0 CD 2C 11 16 
    if (check2 && !check3 || !check2 && check3) {                               //006B : 07 BD 00 84 82 2D 00 48 D0 2C 11 18 09 00 81 2D 00 C0 D0 2C 11 16 16 18 14 00 82 81 2D 00 48 D0 2C 11 16 18 07 00 2D 00 C0 D0 2C 11 16 16 
      check4 = IsClearPath(Move.Source,Move.Target);                            //0099 : 14 2D 00 38 D1 2C 11 1B 8E 6E 00 00 36 00 B9 2C 11 00 D0 CD 2C 11 36 78 B9 2C 11 00 D0 CD 2C 11 16 
    } else {                                                                    //00BA : 06 C5 00 
      check4 = False;                                                           //00BD : 14 2D 00 38 D1 2C 11 28 
    }
    Result = check1 && (check2 || check3) && check4;                            //00C5 : 14 2D 00 B0 D1 2C 11 82 82 2D 00 D0 CF 2C 11 18 12 00 84 2D 00 48 D0 2C 11 18 07 00 2D 00 C0 D0 2C 11 16 16 18 07 00 2D 00 38 D1 2C 11 16 
    return Result;                                                              //00F3 : 04 2D 00 B0 D1 2C 11 
    //14 2D 00 D0 CF 2C 11 1B 81 6E 00 00 00 D0 CD 2C 11 16 07 1D 00 81 2D 00 D0 CF 2C 11 16 14 2D 00 
    //48 D0 2C 11 9A 36 00 B8 2C 11 36 00 B9 2C 11 00 D0 CD 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 D0 
    //CD 2C 11 16 14 2D 00 C0 D0 2C 11 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 D0 CD 2C 11 36 68 BA 2C 11 
    //36 78 B9 2C 11 00 D0 CD 2C 11 16 07 BD 00 84 82 2D 00 48 D0 2C 11 18 09 00 81 2D 00 C0 D0 2C 11 
    //16 16 18 14 00 82 81 2D 00 48 D0 2C 11 16 18 07 00 2D 00 C0 D0 2C 11 16 16 14 2D 00 38 D1 2C 11 
    //1B 8E 6E 00 00 36 00 B9 2C 11 00 D0 CD 2C 11 36 78 B9 2C 11 00 D0 CD 2C 11 16 06 C5 00 14 2D 00 
    //38 D1 2C 11 28 14 2D 00 B0 D1 2C 11 82 82 2D 00 D0 CF 2C 11 18 12 00 84 2D 00 48 D0 2C 11 18 07 
    //00 2D 00 C0 D0 2C 11 16 16 18 07 00 2D 00 38 D1 2C 11 16 04 2D 00 B0 D1 2C 11 04 0B 47 
  }


  function bool IsValidBishopMove(Move Move) {
    return BaseCheck(Move)
      && Abs(Move.Source.X - Move.Target.X) == Abs(Move.Source.Y - Move.Target.Y)
      && IsClearPath(Move.Source,Move.Target);//0000 : 04 82 82 1B 81 6E 00 00 00 50 D3 2C 11 16 18 4B 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 00 50 D3 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 50 D3 2C 11 16 16 BA 39 3F 93 36 68 BA 2C 11 36 00 B9 2C 11 00 50 D3 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 50 D3 2C 11 16 16 16 16 18 1B 00 1B 8E 6E 00 00 36 00 B9 2C 11 00 50 D3 2C 11 36 78 B9 2C 11 00 50 D3 2C 11 16 16 
    //04 82 82 1B 81 6E 00 00 00 50 D3 2C 11 16 18 4B 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 
    //00 50 D3 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 50 D3 2C 11 16 16 BA 39 3F 93 36 68 BA 2C 11 36 
    //00 B9 2C 11 00 50 D3 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 50 D3 2C 11 16 16 16 16 18 1B 00 1B 
    //8E 6E 00 00 36 00 B9 2C 11 00 50 D3 2C 11 36 78 B9 2C 11 00 50 D3 2C 11 16 16 04 0B 47 
  }


  function bool IsValidKnightMove(Move Move) {
    return BaseCheck(Move) && Move.Source.Y != Move.Target.Y
      && Move.Source.X != Move.Target.X
      && Abs(Move.Source.X - Move.Target.X) + Abs(Move.Source.Y - Move.Target.Y) == 3;//0000 : 04 82 82 82 1B 81 6E 00 00 00 C8 D5 2C 11 16 18 21 00 9B 36 68 BA 2C 11 36 00 B9 2C 11 00 C8 D5 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 C8 D5 2C 11 16 16 18 21 00 9B 36 00 B8 2C 11 36 00 B9 2C 11 00 C8 D5 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 C8 D5 2C 11 16 16 18 51 00 B4 AE BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 00 C8 D5 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 C8 D5 2C 11 16 16 BA 39 3F 93 36 68 BA 2C 11 36 00 B9 2C 11 00 C8 D5 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 C8 D5 2C 11 16 16 16 39 3F 2C 03 16 16 
    //04 82 82 82 1B 81 6E 00 00 00 C8 D5 2C 11 16 18 21 00 9B 36 68 BA 2C 11 36 00 B9 2C 11 00 C8 D5 
    //2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 C8 D5 2C 11 16 16 18 21 00 9B 36 00 B8 2C 11 36 00 B9 2C 
    //11 00 C8 D5 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 C8 D5 2C 11 16 16 18 51 00 B4 AE BA 39 3F 93 
    //36 00 B8 2C 11 36 00 B9 2C 11 00 C8 D5 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 C8 D5 2C 11 16 16 
    //BA 39 3F 93 36 68 BA 2C 11 36 00 B9 2C 11 00 C8 D5 2C 11 36 68 BA 2C 11 36 78 B9 2C 11 00 C8 D5 
    //2C 11 16 16 16 39 3F 2C 03 16 16 04 0B 47 
  }


  function bool IsValidPawnMove(Move Move) {
    local bool result1;
    local bool result2;
    local bool result3;
    local bool result4;
    if (Move.White) {                                                           //0000 : 07 E3 01 2D 36 18 BF 2C 11 00 80 D8 2C 11 
      result1 = Move.Target.t == Move.Source.t - 8
        && IsEmpty(Move.Target.t);//000E : 14 2D 00 00 DE 2C 11 82 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 93 36 38 BD 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 08 16 16 18 16 00 1B 7A 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 
      result2 = Move.Target.Y == Move.Source.Y - 1
        && Abs(Move.Target.X - Move.Source.X) == 1
        && IsColor(Move.Target.t,0);//0053 : 14 2D 00 78 DE 2C 11 82 82 9A 36 68 BA 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 93 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 26 16 16 18 2A 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 16 16 39 3F 26 16 16 18 17 00 1B 78 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 25 16 16 
      result3 = Move.Source.Y == 6 && Move.Target.Y == 4
        && Move.Source.X == Move.Target.X
        && IsEmpty(Move.Source.t - 8)
        && IsEmpty(Move.Target.t);//00C6 : 14 2D 00 F0 DE 2C 11 82 82 82 82 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 06 16 18 14 00 9A 36 68 BA 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 2C 04 16 16 18 21 00 9A 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 18 1A 00 1B 7A 6E 00 00 93 36 38 BD 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 08 16 16 16 18 16 00 1B 7A 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 
      result4 = Move.Target.t == EnPassantTarget
        && Abs(Move.Source.X - Move.Target.X) == 1
        && Move.Source.Y == 3;//0155 : 14 2D 00 68 DF 2C 11 82 82 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 01 E0 DF 2C 11 16 18 2A 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 39 3F 26 16 16 18 14 00 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 03 16 16 
      return result1 || result2 || result3 || result4;                          //01B8 : 04 84 84 84 2D 00 00 DE 2C 11 18 07 00 2D 00 78 DE 2C 11 16 18 07 00 2D 00 F0 DE 2C 11 16 18 07 00 2D 00 68 DF 2C 11 16 
    } else {                                                                    //01E0 : 06 86 03 
      return Move.Target.t == Move.Source.t + 8
        && BoardData[Move.Target.t] == 0
        || Move.Target.Y == Move.Source.Y + 1
        && Abs(Move.Target.X - Move.Source.X) == 1
        && IsColor(Move.Target.t,128)
        || Move.Source.Y == 1 && Move.Target.Y == 3
        && Move.Source.X == Move.Target.X
        && IsEmpty(Move.Source.t + 8)
        && IsEmpty(Move.Target.t)
        || Move.Target.t == EnPassantTarget
        && Abs(Move.Source.X - Move.Target.X) == 1
        && Move.Source.Y == 4;//01E3 : 04 84 84 84 82 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 92 36 38 BD 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 08 16 16 18 1B 00 9A 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 01 F8 73 83 0F 25 16 16 18 6E 00 82 82 9A 36 68 BA 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 92 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 26 16 16 18 2A 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 16 16 39 3F 26 16 16 18 18 00 1B 78 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 2C 80 16 16 16 18 88 00 82 82 82 82 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 26 16 18 14 00 9A 36 68 BA 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 2C 03 16 16 18 21 00 9A 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 18 1A 00 1B 7A 6E 00 00 92 36 38 BD 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 08 16 16 16 18 16 00 1B 7A 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 16 18 5D 00 82 82 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 01 E0 DF 2C 11 16 18 2A 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 39 3F 26 16 16 18 14 00 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 04 16 16 16 
    }
    //07 E3 01 2D 36 18 BF 2C 11 00 80 D8 2C 11 14 2D 00 00 DE 2C 11 82 9A 36 38 BD 2C 11 36 78 B9 2C 
    //11 00 80 D8 2C 11 93 36 38 BD 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 08 16 16 18 16 00 1B 7A 6E 
    //00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 14 2D 00 78 DE 2C 11 82 82 9A 36 68 BA 
    //2C 11 36 78 B9 2C 11 00 80 D8 2C 11 93 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 26 16 16 18 
    //2A 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 00 B9 2C 11 
    //00 80 D8 2C 11 16 16 39 3F 26 16 16 18 17 00 1B 78 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 
    //D8 2C 11 25 16 16 14 2D 00 F0 DE 2C 11 82 82 82 82 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 
    //11 2C 06 16 18 14 00 9A 36 68 BA 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 2C 04 16 16 18 21 00 9A 36 
    //00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 18 
    //1A 00 1B 7A 6E 00 00 93 36 38 BD 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 08 16 16 16 18 16 00 1B 
    //7A 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 14 2D 00 68 DF 2C 11 82 82 9A 36 
    //38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 01 E0 DF 2C 11 16 18 2A 00 B4 BA 39 3F 93 36 00 B8 2C 
    //11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 39 3F 26 16 
    //16 18 14 00 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 2C 03 16 16 04 84 84 84 2D 00 00 DE 
    //2C 11 18 07 00 2D 00 78 DE 2C 11 16 18 07 00 2D 00 F0 DE 2C 11 16 18 07 00 2D 00 68 DF 2C 11 16 
    //06 86 03 04 84 84 84 82 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 92 36 38 BD 2C 11 36 00 
    //B9 2C 11 00 80 D8 2C 11 2C 08 16 16 18 1B 00 9A 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 
    //2C 11 01 F8 73 83 0F 25 16 16 18 6E 00 82 82 9A 36 68 BA 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 92 
    //36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 26 16 16 18 2A 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 
    //78 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 16 16 39 3F 26 16 16 18 
    //18 00 1B 78 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 2C 80 16 16 16 18 88 00 82 82 
    //82 82 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 26 16 18 14 00 9A 36 68 BA 2C 11 36 78 B9 
    //2C 11 00 80 D8 2C 11 2C 03 16 16 18 21 00 9A 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 
    //B8 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 16 16 18 1A 00 1B 7A 6E 00 00 92 36 38 BD 2C 11 36 00 B9 
    //2C 11 00 80 D8 2C 11 2C 08 16 16 16 18 16 00 1B 7A 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 
    //D8 2C 11 16 16 16 18 5D 00 82 82 9A 36 38 BD 2C 11 36 78 B9 2C 11 00 80 D8 2C 11 01 E0 DF 2C 11 
    //16 18 2A 00 B4 BA 39 3F 93 36 00 B8 2C 11 36 00 B9 2C 11 00 80 D8 2C 11 36 00 B8 2C 11 36 78 B9 
    //2C 11 00 80 D8 2C 11 16 16 39 3F 26 16 16 18 14 00 9A 36 68 BA 2C 11 36 00 B9 2C 11 00 80 D8 2C 
    //11 2C 04 16 16 16 04 0B 47 
  }


  function bool BaseCheck(Move Move) {
    local bool Empty;
    local bool oppositeColor;
    Empty = IsEmpty(Move.Target.t);                                             //0000 : 14 2D 00 80 E2 2C 11 1B 7A 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 E1 2C 11 16 
    oppositeColor = IsOppositeColor(Move);                                      //001C : 14 2D 00 F8 E2 2C 11 1B C9 6E 00 00 00 80 E1 2C 11 16 
    return Empty || oppositeColor;                                              //002E : 04 84 2D 00 80 E2 2C 11 18 07 00 2D 00 F8 E2 2C 11 16 
    //14 2D 00 80 E2 2C 11 1B 7A 6E 00 00 36 38 BD 2C 11 36 78 B9 2C 11 00 80 E1 2C 11 16 14 2D 00 F8 
    //E2 2C 11 1B C9 6E 00 00 00 80 E1 2C 11 16 04 84 2D 00 80 E2 2C 11 18 07 00 2D 00 F8 E2 2C 11 16 
    //04 0B 47 
  }


  function bool IsClearPathCoords(int sx,int sy,int tx,int ty) {
    local int colDiff;
    local int rowDiff;
    local int col;
    local int row;
    local int pos;
    colDiff = Sign(tx - sx);                                                    //0000 : 0F 00 B8 E6 2C 11 1B A6 6E 00 00 93 00 30 E7 2C 11 00 98 E4 2C 11 16 16 
    rowDiff = Sign(ty - sy);                                                    //0018 : 0F 00 A8 E7 2C 11 1B A6 6E 00 00 93 00 20 E8 2C 11 00 98 E8 2C 11 16 16 
    col = sx + colDiff;                                                         //0030 : 0F 00 10 E9 2C 11 92 00 98 E4 2C 11 00 B8 E6 2C 11 16 
    row = sy + rowDiff;                                                         //0042 : 0F 00 88 E9 2C 11 92 00 98 E8 2C 11 00 A8 E7 2C 11 16 
    while ((col != tx || row != ty) && col >= 0
      && col < 8
      && row >= 0
      && row < 8) {//0054 : 07 0F 01 82 82 82 82 84 9B 00 10 E9 2C 11 00 30 E7 2C 11 16 18 0D 00 9B 00 88 E9 2C 11 00 20 E8 2C 11 16 16 18 09 00 99 00 10 E9 2C 11 25 16 16 18 0A 00 96 00 10 E9 2C 11 2C 08 16 16 18 09 00 99 00 88 E9 2C 11 25 16 16 18 0A 00 96 00 88 E9 2C 11 2C 08 16 16 
      pos = col + (row << 3);                                                   //00AA : 0F 00 00 EA 2C 11 92 00 10 E9 2C 11 94 00 88 E9 2C 11 2C 03 16 16 
      if (pos >= BoardData.Length || pos < 0) {                                 //00C0 : 07 DF 00 84 99 00 00 EA 2C 11 37 01 F8 73 83 0F 16 18 09 00 96 00 00 EA 2C 11 25 16 16 
        return False;                                                           //00DD : 04 28 
      }
      if (BoardData[pos] != 0) {                                                //00DF : 07 F4 00 9B 39 3A 10 00 00 EA 2C 11 01 F8 73 83 0F 25 16 
        return False;                                                           //00F2 : 04 28 
      }
      col += colDiff;                                                           //00F4 : A1 00 10 E9 2C 11 00 B8 E6 2C 11 16 
      row += rowDiff;                                                           //0100 : A1 00 88 E9 2C 11 00 A8 E7 2C 11 16 
    }
    return True;                                                                //010F : 04 27 
    //0F 00 B8 E6 2C 11 1B A6 6E 00 00 93 00 30 E7 2C 11 00 98 E4 2C 11 16 16 0F 00 A8 E7 2C 11 1B A6 
    //6E 00 00 93 00 20 E8 2C 11 00 98 E8 2C 11 16 16 0F 00 10 E9 2C 11 92 00 98 E4 2C 11 00 B8 E6 2C 
    //11 16 0F 00 88 E9 2C 11 92 00 98 E8 2C 11 00 A8 E7 2C 11 16 07 0F 01 82 82 82 82 84 9B 00 10 E9 
    //2C 11 00 30 E7 2C 11 16 18 0D 00 9B 00 88 E9 2C 11 00 20 E8 2C 11 16 16 18 09 00 99 00 10 E9 2C 
    //11 25 16 16 18 0A 00 96 00 10 E9 2C 11 2C 08 16 16 18 09 00 99 00 88 E9 2C 11 25 16 16 18 0A 00 
    //96 00 88 E9 2C 11 2C 08 16 16 0F 00 00 EA 2C 11 92 00 10 E9 2C 11 94 00 88 E9 2C 11 2C 03 16 16 
    //07 DF 00 84 99 00 00 EA 2C 11 37 01 F8 73 83 0F 16 18 09 00 96 00 00 EA 2C 11 25 16 16 04 28 07 
    //F4 00 9B 39 3A 10 00 00 EA 2C 11 01 F8 73 83 0F 25 16 04 28 A1 00 10 E9 2C 11 00 B8 E6 2C 11 16 
    //A1 00 88 E9 2C 11 00 A8 E7 2C 11 16 06 54 00 04 27 04 0B 47 
  }


  function bool IsClearPath(BoardPosition Source,BoardPosition Target) {
    return IsClearPathCoords(Source.X,Source.Y,Target.X,Target.Y);              //0000 : 04 1B 85 6E 00 00 36 00 B8 2C 11 00 A0 EB 2C 11 36 68 BA 2C 11 00 A0 EB 2C 11 36 00 B8 2C 11 00 88 EC 2C 11 36 68 BA 2C 11 00 88 EC 2C 11 16 
    //04 1B 85 6E 00 00 36 00 B8 2C 11 00 A0 EB 2C 11 36 68 BA 2C 11 00 A0 EB 2C 11 36 00 B8 2C 11 00 
    //88 EC 2C 11 36 68 BA 2C 11 00 88 EC 2C 11 16 04 0B 47 
  }


  function int Sign(int X) {
    return X / Abs(X);                                                          //0000 : 04 39 44 AC 39 3F 00 28 EE 2C 11 BA 39 3F 00 28 EE 2C 11 16 16 
    //04 39 44 AC 39 3F 00 28 EE 2C 11 BA 39 3F 00 28 EE 2C 11 16 16 04 0B 47 
  }


  function bool AttackedByBlack(int tx,int ty) {
    local int X;
    local int Y;
    Y = 0;                                                                      //0000 : 0F 00 68 F1 2C 11 25 
    while (Y < 8) {                                                             //0007 : 07 76 00 96 00 68 F1 2C 11 2C 08 16 
      X = 0;                                                                    //0013 : 0F 00 E0 F1 2C 11 25 
      while (X < 8) {                                                           //001A : 07 6C 00 96 00 E0 F1 2C 11 2C 08 16 
        if (IsColor(X + (Y << 3),0) && IsAttacking(X,Y,tx,ty,True)) {           //0026 : 07 62 00 82 1B 78 6E 00 00 92 00 E0 F1 2C 11 94 00 68 F1 2C 11 2C 03 16 16 25 16 18 1C 00 1B FD 1B 00 00 00 E0 F1 2C 11 00 68 F1 2C 11 00 18 F0 2C 11 00 58 F2 2C 11 27 16 16 
          return True;                                                          //0060 : 04 27 
        }
        X++;                                                                    //0062 : A5 00 E0 F1 2C 11 16 
      }
      Y++;                                                                      //006C : A5 00 68 F1 2C 11 16 
    }
    return False;                                                               //0076 : 04 28 
    //0F 00 68 F1 2C 11 25 07 76 00 96 00 68 F1 2C 11 2C 08 16 0F 00 E0 F1 2C 11 25 07 6C 00 96 00 E0 
    //F1 2C 11 2C 08 16 07 62 00 82 1B 78 6E 00 00 92 00 E0 F1 2C 11 94 00 68 F1 2C 11 2C 03 16 16 25 
    //16 18 1C 00 1B FD 1B 00 00 00 E0 F1 2C 11 00 68 F1 2C 11 00 18 F0 2C 11 00 58 F2 2C 11 27 16 16 
    //04 27 A5 00 E0 F1 2C 11 16 06 1A 00 A5 00 68 F1 2C 11 16 06 07 00 04 28 04 0B 47 
  }


  function bool AttackedByWhite(int tx,int ty) {
    local int X;
    local int Y;
    Y = 0;                                                                      //0000 : 0F 00 48 F5 2C 11 25 
    while (Y < 8) {                                                             //0007 : 07 77 00 96 00 48 F5 2C 11 2C 08 16 
      X = 0;                                                                    //0013 : 0F 00 C0 F5 2C 11 25 
      while (X < 8) {                                                           //001A : 07 6D 00 96 00 C0 F5 2C 11 2C 08 16 
        if (IsColor(X + (Y << 3),128) && IsAttacking(X,Y,tx,ty,True)) {         //0026 : 07 63 00 82 1B 78 6E 00 00 92 00 C0 F5 2C 11 94 00 48 F5 2C 11 2C 03 16 16 2C 80 16 18 1C 00 1B FD 1B 00 00 00 C0 F5 2C 11 00 48 F5 2C 11 00 F8 F3 2C 11 00 38 F6 2C 11 27 16 16 
          return True;                                                          //0061 : 04 27 
        }
        X++;                                                                    //0063 : A5 00 C0 F5 2C 11 16 
      }
      Y++;                                                                      //006D : A5 00 48 F5 2C 11 16 
    }
    return False;                                                               //0077 : 04 28 
    //0F 00 48 F5 2C 11 25 07 77 00 96 00 48 F5 2C 11 2C 08 16 0F 00 C0 F5 2C 11 25 07 6D 00 96 00 C0 
    //F5 2C 11 2C 08 16 07 63 00 82 1B 78 6E 00 00 92 00 C0 F5 2C 11 94 00 48 F5 2C 11 2C 03 16 16 2C 
    //80 16 18 1C 00 1B FD 1B 00 00 00 C0 F5 2C 11 00 48 F5 2C 11 00 F8 F3 2C 11 00 38 F6 2C 11 27 16 
    //16 04 27 A5 00 C0 F5 2C 11 16 06 1A 00 A5 00 48 F5 2C 11 16 06 07 00 04 28 04 0B 47 
  }


  function bool IsAttacking(int sx,int sy,int tx,int ty,optional bool noKingCheck) {
    local int PieceType;
    local int PieceColor;
    local int RequiredOpponentColor;
    PieceType = GetPieceType(sx,sy);                                            //0000 : 0F 00 50 F8 2C 11 1B 80 6E 00 00 00 D8 F7 2C 11 00 C8 F8 2C 11 16 
    PieceColor = GetPieceColor(sx,sy);                                          //0016 : 0F 00 40 F9 2C 11 1B 86 6E 00 00 00 D8 F7 2C 11 00 C8 F8 2C 11 16 
    if (PieceColor == 128) {                                                    //002C : 07 42 00 9A 00 40 F9 2C 11 2C 80 16 
      RequiredOpponentColor = 0;                                                //0038 : 0F 00 B8 F9 2C 11 25 
    } else {                                                                    //003F : 06 4A 00 
      RequiredOpponentColor = 128;                                              //0042 : 0F 00 B8 F9 2C 11 2C 80 
    }
    switch (PieceType) {                                                        //004A : 05 04 00 50 F8 2C 11 
      case 1 :                                                                  //0051 : 0A F1 00 26 
        if (PieceColor == 128) {                                                //0055 : 07 AA 00 9A 00 40 F9 2C 11 2C 80 16 
          return ty == sy - 1 && Abs(tx - sx) == 1
            && IsColor(tx + (ty << 3),0);//0061 : 04 82 82 9A 00 30 FA 2C 11 93 00 C8 F8 2C 11 26 16 16 18 16 00 B4 BA 39 3F 93 00 A8 FA 2C 11 00 D8 F7 2C 11 16 16 39 3F 26 16 16 18 18 00 1B 78 6E 00 00 92 00 A8 FA 2C 11 94 00 30 FA 2C 11 2C 03 16 16 25 16 16 
        } else {                                                                //00A7 : 06 F1 00 
          return ty == sy + 1 && Abs(tx - sx) == 1
            && IsColor(tx + (ty << 3),128);//00AA : 04 82 82 9A 00 30 FA 2C 11 92 00 C8 F8 2C 11 26 16 16 18 16 00 B4 BA 39 3F 93 00 A8 FA 2C 11 00 D8 F7 2C 11 16 16 39 3F 26 16 16 18 19 00 1B 78 6E 00 00 92 00 A8 FA 2C 11 94 00 30 FA 2C 11 2C 03 16 16 2C 80 16 16 
        }
      case 32 :                                                                 //00F1 : 0A 5D 01 2C 20 
        return (IsEmpty(tx + (ty << 3))
          || GetPieceColor(tx,ty) == RequiredOpponentColor)
          && Abs(sy - ty) <= 1 && Abs(sx - tx) <= 1;//00F6 : 04 82 84 1B 7A 6E 00 00 92 00 A8 FA 2C 11 94 00 30 FA 2C 11 2C 03 16 16 16 18 18 00 9A 1B 86 6E 00 00 00 A8 FA 2C 11 00 30 FA 2C 11 16 00 B8 F9 2C 11 16 16 18 30 00 82 B2 BA 39 3F 93 00 C8 F8 2C 11 00 30 FA 2C 11 16 16 39 3F 26 16 18 16 00 B2 BA 39 3F 93 00 D8 F7 2C 11 00 A8 FA 2C 11 16 16 39 3F 26 16 16 16 
      default:                                                                  //015D : 0A FF FF 
        if (noKingCheck) {                                                      //0160 : 07 88 01 2D 00 20 FB 2C 11 
          return ValidPieceMove(sx,sy,tx,ty,True);                              //0169 : 04 1B 9F 6E 00 00 00 D8 F7 2C 11 00 C8 F8 2C 11 00 A8 FA 2C 11 00 30 FA 2C 11 27 16 
        } else {                                                                //0185 : 06 A4 01 
          return ValidMove(sx,sy,tx,ty,True);                                   //0188 : 04 1B 76 6E 00 00 00 D8 F7 2C 11 00 C8 F8 2C 11 00 A8 FA 2C 11 00 30 FA 2C 11 27 16 
        }
      }
    }
    //0F 00 50 F8 2C 11 1B 80 6E 00 00 00 D8 F7 2C 11 00 C8 F8 2C 11 16 0F 00 40 F9 2C 11 1B 86 6E 00 
    //00 00 D8 F7 2C 11 00 C8 F8 2C 11 16 07 42 00 9A 00 40 F9 2C 11 2C 80 16 0F 00 B8 F9 2C 11 25 06 
    //4A 00 0F 00 B8 F9 2C 11 2C 80 05 04 00 50 F8 2C 11 0A F1 00 26 07 AA 00 9A 00 40 F9 2C 11 2C 80 
    //16 04 82 82 9A 00 30 FA 2C 11 93 00 C8 F8 2C 11 26 16 16 18 16 00 B4 BA 39 3F 93 00 A8 FA 2C 11 
    //00 D8 F7 2C 11 16 16 39 3F 26 16 16 18 18 00 1B 78 6E 00 00 92 00 A8 FA 2C 11 94 00 30 FA 2C 11 
    //2C 03 16 16 25 16 16 06 F1 00 04 82 82 9A 00 30 FA 2C 11 92 00 C8 F8 2C 11 26 16 16 18 16 00 B4 
    //BA 39 3F 93 00 A8 FA 2C 11 00 D8 F7 2C 11 16 16 39 3F 26 16 16 18 19 00 1B 78 6E 00 00 92 00 A8 
    //FA 2C 11 94 00 30 FA 2C 11 2C 03 16 16 2C 80 16 16 0A 5D 01 2C 20 04 82 84 1B 7A 6E 00 00 92 00 
    //A8 FA 2C 11 94 00 30 FA 2C 11 2C 03 16 16 16 18 18 00 9A 1B 86 6E 00 00 00 A8 FA 2C 11 00 30 FA 
    //2C 11 16 00 B8 F9 2C 11 16 16 18 30 00 82 B2 BA 39 3F 93 00 C8 F8 2C 11 00 30 FA 2C 11 16 16 39 
    //3F 26 16 18 16 00 B2 BA 39 3F 93 00 D8 F7 2C 11 00 A8 FA 2C 11 16 16 39 3F 26 16 16 16 0A FF FF 
    //07 88 01 2D 00 20 FB 2C 11 04 1B 9F 6E 00 00 00 D8 F7 2C 11 00 C8 F8 2C 11 00 A8 FA 2C 11 00 30 
    //FA 2C 11 27 16 06 A4 01 04 1B 76 6E 00 00 00 D8 F7 2C 11 00 C8 F8 2C 11 00 A8 FA 2C 11 00 30 FA 
    //2C 11 27 16 04 0B 47 
  }


  function bool HasValidDiagonalMove(int sx,int sy) {
    local int Y;
    local int X;
    local int startX1;
    local int startX2;
    local int StartY;
    startX1 = sx - Min(sx,sy);                                                  //0000 : 0F 00 E8 FE 2C 11 93 00 C0 FC 2C 11 F9 00 C0 FC 2C 11 00 60 FF 2C 11 16 16 
    startX2 = sx + Min(7 - sx,sy);                                              //0019 : 0F 00 D8 FF 2C 11 92 00 C0 FC 2C 11 F9 93 2C 07 00 C0 FC 2C 11 16 00 60 FF 2C 11 16 16 
    StartY = sy - Min(sx,sy);                                                   //0036 : 0F 00 50 00 2D 11 93 00 60 FF 2C 11 F9 00 C0 FC 2C 11 00 60 FF 2C 11 16 16 
    Y = StartY;                                                                 //004F : 0F 00 C8 00 2D 11 00 50 00 2D 11 
    X = startX1;                                                                //005A : 0F 00 40 01 2D 11 00 E8 FE 2C 11 
    while (Y < 7 && X < 7) {                                                    //0065 : 07 B2 00 82 96 00 C8 00 2D 11 2C 07 16 18 0A 00 96 00 40 01 2D 11 2C 07 16 16 
      if (ValidMove(sx,sy,X,Y,True)) {                                          //007F : 07 9F 00 1B 76 6E 00 00 00 C0 FC 2C 11 00 60 FF 2C 11 00 40 01 2D 11 00 C8 00 2D 11 27 16 
        return True;                                                            //009D : 04 27 
      }
      Y += 1;                                                                   //009F : A1 00 C8 00 2D 11 26 16 
      X += 1;                                                                   //00A7 : A1 00 40 01 2D 11 26 16 
    }
    Y = StartY;                                                                 //00B2 : 0F 00 C8 00 2D 11 00 50 00 2D 11 
    X = startX2;                                                                //00BD : 0F 00 40 01 2D 11 00 D8 FF 2C 11 
    while (Y < 7 && X >= 0) {                                                   //00C8 : 07 14 01 82 96 00 C8 00 2D 11 2C 07 16 18 09 00 99 00 40 01 2D 11 25 16 16 
      if (ValidMove(sx,sy,X,Y,True)) {                                          //00E1 : 07 01 01 1B 76 6E 00 00 00 C0 FC 2C 11 00 60 FF 2C 11 00 40 01 2D 11 00 C8 00 2D 11 27 16 
        return True;                                                            //00FF : 04 27 
      }
      Y += 1;                                                                   //0101 : A1 00 C8 00 2D 11 26 16 
      X -= 1;                                                                   //0109 : A2 00 40 01 2D 11 26 16 
    }
    return False;                                                               //0114 : 04 28 
    //0F 00 E8 FE 2C 11 93 00 C0 FC 2C 11 F9 00 C0 FC 2C 11 00 60 FF 2C 11 16 16 0F 00 D8 FF 2C 11 92 
    //00 C0 FC 2C 11 F9 93 2C 07 00 C0 FC 2C 11 16 00 60 FF 2C 11 16 16 0F 00 50 00 2D 11 93 00 60 FF 
    //2C 11 F9 00 C0 FC 2C 11 00 60 FF 2C 11 16 16 0F 00 C8 00 2D 11 00 50 00 2D 11 0F 00 40 01 2D 11 
    //00 E8 FE 2C 11 07 B2 00 82 96 00 C8 00 2D 11 2C 07 16 18 0A 00 96 00 40 01 2D 11 2C 07 16 16 07 
    //9F 00 1B 76 6E 00 00 00 C0 FC 2C 11 00 60 FF 2C 11 00 40 01 2D 11 00 C8 00 2D 11 27 16 04 27 A1 
    //00 C8 00 2D 11 26 16 A1 00 40 01 2D 11 26 16 06 65 00 0F 00 C8 00 2D 11 00 50 00 2D 11 0F 00 40 
    //01 2D 11 00 D8 FF 2C 11 07 14 01 82 96 00 C8 00 2D 11 2C 07 16 18 09 00 99 00 40 01 2D 11 25 16 
    //16 07 01 01 1B 76 6E 00 00 00 C0 FC 2C 11 00 60 FF 2C 11 00 40 01 2D 11 00 C8 00 2D 11 27 16 04 
    //27 A1 00 C8 00 2D 11 26 16 A2 00 40 01 2D 11 26 16 06 C8 00 04 28 04 0B 47 
  }


  function bool HasValidVerticalMove(int sx,int sy) {
    local int tx;
    tx = 0;                                                                     //0000 : 0F 00 E0 03 2D 11 25 
    while (tx < 8) {                                                            //0007 : 07 3D 00 96 00 E0 03 2D 11 2C 08 16 
      if (ValidMove(sx,sy,tx,sy,True)) {                                        //0013 : 07 33 00 1B 76 6E 00 00 00 E0 02 2D 11 00 58 04 2D 11 00 E0 03 2D 11 00 58 04 2D 11 27 16 
        return True;                                                            //0031 : 04 27 
      }
      tx++;                                                                     //0033 : A5 00 E0 03 2D 11 16 
    }
    return False;                                                               //003D : 04 28 
    //0F 00 E0 03 2D 11 25 07 3D 00 96 00 E0 03 2D 11 2C 08 16 07 33 00 1B 76 6E 00 00 00 E0 02 2D 11 
    //00 58 04 2D 11 00 E0 03 2D 11 00 58 04 2D 11 27 16 04 27 A5 00 E0 03 2D 11 16 06 07 00 04 28 04 
    //0B 47 
  }


  function bool HasValidHorizontalMove(int sx,int sy) {
    local int ty;
    ty = 0;                                                                     //0000 : 0F 00 F8 06 2D 11 25 
    while (ty < 8) {                                                            //0007 : 07 3D 00 96 00 F8 06 2D 11 2C 08 16 
      if (ValidMove(sx,sy,sx,ty,True)) {                                        //0013 : 07 33 00 1B 76 6E 00 00 00 F8 05 2D 11 00 70 07 2D 11 00 F8 05 2D 11 00 F8 06 2D 11 27 16 
        return True;                                                            //0031 : 04 27 
      }
      ty++;                                                                     //0033 : A5 00 F8 06 2D 11 16 
    }
    return False;                                                               //003D : 04 28 
    //0F 00 F8 06 2D 11 25 07 3D 00 96 00 F8 06 2D 11 2C 08 16 07 33 00 1B 76 6E 00 00 00 F8 05 2D 11 
    //00 70 07 2D 11 00 F8 05 2D 11 00 F8 06 2D 11 27 16 04 27 A5 00 F8 06 2D 11 16 06 07 00 04 28 04 
    //0B 47 
  }


  function bool HasValidKingMove(int sx,int sy) {
    local int X;
    local int Y;
    Y = -1;                                                                     //0000 : 0F 00 58 0B 2D 11 1D FF FF FF FF 
    while (Y <= 1) {                                                            //000B : 07 D8 00 98 00 58 0B 2D 11 26 16 
      X = -1;                                                                   //0016 : 0F 00 D0 0B 2D 11 1D FF FF FF FF 
      while (X <= 1) {                                                          //0021 : 07 CE 00 98 00 D0 0B 2D 11 26 16 
        if ((X != 0 || Y != 0) && sx + X >= 0
          && sx + X < 8
          && sy + Y >= 0
          && sy + Y < 8) {//002C : 07 C4 00 82 82 82 82 84 9B 00 D0 0B 2D 11 25 16 18 09 00 9B 00 58 0B 2D 11 25 16 16 18 10 00 99 92 00 10 09 2D 11 00 D0 0B 2D 11 16 25 16 16 18 11 00 96 92 00 10 09 2D 11 00 D0 0B 2D 11 16 2C 08 16 16 18 10 00 99 92 00 48 0C 2D 11 00 58 0B 2D 11 16 25 16 16 18 11 00 96 92 00 48 0C 2D 11 00 58 0B 2D 11 16 2C 08 16 16 
          if (ValidMove(sx,sy,sx + X,sy + Y,True)) {                            //0096 : 07 C4 00 1B 76 6E 00 00 00 10 09 2D 11 00 48 0C 2D 11 92 00 10 09 2D 11 00 D0 0B 2D 11 16 92 00 48 0C 2D 11 00 58 0B 2D 11 16 27 16 
            return True;                                                        //00C2 : 04 27 
          }
        }
        X++;                                                                    //00C4 : A5 00 D0 0B 2D 11 16 
      }
      Y++;                                                                      //00CE : A5 00 58 0B 2D 11 16 
    }
    if ((Status & 4) == 0) {                                                    //00D8 : 07 31 01 9A 9C 39 3A 01 C0 BC 2C 11 2C 04 16 25 16 
      if (ValidMove(sx,sy,sx + 2,sy,True)) {                                    //00E9 : 07 0D 01 1B 76 6E 00 00 00 10 09 2D 11 00 48 0C 2D 11 92 00 10 09 2D 11 2C 02 16 00 48 0C 2D 11 27 16 
        return True;                                                            //010B : 04 27 
      }
      if (ValidMove(sx,sy,sx - 2,sy,True)) {                                    //010D : 07 31 01 1B 76 6E 00 00 00 10 09 2D 11 00 48 0C 2D 11 93 00 10 09 2D 11 2C 02 16 00 48 0C 2D 11 27 16 
        return True;                                                            //012F : 04 27 
      }
    }
    //0F 00 58 0B 2D 11 1D FF FF FF FF 07 D8 00 98 00 58 0B 2D 11 26 16 0F 00 D0 0B 2D 11 1D FF FF FF 
    //FF 07 CE 00 98 00 D0 0B 2D 11 26 16 07 C4 00 82 82 82 82 84 9B 00 D0 0B 2D 11 25 16 18 09 00 9B 
    //00 58 0B 2D 11 25 16 16 18 10 00 99 92 00 10 09 2D 11 00 D0 0B 2D 11 16 25 16 16 18 11 00 96 92 
    //00 10 09 2D 11 00 D0 0B 2D 11 16 2C 08 16 16 18 10 00 99 92 00 48 0C 2D 11 00 58 0B 2D 11 16 25 
    //16 16 18 11 00 96 92 00 48 0C 2D 11 00 58 0B 2D 11 16 2C 08 16 16 07 C4 00 1B 76 6E 00 00 00 10 
    //09 2D 11 00 48 0C 2D 11 92 00 10 09 2D 11 00 D0 0B 2D 11 16 92 00 48 0C 2D 11 00 58 0B 2D 11 16 
    //27 16 04 27 A5 00 D0 0B 2D 11 16 06 21 00 A5 00 58 0B 2D 11 16 06 0B 00 07 31 01 9A 9C 39 3A 01 
    //C0 BC 2C 11 2C 04 16 25 16 07 0D 01 1B 76 6E 00 00 00 10 09 2D 11 00 48 0C 2D 11 92 00 10 09 2D 
    //11 2C 02 16 00 48 0C 2D 11 27 16 04 27 07 31 01 1B 76 6E 00 00 00 10 09 2D 11 00 48 0C 2D 11 93 
    //00 10 09 2D 11 2C 02 16 00 48 0C 2D 11 27 16 04 27 04 0B 47 
  }


  function bool HasValidPawnMove(int sx,int sy) {
    local int Color;
    Color = GetPieceColor(sx,sy);                                               //0000 : 0F 00 60 0E 2D 11 1B 86 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 16 
    if (Color == 0) {                                                           //0016 : 07 09 01 9A 00 60 0E 2D 11 25 16 
      if (sy < 7 && sx > 0
        && ValidMove(sx,sy,sx - 1,sy + 1,True)) {    //0021 : 07 62 00 82 82 96 00 D8 0E 2D 11 2C 07 16 18 09 00 97 00 E8 0D 2D 11 25 16 16 18 22 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 93 00 E8 0D 2D 11 26 16 92 00 D8 0E 2D 11 26 16 27 16 16 
        return True;                                                            //0060 : 04 27 
      }
      if (sy < 7
        && ValidMove(sx,sy,sx,sy + 1,True)) {                  //0062 : 07 93 00 82 96 00 D8 0E 2D 11 2C 07 16 18 1F 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 00 E8 0D 2D 11 92 00 D8 0E 2D 11 26 16 27 16 16 
        return True;                                                            //0091 : 04 27 
      }
      if (sy < 7 && sx < 7
        && ValidMove(sx,sy,sx + 1,sy + 1,True)) {    //0093 : 07 D5 00 82 82 96 00 D8 0E 2D 11 2C 07 16 18 0A 00 96 00 E8 0D 2D 11 2C 07 16 16 18 22 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 92 00 E8 0D 2D 11 26 16 92 00 D8 0E 2D 11 26 16 27 16 16 
        return True;                                                            //00D3 : 04 27 
      }
      if (sy == 1
        && ValidMove(sx,sy,sx,sy + 2,True)) {                 //00D5 : 07 06 01 82 9A 00 D8 0E 2D 11 26 16 18 20 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 00 E8 0D 2D 11 92 00 D8 0E 2D 11 2C 02 16 27 16 16 
        return True;                                                            //0104 : 04 27 
      }
    } else {                                                                    //0106 : 06 B6 01 
      if (Color == 128) {                                                       //0109 : 07 B6 01 9A 00 60 0E 2D 11 2C 80 16 
        if (ValidMove(sx,sy,sx - 1,sy - 1,True)) {                              //0115 : 07 3B 01 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 93 00 E8 0D 2D 11 26 16 93 00 D8 0E 2D 11 26 16 27 16 
          return True;                                                          //0139 : 04 27 
        }
        if (ValidMove(sx,sy,sx,sy - 1,True)) {                                  //013B : 07 5E 01 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 00 E8 0D 2D 11 93 00 D8 0E 2D 11 26 16 27 16 
          return True;                                                          //015C : 04 27 
        }
        if (ValidMove(sx,sy,sx + 1,sy - 1,True)) {                              //015E : 07 84 01 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 92 00 E8 0D 2D 11 26 16 93 00 D8 0E 2D 11 26 16 27 16 
          return True;                                                          //0182 : 04 27 
        }
        if (sy == 6
          && ValidMove(sx,sy,sx,sy - 2,True)) {             //0184 : 07 B6 01 82 9A 00 D8 0E 2D 11 2C 06 16 18 20 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 00 E8 0D 2D 11 93 00 D8 0E 2D 11 2C 02 16 27 16 16 
          return True;                                                          //01B4 : 04 27 
        }
      }
    }
    //0F 00 60 0E 2D 11 1B 86 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 16 07 09 01 9A 00 60 0E 2D 11 25 
    //16 07 62 00 82 82 96 00 D8 0E 2D 11 2C 07 16 18 09 00 97 00 E8 0D 2D 11 25 16 16 18 22 00 1B 76 
    //6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 93 00 E8 0D 2D 11 26 16 92 00 D8 0E 2D 11 26 16 27 16 16 
    //04 27 07 93 00 82 96 00 D8 0E 2D 11 2C 07 16 18 1F 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 
    //11 00 E8 0D 2D 11 92 00 D8 0E 2D 11 26 16 27 16 16 04 27 07 D5 00 82 82 96 00 D8 0E 2D 11 2C 07 
    //16 18 0A 00 96 00 E8 0D 2D 11 2C 07 16 16 18 22 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 
    //92 00 E8 0D 2D 11 26 16 92 00 D8 0E 2D 11 26 16 27 16 16 04 27 07 06 01 82 9A 00 D8 0E 2D 11 26 
    //16 18 20 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 00 E8 0D 2D 11 92 00 D8 0E 2D 11 2C 02 
    //16 27 16 16 04 27 06 B6 01 07 B6 01 9A 00 60 0E 2D 11 2C 80 16 07 3B 01 1B 76 6E 00 00 00 E8 0D 
    //2D 11 00 D8 0E 2D 11 93 00 E8 0D 2D 11 26 16 93 00 D8 0E 2D 11 26 16 27 16 04 27 07 5E 01 1B 76 
    //6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 00 E8 0D 2D 11 93 00 D8 0E 2D 11 26 16 27 16 04 27 07 84 
    //01 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 0E 2D 11 92 00 E8 0D 2D 11 26 16 93 00 D8 0E 2D 11 26 16 
    //27 16 04 27 07 B6 01 82 9A 00 D8 0E 2D 11 2C 06 16 18 20 00 1B 76 6E 00 00 00 E8 0D 2D 11 00 D8 
    //0E 2D 11 00 E8 0D 2D 11 93 00 D8 0E 2D 11 2C 02 16 27 16 16 04 27 04 0B 47 
  }


  function bool HasValidMove(int sx,int sy) {
    local int tx;
    local int ty;
    local int sourceType;
    sourceType = GetPieceType(sx,sy);                                           //0000 : 0F 00 F0 10 2D 11 1B 80 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 
    switch (sourceType) {                                                       //0016 : 05 04 00 F0 10 2D 11 
      case 1 :                                                                  //001D : 0A 35 00 26 
        return HasValidPawnMove(sx,sy);                                         //0021 : 04 1B C8 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 
        break;                                                                  //0032 : 06 38 01 
      case 8 :                                                                  //0035 : 0A 63 00 2C 08 
        return HasValidHorizontalMove(sx,sy) || HasValidVerticalMove(sx,sy);    //003A : 04 84 1B A1 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 18 11 00 1B A2 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 16 
        break;                                                                  //0060 : 06 38 01 
      case 4 :                                                                  //0063 : 0A 7C 00 2C 04 
        return HasValidDiagonalMove(sx,sy);                                     //0068 : 04 1B A7 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 
        break;                                                                  //0079 : 06 38 01 
      case 16 :                                                                 //007C : 0A BF 00 2C 10 
        return HasValidDiagonalMove(sx,sy) || HasValidHorizontalMove(sx,sy)
          || HasValidVerticalMove(sx,sy);//0081 : 04 84 84 1B A7 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 18 11 00 1B A1 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 16 18 11 00 1B A2 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 16 
        break;                                                                  //00BC : 06 38 01 
      case 32 :                                                                 //00BF : 0A D8 00 2C 20 
        return HasValidKingMove(sx,sy);                                         //00C4 : 04 1B C7 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 
        break;                                                                  //00D5 : 06 38 01 
      default:                                                                  //00D8 : 0A FF FF 
        ty = 0;                                                                 //00DB : 0F 00 E0 11 2D 11 25 
        while (ty < 8) {                                                        //00E2 : 07 35 01 96 00 E0 11 2D 11 2C 08 16 
          tx = 0;                                                               //00EE : 0F 00 58 12 2D 11 25 
          while (tx < 8) {                                                      //00F5 : 07 2B 01 96 00 58 12 2D 11 2C 08 16 
            if (ValidMove(sx,sy,tx,ty,True)) {                                  //0101 : 07 21 01 1B 76 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 00 58 12 2D 11 00 E0 11 2D 11 27 16 
              return True;                                                      //011F : 04 27 
            }
            tx++;                                                               //0121 : A5 00 58 12 2D 11 16 
          }
          ty++;                                                                 //012B : A5 00 E0 11 2D 11 16 
        }
        break;                                                                  //0135 : 06 38 01 
    }
    return False;                                                               //0138 : 04 28 
    //0F 00 F0 10 2D 11 1B 80 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 05 04 00 F0 10 2D 11 0A 35 00 
    //26 04 1B C8 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 06 38 01 0A 63 00 2C 08 04 84 1B A1 6E 00 
    //00 00 78 10 2D 11 00 68 11 2D 11 16 18 11 00 1B A2 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 16 
    //06 38 01 0A 7C 00 2C 04 04 1B A7 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 06 38 01 0A BF 00 2C 
    //10 04 84 84 1B A7 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 18 11 00 1B A1 6E 00 00 00 78 10 2D 
    //11 00 68 11 2D 11 16 16 18 11 00 1B A2 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 16 06 38 01 0A 
    //D8 00 2C 20 04 1B C7 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 16 06 38 01 0A FF FF 0F 00 E0 11 2D 
    //11 25 07 35 01 96 00 E0 11 2D 11 2C 08 16 0F 00 58 12 2D 11 25 07 2B 01 96 00 58 12 2D 11 2C 08 
    //16 07 21 01 1B 76 6E 00 00 00 78 10 2D 11 00 68 11 2D 11 00 58 12 2D 11 00 E0 11 2D 11 27 16 04 
    //27 A5 00 58 12 2D 11 16 06 F5 00 A5 00 E0 11 2D 11 16 06 E2 00 06 38 01 04 28 04 0B 47 
  }


  function GenerateMoves() {
    local int sx;
    local int sy;
    MovesPossible = False;                                                      //0000 : 14 2D 01 B8 15 2D 11 28 
    sy = 0;                                                                     //0008 : 0F 00 30 16 2D 11 25 
    while (sy < 8) {                                                            //000F : 07 CC 00 96 00 30 16 2D 11 2C 08 16 
      sx = 0;                                                                   //001B : 0F 00 F8 13 2D 11 25 
      while (sx < 8) {                                                          //0022 : 07 C2 00 96 00 F8 13 2D 11 2C 08 16 
        if (WhiteIsMoving && IsColor(sx + (sy << 3),128)) {                     //002E : 07 74 00 82 2D 01 A8 16 2D 11 18 19 00 1B 78 6E 00 00 92 00 F8 13 2D 11 94 00 30 16 2D 11 2C 03 16 16 2C 80 16 16 
          if (HasValidMove(sx,sy)) {                                            //0054 : 07 71 00 1B A0 6E 00 00 00 F8 13 2D 11 00 30 16 2D 11 16 
            MovesPossible = True;                                               //0067 : 14 2D 01 B8 15 2D 11 27 
            return;                                                             //006F : 04 0B 
          }
        } else {                                                                //0071 : 06 B8 00 
          if (!WhiteIsMoving && IsColor(sx + (sy << 3),0)) {                    //0074 : 07 B8 00 82 81 2D 01 A8 16 2D 11 16 18 18 00 1B 78 6E 00 00 92 00 F8 13 2D 11 94 00 30 16 2D 11 2C 03 16 16 25 16 16 
            if (HasValidMove(sx,sy)) {                                          //009B : 07 B8 00 1B A0 6E 00 00 00 F8 13 2D 11 00 30 16 2D 11 16 
              MovesPossible = True;                                             //00AE : 14 2D 01 B8 15 2D 11 27 
              return;                                                           //00B6 : 04 0B 
            }
          }
        }
        sx++;                                                                   //00B8 : A5 00 F8 13 2D 11 16 
      }
      sy++;                                                                     //00C2 : A5 00 30 16 2D 11 16 
    }
    //14 2D 01 B8 15 2D 11 28 0F 00 30 16 2D 11 25 07 CC 00 96 00 30 16 2D 11 2C 08 16 0F 00 F8 13 2D 
    //11 25 07 C2 00 96 00 F8 13 2D 11 2C 08 16 07 74 00 82 2D 01 A8 16 2D 11 18 19 00 1B 78 6E 00 00 
    //92 00 F8 13 2D 11 94 00 30 16 2D 11 2C 03 16 16 2C 80 16 16 07 71 00 1B A0 6E 00 00 00 F8 13 2D 
    //11 00 30 16 2D 11 16 14 2D 01 B8 15 2D 11 27 04 0B 06 B8 00 07 B8 00 82 81 2D 01 A8 16 2D 11 16 
    //18 18 00 1B 78 6E 00 00 92 00 F8 13 2D 11 94 00 30 16 2D 11 2C 03 16 16 25 16 16 07 B8 00 1B A0 
    //6E 00 00 00 F8 13 2D 11 00 30 16 2D 11 16 14 2D 01 B8 15 2D 11 27 04 0B A5 00 F8 13 2D 11 16 06 
    //22 00 A5 00 30 16 2D 11 16 06 0F 00 04 0B 47 
  }


  function bool ValidPieceMove(int sx,int sy,int tx,int ty,bool noFeedback) {
    local Move Move;
    Move.Source.X = sx;                                                         //0000 : 0F 36 00 B8 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 00 D0 17 2D 11 
    Move.Source.Y = sy;                                                         //0015 : 0F 36 68 BA 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 00 70 1B 2D 11 
    Move.Source.t = sx + (sy << 3);                                             //002A : 0F 36 38 BD 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 92 00 D0 17 2D 11 94 00 70 1B 2D 11 2C 03 16 16 
    Move.Target.X = tx;                                                         //004A : 0F 36 00 B8 2C 11 36 78 B9 2C 11 00 F8 1A 2D 11 00 E8 1B 2D 11 
    Move.Target.Y = ty;                                                         //005F : 0F 36 68 BA 2C 11 36 78 B9 2C 11 00 F8 1A 2D 11 00 60 1C 2D 11 
    Move.Target.t = tx + (ty << 3);                                             //0074 : 0F 36 38 BD 2C 11 36 78 B9 2C 11 00 F8 1A 2D 11 92 00 E8 1B 2D 11 94 00 60 1C 2D 11 2C 03 16 16 
    Move.White = (BoardData[Move.Source.t] & 128) == 128;                       //0094 : 14 2D 36 18 BF 2C 11 00 F8 1A 2D 11 9A 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 01 F8 73 83 0F 2C 80 16 2C 80 16 
    Move.sourceType = BoardData[Move.Source.t] & 63;                            //00BF : 0F 36 48 BC 2C 11 00 F8 1A 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 01 F8 73 83 0F 2C 3F 16 
    switch (Move.sourceType) {                                                  //00E5 : 05 04 36 48 BC 2C 11 00 F8 1A 2D 11 
      case 1 :                                                                  //00F1 : 0A 15 01 26 
        if (!IsValidPawnMove(Move)) {                                           //00F5 : 07 12 01 81 1B C6 6E 00 00 00 F8 1A 2D 11 16 16 
          if (!noFeedback) {                                                    //0105 : 07 10 01 81 2D 00 D8 1C 2D 11 16 
          }
          return False;                                                         //0110 : 04 28 
        }
        break;                                                                  //0112 : 06 D1 01 
      case 2 :                                                                  //0115 : 0A 3A 01 2C 02 
        if (!IsValidKnightMove(Move)) {                                         //011A : 07 37 01 81 1B C5 6E 00 00 00 F8 1A 2D 11 16 16 
          if (!noFeedback) {                                                    //012A : 07 35 01 81 2D 00 D8 1C 2D 11 16 
          }
          return False;                                                         //0135 : 04 28 
        }
        break;                                                                  //0137 : 06 D1 01 
      case 4 :                                                                  //013A : 0A 5F 01 2C 04 
        if (!IsValidBishopMove(Move)) {                                         //013F : 07 5C 01 81 1B C4 6E 00 00 00 F8 1A 2D 11 16 16 
          if (!noFeedback) {                                                    //014F : 07 5A 01 81 2D 00 D8 1C 2D 11 16 
          }
          return False;                                                         //015A : 04 28 
        }
        break;                                                                  //015C : 06 D1 01 
      case 8 :                                                                  //015F : 0A 84 01 2C 08 
        if (!IsValidRookMove(Move)) {                                           //0164 : 07 81 01 81 1B C3 6E 00 00 00 F8 1A 2D 11 16 16 
          if (!noFeedback) {                                                    //0174 : 07 7F 01 81 2D 00 D8 1C 2D 11 16 
          }
          return False;                                                         //017F : 04 28 
        }
        break;                                                                  //0181 : 06 D1 01 
      case 16 :                                                                 //0184 : 0A A9 01 2C 10 
        if (!IsValidQueenMove(Move)) {                                          //0189 : 07 A6 01 81 1B C2 6E 00 00 00 F8 1A 2D 11 16 16 
          if (!noFeedback) {                                                    //0199 : 07 A4 01 81 2D 00 D8 1C 2D 11 16 
          }
          return False;                                                         //01A4 : 04 28 
        }
        break;                                                                  //01A6 : 06 D1 01 
      case 32 :                                                                 //01A9 : 0A CE 01 2C 20 
        if (!IsValidKingMove(Move)) {                                           //01AE : 07 CB 01 81 1B BF 6E 00 00 00 F8 1A 2D 11 16 16 
          if (!noFeedback) {                                                    //01BE : 07 C9 01 81 2D 00 D8 1C 2D 11 16 
          }
          return False;                                                         //01C9 : 04 28 
        }
        break;                                                                  //01CB : 06 D1 01 
      default:                                                                  //01CE : 0A FF FF 
    }
    return True;                                                                //01D1 : 04 27 
    //0F 36 00 B8 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 00 D0 17 2D 11 0F 36 68 BA 2C 11 36 00 B9 2C 11 
    //00 F8 1A 2D 11 00 70 1B 2D 11 0F 36 38 BD 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 92 00 D0 17 2D 11 
    //94 00 70 1B 2D 11 2C 03 16 16 0F 36 00 B8 2C 11 36 78 B9 2C 11 00 F8 1A 2D 11 00 E8 1B 2D 11 0F 
    //36 68 BA 2C 11 36 78 B9 2C 11 00 F8 1A 2D 11 00 60 1C 2D 11 0F 36 38 BD 2C 11 36 78 B9 2C 11 00 
    //F8 1A 2D 11 92 00 E8 1B 2D 11 94 00 60 1C 2D 11 2C 03 16 16 14 2D 36 18 BF 2C 11 00 F8 1A 2D 11 
    //9A 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 01 F8 73 83 0F 2C 80 16 2C 80 16 0F 
    //36 48 BC 2C 11 00 F8 1A 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 F8 1A 2D 11 01 F8 73 
    //83 0F 2C 3F 16 05 04 36 48 BC 2C 11 00 F8 1A 2D 11 0A 15 01 26 07 12 01 81 1B C6 6E 00 00 00 F8 
    //1A 2D 11 16 16 07 10 01 81 2D 00 D8 1C 2D 11 16 04 28 06 D1 01 0A 3A 01 2C 02 07 37 01 81 1B C5 
    //6E 00 00 00 F8 1A 2D 11 16 16 07 35 01 81 2D 00 D8 1C 2D 11 16 04 28 06 D1 01 0A 5F 01 2C 04 07 
    //5C 01 81 1B C4 6E 00 00 00 F8 1A 2D 11 16 16 07 5A 01 81 2D 00 D8 1C 2D 11 16 04 28 06 D1 01 0A 
    //84 01 2C 08 07 81 01 81 1B C3 6E 00 00 00 F8 1A 2D 11 16 16 07 7F 01 81 2D 00 D8 1C 2D 11 16 04 
    //28 06 D1 01 0A A9 01 2C 10 07 A6 01 81 1B C2 6E 00 00 00 F8 1A 2D 11 16 16 07 A4 01 81 2D 00 D8 
    //1C 2D 11 16 04 28 06 D1 01 0A CE 01 2C 20 07 CB 01 81 1B BF 6E 00 00 00 F8 1A 2D 11 16 16 07 C9 
    //01 81 2D 00 D8 1C 2D 11 16 04 28 06 D1 01 0A FF FF 04 27 04 0B 47 
  }


  function bool ValidMove(int sx,int sy,int tx,int ty,optional bool noFeedback) {
    local bool White;
    local int MoveCount;
    if (!ValidPieceMove(sx,sy,tx,ty,noFeedback)) {                              //0000 : 07 27 00 81 1B 9F 6E 00 00 00 78 1E 2D 11 00 88 20 2D 11 00 00 21 2D 11 00 78 21 2D 11 2D 00 F0 21 2D 11 16 16 
      return False;                                                             //0025 : 04 28 
    }
    White = (BoardData[sx + (sy << 3)] & 128) == 128;                           //0027 : 14 2D 00 68 22 2D 11 9A 9C 39 3A 10 92 00 78 1E 2D 11 94 00 88 20 2D 11 2C 03 16 16 01 F8 73 83 0F 2C 80 16 2C 80 16 
    if (!noFeedback) {                                                          //004E : 07 59 00 81 2D 00 F0 21 2D 11 16 
    }
    MoveCount = MakeMove(sx,sy,tx,ty);                                          //0059 : 0F 00 E0 22 2D 11 1B 88 6E 00 00 00 78 1E 2D 11 00 88 20 2D 11 00 00 21 2D 11 00 78 21 2D 11 16 
    if (White) {                                                                //0079 : 07 BF 00 2D 00 68 22 2D 11 
      if (!noFeedback) {                                                        //0082 : 07 8D 00 81 2D 00 F0 21 2D 11 16 
      }
      if (IsWhiteInCheck()) {                                                   //008D : 07 B1 00 1B 9D 6E 00 00 16 
        RevertMove(MoveCount);                                                  //0096 : 1B 91 6E 00 00 00 E0 22 2D 11 16 
        if (!noFeedback) {                                                      //00A1 : 07 AC 00 81 2D 00 F0 21 2D 11 16 
        }
        return False;                                                           //00AC : 04 28 
      } else {                                                                  //00AE : 06 BC 00 
        if (!noFeedback) {                                                      //00B1 : 07 BC 00 81 2D 00 F0 21 2D 11 16 
        }
      }
    } else {                                                                    //00BC : 06 F9 00 
      if (!noFeedback) {                                                        //00BF : 07 CA 00 81 2D 00 F0 21 2D 11 16 
      }
      if (IsBlackInCheck()) {                                                   //00CA : 07 EE 00 1B 9E 6E 00 00 16 
        if (!noFeedback) {                                                      //00D3 : 07 DE 00 81 2D 00 F0 21 2D 11 16 
        }
        RevertMove(MoveCount);                                                  //00DE : 1B 91 6E 00 00 00 E0 22 2D 11 16 
        return False;                                                           //00E9 : 04 28 
      } else {                                                                  //00EB : 06 F9 00 
        if (!noFeedback) {                                                      //00EE : 07 F9 00 81 2D 00 F0 21 2D 11 16 
        }
      }
    }
    RevertMove(MoveCount);                                                      //00F9 : 1B 91 6E 00 00 00 E0 22 2D 11 16 
    return True;                                                                //0104 : 04 27 
    //07 27 00 81 1B 9F 6E 00 00 00 78 1E 2D 11 00 88 20 2D 11 00 00 21 2D 11 00 78 21 2D 11 2D 00 F0 
    //21 2D 11 16 16 04 28 14 2D 00 68 22 2D 11 9A 9C 39 3A 10 92 00 78 1E 2D 11 94 00 88 20 2D 11 2C 
    //03 16 16 01 F8 73 83 0F 2C 80 16 2C 80 16 07 59 00 81 2D 00 F0 21 2D 11 16 0F 00 E0 22 2D 11 1B 
    //88 6E 00 00 00 78 1E 2D 11 00 88 20 2D 11 00 00 21 2D 11 00 78 21 2D 11 16 07 BF 00 2D 00 68 22 
    //2D 11 07 8D 00 81 2D 00 F0 21 2D 11 16 07 B1 00 1B 9D 6E 00 00 16 1B 91 6E 00 00 00 E0 22 2D 11 
    //16 07 AC 00 81 2D 00 F0 21 2D 11 16 04 28 06 BC 00 07 BC 00 81 2D 00 F0 21 2D 11 16 06 F9 00 07 
    //CA 00 81 2D 00 F0 21 2D 11 16 07 EE 00 1B 9E 6E 00 00 16 07 DE 00 81 2D 00 F0 21 2D 11 16 1B 91 
    //6E 00 00 00 E0 22 2D 11 16 04 28 06 F9 00 07 F9 00 81 2D 00 F0 21 2D 11 16 1B 91 6E 00 00 00 E0 
    //22 2D 11 16 04 27 04 0B 47 
  }


  function bool IsBlackInCheck() {
    local int KingPos;
    KingPos = GetPiecePosition(32 | 0);                                         //0000 : 0F 00 68 25 2D 11 1B 9A 6E 00 00 9E 2C 20 25 16 16 
    return AttackedByWhite(KingPos % 8,KingPos / 8);                            //0011 : 04 1B 7D 6E 00 00 39 44 AD 39 3F 00 68 25 2D 11 39 3F 2C 08 16 91 00 68 25 2D 11 2C 08 16 16 
    //0F 00 68 25 2D 11 1B 9A 6E 00 00 9E 2C 20 25 16 16 04 1B 7D 6E 00 00 39 44 AD 39 3F 00 68 25 2D 
    //11 39 3F 2C 08 16 91 00 68 25 2D 11 2C 08 16 16 04 0B 47 
  }


  function bool IsWhiteInCheck() {
    local int KingPos;
    KingPos = GetPiecePosition(32 | 128);                                       //0000 : 0F 00 78 27 2D 11 1B 9A 6E 00 00 9E 2C 20 2C 80 16 16 
    return AttackedByBlack(KingPos % 8,KingPos / 8);                            //0012 : 04 1B 7B 6E 00 00 39 44 AD 39 3F 00 78 27 2D 11 39 3F 2C 08 16 91 00 78 27 2D 11 2C 08 16 16 
    //0F 00 78 27 2D 11 1B 9A 6E 00 00 9E 2C 20 2C 80 16 16 04 1B 7B 6E 00 00 39 44 AD 39 3F 00 78 27 
    //2D 11 39 3F 2C 08 16 91 00 78 27 2D 11 2C 08 16 16 04 0B 47 
  }


  function FinishMove(ExecuteMove aMove) {
    local int moveColor;
    moveColor = aMove.SourceValue & 128;                                        //0000 : 0F 00 E8 29 2D 11 9C 36 10 67 83 0F 00 A0 28 2D 11 2C 80 16 
    if (!IsColor(aMove.Target,moveColor)) {                                     //0014 : 07 4B 00 81 1B 78 6E 00 00 36 20 66 83 0F 00 A0 28 2D 11 00 E8 29 2D 11 16 16 
      BoardData[aMove.Target] = aMove.SourceValue;                              //002E : 0F 10 36 20 66 83 0F 00 A0 28 2D 11 01 F8 73 83 0F 39 3D 36 10 67 83 0F 00 A0 28 2D 11 
    }
    OnUpdateBoardSquare(aMove.Target % 8,aMove.Target / 8);                     //004B : 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 36 20 66 83 0F 00 A0 28 2D 11 39 3F 2C 08 16 91 36 20 66 83 0F 00 A0 28 2D 11 2C 08 16 16 
    //0F 00 E8 29 2D 11 9C 36 10 67 83 0F 00 A0 28 2D 11 2C 80 16 07 4B 00 81 1B 78 6E 00 00 36 20 66 
    //83 0F 00 A0 28 2D 11 00 E8 29 2D 11 16 16 0F 10 36 20 66 83 0F 00 A0 28 2D 11 01 F8 73 83 0F 39 
    //3D 36 10 67 83 0F 00 A0 28 2D 11 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 36 20 66 83 0F 00 A0 
    //28 2D 11 39 3F 2C 08 16 91 36 20 66 83 0F 00 A0 28 2D 11 2C 08 16 16 04 0B 47 
  }


  function RemoveSquare(int Source) {
    BoardData[Source] = 0;                                                      //0000 : 0F 10 00 10 2B 2D 11 01 F8 73 83 0F 24 00 
    OnUpdateBoardSquare(Source % 8,Source / 8);                                 //000E : 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 00 10 2B 2D 11 39 3F 2C 08 16 91 00 10 2B 2D 11 2C 08 16 16 
    //0F 10 00 10 2B 2D 11 01 F8 73 83 0F 24 00 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 00 10 2B 2D 
    //11 39 3F 2C 08 16 91 00 10 2B 2D 11 2C 08 16 16 04 0B 47 
  }


  private function SetMove(int sx,int sy,int tx,int ty,optional bool update) {
    if (update) {                                                               //0000 : 07 34 00 2D 00 F8 2D 2D 11 
      OnMove(sx,sy,tx,ty,-1,-1);                                                //0009 : 43 80 76 83 0F 40 04 00 00 00 A8 2C 2D 11 00 70 2E 2D 11 00 E8 2E 2D 11 00 60 2F 2D 11 1D FF FF FF FF 1D FF FF FF FF 16 
    } else {                                                                    //0031 : 06 7A 00 
      BoardData[tx + (ty << 3)] = BoardData[sx + (sy << 3)];                    //0034 : 0F 10 92 00 E8 2E 2D 11 94 00 60 2F 2D 11 2C 03 16 16 01 F8 73 83 0F 10 92 00 A8 2C 2D 11 94 00 70 2E 2D 11 2C 03 16 16 01 F8 73 83 0F 
      BoardData[sx + (sy << 3)] = 0;                                            //0061 : 0F 10 92 00 A8 2C 2D 11 94 00 70 2E 2D 11 2C 03 16 16 01 F8 73 83 0F 24 00 
    }
    //07 34 00 2D 00 F8 2D 2D 11 43 80 76 83 0F 40 04 00 00 00 A8 2C 2D 11 00 70 2E 2D 11 00 E8 2E 2D 
    //11 00 60 2F 2D 11 1D FF FF FF FF 1D FF FF FF FF 16 06 7A 00 0F 10 92 00 E8 2E 2D 11 94 00 60 2F 
    //2D 11 2C 03 16 16 01 F8 73 83 0F 10 92 00 A8 2C 2D 11 94 00 70 2E 2D 11 2C 03 16 16 01 F8 73 83 
    //0F 0F 10 92 00 A8 2C 2D 11 94 00 70 2E 2D 11 2C 03 16 16 01 F8 73 83 0F 24 00 04 0B 47 
  }


  function int MakeMove(int sx,int sy,int tx,int ty,optional bool update) {
    local int sourceType;
    local int sourceColor;
    local int MoveCount;
    local int Source;
    local int Target;
    Source = sx + (sy << 3);                                                    //0000 : 0F 00 D0 35 2D 11 92 00 88 30 2D 11 94 00 48 36 2D 11 2C 03 16 16 
    Target = tx + (ty << 3);                                                    //0016 : 0F 00 C0 36 2D 11 92 00 38 37 2D 11 94 00 B0 37 2D 11 2C 03 16 16 
    MoveCount = 0;                                                              //002C : 0F 00 28 38 2D 11 25 
    sourceType = GetPieceType(sx,sy);                                           //0033 : 0F 00 A0 38 2D 11 1B 80 6E 00 00 00 88 30 2D 11 00 48 36 2D 11 16 
    sourceColor = GetPieceColor(sx,sy);                                         //0049 : 0F 00 18 39 2D 11 1B 86 6E 00 00 00 88 30 2D 11 00 48 36 2D 11 16 
    PushHistory(sx,sy,tx,ty);                                                   //005F : 1B 84 6E 00 00 00 88 30 2D 11 00 48 36 2D 11 00 38 37 2D 11 00 B0 37 2D 11 16 
    SetMove(sx,sy,tx,ty,update);                                                //0079 : 1B 7F 6E 00 00 00 88 30 2D 11 00 48 36 2D 11 00 38 37 2D 11 00 B0 37 2D 11 2D 00 90 39 2D 11 16 
    MoveCount++;                                                                //0099 : A5 00 28 38 2D 11 16 
    switch (sourceType) {                                                       //00A0 : 05 04 00 A0 38 2D 11 
      case 1 :                                                                  //00A7 : 0A 50 01 26 
        if (EnPassantTarget == Target) {                                        //00AB : 07 F3 00 9A 01 E0 DF 2C 11 00 C0 36 2D 11 16 
          BoardData[LastPawnTarget] = 0;                                        //00BA : 0F 10 01 08 3A 2D 11 01 F8 73 83 0F 24 00 
          if (update) {                                                         //00C8 : 07 F3 00 2D 00 90 39 2D 11 
            OnUpdateBoardSquare(LastPawnTarget % 8,LastPawnTarget / 8);         //00D1 : 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 01 08 3A 2D 11 39 3F 2C 08 16 91 01 08 3A 2D 11 2C 08 16 16 
          }
        }
        LastPawnTarget = Target;                                                //00F3 : 0F 01 08 3A 2D 11 00 C0 36 2D 11 
        if (Abs(ty - sy) == 2) {                                                //00FE : 07 42 01 B4 BA 39 3F 93 00 B0 37 2D 11 00 48 36 2D 11 16 16 39 3F 2C 02 16 
          EnPassantTarget = sx + (sy + (ty - sy) / 2 << 3);                     //0117 : 0F 01 E0 DF 2C 11 92 00 88 30 2D 11 94 92 00 48 36 2D 11 91 93 00 B0 37 2D 11 00 48 36 2D 11 16 2C 02 16 16 2C 03 16 16 
        } else {                                                                //013F : 06 4D 01 
          EnPassantTarget = -1;                                                 //0142 : 0F 01 E0 DF 2C 11 1D FF FF FF FF 
        }
        break;                                                                  //014D : 06 56 03 
      case 32 :                                                                 //0150 : 0A 93 02 2C 20 
        if (sourceColor == 128) {                                               //0155 : 07 FE 01 9A 00 18 39 2D 11 2C 80 16 
          Status = Status | 3;                                                  //0161 : 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 03 16 
          if (Source == 60 && Target == 62) {                                   //0174 : 07 BA 01 82 9A 00 D0 35 2D 11 2C 3C 16 18 0A 00 9A 00 C0 36 2D 11 2C 3E 16 16 
            MoveCount++;                                                        //018E : A5 00 28 38 2D 11 16 
            PushHistory(7,7,5,7);                                               //0195 : 1B 84 6E 00 00 2C 07 2C 07 2C 05 2C 07 16 
            SetMove(7,7,5,7,update);                                            //01A3 : 1B 7F 6E 00 00 2C 07 2C 07 2C 05 2C 07 2D 00 90 39 2D 11 16 
          } else {                                                              //01B7 : 06 FB 01 
            if (Source == 60 && Target == 58) {                                 //01BA : 07 FB 01 82 9A 00 D0 35 2D 11 2C 3C 16 18 0A 00 9A 00 C0 36 2D 11 2C 3A 16 16 
              MoveCount++;                                                      //01D4 : A5 00 28 38 2D 11 16 
              PushHistory(0,7,3,7);                                             //01DB : 1B 84 6E 00 00 25 2C 07 2C 03 2C 07 16 
              SetMove(0,7,3,7,update);                                          //01E8 : 1B 7F 6E 00 00 25 2C 07 2C 03 2C 07 2D 00 90 39 2D 11 16 
            }
          }
        } else {                                                                //01FB : 06 90 02 
          Status = Status | 12;                                                 //01FE : 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 0C 16 
          if (Source == 4 && Target == 6) {                                     //0211 : 07 53 02 82 9A 00 D0 35 2D 11 2C 04 16 18 0A 00 9A 00 C0 36 2D 11 2C 06 16 16 
            MoveCount++;                                                        //022B : A5 00 28 38 2D 11 16 
            PushHistory(7,0,5,0);                                               //0232 : 1B 84 6E 00 00 2C 07 25 2C 05 25 16 
            SetMove(7,0,5,0,update);                                            //023E : 1B 7F 6E 00 00 2C 07 25 2C 05 25 2D 00 90 39 2D 11 16 
          } else {                                                              //0250 : 06 90 02 
            if (Source == 4 && Target == 2) {                                   //0253 : 07 90 02 82 9A 00 D0 35 2D 11 2C 04 16 18 0A 00 9A 00 C0 36 2D 11 2C 02 16 16 
              MoveCount++;                                                      //026D : A5 00 28 38 2D 11 16 
              PushHistory(0,0,3,0);                                             //0274 : 1B 84 6E 00 00 25 25 2C 03 25 16 
              SetMove(0,0,3,0,update);                                          //027F : 1B 7F 6E 00 00 25 25 2C 03 25 2D 00 90 39 2D 11 16 
            }
          }
        }
        break;                                                                  //0290 : 06 56 03 
      case 8 :                                                                  //0293 : 0A 53 03 2C 08 
        if (sx == 0 && sy == 7) {                                               //0298 : 07 C7 02 82 9A 00 88 30 2D 11 25 16 18 0A 00 9A 00 48 36 2D 11 2C 07 16 16 
          Status = Status | 2;                                                  //02B1 : 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 02 16 
        } else {                                                                //02C4 : 06 50 03 
          if (sx == 7 && sy == 7) {                                             //02C7 : 07 F6 02 82 9A 00 88 30 2D 11 2C 07 16 18 0A 00 9A 00 48 36 2D 11 2C 07 16 16 
            Status = Status | 1;                                                //02E1 : 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 26 16 
          } else {                                                              //02F3 : 06 50 03 
            if (sx == 0 && sy == 0) {                                           //02F6 : 07 24 03 82 9A 00 88 30 2D 11 25 16 18 09 00 9A 00 48 36 2D 11 25 16 16 
              Status = Status | 8;                                              //030E : 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 08 16 
            } else {                                                            //0321 : 06 50 03 
              if (sx == 7 && sy == 0) {                                         //0324 : 07 50 03 82 9A 00 88 30 2D 11 2C 07 16 18 09 00 9A 00 48 36 2D 11 25 16 16 
                Status = Status | 4;                                            //033D : 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 04 16 
              }
            }
          }
        }
        break;                                                                  //0350 : 06 56 03 
      default:                                                                  //0353 : 0A FF FF 
    }
    return MoveCount;                                                           //0356 : 04 00 28 38 2D 11 
    //0F 00 D0 35 2D 11 92 00 88 30 2D 11 94 00 48 36 2D 11 2C 03 16 16 0F 00 C0 36 2D 11 92 00 38 37 
    //2D 11 94 00 B0 37 2D 11 2C 03 16 16 0F 00 28 38 2D 11 25 0F 00 A0 38 2D 11 1B 80 6E 00 00 00 88 
    //30 2D 11 00 48 36 2D 11 16 0F 00 18 39 2D 11 1B 86 6E 00 00 00 88 30 2D 11 00 48 36 2D 11 16 1B 
    //84 6E 00 00 00 88 30 2D 11 00 48 36 2D 11 00 38 37 2D 11 00 B0 37 2D 11 16 1B 7F 6E 00 00 00 88 
    //30 2D 11 00 48 36 2D 11 00 38 37 2D 11 00 B0 37 2D 11 2D 00 90 39 2D 11 16 A5 00 28 38 2D 11 16 
    //05 04 00 A0 38 2D 11 0A 50 01 26 07 F3 00 9A 01 E0 DF 2C 11 00 C0 36 2D 11 16 0F 10 01 08 3A 2D 
    //11 01 F8 73 83 0F 24 00 07 F3 00 2D 00 90 39 2D 11 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 01 
    //08 3A 2D 11 39 3F 2C 08 16 91 01 08 3A 2D 11 2C 08 16 16 0F 01 08 3A 2D 11 00 C0 36 2D 11 07 42 
    //01 B4 BA 39 3F 93 00 B0 37 2D 11 00 48 36 2D 11 16 16 39 3F 2C 02 16 0F 01 E0 DF 2C 11 92 00 88 
    //30 2D 11 94 92 00 48 36 2D 11 91 93 00 B0 37 2D 11 00 48 36 2D 11 16 2C 02 16 16 2C 03 16 16 06 
    //4D 01 0F 01 E0 DF 2C 11 1D FF FF FF FF 06 56 03 0A 93 02 2C 20 07 FE 01 9A 00 18 39 2D 11 2C 80 
    //16 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 03 16 07 BA 01 82 9A 00 D0 35 2D 11 2C 3C 
    //16 18 0A 00 9A 00 C0 36 2D 11 2C 3E 16 16 A5 00 28 38 2D 11 16 1B 84 6E 00 00 2C 07 2C 07 2C 05 
    //2C 07 16 1B 7F 6E 00 00 2C 07 2C 07 2C 05 2C 07 2D 00 90 39 2D 11 16 06 FB 01 07 FB 01 82 9A 00 
    //D0 35 2D 11 2C 3C 16 18 0A 00 9A 00 C0 36 2D 11 2C 3A 16 16 A5 00 28 38 2D 11 16 1B 84 6E 00 00 
    //25 2C 07 2C 03 2C 07 16 1B 7F 6E 00 00 25 2C 07 2C 03 2C 07 2D 00 90 39 2D 11 16 06 90 02 0F 01 
    //C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 0C 16 07 53 02 82 9A 00 D0 35 2D 11 2C 04 16 18 0A 
    //00 9A 00 C0 36 2D 11 2C 06 16 16 A5 00 28 38 2D 11 16 1B 84 6E 00 00 2C 07 25 2C 05 25 16 1B 7F 
    //6E 00 00 2C 07 25 2C 05 25 2D 00 90 39 2D 11 16 06 90 02 07 90 02 82 9A 00 D0 35 2D 11 2C 04 16 
    //18 0A 00 9A 00 C0 36 2D 11 2C 02 16 16 A5 00 28 38 2D 11 16 1B 84 6E 00 00 25 25 2C 03 25 16 1B 
    //7F 6E 00 00 25 25 2C 03 25 2D 00 90 39 2D 11 16 06 56 03 0A 53 03 2C 08 07 C7 02 82 9A 00 88 30 
    //2D 11 25 16 18 0A 00 9A 00 48 36 2D 11 2C 07 16 16 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 
    //11 2C 02 16 06 50 03 07 F6 02 82 9A 00 88 30 2D 11 2C 07 16 18 0A 00 9A 00 48 36 2D 11 2C 07 16 
    //16 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 26 16 06 50 03 07 24 03 82 9A 00 88 30 2D 11 
    //25 16 18 09 00 9A 00 48 36 2D 11 25 16 16 0F 01 C0 BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 08 
    //16 06 50 03 07 50 03 82 9A 00 88 30 2D 11 2C 07 16 18 09 00 9A 00 48 36 2D 11 25 16 16 0F 01 C0 
    //BC 2C 11 39 3D 9E 39 3A 01 C0 BC 2C 11 2C 04 16 06 56 03 0A FF FF 04 00 28 38 2D 11 04 0B 47 
  }


  function RevertMove(int Count) {
    local Move Move;
    while (Count > 0) {                                                         //0000 : 07 AF 00 97 00 A8 3B 2D 11 25 16 
      Move = PopHistory();                                                      //000B : 0F 00 40 3D 2D 11 1B CB 6E 00 00 16 
      Status = Move.Status;                                                     //0017 : 0F 01 C0 BC 2C 11 39 3D 36 90 BF 2C 11 00 40 3D 2D 11 
      LastPawnTarget = Move.LastPawnTarget;                                     //0029 : 0F 01 08 3A 2D 11 36 08 C0 2C 11 00 40 3D 2D 11 
      EnPassantTarget = Move.EnPassantTarget;                                   //0039 : 0F 01 E0 DF 2C 11 36 80 C0 2C 11 00 40 3D 2D 11 
      BoardData[Move.Source.t] = Move.sourceType | Move.sourceColor;            //0049 : 0F 10 36 38 BD 2C 11 36 00 B9 2C 11 00 40 3D 2D 11 01 F8 73 83 0F 39 3D 9E 36 48 BC 2C 11 00 40 3D 2D 11 36 B0 BD 2C 11 00 40 3D 2D 11 16 
      BoardData[Move.Target.t] = Move.TargetType | Move.targetColor;            //0077 : 0F 10 36 38 BD 2C 11 36 78 B9 2C 11 00 40 3D 2D 11 01 F8 73 83 0F 39 3D 9E 36 28 BE 2C 11 00 40 3D 2D 11 36 A0 BE 2C 11 00 40 3D 2D 11 16 
      Count--;                                                                  //00A5 : A6 00 A8 3B 2D 11 16 
    }
    //07 AF 00 97 00 A8 3B 2D 11 25 16 0F 00 40 3D 2D 11 1B CB 6E 00 00 16 0F 01 C0 BC 2C 11 39 3D 36 
    //90 BF 2C 11 00 40 3D 2D 11 0F 01 08 3A 2D 11 36 08 C0 2C 11 00 40 3D 2D 11 0F 01 E0 DF 2C 11 36 
    //80 C0 2C 11 00 40 3D 2D 11 0F 10 36 38 BD 2C 11 36 00 B9 2C 11 00 40 3D 2D 11 01 F8 73 83 0F 39 
    //3D 9E 36 48 BC 2C 11 00 40 3D 2D 11 36 B0 BD 2C 11 00 40 3D 2D 11 16 0F 10 36 38 BD 2C 11 36 78 
    //B9 2C 11 00 40 3D 2D 11 01 F8 73 83 0F 39 3D 9E 36 28 BE 2C 11 00 40 3D 2D 11 36 A0 BE 2C 11 00 
    //40 3D 2D 11 16 A6 00 A8 3B 2D 11 16 06 00 00 04 0B 47 
  }


  function MakePromotion(int X,int Y,int aPiece,bool aUpdate) {
    BoardData[X + (Y << 3)] = aPiece;                                           //0000 : 0F 10 92 00 68 3E 2D 11 94 00 E0 3E 2D 11 2C 03 16 16 01 F8 73 83 0F 39 3D 00 58 3F 2D 11 
    if (aUpdate) {                                                              //001E : 07 3B 00 2D 00 D0 3F 2D 11 
      OnUpdateBoardSquare(X,Y);                                                 //0027 : 43 90 75 83 0F 4B 04 00 00 00 68 3E 2D 11 00 E0 3E 2D 11 16 
    }
    //0F 10 92 00 68 3E 2D 11 94 00 E0 3E 2D 11 2C 03 16 16 01 F8 73 83 0F 39 3D 00 58 3F 2D 11 07 3B 
    //00 2D 00 D0 3F 2D 11 43 90 75 83 0F 4B 04 00 00 00 68 3E 2D 11 00 E0 3E 2D 11 16 04 0B 47 
  }


  function int GetPiecePosition(int Piece) {
    local int X;
    local int Y;
    X = 0;                                                                      //0000 : 0F 00 38 42 2D 11 25 
    while (X < 8) {                                                             //0007 : 07 6D 00 96 00 38 42 2D 11 2C 08 16 
      Y = 0;                                                                    //0013 : 0F 00 B0 42 2D 11 25 
      while (Y < 8) {                                                           //001A : 07 63 00 96 00 B0 42 2D 11 2C 08 16 
        if (BoardData[X + (Y << 3)] == Piece) {                                 //0026 : 07 59 00 9A 39 3A 10 92 00 38 42 2D 11 94 00 B0 42 2D 11 2C 03 16 16 01 F8 73 83 0F 00 F8 40 2D 11 16 
          return X + (Y << 3);                                                  //0048 : 04 92 00 38 42 2D 11 94 00 B0 42 2D 11 2C 03 16 16 
        }
        Y++;                                                                    //0059 : A5 00 B0 42 2D 11 16 
      }
      X++;                                                                      //0063 : A5 00 38 42 2D 11 16 
    }
    //0F 00 38 42 2D 11 25 07 6D 00 96 00 38 42 2D 11 2C 08 16 0F 00 B0 42 2D 11 25 07 63 00 96 00 B0 
    //42 2D 11 2C 08 16 07 59 00 9A 39 3A 10 92 00 38 42 2D 11 94 00 B0 42 2D 11 2C 03 16 16 01 F8 73 
    //83 0F 00 F8 40 2D 11 16 04 92 00 38 42 2D 11 94 00 B0 42 2D 11 2C 03 16 16 A5 00 B0 42 2D 11 16 
    //06 1A 00 A5 00 38 42 2D 11 16 06 07 00 04 0B 47 
  }


  function bool IsOppositeColor(Move Move) {
    if (Move.White) {                                                           //0000 : 07 30 00 2D 36 18 BF 2C 11 00 50 44 2D 11 
      return (BoardData[Move.Target.t] & 128) == 0;                             //000E : 04 9A 9C 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 50 44 2D 11 01 F8 73 83 0F 2C 80 16 25 16 
    } else {                                                                    //002D : 06 50 00 
      return (BoardData[Move.Target.t] & 128) == 128;                           //0030 : 04 9A 9C 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 50 44 2D 11 01 F8 73 83 0F 2C 80 16 2C 80 16 
    }
    //07 30 00 2D 36 18 BF 2C 11 00 50 44 2D 11 04 9A 9C 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 50 
    //44 2D 11 01 F8 73 83 0F 2C 80 16 25 16 06 50 00 04 9A 9C 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 
    //00 50 44 2D 11 01 F8 73 83 0F 2C 80 16 2C 80 16 04 0B 47 
  }


  function bool IsColor(int pos,int Color) {
    local bool occupied;
    occupied = !IsEmpty(pos);                                                   //0000 : 14 2D 00 88 47 2D 11 81 1B 7A 6E 00 00 00 90 46 2D 11 16 16 
    return occupied
      && (BoardData[pos] & 128) == Color;                   //0014 : 04 82 2D 00 88 47 2D 11 18 19 00 9A 9C 39 3A 10 00 90 46 2D 11 01 F8 73 83 0F 2C 80 16 00 00 48 2D 11 16 16 
    //14 2D 00 88 47 2D 11 81 1B 7A 6E 00 00 00 90 46 2D 11 16 16 04 82 2D 00 88 47 2D 11 18 19 00 9A 
    //9C 39 3A 10 00 90 46 2D 11 01 F8 73 83 0F 2C 80 16 00 00 48 2D 11 16 16 04 0B 47 
  }


  function bool IsEmpty(int pos) {
    return (BoardData[pos] & 63) == 0;                                          //0000 : 04 9A 9C 39 3A 10 00 48 4A 2D 11 01 F8 73 83 0F 2C 3F 16 25 16 
    //04 9A 9C 39 3A 10 00 48 4A 2D 11 01 F8 73 83 0F 2C 3F 16 25 16 04 0B 47 
  }


  function int GetPieceColor(int X,int Y) {
    return BoardData[X + (Y << 3)] & 128;                                       //0000 : 04 9C 39 3A 10 92 00 38 4C 2D 11 94 00 08 4D 2D 11 2C 03 16 16 01 F8 73 83 0F 2C 80 16 
    //04 9C 39 3A 10 92 00 38 4C 2D 11 94 00 08 4D 2D 11 2C 03 16 16 01 F8 73 83 0F 2C 80 16 04 0B 47 
    //
  }


  function int GetPieceType(int X,int Y) {
    return BoardData[X + (Y << 3)] & 63;                                        //0000 : 04 9C 39 3A 10 92 00 A8 4E 2D 11 94 00 78 4F 2D 11 2C 03 16 16 01 F8 73 83 0F 2C 3F 16 
    //04 9C 39 3A 10 92 00 A8 4E 2D 11 94 00 78 4F 2D 11 2C 03 16 16 01 F8 73 83 0F 2C 3F 16 04 0B 47 
    //
  }


  function Start() {
    Super.Start();                                                              //0000 : 1C 50 59 83 0F 16 
    if (Config.GetConfig(Class'MGame_ChessConfig'.0) == Class'MGame_ChessConfig'.0) {//0006 : 07 38 00 9A 19 01 A0 1D 31 0F 10 00 04 1B 8F 6E 00 00 12 20 A0 51 2D 11 01 00 04 25 16 12 20 A0 51 2D 11 01 00 04 25 16 
      SetPlayerTurnID(0);                                                       //002E : 1B 7E 6E 00 00 25 16 
    } else {                                                                    //0035 : 06 3F 00 
      SetPlayerTurnID(1);                                                       //0038 : 1B 7E 6E 00 00 26 16 
    }
    //1C 50 59 83 0F 16 07 38 00 9A 19 01 A0 1D 31 0F 10 00 04 1B 8F 6E 00 00 12 20 A0 51 2D 11 01 00 
    //04 25 16 12 20 A0 51 2D 11 01 00 04 25 16 1B 7E 6E 00 00 25 16 06 3F 00 1B 7E 6E 00 00 26 16 04 
    //0B 47 
  }


  function SwitchTurn() {
    WhiteIsMoving = !WhiteIsMoving;                                             //0000 : 14 2D 01 A8 16 2D 11 81 2D 01 A8 16 2D 11 16 
    SetPlayerTurnID((GetPlayerTurnID() + 1) % 2);                               //000F : 1B 7E 6E 00 00 39 44 AD 39 3F 92 1B 8B 6E 00 00 16 26 16 39 3F 2C 02 16 16 
    GenerateMoves();                                                            //0028 : 1B 87 6E 00 00 16 
    if (!MovesPossible) {                                                       //002E : 07 76 00 81 2D 01 B8 15 2D 11 16 
      if (WhiteIsMoving) {                                                      //0039 : 07 56 00 2D 01 A8 16 2D 11 
        if (IsWhiteInCheck()) {                                                 //0042 : 07 53 00 1B 9D 6E 00 00 16 
          CheckMate = True;                                                     //004B : 14 2D 01 80 58 2D 11 27 
        }
      } else {                                                                  //0053 : 06 67 00 
        if (IsBlackInCheck()) {                                                 //0056 : 07 67 00 1B 9E 6E 00 00 16 
          CheckMate = True;                                                     //005F : 14 2D 01 80 58 2D 11 27 
        }
      }
      StallMate = !CheckMate;                                                   //0067 : 14 2D 01 F8 58 2D 11 81 2D 01 80 58 2D 11 16 
    }
    if (CheckMate) {                                                            //0076 : 07 82 00 2D 01 80 58 2D 11 
    } else {                                                                    //007F : 06 8B 00 
      if (StallMate) {                                                          //0082 : 07 8B 00 2D 01 F8 58 2D 11 
      }
    }
    //14 2D 01 A8 16 2D 11 81 2D 01 A8 16 2D 11 16 1B 7E 6E 00 00 39 44 AD 39 3F 92 1B 8B 6E 00 00 16 
    //26 16 39 3F 2C 02 16 16 1B 87 6E 00 00 16 07 76 00 81 2D 01 B8 15 2D 11 16 07 56 00 2D 01 A8 16 
    //2D 11 07 53 00 1B 9D 6E 00 00 16 14 2D 01 80 58 2D 11 27 06 67 00 07 67 00 1B 9E 6E 00 00 16 14 
    //2D 01 80 58 2D 11 27 14 2D 01 F8 58 2D 11 81 2D 01 80 58 2D 11 16 07 82 00 2D 01 80 58 2D 11 06 
    //8B 00 07 8B 00 2D 01 F8 58 2D 11 04 0B 47 
  }


  private function ResetBoard() {
    Status = 0;                                                                 //0000 : 0F 01 C0 BC 2C 11 24 00 
    EnPassantTarget = -1;                                                       //0008 : 0F 01 E0 DF 2C 11 1D FF FF FF FF 
    WhiteIsMoving = True;                                                       //0013 : 14 2D 01 A8 16 2D 11 27 
    CheckMate = False;                                                          //001B : 14 2D 01 80 58 2D 11 28 
    StallMate = False;                                                          //0023 : 14 2D 01 F8 58 2D 11 28 
    ThinkTimeOut = False;                                                       //002B : 14 2D 01 38 29 31 0F 28 
    moveHistory.Length = 0;                                                     //0033 : 0F 37 01 A8 5A 2D 11 25 
    InitializeBoardLayout();                                                    //003B : 1B CA 6E 00 00 16 
    //0F 01 C0 BC 2C 11 24 00 0F 01 E0 DF 2C 11 1D FF FF FF FF 14 2D 01 A8 16 2D 11 27 14 2D 01 80 58 
    //2D 11 28 14 2D 01 F8 58 2D 11 28 14 2D 01 38 29 31 0F 28 0F 37 01 A8 5A 2D 11 25 1B CA 6E 00 00 
    //16 04 0B 47 
  }


  native function InitializeBoardLayout();


  function bool IsValidPromotionMove(int sx,int sy,int tx,int ty) {
    if (GetPieceColor(sx,sy) == 0) {                                            //0000 : 07 49 00 9A 1B 86 6E 00 00 00 B0 5C 2D 11 00 F8 5D 2D 11 16 25 16 
      return GetPieceType(sx,sy) == 1 && sy == 6
        && ty == 7;            //0016 : 04 82 82 9A 1B 80 6E 00 00 00 B0 5C 2D 11 00 F8 5D 2D 11 16 26 16 18 0A 00 9A 00 F8 5D 2D 11 2C 06 16 16 18 0A 00 9A 00 70 5E 2D 11 2C 07 16 16 
    } else {                                                                    //0046 : 06 77 00 
      return GetPieceType(sx,sy) == 1 && sy == 1
        && ty == 0;            //0049 : 04 82 82 9A 1B 80 6E 00 00 00 B0 5C 2D 11 00 F8 5D 2D 11 16 26 16 18 09 00 9A 00 F8 5D 2D 11 26 16 16 18 09 00 9A 00 70 5E 2D 11 25 16 16 
    }
    //07 49 00 9A 1B 86 6E 00 00 00 B0 5C 2D 11 00 F8 5D 2D 11 16 25 16 04 82 82 9A 1B 80 6E 00 00 00 
    //B0 5C 2D 11 00 F8 5D 2D 11 16 26 16 18 0A 00 9A 00 F8 5D 2D 11 2C 06 16 16 18 0A 00 9A 00 70 5E 
    //2D 11 2C 07 16 16 06 77 00 04 82 82 9A 1B 80 6E 00 00 00 B0 5C 2D 11 00 F8 5D 2D 11 16 26 16 18 
    //09 00 9A 00 F8 5D 2D 11 26 16 16 18 09 00 9A 00 70 5E 2D 11 25 16 16 04 0B 47 
  }


  function Move PopHistory() {
    local Move Move;
    if (moveHistory.Length > 0) {                                               //0000 : 07 31 00 97 37 01 A8 5A 2D 11 25 16 
      Move = moveHistory[moveHistory.Length - 1];                               //000C : 0F 00 78 61 2D 11 10 93 37 01 A8 5A 2D 11 26 16 01 A8 5A 2D 11 
      moveHistory.Length = moveHistory.Length - 1;                              //0021 : 0F 37 01 A8 5A 2D 11 93 37 01 A8 5A 2D 11 26 16 
    }
    return Move;                                                                //0031 : 04 00 78 61 2D 11 
    //07 31 00 97 37 01 A8 5A 2D 11 25 16 0F 00 78 61 2D 11 10 93 37 01 A8 5A 2D 11 26 16 01 A8 5A 2D 
    //11 0F 37 01 A8 5A 2D 11 93 37 01 A8 5A 2D 11 26 16 04 00 78 61 2D 11 04 0B 47 
  }


  function PushHistory(int sx,int sy,int tx,int ty) {
    local Move Move;
    Move.Source.X = sx;                                                         //0000 : 0F 36 00 B8 2C 11 36 00 B9 2C 11 00 98 65 2D 11 00 A0 62 2D 11 
    Move.Source.Y = sy;                                                         //0015 : 0F 36 68 BA 2C 11 36 00 B9 2C 11 00 98 65 2D 11 00 10 66 2D 11 
    Move.Source.t = sx + (sy << 3);                                             //002A : 0F 36 38 BD 2C 11 36 00 B9 2C 11 00 98 65 2D 11 92 00 A0 62 2D 11 94 00 10 66 2D 11 2C 03 16 16 
    Move.Target.X = tx;                                                         //004A : 0F 36 00 B8 2C 11 36 78 B9 2C 11 00 98 65 2D 11 00 88 66 2D 11 
    Move.Target.Y = ty;                                                         //005F : 0F 36 68 BA 2C 11 36 78 B9 2C 11 00 98 65 2D 11 00 00 67 2D 11 
    Move.Target.t = tx + (ty << 3);                                             //0074 : 0F 36 38 BD 2C 11 36 78 B9 2C 11 00 98 65 2D 11 92 00 88 66 2D 11 94 00 00 67 2D 11 2C 03 16 16 
    Move.White = (BoardData[Move.Source.t] & 128) == 128;                       //0094 : 14 2D 36 18 BF 2C 11 00 98 65 2D 11 9A 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 80 16 2C 80 16 
    Move.sourceType = BoardData[Move.Source.t] & 63;                            //00BF : 0F 36 48 BC 2C 11 00 98 65 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 3F 16 
    Move.TargetType = BoardData[Move.Target.t] & 63;                            //00E5 : 0F 36 28 BE 2C 11 00 98 65 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 3F 16 
    Move.sourceColor = BoardData[Move.Source.t] & 128;                          //010B : 0F 36 B0 BD 2C 11 00 98 65 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 80 16 
    Move.targetColor = BoardData[Move.Target.t] & 128;                          //0131 : 0F 36 A0 BE 2C 11 00 98 65 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 80 16 
    Move.Status = Status;                                                       //0157 : 0F 36 90 BF 2C 11 00 98 65 2D 11 39 3A 01 C0 BC 2C 11 
    Move.LastPawnTarget = LastPawnTarget;                                       //0169 : 0F 36 08 C0 2C 11 00 98 65 2D 11 01 08 3A 2D 11 
    Move.EnPassantTarget = EnPassantTarget;                                     //0179 : 0F 36 80 C0 2C 11 00 98 65 2D 11 01 E0 DF 2C 11 
    if (moveHistory.Length > 5) {                                               //0189 : 07 9E 01 97 37 01 A8 5A 2D 11 2C 05 16 
      moveHistory.Remove(0,1);                                                  //0196 : 41 01 A8 5A 2D 11 25 26 
    }
    moveHistory[moveHistory.Length] = Move;                                     //019E : 0F 10 37 01 A8 5A 2D 11 01 A8 5A 2D 11 00 98 65 2D 11 
    //0F 36 00 B8 2C 11 36 00 B9 2C 11 00 98 65 2D 11 00 A0 62 2D 11 0F 36 68 BA 2C 11 36 00 B9 2C 11 
    //00 98 65 2D 11 00 10 66 2D 11 0F 36 38 BD 2C 11 36 00 B9 2C 11 00 98 65 2D 11 92 00 A0 62 2D 11 
    //94 00 10 66 2D 11 2C 03 16 16 0F 36 00 B8 2C 11 36 78 B9 2C 11 00 98 65 2D 11 00 88 66 2D 11 0F 
    //36 68 BA 2C 11 36 78 B9 2C 11 00 98 65 2D 11 00 00 67 2D 11 0F 36 38 BD 2C 11 36 78 B9 2C 11 00 
    //98 65 2D 11 92 00 88 66 2D 11 94 00 00 67 2D 11 2C 03 16 16 14 2D 36 18 BF 2C 11 00 98 65 2D 11 
    //9A 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 80 16 2C 80 16 0F 
    //36 48 BC 2C 11 00 98 65 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 00 B9 2C 11 00 98 65 2D 11 01 F8 73 
    //83 0F 2C 3F 16 0F 36 28 BE 2C 11 00 98 65 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 78 B9 2C 11 00 98 
    //65 2D 11 01 F8 73 83 0F 2C 3F 16 0F 36 B0 BD 2C 11 00 98 65 2D 11 9C 39 3A 10 36 38 BD 2C 11 36 
    //00 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 80 16 0F 36 A0 BE 2C 11 00 98 65 2D 11 9C 39 3A 10 
    //36 38 BD 2C 11 36 78 B9 2C 11 00 98 65 2D 11 01 F8 73 83 0F 2C 80 16 0F 36 90 BF 2C 11 00 98 65 
    //2D 11 39 3A 01 C0 BC 2C 11 0F 36 08 C0 2C 11 00 98 65 2D 11 01 08 3A 2D 11 0F 36 80 C0 2C 11 00 
    //98 65 2D 11 01 E0 DF 2C 11 07 9E 01 97 37 01 A8 5A 2D 11 2C 05 16 41 01 A8 5A 2D 11 25 26 0F 10 
    //37 01 A8 5A 2D 11 01 A8 5A 2D 11 00 98 65 2D 11 04 0B 47 
  }


  function int GetMiniGameTime() {
    return Config.GetTime(Config.GetConfig(Class'MGame_ChessConfig'.2));        //0000 : 04 19 01 A0 1D 31 0F 20 00 04 1B 95 6E 00 00 19 01 A0 1D 31 0F 11 00 04 1B 8F 6E 00 00 12 20 A0 51 2D 11 02 00 04 2C 02 16 16 
    //04 19 01 A0 1D 31 0F 20 00 04 1B 95 6E 00 00 19 01 A0 1D 31 0F 11 00 04 1B 8F 6E 00 00 12 20 A0 
    //51 2D 11 02 00 04 2C 02 16 16 04 0B 47 
  }


  function Initialize() {
    Config = new Class'MGame_ChessConfig';                                      //0000 : 0F 01 A0 1D 31 0F 11 0B 0B 0B 20 A0 51 2D 11 
    BoardData.Length = 64;                                                      //000F : 0F 37 01 F8 73 83 0F 2C 40 
    ResetBoard();                                                               //0018 : 1B 92 6E 00 00 16 
    Super.Initialize();                                                         //001E : 1C 88 1B 31 0F 16 
    //0F 01 A0 1D 31 0F 11 0B 0B 0B 20 A0 51 2D 11 0F 37 01 F8 73 83 0F 2C 40 1B 92 6E 00 00 16 1C 88 
    //1B 31 0F 16 04 0B 47 
  }



