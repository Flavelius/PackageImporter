﻿using System;

namespace SBGame
{
    [Serializable] public class Game_StatueCharacter : Game_Character
    {
        public override void WriteAddStream(IPacketWriter writer)
        {
            throw new NotImplementedException();
        }
    }
}
/*
event string cl_GetBaseFullName() {
return Outer.PlayerName;                                                    
}
event string cl_GetBaseName() {
return Outer.PlayerName;                                                    
}
*/