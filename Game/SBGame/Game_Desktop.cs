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
    
    
    public class Game_Desktop : GUI_BaseDesktop
    {
        
        public const int CT_System = 7;
        
        public const int CT_Combat = 6;
        
        public const int CT_Private = 5;
        
        public const int CT_Guild = 4;
        
        public const int CT_Team = 3;
        
        public const int CT_Trade = 2;
        
        public const int CT_Zone = 1;
        
        public const int CT_Local = 0;
        
        public const int CT_Invalid = -1;
        
        public Game_Desktop()
        {
        }
    }
}
/*
event OnRankUp(int newRank);
event OnLevelUp(int newLevel);
event AddScreenMessage(string aMessage,optional Color aColour);
event AddMessage(string aSenderName,string aMessage,int aChannel);
event ProcessMessage(string aMessage,int aChannel);
*/
