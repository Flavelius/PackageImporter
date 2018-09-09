#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBMINIGAMES_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif

AUTOGENERATE_NAME(Initialize)
AUTOGENERATE_NAME(OnAcceptInvitation)
AUTOGENERATE_NAME(OnAcceptSettings)
AUTOGENERATE_NAME(OnCancelInvitation)
AUTOGENERATE_NAME(OnCancelSettings)
AUTOGENERATE_NAME(OnGameEnd)
AUTOGENERATE_NAME(OnLeaveGame)
AUTOGENERATE_NAME(OnMakeMove)
AUTOGENERATE_NAME(OnMove)
AUTOGENERATE_NAME(OnOfferDraw)
AUTOGENERATE_NAME(OnOfferDrawAccepted)
AUTOGENERATE_NAME(OnPlayerAvailable)
AUTOGENERATE_NAME(OnPlayerInvitation)
AUTOGENERATE_NAME(OnQuickstart)
AUTOGENERATE_NAME(OnResign)
AUTOGENERATE_NAME(OnStartMiniGame)
AUTOGENERATE_NAME(OnSwitchTurn)
AUTOGENERATE_NAME(OnTimeUpdate)
AUTOGENERATE_NAME(OnTimeoutInvitation)
AUTOGENERATE_NAME(OnUpdateBoardSquare)
AUTOGENERATE_NAME(OnUpdateSetting)
AUTOGENERATE_NAME(Stop)
AUTOGENERATE_NAME(cl2sv_AcceptDraw)
AUTOGENERATE_NAME(cl2sv_AcceptInvitation)
AUTOGENERATE_NAME(cl2sv_AcceptSettings)
AUTOGENERATE_NAME(cl2sv_CancelInvitation)
AUTOGENERATE_NAME(cl2sv_CancelSettings)
AUTOGENERATE_NAME(cl2sv_DebugMinigame)
AUTOGENERATE_NAME(cl2sv_InvitePlayer)
AUTOGENERATE_NAME(cl2sv_IsPlayerAvailable)
AUTOGENERATE_NAME(cl2sv_LeaveGame)
AUTOGENERATE_NAME(cl2sv_MakeMove)
AUTOGENERATE_NAME(cl2sv_MakePromotion)
AUTOGENERATE_NAME(cl2sv_OfferDraw)
AUTOGENERATE_NAME(cl2sv_Quickstart)
AUTOGENERATE_NAME(cl2sv_Resign)
AUTOGENERATE_NAME(cl2sv_SwitchTurn)
AUTOGENERATE_NAME(cl2sv_UpdateSetting)
AUTOGENERATE_NAME(cl_AcceptDraw)
AUTOGENERATE_NAME(cl_AcceptInvitation)
AUTOGENERATE_NAME(cl_AcceptSettings)
AUTOGENERATE_NAME(cl_CancelInvitation)
AUTOGENERATE_NAME(cl_CancelSettings)
AUTOGENERATE_NAME(cl_InvitePlayer)
AUTOGENERATE_NAME(cl_LeaveGame)
AUTOGENERATE_NAME(cl_LoadMiniGame)
AUTOGENERATE_NAME(cl_MakeMove)
AUTOGENERATE_NAME(cl_MakePromotion)
AUTOGENERATE_NAME(cl_OfferDraw)
AUTOGENERATE_NAME(cl_Resign)
AUTOGENERATE_NAME(cl_SwitchTurn)
AUTOGENERATE_NAME(cl_UpdateSetting)
AUTOGENERATE_NAME(sv2cl_AcceptInvitation)
AUTOGENERATE_NAME(sv2cl_AcceptSettings)
AUTOGENERATE_NAME(sv2cl_CancelInvitation)
AUTOGENERATE_NAME(sv2cl_CancelSettings)
AUTOGENERATE_NAME(sv2cl_DebugMinigame)
AUTOGENERATE_NAME(sv2cl_GameEnd)
AUTOGENERATE_NAME(sv2cl_InvitePlayer)
AUTOGENERATE_NAME(sv2cl_LeaveGame)
AUTOGENERATE_NAME(sv2cl_MakeMove)
AUTOGENERATE_NAME(sv2cl_MakePromotion)
AUTOGENERATE_NAME(sv2cl_OfferDraw)
AUTOGENERATE_NAME(sv2cl_OfferDrawAccepted)
AUTOGENERATE_NAME(sv2cl_PlayerAvailable)
AUTOGENERATE_NAME(sv2cl_Quickstart)
AUTOGENERATE_NAME(sv2cl_Resign)
AUTOGENERATE_NAME(sv2cl_StartMiniGame)
AUTOGENERATE_NAME(sv2cl_SwitchTurn)
AUTOGENERATE_NAME(sv2cl_UpdateSetting)
AUTOGENERATE_NAME(sv_AcceptDraw)
AUTOGENERATE_NAME(sv_AcceptSettings)
AUTOGENERATE_NAME(sv_AddToGroup)
AUTOGENERATE_NAME(sv_AllPlayersAcceptedDraw)
AUTOGENERATE_NAME(sv_AllPlayersAcceptedSettings)
AUTOGENERATE_NAME(sv_CancelSettings)
AUTOGENERATE_NAME(sv_Debug)
AUTOGENERATE_NAME(sv_FreeID)
AUTOGENERATE_NAME(sv_GrabID)
AUTOGENERATE_NAME(sv_IsPlayerAvailable)
AUTOGENERATE_NAME(sv_LeaveGame)
AUTOGENERATE_NAME(sv_LoadMiniGame)
AUTOGENERATE_NAME(sv_MakeMove)
AUTOGENERATE_NAME(sv_MakePromotion)
AUTOGENERATE_NAME(sv_OfferDraw)
AUTOGENERATE_NAME(sv_PlayerDied)
AUTOGENERATE_NAME(sv_Quickstart)
AUTOGENERATE_NAME(sv_RemoveFromGroup)
AUTOGENERATE_NAME(sv_Resign)
AUTOGENERATE_NAME(sv_StartMiniGame)
AUTOGENERATE_NAME(sv_SwitchTurn)
AUTOGENERATE_NAME(sv_UpdateSetting)

//------------------------------------------------------------------------------
//  MGame_MiniGame
//------------------------------------------------------------------------------

//  MGame_MiniGame.Debug 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execDebug_Parms {
};


//  MGame_MiniGame.GetCurrentPlayer 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execGetCurrentPlayer_Parms {
  class AGame_Pawn* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGame.Stop 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGame_eventStop_Parms {
};


//  MGame_MiniGame.Start 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execStart_Parms {
};


//  MGame_MiniGame.SetThinkTime 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execSetThinkTime_Parms {
  class AGame_Pawn* aGamePawn;  // 0 80 CPF_Parm
  FLOAT aThinkTime;  // 4 80 CPF_Parm
};


//  MGame_MiniGame.SwitchTurn 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execSwitchTurn_Parms {
};


//  MGame_MiniGame.SetPlayerTurnID 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execSetPlayerTurnID_Parms {
  INT PlayerID;  // 0 80 CPF_Parm
};


//  MGame_MiniGame.SetPlayerTurn 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execSetPlayerTurn_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGame.RemovePlayer 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execRemovePlayer_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGame.AddPlayer 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execAddPlayer_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGame.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execInitialize_Parms {
};


