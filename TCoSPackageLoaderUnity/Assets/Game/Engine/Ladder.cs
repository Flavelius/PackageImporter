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

namespace Engine
{
    
    
    [System.Serializable] public class Ladder : SmallNavigationPoint
    {
        
        public LadderVolume MyLadder;
        
        public Ladder LadderList;
        
        public Ladder()
        {
        }
    }
}
/*
event bool SuggestMovePreparation(Pawn Other) {
if (MyLadder == None) {                                                     
return False;                                                             
}
if (!MyLadder.InUse(Other)) {                                               
MyLadder.PendingClimber = Other;                                          
return False;                                                             
}
Other.Controller.bPreparingMove = True;                                     
Other.Acceleration = vect(0.000000, 0.000000, 0.000000);                    
return True;                                                                
}
*/
