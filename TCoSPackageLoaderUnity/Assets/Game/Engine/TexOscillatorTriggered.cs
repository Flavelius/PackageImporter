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
    
    
    [System.Serializable] public class TexOscillatorTriggered : TexOscillator
    {
        
        [FieldCategory(Category="TexOscillatorTriggered")]
        public byte RetriggerAction;
        
        [FieldCategory(Category="TexOscillatorTriggered")]
        public float StopAfterPeriod;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public float TriggeredTime;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public bool Reverse;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public bool Triggered;
        
        public TexOscillatorTriggered()
        {
        }
        
        public enum ERetriggerAction
        {
            
            RTA_Reverse ,
            
            RTA_Reset ,
            
            RTA_Ignore ,
            
            RTA_Retrigger,
        }
    }
}
/*
function Reset() {
Triggered = False;                                                          
TriggeredTime = -1.00000000;                                                
Reverse = False;                                                            
}
function Trigger(Actor Other,Actor EventInstigator) {
if (Triggered) {                                                            
switch (RetriggerAction) {                                                
case 0 :                                                                
Triggered = False;                                                    
TriggeredTime = Other.Level.TimeSeconds;                              
Reverse = True;                                                       
break;                                                                
case 1 :                                                                
Triggered = False;                                                    
TriggeredTime = -1.00000000;                                          
Reverse = True;                                                       
break;                                                                
default:                                                                
}
} else {                                                                    
if (RetriggerAction != 3) {                                               
Triggered = True;                                                       
}
TriggeredTime = Other.Level.TimeSeconds;                                  
Reverse = False;                                                          
}
}
*/
