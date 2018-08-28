using System;
using UnityEngine;

namespace SBGame
{
    [Serializable]
    public class Game_NPCController: Game_Controller
    {
        public NPC_Type NPCType;

        public bool bDespawned;

        public bool BreakAI;

        public override void WriteAddStream(IPacketWriter writer)
        {
            writer.WriteInt32(GetRelevanceID());
            writer.WriteInt32(NPCType.GetResourceId());
            writer.WriteInt32(Owner != null ? Owner.GetRelevanceID() : -1);
            writer.WriteVector3(transform.position);
        }

        public Game_NPCPawn GetNPCPawn()
        {
            return Pawn as Game_NPCPawn;
        }

        public void sv_OnSpawn(int aFameLevel, int aPePRank, NPC_Taxonomy aFaction)
        {
            //TODO find out what this does actually
        }

        public LootTable sv_GetLootTable()
        {
            return null;
        }

        public void sv_Despawn() { throw new NotImplementedException(); }

        public void sv_InitInternal() //TODO find out what this should do
        {
            GetNPCPawn().NPCType = NPCType;
            //Debug.LogWarning("sv_InitInternal is not implemented");
        }
    }
}
