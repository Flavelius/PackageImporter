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

namespace SBAIScripts
{
    
    
    [System.Serializable] public class AIScript_OnDeath_Counter : AIScript_Counter
    {
        
        [FieldCategory(Category="Counter")]
        public NPC_Type LimitToNPCType;
        
        public AIScript_OnDeath_Counter()
        {
        }
    }
}
/*
function bool OnDeath(Game_AIController aController,Actor aCollaborator) {
if (Game_NPCPawn(aController.Pawn).NPCType == LimitToNPCType
|| LimitToNPCType == None) {
DoCount();                                                                
}
return Super.OnDeath(aController,aCollaborator);                            
}
*/
