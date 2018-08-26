namespace SBGamePlay
{
    [System.Serializable]
    public class Spawn_Timed: Spawn_Triggered
    {
        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public float SpawnInterval;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public bool StopTimerIfWiped;

        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public bool OnlyStopTimerOnDespawn;

        public float SpawnTimer;
        public bool TimerStarted;

        protected override void sv_Despawn()
        {
            if (!OnlyStopTimerOnDespawn)
            {
                base.sv_Despawn();
            }
            TimerStarted = false;
            SpawnTimer = 0;
        }
    }
}
