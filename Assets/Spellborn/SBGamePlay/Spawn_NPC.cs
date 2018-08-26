using Engine;
using SBGame;
using System;
using UnityEngine;

namespace SBGamePlay
{
    [Serializable]
    public class Spawn_NPC: NPC_Spawner
    {
        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        [FieldConst()]
        public NPC_Type NPCType;

        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public float RespawnTimeout;

        [Sirenix.OdinInspector.FoldoutGroup("aI")]
        [TypeProxyDefinition(TypeName = "AIStateMachine")]
        public TypeDescription StateMachine;

        public float RespawnTimer;

        protected override int GetSpawnsLeft()
        {
            return (int)Mathf.Clamp01(1 - Spawns.Count);
        }

        protected override void sv_Despawn()
        {
            if (Spawns.Count > 0)
            {
                Spawns[0].sv_Despawn();
                Spawns.Clear();
            }
        }
    }
}
