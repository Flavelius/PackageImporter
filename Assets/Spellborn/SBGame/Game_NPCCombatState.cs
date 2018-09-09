using System;

namespace SBGame
{
    [Serializable] public class Game_NPCCombatState : Game_CombatState
    {
        public new Game_NPCPawn Outer { get { return base.Outer as Game_NPCPawn; } }
    }
}
/*
native function bool EnsureIdle();
native function bool EnsureCombat(optional byte aPreferedMode);
*/