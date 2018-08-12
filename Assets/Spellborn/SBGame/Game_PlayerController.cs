﻿using System;
using System.Collections.Generic;
using Engine;
using UnityEngine;

namespace SBGame
{
    [Serializable] public class Game_PlayerController : Game_Controller
    {
        public const string MUTE_GLOBAL = "\"global\"";

        public const string MUTE_ALL = "\"all\"";

        public const float SERVER_SYNC_TIME = 1F;

        [TypeProxyDefinition(TypeName = "Game_Chat")]
        public Type ChatClass;

        [TypeProxyDefinition(TypeName = "Game_Travel")]
        public Type TravelClass;

        [TypeProxyDefinition(TypeName = "Game_Mail")]
        public Type MailClass;

        [TypeProxyDefinition(TypeName = "Game_PlayerFriends")]
        public Type mGroupingFriendsClass;

        [TypeProxyDefinition(TypeName = "Game_PlayerTeams")]
        public Type mGroupingTeamsClass;

        [TypeProxyDefinition(TypeName = "Game_PlayerGuilds")]
        public Type mGroupingGuildsClass;

        public Game_Chat Chat;

        public Game_Travel Travel;

        public Game_Mail Mail;

        public Game_PlayerFriends GroupingFriends;

        public Game_PlayerTeams GroupingTeams;

        public Game_PlayerGuilds GroupingGuilds;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public bool mMoveForwards;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public bool mMoveBackwards;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public bool mMoveRight;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public bool mMoveLeft;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public bool mJump;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public float ServerTime;

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public float mUnstuckTime;

        public byte mNetState;

        public Game_Conversation mConversation;

        public FSkill_EffectClass_AudioVisual mDeathEffect;

        public bool DBMuted;

        public string DBMutedScope = string.Empty;

        public List<int> DBFinishedQuests = new List<int>();

        public List<int> DBQuestObjectiveIds = new List<int>();

        public List<int> DBQuestObjectiveValues = new List<int>();

        //public delegate<OnSitDown> @__OnSitDown__Delegate;

        //public delegate<OnPong> @__OnPong__Delegate;

        public Game_PlayerController()
        {
        }
    }
}
/*
protected native function sv2cl_Pong_CallStub();
private event sv2cl_Pong() {
if (mPingState == 2) {                                                      
mPingState = 1;                                                           
mPongTime = Level.TimeSeconds;                                            
mPing = (mPongTime - mPingTime) * 100;                                    
OnPong(mPing);                                                            
}
}
protected native function cl2sv_Ping_CallStub();
private event cl2sv_Ping() {
sv2cl_Pong_CallStub();                                                      
}
private function cl_Ping() {
switch (mPingState) {                                                       
case 0 :                                                                  
case 1 :                                                                  
cl2sv_Ping_CallStub();                                                  
mPingState = 2;                                                         
mPongTime = 0.00000000;                                                 
mPingTime = Level.TimeSeconds;                                          
break;                                                                  
default:                                                                  
}
}
private function cl_HandlePing() {
if (mPingState == 1
&& Level.TimeSeconds >= mPongTime + mPingInterval) {
cl_Ping();                                                                
}
}
function float cl_GetPing() {
return mPing;                                                               
}
function cl_StopPinging() {
mPingState = 0;                                                             
}
function cl_StartPinging() {
if (mPingState == 0) {                                                      
cl_Ping();                                                                
}
}
delegate OnPong(float aPing);
protected native function cl2sv_Unstuck_CallStub();
final native event cl2sv_Unstuck();
final native function TickMovement(float aDeltaTime);
function Unshift() {
Game_PlayerPawn(Pawn).Appearance.sv_UnshiftAppearance();                    
}
function Shift(int nr) {
local Game_NPCPawn NPC;
local export editinline NPC_Type Type;
switch (nr) {                                                               
case 1 :                                                                  
Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.AllTypes.NPC_Bear_Small",Class'NPC_Type',True));
break;                                                                  
case 2 :                                                                  
Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.GhostlyRobert",Class'NPC_Type',True));
break;                                                                  
case 3 :                                                                  
Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.AllTypes.NPC_Daevi_Female_Athletic",Class'NPC_Type',True));
break;                                                                  
case 4 :                                                                  
Type = NPC_Type(static.DynamicLoadObject("QuestNPCs_TechGP.AllTypes.NPC_Hoppie",Class'NPC_Type',True));
break;                                                                  
case 0 :                                                                  
default:                                                                  
NPC = Game_NPCPawn(Input.cl_GetTargetPawn());                           
if (NPC == None) {                                                      
}
Type = NPC.NPCType;                                                     
break;                                                                  
}
if (Type != None && Type.Appearance != None) {                              
Game_PlayerPawn(Pawn).Appearance.sv_ShiftAppearance(Type);                
} else {                                                                    
Game_PlayerPawn(Pawn).Appearance.sv_UnshiftAppearance();                  
}
}
delegate OnSitDown(bool aSitDown);
native function bool ReachedTarget();
native function bool UpdateMovement();
protected native function sv2cl_UpdateNetState_CallStub();
protected event sv2cl_UpdateNetState(byte aNetState) {
mNetState = aNetState;                                                      
if (mCurrentState != mNetState && mNetState != 0) {                         
SBGotoState(mNetState);                                                   
}
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
case 8 :                                                                
mCurrentState = aState;                                               
GotoState('MoveState');                                               
break;                                                                
case 9 :                                                                
mCurrentState = aState;                                               
GotoState('RotatePawn');                                              
break;                                                                
default:                                                                
Super.SBGotoState(aState);                                            
break;                                                                
}
if (IsServer()) {                                                         
mNetState = mCurrentState;                                              
if (ControllerInitialized) {                                            
sv2cl_UpdateNetState_CallStub(mNetState);                             
}
}
}
}
protected native function sv2cl_UpdateServerTime_CallStub();
protected event sv2cl_UpdateServerTime(float aServerTime) {
ServerTime = aServerTime;                                                   
}
event cl_OnTravelFailed(string Reason) {
GUI.OnTravelFailed(Reason);                                                 
}
protected native function cl2sv_NoteTargetReached_CallStub();
event cl2sv_NoteTargetReached() {
if (!mReachedTarget) {                                                      
mReachedTarget = True;                                                    
SBGotoState(1);                                                           
}
}
native function sv_OnSetViewTarget();
private native function sv_OnSceneEnded();
private native function sv_OnSceneStarted();
protected native function cl2sv_OverrideView_CallStub();
event cl2sv_OverrideView(bool aOverrideFlag) {
if (Input != None) {                                                        
Input.mViewOverrideReceived = aOverrideFlag;                              
}
if (aOverrideFlag) {                                                        
sv_OnSceneStarted();                                                      
} else {                                                                    
sv_OnSceneEnded();                                                        
}
}
event cl_OnSceneEnded() {
Super.cl_OnSceneEnded();                                                    
cl2sv_OverrideView_CallStub(False);                                         
}
event cl_OnSceneStarted() {
Super.cl_OnSceneStarted();                                                  
cl2sv_OverrideView_CallStub(True);                                          
}
event cl_OnPlayerTick(float DeltaTime) {
Super.cl_OnPlayerTick(DeltaTime);                                           
PlayerInput.PlayerInput(DeltaTime);                                         
Input.cl_OnPlayerTick(DeltaTime);                                           
Camera.cl_Tick(DeltaTime);                                                  
TickMovement(DeltaTime);                                                    
}
event cl_OnTick(float DeltaTime) {
ServerTime += DeltaTime;                                                    
cl_HandlePing();                                                            
}
event cl_OnShutdown() {
if (Input != None) {                                                        
Input.cl_OnShutdown();                                                    
}
if (GUI != None) {                                                          
GUI.cl_OnShutdown();                                                      
}
if (Chat != None) {                                                         
Chat.cl_OnShutdown();                                                     
}
if (Travel != None) {                                                       
Travel.cl_OnShutdown();                                                   
}
if (Camera != None) {                                                       
Camera.cl_OnShutdown();                                                   
}
if (Mail != None) {                                                         
Mail.cl_OnShutdown();                                                     
}
if (GroupingFriends != None) {                                              
GroupingFriends.cl_OnShutdown();                                          
}
if (GroupingTeams != None) {                                                
GroupingTeams.cl_OnShutdown();                                            
}
if (GroupingGuilds != None) {                                               
GroupingGuilds.cl_OnShutdown();                                           
}
Super.cl_OnShutdown();                                                      
}
event cl_OnInit() {
if (GroupingTeams != None) {                                                
GroupingTeams.Init();                                                     
}
if (GroupingGuilds != None) {                                               
GroupingGuilds.Init();                                                    
}
if (Input != None) {                                                        
Input.cl_OnInit();                                                        
}
if (GUI != None) {                                                          
GUI.cl_OnInit();                                                          
}
if (Chat != None) {                                                         
Chat.cl_OnInit();                                                         
}
if (Travel != None) {                                                       
Travel.cl_OnInit();                                                       
}
if (Camera != None) {                                                       
Camera.cl_OnInit();                                                       
}
if (Mail != None) {                                                         
Mail.cl_OnInit();                                                         
}
if (GroupingFriends != None) {                                              
GroupingFriends.cl_OnInit();                                              
}
if (GroupingTeams != None) {                                                
GroupingTeams.cl_OnInit();                                                
}
if (GroupingGuilds != None) {                                               
GroupingGuilds.cl_OnInit();                                               
}
Super.cl_OnInit();                                                          
SetViewTarget(Pawn);                                                        
}
event cl_OnBaseline() {
Super.cl_OnBaseline();                                                      
SBAnimatedPawn(Pawn).ClearPawnAnims();                                      
}
event sv_OnShutdown() {
if (Input != None) {                                                        
Input.sv_OnShutdown();                                                    
}
if (Camera != None) {                                                       
Camera.sv_OnShutdown();                                                   
}
if (GUI != None) {                                                          
GUI.sv_OnShutdown();                                                      
}
if (Chat != None) {                                                         
Chat.sv_OnShutdown();                                                     
}
if (Travel != None) {                                                       
Travel.sv_OnShutdown();                                                   
}
if (Mail != None) {                                                         
Mail.sv_OnShutdown();                                                     
}
if (GroupingFriends != None) {                                              
GroupingFriends.sv_OnShutdown();                                          
}
if (GroupingTeams != None) {                                                
GroupingTeams.sv_OnShutdown();                                            
}
if (GroupingGuilds != None) {                                               
GroupingGuilds.sv_OnShutdown();                                           
}
Super.sv_OnShutdown();                                                      
}
event OnCreateComponents() {
Super.OnCreateComponents();                                                 
if (InputClass != None) {                                                   
Input = new (self) InputClass;                                            
}
if (CameraClass != None) {                                                  
Camera = new (self) CameraClass;                                          
}
if (GUIClass != None) {                                                     
GUI = new (self) GUIClass;                                                
}
if (ChatClass != None) {                                                    
Chat = new (self) ChatClass;                                              
}
if (TravelClass != None) {                                                  
Travel = new (self) TravelClass;                                          
}
if (MailClass != None) {                                                    
Mail = new (self) MailClass;                                              
}
if (mGroupingFriendsClass != None) {                                        
GroupingFriends = new (self) mGroupingFriendsClass;                       
}
if (mGroupingTeamsClass != None) {                                          
GroupingTeams = new (self) mGroupingTeamsClass;                           
}
if (mGroupingGuildsClass != None) {                                         
GroupingGuilds = new (self) mGroupingGuildsClass;                         
}
}
state PawnSitting {
function EndState() {
OnSitDown(False);                                                       
Super.EndState();                                                       
}
event cl_OnPlayerTick(float aDeltaTime) {
local Game_PlayerPawn gpp;
gpp = Game_PlayerPawn(Pawn);                                            
PlayerInput.PlayerInput(aDeltaTime);                                    
Input.cl_OnPlayerTick(aDeltaTime);                                      
if (Camera != None) {                                                   
Camera.cl_Tick(aDeltaTime);                                           
}
TickMovement(aDeltaTime);                                               
}
function BeginState() {
local Game_PlayerPawn gpp;
gpp = Game_PlayerPawn(Pawn);                                            
if (gpp != None) {                                                      
if (!IsServer() && gpp.Physics != gpp.mNetPhysics) {                  
gpp.SetPhysics(gpp.mNetPhysics);                                    
}
}
Super.BeginState();                                                     
OnSitDown(True);                                                        
}
}
state RotatePawn {
exec function Jump(optional float JumpModifier) {
cl2sv_ForwardCancelState_CallStub();                                    
}
event cl_OnPlayerTick(float DeltaTime) {
local int oldYaw;
PlayerInput.PlayerInput(DeltaTime);                                     
Input.cl_OnPlayerTick(DeltaTime);                                       
Camera.cl_Tick(DeltaTime);                                              
if (bRotateToDesired) {                                                 
mStateTimer += DeltaTime;                                             
oldYaw = Rotation.Yaw;                                                
RotateToFace(DeltaTime);                                              
if (FacingTarget() || oldYaw == Rotation.Yaw
|| mStateTimer > 10.00000000) {
cl2sv_ForwardCancelState_CallStub();                                
bRotateToDesired = False;                                           
}
}
}
function EndState() {
bRotateToDesired = False;                                               
}
function BeginState() {
mStateTimer = 0.00000000;                                               
bRotateToDesired = True;                                                
}
}
state MoveState {
exec function Jump(optional float JumpModifier) {
cl2sv_ForwardCancelState_CallStub();                                    
}
function CalculateMovementSpeed() {
local Game_Pawn gamePawn;
gamePawn = Game_Pawn(Pawn);                                             
if (gamePawn != None) {                                                 
mMoveSpeed = 160.00000000;                                            
if (mMaxTimeToMove > 0.00000000) {                                    
mMoveSpeed = VSize(gamePawn.Location - mTargetDestination) / mMaxTimeToMove;
} else {                                                              
if (gamePawn.CharacterStats != None) {                              
mMoveSpeed = gamePawn.CharacterStats.mMovementSpeed * gamePawn.GroundSpeedModifier;
}
}
}
}
function bool UpdatePawnMovement(float DeltaTime) {
local Game_Pawn gamePawn;
gamePawn = Game_Pawn(Pawn);                                             
if (gamePawn != None) {                                                 
if (mReachedTarget) {                                                 
gamePawn.GroundSpeed = 0.00000000;                                  
return True;                                                        
}
if (mMaxTimeToMove > 0.00000000) {                                    
mStateTimer -= DeltaTime;                                           
if (mStateTimer <= 0.00000000) {                                    
mReachedTarget = True;                                            
return True;                                                      
}
}
gamePawn.GroundSpeed = mMoveSpeed;                                    
if (UpdateMovement()) {                                               
return True;                                                        
}
}
return False;                                                           
}
event cl_OnPlayerTick(float DeltaTime) {
local Game_Pawn gamePawn;
Camera.cl_Tick(DeltaTime);                                              
gamePawn = Game_Pawn(Pawn);                                             
if (gamePawn != None) {                                                 
if (UpdatePawnMovement(DeltaTime)) {                                  
mReachedTarget = True;                                              
cl2sv_NoteTargetReached_CallStub();                                 
}
}
}
function EndState() {
mReachedTarget = True;                                                  
}
function BeginState() {
mReachedTarget = False;                                                 
if (mMaxTimeToMove > 0.20000000) {                                      
mStateTimer = mMaxTimeToMove;                                         
} else {                                                                
mStateTimer = 0.00000000;                                             
}
CalculateMovementSpeed();                                               
}
}
state PawnDead {
event cl_OnPlayerFrame(float DeltaTime) {
}
exec function Jump(optional float JumpModifier) {
}
event cl_OnPlayerTick(float DeltaTime) {
cl_OnPlayerTick(DeltaTime);                                             
Camera.cl_Tick(DeltaTime);                                              
}
function EndState() {
local Game_Pawn gamePawn;
gamePawn = Game_Pawn(Pawn);                                             
if (gamePawn != None) {                                                 
gamePawn.ClearPawnAnims();                                            
gamePawn.PlayIdle();                                                  
gamePawn.Effects.cl_Stop(mDeathEffectHandle);                         
}
mDeathEffectHandle = 0;                                                 
}
function BeginState() {
local Game_Pawn gamePawn;
if (Class'Actor'.static.GetGameEngine().GGameInfo.PlayerDied(self) == False) {
if (IsClient() && GUI != None) {                                      
gamePawn = Game_Pawn(Pawn);                                         
if (gamePawn != None && gamePawn.Trading != None) {                 
gamePawn.Trading.cl_HandleDeath();                                
}
if (GroupingTeams != None) {                                        
GroupingTeams.HandleDeath();                                      
}
GUI.HandleDeath();                                                  
}
}
Input.cl_SetAutoRun(False);                                             
Input.cl_SetTargetActor(None);                                          
if (mDeathEffect == None) {                                             
mDeathEffect = FSkill_EffectClass_AudioVisual(static.DynamicLoadObject("EffectsNPCTypeAVGP.Death.Death_Blur",Class'FSkill_EffectClass_AudioVisual',True));
}
mDeathEffectHandle = Game_Pawn(Pawn).Effects.cl_Start(mDeathEffect);    
}
}
auto state PawnAlive {
function BeginState() {
if (IsClient() && Pawn != None) {                                       
GUI.HideDeathRespawn();                                               
}
}
}
*/