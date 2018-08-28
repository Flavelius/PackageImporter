using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Network;
using SBGame;

namespace User
{
    public partial class GameSession: PlayerSession
    {

        void S2C_WORLD_LOGIN()
        {
            var msg = GameHeader.S2C_WORLD_LOGIN.CreatePacket();
            msg.WriteInt32((int)PacketStatusCode.NO_ERROR);
            ActiveController.WriteLoginStream(msg);
            ActivePawn.WriteLoginStream(msg);
            (ActivePawn.CharacterStats as Game_PlayerStats).WriteLoginStream(msg);
            ActivePawn.Effects.WriteLoginStream(msg);
            msg.Write(ActiveController.DBCharacter);
            msg.Write(ActiveController.DBCharacterSheet);
            msg.Write(ActiveController.DBItems);
            msg.Write(ActiveController.DBSkilldecks);
            msg.Write(ActiveController.DBSkillTokens);
            (ActivePawn.Skills as Game_PlayerSkills).WriteLoginStream(msg);
            (ActivePawn.questLog as Game_PlayerQuestLog).WriteLoginStream(msg);
            msg.WriteInt32(0);//num persistentVars
                              //foreach var int32:contextID, int32:varID, int32:value
            msg.WriteInt32(ActiveController.GetAuthorityLevel());
            Connection.SendMessage(msg);
        }

        void S2C_NPC_ADD(Game_NPCController npc)
        {
            var msg = GameHeader.S2C_NPC_ADD.CreatePacket();
            npc.WriteAddStream(msg);
            var pawn = npc.Pawn as Game_NPCPawn;
            pawn.WriteAddStream(msg);
            pawn.Appearance.WriteAddStream(msg);
            pawn.Character.WriteAddStream(msg);
            pawn.CharacterStats.WriteAddStream(msg);
            pawn.combatState.WriteAddStream(msg);
            pawn.Effects.WriteAddStream(msg);
            Connection.SendMessage(msg);
        }

        void S2C_PLAYER_ADD(Game_PlayerController pc)
        {
            var msg = GameHeader.S2C_PLAYER_ADD.CreatePacket();
            pc.WriteAddStream(msg);
            var pawn = pc.Pawn as Game_PlayerPawn;
            pawn.WriteAddStream(msg);
            pawn.Appearance.WriteAddStream(msg);
            pawn.BaseAppearance.WriteAddStream(msg);
            pawn.Character.WriteAddStream(msg);
            pawn.CharacterStats.WriteAddStream(msg);
            pawn.combatState.WriteAddStream(msg);
            pawn.Effects.WriteAddStream(msg);
            Connection.SendMessage(msg);
        }
    }
}
