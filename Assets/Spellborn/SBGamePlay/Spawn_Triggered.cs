using Engine;
using SBGame;
using System;
using System.Collections.Generic;

namespace SBGamePlay
{
    [Serializable]
    public class Spawn_Triggered: Spawn_Area
    {
        [FieldTransient()]
        public Vector SpawnerLocation;

        [NonSerialized, UnityEngine.HideInInspector]
        [FieldTransient()]
        public SpawnConfig CurrentlySpawning;

        [System.NonSerialized, UnityEngine.HideInInspector]
        [FieldTransient()]
        public int WaveCount;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public List<SpawnConfig> SpawnerConfig = new List<SpawnConfig>();

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public float MinSpawnsPerWave;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public float MaxSpawnsPerWave;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public float MaxSpawnsAlive;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public float MaxWaves;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public bool UseChanceAsCount;

        [Sirenix.OdinInspector.FoldoutGroup("aI")]
        [TypeProxyDefinition(TypeName = "AIStateMachine")]
        public TypeDescription StateMachine;

        [Serializable]
        public struct SpawnConfig
        {

            public NPC_Type NPCType;
            public NPC_Taxonomy Faction;
            public int Chance;
            public int MinLevel;
            public int MaxLevel;
            public int PePRank;
        }

        public override void PostBeginPlay() //useless function (?) TODO find out what to really do here, spawn?
        {
            int i = 0;
            while (i < SpawnerConfig.Count)
            {
                i++;
            }
            base.PostBeginPlay();
        }

        protected override void sv_Despawn()
        {
            for (int i = 0; i < Spawns.Count; i++)
            {
                Spawns[i].sv_Despawn();
            }
            Spawns.Clear();
        }
    }
}
