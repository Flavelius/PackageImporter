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


namespace SBAIScripts
{
    
    
    public class AIScript_ConditionalFreeze : AIRegistered
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public List<Content_Requirement> Requirements = new List<Content_Requirement>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public bool FreezeMovement;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public bool FreezeRotation;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public bool FreezeAnimation;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public bool FreezeStats;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public bool InvulnerableWhileFrozen;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public bool StartFrozen;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public List<FSkill_EffectClass_AudioVisual> FreezeEffects = new List<FSkill_EffectClass_AudioVisual>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public List<FSkill_EffectClass_AudioVisual> ThawEffects = new List<FSkill_EffectClass_AudioVisual>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ConditionalFreeze")]
        public bool ThawEffectsArePermanent;
        
        public AIScript_ConditionalFreeze()
        {
        }
    }
}
/*
function bool CheckRequirements(Game_AIController aController) {
local int reqI;
if (!aController.Pawn.IsA('Game_Pawn')) {                                   
return False;                                                             
}
if (Game_Pawn(aController.Pawn).SBRole == 1) {                              
reqI = 0;                                                                 
while (reqI < Requirements.Length) {                                      
if (Requirements[reqI] != None
&& !Requirements[reqI].CheckPawn(Game_Pawn(aController.Pawn))) {
return False;                                                         
}
reqI++;                                                                 
}
}
return True;                                                                
}
state FrozenState {
event UnTrigger(Actor Other,Pawn EventInstigator) {
GotoState('ThawedState');                                               
}
function ThawNPC(RegisteredFrozen aRegistered) {
local int i;
Debug(" *** thawing"
@ string(aRegistered.Controller.Pawn)
@ "***");
SetFreeze(Game_Pawn(aRegistered.Controller.Pawn),False,FreezeMovement,FreezeRotation,FreezeAnimation,FreezeStats);
if (InvulnerableWhileFrozen) {                                          
SetInvulnerable(aRegistered.Controller,aRegistered.WasInVulnerable);  
}
i = 0;                                                                  
while (i < ThawEffects.Length) {                                        
if (ThawEffectsArePermanent) {                                        
ApplyAudioVisualEffect(Game_Pawn(aRegistered.Controller.Pawn),ThawEffects[i]);
} else {                                                              
ApplyOneShotAudioVisualEffect(Game_Pawn(aRegistered.Controller.Pawn),ThawEffects[i]);
}
i++;                                                                  
}
}
function FreezeNPC(RegisteredFrozen aRegistered) {
local int i;
Debug(" *** freezing"
@ string(aRegistered.Controller.Pawn)
@ "***");
aRegistered.IsFrozen = True;                                            
SetFreeze(Game_Pawn(aRegistered.Controller.Pawn),True,FreezeMovement,FreezeRotation,FreezeAnimation,FreezeStats);
if (InvulnerableWhileFrozen) {                                          
aRegistered.WasInVulnerable = GetInvulnerable(aRegistered.Controller);
SetInvulnerable(aRegistered.Controller,True);                         
}
i = 0;                                                                  
while (i < FreezeEffects.Length) {                                      
ApplyAudioVisualEffect(Game_Pawn(aRegistered.Controller.Pawn),FreezeEffects[i]);
i++;                                                                  
}
}
function EndState() {
local int i;
local array<RegisteredAI> Register;
local RegisteredFrozen lRegistered;
Register = GetRegister();                                               
RemoveAudioVisualEffects(None);                                         
i = 0;                                                                  
while (i < Register.Length) {                                           
lRegistered = RegisteredFrozen(Register[i]);                          
if (lRegistered.IsFrozen) {                                           
ThawNPC(lRegistered);                                               
ChangeToNextScript(lRegistered.Controller);                         
}
i++;                                                                  
}
}
protected function OnRegister(RegisteredAI aRegisteredAI) {
if (CheckRequirements(aRegisteredAI.Controller)) {                      
FreezeNPC(RegisteredFrozen(aRegisteredAI));                           
}
}
function BeginState() {
local int i;
local array<RegisteredAI> Register;
local RegisteredFrozen lRegistered;
Register = GetRegister();                                               
i = 0;                                                                  
while (i < Register.Length) {                                           
lRegistered = RegisteredFrozen(Register[i]);                          
if (CheckRequirements(lRegistered.Controller)) {                      
FreezeNPC(lRegistered);                                             
}
i++;                                                                  
}
}
}
auto state ThawedState {
event Trigger(Actor Other,Pawn EventInstigator) {
GotoState('FrozenState');                                               
}
event OnBegin(Game_AIController aController) {
if (StartFrozen) {                                                      
GotoState('FrozenState');                                             
}
OnBegin(aController);                                                   
}
}
*/
