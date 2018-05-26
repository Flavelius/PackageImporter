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
    
    
    [System.Serializable] public class AI_StateSwitch : AIRegistered
    {
        
        [FieldCategory(Category="AI_StateSwitch")]
        [TypeProxyDefinition(TypeName="AIStateMachine")]
        public System.Type TriggeredStateMachine;
        
        public AI_StateSwitch()
        {
        }
    }
}
/*
protected function OnRegisterEmptied() {
GotoState('UninitializedState');                                            
}
state SwappedState {
event UnTrigger(Actor Other,Pawn EventInstigator) {
GotoState('UnswappedState');                                            
}
protected function OnRegister(RegisteredAI aRegisteredAI) {
local RegisteredStateSwitch lRegistered;
lRegistered = RegisteredStateSwitch(aRegisteredAI);                     
lRegistered.OldStateMachine = SwapStateMachine(lRegistered.Controller,new TriggeredStateMachine);
Debug("Swapped"
@ CharName(lRegistered.Controller)
@ "from"
@ string(lRegistered.OldStateMachine)
@ "to"
@ string(TriggeredStateMachine));
}
function BeginState() {
local int i;
local array<RegisteredAI> Register;
local RegisteredStateSwitch lRegistered;
Register = GetRegister();                                               
Debug("Swapping" @ string(Register.Length)
@ "NPCs");         
i = 0;                                                                  
while (i < Register.Length) {                                           
lRegistered = RegisteredStateSwitch(Register[i]);                     
lRegistered.OldStateMachine = SwapStateMachine(lRegistered.Controller,new TriggeredStateMachine);
Debug("Swapped"
@ CharName(lRegistered.Controller)
@ "from"
@ string(lRegistered.OldStateMachine)
@ "to"
@ string(TriggeredStateMachine));
i++;                                                                  
}
if (NextScript != None && ChangeAllToNextScript()) {                    
GotoState('UninitializedState');                                      
}
}
}
state UnswappedState {
event Trigger(Actor Other,Pawn EventInstigator) {
GotoState('SwappedState');                                              
}
function BeginState() {
local int i;
local array<RegisteredAI> Register;
local RegisteredStateSwitch lRegistered;
Register = GetRegister();                                               
Debug("Unswapping" @ string(Register.Length)
@ "NPCs");       
i = 0;                                                                  
while (i < Register.Length) {                                           
lRegistered = RegisteredStateSwitch(Register[i]);                     
if (lRegistered.OldStateMachine != None) {                            
Debug("Swapping"
@ CharName(lRegistered.Controller)
@ "back to"
@ string(lRegistered.OldStateMachine));
SwapStateMachine(lRegistered.Controller,lRegistered.OldStateMachine);
}
i++;                                                                  
}
}
}
auto state UninitializedState {
protected function OnRegister(RegisteredAI aRegisteredAI) {
GotoState('UnswappedState');                                            
}
}
*/
