#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBAISCRIPTS_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  RegisteredAI
//------------------------------------------------------------------------------

// URegisteredAI 0 ( )
class DLL_IMPORT URegisteredAI : public UAIScriptSubObject {
};


//------------------------------------------------------------------------------
//  AIRegistered
//------------------------------------------------------------------------------

// AAIRegistered 0 ( )
class DLL_IMPORT AAIRegistered : public AAI_Script {
};


//------------------------------------------------------------------------------
//  RegisteredSkillPerformer
//------------------------------------------------------------------------------

// URegisteredSkillPerformer 0 ( )
class DLL_IMPORT URegisteredSkillPerformer : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  RegisteredAnimation
//------------------------------------------------------------------------------

// URegisteredAnimation 0 ( )
class DLL_IMPORT URegisteredAnimation : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  AIDefeatScript
//------------------------------------------------------------------------------

// AAIDefeatScript 0 ( )
class DLL_IMPORT AAIDefeatScript : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_NPC_Chat
//------------------------------------------------------------------------------

// AAI_NPC_Chat 0 ( )
class DLL_IMPORT AAI_NPC_Chat : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_SpellCaster
//------------------------------------------------------------------------------

// AAIScript_SpellCaster 0 ( )
class DLL_IMPORT AAIScript_SpellCaster : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_DAF_Grome
//------------------------------------------------------------------------------

// AAIScript_DAF_Grome 0 ( )
class DLL_IMPORT AAIScript_DAF_Grome : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_Script_Pusher
//------------------------------------------------------------------------------

// AAI_Script_Pusher 0 ( )
class DLL_IMPORT AAI_Script_Pusher : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_TriggerRange_Counter
//------------------------------------------------------------------------------

// AAIScript_TriggerRange_Counter 0 ( )
class DLL_IMPORT AAIScript_TriggerRange_Counter : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_CollectEventinstigators
//------------------------------------------------------------------------------

// AAIScript_CollectEventinstigators 0 ( )
class DLL_IMPORT AAIScript_CollectEventinstigators : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_CountCollected
//------------------------------------------------------------------------------

// AAIScript_CountCollected 0 ( )
class DLL_IMPORT AAIScript_CountCollected : public AAIScript_CollectEventinstigators {
};


//------------------------------------------------------------------------------
//  AIEscortFramework
//------------------------------------------------------------------------------

// AAIEscortFramework 0 ( )
class DLL_IMPORT AAIEscortFramework : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_Group_Event_Manager
//------------------------------------------------------------------------------

// AAIScript_Group_Event_Manager 0 ( )
class DLL_IMPORT AAIScript_Group_Event_Manager : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  RegisteredEscort
//------------------------------------------------------------------------------

// URegisteredEscort 0 ( )
class DLL_IMPORT URegisteredEscort : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  RegisteredFrozen
//------------------------------------------------------------------------------

// URegisteredFrozen 0 ( )
class DLL_IMPORT URegisteredFrozen : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  AIScript_EXA_ConfusingSmoke
//------------------------------------------------------------------------------

// AAIScript_EXA_ConfusingSmoke 0 ( )
class DLL_IMPORT AAIScript_EXA_ConfusingSmoke : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_10_Sequence
//------------------------------------------------------------------------------

// AAIScript_TotA_10_Sequence 0 ( )
class DLL_IMPORT AAIScript_TotA_10_Sequence : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_5_Sequence
//------------------------------------------------------------------------------

// AAIScript_TotA_5_Sequence 0 ( )
class DLL_IMPORT AAIScript_TotA_5_Sequence : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_PatrolPoint_ScriptPusher
//------------------------------------------------------------------------------

// AAIScript_PatrolPoint_ScriptPusher 0 ( )
class DLL_IMPORT AAIScript_PatrolPoint_ScriptPusher : public AAI_Script {
};


//------------------------------------------------------------------------------
//  RegisteredStateSwitch
//------------------------------------------------------------------------------

