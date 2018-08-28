using System;
using User;
using Network;
using SBGame;

public interface ISessionHandler
{
    void Begin(PlayerSession session);
    T Get<T>(NetConnection connection) where T:PlayerSession;
    GameSession Get(Game_PlayerController controller);
    int GetCount<T>() where T:PlayerSession;
    void End(PlayerSession session);
}