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

namespace SBGame
{
    
    
    [System.Serializable] public class Login_PlayerController : Base_Controller
    {
        
        public List<UniverseInfo> mUniverses = new List<UniverseInfo>();
        
        //public delegate<HandleLoginResult> @__HandleLoginResult__Delegate;
        
        //public delegate<HandleUniverseSelectionResult> @__HandleUniverseSelectionResult__Delegate;
        
        public Login_PlayerController()
        {
        }
        
        [System.Serializable] public struct UniverseInfo
        {
            
            public int Id;
            
            public string Name;
            
            public string Language;
            
            public string Type;
            
            public string Population;
        }
    }
}
/*
delegate HandleUniverseSelectionResult(bool aSuccess,int aResult);
delegate HandleLoginResult(bool aSuccess,int aResult);
*/
