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
    
    
    [System.Serializable] public class FSkill_Event_Duff_DuffEff : UObject
    {
        
        [FieldConst()]
        public FSkill_EffectClass_Duff effect;
        
        [FieldCategory(Category="DuffEff")]
        [FieldConst()]
        public float Interval;
        
        [FieldCategory(Category="DuffEff")]
        [FieldConst()]
        public float Delay;
        
        [FieldCategory(Category="DuffEff")]
        [FieldConst()]
        public int RepeatCount;
        
        [FieldConst()]
        public FSkill_Event_FX ExecuteFXEvent;
        
        public FSkill_Event_Duff_DuffEff()
        {
        }
    }
}
