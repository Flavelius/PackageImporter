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


namespace Engine
{
    
    
    public class SceneSubtitles : Info
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneSubtitles")]
        public List<string> SubTitles = new List<string>();
        
        public int CurrentIndex;
        
        public SceneSubtitles()
        {
        }
        
        public enum ESST_Mode
        {
            
            ESST_SkipToNextLine,
        }
    }
}
/*
event Reset() {
Super.Reset();                                                              
CurrentIndex = -1;                                                          
}
function string GetSubTitles() {
if (CurrentIndex >= SubTitles.Length) {                                     
CurrentIndex = -1;                                                        
}
if (CurrentIndex >= 0) {                                                    
return SubTitles[CurrentIndex];                                           
}
return "";                                                                  
}
final native function ProcessEvent(byte Mode);
*/