// URegisteredStateSwitch 0 ( )
class DLL_IMPORT URegisteredStateSwitch : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  AIScript_RandomTrigger
//------------------------------------------------------------------------------

// AAIScript_RandomTrigger 0 ( )
class DLL_IMPORT AAIScript_RandomTrigger : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Interact
//------------------------------------------------------------------------------

// AAIScript_Interact 0 ( )
class DLL_IMPORT AAIScript_Interact : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_TriggerSkill
//------------------------------------------------------------------------------

// AAI_TriggerSkill 0 ( )
class DLL_IMPORT AAI_TriggerSkill : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_HealthLevel_Trigger
//------------------------------------------------------------------------------

// AAI_HealthLevel_Trigger 0 ( )
class DLL_IMPORT AAI_HealthLevel_Trigger : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  QuestChallengeHookTrigger
//------------------------------------------------------------------------------

// AQuestChallengeHookTrigger 0 ( )
class DLL_IMPORT AQuestChallengeHookTrigger : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_PT_Trial15_script
//------------------------------------------------------------------------------

// AAIScript_PT_Trial15_script 0 ( )
class DLL_IMPORT AAIScript_PT_Trial15_script : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_SequenceTrigger
//------------------------------------------------------------------------------

// AAIScript_SequenceTrigger 0 ( )
class DLL_IMPORT AAIScript_SequenceTrigger : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Proto_State
//------------------------------------------------------------------------------

// AAIScript_Proto_State 0 ( )
class DLL_IMPORT AAIScript_Proto_State : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Proto_TriggeredSkill
//------------------------------------------------------------------------------

// AAIScript_Proto_TriggeredSkill 0 ( )
class DLL_IMPORT AAIScript_Proto_TriggeredSkill : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_TimeScript
//------------------------------------------------------------------------------

// AAI_TimeScript 0 ( )
class DLL_IMPORT AAI_TimeScript : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_8_Sequence
//------------------------------------------------------------------------------

// AAIScript_TotA_8_Sequence 0 ( )
class DLL_IMPORT AAIScript_TotA_8_Sequence : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_LimitedInvulnerability
//------------------------------------------------------------------------------

// AAI_LimitedInvulnerability 0 ( )
class DLL_IMPORT AAI_LimitedInvulnerability : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIPatrolScript
//------------------------------------------------------------------------------

// AAIPatrolScript 0 ( )
class DLL_IMPORT AAIPatrolScript : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  RegisteredChatNPC
//------------------------------------------------------------------------------

// URegisteredChatNPC 0 ( )
class DLL_IMPORT URegisteredChatNPC : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  RegisteredTouching
//------------------------------------------------------------------------------

// URegisteredTouching 0 ( )
class DLL_IMPORT URegisteredTouching : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  AIScript_CoA_1_Becks_Script
//------------------------------------------------------------------------------

// AAIScript_CoA_1_Becks_Script 0 ( )
class DLL_IMPORT AAIScript_CoA_1_Becks_Script : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_4_IceStatueScript
//------------------------------------------------------------------------------

// AAIScript_TotA_4_IceStatueScript 0 ( )
class DLL_IMPORT AAIScript_TotA_4_IceStatueScript : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TriggerAnimation
//------------------------------------------------------------------------------

// AAIScript_TriggerAnimation 0 ( )
class DLL_IMPORT AAIScript_TriggerAnimation : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_TriggerActions
//------------------------------------------------------------------------------

// AAI_TriggerActions 0 ( )
class DLL_IMPORT AAI_TriggerActions : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_6_Sequence
//------------------------------------------------------------------------------

// AAIScript_TotA_6_Sequence 0 ( )
class DLL_IMPORT AAIScript_TotA_6_Sequence : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_Ormoburu_Clearing
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_Ormoburu_Clearing 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_Ormoburu_Clearing : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Trial25_End_Boss
//------------------------------------------------------------------------------

