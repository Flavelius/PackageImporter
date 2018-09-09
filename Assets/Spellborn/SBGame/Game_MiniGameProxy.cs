using System;
using SBBase;

namespace SBGame
{
    [Serializable] public class Game_MiniGameProxy : Base_Component
    {

        public new Game_Pawn Outer { get { return base.Outer as Game_Pawn; } }

        public void sv_PlayerDied() { }
    }
}
/*
event bool IsPlaying() {
return False;                                                               
}
event bool IsInviting() {
return False;                                                               
}
event cl_OnFrame(float DeltaTime) {
}
event cl_StartMiniGame(Game_PlayerPawn Opponent) {
}
*/