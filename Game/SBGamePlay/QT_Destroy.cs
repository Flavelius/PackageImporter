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
    
    
    public class QT_Destroy : Quest_Target
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Destroy")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public NPC_Type Target;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Destroy")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int Amount;
        
        public QT_Destroy()
        {
        }
    }
}
/*
event string GetActiveText(Game_ActiveTextItem aItem) {
if (aItem.Tag == "T") {                                                     
if (Target != None) {                                                     
return Target.GetActiveText(aItem.SubItem);                             
} else {                                                                  
return "?Target?";                                                      
}
} else {                                                                    
if (aItem.Tag == "Q") {                                                   
return "" @ string(Amount);                                             
} else {                                                                  
return Super.GetActiveText(aItem);                                      
}
}
}
protected function AppendProgressText(out string aDescription,int aProgress) {
if (Amount > 1) {                                                           
}
}
protected function string GetDefaultDescription() {
return Class'StringReferences'.default.QT_DestroyText.Text;                 
}
*/
