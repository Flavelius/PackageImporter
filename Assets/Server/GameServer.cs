using System.Diagnostics;
using User;
using Database;
using SBBase;
using Sirenix.OdinInspector;
using UnityEngine;
using World;
using Debug = UnityEngine.Debug;

public class GameServer : MonoBehaviour
{
    static int loginPort = 22233;
    static string worldIP = "127.0.0.1";
    static int worldPort = 22234;

    public static readonly UniverseInfo UniverseInfo = new UniverseInfo("TCoSReborn", "Any", "PVE");
    static SessionHandler sessionHandler;
    static MapLoader mapHandler;
    [SerializeField] bool capFramerate = true;
    [SerializeField] int framerateCap = 30;

    WorldServer worldServer;
    LoginServer loginServer;

    [SerializeField] TransientDatabase database;

    void OnValidate()
    {
        if (!Application.isPlaying) return;
        Application.targetFrameRate = capFramerate ? framerateCap : -1;
    }

    void Awake()
    {
        ServiceContainer.AddService<IDatabase>(database);
        sessionHandler = new SessionHandler();
        ServiceContainer.AddService<ISessionHandler>(sessionHandler);
        mapHandler = new MapLoader();
        ServiceContainer.AddService<IMapLoader>(mapHandler);
        worldServer = new WorldServer(worldIP, worldPort);
        ServiceContainer.AddService<IWorldServer>(worldServer);
        loginServer = new LoginServer(loginPort);
    }

    void Start()
    {
        if (capFramerate) Application.targetFrameRate = framerateCap;
        LoadPersistentWorlds();
        worldServer.Start();
        loginServer.Start();
    }

    void OnDestroy()
    {
        sessionHandler.EndAllSessions();
        loginServer.Stop();
        worldServer.Stop();
    }

    [SerializeField] bool devLoadHawksmouthOnly = true;
    void LoadPersistentWorlds()
    {
        Debug.Log("Loading persistent worlds");
        var loadingStartTime = Time.realtimeSinceStartup;
        foreach (var sbWorld in GameResources.Instance.Universe.Worlds)
        {
            if (sbWorld.WorldFile.Contains("\\")) continue;
            if (devLoadHawksmouthOnly && sbWorld.worldID != MapIDs.PT_HAWKSMOUTH) continue;
            if (sbWorld.WorldType == SBWorld.eZoneWorldTypes.ZWT_PERSISTENT) mapHandler.LoadPersistentMap(sbWorld.worldID);
        }
        Debug.Log("Loading persistent worlds finished in " + (Time.realtimeSinceStartup - loadingStartTime).ToString("0.0") + "s");
    }

    void Update()
    {
        loginServer.Update();
        worldServer.Update();
        mapHandler.Update();
    }

}
