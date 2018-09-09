using System;
using System.Collections.Generic;
using Engine;
using SBBase;
using SBGame;
using UnityEngine;

namespace SBAI
{
    [Serializable] public class TargetComponent : Base_Component
    {

        public new Game_AIController Outer { get { return base.Outer as Game_AIController; } }

        public bool Initialized;
        public byte Mode;
        public Vector TargetLocation;
        public Actor TargetActor;
        [TypeProxyDefinition(TypeName = "Object")]
        public TypeDescription TargetClass;
        public float TargetRange;
        public bool Detection;
        public float VisualRange;
        public float LineOfSightRange;
        public List<UnreachableStruct> Unreachable = new List<UnreachableStruct>();
        public bool AllEnemiesUnreachable;
        public bool HadTarget;
        public Actor Target;
        public Vector Location;
        public List<DetectedStruct> Detected = new List<DetectedStruct>();
        public List<DetectedStruct> OldDetected = new List<DetectedStruct>();
        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public int VisualMemory;
        public int Enemies;
        public int Allies;
        public int UnreachableEnemies;
        public int UnreachableAllies;
        public int DetectedEnemies;
        public int DetectedAllies;
        public float AimedTime;
        public FSkill_Type Skill;
        public float MinBattleZone;
        public float MaxBattleZone;
        public float NoTargetCombatTime;
        public float RetargetSlack;
        public float DistanceSlack;
        public float UnreachableSlack;
        public float VisualMemoryTime;
        public float RecomputeTimer;
        public float PreviousDistance;
        public List<TargetConfigStruct> ConfigStack = new List<TargetConfigStruct>();
        public bool AnalyzePrediction;
        public List<PredictionStruct> PredictionResults = new List<PredictionStruct>();
        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public int FilterFunction;

        [Serializable] public struct VisualMemoryStruct
        {
            public float LastSeen;
            public bool CurrentlyDetected;
        }

        [Serializable] public struct PredictionStruct
        {
            public byte Method;
            public Game_Pawn Pawn;
            public float ServerTime;
            public float DeltaTime;
            public float Certainty;
            public Vector Result;
        }

        [Serializable] public struct UnreachableStruct
        {
            public Game_Pawn Pawn;
            public float Range;
            public float Area;
            public Vector Location;
            public float Time;
        }

        [Serializable] public struct TargetConfigStruct
        {
            public UObject mOwner;
            public byte Mode;
            public Vector TargetLocation;
            public Actor TargetActor;
            public Type TargetClass;
            public float TargetRange;
            public bool Detection;
            public float RetargetSlack;
            public float DistanceSlack;
            public float UnreachableSlack;
            public int FilterFunction;
            public UObject FilterDelegateObject;
            public NameProperty FilterDelegateName;
        }

        [Serializable] public struct DetectedStruct
        {
            public Actor Detected;
            public float SqrDistance;
            public byte Status;
            public bool Enemy;
            public bool Ally;
        }

        public enum EPrecitionMethod
        {
            EPM_Unknown,
            EPM_Dead,
            EPM_Path,
            EPM_Destination,
            EPM_Now,
            EPM_History,
            EPM_Velocity,
        }

        public enum EFilterResult
        {
            EFR_None,
            EFR_Ok,
            EFR_Precondition,
            EFR_Invalid,
            EFR_Dead,
            EFR_Class,
            EFR_Filtered,
            EFR_Unreachable,
            EFR_OutOfRange,
            EFR_Invulnerable,
            EFR_Deselected,
        }

        public enum ETargettingMode
        {
            ETM_None,
            ETM_Location,
            ETM_Fixed,
            ETM_Nearest,
            ETM_Random,
            ETM_Combat,
        }

        public float SetDistanceSlack(float aNewSlack)
        {
            float ret = DistanceSlack;
            DistanceSlack = aNewSlack;
            return ret;
        }

        public float SetTargetSlack(float aNewSlack)
        {
            float ret = RetargetSlack;
            RetargetSlack = aNewSlack;
            return ret;
        }

        public bool DetectingAllies()
        {
            return Allies > 0;
        }

        public bool DetectingEnemies()
        {
            return Enemies > 0;
        }

        public bool IsDetecting()
        {
            return Detection;
        }

        public Actor GetTarget()
        {
            return Target;
        }

        public Game_Pawn GetPawn()
        {
            return GetTarget() as Game_Pawn;
        }

        public Vector GetTargetLocation()
        {
            return Location;
        }

        public void GetAllies(List<Game_Pawn> oEnemies)
        {
            oEnemies.Clear();
            for (int i = 0; i < Detected.Count; i++)
            {
                if (Detected[i].Ally)
                {
                    var gp = Detected[i].Detected as Game_Pawn;
                    if (gp != null) oEnemies.Add(gp);
                }
            }
        }

        public void GetEnemies(List<Game_Pawn> oEnemies)
        {
            oEnemies.Clear();
            for (int i = 0; i < Detected.Count; i++)
            {
                if (Detected[i].Enemy)
                {
                    var gp = Detected[i].Detected as Game_Pawn;
                    if (gp != null) oEnemies.Add(gp);
                }
            }
        }

        public void GetDetected(List<Game_Pawn> oDetected)
        {
            oDetected.Clear();
            for (int i = 0; i < Detected.Count; i++)
            {
                var gp = Detected[i].Detected as Game_Pawn;
                if (gp != null) oDetected.Add(gp);
            }
        }

        public void GetCandidates(List<Game_Pawn> oEnemies)
        {
            throw new NotImplementedException();
        }
    }
}
/*
native function SetLineOfSight(float aLineOfSightRange);
native function SetVisualRange(float aVisualRange);
native function SetDetection(bool aOn);
native function SetCombat();
native function SetRandomPawn(optional Actor aOrigin,optional float aRange);
native function SetRandomActor(optional class<Object> aClass,optional float aRange,optional Actor aOrigin);
native function SetNearestPawn(optional float aRange,optional Actor aOrigin);
native function SetNearestActor(optional class<Object> aClass,optional float aRange,optional Actor aOrigin);
native function SetPawn(Game_Pawn aPawn);
native function SetActor(Actor aActor);
native function SetLocation(Vector aLocation);
native function SetDisabled();
delegate byte FilterTarget(Actor aActor);
*/