//==============================================================================
//  MGame_Draughts
//==============================================================================

class MGame_Draughts extends MGame_BoardGame
    native
    exportstructs
    dependsOn(MGame_Config,Class,MGame_DraughtsConfig)
  ;

  const PIECE_DRAUGHTS_TYPE_KING =  2;
  const PIECE_DRAUGHTS_TYPE_MAN =  1;
  const PIECE_DRAUGHTS_TYPE_EMPTY =  0;
  const PIECE_DRAUGHTS_TYPE =  3;
  const PIECE_DRAUGHTS_UNMARKED =  251;
  const PIECE_DRAUGHTS_MARKED =  4;
  const DRAUGHTS_PIECE_COLOR = 128;
  const DRAUGHTS_PIECE_TYPE = 63;
  struct Capture {
      var int Destination;
      var int Captured;

  };


  struct DraughtsMove {
      var int StartSquare;
      var bool IsCapture;
      var array<Capture> Squares;

  };


  struct Neighbours {
      var int Square[4];

  };


  var private array<Neighbours> mNeighbours;
  var array<DraughtsMove> Moves;
  var private array<Capture> mCurrentCapture;
  var private int mCurrentStartSquare;
  var private int mCaptureCount;
  var private int mColorsTurn;
  var bool NoMoves;


  function Debug() {
    local int X;
    local int Y;
    local int Value;
    local string boardLine;
    Y = 0;                                                                      //0000 : 0F 00 90 7A 83 0F 25 
    while (Y < 10) {                                                            //0007 : 07 B1 00 96 00 90 7A 83 0F 2C 0A 16 
      boardLine = "";                                                           //0013 : 0F 00 08 7B 83 0F 1F 00 
      X = 0;                                                                    //001B : 0F 00 F8 78 83 0F 25 
      while (X < 10) {                                                          //0022 : 07 A7 00 96 00 F8 78 83 0F 2C 0A 16 
        Value = BoardData[X + Y * 10];                                          //002E : 0F 00 80 7B 83 0F 39 3A 10 92 00 F8 78 83 0F 90 00 90 7A 83 0F 2C 0A 16 16 01 F8 73 83 0F 
        if (Value < 10) {                                                       //004C : 07 68 00 96 00 80 7B 83 0F 2C 0A 16 
          boardLine = boardLine $ " ";                                          //0058 : 0F 00 08 7B 83 0F 70 00 08 7B 83 0F 1F 20 00 16 
        }
        if (Value < 100) {                                                      //0068 : 07 84 00 96 00 80 7B 83 0F 2C 64 16 
          boardLine = boardLine $ " ";                                          //0074 : 0F 00 08 7B 83 0F 70 00 08 7B 83 0F 1F 20 00 16 
        }
        boardLine = boardLine $ string(Value) $ ",";                            //0084 : 0F 00 08 7B 83 0F 70 70 00 08 7B 83 0F 39 53 00 80 7B 83 0F 16 1F 2C 00 16 
        X++;                                                                    //009D : A5 00 F8 78 83 0F 16 
      }
      Y++;                                                                      //00A7 : A5 00 90 7A 83 0F 16 
    }
    //0F 00 90 7A 83 0F 25 07 B1 00 96 00 90 7A 83 0F 2C 0A 16 0F 00 08 7B 83 0F 1F 00 0F 00 F8 78 83 
    //0F 25 07 A7 00 96 00 F8 78 83 0F 2C 0A 16 0F 00 80 7B 83 0F 39 3A 10 92 00 F8 78 83 0F 90 00 90 
    //7A 83 0F 2C 0A 16 16 01 F8 73 83 0F 07 68 00 96 00 80 7B 83 0F 2C 0A 16 0F 00 08 7B 83 0F 70 00 
    //08 7B 83 0F 1F 20 00 16 07 84 00 96 00 80 7B 83 0F 2C 64 16 0F 00 08 7B 83 0F 70 00 08 7B 83 0F 
    //1F 20 00 16 0F 00 08 7B 83 0F 70 70 00 08 7B 83 0F 39 53 00 80 7B 83 0F 16 1F 2C 00 16 A5 00 F8 
    //78 83 0F 16 06 22 00 A5 00 90 7A 83 0F 16 06 07 00 04 0B 47 
  }


  function FinishMove(ExecuteMove aMove) {
    BoardData[aMove.Target] = aMove.SourceValue;                                //0000 : 0F 10 36 20 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 39 3D 36 10 67 83 0F 00 A8 7C 83 0F 
    if (aMove.Target < 10 && IsColor(aMove.Target,128)) {                       //001D : 07 63 00 82 96 36 20 66 83 0F 00 A8 7C 83 0F 2C 0A 16 18 13 00 1B 78 6E 00 00 36 20 66 83 0F 00 A8 7C 83 0F 2C 80 16 16 
      BoardData[aMove.Target] = 2 | 128;                                        //0045 : 0F 10 36 20 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 24 02 2C 80 16 
    } else {                                                                    //0060 : 06 A4 00 
      if (aMove.Target >= 90 && IsColor(aMove.Target,0)) {                      //0063 : 07 A4 00 82 99 36 20 66 83 0F 00 A8 7C 83 0F 2C 5A 16 18 12 00 1B 78 6E 00 00 36 20 66 83 0F 00 A8 7C 83 0F 25 16 16 
        BoardData[aMove.Target] = 2 | 0;                                        //008A : 0F 10 36 20 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 24 02 25 16 
      }
    }
    OnUpdateBoardSquare(aMove.Target % 10,aMove.Target / 10);                   //00A4 : 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 36 20 66 83 0F 00 A8 7C 83 0F 39 3F 2C 0A 16 91 36 20 66 83 0F 00 A8 7C 83 0F 2C 0A 16 16 
    if (aMove.Capture > -1) {                                                   //00D0 : 07 23 01 97 36 98 66 83 0F 00 A8 7C 83 0F 1D FF FF FF FF 16 
      BoardData[aMove.Capture] = 0;                                             //00E4 : 0F 10 36 98 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 24 00 
      OnUpdateBoardSquare(aMove.Capture % 10,aMove.Capture / 10);               //00F7 : 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 36 98 66 83 0F 00 A8 7C 83 0F 39 3F 2C 0A 16 91 36 98 66 83 0F 00 A8 7C 83 0F 2C 0A 16 16 
    }
    GenerateMoves();                                                            //0123 : 1B 87 6E 00 00 16 
    //0F 10 36 20 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 39 3D 36 10 67 83 0F 00 A8 7C 83 0F 07 63 00 
    //82 96 36 20 66 83 0F 00 A8 7C 83 0F 2C 0A 16 18 13 00 1B 78 6E 00 00 36 20 66 83 0F 00 A8 7C 83 
    //0F 2C 80 16 16 0F 10 36 20 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 24 02 2C 80 16 
    //06 A4 00 07 A4 00 82 99 36 20 66 83 0F 00 A8 7C 83 0F 2C 5A 16 18 12 00 1B 78 6E 00 00 36 20 66 
    //83 0F 00 A8 7C 83 0F 25 16 16 0F 10 36 20 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 
    //24 02 25 16 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 36 20 66 83 0F 00 A8 7C 83 0F 39 3F 2C 0A 
    //16 91 36 20 66 83 0F 00 A8 7C 83 0F 2C 0A 16 16 07 23 01 97 36 98 66 83 0F 00 A8 7C 83 0F 1D FF 
    //FF FF FF 16 0F 10 36 98 66 83 0F 00 A8 7C 83 0F 01 F8 73 83 0F 24 00 43 90 75 83 0F 4B 04 00 00 
    //39 44 AD 39 3F 36 98 66 83 0F 00 A8 7C 83 0F 39 3F 2C 0A 16 91 36 98 66 83 0F 00 A8 7C 83 0F 2C 
    //0A 16 16 1B 87 6E 00 00 16 04 0B 47 
  }


  function RemoveSquare(int Source) {
    BoardData[Source] = 0;                                                      //0000 : 0F 10 00 98 7F 83 0F 01 F8 73 83 0F 24 00 
    OnUpdateBoardSquare(Source % 10,Source / 10);                               //000E : 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 00 98 7F 83 0F 39 3F 2C 0A 16 91 00 98 7F 83 0F 2C 0A 16 16 
    //0F 10 00 98 7F 83 0F 01 F8 73 83 0F 24 00 43 90 75 83 0F 4B 04 00 00 39 44 AD 39 3F 00 98 7F 83 
    //0F 39 3F 2C 0A 16 91 00 98 7F 83 0F 2C 0A 16 16 04 0B 47 
  }


  function int ValidMoveSequence(int aStartSquare,array<Capture> aMove) {
    local int i;
    local int j;
    local bool Valid;
    i = 0;                                                                      //0000 : 0F 00 A8 81 83 0F 25 
    while (i < Moves.Length) {                                                  //0007 : 07 EF 00 96 00 A8 81 83 0F 37 01 20 82 83 0F 16 
      if (Moves[i].StartSquare == aStartSquare) {                               //0017 : 07 E5 00 9A 36 20 83 83 0F 10 00 A8 81 83 0F 01 20 82 83 0F 00 30 81 83 0F 16 
        Valid = Moves[i].Squares.Length >= aMove.Length;                        //0031 : 14 2D 00 98 83 83 0F 99 37 36 10 84 83 0F 10 00 A8 81 83 0F 01 20 82 83 0F 37 00 88 84 83 0F 16 
        j = 0;                                                                  //0051 : 0F 00 00 85 83 0F 25 
        while (j < aMove.Length && Valid) {                                     //0058 : 07 B1 00 82 96 00 00 85 83 0F 37 00 88 84 83 0F 16 18 07 00 2D 00 98 83 83 0F 16 
          Valid = Moves[i].Squares[j].Destination == aMove[j].Destination;      //0073 : 14 2D 00 98 83 83 0F 9A 36 00 86 83 0F 10 00 00 85 83 0F 36 10 84 83 0F 10 00 A8 81 83 0F 01 20 82 83 0F 36 00 86 83 0F 10 00 00 85 83 0F 00 88 84 83 0F 16 
          j++;                                                                  //00A7 : A5 00 00 85 83 0F 16 
        }
        if (Valid) {                                                            //00B1 : 07 E5 00 2D 00 98 83 83 0F 
          if (Moves[i].Squares.Length == aMove.Length) {                        //00BA : 07 DF 00 9A 37 36 10 84 83 0F 10 00 A8 81 83 0F 01 20 82 83 0F 37 00 88 84 83 0F 16 
            return i;                                                           //00D6 : 04 00 A8 81 83 0F 
            goto jl00E5;                                                        //00DC : 06 E5 00 
          }
          return -1;                                                            //00DF : 04 1D FF FF FF FF 
        }
      }
      i++;                                                                      //00E5 : A5 00 A8 81 83 0F 16 
    }
    return -2;                                                                  //00EF : 04 1D FE FF FF FF 
    //0F 00 A8 81 83 0F 25 07 EF 00 96 00 A8 81 83 0F 37 01 20 82 83 0F 16 07 E5 00 9A 36 20 83 83 0F 
    //10 00 A8 81 83 0F 01 20 82 83 0F 00 30 81 83 0F 16 14 2D 00 98 83 83 0F 99 37 36 10 84 83 0F 10 
    //00 A8 81 83 0F 01 20 82 83 0F 37 00 88 84 83 0F 16 0F 00 00 85 83 0F 25 07 B1 00 82 96 00 00 85 
    //83 0F 37 00 88 84 83 0F 16 18 07 00 2D 00 98 83 83 0F 16 14 2D 00 98 83 83 0F 9A 36 00 86 83 0F 
    //10 00 00 85 83 0F 36 10 84 83 0F 10 00 A8 81 83 0F 01 20 82 83 0F 36 00 86 83 0F 10 00 00 85 83 
    //0F 00 88 84 83 0F 16 A5 00 00 85 83 0F 16 06 58 00 07 E5 00 2D 00 98 83 83 0F 07 DF 00 9A 37 36 
    //10 84 83 0F 10 00 A8 81 83 0F 01 20 82 83 0F 37 00 88 84 83 0F 16 04 00 A8 81 83 0F 06 E5 00 04 
    //1D FF FF FF FF A5 00 A8 81 83 0F 16 06 07 00 04 1D FE FF FF FF 04 0B 47 
  }


  function bool ValidMove(int aStartSquare,int _na,int aMoveIndex,int _na2,optional bool noFeedback) {
    return Moves[aMoveIndex].StartSquare == aStartSquare;                       //0000 : 04 9A 36 20 83 83 0F 10 00 E0 89 83 0F 01 20 82 83 0F 00 18 89 83 0F 16 
    //04 9A 36 20 83 83 0F 10 00 E0 89 83 0F 01 20 82 83 0F 00 18 89 83 0F 16 04 0B 47 
  }


  function int MakeMove(int aStartSquare,int _na,int aMoveIndex,int _na2,optional bool aUpdate) {
    local int i;
    local int Target;
    local int prevStartSquare;
    Target = Moves[aMoveIndex].Squares[Moves[aMoveIndex].Squares.Length - 1].Destination;//0000 : 0F 00 60 90 83 0F 36 00 86 83 0F 10 93 37 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 26 16 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 
    prevStartSquare = aStartSquare;                                             //0030 : 0F 00 50 91 83 0F 00 E8 8C 83 0F 
    if (!aUpdate) {                                                             //003B : 07 6B 00 81 2D 00 C8 91 83 0F 16 
      BoardData[Target] = BoardData[aStartSquare];                              //0046 : 0F 10 00 60 90 83 0F 01 F8 73 83 0F 10 00 E8 8C 83 0F 01 F8 73 83 0F 
      BoardData[aStartSquare] = 0;                                              //005D : 0F 10 00 E8 8C 83 0F 01 F8 73 83 0F 24 00 
    }
    i = 0;                                                                      //006B : 0F 00 40 92 83 0F 25 
    while (i < Moves[aMoveIndex].Squares.Length) {                              //0072 : 07 92 01 96 00 40 92 83 0F 37 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 16 
      if (aUpdate) {                                                            //008D : 07 43 01 2D 00 C8 91 83 0F 
        OnMove(prevStartSquare % 10,prevStartSquare / 10,Moves[aMoveIndex].Squares[i].Destination % 10,Moves[aMoveIndex].Squares[i].Destination / 10,Moves[aMoveIndex].Squares[i].Captured % 10,Moves[aMoveIndex].Squares[i].Captured / 10);//0096 : 43 80 76 83 0F 40 04 00 00 39 44 AD 39 3F 00 50 91 83 0F 39 3F 2C 0A 16 91 00 50 91 83 0F 2C 0A 16 39 44 AD 39 3F 36 00 86 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 39 3F 2C 0A 16 91 36 00 86 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 2C 0A 16 39 44 AD 39 3F 36 F0 87 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 39 3F 2C 0A 16 91 36 F0 87 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 2C 0A 16 16 
      } else {                                                                  //0140 : 06 67 01 
        BoardData[Moves[aMoveIndex].Squares[i].Captured] = 0;                   //0143 : 0F 10 36 F0 87 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 01 F8 73 83 0F 24 00 
      }
      prevStartSquare = Moves[aMoveIndex].Squares[i].Destination;               //0167 : 0F 00 50 91 83 0F 36 00 86 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 
      i++;                                                                      //0188 : A5 00 40 92 83 0F 16 
    }
    if (!aUpdate) {                                                             //0192 : 07 06 02 81 2D 00 C8 91 83 0F 16 
      if (Target < 10 && IsColor(Target,128)) {                                 //019D : 07 D4 01 82 96 00 60 90 83 0F 2C 0A 16 18 0E 00 1B 78 6E 00 00 00 60 90 83 0F 2C 80 16 16 
        BoardData[Target] = 2 | 128;                                            //01BB : 0F 10 00 60 90 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 24 02 2C 80 16 
      } else {                                                                  //01D1 : 06 06 02 
        if (Target >= 90 && IsColor(Target,0)) {                                //01D4 : 07 06 02 82 99 00 60 90 83 0F 2C 5A 16 18 0D 00 1B 78 6E 00 00 00 60 90 83 0F 25 16 16 
          BoardData[Target] = 2 | 0;                                            //01F1 : 0F 10 00 60 90 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 24 02 25 16 
        }
      }
    }
    return -1;                                                                  //0206 : 04 1D FF FF FF FF 
    //0F 00 60 90 83 0F 36 00 86 83 0F 10 93 37 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 26 16 
    //36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 0F 00 50 91 83 0F 00 E8 8C 83 0F 07 6B 00 81 2D 
    //00 C8 91 83 0F 16 0F 10 00 60 90 83 0F 01 F8 73 83 0F 10 00 E8 8C 83 0F 01 F8 73 83 0F 0F 10 00 
    //E8 8C 83 0F 01 F8 73 83 0F 24 00 0F 00 40 92 83 0F 25 07 92 01 96 00 40 92 83 0F 37 36 10 84 83 
    //0F 10 00 D8 90 83 0F 01 20 82 83 0F 16 07 43 01 2D 00 C8 91 83 0F 43 80 76 83 0F 40 04 00 00 39 
    //44 AD 39 3F 00 50 91 83 0F 39 3F 2C 0A 16 91 00 50 91 83 0F 2C 0A 16 39 44 AD 39 3F 36 00 86 83 
    //0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 39 3F 2C 0A 16 91 36 00 86 
    //83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 2C 0A 16 39 44 AD 39 3F 
    //36 F0 87 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 39 3F 2C 0A 16 
    //91 36 F0 87 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 2C 0A 16 16 
    //06 67 01 0F 10 36 F0 87 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 90 83 0F 01 20 82 83 0F 
    //01 F8 73 83 0F 24 00 0F 00 50 91 83 0F 36 00 86 83 0F 10 00 40 92 83 0F 36 10 84 83 0F 10 00 D8 
    //90 83 0F 01 20 82 83 0F A5 00 40 92 83 0F 16 06 72 00 07 06 02 81 2D 00 C8 91 83 0F 16 07 D4 01 
    //82 96 00 60 90 83 0F 2C 0A 16 18 0E 00 1B 78 6E 00 00 00 60 90 83 0F 2C 80 16 16 0F 10 00 60 90 
    //83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 24 02 2C 80 16 06 06 02 07 06 02 82 99 00 60 90 83 0F 2C 5A 
    //16 18 0D 00 1B 78 6E 00 00 00 60 90 83 0F 25 16 16 0F 10 00 60 90 83 0F 01 F8 73 83 0F 39 3D 9E 
    //39 3A 24 02 25 16 04 1D FF FF FF FF 04 0B 47 
  }


  private function FindMoves(int aFrom) {
    local int direction;
    local int fromColor;
    local int fromType;
    local byte Square;
    fromColor = BoardData[aFrom] & 128;                                         //0000 : 0F 00 08 9B 83 0F 9C 39 3A 10 00 60 98 83 0F 01 F8 73 83 0F 2C 80 16 
    fromType = BoardData[aFrom] & 63;                                           //0017 : 0F 00 80 9B 83 0F 9C 39 3A 10 00 60 98 83 0F 01 F8 73 83 0F 2C 3F 16 
    direction = 0;                                                              //002E : 0F 00 F8 9B 83 0F 25 
    while (direction < 4) {                                                     //0035 : 07 77 01 96 00 F8 9B 83 0F 2C 04 16 
      if (fromColor == 128 && direction < 2
        || fromColor == 0 && direction >= 2
        || fromType == 2) {//0041 : 07 6D 01 84 84 82 9A 00 08 9B 83 0F 2C 80 16 18 0A 00 96 00 F8 9B 83 0F 2C 02 16 16 18 17 00 82 9A 00 08 9B 83 0F 25 16 18 0A 00 99 00 F8 9B 83 0F 2C 02 16 16 16 18 0A 00 9A 00 80 9B 83 0F 2C 02 16 16 
        Square = aFrom;                                                         //0084 : 0F 00 70 9C 83 0F 39 3D 00 60 98 83 0F 
        Square = mNeighbours[BoardIDToDamPos(Square)].Square[direction];        //0091 : 0F 00 70 9C 83 0F 39 3D 1A 00 F8 9B 83 0F 36 E8 9C 83 0F 10 1B 8A 6E 00 00 39 3A 00 70 9C 83 0F 16 01 60 9D 83 0F 
        if (Square == 0) {                                                      //00B7 : 07 C7 00 9A 39 3A 00 70 9C 83 0F 25 16 
          goto jl016D;                                                          //00C4 : 06 6D 01 
        }
        if ((BoardData[Square] & 63) == 0) {                                    //00C7 : 07 5E 01 9A 9C 39 3A 10 39 3A 00 70 9C 83 0F 01 F8 73 83 0F 2C 3F 16 25 16 
          Moves.Length = Moves.Length + 1;                                      //00E0 : 0F 37 01 20 82 83 0F 92 37 01 20 82 83 0F 26 16 
          Moves[Moves.Length - 1].StartSquare = aFrom;                          //00F0 : 0F 36 20 83 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 00 60 98 83 0F 
          Moves[Moves.Length - 1].IsCapture = False;                            //010A : 14 2D 36 D8 9D 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 28 
          Moves[Moves.Length - 1].Squares.Length = 1;                           //0121 : 0F 37 36 10 84 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 26 
          Moves[Moves.Length - 1].Squares[0].Destination = Square;              //0138 : 0F 36 00 86 83 0F 10 25 36 10 84 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 39 3A 00 70 9C 83 0F 
        } else {                                                                //015B : 06 61 01 
          break;                                                                //015E : 06 6D 01 
        }
        if (!fromType != 2) goto jl0091;                                        //0161 : 07 91 00 9B 00 80 9B 83 0F 2C 02 16 
      }
      direction++;                                                              //016D : A5 00 F8 9B 83 0F 16 
    }
    //0F 00 08 9B 83 0F 9C 39 3A 10 00 60 98 83 0F 01 F8 73 83 0F 2C 80 16 0F 00 80 9B 83 0F 9C 39 3A 
    //10 00 60 98 83 0F 01 F8 73 83 0F 2C 3F 16 0F 00 F8 9B 83 0F 25 07 77 01 96 00 F8 9B 83 0F 2C 04 
    //16 07 6D 01 84 84 82 9A 00 08 9B 83 0F 2C 80 16 18 0A 00 96 00 F8 9B 83 0F 2C 02 16 16 18 17 00 
    //82 9A 00 08 9B 83 0F 25 16 18 0A 00 99 00 F8 9B 83 0F 2C 02 16 16 16 18 0A 00 9A 00 80 9B 83 0F 
    //2C 02 16 16 0F 00 70 9C 83 0F 39 3D 00 60 98 83 0F 0F 00 70 9C 83 0F 39 3D 1A 00 F8 9B 83 0F 36 
    //E8 9C 83 0F 10 1B 8A 6E 00 00 39 3A 00 70 9C 83 0F 16 01 60 9D 83 0F 07 C7 00 9A 39 3A 00 70 9C 
    //83 0F 25 16 06 6D 01 07 5E 01 9A 9C 39 3A 10 39 3A 00 70 9C 83 0F 01 F8 73 83 0F 2C 3F 16 25 16 
    //0F 37 01 20 82 83 0F 92 37 01 20 82 83 0F 26 16 0F 36 20 83 83 0F 10 93 37 01 20 82 83 0F 26 16 
    //01 20 82 83 0F 00 60 98 83 0F 14 2D 36 D8 9D 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 
    //28 0F 37 36 10 84 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 26 0F 36 00 86 83 0F 10 25 
    //36 10 84 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 39 3A 00 70 9C 83 0F 06 61 01 06 6D 
    //01 07 91 00 9B 00 80 9B 83 0F 2C 02 16 A5 00 F8 9B 83 0F 16 06 35 00 04 0B 47 
  }


  private function FindCaptures(int aLevel,int aFrom) {
    local bool found;
    local int i;
    local int j;
    local int k;
    local int direction;
    local int fromColor;
    local int attacked;
    local int jumpTo;
    fromColor = BoardData[aFrom] & 128;                                         //0000 : 0F 00 48 A5 83 0F 9C 39 3A 10 00 C0 A5 83 0F 01 F8 73 83 0F 2C 80 16 
    direction = 0;                                                              //0017 : 0F 00 38 A6 83 0F 25 
    while (direction < 4) {                                                     //001E : 07 2D 02 96 00 38 A6 83 0F 2C 04 16 
      attacked = mNeighbours[BoardIDToDamPos(aFrom)].Square[direction];         //002A : 0F 00 B0 A6 83 0F 1A 00 38 A6 83 0F 36 E8 9C 83 0F 10 1B 8A 6E 00 00 00 C0 A5 83 0F 16 01 60 9D 83 0F 
      if ((BoardData[aFrom] & 63) == 2) {                                       //004C : 07 A4 00 9A 9C 39 3A 10 00 C0 A5 83 0F 01 F8 73 83 0F 2C 3F 16 2C 02 16 
        while (attacked != 0 && IsEmpty(attacked)) {                            //0064 : 07 A4 00 82 9B 00 B0 A6 83 0F 25 16 18 0C 00 1B 7A 6E 00 00 00 B0 A6 83 0F 16 16 
          attacked = mNeighbours[BoardIDToDamPos(attacked)].Square[direction];  //007F : 0F 00 B0 A6 83 0F 1A 00 38 A6 83 0F 36 E8 9C 83 0F 10 1B 8A 6E 00 00 00 B0 A6 83 0F 16 01 60 9D 83 0F 
        }
      }
      if (!IsEmpty(attacked) && !IsColor(attacked,fromColor)
        && (BoardData[attacked] & 4) == 0) {//00A4 : 07 23 02 82 82 81 1B 7A 6E 00 00 00 B0 A6 83 0F 16 16 18 13 00 81 1B 78 6E 00 00 00 B0 A6 83 0F 00 48 A5 83 0F 16 16 16 18 15 00 9A 9C 39 3A 10 00 B0 A6 83 0F 01 F8 73 83 0F 2C 04 16 25 16 16 
        jumpTo = attacked;                                                      //00E4 : 0F 00 28 A7 83 0F 00 B0 A6 83 0F 
        jumpTo = mNeighbours[BoardIDToDamPos(jumpTo)].Square[direction];        //00EF : 0F 00 28 A7 83 0F 1A 00 38 A6 83 0F 36 E8 9C 83 0F 10 1B 8A 6E 00 00 00 28 A7 83 0F 16 01 60 9D 83 0F 
        if (jumpTo != 0 && IsEmpty(jumpTo)) {                                   //0111 : 07 05 02 82 9B 00 28 A7 83 0F 25 16 18 0C 00 1B 7A 6E 00 00 00 28 A7 83 0F 16 16 
          mCurrentCapture.Length = aLevel + 1;                                  //012C : 0F 37 01 A0 A7 83 0F 92 00 00 9F 83 0F 26 16 
          mCurrentCapture[aLevel].Destination = jumpTo;                         //013B : 0F 36 00 86 83 0F 10 00 00 9F 83 0F 01 A0 A7 83 0F 00 28 A7 83 0F 
          mCurrentCapture[aLevel].Captured = attacked;                          //0151 : 0F 36 F0 87 83 0F 10 00 00 9F 83 0F 01 A0 A7 83 0F 00 B0 A6 83 0F 
          BoardData[jumpTo] = BoardData[aFrom];                                 //0167 : 0F 10 00 28 A7 83 0F 01 F8 73 83 0F 10 00 C0 A5 83 0F 01 F8 73 83 0F 
          BoardData[aFrom] = 0;                                                 //017E : 0F 10 00 C0 A5 83 0F 01 F8 73 83 0F 24 00 
          BoardData[attacked] = BoardData[attacked] | 4;                        //018C : 0F 10 00 B0 A6 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 10 00 B0 A6 83 0F 01 F8 73 83 0F 2C 04 16 
          FindCaptures(aLevel + 1,jumpTo);                                      //01AB : 1B A3 6E 00 00 92 00 00 9F 83 0F 26 16 00 28 A7 83 0F 16 
          BoardData[attacked] = BoardData[attacked] & 251;                      //01BE : 0F 10 00 B0 A6 83 0F 01 F8 73 83 0F 39 3D 9C 39 3A 10 00 B0 A6 83 0F 01 F8 73 83 0F 2C FB 16 
          BoardData[aFrom] = BoardData[jumpTo];                                 //01DD : 0F 10 00 C0 A5 83 0F 01 F8 73 83 0F 10 00 28 A7 83 0F 01 F8 73 83 0F 
          BoardData[jumpTo] = 0;                                                //01F4 : 0F 10 00 28 A7 83 0F 01 F8 73 83 0F 24 00 
        } else {                                                                //0202 : 06 08 02 
          break;                                                                //0205 : 06 23 02 
        }
        if (!BoardData[aFrom] != (2 | fromColor)) goto jl00EF;                  //0208 : 07 EF 00 9B 39 3A 10 00 C0 A5 83 0F 01 F8 73 83 0F 9E 2C 02 00 48 A5 83 0F 16 16 
      }
      direction++;                                                              //0223 : A5 00 38 A6 83 0F 16 
    }
    if (aLevel > mCaptureCount) {                                               //022D : 07 4F 02 97 00 00 9F 83 0F 01 18 A8 83 0F 16 
      mCaptureCount = aLevel;                                                   //023C : 0F 01 18 A8 83 0F 00 00 9F 83 0F 
      Moves.Length = 0;                                                         //0247 : 0F 37 01 20 82 83 0F 25 
    }
    if (aLevel == mCaptureCount) {                                              //024F : 07 15 04 9A 00 00 9F 83 0F 01 18 A8 83 0F 16 
      i = 0;                                                                    //025E : 0F 00 90 A8 83 0F 25 
      while (i < mCaptureCount) {                                               //0265 : 07 73 03 96 00 90 A8 83 0F 01 18 A8 83 0F 16 
        if (Moves[i].StartSquare == mCurrentStartSquare
          && Moves[i].Squares[aLevel - 1].Destination == aFrom) {//0274 : 07 69 03 82 9A 36 20 83 83 0F 10 00 90 A8 83 0F 01 20 82 83 0F 01 08 A9 83 0F 16 18 26 00 9A 36 00 86 83 0F 10 93 00 00 9F 83 0F 26 16 36 10 84 83 0F 10 00 90 A8 83 0F 01 20 82 83 0F 00 C0 A5 83 0F 16 16 
          found = False;                                                        //02B8 : 14 2D 00 80 A9 83 0F 28 
          j = 0;                                                                //02C0 : 0F 00 F8 A9 83 0F 25 
          while (j < Moves[i].Squares.Length) {                                 //02C7 : 07 5E 03 96 00 F8 A9 83 0F 37 36 10 84 83 0F 10 00 90 A8 83 0F 01 20 82 83 0F 16 
            k = 0;                                                              //02E2 : 0F 00 70 AA 83 0F 25 
            while (k < mCurrentCapture.Length) {                                //02E9 : 07 46 03 96 00 70 AA 83 0F 37 01 A0 A7 83 0F 16 
              found = False;                                                    //02F9 : 14 2D 00 80 A9 83 0F 28 
              if (Moves[i].Squares[j].Captured == mCurrentCapture[k].Captured) {//0301 : 07 3C 03 9A 36 F0 87 83 0F 10 00 F8 A9 83 0F 36 10 84 83 0F 10 00 90 A8 83 0F 01 20 82 83 0F 36 F0 87 83 0F 10 00 70 AA 83 0F 01 A0 A7 83 0F 16 
                found = True;                                                   //0331 : 14 2D 00 80 A9 83 0F 27 
                goto jl0346;                                                    //0339 : 06 46 03 
              }
              k++;                                                              //033C : A5 00 70 AA 83 0F 16 
            }
            if (!found) {                                                       //0346 : 07 54 03 81 2D 00 80 A9 83 0F 16 
              goto jl035E;                                                      //0351 : 06 5E 03 
            }
            j++;                                                                //0354 : A5 00 F8 A9 83 0F 16 
          }
          if (found) {                                                          //035E : 07 69 03 2D 00 80 A9 83 0F 
            return;                                                             //0367 : 04 0B 
          }
        }
        i++;                                                                    //0369 : A5 00 90 A8 83 0F 16 
      }
      Moves.Length = Moves.Length + 1;                                          //0373 : 0F 37 01 20 82 83 0F 92 37 01 20 82 83 0F 26 16 
      Moves[Moves.Length - 1].StartSquare = mCurrentStartSquare;                //0383 : 0F 36 20 83 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 01 08 A9 83 0F 
      Moves[Moves.Length - 1].IsCapture = True;                                 //039D : 14 2D 36 D8 9D 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 27 
      Moves[Moves.Length - 1].Squares.Length = mCaptureCount;                   //03B4 : 0F 37 36 10 84 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 01 18 A8 83 0F 
      i = 0;                                                                    //03CF : 0F 00 90 A8 83 0F 25 
      while (i < mCaptureCount) {                                               //03D6 : 07 15 04 96 00 90 A8 83 0F 01 18 A8 83 0F 16 
        Moves[Moves.Length - 1].Squares[i] = mCurrentCapture[i];                //03E5 : 0F 10 00 90 A8 83 0F 36 10 84 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 10 00 90 A8 83 0F 01 A0 A7 83 0F 
        i++;                                                                    //040B : A5 00 90 A8 83 0F 16 
      }
    }
    //0F 00 48 A5 83 0F 9C 39 3A 10 00 C0 A5 83 0F 01 F8 73 83 0F 2C 80 16 0F 00 38 A6 83 0F 25 07 2D 
    //02 96 00 38 A6 83 0F 2C 04 16 0F 00 B0 A6 83 0F 1A 00 38 A6 83 0F 36 E8 9C 83 0F 10 1B 8A 6E 00 
    //00 00 C0 A5 83 0F 16 01 60 9D 83 0F 07 A4 00 9A 9C 39 3A 10 00 C0 A5 83 0F 01 F8 73 83 0F 2C 3F 
    //16 2C 02 16 07 A4 00 82 9B 00 B0 A6 83 0F 25 16 18 0C 00 1B 7A 6E 00 00 00 B0 A6 83 0F 16 16 0F 
    //00 B0 A6 83 0F 1A 00 38 A6 83 0F 36 E8 9C 83 0F 10 1B 8A 6E 00 00 00 B0 A6 83 0F 16 01 60 9D 83 
    //0F 06 64 00 07 23 02 82 82 81 1B 7A 6E 00 00 00 B0 A6 83 0F 16 16 18 13 00 81 1B 78 6E 00 00 00 
    //B0 A6 83 0F 00 48 A5 83 0F 16 16 16 18 15 00 9A 9C 39 3A 10 00 B0 A6 83 0F 01 F8 73 83 0F 2C 04 
    //16 25 16 16 0F 00 28 A7 83 0F 00 B0 A6 83 0F 0F 00 28 A7 83 0F 1A 00 38 A6 83 0F 36 E8 9C 83 0F 
    //10 1B 8A 6E 00 00 00 28 A7 83 0F 16 01 60 9D 83 0F 07 05 02 82 9B 00 28 A7 83 0F 25 16 18 0C 00 
    //1B 7A 6E 00 00 00 28 A7 83 0F 16 16 0F 37 01 A0 A7 83 0F 92 00 00 9F 83 0F 26 16 0F 36 00 86 83 
    //0F 10 00 00 9F 83 0F 01 A0 A7 83 0F 00 28 A7 83 0F 0F 36 F0 87 83 0F 10 00 00 9F 83 0F 01 A0 A7 
    //83 0F 00 B0 A6 83 0F 0F 10 00 28 A7 83 0F 01 F8 73 83 0F 10 00 C0 A5 83 0F 01 F8 73 83 0F 0F 10 
    //00 C0 A5 83 0F 01 F8 73 83 0F 24 00 0F 10 00 B0 A6 83 0F 01 F8 73 83 0F 39 3D 9E 39 3A 10 00 B0 
    //A6 83 0F 01 F8 73 83 0F 2C 04 16 1B A3 6E 00 00 92 00 00 9F 83 0F 26 16 00 28 A7 83 0F 16 0F 10 
    //00 B0 A6 83 0F 01 F8 73 83 0F 39 3D 9C 39 3A 10 00 B0 A6 83 0F 01 F8 73 83 0F 2C FB 16 0F 10 00 
    //C0 A5 83 0F 01 F8 73 83 0F 10 00 28 A7 83 0F 01 F8 73 83 0F 0F 10 00 28 A7 83 0F 01 F8 73 83 0F 
    //24 00 06 08 02 06 23 02 07 EF 00 9B 39 3A 10 00 C0 A5 83 0F 01 F8 73 83 0F 9E 2C 02 00 48 A5 83 
    //0F 16 16 A5 00 38 A6 83 0F 16 06 1E 00 07 4F 02 97 00 00 9F 83 0F 01 18 A8 83 0F 16 0F 01 18 A8 
    //83 0F 00 00 9F 83 0F 0F 37 01 20 82 83 0F 25 07 15 04 9A 00 00 9F 83 0F 01 18 A8 83 0F 16 0F 00 
    //90 A8 83 0F 25 07 73 03 96 00 90 A8 83 0F 01 18 A8 83 0F 16 07 69 03 82 9A 36 20 83 83 0F 10 00 
    //90 A8 83 0F 01 20 82 83 0F 01 08 A9 83 0F 16 18 26 00 9A 36 00 86 83 0F 10 93 00 00 9F 83 0F 26 
    //16 36 10 84 83 0F 10 00 90 A8 83 0F 01 20 82 83 0F 00 C0 A5 83 0F 16 16 14 2D 00 80 A9 83 0F 28 
    //0F 00 F8 A9 83 0F 25 07 5E 03 96 00 F8 A9 83 0F 37 36 10 84 83 0F 10 00 90 A8 83 0F 01 20 82 83 
    //0F 16 0F 00 70 AA 83 0F 25 07 46 03 96 00 70 AA 83 0F 37 01 A0 A7 83 0F 16 14 2D 00 80 A9 83 0F 
    //28 07 3C 03 9A 36 F0 87 83 0F 10 00 F8 A9 83 0F 36 10 84 83 0F 10 00 90 A8 83 0F 01 20 82 83 0F 
    //36 F0 87 83 0F 10 00 70 AA 83 0F 01 A0 A7 83 0F 16 14 2D 00 80 A9 83 0F 27 06 46 03 A5 00 70 AA 
    //83 0F 16 06 E9 02 07 54 03 81 2D 00 80 A9 83 0F 16 06 5E 03 A5 00 F8 A9 83 0F 16 06 C7 02 07 69 
    //03 2D 00 80 A9 83 0F 04 0B A5 00 90 A8 83 0F 16 06 65 02 0F 37 01 20 82 83 0F 92 37 01 20 82 83 
    //0F 26 16 0F 36 20 83 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 01 08 A9 83 0F 14 2D 36 
    //D8 9D 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 27 0F 37 36 10 84 83 0F 10 93 37 01 20 
    //82 83 0F 26 16 01 20 82 83 0F 01 18 A8 83 0F 0F 00 90 A8 83 0F 25 07 15 04 96 00 90 A8 83 0F 01 
    //18 A8 83 0F 16 0F 10 00 90 A8 83 0F 36 10 84 83 0F 10 93 37 01 20 82 83 0F 26 16 01 20 82 83 0F 
    //10 00 90 A8 83 0F 01 A0 A7 83 0F A5 00 90 A8 83 0F 16 06 D6 03 04 0B 47 
  }


  function GenerateMoves() {
    local int i;
    Moves.Length = 0;                                                           //0000 : 0F 37 01 20 82 83 0F 25 
    mCurrentCapture.Length = 0;                                                 //0008 : 0F 37 01 A0 A7 83 0F 25 
    mCurrentStartSquare = 0;                                                    //0010 : 0F 01 08 A9 83 0F 25 
    mCaptureCount = 1;                                                          //0017 : 0F 01 18 A8 83 0F 26 
    i = 0;                                                                      //001E : 0F 00 98 AB 83 0F 25 
    while (i < 99) {                                                            //0025 : 07 86 00 96 00 98 AB 83 0F 2C 63 16 
      if ((BoardData[i] & 128) == mColorsTurn
        && (BoardData[i] & 63) != 0) {//0031 : 07 7C 00 82 9A 9C 39 3A 10 00 98 AB 83 0F 01 F8 73 83 0F 2C 80 16 01 88 AD 83 0F 16 18 15 00 9B 9C 39 3A 10 00 98 AB 83 0F 01 F8 73 83 0F 2C 3F 16 25 16 16 
        mCurrentStartSquare = i;                                                //0065 : 0F 01 08 A9 83 0F 00 98 AB 83 0F 
        FindCaptures(0,i);                                                      //0070 : 1B A3 6E 00 00 25 00 98 AB 83 0F 16 
      }
      i++;                                                                      //007C : A5 00 98 AB 83 0F 16 
    }
    if (Moves.Length == 0) {                                                    //0086 : 07 EE 00 9A 37 01 20 82 83 0F 25 16 
      i = 0;                                                                    //0092 : 0F 00 98 AB 83 0F 25 
      while (i < 99) {                                                          //0099 : 07 EE 00 96 00 98 AB 83 0F 2C 63 16 
        if ((BoardData[i] & 128) == mColorsTurn
          && (BoardData[i] & 63) != 0) {//00A5 : 07 E4 00 82 9A 9C 39 3A 10 00 98 AB 83 0F 01 F8 73 83 0F 2C 80 16 01 88 AD 83 0F 16 18 15 00 9B 9C 39 3A 10 00 98 AB 83 0F 01 F8 73 83 0F 2C 3F 16 25 16 16 
          FindMoves(i);                                                         //00D9 : 1B A9 6E 00 00 00 98 AB 83 0F 16 
        }
        i++;                                                                    //00E4 : A5 00 98 AB 83 0F 16 
      }
    }
    //0F 37 01 20 82 83 0F 25 0F 37 01 A0 A7 83 0F 25 0F 01 08 A9 83 0F 25 0F 01 18 A8 83 0F 26 0F 00 
    //98 AB 83 0F 25 07 86 00 96 00 98 AB 83 0F 2C 63 16 07 7C 00 82 9A 9C 39 3A 10 00 98 AB 83 0F 01 
    //F8 73 83 0F 2C 80 16 01 88 AD 83 0F 16 18 15 00 9B 9C 39 3A 10 00 98 AB 83 0F 01 F8 73 83 0F 2C 
    //3F 16 25 16 16 0F 01 08 A9 83 0F 00 98 AB 83 0F 1B A3 6E 00 00 25 00 98 AB 83 0F 16 A5 00 98 AB 
    //83 0F 16 06 25 00 07 EE 00 9A 37 01 20 82 83 0F 25 16 0F 00 98 AB 83 0F 25 07 EE 00 96 00 98 AB 
    //83 0F 2C 63 16 07 E4 00 82 9A 9C 39 3A 10 00 98 AB 83 0F 01 F8 73 83 0F 2C 80 16 01 88 AD 83 0F 
    //16 18 15 00 9B 9C 39 3A 10 00 98 AB 83 0F 01 F8 73 83 0F 2C 3F 16 25 16 16 1B A9 6E 00 00 00 98 
    //AB 83 0F 16 A5 00 98 AB 83 0F 16 06 99 00 04 0B 47 
  }


  function bool IsColor(int aPos,int aColor) {
    return (BoardData[aPos] & 128) == aColor;                                   //0000 : 04 9A 9C 39 3A 10 00 B0 AE 83 0F 01 F8 73 83 0F 2C 80 16 00 78 AF 83 0F 16 
    //04 9A 9C 39 3A 10 00 B0 AE 83 0F 01 F8 73 83 0F 2C 80 16 00 78 AF 83 0F 16 04 0B 47 
  }


  function bool IsEmpty(int aPos) {
    return (BoardData[aPos] & 63) == 0;                                         //0000 : 04 9A 9C 39 3A 10 00 18 B1 83 0F 01 F8 73 83 0F 2C 3F 16 25 16 
    //04 9A 9C 39 3A 10 00 18 B1 83 0F 01 F8 73 83 0F 2C 3F 16 25 16 04 0B 47 
  }


  private function ResetBoard() {
    local int i;
    mColorsTurn = 128;                                                          //0000 : 0F 01 88 AD 83 0F 2C 80 
    ThinkTimeOut = False;                                                       //0008 : 14 2D 01 38 29 31 0F 28 
    i = 0;                                                                      //0010 : 0F 00 08 B3 83 0F 25 
    while (i < 100) {                                                           //0017 : 07 3B 00 96 00 08 B3 83 0F 2C 64 16 
      BoardData[i] = 0;                                                         //0023 : 0F 10 00 08 B3 83 0F 01 F8 73 83 0F 24 00 
      i++;                                                                      //0031 : A5 00 08 B3 83 0F 16 
    }
    BoardData[1] = 0 | 1;                                                       //003B : 0F 10 26 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[3] = 0 | 1;                                                       //004C : 0F 10 2C 03 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[5] = 0 | 1;                                                       //005E : 0F 10 2C 05 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[7] = 0 | 1;                                                       //0070 : 0F 10 2C 07 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[9] = 0 | 1;                                                       //0082 : 0F 10 2C 09 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[10] = 0 | 1;                                                      //0094 : 0F 10 2C 0A 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[12] = 0 | 1;                                                      //00A6 : 0F 10 2C 0C 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[14] = 0 | 1;                                                      //00B8 : 0F 10 2C 0E 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[16] = 0 | 1;                                                      //00CA : 0F 10 2C 10 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[18] = 0 | 1;                                                      //00DC : 0F 10 2C 12 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[21] = 0 | 1;                                                      //00EE : 0F 10 2C 15 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[23] = 0 | 1;                                                      //0100 : 0F 10 2C 17 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[25] = 0 | 1;                                                      //0112 : 0F 10 2C 19 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[27] = 0 | 1;                                                      //0124 : 0F 10 2C 1B 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[29] = 0 | 1;                                                      //0136 : 0F 10 2C 1D 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[30] = 0 | 1;                                                      //0148 : 0F 10 2C 1E 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[32] = 0 | 1;                                                      //015A : 0F 10 2C 20 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[34] = 0 | 1;                                                      //016C : 0F 10 2C 22 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[36] = 0 | 1;                                                      //017E : 0F 10 2C 24 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[38] = 0 | 1;                                                      //0190 : 0F 10 2C 26 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    BoardData[61] = 128 | 1;                                                    //01A2 : 0F 10 2C 3D 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[63] = 128 | 1;                                                    //01B4 : 0F 10 2C 3F 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[65] = 128 | 1;                                                    //01C6 : 0F 10 2C 41 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[67] = 128 | 1;                                                    //01D8 : 0F 10 2C 43 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[69] = 128 | 1;                                                    //01EA : 0F 10 2C 45 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[70] = 128 | 1;                                                    //01FC : 0F 10 2C 46 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[72] = 128 | 1;                                                    //020E : 0F 10 2C 48 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[74] = 128 | 1;                                                    //0220 : 0F 10 2C 4A 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[76] = 128 | 1;                                                    //0232 : 0F 10 2C 4C 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[78] = 128 | 1;                                                    //0244 : 0F 10 2C 4E 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[81] = 128 | 1;                                                    //0256 : 0F 10 2C 51 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[83] = 128 | 1;                                                    //0268 : 0F 10 2C 53 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[85] = 128 | 1;                                                    //027A : 0F 10 2C 55 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[87] = 128 | 1;                                                    //028C : 0F 10 2C 57 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[89] = 128 | 1;                                                    //029E : 0F 10 2C 59 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[90] = 128 | 1;                                                    //02B0 : 0F 10 2C 5A 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[92] = 128 | 1;                                                    //02C2 : 0F 10 2C 5C 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[94] = 128 | 1;                                                    //02D4 : 0F 10 2C 5E 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[96] = 128 | 1;                                                    //02E6 : 0F 10 2C 60 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    BoardData[98] = 128 | 1;                                                    //02F8 : 0F 10 2C 62 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    GenerateMoves();                                                            //030A : 1B 87 6E 00 00 16 
    //0F 01 88 AD 83 0F 2C 80 14 2D 01 38 29 31 0F 28 0F 00 08 B3 83 0F 25 07 3B 00 96 00 08 B3 83 0F 
    //2C 64 16 0F 10 00 08 B3 83 0F 01 F8 73 83 0F 24 00 A5 00 08 B3 83 0F 16 06 17 00 0F 10 26 01 F8 
    //73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 03 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 
    //2C 05 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 07 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 
    //26 16 0F 10 2C 09 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 0A 01 F8 73 83 0F 39 3D 9E 
    //39 3A 24 00 26 16 0F 10 2C 0C 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 0E 01 F8 73 83 
    //0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 10 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 12 
    //01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 15 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 
    //0F 10 2C 17 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 19 01 F8 73 83 0F 39 3D 9E 39 3A 
    //24 00 26 16 0F 10 2C 1B 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 1D 01 F8 73 83 0F 39 
    //3D 9E 39 3A 24 00 26 16 0F 10 2C 1E 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 20 01 F8 
    //73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 22 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 
    //2C 24 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 26 16 0F 10 2C 26 01 F8 73 83 0F 39 3D 9E 39 3A 24 00 
    //26 16 0F 10 2C 3D 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 3F 01 F8 73 83 0F 39 3D 9E 
    //39 3A 24 80 26 16 0F 10 2C 41 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 43 01 F8 73 83 
    //0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 45 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 46 
    //01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 48 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 
    //0F 10 2C 4A 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 4C 01 F8 73 83 0F 39 3D 9E 39 3A 
    //24 80 26 16 0F 10 2C 4E 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 51 01 F8 73 83 0F 39 
    //3D 9E 39 3A 24 80 26 16 0F 10 2C 53 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 55 01 F8 
    //73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 57 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 
    //2C 59 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 5A 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 
    //26 16 0F 10 2C 5C 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 5E 01 F8 73 83 0F 39 3D 9E 
    //39 3A 24 80 26 16 0F 10 2C 60 01 F8 73 83 0F 39 3D 9E 39 3A 24 80 26 16 0F 10 2C 62 01 F8 73 83 
    //0F 39 3D 9E 39 3A 24 80 26 16 1B 87 6E 00 00 16 04 0B 47 
  }


  function SetTurn(int aColor) {
    mColorsTurn = aColor;                                                       //0000 : 0F 01 88 AD 83 0F 00 98 B8 83 0F 
    //0F 01 88 AD 83 0F 00 98 B8 83 0F 04 0B 47 
  }


  function SwitchTurn() {
    if (mColorsTurn == 128) {                                                   //0000 : 07 16 00 9A 01 88 AD 83 0F 2C 80 16 
      SetTurn(0);                                                               //000C : 1B 94 6E 00 00 25 16 
    } else {                                                                    //0013 : 06 1E 00 
      SetTurn(128);                                                             //0016 : 1B 94 6E 00 00 2C 80 16 
    }
    SetPlayerTurnID((GetPlayerTurnID() + 1) % 2);                               //001E : 1B 7E 6E 00 00 39 44 AD 39 3F 92 1B 8B 6E 00 00 16 26 16 39 3F 2C 02 16 16 
    GenerateMoves();                                                            //0037 : 1B 87 6E 00 00 16 
    if (Moves.Length == 0) {                                                    //003D : 07 51 00 9A 37 01 20 82 83 0F 25 16 
      NoMoves = True;                                                           //0049 : 14 2D 01 A0 BA 83 0F 27 
    }
    //07 16 00 9A 01 88 AD 83 0F 2C 80 16 1B 94 6E 00 00 25 16 06 1E 00 1B 94 6E 00 00 2C 80 16 1B 7E 
    //6E 00 00 39 44 AD 39 3F 92 1B 8B 6E 00 00 16 26 16 39 3F 2C 02 16 16 1B 87 6E 00 00 16 07 51 00 
    //9A 37 01 20 82 83 0F 25 16 14 2D 01 A0 BA 83 0F 27 04 0B 47 
  }


  private function int BoardPosToDamPos(int X,int Y) {
    if (Y >= 0 && Y < 10 && X >= 0 && X < 10) {                                 //0000 : 07 60 00 82 82 82 99 00 40 BC 83 0F 25 16 18 0A 00 96 00 40 BC 83 0F 2C 0A 16 16 18 09 00 99 00 C8 BB 83 0F 25 16 16 18 0A 00 96 00 C8 BB 83 0F 2C 0A 16 16 
      return Y * 5 + (X + 0.50000000) / 2 + 1;                                  //0034 : 04 39 44 AE AE 39 3F 90 00 40 BC 83 0F 2C 05 16 AC AE 39 3F 00 C8 BB 83 0F 1E 00 00 00 3F 16 39 3F 2C 02 16 16 39 3F 26 16 
    } else {                                                                    //005D : 06 62 00 
      return 0;                                                                 //0060 : 04 25 
    }
    //07 60 00 82 82 82 99 00 40 BC 83 0F 25 16 18 0A 00 96 00 40 BC 83 0F 2C 0A 16 16 18 09 00 99 00 
    //C8 BB 83 0F 25 16 16 18 0A 00 96 00 C8 BB 83 0F 2C 0A 16 16 04 39 44 AE AE 39 3F 90 00 40 BC 83 
    //0F 2C 05 16 AC AE 39 3F 00 C8 BB 83 0F 1E 00 00 00 3F 16 39 3F 2C 02 16 16 39 3F 26 16 06 62 00 
    //04 25 04 0B 47 
  }


  private function int BoardIDToDamPos(int Id) {
    return BoardPosToDamPos(Id % 10,Id / 10);                                   //0000 : 04 1B A4 6E 00 00 39 44 AD 39 3F 00 E0 BD 83 0F 39 3F 2C 0A 16 91 00 E0 BD 83 0F 2C 0A 16 16 
    //04 1B A4 6E 00 00 39 44 AD 39 3F 00 E0 BD 83 0F 39 3F 2C 0A 16 91 00 E0 BD 83 0F 2C 0A 16 16 04 
    //0B 47 
  }


  private function CreateNeighbours() {
    local int X;
    local int Y;
    local int i;
    mNeighbours.Length = 51;                                                    //0000 : 0F 37 01 60 9D 83 0F 2C 33 
    mNeighbours[0].Square[0] = 0;                                               //0009 : 0F 1A 25 36 E8 9C 83 0F 10 25 01 60 9D 83 0F 25 
    mNeighbours[0].Square[1] = 0;                                               //0019 : 0F 1A 26 36 E8 9C 83 0F 10 25 01 60 9D 83 0F 25 
    mNeighbours[0].Square[2] = 0;                                               //0029 : 0F 1A 2C 02 36 E8 9C 83 0F 10 25 01 60 9D 83 0F 25 
    mNeighbours[0].Square[3] = 0;                                               //003A : 0F 1A 2C 03 36 E8 9C 83 0F 10 25 01 60 9D 83 0F 25 
    Y = 0;                                                                      //004B : 0F 00 B8 C2 83 0F 25 
    while (Y < 10) {                                                            //0052 : 07 9B 01 96 00 B8 C2 83 0F 2C 0A 16 
      X = 0;                                                                    //005E : 0F 00 D8 BF 83 0F 25 
      while (X < 10) {                                                          //0065 : 07 91 01 96 00 D8 BF 83 0F 2C 0A 16 
        if (Y % 2 == 0 && X % 2 == 1 || Y % 2 == 1 && X % 2 == 0) {             //0071 : 07 87 01 84 82 B4 AD 39 3F 00 B8 C2 83 0F 39 3F 2C 02 16 39 3F 25 16 18 13 00 B4 AD 39 3F 00 D8 BF 83 0F 39 3F 2C 02 16 39 3F 26 16 16 18 2A 00 82 B4 AD 39 3F 00 B8 C2 83 0F 39 3F 2C 02 16 39 3F 26 16 18 13 00 B4 AD 39 3F 00 D8 BF 83 0F 39 3F 2C 02 16 39 3F 25 16 16 16 
          i = BoardPosToDamPos(X,Y);                                            //00CB : 0F 00 30 C3 83 0F 1B A4 6E 00 00 00 D8 BF 83 0F 00 B8 C2 83 0F 16 
          mNeighbours[i].Square[0] = GetNeighbour(X - 1,Y - 1);                 //00E1 : 0F 1A 25 36 E8 9C 83 0F 10 00 30 C3 83 0F 01 60 9D 83 0F 1B 89 6E 00 00 93 00 D8 BF 83 0F 26 16 93 00 B8 C2 83 0F 26 16 16 
          mNeighbours[i].Square[1] = GetNeighbour(X + 1,Y - 1);                 //010A : 0F 1A 26 36 E8 9C 83 0F 10 00 30 C3 83 0F 01 60 9D 83 0F 1B 89 6E 00 00 92 00 D8 BF 83 0F 26 16 93 00 B8 C2 83 0F 26 16 16 
          mNeighbours[i].Square[2] = GetNeighbour(X - 1,Y + 1);                 //0133 : 0F 1A 2C 02 36 E8 9C 83 0F 10 00 30 C3 83 0F 01 60 9D 83 0F 1B 89 6E 00 00 93 00 D8 BF 83 0F 26 16 92 00 B8 C2 83 0F 26 16 16 
          mNeighbours[i].Square[3] = GetNeighbour(X + 1,Y + 1);                 //015D : 0F 1A 2C 03 36 E8 9C 83 0F 10 00 30 C3 83 0F 01 60 9D 83 0F 1B 89 6E 00 00 92 00 D8 BF 83 0F 26 16 92 00 B8 C2 83 0F 26 16 16 
        }
        X++;                                                                    //0187 : A5 00 D8 BF 83 0F 16 
      }
      Y++;                                                                      //0191 : A5 00 B8 C2 83 0F 16 
    }
    //0F 37 01 60 9D 83 0F 2C 33 0F 1A 25 36 E8 9C 83 0F 10 25 01 60 9D 83 0F 25 0F 1A 26 36 E8 9C 83 
    //0F 10 25 01 60 9D 83 0F 25 0F 1A 2C 02 36 E8 9C 83 0F 10 25 01 60 9D 83 0F 25 0F 1A 2C 03 36 E8 
    //9C 83 0F 10 25 01 60 9D 83 0F 25 0F 00 B8 C2 83 0F 25 07 9B 01 96 00 B8 C2 83 0F 2C 0A 16 0F 00 
    //D8 BF 83 0F 25 07 91 01 96 00 D8 BF 83 0F 2C 0A 16 07 87 01 84 82 B4 AD 39 3F 00 B8 C2 83 0F 39 
    //3F 2C 02 16 39 3F 25 16 18 13 00 B4 AD 39 3F 00 D8 BF 83 0F 39 3F 2C 02 16 39 3F 26 16 16 18 2A 
    //00 82 B4 AD 39 3F 00 B8 C2 83 0F 39 3F 2C 02 16 39 3F 26 16 18 13 00 B4 AD 39 3F 00 D8 BF 83 0F 
    //39 3F 2C 02 16 39 3F 25 16 16 16 0F 00 30 C3 83 0F 1B A4 6E 00 00 00 D8 BF 83 0F 00 B8 C2 83 0F 
    //16 0F 1A 25 36 E8 9C 83 0F 10 00 30 C3 83 0F 01 60 9D 83 0F 1B 89 6E 00 00 93 00 D8 BF 83 0F 26 
    //16 93 00 B8 C2 83 0F 26 16 16 0F 1A 26 36 E8 9C 83 0F 10 00 30 C3 83 0F 01 60 9D 83 0F 1B 89 6E 
    //00 00 92 00 D8 BF 83 0F 26 16 93 00 B8 C2 83 0F 26 16 16 0F 1A 2C 02 36 E8 9C 83 0F 10 00 30 C3 
    //83 0F 01 60 9D 83 0F 1B 89 6E 00 00 93 00 D8 BF 83 0F 26 16 92 00 B8 C2 83 0F 26 16 16 0F 1A 2C 
    //03 36 E8 9C 83 0F 10 00 30 C3 83 0F 01 60 9D 83 0F 1B 89 6E 00 00 92 00 D8 BF 83 0F 26 16 92 00 
    //B8 C2 83 0F 26 16 16 A5 00 D8 BF 83 0F 16 06 65 00 A5 00 B8 C2 83 0F 16 06 52 00 04 0B 47 
  }


  private function int GetNeighbour(int X,int Y) {
    if (Y >= 0 && Y < 10 && X >= 0 && X < 10) {                                 //0000 : 07 48 00 82 82 82 99 00 68 C5 83 0F 25 16 18 0A 00 96 00 68 C5 83 0F 2C 0A 16 16 18 09 00 99 00 58 C4 83 0F 25 16 16 18 0A 00 96 00 58 C4 83 0F 2C 0A 16 16 
      return X + Y * 10;                                                        //0034 : 04 92 00 58 C4 83 0F 90 00 68 C5 83 0F 2C 0A 16 16 
    } else {                                                                    //0045 : 06 4A 00 
      return 0;                                                                 //0048 : 04 25 
    }
    //07 48 00 82 82 82 99 00 68 C5 83 0F 25 16 18 0A 00 96 00 68 C5 83 0F 2C 0A 16 16 18 09 00 99 00 
    //58 C4 83 0F 25 16 16 18 0A 00 96 00 58 C4 83 0F 2C 0A 16 16 04 92 00 58 C4 83 0F 90 00 68 C5 83 
    //0F 2C 0A 16 16 06 4A 00 04 25 04 0B 47 
  }


  function int GetMiniGameTime() {
    return Config.GetTime(Config.GetConfig(Class'MGame_DraughtsConfig'.2));     //0000 : 04 19 01 A0 1D 31 0F 20 00 04 1B 95 6E 00 00 19 01 A0 1D 31 0F 11 00 04 1B 8F 6E 00 00 12 20 80 C7 83 0F 02 00 04 2C 02 16 16 
    //04 19 01 A0 1D 31 0F 20 00 04 1B 95 6E 00 00 19 01 A0 1D 31 0F 11 00 04 1B 8F 6E 00 00 12 20 80 
    //C7 83 0F 02 00 04 2C 02 16 16 04 0B 47 
  }


  function Initialize() {
    Config = new Class'MGame_DraughtsConfig';                                   //0000 : 0F 01 A0 1D 31 0F 11 0B 0B 0B 20 80 C7 83 0F 
    BoardData.Length = 100;                                                     //000F : 0F 37 01 F8 73 83 0F 2C 64 
    CreateNeighbours();                                                         //0018 : 1B CD 6E 00 00 16 
    ResetBoard();                                                               //001E : 1B 92 6E 00 00 16 
    Super.Initialize();                                                         //0024 : 1C 88 1B 31 0F 16 
    //0F 01 A0 1D 31 0F 11 0B 0B 0B 20 80 C7 83 0F 0F 37 01 F8 73 83 0F 2C 64 1B CD 6E 00 00 16 1B 92 
    //6E 00 00 16 1C 88 1B 31 0F 16 04 0B 47 
  }


  function Start() {
    Super.Start();                                                              //0000 : 1C 50 59 83 0F 16 
    //1C 50 59 83 0F 16 04 0B 47 
  }



