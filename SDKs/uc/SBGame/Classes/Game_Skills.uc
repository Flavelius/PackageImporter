//==============================================================================
//  Game_Skills
//==============================================================================

class Game_Skills extends Base_Component within Game_Pawn
    native
    dependsOn(SBDBSync,FSkill_Event_Duff,FSkill_Event,Game_Pawn,Game_CharacterStats,LevelInfo,FSkill_Enums,FSkill_Type,Item_Type,IC_TokenItem,Game_ShiftableAppearance,Game_EquippedAppearance,Game_Effects,Game_Controller)
  ;

  const MAX_TOKEN_SLOTS =  3;
  const MAX_STACK_COUNT =  10;
  const MAX_AIMING_DESYNC =  1.0;
  const COMBO_FINISHING_MOVE_MINIMUM = 	2;
  const COMBO_TIMEFRAME = 	10.0;
  const COMBO_VERSUS_TIMEFRAME = 	5.0;
  const COMBO_MAX_STRING_LENGTH = 	9;
  enum ESkillStartFailure {
    SSF_ALLOWED ,
    SSF_INVALID_SKILL ,
    SSF_FINISHERS_NOT_ALLOWED ,
    SSF_OPENERS_NOT_ALLOWED ,
    SSF_COOLING_DOWN ,
    SSF_DEBUFF_DISABLED ,
    SSF_INVALID_PAWN ,
    SSF_STILL_EXECUTING_SKILL ,
    SSF_FROZEN ,
    SSF_DEAD ,
    SSF_OUTOFRANGE 
  };

  struct ReturnReflectData {
      var int Id;
      var export editinline FSkill_EffectClass_DuffReturnReflect effect;
      var float EarliestEffectTime;
      var int NumUses;
      var export editinline FSkill_Event Event;

  };


  struct ShareApplicantData {
      var Game_Pawn Target;
      var export editinline FSkill_EffectClass_DuffShare effect;

  };


  struct ShareData {
      var int Id;
      var export editinline FSkill_EffectClass_DuffShare effect;
      var Game_Pawn Target;
      var float EarliestEffectTime;
      var int NumUses;
      var export editinline FSkill_Event Event;

  };


  struct AlterEffectData {
      var int Id;
      var export editinline FSkill_EffectClass_DuffAlterEffectInOutput effect;
      var float Value;
      var float EarliestEffectTime;
      var int NumUses;

  };


  struct DisableSkillUseData {
      var int Id;
      var export editinline FSkill_EffectClass_DuffDisableSkillUse effect;

  };


  struct ImmuneData {
      var int Id;
      var export editinline FSkill_EffectClass_DuffImmunity effect;

  };


  struct ClientDuffStackData {
      var export editinline FSkill_Event_Duff OriginalDuff;
      var int ActualStackCount;
      var float ApplyTime;
      var float Duration;

  };


  struct TransferDuffStackData {
      var int OriginalDuffID;
      var int ActualStackCount;
      var float ApplyTime;
      var float Duration;

  };


  struct DuffStackData {
      var float ApplyTime;
      var export editinline FSkill_Event_Duff OriginalDuff;
      var export editinline FSkill_Event_Duff Duffs[10];
      var int ActualStackCount;

  };


  struct SpecialDuffEffect {
      var export editinline FSkill_EffectClass_Duff Duff;
      var float UndoTime;
      var array<DuffRestoreData> UndoData;
      var int Identifier;

  };


  struct ComboStringData {
      var export editinline FSkill_Type Skill;
      var float ApplyTime;

  };


  struct RunningSkillData {
      var float StartTime;
      var float Duration;
      var float EndTime;
      var float SkillSpeed;
      var export editinline FSkill_Type Skill;
      var bool LockedMovement;
      var bool LockedRotation;
      var bool ComboRelevant;
      var Game_Pawn SpecificTarget;

  };


  var int mTiers;
  var int mTierSlots;
  var float mTierTimeout;
  var float mTierTimeoutStartTime;
  var int mCurrentTier;
  var int mLastSkillIndex;
  var array<FSkill_Type> CharacterSkills;
  var array<FSkill_Type> SkilldeckSkills;
  var private string DebugSkillIndentStr;
  var private bool DebugSkillEnabled;
  var RunningSkillData LastSkill;
  var private int NextNotifyIndex;
  var private array<RunningSkillData> ActiveSkills;
  var private array<FSkill_Event> RunningEvents;
  var private int TargetFlags;
  var private Vector TargetLocation;
  var private int SessionID;
  var private AimingInfo TargetAimingInfo;
  var private ComboStringData mComboString[9];
  var private int mComboStringLength;
  var private ComboStringData mPreviousLastComboEntry;
  var private array<Game_Pawn> mComboTargets;
  var private array<SpecialDuffEffect> SpecialDuffEffects;
  var export editinline FSkill_Event_Duff SpecialDuffEffectsEvent;
  var private array<FSkill_Event_Duff> SpecialDuffEvents;
  var private DuffStackData AppliedStackDuffs[90];
  var private array<DuffStackData> AppliedNoStackDuffs;
  var private Object SkillEffectsPackage;
  var private bool DirtyDuffData;
  var array<int> TeamDuffList;
  var array<ClientDuffStackData> ClientDuffList;
  var float mLastDuffUpdateTime;
  var private array<ImmuneData> ImmuneEffects;
  var private array<DisableSkillUseData> DisableSkillUseEffects;
  var private array<AlterEffectData> AlterEffectEffects;
  var private array<ShareData> ShareEffects;
  var private array<ReturnReflectData> ReturnReflectEffects;
  var private array<Game_Pawn> Bloodlinks;
  var private bool DirtyShareApplicantData;
  var private array<ShareApplicantData> ShareApplicantEffects;
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var private int mSkillSessionTable;
  var private int mSkillTokenMap;
  var private bool mHasTokenMapBeenModified;


  native function int GetSkilldeckColumnCount();


  native function int GetSkilldeckRowCount();


  final native function int GetBodySlotCount();


  final native function int GetCurrentSkillTier();


  final native function int GetMaxSkillCount();


  final function int GetActiveSkillCount() {
    return ActiveSkills.Length;                                                 //0000 : 04 37 01 E0 1B 23 11 
    //04 37 01 E0 1B 23 11 04 0B 47 
  }


  private final native function UpdateTokenSlots(export editinline FSkill_Type aSkill,int aExtraSlots);


  final native function Game_Item GetTokenForSkill(export editinline FSkill_Type aSkill,int aSlot);


  final native function int GetTokenCountForSkill(export editinline FSkill_Type aSkill);


  final native function GetTokensForSkill(export editinline FSkill_Type aSkill,out array<Game_Item> outTokens);


  final native function int GetTokenSlots(export editinline FSkill_Type aSkill);


  final native function int GetMaxTotalSkillTokenCount();


  final native function int GetTotalSkillTokenCount();


  protected native function sv2cl_OnSkillReceivedTokenSlot_CallStub();


  protected final event sv2cl_OnSkillReceivedTokenSlot(int aSkillID,int aNewSlotCount) {
    local export editinline FSkill_Type Skill;
    Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillID));           //0000 : 0F 00 A0 2B 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 90 2A 23 11 16 
    if (Skill != None) {                                                        //001F : 07 4D 00 77 00 A0 2B 23 11 2A 16 
      UpdateTokenSlots(Skill,1);                                                //002A : 1C 80 1A 23 11 00 A0 2B 23 11 26 16 
      OnSkillReceivedTokenSlot(Skill,aNewSlotCount);                            //0036 : 43 18 2C 23 11 F8 05 00 00 00 A0 2B 23 11 00 90 2C 23 11 16 
      goto jl004D;                                                              //004A : 06 4D 00 
    }
    //0F 00 A0 2B 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 90 2A 23 11 16 07 
    //4D 00 77 00 A0 2B 23 11 2A 16 1C 80 1A 23 11 00 A0 2B 23 11 26 16 43 18 2C 23 11 F8 05 00 00 00 
    //A0 2B 23 11 00 90 2C 23 11 16 06 4D 00 04 0B 47 
  }


  final native function bool sv_AddTokenSlot(export editinline FSkill_Type aSkill);


  protected native function cl2sv_AddTokenSlot_CallStub();


  final event cl2sv_AddTokenSlot(int aSkillID) {
    local export editinline FSkill_Type skillResource;
    skillResource = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillID));   //0000 : 0F 00 30 31 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 40 30 23 11 16 
    if (skillResource != None) {                                                //001F : 07 35 00 77 00 30 31 23 11 2A 16 
      sv_AddTokenSlot(skillResource);                                           //002A : 1C E0 29 23 11 00 30 31 23 11 16 
    }
    //0F 00 30 31 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 40 30 23 11 16 07 
    //35 00 77 00 30 31 23 11 2A 16 1C E0 29 23 11 00 30 31 23 11 16 04 0B 47 
  }


  final native function float sv_GetTokenEffect(export editinline FSkill_Type aSkill,byte aEffect,float aInputValue);


  final native function sv_IncreaseTokenEffect(export editinline FSkill_Type aSkill,byte aEffect,byte aMode,float aValue);


  final function sv_RemoveSpecialDuffEvent(export editinline FSkill_Event_Duff aDuff) {
    local int i;
    local int C;
    if (aDuff != None) {                                                        //0000 : 07 9F 00 77 00 A0 38 23 11 2A 16 
      i = 0;                                                                    //000B : 0F 00 20 3A 23 11 25 
      while (i < SpecialDuffEvents.Length) {                                    //0012 : 07 9F 00 96 00 20 3A 23 11 37 01 98 3A 23 11 16 
        if (SpecialDuffEvents[i].OriginalEvent == aDuff) {                      //0022 : 07 95 00 72 19 10 00 20 3A 23 11 01 98 3A 23 11 05 00 04 01 10 3B 23 11 00 A0 38 23 11 16 
          SpecialDuffEvents[i].OriginalEvent.AbortEvent();                      //0040 : 19 19 10 00 20 3A 23 11 01 98 3A 23 11 05 00 04 01 10 3B 23 11 06 00 00 1C 88 3B 23 11 16 
          C = SpecialDuffEvents.Length;                                         //005E : 0F 00 38 3C 23 11 37 01 98 3A 23 11 
          SpecialDuffEvents[i] = SpecialDuffEvents[C - 1];                      //006A : 0F 10 00 20 3A 23 11 01 98 3A 23 11 10 93 00 38 3C 23 11 26 16 01 98 3A 23 11 
          SpecialDuffEvents.Length = C - 1;                                     //0084 : 0F 37 01 98 3A 23 11 93 00 38 3C 23 11 26 16 
          return;                                                               //0093 : 04 0B 
        }
        ++i;                                                                    //0095 : A3 00 20 3A 23 11 16 
      }
    }
    //07 9F 00 77 00 A0 38 23 11 2A 16 0F 00 20 3A 23 11 25 07 9F 00 96 00 20 3A 23 11 37 01 98 3A 23 
    //11 16 07 95 00 72 19 10 00 20 3A 23 11 01 98 3A 23 11 05 00 04 01 10 3B 23 11 00 A0 38 23 11 16 
    //19 19 10 00 20 3A 23 11 01 98 3A 23 11 05 00 04 01 10 3B 23 11 06 00 00 1C 88 3B 23 11 16 0F 00 
    //38 3C 23 11 37 01 98 3A 23 11 0F 10 00 20 3A 23 11 01 98 3A 23 11 10 93 00 38 3C 23 11 26 16 01 
    //98 3A 23 11 0F 37 01 98 3A 23 11 93 00 38 3C 23 11 26 16 04 0B A3 00 20 3A 23 11 16 06 12 00 04 
    //0B 47 
  }


  final function sv_AddSpecialDuffEvent(export editinline FSkill_Event_Duff aDuff) {
    local int C;
    local export editinline FSkill_Event outEvent;
    local AimingInfo AimingInfo;
    AimingInfo.CameraLocation = Outer.Location;                                 //0000 : 0F 36 58 2B 18 11 00 60 3F 23 11 19 01 00 E4 6B 0F 05 00 0C 01 30 81 6C 0F 
    AimingInfo.CameraRotation = Outer.Rotation;                                 //0019 : 0F 36 E0 2A 18 11 00 60 3F 23 11 19 01 00 E4 6B 0F 05 00 0C 01 00 84 6C 0F 
    AimingInfo.PreferredTarget = None;                                          //0032 : 0F 36 D0 2B 18 11 00 60 3F 23 11 2A 
    outEvent = RunEvent(aDuff,Class'FSkill_Event'.65536 | Class'FSkill_Event'.4,None,Outer,Outer,Outer,Outer.Location,AimingInfo,Outer.CharacterStats.mRecord,-1,Outer.Level.TimeSeconds,Class'FSkill_Enums'.8);//003E : 0F 00 D8 3F 23 11 1C 80 28 18 11 00 60 3D 23 11 9E 12 20 C0 55 5D 01 05 00 04 1D 00 00 01 00 12 20 C0 55 5D 01 02 00 04 2C 04 16 2A 01 00 E4 6B 0F 01 00 E4 6B 0F 01 00 E4 6B 0F 19 01 00 E4 6B 0F 05 00 0C 01 30 81 6C 0F 00 60 3F 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 1D FF FF FF FF 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 12 20 00 31 5D 01 02 00 01 24 08 16 
    C = SpecialDuffEvents.Length;                                               //00CB : 0F 00 50 40 23 11 37 01 98 3A 23 11 
    SpecialDuffEvents.Length = C + 1;                                           //00D7 : 0F 37 01 98 3A 23 11 92 00 50 40 23 11 26 16 
    SpecialDuffEvents[C] = FSkill_Event_Duff(outEvent);                         //00E6 : 0F 10 00 50 40 23 11 01 98 3A 23 11 2E 80 65 5D 01 00 D8 3F 23 11 
    //0F 36 58 2B 18 11 00 60 3F 23 11 19 01 00 E4 6B 0F 05 00 0C 01 30 81 6C 0F 0F 36 E0 2A 18 11 00 
    //60 3F 23 11 19 01 00 E4 6B 0F 05 00 0C 01 00 84 6C 0F 0F 36 D0 2B 18 11 00 60 3F 23 11 2A 0F 00 
    //D8 3F 23 11 1C 80 28 18 11 00 60 3D 23 11 9E 12 20 C0 55 5D 01 05 00 04 1D 00 00 01 00 12 20 C0 
    //55 5D 01 02 00 04 2C 04 16 2A 01 00 E4 6B 0F 01 00 E4 6B 0F 01 00 E4 6B 0F 19 01 00 E4 6B 0F 05 
    //00 0C 01 30 81 6C 0F 00 60 3F 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 05 00 68 01 78 
    //2D 34 0F 1D FF FF FF FF 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 12 
    //20 00 31 5D 01 02 00 01 24 08 16 0F 00 50 40 23 11 37 01 98 3A 23 11 0F 37 01 98 3A 23 11 92 00 
    //50 40 23 11 26 16 0F 10 00 50 40 23 11 01 98 3A 23 11 2E 80 65 5D 01 00 D8 3F 23 11 04 0B 47 
  }


  final native function int sv_RemoveSpecialDuffEffect(int UniqueIdentifier);


  final native function sv_AddSpecialDuffEffect(export editinline FSkill_EffectClass_Duff aDuff,float aDuration,optional int UniqueIdentifier);


  protected native function sv2cl_UpdateComboState_CallStub();


  final event sv2cl_UpdateComboState(array<int> aComboString) {
    local int i;
    local export editinline FSkill_Type Skill;
    mComboStringLength = 0;                                                     //0000 : 0F 01 D0 46 23 11 25 
    i = 0;                                                                      //0007 : 0F 00 48 47 23 11 25 
    while (i < aComboString.Length) {                                           //000E : 07 83 00 96 00 48 47 23 11 37 00 58 46 23 11 16 
      Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aComboString[i]));  //001E : 0F 00 C0 47 23 11 2E 40 36 5D 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 48 47 23 11 00 58 46 23 11 16 
      if (mComboStringLength < 9 && Skill != None) {                            //0043 : 07 79 00 82 96 01 D0 46 23 11 2C 09 16 18 09 00 77 00 C0 47 23 11 2A 16 16 
        mComboString[mComboStringLength].Skill = Skill;                         //005C : 0F 36 C0 48 23 11 1A 01 D0 46 23 11 01 38 49 23 11 00 C0 47 23 11 
        mComboStringLength++;                                                   //0072 : A5 01 D0 46 23 11 16 
      }
      ++i;                                                                      //0079 : A3 00 48 47 23 11 16 
    }
    OnComboStringChanged(mComboStringLength);                                   //0083 : 43 B0 49 23 11 BB 05 00 00 01 D0 46 23 11 16 
    //0F 01 D0 46 23 11 25 0F 00 48 47 23 11 25 07 83 00 96 00 48 47 23 11 37 00 58 46 23 11 16 0F 00 
    //C0 47 23 11 2E 40 36 5D 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 48 47 23 11 00 58 46 
    //23 11 16 07 79 00 82 96 01 D0 46 23 11 2C 09 16 18 09 00 77 00 C0 47 23 11 2A 16 16 0F 36 C0 48 
    //23 11 1A 01 D0 46 23 11 01 38 49 23 11 00 C0 47 23 11 A5 01 D0 46 23 11 16 A3 00 48 47 23 11 16 
    //06 0E 00 43 B0 49 23 11 BB 05 00 00 01 D0 46 23 11 16 04 0B 47 
  }


  final native function sv_ResetComboState(optional bool aReplicate);


  final native function sv_PostUpdateComboState(export editinline FSkill_Type aSkill,const out array<Game_Pawn> outTargets);


  final native function bool sv_PreUpdateComboState(export editinline FSkill_Type aSkill,float aTime);


  final native function bool AllowFinishingMove();


  final native function bool sv_GetLastComboSkill(out ComboStringData outData,float TimeFrame);


  final native function IncreaseSessionTargetCount(int aSessionID,int aValue);


  final native function int GetSessionTargetCount(int aSessionID);


  final native function DecreaseSessionRefCount(int aSessionID);


  final native function IncreaseSessionRefCount(int aSessionID);


  final native function int RegisterSession();


  final native function bool IsSkillDisabled(export editinline FSkill_Type aSkill);


  protected native function sv2cl_UninstallDisableSkillUseEffect_CallStub();


  private final event sv2cl_UninstallDisableSkillUseEffect(int Id) {
    UninstallDisableSkillUseEffect(Id);                                         //0000 : 1C 58 5F 23 11 00 08 60 23 11 16 
    //1C 58 5F 23 11 00 08 60 23 11 16 04 0B 47 
  }


  final native function UninstallDisableSkillUseEffect(int Id);


  protected native function sv2cl_InstallDisableSkillUseEffect_CallStub();


  private final event sv2cl_InstallDisableSkillUseEffect(int aDuffID,int aId) {
    local int C;
    local DisableSkillUseData dsud;
    dsud.Id = aId;                                                              //0000 : 0F 36 30 65 23 11 00 A8 65 23 11 00 20 66 23 11 
    dsud.effect = FSkill_EffectClass_DuffDisableSkillUse(Class'SBDBSync'.GetResourceObject(aDuffID));//0010 : 0F 36 98 66 23 11 00 A8 65 23 11 2E C0 27 5E 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 80 63 23 11 16 
    C = DisableSkillUseEffects.Length;                                          //0034 : 0F 00 10 67 23 11 37 01 88 67 23 11 
    DisableSkillUseEffects.Length = C + 1;                                      //0040 : 0F 37 01 88 67 23 11 92 00 10 67 23 11 26 16 
    DisableSkillUseEffects[C] = dsud;                                           //004F : 0F 10 00 10 67 23 11 01 88 67 23 11 00 A8 65 23 11 
    //0F 36 30 65 23 11 00 A8 65 23 11 00 20 66 23 11 0F 36 98 66 23 11 00 A8 65 23 11 2E C0 27 5E 01 
    //12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 80 63 23 11 16 0F 00 10 67 23 11 37 01 88 67 23 11 
    //0F 37 01 88 67 23 11 92 00 10 67 23 11 26 16 0F 10 00 10 67 23 11 01 88 67 23 11 00 A8 65 23 11 
    //04 0B 47 
  }


  private final native function UninstallDuffCompletely(out DuffStackData aDuffData);


  final native function FireCondition(Game_Pawn aOriginPawn,byte aCondition,optional byte aAttackType,optional byte aMagicType,optional byte aEffectType);


  final native function TriggerFireCondition(array<Game_Pawn> aConditionTriggerPawn,Game_Pawn aOriginPawn,byte aCondition,optional byte aAttackType,optional byte aMagicType,optional byte aEffectType);


  protected native function ProcessOldEvent(export editinline FSkill_Event aEvent);


  protected final event cl_StartSkillTracers(export editinline FSkill_Type aSkillType,export editinline Item_Type aTokenItem,int VarNr) {
    local export editinline FSkill_EffectClass_AudioVisual tracerEffect;
    local int i;
    local float skillDuration;
    local export editinline IC_TokenItem itemTokenComponent;
    if (aSkillType.WeaponTracer && cl_IsMeleeWeaponEquipped()) {                //0000 : 07 04 01 82 19 00 E8 75 23 11 06 00 04 2D 01 B8 B8 20 11 18 07 00 1C 38 75 23 11 16 16 
      skillDuration = aSkillType.GetSkillDuration(Outer,VarNr);                 //001D : 0F 00 F8 77 23 11 19 00 E8 75 23 11 10 00 04 1C 88 99 20 11 01 00 E4 6B 0F 00 70 78 23 11 16 
      if (aTokenItem != None) {                                                 //003C : 07 A8 00 77 00 E8 78 23 11 2A 16 
        itemTokenComponent = aTokenItem.GetItemTokenComponent();                //0047 : 0F 00 60 79 23 11 19 00 E8 78 23 11 06 00 04 1C D8 79 23 11 16 
        i = 0;                                                                  //005C : 0F 00 88 7A 23 11 25 
        while (i < itemTokenComponent.WeaponTracers.Length) {                   //0063 : 07 A5 00 96 00 88 7A 23 11 37 19 00 60 79 23 11 05 00 00 01 00 7B 23 11 16 
          cl_StartTracerEffect(itemTokenComponent.WeaponTracers[i],skillDuration);//007C : 1C 78 7B 23 11 10 00 88 7A 23 11 19 00 60 79 23 11 05 00 00 01 00 7B 23 11 00 F8 77 23 11 16 
          i++;                                                                  //009B : A5 00 88 7A 23 11 16 
        }
      } else {                                                                  //00A5 : 06 04 01 
        tracerEffect = FSkill_EffectClass_AudioVisual_Emitter(static.DynamicLoadObject("EffectsPlayerAVGP.Tracers.DoNotRemove.DefaultTracer",Class'FSkill_EffectClass_AudioVisual_Emitter',True));//00A8 : 0F 00 28 7C 23 11 2E C0 BE 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 50 6C 61 79 65 72 41 56 47 50 2E 54 72 61 63 65 72 73 2E 44 6F 4E 6F 74 52 65 6D 6F 76 65 2E 44 65 66 61 75 6C 74 54 72 61 63 65 72 00 20 C0 BE 5D 01 27 16 
        cl_StartTracerEffect(tracerEffect,skillDuration);                       //00F4 : 1C 78 7B 23 11 00 28 7C 23 11 00 F8 77 23 11 16 
      }
    }
    //07 04 01 82 19 00 E8 75 23 11 06 00 04 2D 01 B8 B8 20 11 18 07 00 1C 38 75 23 11 16 16 0F 00 F8 
    //77 23 11 19 00 E8 75 23 11 10 00 04 1C 88 99 20 11 01 00 E4 6B 0F 00 70 78 23 11 16 07 A8 00 77 
    //00 E8 78 23 11 2A 16 0F 00 60 79 23 11 19 00 E8 78 23 11 06 00 04 1C D8 79 23 11 16 0F 00 88 7A 
    //23 11 25 07 A5 00 96 00 88 7A 23 11 37 19 00 60 79 23 11 05 00 00 01 00 7B 23 11 16 1C 78 7B 23 
    //11 10 00 88 7A 23 11 19 00 60 79 23 11 05 00 00 01 00 7B 23 11 00 F8 77 23 11 16 A5 00 88 7A 23 
    //11 16 06 63 00 06 04 01 0F 00 28 7C 23 11 2E C0 BE 5D 01 1C 60 E7 69 0F 1F 45 66 66 65 63 74 73 
    //50 6C 61 79 65 72 41 56 47 50 2E 54 72 61 63 65 72 73 2E 44 6F 4E 6F 74 52 65 6D 6F 76 65 2E 44 
    //65 66 61 75 6C 74 54 72 61 63 65 72 00 20 C0 BE 5D 01 27 16 1C 78 7B 23 11 00 28 7C 23 11 00 F8 
    //77 23 11 16 04 0B 47 
  }


  private final function bool cl_IsMeleeWeaponEquipped() {
    local int mainWeaponIndex;
    local export editinline Game_EquippedAppearance equippedAppearance;
    local Appearance_Base weaponAppearance;
    equippedAppearance = Game_EquippedAppearance(Outer.Appearance.GetCurrent());//0000 : 0F 00 F8 7D 23 11 2E 70 B8 5F 01 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
    if (equippedAppearance != None) {                                           //0023 : 07 7E 00 77 00 F8 7D 23 11 2A 16 
      mainWeaponIndex = equippedAppearance.GetValue(16);                        //002E : 0F 00 70 7E 23 11 19 00 F8 7D 23 11 08 00 04 1B 7D 0C 00 00 24 10 16 
      if (mainWeaponIndex >= 0) {                                               //0045 : 07 7E 00 99 00 70 7E 23 11 25 16 
        weaponAppearance = Appearance_Base(equippedAppearance.GetAppearanceResource(16,mainWeaponIndex));//0050 : 0F 00 E8 7E 23 11 2E 70 CD 5F 01 19 00 F8 7D 23 11 0D 00 04 1B 08 0D 00 00 24 10 00 70 7E 23 11 16 
        if (weaponAppearance != None) {                                         //0071 : 07 7E 00 77 00 E8 7E 23 11 2A 16 
          return True;                                                          //007C : 04 27 
        }
      }
    }
    return False;                                                               //007E : 04 28 
    //0F 00 F8 7D 23 11 2E 70 B8 5F 01 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 
    //00 00 16 07 7E 00 77 00 F8 7D 23 11 2A 16 0F 00 70 7E 23 11 19 00 F8 7D 23 11 08 00 04 1B 7D 0C 
    //00 00 24 10 16 07 7E 00 99 00 70 7E 23 11 25 16 0F 00 E8 7E 23 11 2E 70 CD 5F 01 19 00 F8 7D 23 
    //11 0D 00 04 1B 08 0D 00 00 24 10 00 70 7E 23 11 16 07 7E 00 77 00 E8 7E 23 11 2A 16 04 27 04 28 
    //04 0B 47 
  }


  private final function cl_StartTracerEffect(export editinline FSkill_EffectClass_AudioVisual tracerEffect,float Duration) {
    Outer.Effects.cl_Start(tracerEffect,Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Duration);//0000 : 19 19 01 00 E4 6B 0F 05 00 04 01 48 63 34 0F 3A 00 04 1C 28 65 34 0F 00 10 80 23 11 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 00 20 81 23 11 16 
    //19 19 01 00 E4 6B 0F 05 00 04 01 48 63 34 0F 3A 00 04 1C 28 65 34 0F 00 10 80 23 11 12 20 10 43 
    //5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 
    //04 1E 00 00 80 CE 00 20 81 23 11 16 04 0B 47 
  }


  protected function cl_AddActiveSkill(int aSkillID,float aStartTime,float aDuration,float aSkillSpeed,bool aFreezeMovement,bool aFreezeRotation,int aTokenItemID,int AnimVarNr,Vector aLocation,Rotator aRotation) {
    LastSkill.Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillID)); //0000 : 0F 36 60 84 23 11 01 D8 84 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 48 82 23 11 16 
    LastSkill.StartTime = aStartTime;                                           //0024 : 0F 36 50 85 23 11 01 D8 84 23 11 00 C8 85 23 11 
    LastSkill.Duration = aDuration;                                             //0034 : 0F 36 40 86 23 11 01 D8 84 23 11 00 B8 86 23 11 
    LastSkill.SkillSpeed = aSkillSpeed;                                         //0044 : 0F 36 30 87 23 11 01 D8 84 23 11 00 A8 87 23 11 
    LastSkill.LockedMovement = aFreezeMovement;                                 //0054 : 14 2D 36 20 88 23 11 01 D8 84 23 11 2D 00 98 88 23 11 
    LastSkill.LockedRotation = aFreezeRotation;                                 //0066 : 14 2D 36 10 89 23 11 01 D8 84 23 11 2D 00 88 89 23 11 
    LastSkill.SpecificTarget = None;                                            //0078 : 0F 36 00 8A 23 11 01 D8 84 23 11 2A 
    ActiveSkills.Length = ActiveSkills.Length + 1;                              //0084 : 0F 37 01 E0 1B 23 11 92 37 01 E0 1B 23 11 26 16 
    ActiveSkills[ActiveSkills.Length - 1] = LastSkill;                          //0094 : 0F 10 93 37 01 E0 1B 23 11 26 16 01 E0 1B 23 11 01 D8 84 23 11 
    //0F 36 60 84 23 11 01 D8 84 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 48 
    //82 23 11 16 0F 36 50 85 23 11 01 D8 84 23 11 00 C8 85 23 11 0F 36 40 86 23 11 01 D8 84 23 11 00 
    //B8 86 23 11 0F 36 30 87 23 11 01 D8 84 23 11 00 A8 87 23 11 14 2D 36 20 88 23 11 01 D8 84 23 11 
    //2D 00 98 88 23 11 14 2D 36 10 89 23 11 01 D8 84 23 11 2D 00 88 89 23 11 0F 36 00 8A 23 11 01 D8 
    //84 23 11 2A 0F 37 01 E0 1B 23 11 92 37 01 E0 1B 23 11 26 16 0F 10 93 37 01 E0 1B 23 11 26 16 01 
    //E0 1B 23 11 01 D8 84 23 11 04 0B 47 
  }


  protected native function sv2rel_AddActiveSkill_CallStub();


  private final event sv2rel_AddActiveSkill(int aSkillID,float aStartTime,float aDuration,float aSkillSpeed,bool aFreezeMovement,bool aFreezeRotation,int aTokenItemID,int AnimVarNr,Vector aLocation,Rotator aRotation) {
    cl_AddActiveSkill(aSkillID,aStartTime,aDuration,aSkillSpeed,aFreezeMovement,aFreezeRotation,aTokenItemID,AnimVarNr,aLocation,aRotation);//0000 : 1B B2 0C 00 00 00 B8 8D 23 11 00 B0 8E 23 11 00 28 8F 23 11 00 A0 8F 23 11 2D 00 18 90 23 11 2D 00 90 90 23 11 00 08 91 23 11 00 80 91 23 11 00 F8 91 23 11 00 70 92 23 11 16 
    //1B B2 0C 00 00 00 B8 8D 23 11 00 B0 8E 23 11 00 28 8F 23 11 00 A0 8F 23 11 2D 00 18 90 23 11 2D 
    //00 90 90 23 11 00 08 91 23 11 00 80 91 23 11 00 F8 91 23 11 00 70 92 23 11 16 04 0B 47 
  }


  protected native function sv2cl_AddActiveSkill_CallStub();


  private final event sv2cl_AddActiveSkill(int aSkillID,float aStartTime,float aDuration,float aSkillSpeed,bool aFreezeMovement,bool aFreezeRotation,int aTokenItemID,int AnimVarNr) {
    mTierTimeoutStartTime = -1.00000000;                                        //0000 : 0F 01 68 95 23 11 1E 00 00 80 BF 
    cl_AddActiveSkill(aSkillID,aStartTime,aDuration,aSkillSpeed,aFreezeMovement,aFreezeRotation,aTokenItemID,AnimVarNr,Outer.Location,Outer.Rotation);//000B : 1B B2 0C 00 00 00 48 94 23 11 00 E0 95 23 11 00 58 96 23 11 00 D0 96 23 11 2D 00 48 97 23 11 2D 00 C0 97 23 11 00 38 98 23 11 00 B0 98 23 11 19 01 00 E4 6B 0F 05 00 0C 01 30 81 6C 0F 19 01 00 E4 6B 0F 05 00 0C 01 00 84 6C 0F 16 
    //0F 01 68 95 23 11 1E 00 00 80 BF 1B B2 0C 00 00 00 48 94 23 11 00 E0 95 23 11 00 58 96 23 11 00 
    //D0 96 23 11 2D 00 48 97 23 11 2D 00 C0 97 23 11 00 38 98 23 11 00 B0 98 23 11 19 01 00 E4 6B 0F 
    //05 00 0C 01 30 81 6C 0F 19 01 00 E4 6B 0F 05 00 0C 01 00 84 6C 0F 16 04 0B 47 
  }


  protected native function sv2cl_ClearLastSkill_CallStub();


  private final event sv2cl_ClearLastSkill() {
    local export editinline FSkill_Type oldSkill;
    oldSkill = LastSkill.Skill;                                                 //0000 : 0F 00 88 9A 23 11 36 60 84 23 11 01 D8 84 23 11 
    LastSkill.StartTime = 0.00000000;                                           //0010 : 0F 36 50 85 23 11 01 D8 84 23 11 1E 00 00 00 00 
    LastSkill.Duration = 0.00000000;                                            //0020 : 0F 36 40 86 23 11 01 D8 84 23 11 1E 00 00 00 00 
    LastSkill.Skill = None;                                                     //0030 : 0F 36 60 84 23 11 01 D8 84 23 11 2A 
    LastSkill.SpecificTarget = None;                                            //003C : 0F 36 00 8A 23 11 01 D8 84 23 11 2A 
    if (oldSkill.SkillRollsCombatBar) {                                         //0048 : 07 60 00 19 00 88 9A 23 11 06 00 04 2D 01 E0 CC 20 11 
      AdvanceToNextTier();                                                      //005A : 1B 1C 0F 00 00 16 
    }
    //0F 00 88 9A 23 11 36 60 84 23 11 01 D8 84 23 11 0F 36 50 85 23 11 01 D8 84 23 11 1E 00 00 00 00 
    //0F 36 40 86 23 11 01 D8 84 23 11 1E 00 00 00 00 0F 36 60 84 23 11 01 D8 84 23 11 2A 0F 36 00 8A 
    //23 11 01 D8 84 23 11 2A 07 60 00 19 00 88 9A 23 11 06 00 04 2D 01 E0 CC 20 11 1B 1C 0F 00 00 16 
    //04 0B 47 
  }


  protected native function sv2cl_UpdateShareDuffs_CallStub();


  private event sv2cl_UpdateShareDuffs(const array<int> transferShareDuffs) {
    local int i;
    mLastDuffUpdateTime = Outer.Level.TimeSeconds;                              //0000 : 0F 01 60 9E 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    ShareApplicantEffects.Length = transferShareDuffs.Length;                   //001D : 0F 37 01 D8 9E 23 11 37 00 10 9D 23 11 
    i = 0;                                                                      //002A : 0F 00 50 9F 23 11 25 
    while (i < transferShareDuffs.Length) {                                     //0031 : 07 7B 00 96 00 50 9F 23 11 37 00 10 9D 23 11 16 
      ShareApplicantEffects[i].effect = FSkill_EffectClass_DuffShare(Class'SBDBSync'.GetResourceObject(transferShareDuffs[i]));//0041 : 0F 36 50 A0 23 11 10 00 50 9F 23 11 01 D8 9E 23 11 2E C0 51 5E 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 50 9F 23 11 00 10 9D 23 11 16 
      ++i;                                                                      //0071 : A3 00 50 9F 23 11 16 
    }
    //0F 01 60 9E 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 0F 37 01 
    //D8 9E 23 11 37 00 10 9D 23 11 0F 00 50 9F 23 11 25 07 7B 00 96 00 50 9F 23 11 37 00 10 9D 23 11 
    //16 0F 36 50 A0 23 11 10 00 50 9F 23 11 01 D8 9E 23 11 2E C0 51 5E 01 12 20 30 82 24 01 11 00 04 
    //1B E5 0B 00 00 10 00 50 9F 23 11 00 10 9D 23 11 16 A3 00 50 9F 23 11 16 06 31 00 04 0B 47 
  }


  protected native function sv2clrel_UpdateDuffs_CallStub();


  private event sv2clrel_UpdateDuffs(array<TransferDuffStackData> aTransferDuffs) {
    local int i;
    ClientDuffList.Length = aTransferDuffs.Length;                              //0000 : 0F 37 01 80 A4 23 11 37 00 A0 A2 23 11 
    mLastDuffUpdateTime = Outer.Level.TimeSeconds;                              //000D : 0F 01 60 9E 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    i = 0;                                                                      //002A : 0F 00 F8 A4 23 11 25 
    while (i < aTransferDuffs.Length) {                                         //0031 : 07 E3 00 96 00 F8 A4 23 11 37 00 A0 A2 23 11 16 
      ClientDuffList[i].ActualStackCount = aTransferDuffs[i].ActualStackCount;  //0041 : 0F 36 F8 A5 23 11 10 00 F8 A4 23 11 01 80 A4 23 11 36 F8 A6 23 11 10 00 F8 A4 23 11 00 A0 A2 23 11 
      ClientDuffList[i].OriginalDuff = FSkill_Event_Duff(Class'SBDBSync'.GetResourceObject(aTransferDuffs[i].OriginalDuffID));//0062 : 0F 36 70 A7 23 11 10 00 F8 A4 23 11 01 80 A4 23 11 2E 80 65 5D 01 12 20 30 82 24 01 16 00 04 1B E5 0B 00 00 36 E8 A7 23 11 10 00 F8 A4 23 11 00 A0 A2 23 11 16 
      ClientDuffList[i].ApplyTime = aTransferDuffs[i].ApplyTime;                //0097 : 0F 36 60 A8 23 11 10 00 F8 A4 23 11 01 80 A4 23 11 36 D8 A8 23 11 10 00 F8 A4 23 11 00 A0 A2 23 11 
      ClientDuffList[i].Duration = aTransferDuffs[i].Duration;                  //00B8 : 0F 36 50 A9 23 11 10 00 F8 A4 23 11 01 80 A4 23 11 36 C8 A9 23 11 10 00 F8 A4 23 11 00 A0 A2 23 11 
      ++i;                                                                      //00D9 : A3 00 F8 A4 23 11 16 
    }
    //0F 37 01 80 A4 23 11 37 00 A0 A2 23 11 0F 01 60 9E 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 
    //6C 0F 05 00 04 01 A8 81 6C 0F 0F 00 F8 A4 23 11 25 07 E3 00 96 00 F8 A4 23 11 37 00 A0 A2 23 11 
    //16 0F 36 F8 A5 23 11 10 00 F8 A4 23 11 01 80 A4 23 11 36 F8 A6 23 11 10 00 F8 A4 23 11 00 A0 A2 
    //23 11 0F 36 70 A7 23 11 10 00 F8 A4 23 11 01 80 A4 23 11 2E 80 65 5D 01 12 20 30 82 24 01 16 00 
    //04 1B E5 0B 00 00 36 E8 A7 23 11 10 00 F8 A4 23 11 00 A0 A2 23 11 16 0F 36 60 A8 23 11 10 00 F8 
    //A4 23 11 01 80 A4 23 11 36 D8 A8 23 11 10 00 F8 A4 23 11 00 A0 A2 23 11 0F 36 50 A9 23 11 10 00 
    //F8 A4 23 11 01 80 A4 23 11 36 C8 A9 23 11 10 00 F8 A4 23 11 00 A0 A2 23 11 A3 00 F8 A4 23 11 16 
    //06 31 00 04 0B 47 
  }


  private final native function CheckSkills(float Now);


  protected final native function StartSkillAnimation(export editinline FSkill_Type aType,int aVarNr,float aSkillSpeed);


  protected native function cl2sv_ExecuteL_CallStub();


  private final native event cl2sv_ExecuteL(int aSkillID,Vector aTargetLocation,float aTime);


  protected native function cl2sv_ExecuteT_CallStub();


  private final native event cl2sv_ExecuteT(int aSkillID,Game_Pawn aSpecificTarget,float aTime);


  protected native function cl2sv_Execute_CallStub();


  private final native event cl2sv_Execute(int aSkillID,float aTime);


  protected native function cl2sv_ExecuteIndexL_CallStub();


  private final native event cl2sv_ExecuteIndexL(int aSkillIndex,Vector aTargetLocation,Vector aCameraLocation,Rotator aCameraRotation,Game_Pawn aPreferredTarget,float aTime);


  protected native function cl2sv_ExecuteIndex_CallStub();


  private final native event cl2sv_ExecuteIndex(int aSkillIndex,Vector aCameraLocation,Rotator aCameraRotation,Game_Pawn aPreferredTarget,float aTime);


  protected native function AdvanceToNextTier();


  protected native function RollbackToFirstTier();


  protected native function sv2clrel_RunEventL_CallStub();


  final event sv2clrel_RunEventL(int aSkillID,int aEventID,int aFlags,Game_Pawn aSkillPawn,Game_Pawn aTriggerPawn,Game_Pawn aTargetPawn,Vector aTargetLocation,float aTime) {
    local export editinline FSkill_Type Skill;
    local export editinline FSkill_Event aEvent;
    local AimingInfo dummyAimingInfo;
    Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillID));           //0000 : 0F 00 58 C4 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 C2 23 11 16 
    aEvent = FSkill_Event(Class'SBDBSync'.GetResourceObject(aEventID));         //001F : 0F 00 D0 C4 23 11 2E C0 55 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 48 C5 23 11 16 
    if (Skill != None) {                                                        //003E : 07 B4 00 77 00 58 C4 23 11 2A 16 
      if (aEvent != None) {                                                     //0049 : 07 B1 00 77 00 D0 C4 23 11 2A 16 
        RunEvent(aEvent,aFlags,Skill,aSkillPawn,aTriggerPawn,aTargetPawn,aTargetLocation,dummyAimingInfo,aSkillPawn.CharacterStats.mRecord,-1,aTime,Class'FSkill_Enums'.8);//0054 : 1C 80 28 18 11 00 D0 C4 23 11 00 C0 C5 23 11 00 58 C4 23 11 00 38 C6 23 11 00 B0 C6 23 11 00 28 C7 23 11 00 A0 C7 23 11 00 18 C8 23 11 19 19 00 38 C6 23 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 1D FF FF FF FF 00 90 C8 23 11 12 20 00 31 5D 01 02 00 01 24 08 16 
        goto jl00B1;                                                            //00AE : 06 B1 00 
      }
      goto jl00B4;                                                              //00B1 : 06 B4 00 
    }
    //0F 00 58 C4 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 C2 23 11 16 0F 
    //00 D0 C4 23 11 2E C0 55 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 48 C5 23 11 16 07 B4 
    //00 77 00 58 C4 23 11 2A 16 07 B1 00 77 00 D0 C4 23 11 2A 16 1C 80 28 18 11 00 D0 C4 23 11 00 C0 
    //C5 23 11 00 58 C4 23 11 00 38 C6 23 11 00 B0 C6 23 11 00 28 C7 23 11 00 A0 C7 23 11 00 18 C8 23 
    //11 19 19 00 38 C6 23 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 1D FF FF FF FF 00 90 C8 
    //23 11 12 20 00 31 5D 01 02 00 01 24 08 16 06 B1 00 06 B4 00 04 0B 47 
  }


  protected native function sv2clrel_RunEvent_CallStub();


  final event sv2clrel_RunEvent(int aSkillID,int aEventID,int aFlags,Game_Pawn aSkillPawn,Game_Pawn aTriggerPawn,Game_Pawn aTargetPawn,float aTime) {
    local export editinline FSkill_Type Skill;
    local export editinline FSkill_Event aEvent;
    local Vector cleanVector;
    local AimingInfo dummyAimingInfo;
    Skill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillID));           //0000 : 0F 00 58 CB 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 C9 23 11 16 
    aEvent = FSkill_Event(Class'SBDBSync'.GetResourceObject(aEventID));         //001F : 0F 00 D0 CB 23 11 2E C0 55 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 48 CC 23 11 16 
    if (Skill != None) {                                                        //003E : 07 B4 00 77 00 58 CB 23 11 2A 16 
      if (aEvent != None) {                                                     //0049 : 07 B1 00 77 00 D0 CB 23 11 2A 16 
        RunEvent(aEvent,aFlags,Skill,aSkillPawn,aTriggerPawn,aTargetPawn,cleanVector,dummyAimingInfo,aSkillPawn.CharacterStats.mRecord,-1,aTime,Class'FSkill_Enums'.8);//0054 : 1C 80 28 18 11 00 D0 CB 23 11 00 C0 CC 23 11 00 58 CB 23 11 00 38 CD 23 11 00 B0 CD 23 11 00 38 0B 24 11 00 B0 0B 24 11 00 28 0C 24 11 19 19 00 38 CD 23 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 1D FF FF FF FF 00 A0 0C 24 11 12 20 00 31 5D 01 02 00 01 24 08 16 
        goto jl00B1;                                                            //00AE : 06 B1 00 
      }
      goto jl00B4;                                                              //00B1 : 06 B4 00 
    }
    //0F 00 58 CB 23 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 C9 23 11 16 0F 
    //00 D0 CB 23 11 2E C0 55 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 48 CC 23 11 16 07 B4 
    //00 77 00 58 CB 23 11 2A 16 07 B1 00 77 00 D0 CB 23 11 2A 16 1C 80 28 18 11 00 D0 CB 23 11 00 C0 
    //CC 23 11 00 58 CB 23 11 00 38 CD 23 11 00 B0 CD 23 11 00 38 0B 24 11 00 B0 0B 24 11 00 28 0C 24 
    //11 19 19 00 38 CD 23 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 1D FF FF FF FF 00 A0 0C 
    //24 11 12 20 00 31 5D 01 02 00 01 24 08 16 06 B1 00 06 B4 00 04 0B 47 
  }


  final native function FSkill_Event RunEvent(export editinline FSkill_Event aEvent,int aFlags,export editinline FSkill_Type aSkill,Game_Pawn aSkillPawn,Game_Pawn aTriggerPawn,Game_Pawn aTargetPawn,Vector aTargetLocation,AimingInfo aAimingInfo,const out CharacterStatsRecord aState,int aSessionID,float aTime,byte aOriginCondition);


  native function sv_RemoveDuffs(Object aParameter,optional bool aQueueAbort);


  delegate bool RemoveDuffFilter(Object aParameter,export editinline FSkill_Event_Duff aDuffEvent);


  final native function sv_DirectSkillEffects(export editinline FSkill_Type Skill,Game_Pawn aTarget);


  final native function cl_OnEffectNotify(name NotifyName);


  final native function ExecuteL(export editinline FSkill_Type aType,Vector aLocation,float aTime);


  final native function ExecuteT(export editinline FSkill_Type aType,Game_Pawn aTarget,float aTime);


  final native function Execute(export editinline FSkill_Type aType,float aTime);


  final native function ExecuteIndexL(int aSkillIndex,Vector aLocation,AimingInfo aAimingInfo);


  native function ExecuteIndex(int aSkillIndex,AimingInfo aAimingInfo);


  final native event byte CanActivateSpecificSkill(export editinline FSkill_Type aSkillType,optional bool ReportIssuesToClient);


  final native event byte CanActivateSkill();


  final native function bool IsAttacking(export out editinline FSkill_Type outAttackingSkill,out float outRelativeTimeSpent);


  final function bool HasSkill(export editinline FSkill_Type aSkill) {
    local int i;
    local int j;
    local Game_Controller gc;
    gc = Game_Controller(Outer.Controller);                                     //0000 : 0F 00 A0 DD 21 11 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
    j = aSkill.GetResourceId();                                                 //0019 : 0F 00 18 DE 21 11 19 00 50 DC 21 11 06 00 04 1C 08 90 20 11 16 
    i = 0;                                                                      //002E : 0F 00 90 DE 21 11 25 
    while (i < gc.DBCharacterSkills.Length) {                                   //0035 : 07 78 00 96 00 90 DE 21 11 37 19 00 A0 DD 21 11 05 00 00 01 E0 18 1B 11 16 
      if (gc.DBCharacterSkills[i] == j) {                                       //004E : 07 6E 00 9A 10 00 90 DE 21 11 19 00 A0 DD 21 11 05 00 00 01 E0 18 1B 11 00 18 DE 21 11 16 
        return True;                                                            //006C : 04 27 
      }
      ++i;                                                                      //006E : A3 00 90 DE 21 11 16 
    }
    return False;                                                               //0078 : 04 28 
    //0F 00 A0 DD 21 11 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 0F 00 18 DE 21 11 19 
    //00 50 DC 21 11 06 00 04 1C 08 90 20 11 16 0F 00 90 DE 21 11 25 07 78 00 96 00 90 DE 21 11 37 19 
    //00 A0 DD 21 11 05 00 00 01 E0 18 1B 11 16 07 6E 00 9A 10 00 90 DE 21 11 19 00 A0 DD 21 11 05 00 
    //00 01 E0 18 1B 11 00 18 DE 21 11 16 04 27 A3 00 90 DE 21 11 16 06 35 00 04 28 04 0B 47 
  }


  final native function ResetAttacking();


  native function float GetRelativeTierTimeout();


  final native function FSkill_Type GetActiveTierSlotSkill(int aSlot);


  final native function sv_LearnSkill(export editinline FSkill_Type aSkill);


  protected native function sv2cl_LearnSkill_CallStub();


  protected event sv2cl_LearnSkill(int aSkillID) {
    local export editinline FSkill_Type learnedSkill;
    learnedSkill = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkillID));    //0000 : 0F 00 48 E7 21 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 50 E6 21 11 16 
    CharacterSkills[CharacterSkills.Length] = learnedSkill;                     //001F : 0F 10 37 01 C0 E7 21 11 01 C0 E7 21 11 00 48 E7 21 11 
    OnCharacterSkillsChanged();                                                 //0031 : 43 38 E8 21 11 B7 05 00 00 16 
    //0F 00 48 E7 21 11 2E 40 36 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 50 E6 21 11 16 0F 
    //10 37 01 C0 E7 21 11 01 C0 E7 21 11 00 48 E7 21 11 43 38 E8 21 11 B7 05 00 00 16 04 0B 47 
  }


  protected native function cl2sv_LearnSkill_CallStub();


  native event cl2sv_LearnSkill(int ResourceId);


  final native function bool cl_CharacterHasSkill(export editinline FSkill_Type aSkill);


  final native function bool sv_CharacterHasSkill(export editinline FSkill_Type aSkill);


  final native function int GetSkilldeckIndex(int aSkilldeckID);


  native event cl_OnShutdown();


  native function cl_OnFrame(float aDeltaTime);


  delegate OnSkillReceivedTokenSlot(export editinline FSkill_Type aSkill,int aNewSlotCount);


  protected native function cl2sv_EnableSkillLog_CallStub();


  event cl2sv_EnableSkillLog(bool Enable) {
    DebugSkillEnabled = Enable;                                                 //0000 : 14 2D 01 68 1A 24 11 2D 00 B0 19 24 11 
    //14 2D 01 68 1A 24 11 2D 00 B0 19 24 11 04 0B 47 
  }


  protected native function sv2cl_OnSkillLog_CallStub();


  event sv2cl_OnSkillLog(int loglevel,string aString) {
    cl_ParseSkillLogString(aString);                                            //0000 : 1B 96 0F 00 00 00 10 1D 24 11 16 
    OnSkillLog(loglevel,aString);                                               //000B : 43 88 1D 24 11 F7 05 00 00 00 40 1C 24 11 00 10 1D 24 11 16 
    //1B 96 0F 00 00 00 10 1D 24 11 16 43 88 1D 24 11 F7 05 00 00 00 40 1C 24 11 00 10 1D 24 11 16 04 
    //0B 47 
  }


  native function cl_ParseSkillLogString(out string aString);


  native function sv_OnSkillLogIndent(int diff);


  native function sv_OnSkillLog(int loglevel,string aString);


  delegate OnSkillLog(int loglevel,string aString);


  delegate OnComboStringChanged(int aStringLength);


  delegate OnCharacterSkillsChanged();


  delegate OnSkilldeckChanged();


  delegate OnRollToNextTier();


  delegate OnRollToFirstTier();



