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

        public override void PostBeginPlay() //added
        {
            if (TriggeredSpawn) return;
            sv_TriggeredSpawn(this);
        }

        protected override void sv_TriggeredSpawn(Actor aTriggerer)
        {
            //added TODO find out how to really spawn an npc
            if (NPCType == null) return;
            var instance = Spawn(GameResources.Instance.NPCPrefab, Location, Rotation, InitializeSpawnedNPC, Level.GameMap);
            instance.sv_OnSpawn(NPCType.FameLevel, NPCType.PePRank, NPCType.TaxonomyFaction);
            Spawns.Add(instance);
        }

        void InitializeSpawnedNPC(Game_NPCController controller)
        {
            controller.NPCType = NPCType;
            controller.sv_InitInternal();
            controller.Sv_OnInit();
        }
    }
}
