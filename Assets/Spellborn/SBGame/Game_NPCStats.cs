using System;
using Engine;

namespace SBGame
{
    [Serializable] public class Game_NPCStats : Game_CharacterStats
    {
        [FieldConst()]
        public float mAggroLostHealthRestore;

        public override int GetFameLevel()
        {
            return (Outer as Game_NPCPawn).NPCFameLevel;
        }

        public override int GetPePRank()
        {
            return (Outer as Game_NPCPawn).NPCPePRank;
        }

        public override void Initialize(Actor outer)
        {
            var pawn = outer as Game_NPCPawn;
            pawn.NPCType.InitializeStats(pawn.NPCFameLevel, pawn.NPCPePRank, out mBaseMaxHealth, out mMaxHealthBonusPerFameLevel, out mBaseBody, out mBaseMind, out mBaseFocus, ref mBaseRuneAffinity, ref mBaseSpiritAffinity, ref mBaseSoulAffinity);
            base.Initialize(outer);
        }
    }
}
/*
event cl_OnInit() {
Super.cl_OnInit();                                                          
Outer.PauseAnim(IsAnimationFrozen());                                       
}
*/