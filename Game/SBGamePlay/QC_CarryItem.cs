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


namespace SBGamePlay
{
    
    
    public class QC_CarryItem : Quest_Condition
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="CarryItem")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public Content_Inventory Cargo;
        
        public QC_CarryItem()
        {
        }
    }
}
