//==============================================================================
//  MGame_BoardGame
//==============================================================================

class MGame_BoardGame extends MGame_MiniGame
    native
    exportstructs
    dependsOn()
  ;

  const PIECE_COLOR_BLACK = 0;
  const PIECE_COLOR_WHITE = 128;
  struct ExecuteMove {
      var int Source;
      var int Target;
      var int Capture;
      var int SourceValue;

  };


  var array<byte> BoardData;
  var (null);
  var (null);


  function FinishMove(ExecuteMove aMove) {
    //04 0B 47 
  }


  function RemoveSquare(int Source) {
    //04 0B 47 
  }


  function bool ValidMove(int originX,int originY,int destinationX,int destinationY,optional bool noFeedback) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function int MakeMove(int originX,int originY,int destinationX,int destinationY,optional bool update) {
    return -1;                                                                  //0000 : 04 1D FF FF FF FF 
    //04 1D FF FF FF FF 04 0B 47 
  }


  delegate OnMove(int sx,int sy,int tx,int ty,int cX,int cY);


  delegate OnUpdateBoardSquare(int sx,int sy);