//  MGame_MiniGame.GetMiniGameTime 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execGetMiniGameTime_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGame.IsTimedGame 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGame_execIsTimedGame_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGame.GetPlayerTurnID 20400 0 ( FUNC_Native FUNC_Public )
struct UMGame_MiniGame_execGetPlayerTurnID_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGame.GetWinner 20400 0 ( FUNC_Native FUNC_Public )
struct UMGame_MiniGame_execGetWinner_Parms {
  class AGame_Pawn* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGame.GetResult 20400 0 ( FUNC_Native FUNC_Public )
struct UMGame_MiniGame_execGetResult_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGame.OnFrame 20400 0 ( FUNC_Native FUNC_Public )
struct UMGame_MiniGame_execOnFrame_Parms {
  FLOAT aDeltaTime;  // 0 80 CPF_Parm
};


//  MGame_MiniGame.OnTimeUpdate 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGame_execOnTimeUpdate_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  INT aSeconds;  // 4 80 CPF_Parm
};


// UMGame_MiniGame 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMGame_MiniGame : public UObject {
  public:
    class FString mConfigGUI;  // 28 400000 CPF_NeedCtorLink
    class FString mBoardGUI;  // 30 400000 CPF_NeedCtorLink
    class UMGame_Config* Config;  // 38 0
    TArray<class AGame_Pawn*> mPlayers;  // 3C 400000 CPF_NeedCtorLink
    INT mPlayerTurnID;  // 48 0
    BITFIELD mIsTimedGame : 1;  // 4C 0
    BITFIELD ThinkTimeOut : 1;  // 4C 0
    BITFIELD Started : 1;  // 4C 0
    struct FScriptDelegate __OnTimeUpdate__Delegate;  // 50 400000 CPF_NeedCtorLink
    virtual ~UMGame_MiniGame(void);
    virtual unsigned int GetCPPSize(void);
    UMGame_MiniGame(class UMGame_MiniGame const &);
    UMGame_MiniGame(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMGame_MiniGame & operator=(class UMGame_MiniGame const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnTimeUpdate(class AGame_Pawn *,int);
    void eventStop(void);
    void execGetPlayerTurnID(struct FFrame &,void * const);
    void execGetResult(struct FFrame &,void * const);
    void execGetWinner(struct FFrame &,void * const);
    void execOnFrame(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UMGame_MiniGame,0,execGetPlayerTurnID)
AUTOGENERATE_FUNCTION(UMGame_MiniGame,0,execGetResult)
AUTOGENERATE_FUNCTION(UMGame_MiniGame,0,execGetWinner)
AUTOGENERATE_FUNCTION(UMGame_MiniGame,0,execOnFrame)


//------------------------------------------------------------------------------
//  MGame_BoardGame
//------------------------------------------------------------------------------

#define UCONST_MGame_BoardGame_PIECE_COLOR_BLACK 0
#define UCONST_MGame_BoardGame_PIECE_COLOR_WHITE 128
// FExecuteMove 0 ( )
struct DLL_IMPORT FExecuteMove {
  public:
    INT Source;  // 0 0
    INT Target;  // 4 0
    INT Capture;  // 8 0
    INT SourceValue;  // C 0
    struct FExecuteMove & operator=(struct FExecuteMove const &);
};

//  MGame_BoardGame.FinishMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_BoardGame_execFinishMove_Parms {
  struct FExecuteMove aMove;  // 0 80 CPF_Parm
};


//  MGame_BoardGame.RemoveSquare 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_BoardGame_execRemoveSquare_Parms {
  INT Source;  // 0 80 CPF_Parm
};


//  MGame_BoardGame.ValidMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_BoardGame_execValidMove_Parms {
  INT originX;  // 0 80 CPF_Parm
  INT originY;  // 4 80 CPF_Parm
  INT destinationX;  // 8 80 CPF_Parm
  INT destinationY;  // C 80 CPF_Parm
  BITFIELD noFeedback : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_BoardGame.MakeMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_BoardGame_execMakeMove_Parms {
  INT originX;  // 0 80 CPF_Parm
  INT originY;  // 4 80 CPF_Parm
  INT destinationX;  // 8 80 CPF_Parm
  INT destinationY;  // C 80 CPF_Parm
  BITFIELD update : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_BoardGame.OnMove 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_BoardGame_execOnMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  INT cX;  // 10 80 CPF_Parm
  INT cY;  // 14 80 CPF_Parm
};


//  MGame_BoardGame.OnUpdateBoardSquare 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_BoardGame_execOnUpdateBoardSquare_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
};


// UMGame_BoardGame 4012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UMGame_BoardGame : public UMGame_MiniGame {
  public:
    TArray<BYTE> BoardData;  // 58 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnUpdateBoardSquare__Delegate;  // 64 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMove__Delegate;  // 6C 400000 CPF_NeedCtorLink
    virtual ~UMGame_BoardGame(void);
    virtual unsigned int GetCPPSize(void);
    UMGame_BoardGame(class UMGame_BoardGame const &);
    UMGame_BoardGame(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMGame_BoardGame & operator=(class UMGame_BoardGame const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnMove(int,int,int,int,int,int);
    void delegateOnUpdateBoardSquare(int,int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  MGame_Draughts
//------------------------------------------------------------------------------

#define UCONST_MGame_Draughts_PIECE_DRAUGHTS_TYPE_KING  2
#define UCONST_MGame_Draughts_PIECE_DRAUGHTS_TYPE_MAN  1
#define UCONST_MGame_Draughts_PIECE_DRAUGHTS_TYPE_EMPTY  0
#define UCONST_MGame_Draughts_PIECE_DRAUGHTS_TYPE  3
#define UCONST_MGame_Draughts_PIECE_DRAUGHTS_UNMARKED  251
#define UCONST_MGame_Draughts_PIECE_DRAUGHTS_MARKED  4
#define UCONST_MGame_Draughts_DRAUGHTS_PIECE_COLOR 128
#define UCONST_MGame_Draughts_DRAUGHTS_PIECE_TYPE 63
// FCapture 0 ( )
struct DLL_IMPORT FCapture {
  public:
    INT Destination;  // 0 0
    INT Captured;  // 4 0
    struct FCapture & operator=(struct FCapture const &);
};

// FDraughtsMove 0 ( )
struct DLL_IMPORT FDraughtsMove {
  public:
    INT StartSquare;  // 0 0
    BITFIELD IsCapture : 1;  // 4 0
    TArray<struct FCapture> Squares;  // 8 400000 CPF_NeedCtorLink
    FDraughtsMove(struct FDraughtsMove const &);
    FDraughtsMove(void);
    ~FDraughtsMove(void);
    struct FDraughtsMove & operator=(struct FDraughtsMove const &);
};

// FNeighbours 0 ( )
struct DLL_IMPORT FNeighbours {
  public:
    INT Square[4];  // 0 0
    struct FNeighbours & operator=(struct FNeighbours const &);
};

//  MGame_Draughts.Debug 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execDebug_Parms {
};


//  MGame_Draughts.FinishMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execFinishMove_Parms {
  struct FExecuteMove aMove;  // 0 80 CPF_Parm
};


//  MGame_Draughts.RemoveSquare 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execRemoveSquare_Parms {
  INT Source;  // 0 80 CPF_Parm
};


