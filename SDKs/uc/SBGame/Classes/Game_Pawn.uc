//==============================================================================
//  Game_Pawn
//==============================================================================

class Game_Pawn extends Base_Pawn
    native
    exportstructs
    dependsOn(EventNotification,Game_PlayerController,Player,Game_Desktop,Game_Trading,Game_PetPawn,Game_NPCController,Game_PlayerPawn,Game_CharacterStats,Game_BodySlots,NPC_Type,Class,Content_API,StringReferences,FSkill_Enums,Game_Character,Game_NPCPawn,SBDBSync,FSkill_EffectClass,FSkill_Event_Duff,Game_Skills,FSkill_Event,FSkill_Event_FX,Game_Effects,FSkill_EffectClass_AudioVisual,LevelInfo,Game_CombatStats,Game_CombatState,Game_Controller,SBAnimationFlags,Game_Camera,StaticPawnSounds,Game_PlayerItemManager,Game_MiniGameProxy,Console,Game_PlayerSkills,PlayerController,Game_ShiftableAppearance,Game_PlayerAppearance,Game_EquippedAppearance,Content_Type,Game_PlayerStats,Game_ActiveTextItem,Game_Appearance,NPC_Taxonomy,Game_HUD,Game_PlayerTeams,ShadowProjector,Game_RadialMenuOptions,Pawn,Game_PlayerInput,Game_GameInfo,Base_Controller,Game_Emotes,Game_Looting,Game_ItemManager,DB_Character,SBSettings)
    Config(User)
  ;

  const cHistoryEnd =  -1;
  const cLocationHistorySize =  40;
  enum EPetAttackState {
    PAS_Aggressive ,
    PAS_Defensive ,
    PAS_Assist ,
    PAS_Passive ,
    PAS_MAX 
  };

  enum EPetMoveState {
    PMS_Stay ,
    PMS_FollowOwner ,
    PMS_MAX 
  };

  enum ELateralMove {
    ELM_None ,
    ELM_Left ,
    ELM_Right 
  };

  enum EParallelMove {
    EPM_None ,
    EPM_Forwards ,
    EPM_Backwards 
  };

  enum EDebugDrawFilters {
    EDD_Position ,
    EDD_Location ,
    EDD_Cell ,
    EDD_Move ,
    EDD_Path ,
    EDD_Target ,
    EDD_Tactical ,
    EDD_Relevant ,
    EDD_History ,
    EDD_Skill ,
    EDD_Threat ,
    EDD_Astar ,
    EDD_Max 
  };

  enum EPawnEffectType {
    EPET_LevelUp ,
    EPET_RankUp ,
    EPET_QuestCompleted ,
    EPET_FadeIn ,
    EPET_FadeOut ,
    EPET_Visible ,
    EPET_Invisible ,
    EPET_PetSpawn ,
    EPET_PetDestroy ,
    EPET_ShapeShift ,
    EPET_ShapeUnshift ,
    EPET_ArenaTeam0 ,
    EPET_ArenaTeam1 ,
    EPET_SimpleCameraShake 
  };

  enum EPawnStates {
    PS_NONE ,
    PS_ALIVE ,
    PS_DEAD 
  };

  struct RangeDisplayData {
      var export editinline FSkill_EffectClass_Range Range;
      var Vector Location;
      var float RemoveTime;

  };


  struct CharacterIdentity {
      var int TransferWorldID;
      var int TransferUniverseID;
      var int TransferCharacterID;
      var int TransferAccountID;

  };


  struct HistoryLocation {
      var Vector Location;
      var Rotator Rotation;
      var float Time;
      var byte Physics;
      var bool Teleport;

  };


  var const class<Game_Appearance> BaseAppearanceClass;
  var const class<Game_Character> CharacterClass;
  var const class<Game_CharacterStats> CharacterStatsClass;
  var const class<Game_CombatState> CombatStateClass;
  var const class<Game_CombatStats> CombatStatsClass;
  var const class<Game_ItemManager> ItemManagerClass;
  var const class<Game_ShiftableAppearance> ShiftableAppearanceClass;
  var const class<Game_Skills> SkillsClass;
  var const class<Game_Effects> EffectsClass;
  var const class<Game_Emotes> EmotesClass;
  var const class<Game_Looting> LootingClass;
  var const class<Game_Trading> TradingClass;
  var const class<Game_BodySlots> BodySlotsClass;
  var export editinline Game_ShiftableAppearance Appearance;
  var export editinline Game_Appearance BaseAppearance;
  var export editinline Game_BodySlots BodySlots;
  var export editinline Game_Character Character;
  var export editinline Game_CharacterStats CharacterStats;
  var export editinline Game_ItemManager itemManager;
  var export editinline Game_CombatState combatState;
  var export editinline Game_CombatStats CombatStats;
  var export editinline Game_Effects Effects;
  var export editinline Game_Emotes Emotes;
  var export editinline Game_Looting Looting;
  var export editinline Game_Skills Skills;
  var export editinline Game_Trading Trading;
  var export editinline Game_MiniGameProxy MiniGameProxy;
  var Game_HUD HUD;
  var private byte mCurrentState;
  var private byte mNetState;
  var bool bInvulnerable;
  var private bool bCheatInvulnerable;
  var array<HistoryLocation> mLocationHistory;
  var int mLocationHistoryCursor;
  var bool mTeleported;
  var float ForwardSpeedModifier;
  var float SideSpeedModifier;
  var float BackwardSpeedModifier;
  var float GroundSpeedModifier;
  var CharacterIdentity mCharacterIdentityForBugReport;
  var ShadowProjector mPawnShadow;
  var bool mDebugDump;
  var bool mAlwaysHighQualityAppearance;
  var float mInteractionRange;
  var float mMinDamageFallSpeed;
  var float mMaxDamageFallSpeed;
  var bool mIsUnderCursor;
  var bool mIsSelected;
  var int mDebugFilters;
  var transient array<RangeDisplayData> mSelectedRanges;
  var Vector mDesiredLocation;
  var Actor mTargetActor;
  var array<name> InteractionTags;
  var private bool mUseFadeInFadeOut;
  var private int mFadeOutEffectHandle;
  var float SkillRadius;
  var EventNotification ShiftStateChanged;
  var private bool mPrevCombatReady;
  var private bool mPrevInCombat;
  var EventNotification CombatStateChanged;
  var EventNotification PetSummoned;
  var private transient Vector mLastLocation;
  var private transient float mNextLocationTime;
  var transient Game_PetPawn Pet;
  var transient bool HasPet;
  var private bool mInvisible;
  var private transient bool bJumpedFromLadder;


  protected native function sv2cl_Unshift_CallStub();


  event sv2cl_Unshift() {
    ShiftStateChanged.Trigger();                                                //0000 : 19 01 88 95 84 0F 06 00 00 1C 00 96 84 0F 16 
    //19 01 88 95 84 0F 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  protected native function sv2cl_Shift_CallStub();


  event sv2cl_Shift() {
    Game_Desktop(Game_PlayerController(Controller).Player.GUIDesktop).CloseShapeShiftRelevantWindows();//0000 : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 0D 0E 00 00 16 
    ShiftStateChanged.Trigger();                                                //002B : 19 01 88 95 84 0F 06 00 00 1C 00 96 84 0F 16 
    //19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 
    //79 0F 06 00 00 1B 0D 0E 00 00 16 19 01 88 95 84 0F 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  protected native function cl2sv_Unshift_CallStub();


  event cl2sv_Unshift() {
    Unshift();                                                                  //0000 : 1B E5 0C 00 00 16 
    //1B E5 0C 00 00 16 04 0B 47 
  }


  native function NPC_Type GetShiftedNPCType();


  native function bool Unshift();


  native function bool Shift(export editinline NPC_Type aType);


  native function bool IsShifted();


  event bool IsInShop() {
    if (Trading != None) {                                                      //0000 : 07 1B 00 77 01 C0 43 32 0F 2A 16 
      return Trading.IsShopping();                                              //000B : 04 19 01 C0 43 32 0F 06 00 04 1B 67 0E 00 00 16 
    }
    return False;                                                               //001B : 04 28 
    //07 1B 00 77 01 C0 43 32 0F 2A 16 04 19 01 C0 43 32 0F 06 00 04 1B 67 0E 00 00 16 04 28 04 0B 47 
    //
  }


  native function bool sv_IsVisibleInRelevance();


  native function sv_SetVisibleInRelevance(bool aVisible);


  event bool IsInvisible() {
    return mInvisible;                                                          //0000 : 04 2D 01 18 48 32 0F 
    //04 2D 01 18 48 32 0F 04 0B 47 
  }


  function cl_SetInvisble(bool aInvisibleFlag,bool aUseFade) {
    mInvisible = aInvisibleFlag;                                                //0000 : 14 2D 01 18 48 32 0F 2D 00 40 49 32 0F 
    if (aInvisibleFlag) {                                                       //000D : 07 35 00 2D 00 40 49 32 0F 
      if (aUseFade) {                                                           //0016 : 07 2A 00 2D 00 58 4A 32 0F 
        cl_PlayPawnEffect(4);                                                   //001F : 1B 16 0C 00 00 24 04 16 
      } else {                                                                  //0027 : 06 32 00 
        cl_PlayPawnEffect(6);                                                   //002A : 1B 16 0C 00 00 24 06 16 
      }
    } else {                                                                    //0032 : 06 51 00 
      if (aUseFade) {                                                           //0035 : 07 49 00 2D 00 58 4A 32 0F 
        cl_PlayPawnEffect(3);                                                   //003E : 1B 16 0C 00 00 24 03 16 
      } else {                                                                  //0046 : 06 51 00 
        cl_PlayPawnEffect(5);                                                   //0049 : 1B 16 0C 00 00 24 05 16 
      }
    }
    //14 2D 01 18 48 32 0F 2D 00 40 49 32 0F 07 35 00 2D 00 40 49 32 0F 07 2A 00 2D 00 58 4A 32 0F 1B 
    //16 0C 00 00 24 04 16 06 32 00 1B 16 0C 00 00 24 06 16 06 51 00 07 49 00 2D 00 58 4A 32 0F 1B 16 
    //0C 00 00 24 03 16 06 51 00 1B 16 0C 00 00 24 05 16 04 0B 47 
  }


  protected native function sv2clrel_SetInvisible_CallStub();


  event sv2clrel_SetInvisible(bool aInvisibleFlag) {
    if (mInvisible != aInvisibleFlag) {                                         //0000 : 07 23 00 F3 2D 01 18 48 32 0F 2D 00 80 4B 32 0F 16 
      cl_SetInvisble(aInvisibleFlag,mUseFadeInFadeOut);                         //0011 : 1B 44 0E 00 00 2D 00 80 4B 32 0F 2D 01 70 3B 34 0F 16 
    }
    //07 23 00 F3 2D 01 18 48 32 0F 2D 00 80 4B 32 0F 16 1B 44 0E 00 00 2D 00 80 4B 32 0F 2D 01 70 3B 
    //34 0F 16 04 0B 47 
  }


  function sv_SetInvisible(bool aInvisibleFlag) {
    if (aInvisibleFlag != mInvisible) {                                         //0000 : 07 2A 00 F3 2D 00 98 3C 34 0F 2D 01 18 48 32 0F 16 
      mInvisible = aInvisibleFlag;                                              //0011 : 14 2D 01 18 48 32 0F 2D 00 98 3C 34 0F 
      sv2clrel_SetInvisible_CallStub(aInvisibleFlag);                           //001E : 1B 45 0E 00 00 2D 00 98 3C 34 0F 16 
    }
    //07 2A 00 F3 2D 00 98 3C 34 0F 2D 01 18 48 32 0F 16 14 2D 01 18 48 32 0F 2D 00 98 3C 34 0F 1B 45 
    //0E 00 00 2D 00 98 3C 34 0F 16 04 0B 47 
  }


  final event Game_PetPawn GetPet() {
    return Pet;                                                                 //0000 : 04 01 D8 3E 34 0F 
    //04 01 D8 3E 34 0F 04 0B 47 
  }


  final event sv_DestroyPet(bool IsUserControlledAction) {
    if (HasPet) {                                                               //0000 : 07 8D 00 2D 01 68 41 34 0F 
      HasPet = False;                                                           //0009 : 14 2D 01 68 41 34 0F 28 
      Game_NPCController(Pet.Controller).sv_Despawn();                          //0011 : 19 2E 50 13 5B 01 19 01 D8 3E 34 0F 05 00 04 01 00 6E 6C 0F 06 00 00 1C E0 41 34 0F 16 
      sv2clrel_RemovePet_CallStub();                                            //002E : 1B 49 0E 00 00 16 
      if (BodySlots != None
        && Game_PlayerPawn(self).CharacterStats != None
        && Game_PlayerPawn(self).CharacterStats.GetCharacterClass() == 12) {//0034 : 07 8D 00 82 82 77 01 90 42 34 0F 2A 16 18 13 00 77 19 2E F0 47 5B 01 17 05 00 04 01 08 43 34 0F 2A 16 16 18 22 00 9A 39 3A 19 19 2E F0 47 5B 01 17 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 39 3A 24 0C 16 16 
        BodySlots.sv_SetMode(1);                                                //007C : 19 01 90 42 34 0F 08 00 00 1C 80 43 34 0F 24 01 16 
      }
    }
    //07 8D 00 2D 01 68 41 34 0F 14 2D 01 68 41 34 0F 28 19 2E 50 13 5B 01 19 01 D8 3E 34 0F 05 00 04 
    //01 00 6E 6C 0F 06 00 00 1C E0 41 34 0F 16 1B 49 0E 00 00 16 07 8D 00 82 82 77 01 90 42 34 0F 2A 
    //16 18 13 00 77 19 2E F0 47 5B 01 17 05 00 04 01 08 43 34 0F 2A 16 16 18 22 00 9A 39 3A 19 19 2E 
    //F0 47 5B 01 17 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 39 3A 24 0C 16 16 19 01 90 42 
    //34 0F 08 00 00 1C 80 43 34 0F 24 01 16 04 0B 47 
  }


  native function class<Game_NPCController> sv_GetPetControllerClass();


  protected native function sv2clrel_RemovePet_CallStub();


  event sv2clrel_RemovePet() {
    cl_SetPet(None);                                                            //0000 : 1B 85 0C 00 00 2A 16 
    //1B 85 0C 00 00 2A 16 04 0B 47 
  }


  function cl_SetPet(Game_PetPawn aPET) {
    if (HasPet && aPET == None) {                                               //0000 : 07 2F 00 82 2D 01 68 41 34 0F 18 09 00 72 00 A8 4F 32 0F 2A 16 16 
      Pet.cl_PlayPawnEffect(8);                                                 //0016 : 19 01 D8 3E 34 0F 08 00 00 1B 16 0C 00 00 24 08 16 
      HasPet = False;                                                           //0027 : 14 2D 01 68 41 34 0F 28 
    }
    Pet = aPET;                                                                 //002F : 0F 01 D8 3E 34 0F 00 A8 4F 32 0F 
    if (!HasPet && Pet != None) {                                               //003A : 07 8A 00 82 81 2D 01 68 41 34 0F 16 18 09 00 77 01 D8 3E 34 0F 2A 16 16 
      Pet.PetOwner = self;                                                      //0052 : 0F 19 01 D8 3E 34 0F 05 00 04 01 10 51 32 0F 17 
      Pet.cl_PlayPawnEffect(7);                                                 //0062 : 19 01 D8 3E 34 0F 08 00 00 1B 16 0C 00 00 24 07 16 
      PetSummoned.Trigger();                                                    //0073 : 19 01 88 51 32 0F 06 00 00 1C 00 96 84 0F 16 
      HasPet = True;                                                            //0082 : 14 2D 01 68 41 34 0F 27 
    }
    //07 2F 00 82 2D 01 68 41 34 0F 18 09 00 72 00 A8 4F 32 0F 2A 16 16 19 01 D8 3E 34 0F 08 00 00 1B 
    //16 0C 00 00 24 08 16 14 2D 01 68 41 34 0F 28 0F 01 D8 3E 34 0F 00 A8 4F 32 0F 07 8A 00 82 81 2D 
    //01 68 41 34 0F 16 18 09 00 77 01 D8 3E 34 0F 2A 16 16 0F 19 01 D8 3E 34 0F 05 00 04 01 10 51 32 
    //0F 17 19 01 D8 3E 34 0F 08 00 00 1B 16 0C 00 00 24 07 16 19 01 88 51 32 0F 06 00 00 1C 00 96 84 
    //0F 16 14 2D 01 68 41 34 0F 27 04 0B 47 
  }


  final event sv_SpawnPet(export editinline NPC_Type aType,byte aDefaultMoveState,byte aDefaultAttackState,bool IsUserControlledAction) {
    local Game_NPCController PC;
    local Vector SpawnLocation;
    local Vector Extent;
    sv_DestroyPet(True);                                                        //0000 : 1C 78 3D 34 0F 27 16 
    if (IsGrounded()) {                                                         //0007 : 07 5B 02 1B 90 0F 00 00 16 
      Extent.X = aType.GetCollisionRadius();                                    //0010 : 0F 36 48 C4 69 0F 00 28 53 32 0F 19 00 B0 52 32 0F 06 00 04 1B 9B 0C 00 00 16 
      Extent.Y = Extent.X;                                                      //002A : 0F 36 C0 C4 69 0F 00 28 53 32 0F 36 48 C4 69 0F 00 28 53 32 0F 
      Extent.Z = aType.GetCollisionHeight();                                    //003F : 0F 36 38 C5 69 0F 00 28 53 32 0F 19 00 B0 52 32 0F 06 00 04 1B 5D 0C 00 00 16 
      SpawnLocation = Class'Content_API'.NearestValidLocation(self,Location,Extent,False);//0059 : 0F 00 A0 53 32 0F 12 20 40 5D 5B 01 12 00 0C 1B 06 0E 00 00 17 01 30 81 6C 0F 00 28 53 32 0F 28 16 
      if (SpawnLocation == vect(0.000000, 0.000000, 0.000000)
        || VSize(SpawnLocation - Location) > 500.00000000) {//007A : 07 D1 00 84 D9 00 A0 53 32 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 18 16 00 B1 E1 D8 00 A0 53 32 0F 01 30 81 6C 0F 16 16 1E 00 00 FA 43 16 16 
        sv2cl_AddScrollingCombatMessage_CallStub(Class'StringReferences'.default.Pet_Spawn_Failed.Id,Class'FSkill_Enums'.16);//00AB : 1B EC 0C 00 00 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 54 32 0F 12 20 00 31 5D 01 02 00 01 24 10 16 
        return;                                                                 //00CF : 04 0B 
      }
      SpawnLocation.Z += 0.50000000;                                            //00D1 : B8 36 38 C5 69 0F 00 A0 53 32 0F 1E 00 00 00 3F 16 
      PC = Spawn(sv_GetPetControllerClass(),Controller,'None',SpawnLocation,Rotation);//00E2 : 0F 00 90 54 32 0F 61 16 1B 48 0E 00 00 16 01 00 6E 6C 0F 21 00 00 00 00 00 A0 53 32 0F 01 00 84 6C 0F 16 
      PC.sv_SetPetOwner(self);                                                  //0105 : 19 00 90 54 32 0F 07 00 00 1B A2 0D 00 00 17 16 
      PC.NPCType = aType;                                                       //0115 : 0F 19 00 90 54 32 0F 05 00 04 01 80 BC 35 0F 00 B0 52 32 0F 
      PC.sv_OnSpawn(CharacterStats.mRecord.FameLevel,aType.PePRank,Character.GetFaction());//0129 : 19 00 90 54 32 0F 36 00 00 1B 75 07 00 00 36 00 2D 34 0F 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 19 00 B0 52 32 0F 05 00 04 01 F0 2D 34 0F 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 16 
      if (PC.Pawn != None) {                                                    //0168 : 07 4F 02 77 19 00 90 54 32 0F 05 00 04 01 88 83 6C 0F 2A 16 
        Pet = Game_PetPawn(PC.Pawn);                                            //017C : 0F 01 D8 3E 34 0F 2E 98 42 5B 01 19 00 90 54 32 0F 05 00 04 01 88 83 6C 0F 
        Pet.PetOwner = self;                                                    //0195 : 0F 19 01 D8 3E 34 0F 05 00 04 01 10 51 32 0F 17 
        Pet.sv2clrel_SetPetOwner_CallStub(self);                                //01A5 : 19 01 D8 3E 34 0F 07 00 00 1B C4 0D 00 00 17 16 
        PC.sv_InitInternal();                                                   //01B5 : 19 00 90 54 32 0F 06 00 00 1B 99 0E 00 00 16 
        PC.sv_SetPetMoveState(aDefaultMoveState);                               //01C4 : 19 00 90 54 32 0F 0B 00 00 1B 39 07 00 00 00 E0 2E 34 0F 16 
        PC.sv_SetPetAttackState(aDefaultAttackState);                           //01D8 : 19 00 90 54 32 0F 0B 00 00 1B 38 07 00 00 00 58 2F 34 0F 16 
        if (Pet != None) {                                                      //01EC : 07 4C 02 77 01 D8 3E 34 0F 2A 16 
          HasPet = True;                                                        //01F7 : 14 2D 01 68 41 34 0F 27 
          if (IsUserControlledAction) {                                         //01FF : 07 49 02 2D 00 D0 2F 34 0F 
            if (ClassIsChildOf(Class,Class'Game_PlayerPawn')) {                 //0208 : 07 46 02 61 02 01 68 E5 6B 0F 20 F0 47 5B 01 16 
              if (BodySlots.GetMode() == 1) {                                   //0218 : 07 43 02 9A 39 3A 19 01 90 42 34 0F 06 00 01 1C 48 30 34 0F 16 39 3A 24 01 16 
                BodySlots.sv_SetMode(2);                                        //0232 : 19 01 90 42 34 0F 08 00 00 1C 80 43 34 0F 24 02 16 
              }
              goto jl0246;                                                      //0243 : 06 46 02 
            }
            goto jl0249;                                                        //0246 : 06 49 02 
          }
          goto jl024C;                                                          //0249 : 06 4C 02 
        }
      } else {                                                                  //024C : 06 5B 02 
        PC.Destroy();                                                           //024F : 19 00 90 54 32 0F 03 00 04 61 17 16 
      }
    }
    if (Pet == None) {                                                          //025B : 07 8A 02 72 01 D8 3E 34 0F 2A 16 
      sv2cl_AddScrollingCombatMessage_CallStub(Class'StringReferences'.default.Pet_Spawn_Failed.Id,Class'FSkill_Enums'.16);//0266 : 1B EC 0C 00 00 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 54 32 0F 12 20 00 31 5D 01 02 00 01 24 10 16 
    }
    //1C 78 3D 34 0F 27 16 07 5B 02 1B 90 0F 00 00 16 0F 36 48 C4 69 0F 00 28 53 32 0F 19 00 B0 52 32 
    //0F 06 00 04 1B 9B 0C 00 00 16 0F 36 C0 C4 69 0F 00 28 53 32 0F 36 48 C4 69 0F 00 28 53 32 0F 0F 
    //36 38 C5 69 0F 00 28 53 32 0F 19 00 B0 52 32 0F 06 00 04 1B 5D 0C 00 00 16 0F 00 A0 53 32 0F 12 
    //20 40 5D 5B 01 12 00 0C 1B 06 0E 00 00 17 01 30 81 6C 0F 00 28 53 32 0F 28 16 07 D1 00 84 D9 00 
    //A0 53 32 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 18 16 00 B1 E1 D8 00 A0 53 32 0F 01 30 81 
    //6C 0F 16 16 1E 00 00 FA 43 16 16 1B EC 0C 00 00 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 
    //54 32 0F 12 20 00 31 5D 01 02 00 01 24 10 16 04 0B B8 36 38 C5 69 0F 00 A0 53 32 0F 1E 00 00 00 
    //3F 16 0F 00 90 54 32 0F 61 16 1B 48 0E 00 00 16 01 00 6E 6C 0F 21 00 00 00 00 00 A0 53 32 0F 01 
    //00 84 6C 0F 16 19 00 90 54 32 0F 07 00 00 1B A2 0D 00 00 17 16 0F 19 00 90 54 32 0F 05 00 04 01 
    //80 BC 35 0F 00 B0 52 32 0F 19 00 90 54 32 0F 36 00 00 1B 75 07 00 00 36 00 2D 34 0F 19 01 08 43 
    //34 0F 05 00 68 01 78 2D 34 0F 19 00 B0 52 32 0F 05 00 04 01 F0 2D 34 0F 19 01 68 2E 34 0F 06 00 
    //04 1B 6D 05 00 00 16 16 07 4F 02 77 19 00 90 54 32 0F 05 00 04 01 88 83 6C 0F 2A 16 0F 01 D8 3E 
    //34 0F 2E 98 42 5B 01 19 00 90 54 32 0F 05 00 04 01 88 83 6C 0F 0F 19 01 D8 3E 34 0F 05 00 04 01 
    //10 51 32 0F 17 19 01 D8 3E 34 0F 07 00 00 1B C4 0D 00 00 17 16 19 00 90 54 32 0F 06 00 00 1B 99 
    //0E 00 00 16 19 00 90 54 32 0F 0B 00 00 1B 39 07 00 00 00 E0 2E 34 0F 16 19 00 90 54 32 0F 0B 00 
    //00 1B 38 07 00 00 00 58 2F 34 0F 16 07 4C 02 77 01 D8 3E 34 0F 2A 16 14 2D 01 68 41 34 0F 27 07 
    //49 02 2D 00 D0 2F 34 0F 07 46 02 61 02 01 68 E5 6B 0F 20 F0 47 5B 01 16 07 43 02 9A 39 3A 19 01 
    //90 42 34 0F 06 00 01 1C 48 30 34 0F 16 39 3A 24 01 16 19 01 90 42 34 0F 08 00 00 1C 80 43 34 0F 
    //24 02 16 06 46 02 06 49 02 06 4C 02 06 5B 02 19 00 90 54 32 0F 03 00 04 61 17 16 07 8A 02 72 01 
    //D8 3E 34 0F 2A 16 1B EC 0C 00 00 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 54 32 0F 12 20 
    //00 31 5D 01 02 00 01 24 10 16 04 0B 47 
  }


  native function DebugText(byte aFilter,Vector aLocation,string aText,Color aColor);


  native function DebugDisc(byte aFilter,Vector aCenter,float aSize,Color aColor);


  native function DebugCircle(byte aFilter,Vector aCenter,float aSize,Color aColor,optional int aWidth);


  native function DebugBox(byte aFilter,Vector aLocation,Vector aSize,Color aColor);


  native function DebugRectangle(byte aFilter,Vector aLocation,Vector aSize,Color aColor,optional int aWidth);


  native function DebugLine(byte aFilter,Vector aFrom,Vector aTo,Color aColor,optional int aWidth);


  function AddDebugDrawFilter(string aFilter) {
    local int di;
    local name enumname;
    local int Flag;
    if (aFilter == "none" || aFilter == "off") {                                //0000 : 07 2B 00 84 7A 00 40 76 84 0F 1F 6E 6F 6E 65 00 16 18 0D 00 7A 00 40 76 84 0F 1F 6F 66 66 00 16 16 
      mDebugFilters = 0;                                                        //0021 : 0F 01 B8 76 84 0F 25 
    } else {                                                                    //0028 : 06 10 01 
      if (aFilter == "default" || aFilter == "") {                              //002B : 07 63 00 84 7A 00 40 76 84 0F 1F 64 65 66 61 75 6C 74 00 16 18 0A 00 7A 00 40 76 84 0F 1F 00 16 16 
        mDebugFilters = Class.default.mDebugFilters;                            //004C : 0F 01 B8 76 84 0F 12 01 68 E5 6B 0F 05 00 04 02 B8 76 84 0F 
      } else {                                                                  //0060 : 06 10 01 
        di = 0;                                                                 //0063 : 0F 00 30 77 84 0F 25 
        while (di < 32) {                                                       //006A : 07 10 01 96 00 30 77 84 0F 2C 20 16 
          enumname = static.GetEnum(Enum'EDebugDrawFilters',di);                //0076 : 0F 00 D8 A7 35 0F 1C B8 E9 69 0F 20 D8 BF 35 0F 00 30 77 84 0F 16 
          if (enumname == 'None') {                                             //008C : 07 9E 00 FE 00 D8 A7 35 0F 21 00 00 00 00 16 
          } else {                                                              //009B : 06 06 01 
            if (Caps(string(enumname)) == Caps("EDD_" $ aFilter)) {             //009E : 07 06 01 7A EB 39 57 00 D8 A7 35 0F 16 EB 70 1F 45 44 44 5F 00 00 40 76 84 0F 16 16 16 
              Flag = 1 << di;                                                   //00BB : 0F 00 50 A8 35 0F 94 26 00 30 77 84 0F 16 
              if ((mDebugFilters & Flag) == 0) {                                //00C9 : 07 F0 00 9A 9C 01 B8 76 84 0F 00 50 A8 35 0F 16 25 16 
                mDebugFilters = mDebugFilters | Flag;                           //00DB : 0F 01 B8 76 84 0F 9E 01 B8 76 84 0F 00 50 A8 35 0F 16 
              } else {                                                          //00ED : 06 04 01 
                mDebugFilters = mDebugFilters & ~Flag;                          //00F0 : 0F 01 B8 76 84 0F 9C 01 B8 76 84 0F 8D 00 50 A8 35 0F 16 16 
              }
              return;                                                           //0104 : 04 0B 
            }
          }
          di++;                                                                 //0106 : A5 00 30 77 84 0F 16 
        }
      }
    }
    //07 2B 00 84 7A 00 40 76 84 0F 1F 6E 6F 6E 65 00 16 18 0D 00 7A 00 40 76 84 0F 1F 6F 66 66 00 16 
    //16 0F 01 B8 76 84 0F 25 06 10 01 07 63 00 84 7A 00 40 76 84 0F 1F 64 65 66 61 75 6C 74 00 16 18 
    //0A 00 7A 00 40 76 84 0F 1F 00 16 16 0F 01 B8 76 84 0F 12 01 68 E5 6B 0F 05 00 04 02 B8 76 84 0F 
    //06 10 01 0F 00 30 77 84 0F 25 07 10 01 96 00 30 77 84 0F 2C 20 16 0F 00 D8 A7 35 0F 1C B8 E9 69 
    //0F 20 D8 BF 35 0F 00 30 77 84 0F 16 07 9E 00 FE 00 D8 A7 35 0F 21 00 00 00 00 16 06 06 01 07 06 
    //01 7A EB 39 57 00 D8 A7 35 0F 16 EB 70 1F 45 44 44 5F 00 00 40 76 84 0F 16 16 16 0F 00 50 A8 35 
    //0F 94 26 00 30 77 84 0F 16 07 F0 00 9A 9C 01 B8 76 84 0F 00 50 A8 35 0F 16 25 16 0F 01 B8 76 84 
    //0F 9E 01 B8 76 84 0F 00 50 A8 35 0F 16 06 04 01 0F 01 B8 76 84 0F 9C 01 B8 76 84 0F 8D 00 50 A8 
    //35 0F 16 16 04 0B A5 00 30 77 84 0F 16 06 6A 00 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputEvade_CallStub();


  event sv2cl_CombatMessageOutputEvade(int aSkillResourceID,int aEffectResourceID,Game_Pawn aTarget) {
    local export editinline FSkill_Type Skill;
    local export editinline FSkill_EffectClass effect;
    Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillResourceID));   //0000 : 0F 00 D0 AB 35 0F 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 28 AA 35 0F 16 
    effect = FSkill_EffectClass(Class'SBDBSync'.GetResourceObject(aEffectResourceID));//001F : 0F 00 48 AC 35 0F 2E 40 8A 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 C0 AC 35 0F 16 
    effect.cl_CombatLogMessage(Class'StringReferences'.default.EffectTargetText.Text,Class'StringReferences'.default.CombatOutputEvadeText.Text,Skill,None,self,aTarget,0,0,0);//003E : 19 00 48 AC 35 0F 3B 00 00 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 AD 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 AD 35 0F 00 D0 AB 35 0F 2A 17 00 28 AE 35 0F 25 25 25 16 
    if (aTarget != None) {                                                      //0082 : 07 BA 00 77 00 28 AE 35 0F 2A 16 
      aTarget.cl_AddScrollingCombatMessage(Class'StringReferences'.default.CombatEvadeText.Text,Class'FSkill_Enums'.14);//008D : 19 00 28 AE 35 0F 24 00 00 1B 03 0C 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 AE 35 0F 12 20 00 31 5D 01 02 00 01 24 0E 16 
    }
    //0F 00 D0 AB 35 0F 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 28 AA 35 0F 16 0F 
    //00 48 AC 35 0F 2E 40 8A 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 C0 AC 35 0F 16 19 00 
    //48 AC 35 0F 3B 00 00 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 AD 35 0F 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 AD 35 0F 00 D0 AB 35 0F 2A 17 00 28 AE 35 0F 25 25 
    //25 16 07 BA 00 77 00 28 AE 35 0F 2A 16 19 00 28 AE 35 0F 24 00 00 1B 03 0C 00 00 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 A0 AE 35 0F 12 20 00 31 5D 01 02 00 01 24 0E 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputImmune_CallStub();


  event sv2cl_CombatMessageOutputImmune(int aSkillResourceID,int aEffectResourceID,Game_Pawn aTarget) {
    local export editinline FSkill_Type Skill;
    local export editinline FSkill_EffectClass effect;
    Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillResourceID));   //0000 : 0F 00 20 B2 35 0F 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 78 B0 35 0F 16 
    effect = FSkill_EffectClass(Class'SBDBSync'.GetResourceObject(aEffectResourceID));//001F : 0F 00 98 B2 35 0F 2E 40 8A 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 10 B3 35 0F 16 
    effect.cl_CombatLogMessage(Class'StringReferences'.default.EffectTargetText.Text,Class'StringReferences'.default.CombatOutputImmuneText.Text,Skill,None,self,aTarget,0,0,0);//003E : 19 00 98 B2 35 0F 3B 00 00 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 AD 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 B3 35 0F 00 20 B2 35 0F 2A 17 00 00 B4 35 0F 25 25 25 16 
    if (aTarget != None) {                                                      //0082 : 07 BA 00 77 00 00 B4 35 0F 2A 16 
      aTarget.cl_AddScrollingCombatMessage(Class'StringReferences'.default.CombatImmuneText.Text,Class'FSkill_Enums'.14);//008D : 19 00 00 B4 35 0F 24 00 00 1B 03 0C 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 B4 35 0F 12 20 00 31 5D 01 02 00 01 24 0E 16 
    }
    //0F 00 20 B2 35 0F 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 78 B0 35 0F 16 0F 
    //00 98 B2 35 0F 2E 40 8A 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 10 B3 35 0F 16 19 00 
    //98 B2 35 0F 3B 00 00 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 AD 35 0F 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 B3 35 0F 00 20 B2 35 0F 2A 17 00 00 B4 35 0F 25 25 
    //25 16 07 BA 00 77 00 00 B4 35 0F 2A 16 19 00 00 B4 35 0F 24 00 00 1B 03 0C 00 00 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 78 B4 35 0F 12 20 00 31 5D 01 02 00 01 24 0E 16 04 0B 47 
  }


  event cl_CombatMessageUnableToExecute(int aSkillResourceID) {
    cl_CombatLogMessage(Class'StringReferences'.default.EffectSourceText.Text,Class'StringReferences'.default.CombatUnableToExecuteText.Text,aSkillResourceID,0,self,None);//0000 : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 B7 35 0F 00 A0 B5 35 0F 25 17 2A 16 
    //1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 
    //F7 60 01 05 00 0C 02 08 B7 35 0F 00 A0 B5 35 0F 25 17 2A 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputDuffUnApply_CallStub();


  event sv2cl_CombatMessageInputDuffUnApply(int aDuffResourceID) {
    cl_CombatLogMessage(Class'StringReferences'.default.EffectTargetText.Text,Class'StringReferences'.default.CombatInputDuffUnApplyText.Text,0,aDuffResourceID,None,self);//0000 : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 AD 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 5C 33 0F 25 00 50 5B 33 0F 2A 17 16 
    //1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 AD 35 0F 36 58 C6 6B 0F 12 20 20 
    //F7 60 01 05 00 0C 02 40 5C 33 0F 25 00 50 5B 33 0F 2A 17 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputDuffApply_CallStub();


  event sv2cl_CombatMessageInputDuffApply(int aDuffResourceID,Game_Pawn aSource) {
    local export editinline FSkill_Event_Duff duffEvent;
    duffEvent = FSkill_Event_Duff(Class'SBDBSync'.GetResourceObject(aDuffResourceID));//0000 : 0F 00 68 5F 33 0F 2E 80 65 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 18 5E 33 0F 16 
    cl_CombatLogMessage(Class'StringReferences'.default.EffectSourceText.Text,Class'StringReferences'.default.CombatInputDuffApplyText.Text,0,aDuffResourceID,aSource,None);//001F : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E0 5F 33 0F 25 00 18 5E 33 0F 00 58 60 33 0F 2A 16 
    self.cl_AddScrollingCombatMessage(duffEvent.GetName(),Class'FSkill_Enums'.11);//0057 : 19 17 20 00 00 1B 03 0C 00 00 19 00 68 5F 33 0F 06 00 00 1C D0 60 33 0F 16 12 20 00 31 5D 01 02 00 01 24 0B 16 
    //0F 00 68 5F 33 0F 2E 80 65 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 18 5E 33 0F 16 1B 
    //2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 
    //60 01 05 00 0C 02 E0 5F 33 0F 25 00 18 5E 33 0F 00 58 60 33 0F 2A 16 19 17 20 00 00 1B 03 0C 00 
    //00 19 00 68 5F 33 0F 06 00 00 1C D0 60 33 0F 16 12 20 00 31 5D 01 02 00 01 24 0B 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputDuffApply_CallStub();


  event sv2cl_CombatMessageOutputDuffApply(int aDuffResourceID,Game_Pawn aTarget) {
    local export editinline FSkill_Event_Duff duffEvent;
    duffEvent = FSkill_Event_Duff(Class'SBDBSync'.GetResourceObject(aDuffResourceID));//0000 : 0F 00 38 64 33 0F 2E 80 65 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 E0 62 33 0F 16 
    cl_CombatLogMessage(Class'StringReferences'.default.EffectSourceText.Text,Class'StringReferences'.default.CombatOutputduffApplySourceText.Text,0,aDuffResourceID,self,aTarget);//001F : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 64 33 0F 25 00 E0 62 33 0F 17 00 28 65 33 0F 16 
    aTarget.cl_AddScrollingCombatMessage(duffEvent.GetName(),Class'FSkill_Enums'.12);//0057 : 19 00 28 65 33 0F 20 00 00 1B 03 0C 00 00 19 00 38 64 33 0F 06 00 00 1C D0 60 33 0F 16 12 20 00 31 5D 01 02 00 01 24 0C 16 
    //0F 00 38 64 33 0F 2E 80 65 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 E0 62 33 0F 16 1B 
    //2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 
    //60 01 05 00 0C 02 B0 64 33 0F 25 00 E0 62 33 0F 17 00 28 65 33 0F 16 19 00 28 65 33 0F 20 00 00 
    //1B 03 0C 00 00 19 00 38 64 33 0F 06 00 00 1C D0 60 33 0F 16 12 20 00 31 5D 01 02 00 01 24 0C 16 
    //04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputDrainNonDamage_CallStub();


  private event sv2cl_CombatMessageOutputDrainNonDamage(int aDuffOrSkillResourceID,Game_Pawn aTarget,int aAmount,int aGainedAmount,int aEffectResourceID) {
    cl_CombatMessage(aDuffOrSkillResourceID,aDuffOrSkillResourceID,aEffectResourceID,self,aTarget,aAmount,0,aGainedAmount);//0000 : 1B 2C 05 00 00 00 00 67 33 0F 00 00 67 33 0F 00 78 67 33 0F 17 00 F0 67 33 0F 00 68 68 33 0F 25 00 E0 68 33 0F 16 
    //1B 2C 05 00 00 00 00 67 33 0F 00 00 67 33 0F 00 78 67 33 0F 17 00 F0 67 33 0F 00 68 68 33 0F 25 
    //00 E0 68 33 0F 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputDrainNonDamage_CallStub();


  private event sv2cl_CombatMessageInputDrainNonDamage(int aDuffOrSkillResourceID,Game_Pawn aSource,int aAmount,int aGainedAmount,int aEffectResourceID) {
    cl_CombatMessage(aDuffOrSkillResourceID,aDuffOrSkillResourceID,aEffectResourceID,aSource,self,aAmount,0,aGainedAmount);//0000 : 1B 2C 05 00 00 00 B8 6A 33 0F 00 B8 6A 33 0F 00 30 6B 33 0F 00 A8 6B 33 0F 17 00 20 6C 33 0F 25 00 98 6C 33 0F 16 
    //1B 2C 05 00 00 00 B8 6A 33 0F 00 B8 6A 33 0F 00 30 6B 33 0F 00 A8 6B 33 0F 17 00 20 6C 33 0F 25 
    //00 98 6C 33 0F 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputDrainDamage_CallStub();


  private event sv2cl_CombatMessageOutputDrainDamage(int aDuffOrSkillResourceID,Game_Pawn aTarget,int aAmount,int aResistedAmount,int aGainedAmount,int aEffectResourceID) {
    cl_CombatMessage(aDuffOrSkillResourceID,aDuffOrSkillResourceID,aEffectResourceID,self,aTarget,aAmount,aResistedAmount,aGainedAmount);//0000 : 1B 2C 05 00 00 00 90 A0 84 0F 00 90 A0 84 0F 00 70 A1 84 0F 17 00 E8 A1 84 0F 00 60 A2 84 0F 00 D8 A2 84 0F 00 50 A3 84 0F 16 
    //1B 2C 05 00 00 00 90 A0 84 0F 00 90 A0 84 0F 00 70 A1 84 0F 17 00 E8 A1 84 0F 00 60 A2 84 0F 00 
    //D8 A2 84 0F 00 50 A3 84 0F 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputDrainDamage_CallStub();


  private event sv2cl_CombatMessageInputDrainDamage(int aDuffOrSkillResourceID,Game_Pawn aSource,int aAmount,int aResistedAmount,int aGainedAmount,int aEffectResourceID) {
    cl_CombatMessage(aDuffOrSkillResourceID,aDuffOrSkillResourceID,aEffectResourceID,aSource,self,aAmount,aResistedAmount,aGainedAmount);//0000 : 1B 2C 05 00 00 00 28 A5 84 0F 00 28 A5 84 0F 00 08 A6 84 0F 00 80 A6 84 0F 17 00 F8 A6 84 0F 00 70 A7 84 0F 00 E8 A7 84 0F 16 
    //1B 2C 05 00 00 00 28 A5 84 0F 00 28 A5 84 0F 00 08 A6 84 0F 00 80 A6 84 0F 17 00 F8 A6 84 0F 00 
    //70 A7 84 0F 00 E8 A7 84 0F 16 04 0B 47 
  }


  native event cl_CombatMessageTeleport(int aSkillResourceID,int aDuffResourceID,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3);


  protected native function sv2cl_CombatMessageInputTeleport_CallStub();


  event sv2cl_CombatMessageInputTeleport(Game_Pawn aSource) {
    cl_CombatMessageTeleport(0,0,aSource,self,0,0,0);                           //0000 : 1B 2F 05 00 00 25 25 00 18 AE 84 0F 17 25 25 25 16 
    //1B 2F 05 00 00 25 25 00 18 AE 84 0F 17 25 25 25 16 04 0B 47 
  }


  native event cl_CombatMessageHeal(int aSkillResourceID,int aDuffResourceID,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3);


  protected native function sv2cl_CombatMessageOutputHeal_CallStub();


  private event sv2cl_CombatMessageOutputHeal(int aSkillResourceID,Game_Pawn aTarget,int aAmount) {
    cl_CombatMessageHeal(aSkillResourceID,0,self,aTarget,aAmount,0,0);          //0000 : 1B 2E 05 00 00 00 48 B4 84 0F 25 17 00 10 B5 84 0F 00 88 B5 84 0F 25 25 16 
    //1B 2E 05 00 00 00 48 B4 84 0F 25 17 00 10 B5 84 0F 00 88 B5 84 0F 25 25 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputHeal_CallStub();


  private event sv2cl_CombatMessageInputHeal(int aSkillResourceID,Game_Pawn aSource,int aAmount) {
    cl_CombatMessageHeal(aSkillResourceID,0,aSource,self,aAmount,0,0);          //0000 : 1B 2E 05 00 00 00 60 B7 84 0F 25 00 28 B8 84 0F 17 00 A0 B8 84 0F 25 25 16 
    //1B 2E 05 00 00 00 60 B7 84 0F 25 00 28 B8 84 0F 17 00 A0 B8 84 0F 25 25 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputHealOverTime_CallStub();


  private event sv2cl_CombatMessageInputHealOverTime(int aDuffResourceID,int aAmount) {
    cl_CombatMessageHeal(0,aDuffResourceID,self,self,aAmount,0,0);              //0000 : 1B 2E 05 00 00 25 00 78 BA 84 0F 17 17 00 40 BB 84 0F 25 25 16 
    //1B 2E 05 00 00 25 00 78 BA 84 0F 17 17 00 40 BB 84 0F 25 25 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputState_CallStub();


  private event sv2cl_CombatMessageOutputState(int aSkillResourceID,Game_Pawn aTarget,int aAmount,int aEffectResourceID) {
    cl_CombatMessage(aSkillResourceID,0,aEffectResourceID,self,aTarget,aAmount,0,0);//0000 : 1B 2C 05 00 00 00 18 BD 84 0F 25 00 E8 BD 84 0F 17 00 60 BE 84 0F 00 D8 BE 84 0F 25 25 16 
    //1B 2C 05 00 00 00 18 BD 84 0F 25 00 E8 BD 84 0F 17 00 60 BE 84 0F 00 D8 BE 84 0F 25 25 16 04 0B 
    //47 
  }


  protected native function sv2cl_CombatMessageInputState_CallStub();


  private event sv2cl_CombatMessageInputState(int aSkillResourceID,Game_Pawn aSource,int aAmount,int aEffectResourceID) {
    cl_CombatMessage(aSkillResourceID,0,aEffectResourceID,aSource,self,aAmount,0,0);//0000 : 1B 2C 05 00 00 00 B8 C0 84 0F 25 00 88 C1 84 0F 00 00 C2 84 0F 17 00 78 C2 84 0F 25 25 16 
    //1B 2C 05 00 00 00 B8 C0 84 0F 25 00 88 C1 84 0F 00 00 C2 84 0F 17 00 78 C2 84 0F 25 25 16 04 0B 
    //47 
  }


  protected native function sv2cl_CombatMessageInputStateOverTime_CallStub();


  private event sv2cl_CombatMessageInputStateOverTime(int aDuffResourceID,int aAmount,int aEffectResourceID) {
    cl_CombatMessage(0,aDuffResourceID,aEffectResourceID,self,self,aAmount,0,0);//0000 : 1B 2C 05 00 00 25 00 50 C4 84 0F 00 18 C5 84 0F 17 17 00 90 C5 84 0F 25 25 16 
    //1B 2C 05 00 00 25 00 50 C4 84 0F 00 18 C5 84 0F 17 17 00 90 C5 84 0F 25 25 16 04 0B 47 
  }


  native event cl_CombatMessageDamage(int aSkillResourceID,int aDuffResourceID,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3);


  protected native function sv2cl_CombatMessageOutputDamage_CallStub();


  private event sv2cl_CombatMessageOutputDamage(int aSkillResourceID,Game_Pawn aTarget,int aAmount,int aResistedAmount) {
    cl_CombatMessageDamage(aSkillResourceID,0,self,aTarget,aAmount,aResistedAmount,0);//0000 : 1B 2D 05 00 00 00 C0 CB 84 0F 25 17 00 90 CC 84 0F 00 08 CD 84 0F 00 80 CD 84 0F 25 16 
    //1B 2D 05 00 00 00 C0 CB 84 0F 25 17 00 90 CC 84 0F 00 08 CD 84 0F 00 80 CD 84 0F 25 16 04 0B 47 
    //
  }


  protected native function sv2cl_CombatMessageInputDamage_CallStub();


  private event sv2cl_CombatMessageInputDamage(int aSkillResourceID,Game_Pawn aSource,int aAmount,int aResistedAmount) {
    cl_CombatMessageDamage(aSkillResourceID,0,aSource,self,aAmount,aResistedAmount,0);//0000 : 1B 2D 05 00 00 00 B8 DA 84 0F 25 00 88 DB 84 0F 17 00 00 DC 84 0F 00 78 DC 84 0F 25 16 
    //1B 2D 05 00 00 00 B8 DA 84 0F 25 00 88 DB 84 0F 17 00 00 DC 84 0F 00 78 DC 84 0F 25 16 04 0B 47 
    //
  }


  protected native function sv2cl_CombatMessageInputDamageOverTime_CallStub();


  private event sv2cl_CombatMessageInputDamageOverTime(int aSkillResourceID,int aDuffResourceID,int aAmount,int aResistedAmount) {
    cl_CombatMessageDamage(aSkillResourceID,aDuffResourceID,self,self,aAmount,aResistedAmount,0);//0000 : 1B 2D 05 00 00 00 50 DE 84 0F 00 20 DF 84 0F 17 17 00 00 32 31 0F 00 78 32 31 0F 25 16 
    //1B 2D 05 00 00 00 50 DE 84 0F 00 20 DF 84 0F 17 17 00 00 32 31 0F 00 78 32 31 0F 25 16 04 0B 47 
    //
  }


  protected native function sv2cl_CombatMessageInputShareNonDamage_CallStub();


  private event sv2cl_CombatMessageInputShareNonDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aSource,int aAmount,int aResistedAmount,int aRedirectedEffectType) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,aSource,self,aAmount,aResistedAmount,aRedirectedEffectType);//0000 : 1B 2C 05 00 00 00 50 34 31 0F 00 C8 34 31 0F 00 40 35 31 0F 00 B8 35 31 0F 17 00 30 36 31 0F 00 A8 36 31 0F 00 20 37 31 0F 16 
    //1B 2C 05 00 00 00 50 34 31 0F 00 C8 34 31 0F 00 40 35 31 0F 00 B8 35 31 0F 17 00 30 36 31 0F 00 
    //A8 36 31 0F 00 20 37 31 0F 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputShareNonDamage_CallStub();


  private event sv2cl_CombatMessageOutputShareNonDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aTarget,int aAmount,int aResistedAmount,int aRedirectedEffectType) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,self,aTarget,aAmount,aResistedAmount,aRedirectedEffectType);//0000 : 1B 2C 05 00 00 00 F8 38 31 0F 00 08 E0 84 0F 00 80 E0 84 0F 17 00 F8 E0 84 0F 00 70 E1 84 0F 00 E8 E1 84 0F 00 60 E2 84 0F 16 
    //1B 2C 05 00 00 00 F8 38 31 0F 00 08 E0 84 0F 00 80 E0 84 0F 17 00 F8 E0 84 0F 00 70 E1 84 0F 00 
    //E8 E1 84 0F 00 60 E2 84 0F 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputShareDamage_CallStub();


  private event sv2cl_CombatMessageInputShareDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aSource,int aAmount,int aResistedAmount) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,aSource,self,aAmount,aResistedAmount,0);//0000 : 1B 2C 05 00 00 00 38 E4 84 0F 00 10 E5 84 0F 00 88 E5 84 0F 00 00 E6 84 0F 17 00 78 E6 84 0F 00 F0 E6 84 0F 25 16 
    //1B 2C 05 00 00 00 38 E4 84 0F 00 10 E5 84 0F 00 88 E5 84 0F 00 00 E6 84 0F 17 00 78 E6 84 0F 00 
    //F0 E6 84 0F 25 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputShareDamage_CallStub();


  private event sv2cl_CombatMessageOutputShareDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aTarget,int aAmount,int aResistedAmount) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,self,aTarget,aAmount,aResistedAmount,0);//0000 : 1B 2C 05 00 00 00 C8 E8 84 0F 00 A0 E9 84 0F 00 18 EA 84 0F 17 00 90 EA 84 0F 00 08 EB 84 0F 00 80 EB 84 0F 25 16 
    //1B 2C 05 00 00 00 C8 E8 84 0F 00 A0 E9 84 0F 00 18 EA 84 0F 17 00 90 EA 84 0F 00 08 EB 84 0F 00 
    //80 EB 84 0F 25 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputReturnReflectNonDamage_CallStub();


  private event sv2cl_CombatMessageInputReturnReflectNonDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aSource,int aAmount,int aResistedAmount,int aRedirectedEffectType) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,aSource,self,aAmount,aResistedAmount,aRedirectedEffectType);//0000 : 1B 2C 05 00 00 00 58 ED 84 0F 00 38 EE 84 0F 00 B0 EE 84 0F 00 28 EF 84 0F 17 00 A0 EF 84 0F 00 18 F0 84 0F 00 90 F0 84 0F 16 
    //1B 2C 05 00 00 00 58 ED 84 0F 00 38 EE 84 0F 00 B0 EE 84 0F 00 28 EF 84 0F 17 00 A0 EF 84 0F 00 
    //18 F0 84 0F 00 90 F0 84 0F 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputReturnReflectNonDamage_CallStub();


  private event sv2cl_CombatMessageOutputReturnReflectNonDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aTarget,int aAmount,int aResistedAmount,int aRedirectedEffectType) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,self,aTarget,aAmount,aResistedAmount,aRedirectedEffectType);//0000 : 1B 2C 05 00 00 00 68 F2 84 0F 00 48 F3 84 0F 00 C0 F3 84 0F 17 00 38 F4 84 0F 00 B0 F4 84 0F 00 28 F5 84 0F 00 A0 F5 84 0F 16 
    //1B 2C 05 00 00 00 68 F2 84 0F 00 48 F3 84 0F 00 C0 F3 84 0F 17 00 38 F4 84 0F 00 B0 F4 84 0F 00 
    //28 F5 84 0F 00 A0 F5 84 0F 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageInputReturnReflectDamage_CallStub();


  private event sv2cl_CombatMessageInputReturnReflectDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aSource,int aAmount,int aResistedAmount) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,aSource,self,aAmount,aResistedAmount,0);//0000 : 1B 2C 05 00 00 00 78 F7 84 0F 00 50 F8 84 0F 00 C8 F8 84 0F 00 40 F9 84 0F 17 00 B8 F9 84 0F 00 30 FA 84 0F 25 16 
    //1B 2C 05 00 00 00 78 F7 84 0F 00 50 F8 84 0F 00 C8 F8 84 0F 00 40 F9 84 0F 17 00 B8 F9 84 0F 00 
    //30 FA 84 0F 25 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageOutputReturnReflectDamage_CallStub();


  private event sv2cl_CombatMessageOutputReturnReflectDamage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aTarget,int aAmount,int aResistedAmount) {
    cl_CombatMessage(aSkillResourceID,aDuffResourceID,aEffectResourceID,self,aTarget,aAmount,aResistedAmount,0);//0000 : 1B 2C 05 00 00 00 08 FC 84 0F 00 E0 FC 84 0F 00 58 FD 84 0F 17 00 D0 FD 84 0F 00 48 FE 84 0F 00 C0 FE 84 0F 25 16 
    //1B 2C 05 00 00 00 08 FC 84 0F 00 E0 FC 84 0F 00 58 FD 84 0F 17 00 D0 FD 84 0F 00 48 FE 84 0F 00 
    //C0 FE 84 0F 25 16 04 0B 47 
  }


  protected native function sv2rel_CombatMessageDeath_CallStub();


  event sv2rel_CombatMessageDeath(Game_Pawn aKiller,Game_Pawn aTarget) {
    if (aKiller.IsLocalPlayer()) {                                              //0000 : 07 4D 00 19 00 F8 00 18 11 06 00 04 1C 18 1A 76 0F 16 
      cl_CombatLogMessage(Class'StringReferences'.default.EffectYouText.Text,Class'StringReferences'.default.CombatSlainText.Text,0,0,aKiller,aTarget);//0012 : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 01 18 11 25 25 00 F8 00 18 11 00 60 02 18 11 16 
    } else {                                                                    //004A : 06 85 00 
      cl_CombatLogMessage(Class'StringReferences'.default.EffectSourceText.Text,Class'StringReferences'.default.CombatSlainSourceText.Text,0,0,aKiller,aTarget);//004D : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 02 18 11 25 25 00 F8 00 18 11 00 60 02 18 11 16 
    }
    //07 4D 00 19 00 F8 00 18 11 06 00 04 1C 18 1A 76 0F 16 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 
    //60 01 05 00 0C 02 70 01 18 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 01 18 11 25 25 00 
    //F8 00 18 11 00 60 02 18 11 16 06 85 00 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 90 B6 35 0F 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 02 18 11 25 25 00 F8 00 18 11 00 
    //60 02 18 11 16 04 0B 47 
  }


  protected native function sv2cl_CombatMessageDeath_CallStub();


  event sv2cl_CombatMessageDeath(Game_Pawn aKiller) {
    cl_CombatLogMessage(Class'StringReferences'.default.EffectYouText.Text,Class'StringReferences'.default.CombatDeathText.Text,0,0,aKiller,self);//0000 : 1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 05 18 11 25 25 00 B0 04 18 11 17 16 
    //1B 2B 05 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 01 18 11 36 58 C6 6B 0F 12 20 20 
    //F7 60 01 05 00 0C 02 A0 05 18 11 25 25 00 B0 04 18 11 17 16 04 0B 47 
  }


  event cl_AddScrollingCombatValueOnOtherPlayer(byte aType,int aValue) {
    switch (aType) {                                                            //0000 : 05 01 00 C8 06 18 11 
      case 3 :                                                                  //0007 : 0A 4D 00 24 03 
        if (aValue > 0) {                                                       //000C : 07 31 00 97 00 60 08 18 11 25 16 
          cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.10,False);      //0017 : 1B 1B 0C 00 00 00 60 08 18 11 12 20 00 31 5D 01 02 00 01 24 0A 28 16 
        } else {                                                                //002E : 06 4A 00 
          cl_AddScrollingCombatValue(-aValue,Class'FSkill_Enums'.2,False);      //0031 : 1B 1B 0C 00 00 8F 00 60 08 18 11 16 12 20 00 31 5D 01 02 00 01 24 02 28 16 
        }
        break;                                                                  //004A : 06 AD 00 
      case 0 :                                                                  //004D : 0A 6C 00 24 00 
        cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.4,True);          //0052 : 1B 1B 0C 00 00 00 60 08 18 11 12 20 00 31 5D 01 02 00 01 24 04 27 16 
        break;                                                                  //0069 : 06 AD 00 
      case 1 :                                                                  //006C : 0A 8B 00 24 01 
        cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.6,True);          //0071 : 1B 1B 0C 00 00 00 60 08 18 11 12 20 00 31 5D 01 02 00 01 24 06 27 16 
        break;                                                                  //0088 : 06 AD 00 
      case 2 :                                                                  //008B : 0A AA 00 24 02 
        cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.8,True);          //0090 : 1B 1B 0C 00 00 00 60 08 18 11 12 20 00 31 5D 01 02 00 01 24 08 27 16 
        break;                                                                  //00A7 : 06 AD 00 
      default:                                                                  //00AA : 0A FF FF 
    }
    //05 01 00 C8 06 18 11 0A 4D 00 24 03 07 31 00 97 00 60 08 18 11 25 16 1B 1B 0C 00 00 00 60 08 18 
    //11 12 20 00 31 5D 01 02 00 01 24 0A 28 16 06 4A 00 1B 1B 0C 00 00 8F 00 60 08 18 11 16 12 20 00 
    //31 5D 01 02 00 01 24 02 28 16 06 AD 00 0A 6C 00 24 00 1B 1B 0C 00 00 00 60 08 18 11 12 20 00 31 
    //5D 01 02 00 01 24 04 27 16 06 AD 00 0A 8B 00 24 01 1B 1B 0C 00 00 00 60 08 18 11 12 20 00 31 5D 
    //01 02 00 01 24 06 27 16 06 AD 00 0A AA 00 24 02 1B 1B 0C 00 00 00 60 08 18 11 12 20 00 31 5D 01 
    //02 00 01 24 08 27 16 06 AD 00 0A FF FF 04 0B 47 
  }


  event cl_AddScrollingCombatValueOnLocalPlayer(byte aType,int aValue) {
    switch (aType) {                                                            //0000 : 05 01 00 D8 09 18 11 
      case 3 :                                                                  //0007 : 0A 4D 00 24 03 
        if (aValue > 0) {                                                       //000C : 07 31 00 97 00 70 0B 18 11 25 16 
          cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.9,False);       //0017 : 1B 1B 0C 00 00 00 70 0B 18 11 12 20 00 31 5D 01 02 00 01 24 09 28 16 
        } else {                                                                //002E : 06 4A 00 
          cl_AddScrollingCombatValue(-aValue,Class'FSkill_Enums'.1,False);      //0031 : 1B 1B 0C 00 00 8F 00 70 0B 18 11 16 12 20 00 31 5D 01 02 00 01 24 01 28 16 
        }
        break;                                                                  //004A : 06 AD 00 
      case 0 :                                                                  //004D : 0A 6C 00 24 00 
        cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.3,True);          //0052 : 1B 1B 0C 00 00 00 70 0B 18 11 12 20 00 31 5D 01 02 00 01 24 03 27 16 
        break;                                                                  //0069 : 06 AD 00 
      case 1 :                                                                  //006C : 0A 8B 00 24 01 
        cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.5,True);          //0071 : 1B 1B 0C 00 00 00 70 0B 18 11 12 20 00 31 5D 01 02 00 01 24 05 27 16 
        break;                                                                  //0088 : 06 AD 00 
      case 2 :                                                                  //008B : 0A AA 00 24 02 
        cl_AddScrollingCombatValue(aValue,Class'FSkill_Enums'.7,True);          //0090 : 1B 1B 0C 00 00 00 70 0B 18 11 12 20 00 31 5D 01 02 00 01 24 07 27 16 
        break;                                                                  //00A7 : 06 AD 00 
      default:                                                                  //00AA : 0A FF FF 
    }
    //05 01 00 D8 09 18 11 0A 4D 00 24 03 07 31 00 97 00 70 0B 18 11 25 16 1B 1B 0C 00 00 00 70 0B 18 
    //11 12 20 00 31 5D 01 02 00 01 24 09 28 16 06 4A 00 1B 1B 0C 00 00 8F 00 70 0B 18 11 16 12 20 00 
    //31 5D 01 02 00 01 24 01 28 16 06 AD 00 0A 6C 00 24 00 1B 1B 0C 00 00 00 70 0B 18 11 12 20 00 31 
    //5D 01 02 00 01 24 03 27 16 06 AD 00 0A 8B 00 24 01 1B 1B 0C 00 00 00 70 0B 18 11 12 20 00 31 5D 
    //01 02 00 01 24 05 27 16 06 AD 00 0A AA 00 24 02 1B 1B 0C 00 00 00 70 0B 18 11 12 20 00 31 5D 01 
    //02 00 01 24 07 27 16 06 AD 00 0A FF FF 04 0B 47 
  }


  event cl_AddScrollingCombatTypeValue(byte aType,int aValue) {
    if (IsLocalPlayer()) {                                                      //0000 : 07 1C 00 1C 18 1A 76 0F 16 
      cl_AddScrollingCombatValueOnLocalPlayer(aType,aValue);                    //0009 : 1B 27 05 00 00 00 98 0C 18 11 00 78 0D 18 11 16 
    } else {                                                                    //0019 : 06 2C 00 
      cl_AddScrollingCombatValueOnOtherPlayer(aType,aValue);                    //001C : 1B 28 05 00 00 00 98 0C 18 11 00 78 0D 18 11 16 
    }
    //07 1C 00 1C 18 1A 76 0F 16 1B 27 05 00 00 00 98 0C 18 11 00 78 0D 18 11 16 06 2C 00 1B 28 05 00 
    //00 00 98 0C 18 11 00 78 0D 18 11 16 04 0B 47 
  }


  protected native function sv2clrel_CombatLogMessage_CallStub();


  event sv2clrel_CombatLogMessage(Game_Pawn executingPawn,Game_Pawn receivingPawn,byte anEvent,float Value) {
    local string Message;
    Message = executingPawn.Character.cl_GetName();                             //0000 : 0F 00 50 12 18 11 19 19 00 50 0F 18 11 05 00 04 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 
    switch (anEvent) {                                                          //001E : 05 01 00 78 13 18 11 
      case Class'FSkill_Enums'.0 :                                              //0025 : 0A 86 00 12 20 00 31 5D 01 02 00 01 24 00 
        Message = Message @ "did" @ string(Value)
          @ "damage";         //0033 : 0F 00 50 12 18 11 A8 A8 A8 00 50 12 18 11 1F 64 69 64 00 16 39 55 00 F0 13 18 11 16 1F 64 61 6D 61 67 65 00 16 
        Message = Message @ "to"
          @ receivingPawn.Character.cl_GetName();//0058 : 0F 00 50 12 18 11 A8 A8 00 50 12 18 11 1F 74 6F 00 16 19 19 00 68 14 18 11 05 00 04 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 16 
        break;                                                                  //0083 : 06 89 00 
      default:                                                                  //0086 : 0A FF FF 
    }
    SendDesktopMessage("",Message,Class'Game_Desktop'.6);                       //0089 : 1B 12 06 00 00 1F 00 00 50 12 18 11 12 20 60 CE 5A 01 02 00 04 2C 06 16 
    switch (anEvent) {                                                          //00A1 : 05 01 00 78 13 18 11 
      case Class'FSkill_Enums'.0 :                                              //00A8 : 0A CF 00 12 20 00 31 5D 01 02 00 01 24 00 
        receivingPawn.cl_AddScrollingCombatDamage(Value);                       //00B6 : 19 00 68 14 18 11 0D 00 00 1B EA 0C 00 00 39 44 00 F0 13 18 11 16 
        break;                                                                  //00CC : 06 B4 01 
      case Class'FSkill_Enums'.1 :                                              //00CF : 0A F8 00 12 20 00 31 5D 01 02 00 01 24 01 
        receivingPawn.cl_AddScrollingCombatDamage(-Value);                      //00DD : 19 00 68 14 18 11 0F 00 00 1B EA 0C 00 00 39 44 A9 00 F0 13 18 11 16 16 
        break;                                                                  //00F5 : 06 B4 01 
      case Class'FSkill_Enums'.1 :                                              //00F8 : 0A 1E 01 12 20 00 31 5D 01 02 00 01 24 01 
        receivingPawn.cl_AddScrollingCombatMessage("Heal");                     //0106 : 19 00 68 14 18 11 0C 00 00 1B 03 0C 00 00 1F 48 65 61 6C 00 16 
        break;                                                                  //011B : 06 B4 01 
      case Class'FSkill_Enums'.2 :                                              //011E : 0A 4E 01 12 20 00 31 5D 01 02 00 01 24 02 
        receivingPawn.cl_AddScrollingCombatMessage("Physique Drain");           //012C : 19 00 68 14 18 11 16 00 00 1B 03 0C 00 00 1F 50 68 79 73 69 71 75 65 20 44 72 61 69 6E 00 16 
        break;                                                                  //014B : 06 B4 01 
      case Class'FSkill_Enums'.3 :                                              //014E : 0A 7C 01 12 20 00 31 5D 01 02 00 01 24 03 
        receivingPawn.cl_AddScrollingCombatMessage("Morale Drain");             //015C : 19 00 68 14 18 11 14 00 00 1B 03 0C 00 00 1F 4D 6F 72 61 6C 65 20 44 72 61 69 6E 00 16 
        break;                                                                  //0179 : 06 B4 01 
      case Class'FSkill_Enums'.4 :                                              //017C : 0A B1 01 12 20 00 31 5D 01 02 00 01 24 04 
        receivingPawn.cl_AddScrollingCombatMessage("Concentration Drain");      //018A : 19 00 68 14 18 11 1B 00 00 1B 03 0C 00 00 1F 43 6F 6E 63 65 6E 74 72 61 74 69 6F 6E 20 44 72 61 69 6E 00 16 
        break;                                                                  //01AE : 06 B4 01 
      default:                                                                  //01B1 : 0A FF FF 
    }
    //0F 00 50 12 18 11 19 19 00 50 0F 18 11 05 00 04 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 05 01 
    //00 78 13 18 11 0A 86 00 12 20 00 31 5D 01 02 00 01 24 00 0F 00 50 12 18 11 A8 A8 A8 00 50 12 18 
    //11 1F 64 69 64 00 16 39 55 00 F0 13 18 11 16 1F 64 61 6D 61 67 65 00 16 0F 00 50 12 18 11 A8 A8 
    //00 50 12 18 11 1F 74 6F 00 16 19 19 00 68 14 18 11 05 00 04 01 68 2E 34 0F 06 00 00 1C C8 12 18 
    //11 16 16 06 89 00 0A FF FF 1B 12 06 00 00 1F 00 00 50 12 18 11 12 20 60 CE 5A 01 02 00 04 2C 06 
    //16 05 01 00 78 13 18 11 0A CF 00 12 20 00 31 5D 01 02 00 01 24 00 19 00 68 14 18 11 0D 00 00 1B 
    //EA 0C 00 00 39 44 00 F0 13 18 11 16 06 B4 01 0A F8 00 12 20 00 31 5D 01 02 00 01 24 01 19 00 68 
    //14 18 11 0F 00 00 1B EA 0C 00 00 39 44 A9 00 F0 13 18 11 16 16 06 B4 01 0A 1E 01 12 20 00 31 5D 
    //01 02 00 01 24 01 19 00 68 14 18 11 0C 00 00 1B 03 0C 00 00 1F 48 65 61 6C 00 16 06 B4 01 0A 4E 
    //01 12 20 00 31 5D 01 02 00 01 24 02 19 00 68 14 18 11 16 00 00 1B 03 0C 00 00 1F 50 68 79 73 69 
    //71 75 65 20 44 72 61 69 6E 00 16 06 B4 01 0A 7C 01 12 20 00 31 5D 01 02 00 01 24 03 19 00 68 14 
    //18 11 14 00 00 1B 03 0C 00 00 1F 4D 6F 72 61 6C 65 20 44 72 61 69 6E 00 16 06 B4 01 0A B1 01 12 
    //20 00 31 5D 01 02 00 01 24 04 19 00 68 14 18 11 1B 00 00 1B 03 0C 00 00 1F 43 6F 6E 63 65 6E 74 
    //72 61 74 69 6F 6E 20 44 72 61 69 6E 00 16 06 B4 01 0A FF FF 04 0B 47 
  }


  native function cl_CombatLogMessage(string aPrefixFormatString,string aMessageFormatString,int aSkillResourceID,int aDuffResourceID,Game_Pawn aSource,Game_Pawn aTarget);


  event cl_CombatMessage(int aSkillResourceID,int aDuffResourceID,int aEffectResourceID,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    local export editinline FSkill_Type Skill;
    local export editinline FSkill_Event_Duff Duff;
    local export editinline FSkill_EffectClass effect;
    Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillResourceID));   //0000 : 0F 00 C8 1A 18 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 60 19 18 11 16 
    Duff = FSkill_Event_Duff(Class'SBDBSync'.GetResourceObject(aDuffResourceID));//001F : 0F 00 40 1B 18 11 2E 80 65 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 1B 18 11 16 
    effect = FSkill_EffectClass(Class'SBDBSync'.GetResourceObject(aEffectResourceID));//003E : 0F 00 30 1C 18 11 2E 40 8A 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A8 1C 18 11 16 
    effect.cl_CombatMessage(Skill,Duff,aSource,aTarget,aAmount,aAmount2,aAmount3);//005D : 19 00 30 1C 18 11 29 00 00 1B 2C 05 00 00 00 C8 1A 18 11 00 40 1B 18 11 00 20 1D 18 11 00 98 1D 18 11 00 10 1E 18 11 00 88 1E 18 11 00 00 1F 18 11 16 
    //0F 00 C8 1A 18 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 60 19 18 11 16 0F 
    //00 40 1B 18 11 2E 80 65 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 1B 18 11 16 0F 00 
    //30 1C 18 11 2E 40 8A 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A8 1C 18 11 16 19 00 30 
    //1C 18 11 29 00 00 1B 2C 05 00 00 00 C8 1A 18 11 00 40 1B 18 11 00 20 1D 18 11 00 98 1D 18 11 00 
    //10 1E 18 11 00 88 1E 18 11 00 00 1F 18 11 16 04 0B 47 
  }


  protected native function sv2cl_SendGameConsoleMessageID_CallStub();


  event sv2cl_SendGameConsoleMessageID(int localizedMessageID,int aChannel) {
    local LocalizedString aString;
    aString.Id = localizedMessageID;                                            //0000 : 0F 36 D0 C6 6B 0F 00 C8 21 18 11 00 D8 20 18 11 
    SendDesktopMessage(Character.cl_GetFullName(),aString.Text,aChannel);       //0010 : 1B 12 06 00 00 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 36 58 C6 6B 0F 00 C8 21 18 11 00 F0 22 18 11 16 
    //0F 36 D0 C6 6B 0F 00 C8 21 18 11 00 D8 20 18 11 1B 12 06 00 00 19 01 68 2E 34 0F 06 00 00 1C 40 
    //22 18 11 16 36 58 C6 6B 0F 00 C8 21 18 11 00 F0 22 18 11 16 04 0B 47 
  }


  protected native function sv2cl_SendGameConsoleMessage_CallStub();


  event sv2cl_SendGameConsoleMessage(string Text,int aChannel) {
    SendDesktopMessage(Character.cl_GetFullName(),Text,aChannel);               //0000 : 1B 12 06 00 00 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 00 C8 24 18 11 00 98 25 18 11 16 
    //1B 12 06 00 00 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 00 C8 24 18 11 00 98 25 18 11 16 04 
    //0B 47 
  }


  private function cl_RunNoSkillEvent(export editinline FSkill_Event_FX aEvent) {
    local AimingInfo dummyAimingInfo;
    if (aEvent != None) {                                                       //0000 : 07 77 00 77 00 C0 26 18 11 2A 16 
      Skills.RunEvent(aEvent,Class'FSkill_Event'.65536 | Class'FSkill_Event'.4,None,self,self,None,vect(0.000000, 0.000000, 0.000000),dummyAimingInfo,CharacterStats.mRecord,-1,GetServerTime(),Class'FSkill_Enums'.8);//000B : 19 01 08 28 18 11 60 00 04 1C 80 28 18 11 00 C0 26 18 11 9E 12 20 C0 55 5D 01 05 00 04 1D 00 00 01 00 12 20 C0 55 5D 01 02 00 04 2C 04 16 2A 17 17 2A 23 00 00 00 00 00 00 00 00 00 00 00 00 00 30 29 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 1D FF FF FF FF 1C A8 29 18 11 16 12 20 00 31 5D 01 02 00 01 24 08 16 
      goto jl0077;                                                              //0074 : 06 77 00 
    }
    //07 77 00 77 00 C0 26 18 11 2A 16 19 01 08 28 18 11 60 00 04 1C 80 28 18 11 00 C0 26 18 11 9E 12 
    //20 C0 55 5D 01 05 00 04 1D 00 00 01 00 12 20 C0 55 5D 01 02 00 04 2C 04 16 2A 17 17 2A 23 00 00 
    //00 00 00 00 00 00 00 00 00 00 00 30 29 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 1D FF FF 
    //FF FF 1C A8 29 18 11 16 12 20 00 31 5D 01 02 00 01 24 08 16 06 77 00 04 0B 47 
  }


  protected native function sv2clrel_PlayPawnEffectDirect_CallStub();


  event sv2clrel_PlayPawnEffectDirect(int aEmitterID) {
    local export editinline FSkill_Event_FX fxEvent;
    fxEvent = new Class'FSkill_Event_FX';                                       //0000 : 0F 00 50 2F 18 11 11 0B 0B 0B 20 00 5B 5D 01 
    fxEvent.FX.Emitter = FSkill_EffectClass_AudioVisual_Emitter(Class'SBDBSync'.GetResourceObject(aEmitterID));//000F : 0F 36 D0 56 34 0F 19 00 50 2F 18 11 05 00 0C 01 48 57 34 0F 2E C0 BE 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 20 2E 18 11 16 
    if (fxEvent.FX.Emitter != None) {                                           //003C : 07 63 00 77 36 D0 56 34 0F 19 00 50 2F 18 11 05 00 0C 01 48 57 34 0F 2A 16 
      cl_RunNoSkillEvent(fxEvent);                                              //0055 : 1B 74 0D 00 00 00 50 2F 18 11 16 
      goto jl0063;                                                              //0060 : 06 63 00 
    }
    //0F 00 50 2F 18 11 11 0B 0B 0B 20 00 5B 5D 01 0F 36 D0 56 34 0F 19 00 50 2F 18 11 05 00 0C 01 48 
    //57 34 0F 2E C0 BE 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 20 2E 18 11 16 07 63 00 77 
    //36 D0 56 34 0F 19 00 50 2F 18 11 05 00 0C 01 48 57 34 0F 2A 16 1B 74 0D 00 00 00 50 2F 18 11 16 
    //06 63 00 04 0B 47 
  }


  function cl_PlayPawnEffect(byte aPET) {
    local export editinline FSkill_EffectClass_AudioVisual_CameraShake fxCS;
    local export editinline FSkill_EffectClass_AudioVisual_Emitter fxE;
    local export editinline FSkill_EffectClass_AudioVisual_Sound fxS;
    local export editinline FSkill_EffectClass_AudioVisual_ColorModifier fxFade;
    local export editinline FSkill_Event_FX fxEvent;
    local float FadeTime;
    switch (aPET) {                                                             //0000 : 05 01 00 70 58 34 0F 
      case 7 :                                                                  //0007 : 0A 86 00 24 07 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.PetSpawn.PetSpawnEmitter",fxS,"EffectsPlayerAVGP.PetSpawn.PetSpawnSound",fxCS,"","PetSpawn");//000C : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 50 65 74 53 70 61 77 6E 2E 50 65 74 53 70 61 77 6E 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 50 65 74 53 70 61 77 6E 2E 50 65 74 53 70 61 77 6E 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 50 65 74 53 70 61 77 6E 00 16 
        break;                                                                  //0083 : 06 C8 05 
      case 8 :                                                                  //0086 : 0A 0F 01 24 08 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.PetDespawn.PetDespawnEmitter",fxS,"EffectsPlayerAVGP.PetDespawn.PetDespawnSound",fxCS,"","PetDespawn");//008B : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 50 65 74 44 65 73 70 61 77 6E 2E 50 65 74 44 65 73 70 61 77 6E 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 50 65 74 44 65 73 70 61 77 6E 2E 50 65 74 44 65 73 70 61 77 6E 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 50 65 74 44 65 73 70 61 77 6E 00 16 
        break;                                                                  //010C : 06 C8 05 
      case 9 :                                                                  //010F : 0A 98 01 24 09 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.ShapeShift.ShapeShiftEmitter",fxS,"EffectsPlayerAVGP.ShapeShift.ShapeShiftSound",fxCS,"","ShapeShift");//0114 : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 53 68 61 70 65 53 68 69 66 74 2E 53 68 61 70 65 53 68 69 66 74 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 53 68 61 70 65 53 68 69 66 74 2E 53 68 61 70 65 53 68 69 66 74 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 53 68 61 70 65 53 68 69 66 74 00 16 
        break;                                                                  //0195 : 06 C8 05 
      case 10 :                                                                 //0198 : 0A 2B 02 24 0A 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.ShapeUnshift.ShapeUnshiftEmitter",fxS,"EffectsPlayerAVGP.ShapeUnshift.ShapeUnshiftSound",fxCS,"","ShapeUnshift");//019D : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 53 68 61 70 65 55 6E 73 68 69 66 74 2E 53 68 61 70 65 55 6E 73 68 69 66 74 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 53 68 61 70 65 55 6E 73 68 69 66 74 2E 53 68 61 70 65 55 6E 73 68 69 66 74 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 53 68 61 70 65 55 6E 73 68 69 66 74 00 16 
        break;                                                                  //0228 : 06 C8 05 
      case 0 :                                                                  //022B : 0A A5 02 24 00 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.LevelUp.LevelUpEmitter",fxS,"EffectsPlayerAVGP.LevelUp.LevelUpSound",fxCS,"","LevelUp");//0230 : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 4C 65 76 65 6C 55 70 2E 4C 65 76 65 6C 55 70 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 4C 65 76 65 6C 55 70 2E 4C 65 76 65 6C 55 70 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 4C 65 76 65 6C 55 70 00 16 
        break;                                                                  //02A2 : 06 C8 05 
      case 1 :                                                                  //02A5 : 0A 1A 03 24 01 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.RankUp.RankUpEmitter",fxS,"EffectsPlayerAVGP.RankUp.RankUpSound",fxCS,"","RankUp");//02AA : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 52 61 6E 6B 55 70 2E 52 61 6E 6B 55 70 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 52 61 6E 6B 55 70 2E 52 61 6E 6B 55 70 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 52 61 6E 6B 55 70 00 16 
        break;                                                                  //0317 : 06 C8 05 
      case 11 :                                                                 //031A : 0A 6D 03 24 0B 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.Arena.Team0Emitter",fxS,"",fxCS,"","ArenaTeam0");//031F : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 41 72 65 6E 61 2E 54 65 61 6D 30 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 00 00 D0 62 34 0F 1F 00 1F 41 72 65 6E 61 54 65 61 6D 30 00 16 
        break;                                                                  //036A : 06 C8 05 
      case 12 :                                                                 //036D : 0A C0 03 24 0C 
        cl_LoadEffects(fxE,"EffectsPlayerAVGP.Arena.Team1Emitter",fxS,"",fxCS,"","ArenaTeam1");//0372 : 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 41 72 65 6E 61 2E 54 65 61 6D 31 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 00 00 D0 62 34 0F 1F 00 1F 41 72 65 6E 61 54 65 61 6D 31 00 16 
        break;                                                                  //03BD : 06 C8 05 
      case 13 :                                                                 //03C0 : 0A 24 04 24 0D 
        cl_LoadEffects(fxE,"",fxS,"",fxCS,"EffectsPlayerAVGP.TrialCaves.SimpleCameraShake","SimpleCameraShake");//03C5 : 1B 29 0C 00 00 00 E0 61 34 0F 1F 00 00 58 62 34 0F 1F 00 00 D0 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 54 72 69 61 6C 43 61 76 65 73 2E 53 69 6D 70 6C 65 43 61 6D 65 72 61 53 68 61 6B 65 00 1F 53 69 6D 70 6C 65 43 61 6D 65 72 61 53 68 61 6B 65 00 16 
        break;                                                                  //0421 : 06 C8 05 
      case 3 :                                                                  //0424 : 0A 29 04 24 03 
      case 5 :                                                                  //0429 : 0A 01 05 24 05 
        if (Effects != None) {                                                  //042E : 07 FF 04 77 01 48 63 34 0F 2A 16 
          if (aPET == 3) {                                                      //0439 : 07 57 04 9A 39 3A 00 70 58 34 0F 39 3A 24 03 16 
            FadeTime = 2.00000000;                                              //0449 : 0F 00 C0 63 34 0F 1E 00 00 00 40 
          } else {                                                              //0454 : 06 62 04 
            FadeTime = 0.00000000;                                              //0457 : 0F 00 C0 63 34 0F 1E 00 00 00 00 
          }
          if (mFadeOutEffectHandle == 0) {                                      //0462 : 07 DF 04 9A 01 38 64 34 0F 25 16 
            fxFade = FSkill_EffectClass_AudioVisual_ColorModifier(static.DynamicLoadObject("EffectsNPCTypeAVGP.Fading.Fade_To_Transparent",Class'FSkill_EffectClass_AudioVisual_ColorModifier',True));//046D : 0F 00 B0 64 34 0F 2E C0 D3 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 4E 50 43 54 79 70 65 41 56 47 50 2E 46 61 64 69 6E 67 2E 46 61 64 65 5F 54 6F 5F 54 72 61 6E 73 70 61 72 65 6E 74 00 20 C0 D3 5D 01 27 16 
            Effects.cl_Start(fxFade,0,0.00000000,0.00000000,0.00000000,FadeTime);//04B3 : 19 01 48 63 34 0F 20 00 04 1C 28 65 34 0F 00 B0 64 34 0F 25 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 00 C0 63 34 0F 16 
          } else {                                                              //04DC : 06 FF 04 
            Effects.cl_Stop(mFadeOutEffectHandle,FadeTime);                     //04DF : 19 01 48 63 34 0F 10 00 04 1C D8 65 34 0F 01 38 64 34 0F 00 C0 63 34 0F 16 
            mFadeOutEffectHandle = 0;                                           //04F8 : 0F 01 38 64 34 0F 25 
          }
        }
        return;                                                                 //04FF : 04 0B 
      case 4 :                                                                  //0501 : 0A 06 05 24 04 
      case 6 :                                                                  //0506 : 0A C5 05 24 06 
        if (Effects != None) {                                                  //050B : 07 C3 05 77 01 48 63 34 0F 2A 16 
          if (aPET == 4) {                                                      //0516 : 07 34 05 9A 39 3A 00 70 58 34 0F 39 3A 24 04 16 
            FadeTime = 2.00000000;                                              //0526 : 0F 00 C0 63 34 0F 1E 00 00 00 40 
          } else {                                                              //0531 : 06 3F 05 
            FadeTime = 0.00000000;                                              //0534 : 0F 00 C0 63 34 0F 1E 00 00 00 00 
          }
          if (mFadeOutEffectHandle == 0) {                                      //053F : 07 C3 05 9A 01 38 64 34 0F 25 16 
            fxFade = FSkill_EffectClass_AudioVisual_ColorModifier(static.DynamicLoadObject("EffectsNPCTypeAVGP.Fading.Fade_To_Transparent",Class'FSkill_EffectClass_AudioVisual_ColorModifier',True));//054A : 0F 00 B0 64 34 0F 2E C0 D3 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 4E 50 43 54 79 70 65 41 56 47 50 2E 46 61 64 69 6E 67 2E 46 61 64 65 5F 54 6F 5F 54 72 61 6E 73 70 61 72 65 6E 74 00 20 C0 D3 5D 01 27 16 
            mFadeOutEffectHandle = Effects.cl_Start(fxFade,0,0.00000000,FadeTime,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0590 : 0F 01 38 64 34 0F 19 01 48 63 34 0F 24 00 04 1C 28 65 34 0F 00 B0 64 34 0F 25 1E 00 00 00 00 00 C0 63 34 0F 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
          }
        }
        return;                                                                 //05C3 : 04 0B 
      default:                                                                  //05C5 : 0A FF FF 
    }
    if (fxCS != None || fxE != None || fxS != None) {                           //05C8 : 07 66 06 84 84 77 00 D0 62 34 0F 2A 16 18 09 00 77 00 E0 61 34 0F 2A 16 16 18 09 00 77 00 58 62 34 0F 2A 16 16 
      fxEvent = new Class'FSkill_Event_FX';                                     //05ED : 0F 00 88 66 34 0F 11 0B 0B 0B 20 00 5B 5D 01 
      fxEvent.FX.Sound = fxS;                                                   //05FC : 0F 36 00 67 34 0F 19 00 88 66 34 0F 05 00 0C 01 48 57 34 0F 00 58 62 34 0F 
      fxEvent.FX.Emitter = fxE;                                                 //0615 : 0F 36 D0 56 34 0F 19 00 88 66 34 0F 05 00 0C 01 48 57 34 0F 00 E0 61 34 0F 
      fxEvent.FX.CameraShake = fxCS;                                            //062E : 0F 36 78 67 34 0F 19 00 88 66 34 0F 05 00 0C 01 48 57 34 0F 00 D0 62 34 0F 
      fxEvent.EmitterLocation = 1;                                              //0647 : 0F 19 00 88 66 34 0F 05 00 01 01 F0 67 34 0F 24 01 
      cl_RunNoSkillEvent(fxEvent);                                              //0658 : 1B 74 0D 00 00 00 88 66 34 0F 16 
      goto jl0666;                                                              //0663 : 06 66 06 
    }
    //05 01 00 70 58 34 0F 0A 86 00 24 07 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 
    //61 79 65 72 41 56 47 50 2E 50 65 74 53 70 61 77 6E 2E 50 65 74 53 70 61 77 6E 45 6D 69 74 74 65 
    //72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 50 65 74 53 70 61 
    //77 6E 2E 50 65 74 53 70 61 77 6E 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 50 65 74 53 70 61 77 
    //6E 00 16 06 C8 05 0A 0F 01 24 08 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 
    //79 65 72 41 56 47 50 2E 50 65 74 44 65 73 70 61 77 6E 2E 50 65 74 44 65 73 70 61 77 6E 45 6D 69 
    //74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 50 65 74 
    //44 65 73 70 61 77 6E 2E 50 65 74 44 65 73 70 61 77 6E 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 
    //50 65 74 44 65 73 70 61 77 6E 00 16 06 C8 05 0A 98 01 24 09 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 
    //66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 53 68 61 70 65 53 68 69 66 74 2E 53 68 61 70 
    //65 53 68 69 66 74 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 
    //72 41 56 47 50 2E 53 68 61 70 65 53 68 69 66 74 2E 53 68 61 70 65 53 68 69 66 74 53 6F 75 6E 64 
    //00 00 D0 62 34 0F 1F 00 1F 53 68 61 70 65 53 68 69 66 74 00 16 06 C8 05 0A 2B 02 24 0A 1B 29 0C 
    //00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 53 68 61 70 65 55 
    //6E 73 68 69 66 74 2E 53 68 61 70 65 55 6E 73 68 69 66 74 45 6D 69 74 74 65 72 00 00 58 62 34 0F 
    //1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 53 68 61 70 65 55 6E 73 68 69 66 74 2E 
    //53 68 61 70 65 55 6E 73 68 69 66 74 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 53 68 61 70 65 55 
    //6E 73 68 69 66 74 00 16 06 C8 05 0A A5 02 24 00 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 
    //74 73 50 6C 61 79 65 72 41 56 47 50 2E 4C 65 76 65 6C 55 70 2E 4C 65 76 65 6C 55 70 45 6D 69 74 
    //74 65 72 00 00 58 62 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 4C 65 76 65 
    //6C 55 70 2E 4C 65 76 65 6C 55 70 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 4C 65 76 65 6C 55 70 
    //00 16 06 C8 05 0A 1A 03 24 01 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 
    //65 72 41 56 47 50 2E 52 61 6E 6B 55 70 2E 52 61 6E 6B 55 70 45 6D 69 74 74 65 72 00 00 58 62 34 
    //0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 52 61 6E 6B 55 70 2E 52 61 6E 6B 55 
    //70 53 6F 75 6E 64 00 00 D0 62 34 0F 1F 00 1F 52 61 6E 6B 55 70 00 16 06 C8 05 0A 6D 03 24 0B 1B 
    //29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 41 72 65 6E 
    //61 2E 54 65 61 6D 30 45 6D 69 74 74 65 72 00 00 58 62 34 0F 1F 00 00 D0 62 34 0F 1F 00 1F 41 72 
    //65 6E 61 54 65 61 6D 30 00 16 06 C8 05 0A C0 03 24 0C 1B 29 0C 00 00 00 E0 61 34 0F 1F 45 66 66 
    //65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 41 72 65 6E 61 2E 54 65 61 6D 31 45 6D 69 74 74 65 
    //72 00 00 58 62 34 0F 1F 00 00 D0 62 34 0F 1F 00 1F 41 72 65 6E 61 54 65 61 6D 31 00 16 06 C8 05 
    //0A 24 04 24 0D 1B 29 0C 00 00 00 E0 61 34 0F 1F 00 00 58 62 34 0F 1F 00 00 D0 62 34 0F 1F 45 66 
    //66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 54 72 69 61 6C 43 61 76 65 73 2E 53 69 6D 70 6C 
    //65 43 61 6D 65 72 61 53 68 61 6B 65 00 1F 53 69 6D 70 6C 65 43 61 6D 65 72 61 53 68 61 6B 65 00 
    //16 06 C8 05 0A 29 04 24 03 0A 01 05 24 05 07 FF 04 77 01 48 63 34 0F 2A 16 07 57 04 9A 39 3A 00 
    //70 58 34 0F 39 3A 24 03 16 0F 00 C0 63 34 0F 1E 00 00 00 40 06 62 04 0F 00 C0 63 34 0F 1E 00 00 
    //00 00 07 DF 04 9A 01 38 64 34 0F 25 16 0F 00 B0 64 34 0F 2E C0 D3 5D 01 1C 60 E7 69 0F 1F 45 66 
    //66 65 63 74 73 4E 50 43 54 79 70 65 41 56 47 50 2E 46 61 64 69 6E 67 2E 46 61 64 65 5F 54 6F 5F 
    //54 72 61 6E 73 70 61 72 65 6E 74 00 20 C0 D3 5D 01 27 16 19 01 48 63 34 0F 20 00 04 1C 28 65 34 
    //0F 00 B0 64 34 0F 25 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 00 C0 63 34 0F 16 06 FF 04 19 
    //01 48 63 34 0F 10 00 04 1C D8 65 34 0F 01 38 64 34 0F 00 C0 63 34 0F 16 0F 01 38 64 34 0F 25 04 
    //0B 0A 06 05 24 04 0A C5 05 24 06 07 C3 05 77 01 48 63 34 0F 2A 16 07 34 05 9A 39 3A 00 70 58 34 
    //0F 39 3A 24 04 16 0F 00 C0 63 34 0F 1E 00 00 00 40 06 3F 05 0F 00 C0 63 34 0F 1E 00 00 00 00 07 
    //C3 05 9A 01 38 64 34 0F 25 16 0F 00 B0 64 34 0F 2E C0 D3 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 
    //74 73 4E 50 43 54 79 70 65 41 56 47 50 2E 46 61 64 69 6E 67 2E 46 61 64 65 5F 54 6F 5F 54 72 61 
    //6E 73 70 61 72 65 6E 74 00 20 C0 D3 5D 01 27 16 0F 01 38 64 34 0F 19 01 48 63 34 0F 24 00 04 1C 
    //28 65 34 0F 00 B0 64 34 0F 25 1E 00 00 00 00 00 C0 63 34 0F 12 20 80 8F 5D 01 05 00 04 1E 00 00 
    //80 BF 16 04 0B 0A FF FF 07 66 06 84 84 77 00 D0 62 34 0F 2A 16 18 09 00 77 00 E0 61 34 0F 2A 16 
    //16 18 09 00 77 00 58 62 34 0F 2A 16 16 0F 00 88 66 34 0F 11 0B 0B 0B 20 00 5B 5D 01 0F 36 00 67 
    //34 0F 19 00 88 66 34 0F 05 00 0C 01 48 57 34 0F 00 58 62 34 0F 0F 36 D0 56 34 0F 19 00 88 66 34 
    //0F 05 00 0C 01 48 57 34 0F 00 E0 61 34 0F 0F 36 78 67 34 0F 19 00 88 66 34 0F 05 00 0C 01 48 57 
    //34 0F 00 D0 62 34 0F 0F 19 00 88 66 34 0F 05 00 01 01 F0 67 34 0F 24 01 1B 74 0D 00 00 00 88 66 
    //34 0F 16 06 66 06 04 0B 47 
  }


  private function cl_LoadEffects(export out editinline FSkill_EffectClass_AudioVisual_Emitter outEmitter,string fxName,export out editinline FSkill_EffectClass_AudioVisual_Sound outSound,string sndName,export out editinline FSkill_EffectClass_AudioVisual_CameraShake outShake,string csName,string Tag) {
    if (Len(fxName) > 0) {                                                      //0000 : 07 2C 00 97 7D 00 E0 69 34 0F 16 25 16 
      outEmitter = FSkill_EffectClass_AudioVisual_Emitter(static.DynamicLoadObject(fxName,Class'FSkill_EffectClass_AudioVisual_Emitter',True));//000D : 0F 00 68 69 34 0F 2E C0 BE 5D 01 1C 60 E7 69 0F 00 E0 69 34 0F 20 C0 BE 5D 01 27 16 
    } else {                                                                    //0029 : 06 33 00 
      outEmitter = None;                                                        //002C : 0F 00 68 69 34 0F 2A 
    }
    if (Len(sndName) > 0) {                                                     //0033 : 07 5F 00 97 7D 00 58 6A 34 0F 16 25 16 
      outSound = FSkill_EffectClass_AudioVisual_Sound(static.DynamicLoadObject(sndName,Class'FSkill_EffectClass_AudioVisual_Sound',True));//0040 : 0F 00 C8 2F 18 11 2E 40 C9 5D 01 1C 60 E7 69 0F 00 58 6A 34 0F 20 40 C9 5D 01 27 16 
    } else {                                                                    //005C : 06 66 00 
      outSound = None;                                                          //005F : 0F 00 C8 2F 18 11 2A 
    }
    if (Len(csName) > 0) {                                                      //0066 : 07 92 00 97 7D 00 40 30 18 11 16 25 16 
      outShake = FSkill_EffectClass_AudioVisual_CameraShake(static.DynamicLoadObject(csName,Class'FSkill_EffectClass_AudioVisual_CameraShake',True));//0073 : 0F 00 B8 30 18 11 2E 00 9A 5D 01 1C 60 E7 69 0F 00 40 30 18 11 20 00 9A 5D 01 27 16 
    } else {                                                                    //008F : 06 99 00 
      outShake = None;                                                          //0092 : 0F 00 B8 30 18 11 2A 
    }
    //07 2C 00 97 7D 00 E0 69 34 0F 16 25 16 0F 00 68 69 34 0F 2E C0 BE 5D 01 1C 60 E7 69 0F 00 E0 69 
    //34 0F 20 C0 BE 5D 01 27 16 06 33 00 0F 00 68 69 34 0F 2A 07 5F 00 97 7D 00 58 6A 34 0F 16 25 16 
    //0F 00 C8 2F 18 11 2E 40 C9 5D 01 1C 60 E7 69 0F 00 58 6A 34 0F 20 40 C9 5D 01 27 16 06 66 00 0F 
    //00 C8 2F 18 11 2A 07 92 00 97 7D 00 40 30 18 11 16 25 16 0F 00 B8 30 18 11 2E 00 9A 5D 01 1C 60 
    //E7 69 0F 00 40 30 18 11 20 00 9A 5D 01 27 16 06 99 00 0F 00 B8 30 18 11 2A 04 0B 47 
  }


  protected native function sv2clrel_PlayPawnEffect_CallStub();


  event sv2clrel_PlayPawnEffect(byte aPET) {
    cl_PlayPawnEffect(aPET);                                                    //0000 : 1B 16 0C 00 00 00 08 33 18 11 16 
    //1B 16 0C 00 00 00 08 33 18 11 16 04 0B 47 
  }


  event EdAddRangeLocation(export editinline FSkill_EffectClass_Range aRange,Vector aLocation) {
    local int C;
    C = mSelectedRanges.Length;                                                 //0000 : 0F 00 A8 34 18 11 37 01 20 35 18 11 
    mSelectedRanges.Length = C + 1;                                             //000C : 0F 37 01 20 35 18 11 92 00 A8 34 18 11 26 16 
    mSelectedRanges[C].Range = aRange;                                          //001B : 0F 36 98 35 18 11 10 00 A8 34 18 11 01 20 35 18 11 00 30 34 18 11 
    mSelectedRanges[C].Location = aLocation;                                    //0031 : 0F 36 10 36 18 11 10 00 A8 34 18 11 01 20 35 18 11 00 88 36 18 11 
    mSelectedRanges[C].RemoveTime = Level.TimeSeconds + 1.50000000;             //0047 : 0F 36 00 37 18 11 10 00 A8 34 18 11 01 20 35 18 11 AE 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 1E 00 00 C0 3F 16 
    //0F 00 A8 34 18 11 37 01 20 35 18 11 0F 37 01 20 35 18 11 92 00 A8 34 18 11 26 16 0F 36 98 35 18 
    //11 10 00 A8 34 18 11 01 20 35 18 11 00 30 34 18 11 0F 36 10 36 18 11 10 00 A8 34 18 11 01 20 35 
    //18 11 00 88 36 18 11 0F 36 00 37 18 11 10 00 A8 34 18 11 01 20 35 18 11 AE 19 01 D8 7E 6C 0F 05 
    //00 04 01 A8 81 6C 0F 1E 00 00 C0 3F 16 04 0B 47 
  }


  event EdAddRange(export editinline FSkill_EffectClass_Range aRange) {
    local int C;
    C = mSelectedRanges.Length;                                                 //0000 : 0F 00 68 39 18 11 37 01 20 35 18 11 
    mSelectedRanges.Length = C + 1;                                             //000C : 0F 37 01 20 35 18 11 92 00 68 39 18 11 26 16 
    mSelectedRanges[C].Range = aRange;                                          //001B : 0F 36 98 35 18 11 10 00 68 39 18 11 01 20 35 18 11 00 28 38 18 11 
    mSelectedRanges[C].Location = Location;                                     //0031 : 0F 36 10 36 18 11 10 00 68 39 18 11 01 20 35 18 11 01 30 81 6C 0F 
    mSelectedRanges[C].RemoveTime = Level.TimeSeconds + 1.50000000;             //0047 : 0F 36 00 37 18 11 10 00 68 39 18 11 01 20 35 18 11 AE 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 1E 00 00 C0 3F 16 
    //0F 00 68 39 18 11 37 01 20 35 18 11 0F 37 01 20 35 18 11 92 00 68 39 18 11 26 16 0F 36 98 35 18 
    //11 10 00 68 39 18 11 01 20 35 18 11 00 28 38 18 11 0F 36 10 36 18 11 10 00 68 39 18 11 01 20 35 
    //18 11 01 30 81 6C 0F 0F 36 00 37 18 11 10 00 68 39 18 11 01 20 35 18 11 AE 19 01 D8 7E 6C 0F 05 
    //00 04 01 A8 81 6C 0F 1E 00 00 C0 3F 16 04 0B 47 
  }


  function bool sv_IsResting() {
    local Game_PlayerController gpController;
    gpController = Game_PlayerController(Controller);                           //0000 : 0F 00 78 3B 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gpController != None) {                                                 //0010 : 07 2B 00 77 00 78 3B 18 11 2A 16 
      return gpController.IsSitting();                                          //001B : 04 19 00 78 3B 18 11 06 00 04 1B A3 05 00 00 16 
    }
    return False;                                                               //002B : 04 28 
    //0F 00 78 3B 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 07 2B 00 77 00 78 3B 18 11 2A 16 04 19 00 78 3B 
    //18 11 06 00 04 1B A3 05 00 00 16 04 28 04 0B 47 
  }


  protected native function cl2sv_Rest_CallStub();


  event cl2sv_Rest(bool ignoreVelocity) {
    local Game_PlayerController gpController;
    if (Physics != 1 && Physics != 19 && Physics != 20
      || !ignoreVelocity && VSize(Velocity) > 2.00000000) {//0000 : 07 56 00 84 82 82 9B 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9B 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 16 18 0E 00 9B 39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 18 1C 00 82 81 2D 00 50 3D 18 11 16 18 0F 00 B1 E1 01 A0 95 6C 0F 16 1E 00 00 00 40 16 16 16 
      return;                                                                   //0054 : 04 0B 
    }
    if (CharacterStats != None
      && CharacterStats.IsMovementFrozen()) {    //0056 : 07 77 00 82 77 01 08 43 34 0F 2A 16 18 10 00 19 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 16 
      return;                                                                   //0075 : 04 0B 
    }
    gpController = Game_PlayerController(Controller);                           //0077 : 0F 00 40 40 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gpController != None && combatState != None
      && CombatStats != None
      && !CombatStats.InCombat()
      && !combatState.CombatReady()
      && !combatState.IsDrawing()
      && !combatState.IsSheathing()) {//0087 : 07 2C 01 82 82 82 82 82 82 77 00 40 40 18 11 2A 16 18 09 00 77 01 B8 40 18 11 2A 16 16 18 09 00 77 01 30 41 18 11 2A 16 16 18 12 00 81 19 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 16 16 18 12 00 81 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 16 18 12 00 81 19 01 B8 40 18 11 06 00 04 1B CC 0D 00 00 16 16 16 18 12 00 81 19 01 B8 40 18 11 06 00 04 1B 5D 0E 00 00 16 16 16 
      if (gpController.IsSitting()) {                                           //0104 : 07 21 01 19 00 40 40 18 11 06 00 04 1B A3 05 00 00 16 
        sv_Sit(False,False);                                                    //0116 : 1B 94 0C 00 00 28 28 16 
      } else {                                                                  //011E : 06 29 01 
        sv_Sit(True,False);                                                     //0121 : 1B 94 0C 00 00 27 28 16 
      }
      goto jl012C;                                                              //0129 : 06 2C 01 
    }
    //07 56 00 84 82 82 9B 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9B 39 3A 01 C0 93 6C 0F 39 3A 
    //24 13 16 16 18 0E 00 9B 39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 18 1C 00 82 81 2D 00 50 3D 18 11 
    //16 18 0F 00 B1 E1 01 A0 95 6C 0F 16 1E 00 00 00 40 16 16 16 04 0B 07 77 00 82 77 01 08 43 34 0F 
    //2A 16 18 10 00 19 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 16 04 0B 0F 00 40 40 18 11 2E 90 18 
    //5B 01 01 00 6E 6C 0F 07 2C 01 82 82 82 82 82 82 77 00 40 40 18 11 2A 16 18 09 00 77 01 B8 40 18 
    //11 2A 16 16 18 09 00 77 01 30 41 18 11 2A 16 16 18 12 00 81 19 01 30 41 18 11 06 00 04 1B 93 05 
    //00 00 16 16 16 18 12 00 81 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 16 18 12 00 81 19 01 
    //B8 40 18 11 06 00 04 1B CC 0D 00 00 16 16 16 18 12 00 81 19 01 B8 40 18 11 06 00 04 1B 5D 0E 00 
    //00 16 16 16 07 21 01 19 00 40 40 18 11 06 00 04 1B A3 05 00 00 16 1B 94 0C 00 00 28 28 16 06 29 
    //01 1B 94 0C 00 00 27 28 16 06 2C 01 04 0B 47 
  }


  function cl_Banner(Game_Pawn aPartner,export editinline Conversation_Topic aTopic) {
    //04 0B 47 
  }


  protected native function cl2sv_Interact_CallStub();


  event cl2sv_Interact(Game_Actor aActor,byte aOption) {
    //04 0B 47 
  }


  function sv_Sit(bool bSitDown,optional bool bOnChair) {
    local Game_Controller cont;
    cont = Game_Controller(Controller);                                         //0000 : 0F 00 B0 36 30 0F 2E 10 0E 5B 01 01 00 6E 6C 0F 
    if (cont != None) {                                                         //0010 : 07 81 00 77 00 B0 36 30 0F 2A 16 
      if (bSitDown && SitDown(bOnChair)) {                                      //001B : 07 49 00 82 2D 00 58 35 30 0F 18 0D 00 1B 6E 07 00 00 2D 00 28 37 30 0F 16 16 
        cont.SBGotoState(10);                                                   //0035 : 19 00 B0 36 30 0F 08 00 00 1B 11 06 00 00 24 0A 16 
      } else {                                                                  //0046 : 06 81 00 
        if (Physics == 19 || Physics == 20) {                                   //0049 : 07 7F 00 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 14 16 16 
          cont.SBGotoState(1);                                                  //006B : 19 00 B0 36 30 0F 08 00 00 1B 11 06 00 00 24 01 16 
        } else {                                                                //007C : 06 81 00 
          return;                                                               //007F : 04 0B 
        }
      }
    }
    //0F 00 B0 36 30 0F 2E 10 0E 5B 01 01 00 6E 6C 0F 07 81 00 77 00 B0 36 30 0F 2A 16 07 49 00 82 2D 
    //00 58 35 30 0F 18 0D 00 1B 6E 07 00 00 2D 00 28 37 30 0F 16 16 19 00 B0 36 30 0F 08 00 00 1B 11 
    //06 00 00 24 0A 16 06 81 00 07 7F 00 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 13 16 18 0E 00 9A 39 3A 
    //01 C0 93 6C 0F 39 3A 24 14 16 16 19 00 B0 36 30 0F 08 00 00 1B 11 06 00 00 24 01 16 06 81 00 04 
    //0B 04 0B 47 
  }


  protected native function sv2clrel_FacePosition_CallStub();


  event sv2clrel_FacePosition(Vector aPositionToFace) {
    local Game_PlayerController gpController;
    gpController = Game_PlayerController(Controller);                           //0000 : 0F 00 20 D0 84 0F 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gpController != None) {                                                 //0010 : 07 40 00 77 00 20 D0 84 0F 2A 16 
      gpController.mTargetFocus = aPositionToFace;                              //001B : 0F 19 00 20 D0 84 0F 05 00 0C 01 98 D0 84 0F 00 20 CF 84 0F 
      gpController.SBGotoState(9);                                              //002F : 19 00 20 D0 84 0F 08 00 00 1B 11 06 00 00 24 09 16 
    }
    //0F 00 20 D0 84 0F 2E 90 18 5B 01 01 00 6E 6C 0F 07 40 00 77 00 20 D0 84 0F 2A 16 0F 19 00 20 D0 
    //84 0F 05 00 0C 01 98 D0 84 0F 00 20 CF 84 0F 19 00 20 D0 84 0F 08 00 00 1B 11 06 00 00 24 09 16 
    //04 0B 47 
  }


  function sv_FacePosition(Vector aPositionToFace) {
    local Game_PlayerController gpController;
    gpController = Game_PlayerController(Controller);                           //0000 : 0F 00 C0 D2 84 0F 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gpController != None) {                                                 //0010 : 07 40 00 77 00 C0 D2 84 0F 2A 16 
      gpController.mTargetFocus = aPositionToFace;                              //001B : 0F 19 00 C0 D2 84 0F 05 00 0C 01 98 D0 84 0F 00 C0 D1 84 0F 
      gpController.SBGotoState(9);                                              //002F : 19 00 C0 D2 84 0F 08 00 00 1B 11 06 00 00 24 09 16 
    }
    //0F 00 C0 D2 84 0F 2E 90 18 5B 01 01 00 6E 6C 0F 07 40 00 77 00 C0 D2 84 0F 2A 16 0F 19 00 C0 D2 
    //84 0F 05 00 0C 01 98 D0 84 0F 00 C0 D1 84 0F 19 00 C0 D2 84 0F 08 00 00 1B 11 06 00 00 24 09 16 
    //04 0B 47 
  }


  protected native function sv2cl_RotateToOrientation_CallStub();


  event sv2cl_RotateToOrientation(Rotator aTargetOrientation) {
    RotateToOrientation(aTargetOrientation);                                    //0000 : 1B 77 0D 00 00 00 98 D4 84 0F 16 
    //1B 77 0D 00 00 00 98 D4 84 0F 16 04 0B 47 
  }


  private function RotateToOrientation(Rotator aTargetOrientation) {
    local Game_PlayerController gpController;
    gpController = Game_PlayerController(Controller);                           //0000 : 0F 00 C0 D6 84 0F 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gpController != None) {                                                 //0010 : 07 40 00 77 00 C0 D6 84 0F 2A 16 
      gpController.mTargetRotation = aTargetOrientation;                        //001B : 0F 19 00 C0 D6 84 0F 05 00 0C 01 38 D7 84 0F 00 C0 D5 84 0F 
      gpController.SBGotoState(9);                                              //002F : 19 00 C0 D6 84 0F 08 00 00 1B 11 06 00 00 24 09 16 
    }
    //0F 00 C0 D6 84 0F 2E 90 18 5B 01 01 00 6E 6C 0F 07 40 00 77 00 C0 D6 84 0F 2A 16 0F 19 00 C0 D6 
    //84 0F 05 00 0C 01 38 D7 84 0F 00 C0 D5 84 0F 19 00 C0 D6 84 0F 08 00 00 1B 11 06 00 00 24 09 16 
    //04 0B 47 
  }


  function sv_RotateToOrientation(Rotator aTargetOrientation) {
    RotateToOrientation(aTargetOrientation);                                    //0000 : 1B 77 0D 00 00 00 60 D8 84 0F 16 
    sv2cl_RotateToOrientation_CallStub(aTargetOrientation);                     //000B : 1B 59 0E 00 00 00 60 D8 84 0F 16 
    //1B 77 0D 00 00 00 60 D8 84 0F 16 1B 59 0E 00 00 00 60 D8 84 0F 16 04 0B 47 
  }


  protected native function sv2cl_SetTargetDestination_CallStub();


  private final event sv2cl_SetTargetDestination(Vector aTargetDestination,float aMaxDistanceToTarget,float aTimeToMove) {
    local Game_PlayerController gpController;
    gpController = Game_PlayerController(Controller);                           //0000 : 0F 00 68 56 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gpController != None) {                                                 //0010 : 07 57 00 77 00 68 56 18 11 2A 16 
      gpController.mTargetDestination = aTargetDestination;                     //001B : 0F 19 00 68 56 18 11 05 00 0C 01 E0 56 18 11 00 F0 55 18 11 
      gpController.mMaxDistanceToTarget = aMaxDistanceToTarget;                 //002F : 0F 19 00 68 56 18 11 05 00 04 01 58 57 18 11 00 D0 57 18 11 
      gpController.mMaxTimeToMove = aTimeToMove;                                //0043 : 0F 19 00 68 56 18 11 05 00 04 01 48 58 18 11 00 C0 58 18 11 
    }
    //0F 00 68 56 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 07 57 00 77 00 68 56 18 11 2A 16 0F 19 00 68 56 
    //18 11 05 00 0C 01 E0 56 18 11 00 F0 55 18 11 0F 19 00 68 56 18 11 05 00 04 01 58 57 18 11 00 D0 
    //57 18 11 0F 19 00 68 56 18 11 05 00 04 01 48 58 18 11 00 C0 58 18 11 04 0B 47 
  }


  final event sv_MoveTo(Vector aPosition,Actor aTargetActor,optional float aMaxDistanceToTarget,optional float aTimeToMove) {
    local Game_PlayerController gpController;
    gpController = Game_PlayerController(Controller);                           //0000 : 0F 00 80 5B 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gpController != None) {                                                 //0010 : 07 AD 00 77 00 80 5B 18 11 2A 16 
      mDesiredLocation = aPosition;                                             //001B : 0F 01 F8 5B 18 11 00 E8 59 18 11 
      mTargetActor = aTargetActor;                                              //0026 : 0F 01 70 5C 18 11 00 E8 5C 18 11 
      gpController.mTargetDestination = aPosition;                              //0031 : 0F 19 00 80 5B 18 11 05 00 0C 01 E0 56 18 11 00 E8 59 18 11 
      gpController.mMaxDistanceToTarget = aMaxDistanceToTarget;                 //0045 : 0F 19 00 80 5B 18 11 05 00 04 01 58 57 18 11 00 60 5D 18 11 
      if (aTimeToMove < 0.10000000) {                                           //0059 : 07 73 00 B0 00 D8 5D 18 11 1E CD CC CC 3D 16 
        aTimeToMove = -1.00000000;                                              //0068 : 0F 00 D8 5D 18 11 1E 00 00 80 BF 
      }
      gpController.mMaxTimeToMove = aTimeToMove;                                //0073 : 0F 19 00 80 5B 18 11 05 00 04 01 48 58 18 11 00 D8 5D 18 11 
      sv2cl_SetTargetDestination_CallStub(aPosition,aMaxDistanceToTarget,aTimeToMove);//0087 : 1B 5A 0E 00 00 00 E8 59 18 11 00 60 5D 18 11 00 D8 5D 18 11 16 
      gpController.SBGotoState(8);                                              //009C : 19 00 80 5B 18 11 08 00 00 1B 11 06 00 00 24 08 16 
    }
    //0F 00 80 5B 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 07 AD 00 77 00 80 5B 18 11 2A 16 0F 01 F8 5B 18 
    //11 00 E8 59 18 11 0F 01 70 5C 18 11 00 E8 5C 18 11 0F 19 00 80 5B 18 11 05 00 0C 01 E0 56 18 11 
    //00 E8 59 18 11 0F 19 00 80 5B 18 11 05 00 04 01 58 57 18 11 00 60 5D 18 11 07 73 00 B0 00 D8 5D 
    //18 11 1E CD CC CC 3D 16 0F 00 D8 5D 18 11 1E 00 00 80 BF 0F 19 00 80 5B 18 11 05 00 04 01 48 58 
    //18 11 00 D8 5D 18 11 1B 5A 0E 00 00 00 E8 59 18 11 00 60 5D 18 11 00 D8 5D 18 11 16 19 00 80 5B 
    //18 11 08 00 00 1B 11 06 00 00 24 08 16 04 0B 47 
  }


  event bool IsRotationFrozen() {
    return CharacterStats.IsRotationFrozen();                                   //0000 : 04 19 01 08 43 34 0F 06 00 04 1C C0 5F 18 11 16 
    //04 19 01 08 43 34 0F 06 00 04 1C C0 5F 18 11 16 04 0B 47 
  }


  event RemoveInteractionTag(name aInteractionTagName) {
    local int i;
    i = GetInteractionTagIndex(aInteractionTagName);                            //0000 : 0F 00 98 61 18 11 1B 78 0D 00 00 00 20 61 18 11 16 
    if (i != -1) {                                                              //0011 : 07 2C 00 9B 00 98 61 18 11 1D FF FF FF FF 16 
      InteractionTags.Remove(i,1);                                              //0020 : 41 01 10 62 18 11 00 98 61 18 11 26 
    }
    //0F 00 98 61 18 11 1B 78 0D 00 00 00 20 61 18 11 16 07 2C 00 9B 00 98 61 18 11 1D FF FF FF FF 16 
    //41 01 10 62 18 11 00 98 61 18 11 26 04 0B 47 
  }


  event AddInterationTag(name aInteractionTagName) {
    local int i;
    i = GetInteractionTagIndex(aInteractionTagName);                            //0000 : 0F 00 B0 63 18 11 1B 78 0D 00 00 00 38 63 18 11 16 
    if (i != -1) {                                                              //0011 : 07 4C 00 9B 00 B0 63 18 11 1D FF FF FF FF 16 
      i = InteractionTags.Length;                                               //0020 : 0F 00 B0 63 18 11 37 01 10 62 18 11 
      InteractionTags.Length = i + 1;                                           //002C : 0F 37 01 10 62 18 11 92 00 B0 63 18 11 26 16 
      InteractionTags[i] = aInteractionTagName;                                 //003B : 0F 10 00 B0 63 18 11 01 10 62 18 11 00 38 63 18 11 
    }
    //0F 00 B0 63 18 11 1B 78 0D 00 00 00 38 63 18 11 16 07 4C 00 9B 00 B0 63 18 11 1D FF FF FF FF 16 
    //0F 00 B0 63 18 11 37 01 10 62 18 11 0F 37 01 10 62 18 11 92 00 B0 63 18 11 26 16 0F 10 00 B0 63 
    //18 11 01 10 62 18 11 00 38 63 18 11 04 0B 47 
  }


  function int GetInteractionTagIndex(name aInteractionTagName) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 D8 65 18 11 25 
    while (i < InteractionTags.Length) {                                        //0007 : 07 3C 00 96 00 D8 65 18 11 37 01 10 62 18 11 16 
      if (InteractionTags[i] == aInteractionTagName) {                          //0017 : 07 32 00 FE 10 00 D8 65 18 11 01 10 62 18 11 00 D8 64 18 11 16 
        return i;                                                               //002C : 04 00 D8 65 18 11 
      }
      ++i;                                                                      //0032 : A3 00 D8 65 18 11 16 
    }
    return -1;                                                                  //003C : 04 1D FF FF FF FF 
    //0F 00 D8 65 18 11 25 07 3C 00 96 00 D8 65 18 11 37 01 10 62 18 11 16 07 32 00 FE 10 00 D8 65 18 
    //11 01 10 62 18 11 00 D8 64 18 11 16 04 00 D8 65 18 11 A3 00 D8 65 18 11 16 06 07 00 04 1D FF FF 
    //FF FF 04 0B 47 
  }


  event OnSheatheWeapon(byte WeaponFlag) {
    combatState.OnDoneSheathing(WeaponFlag != Class'SBAnimationFlags'.4);       //0000 : 19 01 B8 40 18 11 1C 00 00 1B 29 0F 00 00 9B 39 3A 00 78 67 18 11 39 3A 12 20 10 BA D6 00 02 00 01 24 04 16 16 
    //19 01 B8 40 18 11 1C 00 00 1B 29 0F 00 00 9B 39 3A 00 78 67 18 11 39 3A 12 20 10 BA D6 00 02 00 
    //01 24 04 16 16 04 0B 47 
  }


  event OnDrawWeapon(byte WeaponFlag) {
    combatState.OnDoneDrawing(WeaponFlag != Class'SBAnimationFlags'.4);         //0000 : 19 01 B8 40 18 11 1C 00 00 1B 05 0F 00 00 9B 39 3A 00 A0 68 18 11 39 3A 12 20 10 BA D6 00 02 00 01 24 04 16 16 
    //19 01 B8 40 18 11 1C 00 00 1B 05 0F 00 00 9B 39 3A 00 A0 68 18 11 39 3A 12 20 10 BA D6 00 02 00 
    //01 24 04 16 16 04 0B 47 
  }


  function bool SpecialCalcView(out Actor ViewActor,out Vector CameraLocation,out Rotator CameraRotation) {
    Game_PlayerController(Controller).Camera.ShakeCamera(ViewActor,CameraLocation,CameraRotation);//0000 : 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 B0 6A 18 11 15 00 00 1B 32 0F 00 00 00 C8 69 18 11 00 28 6B 18 11 00 A0 6B 18 11 16 
    return True;                                                                //002C : 04 27 
    //19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 B0 6A 18 11 15 00 00 1B 32 0F 00 00 00 C8 69 18 
    //11 00 28 6B 18 11 00 A0 6B 18 11 16 04 27 04 0B 47 
  }


  event float PlayDamageSound(float aDamage,float aRadius) {
    return Class'StaticPawnSounds'.PlayDamageSound(self,aDamage,aRadius);       //0000 : 04 12 20 D0 8E 5C 01 11 00 04 1B 01 06 00 00 17 00 40 6D 18 11 00 10 6E 18 11 16 
    //04 12 20 D0 8E 5C 01 11 00 04 1B 01 06 00 00 17 00 40 6D 18 11 00 10 6E 18 11 16 04 0B 47 
  }


  protected native function sv2clrel_StaticPlaySound_CallStub();


  event sv2clrel_StaticPlaySound(byte ASound,float aRadius) {
    StaticPlaySound(ASound,aRadius);                                            //0000 : 1B 29 06 00 00 00 60 70 18 11 00 20 71 18 11 16 
    //1B 29 06 00 00 00 60 70 18 11 00 20 71 18 11 16 04 0B 47 
  }


  event float StaticPlaySoundEx(byte ASound,float aRadius,float aVolume,float aPitch) {
    return Class'StaticPawnSounds'.PlaySoundEx(self,ASound,aRadius,aVolume,aPitch);//0000 : 04 12 20 D0 8E 5C 01 1B 00 04 1B E0 0D 00 00 17 00 48 72 18 11 00 20 73 18 11 00 98 73 18 11 00 10 74 18 11 16 
    //04 12 20 D0 8E 5C 01 1B 00 04 1B E0 0D 00 00 17 00 48 72 18 11 00 20 73 18 11 00 98 73 18 11 00 
    //10 74 18 11 16 04 0B 47 
  }


  event float StaticPlaySound(byte ASound,float aRadius) {
    return Class'StaticPawnSounds'.PlaySound(self,ASound,aRadius);              //0000 : 04 12 20 D0 8E 5C 01 11 00 04 1B 03 06 00 00 17 00 B0 75 18 11 00 80 76 18 11 16 
    //04 12 20 D0 8E 5C 01 11 00 04 1B 03 06 00 00 17 00 B0 75 18 11 00 80 76 18 11 16 04 0B 47 
  }


  event StaticStopSound(byte ASound) {
    Class'StaticPawnSounds'.StopSound(self,ASound);                             //0000 : 12 20 D0 8E 5C 01 0C 00 00 1B A9 0D 00 00 17 00 20 78 18 11 16 
    //12 20 D0 8E 5C 01 0C 00 00 1B A9 0D 00 00 17 00 20 78 18 11 16 04 0B 47 
  }


  final native function bool IsInTeam(Game_Pawn aPawn);


  final native function bool IsHostile(Game_Pawn aPawn);


  event bool IsInCombat() {
    if (combatState != None) {                                                  //0000 : 07 1B 00 77 01 B8 40 18 11 2A 16 
      return combatState.CombatReady();                                         //000B : 04 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 
    }
    return False;                                                               //001B : 04 28 
    //07 1B 00 77 01 B8 40 18 11 2A 16 04 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 04 28 04 0B 47 
    //
  }


  event byte GetEquippedWeaponFlag() {
    local export editinline Game_EquippedAppearance equippedAppearance;
    equippedAppearance = Game_EquippedAppearance(Appearance.GetCurrent());      //0000 : 0F 00 30 83 18 11 2E 70 B8 5F 01 19 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
    if (IsEditor() && equippedAppearance != None) {                             //001A : 07 AE 00 82 1B 63 0C 00 00 16 18 09 00 77 00 30 83 18 11 2A 16 16 
      switch (equippedAppearance.GetValue(16)) {                                //0030 : 05 04 19 00 30 83 18 11 08 00 04 1B 7D 0C 00 00 24 10 16 
        case 0 :                                                                //0043 : 0A 4A 00 25 
          return 1;                                                             //0047 : 04 24 01 
        case 1 :                                                                //004A : 0A 51 00 26 
          return 3;                                                             //004E : 04 24 03 
        case 2 :                                                                //0051 : 0A 59 00 2C 02 
          return 3;                                                             //0056 : 04 24 03 
        case 3 :                                                                //0059 : 0A 61 00 2C 03 
          return 4;                                                             //005E : 04 24 04 
        case 4 :                                                                //0061 : 0A 69 00 2C 04 
          return 2;                                                             //0066 : 04 24 02 
        default:                                                                //0069 : 0A FF FF 
          break;                                                                //006C : 06 6F 00 
      }
      switch (equippedAppearance.GetValue(17)) {                                //006F : 05 04 19 00 30 83 18 11 08 00 04 1B 7D 0C 00 00 24 11 16 
        case 0 :                                                                //0082 : 0A 89 00 25 
          return 1;                                                             //0086 : 04 24 01 
        case 1 :                                                                //0089 : 0A 90 00 26 
          return 3;                                                             //008D : 04 24 03 
        case 2 :                                                                //0090 : 0A 98 00 2C 02 
          return 3;                                                             //0095 : 04 24 03 
        case 3 :                                                                //0098 : 0A A0 00 2C 03 
          return 4;                                                             //009D : 04 24 04 
        case 4 :                                                                //00A0 : 0A A8 00 2C 04 
          return 2;                                                             //00A5 : 04 24 02 
        default:                                                                //00A8 : 0A FF FF 
          return 0;                                                             //00AB : 04 24 00 
      }
      if (combatState != None
        && (combatState.CombatReady()
        || combatState.IsExecutingBodySlotSkill())) {//00AE : 07 F4 00 82 77 01 B8 40 18 11 2A 16 18 24 00 84 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 18 10 00 19 01 B8 40 18 11 06 00 04 1B D3 0E 00 00 16 16 16 
        return combatState.GetWeaponFlag();                                     //00E1 : 04 19 01 B8 40 18 11 06 00 01 1B 75 0F 00 00 16 
      } else {                                                                  //00F1 : 06 00 01 
        return Class'SBAnimationFlags'.0;                                       //00F4 : 04 12 20 10 BA D6 00 02 00 01 24 00 
      }
    }
    //0F 00 30 83 18 11 2E 70 B8 5F 01 19 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 07 AE 00 82 1B 63 
    //0C 00 00 16 18 09 00 77 00 30 83 18 11 2A 16 16 05 04 19 00 30 83 18 11 08 00 04 1B 7D 0C 00 00 
    //24 10 16 0A 4A 00 25 04 24 01 0A 51 00 26 04 24 03 0A 59 00 2C 02 04 24 03 0A 61 00 2C 03 04 24 
    //04 0A 69 00 2C 04 04 24 02 0A FF FF 06 6F 00 05 04 19 00 30 83 18 11 08 00 04 1B 7D 0C 00 00 24 
    //11 16 0A 89 00 25 04 24 01 0A 90 00 26 04 24 03 0A 98 00 2C 02 04 24 03 0A A0 00 2C 03 04 24 04 
    //0A A8 00 2C 04 04 24 02 0A FF FF 04 24 00 07 F4 00 82 77 01 B8 40 18 11 2A 16 18 24 00 84 19 01 
    //B8 40 18 11 06 00 04 1B 19 0C 00 00 16 18 10 00 19 01 B8 40 18 11 06 00 04 1B D3 0E 00 00 16 16 
    //16 04 19 01 B8 40 18 11 06 00 01 1B 75 0F 00 00 16 06 00 01 04 12 20 10 BA D6 00 02 00 01 24 00 
    //04 0B 47 
  }


  final native event bool IsDead();


  protected native function sv2clrel_UpdateNetState_CallStub();


  event sv2clrel_UpdateNetState(byte aState) {
    if (aState != mNetState) {                                                  //0000 : 07 3C 00 9B 39 3A 00 88 8D 18 11 39 3A 01 60 52 34 0F 16 
      mNetState = aState;                                                       //0013 : 0F 01 60 52 34 0F 00 88 8D 18 11 
      if (mNetState != mCurrentState) {                                         //001E : 07 3C 00 9B 39 3A 01 60 52 34 0F 39 3A 01 E8 51 34 0F 16 
        SBGotoState(mNetState);                                                 //0031 : 1B 11 06 00 00 01 60 52 34 0F 16 
      }
    }
    //07 3C 00 9B 39 3A 00 88 8D 18 11 39 3A 01 60 52 34 0F 16 0F 01 60 52 34 0F 00 88 8D 18 11 07 3C 
    //00 9B 39 3A 01 60 52 34 0F 39 3A 01 E8 51 34 0F 16 1B 11 06 00 00 01 60 52 34 0F 16 04 0B 47 
  }


  event SBGotoState(byte aState) {
    if (aState != mCurrentState) {                                              //0000 : 07 3B 00 9B 39 3A 00 00 8F 18 11 39 3A 01 E8 51 34 0F 16 
      switch (aState) {                                                         //0013 : 05 01 00 00 8F 18 11 
        case 1 :                                                                //001A : 0A 29 00 24 01 
          GotoState('Alive');                                                   //001F : 71 21 7A 0D 00 00 16 
          break;                                                                //0026 : 06 3B 00 
        case 2 :                                                                //0029 : 0A 38 00 24 02 
          GotoState('Dead');                                                    //002E : 71 21 CA 0C 00 00 16 
          break;                                                                //0035 : 06 3B 00 
        default:                                                                //0038 : 0A FF FF 
      }
    }
    //07 3B 00 9B 39 3A 00 00 8F 18 11 39 3A 01 E8 51 34 0F 16 05 01 00 00 8F 18 11 0A 29 00 24 01 71 
    //21 7A 0D 00 00 16 06 3B 00 0A 38 00 24 02 71 21 CA 0C 00 00 16 06 3B 00 0A FF FF 04 0B 47 
  }


  event FellOutOfWorld(byte KillType) {
    if (SBRole == 1 && mCurrentState != 2) {                                    //0000 : 07 65 00 82 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 0E 00 9B 39 3A 01 E8 51 34 0F 39 3A 24 02 16 16 
      if (Controller == None) {                                                 //0022 : 07 30 00 72 01 00 6E 6C 0F 2A 16 
      } else {                                                                  //002D : 06 65 00 
        TakeDamage(10 * CharacterStats.mRecord.MaxHealth,None,Location,vect(0.000000, 0.000000, 0.000000),Class'fell');//0030 : 1B 5C 0C 00 00 90 2C 0A 36 D8 91 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 2A 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 D0 EC 75 0F 16 
      }
    }
    //07 65 00 82 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 0E 00 9B 39 3A 01 E8 51 34 0F 39 3A 24 02 
    //16 16 07 30 00 72 01 00 6E 6C 0F 2A 16 06 65 00 1B 5C 0C 00 00 90 2C 0A 36 D8 91 18 11 19 01 08 
    //43 34 0F 05 00 68 01 78 2D 34 0F 16 2A 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 
    //D0 EC 75 0F 16 04 0B 47 
  }


  native function bool InteractionRange(Actor aTarget);


  event string GetActiveText(Game_ActiveTextItem aItem) {
    local byte PawnClass;
    if (aItem == None || aItem.Tag == ""
      || aItem.Tag == "N") {           //0000 : 07 70 00 84 84 72 00 D8 94 18 11 2A 16 18 13 00 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 00 16 16 18 14 00 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 4E 00 16 16 
      if (SBRole == 4) {                                                        //003A : 07 5D 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 04 16 
        return Character.cl_GetBaseName();                                      //004A : 04 19 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 
      } else {                                                                  //005A : 06 6D 00 
        return Character.cl_GetName();                                          //005D : 04 19 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 
      }
    } else {                                                                    //006D : 06 07 04 
      if (aItem.Tag == "F") {                                                   //0070 : 07 BC 00 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 46 00 16 
        if (SBRole == 4) {                                                      //0086 : 07 A9 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 04 16 
          return Character.cl_GetBaseFullName();                                //0096 : 04 19 01 68 2E 34 0F 06 00 00 1B 6D 0C 00 00 16 
        } else {                                                                //00A6 : 06 B9 00 
          return Character.cl_GetFullName();                                    //00A9 : 04 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 
        }
      } else {                                                                  //00B9 : 06 07 04 
        if (aItem.Tag == "G") {                                                 //00BC : 07 3A 01 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 00 16 
          if (aItem.FreeOptions.Length == 0) {                                  //00D2 : 07 16 01 9A 37 19 00 D8 94 18 11 05 00 00 01 80 9B 18 11 25 16 
            return Class'StringReferences'.GetActiveTextString(Class'Game_ActiveTextItem'.1,Appearance.IsFeminine());//00E7 : 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 01 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
          } else {                                                              //0113 : 06 37 01 
            return aItem.FreeOptions[Appearance.IsFeminine()];                  //0116 : 04 10 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 19 00 D8 94 18 11 05 00 00 01 80 9B 18 11 
          }
        } else {                                                                //0137 : 06 07 04 
          if (aItem.Tag == "GG") {                                              //013A : 07 80 01 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 47 00 16 
            return Class'StringReferences'.GetActiveTextString(Class'Game_ActiveTextItem'.2,Appearance.IsFeminine());//0151 : 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 02 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
          } else {                                                              //017D : 06 07 04 
            if (aItem.Tag == "GO") {                                            //0180 : 07 C6 01 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 4F 00 16 
              return Class'StringReferences'.GetActiveTextString(Class'Game_ActiveTextItem'.3,Appearance.IsFeminine());//0197 : 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 03 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
            } else {                                                            //01C3 : 06 07 04 
              if (aItem.Tag == "GS") {                                          //01C6 : 07 0C 02 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 53 00 16 
                return Class'StringReferences'.GetActiveTextString(Class'Game_ActiveTextItem'.4,Appearance.IsFeminine());//01DD : 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 04 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
              } else {                                                          //0209 : 06 07 04 
                if (aItem.Tag == "GP") {                                        //020C : 07 52 02 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 50 00 16 
                  return Class'StringReferences'.GetActiveTextString(Class'Game_ActiveTextItem'.5,Appearance.IsFeminine());//0223 : 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 05 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
                } else {                                                        //024F : 06 07 04 
                  if (aItem.Tag == "R") {                                       //0252 : 07 A3 02 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 52 00 16 
                    return Class'StringReferences'.GetRaceName(Appearance.GetBase().GetRace(),Appearance.IsFeminine());//0268 : 04 12 20 20 F7 60 01 2E 00 00 1B C9 0D 00 00 19 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 06 00 01 1B 6C 0F 00 00 16 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
                  } else {                                                      //02A0 : 06 07 04 
                    if (aItem.Tag == "C") {                                     //02A3 : 07 2A 03 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 43 00 16 
                      if (Game_PlayerStats(CharacterStats) != None) {           //02B9 : 07 03 03 77 2E 10 A3 5F 01 01 08 43 34 0F 2A 16 
                        PawnClass = CharacterStats.GetCharacterClass();         //02C9 : 0F 00 F8 9B 18 11 19 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 
                        if (PawnClass == 0) {                                   //02DE : 07 03 03 9A 39 3A 00 F8 9B 18 11 39 3A 24 00 16 
                          PawnClass = CharacterStats.GetArchetype();            //02EE : 0F 00 F8 9B 18 11 19 01 08 43 34 0F 06 00 01 1C 70 9C 18 11 16 
                        }
                      }
                      return Class'StringReferences'.GetClassName(PawnClass,Appearance.IsFeminine());//0303 : 04 12 20 20 F7 60 01 1A 00 00 1B 54 0D 00 00 00 F8 9B 18 11 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
                    } else {                                                    //0327 : 06 07 04 
                      if (aItem.Tag == "CA") {                                  //032A : 07 8D 03 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 43 41 00 16 
                        if (Game_PlayerStats(CharacterStats) != None) {         //0341 : 07 66 03 77 2E 10 A3 5F 01 01 08 43 34 0F 2A 16 
                          PawnClass = CharacterStats.GetArchetype();            //0351 : 0F 00 F8 9B 18 11 19 01 08 43 34 0F 06 00 01 1C 70 9C 18 11 16 
                        }
                        return Class'StringReferences'.GetClassName(PawnClass,Appearance.IsFeminine());//0366 : 04 12 20 20 F7 60 01 1A 00 00 1B 54 0D 00 00 00 F8 9B 18 11 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
                      } else {                                                  //038A : 06 07 04 
                        if (aItem.Tag == "H") {                                 //038D : 07 02 04 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 48 00 16 
                          if (Character.GetFaction() != None) {                 //03A3 : 07 E3 03 77 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 2A 16 
                            return Character.GetFaction().GetActiveText(aItem.SubItem);//03B8 : 04 19 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 14 00 00 1B 60 05 00 00 19 00 D8 94 18 11 05 00 04 01 20 9D 18 11 16 
                          } else {                                              //03E0 : 06 FF 03 
                            return Class'StringReferences'.GetActiveTextString(Class'Game_ActiveTextItem'.6,0);//03E3 : 04 12 20 20 F7 60 01 12 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 06 25 16 
                          }
                        } else {                                                //03FF : 06 07 04 
                          return "??";                                          //0402 : 04 1F 3F 3F 00 
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    //07 70 00 84 84 72 00 D8 94 18 11 2A 16 18 13 00 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 
    //00 16 16 18 14 00 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 4E 00 16 16 07 5D 00 9A 39 3A 
    //01 40 B2 6C 0F 39 3A 24 04 16 04 19 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 06 6D 00 04 19 01 
    //68 2E 34 0F 06 00 00 1C C8 12 18 11 16 06 07 04 07 BC 00 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 
    //18 11 1F 46 00 16 07 A9 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 04 16 04 19 01 68 2E 34 0F 06 00 00 
    //1B 6D 0C 00 00 16 06 B9 00 04 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 06 07 04 07 3A 01 7A 
    //19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 00 16 07 16 01 9A 37 19 00 D8 94 18 11 05 00 00 
    //01 80 9B 18 11 25 16 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 
    //01 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 06 37 01 04 10 39 41 19 01 A8 83 18 11 
    //06 00 04 1B 24 0C 00 00 16 19 00 D8 94 18 11 05 00 00 01 80 9B 18 11 06 07 04 07 80 01 7A 19 00 
    //D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 47 00 16 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 
    //12 20 70 A5 60 01 02 00 01 24 02 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 06 07 04 
    //07 C6 01 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 4F 00 16 04 12 20 20 F7 60 01 22 00 
    //00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 03 39 41 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 
    //00 16 16 06 07 04 07 0C 02 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 53 00 16 04 12 20 
    //20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 04 39 41 19 01 A8 83 18 11 06 
    //00 04 1B 24 0C 00 00 16 16 06 07 04 07 52 02 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 47 
    //50 00 16 04 12 20 20 F7 60 01 22 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 05 39 41 19 
    //01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 06 07 04 07 A3 02 7A 19 00 D8 94 18 11 05 00 00 01 
    //08 9B 18 11 1F 52 00 16 04 12 20 20 F7 60 01 2E 00 00 1B C9 0D 00 00 19 19 01 A8 83 18 11 06 00 
    //04 1B 63 05 00 00 16 06 00 01 1B 6C 0F 00 00 16 19 01 A8 83 18 11 06 00 04 1B 24 0C 00 00 16 16 
    //06 07 04 07 2A 03 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 43 00 16 07 03 03 77 2E 10 A3 
    //5F 01 01 08 43 34 0F 2A 16 0F 00 F8 9B 18 11 19 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 07 03 
    //03 9A 39 3A 00 F8 9B 18 11 39 3A 24 00 16 0F 00 F8 9B 18 11 19 01 08 43 34 0F 06 00 01 1C 70 9C 
    //18 11 16 04 12 20 20 F7 60 01 1A 00 00 1B 54 0D 00 00 00 F8 9B 18 11 19 01 A8 83 18 11 06 00 04 
    //1B 24 0C 00 00 16 16 06 07 04 07 8D 03 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 43 41 00 
    //16 07 66 03 77 2E 10 A3 5F 01 01 08 43 34 0F 2A 16 0F 00 F8 9B 18 11 19 01 08 43 34 0F 06 00 01 
    //1C 70 9C 18 11 16 04 12 20 20 F7 60 01 1A 00 00 1B 54 0D 00 00 00 F8 9B 18 11 19 01 A8 83 18 11 
    //06 00 04 1B 24 0C 00 00 16 16 06 07 04 07 02 04 7A 19 00 D8 94 18 11 05 00 00 01 08 9B 18 11 1F 
    //48 00 16 07 E3 03 77 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 2A 16 04 19 19 01 68 2E 34 0F 
    //06 00 04 1B 6D 05 00 00 16 14 00 00 1B 60 05 00 00 19 00 D8 94 18 11 05 00 04 01 20 9D 18 11 16 
    //06 FF 03 04 12 20 20 F7 60 01 12 00 00 1B 56 0C 00 00 12 20 70 A5 60 01 02 00 01 24 06 25 16 06 
    //07 04 04 1F 3F 3F 00 04 0B 47 
  }


  event bool sv_OnAttack(Game_Pawn aPawn,export editinline FSkill_EffectClass aEffect,bool WasNegativeEffect,float aValue) {
    local Game_Controller gc;
    local bool Result;
    if (IsDead()) {                                                             //0000 : 07 14 00 1C D8 52 34 0F 16 
      Result = False;                                                           //0009 : 14 2D 00 D8 A0 18 11 28 
    } else {                                                                    //0011 : 06 06 01 
      if (WasNegativeEffect && aPawn != None
        && aPawn.CombatStats != None
        && aEffect != None) {//0014 : 07 66 00 82 82 82 2D 00 50 A1 18 11 18 09 00 77 00 C0 9E 18 11 2A 16 16 18 12 00 77 19 00 C0 9E 18 11 05 00 04 01 30 41 18 11 2A 16 16 18 09 00 77 00 C8 A1 18 11 2A 16 16 
        aPawn.CombatStats.sv_SetLastAttackedPawn(self);                         //004D : 19 19 00 C0 9E 18 11 05 00 04 01 30 41 18 11 07 00 00 1B 39 0F 00 00 17 16 
      }
      if (IsAttackable(aPawn)) {                                                //0066 : 07 B8 00 1B 69 0E 00 00 00 C0 9E 18 11 16 
        if (!Game_Controller(Controller).sv_OnAttack(aPawn,aEffect,WasNegativeEffect,aValue)) {//0074 : 07 AD 00 81 19 2E 10 0E 5B 01 01 00 6E 6C 0F 1B 00 04 1B 17 07 00 00 00 C0 9E 18 11 00 C8 A1 18 11 2D 00 50 A1 18 11 00 40 A2 18 11 16 16 
          Result = False;                                                       //00A2 : 14 2D 00 D8 A0 18 11 28 
        } else {                                                                //00AA : 06 B5 00 
          Result = True;                                                        //00AD : 14 2D 00 D8 A0 18 11 27 
        }
      } else {                                                                  //00B5 : 06 C0 00 
        Result = True;                                                          //00B8 : 14 2D 00 D8 A0 18 11 27 
      }
      if (!Result && Pet != None) {                                             //00C0 : 07 06 01 82 81 2D 00 D8 A0 18 11 16 18 09 00 77 01 D8 3E 34 0F 2A 16 16 
        gc = Game_Controller(Pet.Controller);                                   //00D8 : 0F 00 B8 A2 18 11 2E 10 0E 5B 01 19 01 D8 3E 34 0F 05 00 04 01 00 6E 6C 0F 
        gc.sv_OnOwnerAttack(WasNegativeEffect);                                 //00F1 : 19 00 B8 A2 18 11 0C 00 00 1B 20 07 00 00 2D 00 50 A1 18 11 16 
      }
    }
    return Result;                                                              //0106 : 04 2D 00 D8 A0 18 11 
    //07 14 00 1C D8 52 34 0F 16 14 2D 00 D8 A0 18 11 28 06 06 01 07 66 00 82 82 82 2D 00 50 A1 18 11 
    //18 09 00 77 00 C0 9E 18 11 2A 16 16 18 12 00 77 19 00 C0 9E 18 11 05 00 04 01 30 41 18 11 2A 16 
    //16 18 09 00 77 00 C8 A1 18 11 2A 16 16 19 19 00 C0 9E 18 11 05 00 04 01 30 41 18 11 07 00 00 1B 
    //39 0F 00 00 17 16 07 B8 00 1B 69 0E 00 00 00 C0 9E 18 11 16 07 AD 00 81 19 2E 10 0E 5B 01 01 00 
    //6E 6C 0F 1B 00 04 1B 17 07 00 00 00 C0 9E 18 11 00 C8 A1 18 11 2D 00 50 A1 18 11 00 40 A2 18 11 
    //16 16 14 2D 00 D8 A0 18 11 28 06 B5 00 14 2D 00 D8 A0 18 11 27 06 C0 00 14 2D 00 D8 A0 18 11 27 
    //07 06 01 82 81 2D 00 D8 A0 18 11 16 18 09 00 77 01 D8 3E 34 0F 2A 16 16 0F 00 B8 A2 18 11 2E 10 
    //0E 5B 01 19 01 D8 3E 34 0F 05 00 04 01 00 6E 6C 0F 19 00 B8 A2 18 11 0C 00 00 1B 20 07 00 00 2D 
    //00 50 A1 18 11 16 04 2D 00 D8 A0 18 11 04 0B 47 
  }


  event string cl_GetSecondaryDisplayName() {
    return "";                                                                  //0000 : 04 1F 00 
    //04 1F 00 04 0B 47 
  }


  event string cl_GetPrimaryDisplayName() {
    return "";                                                                  //0000 : 04 1F 00 
    //04 1F 00 04 0B 47 
  }


  event SendDesktopMessage(string aSenderName,string aMessage,int aChannel) {
    local Game_PlayerController PlayerController;
    local Game_Desktop desktop;
    PlayerController = Game_PlayerController(Controller);                       //0000 : 0F 00 80 A7 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (PlayerController != None
      && PlayerController.Player != None) {    //0010 : 07 7C 00 82 77 00 80 A7 18 11 2A 16 18 12 00 77 19 00 80 A7 18 11 05 00 04 01 28 25 71 0F 2A 16 16 
      desktop = Game_Desktop(PlayerController.Player.GUIDesktop);               //0031 : 0F 00 F8 A7 18 11 2E 60 CE 5A 01 19 19 00 80 A7 18 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
      if (desktop != None) {                                                    //0053 : 07 7C 00 77 00 F8 A7 18 11 2A 16 
        desktop.AddMessage(aSenderName,aMessage,aChannel);                      //005E : 19 00 F8 A7 18 11 15 00 00 1B 7E 04 00 00 00 08 A7 18 11 00 70 A8 18 11 00 E8 A8 18 11 16 
      }
    }
    //0F 00 80 A7 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 07 7C 00 82 77 00 80 A7 18 11 2A 16 18 12 00 77 
    //19 00 80 A7 18 11 05 00 04 01 28 25 71 0F 2A 16 16 0F 00 F8 A7 18 11 2E 60 CE 5A 01 19 19 00 80 
    //A7 18 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 07 7C 00 77 00 F8 A7 18 11 2A 16 19 00 
    //F8 A7 18 11 15 00 00 1B 7E 04 00 00 00 08 A7 18 11 00 70 A8 18 11 00 E8 A8 18 11 16 04 0B 47 
  }


  function cl_AddScrollingCombatDamage(int aDamage) {
    //04 0B 47 
  }


  function cl_AddScrollingCombatValue(int aValue,byte aType,bool aShowPositiveSign) {
    if (aShowPositiveSign && aValue >= 0) {                                     //0000 : 07 30 00 82 2D 00 68 AC 18 11 18 09 00 99 00 68 AB 18 11 25 16 16 
      cl_AddScrollingCombatMessage("+" $ string(aValue),aType);                 //0016 : 1B 03 0C 00 00 70 1F 2B 00 39 53 00 68 AB 18 11 16 00 E0 AC 18 11 16 
    } else {                                                                    //002D : 06 42 00 
      cl_AddScrollingCombatMessage(string(aValue),aType);                       //0030 : 1B 03 0C 00 00 39 53 00 68 AB 18 11 00 E0 AC 18 11 16 
    }
    //07 30 00 82 2D 00 68 AC 18 11 18 09 00 99 00 68 AB 18 11 25 16 16 1B 03 0C 00 00 70 1F 2B 00 39 
    //53 00 68 AB 18 11 16 00 E0 AC 18 11 16 06 42 00 1B 03 0C 00 00 39 53 00 68 AB 18 11 00 E0 AC 18 
    //11 16 04 0B 47 
  }


  protected native function sv2cl_AddScrollingCombatDamage_CallStub();


  event sv2cl_AddScrollingCombatDamage(int aDamage) {
    cl_AddScrollingCombatDamage(aDamage);                                       //0000 : 1B EA 0C 00 00 00 08 AF 18 11 16 
    //1B EA 0C 00 00 00 08 AF 18 11 16 04 0B 47 
  }


  function cl_AddScrollingCombatMessage(string aText,optional byte aType,optional float aExtraScale) {
    HUD.cl_AddScrollingCombatMessage(aText,aType,aExtraScale);                  //0000 : 19 01 40 B1 18 11 15 00 00 1C B8 B1 18 11 00 70 B0 18 11 00 68 B2 18 11 00 E0 B2 18 11 16 
    //19 01 40 B1 18 11 15 00 00 1C B8 B1 18 11 00 70 B0 18 11 00 68 B2 18 11 00 E0 B2 18 11 16 04 0B 
    //47 
  }


  protected native function sv2rel_AddScrollingCombatMessage_CallStub();


  event sv2rel_AddScrollingCombatMessage(int aTextId,optional byte aType) {
    cl_AddScrollingCombatMessage(Class'SBDBSync'.GetDescription(aTextId),aType);//0000 : 1B 03 0C 00 00 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 B8 B4 18 11 16 00 88 B5 18 11 16 
    //1B 03 0C 00 00 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 B8 B4 18 11 16 00 88 B5 18 11 16 04 
    //0B 47 
  }


  protected native function sv2cl_AddRelayScrollingCombatMessage_CallStub();


  event sv2cl_AddRelayScrollingCombatMessage(Game_Pawn aTarget,int aTextId,optional byte aType) {
    aTarget.cl_AddScrollingCombatMessage(Class'SBDBSync'.GetDescription(aTextId),aType);//0000 : 19 00 60 B7 18 11 1F 00 00 1B 03 0C 00 00 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 D8 B7 18 11 16 00 50 B8 18 11 16 
    //19 00 60 B7 18 11 1F 00 00 1B 03 0C 00 00 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 D8 B7 18 
    //11 16 00 50 B8 18 11 16 04 0B 47 
  }


  protected native function sv2cl_AddScrollingCombatMessage_CallStub();


  event sv2cl_AddScrollingCombatMessage(int aTextId,optional byte aType,optional string aPostfix) {
    cl_AddScrollingCombatMessage(Class'SBDBSync'.GetDescription(aTextId)
      $ aPostfix,aType);//0000 : 1B 03 0C 00 00 70 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 28 BA 18 11 16 00 00 BB 18 11 16 00 78 BB 18 11 16 
    //1B 03 0C 00 00 70 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 28 BA 18 11 16 00 00 BB 18 11 16 
    //00 78 BB 18 11 16 04 0B 47 
  }


  function int GetScavengeMode() {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  function Game_Pawn GetRoundRobinMember() {
    return self;                                                                //0000 : 04 17 
    //04 17 04 0B 47 
  }


  function int GetLootMode() {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  native function Game_Team GetTeam();


  function int GetTeamID() {
    if (!IsPlayerPawn()) {                                                      //0000 : 07 10 00 81 1B B9 0C 00 00 16 16 
      return 0;                                                                 //000B : 04 25 
    } else {                                                                    //000D : 06 2E 00 
      return Game_PlayerController(Controller).GroupingTeams.GetTeamID();       //0010 : 04 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 06 00 04 1B 8B 0D 00 00 16 
    }
    //07 10 00 81 1B B9 0C 00 00 16 16 04 25 06 2E 00 04 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 
    //01 48 C2 18 11 06 00 04 1B 8B 0D 00 00 16 04 0B 47 
  }


  event TakeEffectDamage(float Damage,Game_Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    if (sv_IsResting()) {                                                       //0000 : 07 11 00 1B E7 0C 00 00 16 
      sv_Sit(False,False);                                                      //0009 : 1B 94 0C 00 00 28 28 16 
    }
    TakeDamage(Damage,instigatedBy,HitLocation,Momentum,DamageType);            //0011 : 1B 5C 0C 00 00 39 44 00 70 C3 18 11 00 58 C4 18 11 00 D0 C4 18 11 00 48 C5 18 11 00 C0 C5 18 11 16 
    //07 11 00 1B E7 0C 00 00 16 1B 94 0C 00 00 28 28 16 1B 5C 0C 00 00 39 44 00 70 C3 18 11 00 58 C4 
    //18 11 00 D0 C4 18 11 00 48 C5 18 11 00 C0 C5 18 11 16 04 0B 47 
  }


  protected native function cl2sv_TakeDamage_CallStub();


  event cl2sv_TakeDamage(int Damage,Game_Pawn instigatedBy,Vector HitLocation,Vector Momentum) {
    TakeDamage(Damage,instigatedBy,HitLocation,Momentum,Class'DamageType');     //0000 : 1B 5C 0C 00 00 00 A0 C7 18 11 00 70 C8 18 11 00 E8 C8 18 11 00 60 C9 18 11 20 18 44 C2 00 16 
    //1B 5C 0C 00 00 00 A0 C7 18 11 00 70 C8 18 11 00 E8 C8 18 11 00 60 C9 18 11 20 18 44 C2 00 16 04 
    //0B 47 
  }


  function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    if (!IsInvulnerable()) {                                                    //0000 : 07 55 00 81 1B A0 05 00 00 16 16 
      if (IsServer()) {                                                         //000B : 07 36 00 1B FF 0B 00 00 16 
        Super.TakeDamage(Damage,instigatedBy,HitLocation,Momentum,DamageType);  //0014 : 1C 58 06 84 0F 00 88 CA 18 11 00 A8 CB 18 11 00 20 CC 18 11 00 98 CC 18 11 00 10 CD 18 11 16 
      } else {                                                                  //0033 : 06 55 00 
        cl2sv_TakeDamage_CallStub(Damage,Game_Pawn(instigatedBy),HitLocation,Momentum);//0036 : 1B 68 0E 00 00 00 88 CA 18 11 2E 18 38 5B 01 00 A8 CB 18 11 00 20 CC 18 11 00 98 CC 18 11 16 
      }
    }
    //07 55 00 81 1B A0 05 00 00 16 16 07 36 00 1B FF 0B 00 00 16 1C 58 06 84 0F 00 88 CA 18 11 00 A8 
    //CB 18 11 00 20 CC 18 11 00 98 CC 18 11 00 10 CD 18 11 16 06 55 00 1B 68 0E 00 00 00 88 CA 18 11 
    //2E 18 38 5B 01 00 A8 CB 18 11 00 20 CC 18 11 00 98 CC 18 11 16 04 0B 47 
  }


  event Landed(Vector HitNormal) {
    local float damageFactor;
    bJumpedFromLadder = False;                                                  //0000 : 14 2D 01 98 D0 18 11 28 
    Super.Landed(HitNormal);                                                    //0008 : 1C 18 47 84 0F 00 40 CE 18 11 16 
    if (IsServer()) {                                                           //0013 : 07 32 01 1B FF 0B 00 00 16 
      if (-Velocity.Z > mMaxDamageFallSpeed) {                                  //001C : 07 95 00 B1 A9 36 38 C5 69 0F 01 A0 95 6C 0F 16 01 10 D1 18 11 16 
        damageFactor = 10.00000000;                                             //0032 : 0F 00 88 D1 18 11 1E 00 00 20 41 
        TakeDamage(damageFactor * CharacterStats.mRecord.MaxHealth,None,Location,vect(0.000000, 0.000000, 0.000000),Class'fell');//003D : 1B 5C 0C 00 00 39 44 AB 00 88 D1 18 11 39 3F 36 D8 91 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 2A 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 D0 EC 75 0F 16 
        sv2cl_AddScrollingCombatMessage_CallStub(Class'StringReferences'.default.Cratered.Id);//0079 : 1B EC 0C 00 00 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 D2 18 11 16 
      } else {                                                                  //0092 : 06 32 01 
        if (-Velocity.Z > mMinDamageFallSpeed) {                                //0095 : 07 32 01 B1 A9 36 38 C5 69 0F 01 A0 95 6C 0F 16 01 78 D2 18 11 16 
          damageFactor = (-Velocity.Z - mMinDamageFallSpeed) / (mMaxDamageFallSpeed - mMinDamageFallSpeed);//00AB : 0F 00 88 D1 18 11 AC AF A9 36 38 C5 69 0F 01 A0 95 6C 0F 16 01 78 D2 18 11 16 AF 01 10 D1 18 11 01 78 D2 18 11 16 16 
          TakeDamage(damageFactor * CharacterStats.mRecord.MaxHealth,None,Location,vect(0.000000, 0.000000, 0.000000),Class'fell');//00D2 : 1B 5C 0C 00 00 39 44 AB 00 88 D1 18 11 39 3F 36 D8 91 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 2A 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 D0 EC 75 0F 16 
          sv2cl_AddScrollingCombatDamage_CallStub(damageFactor * CharacterStats.mRecord.MaxHealth);//010E : 1B 63 0E 00 00 39 44 AB 00 88 D1 18 11 39 3F 36 D8 91 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 16 
        }
      }
    }
    LastHitBy = None;                                                           //0132 : 0F 01 D8 CE 74 0F 2A 
    //14 2D 01 98 D0 18 11 28 1C 18 47 84 0F 00 40 CE 18 11 16 07 32 01 1B FF 0B 00 00 16 07 95 00 B1 
    //A9 36 38 C5 69 0F 01 A0 95 6C 0F 16 01 10 D1 18 11 16 0F 00 88 D1 18 11 1E 00 00 20 41 1B 5C 0C 
    //00 00 39 44 AB 00 88 D1 18 11 39 3F 36 D8 91 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 
    //2A 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 D0 EC 75 0F 16 1B EC 0C 00 00 36 D0 
    //C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 00 D2 18 11 16 06 32 01 07 32 01 B1 A9 36 38 C5 69 0F 01 
    //A0 95 6C 0F 16 01 78 D2 18 11 16 0F 00 88 D1 18 11 AC AF A9 36 38 C5 69 0F 01 A0 95 6C 0F 16 01 
    //78 D2 18 11 16 AF 01 10 D1 18 11 01 78 D2 18 11 16 16 1B 5C 0C 00 00 39 44 AB 00 88 D1 18 11 39 
    //3F 36 D8 91 18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 2A 01 30 81 6C 0F 23 00 00 00 00 
    //00 00 00 00 00 00 00 00 20 D0 EC 75 0F 16 1B 63 0E 00 00 39 44 AB 00 88 D1 18 11 39 3F 36 D8 91 
    //18 11 19 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 16 0F 01 D8 CE 74 0F 2A 04 0B 47 
  }


  native function bool IsAttackable(Game_Pawn aOpponent);


  event bool IsInvulnerable() {
    return bInvulnerable || bCheatInvulnerable;                                 //0000 : 04 84 2D 01 38 D6 18 11 18 07 00 2D 01 B0 D6 18 11 16 
    //04 84 2D 01 38 D6 18 11 18 07 00 2D 01 B0 D6 18 11 16 04 0B 47 
  }


  protected native function sv2rel_SetInvulnerable_CallStub();


  event sv2rel_SetInvulnerable(bool aInvulnerable) {
    bInvulnerable = aInvulnerable;                                              //0000 : 14 2D 01 38 D6 18 11 2D 00 88 D8 18 11 
    //14 2D 01 38 D6 18 11 2D 00 88 D8 18 11 04 0B 47 
  }


  event SetInvulnerable(bool aInvulnerable) {
    bInvulnerable = aInvulnerable;                                              //0000 : 14 2D 01 38 D6 18 11 2D 00 B0 D9 18 11 
    sv2rel_SetInvulnerable_CallStub(aInvulnerable);                             //000D : 1B 6A 0E 00 00 2D 00 B0 D9 18 11 16 
    //14 2D 01 38 D6 18 11 2D 00 B0 D9 18 11 1B 6A 0E 00 00 2D 00 B0 D9 18 11 16 04 0B 47 
  }


  native function SetHealth(float aHealth);


  native function IncreaseHealth(float aDelta);


  native function float GetHealth();


  final native function int GetCharacterID();


  event string GetCharacterName() {
    if (IsClient()) {                                                           //0000 : 07 1C 00 1B 1C 0C 00 00 16 
      return Character.cl_GetName();                                            //0009 : 04 19 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 
    } else {                                                                    //0019 : 06 2C 00 
      return Character.sv_GetName();                                            //001C : 04 19 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 
    }
    //07 1C 00 1B 1C 0C 00 00 16 04 19 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 06 2C 00 04 19 01 68 
    //2E 34 0F 06 00 00 1C 78 E1 18 11 16 04 0B 47 
  }


  native function Vector GetHistoryLocation(float aServerTime);


  native function UpdateMovementVariables();


  native function PredictMovement(float aDeltaTime);


  final native function float GetServerTime();


  event StopMoving() {
    Acceleration = vect(0.000000, 0.000000, 0.000000);                          //0000 : 0F 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    Velocity = vect(0.000000, 0.000000, 0.000000);                              //0013 : 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    //0F 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 
    //00 00 00 00 00 00 04 0B 47 
  }


  function DestroyShadow() {
    if (mPawnShadow != None) {                                                  //0000 : 07 2E 00 77 01 18 E9 18 11 2A 16 
      mPawnShadow.DetachProjector(True);                                        //000B : 19 01 18 E9 18 11 07 00 00 1B DF 12 00 00 27 16 
      mPawnShadow.Destroy();                                                    //001B : 19 01 18 E9 18 11 03 00 04 61 17 16 
      mPawnShadow = None;                                                       //0027 : 0F 01 18 E9 18 11 2A 
    }
    //07 2E 00 77 01 18 E9 18 11 2A 16 19 01 18 E9 18 11 07 00 00 1B DF 12 00 00 27 16 19 01 18 E9 18 
    //11 03 00 04 61 17 16 0F 01 18 E9 18 11 2A 04 0B 47 
  }


  function CreateShadow() {
    if (bActorShadows && IsClient() && !IsServer()) {                           //0000 : 07 CA 00 82 82 2D 01 E8 57 6E 0F 18 07 00 1B 1C 0C 00 00 16 16 18 09 00 81 1B FF 0B 00 00 16 16 16 
      mPawnShadow = Spawn(Class'ShadowProjector',self,'None',Location);         //0021 : 0F 01 18 E9 18 11 61 16 20 90 B1 D5 00 17 21 00 00 00 00 01 30 81 6C 0F 16 
      mPawnShadow.ShadowActor = self;                                           //003A : 0F 19 01 18 E9 18 11 05 00 04 01 88 EB 18 11 17 
      mPawnShadow.bBlobShadow = True;                                           //004A : 14 19 01 18 E9 18 11 06 00 04 2D 01 00 EC 18 11 27 
      mPawnShadow.LightDirection = -GetMainLightDirection();                    //005B : 0F 19 01 18 E9 18 11 05 00 0C 01 78 EC 18 11 D3 1B 71 0E 00 00 16 16 
      mPawnShadow.LightDistance = CollisionHeight * 8.00000000;                 //0072 : 0F 19 01 18 E9 18 11 05 00 04 01 F0 EC 18 11 AB 01 40 8A 6C 0F 1E 00 00 00 41 16 
      mPawnShadow.MaxTraceDistance = CollisionHeight * 8.50000000;              //008D : 0F 19 01 18 E9 18 11 05 00 04 01 C0 8E 7E 0F 39 44 AB 01 40 8A 6C 0F 1E 00 00 08 41 16 
      mPawnShadow.RootMotion = True;                                            //00AA : 14 19 01 18 E9 18 11 06 00 04 2D 01 68 ED 18 11 27 
      mPawnShadow.InitShadow();                                                 //00BB : 19 01 18 E9 18 11 06 00 00 1B EA 12 00 00 16 
    }
    //07 CA 00 82 82 2D 01 E8 57 6E 0F 18 07 00 1B 1C 0C 00 00 16 16 18 09 00 81 1B FF 0B 00 00 16 16 
    //16 0F 01 18 E9 18 11 61 16 20 90 B1 D5 00 17 21 00 00 00 00 01 30 81 6C 0F 16 0F 19 01 18 E9 18 
    //11 05 00 04 01 88 EB 18 11 17 14 19 01 18 E9 18 11 06 00 04 2D 01 00 EC 18 11 27 0F 19 01 18 E9 
    //18 11 05 00 0C 01 78 EC 18 11 D3 1B 71 0E 00 00 16 16 0F 19 01 18 E9 18 11 05 00 04 01 F0 EC 18 
    //11 AB 01 40 8A 6C 0F 1E 00 00 00 41 16 0F 19 01 18 E9 18 11 05 00 04 01 C0 8E 7E 0F 39 44 AB 01 
    //40 8A 6C 0F 1E 00 00 08 41 16 14 19 01 18 E9 18 11 06 00 04 2D 01 68 ED 18 11 27 19 01 18 E9 18 
    //11 06 00 00 1B EA 12 00 00 16 04 0B 47 
  }


  native function Vector GetMainLightDirection();


  function RadialMenuSelect(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    local Game_PlayerPawn Player;
    local Game_PlayerPawn Opponent;
    Super.RadialMenuSelect(aPlayerPawn,aMainOption,aSubOption);                 //0000 : 1C 38 52 6C 0F 00 70 11 37 0F 00 C0 13 37 0F 00 38 14 37 0F 16 
    if (aMainOption == Class'Game_RadialMenuOptions'.0) {                       //0015 : 07 33 01 9A 39 3A 00 C0 13 37 0F 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
      if (aSubOption == Class'Game_RadialMenuOptions'.7
        && Game_PlayerPawn(self) != None
        && aPlayerPawn.IsA('Game_Pawn')) {//002E : 07 AE 00 82 82 9A 39 3A 00 38 14 37 0F 39 3A 12 20 B0 D7 60 01 02 00 01 24 07 16 18 0A 00 77 2E F0 47 5B 01 17 2A 16 16 18 12 00 19 00 70 11 37 0F 08 00 04 61 2F 21 49 08 00 00 16 16 
        Game_Pawn(aPlayerPawn).Trading.cl_RequestTrade(Game_PlayerController(aPlayerPawn.Controller).Input.cl_GetTargetPawn());//006B : 19 19 2E 18 38 5B 01 00 70 11 37 0F 05 00 04 01 C0 43 32 0F 2C 00 00 1B FE 0E 00 00 19 19 2E 90 18 5B 01 19 00 70 11 37 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 
      }
      if (aSubOption == Class'Game_RadialMenuOptions'.18
        && Game_PlayerPawn(self) != None) {//00AE : 07 33 01 82 9A 39 3A 00 38 14 37 0F 39 3A 12 20 B0 D7 60 01 02 00 01 24 12 16 18 0A 00 77 2E F0 47 5B 01 17 2A 16 16 
        Player = Game_PlayerPawn(aPlayerPawn);                                  //00D5 : 0F 00 28 15 37 0F 2E F0 47 5B 01 00 70 11 37 0F 
        Opponent = Game_PlayerPawn(Game_PlayerController(Player.Controller).Input.cl_GetTargetPawn());//00E5 : 0F 00 A0 15 37 0F 2E F0 47 5B 01 19 19 2E 90 18 5B 01 19 00 28 15 37 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 
        Player.MiniGameProxy.cl_StartMiniGame(Opponent);                        //0116 : 19 19 00 28 15 37 0F 05 00 04 01 30 5D 83 0F 0B 00 00 1B 51 05 00 00 00 A0 15 37 0F 16 
      }
    }
    //1C 38 52 6C 0F 00 70 11 37 0F 00 C0 13 37 0F 00 38 14 37 0F 16 07 33 01 9A 39 3A 00 C0 13 37 0F 
    //39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 07 AE 00 82 82 9A 39 3A 00 38 14 37 0F 39 3A 12 20 B0 
    //D7 60 01 02 00 01 24 07 16 18 0A 00 77 2E F0 47 5B 01 17 2A 16 16 18 12 00 19 00 70 11 37 0F 08 
    //00 04 61 2F 21 49 08 00 00 16 16 19 19 2E 18 38 5B 01 00 70 11 37 0F 05 00 04 01 C0 43 32 0F 2C 
    //00 00 1B FE 0E 00 00 19 19 2E 90 18 5B 01 19 00 70 11 37 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 
    //B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 07 33 01 82 9A 39 3A 00 38 14 37 0F 39 3A 12 20 B0 D7 
    //60 01 02 00 01 24 12 16 18 0A 00 77 2E F0 47 5B 01 17 2A 16 16 0F 00 28 15 37 0F 2E F0 47 5B 01 
    //00 70 11 37 0F 0F 00 A0 15 37 0F 2E F0 47 5B 01 19 19 2E 90 18 5B 01 19 00 28 15 37 0F 05 00 04 
    //01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 19 19 00 28 15 37 0F 05 00 04 
    //01 30 5D 83 0F 0B 00 00 1B 51 05 00 00 00 A0 15 37 0F 16 04 0B 47 
  }


  function Material RadialMenuImage(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  event RadialMenuCollect(Pawn aPlayerPawn,byte aMainOption,out array<byte> aSubOptions) {
    Super.RadialMenuCollect(aPlayerPawn,aMainOption,aSubOptions);               //0000 : 1C C0 24 6C 0F 00 00 F2 18 11 00 C8 F2 18 11 00 40 F3 18 11 16 
    //1C C0 24 6C 0F 00 00 F2 18 11 00 C8 F2 18 11 00 40 F3 18 11 16 04 0B 47 
  }


  function SBClock GetClock() {
    if (Game_GameInfo(GetGameInfo()) != None) {                                 //0000 : 07 26 00 77 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 2A 16 
      return Game_GameInfo(GetGameInfo()).mClock;                               //0011 : 04 19 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 05 00 04 01 38 FE 34 0F 
    }
    return None;                                                                //0026 : 04 2A 
    //07 26 00 77 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 2A 16 04 19 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 05 00 
    //04 01 38 FE 34 0F 04 2A 04 0B 47 
  }


  event bool IsPlayerPawn() {
    return Game_PlayerPawn(self) != None;                                       //0000 : 04 77 2E F0 47 5B 01 17 2A 16 
    //04 77 2E F0 47 5B 01 17 2A 16 04 0B 47 
  }


  protected native function sv2clrel_UpdateGroundSpeedModifier_CallStub();


  event sv2clrel_UpdateGroundSpeedModifier(float aModifier) {
    GroundSpeedModifier = aModifier;                                            //0000 : 0F 01 30 02 35 0F 00 78 01 35 0F 
    //0F 01 30 02 35 0F 00 78 01 35 0F 04 0B 47 
  }


  function sv_SetGroundSpeedModifier(float aModifier) {
    GroundSpeedModifier = aModifier;                                            //0000 : 0F 01 30 02 35 0F 00 58 03 35 0F 
    sv2clrel_UpdateGroundSpeedModifier_CallStub(GroundSpeedModifier);           //000B : 1B 74 0E 00 00 01 30 02 35 0F 16 
    //0F 01 30 02 35 0F 00 58 03 35 0F 1B 74 0E 00 00 01 30 02 35 0F 16 04 0B 47 
  }


  event cl_NotifySelected(bool aIsSelected) {
    if (mIsSelected != aIsSelected) {                                           //0000 : 07 24 00 F3 2D 01 A8 05 35 0F 2D 00 D0 04 35 0F 16 
      mIsSelected = aIsSelected;                                                //0011 : 14 2D 01 A8 05 35 0F 2D 00 D0 04 35 0F 
      cl_UpdateInteractionEffect();                                             //001E : 1B 81 0D 00 00 16 
    }
    //07 24 00 F3 2D 01 A8 05 35 0F 2D 00 D0 04 35 0F 16 14 2D 01 A8 05 35 0F 2D 00 D0 04 35 0F 1B 81 
    //0D 00 00 16 04 0B 47 
  }


  event cl_NotifyUnderCursor(bool aIsUnderCursor) {
    Super.cl_NotifyUnderCursor(aIsUnderCursor);                                 //0000 : 1C F8 4C 6C 0F 2D 00 C0 F5 18 11 16 
    if (mIsUnderCursor != aIsUnderCursor) {                                     //000C : 07 30 00 F3 2D 01 A8 F6 18 11 2D 00 C0 F5 18 11 16 
      mIsUnderCursor = aIsUnderCursor;                                          //001D : 14 2D 01 A8 F6 18 11 2D 00 C0 F5 18 11 
      cl_UpdateInteractionEffect();                                             //002A : 1B 81 0D 00 00 16 
    }
    //1C F8 4C 6C 0F 2D 00 C0 F5 18 11 16 07 30 00 F3 2D 01 A8 F6 18 11 2D 00 C0 F5 18 11 16 14 2D 01 
    //A8 F6 18 11 2D 00 C0 F5 18 11 1B 81 0D 00 00 16 04 0B 47 
  }


  function cl_UpdateInteractionEffect() {
    if (Effects == None) {                                                      //0000 : 07 0D 00 72 01 48 63 34 0F 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    if (mIsSelected) {                                                          //000D : 07 33 00 2D 01 A8 05 35 0F 
      Effects.cl_SetInteractionEffect(Class'Game_Effects'.2);                   //0016 : 19 01 48 63 34 0F 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 02 16 
    } else {                                                                    //0030 : 06 73 00 
      if (mIsUnderCursor) {                                                     //0033 : 07 59 00 2D 01 A8 F6 18 11 
        Effects.cl_SetInteractionEffect(Class'Game_Effects'.1);                 //003C : 19 01 48 63 34 0F 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 01 16 
      } else {                                                                  //0056 : 06 73 00 
        Effects.cl_SetInteractionEffect(Class'Game_Effects'.0);                 //0059 : 19 01 48 63 34 0F 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 00 16 
      }
    }
    //07 0D 00 72 01 48 63 34 0F 2A 16 04 0B 07 33 00 2D 01 A8 05 35 0F 19 01 48 63 34 0F 11 00 00 1B 
    //5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 02 16 06 73 00 07 59 00 2D 01 A8 F6 18 11 19 01 48 63 
    //34 0F 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 01 16 06 73 00 19 01 48 63 34 0F 11 
    //00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 00 16 04 0B 47 
  }


  protected final native function bool TeleportTo(Vector aNewLocation,Rotator aNewRotation);


  final native function Submerge();


  protected native function sv2clrel_Submerge_CallStub();


  protected event sv2clrel_Submerge() {
    Submerge();                                                                 //0000 : 1C A0 F8 18 11 16 
    //1C A0 F8 18 11 16 04 0B 47 
  }


  final native function Emerge();


  protected native function sv2clrel_Emerge_CallStub();


  protected event sv2clrel_Emerge() {
    Emerge();                                                                   //0000 : 1C F8 12 19 11 16 
    //1C F8 12 19 11 16 04 0B 47 
  }


  event bool sv_TeleportTo(Vector aNewLocation,Rotator aNewRotation) {
    if (TeleportTo(aNewLocation,aNewRotation)) {                                //0000 : 07 25 00 1C 20 F7 18 11 00 08 17 19 11 00 80 17 19 11 16 
      sv2clrel_TeleportTo_CallStub(aNewLocation,aNewRotation);                  //0013 : 1B 7C 0E 00 00 00 08 17 19 11 00 80 17 19 11 16 
      return True;                                                              //0023 : 04 27 
    }
    return False;                                                               //0025 : 04 28 
    //07 25 00 1C 20 F7 18 11 00 08 17 19 11 00 80 17 19 11 16 1B 7C 0E 00 00 00 08 17 19 11 00 80 17 
    //19 11 16 04 27 04 28 04 0B 47 
  }


  protected native function sv2clrel_TeleportTo_CallStub();


  event sv2clrel_TeleportTo(Vector NewLocation,Rotator NewRotation) {
    TeleportTo(NewLocation,NewRotation);                                        //0000 : 1C 20 F7 18 11 00 D0 19 19 11 00 90 1A 19 11 16 
    //1C 20 F7 18 11 00 D0 19 19 11 00 90 1A 19 11 16 04 0B 47 
  }


  function bool IsMuted(optional byte aRange) {
    local Game_PlayerController gc;
    gc = Game_PlayerController(Controller);                                     //0000 : 0F 00 18 1D 19 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gc != None) {                                                           //0010 : 07 86 00 77 00 18 1D 19 11 2A 16 
      if (gc.DBMutedScope == Class'Game_PlayerController'."all") {              //001B : 07 3E 00 7A 19 00 18 1D 19 11 05 00 00 01 90 1D 19 11 12 20 90 18 5B 01 05 00 00 1F 61 6C 6C 00 16 
        return True;                                                            //003C : 04 27 
      }
      if (aRange == 1) {                                                        //003E : 07 70 00 9A 39 3A 00 B8 1B 19 11 39 3A 24 01 16 
        return gc.DBMutedScope == Class'Game_PlayerController'."global";        //004E : 04 7A 19 00 18 1D 19 11 05 00 00 01 90 1D 19 11 12 20 90 18 5B 01 08 00 00 1F 67 6C 6F 62 61 6C 00 16 
      }
      return gc.DBMutedScope != "";                                             //0070 : 04 7B 19 00 18 1D 19 11 05 00 00 01 90 1D 19 11 1F 00 16 
    } else {                                                                    //0083 : 06 88 00 
      return False;                                                             //0086 : 04 28 
    }
    //0F 00 18 1D 19 11 2E 90 18 5B 01 01 00 6E 6C 0F 07 86 00 77 00 18 1D 19 11 2A 16 07 3E 00 7A 19 
    //00 18 1D 19 11 05 00 00 01 90 1D 19 11 12 20 90 18 5B 01 05 00 00 1F 61 6C 6C 00 16 04 27 07 70 
    //00 9A 39 3A 00 B8 1B 19 11 39 3A 24 01 16 04 7A 19 00 18 1D 19 11 05 00 00 01 90 1D 19 11 12 20 
    //90 18 5B 01 08 00 00 1F 67 6C 6F 62 61 6C 00 16 04 7B 19 00 18 1D 19 11 05 00 00 01 90 1D 19 11 
    //1F 00 16 06 88 00 04 28 04 0B 47 
  }


  protected native function sv2cl_UpdateMuted_CallStub();


  event sv2cl_UpdateMuted(bool aMuted,string aMutedScope) {
    local Game_PlayerController gc;
    gc = Game_PlayerController(Controller);                                     //0000 : 0F 00 D0 45 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gc != None) {                                                           //0010 : 07 45 00 77 00 D0 45 18 11 2A 16 
      gc.DBMuted = aMuted;                                                      //001B : 14 19 00 D0 45 18 11 06 00 04 2D 01 48 46 18 11 2D 00 80 1F 19 11 
      gc.DBMutedScope = aMutedScope;                                            //0031 : 0F 19 00 D0 45 18 11 05 00 00 01 90 1D 19 11 00 C0 46 18 11 
    }
    //0F 00 D0 45 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 07 45 00 77 00 D0 45 18 11 2A 16 14 19 00 D0 45 
    //18 11 06 00 04 2D 01 48 46 18 11 2D 00 80 1F 19 11 0F 19 00 D0 45 18 11 05 00 00 01 90 1D 19 11 
    //00 C0 46 18 11 04 0B 47 
  }


  final native function Mute(int aAccountID,bool aState,optional int aMinutes,optional string aScope);


  function sv_Mute(bool aState,optional int aMinutes,optional string aScope) {
    local Game_PlayerController gc;
    gc = Game_PlayerController(Controller);                                     //0000 : 0F 00 38 4C 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 
    if (gc != None) {                                                           //0010 : 07 9A 00 77 00 38 4C 18 11 2A 16 
      gc.DBMuted = aState;                                                      //001B : 14 19 00 38 4C 18 11 06 00 04 2D 01 48 46 18 11 2D 00 C0 4A 18 11 
      gc.DBMutedScope = aScope;                                                 //0031 : 0F 19 00 38 4C 18 11 05 00 00 01 90 1D 19 11 00 B0 4C 18 11 
      Mute(Base_Controller(Controller).AccountID,gc.DBMuted,aMinutes,aScope);   //0045 : 1C 20 45 18 11 19 2E 78 3D 24 01 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 19 00 38 4C 18 11 06 00 04 2D 01 48 46 18 11 00 A0 4D 18 11 00 B0 4C 18 11 16 
      sv2cl_UpdateMuted_CallStub(gc.DBMuted,gc.DBMutedScope);                   //0077 : 1B 7E 0E 00 00 19 00 38 4C 18 11 06 00 04 2D 01 48 46 18 11 19 00 38 4C 18 11 05 00 00 01 90 1D 19 11 16 
    }
    //0F 00 38 4C 18 11 2E 90 18 5B 01 01 00 6E 6C 0F 07 9A 00 77 00 38 4C 18 11 2A 16 14 19 00 38 4C 
    //18 11 06 00 04 2D 01 48 46 18 11 2D 00 C0 4A 18 11 0F 19 00 38 4C 18 11 05 00 00 01 90 1D 19 11 
    //00 B0 4C 18 11 1C 20 45 18 11 19 2E 78 3D 24 01 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 19 00 38 
    //4C 18 11 06 00 04 2D 01 48 46 18 11 00 A0 4D 18 11 00 B0 4C 18 11 16 1B 7E 0E 00 00 19 00 38 4C 
    //18 11 06 00 04 2D 01 48 46 18 11 19 00 38 4C 18 11 05 00 00 01 90 1D 19 11 16 04 0B 47 
  }


  event Destroyed() {
    RemoveAllAttachments();                                                     //0000 : 1B 95 12 00 00 16 
    DestroyShadow();                                                            //0006 : 1B 7E 0D 00 00 16 
    Super.Destroyed();                                                          //000C : 1C 70 BC 75 0F 16 
    //1B 95 12 00 00 16 1B 7E 0D 00 00 16 1C 70 BC 75 0F 16 04 0B 47 
  }


  event cl_OnShutdown() {
    if (Effects != None) {                                                      //0000 : 07 1A 00 77 01 48 63 34 0F 2A 16 
      Effects.cl_OnShutdown();                                                  //000B : 19 01 48 63 34 0F 06 00 00 1B 66 07 00 00 16 
    }
    if (MiniGameProxy != None) {                                                //001A : 07 34 00 77 01 30 5D 83 0F 2A 16 
      MiniGameProxy.cl_OnShutdown();                                            //0025 : 19 01 30 5D 83 0F 06 00 00 1B 66 07 00 00 16 
    }
    if (combatState != None) {                                                  //0034 : 07 4E 00 77 01 B8 40 18 11 2A 16 
      combatState.cl_OnShutdown();                                              //003F : 19 01 B8 40 18 11 06 00 00 1B 66 07 00 00 16 
    }
    if (Appearance != None) {                                                   //004E : 07 68 00 77 01 A8 83 18 11 2A 16 
      Appearance.cl_OnShutdown();                                               //0059 : 19 01 A8 83 18 11 06 00 00 1B 66 07 00 00 16 
    }
    if (Skills != None) {                                                       //0068 : 07 82 00 77 01 08 28 18 11 2A 16 
      Skills.cl_OnShutdown();                                                   //0073 : 19 01 08 28 18 11 06 00 00 1B 66 07 00 00 16 
    }
    if (CharacterStats != None) {                                               //0082 : 07 9C 00 77 01 08 43 34 0F 2A 16 
      CharacterStats.cl_OnShutdown();                                           //008D : 19 01 08 43 34 0F 06 00 00 1B 66 07 00 00 16 
    }
    if (Character != None) {                                                    //009C : 07 B6 00 77 01 68 2E 34 0F 2A 16 
      Character.cl_OnShutdown();                                                //00A7 : 19 01 68 2E 34 0F 06 00 00 1B 66 07 00 00 16 
    }
    if (IsLocalPlayer()) {                                                      //00B6 : 07 41 01 1C 18 1A 76 0F 16 
      if (BodySlots != None) {                                                  //00BF : 07 D9 00 77 01 90 42 34 0F 2A 16 
        BodySlots.cl_OnShutdown();                                              //00CA : 19 01 90 42 34 0F 06 00 00 1B 66 07 00 00 16 
      }
      if (CombatStats != None) {                                                //00D9 : 07 F3 00 77 01 30 41 18 11 2A 16 
        CombatStats.cl_OnShutdown();                                            //00E4 : 19 01 30 41 18 11 06 00 00 1B 66 07 00 00 16 
      }
      if (Emotes != None) {                                                     //00F3 : 07 0D 01 77 01 F0 51 18 11 2A 16 
        Emotes.cl_OnShutdown();                                                 //00FE : 19 01 F0 51 18 11 06 00 00 1B 66 07 00 00 16 
      }
      if (Looting != None) {                                                    //010D : 07 27 01 77 01 68 52 18 11 2A 16 
        Looting.cl_OnShutdown();                                                //0118 : 19 01 68 52 18 11 06 00 00 1B 66 07 00 00 16 
      }
      if (Trading != None) {                                                    //0127 : 07 41 01 77 01 C0 43 32 0F 2A 16 
        Trading.cl_OnShutdown();                                                //0132 : 19 01 C0 43 32 0F 06 00 00 1B 66 07 00 00 16 
      }
    }
    ShiftStateChanged.Delete();                                                 //0141 : 19 01 88 95 84 0F 06 00 00 1B 7B 0C 00 00 16 
    CombatStateChanged.Delete();                                                //0150 : 19 01 E0 52 18 11 06 00 00 1B 7B 0C 00 00 16 
    PetSummoned.Delete();                                                       //015F : 19 01 88 51 32 0F 06 00 00 1B 7B 0C 00 00 16 
    Super.cl_OnShutdown();                                                      //016E : 1C 40 3C 32 0F 16 
    //07 1A 00 77 01 48 63 34 0F 2A 16 19 01 48 63 34 0F 06 00 00 1B 66 07 00 00 16 07 34 00 77 01 30 
    //5D 83 0F 2A 16 19 01 30 5D 83 0F 06 00 00 1B 66 07 00 00 16 07 4E 00 77 01 B8 40 18 11 2A 16 19 
    //01 B8 40 18 11 06 00 00 1B 66 07 00 00 16 07 68 00 77 01 A8 83 18 11 2A 16 19 01 A8 83 18 11 06 
    //00 00 1B 66 07 00 00 16 07 82 00 77 01 08 28 18 11 2A 16 19 01 08 28 18 11 06 00 00 1B 66 07 00 
    //00 16 07 9C 00 77 01 08 43 34 0F 2A 16 19 01 08 43 34 0F 06 00 00 1B 66 07 00 00 16 07 B6 00 77 
    //01 68 2E 34 0F 2A 16 19 01 68 2E 34 0F 06 00 00 1B 66 07 00 00 16 07 41 01 1C 18 1A 76 0F 16 07 
    //D9 00 77 01 90 42 34 0F 2A 16 19 01 90 42 34 0F 06 00 00 1B 66 07 00 00 16 07 F3 00 77 01 30 41 
    //18 11 2A 16 19 01 30 41 18 11 06 00 00 1B 66 07 00 00 16 07 0D 01 77 01 F0 51 18 11 2A 16 19 01 
    //F0 51 18 11 06 00 00 1B 66 07 00 00 16 07 27 01 77 01 68 52 18 11 2A 16 19 01 68 52 18 11 06 00 
    //00 1B 66 07 00 00 16 07 41 01 77 01 C0 43 32 0F 2A 16 19 01 C0 43 32 0F 06 00 00 1B 66 07 00 00 
    //16 19 01 88 95 84 0F 06 00 00 1B 7B 0C 00 00 16 19 01 E0 52 18 11 06 00 00 1B 7B 0C 00 00 16 19 
    //01 88 51 32 0F 06 00 00 1B 7B 0C 00 00 16 1C 40 3C 32 0F 16 04 0B 47 
  }


  function bool CanGrabLadder() {
    local byte WeaponFlag;
    WeaponFlag = GetEquippedWeaponFlag();                                       //0000 : 0F 00 80 54 18 11 1B 21 0D 00 00 16 
    if (WeaponFlag != 0 && WeaponFlag != 1) {                                   //000C : 07 56 00 82 9B 39 3A 00 80 54 18 11 39 3A 24 00 16 18 0E 00 9B 39 3A 00 80 54 18 11 39 3A 24 01 16 16 
      SendDesktopMessage("",Class'StringReferences'.default.Cannot_climb_while_armed.Text,Class'Game_Desktop'.7);//002E : 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 1F 19 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
      return False;                                                             //0054 : 04 28 
    }
    if (bJumpedFromLadder) {                                                    //0056 : 07 61 00 2D 01 98 D0 18 11 
      return False;                                                             //005F : 04 28 
    }
    return Super.CanGrabLadder();                                               //0061 : 04 1C 40 2B 76 0F 16 
    //0F 00 80 54 18 11 1B 21 0D 00 00 16 07 56 00 82 9B 39 3A 00 80 54 18 11 39 3A 24 00 16 18 0E 00 
    //9B 39 3A 00 80 54 18 11 39 3A 24 01 16 16 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 F8 1F 19 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 04 28 07 61 00 2D 01 98 D0 18 11 04 
    //28 04 1C 40 2B 76 0F 16 04 0B 47 
  }


  event bool DoJump() {
    if (CanJump()) {                                                            //0000 : 07 24 00 1B 87 04 00 00 16 
      bJumpedFromLadder = Physics == 11;                                        //0009 : 14 2D 01 98 D0 18 11 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 
      return Super.DoJump();                                                    //001D : 04 1C 40 3C 37 0F 16 
    }
    return False;                                                               //0024 : 04 28 
    //07 24 00 1B 87 04 00 00 16 14 2D 01 98 D0 18 11 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 04 1C 40 
    //3C 37 0F 16 04 28 04 0B 47 
  }


  event bool CanJump() {
    return (Physics == 1 || Physics == 11)
      && !CharacterStats.IsMovementLimited()
      && JumpZ > 0;//0000 : 04 82 82 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 12 00 81 19 01 08 43 34 0F 06 00 04 1C C0 22 19 11 16 16 16 18 0B 00 B1 01 20 E4 75 0F 39 3F 25 16 16 
    //04 82 82 84 9A 39 3A 01 C0 93 6C 0F 39 3A 24 01 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 0B 
    //16 16 18 12 00 81 19 01 08 43 34 0F 06 00 04 1C C0 22 19 11 16 16 16 18 0B 00 B1 01 20 E4 75 0F 
    //39 3F 25 16 16 04 0B 47 
  }


  event cl_OnFrame(float DeltaTime) {
    Skills.cl_OnFrame(DeltaTime);                                               //0000 : 19 01 08 28 18 11 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 
    Appearance.cl_OnFrame(DeltaTime);                                           //0014 : 19 01 A8 83 18 11 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 
    if (Emotes != None) {                                                       //0028 : 07 47 00 77 01 F0 51 18 11 2A 16 
      Emotes.cl_OnFrame(DeltaTime);                                             //0033 : 19 01 F0 51 18 11 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 
    }
    if (CombatStats != None) {                                                  //0047 : 07 66 00 77 01 30 41 18 11 2A 16 
      combatState.cl_OnFrame(DeltaTime);                                        //0052 : 19 01 B8 40 18 11 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 
    }
    if (Looting != None) {                                                      //0066 : 07 85 00 77 01 68 52 18 11 2A 16 
      Looting.cl_OnFrame(DeltaTime);                                            //0071 : 19 01 68 52 18 11 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 
    }
    Super.cl_OnFrame(DeltaTime);                                                //0085 : 1C 38 70 84 0F 00 20 24 19 11 16 
    if (mCurrentState != mNetState && mNetState != 0) {                         //0090 : 07 BD 00 82 9B 39 3A 01 E8 51 34 0F 39 3A 01 60 52 34 0F 16 18 0B 00 9B 39 3A 01 60 52 34 0F 25 16 16 
      SBGotoState(mNetState);                                                   //00B2 : 1B 11 06 00 00 01 60 52 34 0F 16 
    }
    if (MiniGameProxy != None) {                                                //00BD : 07 DC 00 77 01 30 5D 83 0F 2A 16 
      MiniGameProxy.cl_OnFrame(DeltaTime);                                      //00C8 : 19 01 30 5D 83 0F 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 
    }
    if (mPrevCombatReady != combatState.CombatReady()
      || mPrevInCombat != CombatStats.InCombat()) {//00DC : 07 4D 01 84 F3 2D 01 A0 26 19 11 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 18 18 00 F3 2D 01 18 27 19 11 19 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 16 16 
      mPrevCombatReady = combatState.CombatReady();                             //0112 : 14 2D 01 A0 26 19 11 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 
      mPrevInCombat = CombatStats.InCombat();                                   //0128 : 14 2D 01 18 27 19 11 19 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 
      CombatStateChanged.Trigger();                                             //013E : 19 01 E0 52 18 11 06 00 00 1C 00 96 84 0F 16 
    }
    mTeleported = False;                                                        //014D : 14 2D 01 90 27 19 11 28 
    //19 01 08 28 18 11 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 19 01 A8 83 18 11 0B 00 00 1B 3E 05 
    //00 00 00 20 24 19 11 16 07 47 00 77 01 F0 51 18 11 2A 16 19 01 F0 51 18 11 0B 00 00 1B 3E 05 00 
    //00 00 20 24 19 11 16 07 66 00 77 01 30 41 18 11 2A 16 19 01 B8 40 18 11 0B 00 00 1B 3E 05 00 00 
    //00 20 24 19 11 16 07 85 00 77 01 68 52 18 11 2A 16 19 01 68 52 18 11 0B 00 00 1B 3E 05 00 00 00 
    //20 24 19 11 16 1C 38 70 84 0F 00 20 24 19 11 16 07 BD 00 82 9B 39 3A 01 E8 51 34 0F 39 3A 01 60 
    //52 34 0F 16 18 0B 00 9B 39 3A 01 60 52 34 0F 25 16 16 1B 11 06 00 00 01 60 52 34 0F 16 07 DC 00 
    //77 01 30 5D 83 0F 2A 16 19 01 30 5D 83 0F 0B 00 00 1B 3E 05 00 00 00 20 24 19 11 16 07 4D 01 84 
    //F3 2D 01 A0 26 19 11 19 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 18 18 00 F3 2D 01 18 27 19 
    //11 19 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 16 16 14 2D 01 A0 26 19 11 19 01 B8 40 18 11 06 
    //00 04 1B 19 0C 00 00 16 14 2D 01 18 27 19 11 19 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 19 01 
    //E0 52 18 11 06 00 00 1C 00 96 84 0F 16 14 2D 01 90 27 19 11 28 04 0B 47 
  }


  event cl_OnUpdate() {
    Super.cl_OnUpdate();                                                        //0000 : 1C 60 28 6E 0F 16 
    if (!IsLocalPlayer()) {                                                     //0006 : 07 17 00 81 1C 18 1A 76 0F 16 16 
      UpdateMovementVariables();                                                //0011 : 1B 6C 0E 00 00 16 
    }
    //1C 60 28 6E 0F 16 07 17 00 81 1C 18 1A 76 0F 16 16 1B 6C 0E 00 00 16 04 0B 47 
  }


  event cl_OnInit() {
    local export editinline Game_PlayerAppearance gpa;
    Super.cl_OnInit();                                                          //0000 : 1C A0 3D 32 0F 16 
    if (Appearance != None) {                                                   //0006 : 07 20 00 77 01 A8 83 18 11 2A 16 
      Appearance.cl_OnInit();                                                   //0011 : 19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (CharacterStats != None) {                                               //0020 : 07 3A 00 77 01 08 43 34 0F 2A 16 
      CharacterStats.cl_OnInit();                                               //002B : 19 01 08 43 34 0F 06 00 00 1B 3F 05 00 00 16 
    }
    if (Character != None) {                                                    //003A : 07 54 00 77 01 68 2E 34 0F 2A 16 
      Character.cl_OnInit();                                                    //0045 : 19 01 68 2E 34 0F 06 00 00 1B 3F 05 00 00 16 
    }
    if (combatState != None) {                                                  //0054 : 07 6E 00 77 01 B8 40 18 11 2A 16 
      combatState.cl_OnInit();                                                  //005F : 19 01 B8 40 18 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (Skills != None) {                                                       //006E : 07 88 00 77 01 08 28 18 11 2A 16 
      Skills.cl_OnInit();                                                       //0079 : 19 01 08 28 18 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (Effects != None) {                                                      //0088 : 07 A2 00 77 01 48 63 34 0F 2A 16 
      Effects.cl_OnInit();                                                      //0093 : 19 01 48 63 34 0F 06 00 00 1B 3F 05 00 00 16 
    }
    if (MiniGameProxy != None) {                                                //00A2 : 07 BC 00 77 01 30 5D 83 0F 2A 16 
      MiniGameProxy.cl_OnInit();                                                //00AD : 19 01 30 5D 83 0F 06 00 00 1B 3F 05 00 00 16 
    }
    if (itemManager != None) {                                                  //00BC : 07 D6 00 77 01 B0 2D 19 11 2A 16 
      itemManager.cl_OnInit();                                                  //00C7 : 19 01 B0 2D 19 11 06 00 00 1B 3F 05 00 00 16 
    }
    if (IsLocalPlayer()) {                                                      //00D6 : 07 61 01 1C 18 1A 76 0F 16 
      if (BodySlots != None) {                                                  //00DF : 07 F9 00 77 01 90 42 34 0F 2A 16 
        BodySlots.cl_OnInit();                                                  //00EA : 19 01 90 42 34 0F 06 00 00 1B 3F 05 00 00 16 
      }
      if (CombatStats != None) {                                                //00F9 : 07 13 01 77 01 30 41 18 11 2A 16 
        CombatStats.cl_OnInit();                                                //0104 : 19 01 30 41 18 11 06 00 00 1B 3F 05 00 00 16 
      }
      if (Emotes != None) {                                                     //0113 : 07 2D 01 77 01 F0 51 18 11 2A 16 
        Emotes.cl_OnInit();                                                     //011E : 19 01 F0 51 18 11 06 00 00 1B 3F 05 00 00 16 
      }
      if (Looting != None) {                                                    //012D : 07 47 01 77 01 68 52 18 11 2A 16 
        Looting.cl_OnInit();                                                    //0138 : 19 01 68 52 18 11 06 00 00 1B 3F 05 00 00 16 
      }
      if (Trading != None) {                                                    //0147 : 07 61 01 77 01 C0 43 32 0F 2A 16 
        Trading.cl_OnInit();                                                    //0152 : 19 01 C0 43 32 0F 06 00 00 1B 3F 05 00 00 16 
      }
    }
    gpa = Game_PlayerAppearance(BaseAppearance);                                //0161 : 0F 00 B8 29 19 11 2E B0 BD 5F 01 01 B8 2E 19 11 
    if (gpa != None && IsLocalPlayer()) {                                       //0171 : 07 DD 01 82 77 00 B8 29 19 11 2A 16 18 07 00 1C 18 1A 76 0F 16 16 
      gpa.SetBaseAppearance(Game_PlayerController(Controller).DBCharacter.AppearancePart1,Game_PlayerController(Controller).DBCharacter.AppearancePart2);//0187 : 19 00 B8 29 19 11 3E 00 00 1B 14 06 00 00 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 30 2F 19 11 05 00 04 01 48 49 36 0F 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 30 2F 19 11 05 00 04 01 A8 2F 19 11 16 
      gpa.RepackLodDataAll();                                                   //01CE : 19 00 B8 29 19 11 06 00 00 1C 20 30 19 11 16 
    }
    if (Appearance != None) {                                                   //01DD : 07 F7 01 77 01 A8 83 18 11 2A 16 
      Appearance.DressUp();                                                     //01E8 : 19 01 A8 83 18 11 06 00 00 1C D0 30 19 11 16 
    }
    if (GetGameHUDClass() != None) {                                            //01F7 : 07 22 02 77 1B F0 0C 00 00 16 2A 16 
      HUD = new (self) GetGameHUDClass();                                       //0203 : 0F 01 40 B1 18 11 11 17 0B 0B 1B F0 0C 00 00 16 
      HUD.cl_OnInit();                                                          //0213 : 19 01 40 B1 18 11 06 00 00 1C 80 31 19 11 16 
    }
    ShiftStateChanged = new Class'EventNotification';                           //0222 : 0F 01 88 95 84 0F 11 0B 0B 0B 20 70 52 5B 01 
    CombatStateChanged = new Class'EventNotification';                          //0231 : 0F 01 E0 52 18 11 11 0B 0B 0B 20 70 52 5B 01 
    PetSummoned = new Class'EventNotification';                                 //0240 : 0F 01 88 51 32 0F 11 0B 0B 0B 20 70 52 5B 01 
    if (mSBSettings.ShowPawnShadowsOnEnvironment) {                             //024F : 07 67 02 19 01 28 4C 6E 0F 06 00 04 2D 01 E0 19 6F 0F 
      CreateShadow();                                                           //0261 : 1B EE 0C 00 00 16 
    }
    //1C A0 3D 32 0F 16 07 20 00 77 01 A8 83 18 11 2A 16 19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 
    //07 3A 00 77 01 08 43 34 0F 2A 16 19 01 08 43 34 0F 06 00 00 1B 3F 05 00 00 16 07 54 00 77 01 68 
    //2E 34 0F 2A 16 19 01 68 2E 34 0F 06 00 00 1B 3F 05 00 00 16 07 6E 00 77 01 B8 40 18 11 2A 16 19 
    //01 B8 40 18 11 06 00 00 1B 3F 05 00 00 16 07 88 00 77 01 08 28 18 11 2A 16 19 01 08 28 18 11 06 
    //00 00 1B 3F 05 00 00 16 07 A2 00 77 01 48 63 34 0F 2A 16 19 01 48 63 34 0F 06 00 00 1B 3F 05 00 
    //00 16 07 BC 00 77 01 30 5D 83 0F 2A 16 19 01 30 5D 83 0F 06 00 00 1B 3F 05 00 00 16 07 D6 00 77 
    //01 B0 2D 19 11 2A 16 19 01 B0 2D 19 11 06 00 00 1B 3F 05 00 00 16 07 61 01 1C 18 1A 76 0F 16 07 
    //F9 00 77 01 90 42 34 0F 2A 16 19 01 90 42 34 0F 06 00 00 1B 3F 05 00 00 16 07 13 01 77 01 30 41 
    //18 11 2A 16 19 01 30 41 18 11 06 00 00 1B 3F 05 00 00 16 07 2D 01 77 01 F0 51 18 11 2A 16 19 01 
    //F0 51 18 11 06 00 00 1B 3F 05 00 00 16 07 47 01 77 01 68 52 18 11 2A 16 19 01 68 52 18 11 06 00 
    //00 1B 3F 05 00 00 16 07 61 01 77 01 C0 43 32 0F 2A 16 19 01 C0 43 32 0F 06 00 00 1B 3F 05 00 00 
    //16 0F 00 B8 29 19 11 2E B0 BD 5F 01 01 B8 2E 19 11 07 DD 01 82 77 00 B8 29 19 11 2A 16 18 07 00 
    //1C 18 1A 76 0F 16 16 19 00 B8 29 19 11 3E 00 00 1B 14 06 00 00 19 19 2E 90 18 5B 01 01 00 6E 6C 
    //0F 05 00 04 01 30 2F 19 11 05 00 04 01 48 49 36 0F 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 
    //01 30 2F 19 11 05 00 04 01 A8 2F 19 11 16 19 00 B8 29 19 11 06 00 00 1C 20 30 19 11 16 07 F7 01 
    //77 01 A8 83 18 11 2A 16 19 01 A8 83 18 11 06 00 00 1C D0 30 19 11 16 07 22 02 77 1B F0 0C 00 00 
    //16 2A 16 0F 01 40 B1 18 11 11 17 0B 0B 1B F0 0C 00 00 16 19 01 40 B1 18 11 06 00 00 1C 80 31 19 
    //11 16 0F 01 88 95 84 0F 11 0B 0B 0B 20 70 52 5B 01 0F 01 E0 52 18 11 11 0B 0B 0B 20 70 52 5B 01 
    //0F 01 88 51 32 0F 11 0B 0B 0B 20 70 52 5B 01 07 67 02 19 01 28 4C 6E 0F 06 00 04 2D 01 E0 19 6F 
    //0F 1B EE 0C 00 00 16 04 0B 47 
  }


  protected native function sv2cl_RequestIdentification_CallStub();


  event sv2cl_RequestIdentification(int worldID,int universeID,int CharacterID,int AccountID) {
    mCharacterIdentityForBugReport.TransferAccountID = AccountID;               //0000 : 0F 36 18 35 19 11 01 90 35 19 11 00 08 36 19 11 
    mCharacterIdentityForBugReport.TransferCharacterID = CharacterID;           //0010 : 0F 36 80 36 19 11 01 90 35 19 11 00 F8 36 19 11 
    mCharacterIdentityForBugReport.TransferUniverseID = universeID;             //0020 : 0F 36 70 37 19 11 01 90 35 19 11 00 E8 37 19 11 
    mCharacterIdentityForBugReport.TransferWorldID = worldID;                   //0030 : 0F 36 60 38 19 11 01 90 35 19 11 00 90 33 19 11 
    //0F 36 18 35 19 11 01 90 35 19 11 00 08 36 19 11 0F 36 80 36 19 11 01 90 35 19 11 00 F8 36 19 11 
    //0F 36 70 37 19 11 01 90 35 19 11 00 E8 37 19 11 0F 36 60 38 19 11 01 90 35 19 11 00 90 33 19 11 
    //04 0B 47 
  }


  function cl_RequestIdentification() {
    cl2sv_RequestIdentification_CallStub();                                     //0000 : 1B 81 0E 00 00 16 
    //1B 81 0E 00 00 16 04 0B 47 
  }


  protected native function cl2sv_RequestIdentification_CallStub();


  event cl2sv_RequestIdentification() {
    sv2cl_RequestIdentification_CallStub(Base_Controller(Controller).AccountID,Base_Controller(Controller).CharacterID,GetUniverseID(),GetWorldID());//0000 : 1B 7F 0E 00 00 19 2E 78 3D 24 01 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 19 2E 78 3D 24 01 01 00 6E 6C 0F 05 00 04 01 68 3B 19 11 1B 68 07 00 00 16 1B 69 07 00 00 16 16 
    //1B 7F 0E 00 00 19 2E 78 3D 24 01 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 19 2E 78 3D 24 01 01 00 
    //6E 6C 0F 05 00 04 01 68 3B 19 11 1B 68 07 00 00 16 1B 69 07 00 00 16 16 04 0B 47 
  }


  event cl_OnBaseline() {
    Super.cl_OnBaseline();                                                      //0000 : 1C F8 6D 84 0F 16 
    if (Effects != None) {                                                      //0006 : 07 20 00 77 01 48 63 34 0F 2A 16 
      Effects.cl_OnBaseline();                                                  //0011 : 19 01 48 63 34 0F 06 00 00 1B 63 07 00 00 16 
    }
    if (mNetState != 0) {                                                       //0020 : 07 38 00 9B 39 3A 01 60 52 34 0F 25 16 
      SBGotoState(mNetState);                                                   //002D : 1B 11 06 00 00 01 60 52 34 0F 16 
    }
    if (Physics == 21) {                                                        //0038 : 07 50 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 15 16 
      bHidden = True;                                                           //0048 : 14 2D 01 48 5E 6E 0F 27 
    }
    if (mInvisible) {                                                           //0050 : 07 64 00 2D 01 18 48 32 0F 
      cl_PlayPawnEffect(6);                                                     //0059 : 1B 16 0C 00 00 24 06 16 
    } else {                                                                    //0061 : 06 6C 00 
      cl_PlayPawnEffect(3);                                                     //0064 : 1B 16 0C 00 00 24 03 16 
    }
    //1C F8 6D 84 0F 16 07 20 00 77 01 48 63 34 0F 2A 16 19 01 48 63 34 0F 06 00 00 1B 63 07 00 00 16 
    //07 38 00 9B 39 3A 01 60 52 34 0F 25 16 1B 11 06 00 00 01 60 52 34 0F 16 07 50 00 9A 39 3A 01 C0 
    //93 6C 0F 39 3A 24 15 16 14 2D 01 48 5E 6E 0F 27 07 64 00 2D 01 18 48 32 0F 1B 16 0C 00 00 24 06 
    //16 06 6C 00 1B 16 0C 00 00 24 03 16 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C 28 26 6E 0F 16 
    if (ShiftableAppearanceClass != None) {                                     //0006 : 07 20 00 77 01 68 3F 19 11 2A 16 
      Appearance = new (self) ShiftableAppearanceClass;                         //0011 : 0F 01 A8 83 18 11 11 17 0B 0B 01 68 3F 19 11 
    }
    if (BaseAppearanceClass != None) {                                          //0020 : 07 3A 00 77 01 E8 3F 19 11 2A 16 
      BaseAppearance = new (self) BaseAppearanceClass;                          //002B : 0F 01 B8 2E 19 11 11 17 0B 0B 01 E8 3F 19 11 
    }
    if (CharacterClass != None) {                                               //003A : 07 54 00 77 01 68 40 19 11 2A 16 
      Character = new (self) CharacterClass;                                    //0045 : 0F 01 68 2E 34 0F 11 17 0B 0B 01 68 40 19 11 
    }
    if (CharacterStatsClass != None) {                                          //0054 : 07 6E 00 77 01 E8 40 19 11 2A 16 
      CharacterStats = new (self) CharacterStatsClass;                          //005F : 0F 01 08 43 34 0F 11 17 0B 0B 01 E8 40 19 11 
    }
    if (CombatStateClass != None) {                                             //006E : 07 88 00 77 01 68 41 19 11 2A 16 
      combatState = new (self) CombatStateClass;                                //0079 : 0F 01 B8 40 18 11 11 17 0B 0B 01 68 41 19 11 
    }
    if (CombatStatsClass != None) {                                             //0088 : 07 A2 00 77 01 E8 41 19 11 2A 16 
      CombatStats = new (self) CombatStatsClass;                                //0093 : 0F 01 30 41 18 11 11 17 0B 0B 01 E8 41 19 11 
    }
    if (EffectsClass != None) {                                                 //00A2 : 07 BC 00 77 01 68 42 19 11 2A 16 
      Effects = new (self) EffectsClass;                                        //00AD : 0F 01 48 63 34 0F 11 17 0B 0B 01 68 42 19 11 
    }
    if (EmotesClass != None) {                                                  //00BC : 07 D6 00 77 01 E8 42 19 11 2A 16 
      Emotes = new (self) EmotesClass;                                          //00C7 : 0F 01 F0 51 18 11 11 17 0B 0B 01 E8 42 19 11 
    }
    if (LootingClass != None) {                                                 //00D6 : 07 F0 00 77 01 68 43 19 11 2A 16 
      Looting = new (self) LootingClass;                                        //00E1 : 0F 01 68 52 18 11 11 17 0B 0B 01 68 43 19 11 
    }
    if (SkillsClass != None) {                                                  //00F0 : 07 0A 01 77 01 E8 43 19 11 2A 16 
      Skills = new (self) SkillsClass;                                          //00FB : 0F 01 08 28 18 11 11 17 0B 0B 01 E8 43 19 11 
    }
    if (TradingClass != None) {                                                 //010A : 07 24 01 77 01 68 44 19 11 2A 16 
      Trading = new (self) TradingClass;                                        //0115 : 0F 01 C0 43 32 0F 11 17 0B 0B 01 68 44 19 11 
    }
    if (ItemManagerClass != None) {                                             //0124 : 07 3E 01 77 01 E8 44 19 11 2A 16 
      itemManager = new (self) ItemManagerClass;                                //012F : 0F 01 B0 2D 19 11 11 17 0B 0B 01 E8 44 19 11 
    }
    if (BodySlotsClass != None) {                                               //013E : 07 58 01 77 01 68 45 19 11 2A 16 
      BodySlots = new (self) BodySlotsClass;                                    //0149 : 0F 01 90 42 34 0F 11 17 0B 0B 01 68 45 19 11 
    }
    if (Appearance != None) {                                                   //0158 : 07 72 01 77 01 A8 83 18 11 2A 16 
      Appearance.OnConstruct();                                                 //0163 : 19 01 A8 83 18 11 06 00 00 1B BC 05 00 00 16 
    }
    //1C 28 26 6E 0F 16 07 20 00 77 01 68 3F 19 11 2A 16 0F 01 A8 83 18 11 11 17 0B 0B 01 68 3F 19 11 
    //07 3A 00 77 01 E8 3F 19 11 2A 16 0F 01 B8 2E 19 11 11 17 0B 0B 01 E8 3F 19 11 07 54 00 77 01 68 
    //40 19 11 2A 16 0F 01 68 2E 34 0F 11 17 0B 0B 01 68 40 19 11 07 6E 00 77 01 E8 40 19 11 2A 16 0F 
    //01 08 43 34 0F 11 17 0B 0B 01 E8 40 19 11 07 88 00 77 01 68 41 19 11 2A 16 0F 01 B8 40 18 11 11 
    //17 0B 0B 01 68 41 19 11 07 A2 00 77 01 E8 41 19 11 2A 16 0F 01 30 41 18 11 11 17 0B 0B 01 E8 41 
    //19 11 07 BC 00 77 01 68 42 19 11 2A 16 0F 01 48 63 34 0F 11 17 0B 0B 01 68 42 19 11 07 D6 00 77 
    //01 E8 42 19 11 2A 16 0F 01 F0 51 18 11 11 17 0B 0B 01 E8 42 19 11 07 F0 00 77 01 68 43 19 11 2A 
    //16 0F 01 68 52 18 11 11 17 0B 0B 01 68 43 19 11 07 0A 01 77 01 E8 43 19 11 2A 16 0F 01 08 28 18 
    //11 11 17 0B 0B 01 E8 43 19 11 07 24 01 77 01 68 44 19 11 2A 16 0F 01 C0 43 32 0F 11 17 0B 0B 01 
    //68 44 19 11 07 3E 01 77 01 E8 44 19 11 2A 16 0F 01 B0 2D 19 11 11 17 0B 0B 01 E8 44 19 11 07 58 
    //01 77 01 68 45 19 11 2A 16 0F 01 90 42 34 0F 11 17 0B 0B 01 68 45 19 11 07 72 01 77 01 A8 83 18 
    //11 2A 16 19 01 A8 83 18 11 06 00 00 1B BC 05 00 00 16 04 0B 47 
  }


  protected native function class<Game_HUD> GetGameHUDClass();


  event OnSettingsChanged() {
    if (bActorShadows && IsClient() && !IsServer()) {                           //0000 : 07 5E 00 82 82 2D 01 E8 57 6E 0F 18 07 00 1B 1C 0C 00 00 16 16 18 09 00 81 1B FF 0B 00 00 16 16 16 
      if (mSBSettings.ShowPawnShadowsOnEnvironment != mPawnShadow != None) {    //0021 : 07 5E 00 F3 19 01 28 4C 6E 0F 06 00 04 2D 01 E0 19 6F 0F 77 01 18 E9 18 11 2A 16 16 
        if (mSBSettings.ShowPawnShadowsOnEnvironment) {                         //003D : 07 58 00 19 01 28 4C 6E 0F 06 00 04 2D 01 E0 19 6F 0F 
          CreateShadow();                                                       //004F : 1B EE 0C 00 00 16 
        } else {                                                                //0055 : 06 5E 00 
          DestroyShadow();                                                      //0058 : 1B 7E 0D 00 00 16 
        }
      }
    }
    //07 5E 00 82 82 2D 01 E8 57 6E 0F 18 07 00 1B 1C 0C 00 00 16 16 18 09 00 81 1B FF 0B 00 00 16 16 
    //16 07 5E 00 F3 19 01 28 4C 6E 0F 06 00 04 2D 01 E0 19 6F 0F 77 01 18 E9 18 11 2A 16 16 07 58 00 
    //19 01 28 4C 6E 0F 06 00 04 2D 01 E0 19 6F 0F 1B EE 0C 00 00 16 06 5E 00 1B 7E 0D 00 00 16 04 0B 
    //47 
  }


  state Dead {

      function BeginState() {
        local Game_Pawn Killer;
        SetCollision(False,False);                                              //0000 : 61 06 28 28 16 
        Skills.FireCondition(None,6);                                           //0005 : 19 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 06 16 
        if (SBRole == 1) {                                                      //0017 : 07 D1 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
          Game_Controller(Controller).sv_FireHook(Class'Content_Type'.8,None,0);//0027 : 19 2E 10 0E 5B 01 01 00 6E 6C 0F 13 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 08 2A 25 16 
          if (CombatStats != None) {                                            //0048 : 07 6B 00 77 01 30 41 18 11 2A 16 
            Killer = CombatStats.sv_GetKiller();                                //0053 : 0F 00 70 89 18 11 19 01 30 41 18 11 06 00 04 1C 98 8A 18 11 16 
          } else {                                                              //0068 : 06 72 00 
            Killer = None;                                                      //006B : 0F 00 70 89 18 11 2A 
          }
          sv2rel_CombatMessageDeath_CallStub(Killer,self);                      //0072 : 1B 4D 0E 00 00 00 70 89 18 11 17 16 
          if (IsPlayerPawn()) {                                                 //007E : 07 C0 00 1B B9 0C 00 00 16 
            sv2cl_CombatMessageDeath_CallStub(Killer);                          //0087 : 1B 4E 0E 00 00 00 70 89 18 11 16 
            if (MiniGameProxy != None) {                                        //0092 : 07 AC 00 77 01 30 5D 83 0F 2A 16 
              MiniGameProxy.sv_PlayerDied();                                    //009D : 19 01 30 5D 83 0F 06 00 00 1B 6E 04 00 00 16 
            }
            Game_PlayerStats(CharacterStats).DecreasePePRank();                 //00AC : 19 2E 10 A3 5F 01 01 08 43 34 0F 06 00 00 1B 3B 0E 00 00 16 
          }
          Skills.sv_RemoveDuffs(None,False);                                    //00C0 : 19 01 08 28 18 11 08 00 00 1B 4B 0F 00 00 2A 28 16 
        }
        combatState.RemovePreparedBonusConditional();                           //00D1 : 19 01 B8 40 18 11 06 00 00 1B 87 0D 00 00 16 
        PlayDeathAnim(Acceleration);                                            //00E0 : 1B 37 13 00 00 01 18 96 6C 0F 16 
        Skills.ResetAttacking();                                                //00EB : 19 01 08 28 18 11 06 00 00 1C 38 51 34 0F 16 
        Game_Controller(Controller).SBGotoState(2);                             //00FA : 19 2E 10 0E 5B 01 01 00 6E 6C 0F 08 00 00 1B 11 06 00 00 24 02 16 
        mCurrentState = 2;                                                      //0110 : 0F 01 E8 51 34 0F 24 02 
        mNetState = 2;                                                          //0118 : 0F 01 60 52 34 0F 24 02 
        if (SBRole == 1 && sv_CanReplicate()) {                                 //0120 : 07 46 01 82 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 07 00 1B CB 0D 00 00 16 16 
          sv2clrel_UpdateNetState_CallStub(mNetState);                          //013B : 1B 7B 0D 00 00 01 60 52 34 0F 16 
        }
        SetPhysics(0);                                                          //0146 : 6F 82 24 00 16 
        StopMoving();                                                           //014B : 1B 2D 06 00 00 16 
        StaticPlaySound(19,1024.00000000);                                      //0151 : 1B 29 06 00 00 24 13 1E 00 00 80 44 16 
        if (SBRole == 1) {                                                      //015E : 07 75 01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
          sv_DestroyPet(True);                                                  //016E : 1C 78 3D 34 0F 27 16 
        }
        //61 06 28 28 16 19 01 08 28 18 11 09 00 00 1C E8 89 18 11 2A 24 06 16 07 D1 00 9A 39 3A 01 40 B2 
        //6C 0F 39 3A 24 01 16 19 2E 10 0E 5B 01 01 00 6E 6C 0F 13 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 
        //02 00 01 24 08 2A 25 16 07 6B 00 77 01 30 41 18 11 2A 16 0F 00 70 89 18 11 19 01 30 41 18 11 06 
        //00 04 1C 98 8A 18 11 16 06 72 00 0F 00 70 89 18 11 2A 1B 4D 0E 00 00 00 70 89 18 11 17 16 07 C0 
        //00 1B B9 0C 00 00 16 1B 4E 0E 00 00 00 70 89 18 11 16 07 AC 00 77 01 30 5D 83 0F 2A 16 19 01 30 
        //5D 83 0F 06 00 00 1B 6E 04 00 00 16 19 2E 10 A3 5F 01 01 08 43 34 0F 06 00 00 1B 3B 0E 00 00 16 
        //19 01 08 28 18 11 08 00 00 1B 4B 0F 00 00 2A 28 16 19 01 B8 40 18 11 06 00 00 1B 87 0D 00 00 16 
        //1B 37 13 00 00 01 18 96 6C 0F 16 19 01 08 28 18 11 06 00 00 1C 38 51 34 0F 16 19 2E 10 0E 5B 01 
        //01 00 6E 6C 0F 08 00 00 1B 11 06 00 00 24 02 16 0F 01 E8 51 34 0F 24 02 0F 01 60 52 34 0F 24 02 
        //07 46 01 82 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 07 00 1B CB 0D 00 00 16 16 1B 7B 0D 00 00 
        //01 60 52 34 0F 16 6F 82 24 00 16 1B 2D 06 00 00 16 1B 29 06 00 00 24 13 1E 00 00 80 44 16 07 75 
        //01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 1C 78 3D 34 0F 27 16 04 0B 47 
      }


    //08 47 

  }


  auto state Alive {

      function BeginState() {
        SetCollision(True,False);                                               //0000 : 61 06 27 28 16 
        if (Controller != None) {                                               //0005 : 07 26 00 77 01 00 6E 6C 0F 2A 16 
          Game_Controller(Controller).SBGotoState(1);                           //0010 : 19 2E 10 0E 5B 01 01 00 6E 6C 0F 08 00 00 1B 11 06 00 00 24 01 16 
        }
        mCurrentState = 1;                                                      //0026 : 0F 01 E8 51 34 0F 24 01 
        mNetState = 1;                                                          //002E : 0F 01 60 52 34 0F 24 01 
        if (SBRole == 1 && sv_CanReplicate()) {                                 //0036 : 07 5C 00 82 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 07 00 1B CB 0D 00 00 16 16 
          sv2clrel_UpdateNetState_CallStub(mNetState);                          //0051 : 1B 7B 0D 00 00 01 60 52 34 0F 16 
        }
        if (CombatStats != None) {                                              //005C : 07 79 00 77 01 30 41 18 11 2A 16 
          CombatStats.sv_ExitCombat();                                          //0067 : 19 01 30 41 18 11 06 00 00 1B 70 0F 00 00 16 
          goto jl0079;                                                          //0076 : 06 79 00 
        }
        ClearPawnAnims();                                                       //0079 : 1B A3 0C 00 00 16 
        Acceleration = vect(0.000000, 0.000000, 0.000000);                      //007F : 0F 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
        Velocity = vect(0.000000, 0.000000, 0.000000);                          //0092 : 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
        SetPhysics(default.Physics);                                            //00A5 : 6F 82 02 C0 93 6C 0F 16 
        BaseEyeHeight = default.BaseEyeHeight;                                  //00AD : 0F 01 10 BA 75 0F 02 10 BA 75 0F 
        //61 06 27 28 16 07 26 00 77 01 00 6E 6C 0F 2A 16 19 2E 10 0E 5B 01 01 00 6E 6C 0F 08 00 00 1B 11 
        //06 00 00 24 01 16 0F 01 E8 51 34 0F 24 01 0F 01 60 52 34 0F 24 01 07 5C 00 82 9A 39 3A 01 40 B2 
        //6C 0F 39 3A 24 01 16 18 07 00 1B CB 0D 00 00 16 16 1B 7B 0D 00 00 01 60 52 34 0F 16 07 79 00 77 
        //01 30 41 18 11 2A 16 19 01 30 41 18 11 06 00 00 1B 70 0F 00 00 16 06 79 00 1B A3 0C 00 00 16 0F 
        //01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 
        //00 00 00 00 00 6F 82 02 C0 93 6C 0F 16 0F 01 10 BA 75 0F 02 10 BA 75 0F 04 0B 47 
      }


    //08 47 

  }



