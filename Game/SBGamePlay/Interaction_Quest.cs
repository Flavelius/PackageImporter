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
    
    
    public class Interaction_Quest : Interaction_Component
    {
        
        public Interaction_Quest()
        {
        }
    }
}
/*
function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
local InteractiveLevelElement ile;
Super.SvOnStart(aOwner,aInstigator);                                        
if (aInstigator != None) {                                                  
if (!aReverse) {                                                          
ile = InteractiveLevelElement(aOwner);                                  
Game_Controller(aInstigator.Controller).sv_FireHook(Class'Content_Type'.3,ile,ile.GetActiveMenuOption(aInstigator));
}
}
}
*/
