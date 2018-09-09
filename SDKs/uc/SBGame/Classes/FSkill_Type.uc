//==============================================================================
//  FSkill_Type
//==============================================================================

class FSkill_Type extends Content_Type
    native
    exportstructs
    dependsOn()
  ;

  struct FKeyframeEffects {
      var editconst name KeyFrame;
      var editconst float Time;
      var export editinline FSkill_EventGroup Group;

  };


  var transient int mhasskillpower_vtbl;
  var transient int mhasskillpower_data;
  var (Group) const string Group;
  var (Group) const editconst byte Category;
  var (Skill) const float CooldownTime;
  var (Skill) const float AttackSpeed;
  var (Skill) const byte AttackType;
  var (Skill) const byte MagicType;
  var (Skill) const byte LinkedAttribute;
  var (Skill) const byte SkillComboType;
  var (Skill) const byte ReticuleSet;
  var (Skillbook) const array<byte> UsableByClass;
  var (Skillbook) const editinline array<Item_Type> LegalSkillTokens;
  var (Skillbook) const bool LegalSkillTokensUpdate;
  var const int MinSkillTier;
  var (Description) const Texture Logo;
  var (Description) const LocalizedString Name;
  var (Description) const LocalizedString Description;
  var (Animation) const byte Animation;
  var (Animation) const byte Animation2;
  var (Animation) const int AnimationVariation;
  var (Animation) const byte RequiredWeapon;
  var (Animation) const float AnimationSpeed;
  var (Animation) const float AnimationTweenTime;
  var (Animation) const SkeletalMesh AnimationBaseMesh;
  var (Animation) const transient bool _ForceNotifyUpdate;
  var (Animation) const bool WeaponTracer;
  var (Animation) const bool FreezePawnMovement;
  var (Animation) const bool FreezePawnRotation;
  var (Animation) const float AnimationMovementForward;
  var (Animation) const float AnimationMovementLeft;
  var (Target) const bool PaintLocation;
  var (Target) const float PaintLocationMinDistance;
  var (Target) const float PaintLocationMaxDistance;
  var (aI) const byte SkillClassification;
  var (aI) const byte RequiredTarget;
  var (aI) const float MinDistance;
  var (aI) const float MaxDistance;
  var (aI) const float TargetDelay;
  var (aI) const float TargetCone;
  var (aI) const byte StackType;
  var (aI) const int StackCount;
  var (aI) const float LeetnessRating;
  var const editconstarray array<FKeyframeEffects> KeyFrames;
  var transient byte _LastAnimation;
  var transient byte _LastAnimation2;
  var transient int _LastAnimationVariation;
  var transient byte _LastRequiredWeapon;
  var transient float _ResultTargetMinRange;
  var transient float _ResultTargetMaxRange;
  var transient bool _RemovedUnwantedEffects;
  var transient bool _DeterminedHasTargetCount;
  var transient bool _ResultHasTargetCount;
  var transient bool _DeterminedTargetRanges;
  var const bool SkillRollsCombatBar;
  var const bool SkillRequiresEquippedWeapon;


  final native function bool IsComboNone();


  final native function bool IsComboNormal();


  final native function bool IsComboFinisher();


  final native function bool IsComboOpener();


  final native function float GetSkillCooldown(Game_Pawn aPawn);


  final native function float GetSkillDuration(Game_Pawn aPawn,int VarNr);


  final static native function FSkill_Type FindSkillByName(string aSkillName);


  final static native function GetAllSkills(out array<FSkill_Type> skillTypes);


  final native function bool SupportsClass(byte aClass);


  final native function float GetTargetMaxRange(Game_Pawn aPawn);


  final native function bool HasTargetCount();


  final native function bool IsInRange(float aDistance);


  final event string GetName() {
    if (Len(Name.Text) > 0) {                                                   //0000 : 07 20 00 97 7D 36 58 C6 6B 0F 01 30 A9 20 11 16 25 16 
      return Name.Text;                                                         //0012 : 04 36 58 C6 6B 0F 01 30 A9 20 11 
    } else {                                                                    //001D : 06 32 00 
      return "<Unnamed Skill>";                                                 //0020 : 04 1F 3C 55 6E 6E 61 6D 65 64 20 53 6B 69 6C 6C 3E 00 
    }
    //07 20 00 97 7D 36 58 C6 6B 0F 01 30 A9 20 11 16 25 16 04 36 58 C6 6B 0F 01 30 A9 20 11 06 32 00 
    //04 1F 3C 55 6E 6E 61 6D 65 64 20 53 6B 69 6C 6C 3E 00 04 0B 47 
  }



