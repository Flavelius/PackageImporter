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
    
    
    [System.Serializable] public class NS_Fixed : NPC_StatTable
    {
        
        [FieldCategory(Category="Stats")]
        public int Body;
        
        [FieldCategory(Category="Stats")]
        public int Mind;
        
        [FieldCategory(Category="Stats")]
        public int Focus;
        
        [FieldCategory(Category="Stats")]
        public int Hitpoints;
        
        public NS_Fixed()
        {
        }
    }
}
/*
function int GetFocus(int aLevel) {
return Focus;                                                               
}
function int GetMind(int aLevel) {
return Mind;                                                                
}
function int GetBody(int aLevel) {
return Body;                                                                
}
function int GetHitpointsPerLevel(int aLevel) {
return 0;                                                                   
}
function int GetBaseHitpoints(int aLevel) {
return Hitpoints;                                                           
}
*/
