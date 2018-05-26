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
using Framework.Attributes;

namespace SBGamePlay
{
    
    
    [System.Serializable] public class EV_PartyProgress : Content_Event
    {
        
        [FieldCategory(Category="Action")]
        [FieldConst()]
        public Quest_Type quest;
        
        [FieldCategory(Category="Action")]
        [FieldConst()]
        public int ObjectiveNr;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public Game_Team TeamLock;
        
        public EV_PartyProgress()
        {
        }
    }
}
/*
function int FindObjective(export editinline Quest_Type aQuest) {
local int oi;
local int aI;
if (ObjectiveNr >= 0) {                                                     
return ObjectiveNr;                                                       
}
if (Outer.IsA('Quest_Target')) {                                            
return Quest_Target(Outer).GetIndex();                                    
} else {                                                                    
oi = 0;                                                                   
while (oi < aQuest.Targets.Length) {                                      
aI = 0;                                                                 
while (aI < aQuest.Targets[oi].CompleteEvents.Length) {                 
if (aQuest.Targets[oi].CompleteEvents[aI] == self) {                  
return oi;                                                          
}
aI++;                                                                 
}
oi++;                                                                   
}
}
return -1;                                                                  
}
function Quest_Type FindQuest() {
if (quest != None) {                                                        
return quest;                                                             
}
if (Outer.IsA('Quest_Target')) {                                            
return Quest_Target(Outer).GetQuest();                                    
} else {                                                                    
if (Outer.IsA('Conversation_Topic')) {                                    
return Quest_Type(Conversation_Topic(Outer).GetContext());              
} else {                                                                  
return Quest_Type(Outer);                                               
}
}
}
function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
local export editinline Quest_Type q;
local int objnr;
local export editinline Quest_Target Obj;
local Game_Team team;
local int ti;
local Game_PlayerPawn pm;
q = FindQuest();                                                            
objnr = FindObjective(q);                                                   
Obj = q.Targets[objnr];                                                     
team = aSubject.GetTeam();                                                  
if (team == None) {                                                         
return;                                                                   
}
if (TeamLock == team) {                                                     
return;                                                                   
} else {                                                                    
TeamLock = team;                                                          
}
ti = 0;                                                                     
while (ti < team.mMembers.Length) {                                         
pm = Game_PlayerPawn(team.mMembers[ti]);                                  
if (pm != None && pm != aSubject && HasTargetActive(pm,Obj)) {            
pm.questLog.sv_SetTargetAsCompleted(Obj,aObject);                       
}
ti++;                                                                     
}
TeamLock = None;                                                            
}
function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
local export editinline Quest_Type q;
local int objnr;
q = FindQuest();                                                            
if (q == None) {                                                            
return False;                                                             
}
objnr = FindObjective(q);                                                   
if (objnr < 0) {                                                            
return False;                                                             
}
if (objnr >= q.Targets.Length) {                                            
return False;                                                             
}
return True;                                                                
}
*/
