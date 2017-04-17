﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Dieser Code wurde von einem Tool generiert.
//     Laufzeitversion:4.0.30319.42000
//
//     Änderungen an dieser Datei können falsches Verhalten verursachen und gehen verloren, wenn
//     der Code erneut generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

using Engine;
using SBAI;
using SBAIScripts;
using SBBase;
using SBGame;
using SBGamePlay;
using SBMiniGames;
using System;
using System.Collections;
using System.Collections.Generic;
using TCosReborn.Framework.Common;


namespace SBGame
{
    
    
    public class Game_QuestLog : Base_Component
    {
        
        public List<int> targetProgress = new List<int>();
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public List<Quest_Type> Quests = new List<Quest_Type>();
        
        public List<int> TargetActivation = new List<int>();
        
        public List<QuestTimerProgress> QuestTimers = new List<QuestTimerProgress>();
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public List<CompleteQuest> CompletedQuests = new List<CompleteQuest>();
        
        //public delegate<OnAddQuest> @__OnAddQuest__Delegate;
        
        //public delegate<OnAddCompletedQuest> @__OnAddCompletedQuest__Delegate;
        
        //public delegate<OnRemoveQuest> @__OnRemoveQuest__Delegate;
        
        //public delegate<OnQuestProgress> @__OnQuestProgress__Delegate;
        
        //public delegate<OnTargetActivation> @__OnTargetActivation__Delegate;
        
        //public delegate<OnQuestInventoryChange> @__OnQuestInventoryChange__Delegate;
        
        //public delegate<OnQuestItemsAdded> @__OnQuestItemsAdded__Delegate;
        
        //public delegate<OnAcceptQuest> @__OnAcceptQuest__Delegate;
        
        //public delegate<OnFinishQuest> @__OnFinishQuest__Delegate;
        
        private int mQuestItems;
        
        public Game_QuestLog()
        {
        }
        
        public struct CompleteQuest
        {
            
            public Quest_Type quest;
            
            public int TimesFinished;
        }
        
        public struct QuestTimerProgress
        {
            
            public Quest_Type quest;
            
            public int TargetIndex;
            
            public float Time;
            
            public int LastTime;
            
            public int GoalTime;
        }
    }
}
/*
final native function sv_SetTargetProgress(export editinline Quest_Target aTarget,int aValue,Game_Pawn aTargetPawn);
final native function sv_IncrementTargetProgress(export editinline Quest_Target aTarget,int aValue,Game_Pawn aTargetPawn);
final native function bool sv_SetTargetAsCompleted(export editinline Quest_Target aTarget,Game_Pawn aTargetPawn);
protected final native function SetTargetProgress(export editinline Quest_Type aQuest,int TargetNr,int aProgress);
final native function sv_RemoveTargetTimer(export editinline Quest_Target aTarget);
final native function bool RemoveQuest(export editinline Quest_Type aQuest);
protected event cl_ActivateTarget(export editinline Quest_Target aTarget,bool aActivate) {
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
ti = 0;                                                                     
if (aMainOption == Class'Game_RadialMenuOptions'.0) {                       
qi = 0;                                                                   
while (qi < Quests.Length) {                                              
ti = 0;                                                                 
while (ti < Quests[qi].Targets.Length) {                                
if (GetTargetActivation(Quests[qi],ti)
&& Quests[qi].Targets[ti].Active(targetProgress[TargetIndex])) {
Quests[qi].Targets[ti].RadialMenuCollect(Outer,aObject,aMainOption,aSubOptions);
}
TargetIndex++;                                                        
ti++;                                                                 
}
qi++;                                                                   
}
goto jl0100;                                                              
}
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
*/
