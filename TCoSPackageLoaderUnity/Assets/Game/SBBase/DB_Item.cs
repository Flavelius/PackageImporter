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

namespace SBBase
{
    
    
    [System.Serializable] public class DB_Item : Base_DBObject
    {
        
        public int Id;
        
        public int ItemTypeID;
        
        public int CharacterID;
        
        public byte LocationType;
        
        public int LocationID;
        
        public int LocationSlot;
        
        public int StackSize;
        
        public byte Attuned;
        
        public byte Color1;
        
        public byte Color2;
        
        public int Serial;
        
        public DB_Item()
        {
        }
    }
}
