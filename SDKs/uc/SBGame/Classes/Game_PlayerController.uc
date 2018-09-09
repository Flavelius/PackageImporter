//==============================================================================
//  Game_PlayerController
//==============================================================================

class Game_PlayerController extends Game_Controller
    native
    exportstructs
    dependsOn(LevelInfo,Game_PlayerPawn,Game_ShiftableAppearance,Game_PlayerInput,Game_NPCPawn,NPC_Type,PlayerInput,Game_Camera,LevelAreaVolume,PhysicsVolume,ZoneInfo,Game_GameInfo,PlayerStart,Actor,GameEngine,GameInfo,Game_Effects,Game_Trading,Game_PlayerTeams,Game_GUI,Game_Chat,Game_Travel,Game_Mail,Game_PlayerFriends,Game_PlayerGuilds,SBAnimatedPawn)
    Config(User)
  ;

  const MUTE_GLOBAL =  "global";
  const MUTE_ALL =  "all";
  const SERVER_SYNC_TIME =  1.0;
  enum EPingState {
    PIS_Idle ,
    PIS_WaitingPing ,
    PIS_WaitingPong 
  };

  var class<Game_PlayerInput> InputClass;
  var class<Game_Camera> CameraClass;
  var class<Game_GUI> GUIClass;
  var class<Game_Chat> ChatClass;
  var class<Game_Travel> TravelClass;
  var class<Game_Mail> MailClass;
  var class<Game_PlayerFriends> mGroupingFriendsClass;
  var class<Game_PlayerTeams> mGroupingTeamsClass;
  var class<Game_PlayerGuilds> mGroupingGuildsClass;
  var export editinline Game_PlayerInput Input;
  var export editinline Game_GUI GUI;
  var export editinline Game_Chat Chat;
  var export editinline Game_Camera Camera;
  var export editinline Game_Travel Travel;
  var export editinline Game_Mail Mail;
  var export editinline Game_PlayerFriends GroupingFriends;
  var export editinline Game_PlayerTeams GroupingTeams;
  var export editinline Game_PlayerGuilds GroupingGuilds;
  var transient bool mMoveForwards;
  var transient bool mMoveBackwards;
  var transient bool mMoveRight;
  var transient bool mMoveLeft;
  var transient bool mJump;
  var transient float ServerTime;
  var transient float mUnstuckTime;
  var byte mNetState;
  var export editinline Game_Conversation mConversation;
  var export editinline FSkill_EffectClass_AudioVisual mDeathEffect;
  var int mDeathEffectHandle;
  var transient bool mOldFreeCamLock;
  var private transient float mPing;
  var private transient float mPingTime;
  var private transient float mPongTime;
  var private transient byte mPingState;
  var private float mPingInterval;
  var bool DBMuted;
  var string DBMutedScope;
  var array<int> DBFinishedQuests;
  var array<int> DBQuestObjectiveIds;
  var array<int> DBQuestObjectiveValues;
  var (null);
  var (null);
  var private transient int mpMatineeObject;


  protected native function sv2cl_Pong_CallStub();


  private event sv2cl_Pong() {
    if (mPingState == 2) {                                                      //0000 : 07 53 00 9A 39 3A 01 40 2B 1B 11 39 3A 24 02 16 
      mPingState = 1;                                                           //0010 : 0F 01 40 2B 1B 11 24 01 
      mPongTime = Level.TimeSeconds;                                            //0018 : 0F 01 40 33 1B 11 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      mPing = (mPongTime - mPingTime) * 100;                                    //002C : 0F 01 B8 33 1B 11 AB AF 01 40 33 1B 11 01 30 34 1B 11 16 39 3F 2C 64 16 
      OnPong(mPing);                                                            //0044 : 43 A8 34 1B 11 DD 05 00 00 01 B8 33 1B 11 16 
    }
    //07 53 00 9A 39 3A 01 40 2B 1B 11 39 3A 24 02 16 0F 01 40 2B 1B 11 24 01 0F 01 40 33 1B 11 19 01 
    //D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 0F 01 B8 33 1B 11 AB AF 01 40 33 1B 11 01 30 34 1B 11 16 39 
    //3F 2C 64 16 43 A8 34 1B 11 DD 05 00 00 01 B8 33 1B 11 16 04 0B 47 
  }


  protected native function cl2sv_Ping_CallStub();


  private event cl2sv_Ping() {
    sv2cl_Pong_CallStub();                                                      //0000 : 1B F0 0E 00 00 16 
    //1B F0 0E 00 00 16 04 0B 47 
  }


  private function cl_Ping() {
    switch (mPingState) {                                                       //0000 : 05 01 01 40 2B 1B 11 
      case 0 :                                                                  //0007 : 0A 0C 00 24 00 
      case 1 :                                                                  //000C : 0A 41 00 24 01 
        cl2sv_Ping_CallStub();                                                  //0011 : 1B EF 0E 00 00 16 
        mPingState = 2;                                                         //0017 : 0F 01 40 2B 1B 11 24 02 
        mPongTime = 0.00000000;                                                 //001F : 0F 01 40 33 1B 11 1E 00 00 00 00 
        mPingTime = Level.TimeSeconds;                                          //002A : 0F 01 30 34 1B 11 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
        break;                                                                  //003E : 06 44 00 
      default:                                                                  //0041 : 0A FF FF 
    }
    //05 01 01 40 2B 1B 11 0A 0C 00 24 00 0A 41 00 24 01 1B EF 0E 00 00 16 0F 01 40 2B 1B 11 24 02 0F 
    //01 40 33 1B 11 1E 00 00 00 00 0F 01 30 34 1B 11 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 06 44 
    //00 0A FF FF 04 0B 47 
  }


  private function cl_HandlePing() {
    if (mPingState == 1
      && Level.TimeSeconds >= mPongTime + mPingInterval) {//0000 : 07 37 00 82 9A 39 3A 01 40 2B 1B 11 39 3A 24 01 16 18 1D 00 B3 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F AE 01 40 33 1B 11 01 90 38 1B 11 16 16 16 
      cl_Ping();                                                                //0031 : 1B 43 0D 00 00 16 
    }
    //07 37 00 82 9A 39 3A 01 40 2B 1B 11 39 3A 24 01 16 18 1D 00 B3 19 01 D8 7E 6C 0F 05 00 04 01 A8 
    //81 6C 0F AE 01 40 33 1B 11 01 90 38 1B 11 16 16 16 1B 43 0D 00 00 16 04 0B 47 
  }


  function float cl_GetPing() {
    return mPing;                                                               //0000 : 04 01 B8 33 1B 11 
    //04 01 B8 33 1B 11 04 0B 47 
  }


  function cl_StopPinging() {
    mPingState = 0;                                                             //0000 : 0F 01 40 2B 1B 11 24 00 
    //0F 01 40 2B 1B 11 24 00 04 0B 47 
  }


  function cl_StartPinging() {
    if (mPingState == 0) {                                                      //0000 : 07 16 00 9A 39 3A 01 40 2B 1B 11 39 3A 24 00 16 
      cl_Ping();                                                                //0010 : 1B 43 0D 00 00 16 
    }
    //07 16 00 9A 39 3A 01 40 2B 1B 11 39 3A 24 00 16 1B 43 0D 00 00 16 04 0B 47 
  }


  delegate OnPong(float aPing);


  protected native function cl2sv_Unstuck_CallStub();


  final native event cl2sv_Unstuck();


  final native function TickMovement(float aDeltaTime);


  function Unshift() {
    Game_PlayerPawn(Pawn).Appearance.sv_UnshiftAppearance();                    //0000 : 19 19 2E F0 47 5B 01 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 4B 07 00 00 16 
    //19 19 2E F0 47 5B 01 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 4B 07 00 00 16 04 0B 47 
    //
  }


  function Shift(int nr) {
    local Game_NPCPawn NPC;
    local export editinline NPC_Type Type;
    switch (nr) {                                                               //0000 : 05 04 00 98 45 1B 11 
      case 1 :                                                                  //0007 : 0A 4F 00 26 
        Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.AllTypes.NPC_Bear_Small",Class'NPC_Type',True));//000B : 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 60 E7 69 0F 1F 51 75 65 73 74 4E 50 43 73 5F 54 65 63 68 47 50 2E 41 6C 6C 54 79 70 65 73 2E 4E 50 43 5F 42 65 61 72 5F 53 6D 61 6C 6C 00 20 78 9C 5B 01 27 16 
        break;                                                                  //004C : 06 6A 01 
      case 2 :                                                                  //004F : 0A 8E 00 2C 02 
        Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.GhostlyRobert",Class'NPC_Type',True));//0054 : 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 60 E7 69 0F 1F 51 75 65 73 74 4E 50 43 73 5F 54 65 63 68 47 50 2E 47 68 6F 73 74 6C 79 52 6F 62 65 72 74 00 20 78 9C 5B 01 27 16 
        break;                                                                  //008B : 06 6A 01 
      case 3 :                                                                  //008E : 0A E2 00 2C 03 
        Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.AllTypes.NPC_Daevi_Female_Athletic",Class'NPC_Type',True));//0093 : 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 60 E7 69 0F 1F 51 75 65 73 74 4E 50 43 73 5F 54 65 63 68 47 50 2E 41 6C 6C 54 79 70 65 73 2E 4E 50 43 5F 44 61 65 76 69 5F 46 65 6D 61 6C 65 5F 41 74 68 6C 65 74 69 63 00 20 78 9C 5B 01 27 16 
        break;                                                                  //00DF : 06 6A 01 
      case 4 :                                                                  //00E2 : 0A 27 01 2C 04 
        Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.AllTypes.NPC_Hoppie",Class'NPC_Type',True));//00E7 : 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 60 E7 69 0F 1F 51 75 65 73 74 4E 50 43 73 5F 54 65 63 68 47 50 2E 41 6C 6C 54 79 70 65 73 2E 4E 50 43 5F 48 6F 70 70 69 65 00 20 78 9C 5B 01 27 16 
        break;                                                                  //0124 : 06 6A 01 
      case 0 :                                                                  //0127 : 0A 2B 01 25 
      default:                                                                  //012B : 0A FF FF 
        NPC = Game_NPCPawn(Input.cl_GetTargetPawn());                           //012E : 0F 00 88 46 1B 11 2E D0 32 5B 01 19 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 
        if (NPC == None) {                                                      //0148 : 07 53 01 72 00 88 46 1B 11 2A 16 
        }
        Type = NPC.NPCType;                                                     //0153 : 0F 00 10 46 1B 11 19 00 88 46 1B 11 05 00 04 01 00 47 1B 11 
        break;                                                                  //0167 : 06 6A 01 
    }
    if (Type != None && Type.Appearance != None) {                              //016A : 07 B0 01 82 77 00 10 46 1B 11 2A 16 18 12 00 77 19 00 10 46 1B 11 05 00 04 01 78 47 1B 11 2A 16 16 
      Game_PlayerPawn(Pawn).Appearance.sv_ShiftAppearance(Type);                //018B : 19 19 2E F0 47 5B 01 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 0B 00 04 1B 3C 07 00 00 00 10 46 1B 11 16 
    } else {                                                                    //01AD : 06 CD 01 
      Game_PlayerPawn(Pawn).Appearance.sv_UnshiftAppearance();                  //01B0 : 19 19 2E F0 47 5B 01 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 4B 07 00 00 16 
    }
    //05 04 00 98 45 1B 11 0A 4F 00 26 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 60 E7 69 0F 1F 51 75 65 73 
    //74 4E 50 43 73 5F 54 65 63 68 47 50 2E 41 6C 6C 54 79 70 65 73 2E 4E 50 43 5F 42 65 61 72 5F 53 
    //6D 61 6C 6C 00 20 78 9C 5B 01 27 16 06 6A 01 0A 8E 00 2C 02 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 
    //60 E7 69 0F 1F 51 75 65 73 74 4E 50 43 73 5F 54 65 63 68 47 50 2E 47 68 6F 73 74 6C 79 52 6F 62 
    //65 72 74 00 20 78 9C 5B 01 27 16 06 6A 01 0A E2 00 2C 03 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 60 
    //E7 69 0F 1F 51 75 65 73 74 4E 50 43 73 5F 54 65 63 68 47 50 2E 41 6C 6C 54 79 70 65 73 2E 4E 50 
    //43 5F 44 61 65 76 69 5F 46 65 6D 61 6C 65 5F 41 74 68 6C 65 74 69 63 00 20 78 9C 5B 01 27 16 06 
    //6A 01 0A 27 01 2C 04 0F 00 10 46 1B 11 2E 78 9C 5B 01 1C 60 E7 69 0F 1F 51 75 65 73 74 4E 50 43 
    //73 5F 54 65 63 68 47 50 2E 41 6C 6C 54 79 70 65 73 2E 4E 50 43 5F 48 6F 70 70 69 65 00 20 78 9C 
    //5B 01 27 16 06 6A 01 0A 2B 01 25 0A FF FF 0F 00 88 46 1B 11 2E D0 32 5B 01 19 01 B0 14 37 0F 06 
    //00 04 1B 39 05 00 00 16 07 53 01 72 00 88 46 1B 11 2A 16 0F 00 10 46 1B 11 19 00 88 46 1B 11 05 
    //00 04 01 00 47 1B 11 06 6A 01 07 B0 01 82 77 00 10 46 1B 11 2A 16 18 12 00 77 19 00 10 46 1B 11 
    //05 00 04 01 78 47 1B 11 2A 16 16 19 19 2E F0 47 5B 01 01 88 83 6C 0F 05 00 04 01 A8 83 18 11 0B 
    //00 04 1B 3C 07 00 00 00 10 46 1B 11 16 06 CD 01 19 19 2E F0 47 5B 01 01 88 83 6C 0F 05 00 04 01 
    //A8 83 18 11 06 00 04 1B 4B 07 00 00 16 04 0B 47 
  }


  delegate OnSitDown(bool aSitDown);


  native function bool ReachedTarget();


  native function bool UpdateMovement();


  protected native function sv2cl_UpdateNetState_CallStub();


  protected event sv2cl_UpdateNetState(byte aNetState) {
    mNetState = aNetState;                                                      //0000 : 0F 01 18 8F 1B 11 00 20 8E 1B 11 
    if (mCurrentState != mNetState && mNetState != 0) {                         //000B : 07 38 00 82 9B 39 3A 01 58 E6 1A 11 39 3A 01 18 8F 1B 11 16 18 0B 00 9B 39 3A 01 18 8F 1B 11 25 16 16 
      SBGotoState(mNetState);                                                   //002D : 1B 11 06 00 00 01 18 8F 1B 11 16 
    }
    //0F 01 18 8F 1B 11 00 20 8E 1B 11 07 38 00 82 9B 39 3A 01 58 E6 1A 11 39 3A 01 18 8F 1B 11 16 18 
    //0B 00 9B 39 3A 01 18 8F 1B 11 25 16 16 1B 11 06 00 00 01 18 8F 1B 11 16 04 0B 47 
  }


  event SBGotoState(byte aState) {
    if (aState != mCurrentState) {                                              //0000 : 07 BB 00 9B 39 3A 00 90 8F 1B 11 39 3A 01 58 E6 1A 11 16 
      switch (aState) {                                                         //0013 : 05 01 00 90 8F 1B 11 
        case 1 :                                                                //001A : 0A 34 00 24 01 
          mCurrentState = aState;                                               //001F : 0F 01 58 E6 1A 11 00 90 8F 1B 11 
          GotoState('PawnAlive');                                               //002A : 71 21 CB 0C 00 00 16 
          break;                                                                //0031 : 06 93 00 
        case 2 :                                                                //0034 : 0A 4E 00 24 02 
          mCurrentState = aState;                                               //0039 : 0F 01 58 E6 1A 11 00 90 8F 1B 11 
          GotoState('PawnDead');                                                //0044 : 71 21 CD 0C 00 00 16 
          break;                                                                //004B : 06 93 00 
        case 8 :                                                                //004E : 0A 68 00 24 08 
          mCurrentState = aState;                                               //0053 : 0F 01 58 E6 1A 11 00 90 8F 1B 11 
          GotoState('MoveState');                                               //005E : 71 21 53 0D 00 00 16 
          break;                                                                //0065 : 06 93 00 
        case 9 :                                                                //0068 : 0A 82 00 24 09 
          mCurrentState = aState;                                               //006D : 0F 01 58 E6 1A 11 00 90 8F 1B 11 
          GotoState('RotatePawn');                                              //0078 : 71 21 E8 0E 00 00 16 
          break;                                                                //007F : 06 93 00 
        default:                                                                //0082 : 0A FF FF 
          Super.SBGotoState(aState);                                            //0085 : 1C 50 EC 1A 11 00 90 8F 1B 11 16 
          break;                                                                //0090 : 06 93 00 
      }
      if (IsServer()) {                                                         //0093 : 07 BB 00 1B FF 0B 00 00 16 
        mNetState = mCurrentState;                                              //009C : 0F 01 18 8F 1B 11 01 58 E6 1A 11 
        if (ControllerInitialized) {                                            //00A7 : 07 BB 00 2D 01 00 B9 1A 11 
          sv2cl_UpdateNetState_CallStub(mNetState);                             //00B0 : 1B E2 0E 00 00 01 18 8F 1B 11 16 
        }
      }
    }
    //07 BB 00 9B 39 3A 00 90 8F 1B 11 39 3A 01 58 E6 1A 11 16 05 01 00 90 8F 1B 11 0A 34 00 24 01 0F 
    //01 58 E6 1A 11 00 90 8F 1B 11 71 21 CB 0C 00 00 16 06 93 00 0A 4E 00 24 02 0F 01 58 E6 1A 11 00 
    //90 8F 1B 11 71 21 CD 0C 00 00 16 06 93 00 0A 68 00 24 08 0F 01 58 E6 1A 11 00 90 8F 1B 11 71 21 
    //53 0D 00 00 16 06 93 00 0A 82 00 24 09 0F 01 58 E6 1A 11 00 90 8F 1B 11 71 21 E8 0E 00 00 16 06 
    //93 00 0A FF FF 1C 50 EC 1A 11 00 90 8F 1B 11 16 06 93 00 07 BB 00 1B FF 0B 00 00 16 0F 01 18 8F 
    //1B 11 01 58 E6 1A 11 07 BB 00 2D 01 00 B9 1A 11 1B E2 0E 00 00 01 18 8F 1B 11 16 04 0B 47 
  }


  function sv_Resurrect() {
    //04 0B 47 
  }


  protected native function sv2cl_UpdateServerTime_CallStub();


  protected event sv2cl_UpdateServerTime(float aServerTime) {
    ServerTime = aServerTime;                                                   //0000 : 0F 01 10 93 1B 11 00 98 92 1B 11 
    //0F 01 10 93 1B 11 00 98 92 1B 11 04 0B 47 
  }


  event cl_OnTravelFailed(string Reason) {
    GUI.OnTravelFailed(Reason);                                                 //0000 : 19 01 40 8A 1B 11 0B 00 00 1B 12 0E 00 00 00 38 94 1B 11 16 
    //19 01 40 8A 1B 11 0B 00 00 1B 12 0E 00 00 00 38 94 1B 11 16 04 0B 47 
  }


  protected native function cl2sv_NoteTargetReached_CallStub();


  event cl2sv_NoteTargetReached() {
    if (!mReachedTarget) {                                                      //0000 : 07 1B 00 81 2D 01 88 11 1B 11 16 
      mReachedTarget = True;                                                    //000B : 14 2D 01 88 11 1B 11 27 
      SBGotoState(1);                                                           //0013 : 1B 11 06 00 00 24 01 16 
    }
    //07 1B 00 81 2D 01 88 11 1B 11 16 14 2D 01 88 11 1B 11 27 1B 11 06 00 00 24 01 16 04 0B 47 
  }


  native function sv_OnSetViewTarget();


  private native function sv_OnSceneEnded();


  private native function sv_OnSceneStarted();


  protected native function cl2sv_OverrideView_CallStub();


  event cl2sv_OverrideView(bool aOverrideFlag) {
    if (Input != None) {                                                        //0000 : 07 21 00 77 01 B0 14 37 0F 2A 16 
      Input.mViewOverrideReceived = aOverrideFlag;                              //000B : 14 19 01 B0 14 37 0F 06 00 04 2D 01 A8 9B 1B 11 2D 00 B0 9A 1B 11 
    }
    if (aOverrideFlag) {                                                        //0021 : 07 33 00 2D 00 B0 9A 1B 11 
      sv_OnSceneStarted();                                                      //002A : 1B DD 0E 00 00 16 
    } else {                                                                    //0030 : 06 39 00 
      sv_OnSceneEnded();                                                        //0033 : 1B DE 0E 00 00 16 
    }
    //07 21 00 77 01 B0 14 37 0F 2A 16 14 19 01 B0 14 37 0F 06 00 04 2D 01 A8 9B 1B 11 2D 00 B0 9A 1B 
    //11 07 33 00 2D 00 B0 9A 1B 11 1B DD 0E 00 00 16 06 39 00 1B DE 0E 00 00 16 04 0B 47 
  }


  event cl_OnSceneEnded() {
    Super.cl_OnSceneEnded();                                                    //0000 : 1C 00 17 72 0F 16 
    cl2sv_OverrideView_CallStub(False);                                         //0006 : 1B 46 0D 00 00 28 16 
    //1C 00 17 72 0F 16 1B 46 0D 00 00 28 16 04 0B 47 
  }


  event cl_OnSceneStarted() {
    Super.cl_OnSceneStarted();                                                  //0000 : 1C 88 18 72 0F 16 
    cl2sv_OverrideView_CallStub(True);                                          //0006 : 1B 46 0D 00 00 27 16 
    //1C 88 18 72 0F 16 1B 46 0D 00 00 27 16 04 0B 47 
  }


  event cl_OnPlayerTick(float DeltaTime) {
    Super.cl_OnPlayerTick(DeltaTime);                                           //0000 : 1C 48 1A 72 0F 00 08 4C 1B 11 16 
    PlayerInput.PlayerInput(DeltaTime);                                         //000B : 19 01 30 20 71 0F 0B 00 00 1B A3 00 00 00 00 08 4C 1B 11 16 
    Input.cl_OnPlayerTick(DeltaTime);                                           //001F : 19 01 B0 14 37 0F 0B 00 00 1B 40 05 00 00 00 08 4C 1B 11 16 
    Camera.cl_Tick(DeltaTime);                                                  //0033 : 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 08 4C 1B 11 16 
    TickMovement(DeltaTime);                                                    //0047 : 1C 08 3E 1B 11 00 08 4C 1B 11 16 
    //1C 48 1A 72 0F 00 08 4C 1B 11 16 19 01 30 20 71 0F 0B 00 00 1B A3 00 00 00 00 08 4C 1B 11 16 19 
    //01 B0 14 37 0F 0B 00 00 1B 40 05 00 00 00 08 4C 1B 11 16 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 
    //00 00 08 4C 1B 11 16 1C 08 3E 1B 11 00 08 4C 1B 11 16 04 0B 47 
  }


  event cl_OnTick(float DeltaTime) {
    ServerTime += DeltaTime;                                                    //0000 : B8 01 10 93 1B 11 00 00 9E 1B 11 16 
    cl_HandlePing();                                                            //000C : 1B ED 0E 00 00 16 
    //B8 01 10 93 1B 11 00 00 9E 1B 11 16 1B ED 0E 00 00 16 04 0B 47 
  }


  event cl_OnShutdown() {
    if (Input != None) {                                                        //0000 : 07 1A 00 77 01 B0 14 37 0F 2A 16 
      Input.cl_OnShutdown();                                                    //000B : 19 01 B0 14 37 0F 06 00 00 1B 66 07 00 00 16 
    }
    if (GUI != None) {                                                          //001A : 07 34 00 77 01 40 8A 1B 11 2A 16 
      GUI.cl_OnShutdown();                                                      //0025 : 19 01 40 8A 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    if (Chat != None) {                                                         //0034 : 07 4E 00 77 01 E8 A0 1B 11 2A 16 
      Chat.cl_OnShutdown();                                                     //003F : 19 01 E8 A0 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    if (Travel != None) {                                                       //004E : 07 68 00 77 01 60 A1 1B 11 2A 16 
      Travel.cl_OnShutdown();                                                   //0059 : 19 01 60 A1 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    if (Camera != None) {                                                       //0068 : 07 82 00 77 01 B0 6A 18 11 2A 16 
      Camera.cl_OnShutdown();                                                   //0073 : 19 01 B0 6A 18 11 06 00 00 1B 66 07 00 00 16 
    }
    if (Mail != None) {                                                         //0082 : 07 9C 00 77 01 D8 A1 1B 11 2A 16 
      Mail.cl_OnShutdown();                                                     //008D : 19 01 D8 A1 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    if (GroupingFriends != None) {                                              //009C : 07 B6 00 77 01 50 A2 1B 11 2A 16 
      GroupingFriends.cl_OnShutdown();                                          //00A7 : 19 01 50 A2 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    if (GroupingTeams != None) {                                                //00B6 : 07 D0 00 77 01 48 C2 18 11 2A 16 
      GroupingTeams.cl_OnShutdown();                                            //00C1 : 19 01 48 C2 18 11 06 00 00 1B 66 07 00 00 16 
    }
    if (GroupingGuilds != None) {                                               //00D0 : 07 EA 00 77 01 C8 A2 1B 11 2A 16 
      GroupingGuilds.cl_OnShutdown();                                           //00DB : 19 01 C8 A2 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    Super.cl_OnShutdown();                                                      //00EA : 1C 40 03 1B 11 16 
    //07 1A 00 77 01 B0 14 37 0F 2A 16 19 01 B0 14 37 0F 06 00 00 1B 66 07 00 00 16 07 34 00 77 01 40 
    //8A 1B 11 2A 16 19 01 40 8A 1B 11 06 00 00 1B 66 07 00 00 16 07 4E 00 77 01 E8 A0 1B 11 2A 16 19 
    //01 E8 A0 1B 11 06 00 00 1B 66 07 00 00 16 07 68 00 77 01 60 A1 1B 11 2A 16 19 01 60 A1 1B 11 06 
    //00 00 1B 66 07 00 00 16 07 82 00 77 01 B0 6A 18 11 2A 16 19 01 B0 6A 18 11 06 00 00 1B 66 07 00 
    //00 16 07 9C 00 77 01 D8 A1 1B 11 2A 16 19 01 D8 A1 1B 11 06 00 00 1B 66 07 00 00 16 07 B6 00 77 
    //01 50 A2 1B 11 2A 16 19 01 50 A2 1B 11 06 00 00 1B 66 07 00 00 16 07 D0 00 77 01 48 C2 18 11 2A 
    //16 19 01 48 C2 18 11 06 00 00 1B 66 07 00 00 16 07 EA 00 77 01 C8 A2 1B 11 2A 16 19 01 C8 A2 1B 
    //11 06 00 00 1B 66 07 00 00 16 1C 40 03 1B 11 16 04 0B 47 
  }


  event cl_OnInit() {
    if (GroupingTeams != None) {                                                //0000 : 07 1A 00 77 01 48 C2 18 11 2A 16 
      GroupingTeams.Init();                                                     //000B : 19 01 48 C2 18 11 06 00 00 1B FA 02 00 00 16 
    }
    if (GroupingGuilds != None) {                                               //001A : 07 34 00 77 01 C8 A2 1B 11 2A 16 
      GroupingGuilds.Init();                                                    //0025 : 19 01 C8 A2 1B 11 06 00 00 1B FA 02 00 00 16 
    }
    if (Input != None) {                                                        //0034 : 07 4E 00 77 01 B0 14 37 0F 2A 16 
      Input.cl_OnInit();                                                        //003F : 19 01 B0 14 37 0F 06 00 00 1B 3F 05 00 00 16 
    }
    if (GUI != None) {                                                          //004E : 07 68 00 77 01 40 8A 1B 11 2A 16 
      GUI.cl_OnInit();                                                          //0059 : 19 01 40 8A 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (Chat != None) {                                                         //0068 : 07 82 00 77 01 E8 A0 1B 11 2A 16 
      Chat.cl_OnInit();                                                         //0073 : 19 01 E8 A0 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (Travel != None) {                                                       //0082 : 07 9C 00 77 01 60 A1 1B 11 2A 16 
      Travel.cl_OnInit();                                                       //008D : 19 01 60 A1 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (Camera != None) {                                                       //009C : 07 B6 00 77 01 B0 6A 18 11 2A 16 
      Camera.cl_OnInit();                                                       //00A7 : 19 01 B0 6A 18 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (Mail != None) {                                                         //00B6 : 07 D0 00 77 01 D8 A1 1B 11 2A 16 
      Mail.cl_OnInit();                                                         //00C1 : 19 01 D8 A1 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (GroupingFriends != None) {                                              //00D0 : 07 EA 00 77 01 50 A2 1B 11 2A 16 
      GroupingFriends.cl_OnInit();                                              //00DB : 19 01 50 A2 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (GroupingTeams != None) {                                                //00EA : 07 04 01 77 01 48 C2 18 11 2A 16 
      GroupingTeams.cl_OnInit();                                                //00F5 : 19 01 48 C2 18 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (GroupingGuilds != None) {                                               //0104 : 07 1E 01 77 01 C8 A2 1B 11 2A 16 
      GroupingGuilds.cl_OnInit();                                               //010F : 19 01 C8 A2 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    Super.cl_OnInit();                                                          //011E : 1C 88 05 1B 11 16 
    SetViewTarget(Pawn);                                                        //0124 : 1C C8 73 71 0F 01 88 83 6C 0F 16 
    //07 1A 00 77 01 48 C2 18 11 2A 16 19 01 48 C2 18 11 06 00 00 1B FA 02 00 00 16 07 34 00 77 01 C8 
    //A2 1B 11 2A 16 19 01 C8 A2 1B 11 06 00 00 1B FA 02 00 00 16 07 4E 00 77 01 B0 14 37 0F 2A 16 19 
    //01 B0 14 37 0F 06 00 00 1B 3F 05 00 00 16 07 68 00 77 01 40 8A 1B 11 2A 16 19 01 40 8A 1B 11 06 
    //00 00 1B 3F 05 00 00 16 07 82 00 77 01 E8 A0 1B 11 2A 16 19 01 E8 A0 1B 11 06 00 00 1B 3F 05 00 
    //00 16 07 9C 00 77 01 60 A1 1B 11 2A 16 19 01 60 A1 1B 11 06 00 00 1B 3F 05 00 00 16 07 B6 00 77 
    //01 B0 6A 18 11 2A 16 19 01 B0 6A 18 11 06 00 00 1B 3F 05 00 00 16 07 D0 00 77 01 D8 A1 1B 11 2A 
    //16 19 01 D8 A1 1B 11 06 00 00 1B 3F 05 00 00 16 07 EA 00 77 01 50 A2 1B 11 2A 16 19 01 50 A2 1B 
    //11 06 00 00 1B 3F 05 00 00 16 07 04 01 77 01 48 C2 18 11 2A 16 19 01 48 C2 18 11 06 00 00 1B 3F 
    //05 00 00 16 07 1E 01 77 01 C8 A2 1B 11 2A 16 19 01 C8 A2 1B 11 06 00 00 1B 3F 05 00 00 16 1C 88 
    //05 1B 11 16 1C C8 73 71 0F 01 88 83 6C 0F 16 04 0B 47 
  }


  event cl_OnBaseline() {
    Super.cl_OnBaseline();                                                      //0000 : 1C 18 B6 1A 11 16 
    SBAnimatedPawn(Pawn).ClearPawnAnims();                                      //0006 : 19 2E D0 B4 D6 00 01 88 83 6C 0F 06 00 00 1B A3 0C 00 00 16 
    //1C 18 B6 1A 11 16 19 2E D0 B4 D6 00 01 88 83 6C 0F 06 00 00 1B A3 0C 00 00 16 04 0B 47 
  }


  event sv_OnShutdown() {
    if (Input != None) {                                                        //0000 : 07 1A 00 77 01 B0 14 37 0F 2A 16 
      Input.sv_OnShutdown();                                                    //000B : 19 01 B0 14 37 0F 06 00 00 1C 40 C6 19 11 16 
    }
    if (Camera != None) {                                                       //001A : 07 34 00 77 01 B0 6A 18 11 2A 16 
      Camera.sv_OnShutdown();                                                   //0025 : 19 01 B0 6A 18 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (GUI != None) {                                                          //0034 : 07 4E 00 77 01 40 8A 1B 11 2A 16 
      GUI.sv_OnShutdown();                                                      //003F : 19 01 40 8A 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (Chat != None) {                                                         //004E : 07 68 00 77 01 E8 A0 1B 11 2A 16 
      Chat.sv_OnShutdown();                                                     //0059 : 19 01 E8 A0 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (Travel != None) {                                                       //0068 : 07 82 00 77 01 60 A1 1B 11 2A 16 
      Travel.sv_OnShutdown();                                                   //0073 : 19 01 60 A1 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (Mail != None) {                                                         //0082 : 07 9C 00 77 01 D8 A1 1B 11 2A 16 
      Mail.sv_OnShutdown();                                                     //008D : 19 01 D8 A1 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (GroupingFriends != None) {                                              //009C : 07 B6 00 77 01 50 A2 1B 11 2A 16 
      GroupingFriends.sv_OnShutdown();                                          //00A7 : 19 01 50 A2 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (GroupingTeams != None) {                                                //00B6 : 07 D0 00 77 01 48 C2 18 11 2A 16 
      GroupingTeams.sv_OnShutdown();                                            //00C1 : 19 01 48 C2 18 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (GroupingGuilds != None) {                                               //00D0 : 07 EA 00 77 01 C8 A2 1B 11 2A 16 
      GroupingGuilds.sv_OnShutdown();                                           //00DB : 19 01 C8 A2 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    Super.sv_OnShutdown();                                                      //00EA : 1C 90 09 1B 11 16 
    //07 1A 00 77 01 B0 14 37 0F 2A 16 19 01 B0 14 37 0F 06 00 00 1C 40 C6 19 11 16 07 34 00 77 01 B0 
    //6A 18 11 2A 16 19 01 B0 6A 18 11 06 00 00 1C 40 C6 19 11 16 07 4E 00 77 01 40 8A 1B 11 2A 16 19 
    //01 40 8A 1B 11 06 00 00 1C 40 C6 19 11 16 07 68 00 77 01 E8 A0 1B 11 2A 16 19 01 E8 A0 1B 11 06 
    //00 00 1C 40 C6 19 11 16 07 82 00 77 01 60 A1 1B 11 2A 16 19 01 60 A1 1B 11 06 00 00 1C 40 C6 19 
    //11 16 07 9C 00 77 01 D8 A1 1B 11 2A 16 19 01 D8 A1 1B 11 06 00 00 1C 40 C6 19 11 16 07 B6 00 77 
    //01 50 A2 1B 11 2A 16 19 01 50 A2 1B 11 06 00 00 1C 40 C6 19 11 16 07 D0 00 77 01 48 C2 18 11 2A 
    //16 19 01 48 C2 18 11 06 00 00 1C 40 C6 19 11 16 07 EA 00 77 01 C8 A2 1B 11 2A 16 19 01 C8 A2 1B 
    //11 06 00 00 1C 40 C6 19 11 16 1C 90 09 1B 11 16 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C 20 0B 1B 11 16 
    if (InputClass != None) {                                                   //0006 : 07 20 00 77 01 A8 AA 1B 11 2A 16 
      Input = new (self) InputClass;                                            //0011 : 0F 01 B0 14 37 0F 11 17 0B 0B 01 A8 AA 1B 11 
    }
    if (CameraClass != None) {                                                  //0020 : 07 3A 00 77 01 28 AB 1B 11 2A 16 
      Camera = new (self) CameraClass;                                          //002B : 0F 01 B0 6A 18 11 11 17 0B 0B 01 28 AB 1B 11 
    }
    if (GUIClass != None) {                                                     //003A : 07 54 00 77 01 A8 AB 1B 11 2A 16 
      GUI = new (self) GUIClass;                                                //0045 : 0F 01 40 8A 1B 11 11 17 0B 0B 01 A8 AB 1B 11 
    }
    if (ChatClass != None) {                                                    //0054 : 07 6E 00 77 01 28 AC 1B 11 2A 16 
      Chat = new (self) ChatClass;                                              //005F : 0F 01 E8 A0 1B 11 11 17 0B 0B 01 28 AC 1B 11 
    }
    if (TravelClass != None) {                                                  //006E : 07 88 00 77 01 A8 AC 1B 11 2A 16 
      Travel = new (self) TravelClass;                                          //0079 : 0F 01 60 A1 1B 11 11 17 0B 0B 01 A8 AC 1B 11 
    }
    if (MailClass != None) {                                                    //0088 : 07 A2 00 77 01 28 AD 1B 11 2A 16 
      Mail = new (self) MailClass;                                              //0093 : 0F 01 D8 A1 1B 11 11 17 0B 0B 01 28 AD 1B 11 
    }
    if (mGroupingFriendsClass != None) {                                        //00A2 : 07 BC 00 77 01 A8 AD 1B 11 2A 16 
      GroupingFriends = new (self) mGroupingFriendsClass;                       //00AD : 0F 01 50 A2 1B 11 11 17 0B 0B 01 A8 AD 1B 11 
    }
    if (mGroupingTeamsClass != None) {                                          //00BC : 07 D6 00 77 01 28 AE 1B 11 2A 16 
      GroupingTeams = new (self) mGroupingTeamsClass;                           //00C7 : 0F 01 48 C2 18 11 11 17 0B 0B 01 28 AE 1B 11 
    }
    if (mGroupingGuildsClass != None) {                                         //00D6 : 07 F0 00 77 01 A8 AE 1B 11 2A 16 
      GroupingGuilds = new (self) mGroupingGuildsClass;                         //00E1 : 0F 01 C8 A2 1B 11 11 17 0B 0B 01 A8 AE 1B 11 
    }
    //1C 20 0B 1B 11 16 07 20 00 77 01 A8 AA 1B 11 2A 16 0F 01 B0 14 37 0F 11 17 0B 0B 01 A8 AA 1B 11 
    //07 3A 00 77 01 28 AB 1B 11 2A 16 0F 01 B0 6A 18 11 11 17 0B 0B 01 28 AB 1B 11 07 54 00 77 01 A8 
    //AB 1B 11 2A 16 0F 01 40 8A 1B 11 11 17 0B 0B 01 A8 AB 1B 11 07 6E 00 77 01 28 AC 1B 11 2A 16 0F 
    //01 E8 A0 1B 11 11 17 0B 0B 01 28 AC 1B 11 07 88 00 77 01 A8 AC 1B 11 2A 16 0F 01 60 A1 1B 11 11 
    //17 0B 0B 01 A8 AC 1B 11 07 A2 00 77 01 28 AD 1B 11 2A 16 0F 01 D8 A1 1B 11 11 17 0B 0B 01 28 AD 
    //1B 11 07 BC 00 77 01 A8 AD 1B 11 2A 16 0F 01 50 A2 1B 11 11 17 0B 0B 01 A8 AD 1B 11 07 D6 00 77 
    //01 28 AE 1B 11 2A 16 0F 01 48 C2 18 11 11 17 0B 0B 01 28 AE 1B 11 07 F0 00 77 01 A8 AE 1B 11 2A 
    //16 0F 01 C8 A2 1B 11 11 17 0B 0B 01 A8 AE 1B 11 04 0B 47 
  }


  state PawnSitting {

      function EndState() {
        OnSitDown(False);                                                       //0000 : 43 E0 4A 1B 11 F5 05 00 00 28 16 
        Super.EndState();                                                       //000B : 1C E8 D8 1A 11 16 
        //43 E0 4A 1B 11 F5 05 00 00 28 16 1C E8 D8 1A 11 16 04 0B 47 
      }


      event cl_OnPlayerTick(float aDeltaTime) {
        local Game_PlayerPawn gpp;
        gpp = Game_PlayerPawn(Pawn);                                            //0000 : 0F 00 60 54 1B 11 2E F0 47 5B 01 01 88 83 6C 0F 
        PlayerInput.PlayerInput(aDeltaTime);                                    //0010 : 19 01 30 20 71 0F 0B 00 00 1B A3 00 00 00 00 D0 4D 1B 11 16 
        Input.cl_OnPlayerTick(aDeltaTime);                                      //0024 : 19 01 B0 14 37 0F 0B 00 00 1B 40 05 00 00 00 D0 4D 1B 11 16 
        if (Camera != None) {                                                   //0038 : 07 57 00 77 01 B0 6A 18 11 2A 16 
          Camera.cl_Tick(aDeltaTime);                                           //0043 : 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 D0 4D 1B 11 16 
        }
        TickMovement(aDeltaTime);                                               //0057 : 1C 08 3E 1B 11 00 D0 4D 1B 11 16 
        //0F 00 60 54 1B 11 2E F0 47 5B 01 01 88 83 6C 0F 19 01 30 20 71 0F 0B 00 00 1B A3 00 00 00 00 D0 
        //4D 1B 11 16 19 01 B0 14 37 0F 0B 00 00 1B 40 05 00 00 00 D0 4D 1B 11 16 07 57 00 77 01 B0 6A 18 
        //11 2A 16 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 D0 4D 1B 11 16 1C 08 3E 1B 11 00 D0 4D 1B 
        //11 16 04 0B 47 
      }


      function BeginState() {
        local Game_PlayerPawn gpp;
        gpp = Game_PlayerPawn(Pawn);                                            //0000 : 0F 00 D8 54 1B 11 2E F0 47 5B 01 01 88 83 6C 0F 
        if (gpp != None) {                                                      //0010 : 07 67 00 77 00 D8 54 1B 11 2A 16 
          if (!IsServer() && gpp.Physics != gpp.mNetPhysics) {                  //001B : 07 67 00 82 81 1B FF 0B 00 00 16 16 18 23 00 9B 39 3A 19 00 D8 54 1B 11 05 00 01 01 C0 93 6C 0F 39 3A 19 00 D8 54 1B 11 05 00 01 01 28 56 1B 11 16 16 
            gpp.SetPhysics(gpp.mNetPhysics);                                    //004D : 19 00 D8 54 1B 11 11 00 00 6F 82 19 00 D8 54 1B 11 05 00 01 01 28 56 1B 11 16 
          }
        }
        Super.BeginState();                                                     //0067 : 1C C8 D9 1A 11 16 
        OnSitDown(True);                                                        //006D : 43 E0 4A 1B 11 F5 05 00 00 27 16 
        //0F 00 D8 54 1B 11 2E F0 47 5B 01 01 88 83 6C 0F 07 67 00 77 00 D8 54 1B 11 2A 16 07 67 00 82 81 
        //1B FF 0B 00 00 16 16 18 23 00 9B 39 3A 19 00 D8 54 1B 11 05 00 01 01 C0 93 6C 0F 39 3A 19 00 D8 
        //54 1B 11 05 00 01 01 28 56 1B 11 16 16 19 00 D8 54 1B 11 11 00 00 6F 82 19 00 D8 54 1B 11 05 00 
        //01 01 28 56 1B 11 16 1C C8 D9 1A 11 16 43 E0 4A 1B 11 F5 05 00 00 27 16 04 0B 47 
      }


    //08 47 

  }


  state RotatePawn {

      exec function Jump(optional float JumpModifier) {
        cl2sv_ForwardCancelState_CallStub("RotatePawn");                        //0000 : 1B 48 0D 00 00 1F 52 6F 74 61 74 65 50 61 77 6E 00 16 
        //1B 48 0D 00 00 1F 52 6F 74 61 74 65 50 61 77 6E 00 16 04 0B 47 
      }


      event cl_OnPlayerTick(float DeltaTime) {
        local Game_Pawn gamePawn;
        PlayerInput.PlayerInput(DeltaTime);                                     //0000 : 19 01 30 20 71 0F 0B 00 00 1B A3 00 00 00 00 50 5F 1B 11 16 
        Input.cl_OnPlayerTick(DeltaTime);                                       //0014 : 19 01 B0 14 37 0F 0B 00 00 1B 40 05 00 00 00 50 5F 1B 11 16 
        Camera.cl_Tick(DeltaTime);                                              //0028 : 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 50 5F 1B 11 16 
        gamePawn = Game_Pawn(Pawn);                                             //003C : 0F 00 A0 60 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gamePawn != None) {                                                 //004C : 07 7A 00 77 00 A0 60 1B 11 2A 16 
          mStateTimer += DeltaTime;                                             //0057 : B8 01 D8 DC 1A 11 00 50 5F 1B 11 16 
          RotateToFace();                                                       //0063 : 1C 00 C5 1A 11 16 
          if (FacingTarget()) {                                                 //0069 : 07 7A 00 1B A4 0D 00 00 16 
            SBGotoState(1);                                                     //0072 : 1B 11 06 00 00 24 01 16 
          }
        }
        //19 01 30 20 71 0F 0B 00 00 1B A3 00 00 00 00 50 5F 1B 11 16 19 01 B0 14 37 0F 0B 00 00 1B 40 05 
        //00 00 00 50 5F 1B 11 16 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 50 5F 1B 11 16 0F 00 A0 60 
        //1B 11 2E 18 38 5B 01 01 88 83 6C 0F 07 7A 00 77 00 A0 60 1B 11 2A 16 B8 01 D8 DC 1A 11 00 50 5F 
        //1B 11 16 1C 00 C5 1A 11 16 07 7A 00 1B A4 0D 00 00 16 1B 11 06 00 00 24 01 16 04 0B 47 
      }


      function EndState() {
        bRotateToDesired = False;                                               //0000 : 14 2D 01 E8 E2 6E 0F 28 
        //14 2D 01 E8 E2 6E 0F 28 04 0B 47 
      }


      function BeginState() {
        mStateTimer = 0.00000000;                                               //0000 : 0F 01 D8 DC 1A 11 1E 00 00 00 00 
        bRotateToDesired = True;                                                //000B : 14 2D 01 E8 E2 6E 0F 27 
        //0F 01 D8 DC 1A 11 1E 00 00 00 00 14 2D 01 E8 E2 6E 0F 27 04 0B 47 
      }


    //08 47 

  }


  state MoveState {

      exec function Jump(optional float JumpModifier) {
        cl2sv_ForwardCancelState_CallStub("MoveState");                         //0000 : 1B 48 0D 00 00 1F 4D 6F 76 65 53 74 61 74 65 00 16 
        //1B 48 0D 00 00 1F 4D 6F 76 65 53 74 61 74 65 00 16 04 0B 47 
      }


      function CalculateMovementSpeed() {
        local Game_Pawn gamePawn;
        gamePawn = Game_Pawn(Pawn);                                             //0000 : 0F 00 40 70 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gamePawn != None) {                                                 //0010 : 07 9F 00 77 00 40 70 1B 11 2A 16 
          mMoveSpeed = 160.00000000;                                            //001B : 0F 01 10 11 1B 11 1E 00 00 20 43 
          if (mMaxTimeToMove > 0.00000000) {                                    //0026 : 07 5C 00 B1 01 48 58 18 11 1E 00 00 00 00 16 
            mMoveSpeed = VSize(gamePawn.Location - mTargetDestination) / mMaxTimeToMove;//0035 : 0F 01 10 11 1B 11 AC E1 D8 19 00 40 70 1B 11 05 00 0C 01 30 81 6C 0F 01 E0 56 18 11 16 16 01 48 58 18 11 16 
          } else {                                                              //0059 : 06 9F 00 
            if (gamePawn.CharacterStats != None) {                              //005C : 07 9F 00 77 19 00 40 70 1B 11 05 00 04 01 08 43 34 0F 2A 16 
              mMoveSpeed = gamePawn.CharacterStats.mMovementSpeed * gamePawn.GroundSpeedModifier;//0070 : 0F 01 10 11 1B 11 AB 39 3F 19 19 00 40 70 1B 11 05 00 04 01 08 43 34 0F 05 00 04 01 B8 70 1B 11 19 00 40 70 1B 11 05 00 04 01 30 02 35 0F 16 
            }
          }
        }
        //0F 00 40 70 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 07 9F 00 77 00 40 70 1B 11 2A 16 0F 01 10 11 1B 
        //11 1E 00 00 20 43 07 5C 00 B1 01 48 58 18 11 1E 00 00 00 00 16 0F 01 10 11 1B 11 AC E1 D8 19 00 
        //40 70 1B 11 05 00 0C 01 30 81 6C 0F 01 E0 56 18 11 16 16 01 48 58 18 11 16 06 9F 00 07 9F 00 77 
        //19 00 40 70 1B 11 05 00 04 01 08 43 34 0F 2A 16 0F 01 10 11 1B 11 AB 39 3F 19 19 00 40 70 1B 11 
        //05 00 04 01 08 43 34 0F 05 00 04 01 B8 70 1B 11 19 00 40 70 1B 11 05 00 04 01 30 02 35 0F 16 04 
        //0B 47 
      }


      function bool UpdatePawnMovement(float DeltaTime) {
        local Game_Pawn gamePawn;
        gamePawn = Game_Pawn(Pawn);                                             //0000 : 0F 00 48 73 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gamePawn != None) {                                                 //0010 : 07 8D 00 77 00 48 73 1B 11 2A 16 
          if (mReachedTarget) {                                                 //001B : 07 3A 00 2D 01 88 11 1B 11 
            gamePawn.GroundSpeed = 0.00000000;                                  //0024 : 0F 19 00 48 73 1B 11 05 00 04 01 18 A9 76 0F 1E 00 00 00 00 
            return True;                                                        //0038 : 04 27 
          }
          if (mMaxTimeToMove > 0.00000000) {                                    //003A : 07 6E 00 B1 01 48 58 18 11 1E 00 00 00 00 16 
            mStateTimer -= DeltaTime;                                           //0049 : B9 01 D8 DC 1A 11 00 E0 71 1B 11 16 
            if (mStateTimer <= 0.00000000) {                                    //0055 : 07 6E 00 B2 01 D8 DC 1A 11 1E 00 00 00 00 16 
              mReachedTarget = True;                                            //0064 : 14 2D 01 88 11 1B 11 27 
              return True;                                                      //006C : 04 27 
            }
          }
          gamePawn.GroundSpeed = mMoveSpeed;                                    //006E : 0F 19 00 48 73 1B 11 05 00 04 01 18 A9 76 0F 01 10 11 1B 11 
          if (UpdateMovement()) {                                               //0082 : 07 8D 00 1B E5 0E 00 00 16 
            return True;                                                        //008B : 04 27 
          }
        }
        return False;                                                           //008D : 04 28 
        //0F 00 48 73 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 07 8D 00 77 00 48 73 1B 11 2A 16 07 3A 00 2D 01 
        //88 11 1B 11 0F 19 00 48 73 1B 11 05 00 04 01 18 A9 76 0F 1E 00 00 00 00 04 27 07 6E 00 B1 01 48 
        //58 18 11 1E 00 00 00 00 16 B9 01 D8 DC 1A 11 00 E0 71 1B 11 16 07 6E 00 B2 01 D8 DC 1A 11 1E 00 
        //00 00 00 16 14 2D 01 88 11 1B 11 27 04 27 0F 19 00 48 73 1B 11 05 00 04 01 18 A9 76 0F 01 10 11 
        //1B 11 07 8D 00 1B E5 0E 00 00 16 04 27 04 28 04 0B 47 
      }


      event cl_OnPlayerTick(float DeltaTime) {
        local Game_Pawn gamePawn;
        Camera.cl_Tick(DeltaTime);                                              //0000 : 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 E8 74 1B 11 16 
        gamePawn = Game_Pawn(Pawn);                                             //0014 : 0F 00 F8 75 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gamePawn != None) {                                                 //0024 : 07 4B 00 77 00 F8 75 1B 11 2A 16 
          if (UpdatePawnMovement(DeltaTime)) {                                  //002F : 07 4B 00 1B E3 0E 00 00 00 E8 74 1B 11 16 
            mReachedTarget = True;                                              //003D : 14 2D 01 88 11 1B 11 27 
            cl2sv_NoteTargetReached_CallStub();                                 //0045 : 1B E1 0E 00 00 16 
          }
        }
        //19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 E8 74 1B 11 16 0F 00 F8 75 1B 11 2E 18 38 5B 01 01 
        //88 83 6C 0F 07 4B 00 77 00 F8 75 1B 11 2A 16 07 4B 00 1B E3 0E 00 00 00 E8 74 1B 11 16 14 2D 01 
        //88 11 1B 11 27 1B E1 0E 00 00 16 04 0B 47 
      }


      function EndState() {
        mReachedTarget = True;                                                  //0000 : 14 2D 01 88 11 1B 11 27 
        //14 2D 01 88 11 1B 11 27 04 0B 47 
      }


      function BeginState() {
        mReachedTarget = False;                                                 //0000 : 14 2D 01 88 11 1B 11 28 
        if (mMaxTimeToMove > 0.20000000) {                                      //0008 : 07 25 00 B1 01 48 58 18 11 1E CD CC 4C 3E 16 
          mStateTimer = mMaxTimeToMove;                                         //0017 : 0F 01 D8 DC 1A 11 01 48 58 18 11 
        } else {                                                                //0022 : 06 30 00 
          mStateTimer = 0.00000000;                                             //0025 : 0F 01 D8 DC 1A 11 1E 00 00 00 00 
        }
        CalculateMovementSpeed();                                               //0030 : 1B E4 0E 00 00 16 
        //14 2D 01 88 11 1B 11 28 07 25 00 B1 01 48 58 18 11 1E CD CC 4C 3E 16 0F 01 D8 DC 1A 11 01 48 58 
        //18 11 06 30 00 0F 01 D8 DC 1A 11 1E 00 00 00 00 1B E4 0E 00 00 16 04 0B 47 
      }


    //08 47 

  }


  state PawnDead {

      function sv_Resurrect() {
        local string spawnPointTag;
        local PlayerStart spawnPoint;
        local PhysicsVolume pv;
        local Game_PlayerPawn gpp;
        gpp = Game_PlayerPawn(Pawn);                                            //0000 : 0F 00 20 83 1B 11 2E F0 47 5B 01 01 88 83 6C 0F 
        if (gpp != None && gpp.mCurrentLevelArea != None
          && Len(gpp.mCurrentLevelArea.RespawnPoint) != 0) {//0010 : 07 72 00 82 82 77 00 20 83 1B 11 2A 16 18 12 00 77 19 00 20 83 1B 11 05 00 04 01 98 83 1B 11 2A 16 16 18 1D 00 9B 7D 19 19 00 20 83 1B 11 05 00 04 01 98 83 1B 11 05 00 00 01 C0 6A 35 0F 16 25 16 16 
          spawnPointTag = gpp.mCurrentLevelArea.RespawnPoint;                   //0052 : 0F 00 90 7F 1B 11 19 19 00 20 83 1B 11 05 00 04 01 98 83 1B 11 05 00 00 01 C0 6A 35 0F 
        } else {                                                                //006F : 06 21 01 
          foreach TouchingActors(Class'PhysicsVolume',pv) {                     //0072 : 2F 61 33 20 58 5E C2 00 00 38 6B 35 0F 16 B0 00 
            if (Len(pv.RespawnPoint) != 0) {                                    //0082 : 07 AF 00 9B 7D 19 00 38 6B 35 0F 05 00 00 01 08 AF 79 0F 16 25 16 
              spawnPointTag = pv.RespawnPoint;                                  //0098 : 0F 00 90 7F 1B 11 19 00 38 6B 35 0F 05 00 00 01 08 AF 79 0F 
            } else {                                                            //00AC : 06 B0 00 
            }
          }
          if (Len(spawnPointTag) == 0 && Pawn.Region.Zone != None
            && Len(Pawn.Region.Zone.RespawnPoint) != 0) {//00B1 : 07 21 01 82 82 9A 7D 00 90 7F 1B 11 16 25 16 18 17 00 77 36 58 43 6E 0F 19 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 2A 16 16 18 22 00 9B 7D 19 36 58 43 6E 0F 19 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 05 00 00 01 A8 85 72 0F 16 25 16 16 
            spawnPointTag = Pawn.Region.Zone.RespawnPoint;                      //00FF : 0F 00 90 7F 1B 11 19 36 58 43 6E 0F 19 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 05 00 00 01 A8 85 72 0F 
          }
        }
        spawnPoint = Game_GameInfo(gpp.GetGameInfo()).sv_GetPlayerStart(spawnPointTag);//0121 : 0F 00 B0 6B 35 0F 19 2E 10 F9 5A 01 19 00 20 83 1B 11 06 00 04 1C 38 E1 6C 0F 16 0B 00 04 1B 11 07 00 00 00 90 7F 1B 11 16 
        if (gpp != None) {                                                      //014A : 07 9B 01 77 00 20 83 1B 11 2A 16 
          gpp.sv_TeleportTo(spawnPoint.Location,spawnPoint.Rotation);           //0155 : 19 00 20 83 1B 11 22 00 04 1B 4A 07 00 00 19 00 B0 6B 35 0F 05 00 0C 01 30 81 6C 0F 19 00 B0 6B 35 0F 05 00 0C 01 00 84 6C 0F 16 
          gpp.CharacterStats.sv_Resurrect();                                    //0180 : 19 19 00 20 83 1B 11 05 00 04 01 08 43 34 0F 06 00 00 1B 58 0C 00 00 16 
        } else {                                                                //0198 : 06 D2 01 
          Pawn.SetLocation(spawnPoint.Location);                                //019B : 19 01 88 83 6C 0F 11 00 04 61 0B 19 00 B0 6B 35 0F 05 00 0C 01 30 81 6C 0F 16 
          Pawn.SetRotation(spawnPoint.Rotation);                                //01B5 : 19 01 88 83 6C 0F 14 00 04 1C 70 01 6E 0F 19 00 B0 6B 35 0F 05 00 0C 01 00 84 6C 0F 16 
        }
        Pawn.TriggerEvent(spawnPoint.Event,spawnPoint,Pawn);                    //01D2 : 19 01 88 83 6C 0F 1E 00 00 1C F8 B1 34 0F 19 00 B0 6B 35 0F 05 00 04 01 38 9F 6C 0F 00 B0 6B 35 0F 01 88 83 6C 0F 16 
        Class'Actor'.static.GetGameEngine().GGameInfo.PlayerRespawned(self);    //01F9 : 19 19 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 C0 F5 34 0F 07 00 04 1B E6 0E 00 00 17 16 
        //0F 00 20 83 1B 11 2E F0 47 5B 01 01 88 83 6C 0F 07 72 00 82 82 77 00 20 83 1B 11 2A 16 18 12 00 
        //77 19 00 20 83 1B 11 05 00 04 01 98 83 1B 11 2A 16 16 18 1D 00 9B 7D 19 19 00 20 83 1B 11 05 00 
        //04 01 98 83 1B 11 05 00 00 01 C0 6A 35 0F 16 25 16 16 0F 00 90 7F 1B 11 19 19 00 20 83 1B 11 05 
        //00 04 01 98 83 1B 11 05 00 00 01 C0 6A 35 0F 06 21 01 2F 61 33 20 58 5E C2 00 00 38 6B 35 0F 16 
        //B0 00 07 AF 00 9B 7D 19 00 38 6B 35 0F 05 00 00 01 08 AF 79 0F 16 25 16 0F 00 90 7F 1B 11 19 00 
        //38 6B 35 0F 05 00 00 01 08 AF 79 0F 06 B0 00 31 30 07 21 01 82 82 9A 7D 00 90 7F 1B 11 16 25 16 
        //18 17 00 77 36 58 43 6E 0F 19 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 2A 16 16 18 22 00 9B 7D 19 
        //36 58 43 6E 0F 19 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 05 00 00 01 A8 85 72 0F 16 25 16 16 0F 
        //00 90 7F 1B 11 19 36 58 43 6E 0F 19 01 88 83 6C 0F 05 00 0C 01 70 8A 6E 0F 05 00 00 01 A8 85 72 
        //0F 0F 00 B0 6B 35 0F 19 2E 10 F9 5A 01 19 00 20 83 1B 11 06 00 04 1C 38 E1 6C 0F 16 0B 00 04 1B 
        //11 07 00 00 00 90 7F 1B 11 16 07 9B 01 77 00 20 83 1B 11 2A 16 19 00 20 83 1B 11 22 00 04 1B 4A 
        //07 00 00 19 00 B0 6B 35 0F 05 00 0C 01 30 81 6C 0F 19 00 B0 6B 35 0F 05 00 0C 01 00 84 6C 0F 16 
        //19 19 00 20 83 1B 11 05 00 04 01 08 43 34 0F 06 00 00 1B 58 0C 00 00 16 06 D2 01 19 01 88 83 6C 
        //0F 11 00 04 61 0B 19 00 B0 6B 35 0F 05 00 0C 01 30 81 6C 0F 16 19 01 88 83 6C 0F 14 00 04 1C 70 
        //01 6E 0F 19 00 B0 6B 35 0F 05 00 0C 01 00 84 6C 0F 16 19 01 88 83 6C 0F 1E 00 00 1C F8 B1 34 0F 
        //19 00 B0 6B 35 0F 05 00 04 01 38 9F 6C 0F 00 B0 6B 35 0F 01 88 83 6C 0F 16 19 19 12 20 F8 8B C1 
        //00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 C0 F5 34 0F 07 00 04 1B E6 0E 00 00 17 16 04 0B 47 
      }


      event cl_OnPlayerFrame(float DeltaTime) {
        //04 0B 47 
      }


      exec function Jump(optional float JumpModifier) {
        //04 0B 47 
      }


      event cl_OnPlayerTick(float DeltaTime) {
        cl_OnPlayerTick(DeltaTime);                                             //0000 : 1C 48 1A 72 0F 00 C0 84 1B 11 16 
        Camera.cl_Tick(DeltaTime);                                              //000B : 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 C0 84 1B 11 16 
        //1C 48 1A 72 0F 00 C0 84 1B 11 16 19 01 B0 6A 18 11 0B 00 00 1B 72 0C 00 00 00 C0 84 1B 11 16 04 
        //0B 47 
      }


      function EndState() {
        local Game_Pawn gamePawn;
        gamePawn = Game_Pawn(Pawn);                                             //0000 : 0F 00 40 86 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gamePawn != None) {                                                 //0010 : 07 56 00 77 00 40 86 1B 11 2A 16 
          gamePawn.ClearPawnAnims();                                            //001B : 19 00 40 86 1B 11 06 00 00 1B A3 0C 00 00 16 
          gamePawn.PlayIdle();                                                  //002A : 19 00 40 86 1B 11 06 00 00 1B 3A 13 00 00 16 
          gamePawn.Effects.cl_Stop(mDeathEffectHandle);                         //0039 : 19 19 00 40 86 1B 11 05 00 04 01 48 63 34 0F 0B 00 04 1C D8 65 34 0F 01 68 87 1B 11 16 
        }
        mDeathEffectHandle = 0;                                                 //0056 : 0F 01 68 87 1B 11 25 
        //0F 00 40 86 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 07 56 00 77 00 40 86 1B 11 2A 16 19 00 40 86 1B 
        //11 06 00 00 1B A3 0C 00 00 16 19 00 40 86 1B 11 06 00 00 1B 3A 13 00 00 16 19 19 00 40 86 1B 11 
        //05 00 04 01 48 63 34 0F 0B 00 04 1C D8 65 34 0F 01 68 87 1B 11 16 0F 01 68 87 1B 11 25 04 0B 47 
        //
      }


      function BeginState() {
        local Game_Pawn gamePawn;
        if (Class'Actor'.static.GetGameEngine().GGameInfo.PlayerDied(self) == False) {//0000 : 07 B1 00 F2 19 19 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 C0 F5 34 0F 07 00 04 1B 45 0D 00 00 17 16 28 16 
          if (IsClient() && GUI != None) {                                      //0029 : 07 B1 00 82 1B 1C 0C 00 00 16 18 09 00 77 01 40 8A 1B 11 2A 16 16 
            gamePawn = Game_Pawn(Pawn);                                         //003F : 0F 00 E0 87 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 
            if (gamePawn != None && gamePawn.Trading != None) {                 //004F : 07 88 00 82 77 00 E0 87 1B 11 2A 16 18 12 00 77 19 00 E0 87 1B 11 05 00 04 01 C0 43 32 0F 2A 16 16 
              gamePawn.Trading.cl_HandleDeath();                                //0070 : 19 19 00 E0 87 1B 11 05 00 04 01 C0 43 32 0F 06 00 00 1B AE 0D 00 00 16 
            }
            if (GroupingTeams != None) {                                        //0088 : 07 A2 00 77 01 48 C2 18 11 2A 16 
              GroupingTeams.HandleDeath();                                      //0093 : 19 01 48 C2 18 11 06 00 00 1B F8 0C 00 00 16 
            }
            GUI.HandleDeath();                                                  //00A2 : 19 01 40 8A 1B 11 06 00 00 1B F8 0C 00 00 16 
          }
        }
        Input.cl_SetAutoRun(False);                                             //00B1 : 19 01 B0 14 37 0F 07 00 00 1B D2 0C 00 00 28 16 
        Input.cl_SetTargetActor(None);                                          //00C1 : 19 01 B0 14 37 0F 07 00 00 1B 4F 05 00 00 2A 16 
        if (mDeathEffect == None) {                                             //00D1 : 07 18 01 72 01 B8 8A 1B 11 2A 16 
          mDeathEffect = FSkill_EffectClass_AudioVisual(static.DynamicLoadObject("EffectsNPCTypeAVGP.Death.Death_Blur",Class'FSkill_EffectClass_AudioVisual',True));//00DC : 0F 01 B8 8A 1B 11 2E 80 8F 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 4E 50 43 54 79 70 65 41 56 47 50 2E 44 65 61 74 68 2E 44 65 61 74 68 5F 42 6C 75 72 00 20 80 8F 5D 01 27 16 
        }
        mDeathEffectHandle = Game_Pawn(Pawn).Effects.cl_Start(mDeathEffect);    //0118 : 0F 01 68 87 1B 11 19 19 2E 18 38 5B 01 01 88 83 6C 0F 05 00 04 01 48 63 34 0F 0B 00 04 1C 28 65 34 0F 01 B8 8A 1B 11 16 
        //07 B1 00 F2 19 19 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 C0 F5 34 0F 07 00 04 
        //1B 45 0D 00 00 17 16 28 16 07 B1 00 82 1B 1C 0C 00 00 16 18 09 00 77 01 40 8A 1B 11 2A 16 16 0F 
        //00 E0 87 1B 11 2E 18 38 5B 01 01 88 83 6C 0F 07 88 00 82 77 00 E0 87 1B 11 2A 16 18 12 00 77 19 
        //00 E0 87 1B 11 05 00 04 01 C0 43 32 0F 2A 16 16 19 19 00 E0 87 1B 11 05 00 04 01 C0 43 32 0F 06 
        //00 00 1B AE 0D 00 00 16 07 A2 00 77 01 48 C2 18 11 2A 16 19 01 48 C2 18 11 06 00 00 1B F8 0C 00 
        //00 16 19 01 40 8A 1B 11 06 00 00 1B F8 0C 00 00 16 19 01 B0 14 37 0F 07 00 00 1B D2 0C 00 00 28 
        //16 19 01 B0 14 37 0F 07 00 00 1B 4F 05 00 00 2A 16 07 18 01 72 01 B8 8A 1B 11 2A 16 0F 01 B8 8A 
        //1B 11 2E 80 8F 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 4E 50 43 54 79 70 65 41 56 47 50 2E 
        //44 65 61 74 68 2E 44 65 61 74 68 5F 42 6C 75 72 00 20 80 8F 5D 01 27 16 0F 01 68 87 1B 11 19 19 
        //2E 18 38 5B 01 01 88 83 6C 0F 05 00 04 01 48 63 34 0F 0B 00 04 1C 28 65 34 0F 01 B8 8A 1B 11 16 
        //04 0B 47 
      }


    //08 47 

  }


  auto state PawnAlive {

      function BeginState() {
        if (IsClient() && Pawn != None) {                                       //0000 : 07 25 00 82 1B 1C 0C 00 00 16 18 09 00 77 01 88 83 6C 0F 2A 16 16 
          GUI.HideDeathRespawn();                                               //0016 : 19 01 40 8A 1B 11 06 00 00 1B C4 0E 00 00 16 
        }
        //07 25 00 82 1B 1C 0C 00 00 16 18 09 00 77 01 88 83 6C 0F 2A 16 16 19 01 40 8A 1B 11 06 00 00 1B 
        //C4 0E 00 00 16 04 0B 47 
      }


    //08 47 

  }



