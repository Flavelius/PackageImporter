//==============================================================================
//  Game_GameInfo
//==============================================================================

class Game_GameInfo extends Base_GameInfo
    native
    exportstructs
    dependsOn(Game_MiniGameDescription,Class,StringReferences,Actor,Base_GameClient,PlayerController,Player,Game_StatuePawn,LevelInfo,PlayerStart,NavigationPoint,SBClock,Game_Desktop,Game_MiniGameManager,Game_TradeManager,Game_PlayerPawn)
  ;

  var private transient int mhastransactionmanager_data;
  var export editinline SBClock mClock;
  var bool InitializedStatues;
  var (Arena) const bool HaveArenaManager;
  var (Arena) const bool HaveArenaProxy;
  var (Arena) int ArenaInstanceWorldId;
  var (MiniGames) const bool HaveMiniGameProxy;
  var Game_MiniGameManager MiniGameManager;
  var Material mChessIcon;
  var Material mCheckersIcon;
  var (Game_GameInfo) name PlayerEvent;
  var export editinline Game_TradeManager mTradeManager;


  private native function sv_NativeOnLogout(Game_PlayerPawn aPawn);


  function array<Game_MiniGameDescription> GetMiniGames() {
    local array<Game_MiniGameDescription> MiniGames;
    MiniGames.Length = 2;                                                       //0000 : 0F 37 00 70 98 28 11 2C 02 
    MiniGames[0] = new Class'Game_MiniGameDescription';                         //0009 : 0F 10 25 00 70 98 28 11 11 0B 0B 0B 20 E8 98 28 11 
    MiniGames[0].Title = Class'StringReferences'.default.Classic_Chess.Text;    //001A : 0F 19 10 25 00 70 98 28 11 05 00 00 01 28 9E 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 61 1C 11 
    MiniGames[0].Description = "Minigame";                                      //003E : 0F 19 10 25 00 70 98 28 11 05 00 00 01 A0 9E 28 11 1F 4D 69 6E 69 67 61 6D 65 00 
    MiniGames[0].IconMaterial = mChessIcon;                                     //0059 : 0F 19 10 25 00 70 98 28 11 05 00 04 01 18 9F 28 11 01 90 9F 28 11 
    MiniGames[1] = new Class'Game_MiniGameDescription';                         //006F : 0F 10 26 00 70 98 28 11 11 0B 0B 0B 20 E8 98 28 11 
    MiniGames[1].Title = Class'StringReferences'.default.International_Checkers.Text;//0080 : 0F 19 10 26 00 70 98 28 11 05 00 00 01 28 9E 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 61 1C 11 
    MiniGames[1].Description = "Minigame";                                      //00A4 : 0F 19 10 26 00 70 98 28 11 05 00 00 01 A0 9E 28 11 1F 4D 69 6E 69 67 61 6D 65 00 
    MiniGames[1].IconMaterial = mCheckersIcon;                                  //00BF : 0F 19 10 26 00 70 98 28 11 05 00 04 01 18 9F 28 11 01 08 A0 28 11 
    return MiniGames;                                                           //00D5 : 04 00 70 98 28 11 
    //0F 37 00 70 98 28 11 2C 02 0F 10 25 00 70 98 28 11 11 0B 0B 0B 20 E8 98 28 11 0F 19 10 25 00 70 
    //98 28 11 05 00 00 01 28 9E 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 61 1C 11 0F 19 
    //10 25 00 70 98 28 11 05 00 00 01 A0 9E 28 11 1F 4D 69 6E 69 67 61 6D 65 00 0F 19 10 25 00 70 98 
    //28 11 05 00 04 01 18 9F 28 11 01 90 9F 28 11 0F 10 26 00 70 98 28 11 11 0B 0B 0B 20 E8 98 28 11 
    //0F 19 10 26 00 70 98 28 11 05 00 00 01 28 9E 28 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //88 61 1C 11 0F 19 10 26 00 70 98 28 11 05 00 00 01 A0 9E 28 11 1F 4D 69 6E 69 67 61 6D 65 00 0F 
    //19 10 26 00 70 98 28 11 05 00 04 01 18 9F 28 11 01 08 A0 28 11 04 00 70 98 28 11 04 0B 47 
  }


  protected final function Game_Desktop cl_GetDesktop() {
    return Game_Desktop(Base_GameClient(Class'Actor'.static.GetGameEngine()).GPlayerController.Player.GUIDesktop);//0000 : 04 2E 60 CE 5A 01 19 19 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    //04 2E 60 CE 5A 01 19 19 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 
    //01 B8 1A 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 04 0B 47 
  }


  event sv_CreateStatues() {
    Class'Game_StatuePawn'.StaticCreateStatuePawns(self);                       //0000 : 12 20 98 E3 60 01 07 00 00 1B 28 06 00 00 17 16 
    //12 20 98 E3 60 01 07 00 00 1B 28 06 00 00 17 16 04 0B 47 
  }


  event PlayerStart sv_GetPlayerStart(string aNavigationTag) {
    local NavigationPoint navpoint;
    local PlayerStart preferredStart;
    local PlayerStart curStart;
    navpoint = Level.NavigationPointList;                                       //0000 : 0F 00 28 A6 28 11 19 01 D8 7E 6C 0F 05 00 04 01 D8 E0 74 0F 
    while (navpoint != None) {                                                  //0014 : 07 8D 00 77 00 28 A6 28 11 2A 16 
      curStart = PlayerStart(navpoint);                                         //001F : 0F 00 A0 A6 28 11 2E 98 FA C1 00 00 28 A6 28 11 
      if (curStart != None) {                                                   //002F : 07 76 00 77 00 A0 A6 28 11 2A 16 
        if (preferredStart == None) {                                           //003A : 07 50 00 72 00 18 A7 28 11 2A 16 
          preferredStart = curStart;                                            //0045 : 0F 00 18 A7 28 11 00 A0 A6 28 11 
        }
        if (aNavigationTag == curStart.NavigationTag) {                         //0050 : 07 76 00 7A 00 B8 A4 28 11 19 00 A0 A6 28 11 05 00 00 01 78 EC 7F 0F 16 
          preferredStart = curStart;                                            //0068 : 0F 00 18 A7 28 11 00 A0 A6 28 11 
          goto jl008D;                                                          //0073 : 06 8D 00 
        }
      }
      navpoint = navpoint.nextNavigationPoint;                                  //0076 : 0F 00 28 A6 28 11 19 00 28 A6 28 11 05 00 04 01 F8 FD 74 0F 
    }
    return preferredStart;                                                      //008D : 04 00 18 A7 28 11 
    //0F 00 28 A6 28 11 19 01 D8 7E 6C 0F 05 00 04 01 D8 E0 74 0F 07 8D 00 77 00 28 A6 28 11 2A 16 0F 
    //00 A0 A6 28 11 2E 98 FA C1 00 00 28 A6 28 11 07 76 00 77 00 A0 A6 28 11 2A 16 07 50 00 72 00 18 
    //A7 28 11 2A 16 0F 00 18 A7 28 11 00 A0 A6 28 11 07 76 00 7A 00 B8 A4 28 11 19 00 A0 A6 28 11 05 
    //00 00 01 78 EC 7F 0F 16 0F 00 18 A7 28 11 00 A0 A6 28 11 06 8D 00 0F 00 28 A6 28 11 19 00 28 A6 
    //28 11 05 00 04 01 F8 FD 74 0F 06 14 00 04 00 18 A7 28 11 04 0B 47 
  }


  event cl_OnUpdate() {
    Super.cl_OnUpdate();                                                        //0000 : 1C 58 7D 28 11 16 
    if (mClock != None) {                                                       //0006 : 07 20 00 77 01 38 FE 34 0F 2A 16 
      mClock.cl_OnUpdate();                                                     //0011 : 19 01 38 FE 34 0F 06 00 00 1B 67 07 00 00 16 
    }
    //1C 58 7D 28 11 16 07 20 00 77 01 38 FE 34 0F 2A 16 19 01 38 FE 34 0F 06 00 00 1B 67 07 00 00 16 
    //04 0B 47 
  }


  event cl_OnTick(float delta) {
    Super.cl_OnTick(delta);                                                     //0000 : 1C 98 2A 6E 0F 00 68 A9 28 11 16 
    if (mClock != None) {                                                       //000B : 07 2A 00 77 01 38 FE 34 0F 2A 16 
      mClock.cl_OnFrame(delta);                                                 //0016 : 19 01 38 FE 34 0F 0B 00 00 1B 3E 05 00 00 00 68 A9 28 11 16 
    }
    //1C 98 2A 6E 0F 00 68 A9 28 11 16 07 2A 00 77 01 38 FE 34 0F 2A 16 19 01 38 FE 34 0F 0B 00 00 1B 
    //3E 05 00 00 00 68 A9 28 11 16 04 0B 47 
  }


  event cl_OnLogout(Actor controllerActor) {
    local Game_Desktop desktop;
    desktop = cl_GetDesktop();                                                  //0000 : 0F 00 E8 AB 28 11 1C E8 95 28 11 16 
    desktop.HideAllWindows();                                                   //000C : 19 00 E8 AB 28 11 06 00 00 1B 49 0F 00 00 16 
    desktop.Clear();                                                            //001B : 19 00 E8 AB 28 11 06 00 00 1B A8 12 00 00 16 
    Super.cl_OnLogout(controllerActor);                                         //002A : 1C 10 7F 28 11 00 F8 AA 28 11 16 
    //0F 00 E8 AB 28 11 1C E8 95 28 11 16 19 00 E8 AB 28 11 06 00 00 1B 49 0F 00 00 16 19 00 E8 AB 28 
    //11 06 00 00 1B A8 12 00 00 16 1C 10 7F 28 11 00 F8 AA 28 11 16 04 0B 47 
  }


  event sv_OnLogout(int aAccountID,Base_Pawn aPawn) {
    local Game_PlayerPawn pp;
    pp = Game_PlayerPawn(aPawn);                                                //0000 : 0F 00 80 AE 28 11 2E F0 47 5B 01 00 F8 AE 28 11 
    if (pp != None) {                                                           //0010 : 07 84 00 77 00 80 AE 28 11 2A 16 
      if (PlayerEvent != 'None') {                                              //001B : 07 3B 00 FF 01 70 AF 28 11 21 00 00 00 00 16 
        UntriggerEvent(PlayerEvent,self,pp);                                    //002A : 1C 80 AF 34 0F 01 70 AF 28 11 17 00 80 AE 28 11 16 
      }
      if (MiniGameManager != None) {                                            //003B : 07 5A 00 77 01 E8 AF 28 11 2A 16 
        MiniGameManager.sv_OnLogout(pp);                                        //0046 : 19 01 E8 AF 28 11 0B 00 00 1B 73 07 00 00 00 80 AE 28 11 16 
      }
      if (mTradeManager != None) {                                              //005A : 07 79 00 77 01 08 00 23 11 2A 16 
        mTradeManager.sv_OnLogout(pp);                                          //0065 : 19 01 08 00 23 11 0B 00 00 1B 73 07 00 00 00 80 AE 28 11 16 
      }
      sv_NativeOnLogout(pp);                                                    //0079 : 1B 0F 0F 00 00 00 80 AE 28 11 16 
    }
    Super.sv_OnLogout(aAccountID,aPawn);                                        //0084 : 1C 88 83 28 11 00 10 AD 28 11 00 F8 AE 28 11 16 
    //0F 00 80 AE 28 11 2E F0 47 5B 01 00 F8 AE 28 11 07 84 00 77 00 80 AE 28 11 2A 16 07 3B 00 FF 01 
    //70 AF 28 11 21 00 00 00 00 16 1C 80 AF 34 0F 01 70 AF 28 11 17 00 80 AE 28 11 16 07 5A 00 77 01 
    //E8 AF 28 11 2A 16 19 01 E8 AF 28 11 0B 00 00 1B 73 07 00 00 00 80 AE 28 11 16 07 79 00 77 01 08 
    //00 23 11 2A 16 19 01 08 00 23 11 0B 00 00 1B 73 07 00 00 00 80 AE 28 11 16 1B 0F 0F 00 00 00 80 
    //AE 28 11 16 1C 88 83 28 11 00 10 AD 28 11 00 F8 AE 28 11 16 04 0B 47 
  }


  event sv_OnPostLogin(Game_PlayerPawn aPawn) {
    aPawn.sv_SetInvisible(False);                                               //0000 : 19 00 10 B1 28 11 07 00 00 1B 47 0E 00 00 28 16 
    aPawn.UpdateTouching();                                                     //0010 : 19 00 10 B1 28 11 06 00 00 1B B7 0D 00 00 16 
    //19 00 10 B1 28 11 07 00 00 1B 47 0E 00 00 28 16 19 00 10 B1 28 11 06 00 00 1B B7 0D 00 00 16 04 
    //0B 47 
  }


  event sv_OnLogin(Game_PlayerController aController,string portalName,string RouteName);


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C 28 26 6E 0F 16 
    mClock = new (self) Class'SBClock';                                         //0006 : 0F 01 38 FE 34 0F 11 17 0B 0B 20 48 26 24 01 
    if (IsServer()) {                                                           //0015 : 07 2D 00 1B FF 0B 00 00 16 
      mTradeManager = new (self) Class'Game_TradeManager';                      //001E : 0F 01 08 00 23 11 11 17 0B 0B 20 C0 59 5C 01 
    }
    //1C 28 26 6E 0F 16 0F 01 38 FE 34 0F 11 17 0B 0B 20 48 26 24 01 07 2D 00 1B FF 0B 00 00 16 0F 01 
    //08 00 23 11 11 17 0B 0B 20 C0 59 5C 01 04 0B 47 
  }


  event sv_OnShutdown() {
    Super.sv_OnShutdown();                                                      //0000 : 1C 10 01 75 0F 16 
    //1C 10 01 75 0F 16 04 0B 47 
  }


  event sv_OnInit() {
    local class<Game_MiniGameManager> MiniGameManagerClass;
    Super.sv_OnInit();                                                          //0000 : 1C F0 01 75 0F 16 
    if (HaveMiniGameProxy) {                                                    //0006 : 07 65 00 2D 01 88 3C 7F 0F 
      MiniGameManagerClass = Class<Game_MiniGameManager>(static.DynamicLoadObject("SBMiniGames.MGame_MiniGameManager",Class'Class'));//000F : 0F 00 A8 B6 28 11 13 B8 2B 5D 01 1C 60 E7 69 0F 1F 53 42 4D 69 6E 69 47 61 6D 65 73 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 4D 61 6E 61 67 65 72 00 20 D8 DE 1F 10 16 
      MiniGameManager = Spawn(MiniGameManagerClass);                            //0048 : 0F 01 E8 AF 28 11 61 16 00 A8 B6 28 11 16 
      MiniGameManager.sv_OnInit();                                              //0056 : 19 01 E8 AF 28 11 06 00 00 1B 1D 07 00 00 16 
    }
    //1C F0 01 75 0F 16 07 65 00 2D 01 88 3C 7F 0F 0F 00 A8 B6 28 11 13 B8 2B 5D 01 1C 60 E7 69 0F 1F 
    //53 42 4D 69 6E 69 47 61 6D 65 73 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 4D 61 6E 61 67 65 
    //72 00 20 D8 DE 1F 10 16 0F 01 E8 AF 28 11 61 16 00 A8 B6 28 11 16 19 01 E8 AF 28 11 06 00 00 1B 
    //1D 07 00 00 16 04 0B 47 
  }



