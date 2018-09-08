using System;
using System.Collections.Generic;
using Engine;
using Grids;
using SBBase;
using SBGame;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace World
{
    public class GameMap
    {

        public const int CellSize = 50;

        Scene scene;
        List<Actor> actors = new List<Actor>();

        MapGrid<Actor> grid;

        public IEnumerable<Actor> AllActors { get { return actors; } }

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
            grid = new MapGrid<Actor>(CellSize);
            foreach (var rootObject in scene.GetRootGameObjects())
            {
                actors.AddRange(rootObject.GetComponentsInChildren<Actor>(true));
            }
            LevelInfo = Find<LevelInfo>(_ => true); //first available, there should only ever be one
            if (LevelInfo == null) throw new NullReferenceException("LevelInfo could not be found, this should not happen");
            LevelInfo.GameMap = this;
        }

        public void Update()
        {
            grid.Update();
        }

        public IEnumerable<T> Actors<T>() where T : Actor
        {
            foreach (var rootObject in actors)
            {
                var t = rootObject as T;
                if (t != null) yield return t;
            }
        }

        public void Add(Actor actor)
        {
            if (actors.Contains(actor))
            {
                throw new Exception(string.Format("Actor {0} is already added to map {1}", actor, ID));
            }
            SceneManager.MoveGameObjectToScene(actor.gameObject, scene);
            actors.Add(actor);
            grid.Add(actor);
            actor.Level = LevelInfo;
        }

        public bool Remove(Actor actor)
        {
            var ga = actor as Game_Actor;
            if (ga != null) grid.Remove(ga);
            var removed = actors.Remove(actor);
            if (!removed) return false;
            actor.Level = null;
            return true;
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

        public void OverlapActorsSquare<T>(Vector3 point, float extend, List<T> result) where T:Actor
        {
            grid.OverlapSquare(point, extend, result);
        }
    }
}
