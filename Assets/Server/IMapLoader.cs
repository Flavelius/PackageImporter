using UnityEngine.SceneManagement;
using World;

public interface IMapLoader
{
    GameMap GetPersistentMap(MapIDs map);
}