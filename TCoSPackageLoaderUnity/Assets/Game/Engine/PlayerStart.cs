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
    
    
    [System.Serializable] public class PlayerStart : SmallNavigationPoint
    {
        
        [FieldCategory(Category="PlayerStart")]
        public byte TeamNumber;
        
        [FieldCategory(Category="PlayerStart")]
        public bool bSinglePlayerStart;
        
        [FieldCategory(Category="PlayerStart")]
        public bool bCoopStart;
        
        [FieldCategory(Category="PlayerStart")]
        public bool bEnabled;
        
        [FieldCategory(Category="PlayerStart")]
        public bool bPrimaryStart;
        
        [FieldCategory(Category="PlayerStart")]
        public string NavigationTag = string.Empty;
        
        public PlayerStart()
        {
        }
    }
}
