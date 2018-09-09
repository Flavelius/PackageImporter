//==============================================================================
//  MGame_Chess_Config
//==============================================================================

class MGame_Chess_Config extends MGame_Config
    dependsOn()
  ;

  const MGAME_CHESS_CONFIG_CASTLING =  5;
  const MGAME_CHESS_CONFIG_ENPASSANT =  4;
  const MGAME_CHESS_CONFIG_COUNT =  3;
  const MGAME_CHESS_CONFIG_TIME =  2;
  const MGAME_CHESS_CONFIG_PLAYER2_COLOR =  1;
  const MGAME_CHESS_CONFIG_PLAYER1_COLOR =  0;
  const MGAME_CHESS_ENABLED =  1;
  const MGAME_CHESS_DISABLED =  0;
  const MGAME_CHESS_COLOR_BLACK =  1;
  const MGAME_CHESS_COLOR_WHITE =  0;
  const MGAME_CHESS_TIME_30_MINUTES =  3;
  const MGAME_CHESS_TIME_15_MINUTES =  2;
  const MGAME_CHESS_TIME_10_MINUTES =  1;
  const MGAME_CHESS_TIME_5_MINUTES =  0;

  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 48 01 19 11 16 
    SetConfigCount(3);                                                          //0006 : 1B 90 6E 00 00 2C 03 16 
    SetConfig(0,0);                                                             //000E : 1B 79 6E 00 00 25 25 16 
    SetConfig(1,1);                                                             //0016 : 1B 79 6E 00 00 26 26 16 
    SetConfig(2,0);                                                             //001E : 1B 79 6E 00 00 2C 02 25 16 
    SetConfig(4,1);                                                             //0027 : 1B 79 6E 00 00 2C 04 26 16 
    SetConfig(5,1);                                                             //0030 : 1B 79 6E 00 00 2C 05 26 16 
    //1C 48 01 19 11 16 1B 90 6E 00 00 2C 03 16 1B 79 6E 00 00 25 25 16 1B 79 6E 00 00 26 26 16 1B 79 
    //6E 00 00 2C 02 25 16 1B 79 6E 00 00 2C 04 26 16 1B 79 6E 00 00 2C 05 26 16 04 0B 47 
  }



