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
    
    
    public class Game_TargetProjector : DynamicProjector
    {
        
        public float currentRoll;
        
        public Rotator currentRotation;
        
        public float Height;
        
        public float targetScale;
        
        public float currentScale;
        
        public Game_TargetProjector()
        {
        }
    }
}
/*
function LoadTargetTexture() {
local Material Tex;
Tex = Material(static.DynamicLoadObject("SBGuiTX.Projectors.RangedCombiner01",Class'Combiner'));
if (Tex != None) {                                                          
ProjTexture = Tex;                                                        
goto jl0054;                                                              
}
}
function SetIsVisible(bool B) {
if (B) {                                                                    
MaxTraceDistance = 10000;                                                 
} else {                                                                    
MaxTraceDistance = 0;                                                     
}
}
function bool IsVisible() {
return MaxTraceDistance > 0;                                                
}
function ProjectOnToLocation(Vector projectionLocation,Vector Origin,float MaxDistance) {
targetScale = MaxDistance;                                                  
SetIsVisible(True);                                                         
ExecuteProjection(projectionLocation);                                      
}
function ExecuteProjection(Vector projectionLocation) {
local Vector NewLocation;
if (IsVisible()) {                                                          
if (ProjTexture == None) {                                                
LoadTargetTexture();                                                    
}
NewLocation = projectionLocation;                                         
NewLocation.Z += Height;                                                  
SetLocation(NewLocation);                                                 
currentRotation = rotator(projectionLocation - Location);                 
SetRotation(currentRotation);                                             
SetDrawScale(targetScale);                                                
}
}
*/
