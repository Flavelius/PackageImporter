using System.Collections.Generic;
using UnityEngine;

namespace Grids
{
    public interface IGridEntity
    {
        Vector3 Position { get; }
    }

    public interface IUpdatableGridEntity : IGridEntity
    {
        void Tick(float deltaTime);
    }

    public class MapGrid<TEntity> where TEntity : class, IGridEntity
    {
        //not readonly because of micro optimization, must stay constant though
        int cellSize = 20;

        Dictionary<int, Dictionary<int, GridCell>> cells = new Dictionary<int, Dictionary<int, GridCell>>(IntComparer.Instance);
        Dictionary<TEntity, GridCell> entityCells = new Dictionary<TEntity, GridCell>();
        List<GridCell> activeCells = new List<GridCell>(64);
        HashSet<GridCell> activeCellMap = new HashSet<GridCell>();

        public MapGrid(int cellSize)
        {
            this.cellSize = cellSize;
        }

        class GridCell : List<TEntity>
        {
            public Vector3 Position;
            public bool IsAwake { get; set; }
            public GridCell(int capacity, Vector3 pos) : base(capacity) { Position = pos; }

            public bool HasUptadables()
            {
                var entityCount = Count;
                for (int i = 0; i < entityCount; i++)
                {
                    if (this[i] is IUpdatableGridEntity) return true;
                }
                return false;
            }
        }

        public void DrawGizmos()
        {
            Gizmos.color = Color.grey;
            var activeCellCount = activeCells.Count;
            for (int i = 0; i < activeCellCount; i++)
            {
                var cell = activeCells[i];
                if (cell.Count == 0) continue;
                Gizmos.DrawWireCube(cell.Position, new Vector3(cellSize, 0, cellSize));
            }
        }

        GridCell GetOrCreateCell(int x, int z)
        {
            Dictionary<int, GridCell> dict;
            if (!cells.TryGetValue(x, out dict))
            {
                dict = new Dictionary<int, GridCell>(IntComparer.Instance);
                cells.Add(x, dict);
            }
            GridCell cell;
            if (!dict.TryGetValue(z, out cell))
            {
                cell = new GridCell(16, new Vector3(x * cellSize - cellSize * 0.5f, 0, z * cellSize - cellSize * 0.5f));
                dict.Add(z, cell);
            }
            return cell;
        }

        public void Add(TEntity entity)
        {
            if (entityCells.ContainsKey(entity)) return;
            var pos = entity.Position;
            var cell = GetOrCreateCell(Ceil(pos.x / cellSize), Ceil(pos.z / cellSize));
            cell.Add(entity);
            entityCells.Add(entity, cell);
            if (entity is IUpdatableGridEntity)
            {
                if (!activeCellMap.Contains(cell))
                {
                    activeCells.Add(cell);
                    activeCellMap.Add(cell);
                }
            }
        }

        public void Remove(TEntity entity)
        {
            GridCell cell;
            if (!entityCells.TryGetValue(entity, out cell)) return;
            cell.Remove(entity);
            entityCells.Remove(entity);
            if (!cell.HasUptadables())
            {
                activeCells.Remove(cell);
                activeCellMap.Remove(cell);
            }
        }

        static int Ceil(float value)
        {
            return value >= 0 ? (int)value + 1 : (int)value;
        }

        public void Update()
        {
            var dt = Time.deltaTime;
            var activeCellCount = activeCells.Count;
            for (int c = activeCellCount; c-- > 0;)
            {
                var activeCell = activeCells[c];
                var activeCellEntityCount = activeCell.Count;
                for (int i = activeCellEntityCount; i-- > 0;)
                {
                    var entity = activeCell[i];
                    var updatable = entity as IUpdatableGridEntity;
                    if (updatable == null) continue;
                    updatable.Tick(dt);
                    var pos = entity.Position;
                    var newCell = GetOrCreateCell(Ceil(pos.x / cellSize), Ceil(pos.z / cellSize));
                    if (!ReferenceEquals(newCell, activeCell))
                    {
                        activeCell.Remove(entity);
                        activeCellEntityCount--;
                        newCell.Add(entity);
                        entityCells[entity] = newCell;
                        if (!activeCellMap.Contains(newCell))
                        {
                            activeCells.Add(newCell);
                            activeCellMap.Add(newCell);
                        }
                        if (!activeCell.HasUptadables())
                        {
                            activeCells.RemoveAt(c);
                            activeCellMap.Remove(activeCell);
                            activeCellCount--;
                            break;
                        }
                    }
                }
            }
        }

        public void OverlapSquare(Vector3 center, float extends, List<TEntity> results)
        {
            results.Clear();
            var cxm = center.x - extends;
            var cxp = center.x + extends;
            var czm = center.z - extends;
            var czp = center.z + extends;
            var xMax = Ceil(cxp / cellSize);
            var zMax = Ceil(czp / cellSize);
            var x = Ceil(cxm / cellSize);
            var z = Ceil(czm / cellSize);
            var zStart = z;
            while (x <= xMax)
            {
                while (z <= zMax)
                {
                    GridCell cell = null;
                    Dictionary<int, GridCell> dict;
                    if (cells.TryGetValue(x, out dict))
                    {
                        dict.TryGetValue(z, out cell);
                    }
                    if (cell != null)
                    {
                        var cCount = cell.Count;
                        for (int i = 0; i < cCount; i++)
                        {
                            var entity = cell[i];
                            var p = entity.Position;
                            if (p.x < cxm || p.x > cxp || p.z < czm || p.z > czp) continue;
                            results.Add(entity);
                        }
                    }
                    z++;
                }
                x++;
                z = zStart;
            }
        }

        public void OverlapSquare<T>(Vector3 center, float extends, List<T> results) where T : class, TEntity
        {
            results.Clear();
            var cxm = center.x - extends;
            var cxp = center.x + extends;
            var czm = center.z - extends;
            var czp = center.z + extends;
            var xMax = Ceil(cxp / cellSize);
            var zMax = Ceil(czp / cellSize);
            var x = Ceil(cxm / cellSize);
            var z = Ceil(czm / cellSize);
            var zStart = z;
            while (x <= xMax)
            {
                while (z <= zMax)
                {
                    GridCell cell = null;
                    Dictionary<int, GridCell> dict;
                    if (cells.TryGetValue(x, out dict))
                    {
                        dict.TryGetValue(z, out cell);
                    }
                    if (cell != null)
                    {
                        var cCount = cell.Count;
                        for (int i = 0; i < cCount; i++)
                        {
                            var entity = cell[i] as T;
                            if (entity == null) continue;
                            var p = entity.Position;
                            if (p.x < cxm || p.x > cxp || p.z < czm || p.z > czp) continue;
                            results.Add(entity);
                        }
                    }
                    z++;
                }
                x++;
                z = zStart;
            }
        }

        //somehow faster than builtin comparison
        public class IntComparer : IEqualityComparer<int>
        {
            static readonly IntComparer instance = new IntComparer();

            public static IntComparer Instance { get { return instance; } }

            public bool Equals(int x, int y)
            {
                return x == y;
            }

            public int GetHashCode(int obj)
            {
                return obj;
            }
        }
    }
}