//  MGame_Draughts.ValidMoveSequence 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execValidMoveSequence_Parms {
  INT aStartSquare;  // 0 80 CPF_Parm
  TArray<struct FCapture> aMove;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.ValidMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execValidMove_Parms {
  INT aStartSquare;  // 0 80 CPF_Parm
  INT _na;  // 4 80 CPF_Parm
  INT aMoveIndex;  // 8 80 CPF_Parm
  INT _na2;  // C 80 CPF_Parm
  BITFIELD noFeedback : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.MakeMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execMakeMove_Parms {
  INT aStartSquare;  // 0 80 CPF_Parm
  INT _na;  // 4 80 CPF_Parm
  INT aMoveIndex;  // 8 80 CPF_Parm
  INT _na2;  // C 80 CPF_Parm
  BITFIELD aUpdate : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.FindMoves 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Draughts_execFindMoves_Parms {
  INT aFrom;  // 0 80 CPF_Parm
};


//  MGame_Draughts.FindCaptures 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Draughts_execFindCaptures_Parms {
  INT aLevel;  // 0 80 CPF_Parm
  INT aFrom;  // 4 80 CPF_Parm
};


//  MGame_Draughts.GenerateMoves 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execGenerateMoves_Parms {
};


//  MGame_Draughts.IsColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execIsColor_Parms {
  INT aPos;  // 0 80 CPF_Parm
  INT aColor;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.IsEmpty 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execIsEmpty_Parms {
  INT aPos;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.ResetBoard 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Draughts_execResetBoard_Parms {
};


//  MGame_Draughts.SetTurn 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execSetTurn_Parms {
  INT aColor;  // 0 80 CPF_Parm
};


//  MGame_Draughts.SwitchTurn 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execSwitchTurn_Parms {
};


//  MGame_Draughts.BoardPosToDamPos 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Draughts_execBoardPosToDamPos_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.BoardIDToDamPos 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Draughts_execBoardIDToDamPos_Parms {
  INT Id;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.CreateNeighbours 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Draughts_execCreateNeighbours_Parms {
};


//  MGame_Draughts.GetNeighbour 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Draughts_execGetNeighbour_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.GetMiniGameTime 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execGetMiniGameTime_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Draughts.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execInitialize_Parms {
};


//  MGame_Draughts.Start 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Draughts_execStart_Parms {
};


// UMGame_Draughts 4012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UMGame_Draughts : public UMGame_BoardGame {
  public:
    TArray<struct FNeighbours> mNeighbours;  // 74 400000 CPF_NeedCtorLink
    TArray<struct FDraughtsMove> Moves;  // 80 400000 CPF_NeedCtorLink
    TArray<struct FCapture> mCurrentCapture;  // 8C 400000 CPF_NeedCtorLink
    INT mCurrentStartSquare;  // 98 0
    INT mCaptureCount;  // 9C 0
    INT mColorsTurn;  // A0 0
    BITFIELD NoMoves : 1;  // A4 0
    virtual ~UMGame_Draughts(void);
    virtual unsigned int GetCPPSize(void);
    UMGame_Draughts(class UMGame_Draughts const &);
    UMGame_Draughts(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMGame_Draughts & operator=(class UMGame_Draughts const &);
    int GetResult(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  MGame_Chess
//------------------------------------------------------------------------------

#define UCONST_MGame_Chess_MOVE_HISTORY_LENGTH  5
#define UCONST_MGame_Chess_CANT_CASTLE_BLACK 12
#define UCONST_MGame_Chess_CANT_CASTLE_BLACK_LONG 8
#define UCONST_MGame_Chess_CANT_CASTLE_BLACK_SHORT 4
#define UCONST_MGame_Chess_CANT_CASTLE_WHITE 3
#define UCONST_MGame_Chess_CANT_CASTLE_WHITE_LONG 2
#define UCONST_MGame_Chess_CANT_CASTLE_WHITE_SHORT 1
#define UCONST_MGame_Chess_BOARD_G8  6
#define UCONST_MGame_Chess_BOARD_E8  4
#define UCONST_MGame_Chess_BOARD_C8  2
#define UCONST_MGame_Chess_BOARD_G1  62
#define UCONST_MGame_Chess_BOARD_E1  60
#define UCONST_MGame_Chess_BOARD_C1  58
#define UCONST_MGame_Chess_PIECE_CHESS_TYPE_KING 32
#define UCONST_MGame_Chess_PIECE_CHESS_TYPE_QUEEN 16
#define UCONST_MGame_Chess_PIECE_CHESS_TYPE_ROOK 8
#define UCONST_MGame_Chess_PIECE_CHESS_TYPE_BISHOP 4
#define UCONST_MGame_Chess_PIECE_CHESS_TYPE_KNIGHT 2
#define UCONST_MGame_Chess_PIECE_CHESS_TYPE_PAWN 1
#define UCONST_MGame_Chess_PIECE_CHESS_TYPE_EMPTY 0
#define UCONST_MGame_Chess_CHESS_PIECE_COLOR 128
#define UCONST_MGame_Chess_CHESS_PIECE_TYPE 63
// FBoardPosition 0 ( )
struct DLL_IMPORT FBoardPosition {
  public:
    INT X;  // 0 0
    INT Y;  // 4 0
    INT t;  // 8 0
    struct FBoardPosition & operator=(struct FBoardPosition const &);
};

// FMove 0 ( )
struct DLL_IMPORT FMove {
  public:
    struct FBoardPosition Source;  // 0 0
    INT sourceType;  // C 0
    INT sourceColor;  // 10 0
    struct FBoardPosition Target;  // 14 0
    INT TargetType;  // 20 0
    INT targetColor;  // 24 0
    BITFIELD White : 1;  // 28 0
    INT Status;  // 2C 0
    INT LastPawnTarget;  // 30 0
    INT EnPassantTarget;  // 34 0
    struct FMove & operator=(struct FMove const &);
};

//  MGame_Chess.Debug 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execDebug_Parms {
};


//  MGame_Chess.IsValidKingMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidKingMove_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsValidCastleLong 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidCastleLong_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsValidCastleShort 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidCastleShort_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsValidQueenMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidQueenMove_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsValidRookMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidRookMove_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsValidBishopMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidBishopMove_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsValidKnightMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidKnightMove_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsValidPawnMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidPawnMove_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.BaseCheck 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execBaseCheck_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsClearPathCoords 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsClearPathCoords_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsClearPath 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsClearPath_Parms {
  struct FBoardPosition Source;  // 0 80 CPF_Parm
  struct FBoardPosition Target;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.Sign 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execSign_Parms {
  INT X;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.AttackedByBlack 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execAttackedByBlack_Parms {
  INT tx;  // 0 80 CPF_Parm
  INT ty;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.AttackedByWhite 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execAttackedByWhite_Parms {
  INT tx;  // 0 80 CPF_Parm
  INT ty;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsAttacking 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsAttacking_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  BITFIELD noKingCheck : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.HasValidDiagonalMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execHasValidDiagonalMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.HasValidVerticalMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execHasValidVerticalMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.HasValidHorizontalMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execHasValidHorizontalMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.HasValidKingMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execHasValidKingMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.HasValidPawnMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execHasValidPawnMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.HasValidMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execHasValidMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.GenerateMoves 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execGenerateMoves_Parms {
};


//  MGame_Chess.ValidPieceMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execValidPieceMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  BITFIELD noFeedback : 1;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.ValidMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execValidMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  BITFIELD noFeedback : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsBlackInCheck 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsBlackInCheck_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsWhiteInCheck 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsWhiteInCheck_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.FinishMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execFinishMove_Parms {
  struct FExecuteMove aMove;  // 0 80 CPF_Parm
};


//  MGame_Chess.RemoveSquare 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execRemoveSquare_Parms {
  INT Source;  // 0 80 CPF_Parm
};


//  MGame_Chess.SetMove 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Chess_execSetMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  BITFIELD update : 1;  // 10 90 CPF_OptionalParm CPF_Parm
};


//  MGame_Chess.MakeMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execMakeMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  BITFIELD update : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.RevertMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execRevertMove_Parms {
  INT Count;  // 0 80 CPF_Parm
};


