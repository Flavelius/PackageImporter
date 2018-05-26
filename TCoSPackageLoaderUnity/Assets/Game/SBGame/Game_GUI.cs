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

namespace SBGame
{
#pragma warning disable 414   
    
    [System.Serializable] public class Game_GUI : Base_Component
    {
        
        public string mStartMenuClass = string.Empty;
        
        public string mSystemMenuClass = string.Empty;
        
        public string mVideoSettingsClass = string.Empty;
        
        public string mAdvancedVideoSettingsClass = string.Empty;
        
        public string mAudioSettingsClass = string.Empty;
        
        public string mControlSettingsClass = string.Empty;
        
        public string mKeyBindingClass = string.Empty;
        
        public string mBugToolClass = string.Empty;
        
        public string mInventoryClass = string.Empty;
        
        public string mEquipmentClass = string.Empty;
        
        public string mCombatBarClass = string.Empty;
        
        public string mPlayerAvatarClass = string.Empty;
        
        public string mMinimapClass = string.Empty;
        
        public string mChatClass = string.Empty;
        
        public string mTeamClass = string.Empty;
        
        public string mFriendsClass = string.Empty;
        
        public string mCharacterCreationClass = string.Empty;
        
        public string mConversationClass = string.Empty;
        
        public string mQuestsClass = string.Empty;
        
        public string mQuestInfoClass = string.Empty;
        
        public string mSkillBookClass = string.Empty;
        
        public string mSkillDeckClass = string.Empty;
        
        public string mDeathRespawnClass = string.Empty;
        
        public string mTradeClass = string.Empty;
        
        public string mEnterArenaClass = string.Empty;
        
        public string mTargetAvatarClass = string.Empty;
        
        public string mNetworkStatsClass = string.Empty;
        
        public string mDateTimeClass = string.Empty;
        
        public string mNewLootClass = string.Empty;
        
        public int StartMenuHandle;
        
        public int SystemMenuHandle;
        
        public int VideoSettingsHandle;
        
        public int AdvancedVideoSettingsHandle;
        
        public int AudioSettingsHandle;
        
        public int ControlSettingsHandle;
        
        public int KeyBindingHandle;
        
        public int BugToolHandle;
        
        public int InventoryHandle;
        
        public int EquipmentHandle;
        
        public int CombatBarHandle;
        
        public int PlayerAvatarHandle;
        
        public int MinimapHandle;
        
        public int ChatHandle;
        
        public int TeamHandle;
        
        public int FriendsHandle;
        
        public int CharacterCreationHandle;
        
        public int DialogueHandle;
        
        public int QuestsHandle;
        
        public int QuestInfoHandle;
        
        public int SkillBookHandle;
        
        public int SkillDeckHandle;
        
        public int RuntimeStatsDebugHandle;
        
        public int DeathRespawnHandle;
        
        public int TradeHandle;
        
        public int EnterArenaHandle;
        
        public int TargetAvatarHandle;
        
        public int NetworkStatsHandle;
        
        public int DateTimeHandle;
        
        private List<int> mToggledWindowHandles = new List<int>();
        
        private bool mIsToggleSet;
        
        public Game_GUI()
        {
        }
    }
}
/*
exec function TogglePing() {
Outer.Player.GUIDesktop.ShowStdWindow(81,4);                                
}
function HidePing() {
Outer.Player.GUIDesktop.ShowStdWindow(81,2);                                
}
function ShowPing() {
Outer.Player.GUIDesktop.ShowStdWindow(81,1);                                
}
function HandleDeath() {
ShowDeathRespawn();                                                         
}
function ToggleCreditsWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.75,Class'GUI_BaseDesktop'.4);
}
function HideCreditsWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.75,Class'GUI_BaseDesktop'.2);
}
function ShowCreditsWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.75,Class'GUI_BaseDesktop'.1);
}
function HideMiniGameWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.73,Class'GUI_BaseDesktop'.2);
}
function ShowMiniGameWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.73,Class'GUI_BaseDesktop'.1);
}
function HideMiniGameSettingsWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.72,Class'GUI_BaseDesktop'.2);
}
function ShowMiniGameSettingsWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.72,Class'GUI_BaseDesktop'.1);
}
function HideMiniGameInvitationWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.71,Class'GUI_BaseDesktop'.2);
}
function ShowMiniGameInvitationWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.71,Class'GUI_BaseDesktop'.1);
}
function InitMiniGameInvitationWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.71,Class'GUI_BaseDesktop'.2);
}
function HideMiniGameListWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.70,Class'GUI_BaseDesktop'.2);
}
function ShowMiniGameListWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.70,Class'GUI_BaseDesktop'.1);
}
function InitMiniGameListWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.70,Class'GUI_BaseDesktop'.2);
}
function ToggleArenaScoreWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.64,Class'GUI_BaseDesktop'.4);
}
function HideArenaScoreWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.64,Class'GUI_BaseDesktop'.2);
}
function ShowArenaScoreWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.64,Class'GUI_BaseDesktop'.1);
}
function ToggleArenaStatusWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.63,Class'GUI_BaseDesktop'.4);
}
function HideArenaStatusWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.63,Class'GUI_BaseDesktop'.2);
}
function ShowArenaStatusWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.63,Class'GUI_BaseDesktop'.1);
}
function ToggleArenaWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.61,Class'GUI_BaseDesktop'.4);
}
function HideArenaWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.61,Class'GUI_BaseDesktop'.2);
}
function ShowArenaWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.61,Class'GUI_BaseDesktop'.1);
}
function ToggleDateTime() {
if (QuestsHandle == 0) {                                                    
ShowDateTime();                                                           
} else {                                                                    
HideDateTime();                                                           
}
}
function HideDateTime() {
if (Outer != None && Outer.Player != None
&& Outer.Player.GUIController != None) {
if (DateTimeHandle != 0) {                                                
Outer.Player.GUIController.CloseWindow(DateTimeHandle);                 
DateTimeHandle = 0;                                                     
}
}
}
function ShowDateTime() {
if (Outer != None && Outer.Player != None
&& Outer.Player.GUIController != None) {
if (DateTimeHandle == 0) {                                                
DateTimeHandle = Outer.Player.GUIController.OpenWindow(mDateTimeClass); 
}
}
}
function TargetActorChanged() {
if (Outer.Input.cl_GetTargetPawn() != None) {                               
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.2,Class'GUI_BaseDesktop'.1);
} else {                                                                    
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.2,Class'GUI_BaseDesktop'.2);
}
}
function HideTravel() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.51,Class'GUI_BaseDesktop'.2);
}
function ShowTravel(string travelNPCName) {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.51,Class'GUI_BaseDesktop'.1);
Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.51,0,None,travelNPCName);
}
function HideShop() {
Outer.Player.GUIDesktop.ShowStdWindow(53,2);                                
Outer.Player.GUIDesktop.ShowStdWindow(54,2);                                
Outer.Player.GUIDesktop.ShowStdWindow(56,2);                                
}
function ShowShop(Shop_Base aShop,byte aOption) {
switch (aOption) {                                                          
case 20 :                                                                 
case 21 :                                                                 
case 22 :                                                                 
case 23 :                                                                 
case 24 :                                                                 
case 25 :                                                                 
case 26 :                                                                 
Outer.Player.GUIDesktop.UpdateStdWindow(53,aOption,aShop,"");           
break;                                                                  
case 27 :                                                                 
case 31 :                                                                 
case 32 :                                                                 
case 34 :                                                                 
Outer.Player.GUIDesktop.UpdateStdWindow(54,aOption,aShop,"");           
break;                                                                  
case 33 :                                                                 
Outer.Player.GUIDesktop.UpdateStdWindow(56,aOption,aShop,"");           
break;                                                                  
case 28 :                                                                 
case 29 :                                                                 
case 30 :                                                                 
case 35 :                                                                 
default:                                                                  
break;                                                                  
}
}
function UpdateMasterLoot() {
Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.42,0,None,"");
}
function UpdateGroupLoot() {
Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.41,0,None,"");
}
function UpdateSingleLoot() {
Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.40,0,None,"");
}
function ToggleNewLoot() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.39,Class'GUI_BaseDesktop'.4);
}
function HideNewLoot() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.39,Class'GUI_BaseDesktop'.2);
}
function ShowNewLoot() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.39,Class'GUI_BaseDesktop'.1);
}
function HideTrade() {
HideInventory();                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.49,Class'GUI_BaseDesktop'.2);
}
function ShowTrade() {
ShowInventory();                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.49,Class'GUI_BaseDesktop'.1);
}
function HideTradeRequest() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.48,Class'GUI_BaseDesktop'.2);
}
function ShowTradeRequest() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.48,Class'GUI_BaseDesktop'.1);
}
exec function ToggleCombatSetup() {
local int i;
if (mIsToggleSet) {                                                         
i = 0;                                                                    
while (i < mToggledWindowHandles.Length) {                                
Outer.Player.GUIDesktop.ShowStdWindow(mToggledWindowHandles[i],Class'GUI_BaseDesktop'.1);
++i;                                                                    
}
mIsToggleSet = False;                                                     
mToggledWindowHandles.Length = 0;                                         
} else {                                                                    
AddToCombatToggleList(Class'GUI_BaseDesktop'.49);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.48);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.39);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.40);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.42);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.5);                          
AddToCombatToggleList(Class'GUI_BaseDesktop'.9);                          
AddToCombatToggleList(Class'GUI_BaseDesktop'.10);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.38);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.11);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.17);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.16);                         
AddToCombatToggleList(Class'GUI_BaseDesktop'.7);                          
AddToCombatToggleList(Class'GUI_BaseDesktop'.6);                          
AddToCombatToggleList(Class'GUI_BaseDesktop'.24);                         
mIsToggleSet = True;                                                      
}
}
function AddToCombatToggleList(int stdWindowID) {
if (Outer.Player.GUIDesktop.IsStdWindowVisible(stdWindowID)) {              
mToggledWindowHandles.Length = mToggledWindowHandles.Length + 1;          
mToggledWindowHandles[mToggledWindowHandles.Length - 1] = stdWindowID;    
Outer.Player.GUIDesktop.ShowStdWindow(stdWindowID,Class'GUI_BaseDesktop'.2);
}
}
protected native function sv2cl_HideEnterArena_CallStub();
event sv2cl_HideEnterArena() {
HideEnterArena();                                                           
}
function HideEnterArena() {
Outer.Player.GUIController.CloseWindow(EnterArenaHandle);                   
EnterArenaHandle = 0;                                                       
}
protected native function sv2cl_ShowEnterArena_CallStub();
event sv2cl_ShowEnterArena() {
EnterArenaHandle = Outer.Player.GUIController.OpenWindow(mEnterArenaClass); 
}
function HideDeathRespawn() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.15,Class'GUI_BaseDesktop'.2);
}
function ShowDeathRespawn() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.15,Class'GUI_BaseDesktop'.1);
}
exec function ToggleWorldmap() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.24,Class'GUI_BaseDesktop'.4);
}
}
function HideWorldmap() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.24,Class'GUI_BaseDesktop'.2);
}
function ShowWorldmap() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.24,Class'GUI_BaseDesktop'.1);
}
function UpdateQuestlog() {
if (QuestsHandle != 0) {                                                    
Outer.Player.GUIController.UpdateWindow(QuestsHandle);                    
}
}
exec function ToggleQuestlog() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.4);
}
}
function HideQuestlog() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.2);
}
function ShowQuestlog() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.1);
}
function HideDialogue() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.7,Class'GUI_BaseDesktop'.2);
}
function ShowDialogue(Game_ConversationState conv) {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.7,Class'GUI_BaseDesktop'.1);
Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.7,0,conv);   
}
exec function ToggleSkillDeck() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.16,Class'GUI_BaseDesktop'.4);
}
}
function HideSkillDeck() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.16,Class'GUI_BaseDesktop'.2);
}
function ShowSkillDeck() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.16,Class'GUI_BaseDesktop'.1);
}
exec function ToggleUpgradeSkillWindow() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.86,Class'GUI_BaseDesktop'.4);
}
}
function HideUpgradeSkillWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.86,Class'GUI_BaseDesktop'.2);
}
function ShowUpgradeSkillWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.86,Class'GUI_BaseDesktop'.1);
}
function InitUpgradeSkillWindow() {
HideUpgradeSkillWindow();                                                   
}
exec function ToggleLearnSkillWindow() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.85,Class'GUI_BaseDesktop'.4);
}
}
function HideLearnSkillWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.85,Class'GUI_BaseDesktop'.2);
}
function ShowLearnSkillWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.85,Class'GUI_BaseDesktop'.1);
}
function InitLearnSkillWindow() {
HideLearnSkillWindow();                                                     
}
exec function ToggleSkillLibrary() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.84,Class'GUI_BaseDesktop'.4);
}
}
function HideSkillLibrary() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.84,Class'GUI_BaseDesktop'.2);
}
function ShowSkillLibrary() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.84,Class'GUI_BaseDesktop'.1);
}
function InitSkillLibrary() {
HideSkillLibrary();                                                         
}
exec function ToggleSkillBook() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.17,Class'GUI_BaseDesktop'.4);
}
}
function HideSkillBook() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.17,Class'GUI_BaseDesktop'.2);
}
function ShowSkillBook() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.17,Class'GUI_BaseDesktop'.1);
}
exec function ToggleFriends() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.11,Class'GUI_BaseDesktop'.4);
}
function HideFriends() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.11,Class'GUI_BaseDesktop'.2);
}
function ShowFriends() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.11,Class'GUI_BaseDesktop'.1);
}
exec function ToggleCharacterStats() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.38,Class'GUI_BaseDesktop'.4);
}
}
function HideCharacterStats() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.38,Class'GUI_BaseDesktop'.2);
}
function ShowCharacterStats() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.38,Class'GUI_BaseDesktop'.1);
}
function ToggleTeam() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.4);
}
function HideTeam() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.2);
}
function ShowTeam() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.1);
}
function InitQuestLogWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.2);
}
function InitTimerWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.74,Class'GUI_BaseDesktop'.1);
}
function InitOnScreenMessagesWindow() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.76,Class'GUI_BaseDesktop'.2);
}
function ToggleChat() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.13,Class'GUI_BaseDesktop'.4);
}
function HideChat() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.13,Class'GUI_BaseDesktop'.2);
}
function ShowChat() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.13,Class'GUI_BaseDesktop'.1);
}
exec function ToggleNetworkStats() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.14,Class'GUI_BaseDesktop'.4);
}
function HideNetworkStats() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.14,Class'GUI_BaseDesktop'.2);
}
function ShowNetworkStats() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.14,Class'GUI_BaseDesktop'.1);
}
exec function ActivateBodySlot(int Index) {
if (Index >= 0 && Index < 5) {                                              
Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.57,Index); 
}
}
exec function ToggleFriendIgnoreList() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.4);
}
}
function HideFriendIgnoreList() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.2);
}
function ShowFriendIgnoreList() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.1);
}
exec function ToggleGuildList() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.4);
}
}
function HideGuildList() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.2);
}
function ShowGuildList() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.1);
}
function ToggleGuildJoin() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.66,Class'GUI_BaseDesktop'.4);
}
}
function HideGuildJoin() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.66,Class'GUI_BaseDesktop'.2);
}
function ShowGuildJoin() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.66,Class'GUI_BaseDesktop'.1);
}
function ToggleGuildCreate() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.4);
}
}
function HideGuildCreate() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.2);
}
function ShowGuildCreate() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.1);
}
function ToggleBodySlots() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.57,Class'GUI_BaseDesktop'.4);
}
function HideBodySlots() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.57,Class'GUI_BaseDesktop'.2);
}
function ShowBodyslots() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.57,Class'GUI_BaseDesktop'.1);
}
function ToggleMinimap() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.0,Class'GUI_BaseDesktop'.4);
}
function HideMinimap() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.0,Class'GUI_BaseDesktop'.2);
}
function ShowMinimap() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.0,Class'GUI_BaseDesktop'.1);
}
function TogglePlayerAvatar() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.1,Class'GUI_BaseDesktop'.4);
}
function HidePlayerAvatar() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.1,Class'GUI_BaseDesktop'.2);
}
function ShowPlayerAvatar() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.1,Class'GUI_BaseDesktop'.1);
}
function TogglePet() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.77,Class'GUI_BaseDesktop'.4);
}
function HidePet() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.77,Class'GUI_BaseDesktop'.2);
}
function ShowPet() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.77,Class'GUI_BaseDesktop'.1);
}
function ToggleTeamMembers() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.4);
}
function HideTeamMembers() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.2);
}
function ShowTeamMembers() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.1);
}
function ToggleCombatBar() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.3,Class'GUI_BaseDesktop'.4);
}
function HideCombatBar() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.3,Class'GUI_BaseDesktop'.2);
}
function ShowCombatBar() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.3,Class'GUI_BaseDesktop'.1);
}
exec function ToggleEquipment() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.10,Class'GUI_BaseDesktop'.4);
}
}
function HideEquipment() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.10,Class'GUI_BaseDesktop'.2);
}
function ShowEquipment() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.10,Class'GUI_BaseDesktop'.1);
}
exec function ToggleInventory() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.9,Class'GUI_BaseDesktop'.4);
}
}
function HideInventory() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.9,Class'GUI_BaseDesktop'.2);
}
function ShowInventory() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.9,Class'GUI_BaseDesktop'.1);
}
exec function ToggleBugTool() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.8,Class'GUI_BaseDesktop'.4);
}
function HideBugTool() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.8,Class'GUI_BaseDesktop'.2);
}
function ShowBugTool() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.8,Class'GUI_BaseDesktop'.1);
}
function ToggleKeyBinding() {
if (KeyBindingHandle == 0) {                                                
ShowKeyBinding();                                                         
} else {                                                                    
HideKeyBinding();                                                         
}
}
function HideKeyBinding() {
Outer.Player.GUIController.CloseWindow(KeyBindingHandle);                   
KeyBindingHandle = 0;                                                       
}
function ShowKeyBinding() {
KeyBindingHandle = Outer.Player.GUIController.OpenWindow(mKeyBindingClass); 
}
function ToggleControlSettings() {
if (ControlSettingsHandle == 0) {                                           
ShowControlSettings();                                                    
} else {                                                                    
HideControlSettings();                                                    
}
}
function HideControlSettings() {
Outer.Player.GUIController.CloseWindow(ControlSettingsHandle);              
ControlSettingsHandle = 0;                                                  
}
function ShowControlSettings() {
ControlSettingsHandle = Outer.Player.GUIController.OpenWindow(mControlSettingsClass);
}
function ToggleAudioSettings() {
if (AudioSettingsHandle == 0) {                                             
ShowAudioSettings();                                                      
} else {                                                                    
HideAudioSettings();                                                      
}
}
function HideAudioSettings() {
Outer.Player.GUIController.CloseWindow(AudioSettingsHandle);                
AudioSettingsHandle = 0;                                                    
}
function ShowAudioSettings() {
AudioSettingsHandle = Outer.Player.GUIController.OpenWindow(mAudioSettingsClass);
}
function ToggleAdvancedVideoSettings() {
if (AdvancedVideoSettingsHandle == 0) {                                     
ShowAdvancedVideoSettings();                                              
} else {                                                                    
HideAdvancedVideoSettings();                                              
}
}
function HideAdvancedVideoSettings() {
Outer.Player.GUIController.CloseWindow(AdvancedVideoSettingsHandle);        
AdvancedVideoSettingsHandle = 0;                                            
}
function ShowAdvancedVideoSettings() {
AdvancedVideoSettingsHandle = Outer.Player.GUIController.OpenWindow(mAdvancedVideoSettingsClass);
}
function ToggleVideoSettings() {
if (VideoSettingsHandle == 0) {                                             
ShowVideoSettings();                                                      
} else {                                                                    
HideVideoSettings();                                                      
}
}
function HideVideoSettings() {
Outer.Player.GUIController.CloseWindow(VideoSettingsHandle);                
VideoSettingsHandle = 0;                                                    
}
function ShowVideoSettings() {
VideoSettingsHandle = Outer.Player.GUIController.OpenWindow(mVideoSettingsClass);
}
exec function ToggleSkillDebugLog() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.44,Class'GUI_BaseDesktop'.4);
}
function HideSkillDebugLog() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.44,Class'GUI_BaseDesktop'.2);
}
function ShowSkillDebugLog() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.44,Class'GUI_BaseDesktop'.1);
}
function ToggleSystemMenu() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.5,Class'GUI_BaseDesktop'.4);
}
function HideSystemMenu() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.5,Class'GUI_BaseDesktop'.2);
}
function ShowSystemMenu() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.5,Class'GUI_BaseDesktop'.1);
}
exec function ToggleStartMenu() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.4,Class'GUI_BaseDesktop'.4);
}
function HideStartMenu() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.4,Class'GUI_BaseDesktop'.2);
}
function ShowStartMenu() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.4,Class'GUI_BaseDesktop'.1);
}
function CloseRadialMenu() {
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.18,Class'GUI_BaseDesktop'.2);
}
function OpenRadialMenu() {
if (IsAlive()) {                                                            
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.18,Class'GUI_BaseDesktop'.1);
}
}
exec function PreviousTabStop() {
Outer.Player.GUIDesktop.PreviousTabStop();                                  
}
exec function NextTabStop() {
Outer.Player.GUIDesktop.NextTabStop();                                      
}
protected native function sv2cl_ShowPartyTravelConfirmation_CallStub();
event sv2cl_ShowPartyTravelConfirmation() {
Outer.Player.GUIDesktop.ShowPartyTravelConfirmation();                      
}
protected native function sv2cl_ShowPartyTravelOverview_CallStub();
event sv2cl_ShowPartyTravelOverview() {
Outer.Player.GUIDesktop.ShowPartyTravelOverview();                          
}
protected native function sv2cl_ShowTutorial_CallStub();
event sv2cl_ShowTutorial(int articleID) {
Outer.Player.GUIDesktop.ShowTutorialWindow(articleID);                      
}
event ShowLevelArea(string aName,bool newArea) {
Outer.Player.GUIDesktop.ShowLevelAreaName(aName,newArea);                   
}
function OnTravelFailed(string Reason) {
Outer.Player.GUIDesktop.AddScreenMessage(Reason);                           
}
function bool IsAlive() {
return !Game_Pawn(Outer.Pawn).IsDead();                                     
}
function cl_OnInit() {
Super.cl_OnInit();                                                          
ShowStartMenu();                                                            
if (Game_Pawn(Outer.Pawn).combatState.CombatReady()) {                      
ShowCombatBar();                                                          
} else {                                                                    
HideCombatBar();                                                          
}
ShowPlayerAvatar();                                                         
ShowTeam();                                                                 
ShowMinimap();                                                              
ShowBodyslots();                                                            
ShowChat();                                                                 
ShowDateTime();                                                             
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.2);
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.2);
Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.60,Class'GUI_BaseDesktop'.1);
HideNewLoot();                                                              
if (Game_PlayerPawn(Outer.Pawn).MiniGameProxy != None) {                    
InitMiniGameListWindow();                                                 
InitMiniGameInvitationWindow();                                           
goto jl0143;                                                              
}
InitSkillLibrary();                                                         
InitLearnSkillWindow();                                                     
InitUpgradeSkillWindow();                                                   
InitOnScreenMessagesWindow();                                               
InitTimerWindow();                                                          
InitQuestLogWindow();                                                       
if (Outer.Player.GUIController != None) {                                   
Outer.Player.GUIController.FocusWindow(0);                                
}
}
*/
