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

namespace Engine
{
    
    
    [System.Serializable] public class AIScript : Keypoint
    {
        
        [FieldCategory(Category="AIScript")]
        [TypeProxyDefinition(TypeName="AIController")]
        public System.Type ControllerClass;
        
        public bool bNavigate;
        
        [FieldCategory(Category="AIScript")]
        public bool bLoggingEnabled;
        
        public AIMarker myMarker;
        
        public AIScript()
        {
        }
    }
}
/*
function TakeOver(Pawn P);
function Actor GetMoveTarget() {
if (myMarker != None) {                                                     
return myMarker;                                                          
}
return self;                                                                
}
function SpawnControllerFor(Pawn P) {
local AIController C;
if (ControllerClass == None) {                                              
if (P.ControllerClass == None) {                                          
return;                                                                 
}
C = Spawn(P.ControllerClass,,,P.Location,P.Rotation);                     
} else {                                                                    
C = Spawn(ControllerClass,,,P.Location,P.Rotation);                       
}
C.MyScript = self;                                                          
}
*/
