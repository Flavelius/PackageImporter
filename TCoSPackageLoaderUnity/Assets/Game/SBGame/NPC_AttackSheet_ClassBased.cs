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

namespace SBGame
{
    
    
    [System.Serializable] public class NPC_AttackSheet_ClassBased : NPC_AttackSheet
    {
        
        [FieldCategory(Category="HealPhase")]
        public float HealthFraction;
        
        [FieldCategory(Category="TargetPhase")]
        public float WarriorPriority;
        
        [FieldCategory(Category="TargetPhase")]
        public float CasterPriority;
        
        [FieldCategory(Category="TargetPhase")]
        public float RoguePriority;
        
        [FieldCategory(Category="TargetPhase")]
        public float FriendlyPriority;
        
        [FieldCategory(Category="TargetPhase")]
        public float SocialAggroPriority;
        
        [FieldCategory(Category="TargetPhase")]
        public float ThreatMultiplier;
        
        [FieldCategory(Category="TargetPhase")]
        public float LoveMultiplier;
        
        [FieldCategory(Category="TargetPhase")]
        public float LowLevelPriority;
        
        [FieldCategory(Category="TargetPhase")]
        public float HighLevelPriority;
        
        [FieldCategory(Category="TargetPhase")]
        public float PlayerPriority;
        
        [FieldCategory(Category="SkillPhase")]
        public float RangePriority;
        
        [FieldCategory(Category="SkillPhase")]
        public List<SkillWeight> WarriorPreferences = new List<SkillWeight>();
        
        [FieldCategory(Category="SkillPhase")]
        public List<SkillWeight> RoguePreferences = new List<SkillWeight>();
        
        [FieldCategory(Category="SkillPhase")]
        public List<SkillWeight> CasterPreferences = new List<SkillWeight>();
        
        public NPC_AttackSheet_ClassBased()
        {
        }
        
        [System.Serializable] public struct SkillWeight
        {
            
            public float Weight;
            
            public byte Tag;
        }
    }
}
