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
    
    
    public class EV_QuestProgress : Content_Event
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Action")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public Quest_Type quest;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Action")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int TargetNr;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Action")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int Progress;
        
        public EV_QuestProgress()
        {
        }
    }
}
/*
function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
local export editinline Quest_Target Target;
Target = quest.Targets[TargetNr];                                           
Game_PlayerPawn(aSubject).questLog.sv_SetTargetProgress(Target,Progress,aObject);
}
function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
local export editinline Quest_Target Target;
Target = quest.Targets[TargetNr];                                           
if (Target != None) {                                                       
if (HasQuest(aSubject,quest)) {                                           
return True;                                                            
}
}
return False;                                                               
}
*/
