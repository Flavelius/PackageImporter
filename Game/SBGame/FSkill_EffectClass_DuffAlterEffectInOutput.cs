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
    
    
    public class FSkill_EffectClass_DuffAlterEffectInOutput : FSkill_EffectClass_Duff
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="AlterEffect")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte Mode;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="AlterEffect")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte AttackType;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="AlterEffect")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte MagicType;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="AlterEffect")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte EffectType;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="AlterEffect")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public FSkill_ValueSpecifier Value;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="AlterEffect")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte ValueMode;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Uses")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float UseInterval;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Uses")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int Uses;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Uses")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float IncreasePerUse;
        
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public FSkill_ValueSpecifier _AlterEffectValue;
        
        public FSkill_EffectClass_DuffAlterEffectInOutput()
        {
        }
    }
}
/*
final native function float AlterEffect(float aSkillValue,float aStoredValue,int aNumUses);
final native function bool MatchEffect(byte aMode,byte aAttackType,byte aMagicType,byte aEffectType);
*/
