//==============================================================================
//  FSkill_Event
//==============================================================================

class FSkill_Event extends Content_Type
    native
    abstract
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  const CF_VS_RECURSIVE = 268435456;
  const CF_VS_REQUIRED_BITS = 299;
  const CF_PERTARGET_BITS = 8128;
  const CF_BASE_BITS = 63;
  const CF_UNUSED_BITS = 57344;
  const CF_12a_FINAL_CAP = 4096;
  const CF_12_RESISTANCE_AFFINITY = 2048;
  const CF_11_ALTER_EFFECT_INPUT = 1024;
  const CF_10_SHARE = 512;
  const CF_09_TARGET_TYPE_INCREASE = 256;
  const CF_08_REFLECT = 128;
  const CF_07_IMMUNITY = 64;
  const CF_06_DIVIDE = 32;
  const CF_05_ALTER_EFFECT_OUTPUT = 16;
  const CF_04_MISC_BONUS = 8;
  const CF_03_SKILLTOKEN_BONUS = 4;
  const CF_02_ABSOLUTE_CAP = 2;
  const CF_01_CONSTANT_VALUE = 1;
  const VCV_CONTEXT_ALL = 67043328;
  const VCV_CONTEXT_GAIN = 67108864;
  const VCV_CONTEXT_CHAIN_REST = 33554432;
  const VCV_CONTEXT_CHAIN_1ST = 16777216;
  const VCV_CONTEXT_TRIGGERED = 8388608;
  const VCV_CONTEXT_REFLECT = 4194304;
  const VCV_CONTEXT_RETURN = 2097152;
  const VCV_CONTEXT_SHARERETURN = 1048576;
  const VCV_CONTEXT_SHAREDIVIDE = 524288;
  const VCV_CONTEXT_DUFFREPEAT = 262144;
  const VCV_CONTEXT_DUFF = 131072;
  const VCV_CONTEXT_DIRECT = 65536;
  const VCV_NO_TARGET_COUNTING = 16;
  const VCV_COMBO_EVENT = 8;
  const VCV_NOSKILL_EVENT = 4;
  const VCV_LOCATION = 2;
  const VCV_SKILLPAWN = 1;
  enum ESkillEventState {
    SES_INITIALIZING ,
    SES_WAITING_FOR_DELAY ,
    SES_RUNNING ,
    SES_FINISHED ,
    SES_ABORTED ,
    SES_ABORTING 
  };

  struct AimingInfo {
      var Rotator CameraRotation;
      var Vector CameraLocation;
      var Game_Pawn PreferredTarget;
      var float TriggerTime;

  };


  var transient int mhasskillpower_vtbl;
  var transient int mhasskillpower_data;
  var (Timing) const float Delay;
  var (Target) const bool TargetCountValueSpecifier;
  var const globalconfig float PerEffectFameLevelBonus[32];
  var const globalconfig float PerEffectPepLevelBonus[32];
  var export transient editinline FSkill_Type Skill;
  var transient int flags;
  var transient Game_Pawn SkillPawn;
  var transient CharacterStatsRecord SkillPawnState;
  var transient Game_Pawn TriggerPawn;
  var transient Vector Location;
  var transient float StartTime;
  var transient float ElapsedTime;
  var transient byte EventState;
  var transient Rotator TriggerRotation;
  var const export transient editinline FSkill_Event OriginalEvent;
  var transient int SessionID;
  var transient AimingInfo SkillPawnAimingInfo;
  var transient byte OriginDuffCondition;


  native function bool IsOriginalEvent();


  native function Object Clone(optional bool aCloneSubObjects);


  final native event bool NeedsCloningAlways();


  final native event bool NeedsServerSideExecution();


  final native event bool NeedsClientReplication();


  final native function bool Execute(float DeltaTime);


  final native function AbortEvent();


  final native function Initialize(int aFlags,export editinline FSkill_Type aSkill,Game_Pawn aSkillPawn,Game_Pawn aTriggerPawn,Game_Pawn aTargetPawn,Vector aLocation,const out AimingInfo aAimingInfo,const out CharacterStatsRecord aSkillPawnState,int aSessionID,float aTime,byte aOriginCondition);



