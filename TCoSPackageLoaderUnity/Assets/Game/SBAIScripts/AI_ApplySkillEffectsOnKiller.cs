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
    
    
    [System.Serializable] public class AI_ApplySkillEffectsOnKiller : AIRegistered
    {
        
        [FieldCategory(Category="TriggerSkillEffects")]
        public List<FSkill_Type> Skills = new List<FSkill_Type>();
        
        [FieldCategory(Category="TriggerSkillEffects")]
        public bool OnlyLast;
        
        public AI_ApplySkillEffectsOnKiller()
        {
        }
    }
}
/*
function bool OnDamage(Game_AIController aController,Actor cause,float aDamage) {
local int i;
if (GetHealth(aController) - aDamage < 0.00000000
&& cause.IsA('Game_PlayerPawn')
&& (GetRegisterSize() == 1 || !OnlyLast)) {
i = 0;                                                                    
while (i < Skills.Length) {                                               
if (Skills[i] != None) {                                                
ApplySkillEffects(Skills[i],Game_Pawn(cause),Game_Pawn(cause));       
}
i++;                                                                    
}
}
return Super.OnDamage(aController,cause,aDamage);                           
}
*/