//  MGame_Chess.MakePromotion 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execMakePromotion_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT aPiece;  // 8 80 CPF_Parm
  BITFIELD aUpdate : 1;  // C 80 CPF_Parm
};


//  MGame_Chess.GetPiecePosition 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execGetPiecePosition_Parms {
  INT Piece;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsOppositeColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsOppositeColor_Parms {
  struct FMove Move;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 38 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsColor_Parms {
  INT pos;  // 0 80 CPF_Parm
  INT Color;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.IsEmpty 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsEmpty_Parms {
  INT pos;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.GetPieceColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execGetPieceColor_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.GetPieceType 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execGetPieceType_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.Start 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execStart_Parms {
};


//  MGame_Chess.SwitchTurn 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execSwitchTurn_Parms {
};


//  MGame_Chess.ResetBoard 40002 0 ( FUNC_Defined FUNC_Private )
struct UMGame_Chess_execResetBoard_Parms {
};


//  MGame_Chess.InitializeBoardLayout 20400 0 ( FUNC_Native FUNC_Public )
struct UMGame_Chess_execInitializeBoardLayout_Parms {
};


//  MGame_Chess.IsValidPromotionMove 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execIsValidPromotionMove_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.PopHistory 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execPopHistory_Parms {
  struct FMove ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.PushHistory 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execPushHistory_Parms {
  INT sx;  // 0 80 CPF_Parm
  INT sy;  // 4 80 CPF_Parm
  INT tx;  // 8 80 CPF_Parm
  INT ty;  // C 80 CPF_Parm
};


//  MGame_Chess.GetMiniGameTime 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execGetMiniGameTime_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Chess.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_execInitialize_Parms {
};


// UMGame_Chess 4012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UMGame_Chess : public UMGame_BoardGame {
  public:
    BYTE Status;  // 74 0
    INT LastPawnTarget;  // 78 2000000 CPF_EditorData
    INT EnPassantTarget;  // 7C 2000000 CPF_EditorData
    BITFIELD MovesPossible : 1;  // 80 0
    BITFIELD WhiteIsMoving : 1;  // 80 0
    BITFIELD CheckMate : 1;  // 80 0
    BITFIELD StallMate : 1;  // 80 0
    TArray<struct FMove> moveHistory;  // 84 400000 CPF_NeedCtorLink
    virtual ~UMGame_Chess(void);
    virtual unsigned int GetCPPSize(void);
    UMGame_Chess(class UMGame_Chess const &);
    UMGame_Chess(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMGame_Chess & operator=(class UMGame_Chess const &);
    int GetResult(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execInitializeBoardLayout(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UMGame_Chess,0,execInitializeBoardLayout)


//------------------------------------------------------------------------------
//  MGame_MiniGameProxy
//------------------------------------------------------------------------------

#define UCONST_MGame_MiniGameProxy_QUICKSTART  false
#define UCONST_MGame_MiniGameProxy_MINIGAME_INVITATION_TIMEOUT  30
#define UCONST_MGame_MiniGameProxy_MINIGAME_IGNORED_ME  3
#define UCONST_MGame_MiniGameProxy_MINIGAME_BUSY  2
#define UCONST_MGame_MiniGameProxy_MINIGAME_DECLINE  1
#define UCONST_MGame_MiniGameProxy_MINIGAME_ACCEPT  0
#define UCONST_MGame_MiniGameProxy_MINIGAME_STATUS_DIED  4
#define UCONST_MGame_MiniGameProxy_MINIGAME_STATUS_TIMEOUT  3
#define UCONST_MGame_MiniGameProxy_MINIGAME_STATUS_DRAW  2
#define UCONST_MGame_MiniGameProxy_MINIGAME_STATUS_WIN  1
#define UCONST_MGame_MiniGameProxy_MINIGAME_STATUS_UNDECIDED  0
#define UCONST_MGame_MiniGameProxy_MINIGAME_COUNT  2
#define UCONST_MGame_MiniGameProxy_MINIGAME_DRAUGHTS  1
#define UCONST_MGame_MiniGameProxy_MINIGAME_CHESS  0
//  MGame_MiniGameProxy.sv2cl_DebugMinigame_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_DebugMinigame_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_DebugMinigame 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_DebugMinigame_Parms {
};


//  MGame_MiniGameProxy.cl2sv_DebugMinigame_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_DebugMinigame_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_DebugMinigame 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_DebugMinigame_Parms {
};


//  MGame_MiniGameProxy.sv2cl_MakePromotion_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_MakePromotion_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_MakePromotion 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_MakePromotion_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT Piece;  // 8 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_GameEnd_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_GameEnd_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_GameEnd 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_GameEnd_Parms {
  INT aStatus;  // 0 80 CPF_Parm
  class AGame_Pawn* aPlayer;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_OfferDrawAccepted_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_OfferDrawAccepted_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_OfferDrawAccepted 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_OfferDrawAccepted_Parms {
  class AGame_Pawn* aPlayer;  // 0 80 CPF_Parm
  BITFIELD aAccepted : 1;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_OfferDraw_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_OfferDraw_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_OfferDraw 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_OfferDraw_Parms {
  class AGame_Pawn* aPlayer;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_Resign_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_Resign_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_Resign 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_Resign_Parms {
  class AGame_Pawn* aPlayer;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_SwitchTurn_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_SwitchTurn_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_SwitchTurn 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_SwitchTurn_Parms {
  INT aPlayerID;  // 0 80 CPF_Parm
  FLOAT aThinkTimeLeft;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_MakeMove_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_MakeMove_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_MakeMove 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_MakeMove_Parms {
  INT originX;  // 0 80 CPF_Parm
  INT originY;  // 4 80 CPF_Parm
  INT destinationX;  // 8 80 CPF_Parm
  INT destinationY;  // C 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_StartMiniGame_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_StartMiniGame_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_StartMiniGame 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_StartMiniGame_Parms {
};


//  MGame_MiniGameProxy.sv2cl_AcceptSettings_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_AcceptSettings_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_AcceptSettings 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_AcceptSettings_Parms {
};


//  MGame_MiniGameProxy.sv2cl_LeaveGame_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_LeaveGame_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_LeaveGame 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_LeaveGame_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_CancelSettings_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_CancelSettings_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_CancelSettings 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_CancelSettings_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_UpdateSetting_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_UpdateSetting_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_UpdateSetting 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_UpdateSetting_Parms {
  INT SettingID;  // 0 80 CPF_Parm
  INT Value;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_CancelInvitation_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_CancelInvitation_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_CancelInvitation 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_CancelInvitation_Parms {
};


//  MGame_MiniGameProxy.sv2cl_AcceptInvitation_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_AcceptInvitation_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_AcceptInvitation 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_AcceptInvitation_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  INT Accept;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_InvitePlayer_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_InvitePlayer_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_InvitePlayer 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_InvitePlayer_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_Quickstart_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_Quickstart_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_Quickstart 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_Quickstart_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv2cl_PlayerAvailable_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execsv2cl_PlayerAvailable_CallStub_Parms {
};


//  MGame_MiniGameProxy.sv2cl_PlayerAvailable 20802 180 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CL )
struct UMGame_MiniGameProxy_eventsv2cl_PlayerAvailable_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  BITFIELD Available : 1;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.sv_PlayerDied 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGameProxy_execsv_PlayerDied_Parms {
};


//  MGame_MiniGameProxy.sv_IsPlayerAvailable 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGameProxy_execsv_IsPlayerAvailable_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_MakePromotion_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_MakePromotion_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_MakePromotion 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_MakePromotion_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT Piece;  // 8 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_AcceptDraw_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_AcceptDraw_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_AcceptDraw 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_AcceptDraw_Parms {
  BITFIELD Accepted : 1;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_OfferDraw_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_OfferDraw_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_OfferDraw 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_OfferDraw_Parms {
};


//  MGame_MiniGameProxy.cl2sv_Resign_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_Resign_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_Resign 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_Resign_Parms {
};


//  MGame_MiniGameProxy.cl2sv_SwitchTurn_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_SwitchTurn_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_SwitchTurn 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_SwitchTurn_Parms {
};


//  MGame_MiniGameProxy.cl2sv_MakeMove_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_MakeMove_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_MakeMove 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_MakeMove_Parms {
  INT originX;  // 0 80 CPF_Parm
  INT originY;  // 4 80 CPF_Parm
  INT destinationX;  // 8 80 CPF_Parm
  INT destinationY;  // C 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_AcceptSettings_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_AcceptSettings_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_AcceptSettings 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_AcceptSettings_Parms {
};


