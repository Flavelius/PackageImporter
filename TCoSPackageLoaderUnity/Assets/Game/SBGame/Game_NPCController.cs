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
    
    
    [System.Serializable] public class Game_NPCController : Game_Controller
    {
        
        public NPC_Type NPCType;
        
        public bool bDespawned;
        
        public bool BreakAI;
        
        public Game_NPCController()
        {
        }
    }
}
/*
function sv_InitInternal();
function Game_NPCPawn GetNPCPawn() {
return Game_NPCPawn(Pawn);                                                  
}
function LootTable sv_GetLootTable() {
return None;                                                                
}
final native function sv_Despawn();
native function sv_OnSpawn(int aFameLevel,int aPePRank,export editinline NPC_Taxonomy aFaction);
*/
