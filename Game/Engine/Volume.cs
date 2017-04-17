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
    
    
    public class Volume : Brush
    {
        
        public Actor AssociatedActor;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Volume")]
        public NameProperty AssociatedActorTag;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Volume")]
        public int LocationPriority;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Volume")]
        public string LocationName = string.Empty;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Volume")]
        public DecorationList DecoList;
        
        public Volume()
        {
        }
    }
}
/*
function DisplayDebug(Canvas Canvas,out float YL,out float YPos) {
Super.DisplayDebug(Canvas,YL,YPos);                                         
Canvas.DrawText("AssociatedActor " $ string(AssociatedActor),False);        
YPos += YL;                                                                 
Canvas.SetPos(4.00000000,YPos);                                             
}
function PostBeginPlay() {
Super.PostBeginPlay();                                                      
if (AssociatedActorTag != 'None') {                                         
foreach AllActors(Class'Actor',AssociatedActor,AssociatedActorTag) {      
goto jl002E;                                                            
}
}
if (AssociatedActor != None) {                                              
GotoState('AssociatedTouch');                                             
InitialState = GetStateName();                                            
}
}
native function bool Encompasses(Actor Other);
state AssociatedTouch {
function BeginState() {
local Actor A;
foreach TouchingActors(Class'Actor',A) {                                
Touch(A);                                                             
}
}
event UnTouch(Actor Other) {
AssociatedActor.UnTouch(Other);                                         
}
event Touch(Actor Other) {
if (AssociatedActor != self) {                                          
AssociatedActor.Touch(Other);                                         
goto jl0022;                                                          
}
}
}
*/