//  MGame_MiniGameProxy.cl2sv_LeaveGame_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_LeaveGame_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_LeaveGame 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_LeaveGame_Parms {
};


//  MGame_MiniGameProxy.cl2sv_CancelSettings_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_CancelSettings_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_CancelSettings 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_CancelSettings_Parms {
};


//  MGame_MiniGameProxy.cl2sv_UpdateSetting_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_UpdateSetting_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_UpdateSetting 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_UpdateSetting_Parms {
  INT SettingID;  // 0 80 CPF_Parm
  INT Value;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_CancelInvitation_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_CancelInvitation_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_CancelInvitation 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_CancelInvitation_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_AcceptInvitation_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_AcceptInvitation_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_AcceptInvitation 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_AcceptInvitation_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  INT Accept;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_Quickstart_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_Quickstart_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_Quickstart 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_Quickstart_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_InvitePlayer_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_InvitePlayer_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_InvitePlayer 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_InvitePlayer_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl2sv_IsPlayerAvailable_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct UMGame_MiniGameProxy_execcl2sv_IsPlayerAvailable_CallStub_Parms {
};


//  MGame_MiniGameProxy.cl2sv_IsPlayerAvailable 20802 8001 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_CL2SV )
struct UMGame_MiniGameProxy_eventcl2sv_IsPlayerAvailable_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_MakePromotion 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_MakePromotion_Parms {
  INT X;  // 0 80 CPF_Parm
  INT Y;  // 4 80 CPF_Parm
  INT Piece;  // 8 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_AcceptDraw 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_AcceptDraw_Parms {
  BITFIELD Accepted : 1;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_OfferDraw 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_OfferDraw_Parms {
};


//  MGame_MiniGameProxy.cl_Resign 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_Resign_Parms {
};


//  MGame_MiniGameProxy.cl_SwitchTurn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_SwitchTurn_Parms {
};


//  MGame_MiniGameProxy.cl_MakeMove 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_MakeMove_Parms {
  INT originX;  // 0 80 CPF_Parm
  INT originY;  // 4 80 CPF_Parm
  INT destinationX;  // 8 80 CPF_Parm
  INT destinationY;  // C 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_AcceptSettings 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_AcceptSettings_Parms {
};


//  MGame_MiniGameProxy.cl_LeaveGame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_LeaveGame_Parms {
};


//  MGame_MiniGameProxy.cl_CancelSettings 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_CancelSettings_Parms {
};


//  MGame_MiniGameProxy.cl_UpdateSetting 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_UpdateSetting_Parms {
  INT SettingID;  // 0 80 CPF_Parm
  INT Value;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_CancelInvitation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_CancelInvitation_Parms {
};


//  MGame_MiniGameProxy.cl_AcceptInvitation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_AcceptInvitation_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
  INT Accept;  // 8 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_InvitePlayer 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_InvitePlayer_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_StartMiniGame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_StartMiniGame_Parms {
  class AGame_PlayerPawn* Opponent;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_OnFrame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_OnFrame_Parms {
  FLOAT DeltaTime;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.cl_OnInit 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_OnInit_Parms {
};


//  MGame_MiniGameProxy.cl_LoadMiniGame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventcl_LoadMiniGame_Parms {
};


//  MGame_MiniGameProxy.sv_LoadMiniGame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventsv_LoadMiniGame_Parms {
};


//  MGame_MiniGameProxy.LoadMiniGame 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGameProxy_execLoadMiniGame_Parms {
  INT Id;  // 0 80 CPF_Parm
  class UMGame_MiniGame* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameProxy.IsPlaying 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGameProxy_execIsPlaying_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameProxy.IsInviting 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_MiniGameProxy_execIsInviting_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameProxy.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMGame_MiniGameProxy_eventInitialize_Parms {
};


//  MGame_MiniGameProxy.SetThinkTime 20400 0 ( FUNC_Native FUNC_Public )
struct UMGame_MiniGameProxy_execSetThinkTime_Parms {
  FLOAT aThinkTime;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.GetThinkTime 20400 0 ( FUNC_Native FUNC_Public )
struct UMGame_MiniGameProxy_execGetThinkTime_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameProxy.OnOfferDrawAccepted 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnOfferDrawAccepted_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  BITFIELD Accepted : 1;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnOfferDraw 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnOfferDraw_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnResign 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnResign_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnSwitchTurn 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnSwitchTurn_Parms {
  INT PlayerID;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnMakeMove 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnMakeMove_Parms {
  INT sourceX;  // 0 80 CPF_Parm
  INT sourceY;  // 4 80 CPF_Parm
  INT targetX;  // 8 80 CPF_Parm
  INT targetY;  // C 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnGameEnd 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnGameEnd_Parms {
  INT Status;  // 0 80 CPF_Parm
  class AGame_Pawn* winner;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnQuickstart 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnQuickstart_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnStartMiniGame 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnStartMiniGame_Parms {
};


//  MGame_MiniGameProxy.OnLeaveGame 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnLeaveGame_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnAcceptSettings 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnAcceptSettings_Parms {
};


//  MGame_MiniGameProxy.OnCancelSettings 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnCancelSettings_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnUpdateSetting 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnUpdateSetting_Parms {
  INT SettingID;  // 0 80 CPF_Parm
  INT Value;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnTimeoutInvitation 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnTimeoutInvitation_Parms {
};


//  MGame_MiniGameProxy.OnCancelInvitation 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnCancelInvitation_Parms {
};


//  MGame_MiniGameProxy.OnAcceptInvitation 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnAcceptInvitation_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  INT Accept;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnPlayerInvitation 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnPlayerInvitation_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  INT GameType;  // 4 80 CPF_Parm
};


//  MGame_MiniGameProxy.OnPlayerAvailable 120000 0 ( FUNC_Public FUNC_Delegate )
struct UMGame_MiniGameProxy_execOnPlayerAvailable_Parms {
  class AGame_Pawn* Opponent;  // 0 80 CPF_Parm
  BITFIELD Available : 1;  // 4 80 CPF_Parm
};


