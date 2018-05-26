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

namespace SBGame
{
    
    
    [System.Serializable] public class TriggeringLevelElement : InteractiveLevelElement
    {
        
        [FieldCategory(Category="TriggeringLevelElement")]
        public List<MenuOptionRelationStruct> Triggers = new List<MenuOptionRelationStruct>();
        
        public TriggeringLevelElement()
        {
        }
        
        [System.Serializable] public struct MenuOptionRelationStruct
        {
            
            public byte Option;
            
            public Actor TriggeredActor;
            
            public NameProperty EventName;
        }
    }
}
/*
function OnTargetDescription(Pawn anInstigator) {
}
function bool sv_OnRadialMenuOption(Game_Pawn anInstigator,int anOption) {
local int i;
if (!Super.sv_OnRadialMenuOption(anInstigator,anOption)) {                  
return False;                                                             
}
if (Triggers.Length == 0) {                                                 
TriggerEvent(Event,self,anInstigator);                                    
} else {                                                                    
i = 0;                                                                    
while (i < Triggers.Length) {                                             
if (Triggers[i].Option == anOption) {                                   
if (Triggers[i].TriggeredActor != None) {                             
Triggers[i].TriggeredActor.Trigger(self,anInstigator);              
} else {                                                              
if (Triggers[i].EventName != 'None') {                              
TriggerEvent(Triggers[i].EventName,self,anInstigator);            
goto jl00DC;                                                      
}
}
goto jl00DF;                                                          
}
++i;                                                                    
}
}
return True;                                                                
}
*/
