using SBGame;
using System;
using System.Collections.Generic;

namespace SBGamePlay
{
    [Serializable]
    public class Spawn_Deployer: Spawn_Group
    {
        [Sirenix.OdinInspector.FoldoutGroup("Spawn")]
        public List<NPC_Type> Bosses = new List<NPC_Type>();
    }
}
