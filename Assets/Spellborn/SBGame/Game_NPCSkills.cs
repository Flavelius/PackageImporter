using System;
using Engine;
using UnityEngine;

namespace SBGame
{
    [Serializable] public class Game_NPCSkills : Game_Skills
    {
        public new Game_Pawn Outer { get { return base.Outer as Game_Pawn; } }

        public NPC_SkillDeck CurrentNPCSkillDeck;
        public float LongestAttack;
        public float LongestDebuff;
        public float LongestBuff;
        public bool CanHeal;
        public bool mQueueSkillAnimation;
        Vector mSkillLocation;
        Rotator mSkillRotation;
        public int mQueueAnimVariation;
        public Item_Type mQueueTracerItem;
        public float mQueueTime;

        public void sv_SetSkilldeck(NPC_SkillDeck aSkilldeck,NPC_Equipment aEquipment)
        {
            Debug.LogWarning("sv_SetSkillDeck is not implemented", this);
        }

    }
}
/*
protected function cl_AddActiveSkill(int aSkillID,float aStartTime,float aDuration,float aSkillSpeed,bool aFreezeMovement,bool aFreezeRotation,int aTokenItemID,int AnimVarNr,Vector aLocation,Rotator aRotation) {
if (mQueueSkillAnimation) {                                                 
}
Super.cl_AddActiveSkill(aSkillID,aStartTime,aDuration,aSkillSpeed,aFreezeMovement,aFreezeRotation,aTokenItemID,AnimVarNr,aLocation,aRotation);
mQueueSkillAnimation = True;                                                
mSkillLocation = aLocation;                                                 
mSkillRotation = aRotation;                                                 
mQueueAnimVariation = AnimVarNr;                                            
mQueueTracerItem = Item_Type(Class'SBDBSync'.GetResourceObject(aTokenItemID));
mQueueTime = Outer.Level.TimeSeconds;                                       
}
function int GetSkilldeckColumnCount() {
if (CurrentNPCSkillDeck != None) {                                          
return CurrentNPCSkillDeck.Tiers[0].Skills.Length;                        
} else {                                                                    
return 0;                                                                 
}
}
function int GetSkilldeckRowCount() {
if (CurrentNPCSkillDeck != None) {                                          
return CurrentNPCSkillDeck.Tiers.Length;                                  
} else {                                                                    
return 0;                                                                 
}
}
*/