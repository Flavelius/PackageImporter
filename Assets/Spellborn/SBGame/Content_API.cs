using System;
using Engine;
using UnityEngine;

namespace SBGame
{
    [Serializable]
    public class Content_API: UObject
    {

        #region enums

        public enum EContentEmote
        {
            ECE_None = 0,
            ECE_wave = 1,
            ECE_salute = 2,
            ECE_great = 3,
            ECE_lol = 4,
            ECE_huh = 5,
            ECE_dance = 6,
            ECE_enemies = 7,
            ECE_getready = 8,
            ECE_charge = 9,
            ECE_attack = 10,
            ECE_retreat = 11,
            ECE_follow = 12,
            ECE_wait = 13,
            ECE_comeon = 14,
            ECE_assistance = 15,
            ECE_overhere = 16,
            ECE_backoff = 17,
            ECE_north = 18,
            ECE_east = 19,
            ECE_west = 20,
            ECE_south = 21,
            ECE_flank = 22,
            ECE_goround = 23,
            ECE_no = 24,
            ECE_yes = 25,
            ECE_greet = 26,
            ECE_bye = 27,
            ECE_thanks = 28,
            ECE_pony = 29,
            ECE_pwnie = 30,
            ECE_trade = 31,
            ECE_excuse = 32,
            ECE_waitup = 33,
            ECE_veto = 34,
            ECE_sarcasm = 35,
            ECE_hey = 36,
            ECE_oldskool = 37,
            ECE_outfit = 38,
            ECE_fashionpolice = 39,
            ECE_jazz = 40,
            ECE_clap = 41,
            ECE_kiss = 42,
            ECE_sigh = 43,
            ECE_bored = 44,
            ECE_pain = 45,
            ECE_pst = 46,
            ECE_angry = 47,
            ECE_cry = 48,
            ECE_maniacal = 49,
            ECE_laugh = 50,
            ECE_cough = 51,
            ECE_cheer = 52,
            ECE_whistlehappy = 53,
            ECE_whistleattention = 54,
            ECE_whistlemusic = 55,
            ECE_whistlenote = 56,
            ECE_ahh = 57,
            ECE_gasp = 58,
            ECE_stretch = 59,
            ECE_huf = 60,
            ECE_bah = 61,
            ECE_oracle = 62,
            ECE_battle = 63,
            ECE_praise = 64,
            ECE_mock = 65,
            ECE_attention = 66,
            ECE_death = 67,
            ECE_stop = 68,
            ECE_admireroom = 69,
            ECE_victory = 70,
            ECE_survive = 71,
            ECE_again = 72,
            ECE_try = 73,
            ECE_letsgo = 74,
            ECE_rtfm = 75,
            ECE_unique = 76,
        }

        public enum EContentOperator
        {
            ECO_Equals = 0,
            ECO_NotEquals = 1,
            ECO_Less = 2,
            ECO_More = 3,
            ECO_EqualOrLess = 4,
            ECO_EqualOrMore = 5,
            ECO_Mask = 6,
            ECO_NotMask = 7,
        }

        public enum NPCBodytype
        {
            ENB_Skinny = 0,
            ENB_Athletic = 1,
            ENB_Fat = 2,
            ENB_Hulky = 3,
            ENB_Child = 4,
            ENB_Monstrous = 5,
        }

        public enum NPCRace
        {
            ENR_Human = 0,
            ENR_Daevi = 1,
            ENR_Monster = 2,
            ENR_Arionite = 3,
            ENR_SpeyrFolk = 4,
            ENR_DemonArmy = 5,
            ENR_BotG = 6,
            ENR_ForgeOfWisdom = 7,
            ENR_Ousted = 8,
            ENR_Urvhail = 9,
            ENR_Vhuul = 10,
            ENR_Urgarut = 11,
            ENR_Shunned = 12,
        }

        public enum NPCGender
        {
            ENG_Male = 0,
            ENG_Female = 1,
            ENG_Neuter = 2,
            ENG_Hermaphrodite = 3,
        }

        public enum ENPCClassType
        {
            CT_HeavyMelee = 0,
            CT_HeavyRanged = 1,
            CT_ModerateMelee = 2,
            CT_ModerateRanged = 3,
            CT_LightMelee = 4,
            CT_LightRanged = 5,
            CT_DOT = 6,
            CT_Healer = 7,
            CT_Slower = 8,
            CT_Buffer = 9,
            CT_Alerter = 10,
            CT_Supporter = 11,
            CT_Rezzer = 12,
            CT_Debuffer = 13,
            CT_Blinder = 14,
        }

