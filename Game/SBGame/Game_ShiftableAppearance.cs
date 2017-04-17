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
    
    
    public class Game_ShiftableAppearance : Base_Component
    {
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        private PhysicState mSavedPhysics;
        
        public int mShiftedNPCTypeID;
        
        public NPC_Type mShiftedNPCType;
        
        public Game_Appearance mShiftedAppearance;
        
        public List<Game_AppearanceListener> mAppearanceListeners = new List<Game_AppearanceListener>();
        
        public bool mInvalidatedDressup;
        
        public Game_ShiftableAppearance()
        {
        }
        
        public struct PhysicState
        {
            
            public byte Physics;
            
            public float GroundSpeed;
            
            public float BaseMovementSpeed;
            
            public float[] MovementSpeedMultiplier;
            
            public float AirSpeed;
            
            public float MinFlySpeed;
            
            public float AirControl;
            
            public bool CanStrafe;
            
            public bool CanRest;
            
            public bool CanWalkBackwards;
            
            public float WalkingPct;
            
            public float WaterSpeed;
            
            public float JumpSpeed;
            
            public float LadderSpeed;
            
            public float AccelRate;
            
            public float TurnSpeed;
            
            public bool bAlignToFloor;
            
            public bool bAlignToFloorRoll;
            
            public bool bAlignToFloorPitch;
            
            public bool bForceAttachmentUpdates;
            
            public float CollisionHeight;
            
            public float CollisionRadius;
            
            public float TerminalVelocity;
        }
    }
}
/*
private function ShiftToNPCTypeID(int aNPCTypeID) {
local export editinline NPC_Type NPCType;
TestInvariant();                                                            
if (aNPCTypeID != 0) {                                                      
NPCType = NPC_Type(Class'SBDBSync'.GetResourceObject(aNPCTypeID));        
ShiftAppearance(NPCType);                                                 
} else {                                                                    
UnshiftAppearance();                                                      
}
TestInvariant();                                                            
}
protected native function sv2clrel_ShiftAppearance_CallStub();
protected event sv2clrel_ShiftAppearance(int aNPCTypeID) {
local export editinline NPC_Type NPCType;
if (aNPCTypeID != 0) {                                                      
NPCType = NPC_Type(Class'SBDBSync'.GetResourceObject(aNPCTypeID));        
SaveMovementPhysics();                                                    
} else {                                                                    
NPCType = mShiftedNPCType;                                                
}
if (NPCType == None) {                                                      
return;                                                                   
}
ShiftToNPCTypeID(aNPCTypeID);                                               
if (aNPCTypeID != 0) {                                                      
NPCType.InitMovement(Outer);                                              
Outer.PrePivot.Z += NPCType.Appearance.GetCollisionHeight() - mSavedPhysics.CollisionHeight;
Outer.SetCollisionSize(mSavedPhysics.CollisionRadius,mSavedPhysics.CollisionHeight);
} else {                                                                    
Outer.PrePivot.Z -= NPCType.Appearance.GetCollisionHeight() - mSavedPhysics.CollisionHeight;
RestoreMovementPhysics();                                                 
}
}
protected event NotifyAppearanceListeners(Game_Pawn aPawn,export editinline Game_Appearance aAppearance) {
local int i;
i = 0;                                                                      
while (i < mAppearanceListeners.Length) {                                   
if (mAppearanceListeners[i] == None) {                                    
mAppearanceListeners.Remove(i,1);                                       
i--;                                                                    
} else {                                                                  
mAppearanceListeners[i].OnAppearanceChanged(aPawn,aAppearance);         
}
i++;                                                                      
}
}
function UnregisterAppearanceListener(Game_AppearanceListener aListener) {
local int i;
i = 0;                                                                      
while (i < mAppearanceListeners.Length) {                                   
if (mAppearanceListeners[i] == aListener) {                               
mAppearanceListeners.Remove(i,1);                                       
return;                                                                 
}
i++;                                                                      
}
assert(False);                                                              
}
function RegisterAppearanceListener(Game_AppearanceListener aListener) {
local int i;
i = 0;                                                                      
while (i < mAppearanceListeners.Length) {                                   
if (mAppearanceListeners[i] == aListener) {                               
assert(False);                                                          
return;                                                                 
}
i++;                                                                      
}
mAppearanceListeners[mAppearanceListeners.Length] = aListener;              
}
function InstallBaseAppearance(export editinline NPC_Type aNPCType) {
Outer.BaseAppearance = aNPCType.Appearance.CreateAppearance(Outer,Outer.BaseAppearance,False);
Outer.BaseAppearance.Apply();                                               
}
function cl_OnShutdown() {
if (mShiftedAppearance != None) {                                           
mShiftedAppearance.cl_OnShutdown();                                       
}
Outer.BaseAppearance.cl_OnShutdown();                                       
Super.cl_OnShutdown();                                                      
}
function cl_OnFrame(float aDeltaTime) {
if (mShiftedAppearance != None) {                                           
mShiftedAppearance.cl_OnFrame(aDeltaTime);                                
}
Outer.BaseAppearance.cl_OnFrame(aDeltaTime);                                
if (mInvalidatedDressup) {                                                  
DressUp();                                                                
}
}
function cl_OnInit() {
local int aShiftedNPCTypeID;
Super.cl_OnInit();                                                          
Outer.BaseAppearance.cl_OnInit();                                           
if (mShiftedNPCTypeID != 0) {                                               
aShiftedNPCTypeID = mShiftedNPCTypeID;                                    
mShiftedNPCTypeID = 0;                                                    
ShiftToNPCTypeID(aShiftedNPCTypeID);                                      
}
TestInvariant();                                                            
}
function OnConstruct() {
TestInvariant();                                                            
if (Outer.BaseAppearance != None) {                                         
Outer.BaseAppearance.OnConstruct();                                       
}
}
function app(int A) {
GetCurrent().app(A);                                                        
}
event InvalidateDressup() {
mInvalidatedDressup = True;                                                 
}
final native function DressUp();
function bool UnshiftAppearance() {
return ShiftAppearance(None);                                               
}
event bool sv_UnshiftAppearance() {
return sv_ShiftAppearance(None);                                            
}
event NPC_Type GetShiftedNPCType() {
return mShiftedNPCType;                                                     
}
event bool sv_ShiftAppearance(export editinline NPC_Type aOtherNPCType) {
ShiftAppearance(aOtherNPCType);                                             
sv2clrel_ShiftAppearance_CallStub(mShiftedNPCTypeID);                       
return True;                                                                
}
function bool ShiftAppearance(export editinline NPC_Type aOtherNPCType) {
TestInvariant();                                                            
if (mShiftedNPCType == aOtherNPCType) {                                     
return False;                                                             
}
if (mShiftedNPCType != None) {                                              
mShiftedAppearance = None;                                                
mShiftedNPCType = None;                                                   
mShiftedNPCTypeID = 0;                                                    
}
TestInvariant();                                                            
if (aOtherNPCType != None) {                                                
mShiftedNPCType = aOtherNPCType;                                          
mShiftedNPCTypeID = mShiftedNPCType.GetResourceId();                      
mShiftedAppearance = aOtherNPCType.Appearance.CreateAppearance(Outer,mShiftedAppearance,True);
}
if (mShiftedAppearance != None
&& mShiftedNPCType.Equipment != None) {
mShiftedNPCType.Equipment.ApplyToAppearance(Game_EquippedAppearance(GetCurrent()));
}
GetCurrent().Apply();                                                       
TestInvariant();                                                            
}
native function bool IsFeminine();
native function bool IsShifted();
event Game_Appearance GetBase() {
return Outer.BaseAppearance;                                                
}
event Game_Appearance GetCurrent() {
if (mShiftedAppearance != None) {                                           
return mShiftedAppearance;                                                
} else {                                                                    
return Outer.BaseAppearance;                                              
}
}
event TestInvariant() {
if (Outer.BaseAppearanceClass != None) {                                    
assert(Outer.BaseAppearance != None);                                     
assert(mShiftedNPCType == None || mShiftedAppearance != None);            
assert(mShiftedNPCType != None || mShiftedAppearance == None);            
assert(mShiftedNPCType == None
|| mShiftedNPCTypeID == mShiftedNPCType.GetResourceId());
}
}
native function RestoreMovementPhysics();
native function SaveMovementPhysics();
*/
