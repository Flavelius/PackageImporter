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
    
    
    [System.Serializable] public class Game_ConsoleCommand : UObject
    {
        
        public string Command = string.Empty;
        
        public string Alias = string.Empty;
        
        public LocalizedString HelpText;
        
        public Game_ConsoleCommand()
        {
        }
    }
}
/*
native function ChatResponse(Game_Pawn aPawn,string aMessage);
function bool Execute(Game_Pawn aPawn,array<string> Params,Game_Pawn aTarget) {
return False;                                                               
}
event bool Attempt(Game_Pawn aPawn,array<string> aParams) {
if (aParams.Length > 0 && Matches(aParams[0])) {                            
return Execute(aPawn,aParams,Game_PlayerController(aPawn.Controller).Input.cl_GetTargetPawn());
}
return False;                                                               
}
protected function bool Matches(string aCommand) {
local string commandTag;
if (aCommand != "" && Left(aCommand,1) == "/") {                            
commandTag = Locs(Mid(aCommand,1));                                       
if (commandTag == Locs(Command)
|| Alias != "" && commandTag == Locs(Alias)) {
return True;                                                            
}
}
return False;                                                               
}
*/