        public enum EContentClass
        {
            ECC_NoClass = 0,
            ECC_Rogue = 1,
            ECC_Warrior = 2,
            ECC_Spellcaster = 3,
            ECC_Trickster = 4,
            ECC_SkinShifter = 5,
            ECC_DeathHand = 6,
            ECC_Bloodwarrior = 7,
            ECC_FuryHammer = 8,
            ECC_WrathGuard = 9,
            ECC_RuneMage = 10,
            ECC_VoidSeer = 11,
            ECC_AncestralMage = 12,
            ECC_Gadgeteer = 13,
            ECC_Entertainer = 14,
            ECC_Assassin = 15,
            ECC_ShapeChanger = 16,
            ECC_Consumer = 17,
            ECC_Alchemist = 18,
            ECC_Bodyguard = 19,
            ECC_Flagellant = 20,
            ECC_Visionary = 21,
            ECC_MartialArtist = 22,
            ECC_PossessedOne = 23,
            ECC_FrontMan = 24,
            ECC_Nuker = 25,
            ECC_RuneMaster = 26,
            ECC_Priest = 27,
            ECC_AntiMage = 28,
            ECC_Summoner = 29,
            ECC_Infuser = 30,
            ECC_AnyClass = 31,
        }

        #endregion

        public int GetPersistentVariable(Game_Pawn aPawn, int aId) { throw new NotImplementedException(); }

        public void SetPersistentVariable(Game_Pawn aPawn, int aId, int aValue)
        {
            Game_Controller cont = ((Game_Controller)aPawn.Controller);
            if (cont != null)
            {
                cont.sv_SetPersistentVariable(0, aId, aValue);
            }
        }

        public bool LearnSkill(Game_Pawn aPawn, FSkill_Type aSkill)
        {
            throw new NotImplementedException();
        }

        public bool CanLearnSkill(Game_Pawn aPawn, FSkill_Type aSkill)
        {
            throw new NotImplementedException();
        }

        public bool RemoveMoney(Game_Pawn aPawn, int aAmount)
        {
            Game_PlayerItemManager itemManager;
            if (aPawn.itemManager != null && aAmount >= 0)
            {
                itemManager = (aPawn.itemManager as Game_PlayerItemManager);
                if (itemManager != null
                && itemManager.sv_UpdateMoney(-aAmount, null)) //callback
                {
                    return true;
                }
            }
            return false;
        }

        public bool GiveMoney(Game_Pawn aPawn, int aAmount)
        {
            throw new NotImplementedException();
        }

        public int GetMoney(Game_Pawn aPawn)
        {
            throw new NotImplementedException();
        }

        public bool RemoveItems(Game_Pawn aPawn, Content_Inventory aItems)
        {
            if (aPawn.itemManager != null && aItems != null
            && !aItems.Empty())
            {
                return aItems.RemoveFromInventory(aPawn);
            }
            else
            {
                return false;
            }
        }

        public bool GiveItems(Game_Pawn aPawn, Content_Inventory aItems)
        {
            Debug.LogWarning("GiveItems is not implemented", this);
            return false;
        }

        public bool ClaustroportPawn(Game_Pawn aPawn, Vector Location, Rotator Rotation)
        {
            aPawn.sv_TeleportTo(Location, Rotation);
            return true;
        }

        public int CountItems(Game_Pawn aPawn, Item_Type aItem)
        {
            throw new NotImplementedException();
        }

        public bool HasCompletedTarget(Game_Pawn aPawn, Quest_Target aTarget)
        {
            Game_PlayerPawn playerPawn = (aPawn as Game_PlayerPawn);
            if (playerPawn != null && aTarget != null)
            {
                if (aTarget.Check(playerPawn.questLog.GetTargetProgress(aTarget.GetQuest(), aTarget.GetIndex())))
                {
                    return true;
                }
            }
            return false;
        }

        public bool CanReceiveItems(Game_Pawn aPawn, Content_Inventory aItems)
        {
            int inv;
            int Count;
            if (aPawn.itemManager == null)
            {
                return false;
            }
            Count = aItems.SlotCount();
            inv = aPawn.itemManager.GetFreeSlots(Game_Item.EItemLocationType.ILT_Inventory);
            if (Count > inv)
            {
                //ApiTrace(GetCharacterName(aPawn) @ "has only"
                //@ string(inv)
                //@ "inventory slots available for"
                //@ string(Count)
                //@ "items");
                return false;
            }
            //ApiTrace(GetCharacterName(aPawn) @ "has an"
            //@ string(inv)
            //@ "inventory slots available for"
            //@ string(Count)
            //@ "items");
            return true;
        }

        public bool HasItems(Game_Pawn aPawn, Content_Inventory aItems)
        {
            if (aPawn.itemManager != null && !aItems.Empty())
            {
                if (aItems.HasItemsInInventory(aPawn))
                {
                    return true;
                }
            }
            return false;
        }

        public bool HasTargetActive(Game_Pawn aPawn, Quest_Target aTarget)
        {
            throw new NotImplementedException();
        }