// AAIScript_Trial25_End_Boss 0 ( )
class DLL_IMPORT AAIScript_Trial25_End_Boss : public AAI_Script {
};


//------------------------------------------------------------------------------
//  RegisteredAccompany
//------------------------------------------------------------------------------

// URegisteredAccompany 0 ( )
class DLL_IMPORT URegisteredAccompany : public URegisteredEscort {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_Vhelgar_Hunter
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_Vhelgar_Hunter 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_Vhelgar_Hunter : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_PT_Trial15_Siltor_Script
//------------------------------------------------------------------------------

// AAIScript_PT_Trial15_Siltor_Script 0 ( )
class DLL_IMPORT AAIScript_PT_Trial15_Siltor_Script : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_ConditionalDespawn
//------------------------------------------------------------------------------

// AAI_ConditionalDespawn 0 ( )
class DLL_IMPORT AAI_ConditionalDespawn : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_CoA_3_Amsell_Script
//------------------------------------------------------------------------------

// AAIScript_CoA_3_Amsell_Script 0 ( )
class DLL_IMPORT AAIScript_CoA_3_Amsell_Script : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_Nuke
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_Nuke 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_Nuke : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_ActionsOnCollected
//------------------------------------------------------------------------------

// AAIScript_ActionsOnCollected 0 ( )
class DLL_IMPORT AAIScript_ActionsOnCollected : public AAIScript_CollectEventinstigators {
};


//------------------------------------------------------------------------------
//  AIScript_Trial50_Uddathin
//------------------------------------------------------------------------------

// AAIScript_Trial50_Uddathin 0 ( )
class DLL_IMPORT AAIScript_Trial50_Uddathin : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_2_Sequence
//------------------------------------------------------------------------------

// AAIScript_TotA_2_Sequence 0 ( )
class DLL_IMPORT AAIScript_TotA_2_Sequence : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Counter
//------------------------------------------------------------------------------

// AAIScript_Counter 0 ( )
class DLL_IMPORT AAIScript_Counter : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Trial45_Statue
//------------------------------------------------------------------------------

// AAIScript_Trial45_Statue 0 ( )
class DLL_IMPORT AAIScript_Trial45_Statue : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_Ormoburu_Climb
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_Ormoburu_Climb 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_Ormoburu_Climb : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Exarchyon_FireballShooter
//------------------------------------------------------------------------------

// AAIScript_Exarchyon_FireballShooter 0 ( )
class DLL_IMPORT AAIScript_Exarchyon_FireballShooter : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_StatesignalTrigger
//------------------------------------------------------------------------------

// AAIScript_StatesignalTrigger 0 ( )
class DLL_IMPORT AAIScript_StatesignalTrigger : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Trial25_Graidlon
//------------------------------------------------------------------------------

// AAIScript_Trial25_Graidlon 0 ( )
class DLL_IMPORT AAIScript_Trial25_Graidlon : public AAI_Script {
};


//------------------------------------------------------------------------------
//  RegisteredHealthLevel
//------------------------------------------------------------------------------

// URegisteredHealthLevel 0 ( )
class DLL_IMPORT URegisteredHealthLevel : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_Ormoburu
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_Ormoburu 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_Ormoburu : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_Generic_Mage
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_Generic_Mage 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_Generic_Mage : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_MarbleSealScript
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_MarbleSealScript 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_MarbleSealScript : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_DAF_Adin_Archer
//------------------------------------------------------------------------------

// AAIScript_DAF_Adin_Archer 0 ( )
class DLL_IMPORT AAIScript_DAF_Adin_Archer : public AAIScript_CollectEventinstigators {
};


//------------------------------------------------------------------------------
//  AIScript_PT_Trial15_Lezu_Script
//------------------------------------------------------------------------------

// AAIScript_PT_Trial15_Lezu_Script 0 ( )
class DLL_IMPORT AAIScript_PT_Trial15_Lezu_Script : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_TriggerEffects
//------------------------------------------------------------------------------

// AAI_TriggerEffects 0 ( )
class DLL_IMPORT AAI_TriggerEffects : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_ClaimAggro
//------------------------------------------------------------------------------

// AAIScript_ClaimAggro 0 ( )
class DLL_IMPORT AAIScript_ClaimAggro : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_TriggerSkillEffects
//------------------------------------------------------------------------------

// AAI_TriggerSkillEffects 0 ( )
class DLL_IMPORT AAI_TriggerSkillEffects : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_Trial50_Uddathin_Head
//------------------------------------------------------------------------------

// AAIScript_Trial50_Uddathin_Head 0 ( )
class DLL_IMPORT AAIScript_Trial50_Uddathin_Head : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_Conditional_ForceFriendly
//------------------------------------------------------------------------------

// AAI_Conditional_ForceFriendly 0 ( )
class DLL_IMPORT AAI_Conditional_ForceFriendly : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_ConditionalFreeze
//------------------------------------------------------------------------------

// AAIScript_ConditionalFreeze 0 ( )
class DLL_IMPORT AAIScript_ConditionalFreeze : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_Conditional_Enemy
//------------------------------------------------------------------------------

// AAI_Conditional_Enemy 0 ( )
class DLL_IMPORT AAI_Conditional_Enemy : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_CoA_2_PoochAndTack_Script
//------------------------------------------------------------------------------

// AAIScript_CoA_2_PoochAndTack_Script 0 ( )
class DLL_IMPORT AAIScript_CoA_2_PoochAndTack_Script : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIAccompanyScript
//------------------------------------------------------------------------------

// AAIAccompanyScript 0 ( )
class DLL_IMPORT AAIAccompanyScript : public AAIEscortFramework {
};


//------------------------------------------------------------------------------
//  AIEscortScript
//------------------------------------------------------------------------------

// AAIEscortScript 0 ( )
class DLL_IMPORT AAIEscortScript : public AAIEscortFramework {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_6_Neighbours
//------------------------------------------------------------------------------

// AAIScript_TotA_6_Neighbours 0 ( )
class DLL_IMPORT AAIScript_TotA_6_Neighbours : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_PatrolGate
//------------------------------------------------------------------------------

// AAIScript_PatrolGate 0 ( )
class DLL_IMPORT AAIScript_PatrolGate : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_StateSwitch
//------------------------------------------------------------------------------

// AAI_StateSwitch 0 ( )
class DLL_IMPORT AAI_StateSwitch : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_Trial50_DrainedMage
//------------------------------------------------------------------------------

// AAIScript_Trial50_DrainedMage 0 ( )
class DLL_IMPORT AAIScript_Trial50_DrainedMage : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_ClientsideTrigger
//------------------------------------------------------------------------------

// AAIScript_ClientsideTrigger 0 ( )
class DLL_IMPORT AAIScript_ClientsideTrigger : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_5_Judge
//------------------------------------------------------------------------------

// AAIScript_TotA_5_Judge 0 ( )
class DLL_IMPORT AAIScript_TotA_5_Judge : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_MatineeTrigger
//------------------------------------------------------------------------------

// AAIScript_MatineeTrigger 0 ( )
class DLL_IMPORT AAIScript_MatineeTrigger : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_FinalBlowTrigger
//------------------------------------------------------------------------------

// AAIScript_FinalBlowTrigger 0 ( )
class DLL_IMPORT AAIScript_FinalBlowTrigger : public AAI_Script {
};


//------------------------------------------------------------------------------
//  RegisteredPatrol
//------------------------------------------------------------------------------

// URegisteredPatrol 0 ( )
class DLL_IMPORT URegisteredPatrol : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  AIScript_PeriodicSkillOnCollected
//------------------------------------------------------------------------------

// AAIScript_PeriodicSkillOnCollected 0 ( )
class DLL_IMPORT AAIScript_PeriodicSkillOnCollected : public AAIScript_CollectEventinstigators {
};


//------------------------------------------------------------------------------
//  AIScript_DetectTrigger
//------------------------------------------------------------------------------

// AAIScript_DetectTrigger 0 ( )
class DLL_IMPORT AAIScript_DetectTrigger : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AI_TutorialTargetPractice
//------------------------------------------------------------------------------

// AAI_TutorialTargetPractice 0 ( )
class DLL_IMPORT AAI_TutorialTargetPractice : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Timeout
//------------------------------------------------------------------------------

// AAIScript_Timeout 0 ( )
class DLL_IMPORT AAIScript_Timeout : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_ConditionalInvisibility
//------------------------------------------------------------------------------

// AAIScript_ConditionalInvisibility 0 ( )
class DLL_IMPORT AAIScript_ConditionalInvisibility : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Trial45_StatueCollapse
//------------------------------------------------------------------------------

// AAIScript_Trial45_StatueCollapse 0 ( )
class DLL_IMPORT AAIScript_Trial45_StatueCollapse : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_ApplySkillEffectsOnDamager
//------------------------------------------------------------------------------

// AAI_ApplySkillEffectsOnDamager 0 ( )
class DLL_IMPORT AAI_ApplySkillEffectsOnDamager : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_AdjustHormones
//------------------------------------------------------------------------------

// AAIScript_AdjustHormones 0 ( )
class DLL_IMPORT AAIScript_AdjustHormones : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AI_ApplySkillEffectsOnKiller
//------------------------------------------------------------------------------

// AAI_ApplySkillEffectsOnKiller 0 ( )
class DLL_IMPORT AAI_ApplySkillEffectsOnKiller : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_ConditionalTouching
//------------------------------------------------------------------------------

// AAIScript_ConditionalTouching 0 ( )
class DLL_IMPORT AAIScript_ConditionalTouching : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_Proto_PauseAI
//------------------------------------------------------------------------------

// AAIScript_Proto_PauseAI 0 ( )
class DLL_IMPORT AAIScript_Proto_PauseAI : public AAIRegistered {
};


//------------------------------------------------------------------------------
//  AIScript_Trial35_Wounded_Miner
//------------------------------------------------------------------------------

// AAIScript_Trial35_Wounded_Miner 0 ( )
class DLL_IMPORT AAIScript_Trial35_Wounded_Miner : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_AQOrmo_Ormoburu_Lured
//------------------------------------------------------------------------------

// AAIScript_AQOrmo_Ormoburu_Lured 0 ( )
class DLL_IMPORT AAIScript_AQOrmo_Ormoburu_Lured : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_TotA_7_PlayerEffects
//------------------------------------------------------------------------------

// AAIScript_TotA_7_PlayerEffects 0 ( )
class DLL_IMPORT AAIScript_TotA_7_PlayerEffects : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_OnDeath_Counter
//------------------------------------------------------------------------------

// AAIScript_OnDeath_Counter 0 ( )
class DLL_IMPORT AAIScript_OnDeath_Counter : public AAIScript_Counter {
};


//------------------------------------------------------------------------------
//  AIOnScreenMessages
//------------------------------------------------------------------------------

// AAIOnScreenMessages 0 ( )
class DLL_IMPORT AAIOnScreenMessages : public AAI_Script {
};


//------------------------------------------------------------------------------
//  AIScript_Trigger_Counter
//------------------------------------------------------------------------------

// AAIScript_Trigger_Counter 0 ( )
class DLL_IMPORT AAIScript_Trigger_Counter : public AAIScript_Counter {
};


//------------------------------------------------------------------------------
//  RegisteredDespawn
//------------------------------------------------------------------------------

// URegisteredDespawn 0 ( )
class DLL_IMPORT URegisteredDespawn : public URegisteredAI {
};


//------------------------------------------------------------------------------
//  AIScripted
//------------------------------------------------------------------------------

// AAIScripted 0 ( )
class DLL_IMPORT AAIScripted : public AAIRegistered {
};




#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

