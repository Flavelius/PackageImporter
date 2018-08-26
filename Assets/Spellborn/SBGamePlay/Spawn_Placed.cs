namespace SBGamePlay
{
    [System.Serializable]
    public class Spawn_Placed: Spawn_Triggered
    {
        [Sirenix.OdinInspector.FoldoutGroup("Spawn_Placed")]
        public bool UseRandomLocation;
    }
}
