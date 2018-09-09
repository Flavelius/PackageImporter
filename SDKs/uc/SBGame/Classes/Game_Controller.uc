//==============================================================================
//  Game_Controller
//==============================================================================

class Game_Controller extends Base_Controller
    native
    exportstructs
    dependsOn(DB_Character,Class,SBDBAsync,Game_Pawn,Game_CharacterStats,Pawn,Game_Hook,Content_Type,Game_DebugUtils,Game_TextParser,Game_Conversation)
    Config(User)
  ;

  enum EControllerStates {
    CPS_PAWN_NONE ,
    CPS_PAWN_ALIVE ,
    CPS_PAWN_DEAD ,
    CPS_AI_ALERT ,
    CPS_AI_AGGRO ,
    CPS_AI_FOLLOW ,
    CPS_AI_IDLE ,
    CPS_AI_REGROUP ,
    CPS_MOVE_PAWN ,
    CPS_ROTATE_PAWN ,
    CPS_PAWN_SITTING ,
    CPS_PAWN_FROZEN 
  };

  struct DBSkillToken {
      var int SkillID;
      var int TokenSlots;

  };


  var private transient int mhastransactionmanager_data;
  var class<Game_DebugUtils> mDebugUtilsClass;
  var class<Game_TextParser> TextParserClass;
  var class<Game_Conversation> ConversationControlClass;
  var export editinline Game_DebugUtils DebugUtils;
  var export editinline Game_TextParser TextParser;
  var export editinline Game_Conversation ConversationControl;
  var byte mCurrentState;
  var array<Game_Hook> mContentHooks;
  var Vector mTargetDestination;
  var Vector mTargetFocus;
  var Rotator mTargetRotation;
  var float mMaxDistanceToTarget;
  var float mMaxTimeToMove;
  var float mMoveSpeed;
  var transient bool mReachedTarget;
  var transient float mStateTimer;
  var array<StateListener> mStateListeners;
  var DB_Character DBCharacter;
  var DB_CharacterSheet DBCharacterSheet;
  var array<int> DBCharacterSkills;
  var array<DBSkillToken> DBSkillTokens;
  var array<DB_SkillDeck> DBSkilldecks;
  var array<DB_Item> DBItems;
  var int DBPersistentVariables;


  native function int sv_GetPersistentVariable(int ContextID,int VariableID);


  protected native function cl2sv_SetPersistentVariable_CallStub();


  private native event cl2sv_SetPersistentVariable(int VariableID,int Value);


  protected native function sv2cl_SetPersistentVariable_CallStub();


  private native event sv2cl_SetPersistentVariable(int ContextID,int VariableID,int Value);


  private native function sv_SetPersistentVariableNative(int ContextID,int VariableID,int Value);


  event sv_SetPersistentVariable(int ContextID,int VariableID,int Value) {
    if (DBCharacter != None && DBCharacter.Id > 0) {                            //0000 : 07 86 00 82 77 01 30 2F 19 11 2A 16 18 12 00 97 19 01 30 2F 19 11 05 00 04 01 60 82 1A 11 25 16 16 
      if (sv_GetPersistentVariable(ContextID,VariableID) == Value) {            //0021 : 07 3D 00 9A 1B 77 0E 00 00 00 E8 81 1A 11 00 D8 82 1A 11 16 00 50 83 1A 11 16 
        return;                                                                 //003B : 04 0B 
      }
      sv_SetPersistentVariableNative(ContextID,VariableID,Value);               //003D : 1B 4C 0E 00 00 00 E8 81 1A 11 00 D8 82 1A 11 00 50 83 1A 11 16 
      Class'SBDBAsync'.SetPersistentPlayerVariable(Pawn,DBCharacter.Id,ContextID,VariableID,Value);//0052 : 12 20 70 87 24 01 28 00 00 1B 5F 13 00 00 01 88 83 6C 0F 19 01 30 2F 19 11 05 00 04 01 60 82 1A 11 00 E8 81 1A 11 00 D8 82 1A 11 00 50 83 1A 11 16 
      goto jl0086;                                                              //0083 : 06 86 00 
    }
    //07 86 00 82 77 01 30 2F 19 11 2A 16 18 12 00 97 19 01 30 2F 19 11 05 00 04 01 60 82 1A 11 25 16 
    //16 07 3D 00 9A 1B 77 0E 00 00 00 E8 81 1A 11 00 D8 82 1A 11 16 00 50 83 1A 11 16 04 0B 1B 4C 0E 
    //00 00 00 E8 81 1A 11 00 D8 82 1A 11 00 50 83 1A 11 16 12 20 70 87 24 01 28 00 00 1B 5F 13 00 00 
    //01 88 83 6C 0F 19 01 30 2F 19 11 05 00 04 01 60 82 1A 11 00 E8 81 1A 11 00 D8 82 1A 11 00 50 83 
    //1A 11 16 06 86 00 04 0B 47 
  }


  function sv_PetCallBack();


  function sv_PetAttack(Game_Pawn Target);


  function byte sv_GetPetAttackState();


  function byte sv_GetPetMoveState();


  function sv_SetPetAttackState(byte aAttackState);


  function sv_SetPetMoveState(byte aMoveState);


  function sv_SetPetOwner(Game_Pawn aPetOwner);


  function bool ShouldLoot(Actor aLootOwner) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function GetLootTables(Actor aOwner,out array<LootTable> aResultTables) {
    //04 0B 47 
  }


  final native event RotateToFace();


  native function Rotator GetFocusOrientation();


  native function bool FacingTarget();


  protected native function cl2sv_ForwardCancelState_CallStub();


  event cl2sv_ForwardCancelState(string aStateName) {
    SBGotoState(1);                                                             //0000 : 1B 11 06 00 00 24 01 16 
    //1B 11 06 00 00 24 01 16 04 0B 47 
  }


  event bool IsBeingRotated() {
    return mCurrentState == 9;                                                  //0000 : 04 9A 39 3A 01 58 E6 1A 11 39 3A 24 09 16 
    //04 9A 39 3A 01 58 E6 1A 11 39 3A 24 09 16 04 0B 47 
  }


  event bool IsBeingMoved() {
    return mCurrentState == 8;                                                  //0000 : 04 9A 39 3A 01 58 E6 1A 11 39 3A 24 08 16 
    //04 9A 39 3A 01 58 E6 1A 11 39 3A 24 08 16 04 0B 47 
  }


  event bool IsSitting() {
    return mCurrentState == 10;                                                 //0000 : 04 9A 39 3A 01 58 E6 1A 11 39 3A 24 0A 16 
    //04 9A 39 3A 01 58 E6 1A 11 39 3A 24 0A 16 04 0B 47 
  }


  native function bool IsDespawned();


  native function bool IsDead();


  event bool IsIdle() {
    return mCurrentState == 1;                                                  //0000 : 04 9A 39 3A 01 58 E6 1A 11 39 3A 24 01 16 
    //04 9A 39 3A 01 58 E6 1A 11 39 3A 24 01 16 04 0B 47 
  }


  event SBGotoState(byte aState) {
    if (aState != mCurrentState) {                                              //0000 : 07 88 00 9B 39 3A 00 68 EE 1A 11 39 3A 01 58 E6 1A 11 16 
      switch (aState) {                                                         //0013 : 05 01 00 68 EE 1A 11 
        case 1 :                                                                //001A : 0A 34 00 24 01 
          mCurrentState = aState;                                               //001F : 0F 01 58 E6 1A 11 00 68 EE 1A 11 
          GotoState('PawnAlive');                                               //002A : 71 21 CB 0C 00 00 16 
          break;                                                                //0031 : 06 88 00 
        case 2 :                                                                //0034 : 0A 4E 00 24 02 
          mCurrentState = aState;                                               //0039 : 0F 01 58 E6 1A 11 00 68 EE 1A 11 
          GotoState('PawnDead');                                                //0044 : 71 21 CD 0C 00 00 16 
          break;                                                                //004B : 06 88 00 
        case 10 :                                                               //004E : 0A 68 00 24 0A 
          mCurrentState = aState;                                               //0053 : 0F 01 58 E6 1A 11 00 68 EE 1A 11 
          GotoState('PawnSitting');                                             //005E : 71 21 49 0D 00 00 16 
          break;                                                                //0065 : 06 88 00 
        case 11 :                                                               //0068 : 0A 82 00 24 0B 
          mCurrentState = aState;                                               //006D : 0F 01 58 E6 1A 11 00 68 EE 1A 11 
          GotoState('PawnFrozen');                                              //0078 : 71 21 A3 0D 00 00 16 
          break;                                                                //007F : 06 88 00 
        default:                                                                //0082 : 0A FF FF 
          break;                                                                //0085 : 06 88 00 
      }
    }
    //07 88 00 9B 39 3A 00 68 EE 1A 11 39 3A 01 58 E6 1A 11 16 05 01 00 68 EE 1A 11 0A 34 00 24 01 0F 
    //01 58 E6 1A 11 00 68 EE 1A 11 71 21 CB 0C 00 00 16 06 88 00 0A 4E 00 24 02 0F 01 58 E6 1A 11 00 
    //68 EE 1A 11 71 21 CD 0C 00 00 16 06 88 00 0A 68 00 24 0A 0F 01 58 E6 1A 11 00 68 EE 1A 11 71 21 
    //49 0D 00 00 16 06 88 00 0A 82 00 24 0B 0F 01 58 E6 1A 11 00 68 EE 1A 11 71 21 A3 0D 00 00 16 06 
    //88 00 0A FF FF 06 88 00 04 0B 47 
  }


  final native function bool CanSeePawn(Game_Pawn aOther);


  final native function sv_RemoveHooks(export editinline Content_Type aOwner);


  event sv_FireHook(byte aHookType,Object aObjParam,int aNumParam) {
    local int hookI;
    local Game_Hook prevHook;
    local Game_PlayerPawn playerPawn;
    hookI = 0;                                                                  //0000 : 0F 00 C8 F6 1A 11 25 
    while (hookI < mContentHooks.Length) {                                      //0007 : 07 74 00 96 00 C8 F6 1A 11 37 01 40 F7 1A 11 16 
      if (mContentHooks[hookI].HookType == aHookType) {                         //0017 : 07 53 00 9A 39 3A 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 05 00 01 01 B8 F7 1A 11 39 3A 00 00 F4 1A 11 16 
        mContentHooks[hookI].Fire = True;                                       //0039 : 14 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 06 00 04 2D 01 30 F8 1A 11 27 
      } else {                                                                  //0050 : 06 6A 00 
        mContentHooks[hookI].Fire = False;                                      //0053 : 14 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 06 00 04 2D 01 30 F8 1A 11 28 
      }
      hookI++;                                                                  //006A : A5 00 C8 F6 1A 11 16 
    }
    playerPawn = Game_PlayerPawn(Pawn);                                         //0074 : 0F 00 A8 F8 1A 11 2E F0 47 5B 01 01 88 83 6C 0F 
    hookI = 0;                                                                  //0084 : 0F 00 C8 F6 1A 11 25 
    while (hookI < mContentHooks.Length) {                                      //008B : 07 54 01 96 00 C8 F6 1A 11 37 01 40 F7 1A 11 16 
      if (mContentHooks[hookI].Fire) {                                          //009B : 07 4A 01 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 06 00 04 2D 01 30 F8 1A 11 
        mContentHooks[hookI].Fire = False;                                      //00B3 : 14 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 06 00 04 2D 01 30 F8 1A 11 28 
        prevHook = mContentHooks[hookI];                                        //00CA : 0F 00 20 F9 1A 11 10 00 C8 F6 1A 11 01 40 F7 1A 11 
        if (playerPawn != None) {                                               //00DB : 07 18 01 77 00 A8 F8 1A 11 2A 16 
          mContentHooks[hookI].Owner.sv_OnHook(playerPawn,aHookType,aObjParam,aNumParam);//00E6 : 19 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 05 00 04 01 98 F9 1A 11 1A 00 00 1C 10 FA 1A 11 00 A8 F8 1A 11 00 00 F4 1A 11 00 C0 FA 1A 11 00 38 FB 1A 11 16 
        }
        if (hookI >= mContentHooks.Length) {                                    //0118 : 07 2E 01 99 00 C8 F6 1A 11 37 01 40 F7 1A 11 16 
          break;                                                                //0128 : 06 54 01 
          goto jl014A;                                                          //012B : 06 4A 01 
        }
        if (mContentHooks[hookI] != prevHook) {                                 //012E : 07 4A 01 77 10 00 C8 F6 1A 11 01 40 F7 1A 11 00 20 F9 1A 11 16 
          hookI--;                                                              //0143 : A6 00 C8 F6 1A 11 16 
        }
      }
      hookI++;                                                                  //014A : A5 00 C8 F6 1A 11 16 
    }
    hookI = 0;                                                                  //0154 : 0F 00 C8 F6 1A 11 25 
    while (hookI < mContentHooks.Length) {                                      //015B : 07 8D 01 96 00 C8 F6 1A 11 37 01 40 F7 1A 11 16 
      if (mContentHooks[hookI].Fire) {                                          //016B : 07 83 01 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 06 00 04 2D 01 30 F8 1A 11 
      }
      hookI++;                                                                  //0183 : A5 00 C8 F6 1A 11 16 
    }
    //0F 00 C8 F6 1A 11 25 07 74 00 96 00 C8 F6 1A 11 37 01 40 F7 1A 11 16 07 53 00 9A 39 3A 19 10 00 
    //C8 F6 1A 11 01 40 F7 1A 11 05 00 01 01 B8 F7 1A 11 39 3A 00 00 F4 1A 11 16 14 19 10 00 C8 F6 1A 
    //11 01 40 F7 1A 11 06 00 04 2D 01 30 F8 1A 11 27 06 6A 00 14 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 
    //06 00 04 2D 01 30 F8 1A 11 28 A5 00 C8 F6 1A 11 16 06 07 00 0F 00 A8 F8 1A 11 2E F0 47 5B 01 01 
    //88 83 6C 0F 0F 00 C8 F6 1A 11 25 07 54 01 96 00 C8 F6 1A 11 37 01 40 F7 1A 11 16 07 4A 01 19 10 
    //00 C8 F6 1A 11 01 40 F7 1A 11 06 00 04 2D 01 30 F8 1A 11 14 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 
    //06 00 04 2D 01 30 F8 1A 11 28 0F 00 20 F9 1A 11 10 00 C8 F6 1A 11 01 40 F7 1A 11 07 18 01 77 00 
    //A8 F8 1A 11 2A 16 19 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 05 00 04 01 98 F9 1A 11 1A 00 00 1C 10 
    //FA 1A 11 00 A8 F8 1A 11 00 00 F4 1A 11 00 C0 FA 1A 11 00 38 FB 1A 11 16 07 2E 01 99 00 C8 F6 1A 
    //11 37 01 40 F7 1A 11 16 06 54 01 06 4A 01 07 4A 01 77 10 00 C8 F6 1A 11 01 40 F7 1A 11 00 20 F9 
    //1A 11 16 A6 00 C8 F6 1A 11 16 A5 00 C8 F6 1A 11 16 06 8B 00 0F 00 C8 F6 1A 11 25 07 8D 01 96 00 
    //C8 F6 1A 11 37 01 40 F7 1A 11 16 07 83 01 19 10 00 C8 F6 1A 11 01 40 F7 1A 11 06 00 04 2D 01 30 
    //F8 1A 11 A5 00 C8 F6 1A 11 16 06 5B 01 04 0B 47 
  }


  event bool sv_OnAttack(Game_Pawn aPawn,export editinline FSkill_EffectClass aEffect,bool WasNegativeEffect,float aValue) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event sv_OnOwnerAttack(bool WasNegativeEffect);


  event sv_OnOwnerAggression();


  event sv_OnSkillTarget(Game_Pawn aInstigator,export editinline FSkill_Type aType);


  event bool sv_OnDamage(Game_Pawn aEnemy,int aDamage) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event cl_OnShutdown() {
    if (DebugUtils != None) {                                                   //0000 : 07 1A 00 77 01 D8 06 1B 11 2A 16 
      DebugUtils.cl_OnShutdown();                                               //000B : 19 01 D8 06 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    if (TextParser != None) {                                                   //001A : 07 34 00 77 01 50 07 1B 11 2A 16 
      TextParser.cl_OnShutdown();                                               //0025 : 19 01 50 07 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    if (ConversationControl != None) {                                          //0034 : 07 4E 00 77 01 C8 07 1B 11 2A 16 
      ConversationControl.cl_OnShutdown();                                      //003F : 19 01 C8 07 1B 11 06 00 00 1B 66 07 00 00 16 
    }
    Super.cl_OnShutdown();                                                      //004E : 1C B8 0F 19 11 16 
    //07 1A 00 77 01 D8 06 1B 11 2A 16 19 01 D8 06 1B 11 06 00 00 1B 66 07 00 00 16 07 34 00 77 01 50 
    //07 1B 11 2A 16 19 01 50 07 1B 11 06 00 00 1B 66 07 00 00 16 07 4E 00 77 01 C8 07 1B 11 2A 16 19 
    //01 C8 07 1B 11 06 00 00 1B 66 07 00 00 16 1C B8 0F 19 11 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 70 B7 1A 11 16 
    if (DebugUtils != None) {                                                   //0006 : 07 20 00 77 01 D8 06 1B 11 2A 16 
      DebugUtils.cl_OnInit();                                                   //0011 : 19 01 D8 06 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (TextParser != None) {                                                   //0020 : 07 3A 00 77 01 50 07 1B 11 2A 16 
      TextParser.cl_OnInit();                                                   //002B : 19 01 50 07 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (ConversationControl != None) {                                          //003A : 07 54 00 77 01 C8 07 1B 11 2A 16 
      ConversationControl.cl_OnInit();                                          //0045 : 19 01 C8 07 1B 11 06 00 00 1B 3F 05 00 00 16 
    }
    //1C 70 B7 1A 11 16 07 20 00 77 01 D8 06 1B 11 2A 16 19 01 D8 06 1B 11 06 00 00 1B 3F 05 00 00 16 
    //07 3A 00 77 01 50 07 1B 11 2A 16 19 01 50 07 1B 11 06 00 00 1B 3F 05 00 00 16 07 54 00 77 01 C8 
    //07 1B 11 2A 16 19 01 C8 07 1B 11 06 00 00 1B 3F 05 00 00 16 04 0B 47 
  }


  event cl_OnTick(float DeltaTime) {
    Super.cl_OnTick(DeltaTime);                                                 //0000 : 1C 38 B5 1A 11 00 40 0A 1B 11 16 
    if (DebugUtils != None) {                                                   //000B : 07 2A 00 77 01 D8 06 1B 11 2A 16 
      DebugUtils.cl_OnTick(DeltaTime);                                          //0016 : 19 01 D8 06 1B 11 0B 00 00 1B 07 0C 00 00 00 40 0A 1B 11 16 
    }
    //1C 38 B5 1A 11 00 40 0A 1B 11 16 07 2A 00 77 01 D8 06 1B 11 2A 16 19 01 D8 06 1B 11 0B 00 00 1B 
    //07 0C 00 00 00 40 0A 1B 11 16 04 0B 47 
  }


  event sv_OnShutdown() {
    if (DebugUtils != None) {                                                   //0000 : 07 1A 00 77 01 D8 06 1B 11 2A 16 
      DebugUtils.sv_OnShutdown();                                               //000B : 19 01 D8 06 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (TextParser != None) {                                                   //001A : 07 34 00 77 01 50 07 1B 11 2A 16 
      TextParser.sv_OnShutdown();                                               //0025 : 19 01 50 07 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    if (ConversationControl != None) {                                          //0034 : 07 4E 00 77 01 C8 07 1B 11 2A 16 
      ConversationControl.sv_OnShutdown();                                      //003F : 19 01 C8 07 1B 11 06 00 00 1C 40 C6 19 11 16 
    }
    Super.sv_OnShutdown();                                                      //004E : 1C 50 B8 1A 11 16 
    //07 1A 00 77 01 D8 06 1B 11 2A 16 19 01 D8 06 1B 11 06 00 00 1C 40 C6 19 11 16 07 34 00 77 01 50 
    //07 1B 11 2A 16 19 01 50 07 1B 11 06 00 00 1C 40 C6 19 11 16 07 4E 00 77 01 C8 07 1B 11 2A 16 19 
    //01 C8 07 1B 11 06 00 00 1C 40 C6 19 11 16 1C 50 B8 1A 11 16 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C 28 26 6E 0F 16 
    if (mDebugUtilsClass != None) {                                             //0006 : 07 20 00 77 01 10 0D 1B 11 2A 16 
      DebugUtils = new (self) mDebugUtilsClass;                                 //0011 : 0F 01 D8 06 1B 11 11 17 0B 0B 01 10 0D 1B 11 
    }
    if (TextParserClass != None) {                                              //0020 : 07 3A 00 77 01 90 0D 1B 11 2A 16 
      TextParser = new (self) TextParserClass;                                  //002B : 0F 01 50 07 1B 11 11 17 0B 0B 01 90 0D 1B 11 
    }
    if (ConversationControlClass != None) {                                     //003A : 07 54 00 77 01 10 0E 1B 11 2A 16 
      ConversationControl = new (self) ConversationControlClass;                //0045 : 0F 01 C8 07 1B 11 11 17 0B 0B 01 10 0E 1B 11 
    }
    //1C 28 26 6E 0F 16 07 20 00 77 01 10 0D 1B 11 2A 16 0F 01 D8 06 1B 11 11 17 0B 0B 01 10 0D 1B 11 
    //07 3A 00 77 01 90 0D 1B 11 2A 16 0F 01 50 07 1B 11 11 17 0B 0B 01 90 0D 1B 11 07 54 00 77 01 10 
    //0E 1B 11 2A 16 0F 01 C8 07 1B 11 11 17 0B 0B 01 10 0E 1B 11 04 0B 47 
  }


  state PawnFrozen {

      event cl_OnPlayerTick(float DeltaTime) {
        //04 0B 47 
      }


      function EndState() {
        local Game_Pawn gp;
        gp = Game_Pawn(Pawn);                                                   //0000 : 0F 00 98 C8 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gp != None) {                                                       //0010 : 07 4D 00 77 00 98 C8 1A 11 2A 16 
          gp.CharacterStats.FreezeMovement(False);                              //001B : 19 19 00 98 C8 1A 11 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 28 16 
          gp.CharacterStats.FreezeRotation(False);                              //0034 : 19 19 00 98 C8 1A 11 05 00 04 01 08 43 34 0F 07 00 00 1B B8 0C 00 00 28 16 
        }
        //0F 00 98 C8 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 07 4D 00 77 00 98 C8 1A 11 2A 16 19 19 00 98 C8 
        //1A 11 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 28 16 19 19 00 98 C8 1A 11 05 00 04 01 08 
        //43 34 0F 07 00 00 1B B8 0C 00 00 28 16 04 0B 47 
      }


      function BeginState() {
        local Game_Pawn gp;
        gp = Game_Pawn(Pawn);                                                   //0000 : 0F 00 A8 C9 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gp != None) {                                                       //0010 : 07 4D 00 77 00 A8 C9 1A 11 2A 16 
          gp.CharacterStats.FreezeMovement(True);                               //001B : 19 19 00 A8 C9 1A 11 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 27 16 
          gp.CharacterStats.FreezeRotation(True);                               //0034 : 19 19 00 A8 C9 1A 11 05 00 04 01 08 43 34 0F 07 00 00 1B B8 0C 00 00 27 16 
        }
        //0F 00 A8 C9 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 07 4D 00 77 00 A8 C9 1A 11 2A 16 19 19 00 A8 C9 
        //1A 11 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 27 16 19 19 00 A8 C9 1A 11 05 00 04 01 08 
        //43 34 0F 07 00 00 1B B8 0C 00 00 27 16 04 0B 47 
      }


    //08 47 

  }


  state PawnSitting {

      function EndState() {
        local Game_Pawn gp;
        gp = Game_Pawn(Pawn);                                                   //0000 : 0F 00 78 DA 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gp != None) {                                                       //0010 : 07 B7 00 77 00 78 DA 1A 11 2A 16 
          if (gp.CharacterStats != None) {                                      //001B : 07 A8 00 77 19 00 78 DA 1A 11 05 00 04 01 08 43 34 0F 2A 16 
            gp.CharacterStats.UnsetStatsState(4);                               //002F : 19 19 00 78 DA 1A 11 05 00 04 01 08 43 34 0F 08 00 00 1B 6F 0D 00 00 24 04 16 
            if (IsServer()) {                                                   //0049 : 07 A8 00 1B FF 0B 00 00 16 
              if (gp.Physics == 19) {                                           //0052 : 07 8B 00 9A 39 3A 19 00 78 DA 1A 11 05 00 01 01 C0 93 6C 0F 39 3A 24 13 16 
                gp.CharacterStats.FreezeMovementTimed(2.00000000);              //006B : 19 19 00 78 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 00 00 1E 00 00 00 40 16 
              } else {                                                          //0088 : 06 A8 00 
                gp.CharacterStats.FreezeMovementTimed(1.00000000);              //008B : 19 19 00 78 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 00 00 1E 00 00 80 3F 16 
              }
            }
          }
          gp.StandUp();                                                         //00A8 : 19 00 78 DA 1A 11 06 00 04 1B 6F 07 00 00 16 
        }
        //0F 00 78 DA 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 07 B7 00 77 00 78 DA 1A 11 2A 16 07 A8 00 77 19 
        //00 78 DA 1A 11 05 00 04 01 08 43 34 0F 2A 16 19 19 00 78 DA 1A 11 05 00 04 01 08 43 34 0F 08 00 
        //00 1B 6F 0D 00 00 24 04 16 07 A8 00 1B FF 0B 00 00 16 07 8B 00 9A 39 3A 19 00 78 DA 1A 11 05 00 
        //01 01 C0 93 6C 0F 39 3A 24 13 16 19 19 00 78 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 
        //00 00 1E 00 00 00 40 16 06 A8 00 19 19 00 78 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 
        //00 00 1E 00 00 80 3F 16 19 00 78 DA 1A 11 06 00 04 1B 6F 07 00 00 16 04 0B 47 
      }


      function BeginState() {
        local Game_Pawn gp;
        mStateTimer = 0.00000000;                                               //0000 : 0F 01 D8 DC 1A 11 1E 00 00 00 00 
        Pawn.Velocity = vect(0.000000, 0.000000, 0.000000);                     //000B : 0F 19 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
        Pawn.Acceleration = Pawn.Velocity;                                      //0027 : 0F 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 19 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 
        gp = Game_Pawn(Pawn);                                                   //0044 : 0F 00 F0 DA 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 
        if (gp != None) {                                                       //0054 : 07 EC 00 77 00 F0 DA 1A 11 2A 16 
          if (gp.CharacterStats != None) {                                      //005F : 07 8D 00 77 19 00 F0 DA 1A 11 05 00 04 01 08 43 34 0F 2A 16 
            gp.CharacterStats.SetStatsState(4);                                 //0073 : 19 19 00 F0 DA 1A 11 05 00 04 01 08 43 34 0F 08 00 00 1B 6E 0D 00 00 24 04 16 
          }
          if (IsServer()) {                                                     //008D : 07 EC 00 1B FF 0B 00 00 16 
            if (gp.Physics == 19) {                                             //0096 : 07 CF 00 9A 39 3A 19 00 F0 DA 1A 11 05 00 01 01 C0 93 6C 0F 39 3A 24 13 16 
              gp.CharacterStats.FreezeMovementTimed(2.00000000);                //00AF : 19 19 00 F0 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 00 00 1E 00 00 00 40 16 
            } else {                                                            //00CC : 06 EC 00 
              gp.CharacterStats.FreezeMovementTimed(1.00000000);                //00CF : 19 19 00 F0 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 00 00 1E 00 00 80 3F 16 
            }
          }
        }
        //0F 01 D8 DC 1A 11 1E 00 00 00 00 0F 19 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 
        //00 00 00 00 00 00 00 0F 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 19 01 88 83 6C 0F 05 00 0C 01 
        //A0 95 6C 0F 0F 00 F0 DA 1A 11 2E 18 38 5B 01 01 88 83 6C 0F 07 EC 00 77 00 F0 DA 1A 11 2A 16 07 
        //8D 00 77 19 00 F0 DA 1A 11 05 00 04 01 08 43 34 0F 2A 16 19 19 00 F0 DA 1A 11 05 00 04 01 08 43 
        //34 0F 08 00 00 1B 6E 0D 00 00 24 04 16 07 EC 00 1B FF 0B 00 00 16 07 CF 00 9A 39 3A 19 00 F0 DA 
        //1A 11 05 00 01 01 C0 93 6C 0F 39 3A 24 13 16 19 19 00 F0 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 
        //00 1B A5 0C 00 00 1E 00 00 00 40 16 06 EC 00 19 19 00 F0 DA 1A 11 05 00 04 01 08 43 34 0F 0B 00 
        //00 1B A5 0C 00 00 1E 00 00 80 3F 16 04 0B 47 
      }


    //08 47 

  }


  state PawnDead {

      function BeginState() {
        SBGotoState(2);                                                         //0000 : 1B 11 06 00 00 24 02 16 
        Game_Pawn(Pawn).StopMoving();                                           //0008 : 19 2E 18 38 5B 01 01 88 83 6C 0F 06 00 00 1B 2D 06 00 00 16 
        //1B 11 06 00 00 24 02 16 19 2E 18 38 5B 01 01 88 83 6C 0F 06 00 00 1B 2D 06 00 00 16 04 0B 47 
      }


    //08 47 

  }


  state PawnAlive {

      function BeginState() {
        SBGotoState(1);                                                         //0000 : 1B 11 06 00 00 24 01 16 
        //1B 11 06 00 00 24 01 16 04 0B 47 
      }


    //08 47 

  }



