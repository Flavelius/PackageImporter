using SBBase;
using SBGame;
using System.Collections.Generic;
using UnityEngine;
using World;

namespace User
{
    public class RelevanceHandler
    {

        const float ViewDistance = (int)(GameMap.CellSize*0.9f);

        HashSet<Game_Controller> syncedEntities = new HashSet<Game_Controller>();
        List<Game_Controller> oldEntities = new List<Game_Controller>(16);

        List<Game_Controller> newEntities = new List<Game_Controller>(16);
        public void Update(Game_PlayerController player)
        {
            player.Level.GameMap.OverlapActorsSquare(player.transform.position, ViewDistance, newEntities);
            for (int i = newEntities.Count; i-->0;)
            {
                if (ReferenceEquals(newEntities[i], player))
                {
                    newEntities.RemoveAt(i);
                    continue;
                }
                if (!syncedEntities.Contains(newEntities[i]))
                {
                    IntroduceRelevanceEntity(player, newEntities[i]);
                    syncedEntities.Add(newEntities[i]);
                }
                oldEntities.Remove(newEntities[i]);
            }
            for (int i = 0; i < oldEntities.Count; i++)
            {
                player.ActiveSession.S2C_BASE_PAWN_REMOVE(oldEntities[i].Pawn as Base_Pawn);
                syncedEntities.Remove(oldEntities[i]);
            }
            oldEntities.Clear();
            var ce = oldEntities;
            oldEntities = newEntities;
            newEntities = ce;
        }

        void IntroduceRelevanceEntity(Game_PlayerController player, Game_Controller other)
        {
            var pc = other as Game_PlayerController;
            if (pc != null)
            {
                player.ActiveSession.S2C_PLAYER_ADD(pc);
                return;
            }
            var npc = other as Game_NPCController;
            if (npc != null)
            {
                player.ActiveSession.S2C_NPC_ADD(npc);
                return;
            }
            Debug.LogWarning("Relevance ADD type not implemented: " + other.GetType());
        }
    }
}
