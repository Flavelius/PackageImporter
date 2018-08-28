public interface IActorLoginStream
{
    void WriteLoginStream(IPacketWriter writer);
}

public interface IActorAddStream
{
    void WriteAddStream(IPacketWriter writer);
}
