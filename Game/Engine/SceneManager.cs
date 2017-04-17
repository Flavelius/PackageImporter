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
    
    
    public class SceneManager : Info
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public List<MatAction> Actions = new List<MatAction>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        [TCosReborn.Framework.Attributes.FieldConfigAttribute()]
        public byte Affect;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public Actor AffectedActor;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public bool bLooping;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public bool bCinematicView;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public NameProperty PlayerScriptTag;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public NameProperty NextSceneTag;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public NameProperty EventStart;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public NameProperty EventEnd;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SceneManager")]
        public bool bHideHUD;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float PctSceneComplete;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public MatAction CurrentAction;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float SceneSpeed;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float TotalSceneTime;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Actor Viewer;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Pawn OldPawn;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public bool bIsRunning;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public bool bIsSceneStarted;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float CurrentTime;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public List<Vector> SampleLocations = new List<Vector>();
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public List<MatSubAction> SubActions = new List<MatSubAction>();
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Orientation CamOrientation;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Orientation PrevOrientation;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Interpolator RotInterpolator;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Vector CameraShake;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Vector DollyOffset;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public bool bAbortCinematic;
        
        public float OffsetStartFactor;
        
        public SceneManager()
        {
        }
        
        public struct Interpolator
        {
            
            public int bDone;
            
            public float _value;
            
            public float _remainingTime;
            
            public float _totalTime;
            
            public float _speed;
            
            public float _acceleration;
        }
        
        public struct Orientation
        {
            
            public byte CamOrientation;
            
            public Actor LookAt;
            
            public Actor DollyWith;
            
            public float EaseIntime;
            
            public int bReversePitch;
            
            public int bReverseYaw;
            
            public int bReverseRoll;
            
            public int MA;
            
            public float PctInStart;
            
            public float PctInEnd;
            
            public float PctInDuration;
            
            public Rotator StartingRotation;
        }
        
        public enum EAffect
        {
            
            AFFECT_ViewportCamera ,
            
            AFFECT_Actor,
        }
    }
}
/*
event cl_OnTick(float delta) {
Super.cl_OnTick(delta);                                                     
TickScene(delta);                                                           
}
event SceneEnded() {
bIsSceneStarted = False;                                                    
if (Affect == 0) {                                                          
if (PlayerController(Viewer) != None) {                                   
PlayerController(Viewer).Pawn = OldPawn;                                
PlayerController(Viewer).SetViewTarget(OldPawn);                        
PlayerController(Viewer).bInterpolating = False;                        
PlayerController(Viewer).myHUD.bHideHUD = False;                        
PlayerController(Viewer).SetViewingCinematic(False);                    
}
}
Viewer.FinishedInterpolation();                                             
Enable('Trigger');                                                          
TriggerEvent(EventEnd,self,None);                                           
}
event SceneStarted() {
local GameEngine Engine;
local PlayerController Controller;
Viewer = None;                                                              
Engine = Class'Actor'.static.GetGameEngine();                               
if (Affect == 1) {                                                          
Viewer = AffectedActor;                                                   
} else {                                                                    
if (Engine != None) {                                                     
Controller = Engine.GetPlayerController();                              
if (Controller != None) {                                               
Viewer = Controller;                                                  
OldPawn = Controller.Pawn;                                            
if (OldPawn != None) {                                                
OldPawn.Velocity = vect(0.000000, 0.000000, 0.000000);              
OldPawn.Acceleration = vect(0.000000, 0.000000, 0.000000);          
}
Controller.SetViewTarget(Viewer);                                     
Controller.SetViewingCinematic(True);                                 
Controller.StartInterpolation();                                      
Controller.myHUD.bHideHUD = bHideHUD;                                 
CurrentTime = OffsetStartFactor * TotalSceneTime;                     
} else {                                                                
bIsRunning = False;                                                   
bIsSceneStarted = False;                                              
}
}
}
Viewer.StartInterpolation();                                                
TriggerEvent(EventStart,self,None);                                         
}
function Trigger(Actor Other,Pawn EventInstigator) {
bIsRunning = True;                                                          
bIsSceneStarted = False;                                                    
Disable('Trigger');                                                         
}
simulated event Destroyed() {
}
simulated function BeginPlay() {
Super.BeginPlay();                                                          
if (Affect == 1 && AffectedActor == None) {                                 
Log("SceneManager : Affected actor is NULL!");                            
}
TotalSceneTime = GetTotalSceneTime();                                       
bIsRunning = False;                                                         
bIsSceneStarted = False;                                                    
}
function SceneStart() {
bIsRunning = True;                                                          
bIsSceneStarted = False;                                                    
}
native function TickScene(float delta);
native function AbortScene();
native function float GetTotalSceneTime();
*/
