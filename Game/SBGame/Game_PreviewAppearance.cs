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


namespace SBGame
{
    
    
    public class Game_PreviewAppearance : Game_EquippedAppearance
    {
        
        //public delegate<OnCheckPartValidity> @__OnCheckPartValidity__Delegate;
        
        //public delegate<OnCheckItemTypeValidity> @__OnCheckItemTypeValidity__Delegate;
        
        public Game_PreviewAppearance()
        {
        }
    }
}
/*
native function RemoveItem(Game_Item aItem);
native function ApplyItem(Game_Item aNewItem);
native function ApplyItems(array<Game_Item> aItems);
native function InitFromPawn(Game_Pawn aPawn);
event bool IsValidItem(byte aTestItemType) {
return OnCheckItemTypeValidity(aTestItemType);                              
}
event bool IsValidPart(export editinline Game_EquippedAppearance aAppearance,byte aPartType,int aPartValue) {
return OnCheckPartValidity(aAppearance,aPartType,aPartValue);               
}
delegate bool OnCheckItemTypeValidity(byte aTestItemType) {
return True;                                                                
}
delegate bool OnCheckPartValidity(export editinline Game_EquippedAppearance aAppearance,byte aPartType,int aPartValue) {
return aAppearance != None;                                                 
}
*/
