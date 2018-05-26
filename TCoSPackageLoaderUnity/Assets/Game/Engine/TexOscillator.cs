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

namespace Engine
{
    
    
    [System.Serializable] public class TexOscillator : TexModifier
    {
        
        [FieldCategory(Category="TexOscillator")]
        public float UOscillationRate;
        
        [FieldCategory(Category="TexOscillator")]
        public float VOscillationRate;
        
        [FieldCategory(Category="TexOscillator")]
        public float UOscillationPhase;
        
        [FieldCategory(Category="TexOscillator")]
        public float VOscillationPhase;
        
        [FieldCategory(Category="TexOscillator")]
        public float UOscillationAmplitude;
        
        [FieldCategory(Category="TexOscillator")]
        public float VOscillationAmplitude;
        
        [FieldCategory(Category="TexOscillator")]
        public byte UOscillationType;
        
        [FieldCategory(Category="TexOscillator")]
        public byte VOscillationType;
        
        [FieldCategory(Category="TexOscillator")]
        public float UOffset;
        
        [FieldCategory(Category="TexOscillator")]
        public float VOffset;
        
        [IgnoreFieldExtraction()]
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
