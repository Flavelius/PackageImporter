using System;
using System.Collections;
using System.Collections.Generic;
using Engine;
using SBBase;
using SBGame;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace World
{
    public class GameMap
    {
        Scene scene;
        List<Actor> actors = new List<Actor>();
        List<Game_PlayerController> players = new List<Game_PlayerController>();

        public MapIDs ID { get; private set; }
        public int InstanceID { get; private set; }
        public SBWorld SBWorld { get; private set; }
        public LevelInfo LevelInfo { get; private set; }

        public GameMap(Scene scene, MapIDs id, SBWorld sbWorld, int instanceID)
        {
            this.scene = scene;
            ID = id;
            InstanceID = instanceID;
            SBWorld = sbWorld;
            foreach (var rootObject in scene.GetRootGameObjects())
            {
                actors.AddRange(rootObject.GetComponentsInChildren<Actor>(true));
            }
            LevelInfo = Find<LevelInfo>(_ => true); //first available, there should only ever be one
            if (LevelInfo == null) throw new NullReferenceException("LevelInfo could not be found, this should not happen");
            LevelInfo.GameMap = this;
        }

        public IEnumerator<T> Actors<T>() where T : Actor
        {
            foreach (var rootObject in actors)
            {
                var t = rootObject as T;
                if (t != null) yield return t;
            }
        }

        public void Add<T>(T actor) where T : Actor
        {
            if (actors.Contains(actor))
            {
                throw new Exception(string.Format("Actor {0} is already added to map {1}", actor, ID));
            }
            actors.Add(actor);
            if (typeof(T) == typeof(Game_PlayerController)) players.Add(actor as Game_PlayerController);
            actor.Level = LevelInfo;
        }

        public bool Remove<T>(T actor) where T : Actor
        {
            if (typeof(T) == typeof(Game_PlayerController)) players.Remove(actor as Game_PlayerController);
            return actors.Remove(actor);
        }

        /// <summary>
        /// Supply this method with one of the prefabs (PlayerPrefab, NPCPrefab etc) from GameResources
        /// </summary>
        public T Spawn<T>(T prefab, Vector3 location, Quaternion rotation, Action<T> preSpawnInitCallback = null, Actor owner=null, string spawnTag="") where T:Game_Controller
        {
            var t = UnityEngine.Object.Instantiate(prefab);
            t.transform.SetPositionAndRotation(location, rotation);
            if (preSpawnInitCallback != null) preSpawnInitCallback(t);
            SceneManager.MoveGameObjectToScene(t.gameObject, scene);
            Add(t);
            if (owner != null) t.SetOwner(owner);
            t.Initialize();
            t.Tag = spawnTag;
            t.BeginPlay();
            t.PostBeginPlay();
            return t;
        }

        public T Find<T>(Predicate<T> predicate) where T:Actor
        {
            foreach (var actor in actors)
            {
                var t = actor as T;
                if (t != null && predicate(t)) return t;
            }
            return null;
        }

        public IEnumerable<T> Iterate<T>() where T:Actor
        {
            for (int i = 0; i < actors.Count; i++)
            {
                var t = actors[i] as T;
                if (t != null) yield return t;
            }
        }

        public void Update()
        {

        }
    }
}
