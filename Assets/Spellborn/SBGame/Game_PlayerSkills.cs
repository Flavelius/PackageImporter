using System;
using System.Collections.Generic;
using Engine;
using SBBase;
using UnityEngine;

namespace SBGame
{
    [Serializable]
    public class Game_PlayerSkills: Game_Skills, IActorLoginStream
    {

        public void WriteLoginStream(IPacketWriter writer) //TODO unpack db data and use that
        {
            Debug.LogWarning("TODO unpack db data and use that");
            writer.Write(SkilldeckSkills, (index, skill) =>
            {
                writer.WriteInt32(0); //skilldeck id?
                writer.WriteInt32(skill != null ? skill.GetResourceId() : 0);
                writer.WriteByte((byte)index); //deckslot
            });
        }

        public override void Initialize(Actor outer)
        {
            base.Initialize(outer);
            var fameLevel = Outer.CharacterStats.GetFameLevel();
            mTiers = SBDBSync.GetCombatBarRows(fameLevel);
            mTierSlots = /*SBDBSync.GetCombatBarColumns(fameLevel)*/5;
            Debug.Log("Tiers: " + mTiers + ", slots: " + mTierSlots+" TODO find out how those are calculated");
            //if islocalplayer ignored
            LoadTokens();
            var controller = (Outer.Controller as Game_PlayerController);
            var index = GetSkilldeckIndex(controller.DBCharacterSheet.SelectedSkilldeckID);
            cl_SetSkills(controller.DBCharacterSkills, controller.DBSkilldecks[index].mSkills);
        }

        void LoadTokens()
        {
            Debug.LogWarning("LoadTokens not implemented");
        }

        public int GetSkilldeckIndex(int aSkilldeckID)
        {
            Debug.LogWarning("TODO investigate GetSkilldeckIndex, why was it located in Game_Skills?");
            return 0;
        }

        void cl_SetSkills(List<int> aCharacterSkills, List<int> aSkilldeckSkills)
        {
            var i = 0;
            while (i < aCharacterSkills.Count)
            {
                var skillResource = SBDBSync.GetResourceObject<FSkill_Type>(aCharacterSkills[i]);
                if (skillResource == null) throw new Exception("Skill not found: " + aCharacterSkills[i]);
                CharacterSkills.Add(skillResource);
                ++i;
            }
            cl_UpdateSkilldeckSkills(aSkilldeckSkills);
            //OnCharacterSkillsChanged();
        }

        void cl_UpdateSkilldeckSkills(List<int> aSkilldeckSkills)
        {
            SkilldeckSkills = new FSkill_Type[mTiers * mTierSlots];
            for (var i = 0; i < aSkilldeckSkills.Count; i++)
            {
                if (aSkilldeckSkills[i] != 0)
                {
                    SkilldeckSkills[i] = SBDBSync.GetResourceObject<FSkill_Type>(aSkilldeckSkills[i]);
                }
                else
                {
                    SkilldeckSkills[i] = null;
                }
            }
            //OnSkilldeckChanged();
        }
    }
}
/*
final function cl_SaveSkilldeckSkills(array<int> aNewSkilldeckSkills) {
local int i;
local bool skilldeckChanged;
local int oldResourceId;
if (aNewSkilldeckSkills.Length != SkilldeckSkills.Length) {                 
skilldeckChanged = True;                                                  
} else {                                                                    
i = 0;                                                                    
while (i < aNewSkilldeckSkills.Length) {                                  
if (SkilldeckSkills[i] != None) {                                       
oldResourceId = SkilldeckSkills[i].GetResourceId();                   
}
if (aNewSkilldeckSkills[i] != oldResourceId) {                          
skilldeckChanged = True;                                              
goto jl0089;                                                          
}
++i;                                                                    
}
}
if (skilldeckChanged) {                                                     
cl2sv_SaveSkilldeckSkills_CallStub(aNewSkilldeckSkills);                  
cl_UpdateSkilldeckSkills(aNewSkilldeckSkills);                            
}
}
protected native function cl2sv_SaveSkilldeckSkills_CallStub();
protected event cl2sv_SaveSkilldeckSkills(array<int> aNewSkilldeckSkills) {
local int i;
local int j;
local bool skillValid;
local Game_Controller gc;
gc = Game_Controller(Outer.Controller);                                     
i = 0;                                                                      
while (i < aNewSkilldeckSkills.Length) {                                    
skillValid = False;                                                       
j = 0;                                                                    
while (j < gc.DBCharacterSkills.Length) {                                 
if (aNewSkilldeckSkills[i] == gc.DBCharacterSkills[j]) {                
skillValid = True;                                                    
goto jl0091;                                                          
}
++j;                                                                    
}
if (!skillValid) {                                                        
aNewSkilldeckSkills[i] = 0;                                             
}
++i;                                                                      
}
i = GetSkilldeckIndex(gc.DBCharacterSheet.SelectedSkilldeckID);             
Class'SBDBAsync'.SetCharacterSkilldeckSkills(Outer,gc.DBCharacter.Id,gc.DBCharacterSheet.SelectedSkilldeckID,aNewSkilldeckSkills);
gc.DBSkilldecks[i].mSkills = aNewSkilldeckSkills;                           
sv_UpdateSkilldeckSkills();                                                 
}
protected native event sv_UpdateSkilldeckSkills();
protected function cl_AddActiveSkill(int aSkillID,float aStartTime,float aDuration,float aSkillSpeed,bool aFreezeMovement,bool aFreezeRotation,int aTokenItemID,int AnimVarNr,Vector aLocation,Rotator aRotation) {
Super.cl_AddActiveSkill(aSkillID,aStartTime,aDuration,aSkillSpeed,aFreezeMovement,aFreezeRotation,aTokenItemID,AnimVarNr,aLocation,aRotation);
StartSkillAnimation(LastSkill.Skill,AnimVarNr,LastSkill.SkillSpeed);        
if (LastSkill.LockedMovement) {                                             
Outer.CharacterStats.FreezeMovement(True);                                
}
if (LastSkill.LockedRotation) {                                             
Outer.CharacterStats.FreezeRotation(True);                                
}
cl_StartSkillTracers(LastSkill.Skill,Item_Type(Class'SBDBSync'.GetResourceObject(aTokenItemID)),AnimVarNr);
}
protected native function sv2cl_SetSkills_CallStub();
final event sv2cl_SetSkills(array<int> aCharacterSkills,array<int> aSkilldeckSkills) {
cl_SetSkills(aCharacterSkills,aSkilldeckSkills);                            
}
native function ReportError(export editinline FSkill_Type aSkillType,byte ssf);
*/