        public bool HasFailedTarget(Game_Pawn aPawn, Quest_Target aTarget)
        {
            Game_PlayerPawn playerPawn = aPawn as Game_PlayerPawn;
            return playerPawn != null && aTarget != null && aTarget.Failed(playerPawn.questLog.GetTargetProgress(aTarget.GetQuest(), aTarget.GetIndex()));
        }

        public bool ObtainQuest(Game_Pawn aPawn, Quest_Type aQuest)
        {
            Game_PlayerPawn playerPawn = (aPawn as Game_PlayerPawn);
            if (playerPawn != null && aQuest != null && playerPawn.questLog != null)
            {
                return playerPawn.questLog.sv_AcceptQuest(aQuest);
            }
            return false;
        }

        public bool TeleportPawn(Game_Pawn aPawn, int aWorld, bool Instance, string aStart)
        {
            throw new NotImplementedException();
            //Game_PlayerController PlayerController = (aPawn.Controller as Game_PlayerController);
            //Game_GameServer Engine;
            //Engine = Game_GameServer(Class'Actor'.static.GetGameEngine());
            //if (PlayerController != null)
            //{
                //ApiTrace("Teleporting" @ GetCharacterName(aPawn)
                //@ "to world"
                //@ string(aWorld)
                //@ "at"
                //@ aStart);
                //Engine.LoginToWorldByID(aWorld, PlayerController.CharacterID, aStart, "");
            //    return true;
            //}
            //else
            //{
                //ApiTrace("Not teleporting non-player controlled"
                //@ GetCharacterName(aPawn));
                //return false;
            //}
        }

        public virtual int GetLevel(Game_Pawn aPawn)
        {
            throw new NotImplementedException();
        }

        public virtual int GetPeP(Game_Pawn aPawn)
        {
            throw new NotImplementedException();
        }
    }
}
/*
final native function int TimesQuestFinished(Game_Pawn aPawn,export editinline Quest_Type aQuest);
final native function bool FinishQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);
final native function bool HasFailedQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);
final native function bool HasCompletedQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest,optional bool aNearly);
final native function bool HasQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);
final native function bool MeetsRequirementsQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);
function Game_NPCPawn FindNPC(Game_Pawn aFrom,export editinline NPC_Type aType,float aRadius) {
local Game_Pawn foundPawn;
local Game_NPCPawn foundNPC;
foreach aFrom.RadiusActors(Class'Game_Pawn',foundPawn,aRadius) {            
foundNPC = Game_NPCPawn(foundPawn);                                       
if (foundNPC != null && foundNPC.NPCType == aType) {                      
ApiTrace("Found NPC" @ string(aType) @ string(foundNPC)
@ "within"
@ string(aRadius)
@ "of"
@ GetCharacterName(aFrom));
return foundNPC;                                                        
}
}
ApiTrace("Didn't find NPC" @ string(aType)
@ "within"
@ string(aRadius)
@ "of"
@ GetCharacterName(aFrom));
return null;                                                                
}
function FindRadiusActors(class<Actor> aClass,Actor aOrigin,float aRange,name aTag,out array<Actor> oActors) {
local Actor someActor;
ApiTrace("Finding actors of type" @ string(aClass)
@ "with tag '"
$ string(aTag)
$ "' within"
@ string(aRange)
$ "uu of "
@ string(aOrigin));
foreach aOrigin.RadiusActors(aClass,someActor,aRange) {                     
if (string(aTag) == "null" || someActor.Tag == aTag) {                    
oActors[oActors.Length] = someActor;                                    
}
}
}
function Actor FindClosestActor(class<Actor> aClass,Actor aOrigin,name aTag) {
local float closestDistance;
local Actor closestActor;
local float Distance;
local Actor someActor;
ApiTrace("Finding the of type" @ string(aClass)
@ "and tag '"
$ string(aTag)
$ "' closest to"
@ string(aOrigin));
foreach aOrigin.AllActors(aClass,someActor) {                               
if (string(aTag) == "null" || someActor.Tag == aTag) {                    
Distance = VSize(aOrigin.Location - someActor.Location);                
if (closestActor == null || Distance < closestDistance) {               
closestDistance = Distance;                                           
closestActor = someActor;                                             
}
}
}
return closestActor;                                                        
}
static native function Vector RandomRadiusLocation(Actor aOrigin,float aRadius,float aHeight,bool aLoSSpawning,Vector aExtent,bool aOnGround);
static native function Vector NearestValidLocation(Actor RefActor,Vector aLocation,Vector aExtent,bool aOnGround);
static native function bool ValidLocation(Actor RefActor,Vector aLocation,Vector aExtent);
static native function Vector ProjectLocationOnGround(Actor aActor,Vector aOrigin,optional Vector aExtent);
final native function int GetWorld(Game_Pawn aPawn);
final native function bool Compare(int aValue,byte aOp,int aTarget);
native function string GetCoinName(int aLevel,bool aPlural);

native function Game_Controller GetPlayer();
*/
