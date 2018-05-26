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
    
    
    [System.Serializable] public class AIScript_PT_Trial15_Siltor_Script : AI_Script
    {
        
        [FieldCategory(Category="AIScript_PT_Trial15_Siltor_Script")]
        public FSkill_Type mBlazingFireSkill;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public Game_AIController mSiltor;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public bool mAttemptingAttack;
        
        public AIScript_PT_Trial15_Siltor_Script()
        {
        }
    }
}
/*
function ApplyEffectDirectly() {
local Game_PlayerController lController;
foreach AllActors(Class'Game_PlayerController',lController) {               
ApplySkillEffects(mBlazingFireSkill,Game_Pawn(mSiltor.Pawn),Game_Pawn(lController.Pawn));
}
}
function AttemptAttack(Game_AIController aController) {
local Game_PlayerController lController;
if (CanPerformSkill(aController,mBlazingFireSkill)) {                       
foreach AllActors(Class'Game_PlayerController',lController) {             
PerformSkill(aController,mBlazingFireSkill,lController.Pawn.Location);  
goto jl004E;                                                            
}
goto jl0058;                                                              
}
ApplyEffectDirectly();                                                      
}
event bool OnWeaponSwapped(Game_AIController aController,byte aMode) {
if (mAttemptingAttack) {                                                    
AttemptAttack(mSiltor);                                                   
}
return Super.OnWeaponSwapped(aController,aMode);                            
}
event Trigger(Actor Other,Pawn EventInstigator) {
if (Other.IsA('AI_NPC_Chat')) {                                             
PauseAI(mSiltor);                                                         
mAttemptingAttack = True;                                                 
if (!HasWeaponDrawn(mSiltor)) {                                           
DrawWeapon(mSiltor,3);                                                  
} else {                                                                  
AttemptAttack(mSiltor);                                                 
}
} else {                                                                    
Debug("triggered! swap state");                                           
SwapStateMachine(mSiltor,new Class'AIKillingMachine');                    
}
}
function OnBegin(Game_AIController aController) {
Super.OnBegin(aController);                                                 
if (mSiltor == None) {                                                      
mSiltor = aController;                                                    
goto jl0024;                                                              
}
}
*/
