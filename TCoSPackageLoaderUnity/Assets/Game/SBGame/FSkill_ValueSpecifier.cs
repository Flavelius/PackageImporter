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
    
    
    [System.Serializable] public class FSkill_ValueSpecifier : Content_Type
    {
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public bool AddConstant;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public bool AddComboLength;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public bool AddCharStatRelated;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public bool AddTargetCountRelated;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public bool DivideValue;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public bool IgnoreFameModifier;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public float AbsoluteMinimum;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public float AbsoluteMaximum;
        
        [FieldCategory(Category="Base")]
        [FieldConst()]
        public float LinkedAttributeModifier;
        
        [FieldCategory(Category="Constant")]
        [FieldConst()]
        public float ConstantMinimum;
        
        [FieldCategory(Category="Constant")]
        [FieldConst()]
        public float ConstantMaximum;
        
        [FieldCategory(Category="ComboLength")]
        [FieldConst()]
        public float ComboLengthMinimum;
        
        [FieldCategory(Category="ComboLength")]
        [FieldConst()]
        public float ComboLengthMaximum;
        
        [FieldCategory(Category="CharRelated")]
        [FieldConst()]
        public byte CharacterStatistic;
        
        [FieldCategory(Category="CharRelated")]
        [FieldConst()]
        public byte Source;
        
        [FieldCategory(Category="CharRelated")]
        [FieldConst()]
        public float CharStatMinimumMultiplier;
        
        [FieldCategory(Category="CharRelated")]
        [FieldConst()]
        public float CharStatMaximumMultiplier;
        
        [FieldCategory(Category="TargetCountRelated")]
        [FieldConst()]
        public float TargetCountMinimumMultiplier;
        
        [FieldCategory(Category="TargetCountRelated")]
        [FieldConst()]
        public float TargetCountMaximumMultiplier;
        
        [FieldCategory(Category="TargetType")]
        [FieldConst()]
        public bool ApplyIncrease;
        
        [FieldCategory(Category="TargetType")]
        [FieldConst()]
        public float SpiritIncrease;
        
        [FieldCategory(Category="TargetType")]
        [FieldConst()]
        public float PlayerIncrease;
        
        [FieldCategory(Category="TargetType")]
        [FieldConst()]
        public float NPCIncrease;
        
        [FieldCategory(Category="TargetType")]
        [FieldConst()]
        public List<TaxonomyIncrease> TaxonomyIncreases = new List<TaxonomyIncrease>();
        
        public FSkill_ValueSpecifier()
        {
        }
        
        [System.Serializable] public struct TaxonomyIncrease
        {
            
            public NPC_Taxonomy Node;
            
            public float Increase;
        }
    }
}
