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

namespace SBGamePlay
{
    
    
    [System.Serializable] public class Req_QuestFinished : Content_Requirement
    {
        
        [FieldCategory(Category="Requirement")]
        [FieldConst()]
        public Quest_Type RequiredQuest;
        
        [FieldCategory(Category="Requirement")]
        [FieldConst()]
        public int TimesFinished;
        
        public Req_QuestFinished()
        {
        }
    }
}
