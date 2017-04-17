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
    
    
    public class FSkill_ValueSpecifier : Content_Type
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public bool AddConstant;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public bool AddComboLength;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public bool AddCharStatRelated;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public bool AddTargetCountRelated;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public bool DivideValue;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public bool IgnoreFameModifier;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float AbsoluteMinimum;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float AbsoluteMaximum;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Base")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float LinkedAttributeModifier;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Constant")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float ConstantMinimum;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Constant")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float ConstantMaximum;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ComboLength")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float ComboLengthMinimum;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="ComboLength")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float ComboLengthMaximum;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="CharRelated")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte CharacterStatistic;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="CharRelated")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte Source;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="CharRelated")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float CharStatMinimumMultiplier;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="CharRelated")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float CharStatMaximumMultiplier;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TargetCountRelated")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float TargetCountMinimumMultiplier;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TargetCountRelated")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float TargetCountMaximumMultiplier;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TargetType")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public bool ApplyIncrease;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TargetType")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float SpiritIncrease;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TargetType")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float PlayerIncrease;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TargetType")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float NPCIncrease;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TargetType")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public List<TaxonomyIncrease> TaxonomyIncreases = new List<TaxonomyIncrease>();
        
        public FSkill_ValueSpecifier()
        {
        }
        
        public struct TaxonomyIncrease
        {
            
            public NPC_Taxonomy Node;
            
            public float Increase;
        }
    }
}
