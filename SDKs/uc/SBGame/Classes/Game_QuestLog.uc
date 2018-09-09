//==============================================================================
//  Game_QuestLog
//==============================================================================

class Game_QuestLog extends Base_Component within Game_Pawn
    native
    exportstructs
    dependsOn(Game_RadialMenuOptions,Quest_Type,Quest_Target)
  ;

  struct CompleteQuest {
      var export editinline Quest_Type quest;
      var int TimesFinished;

  };


  struct QuestTimerProgress {
      var export editinline Quest_Type quest;
      var int TargetIndex;
      var float Time;
      var int LastTime;
      var int GoalTime;

  };


  var array<int> targetProgress;
  var transient array<Quest_Type> Quests;
  var array<int> TargetActivation;
  var array<QuestTimerProgress> QuestTimers;
  var transient array<CompleteQuest> CompletedQuests;
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var private int mQuestItems;


  final native function sv_SetTargetProgress(export editinline Quest_Target aTarget,int aValue,Game_Pawn aTargetPawn);


  final native function sv_IncrementTargetProgress(export editinline Quest_Target aTarget,int aValue,Game_Pawn aTargetPawn);


  final native function bool sv_SetTargetAsCompleted(export editinline Quest_Target aTarget,Game_Pawn aTargetPawn);


  protected final native function SetTargetProgress(export editinline Quest_Type aQuest,int TargetNr,int aProgress);


  final native function sv_RemoveTargetTimer(export editinline Quest_Target aTarget);


  final native function bool RemoveQuest(export editinline Quest_Type aQuest);


  protected event cl_ActivateTarget(export editinline Quest_Target aTarget,bool aActivate) {
    //04 0B 47 
  }


  protected final native function sv_ActivateTarget(export editinline Quest_Target aTarget,bool aActivate);


  protected final native function ComputeTargetActivation(export editinline Quest_Type aQuest);


  protected final native function AddQuest(export editinline Quest_Type aQuest,array<int> aProgress);


  protected final native function AddCompletedQuest(export editinline Quest_Type aQuest);


  protected final native function AddFinishedQuest(export editinline Quest_Type aQuest,int aTimes);


  private native function UpdateQuestInventory(export editinline Quest_Type aQuest);


  final native function GetQuestInventory(export editinline Quest_Type quest,out array<QuestInventory> oInventory);


  event RadialMenuCollect(Object aObject,byte aMainOption,out array<byte> aSubOptions) {
    local int qi;
    local int ti;
    local int TargetIndex;
    ti = 0;                                                                     //0000 : 0F 00 B0 2F 2F 11 25 
    if (aMainOption == Class'Game_RadialMenuOptions'.0) {                       //0007 : 07 00 01 9A 39 3A 00 28 30 2F 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
      qi = 0;                                                                   //0020 : 0F 00 A0 30 2F 11 25 
      while (qi < Quests.Length) {                                              //0027 : 07 FD 00 96 00 A0 30 2F 11 37 01 18 31 2F 11 16 
        ti = 0;                                                                 //0037 : 0F 00 B0 2F 2F 11 25 
        while (ti < Quests[qi].Targets.Length) {                                //003E : 07 F3 00 96 00 B0 2F 2F 11 37 19 10 00 A0 30 2F 11 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 16 
          if (GetTargetActivation(Quests[qi],ti)
            && Quests[qi].Targets[ti].Active(targetProgress[TargetIndex])) {//005D : 07 E2 00 82 1B 93 0D 00 00 10 00 A0 30 2F 11 01 18 31 2F 11 00 B0 2F 2F 11 16 18 30 00 19 10 00 B0 2F 2F 11 19 10 00 A0 30 2F 11 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 11 00 04 1C 90 F3 2F 11 10 00 90 31 2F 11 01 08 32 2F 11 16 16 
            Quests[qi].Targets[ti].RadialMenuCollect(Outer,aObject,aMainOption,aSubOptions);//00AA : 19 10 00 B0 2F 2F 11 19 10 00 A0 30 2F 11 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 1A 00 00 1B 05 06 00 00 01 00 E4 6B 0F 00 38 2F 2F 11 00 28 30 2F 11 00 80 32 2F 11 16 
          }
          TargetIndex++;                                                        //00E2 : A5 00 90 31 2F 11 16 
          ti++;                                                                 //00E9 : A5 00 B0 2F 2F 11 16 
        }
        qi++;                                                                   //00F3 : A5 00 A0 30 2F 11 16 
      }
      goto jl0100;                                                              //00FD : 06 00 01 
    }
    //0F 00 B0 2F 2F 11 25 07 00 01 9A 39 3A 00 28 30 2F 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
    //0F 00 A0 30 2F 11 25 07 FD 00 96 00 A0 30 2F 11 37 01 18 31 2F 11 16 0F 00 B0 2F 2F 11 25 07 F3 
    //00 96 00 B0 2F 2F 11 37 19 10 00 A0 30 2F 11 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 16 07 E2 00 
    //82 1B 93 0D 00 00 10 00 A0 30 2F 11 01 18 31 2F 11 00 B0 2F 2F 11 16 18 30 00 19 10 00 B0 2F 2F 
    //11 19 10 00 A0 30 2F 11 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 11 00 04 1C 90 F3 2F 11 10 00 90 
    //31 2F 11 01 08 32 2F 11 16 16 19 10 00 B0 2F 2F 11 19 10 00 A0 30 2F 11 01 18 31 2F 11 05 00 00 
    //01 08 4D 2E 11 1A 00 00 1B 05 06 00 00 01 00 E4 6B 0F 00 38 2F 2F 11 00 28 30 2F 11 00 80 32 2F 
    //11 16 A5 00 90 31 2F 11 16 A5 00 B0 2F 2F 11 16 06 3E 00 A5 00 A0 30 2F 11 16 06 27 00 06 00 01 
    //04 0B 47 
  }


  final native function bool FinalTargetsCompleted(export editinline Quest_Condition aCondition);


  final native function int GetTimesQuestFinished(export editinline Quest_Type aQuest);


  final native function bool HasQuest(export editinline Quest_Type aQuest);


  final native function bool IsTargetVisible(export editinline Quest_Type aQuest,int TargetNr);


  final native function bool GetActivation(export editinline Quest_Target aTarget);


  native function bool GetTargetActivation(export editinline Quest_Type aQuest,int TargetNr);


  final native function int GetProgress(export editinline Quest_Target aTarget);


  final native function int GetTargetProgress(export editinline Quest_Type aQuest,int TargetNr);


  final native function bool FailedQuest(export editinline Quest_Type aQuest);


  final native function bool CompletedQuest(export editinline Quest_Type aQuest,optional bool aNearly);


  final native function bool sv_AbandonQuest(export editinline Quest_Type aQuest);


  final native function bool sv_FinishQuest(export editinline Quest_Type aQuest);


  final native function bool sv_AcceptQuest(export editinline Quest_Type aQuest);


  delegate OnFinishQuest(int aQuestID);


  delegate OnAcceptQuest(int aQuestID);


  delegate OnQuestItemsAdded(export editinline Item_Type aItemType,int aAmount);


  delegate OnQuestInventoryChange(export editinline Quest_Type aQuest);


  delegate OnTargetActivation(export editinline Quest_Type aQuest,int aTargetNr,bool aOn);


  delegate OnQuestProgress(export editinline Quest_Type aQuest,int aTargetNr,int aProgress);


  delegate OnRemoveQuest(export editinline Quest_Type aQuest);


  delegate OnAddCompletedQuest(export editinline Quest_Type aQuest);


  delegate OnAddQuest(export editinline Quest_Type aQuest);



