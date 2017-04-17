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


namespace Engine
{
    
    
    public class TexOscillator : TexModifier
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float UOscillationRate;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float VOscillationRate;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float UOscillationPhase;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float VOscillationPhase;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float UOscillationAmplitude;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float VOscillationAmplitude;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public byte UOscillationType;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public byte VOscillationType;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float UOffset;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TexOscillator")]
        public float VOffset;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        public Matrix M;
        
        public float LastSu;
        
        public float LastSv;
        
        public float CurrentUJitter;
        
        public float CurrentVJitter;
        
        public TexOscillator()
        {
        }
        
        public enum ETexOscillationType
        {
            
            OT_Pan ,
            
            OT_Stretch ,
            
            OT_StretchRepeat ,
            
            OT_Jitter,
        }
    }
}
