//==============================================================================
//  Game_CharacterStats
//==============================================================================

class Game_CharacterStats extends Base_Component within Game_Pawn
    native
    dependsOn(Game_Pawn)
    Config(charstats)
  ;

  const EFF_Stats =  8;
  const EFF_Animation =  4;
  const EFF_Rotation =  2;
  const EFF_Movement =  1;
  enum ECharacterStatsCharacterState {
    CSCS_IDLE ,
    CSCS_COMBATREADY ,
    CSCS_INCOMBAT ,
    ECharacterStatsCharacterState_RESERVED_3 ,
    CSCS_SITTING 
  };

  struct FreezeData {
      var float Start;
      var float Duration;

  };


  struct CharacterStatsRecord {
      var (CharacterStatsRecord) int Body;
      var (CharacterStatsRecord) int Mind;
      var (CharacterStatsRecord) int Focus;
      var (CharacterStatsRecord) float Physique;
      var (CharacterStatsRecord) float Morale;
      var (CharacterStatsRecord) float Concentration;
      var (CharacterStatsRecord) int FameLevel;
      var (CharacterStatsRecord) int PePRank;
      var (CharacterStatsRecord) float RuneAffinity;
      var (CharacterStatsRecord) float SpiritAffinity;
      var (CharacterStatsRecord) float SoulAffinity;
      var (CharacterStatsRecord) float MeleeResistance;
      var (CharacterStatsRecord) float RangedResistance;
      var (CharacterStatsRecord) float MagicResistance;
      var (CharacterStatsRecord) int MaxHealth;
      var (CharacterStatsRecord) float PhysiqueRegeneration;
      var (CharacterStatsRecord) float PhysiqueDegeneration;
      var (CharacterStatsRecord) float MoraleRegeneration;
      var (CharacterStatsRecord) float MoraleDegeneration;
      var (CharacterStatsRecord) float ConcentrationRegeneration;
      var (CharacterStatsRecord) float ConcentrationDegeneration;
      var (CharacterStatsRecord) float HealthRegeneration;
      var (CharacterStatsRecord) float AttackSpeedBonus;
      var (CharacterStatsRecord) float MovementSpeedBonus;
      var (CharacterStatsRecord) float DamageBonus;
      var (CharacterStatsRecord) float CopyHealth;

  };


  var const int mBaseBody;
  var const int mBaseMind;
  var const int mBaseFocus;
  var const int mBaseMaxHealth;
  var const float mBaseRuneAffinity;
  var const float mBaseSpiritAffinity;
  var const float mBaseSoulAffinity;
  var int mExtraBodyPoints;
  var int mExtraMindPoints;
  var int mExtraFocusPoints;
  var float mHealth;
  var byte mState;
  var byte mFrozenFlags;
  var int mFreezeMovementCount;
  var int mFreezeRotationCount;
  var int mFreezeAnimationCount;
  var int mFreezeStatsCount;
  var int mBaseMovementSpeed;
  var const int mMovementSpeed;
  var float mRearDamageIncrease;
  var float mFrontDamageIncrease;
  var float mConcentrationAttackSpeedBonus;
  var CharacterStatsRecord mRecord;
  var byte mCharacterClass;
  var const int mStateRankShift;
  var const int mRegenPointShift;
  var const int mPhysiqueLevel;
  var const int mMoraleLevel;
  var const int mConcentrationLevel;
  var const int mBodyDelta;
  var const int mMindDelta;
  var const int mFocusDelta;
  var const int mAttributesDeltaInternal;
  var const float mRuneAffinityDelta;
  var const float mSpiritAffinityDelta;
  var const float mSoulAffinityDelta;
  var const int mMaxHealthDelta;
  var const float mPhysiqueRegenerationDelta;
  var const float mPhysiqueDegenerationDelta;
  var const float mMoraleRegenerationDelta;
  var const float mMoraleDegenerationDelta;
  var const float mConcentrationRegenerationDelta;
  var const float mConcentrationDegenerationDelta;
  var const float mHealthRegenerationDelta;
  var const float mMeleeResistanceDelta;
  var const float mRangedResistanceDelta;
  var const float mMagicResistanceDelta;
  var const int mPePRankDelta;
  var const float mAttackSpeedBonusDelta;
  var const float mMovementSpeedBonusDelta;
  var const float mDamageBonusDelta;
  var const globalconfig float mPhysiqueLevelBonus[11];
  var const globalconfig float mMoraleLevelBonus[11];
  var const globalconfig float mConcentrationLevelBonus[11];
  var const globalconfig int mBodyDefaults[12];
  var const globalconfig int mMindDefaults[12];
  var const globalconfig int mFocusDefaults[12];
  var const globalconfig float mRuneAffinityDefaults[12];
  var const globalconfig float mSpiritAffinityDefaults[12];
  var const globalconfig float mSoulAffinityDefaults[12];
  var const globalconfig int mMaxHealthDefaults[12];
  var const globalconfig float mHealthRegenerationDefault[5];
  var const globalconfig float mPhysiqueRegenerationDefault[5];
  var const globalconfig float mMoraleRegenerationDefault[5];
  var const globalconfig float mConcentrationRegenerationDefault[5];
  var const globalconfig float mPhysiqueDegenerationDefault[5];
  var const globalconfig float mMoraleDegenerationDefault[5];
  var const globalconfig float mConcentrationDegenerationDefault[5];
  var config float mMovementSpeedMultiplier[5];
  var const config float mDamageBonus[5];
  var const config int mMovementSpeedDefault;
  var const globalconfig float mRegenerationEpoch;
  var const globalconfig int mMaxHealthBonusPerFameLevel;
  var const globalconfig float mMeleeResistanceModifier;
  var const globalconfig float mRangedResistanceModifier;
  var const globalconfig float mMagicResistanceModifier;
  var const globalconfig float mRuneAffinityModifier;
  var const globalconfig float mSpiritAffinityModifier;
  var const globalconfig float mSoulAffinityModifier;
  var const config float mHealthPepLvlBonus[6];
  var const config float mDamagePepLvlBonus[6];
  var private transient bool __Recalculate;
  var private transient bool __UpdateModifiers;
  var private const transient int __UpdateCounter;
  var private const transient float __UpdateTimeElapsed;
  var private array<FreezeData> mMovementFreezeTimers;
  var private array<FreezeData> mRotationFreezeTimers;
  var private array<FreezeData> mAnimationFreezeTimers;
  var private array<FreezeData> mStatsFreezeTimers;


  native function SetConcentration(float Value);


  native function SetMorale(float Value);


  native function SetPhysique(float Value);


  native function byte GetCharacterClass();


  native function SetCharacterClass(byte ClassId);


  final native function byte GetArchetype();


  final native function int GetPePRank();


  final native function int GetFameLevel();


  native event int GetPrevFameLevelPoints(int aCurrentLevel);


  native event int GetNextFameLevelPoints(int currentLevel);


  protected native function sv2clrel_UpdateStateRankShift_CallStub();


  protected native event sv2clrel_UpdateStateRankShift(int aStateRankShift);


  protected native function sv2clrel_UpdateMovementSpeed_CallStub();


  protected native event sv2clrel_UpdateMovementSpeed(int aMovementSpeed);


  protected native function sv2clrel_UpdateFrozenFlags_CallStub();


  protected native event sv2clrel_UpdateFrozenFlags(byte aFrozenFlags);


  protected native function sv2clrel_UpdateMaxHealth_CallStub();


  protected native event sv2clrel_UpdateMaxHealth(int aMaxHealth);


  protected native function sv2clrel_UpdateHealth_CallStub();


  protected native event sv2clrel_UpdateHealth(float aHealth);


  protected native function sv2clrel_UpdateConcentration_CallStub();


  protected native event sv2clrel_UpdateConcentration(float aConcentration);


  protected native function sv2clrel_UpdateMorale_CallStub();


  protected native event sv2clrel_UpdateMorale(float aMorale);


  protected native function sv2clrel_UpdatePhysique_CallStub();


  protected native event sv2clrel_UpdatePhysique(float aPhysique);


  protected native function sv2clrel_UpdateStateVariables_CallStub();


  protected native event sv2clrel_UpdateStateVariables(float aPhysique,float aMorale,float aConcentration);


  protected native function sv2cl_UpdateMagicResistance_CallStub();


  protected native event sv2cl_UpdateMagicResistance(float aMagicResistance);


  protected native function sv2cl_UpdateRangedResistance_CallStub();


  protected native event sv2cl_UpdateRangedResistance(float aRangedResistance);


  protected native function sv2cl_UpdateMeleeResistance_CallStub();


  protected native event sv2cl_UpdateMeleeResistance(float aMeleeResistance);


  protected native function sv2cl_UpdateFocusDelta_CallStub();


  protected native event sv2cl_UpdateFocusDelta(int aFocusDelta);


  protected native function sv2cl_UpdateMindDelta_CallStub();


  protected native event sv2cl_UpdateMindDelta(int aMindDelta);


  protected native function sv2cl_UpdateBodyDelta_CallStub();


  protected native event sv2cl_UpdateBodyDelta(int aBodyDelta);


  static function float sv_GetMoraleLevelBonus(int MoraleLevel) {
    return Class'Game_CharacterStats'.default.mMoraleLevelBonus[MoraleLevel + 5];//0000 : 04 1A 92 00 C0 91 1C 11 2C 05 16 12 20 C8 28 5F 01 05 00 2C 02 88 92 1C 11 
    //04 1A 92 00 C0 91 1C 11 2C 05 16 12 20 C8 28 5F 01 05 00 2C 02 88 92 1C 11 04 0B 47 
  }


  native function sv_ResetFreezeStats();


  native function sv_ResetFreezeAnimation();


  native function sv_ResetFreezeRotation();


  native function sv_ResetFreezeMovement();


  final native function bool AreStatsFrozen();


  final native function bool IsMovementLimited();


  final native function bool IsAnimationFrozen();


  final native function bool IsRotationFrozen();


  final native function bool IsMovementFrozen();


  native function FreezeStatsTimed(float aDuration);


  native function FreezeStats(bool aFreeze);


  native function FreezeAnimationTimed(float aDuration);


  protected native function sv2clrel_FreezeAnimation_CallStub();


  protected event sv2clrel_FreezeAnimation(bool aFreeze) {
    if (aFreeze) {                                                              //0000 : 07 1F 00 2D 00 58 51 1F 11 
      mFrozenFlags = mFrozenFlags | 4;                                          //0009 : 0F 01 68 52 1F 11 39 3D 9E 39 3A 01 68 52 1F 11 2C 04 16 
    } else {                                                                    //001C : 06 36 00 
      mFrozenFlags = mFrozenFlags & 255 - 4;                                    //001F : 0F 01 68 52 1F 11 39 3D 9C 39 3A 01 68 52 1F 11 93 2C FF 2C 04 16 16 
    }
    Outer.PauseAnim(aFreeze);                                                   //0036 : 19 01 00 E4 6B 0F 0C 00 00 1B 32 0D 00 00 2D 00 58 51 1F 11 16 
    //07 1F 00 2D 00 58 51 1F 11 0F 01 68 52 1F 11 39 3D 9E 39 3A 01 68 52 1F 11 2C 04 16 06 36 00 0F 
    //01 68 52 1F 11 39 3D 9C 39 3A 01 68 52 1F 11 93 2C FF 2C 04 16 16 19 01 00 E4 6B 0F 0C 00 00 1B 
    //32 0D 00 00 2D 00 58 51 1F 11 16 04 0B 47 
  }


  native function FreezeAnimation(bool aFreeze);


  native function FreezeRotationTimed(float aDuration);


  native function FreezeRotation(bool aFreeze);


  native function FreezeMovementTimed(float aDuration);


  native function FreezeMovement(bool aFreeze);


  native function sv_Resurrect();


  native function ResetAttributes();


  native function SetAttributes(int Body,int Mind,int Focus);


  native function UnsetStatsState(byte aNewState);


  native function SetStatsState(byte aNewState);


  native function ForceCalculationUpdate();


  native function IncreaseMagicResistanceDelta(float aDelta);


  native function IncreaseRangedResistanceDelta(float aDelta);


  native function IncreaseMeleeResistanceDelta(float aDelta);


  native function IncreaseHealthRegenerationDelta(float aDelta);


  native function IncreaseConcentrationDegenerationDelta(float aDelta);


  native function IncreaseConcentrationRegenerationDelta(float aDelta);


  native function IncreaseMoraleDegenerationDelta(float aDelta);


  native function IncreaseMoraleRegenerationDelta(float aDelta);


  native function IncreasePhysiqueDegenerationDelta(float aDelta);


  native function IncreasePhysiqueRegenerationDelta(float aDelta);


  native function IncreaseDamageBonusDelta(float aDelta);


  native function IncreaseMovementSpeedBonusDelta(float aDelta);


  native function IncreaseAttackSpeedBonusDelta(float aDelta);


  native function IncreaseConcentration(float aDelta);


  native function IncreaseMorale(float aDelta);


  native function IncreasePhysique(float aDelta);


  native function IncreasePePRankDelta(int aDelta);


  native function IncreaseMaxHealthDelta(int aDelta);


  native function IncreaseSoulAffinityDelta(float aDelta);


  native function IncreaseSpiritAffinityDelta(float aDelta);


  native function IncreaseRuneAffinityDelta(float aDelta);


  native function IncreaseFocusDelta(int aDelta);


  native function IncreaseMindDelta(int aDelta);


  native function IncreaseBodyDelta(int aDelta);


  native function IncreaseFrontDamageIncrease(float aDelta);


  native function IncreaseRearDamageIncrease(float aDelta);


  native function int GetAttributePoints(byte aAttribute);


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    Outer.PauseAnim(IsAnimationFrozen());                                       //0006 : 19 01 00 E4 6B 0F 0C 00 00 1B 32 0D 00 00 1C A0 97 1C 11 16 16 
    //1C E0 C4 19 11 16 19 01 00 E4 6B 0F 0C 00 00 1B 32 0D 00 00 1C A0 97 1C 11 16 16 04 0B 47 
  }



