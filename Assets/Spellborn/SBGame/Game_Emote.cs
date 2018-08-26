using System;
using Engine;

namespace SBGame
{
    [Serializable]
    public class Game_Emote: UObject
    {
        public byte Emote;
        public string Command = string.Empty;
        public int AnimIndex;
        public byte SoundIndex;

        public void OnServerExecute(Game_Pawn aPawn)
        {
        }
    }
}
/*
function OnClientExecute(Game_Pawn aPawn) {
}
*/