// UMGame_MiniGameProxy 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMGame_MiniGameProxy : public UGame_MiniGameProxy {
  public:
    class AMGame_MiniGameManager* mMiniGameManager;  // 40 0
    INT mGroupID;  // 44 0
    INT mMiniGameID;  // 48 0
    BITFIELD mSettingsAccepted : 1;  // 4C 0
    BITFIELD mOfferDrawAccepted : 1;  // 4C 0
    class UMGame_MiniGame* mMiniGame;  // 50 0
    BITFIELD mInviting : 1;  // 54 0
    class AGame_Pawn* mInvitingPlayer;  // 58 0
    FLOAT mInvitationTimeLeft;  // 5C 0
    FLOAT mThinkTime;  // 60 0
    INT mPreviousThinkTime;  // 64 0
    BITFIELD mGameStarted : 1;  // 68 0
    struct FScriptDelegate __OnPlayerAvailable__Delegate;  // 6C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnPlayerInvitation__Delegate;  // 74 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnAcceptInvitation__Delegate;  // 7C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnCancelInvitation__Delegate;  // 84 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnTimeoutInvitation__Delegate;  // 8C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnUpdateSetting__Delegate;  // 94 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnCancelSettings__Delegate;  // 9C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnAcceptSettings__Delegate;  // A4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnLeaveGame__Delegate;  // AC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnStartMiniGame__Delegate;  // B4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnQuickstart__Delegate;  // BC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnGameEnd__Delegate;  // C4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMakeMove__Delegate;  // CC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnSwitchTurn__Delegate;  // D4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnResign__Delegate;  // DC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnOfferDraw__Delegate;  // E4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnOfferDrawAccepted__Delegate;  // EC 400000 CPF_NeedCtorLink
    virtual ~UMGame_MiniGameProxy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnInit(void);
    UMGame_MiniGameProxy(class UMGame_MiniGameProxy const &);
    UMGame_MiniGameProxy(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMGame_MiniGameProxy & operator=(class UMGame_MiniGameProxy const &);
    float GetThinkTime(void);
    static void CDECL InternalConstructor(void *);
    bool SetThinkTime(float);
    static class UClass * CDECL StaticClass(void);
    void delegateOnAcceptInvitation(class AGame_Pawn *,int);
    void delegateOnAcceptSettings(void);
    void delegateOnCancelInvitation(void);
    void delegateOnCancelSettings(class AGame_Pawn *);
    void delegateOnGameEnd(int,class AGame_Pawn *);
    void delegateOnLeaveGame(class AGame_Pawn *);
    void delegateOnMakeMove(int,int,int,int);
    void delegateOnOfferDraw(class AGame_Pawn *);
    void delegateOnOfferDrawAccepted(class AGame_Pawn *,unsigned long);
    void delegateOnPlayerAvailable(class AGame_Pawn *,unsigned long);
    void delegateOnPlayerInvitation(class AGame_Pawn *,int);
    void delegateOnQuickstart(class AGame_Pawn *,int);
    void delegateOnResign(class AGame_Pawn *);
    void delegateOnStartMiniGame(void);
    void delegateOnSwitchTurn(int);
    void delegateOnTimeoutInvitation(void);
    void delegateOnUpdateSetting(int,int);
    void eventInitialize(void);
    void eventcl2sv_AcceptDraw(unsigned long);
    void eventcl2sv_AcceptInvitation(class AGame_Pawn *,int);
    void eventcl2sv_AcceptSettings(void);
    void eventcl2sv_CancelInvitation(class AGame_Pawn *);
    void eventcl2sv_CancelSettings(void);
    void eventcl2sv_DebugMinigame(void);
    void eventcl2sv_InvitePlayer(class AGame_Pawn *,int);
    void eventcl2sv_IsPlayerAvailable(class AGame_Pawn *);
    void eventcl2sv_LeaveGame(void);
    void eventcl2sv_MakeMove(int,int,int,int);
    void eventcl2sv_MakePromotion(int,int,int);
    void eventcl2sv_OfferDraw(void);
    void eventcl2sv_Quickstart(class AGame_Pawn *,int);
    void eventcl2sv_Resign(void);
    void eventcl2sv_SwitchTurn(void);
    void eventcl2sv_UpdateSetting(int,int);
    void eventcl_AcceptDraw(unsigned long);
    void eventcl_AcceptInvitation(class AGame_Pawn *,int,int);
    void eventcl_AcceptSettings(void);
    void eventcl_CancelInvitation(void);
    void eventcl_CancelSettings(void);
    void eventcl_InvitePlayer(class AGame_Pawn *,int);
    void eventcl_LeaveGame(void);
    void eventcl_LoadMiniGame(void);
    void eventcl_MakeMove(int,int,int,int);
    void eventcl_MakePromotion(int,int,int);
    void eventcl_OfferDraw(void);
    void eventcl_Resign(void);
    void eventcl_SwitchTurn(void);
    void eventcl_UpdateSetting(int,int);
    void eventsv2cl_AcceptInvitation(class AGame_Pawn *,int);
    void eventsv2cl_AcceptSettings(void);
    void eventsv2cl_CancelInvitation(void);
    void eventsv2cl_CancelSettings(class AGame_Pawn *);
    void eventsv2cl_DebugMinigame(void);
    void eventsv2cl_GameEnd(int,class AGame_Pawn *);
    void eventsv2cl_InvitePlayer(class AGame_Pawn *,int);
    void eventsv2cl_LeaveGame(class AGame_Pawn *);
    void eventsv2cl_MakeMove(int,int,int,int);
    void eventsv2cl_MakePromotion(int,int,int);
    void eventsv2cl_OfferDraw(class AGame_Pawn *);
    void eventsv2cl_OfferDrawAccepted(class AGame_Pawn *,unsigned long);
    void eventsv2cl_PlayerAvailable(class AGame_Pawn *,unsigned long);
    void eventsv2cl_Quickstart(class AGame_Pawn *,int);
    void eventsv2cl_Resign(class AGame_Pawn *);
    void eventsv2cl_StartMiniGame(void);
    void eventsv2cl_SwitchTurn(int,float);
    void eventsv2cl_UpdateSetting(int,int);
    void eventsv_LoadMiniGame(void);
    void execGetThinkTime(struct FFrame &,void * const);
    void execSetThinkTime(struct FFrame &,void * const);
    void execcl2sv_AcceptDraw_CallStub(struct FFrame &,void * const);
    void execcl2sv_AcceptInvitation_CallStub(struct FFrame &,void * const);
    void execcl2sv_AcceptSettings_CallStub(struct FFrame &,void * const);
    void execcl2sv_CancelInvitation_CallStub(struct FFrame &,void * const);
    void execcl2sv_CancelSettings_CallStub(struct FFrame &,void * const);
    void execcl2sv_DebugMinigame_CallStub(struct FFrame &,void * const);
    void execcl2sv_InvitePlayer_CallStub(struct FFrame &,void * const);
    void execcl2sv_IsPlayerAvailable_CallStub(struct FFrame &,void * const);
    void execcl2sv_LeaveGame_CallStub(struct FFrame &,void * const);
    void execcl2sv_MakeMove_CallStub(struct FFrame &,void * const);
    void execcl2sv_MakePromotion_CallStub(struct FFrame &,void * const);
    void execcl2sv_OfferDraw_CallStub(struct FFrame &,void * const);
    void execcl2sv_Quickstart_CallStub(struct FFrame &,void * const);
    void execcl2sv_Resign_CallStub(struct FFrame &,void * const);
    void execcl2sv_SwitchTurn_CallStub(struct FFrame &,void * const);
    void execcl2sv_UpdateSetting_CallStub(struct FFrame &,void * const);
    void execsv2cl_AcceptInvitation_CallStub(struct FFrame &,void * const);
    void execsv2cl_AcceptSettings_CallStub(struct FFrame &,void * const);
    void execsv2cl_CancelInvitation_CallStub(struct FFrame &,void * const);
    void execsv2cl_CancelSettings_CallStub(struct FFrame &,void * const);
    void execsv2cl_DebugMinigame_CallStub(struct FFrame &,void * const);
    void execsv2cl_GameEnd_CallStub(struct FFrame &,void * const);
    void execsv2cl_InvitePlayer_CallStub(struct FFrame &,void * const);
    void execsv2cl_LeaveGame_CallStub(struct FFrame &,void * const);
    void execsv2cl_MakeMove_CallStub(struct FFrame &,void * const);
    void execsv2cl_MakePromotion_CallStub(struct FFrame &,void * const);
    void execsv2cl_OfferDrawAccepted_CallStub(struct FFrame &,void * const);
    void execsv2cl_OfferDraw_CallStub(struct FFrame &,void * const);
    void execsv2cl_PlayerAvailable_CallStub(struct FFrame &,void * const);
    void execsv2cl_Quickstart_CallStub(struct FFrame &,void * const);
    void execsv2cl_Resign_CallStub(struct FFrame &,void * const);
    void execsv2cl_StartMiniGame_CallStub(struct FFrame &,void * const);
    void execsv2cl_SwitchTurn_CallStub(struct FFrame &,void * const);
    void execsv2cl_UpdateSetting_CallStub(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execGetThinkTime)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execSetThinkTime)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_AcceptDraw_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_AcceptInvitation_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_AcceptSettings_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_CancelInvitation_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_CancelSettings_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_DebugMinigame_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_InvitePlayer_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_IsPlayerAvailable_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_LeaveGame_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_MakeMove_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_MakePromotion_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_OfferDraw_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_Quickstart_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_Resign_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_SwitchTurn_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execcl2sv_UpdateSetting_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_AcceptInvitation_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_AcceptSettings_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_CancelInvitation_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_CancelSettings_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_DebugMinigame_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_GameEnd_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_InvitePlayer_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_LeaveGame_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_MakeMove_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_MakePromotion_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_OfferDrawAccepted_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_OfferDraw_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_PlayerAvailable_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_Quickstart_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_Resign_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_StartMiniGame_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_SwitchTurn_CallStub)
