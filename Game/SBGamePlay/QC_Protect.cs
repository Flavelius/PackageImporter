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
    
    
    public class QC_Protect : Quest_Condition
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Condition")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public List<NPC_Type> Targets = new List<NPC_Type>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Condition")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int Slack;
        
        public QC_Protect()
        {
        }
    }
}
/*
event string GetActiveText(Game_ActiveTextItem aItem) {
if (aItem.Tag == "T") {                                                     
if (aItem.Ordinality <= Targets.Length) {                                 
return Targets[aItem.Ordinality].GetActiveText(aItem.SubItem);          
} else {                                                                  
return "?Target?";                                                      
}
} else {                                                                    
return Super.GetActiveText(aItem);                                        
}
}
protected function string GetDefaultDescription() {
return Class'StringReferences'.default.QC_ProtectText.Text;                 
}
*/
