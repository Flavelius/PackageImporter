//==============================================================================
//  FSkill_Event_Target
//==============================================================================

class FSkill_Event_Target extends FSkill_Event_FX
    native
    abstract
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  var (Target) const int MaxTargets;
  var (Target) const byte TargetBase;
  var (Target) const byte TargetSelf;
  var (Target) const byte TargetEnemies;
  var (Target) const byte TargetFriendlies;
  var const byte TargetNeutrals;
  var (Target) const byte TargetSpirits;
  var (Target) const byte TargetBloodlinks;
  var (Target) const byte TargetPartyMembers;
  var (Target) const byte TargetGuildMembers;
  var (Target) const byte TargetPets;
  var (Target) const editinline array<NPC_Taxonomy> LimitToTaxonomy;
  var (Target) const bool TargetAttached;
  var private transient bool DidNeedRangeCheck;
  var private transient bool DidHasAutoTargets;
  var private transient bool ResultNeedRangeCheck;
  var private transient bool ResultHasAutoTargets;



