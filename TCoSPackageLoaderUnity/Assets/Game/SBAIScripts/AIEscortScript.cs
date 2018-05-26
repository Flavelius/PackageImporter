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

namespace SBAIScripts
{
    
    
    [System.Serializable] public class AIEscortScript : AIEscortFramework
    {
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public AIPoint CurrentPoint;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public AIPoint NextPoint;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public bool Interrupted;
        
        [FieldCategory(Category="Escort")]
        public AIPoint StartPoint;
        
        public AIEscortScript()
        {
        }
    }
}
/*
protected event GetActorRelations(out array<ActorRelation> oRelations) {
local ActorRelation newRelation;
Super.GetActorRelations(oRelations);                                        
if (StartPoint != None) {                                                   
newRelation.mActor = StartPoint;                                          
newRelation.mDescription = "StartPoint";                                  
newRelation.mColour = static.RGB(255,255,255);                            
oRelations[oRelations.Length] = newRelation;                              
}
}
state Active {
protected function StartPatrol(AIPoint aPoint) {
local array<RegisteredAI> reg;
local int i;
Debug("Patrolling to" @ string(aPoint));                                
reg = GetRegister();                                                    
i = 0;                                                                  
while (i < reg.Length) {                                                
Patrol(reg[i].Controller,aPoint);                                     
i++;                                                                  
}
}
function bool OnStateChange(Game_AIController aGame_AIController,AIState aState) {
if (aState.IsA('AIIdleState')) {                                        
Interrupted = False;                                                  
StartPatrol(CurrentPoint);                                            
}
return OnStateChange(aGame_AIController,aState);                        
}
function bool OnStateComplete(Game_AIController aGame_AIController,AIState aState,byte aResult) {
if (!Interrupted) {                                                     
if (aState.IsA('AIPatrolState') && aResult == 5) {                    
CurrentPoint = aGame_AIController.mMovement.GetNextPatrolPoint();   
Interrupted = True;                                                 
Debug("Interrupted by end of state" @ string(aState));              
} else {                                                              
if (aState.IsA('AIStateMachine')) {                                 
Interrupted = True;                                               
Debug("Interrupted by end of machine"
@ string(aState));
}
}
}
return OnStateComplete(aGame_AIController,aState,aResult);              
}
function bool OnArrived(Game_AIController aGame_AIController,SBPoint aControlPoint,SBPoint aDestinationPoint,Vector aLocation) {
if (!Interrupted) {                                                     
if (aControlPoint == CurrentPoint) {                                  
Debug("Arrived at" @ string(aDestinationPoint));                    
CurrentPoint = PatrolPoint(aDestinationPoint);                      
if (CurrentPoint.GetControlDestination(Game_Pawn(aGame_AIController.Pawn)) == None) {
GotoState('Finished');                                            
goto jl0077;                                                      
}
} else {                                                              
Debug("Arrived at" @ string(aDestinationPoint)
@ "while going to"
@ string(CurrentPoint));
}
} else {                                                                
Debug("Arrived at" @ string(aDestinationPoint)
@ "while interrupted");
}
return OnArrived(aGame_AIController,aControlPoint,aDestinationPoint,aLocation);
}
function BeginState() {
if (StartPoint == None) {                                               
Failure("No start point defined");                                    
return;                                                               
}
if (GetRegisterSize() > 1) {                                            
Failure("Only works with one NPC!");                                  
return;                                                               
}
CurrentPoint = StartPoint;                                              
Debug("Starting to walk to" @ string(StartPoint));                      
Super.BeginState();                                                     
StartPatrol(StartPoint);                                                
}
}
*/
