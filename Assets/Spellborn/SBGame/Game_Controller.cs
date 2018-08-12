﻿using System;
using System.Collections.Generic;
using Engine;
using SBBase;
using UnityEngine;

namespace SBGame
{
    [Serializable] public class Game_Controller : Base_Controller
    {

        [TypeProxyDefinition(TypeName = "Game_DebugUtils")]
        public Type mDebugUtilsClass;

        [TypeProxyDefinition(TypeName = "Game_TextParser")]
        public Type TextParserClass;

        [TypeProxyDefinition(TypeName = "Game_Conversation")]
        public Type ConversationControlClass;

        public Game_DebugUtils DebugUtils;

        public Game_TextParser TextParser;

        public Game_Conversation ConversationControl;

        public EControllerStates mCurrentState;

        public List<Game_Hook> mContentHooks = new List<Game_Hook>();

        public Vector mTargetDestination;

        public Vector mTargetFocus;

        public Rotator mTargetRotation;

        public float mMaxDistanceToTarget;

        public float mMaxTimeToMove;

        public float mMoveSpeed;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public bool mReachedTarget;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public float mStateTimer;

        public List<StateListener> mStateListeners = new List<StateListener>();

        public DB_Character DBCharacter;

        public DB_CharacterSheet DBCharacterSheet;

        public List<int> DBCharacterSkills = new List<int>();

        public List<DBSkillToken> DBSkillTokens = new List<DBSkillToken>();

        public List<DB_SkillDeck> DBSkilldecks = new List<DB_SkillDeck>();

        public List<DB_Item> DBItems = new List<DB_Item>();

        public int DBPersistentVariables;

        public Game_Controller()
        {
        }

        [Serializable] public struct DBSkillToken
        {
            public int SkillID;

            public int TokenSlots;
        }

        public enum EControllerStates
        {
            CPS_PAWN_NONE,

            CPS_PAWN_ALIVE,

            CPS_PAWN_DEAD,

            CPS_AI_ALERT,

            CPS_AI_AGGRO,

            CPS_AI_FOLLOW,

            CPS_AI_IDLE,

            CPS_AI_REGROUP,

            CPS_MOVE_PAWN,

            CPS_ROTATE_PAWN,

            CPS_PAWN_SITTING,

            CPS_PAWN_FROZEN,
        }
    }
}
/*
native function int sv_GetPersistentVariable(int ContextID,int VariableID);
protected native function cl2sv_SetPersistentVariable_CallStub();
private native event cl2sv_SetPersistentVariable(int VariableID,int Value);
protected native function sv2cl_SetPersistentVariable_CallStub();
private native event sv2cl_SetPersistentVariable(int ContextID,int VariableID,int Value);
private native function sv_SetPersistentVariableNative(int ContextID,int VariableID,int Value);
event sv_SetPersistentVariable(int ContextID,int VariableID,int Value) {
if (DBCharacter != None && DBCharacter.Id > 0) {                            
if (sv_GetPersistentVariable(ContextID,VariableID) == Value) {            
return;                                                                 
}
sv_SetPersistentVariableNative(ContextID,VariableID,Value);               
Class'SBDBAsync'.SetPersistentPlayerVariable(Pawn,DBCharacter.Id,ContextID,VariableID,Value);
goto jl0086;                                                              
}
}
function sv_PetCallBack();
function sv_PetAttack(Game_Pawn Target);
function byte sv_GetPetAttackState();
function byte sv_GetPetMoveState();
function sv_SetPetAttackState(byte aAttackState);
function sv_SetPetMoveState(byte aMoveState);
function sv_SetPetOwner(Game_Pawn aPetOwner);
function bool ShouldLoot(Actor aLootOwner) {
return True;                                                                
}
function GetLootTables(Actor aOwner,out array<LootTable> aResultTables) {
}
final native event RotateToFace(float aDeltaTime);
native function Rotator GetFocusOrientation();
native function bool FacingTarget();
protected native function cl2sv_ForwardCancelState_CallStub();
event cl2sv_ForwardCancelState() {
SBGotoState(1);                                                             
}
event bool IsBeingRotated() {
return mCurrentState == 9;                                                  
}
event bool IsBeingMoved() {
return mCurrentState == 8;                                                  
}
event bool IsSitting() {
return mCurrentState == 10;                                                 
}
native function bool IsDespawned();
native function bool IsDead();
event bool IsIdle() {
return mCurrentState == 1;                                                  
}
event SBGotoState(byte aState) {
if (aState != mCurrentState) {                                              
switch (aState) {                                                         
case 1 :                                                                
mCurrentState = aState;                                               
GotoState('PawnAlive');                                               
break;                                                                
case 2 :                                                                
mCurrentState = aState;                                               
GotoState('PawnDead');                                                
break;                                                                
case 10 :                                                               
mCurrentState = aState;                                               
GotoState('PawnSitting');                                             
break;                                                                
case 11 :                                                               
mCurrentState = aState;                                               
GotoState('PawnFrozen');                                              
break;                                                                
default:                                                                
break;                                                                
}
}
}
final native function bool CanSeePawn(Game_Pawn aOther);
final native function sv_RemoveHooks(export editinline Content_Type aOwner);
event sv_FireHook(byte aHookType,Object aObjParam,int aNumParam) {
local int hookI;
local Game_Hook prevHook;
local Game_PlayerPawn playerPawn;
hookI = 0;                                                                  
while (hookI < mContentHooks.Length) {                                      
if (mContentHooks[hookI].HookType == aHookType) {                         
mContentHooks[hookI].Fire = True;                                       
} else {                                                                  
mContentHooks[hookI].Fire = False;                                      
}
hookI++;                                                                  
}
playerPawn = Game_PlayerPawn(Pawn);                                         
hookI = 0;                                                                  
while (hookI < mContentHooks.Length) {                                      
if (mContentHooks[hookI].Fire) {                                          
mContentHooks[hookI].Fire = False;                                      
prevHook = mContentHooks[hookI];                                        
if (playerPawn != None) {                                               
mContentHooks[hookI].Owner.sv_OnHook(playerPawn,aHookType,aObjParam,aNumParam);
}
if (hookI >= mContentHooks.Length) {                                    
break;                                                                
goto jl014A;                                                          
}
if (mContentHooks[hookI] != prevHook) {                                 
hookI--;                                                              
}
}
hookI++;                                                                  
}
hookI = 0;                                                                  
while (hookI < mContentHooks.Length) {                                      
if (mContentHooks[hookI].Fire) {                                          
}
hookI++;                                                                  
}
}
event bool sv_OnAttack(Game_Pawn aPawn,export editinline FSkill_EffectClass aEffect,bool WasNegativeEffect,float aValue) {
return False;                                                               
}
event sv_OnOwnerAttack(bool WasNegativeEffect);
event sv_OnOwnerAggression();
event sv_OnSkillTarget(Game_Pawn aInstigator,export editinline FSkill_Type aType);
event bool sv_OnDamage(Game_Pawn aEnemy,int aDamage) {
return False;                                                               
}
event cl_OnShutdown() {
if (DebugUtils != None) {                                                   
DebugUtils.cl_OnShutdown();                                               
}
if (TextParser != None) {                                                   
TextParser.cl_OnShutdown();                                               
}
if (ConversationControl != None) {                                          
ConversationControl.cl_OnShutdown();                                      
}
Super.cl_OnShutdown();                                                      
}
event cl_OnInit() {
Super.cl_OnInit();                                                          
if (DebugUtils != None) {                                                   
DebugUtils.cl_OnInit();                                                   
}
if (TextParser != None) {                                                   
TextParser.cl_OnInit();                                                   
}
if (ConversationControl != None) {                                          
ConversationControl.cl_OnInit();                                          
}
}
event cl_OnTick(float DeltaTime) {
Super.cl_OnTick(DeltaTime);                                                 
if (DebugUtils != None) {                                                   
DebugUtils.cl_OnTick(DeltaTime);                                          
}
}
event sv_OnShutdown() {
if (DebugUtils != None) {                                                   
DebugUtils.sv_OnShutdown();                                               
}
if (TextParser != None) {                                                   
TextParser.sv_OnShutdown();                                               
}
if (ConversationControl != None) {                                          
ConversationControl.sv_OnShutdown();                                      
}
Super.sv_OnShutdown();                                                      
}
event OnCreateComponents() {
Super.OnCreateComponents();                                                 
if (mDebugUtilsClass != None) {                                             
DebugUtils = new (self) mDebugUtilsClass;                                 
}
if (TextParserClass != None) {                                              
TextParser = new (self) TextParserClass;                                  
}
if (ConversationControlClass != None) {                                     
ConversationControl = new (self) ConversationControlClass;                
}
}
state PawnFrozen {
event cl_OnPlayerTick(float DeltaTime) {
}
function EndState() {
local Game_Pawn gp;
gp = Game_Pawn(Pawn);                                                   
if (gp != None) {                                                       
gp.CharacterStats.FreezeMovement(False);                              
gp.CharacterStats.FreezeRotation(False);                              
}
}
function BeginState() {
local Game_Pawn gp;
gp = Game_Pawn(Pawn);                                                   
if (gp != None) {                                                       
gp.CharacterStats.FreezeMovement(True);                               
gp.CharacterStats.FreezeRotation(True);                               
}
}
}
state PawnSitting {
function EndState() {
local Game_Pawn gp;
gp = Game_Pawn(Pawn);                                                   
if (gp != None) {                                                       
if (gp.CharacterStats != None) {                                      
gp.CharacterStats.UnsetStatsState(4);                               
if (IsServer()) {                                                   
if (gp.Physics == 19) {                                           
gp.CharacterStats.FreezeMovementTimed(2.00000000);              
} else {                                                          
gp.CharacterStats.FreezeMovementTimed(1.00000000);              
}
}
}
gp.StandUp();                                                         
}
}
function BeginState() {
local Game_Pawn gp;
mStateTimer = 0.00000000;                                               
Pawn.Velocity = vect(0.000000, 0.000000, 0.000000);                     
Pawn.Acceleration = Pawn.Velocity;                                      
gp = Game_Pawn(Pawn);                                                   
if (gp != None) {                                                       
if (gp.CharacterStats != None) {                                      
gp.CharacterStats.SetStatsState(4);                                 
}
if (IsServer()) {                                                     
if (gp.Physics == 19) {                                             
gp.CharacterStats.FreezeMovementTimed(2.00000000);                
} else {                                                            
gp.CharacterStats.FreezeMovementTimed(1.00000000);                
}
}
}
}
}
state PawnDead {
function BeginState() {
SBGotoState(2);                                                         
Game_Pawn(Pawn).StopMoving();                                           
}
}
state PawnAlive {
function BeginState() {
SBGotoState(1);                                                         
}
}
*/