AUTOGENERATE_FUNCTION(UMGame_MiniGameProxy,0,execsv2cl_UpdateSetting_CallStub)


//------------------------------------------------------------------------------
//  MGame_MiniGameManager
//------------------------------------------------------------------------------

//  MGame_MiniGameManager.sv_Debug 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_Debug_Parms {
  class AGame_Pawn* aPlayer;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_MakePromotion 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_MakePromotion_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  INT X;  // 4 80 CPF_Parm
  INT Y;  // 8 80 CPF_Parm
  INT Piece;  // C 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_AcceptDraw 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_AcceptDraw_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  BITFIELD Accepted : 1;  // 4 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_AllPlayersAcceptedDraw 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_AllPlayersAcceptedDraw_Parms {
  INT GroupId;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameManager.sv_OfferDraw 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_OfferDraw_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_Resign 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_Resign_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_SwitchTurn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_SwitchTurn_Parms {
  class AGame_Pawn* aCurrentPlayer;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_MakeMove 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_MakeMove_Parms {
  class AGame_Pawn* Mover;  // 0 80 CPF_Parm
  INT originX;  // 4 80 CPF_Parm
  INT originY;  // 8 80 CPF_Parm
  INT destinationX;  // C 80 CPF_Parm
  INT destinationY;  // 10 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_Quickstart 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_Quickstart_Parms {
  INT GroupId;  // 0 80 CPF_Parm
  INT GameID;  // 4 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_StartMiniGame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_StartMiniGame_Parms {
  INT aGroupID;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_AcceptSettings 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_AcceptSettings_Parms {
  class AGame_Pawn* sender;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_AllPlayersAcceptedSettings 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_AllPlayersAcceptedSettings_Parms {
  INT GroupId;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameManager.sv_CancelSettings 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_CancelSettings_Parms {
  class AGame_Pawn* sender;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_UpdateSetting 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_UpdateSetting_Parms {
  class AGame_Pawn* sender;  // 0 80 CPF_Parm
  INT Setting;  // 4 80 CPF_Parm
  INT Option;  // 8 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_PlayerDied 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_PlayerDied_Parms {
  class AGame_Pawn* aDeadPlayer;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_LeaveGame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_LeaveGame_Parms {
  class AGame_Pawn* aSender;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_IsPlayerAvailable 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_IsPlayerAvailable_Parms {
  class AGame_Pawn* Player;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameManager.sv_RemoveFromGroup 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_RemoveFromGroup_Parms {
  class AGame_Pawn* aPlayer;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_AddToGroup 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_AddToGroup_Parms {
  INT aGroupID;  // 0 80 CPF_Parm
  class AGame_Pawn* aPlayer;  // 4 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_FreeID 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_FreeID_Parms {
  INT Id;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_GrabID 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_GrabID_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_MiniGameManager.sv_OnLogout 20002 0 ( FUNC_Defined FUNC_Public )
struct AMGame_MiniGameManager_execsv_OnLogout_Parms {
  class AGame_PlayerPawn* aPawn;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.sv_OnInit 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AMGame_MiniGameManager_eventsv_OnInit_Parms {
};


//  MGame_MiniGameManager.RemoveGroup 20400 0 ( FUNC_Native FUNC_Public )
struct AMGame_MiniGameManager_execRemoveGroup_Parms {
  INT GroupId;  // 0 80 CPF_Parm
};


//  MGame_MiniGameManager.AddGroup 20400 0 ( FUNC_Native FUNC_Public )
struct AMGame_MiniGameManager_execAddGroup_Parms {
  INT GroupId;  // 0 80 CPF_Parm
  class UMGame_MiniGame* pMiniGame;  // 4 80 CPF_Parm
};


//  MGame_MiniGameManager.GetGroup 20400 0 ( FUNC_Native FUNC_Public )
struct AMGame_MiniGameManager_execGetGroup_Parms {
  INT GroupId;  // 0 80 CPF_Parm
  class UMGame_MiniGame* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// AMGame_MiniGameManager 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT AMGame_MiniGameManager : public AGame_MiniGameManager {
  public:
    TArray<INT> mFreeIDs;  // 420 400000 CPF_NeedCtorLink
    INT mLastID;  // 42C 0
    INT mMiniGames;  // 430 800000 CPF_Unk_00800000
    virtual ~AMGame_MiniGameManager(void);
    virtual unsigned int GetCPPSize(void);
    AMGame_MiniGameManager(class AMGame_MiniGameManager const &);
    AMGame_MiniGameManager(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AMGame_MiniGameManager & operator=(class AMGame_MiniGameManager const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventsv_AcceptDraw(class AGame_Pawn *,unsigned long);
    void eventsv_AcceptSettings(class AGame_Pawn *);
    void eventsv_AddToGroup(int,class AGame_Pawn *);
    unsigned long eventsv_AllPlayersAcceptedDraw(int);
    unsigned long eventsv_AllPlayersAcceptedSettings(int);
    void eventsv_CancelSettings(class AGame_Pawn *);
    void eventsv_Debug(class AGame_Pawn *);
    void eventsv_FreeID(int);
    int eventsv_GrabID(void);
    unsigned long eventsv_IsPlayerAvailable(class AGame_Pawn *);
    void eventsv_LeaveGame(class AGame_Pawn *);
    void eventsv_MakeMove(class AGame_Pawn *,int,int,int,int);
    void eventsv_MakePromotion(class AGame_Pawn *,int,int,int);
    void eventsv_OfferDraw(class AGame_Pawn *);
    void eventsv_PlayerDied(class AGame_Pawn *);
    void eventsv_Quickstart(int,int);
    void eventsv_RemoveFromGroup(class AGame_Pawn *);
    void eventsv_Resign(class AGame_Pawn *);
    void eventsv_StartMiniGame(int);
    void eventsv_SwitchTurn(class AGame_Pawn *);
    void eventsv_UpdateSetting(class AGame_Pawn *,int,int);
    void execAddGroup(struct FFrame &,void * const);
    void execGetGroup(struct FFrame &,void * const);
    void execRemoveGroup(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(AMGame_MiniGameManager,0,execAddGroup)
AUTOGENERATE_FUNCTION(AMGame_MiniGameManager,0,execGetGroup)
AUTOGENERATE_FUNCTION(AMGame_MiniGameManager,0,execRemoveGroup)


//------------------------------------------------------------------------------
//  MGame_Config
//------------------------------------------------------------------------------

#define UCONST_MGame_Config_MGAME_CONFIG_ENABLED  1
#define UCONST_MGame_Config_MGAME_CONFIG_DISABLED  0
#define UCONST_MGame_Config_MGAME_CONFIG_COLOR_BLACK  1
#define UCONST_MGame_Config_MGAME_CONFIG_COLOR_WHITE  0
#define UCONST_MGame_Config_MGAME_CONFIG_TIME_30_MINUTES  3
#define UCONST_MGame_Config_MGAME_CONFIG_TIME_15_MINUTES  2
#define UCONST_MGame_Config_MGAME_CONFIG_TIME_10_MINUTES  1
#define UCONST_MGame_Config_MGAME_CONFIG_TIME_5_MINUTES  0
//  MGame_Config.GetTime 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Config_execGetTime_Parms {
  INT aTimeIndex;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Config.GetConfig 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Config_execGetConfig_Parms {
  INT aSetting;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MGame_Config.SetConfig 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Config_execSetConfig_Parms {
  INT aSetting;  // 0 80 CPF_Parm
  INT aValue;  // 4 80 CPF_Parm
};


//  MGame_Config.SetConfigCount 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Config_execSetConfigCount_Parms {
  INT aConfigCount;  // 0 80 CPF_Parm
};


//  MGame_Config.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Config_execInitialize_Parms {
};


// UMGame_Config 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMGame_Config : public UObject {
  public:
    TArray<INT> mTimeConfig;  // 28 400000 CPF_NeedCtorLink
    TArray<INT> mConfigValues;  // 34 400000 CPF_NeedCtorLink
};


//------------------------------------------------------------------------------
//  MGame_DraughtsConfig
//------------------------------------------------------------------------------

#define UCONST_MGame_DraughtsConfig_MGAME_DRAUGHTS_CONFIG_COUNT  3
#define UCONST_MGame_DraughtsConfig_MGAME_DRAUGHTS_CONFIG_TIME  2
#define UCONST_MGame_DraughtsConfig_MGAME_DRAUGHTS_CONFIG_PLAYER2_COLOR  1
#define UCONST_MGame_DraughtsConfig_MGAME_DRAUGHTS_CONFIG_PLAYER1_COLOR  0
//  MGame_DraughtsConfig.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_DraughtsConfig_execInitialize_Parms {
};


// UMGame_DraughtsConfig 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMGame_DraughtsConfig : public UMGame_Config {
};


//------------------------------------------------------------------------------
//  MGame_ChessConfig
//------------------------------------------------------------------------------

#define UCONST_MGame_ChessConfig_MGAME_CHESS_CONFIG_COUNT  3
#define UCONST_MGame_ChessConfig_MGAME_CHESS_CONFIG_TIME  2
#define UCONST_MGame_ChessConfig_MGAME_CHESS_CONFIG_PLAYER2_COLOR  1
#define UCONST_MGame_ChessConfig_MGAME_CHESS_CONFIG_PLAYER1_COLOR  0
//  MGame_ChessConfig.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_ChessConfig_execInitialize_Parms {
};


// UMGame_ChessConfig 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMGame_ChessConfig : public UMGame_Config {
};


//------------------------------------------------------------------------------
//  MGame_Rules
//------------------------------------------------------------------------------

// UMGame_Rules 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMGame_Rules : public UObject {
  public:
    INT TestRule;  // 28 0
};


//------------------------------------------------------------------------------
//  MGame_Chess_Config
//------------------------------------------------------------------------------

#define UCONST_MGame_Chess_Config_MGAME_CHESS_CONFIG_CASTLING  5
#define UCONST_MGame_Chess_Config_MGAME_CHESS_CONFIG_ENPASSANT  4
#define UCONST_MGame_Chess_Config_MGAME_CHESS_CONFIG_COUNT  3
#define UCONST_MGame_Chess_Config_MGAME_CHESS_CONFIG_TIME  2
#define UCONST_MGame_Chess_Config_MGAME_CHESS_CONFIG_PLAYER2_COLOR  1
#define UCONST_MGame_Chess_Config_MGAME_CHESS_CONFIG_PLAYER1_COLOR  0
#define UCONST_MGame_Chess_Config_MGAME_CHESS_ENABLED  1
#define UCONST_MGame_Chess_Config_MGAME_CHESS_DISABLED  0
#define UCONST_MGame_Chess_Config_MGAME_CHESS_COLOR_BLACK  1
#define UCONST_MGame_Chess_Config_MGAME_CHESS_COLOR_WHITE  0
#define UCONST_MGame_Chess_Config_MGAME_CHESS_TIME_30_MINUTES  3
#define UCONST_MGame_Chess_Config_MGAME_CHESS_TIME_15_MINUTES  2
#define UCONST_MGame_Chess_Config_MGAME_CHESS_TIME_10_MINUTES  1
#define UCONST_MGame_Chess_Config_MGAME_CHESS_TIME_5_MINUTES  0
//  MGame_Chess_Config.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UMGame_Chess_Config_execInitialize_Parms {
};


// UMGame_Chess_Config 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMGame_Chess_Config : public UMGame_Config {
};




AUTOGENERATE_CLASS(AMGame_MiniGameManager)
AUTOGENERATE_CLASS(UMGame_BoardGame)
AUTOGENERATE_CLASS(UMGame_Chess)
AUTOGENERATE_CLASS(UMGame_Draughts)
AUTOGENERATE_CLASS(UMGame_MiniGame)
AUTOGENERATE_CLASS(UMGame_MiniGameProxy)

AUTOGENERATE_PACKAGE(SBMiniGames)


//_DllMain@12 1a52960
//SBMiniGames_InitPackage 1a52980

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

