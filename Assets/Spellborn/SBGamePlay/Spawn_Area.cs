using SBGame;

namespace SBGamePlay
{
    [System.Serializable]
    public class Spawn_Area: NPC_Spawner
    {
        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public float MaxSpawnDistance;
        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public bool LoSSpawning;
        [Sirenix.OdinInspector.FoldoutGroup("Policy")]
        public float MaxSpawnHeight;
    }
}
