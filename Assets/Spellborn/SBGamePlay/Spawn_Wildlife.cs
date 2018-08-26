using Engine;
using SBGame;
using System;

namespace SBGamePlay
{
    [Serializable]
    public class Spawn_Wildlife: Spawn_Area
    {
        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        [FieldConst()]
        public NPC_Type NPCType;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public int LevelMin;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public int LevelMax;

        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public int SpawnMin;

        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public int SpawnMax;

        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public bool UseAbsoluteAmounts;

        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public float RespawnTime;

        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public float RespawnVariation;

        [Sirenix.OdinInspector.FoldoutGroup("aI")]
        [TypeProxyDefinition(TypeName = "AIStateMachine")]
        public Type StateMachine;

        [NonSerialized, UnityEngine.HideInInspector]
        [FieldTransient()]
        public int SpawnAmount;

        [NonSerialized, UnityEngine.HideInInspector]
        [FieldTransient()]
        public float mTimer;

        protected override void sv_Despawn()
        {
            for (var i = 0; i < Spawns.Count; i++)
            {
                Spawns[i].sv_Despawn();
            }
            Spawns.Clear();
            SpawnAmount = 0;
        }
    }
}
