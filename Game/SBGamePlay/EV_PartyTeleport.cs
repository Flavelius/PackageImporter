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
    
    
    public class EV_PartyTeleport : Content_Event
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Action")]
        public int TargetWorld;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Action")]
        public string portalName = string.Empty;
        
        public EV_PartyTeleport()
        {
        }
    }
}
/*
function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
local Game_Team team;
team = aSubject.GetTeam();                                                  
if (team == None) {                                                         
TeleportPawn(aSubject,TargetWorld,False,portalName);                      
return;                                                                   
}
Game_PlayerController(aSubject.Controller).GroupingTeams.sv_StartPartyTravel(TargetWorld,portalName);
}
function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
return True;                                                                
}
*/
