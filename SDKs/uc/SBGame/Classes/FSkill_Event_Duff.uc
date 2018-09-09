//==============================================================================
//  FSkill_Event_Duff
//==============================================================================

class FSkill_Event_Duff extends FSkill_Event_FX
    native
    exportstructs
    dependsOn()
    Config(charstats)
  ;

  struct ConditionalEventRunData {
      var float EarliestStartTime;
      var int UsesLeft;

  };


  struct DirectEffectRunData {
      var float NextStartTime;
      var int ActualRepeatCount;

  };


  struct DuffEffectRunData {
      var float NextStartTime;
      var int ActualRepeatCount;
      var array<DuffRestoreData> History;

  };


  var const array<FSkill_Event_Duff_DirectEff> DirectEffects;
  var const array<FSkill_Event_Duff_DuffEff> DuffEffects;
  var const export editinline FSkill_Event Event;
  var (Events) const float EventInterval;
  var (Events) const int EventRepeatCount;
  var const array<FSkill_Event_Duff_CondEv> ConditionalEvents;
  var (Duff) const LocalizedString Name;
  var (Duff) const Texture Icon;
  var (Duff) const bool Visible;
  var (Duff) const LocalizedString Description;
  var (Duff) const float Duration;
  var (Duff) const byte StackType;
  var (Duff) const int StackCount;
  var (Duff) const byte Priority;
  var const bool RunUntilAbort;
  var transient array<DirectEffectRunData> DirectEffectTimers;
  var transient array<DuffEffectRunData> DuffEffectTimers;
  var transient array<ConditionalEventRunData> ConditionalEventTimers;
  var transient float EventTimer;
  var transient int EventActualRepeatCount;
  var transient bool DuffEventDone;
  var transient bool UninstallWhenDone;
  var transient array<Game_Pawn> Targets;


  final event string GetName() {
    if (Len(Name.Text) > 0) {                                                   //0000 : 07 20 00 97 7D 36 58 C6 6B 0F 01 B8 DC 25 11 16 25 16 
      return Name.Text;                                                         //0012 : 04 36 58 C6 6B 0F 01 B8 DC 25 11 
    } else {                                                                    //001D : 06 3B 00 
      return "<Unnamed Buff or Debuff>";                                        //0020 : 04 1F 3C 55 6E 6E 61 6D 65 64 20 42 75 66 66 20 6F 72 20 44 65 62 75 66 66 3E 00 
    }
    //07 20 00 97 7D 36 58 C6 6B 0F 01 B8 DC 25 11 16 25 16 04 36 58 C6 6B 0F 01 B8 DC 25 11 06 3B 00 
    //04 1F 3C 55 6E 6E 61 6D 65 64 20 42 75 66 66 20 6F 72 20 44 65 62 75 66 66 3E 00 04 0B 47 
  }


  native function FireCondition(array<Game_Pawn> aConditionTriggerPawn,Game_Pawn aOriginPawn,byte aCondition,optional byte aAttackType,optional byte aMagicType,optional byte aEffectType);



